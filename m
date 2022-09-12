Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E455CECAAD5
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 09:43:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.5580.1662975824647593483
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 02:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D/o7czau;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id e18so545175wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=AVBxVUWgyKiBN7+yMx6ycbKE53iSjrawGl3W4DVHNcI=;
        b=D/o7czaufCJS2KsKRR2a9SSw/udq0Um4VCV+NA7UptTfWQOZQFy7B07Abuu/cYGtTU
         uhzxpJha6yDZiwQ7vSUvT8IbUOy2C0zucxBas0Gwxq/sH+5nsGvrzsOfaWhhCJwZT6ZU
         PmxVSJiT/dRoczYM44br55mjsmAFCnk4lNmIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=AVBxVUWgyKiBN7+yMx6ycbKE53iSjrawGl3W4DVHNcI=;
        b=nBZJg8jxmeNi6NwpowdO9qVoguACqqZwblNd740UULV3Cf5cgYPNn9XJ7ce4cd7NSk
         rYRwYHOycukADWN+W6GrLcTWa0qRkppu1fHsGVOPTLHfV64aT9nN/tBGwhEzeKdwKJ1c
         7xbsrJzqrqP09J4SY5wj43rP+uKUF3yHrh1Z7r6Va/C21RlqbJVIJQ02vmCVeTrr9vMZ
         dXE4UHKLaNyZM8ZMZ2Jg/+kal1vRDzdmOoKX8eEeRkl2dpq4aZtykTBVoFMIgIVFY6e0
         KvHjLst8x3X8YgU7OdFwnV/8cDtdlnJks2vSPhEGURmcgCgur/V2X4cH4mve3JxfKinO
         4YUw==
X-Gm-Message-State: ACgBeo3haoyvZvH07NWWx++o949EyrQidSdRu6qvV1OMQojoL17ZQFWz
	+I2aUo73prUtQYK7z7Fapos2Hg==
X-Google-Smtp-Source: 
 AA6agR7bteKxPmIsfGMhfK5uQqdzlxlDExmvgVeVeyV6HMN0qXK9hsPhtNtminNc4cVxlPJvtr5R9w==
X-Received: by 2002:a05:600c:1e24:b0:3b4:6c1e:8bb7 with SMTP id
 ay36-20020a05600c1e2400b003b46c1e8bb7mr7012604wmb.1.1662975822791;
        Mon, 12 Sep 2022 02:43:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e7a0:efc:484a:7ca5?
 ([2001:8b0:aba:5f3c:e7a0:efc:484a:7ca5])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4c42000000b002250c35826dsm6793362wrt.104.2022.09.12.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 02:43:36 -0700 (PDT)
Message-ID: 
 <c36da2945102cf2e0b90562bedcedb83687cc3fd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Cc: schnitzeltony@gmail.com
Date: Mon, 12 Sep 2022 10:43:35 +0100
In-Reply-To: <1713EE7A59F012D9.1776@lists.openembedded.org>
References: <20220909163640.1985612-1-ross.burton@arm.com>
	 <17135317F9CABC3C.4025@lists.openembedded.org>
	 <1713EE7A59F012D9.1776@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 09:43:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170534

On Sun, 2022-09-11 at 23:21 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2022-09-09 at 23:54 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2022-09-09 at 17:36 +0100, Ross Burton wrote:
> > > The KDE build uses custom catalogs by setting XML_CATALOG_FILES, so t=
his
> > > wrapper should not override that value if it has already been set.
> > >=20
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/recipes-core/libxml/libxml2_2.9.14.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipe=
s-core/libxml/libxml2_2.9.14.bb
> > > index 2b2289e38a6..165c92d4114 100644
> > > --- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
> > > +++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> > > @@ -121,7 +121,7 @@ do_install:append:class-native () {
> > >  	# Docs are not needed in the native case
> > >  	rm ${D}${datadir}/gtk-doc -rf
> > > =20
> > > -	create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=3D${sysconfd=
ir}/xml/catalog
> > > +	create_wrapper ${D}${bindir}/xmllint 'XML_CATALOG_FILES=3D${XML_CAT=
ALOG_FILES:-${sysconfdir}/xml/catalog}'
> > >  }
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/5823/=
steps/24/logs/stdio
>=20
>=20
> Dependency on variable XML_CATALOG_FILES:-/media/build1/poky/build-st-282=
284/tmp-sstatesamehash/work/x86_64-linux/libxml2-native/2.9.14-r0/recipe-sy=
sroot-native/etc/xml/catalog was added
> Dependency on Variable XML_CATALOG_FILES:-/media/build1/poky/build-st-282=
284/tmp-sstatesamehash2/work/x86_64-linux/libxml2-native/2.9.14-r0/recipe-s=
ysroot-native/etc/xml/catalog was removed
>=20
> i.e. it is expanding the variable in the keyname!

I tweaked the patch to exclude this variable for now. We probably need
to think a bit more about what bitbake is considering a variable name
though...

Cheers,

Richard

