Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E925AC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 13:27:47 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.59973.1723123663667853985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 06:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QpRRco30;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3687f91af40so588602f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723123662; x=1723728462; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OzZ+HnS43e7aPZd5uWU2kIR8Z8SGWOj4GiEObrJ3VU=;
        b=QpRRco30z8EmG2IrVf4sO29BrX1a7Z6t1A93z3s0y+UvxHSUSu7nOFkRkkX4AGcB0/
         e8uuNn9kaimWRZWdOdc4DazX2QrR4Z8tVuJcC7R2VGIAWURzZsCwuo+oQgQs8W7NlIvN
         ufFFbuPVh8DhmtZ3kGB0JlmmOh134+ZuuJ+u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723123662; x=1723728462;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OzZ+HnS43e7aPZd5uWU2kIR8Z8SGWOj4GiEObrJ3VU=;
        b=VtwQftJH5LDnC/Rxq7k9Cnm1bzTdx0EUSnzBGTDqyzNQZJhCJ7v7tJyVXuN3vQ0ZCD
         7IVdJiAve/p8ugEhyy0MnQbrI20+NoVFz/DQ1qIxKcWUlvGWtSNOJCDj721rzqbCR8cD
         fcGfCMUeoAuUePxy/VT+fCOkenDV+2wSWYPHr4BFm76nFa8OrWfh7eZRl8Fs+X8eTtNv
         5/o3QLuLeJwE30/mZWDmtcKx7JBY1vy+wLNY8YSQsmXxTAJJmCIUgNUc7AICutlOxf7h
         OzQiTUaylAzQYoIMObQHawWmDRjfG0/BUbTLinEvdj1EgvpYI6OMVY2AxwcRiXObpgRQ
         hSWg==
X-Forwarded-Encrypted: i=1; AJvYcCUxhwOdjUfN5xVwGcbM5nqPAA4CPpX4np6tzNVU3tPmzyav3DmbXwa8WAkp58hs6VARJgUw1pmen6LWb/RTb3ZFjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwNBK4gF0ISLyl6Lv2potVsgRquiHa75SG7rRlXDjh1+kRN4wg1
	IDfRmenMbd8gh3Vx4HUJm3KvMmKqWRWVdqeQdfgZH0t9NbfrOknkEJCDoYYkazI=
X-Google-Smtp-Source: AGHT+IEeuwDz70TYkf+W3cFNTU42TfLJxE/2jrpLt0N6/mnw4JX6Cu87EGOKc/mC8t6BOWJ6nw00Dw==
X-Received: by 2002:adf:e8c1:0:b0:368:3f5b:2ae4 with SMTP id ffacd0b85a97d-36d274ee3c7mr1314384f8f.36.1723123661944;
        Thu, 08 Aug 2024 06:27:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:43bd:e590:a93b:4c51? ([2001:8b0:aba:5f3c:43bd:e590:a93b:4c51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm1956041f8f.25.2024.08.08.06.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 06:27:41 -0700 (PDT)
Message-ID: <f5369479504970df6863b80f3e808b69bbd09f47.camel@linuxfoundation.org>
Subject: Re: [OE-core] [V2][master][PATCH] libcap-ng: update SRC_URI
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org, 
	alex@linutronix.de
Date: Thu, 08 Aug 2024 14:27:40 +0100
In-Reply-To: <20240808081754.809770-1-changqing.li@windriver.com>
References: <20240808081754.809770-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 13:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203138

On Thu, 2024-08-08 at 16:17 +0800, Changqing Li via lists.openembedded.org =
wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Refer [1], people.redhat.com has certificate issue, so update SRC_URI
> to fix do_fetch warning
>=20
> [1] https://github.com/stevegrubb/libcap-ng/issues/56
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0meta/recipes-support/libcap-ng/libcap-ng.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 6 +++---
> =C2=A0meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb | 4 ++++
> =C2=A02 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-=
support/libcap-ng/libcap-ng.inc
> index 85b51c4dc6..6549bce006 100644
> --- a/meta/recipes-support/libcap-ng/libcap-ng.inc
> +++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
> @@ -7,11 +7,11 @@ LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df0=
79bae19f=C2=A0\
> =C2=A0		=C2=A0=C2=A0=C2=A0 file://COPYING.LIB;md5=3De3eda01d9815f8d24aae2=
dbd89b68b06"
> =C2=A0
> -SRC_URI =3D "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.=
tar.gz=C2=A0\
> +SRC_URI =3D "git://github.com/stevegrubb/libcap-ng.git;protocol=3Dhttps;=
branch=3Dmaster \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-Fix-python-path-when-invoking-py-compile-54.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> -
> -SRC_URI[sha256sum] =3D "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185=
dfd844cc8c7ac6ff"
> +SRCREV =3D "f5d39702622208b3ada064d7b2eaeaf1454c9bd3"
> +S =3D "${WORKDIR}/git"
> =C2=A0
> =C2=A0inherit lib_package autotools
> =C2=A0
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb b/meta/rec=
ipes-support/libcap-ng/libcap-ng_0.8.5.bb
> index b482368a41..26899296e3 100644
> --- a/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
> +++ b/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
> @@ -4,6 +4,10 @@ EXTRA_OECONF +=3D "--without-python3"
> =C2=A0
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
> =C2=A0
> +do_configure:prepend() {
> +=C2=A0=C2=A0=C2=A0 touch ${S}/NEWS
> +}
> +
> =C2=A0do_install:append() {
> =C2=A0	# Moving libcap-ng to base_libdir
> =C2=A0	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>=20

This breaks libcap-ng-python:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9370/step=
s/11/logs/stdio

Cheers,

Richard




