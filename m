Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C19C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 12:19:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.9682.1664885984870369507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 05:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FgClrTZV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 130-20020a1c0288000000b003b494ffc00bso10193559wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=IcIraRPVKtFaY0QuxwnACcyV23Yze5h6PwrMEKZPE28=;
        b=FgClrTZVZ1/Xuvxylx5vo11BpGt5hAV5UzVMzdUIB0hK2/DpROlOOhdhbQVJU2P+pD
         yiyLHCsCfWsoEb7VtOtl1548hjzzI5WOYoIs9g0A4nzxYx861bQHPX1RcJbQP7i7y2Dd
         CZ7l+4GbzNd4CgNx85VT5IKDaLcepf9NnH8B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=IcIraRPVKtFaY0QuxwnACcyV23Yze5h6PwrMEKZPE28=;
        b=1xMIH05UQPri6cf6+rFEAyjiYDGFDXyVQJtsuBbiJzof5lEsKoVLWGOcfJTo7aVNFo
         esPJnf8keBzGpD8quc3ylklHk7Fv1FQsbh+eQCg0ljERjmsERYuHWH3/AS+yPc1R4NLm
         qiersOToOioEBkrXsGb3+223CFRtP8GiPlc1oY9BbHCCZjRY34SRAT86kBJgSbAirZcW
         tSYaDea7XWLpYG83ElFEka3isNGlfgJXvVLxDx/pKx3LKMCUVVJZTILxELpObQjIsNCF
         ydqaPZP0X+ofZAEzl/K370zetIjqwHIGXV19Uj3kxdSko0f+2Q95z9r/FN/ssnYogThx
         M6ZA==
X-Gm-Message-State: ACrzQf1z4ZBBSeqMynKkM1qz6w5VM+qIRcwliqkykaP35szb4T7ex/Tv
	B8YPbAtdpNum3rz6lHcIHT0tKQ==
X-Google-Smtp-Source: 
 AMsMyM6DX8Y7g+FXIJ+txBZIYynlkcRyOPrveH+AZWzvYcO/cB7b8P91KqSMqnY+1hX3xKGd0l6P6Q==
X-Received: by 2002:a05:600c:3ba0:b0:3b4:8ad0:6c with SMTP id
 n32-20020a05600c3ba000b003b48ad0006cmr9904794wms.186.1664885983221;
        Tue, 04 Oct 2022 05:19:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a418:d17a:77b7:6987?
 ([2001:8b0:aba:5f3c:a418:d17a:77b7:6987])
        by smtp.gmail.com with ESMTPSA id
 u10-20020adff88a000000b0022e47b57735sm3189342wrp.97.2022.10.04.05.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 05:19:42 -0700 (PDT)
Message-ID: 
 <01b508d0ebd4b4bac844367910d8045ca4c54ef7.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/4] openssl-native.bbclass: add bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Date: Tue, 04 Oct 2022 13:19:41 +0100
In-Reply-To: <YzwbPsiFw9YDMAWe@nuoska>
References: <20221004101038.2736600-1-mikko.rapeli@linaro.org>
	 <99339c298138b6f300146d81beec455815b11771.camel@linuxfoundation.org>
	 <YzwbPsiFw9YDMAWe@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 12:19:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171389

On Tue, 2022-10-04 at 14:38 +0300, Mikko Rapeli wrote:
> On Tue, Oct 04, 2022 at 12:09:18PM +0100, Richard Purdie wrote:
>=20
> > I noticed there that the patches have thrown some compiler warnings:
> >=20
> > crypto/conf/conf_mod.c:667:20: error: passing 'const char *(int)' to pa=
rameter of type 'const void *' converts between void pointer and function p=
ointer [-Werror,-Wpedantic]
> >         if (dladdr(OpenSSL_version, &info)) {
> > crypto/conf/conf_mod.c: In function 'CONF_get1_default_config_file':
> > crypto/conf/conf_mod.c:667:20: error: ISO C forbids passing argument 1 =
of 'dladdr' between function pointer and 'void *' [-Werror=3Dpedantic]
> >   667 |         if (dladdr(OpenSSL_version, &info)) {
> >       |                    ^~~~~~~~~~~~~~~
> > In file included from /usr/aarch64-linux-gnu/include/link.h:25,
> >                  from crypto/conf/conf_mod.c:34:
> > /usr/aarch64-linux-gnu/include/dlfcn.h:98:32: note: expected 'const voi=
d *' but argument is of type 'const char * (*)(int)'
> >    98 | extern int dladdr (const void *__address, Dl_info *__info)
> >=20
> >=20
> > It may be worth fixing those just in case they consider the patch.
>=20
> Yes, but the general design of using dladdr(OpenSSL_version,...) did not
> get any positive comments in the bug report so I think this is wasted
> effort.

There isn't any feedback there saying dladdr is rejected, just that
they're not sure about the general use case. Getting changes accepted
by upstreams does usually require a bit of work so I'd not quite give
up yet! I can understand it from the maintainers side too, if you're
being asked to accept and maintain something, you do need there to be a
compelling reason for it.

> > I'm wondering whether we should just carry those patches? They don't
> > look so invasive and it would save complicating things elsewhere in our
> > codebase...
>=20
> I don't think so. For every variable the patch is annoyingly different
> and there are merge/rebase conflicts with newer upstream releases
> already.

I didn't look in detail but at least the injected code blocks do look
relatively self contained which does make maintenance easier. The fact
they're had rebase conflicts already is sad/worrying though :(.

> I think pyton3native.bbclass sets the example. Variables need to be set
> for openssl to work correctly after relocation to paths not known at
> compile time. Same applies to any code which needs to dlopen() something
> or which has custom locations for modules, data or configuration files.

I'm not sure I'd hold python3native as a good example. It was what we
needed to do to get things to work and was the least worst thing :/.
Limitations to a single scripting language are much easier than a
general elf shared library.

Cheers,

Richard



