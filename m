Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8336C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 13:32:57 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.10654.1664890369367108313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 06:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uKWaB73F;
 spf=pass (domain: linaro.org, ip: 209.85.167.51,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id o7so13879683lfk.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 06:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=90eosh+ADzdDcc7jufkXDMuQDn4ydd9LnqP58R3/k68=;
        b=uKWaB73Fry1E7tiIxWZfUkaei0uh3w1Ykf6HtLcXBV8BSIiGpEhlQ51SKunWRRxdQ8
         dlCe1azQ/7x8rJzeQy5nfQCqsJrs3DB+iz1VlSN3N9gTOTljqf0xT3fqhmFxl7hGqzmz
         7I2nABKzqyHQWl/k7i81nmjrE6fRgQzSD4E7doJGf2Hx41zz+BeugtdZBowdzCaPRZt4
         RXYiMCQ6Oa5fc2BPdpxRcb7/lUIqMFOUVP7L+xpFyNwE0LQJ2AzZHHsnylX6NNOwHqpF
         2+KX30ahmaZGAo+dxfLSBe2alBc11jjN52C+P3jaDSz/eI41wb7KRn+phoNye2M8C7sF
         Xrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=90eosh+ADzdDcc7jufkXDMuQDn4ydd9LnqP58R3/k68=;
        b=FL+JbwzoXelThEGexwCGNZKsIKlTwwizEeA7KoH+4LGmkMgDzGspyomPgrsDGlq3jp
         hCcWItlvV2VvL7bIclt+xcb5YhzZyjQxuTGpiOat/DNbevATOPagjvzEOWscqsaEmjRv
         ZygWu3hFLgdvGGgbuYnWBNFM1NofBO60FyqxBTak/CZHD3/CIkMogZIP5xbO5Jl0gDcW
         IpysOloRYaSlFe9bXAm4N6yRukFPbk4Ta0Qig3xjbN5FmV71EM9X/Fe75cXm0HAxJoFZ
         PF3MTpJ0oL7EaRWEOPCsQgOKtultnUBLCgJyet7e3fCWSqKY4ZHnTStwOAhhTz81JdNi
         aAhA==
X-Gm-Message-State: ACrzQf1cK6DbZ8STkdCudOd5DogPPZCn4R+L0YlN3104hSEdXtiawdHk
	XBgt+WwC/im05YgWTcryX19wbw==
X-Google-Smtp-Source: 
 AMsMyM6SxAti53mDfO8bif8YjjbuH+zCo0qJAklba0IdHeHRylECZoQL+bhhK0ZAEhzpFUke82wJCg==
X-Received: by 2002:a05:6512:12c7:b0:49b:755d:fde5 with SMTP id
 p7-20020a05651212c700b0049b755dfde5mr8361055lfg.182.1664890367431;
        Tue, 04 Oct 2022 06:32:47 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id
 u6-20020a2e8446000000b0026c453c51b7sm1232372ljh.68.2022.10.04.06.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:32:46 -0700 (PDT)
Date: Tue, 4 Oct 2022 16:32:45 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/4] openssl-native.bbclass: add bbclass
Message-ID: <Yzw1/WhHjPQTCS8W@nuoska>
References: <20221004101038.2736600-1-mikko.rapeli@linaro.org>
 <99339c298138b6f300146d81beec455815b11771.camel@linuxfoundation.org>
 <YzwbPsiFw9YDMAWe@nuoska>
 <01b508d0ebd4b4bac844367910d8045ca4c54ef7.camel@linuxfoundation.org>
 <YzwtE5kjPWFOzYxU@nuoska>
 <9f0b315f790901f89449bd983f60c9092a14e0e6.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <9f0b315f790901f89449bd983f60c9092a14e0e6.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 13:32:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171393

Hi,

On Tue, Oct 04, 2022 at 02:09:45PM +0100, Richard Purdie wrote:
> On Tue, 2022-10-04 at 15:54 +0300, Mikko Rapeli wrote:
> > On Tue, Oct 04, 2022 at 01:19:41PM +0100, Richard Purdie wrote:
> > > On Tue, 2022-10-04 at 14:38 +0300, Mikko Rapeli wrote:
> > > > On Tue, Oct 04, 2022 at 12:09:18PM +0100, Richard Purdie wrote:
> > > > 
> > > > > I noticed there that the patches have thrown some compiler warnings:
> > > > > 
> > > > > crypto/conf/conf_mod.c:667:20: error: passing 'const char *(int)' to parameter of type 'const void *' converts between void pointer and function pointer [-Werror,-Wpedantic]
> > > > >         if (dladdr(OpenSSL_version, &info)) {
> > > > > crypto/conf/conf_mod.c: In function 'CONF_get1_default_config_file':
> > > > > crypto/conf/conf_mod.c:667:20: error: ISO C forbids passing argument 1 of 'dladdr' between function pointer and 'void *' [-Werror=pedantic]
> > > > >   667 |         if (dladdr(OpenSSL_version, &info)) {
> > > > >       |                    ^~~~~~~~~~~~~~~
> > > > > In file included from /usr/aarch64-linux-gnu/include/link.h:25,
> > > > >                  from crypto/conf/conf_mod.c:34:
> > > > > /usr/aarch64-linux-gnu/include/dlfcn.h:98:32: note: expected 'const void *' but argument is of type 'const char * (*)(int)'
> > > > >    98 | extern int dladdr (const void *__address, Dl_info *__info)
> > > > > 
> > > > > 
> > > > > It may be worth fixing those just in case they consider the patch.
> > > > 
> > > > Yes, but the general design of using dladdr(OpenSSL_version,...) did not
> > > > get any positive comments in the bug report so I think this is wasted
> > > > effort.
> > > 
> > > There isn't any feedback there saying dladdr is rejected, just that
> > > they're not sure about the general use case. Getting changes accepted
> > > by upstreams does usually require a bit of work so I'd not quite give
> > > up yet! I can understand it from the maintainers side too, if you're
> > > being asked to accept and maintain something, you do need there to be a
> > > compelling reason for it.
> > 
> > openssl has been using these environment variables for decades. I can
> > understand that they hesitate to change any of that. Also because some
> > of the code is obviously trying to avoid any posix dependencies including
> > stat().
> > 
> > https://github.com/openssl/openssl/issues/19242
> > 
> > "t8m commented 15 days ago
> > I am afraid this is potentially asking for security issues. It would
> > have to be implemented very carefully."
> > 
> > "beldmit commented 15 days ago
> > I don't like this approach as a whole. IMHO, we should have some defines
> > to find installation-specific values for a specific installation."
> > 
> > "levitte commented 14 days ago
> > It's possible that it would be better if util/wrap.pl became a public
> > tool. Not necessarily exactly as it works now, but something with a
> > similar intent."
> > 
> > "levitte commented 14 days ago
> > This isn't just an OpenSSL problem, is it? There are other libraries
> > that are plugable (and essentially, providers are exactly that,
> > plugins), and I imagine that they also have their own custom default
> > location for plugins.
> > Otherwise, the obvious answer would be that you should install things
> > that belong with OpenSSL into its default locations... and that's
> > answered with openssl version -a as said above, or with the openssl info
> > command in later OpenSSL versions."
> > 
> > So wrapper it is then.
> 
> I was going to write a reply to some of that, I still might, but as I
> was doing it, another idea did just come to mind.
> 
> Somewhere I'm guessing openssl has some common init function?

Sadly, there isn't. Not even a common header file. Or at least
I did not find any. The engines, modules, config files and certs
are quite different things compared to the plain shared libraries
which are already found from LD_LIBRARY_PATH.

Cheers,

-Mikko

