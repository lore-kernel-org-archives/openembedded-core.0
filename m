Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7866.1608376726011279172
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 03:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VcdIEPUO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d13so5746528wrc.13
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 03:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hFDK6ME664TB9lk6crECbHn+4KyvOhSNSce63jGUHac=;
        b=VcdIEPUOXYw96KzpSelJ2+xbOpvYxK0sUAufKGsQ5qSQw++q4SWesAKlndTPMwI8bE
         7U7XqEs3mHdzRY3HJDE9+Hosd2BSfl3k3ZEy+36a75ep9URght3ThyA8SUxkU3mA22WE
         twJFlSspI6w0gq7TJVlrOIpqL8InHKM4HAXxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hFDK6ME664TB9lk6crECbHn+4KyvOhSNSce63jGUHac=;
        b=EhHAhTeifW7J1jKkG8bCb9BtjEUz5cr9qbWU+0xagwUDHEgSGMtpN19snn6QTVWojQ
         jiA4xMhoSfeu/EP2H79qc4TmoTTaPAR7c4Z/TpIRA++bzZZA++Qzj5WZCiWIjFXbAfuh
         Gg8e9itC2tYLBQtvk8YW24q5gt8iOXCcTc1FXsezZIuNpsdivgyN+wgN+X9TfAIxoNTp
         0YRTIJ9RvVtf/DAdrabH8jrnIeKHJaPq5cPQ/0wKxnzoCn9H2Ssj178phHwqUcJVQXHi
         lo6Ca9PzflgfXgbYTyYypkpCc/u4Fo8oszbThTzKPPD0NUEePOXzUVbLJMkfFf9v0fMc
         VnLw==
X-Gm-Message-State: AOAM531arJqha98dmXZ3lqlSHork2lQZmYiizL/hFFvgqscReVqN2GKn
	KdGD7pLCRFAdjTxC62bjnNBF/Q==
X-Google-Smtp-Source: ABdhPJz8bG5HL49uN9+clttXwCRTp5Oif0pUJxfHfWXCdJWWmHBm5TOPrUpGAeyD8IzUXxAEJM2LDg==
X-Received: by 2002:a5d:6502:: with SMTP id x2mr9134299wru.254.1608376724348;
        Sat, 19 Dec 2020 03:18:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id m8sm15046662wmc.27.2020.12.19.03.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 03:18:43 -0800 (PST)
Message-ID: <940d5e33d09579fc46372bfedbd0b76ee285a8e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/5] systemd: update 246 -> 247
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2020 11:18:43 +0000
In-Reply-To: <1652194C9AF53BB2.13568@lists.openembedded.org>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201218094256.3796401-1-luca.boccassi@gmail.com>
	 <165217A789F1A918.13568@lists.openembedded.org>
	 <1652194C9AF53BB2.13568@lists.openembedded.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 11:03 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Sat, 2020-12-19 at 10:33 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1662/steps/14/logs/stdio
> > 
> > (there is a second issue there from other patches in master-next
> > too).
> > 
> > We do need a green build to be able to merge so this may depend on
> > someone else looking into that reproducibility issue. I did try and
> > give some hints in my previous email, I'd need to look at the code
> > to
> > be able to give any more pointers.
> 
> Looking at the output in 
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201219-fqxxqel9/packages/diff-html/
> 
> you can see that the .text section in the binary changes size.
> Ignoring
> the offset changes, the actual change is the change in size of
> the maybe_emit_login_defs_warning function from 256 to 275 bytes.
> 
> That function is in the systemd sources in
> git/src/sysusers/sysusers.c.
> 
> It uses a variety of configuration options such as:
> 
> SYSTEM_ALLOC_UID_MIN
> SYSTEM_UID_MAX
> SYSTEM_ALLOC_GID_MIN
> SYSTEM_GID_MAX
> 
> My best guess is that we're not setting one of these and its falling
> back to a host system value which varies by host distro.
> 
> Obviously we need to prove that and figure out the correct value for
> OE
> usage but its maybe a pointer as to the possible problem (or I could
> be
> totally wrong!).

I was far enough into this I kept going. The defaults for these are set
in meson.build from:

foreach tuple : [['system-alloc-uid-min', 'SYS_UID_MIN', 1],  # Also see login.defs(5).
                 ['system-uid-max',       'SYS_UID_MAX', 999],
                 ['system-alloc-gid-min', 'SYS_GID_MIN', 1],
                 ['system-gid-max',       'SYS_GID_MAX', 999]]

which if they're not set, looks at the host system /etc/login.defs file
which is host contamination and is bad. On my ubuntu system, these
aren't set by default. For Centos7 and 8:

[rpurdie@centos8-ty-1 ~]$ grep SYS /etc/login.defs
SYS_UID_MIN               201
SYS_UID_MAX               999
SYS_GID_MIN               201
SYS_GID_MAX               999

so I think we have our trigger. I have a simply patch to specify
defaults in the recipe which I think should resolve this. I'll add it
to master-next and see if that helps.

Cheers,

Richard





