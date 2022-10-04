Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0FEC433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 12:54:57 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.10204.1664888087607682599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 05:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kbR1iRZ9;
 spf=pass (domain: linaro.org, ip: 209.85.167.48,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id d18so7935381lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 05:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=sbeKiGiAJobpotmlE9S5Y8hLwZo+t6E25bvrg/GzTIM=;
        b=kbR1iRZ95KfU/MgK/5srg4C3zR6oGSZaEkC1Q167x8bscAKZ/JuT/McwwjGvOPM1rw
         ZoB4o61uoWsw3SSRkgtI9tkcYqSn6caND1GtpCWEx7CNX68Y3+akflJOs8dkkk/Xp9CN
         ypyTr00k5w05iseYpQyY8wTpOXuX0mfvmu375nf33IwZ5hEcJt0nkIhLi40OCzs5a94j
         JwVuZLQm5xfbPCkD+tn5SrwNHDclwSz3Xy7NFxoZh0NgfhrV6MHnZs9ZlxlNS+Y3VY1q
         ahX8qjkIga+FVHekntowrwmjHPqa2IxfKrzEp0qTEgnEIYFcxCROpBV0gHpt8CM2px3E
         40DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sbeKiGiAJobpotmlE9S5Y8hLwZo+t6E25bvrg/GzTIM=;
        b=y/WCW61mPaipIjQ5frhc6abrc1CvVeTDczk9YugAn+VXS2kF/MkGa4xMF3QNipXmF6
         1ZheNAWvI6h2VWy3PgDMMpDHP8IXgDNWe7LS1lkj6HmqtsRh7SzmWgNCEX5LK57FSPPQ
         M1M4hVkTkfQ0NvmS9TID/UdggAPC0mqMSr+QA2V/qXzjNA14PjsReynSmbDfcB6xYkpP
         3WKh+lmGAIYYPd24y+KDT0aeMZynHlBUDOiLdaSX9HEAnd+5dB3PRg7TfdW5mq/beG+U
         6m9e7/yOPTfcNzj29HTbOMy7mcT5sx+oZfbRx+HukhFCwWcElJ+dWdecu4GSzcBJlMI4
         zI3Q==
X-Gm-Message-State: ACrzQf1E6ZsBJRiUwuQeL9UjtiE2vPClKsYAXwJg4NPxTxYHQ/QkAZTx
	p+Ay2bFxc17Z6ia4ABc3fJ5JeA==
X-Google-Smtp-Source: 
 AMsMyM7NgJG5XxKWuHxDe+YvMTgLkGwyDWECzvkyAd1YOUGeqezu+ma4A07T5Vrb/YdNy78LoEW3cw==
X-Received: by 2002:a19:5503:0:b0:4a2:329d:bc74 with SMTP id
 n3-20020a195503000000b004a2329dbc74mr4512477lfe.77.1664888085740;
        Tue, 04 Oct 2022 05:54:45 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id
 y1-20020a2e4b01000000b0026bfadf87e3sm220173lja.20.2022.10.04.05.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 05:54:45 -0700 (PDT)
Date: Tue, 4 Oct 2022 15:54:43 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/4] openssl-native.bbclass: add bbclass
Message-ID: <YzwtE5kjPWFOzYxU@nuoska>
References: <20221004101038.2736600-1-mikko.rapeli@linaro.org>
 <99339c298138b6f300146d81beec455815b11771.camel@linuxfoundation.org>
 <YzwbPsiFw9YDMAWe@nuoska>
 <01b508d0ebd4b4bac844367910d8045ca4c54ef7.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <01b508d0ebd4b4bac844367910d8045ca4c54ef7.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 12:54:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171391

Hi,

