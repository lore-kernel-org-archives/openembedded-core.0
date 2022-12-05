Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F0AC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 10:05:14 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.11779.1670234706524730856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 02:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bOPF3woh;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id c1so17710032lfi.7
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2quNn+vnKktKtVILaDRf2nzqsqU2oYZLQIcQpUggJJQ=;
        b=bOPF3wohhqShlQ5Dl5DJi0nsaArb4IWeL74PZP++iXHakSqgKADv6xRgRhxKCd+AeZ
         OHwOFK67k26mxX3BBZnnzh7CWJNkDTcNwI/1Oe5VhxrChrqHMfHyAAEckld03gQHq0rF
         7Tz9mlB38s8dOoEoC/cKvgs1u6J7H9SqrOWKg0BVglSQ9UG1F20ljSkSPpKcujHp74ud
         a4hiKJrTmQBbWjMBFLzcTBXobLJ8089oJDGnNowjRk6kIWLiwHz7SbTdItNDCXZrORsd
         HAciNKWWm/DHkJcJ2UwZKq5rEQKIpFNSztXrpcxXfBOtssxzHdisu1eIXdrGj9HwJuoM
         gXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2quNn+vnKktKtVILaDRf2nzqsqU2oYZLQIcQpUggJJQ=;
        b=5QU6B8+K7Oyroti0Dt2UwSk1LqipXp+DwHpN3D7mF/SFHh3KW6o1R8XR5PuP63Sak/
         Qv68B1tANKE5tTa4VjqjD8qgNdlue6oouqj/je7EkTmXeAtGhaVxztMHiJ+Gmy3SJP6Q
         M8ArGsGMSMon0EIdJvZZw0PHDJXx11cenyVnm6SUsHxEOzYb6k4thbaz3cqkjyWaqDBU
         X1TSU2OfvcdkFxm/xVep/FjbuDoWQvjaL3VccK77u6P3tvfOFwQOo87vrc3aVe2iqqFu
         MLdWbxK8QpBj27oVGynrhKOdEnfMGF3Zr6BjVzaFPYQbO11HWkkIMSIR+NkARgDau/W9
         B/vg==
X-Gm-Message-State: ANoB5pmK1gzY4W1DrgAyc8phf83awcYVp4JL1wZaOYhey2VWi4h3QmS0
	1UvMQIYTCUihARbPdNlUUnqBiDJdhhnpg3xnvPU=
X-Google-Smtp-Source: AA0mqf5TckkFQMbeKmiLtlXfOnt9+s8hNBoID68GqRWsE4tXlo9KUHBv2Hw1k+8AMbL5wUaLEBuXYW24phwjatJ0Z7g=
X-Received: by 2002:a05:6512:3b9b:b0:4a2:4aad:8fff with SMTP id
 g27-20020a0565123b9b00b004a24aad8fffmr25924055lfv.445.1670234704370; Mon, 05
 Dec 2022 02:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20221205095151.3820258-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20221205095151.3820258-1-mingli.yu@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Dec 2022 11:04:52 +0100
Message-ID: <CANNYZj9RXtEWM_NoQJsC7Ej9W4k97BenfaPWccyypAxme0eobw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 10:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174281

Both of these patches seem very wrong. X11 definitely does not require
opengl. I just confirmed it by building xf86-input-synaptics without
opengl in DISTRO_FEATURES.

Can you show how the issue can be reproduced on plain poky? It seems
like your local config or distro or BSP layer does something which
triggers this.

Alex



On Mon, 5 Dec 2022 at 10:51, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> xf86-input-synaptics depends on virtual/xserver which needs opengl
> DISTRO_FEATURES, so add opengl distro check also for xf86-input-synaptics.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> index 8b3f19426b..3fc54af3e4 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> @@ -17,7 +17,7 @@ XORGBUILDCLASS ??= "autotools"
>  inherit ${XORGBUILDCLASS} pkgconfig features_check
>
>  # depends on virtual/xserver
> -REQUIRED_DISTRO_FEATURES = "x11"
> +REQUIRED_DISTRO_FEATURES = "x11 opengl"
>
>  # FIXME: We don't want to include the libtool archives (*.la) from modules
>  # directory, as they serve no useful purpose. Upstream should fix Makefile.am
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174279): https://lists.openembedded.org/g/openembedded-core/message/174279
> Mute This Topic: https://lists.openembedded.org/mt/95465698/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

