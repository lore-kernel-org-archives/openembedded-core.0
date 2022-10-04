Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5652C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 13:09:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.10384.1664888988316290276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 06:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SM3/2cZm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j7so15883576wrr.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=yElxfkA5A+FGK4x3x1manUqo89WYUp677kwvvpjp+tA=;
        b=SM3/2cZmM1RySl1iqrdn0GlFK/dpHHjf5JlvnWJirS0Htnfqha/K/femM/XzzP/yef
         oc6A/+4ZLkkaBSASAqrD7rPJiLTg1y8bDWFO7du9mvdAwv7DWWUR8VVP+a12FKItM1Vw
         n9uMySEcnGo9I2Btni0bn9D8nIqOSbqSVw0Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=yElxfkA5A+FGK4x3x1manUqo89WYUp677kwvvpjp+tA=;
        b=WNuwVsgQi0QBHHJR8H6JCww7tY0uVas0enxCBVbxgxe/VjbqgiimG30B380uN35aRx
         /ZCe9if8a6mADSUzPoOACOwTlqaF8oqFi9Cxb1DzEqpg/LiqWaLj/VrjB/CqXiDgvWI9
         5m9eecsZ+VdakYWYuZZPC6qZpg97Rn12dH9796CIVAr24JTbbaO8bB6nqo3SQPhzkHqo
         rUm0cwudAVVQ5hgNsYFshPogv8w8wbEuqoZiucEqRLSDCLlkppgQDX3iLyPTVQqp/gCp
         HiQ8y6YEyOScJUH83BK5abZqfGqfh6/x3whK/gJufqZ7VwMuZbdSZaWjW2M1xC9k3Z5q
         vIRg==
X-Gm-Message-State: ACrzQf3WFy/kzGtF4Gx6S01P+9uRzHQhg3XduFoBCPh0cZ69O2VcoyrY
	NIf62lMFiKOWygrFHxROfLb3uQ==
X-Google-Smtp-Source: 
 AMsMyM5pZCwLtOh8gdY24+uTRyR2ZYbZOMYvBiTQ6pY/e84nVK5jEcQiNDTpq3JYnGdgmbj+uNoRBg==
X-Received: by 2002:adf:ee03:0:b0:22c:d32c:4f69 with SMTP id
 y3-20020adfee03000000b0022cd32c4f69mr15467283wrn.585.1664888986622;
        Tue, 04 Oct 2022 06:09:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a418:d17a:77b7:6987?
 ([2001:8b0:aba:5f3c:a418:d17a:77b7:6987])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003a5c244fc13sm21402491wms.2.2022.10.04.06.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:09:46 -0700 (PDT)
Message-ID: 
 <9f0b315f790901f89449bd983f60c9092a14e0e6.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/4] openssl-native.bbclass: add bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Date: Tue, 04 Oct 2022 14:09:45 +0100
In-Reply-To: <YzwtE5kjPWFOzYxU@nuoska>
References: <20221004101038.2736600-1-mikko.rapeli@linaro.org>
	 <99339c298138b6f300146d81beec455815b11771.camel@linuxfoundation.org>
	 <YzwbPsiFw9YDMAWe@nuoska>
	 <01b508d0ebd4b4bac844367910d8045ca4c54ef7.camel@linuxfoundation.org>
	 <YzwtE5kjPWFOzYxU@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 13:09:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171392

On Tue, 2022-10-04 at 15:54 +0300, Mikko Rapeli wrote:
> On Tue, Oct 04, 2022 at 01:19:41PM +0100, Richard Purdie wrote:
> > On Tue, 2022-10-04 at 14:38 +0300, Mikko Rapeli wrote:
> > > On Tue, Oct 04, 2022 at 12:09:18PM +0100, Richard Purdie wrote:
> > >=20
> > > > I noticed there that the patches have thrown some compiler warnings=
:
> > > >=20
> > > > crypto/conf/conf_mod.c:667:20: error: passing 'const char *(int)' t=
o parameter of type 'const void *' converts between void pointer and functi=
on pointer [-Werror,-Wpedantic]
> > > >         if (dladdr(OpenSSL_version, &info)) {
> > > > crypto/conf/conf_mod.c: In function 'CONF_get1_default_config_file'=
:
> > > > crypto/conf/conf_mod.c:667:20: error: ISO C forbids passing argumen=
t 1 of 'dladdr' between function pointer and 'void *' [-Werror=3Dpedantic]
> > > >   667 |         if (dladdr(OpenSSL_version, &info)) {
> > > >       |                    ^~~~~~~~~~~~~~~
> > > > In file included from /usr/aarch64-linux-gnu/include/link.h:25,
> > > >                  from crypto/conf/conf_mod.c:34:
> > > > /usr/aarch64-linux-gnu/include/dlfcn.h:98:32: note: expected 'const=
 void *' but argument is of type 'const char * (*)(int)'
> > > >    98 | extern int dladdr (const void *__address, Dl_info *__info)
> > > >=20
> > > >=20
> > > > It may be worth fixing those just in case they consider the patch.
> > >=20
> > > Yes, but the general design of using dladdr(OpenSSL_version,...) did =
not
> > > get any positive comments in the bug report so I think this is wasted
> > > effort.
> >=20
> > There isn't any feedback there saying dladdr is rejected, just that
> > they're not sure about the general use case. Getting changes accepted
> > by upstreams does usually require a bit of work so I'd not quite give
> > up yet! I can understand it from the maintainers side too, if you're
> > being asked to accept and maintain something, you do need there to be a
> > compelling reason for it.
>=20
> openssl has been using these environment variables for decades. I can
> understand that they hesitate to change any of that. Also because some
> of the code is obviously trying to avoid any posix dependencies including
> stat().
>=20
> https://github.com/openssl/openssl/issues/19242
>=20
> "t8m commented 15 days ago
> I am afraid this is potentially asking for security issues. It would
> have to be implemented very carefully."
>=20
> "beldmit commented 15 days ago
> I don't like this approach as a whole. IMHO, we should have some defines
> to find installation-specific values for a specific installation."
>=20
> "levitte commented 14 days ago
> It's possible that it would be better if util/wrap.pl became a public
> tool. Not necessarily exactly as it works now, but something with a
> similar intent."
>=20
> "levitte commented 14 days ago
> This isn't just an OpenSSL problem, is it? There are other libraries
> that are plugable (and essentially, providers are exactly that,
> plugins), and I imagine that they also have their own custom default
> location for plugins.
> Otherwise, the obvious answer would be that you should install things
> that belong with OpenSSL into its default locations... and that's
> answered with openssl version -a as said above, or with the openssl info
> command in later OpenSSL versions."
>=20
> So wrapper it is then.

I was going to write a reply to some of that, I still might, but as I
was doing it, another idea did just come to mind.

Somewhere I'm guessing openssl has some common init function?

Perhaps in that we patch in a hook, which looks at the current path of
the library, compares that to the default install location, then sets
the magic envvars accordingly if the location has changed?

That code should be isolatable in that we only have one entry point to
patch in and as you say, the envvars have been around forever, we'd
just need to watch for new ones.

The advantage to this is that the openssl library should then "just
work", we don't need to worry about the environment being present
everywhere?

This would also give us a new way to avoid some of these kinds of
issues with a new example to follow which doesn't involve manually
ensuring all users are tweaked. I really don't like the environment
variable approach for libraries.

Cheers,

Richard

