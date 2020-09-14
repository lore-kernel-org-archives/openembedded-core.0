Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.70994.1600117334124667323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 14:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IjOvkpOh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id a17so1069972wrn.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 14:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=K2DJVjOl55kLuw7UTg9naErQucouoN+jPAZ51OmwEKQ=;
        b=IjOvkpOhJAoBxAKQDj41BBDoDEy+uxXxcohTQvkJ4XO6ytVCf9+BPrNGwpLVqg4mes
         ES72HIE2lw3ANdo3QVGMzEh7JzXKpsiv/3drYUWL2WvuSXveWE9T2YV5dY4n/bvxsy8X
         XzG9iUSuVJ5bIjHGea6jXkUsQwjsocQi8ZUzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=K2DJVjOl55kLuw7UTg9naErQucouoN+jPAZ51OmwEKQ=;
        b=jz1y2Pr2Alzf0Eg3MtCUmehAMDRvkYqCll+pMv16At5//g+R0E9EC8Fwk74bFI0fnm
         MSwfnoCcHa55TNaUwwNfnUVMiAozjsPsjcAuFEl5INJVb3xL358DP1k9gXfhk4VpDUWY
         W3g432JufWC+xhLnhqW+T2Yi66AYpYJSSIKI2l+5LgWFWhcHgHyzN+0idW/1Z01p735j
         0saWLXZuwrBN8RGauDahC4OnmU1Pp+lSmiKQRZa/7VYYy+twGCerNPbzNFVNmHPumrNO
         5ZRFGACXBHVJwnB6tsEj+S9m3U55ZCF6Q393qu5XMdYv7ksdEe+hgi1kR6PQ6b6FOv55
         mynw==
X-Gm-Message-State: AOAM531G/ppgEZp9R+VWNj2jusKuZ3OXS/tPNpmMm1hy2LHvAp2kDsf/
	+4WRNRI9PrIhZXzfnC/7mtdZWA==
X-Google-Smtp-Source: ABdhPJzmdoeHWKaoAwEqob3KdpcoEbSKgXOprXvbR3sy9Y07cw+OuMUnvn3RugjiCer4xvrBI2mx/w==
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr16733092wrm.147.1600117332376;
        Mon, 14 Sep 2020 14:02:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id m23sm5097314wmi.19.2020.09.14.14.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 14:02:11 -0700 (PDT)
Message-ID: <f754af26c0b738b1fcc51da92ca82304e35e47a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] core-image-sato: qemumips use 512 mem
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, akuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.comt>
Date: Mon, 14 Sep 2020 22:02:10 +0100
In-Reply-To: <3889316c-3fb2-e100-468d-9ba2b77e69ad@gmail.com>
References: <20200913035916.24165-1-akuster808@gmail.com>
	 <82df031010def40bb2f2f1bfe160cbbb8330353d.camel@linuxfoundation.org>
	 <3889316c-3fb2-e100-468d-9ba2b77e69ad@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-14 at 10:27 -0700, Khem Raj wrote:
> 
> On 9/14/20 12:13 AM, Richard Purdie wrote:
> > On Sat, 2020-09-12 at 20:59 -0700, akuster wrote:
> > > From: Armin Kuster <akuster808@gmail.comt>
> > > 
> > > Fixes:
> > > 
> > > WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Couldn't login
> > > into
> > > serial console as root using blank password
> > > WARNING: core-image-sato-sdk-1.0-r0 do_testimage: The output:
> > > root
> > > <<< run_serial(): command timed out after 60 seconds without
> > > output
> > > 
> > > In another run, this error was seen:
> > > 
> > > Failed to reload daemon: Refusing to reload, not enough space
> > > available on /run/systemd. Currently, 14.3M are free, but a
> > > safety
> > > buffer of 16.0M is enforced.
> > > 
> > > With updates to systemd and Qemu we should revert: 499a31cf06
> > > core-
> > > image-sato: don't use 512MB in qemumips
> > > 
> > > Signed-off-by: Armin Kuster  <akuster808@gmail.com>
> > > ---
> > >   meta/recipes-sato/images/core-image-sato.bb | 1 -
> > >   1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-sato/images/core-image-sato.bb
> > > b/meta/recipes-sato/images/core-image-sato.bb
> > > index 673106eb6d..878e0eaa8d 100644
> > > --- a/meta/recipes-sato/images/core-image-sato.bb
> > > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > > @@ -12,4 +12,3 @@ TOOLCHAIN_HOST_TASK_append = " nativesdk-
> > > intltool
> > > nativesdk-glib-2.0"
> > >   TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-
> > > intltool nativesdk-glib-2.0"
> > >   
> > >   QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m
> > > 512", "-m 256", d)}'
> > > -QB_MEM_qemumips = "-m 256"
> > 
> > We have now seen:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/2452
> > 
> > with this applied, not sure if its related. We have seen this kind
> > of
> > network dropout elsewhere but we don't seem to have good debug when
> > it
> > happens.
> > 
> 
> I wonder if ssh daemon is dead in this case. I also see its invoking 
> compilers on target( kernelmodule case), are they usign -jX during
> make 
> ?, 512M might not be enough to run parallel compiles

Shouldn't be using -j for these tests. I think we need better debugging
using the serial console when these failures occur...

Cheers,

Richard

