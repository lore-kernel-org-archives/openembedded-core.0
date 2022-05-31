Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCA3C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 16:39:18 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.51905.1654015157927163828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 09:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jUIGrfRt;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id l1so12403932qvh.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uDc+r+rR+bziRk06ooCUh3voVnlOTRXEm3lykbKr1To=;
        b=jUIGrfRtZTNggkK6s4TRYBEsl+LhqjsNGbgtMbYD5useyKavnFLkB+I1K6rEpL8go4
         WkPlSJrJp2HLX84Twp9D+HS1oaZNsW/rWmDvqB+P3kt5Q1QpXxpuuQwvqVCsoueMi8KH
         DAJR0Imu2Xn9dF1zBfCvX+CIvhUYB2jWSOtYXktjfexNNL6sS1LmmzuBShIW8PXrLYaF
         GLtAw889tVMvv9pJuEna2WrSrL9XyAfHH/1Cy2UkP3Hy6vz8CWrXAG6tCxQ7pWWa23CP
         J8wBVhJqeQ91elfrKzOHXhqZPe+FRQ9DMo1ngTzlxiHbd5fntRXT7EVFeOiYC3iC0f+q
         lmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uDc+r+rR+bziRk06ooCUh3voVnlOTRXEm3lykbKr1To=;
        b=3An7whjhO940QMDvwUSstPbmBhtnE/np87ayqaj1L5zRXy8vqAFSh8IyDGU5IKelat
         7O6OspBZFzKtrH6U++QV4frXIa8Z6tGrGT6F/HSPiRSGjrtewjEZjttSiWyfPG77RqyO
         yx15yd7/wo0Ijy1e7ovJYiUL8L3mtdLtRYrP4omBmpe2S6FofGGaw8UsHPeqVD2BFJKa
         pT+dM2yEZPVCZ9Xe2KIsd+qAqVreAlnXv8Gr1hBpJqe2QWq7nmPvSCCvLrkOgTS3iNJc
         hiMc8rT8WQX6IDIdn7siKwfI3YTmUJBcOnDKMaUI+K5N2kQjIhX3khch7TE96v+bHASh
         A2+A==
X-Gm-Message-State: AOAM533tHWfzNiNUpQ7wMJV7piBJIAF6bQWtWLatmlgMPC6I3r3rSUrf
	XMBbuAQ4HqHyA/0//Vy9B8NdY6msUOqpky19Yli1YOKcjaDciQ==
X-Google-Smtp-Source: 
 ABdhPJwayjd2sGrP2j0OHSkMMgcb/nc/O+i11wcusHlMnUJtqFkdmYOKv/nwfUMiULe3b/EDsTYeHdruO39vbvp05XQ=
X-Received: by 2002:a05:6214:528e:b0:462:584:3d75 with SMTP id
 kj14-20020a056214528e00b0046205843d75mr47709077qvb.110.1654015156916; Tue, 31
 May 2022 09:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220531155704.682685-1-marcel@ziswiler.com>
In-Reply-To: <20220531155704.682685-1-marcel@ziswiler.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2022 09:38:50 -0700
Message-ID: 
 <CAMKF1so133M+wX7a8QPBLoyYsyz7R7SS4fOJJY9ZRRp=q=Gm7g@mail.gmail.com>
Subject: Re: [oe-core][PATCH v2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Peter Bergin <peter@berginkonsult.se>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 16:39:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166324

On Tue, May 31, 2022 at 8:57 AM Marcel Ziswiler <marcel@ziswiler.com> wrote:
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
> Will talk about it at the Embedded World in the TSN & Linux track next
> month [2].
>
> [1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
> [2] https://events.weka-fachmedien.de/embedded-world-conference/program/
>
> Changes in v2:
> - Updated SRC_URI specifying mandatory protocol as https.
> - Updated SRCREV to latest.
>
>  meta/recipes-multimedia/libavtp/libavtp_git.bb | 16 ++++++++++++++++

There was a 0.2.0 release https://github.com/Avnu/libavtp/releases/tag/v0.2.0
so I wonder if we should use the release tagged SRC_URI and call the PV = 0.2.0

>  1 file changed, 16 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libavtp/libavtp_git.bb
>
> diff --git a/meta/recipes-multimedia/libavtp/libavtp_git.bb b/meta/recipes-multimedia/libavtp/libavtp_git.bb
> new file mode 100644
> index 0000000000..aefbee56ea
> --- /dev/null
> +++ b/meta/recipes-multimedia/libavtp/libavtp_git.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
> +               specified in IEEE 1722-2016 spec."
> +HOMEPAGE = "https://github.com/Avnu/libavtp"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
> +
> +PROVIDES = "avtp"

why is this provides needed ?

> +
> +SRC_URI = "git://github.com/Avnu/libavtp.git;branch=master;protocol=https"
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
> View/Reply Online (#166321): https://lists.openembedded.org/g/openembedded-core/message/166321
> Mute This Topic: https://lists.openembedded.org/mt/91454504/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

