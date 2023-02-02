Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623A6C636D3
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 10:53:25 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.11881.1675335194538324036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 02:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h2WqR1qR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id y1so1319817wru.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 02:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZUJJKAVjOnqBl6LRyxkIxZXMr3nP2N/wrvkzGRaA7hE=;
        b=h2WqR1qRHQjo459YkY7yTxM+tHHyg6MsmjvhCZSFWu2jtkehTQ0ofyzDzA0WEc3pVi
         en8jAGC1tf5JyaQ4dbj2EKAwfHVMZsZ7nsGL00hiwzVmk8zJMsWdHzIe789ANBWjsw5N
         IjhTu8bzqO+hEHy3ZDTe3daZQVPMxOZRRpHWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUJJKAVjOnqBl6LRyxkIxZXMr3nP2N/wrvkzGRaA7hE=;
        b=NQ6itkLmgE5kfgBEVCa0f3/gpahF1C5KLPsL8soNZkVX6I69pCKbBIzOa58knMV5ML
         fcnCtpuivdj3YYIJFwDZ9SmL1WDCq8o5aBop6YwaUhPaD+A701kUglXHtV99SW+xpUzq
         u1oB+5gZUM179ynKR7Mgc+YXb9Rx7XN9s1g8eHQ+/uC5CeSnMObrPXoFlNfcxNcb3FK0
         86MDYHT6eFFxXJBCeqCwucz30uIkhLC4JsGqaaIuVbVuzbRdT6spRfXjqw9VicdSXYsy
         jah5O4MxYNoR+r3FR3vCuDtdxEvTJ20fqXIgFLsmFkcrAkM0Dm2ubDs7hU9YORNh81c3
         8a4Q==
X-Gm-Message-State: AO0yUKU9QakGqDfHLtyH3cUzG8qcYzk5BUF645JSneZJ3xGvjWa4VgST
	E6v672990tp0KhNHSveybauzMw==
X-Google-Smtp-Source: AK7set88sD6RatJPsMbRW9OHA0KPnqmsWOXEWGaxNteBDCu6DrzHpwVPLp/uy3koEv3S7lL3+vSVEw==
X-Received: by 2002:a05:6000:252:b0:2bf:ec95:2b19 with SMTP id m18-20020a056000025200b002bfec952b19mr4273406wrz.23.1675335192636;
        Thu, 02 Feb 2023 02:53:12 -0800 (PST)
Received: from [172.27.250.62] ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4c49000000b002bfb7c2430bsm19476682wrt.19.2023.02.02.02.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:53:12 -0800 (PST)
Message-ID: <845d6037af51cb2ba78a6d139f5a27301a0a77a0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] oeqa/selftest/locales: Create selftest for
 locales generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Cc: "khilman@baylibre.com" <khilman@baylibre.com>
Date: Thu, 02 Feb 2023 10:53:11 +0000
In-Reply-To: <1749af1e-dce3-ec14-32a1-fe5a50848f25@baylibre.com>
References: <20230127153344.2868589-1-lrannou@baylibre.com>
	 <b3320afb6afb6508d5f4d0f3ceb75e87e97ed450.camel@linuxfoundation.org>
	 <92bff1e0-aa88-c713-049f-51f074569a55@baylibre.com>
	 <913abc23f1ba2691f7c676b182b1ec0303e5d30d.camel@linuxfoundation.org>
	 <1749af1e-dce3-ec14-32a1-fe5a50848f25@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 10:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176688

On Thu, 2023-02-02 at 11:41 +0100, Louis Rannou wrote:
> On 01/02/2023 18:57, Richard Purdie wrote:
> > On Wed, 2023-02-01 at 16:02 +0100, Louis Rannou wrote:
> >=20
> >=20
> > I was able to take a quick look at this. The locale generation on
> > target is broken, it throws errors upon boot. I was able to make it
> > work with this patch:
> >=20
> > diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-co=
re/glibc/glibc-locale.inc
> > index 7f70b3ca4f..c39007b573 100644
> > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > @@ -60,7 +60,7 @@ DESCRIPTION:localedef =3D "glibc: compile locale defi=
nition files"
> >   # FILES:glibc-gconv will not be automatically extended in multilib.
> >   # Explicitly add ${MLPREFIX} for FILES:glibc-gconv.
> >   FILES:${MLPREFIX}glibc-gconv =3D "${libdir}/gconv/*"
> > -FILES:localedef =3D "${bindir}/localedef"
> > +FILES:localedef =3D "${bindir}/localedef ${libdir}/locale"
> >  =20
> >   LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-loca=
le"
> >  =20
> > @@ -87,6 +87,7 @@ do_install() {
> >          find ${D}${libdir} -type d -empty -delete
> >          copy_locale_files ${datadir}/locale 0644
> >          install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTE=
D
> > +       install -d ${D}${libdir}/locale
> >   }
> >  =20
> >   inherit libc-package
> >=20
> > could you see if the same test will now work with that patch applied?
> > I'm happy to have the basic test but if we can fix this and stop it
> > regressing that would be even better.
>=20
> The patch does not change the result. I have actually nothing in the=20
> image/usr/lib/locale directory.

Testing locally, if I don't have the patch and "runqemu core-image-
minimal snapshot kvm", I see errors about locale generation failing
during first boot as the directory isn't present.

If I add the patch and then boot the image, I see the locale generation
happening at first boot. If I then run the locale commands, I can see
the locales present.

> I am not sure to understand... If I add to my image the packages=20
> glibc-localedata-fr-fr and glibc-charmap-utf-8, then I have something in=
=20
> /usr/share/i18n/locales and /usr/share/i18n/charmaps, and then I can=20
> generate the locales with `localedef -c -i fr_FR -f UTF-8 fr_FR`
>=20
> In the end, I believe this is correct that I have nothing in=20
> {libdir}/locale, but perhaps the settings IMAGE_LINGUAS (or=20
> GLIBC_GENERATE_LOCALES ?) should specify a rdepend to the locale/charmap=
=20
> packages, so the locales would exist in the image, but would not be=20
> generated at build.

The locale generation can happen at build time or it can happen at
first boot on the final target. For the second test case, the locales
will only appear during the boot process.

I've merged your patch with the first test case, thanks! I did tweak
the comment message to match that it is just one test so far. Thanks
for getting us that far, it is great to be adding tests around this.

Cheers,

Richard



