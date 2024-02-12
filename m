Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5704EC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 06:59:17 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.1629.1707721151604575626
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 22:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EBVo5bPm;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bfe59bd1abso1467465b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 22:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707721150; x=1708325950; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNeGnUW+JMUmWE0rmmV9+EIe0rMBCW7z/3MPB/Lxuvc=;
        b=EBVo5bPm5lT5FcQ9fydBcmexvCMyCJBeiZudk8az/gE3V+7CIZm9woc6p9vsal8tYX
         kcEJY0V+SRe/Xi9HOdD5sDOmGudl/BraVUZGCRz49l7/HagMWBgZiGoHh0Rhqt//SIG3
         qsMaJ8SuasitMd+iQMkWklQf4QpS6UtrPZncqmURikWuxElECnGwpKWvmbQheDULIElU
         CAj0hedOTGdZtJ8cfDpeeilR6Cq39ktZa9O2W5rGG/v8rqdM1CZ7uIDJn/HkrSQmUf4s
         JiVOIPwrXjiCLrqByNb4ogkBj8aea7Fp/WeoY9QY04rt9RPighk11/J9of+vzrAQchPM
         gFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707721150; x=1708325950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNeGnUW+JMUmWE0rmmV9+EIe0rMBCW7z/3MPB/Lxuvc=;
        b=ZRLSq7ynuuUisXdR8ZaSSK7V2Nag764RLYS5R7laqYNYsb8rpe0h+YjYTi8T0cqnW3
         UYvTpz9SCKoCdcaObto8jW9SdQbjl8Yw1XwsHFU7q2p8LNxShftstohxH3uWrixWSjgW
         b10rBKhy1H5e1UnPOt/HqajOIqjTCFVBaUF3XEAY7KgN2Ff0BjaW75sTTrLcIlGk5iN1
         SAE24vAkEqXMGr/eogCXF0Eld+z7J/mUtCbZRzGpmLT+d5V0WwUapugQiOpC9UplUqp0
         Q5KlTWkltwQy6tOfbN+c2CPpv2jM4sfodWnvLGKFNo+WoH08/h4TJdYsemWwI3fIaPeb
         toaQ==
X-Gm-Message-State: AOJu0YyBmnyZKSbK6JuuUkIbX+zeLbmF7RzFWzVUaIGtCidrvha3QviT
	76HSbksDzSoQ2oMpMGYEeTN5T1USXx8mNdeZ6wR+QMZ1qgWR48RbZGadH6NNGPn3g8nIpROEJmk
	0QRLMhQH5D/WSvrvoNr3X9J6VrFKXQ5Af885XOA==
X-Google-Smtp-Source: AGHT+IFHMR3XgFLCQKR0BPP/12TYNTIoP5rnahYBuZIOi0jiUhc1jFyYqB4Qu0LJuzoaFEDG634fn61QhNvM4GYoxTk=
X-Received: by 2002:a05:6870:104b:b0:21a:492f:6d06 with SMTP id
 11-20020a056870104b00b0021a492f6d06mr4192587oaj.51.1707721150415; Sun, 11 Feb
 2024 22:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20240208084406.3621627-1-michael.opdenacker@bootlin.com> <20240208084406.3621627-3-michael.opdenacker@bootlin.com>
In-Reply-To: <20240208084406.3621627-3-michael.opdenacker@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Feb 2024 22:58:44 -0800
Message-ID: <CAMKF1sph=Yz=x8hhykVZqfZOC-ij3LA-cn6U7p8FTDAkrk+fBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/4] alsa-tools: upgrade 1.2.5 -> 1.2.11
To: michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 06:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195302

FYI this fails to build with clang compiler
https://errors.yoctoproject.org/Errors/Details/752555/

On Thu, Feb 8, 2024 at 12:44=E2=80=AFAM Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=3Dbootlin.com@lists.openembedded.org> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> - Upstream release update
>   See https://www.alsa-project.org/wiki/Detailed_changes_v1.2.10_v1.2.11
>
> ---
>
> Changes in V2:
> - Fix commit title, correcting updated version for alsa-tools
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  .../alsa/{alsa-tools_1.2.5.bb =3D> alsa-tools_1.2.11.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.5.bb =3D> alsa-tools=
_1.2.11.bb} (97%)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb b/meta/reci=
pes-multimedia/alsa/alsa-tools_1.2.11.bb
> similarity index 97%
> rename from meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
> rename to meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
> index 56acc84559..53868041c0 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D5=
9530bdf33659b29e73d4adb9f9f65
>
>  SRC_URI =3D "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
>
> -SRC_URI[sha256sum] =3D "35a71027a01f4d7de4722e223520e940de68b3c570b6c671=
691567ae28f9893e"
> +SRC_URI[sha256sum] =3D "0915c9634a502fd3655ca9c574d259bc9e79983d91d45aea=
cff6f3c00f8ae3e9"
>
>  inherit autotools-brokensep pkgconfig
>  # brokensep as as10k1 (and probably more) fail out of tree
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195116): https://lists.openembedded.org/g/openembedde=
d-core/message/195116
> Mute This Topic: https://lists.openembedded.org/mt/104235728/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

