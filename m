Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B21C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 07:30:44 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web08.4687.1654068637609788221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 00:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N2k2UjKe;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id g12so1038443lja.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 00:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e2+/2RseB9RNT4uoLvcN/GHJ6Wbm3rTST8AB4Xmts4g=;
        b=N2k2UjKe8a5hGvI+cha9MTV2TyP1q/lbg7jeXG3IB2miKty2tOSl+f/hrz+pV6RVze
         A74mPEeuFaqOyGahZ93gJ22ffXhbIyOZsaB6WKmqPTcWCyPxnlHivh2tXS45P+74zED0
         J9l4F1GK5UFSzw06gRx3Kuw9jLRQv4bIn5WoJpbadaUioSEP2pxFA2rG3UQdOt+8U7Ai
         uuMxhRMOhkykMR2TP3N8MFxyPKHJT/59S2qgZm+pN0aejOu2a2sYQ2NpJxdWKlCtnDIs
         jARtRm4Qi+QzUlxcMl7xoSMQ93IGPtAFPsCmpr+X6MWmgsgeAUplOa1ZH/oBKSsLiuee
         C7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2+/2RseB9RNT4uoLvcN/GHJ6Wbm3rTST8AB4Xmts4g=;
        b=pWvEUWlxce7zrXEThBdlqVcJ3l3QIUxTUzH+0F2sIIxWcvIMgwCHL0OoQ/HXQphIlO
         GMAOzPFGAvN6TjjuQ2FRmYMiOHx3Bu4nhLrTMhV0ZYUD3hdSrJM/5e8r2pkk84IYIxHF
         MSMZjywS6AX7XApfrxZXzgixYtTZq4RprNYrl5Dvs9LtvIOyzxrbr79TbwkqUk8G72wY
         NiZOC71xCgEYApAbnBg48cClJ39OIjqhOonySVX+upU/DT7dg5kj+BJmfzQKFpHL+DSZ
         dSAPCr9wbolt53dpUqbVaQb6b+8lkqlbkDBLar4uN/J8Vde7mUySPDRZ22pkMS0KOwB9
         qjbQ==
X-Gm-Message-State: AOAM532iMY/7sbUbJFPGhfhzuXvQArzQC+Pq2O9ubau2cx6giU8U6NM8
	40AA89ibUE4SQg11osWpl7m2GjhUAWKNF8M6gAU=
X-Google-Smtp-Source: 
 ABdhPJwXrp2ivdhmypZs0uhGWM15YRJubUqEShVKFXFAdi0mxdysX6tYf1qbUiqWZb9Ey206uZa/Fgd0ADb4HVJpr08=
X-Received: by 2002:a2e:97c7:0:b0:255:69f4:b9eb with SMTP id
 m7-20020a2e97c7000000b0025569f4b9ebmr1500975ljj.109.1654068635781; Wed, 01
 Jun 2022 00:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220531213206.7119-1-marcel@ziswiler.com>
 <20220531213206.7119-2-marcel@ziswiler.com>
In-Reply-To: <20220531213206.7119-2-marcel@ziswiler.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Jun 2022 09:30:24 +0200
Message-ID: 
 <CANNYZj8xMEOqAPXBuP4oPonqDsJWUK8G6ExRwmT=7zkTQJp1rg@mail.gmail.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Peter Bergin <peter@berginkonsult.se>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 07:30:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166358

This should go to meta-oe I think. Does it have to be in core, and if so why?

Alex

On Tue, 31 May 2022 at 23:32, Marcel Ziswiler <marcel@ziswiler.com> wrote:
>
> From: Peter Bergin <peter@berginkonsult.se>
>
> In order to enable configuration option aaf (AVTP Audio Format)
> used for AVB the library libavtp is a dependency but no recipe for
> this library was present. aaf support for alsa-plugins was
> introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
>
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> ---
> Resurrect from mailing list [1] as this is still not upstream.
> End-to-end tested on Verdin iMX8M Plus.
> Will talk about it at the Embedded World Conference in the TSN & Linux
> track next month [2].
>
> [1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
> [2] https://events.weka-fachmedien.de/embedded-world-conference/program/
>
> Changes in v3:
> - Rename recipe to officially released PV of 0.2.0.
> - Drop PROVIDES of avtp which just works around alsa-plugins refering to
>   it as such instead of libavtp. Will update PACKAGECONFIG in
>   alsa-plugins instead.
>
> Changes in v2:
> - Updated SRC_URI specifying mandatory protocol as https.
> - Updated SRCREV to latest.
>
>  meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
>
> diff --git a/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> new file mode 100644
> index 0000000000..563debde3c
> --- /dev/null
> +++ b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
> +               specified in IEEE 1722-2016 spec."
> +HOMEPAGE = "https://github.com/Avnu/libavtp"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
> +
> +SRC_URI = "git://github.com/Avnu/libavtp.git;branch=v${PV};protocol=https;nobranch=1"
> +SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig
> +
> +EXTRA_OEMESON = "-Dtests=disabled"
> --
> 2.36.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166338): https://lists.openembedded.org/g/openembedded-core/message/166338
> Mute This Topic: https://lists.openembedded.org/mt/91462033/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

