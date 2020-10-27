Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.12040.1603795048092580836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 03:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CDLu9X8n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 13so869235wmf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RG/Qtt71NQkQwTWK8dAjboKT9iyaWmt37Fbk3JpYBLg=;
        b=CDLu9X8n4aL1g+lm9C6Qsh3qOdiqgLL+gkCXVfa8bRURo3OPpDq6sUcF+USUVvDTQQ
         GOFPDAwV+kCfyBURhw9fj8HLCiYB5hUvZzJM45GL+OdjIJD/LpGw0OYGsswBnVznvS98
         hP2tArygeCmtSBK6HqClMgDJNZa5j8C9dB058=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RG/Qtt71NQkQwTWK8dAjboKT9iyaWmt37Fbk3JpYBLg=;
        b=nTvvhlq6E7wXjy0F+ENUb8R7m/kFtNHaQptPUfPGq/W6QqehhOwLj0QNLphfsNbxmX
         2ikBDM7x68bbR7yUOjLFp15RZUhO9AZa9lLpH46UQtKjOKu7kg6w4bGdtXa7AZH2s9cc
         YTIJNbt8Epq2Q2w6M0nr4tA03QQvjjIE5ilkYGJKT5hfdpTkFc3XYl/22Qshfk1IWXnD
         hxPWNUsvHb2WrlhEGC4avS/YPfbhre0Msm8CwewlR3HZ37oMH+DzOO7UrecwFusO8cXZ
         Od37gjEYtwzGDqoEnYtT80jmklw/ctkhyy1G8fDugjj4S/tugJRu8SCJjIDwA4IZ6dp3
         9ZeQ==
X-Gm-Message-State: AOAM532fmUcXTi8q5ZcSbUEho9nk7YZ2uD15MqbBCOhpFW/82bmoRtkb
	Q1zBVdrfmbYEVDy2E+kEvkhV+g==
X-Google-Smtp-Source: ABdhPJz3mLlCWMCaEI1NW5S+AMv/ON3IjTLrbDKOqOSIZaGRo1zDQ+qqs7t0hx2P0D7AV1+LU0TWXA==
X-Received: by 2002:a1c:4e0e:: with SMTP id g14mr1957756wmh.69.1603795046566;
        Tue, 27 Oct 2020 03:37:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id d129sm1378520wmf.19.2020.10.27.03.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:37:26 -0700 (PDT)
Message-ID: <4d2560d4440be40ecd73020c931d5bfd83fd9b1c.camel@linuxfoundation.org>
Subject: Re: [PATCH v4] Add new recipe for squashfs-tools-ng
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 27 Oct 2020 10:37:23 +0000
In-Reply-To: <f76c89f8255ef9ecf082439c910f37cef38c893f.camel@gmail.com>
References: <20201022113036.2938947-1-luca.boccassi@gmail.com>
	 <20201026100503.3200192-1-luca.boccassi@gmail.com>
	 <2ad67eb9e783fa044d4d97f35f93a35014aa73e1.camel@linuxfoundation.org>
	 <f76c89f8255ef9ecf082439c910f37cef38c893f.camel@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-26 at 13:09 +0000, Luca Boccassi wrote:
> On Mon, 2020-10-26 at 10:29 +0000, Richard Purdie wrote:
> > On Mon, 2020-10-26 at 10:05 +0000, luca.boccassi@gmail.com wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > 
> > > The main difference with squashfs-tools is the availability
> > > of a shared library and a programmatic interface, rather
> > > than just command-line tools.
> > > 
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > > v2: added MIT, Zlib and BSD-2-Clause to LICENSE
> > > v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used),
> > > changed
> > >     recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG
> > > v4: disable zstd support by default, dependency not available in
> > > oe-
> > > core
> > 
> > Sorry, there is one other issue. There is no maintainers entry for
> > this
> > recipe (see meta/conf/distro/include/maintainers.inc) which would
> > cause
> > oe-selftest to fail. Can you add an maintainers entry please?
> > 
> > Thanks,
> > Richard
> 
> Ok - who should be listed as maintainer?

The person who is going to look after this recipe in OE-Core. Each
recipe needs to have a maintainer listed, someone who is prepared to
get the upgrade helper emails, handle upgrades, help with security
issues, bugs related to the recipe and so on.

If we don't have anyone willing to maintain it, I'd argue its not
important enough to have in OE-Core...

Cheers,

Richard

