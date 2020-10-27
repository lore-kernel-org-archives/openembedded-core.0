Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web09.12401.1603796397429511273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 03:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YObmS43T;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id h22so957606wmb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NS93aZh4rRkGY9TCuVGNKUORq0No+y3yo5DxJBKUyhA=;
        b=YObmS43TLqpYKi1NTJCw1hd22XgqfliPHgRxlxs9gSL1e9+49T1YVQg2mhBB9gpWA9
         vbywEjwdsar0DYCLGRMm1o8Agw0F+TAaYFKGpUufAkmlgfcDow98E472193rgTwOj5Nk
         eUaUHRIRTvHgqqB/Ojo8p9dCmXsXR1Ih9mnQvBvkFK+a2FjbS92edGXyyXWa3xS1PUYe
         m/4eleq3qB8pd1vUiK5PR4c3KaVfSX02/J58UXv1Umjb5tkfLyVa//Xu2mU3dUjzWTJm
         aNjAj/V+Ig/oCHuM01fIFUrO9REYHQN4vozeXXx0kZfNxRVj7uFzsIJ0fuMI+UaAfpXa
         GYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NS93aZh4rRkGY9TCuVGNKUORq0No+y3yo5DxJBKUyhA=;
        b=QNN5CY1nduvCjBMy5YrG/y+kmdZsqR7Z8wH2wl4CQULt3RCqNbEa2PhNJgfB9A8Fwg
         0dTqvrAp86Z8PzDlkre+A7u6Ipjzth3n3e36dmqXIt1Iee+jejZ2+ctk85zxaEYAAtau
         cW9uuxCNU50LQJecglb1qBJkvRCwx5o2QHbsJOlbd+liG2mXWzkzR90FU6tazMna6q2b
         XtKLzrgWBwkXXHKZEszRWzIZDyoadriOPZ1cQ8tAeCPPD/nS0m8GaE3KIzd03ZhO4Ryw
         8F18zK0Y3I/V8j0hVFaUJyL2xwFYwPGtLCAGgJwHYYh6NX7+PpRqGC2sxxaS8EDVkAC7
         J+1Q==
X-Gm-Message-State: AOAM531X/Af2Uy3xRKvMl+13LKHdoFN/ng2h7yfcZnDjVMgqDJM1EljD
	b73hxeLb6v45x/MyIiQ/EbU=
X-Google-Smtp-Source: ABdhPJzJdNy92mZkVvm6wkz8k+BWwiEuezAv3ASGBlHdVLU+ptiI7RoS6eskAZmZfUPkagcsW9em7g==
X-Received: by 2002:a7b:ca51:: with SMTP id m17mr2140445wml.86.1603796395886;
        Tue, 27 Oct 2020 03:59:55 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id r3sm1516576wrm.51.2020.10.27.03.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:59:55 -0700 (PDT)
Message-ID: <ed94167201a9730b0a54504e2bf0be8fc3a19c9f.camel@gmail.com>
Subject: Re: [PATCH v4] Add new recipe for squashfs-tools-ng
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 27 Oct 2020 10:59:54 +0000
In-Reply-To: <4d2560d4440be40ecd73020c931d5bfd83fd9b1c.camel@linuxfoundation.org>
References: <20201022113036.2938947-1-luca.boccassi@gmail.com>
	 <20201026100503.3200192-1-luca.boccassi@gmail.com>
	 <2ad67eb9e783fa044d4d97f35f93a35014aa73e1.camel@linuxfoundation.org>
	 <f76c89f8255ef9ecf082439c910f37cef38c893f.camel@gmail.com>
	 <4d2560d4440be40ecd73020c931d5bfd83fd9b1c.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-27 at 10:37 +0000, Richard Purdie wrote:
> On Mon, 2020-10-26 at 13:09 +0000, Luca Boccassi wrote:
> > On Mon, 2020-10-26 at 10:29 +0000, Richard Purdie wrote:
> > > On Mon, 2020-10-26 at 10:05 +0000, luca.boccassi@gmail.com wrote:
> > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > 
> > > > The main difference with squashfs-tools is the availability
> > > > of a shared library and a programmatic interface, rather
> > > > than just command-line tools.
> > > > 
> > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > ---
> > > > v2: added MIT, Zlib and BSD-2-Clause to LICENSE
> > > > v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used),
> > > > changed
> > > >     recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG
> > > > v4: disable zstd support by default, dependency not available in
> > > > oe-
> > > > core
> > > 
> > > Sorry, there is one other issue. There is no maintainers entry for
> > > this
> > > recipe (see meta/conf/distro/include/maintainers.inc) which would
> > > cause
> > > oe-selftest to fail. Can you add an maintainers entry please?
> > > 
> > > Thanks,
> > > Richard
> > 
> > Ok - who should be listed as maintainer?
> 
> The person who is going to look after this recipe in OE-Core. Each
> recipe needs to have a maintainer listed, someone who is prepared to
> get the upgrade helper emails, handle upgrades, help with security
> issues, bugs related to the recipe and so on.
> 
> If we don't have anyone willing to maintain it, I'd argue its not
> important enough to have in OE-Core...
> 
> Cheers,
> 
> Richard

Ok, I'll move to meta-openembedded then.

-- 
Kind regards,
Luca Boccassi

