Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.3797.1592906479590991996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 03:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YduRGWCX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id l11so19878002wru.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 03:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1MXE45hT3drdTBc89GqhhTAqCsJdsHq6lKfGOUvUx7M=;
        b=YduRGWCXbKSb3Vb9qrja4DGy0+hT5b0o3NSLYhmwTJ7jaD7e/98WiL2jkRqv58wikO
         LIe1al299loRi7CKB4XUVc+YQm4gf7A7dAmQ8kItr1XdfbXKq5hkmzP62Lu/E7G/qsvl
         56ATIwj2Z0IrngljYapAZq2P92QLCSBqWU84A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1MXE45hT3drdTBc89GqhhTAqCsJdsHq6lKfGOUvUx7M=;
        b=lQldWgGmVbE5KDbh+sBPvwywTjobyMHv4oAemgUItc9M3dkhW0XgWSFIO/AklEaCmH
         VCew3FJRbSM7o2SyFM4FJs5ZveL7Zmi/4YNbWkwhnpGyGMemQJOeiUngAX3ysh7TT1eh
         QheR26fDM/RCx4cMcj4D24q3ptnuspmlzAWn9bYb9NEgzCDwFEPtwL31CTSIfbDPrvKj
         7Uj0vToIVP8m8ayYT9PtCGqkAlZU6ppQqrqNJ16dYnkYHy4g/MdBUcpxXr4rjPPg/kAV
         bx+/p66zRr+J2GkYI59ewO05iqxvw03IgDQWQfnSihAyuX4y6I0Faz6Elss4WvfkPJ3m
         XrbA==
X-Gm-Message-State: AOAM532y/MLukgJo+VD7Snk4W60vYSPbDlH/1MY1ztyEZF4n2E+NIMTL
	E1134uJup+rAjJ5fwKd1PoKhtg==
X-Google-Smtp-Source: ABdhPJxQPmqXGcJginSB8LT+U2UKIPUq4uK0qBQAaLJROUt1djVsMjgw2K9HfwtLMcFZKLzKP7Nneg==
X-Received: by 2002:adf:f209:: with SMTP id p9mr23281161wro.86.1592906477912;
        Tue, 23 Jun 2020 03:01:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a16sm20978744wrx.8.2020.06.23.03.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 03:01:16 -0700 (PDT)
Message-ID: <c8d6a6fa55052aecc157642169039f4c7cdccef1.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2020 11:01:15 +0100
In-Reply-To: <CAO5Uq5ShcQMYSYT5YFOa7i3sbAGP_dVWKrcPTiK3zPKFZZfvGw@mail.gmail.com>
References: <20200622105717.108062-1-alex.kiernan@gmail.com>
	 <2fd43b04ea22019411e3e01669e879a838781e8f.camel@linuxfoundation.org>
	 <CAO5Uq5R-oXNuqoVPpoC288smwDH459tjik6aB=B1+aOsT+dayA@mail.gmail.com>
	 <161AF559DCEBF3F0.4124@lists.openembedded.org>
	 <68c8ab0777b1b8e43d4d9cd7a0032a84efd39ea8.camel@linuxfoundation.org>
	 <CAO5Uq5ShcQMYSYT5YFOa7i3sbAGP_dVWKrcPTiK3zPKFZZfvGw@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-23 at 10:01 +0100, Alex Kiernan wrote:
> On Tue, Jun 23, 2020 at 9:20 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2020-06-22 at 20:46 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Mon, 2020-06-22 at 19:53 +0100, Alex Kiernan wrote:
> > > > On Mon, Jun 22, 2020 at 6:34 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > On Mon, 2020-06-22 at 11:57 +0100, Alex Kiernan wrote:
> > > > > > Generate output for each contaminated path so it's visible
> > > > > > in the main
> > > > > > log file, then enable rootfs_check_host_user_contaminated
> > > > > > by default.
> > > > > > 
> > > > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > > > ---
> > > > > > 
> > > > > > Changes in v2:
> > > > > > - expose each contaminated path in the main log
> > > > > > 
> > > > > >  meta/classes/rootfs-postcommands.bbclass | 9 ++++-----
> > > > > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > > > > 
> > > > > Thanks, this is definitely more helpful. Some warnings in the
> > > > > test
> > > > > build:
> > > > > 
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/2046
> > > > > 
> > > > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path
> > > > > in the rootfs is owned by the same user or group as the user
> > > > > running bitbake: /var/lib/nfs/statd
> > > > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path
> > > > > in the rootfs is owned by the same user or group as the user
> > > > > running bitbake: /var/lib/nfs/statd/sm.bak
> > > > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path
> > > > > in the rootfs is owned by the same user or group as the user
> > > > > running bitbake: /var/lib/nfs/statd/state
> > > > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path
> > > > > in the rootfs is owned by the same user or group as the user
> > > > > running bitbake: /var/lib/nfs/statd/sm
> > > > > 
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/2073
> > > > > 
> > > > > step3b: WARNING: core-image-sato-1.0-r0 do_rootfs: Path in
> > > > > the rootfs is owned by the same user or group as the user
> > > > > running bitbake: /var/cache/fontconfig/CACHEDIR.TAG
> > > > > 
> > > > > which does raise more questions.
> > > > > 
> > > > 
> > > > I'm having no luck reproducing either of these locally :|
> > > 
> > > They don't reproduce on the autobuilder either. We're probably
> > > going to
> > > need to open a bug in bugzilla and enter these there listing the
> > > target
> > > that caused it and the host it was on.
> > > 
> > > Hopefully we'll see a pattern emerge.
> > > 
> > > Or maybe the pseudo fix I posted will make it all go away. I can
> > > live
> > > in hope right?!
> > > 
> > > Either way, I think this patch is going to be a longer journey
> > > until we
> > > figure out what is happening.
> > 
> > Last nights build also gave warnings:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2055
> > 
> > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the
> > rootfs is owned by the same user or group as the user running
> > bitbake: /usr/bin/crontab
> > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the
> > rootfs is owned by the same user or group as the user running
> > bitbake: /var/spool/cron
> > 
> 
> Interestingly both of those have file permissions which aren't simple
> ugo-rwx type things.

Looking at the pattern, I did have a thought which I've not researched
yet.

Is it possible these are dynamically generated group/users in the
rootfs which happen to collide with the host user/group?

You'd think the adduser/addgroup calls would happen in a deterministic
order as the rootfs is build but perhaps it doesn't work out like that.

Are each of the above groups of files, specifically created users at
rootfs time?

Cheers,

Richard



