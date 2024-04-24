Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E04C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 16:43:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.1547.1713977015677112745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 09:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KOOdyGPW;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-345522f7c32so5587f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713977014; x=1714581814; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81/JqgyFkdIYn0Xke2vXTdNqtqSUwnLACoEePKzbUMY=;
        b=KOOdyGPW6xRPXWBXRZgH4FcXHVuow5pZ5e7xvnSH5q9hZuqja8ue/GF2Lm6eWnouaQ
         d31pQVm0qCcuEVShqdsh06a6NpwV52veixF6ajPFwOM1eK7bxPlV41TC9p4vPF/CQ+Hr
         VNWvioactbBWQWhnbhGD00+O4plPmaQzGzZa1Yze6ZS34ituutL4UzQdXEpqIvkAm+Jk
         V+npKE2FV9FYhnfkXQ9K1pVyTMTsDqhxMjCZDmAXfuYdd6YZkMsAkZF1lOYGBHSIGWLt
         n23nza2XqXqEpBDjn/lYmGVg6DHOw2pLfbRBztLhaosTw9G1nbkvCsPJhNl/JSMavO3B
         xtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713977014; x=1714581814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81/JqgyFkdIYn0Xke2vXTdNqtqSUwnLACoEePKzbUMY=;
        b=wmmy4UWNkSttaFQ94noGNkAaKZfcAxWXYOkacB60wGrAlIi0kp1mkQmUXQfeALkWCu
         HMyIANyjh7g081+fV0O3mBBgraH7LyMizclv6K+rFW/v7ZCMVsOn1kY9CYew+P6VtOvX
         d5I20qBdTw/K1MyJjceLPbDqizhrZuP6qONOMuap6J2mLkov71T/ttVCEJ42tTkl1kqm
         w85AFEs53g5KFiNn8kVrYbHQZEm3TlUDtEZOrNtJCib9c9VNIlAWQAGfWq+/zxOf5HyU
         /KO7ADI4ygOBACIip1YJoYNdrveF1j+M1J158tu/5Xa9byvb/AQXWoNpmukgjYsHAbvp
         mSTQ==
X-Gm-Message-State: AOJu0YyAvfxQZHMJ271IeNeMLBc2AIMQazRzSQdj97OivjogQcP81RW1
	qqcsx0JQH8eCS2ve2z0D25UaB+nPINTc7iPk98o4fKv0kPqtfubLr0JkhVIRP3v9KLEZxs8MJmW
	rX5Ufmzc6fz786GdufCrX1RkPNXU=
X-Google-Smtp-Source: AGHT+IH4mmHy6mvtNZ0KfSsN1WYqIFUETrCrkauLyHBMYNxijLGHqHmhTV4rbxfWPEHufSnzJY+keLI/0qo917eZVdk=
X-Received: by 2002:a5d:6585:0:b0:34b:3fd7:5f6f with SMTP id
 q5-20020a5d6585000000b0034b3fd75f6fmr1964433wru.0.1713977013855; Wed, 24 Apr
 2024 09:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <hF7u.1713976861889896557.dNAi@lists.openembedded.org>
In-Reply-To: <hF7u.1713976861889896557.dNAi@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Apr 2024 18:43:21 +0200
Message-ID: <CA+chaQf4UNbB_1XD4PHMGA2-P-xFXSFOCRTEBu1o+rSbBU7k=g@mail.gmail.com>
Subject: Re: [OE-core] Pseudo Abort due to path mismatch #pseudo #kirkstone
To: lukas.palme@swarco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 16:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198690

Don't use:
S =3D "${WORKDIR}"

move it to separate directory and it will work fine.

On Wed, Apr 24, 2024 at 6:41=E2=80=AFPM lukas.palme via lists.openembedded.=
org
<lukas.palme=3Dswarco.com@lists.openembedded.org> wrote:
>
> Hello openembedded community!
>
> I hope this is the right place to ask this question, https://wiki.yoctopr=
oject.org/wiki/Pseudo_Abort brought me here.
>
> I have a custom recipe which builds fine on the first build, but fails on=
 subsequent builds in the do_install step:
