Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3E6C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 17:24:47 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.18214.1707499478210533419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 09:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lC+0qyH0;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-219452bdf81so635801fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707499477; x=1708104277; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nasEEtHLg2DrUHbe1ewwCM/2Xqr76jYNo210a6kmqV4=;
        b=lC+0qyH0VzCFe6dZq7E3afzeQrKTkmYevND09OyoyNC+Dv4HkRrwrys13pFePnkhEt
         YRWndnAVUeW6VRyQUV2g6JKcdkQRyGo5xH8yZ7R2viSnaPhgYVQAHvUBSYvskfJFoAlW
         4dGc5LDRHNwujNlyjKnMnV092Ew07FsdDeTeVBOtCcI8zOnCYf2c6tNuQdf8QyNke4vE
         3d/Ila/7OqMspJF5UBkPlVTThQKdAGk8+31xINCzwLNlW/vG7vlnPQkxB375amjbPLUv
         w6ZzF2sd8jD8+Ud1of1v49unnnmyloh50HWK+N97bMvks36zvJdML3nvGvKzw1xJ7tSn
         2IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707499477; x=1708104277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nasEEtHLg2DrUHbe1ewwCM/2Xqr76jYNo210a6kmqV4=;
        b=mXCBKj2SLqlxEFEhelFiBkdNMzOi7CRPNiJj0GG8l02YVOchG59F9oPR9oIDYMS0C3
         rODr6lVkL5UI70okdu+iSY/5w+YjEnOIYRMP4CRFvVnA8CiQnDDAMwyI3gmylxctOnLu
         EAZh92Fo+Sbxx8GIjoEtHW9yJpT6y1vBj7C5WEfOdtJBpZjeiMvIsmbp55ErSmRYP1E5
         zq4tkpRW7QsKgCEUqEwzJeGTH15j0L4tQN7AvePboy/H7sJ9oziPk22y5TTOZNJ4OOc/
         drWy68Un3RCvMSzkOop50IE7BrfZ752nubRpQxpovm4qw9zt6W2MqwoH5W4pXEUiYhua
         VQ9g==
X-Gm-Message-State: AOJu0YyVPLhU7yq3T6IHPfzbOGa+RgSxvtco+vBN35jXdjhSDMYJCiQM
	cijQ1WQD2xZog5NjGmokXKn4lY5KdGJsjR15whg1AtiSKmMZVWneMbWuw88XefrtKqOCzSFBNy3
	Vu8Av+LZVJVv3PPA2+WSjklKe/j0=
X-Google-Smtp-Source: AGHT+IERpcV+aV05bXg8wNBHdzUFmaBfiM49mgXND30UdFfmHejvNs2TOrGvrenKNClz95+PcqLN4OYz+e6tWBeQkO4=
X-Received: by 2002:a05:6870:b28a:b0:219:9845:4f7c with SMTP id
 c10-20020a056870b28a00b0021998454f7cmr2499263oao.47.1707499477375; Fri, 09
 Feb 2024 09:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20240208185641.2969396-1-alex@linutronix.de>
In-Reply-To: <20240208185641.2969396-1-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Feb 2024 09:24:11 -0800
Message-ID: <CAMKF1sr8rx9Mcm40KCFJxu1S5546tQGD=d8ox1Kh74uKScFk1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 17:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195237

On Thu, Feb 8, 2024 at 10:56=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This was causing host contamination in particular, where
> libsystemd was installed on the host.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-extended/shadow/shadow.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
> index b8e5e285c45..16b99a0b60e 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -74,6 +74,7 @@ PACKAGECONFIG[acl] =3D "--with-acl,--without-acl,acl"
>  PACKAGECONFIG[audit] =3D "--with-audit,--without-audit,audit"
>  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux =
libsemanage"
>  PACKAGECONFIG[libbsd] =3D "--with-libbsd,--without-libbsd,libbsd"
> +PACKAGECONFIG[logind] =3D "--enable-logind,--disable-logind,systemd"
>

have we tried it with systemd in distro features ? In my distro
settings its causing a dependency loop. see
https://snips.sh/f/GkrM4zsDk1

>  RDEPENDS:${PN} =3D "shadow-securetty \
>                    base-passwd \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195172): https://lists.openembedded.org/g/openembedde=
d-core/message/195172
> Mute This Topic: https://lists.openembedded.org/mt/104244839/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

