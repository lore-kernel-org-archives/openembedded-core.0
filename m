Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32505C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 12:05:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.12108.1673006728871946138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 04:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lswty9+2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id t15so1075470wro.9
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 04:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5XE2iafRfFCUAt2Xo0HcgMomH08iGsXbQRrXHuixT+s=;
        b=Lswty9+2DnMlaQiqEMtwq3EgfsvfGFJ2u1mIRZkPoqDZmdJemz2D5LQ9oGvbKQrawU
         IaMbi0N8tlpjct00Ns4p7mH2tjafKgDm891dMCFSbEHuDGyhfQEFEl9DIA6GQkDW32Zd
         mju2BWvTRPt5e3xrb2YEhGns+W+djE4hzTWFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XE2iafRfFCUAt2Xo0HcgMomH08iGsXbQRrXHuixT+s=;
        b=seQIr0XPIvPvpLm1U0/j6winD+U4qRaXJdkb0b84su/GqeC3VnCso1RjeWoC19oQXE
         LlO5te/8kyjOiqhmcuXGtvUYqj+DpsDqmNXYFVEw7YB8hA2zaC9p3lD4WYxhaorWxH9R
         ZLM04pduGJMnuDKjV4+ZMcJlnOkWc596VO6Iw2cOHUN55ql/dD0NYqRVr+rw0WtA8VJL
         hRPpSF9edxDflQK5a0czGk/0z2lkZ03RYcxQ7aRURxKLHmrDbqLY/eGfNVhstdzLxD+s
         FkaAu+Ohkp6ac3rpzJksBNOhblQp79i3TsDxPO+w8949DtIFzmRkzEoPOa9VdrTdsWXb
         K4dg==
X-Gm-Message-State: AFqh2kpg5GyUPqnWelndhFMqrh8xE5vga4hMunusMCRFQEH4bO6izdBy
	Nvp90Pb6I5QPZeXFIl5F0qHRJA==
X-Google-Smtp-Source: AMrXdXuX3lFndkGuZQQyNixHYmNE/zzgQIZkJlOnEImDxoP2kr4iEc7yythPME2mAlz+iC5aJAMkiw==
X-Received: by 2002:a5d:5587:0:b0:288:c07a:bac5 with SMTP id i7-20020a5d5587000000b00288c07abac5mr20767631wrv.49.1673006727050;
        Fri, 06 Jan 2023 04:05:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:49cf:c46d:e32d:e951? ([2001:8b0:aba:5f3c:49cf:c46d:e32d:e951])
        by smtp.gmail.com with ESMTPSA id bj27-20020a0560001e1b00b0023659925b2asm1040562wrb.51.2023.01.06.04.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 04:05:26 -0800 (PST)
Message-ID: <473700d6582fd2575030df7fdbf224d36ed9164b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 12/77] man-pages: upgrade 6.01 -> 6.02
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 06 Jan 2023 12:05:26 +0000
In-Reply-To: <20230104110548.2537259-12-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
	 <20230104110548.2537259-12-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 12:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175578

On Wed, 2023-01-04 at 12:04 +0100, Alexander Kanavin wrote:
> License-Update: readme rewritten, set of licenses provided explicitly.
>=20
> Of those, there's various bsd flavours, gpl2-and-later and gpl-2-only, so=
 add the
> latter.

That does mean I have to ask whether the BSD licenses are missing from
LICENSE and should be added too?

Cheers,

Richard


>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../man-pages/{man-pages_6.01.bb =3D> man-pages_6.02.bb}      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/man-pages/{man-pages_6.01.bb =3D> man-pages=
_6.02.bb} (83%)
>=20
> diff --git a/meta/recipes-extended/man-pages/man-pages_6.01.bb b/meta/rec=
ipes-extended/man-pages/man-pages_6.02.bb
> similarity index 83%
> rename from meta/recipes-extended/man-pages/man-pages_6.01.bb
> rename to meta/recipes-extended/man-pages/man-pages_6.02.bb
> index 1ad4ed1317..2e574e1de4 100644
> --- a/meta/recipes-extended/man-pages/man-pages_6.01.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_6.02.bb
> @@ -2,12 +2,12 @@ SUMMARY =3D "Linux man-pages"
>  DESCRIPTION =3D "The Linux man-pages project documents the Linux kernel =
and C library interfaces that are employed by user programs"
>  SECTION =3D "console/utils"
>  HOMEPAGE =3D "http://www.kernel.org/pub/linux/docs/man-pages"
> -LICENSE =3D "GPL-2.0-or-later"
> +LICENSE =3D "GPL-2.0-or-later & GPL-2.0-only"
> =20
> -LIC_FILES_CHKSUM =3D "file://README;md5=3Dbf1faa9b0245e39a7c0c9690ffdf6e=
54"
> +LIC_FILES_CHKSUM =3D "file://README;md5=3D26901408d8cfd6f6675f8b49daf9cc=
74"
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
> =20
> -SRC_URI[sha256sum] =3D "c1e8bea88589f1a80b67dafd82fb98b018ddd7f7bfa594f8=
f79686258d26e784"
> +SRC_URI[sha256sum] =3D "968def9e7055c9cbca9a4f21f79677b02ac8b0d2fa62ceea=
7bd8ef4dcc6cac41"
> =20
>  inherit manpages
> =20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175398): https://lists.openembedded.org/g/openembedde=
d-core/message/175398
> Mute This Topic: https://lists.openembedded.org/mt/96047880/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ri=
chard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


