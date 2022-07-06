Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CC4C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 21:55:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.543.1657144517034016991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KI/LRj4p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so12331714wmp.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=zGTPt/9Ofu39qOzpq06KM798039gAtFyO3dyWJClYu8=;
        b=KI/LRj4pTlbaztm9HCfsWH3pVTvgYTH1+YebGBLUPqcpYXRLx3RPuIpaGU7uxhNDEj
         KtZgyvelyoFScS6VSe7+GbEXl+PMeu0QKUrT2Pcm3Md00pYzsbtvAB4cAFIF/CScoAWN
         n9Q//rjM8PHzejgbNwXDK0lNYa4D4FoXNSWgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=zGTPt/9Ofu39qOzpq06KM798039gAtFyO3dyWJClYu8=;
        b=SDtubs1hs9as6OnWZ/45fTTRMXPYcxTZEt5KP3t2tJf8jQAlfFF/JXLoS/pxwGNcK7
         z4sQ0z5s4ESHNxOLdaXeLjXJrbPrtRKbd6XGZMPV8nyH33wzMQ7dJ9kLUfCkpVI4H44G
         +Eg/TzHt1/U+2BB1JvA+QlxTmPsPiK1+riVXLtjhachz1f74FhzXyrNo7EuOBgL6QTFD
         VIjLM1+cv1JRWDQoTyaaLk4FHxbzGU2cdhn4yJbd4wtOZDV5h+a9Hm+rHJH88fxlsfm/
         1Xa9alxM1YUaNAswj5dH01So8j3eZJlQ8kM+tyAAZEZBfu04IekStLcL4DtarvtAhGhQ
         tmMw==
X-Gm-Message-State: AJIora8PEsORQ2FE1uT7pA2gOgaIp1TX/I+B7h4TRZI9xg1U5NFo6CKL
	6pqw66izgs3tpfEsgXpGZKldyA==
X-Google-Smtp-Source: 
 AGRyM1vn4b5z5v9jtJSWtfm3+SOCIcJbgoGzpb993089R+MRaYMyMT+Uf0IXdMmNxRKlNL4s9AHHMQ==
X-Received: by 2002:a1c:19c3:0:b0:39c:6479:3ca with SMTP id
 186-20020a1c19c3000000b0039c647903camr703780wmz.27.1657144515401;
        Wed, 06 Jul 2022 14:55:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e441:58cf:44fd:9058?
 ([2001:8b0:aba:5f3c:e441:58cf:44fd:9058])
        by smtp.gmail.com with ESMTPSA id
 18-20020a05600c269200b003a03a8475bfsm22301447wmt.16.2022.07.06.14.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 14:55:14 -0700 (PDT)
Message-ID: 
 <b5eac423b7c585b5677ddffdcccd206f27af778f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] icon-naming-utils: Resurrect for
 sato-icon-theme
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 06 Jul 2022 22:55:14 +0100
In-Reply-To: <YsX57oc+zIEpZl4h@mail.local>
References: <20220706131642.1011068-1-richard.purdie@linuxfoundation.org>
	 <YsX57oc+zIEpZl4h@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 21:55:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167752

On Wed, 2022-07-06 at 23:09 +0200, Alexandre Belloni wrote:
> Hello Richard,
>=20
> On 06/07/2022 14:16:41+0100, Richard Purdie wrote:
> > To add back sato-icon-theme we need this small util.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 +
> >  .../icon-naming-utils_0.8.90.bb               | 28 +++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 meta/recipes-sato/sato-icon-theme/icon-naming-utils=
_0.8.90.bb
> >=20
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distr=
o/include/maintainers.inc
> > index 18b0624af72..c55b2a09cf9 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -261,6 +261,7 @@ RECIPE_MAINTAINER:pn-hicolor-icon-theme =3D "Anuj M=
ittal <anuj.mittal@intel.com>"
> >  RECIPE_MAINTAINER:pn-hwlatdetect =3D "Alexander Kanavin <alex.kanavin@=
gmail.com>"
> >  RECIPE_MAINTAINER:pn-i2c-tools =3D "Anuj Mittal <anuj.mittal@intel.com=
>"
> >  RECIPE_MAINTAINER:pn-icecc-create-env =3D "Joshua Watt <JPEWhacker@gma=
il.com>"
> > +RECIPE_MAINTAINER:pn-icon-naming-utils =3D "Richard Purdie <richard.pu=
rdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER:pn-icu =3D "Alexander Kanavin <alex.kanavin@gmail.co=
m>"
> >  RECIPE_MAINTAINER:pn-ifupdown =3D "Anuj Mittal <anuj.mittal@intel.com>=
"
> >  RECIPE_MAINTAINER:pn-igt-gpu-tools =3D "Anuj Mittal <anuj.mittal@intel=
.com>"
> > diff --git a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90=
.bb b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
> > new file mode 100644
> > index 00000000000..bde265f64fe
> > --- /dev/null
> > +++ b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY =3D "Enables backwards compatibility with current desktop icon=
 themes"
> > +DESCRIPTION =3D "A Perl script used for maintaining backwards \
> > +compatibility with current desktop icon themes, while migrating to the=
 \
> > +names specified in the Icon Naming Specification. The Icon Naming \
> > +Utilities map the icon names used by the GNOME and KDE desktops to the=
 \
> > +icon names proposed in the Icon Naming Specification, and generate the=
 \
> > +icon files appropriate to the desktop environment you use. The Icon \
> > +Naming Specification provides a standard list of common icon contexts =
\
> > +and names that can be used to make icon themes work in a desktop \
> > +environment or application that implements the naming specification. "
> I believe you are missing HOMEPAGE here
>=20
> > +LICENSE =3D "GPLv2"
>=20
> This warns:
> icon-naming-utils-0.8.90-r0 do_package_qa: QA Issue: Recipe LICENSE inclu=
des obsolete licenses GPLv2 [obsolete-license]
>=20
> > +DEPENDS =3D "libxml-simple-perl-native"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> > +
> > +SRC_URI =3D "http://tango.freedesktop.org/releases/icon-naming-utils-$=
{PV}.tar.gz"
> > +SRC_URI[sha256sum] =3D "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028=
c0a7cdcf52a5902e1c"
> > +
> > +inherit autotools allarch perlnative
> > +
>=20
> Finally, I believe this is also the cause of the
> sstatetests.SStateTests.test_sstate_allarch_samesigs failure in
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3786/st=
eps/15/logs/stdio

Sorry about those issues, v2 sent of both patches.

Cheers,

Richard

