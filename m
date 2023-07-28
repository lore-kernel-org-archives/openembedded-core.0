Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCF8C001E0
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 16:43:28 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.37105.1690562599543279497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 09:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ObJuGAMg;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5636426c1b3so1567465eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690562599; x=1691167399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMYet5Mt/0ixLMQn9TibfPwhyuRMy0WklKnV3QSTEvQ=;
        b=ObJuGAMgjrNE/hGT3Dd3XODqNTPHXFeYLsgaWP1CPM+XVatQdrf4MEva5IqKpmSZTj
         4trLgrDLlxpnL1nhYEk6iIMKi2FFH73G6aUvT6jY2PWhIbgonwb9Kz2Jn49hziDTdPNk
         B0rpbiTd1pfCCvdSpQ0mN9quPITbwVGCS6MG7pur7a1rMK7/Pa/Z526BCA+3FM4kP/Rs
         Bftiyd3JGXOX4U/FO1WeKzrYJoR7W+zJ2zmM7kU1rokfq7eEyFR8VpSpmG8trJJS7Nkd
         S3bBbyqbYYIFVtSy8FuMcXAq2im+FPuV2HfnApi+Ca1z2vTUWUxtbSK3Un+IdyWxEee4
         mahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690562599; x=1691167399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMYet5Mt/0ixLMQn9TibfPwhyuRMy0WklKnV3QSTEvQ=;
        b=Citc1nAN3AhrN5I4d+9lv94SsBZMf/pKSiSl2p9cBwmgbxPwYv3dQhSulJ6p48GtPB
         tp///X7gjX3lR4eObBrxd7ui/d+oVo9Bep1rdsV+vwW/1OIAeimZbULzK68d3t7nSa1A
         Dtyh7Mt9iAWoMIpAgrdh2pka/xhM+/sFss3nfpi+QlDD3/62BKs6h138Q4INdJqQ2nx9
         STQmNjK0OpKPeVF/zp84o9mHZw/ZLUR8ZeUg+60FF2Iy74dOZm4hebMwWaZAJa2qPbCk
         /05yLpb17gkovJm8Ct4q86v/e+VMiNdkH4E5MSa3010Zc9D0me26ymFKssCiUDGFg93Y
         TRHQ==
X-Gm-Message-State: ABy/qLYzfsThu4eLi0DpLuWkwyaXJqQArIwbeRtc1M/7mbQ4NVb4j5Bs
	3csI9SfH6SpfumbS9ilXu5hipXSxyLLcHjPnUCM=
X-Google-Smtp-Source: APBJJlFU5dYvHe4r9jHVkuOFkgUrFKDSb7w1HakZXPbhHo9oj50hExuyGQ/oIsQl3FQyRtGvfMnMKdSBl2i0gilf5F4=
X-Received: by 2002:a4a:3505:0:b0:566:ff47:2577 with SMTP id
 l5-20020a4a3505000000b00566ff472577mr3031832ooa.1.1690562598640; Fri, 28 Jul
 2023 09:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230728093950.12046-1-alex.kiernan@gmail.com> <20230728093950.12046-2-alex.kiernan@gmail.com>
In-Reply-To: <20230728093950.12046-2-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2023 09:42:52 -0700
Message-ID: <CAMKF1srtn2cy1DGDyrnfU8UB_wno48r1+oNdUnmYy=-_ZfLaDg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] udev: eudev: Revert add group to sgx
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 16:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185038

On Fri, Jul 28, 2023 at 2:45=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:
>
> The sgx group is part of base-passwd now.
>

thats ok although it is specific to Intel SGX enclave device nodes
having this group. I wonder if we should make it just for x86

> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta/recipes-core/systemd/systemd_253.3.bb | 2 +-
>  meta/recipes-core/udev/eudev_3.2.12.bb     | 5 +----
>  2 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-co=
re/systemd/systemd_253.3.bb
> index cf0e17ff002b..1fd4556afd0e 100644
> --- a/meta/recipes-core/systemd/systemd_253.3.bb
> +++ b/meta/recipes-core/systemd/systemd_253.3.bb
> @@ -424,7 +424,7 @@ USERADD_PACKAGES =3D "${PN} ${PN}-extra-utils \
>                      ${@bb.utils.contains('PACKAGECONFIG', 'journal-uploa=
d', '${PN}-journal-upload', '', d)} \
>  "
>  GROUPADD_PARAM:${PN} =3D "-r systemd-journal;"
> -GROUPADD_PARAM:udev =3D "-r render;-r sgx;"
> +GROUPADD_PARAM:udev =3D "-r render"
>  GROUPADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit=
_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'coredum=
p', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'network=
d', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
> diff --git a/meta/recipes-core/udev/eudev_3.2.12.bb b/meta/recipes-core/u=
dev/eudev_3.2.12.bb
> index 4268bcc2c5de..572ccecafd0c 100644
> --- a/meta/recipes-core/udev/eudev_3.2.12.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.12.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =3D "ccdd64ec3c381d3c3ed0e99d2e70d1f=
62988c7763de89ca7bdffafa5ea
>
>  GITHUB_BASE_URI =3D "https://github.com/eudev-project/eudev/releases"
>
> -inherit autotools update-rc.d qemu pkgconfig features_check manpages git=
hub-releases useradd
> +inherit autotools update-rc.d qemu pkgconfig features_check manpages git=
hub-releases
>
>  CONFLICT_DISTRO_FEATURES =3D "systemd"
>
> @@ -85,6 +85,3 @@ pkg_postinst:${PN}-hwdb () {
>  pkg_prerm:${PN}-hwdb () {
>         rm -f $D${sysconfdir}/udev/hwdb.bin
>  }
> -
> -USERADD_PACKAGES =3D "${PN}"
> -GROUPADD_PARAM:${PN} =3D "-r sgx"
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185016): https://lists.openembedded.org/g/openembedde=
d-core/message/185016
> Mute This Topic: https://lists.openembedded.org/mt/100407491/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

