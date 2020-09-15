Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.9223.1600160324364303863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 01:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O/aK1aT7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id l9so2602948wme.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zSFD6fX+3XBfitSgb0p23KK+dKk2dKbPgcgTFF9GRwY=;
        b=O/aK1aT7IuIeepf0A1LwVjL1+YVrjzPbi+PZakLr4mcK1paJGKAJiFHPcMrrfROUy/
         i5iPyaD3EUMpz4qd/y0pWJM4CxkIHqxBegEOpaW9nJeynJRauzIZVS5NRlRlb+YxPvFd
         YvGnDO/VIDt+qD5PwoiB1UTVPTXixuWxEGNXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zSFD6fX+3XBfitSgb0p23KK+dKk2dKbPgcgTFF9GRwY=;
        b=D9yNBfXsboigyYx4sKLcxQiYVMFob45eyGY37zeKj9R6Bc/2TzSMLQ70CYoU1LGSKc
         IJe5kcFHd6Hb6H+q1Xa6mPQ2LE6AKdg0WRc2GPqedsHVs2EAXE7E7iVWimZunwWmZuni
         uD2jsjqtDh0gE0eHPNGtlxknb7TR9vLx0NDxXWR0AA/yYFyf6cY22ZLd2N9XLwnbKg33
         tXfslAoDhwQHzM8Z+81dxUXmjvVdUVBaJj4WizT0YjsUoV+UU4/ID6qx5RcPBvXA2K2D
         s3JaYfDe6hKSyLFIanpcIASBjFElAnhbAsHDRbncobbly1sEqxDwmWvEQjdXuoEuQPUP
         rKKw==
X-Gm-Message-State: AOAM531t6ZBz4dJYcztoU8NBx4oxR0nSpty3M8U9R2Ws61lP9KZR0Qa5
	HIAqpZ7CYA81WKIvmjXnYhGb+g==
X-Google-Smtp-Source: ABdhPJwYllPeZYqLeoY7xBwxGXzTXBlkSf1RQzlHCWhyJJjayXg1Re42ER+6aAatpit4wVCqkjsNAA==
X-Received: by 2002:a1c:9e0e:: with SMTP id h14mr3530050wme.18.1600160322631;
        Tue, 15 Sep 2020 01:58:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id a17sm26671536wra.24.2020.09.15.01.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 01:58:42 -0700 (PDT)
Message-ID: <352127433a1b0fae6cc7b8edef1476c307655816.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] core-image-sato: qemumips use 512 mem
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, akuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.comt>
Date: Tue, 15 Sep 2020 09:58:39 +0100
In-Reply-To: <1634C23CFDB6D44F.7642@lists.openembedded.org>
References: <20200913035916.24165-1-akuster808@gmail.com>
	 <82df031010def40bb2f2f1bfe160cbbb8330353d.camel@linuxfoundation.org>
	 <3889316c-3fb2-e100-468d-9ba2b77e69ad@gmail.com>
	 <1634C23CFDB6D44F.7642@lists.openembedded.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-14 at 22:02 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2020-09-14 at 10:27 -0700, Khem Raj wrote:
> > On 9/14/20 12:13 AM, Richard Purdie wrote:
> > > On Sat, 2020-09-12 at 20:59 -0700, akuster wrote:
> > > > diff --git a/meta/recipes-sato/images/core-image-sato.bb
> > > > b/meta/recipes-sato/images/core-image-sato.bb
> > > > index 673106eb6d..878e0eaa8d 100644
> > > > --- a/meta/recipes-sato/images/core-image-sato.bb
> > > > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > > > @@ -12,4 +12,3 @@ TOOLCHAIN_HOST_TASK_append = " nativesdk-
> > > > intltool
> > > > nativesdk-glib-2.0"
> > > >   TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-
> > > > intltool nativesdk-glib-2.0"
> > > >   
> > > >   QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m
> > > > 512", "-m 256", d)}'
> > > > -QB_MEM_qemumips = "-m 256"
> > > 
> > > We have now seen:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/2452
> > > 
> > > with this applied, not sure if its related. We have seen this kind
> > > of
> > > network dropout elsewhere but we don't seem to have good debug when
> > > it
> > > happens.
> > > 
> > 
> > I wonder if ssh daemon is dead in this case. I also see its invoking 
> > compilers on target( kernelmodule case), are they usign -jX during
> > make 
> > ?, 512M might not be enough to run parallel compiles
> 
> Shouldn't be using -j for these tests. I think we need better debugging
> using the serial console when these failures occur...

We now also have:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/2460

which is hanging in a dnf command.

From the autobuilder, I couldn't ssh into the image, it hangs but
tantalisingly, it would show me the time of the last login. I was
therefore able to run dmesg and confirm there is nothing in the logs
relating to this hang. I can't get a shell (bash or ash), top won't
run. Not sure what else to try but I am pretty sure this is our 512MB
memory bug, its still there. I'll leave it running for now in case
anyone has better ideas about debugging.

Cheers,

Richard






