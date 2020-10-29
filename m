Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.5264.1604011365135301329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 15:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hXSO0y+e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id i1so4512332wro.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 15:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VIuGIGghetWwe9rnPqTv3I5BXUV7yEauCkS0K1lBx18=;
        b=hXSO0y+e/AsEPhyKbN9JVV9urgEa4Dt383BFQXzj/SowlBKjWU/Y++WdnXBjX37FlB
         k9ghLCeJErXQnDds/WCZ79wm3DpyrYqFvwcCoT2/WU3G2kP+EEVqiNrCz8/jlNJ3zk6o
         3CQ80IX4XAmRstJKLqm3ceqYoLIhZxjbV2oOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VIuGIGghetWwe9rnPqTv3I5BXUV7yEauCkS0K1lBx18=;
        b=kr81eWyl1y6pZHp364lxN7skGTjgdRjHdQUweNGQ7ygGNsN7+Q7J0V3+8mfaaVk5TI
         q2qhYAfxm6SxbCXTctAnYIhThDvYxdag8tEzwrijSh5S3gaV1242U7YnkHsSm5d5XvXW
         J6LkR/QFSVExPxqIeXWZQZKKzFx5Kv5MVGDMRNUCiIR5YuQyjzHBT1I/raSZflntrsYI
         /3//JuujkL/ho86YdqqC+M7bCEMKxy5Xatwgvine4kgyFQ2Ugpk2J2SJRyQz3p3EIaWe
         nWwLL5KivZhl6uJF2815/YxUKLg9jv6xvQw/cbQCnqfCkKGcRENzWXiXk0vHUWvP+JXB
         5oow==
X-Gm-Message-State: AOAM530dkI4yxbFzqU3wqHgoxkN89jMqz/PzcSwPhi1Hm9TPOVRBS5dl
	1dZKeQ/WOLhjlPB+7t4uwhz+Xg==
X-Google-Smtp-Source: ABdhPJzY9Smqq7+VVhBzEi3mLDSNRypxfK6/5YXiufuhRe+PaPUbWh3b1DL4ZvlVGGX7Qx5vv0UeXQ==
X-Received: by 2002:adf:f181:: with SMTP id h1mr4743547wro.374.1604011363520;
        Thu, 29 Oct 2020 15:42:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.f.b.1.1.e.8.3.0.4.2.f.2.4.4.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.f.b.1.1.e.8.3.0.4.2.f.2.4.4.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d442:f240:38e1:1bf4])
        by smtp.gmail.com with ESMTPSA id z5sm7714114wrw.87.2020.10.29.15.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 15:42:43 -0700 (PDT)
Message-ID: <1f98020a32a089d2f5afbeb2f91acffa2c03b714.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 01/22] gstreamer1.0: Fix reproducibility issue around libcap
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Oct 2020 22:42:41 +0000
In-Reply-To: <CANPvuRnBjAhF2MWmuQsXNiBrYucOEucaeQc2uqxi6=oka3Ovug@mail.gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
	 <20201029142806.1830504-2-quaresma.jose@gmail.com>
	 <7ff661d33eefed532bff3a1509f23fa26cc289a9.camel@linuxfoundation.org>
	 <CANPvuRmmJ_kcFWErPue-Ub-N_F_8YM=MAO7n1s2DoYhuU9fwVw@mail.gmail.com>
	 <968b3010cd55cd630332e3f5b43014cd3c8c0a5a.camel@linuxfoundation.org>
	 <1642850E1E948AB3.32334@lists.openembedded.org>
	 <CANPvuRnBjAhF2MWmuQsXNiBrYucOEucaeQc2uqxi6=oka3Ovug@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-10-29 at 22:10 +0000, Jose Quaresma wrote:
> Jose Quaresma via lists.openembedded.org
> <quaresma.jose=gmail.com@lists.openembedded.org> escreveu no dia
> quinta, 29/10/2020 à(s) 16:58:
> > I will need to rebuild and check if when setcap is enabled it will
> > pick setcap from host on from libcap-
> > native.
> > 
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> > quinta, 29/10/2020 à(s) 16:43:
> > > On Thu, 2020-10-29 at 16:13 +0000, Jose Quaresma wrote:
> > > > It looks for setcap in /usr/sbin and /sbin but needs libcap as
> > > > wheel.
> > > > when we have libcaps on DEPENDS as with version 1.16 and the
> > > > host
> > > > system has setcap binary, it introduces a dependency on the
> > > > host
> > > > system.
> > > > The patch fixes this situation.
> > > > 
> > > > But libcap is only needed if we need to use the setcap
> > > > So remove libcap from DEPENDS will fail to use
> > > > 'ptp-helper-permissions=capabilities' even if setcap is found
> > > > on the
> > > > host.
> > > > 
> > > > In my opinion this a better description can be used in this
> > > > PACKAGECONFIG, something like this:
> > > > 
> > > > -PACKAGECONFIG[setcap] = ",,libcap libcap-native"
> > > > +PACKAGECONFIG[capabilities] =
> > > > "-Dptp-helper-permissions=capabilities,,libcap libcap-native"
> > > 
> > > So you're saying that as long as setcap isn't in DEPENDS, we're
> > > ok?
> 
> Yes it's correct.
> 
> > > That means your patchset as it stands should be ok?
> 
> Yes it's correct.
> 
> > > If the user enables capabilities, it won't find setcap from
> > > libcap-
> > > native though will it? That is a potential problem even if its
> > > not the
> > > default?
> 
> Yes it find the setcap on recipe-sysroot-native
> 
> The help of messon find_program said that it will find the program in
> the first arg
> and fallback to the other if the last one fails. In this case it
> first
> find setcap on the PATH
> setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap',
> required : false)
> https://mesonbuild.com/Reference-manual.html#find_program
> 
> I made a little change on the souce to check this:
> 
> +++ b/libs/gst/helpers/meson.build
> @@ -67,6 +67,7 @@ if have_ptp
>   endif
> 
>   setcap_prog = find_program('setcap', '/usr/sbin/setcap',
> '/sbin/setcap', required : false)
> +  message('setcap_prog: ' + setcap_prog.full_path())
>   cap_dep = dependency('libcap', required: false)
> 
>   # user/group to change to in gst-ptp-helper
> 
> This give me:
> 
> # with PACKAGECONFIG_append = "setcap"
> bitbake  gstreamer1.0 -c configure -v -f | grep setcap_prog
> Message: setcap_prog:
> /work/build/tmp/work/armv7vet2hf-neon-poky-linux-
> gnueabi/gstreamer1.0/1.18.0-r0/recipe-sysroot-native/usr/sbin/setcap
> 
> # with PACKAGECONFIG_remove = "setcap"
> bitbake  gstreamer1.0 -c configure -v -f | grep setcap_prog
> Message: setcap_prog: /sbin/setcap


Thanks for confirming that, sounds like the patch is indeed no longer
needed. I was worried it wouldn't behave like that.

Cheers,

Richard

