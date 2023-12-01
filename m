Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4376C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 18:54:19 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.939.1701456854680206300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 10:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IluzZGlj;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9beb865a40so812703276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 10:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701456854; x=1702061654; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKm7SX+CQh2T2KylHn8zt2ihTXy/oG012CNCnxewWyk=;
        b=IluzZGlj/KCbo7lOTKNLJz8Tny7C1PwioIRdOrf85DG+5tIoDw4WuuVUzfXrxx+y9L
         DW8Gt1+2TYKuuOs1xdj8CJWmHt5HXGLj6SnUkuftBQbPUZmOCcD6aqQGHzGBWdxOdl29
         nlDA7FCRvv7uxVK22kVgwngM6NkmigPvEptedWmOghAyDf+wEIHuJ9ixZhxGN5UOWXdb
         ry4OXyLbnyFyFNhzRHL/oJVRjMXEr62K20+pEoW9m6ukhaTmw3EF2mqx+/QTLhS9mbbF
         Vmp8TsD6Rgl7qzX9h+EtFvemMiUuY/c8yvTjAi9CpOK8auk/2Ebuk14Sfm4aO5JV0+jg
         P5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701456854; x=1702061654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKm7SX+CQh2T2KylHn8zt2ihTXy/oG012CNCnxewWyk=;
        b=pnWBjs+Y4RdZ2NGth9JnGHh54Rmtr6mIKzaGoQe21/8wHUM+nImzyfULT16IOCdjv4
         2lQjGCaY3xvj+sq7Fk9LjlH0bZYuk141eMsYI0OWHG9sZLLsKbvFLERWG8o8CV3gQGEm
         hqvo/lJfKbMs0MPIbWJsleBruGdQqEfJWHVEhS2V/UoZqG1E8ridP2fbR8PbXynXfCjn
         SntCv5szxa4i1/ZtXHTPTd6SApiZ/+kQT1y580E2ODZ4DXSjNOV/HkSZTAEkNKaBUm0f
         wkLXfVqX1KLg82kuVLTAOBfP3DMcrGCHKFjIHgRyQvwI8NQHS4ditUUqQ3RLdDcI+whI
         7n6g==
X-Gm-Message-State: AOJu0Yzi4rN1IlwL0/XVRIt0KlabTGHLQw5kSqsmPK0j6oyFX7KbX+Qg
	vG87X4n0Rn11iVyGtlNGOlMZrQyYBl6q8hr80ouz0mod
X-Google-Smtp-Source: AGHT+IGIok6YHKS+p0De+lFsDo5rFj/AT8DMoLSbXXweu7biyry7auR33Cc0I09bg23eWbJ2Jd6aiHYe2+Urpd1ytGA=
X-Received: by 2002:a05:6871:aa07:b0:1fa:1579:906 with SMTP id
 wq7-20020a056871aa0700b001fa15790906mr10723oab.12.1701456829896; Fri, 01 Dec
 2023 10:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20231201140947.792594-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20231201140947.792594-1-xiangyu.chen@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2023 10:53:23 -0800
Message-ID: <CAMKF1spO26_0T5i7npXaekipmO16geFyjsmXgR+OL0LE23WvPQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] openssh: shrinking to a new PACKAGECONFIG line
 to set systemd readiness notification support
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 18:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191685

On Fri, Dec 1, 2023 at 6:14=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Using PACKAGECONFIG line to set the patch of systemd readiness notificati=
on
> support, it can make the .bb file more clearly.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_9.5p1.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.5p1.bb
> index bbb8fb091a..2c1c821ea9 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> @@ -53,13 +53,13 @@ SYSTEMD_PACKAGES =3D "${PN}-sshd"
>  SYSTEMD_SERVICE:${PN}-sshd =3D "sshd.socket sshd.service"
>
>  inherit autotools-brokensep ptest pkgconfig
> -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'system=
d', '', d)}"
>
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"

This makes sense if someone would like to disable systemd support when
using systemd init system
which does not seem very likely. Is there anything else other than
cleanup that you are targeting with it ?
If so, I think the status quo is better.

>  PACKAGECONFIG[kerberos] =3D "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] =3D "--with-ldns,--without-ldns,ldns"
>  PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] =3D "--with-mantype=3Dman,--with-mantype=3Dcat"
> +PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
>
>  EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
>
> @@ -71,7 +71,6 @@ EXTRA_OECONF =3D "'LOGIN_PROGRAM=3D${base_bindir}/login=
' \
>                  --sysconfdir=3D${sysconfdir}/ssh \
>                  --with-xauth=3D${bindir}/xauth \
>                  --disable-strip \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--wi=
th-systemd', '--without-systemd', d)} \
>                  "
>
>  # musl doesn't implement wtmp/utmp and logwtmp
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191666): https://lists.openembedded.org/g/openembedde=
d-core/message/191666
> Mute This Topic: https://lists.openembedded.org/mt/102915607/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

