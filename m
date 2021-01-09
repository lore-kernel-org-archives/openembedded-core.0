Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.11074.1610232548831124128
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jan 2021 14:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S/EekMp5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id t16so12489074wra.3
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Jan 2021 14:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HPqxiCxjmh9vl1C21HY4oqEkX5VjThn1ClS8ewve6Qk=;
        b=S/EekMp5q2etGQ2rFWj/ZK5j82zLgonuXGH4cJz/7CzWdyvS3rHx8FhbnkG6lySa1T
         DOemobZqdRm1Jw+Yt+JPj+gbZhBKv2M5TMa1PxisSSj8GV36AUR+Bt1JJI+aRoG0lnlW
         vp4LgJfWM/2p3vU+pigEWpjd3Pmsj/72Sd60w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HPqxiCxjmh9vl1C21HY4oqEkX5VjThn1ClS8ewve6Qk=;
        b=aitDgHp+o2mqGEmUIYM5TBC6k9X96UqyYJMNoOxATzeQUc2+UO0ffKl+DrFVhsm84B
         P3WgAuPeFvAkVy1GFBOApzmOIYMgguqTMw62G8XacHY68iTkKZkIataJcFGgffF6ki5M
         BtXyrlpHBcy36GDIOJYnnN6LZvkIvrVW5Itefvp3S+eYFlYZ4arDbAxYIe2ZR7WbdcY7
         KkGaBKLpblDyd8nEbK8nP6/NaOvnpbB/LZX3bygAzCI5dzPb3dUg4tkCD33dp0e4YXyq
         rXoWzPvmMR3PqpYeRnPZGmQQnQFS9rTCh4RJW1+UNQOXvXufxpHNnBhqxR8/5YFitHD0
         Fjug==
X-Gm-Message-State: AOAM532nMtKRAx6JRpdTjs3CaMB5iB13xh9iH+5lRoP1lsKQTjXSHJUi
	k8QRthszgO4OT+jjMNAe60KJ4w==
X-Google-Smtp-Source: ABdhPJxxbK4l73F5N09KczWOr7YtfugxQc79CCKikwBSFwoyVXxkDjzfVKBr0rexeWMuaPACwT+M9Q==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr9859531wrn.296.1610232547170;
        Sat, 09 Jan 2021 14:49:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7b0:5962:9f13:7d75? ([2001:8b0:aba:5f3c:7b0:5962:9f13:7d75])
        by smtp.gmail.com with ESMTPSA id u9sm17343168wmb.32.2021.01.09.14.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 14:49:06 -0800 (PST)
Message-ID: <a5671b61903a12cb180fdc4ba7cd5912c7f11a45.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] qemu: Drop vm reservation changes to resolve build issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 09 Jan 2021 22:49:06 +0000
In-Reply-To: <CAMKF1sphYeSi74Vja+AF-Vz=96SeyKZfFrZ6CAKf3hu1hx6K7w@mail.gmail.com>
References: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
	 <20210106223628.561432-3-richard.purdie@linuxfoundation.org>
	 <CAKmqyKM9UtUSs6sQReZqzoy8=kPGmOyGNG4+BJx5vU0gFvhWVA@mail.gmail.com>
	 <1658397859ED357D.11938@lists.openembedded.org>
	 <dc27903d2eafc24814d131cce1f57bb7380024e4.camel@linuxfoundation.org>
	 <CAMKF1sphYeSi74Vja+AF-Vz=96SeyKZfFrZ6CAKf3hu1hx6K7w@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2021-01-09 at 12:37 -0800, Khem Raj wrote:
> On Sat, Jan 9, 2021 at 1:19 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Fri, 2021-01-08 at 10:00 +0000, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Wed, 2021-01-06 at 14:53 -0800, Alistair Francis wrote:
> > > > On Wed, Jan 6, 2021 at 2:36 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > 
> > > > > When building with the new version of qemu we see errors like:
> > > > > 
> > > > > """
> > > > > qemu-i386: Unable to reserve 0x7ffff000 bytes of virtual address space at
> > > > > 0x1000 (Success) for use as guest address space (check your virtual memory
> > > > > ulimit setting, min_mmap_addr or reserve less using -R option)
> > > > > 
> > > > > ERROR: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed
> > > > > """
> > > > > 
> > > > > The VM reseration patches we're carrying look suspicious in this context.
> > > > > Drop them since we don't appear to be seeing those issues any more on the
> > > > > autobuilder and I suspect the patches have become broken and a liability.
> > > > > webkitgtk builds seem to be ok now.
> > > > 
> > > > Yes! Getting rid of these patches is great!
> > > > 
> > > > > 
> > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > 
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > 
> > > Unfortunately this issue is still present, I thought we weren't seeing
> > > it but once other errors cleared, this one remains, only on
> > > qemux86+musl for webkitgtk.
> > > 
> > > I think we need to get to the bottom of it and figure out something
> > > which is upstreamable. This will block the qemu upgrade until we can
> > > fix it unfortunately unless we block webkitgtk on musl on 32 bit x86.
> > 
> > I've sent out a couple of linux-user mmap patches for this. With those
> > fixes applied, qemu seems fine so I've upgraded.
> > 
> > Khem: I do wonder whether musl's memory allocation is all ok given it
> > loops indefinitely if it doesn't see EFAULT and only ENOMEM. That may
> > need investigation?
> 
> I forwarded it to musl community as well. Other musl distros are also
> carrying some patches in qemu
> eg, voidlinux has this
> https://github.com/void-linux/void-packages/blob/master/srcpkgs/qemu/patches/mmap-mremap-efault.patch
> which actually could be forwarded upstream qemu.

Yes, the first bit of that is what I sent upstream to qemu, I came to
the same conclusion :)

The other bit looks to optimise the looping...

Cheers,

Richard

