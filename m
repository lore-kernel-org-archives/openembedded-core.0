Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2A1C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 20:49:43 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.6815.1706820581981383393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 12:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Grb3Tcbd;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2144c37f3d3so777327fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 12:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706820581; x=1707425381; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Pb6/5IltHcgV+q8x+BZD5AuvAAzvxGreLU0u1nTq6A=;
        b=Grb3TcbdJ07VjfSL3RXTUZBDOT2gi2Oy1IP6Hhd6yqBb0NOz9Ok94aKjA9/HvflSMt
         hTSVFYprE/IZcyRvNUw70nXx3vrah1uuItAZddtyFiABr+X6sZtC5BlCMXmGcgDz9ygD
         QrwGC8F+rj9diBHLOCL4tbZ6ipI4VXfpG0hdcDf5jGNCWy+CnvrbOV9vFlG51tzZAbXP
         xJlB9/l9EK4XxJ1YdUpfd2mA6LHeyCaVOojTmI0IhjvI6Mub+UH6RIy9pkNqN1yHpZrS
         zPOAzJLtpNHOIN0cfCE8qt/eKywM5mO4h7OkcJ/nbARgwQdE6/ZAEOQqWGbkil8735R9
         G7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706820581; x=1707425381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Pb6/5IltHcgV+q8x+BZD5AuvAAzvxGreLU0u1nTq6A=;
        b=okdUmD4kyvxG063Ehj5yLBLfje1S2KpyUrmD5k0bPdfNdg2BQre+d6AOXkBW0icWt6
         D6PzTvipDaVemyFFg7lVc+m4bcFhMrmcfQAF3hbf8laIeu9fN/PC34cPjFhgss0qua+V
         0pHG4QGIfpO4NzBOGzytl06fqrqrzou3/bRr+GdqeTF+Hn/D4RSc9K2gHPxrERoVPG5F
         BbO1fwSnPLXSmnsPFXtXiqdTsqWxstU6BtXzHNSenyYnKx1TrsUkC533DxpPo3THxwsu
         Gw8BB8GrytwRM+zRcKI3c0i4OQ4wtqqgvqEyfHkYDhqCgh8zf3QgNaaIQwQZ7rkShFGy
         GzCQ==
X-Gm-Message-State: AOJu0YzESyZGLqTon2bqTH6LCuABtRG6Ii/sqng6tMKTN/LzR2UFQyX3
	EevhUUbrgUOxp6XO19j2/0FNQbHJG6IhKCRWiydsoXvpRWZMyn9Ll6sOeFR+H70ReG0S+aAwhcl
	JtFG8GNyoqCt/AvwnkUWt6HVsKZK3Jv202pw=
X-Google-Smtp-Source: AGHT+IGNTS03fx0i5od5zcgcwiMzaN2/Hbo2PYbTaD5ilYuXYNaksSTDzE9YgCT8FkPRaeChJ9WYvbmwOh/7gtWgyN0=
X-Received: by 2002:a05:6870:cd13:b0:206:a798:8d88 with SMTP id
 qk19-20020a056870cd1300b00206a7988d88mr6718517oab.29.1706820581108; Thu, 01
 Feb 2024 12:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20240201174553.77294-1-jon.mason@arm.com>
In-Reply-To: <20240201174553.77294-1-jon.mason@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Feb 2024 12:49:15 -0800
Message-ID: <CAMKF1sqF-kbjjoz-4PQsB-dmTjyUmtV=9o2zxck_M+UE8ruQ8w@mail.gmail.com>
Subject: Re: [OE-core] [master-next PATCH] armv8-2a/tune-neoversen1: remove
 march usage
To: Jon Mason <jon.mason@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 20:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194751

lgtm.

On Thu, Feb 1, 2024 at 9:45=E2=80=AFAM Jon Mason <jon.mason@arm.com> wrote:
>
> OE-Core commit 54dfbfa3643a9656d8d3c2265817e96ab66bdca5 missed updating t=
his file
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc b=
/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
> index 9d181ef4d5dd..55f054713fa5 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
> @@ -12,6 +12,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES                                         +=3D "neoversen1"
>  ARMPKGARCH:tune-neoversen1                          =3D "neoversen1"
> -TUNE_FEATURES:tune-neoversen1                       =3D "${TUNE_FEATURES=
:tune-armv8-2a-crypto} neoversen1"
> +TUNE_FEATURES:tune-neoversen1                       =3D "aarch64 crypto =
neoversen1"
>  PACKAGE_EXTRA_ARCHS:tune-neoversen1                 =3D "${PACKAGE_EXTRA=
_ARCHS:tune-armv8-2a-crypto} neoversen1"
>  BASE_LIB:tune-neoversen1                            =3D "lib64"
> --
> 2.39.3 (Apple Git-145)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194597): https://lists.openembedded.org/g/openembedde=
d-core/message/194597
> Mute This Topic: https://lists.openembedded.org/mt/104102575/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

