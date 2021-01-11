Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.37217.1610383373623208541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 08:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WvqZ1EFr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id 91so433322wrj.7
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 08:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xV2+yOpls5rOfYR99HWDMy48T8CkFWdgdrqKh/nLZp8=;
        b=WvqZ1EFrWMFEstBPN0jYjPsypqaEQWPTEcavvM8y+X6oU0xq8GS9zdbuIhUA1wyhfH
         j1a89d/AvCkpsHXpIH4kUne2XOOTMpo0bU4qugystuZjwCT4tRhYkpclpujlmRvPVahA
         QCTgLp67Apv/Ae2NHostpWoTrYMcuX8qft4mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xV2+yOpls5rOfYR99HWDMy48T8CkFWdgdrqKh/nLZp8=;
        b=JDMclxu+7aYdHx6u6qmu6iDHzM683IDxaVCQyZdnUQG7TqHsClv/rp0OOW2BCC1oKs
         UYbB0CAk1jHCRfbIAgLraOxKIdkf9HJyMccu6sbKTFkOCrAxSpMLc4LevypfXfinRe07
         fOScFXLrDtzl5AQffJYPqDvIuNcK3luDgrk75kuawx1ECN+OloaKLy+m7Hz6Skpxc4ZZ
         ElY3Ge04qlRhbdw6PwU99W8GDen2cE7oV7/gYCwG8JxZWEY/PJ/fvDx6cpWKfCOb+xYc
         dzgA9jJpHXaa57QVqZ+c/EtGeDyhSITmUoJtvSgt5OuUpiLzt/BhBw/r/ETWsJM/TIe7
         e0pw==
X-Gm-Message-State: AOAM531SNAaV5o8C8plgHYNWip43BOWJQ8hskBnuiE5yI9IxKaEHXxHO
	PHlC3PvqlHsUQQiUZ9L1rlHpjxlRAR8aow==
X-Google-Smtp-Source: ABdhPJyH1Jm6+ZJurgh0NSae4fpYSr52cYdo+9atjX6OtWsVLcM0pOkpeKxvcE1/hKQoaK4Rs7lHkg==
X-Received: by 2002:adf:fb85:: with SMTP id a5mr17054688wrr.331.1610383371867;
        Mon, 11 Jan 2021 08:42:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b650:3643:b08:2475? ([2001:8b0:aba:5f3c:b650:3643:b08:2475])
        by smtp.gmail.com with ESMTPSA id h184sm424707wmh.23.2021.01.11.08.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 08:42:51 -0800 (PST)
Message-ID: <ae5ebd528a3be4602c1191c8ac4e5bf07af4c394.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] qemu: Drop vm reservation changes to resolve build issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Alistair Francis <alistair23@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jan 2021 16:42:50 +0000
In-Reply-To: <1658B1F8E3EC2098.4243@lists.openembedded.org>
References: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
	 <20210106223628.561432-3-richard.purdie@linuxfoundation.org>
	 <CAKmqyKM9UtUSs6sQReZqzoy8=kPGmOyGNG4+BJx5vU0gFvhWVA@mail.gmail.com>
	 <1658397859ED357D.11938@lists.openembedded.org>
	 <dc27903d2eafc24814d131cce1f57bb7380024e4.camel@linuxfoundation.org>
	 <CAMKF1sphYeSi74Vja+AF-Vz=96SeyKZfFrZ6CAKf3hu1hx6K7w@mail.gmail.com>
	 <1658B1F8E3EC2098.4243@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2021-01-09 at 22:49 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Sat, 2021-01-09 at 12:37 -0800, Khem Raj wrote:
> > On Sat, Jan 9, 2021 at 1:19 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > On Fri, 2021-01-08 at 10:00 +0000, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Wed, 2021-01-06 at 14:53 -0800, Alistair Francis wrote:
> > > > > On Wed, Jan 6, 2021 at 2:36 PM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > 
> > > > > > When building with the new version of qemu we see errors like:
> > > > > > 
> > > > > > """
> > > > > > qemu-i386: Unable to reserve 0x7ffff000 bytes of virtual address space at
> > > > > > 0x1000 (Success) for use as guest address space (check your virtual memory
> > > > > > ulimit setting, min_mmap_addr or reserve less using -R option)
> > > > > > 
> > > > > > ERROR: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed
> > > > > > """
> > > > > > 
> > > > > > The VM reseration patches we're carrying look suspicious in this context.
> > > > > > Drop them since we don't appear to be seeing those issues any more on the
> > > > > > autobuilder and I suspect the patches have become broken and a liability.
> > > > > > webkitgtk builds seem to be ok now.
> > > > > 
> > > > > Yes! Getting rid of these patches is great!
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > 
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > 
> > > > Unfortunately this issue is still present, I thought we weren't seeing
> > > > it but once other errors cleared, this one remains, only on
> > > > qemux86+musl for webkitgtk.
> > > > 
> > > > I think we need to get to the bottom of it and figure out something
> > > > which is upstreamable. This will block the qemu upgrade until we can
> > > > fix it unfortunately unless we block webkitgtk on musl on 32 bit x86.
> > > 
> > > I've sent out a couple of linux-user mmap patches for this. With those
> > > fixes applied, qemu seems fine so I've upgraded.
> > > 
> > > Khem: I do wonder whether musl's memory allocation is all ok given it
> > > loops indefinitely if it doesn't see EFAULT and only ENOMEM. That may
> > > need investigation?
> > 
> > I forwarded it to musl community as well. Other musl distros are also
> > carrying some patches in qemu
> > eg, voidlinux has this
> > https://github.com/void-linux/void-packages/blob/master/srcpkgs/qemu/patches/mmap-mremap-efault.patch
> > which actually could be forwarded upstream qemu.
> 
> Yes, the first bit of that is what I sent upstream to qemu, I came to
> the same conclusion :)
> 
> The other bit looks to optimise the looping...

Just for the archives, we ran into a problem on the centos7 builders
with this change where gobject-introspection would show:

qemu-i386: Unable to reserve 0x7ffff000 bytes of virtual address space
at 0xa000 (Success) for use as guest address space (check yourvirtual
memory ulimit setting, min_mmap_addr or reserve less using -R option) 

/proc/sys/vm/mmap_min_addr was set to 4096.

Somewhat confusingly, the way to make things work was to set this
higher to to 65536 (there is an addr != temp test in there and addr was
coming back as 0x10000 instead of 0x1000).

Cheers,

Richard