>
> ERROR: Task (/home/swarco/WindriverLinux22/build/../layers/meta-swarco/me=
ta-vega/recipes-kernel/mymodule/mymodule.bb:do_install) failed with exit co=
de '1'
> Pseudo log:
> path mismatch [3 links]: ino 78038 db '/home/swarco/WindriverLinux22/buil=
d/tmp-glibc/work/vegamx8-wrs-linux/mymodule/1.0-r0/package/usr/src/debug/my=
module/1.0-r0/mymodule_public.h' req '/home/swarco/WindriverLinux22/build/t=
mp-glibc/work/vegamx8-wrs-linux/mymodule/1.0-r0/mymodule_public.h'.
> Setup complete, sending SIGUSR1 to pid 12937.
>
> Yocto is the only one touching the files in between builds. Also the file=
s questioned do exist with the noted inode:
>
> swarco@SWFPERWKS065:~/WindriverLinux22$ stat /home/swarco/WindriverLinux2=
2/build/tmp-glibc/work/vegamx8-wrs-linux/mymodule/1.0-r0/package/usr/src/de=
bug/mymodule/1.0-r0/mymodule_public.h
>   File: /home/swarco/WindriverLinux22/build/tmp-glibc/work/vegamx8-wrs-li=
nux/mymodule/1.0-r0/package/usr/src/debug/mymodule/1.0-r0/mymodule_public.h
>   Size: 3146            Blocks: 8          IO Block: 4096   regular file
> Device: 820h/2080d      Inode: 78038       Links: 3
> Access: (0644/-rw-r--r--)  Uid: ( 1000/   swarco)   Gid: ( 1000/   swarco=
)
> Access: 2024-04-24 18:17:21.182513722 +0200
> Modify: 2024-04-24 18:16:50.402199580 +0200
> Change: 2024-04-24 18:17:19.432495797 +0200
>  Birth: 2024-04-24 18:11:59.419201062 +0200
>
> swarco@SWFPERWKS065:~/WindriverLinux22$ stat /home/swarco/WindriverLinux2=
2/build/tmp-glibc/work/vegamx8-wrs-linux/mymodule/1.0-r0/mymodule_public.h =
 File: /home/swarco/WindriverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux=
/mymodule/1.0-r0/mymodule_public.h
>   Size: 3146            Blocks: 8          IO Block: 4096   regular file
> Device: 820h/2080d      Inode: 78038       Links: 3
> Access: (0644/-rw-r--r--)  Uid: ( 1000/   swarco)   Gid: ( 1000/   swarco=
)
> Access: 2024-04-24 18:17:21.182513722 +0200
> Modify: 2024-04-24 18:16:50.402199580 +0200
> Change: 2024-04-24 18:17:19.432495797 +0200
>  Birth: 2024-04-24 18:11:59.419201062 +0200
>
> This is the recipe mymodule.bb:
>
> SUMMARY =3D "mymodule"
> DESCRIPTION =3D "Recipe for building a mymodule Linux kernel module"
> LICENSE =3D "GPL-2.0-only"
> LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801=
f80980d171dd6425610833a22dbe6"
>
> inherit module
>
> SRC_URI =3D "file://Makefile \
>            file://mymodule_core.c \
>            file://mymodule.h \
>            file://mymodule_public.h \
>            file://mymodule_remote_public.h \
>           "
>
> S =3D "${WORKDIR}"
>
> do_install:append() {
>     install -d ${D}${includedir}
>     install -m 0755 ${S}/mymodule_public.h ${D}${includedir}/
> }
> # The inherit of module.bbclass will automatically name module packages w=
ith
> # "kernel-module-" prefix as required by the oe-core build environment.
>
> RPROVIDES:${PN} +=3D "kernel-module-mymodule"
> FILES:${PN}-dev +=3D "${includedir}/*"
>
> I am doing nothing unusual here.
>
> Additional notes to my setup:
>
> Host machine: Ubuntu 22.04 on WSL
> Linux kernel: linux-imx (NXP)
>
> Does someone have an idea what is happening here? Any help is appreciated=
!
>
> Kind regards,
>
> Lukas Palme
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198689): https://lists.openembedded.org/g/openembedde=
d-core/message/198689
> Mute This Topic: https://lists.openembedded.org/mt/105713810/3617156
> Mute #pseudo:https://lists.openembedded.org/g/openembedded-core/mutehasht=
ag/pseudo
> Mute #kirkstone:https://lists.openembedded.org/g/openembedded-core/muteha=
shtag/kirkstone
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

