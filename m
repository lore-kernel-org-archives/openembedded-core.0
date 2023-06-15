Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7433BEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 19:52:23 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.28300.1686858734999756421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 12:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jp31I8yF;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f63006b4e3so11255311e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686858733; x=1689450733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DUHkIBBgEkTfYzQaOzDEunE4Mal/S6KvUJd/SKRbYE=;
        b=jp31I8yFtkxQ4hu/dgCLacY7In2WVC1mv1iqYzoFefVHQO5m/FFphR6Y2PcBx1mbpI
         SW6dKZ2YL44yRV5lz4UTAduATfhohi/FsZ79AwI3wdX/qltxXd5idHeS/YMJ0SHig5Q3
         EgI6eEDeidXcDqHEUeqdsJHVtMhgfGr3gfhQ1HLducx06DJRTa8XAqAx23pxrN42aqNa
         t9jWy3qwnOaxdtj2HskGRQsrUT+NZYtfv7eM8g4rJRxlzFD7SN/t0bvWiPLN/EAIAfag
         1M9h083fhJjIGaLifeRvM7xVKcDU8AU+c+FFrvqK0Pd2t0OkvmnryUDLKWFEStZllttd
         0CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686858733; x=1689450733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DUHkIBBgEkTfYzQaOzDEunE4Mal/S6KvUJd/SKRbYE=;
        b=KIhO3Im91VE+5P7vntYTMsrfnvnUBDh3wb5V+RUe6HxS/hQLkLoCFn8tN9csZg9zEZ
         kkliByXJ8G35/GyL2u06z3qdTUW2bj5PK4bxXubZL4YLlK+OEF2unJn/Mu1Rtiim/wzv
         V2/vPekdYPnvzn9BmYbFxLMfeXYT9Jr73U2tQg4LdKY1QnUh72rWNefWpQsOs9o2K4fb
         /YAIOdqzmfEhMIjmYChbrRhCUXsv6LIXQ1aaql/zhRUAS81lsljoG/ncEnfXcaZsKUzI
         Puno1sKrlehZW2bDbobrHHTUcKZJC1CzRgX/VOy/LHvGIdDVmIamSDctO0wnfSxzRbKw
         FNbw==
X-Gm-Message-State: AC+VfDzBzROKAh9nb+m3rkPqiizi4cSth4rWECj+sgyHFbAOsMc0mbnn
	4HscmiFMEtTz5b6HZblO0cfY/EB7EyTexglTov4=
X-Google-Smtp-Source: ACHHUZ736Ej3/MAjJpbh/jxPgIp01w4ExOTbcAEE0EEXdS1hKtfGlFukWbNj4/VgPa+e2Z2MV3bYDBuJPW/ZAWOkFLs=
X-Received: by 2002:a19:d619:0:b0:4f6:6037:128e with SMTP id
 n25-20020a19d619000000b004f66037128emr11108251lfg.57.1686858732775; Thu, 15
 Jun 2023 12:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686856412.git.pidge@baylibre.com> <deed9a7ab127ac6997884f93300205dea46c9979.1686856412.git.pidge@baylibre.com>
In-Reply-To: <deed9a7ab127ac6997884f93300205dea46c9979.1686856412.git.pidge@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Jun 2023 21:52:01 +0200
Message-ID: <CANNYZj9v82Z0nt1eK52Hr2z8JM0DpyurLgbcyU_JS6VcJnaBxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] weston: Upgrade 11.0.1 -> 12.0.1
To: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 19:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182871

There's already:
PACKAGECONFIG[launcher-libseat] =3D
"-Dlauncher-libseat=3Dtrue,-Dlauncher-libseat=3Dfalse,seatd" used in
sysvinit builds,
and oe-core has the seatd recipe. So this could simply become a hard
dependency later on.

Alex

