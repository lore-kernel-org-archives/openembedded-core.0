Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAD2FA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:24:30 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web12.7053.1667204668310568374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pAcXaxSg;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id g12so18117705lfh.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 01:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t84I57zeh7bByTGis16aZVMU/yJdUyBtoqbi51BUhWo=;
        b=pAcXaxSgSsMuxj+eS6hEz+B+YHjeU+yh0O++RLBiiDfZhHMHYjXMM8EQxXc303zp5s
         XY0L9kX0ZLARQWDjDyvF1ZB/R8DPGxYxN9rzizsV6ej+yxsNEN9UTypUOCY39aGs7Nmd
         2AbHG/2G71S/PvfhOrx0YysE4Dp9IXtxp30baPUj5CpSEHE47VLKvOBejxdOK7cv9Wwm
         zXrYwxg0NIUIuXaCQkbKgx4CyV3rvS1RjVELBUtlt1nYn+iPlCr2U+IhuOaYu3yxVOJP
         q4hQHU4oNu1cJbCFKHrVCnel2Dvzj8EY4atJUJaIQkI0Z03sN8xsjFLyUZ4r+mWr09vb
         Nw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t84I57zeh7bByTGis16aZVMU/yJdUyBtoqbi51BUhWo=;
        b=d8RrkuKRSrRpq2sF29cgbn3ltyjF7Sq2CgxowpUAUKwZNm7BhIOIEGfWqQ1/Y3ulJD
         3fOm8Cqi1VmtiUDv0Izyd6PzWsJi8b+IMYMipqUXRDEB/0N+J4daKxOTSeomRbV0dPmx
         XLm6z5Zphj2DGDxw1gjbM8t59GnEPedHHSnzTabLRbre/hlQI5DQ4EZRfNIgNP5W/4EV
         Oq4V4bJ/jhxO2Ttdns/LM290CJUMXwxT23JH3h3D1pDrdNSn4tXk/GsTTpLNWJ9cCjCr
         UTEKGDjl2QyeSEo47OvRn7NRULVcb3eb416RxfCwHtMESaL14Cn2nq1fPDco+o2Cccro
         ovxQ==
X-Gm-Message-State: ACrzQf0lpGR1ZKsADXJ/GcpJuWqX1wT/i/E4nGSt/DBpKjUV398SMQEN
	11hFiCT8AWp7xMoOUDsjOnfPNyLXB6fXQKfxdiQ=
X-Google-Smtp-Source: AMsMyM4qJLWaHACPb7q+RI5C1KeMZ5TSrVFfOOSXPyLOKDsdIN7Qf8nFgm3HOZakJW+uFm2pJlObpsAzdwZtNyCUEX8=
X-Received: by 2002:a05:6512:3989:b0:4a2:7d73:495a with SMTP id
 j9-20020a056512398900b004a27d73495amr4824936lfu.492.1667204666248; Mon, 31
 Oct 2022 01:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Oct 2022 09:24:14 +0100
Message-ID: <CANNYZj873res=PuBbMB-ffy6=ek-8UFNt+QvYru1dKdU-VjuWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172294

You need to explain the use case. Why is this beneficial to have on oe-core?

Alex

On Mon, 31 Oct 2022 at 09:17, wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../systemd/nativesdk-systemd-systemctl.bb      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
>
> diff --git a/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> new file mode 100644
> index 0000000000..66b5ec5e6e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Wrapper for enabling systemd services"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +PR = "r0"
> +
> +inherit nativesdk
> +
> +SRC_URI = "file://systemctl"
> +
> +S = "${WORKDIR}"
> +
> +do_install() {
> +       install -d ${D}${bindir}
> +       install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172293): https://lists.openembedded.org/g/openembedded-core/message/172293
> Mute This Topic: https://lists.openembedded.org/mt/94680777/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