On Tue, Oct 04, 2022 at 01:19:41PM +0100, Richard Purdie wrote:
> On Tue, 2022-10-04 at 14:38 +0300, Mikko Rapeli wrote:
> > On Tue, Oct 04, 2022 at 12:09:18PM +0100, Richard Purdie wrote:
> > 
> > > I noticed there that the patches have thrown some compiler warnings:
> > > 
> > > crypto/conf/conf_mod.c:667:20: error: passing 'const char *(int)' to parameter of type 'const void *' converts between void pointer and function pointer [-Werror,-Wpedantic]
> > >         if (dladdr(OpenSSL_version, &info)) {
> > > crypto/conf/conf_mod.c: In function 'CONF_get1_default_config_file':
> > > crypto/conf/conf_mod.c:667:20: error: ISO C forbids passing argument 1 of 'dladdr' between function pointer and 'void *' [-Werror=pedantic]
> > >   667 |         if (dladdr(OpenSSL_version, &info)) {
> > >       |                    ^~~~~~~~~~~~~~~
> > > In file included from /usr/aarch64-linux-gnu/include/link.h:25,
> > >                  from crypto/conf/conf_mod.c:34:
> > > /usr/aarch64-linux-gnu/include/dlfcn.h:98:32: note: expected 'const void *' but argument is of type 'const char * (*)(int)'
> > >    98 | extern int dladdr (const void *__address, Dl_info *__info)
> > > 
> > > 
> > > It may be worth fixing those just in case they consider the patch.
> > 
> > Yes, but the general design of using dladdr(OpenSSL_version,...) did not
> > get any positive comments in the bug report so I think this is wasted
> > effort.
> 
> There isn't any feedback there saying dladdr is rejected, just that
> they're not sure about the general use case. Getting changes accepted
> by upstreams does usually require a bit of work so I'd not quite give
> up yet! I can understand it from the maintainers side too, if you're
> being asked to accept and maintain something, you do need there to be a
> compelling reason for it.

openssl has been using these environment variables for decades. I can
understand that they hesitate to change any of that. Also because some
of the code is obviously trying to avoid any posix dependencies including
stat().

https://github.com/openssl/openssl/issues/19242

"t8m commented 15 days ago
I am afraid this is potentially asking for security issues. It would
have to be implemented very carefully."

"beldmit commented 15 days ago
I don't like this approach as a whole. IMHO, we should have some defines
to find installation-specific values for a specific installation."

"levitte commented 14 days ago
It's possible that it would be better if util/wrap.pl became a public
tool. Not necessarily exactly as it works now, but something with a
similar intent."

"levitte commented 14 days ago
This isn't just an OpenSSL problem, is it? There are other libraries
that are plugable (and essentially, providers are exactly that,
plugins), and I imagine that they also have their own custom default
location for plugins.
Otherwise, the obvious answer would be that you should install things
that belong with OpenSSL into its default locations... and that's
answered with openssl version -a as said above, or with the openssl info
command in later OpenSSL versions."

So wrapper it is then.

> > > I'm wondering whether we should just carry those patches? They don't
> > > look so invasive and it would save complicating things elsewhere in our
> > > codebase...
> > 
> > I don't think so. For every variable the patch is annoyingly different
> > and there are merge/rebase conflicts with newer upstream releases
> > already.
> 
> I didn't look in detail but at least the injected code blocks do look
> relatively self contained which does make maintenance easier. The fact
> they're had rebase conflicts already is sad/worrying though :(.

Exactly.

> > I think pyton3native.bbclass sets the example. Variables need to be set
> > for openssl to work correctly after relocation to paths not known at
> > compile time. Same applies to any code which needs to dlopen() something
> > or which has custom locations for modules, data or configuration files.
> 
> I'm not sure I'd hold python3native as a good example. It was what we
> needed to do to get things to work and was the least worst thing :/.
> Limitations to a single scripting language are much easier than a
> general elf shared library.

Well, the openssl-native recipes 'openssl' wrapper script seems to be fine.

This openssl-native.bbclass extends the same approach for those who just load
the shared libraries. python3-cryptography-native would be one clear
user since currently it's completely broken and even fails to load the
python3 module.

Cheers,

-Mikko

