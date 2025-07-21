Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A57FC87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 09:26:12 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.36360.1753089963981027482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 02:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBm3UA6J;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fad79433bbso36290316d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 02:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753089963; x=1753694763; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0zniAO2oaLC1vtiggmWzYFVkS+P9pMcq6fB367owLwQ=;
        b=LBm3UA6Jhx31tqvcLkhAw1zFe+CCz87Ggib7Mhdj3nOdHwyPwsIBKu4SbWjG62oJvb
         jMAC5CFXaTSYW8MFSh+i1rVtdL+7+L+tJMKCsRnnUi2h/7SI08jPQDSOcDoO4ivE112E
         ty/cgkO6GV7KeEfbyaHP9v/+dfArbFTRNRq0E0wnuGrOz2CTBWETyJf4a5LUvE8pcgSU
         dNRJFVj9R4piIaJo1MuMT+RUS3Qzq76neC7iIy8i+yXmPkfMJMJQ3h+r1JD5crLmxMyR
         hRxMG4oPdhnZionxXmduIRf51abAvm9Mhd0XOL2usR4uJqM8YGKVrxofPgFVBb5HWstU
         9EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089963; x=1753694763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zniAO2oaLC1vtiggmWzYFVkS+P9pMcq6fB367owLwQ=;
        b=uYmBu3j08Qzm0QKftcGzjV0sddhRaWW93lnAaBTKo5yiO+pRDpe0GBBgcCVeexzKXZ
         Dms6goGv+wFBKj1++pGDaOEoxsCVtclRGx2liQfBFV9R5qZymbL0ljxLNeI/pthd0VNW
         MZHiMgGUiVX39teVtEPxc6ipMOf3V1Qu7tLS5ngEPQSrfK0iTh/ahnl17wKqQirvYdpJ
         oMtX8pzQdTh7jKOFnnMPNUEAeqMKHua4KPWoEwTZrojjhwd7/3zC38i1Q6BV7HhgFBbk
         QljB55VOdrxb5HqoVItQbJ141vxfUN2wPLYagJpkY2uD9cqTDoXnZdyrEnhg19rQEYaD
         wOQg==
X-Gm-Message-State: AOJu0Yz+hbu0B1L/DOd05GpFaWZHPHTiwPBg8kaN24J4sol/p/gBqwLa
	sP+s5WocP6Fq82H6QTJc7CLih0I3Hl34XJcShLmCsgG1xK6OiGOqyOZCtiD8P/6P5hinQiQ24Bp
	ycg2omzbFrgFcPrczJAHZnasGrbwJIjg=
X-Gm-Gg: ASbGncvcXcJt29MlNk4MPXGMa8lV2pMTkw9GxQHFDIyfnBcFhGfXG7hq2LNLoRKXySs
	FTUUT9rTSAAmg/ihHdWNPXTljWHFb09LZd8UEp5bMWqUF3Kq0vekUOFavh40/4KoX0eYp3sIgRt
	b7VuVHI0Whsb1U/nznDiJPGtRclFStVLO1STjuDkJz5G1vOX2YbtV1AkVrU2QEgXi8IPJtuAvq5
	vqGKHKR5UlYnwkX7ApwZy63k3an1VsBLbZmyznr
X-Google-Smtp-Source: AGHT+IE/4BC8iY/xXN98gVHtLFpH0ZQsbf7owLyeW0qVmatxigrIhZOrk58iLeRH3l2Ychgl4RVAkHEL164VXmRKH/g=
X-Received: by 2002:a05:6214:5885:b0:704:9077:e0c8 with SMTP id
 6a1803df08f44-704f69fdde6mr307116676d6.3.1753089962721; Mon, 21 Jul 2025
 02:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250718091518.1608493-1-pascal.weisser.ext@karlstorz.com> <20250718091518.1608493-2-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20250718091518.1608493-2-pascal.weisser.ext@karlstorz.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Jul 2025 11:25:50 +0200
X-Gm-Features: Ac12FXzYxg6JaG1Iy4-8OtndFCxnWphyUY1VzR67puay7ti_x8S-6OlAQ4vUUiU
Message-ID: <CANNYZj8eFU9xc9OStN4vE31PgyC+4bVwJC9zcNqz23O=YY5OOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] dbus: add traditional-activation PACKAGECONFIG
To: Pascal.Weisser.ext@karlstorz.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 09:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220669

On Fri, 18 Jul 2025 at 11:15, Weisser, Pascal.ext via
lists.openembedded.org
<Pascal.Weisser.ext=karlstorz.com@lists.openembedded.org> wrote:
>
> Add traditional-activation PACKAGECONFIG to DBus recipe in order to allow
> users to enable or disable that DBus feature.

It would help to explain what the feature provides.

> Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
> ---
>  meta/recipes-core/dbus/dbus_1.16.2.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
> index 65f7028b4f..aabc4c3efb 100644
> --- a/meta/recipes-core/dbus/dbus_1.16.2.bb
> +++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
> @@ -28,7 +28,7 @@ EXTRA_OEMESON = "-Dxml_docs=disabled \
>                  "
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
> -                   user-session \
> +                   traditional-activation user-session \

Why is it also enabled by default?

> -       chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> -       chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
> +       if [ "${@bb.utils.contains('PACKAGECONFIG', 'traditional-activation', '1', '0', d)}" = "1" ]
> +       then
> +               chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> +               chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
> +       fi

Why does this need to be wrapped in a condition?

All answers into the commit message please.

Alex