On Thu, 15 Jun 2023 at 21:23, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in
<pidge@baylibre.com> wrote:
>
> Tracking https://gitlab.freedesktop.org/wayland/weston/-/issues/488
> we're keeping -Ddeprecated-launcher-logind but plans should be made to
> remove this/work around.
>
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  .../wayland/{weston_11.0.1.bb =3D> weston_12.0.1.bb}     | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/wayland/{weston_11.0.1.bb =3D> weston_12.0.=
1.bb} (92%)
>
> diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipe=
s-graphics/wayland/weston_12.0.1.bb
> similarity index 92%
> rename from meta/recipes-graphics/wayland/weston_11.0.1.bb
> rename to meta/recipes-graphics/wayland/weston_12.0.1.bb
> index 4f6ce19915..be9dae6289 100644
> --- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
> +++ b/meta/recipes-graphics/wayland/weston_12.0.1.bb
> @@ -6,14 +6,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0=
f95d3386a7acae780b70 \
>                      file://libweston/compositor.c;endline=3D27;md5=3Deb6=
d5297798cabe2ddc65e2af519bcf0 \
>                      "
>
> -SRC_URI =3D "https://gitlab.freedesktop.org/wayland/weston/uploads/f5648=
c818fba5432edc3ea63c4db4813/${BPN}-${PV}.tar.xz \
> +SRC_URI =3D "https://gitlab.freedesktop.org/wayland/weston/-/releases/12=
.0.1/downloads/${BPN}-${PV}.tar.xz \
>             file://weston.png \
>             file://weston.desktop \
>             file://xwayland.weston-start \
>             file://systemd-notify.weston-start \
>             "
>
> -SRC_URI[sha256sum] =3D "a413f68c252957fc3191c3650823ec356ae8c124ccc0cb44=
0da5cdc4e2cb9e57"
> +SRC_URI[sha256sum] =3D "b18591eab278bc191720f6c09158040b795e7118af1d5ddc=
a6acd9a8e2039535"
>
>  UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org/releases.html"
>  UPSTREAM_CHECK_REGEX =3D "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> @@ -71,13 +71,17 @@ PACKAGECONFIG[lcms] =3D "-Dcolor-management-lcms=3Dtr=
ue,-Dcolor-management-lcms=3Dfals
>  # Weston with webp support
>  PACKAGECONFIG[webp] =3D "-Dimage-webp=3Dtrue,-Dimage-webp=3Dfalse,libweb=
p"
>  # Weston with systemd-login support
> -PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dlauncher-logind=3Dtrue,-D=
systemd=3Dfalse -Dlauncher-logind=3Dfalse,systemd dbus"
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Ddeprecated-launcher-login=
d=3Dtrue,-Dsystemd=3Dfalse -Ddeprecated-launcher-logind=3Dfalse,systemd dbu=
s"
>  # Weston with Xwayland support (requires X11 and Wayland)
>  PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,xwayla=
nd"
>  # colord CMS support
>  PACKAGECONFIG[colord] =3D "-Ddeprecated-color-management-colord=3Dtrue,-=
Ddeprecated-color-management-colord=3Dfalse,colord"
>  # Clients support
>  PACKAGECONFIG[clients] =3D "-Dsimple-clients=3D${SIMPLECLIENTS} -Ddemo-c=
lients=3Dtrue,-Dsimple-clients=3D -Ddemo-clients=3Dfalse"
> +# Pipewire support
> +PACKAGECONFIG[pipewire] =3D "-Dbackend-pipewire=3Dtrue,-Dbackend-pipewir=
e=3Dfalse, pipewire"
> +# neatvnc support
> +PACKAGECONFIG[neatvnc] =3D "-Dbackend-vnc=3Dtrue,-Dbackend-vnc=3Dfalse, =
neatvnc"
>  # Virtual remote output with GStreamer on DRM backend
>  PACKAGECONFIG[remoting] =3D "-Dremoting=3Dtrue,-Dremoting=3Dfalse,gstrea=
mer1.0 gstreamer1.0-plugins-base"
>  # Weston with screen-share support
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182869): https://lists.openembedded.org/g/openembedde=
d-core/message/182869
> Mute This Topic: https://lists.openembedded.org/mt/99556213/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

