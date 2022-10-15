Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5672C4332F
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 11:16:25 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.18213.1665832581996949441
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 04:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gNQDKlEn;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id y8so7088194pfp.13
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 04:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=le4fgHQCCs+iuZCz/BIyH+LFwJQd83mWVyGBS6Hqq7M=;
        b=gNQDKlEn9czRu2HNRcU6sboN0aUULHqMQNAQvDlEzmpegc1LL9Qq19XKpMAPBGfDsV
         dDlVXOYNZu+LYoEntzsWuc87kgQ07UPIF+/xz+klhgrgsHpXmC8ftnTp+X+khFp5zBvN
         RdeYz39hmNZOHaxUtTWL++rFY81z4Rv0OZT+FQ9cB8k8dSu96tqipL8ioC92eHwB33Vv
         Tx3KITbxnViH0wkw0UwTGmBfchThKoyo+wi/0z7ZqlhlpeL2C8ONjXjyfnzkmfNnqm3X
         uWc1dJI/FbR6HY+RHCuTzeQFw2CxMBQA6XNCud3ymL3UtUsxJ1LetfpBtN4Ut+/e5Jpx
         RKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=le4fgHQCCs+iuZCz/BIyH+LFwJQd83mWVyGBS6Hqq7M=;
        b=11If/9+hs+jtYRhXbD2UzGUT6HCXAH84ryus5eP6CyJJZyO7rhdrek9t2GbRbKKOVc
         z6nUSoRHwl9vl5gdqjANBmwjuCSRWSihrn8dL9Gn0AnQJCasNi6jAPHEXuB+8Ufjulwb
         FRsaqwjME2B8z/77eD69am4W0kDrmILiiwVXuWrSyH1j+hJf7Yzhu+xiwxzQxgaJx6Hp
         gxUcqNz3l4gp/eWBZ3ucVlnxsCtYMA7Yy0u8kQrVlcOSqwUFWiHnPAlz0zSEQ2pTDiqS
         zxIwFdNdT1KOinxtTMvKrfpyBgJ3t+ZcKILaHeoHRXUWPx/anoleAYpXZKCkU2sr2l/4
         wj/g==
X-Gm-Message-State: ACrzQf08IrF0Zl1yEPTTXhapHmrfTNr56Slj5TB8mwTI2b/Y6bwyF24o
	L7Ox40PO7g4df/LV22JOy+1b5PBKgfUJi5Lb++g=
X-Google-Smtp-Source: AMsMyM58sq+Z0a6zgmersfj+r8Uwk0H5P4cs83BIJ5pd7cO6sFpV0tkw0f55j17GHFRE5cqaxvh3wjhkxoHExN59fDc=
X-Received: by 2002:a63:8ac1:0:b0:458:4982:933d with SMTP id
 y184-20020a638ac1000000b004584982933dmr2182129pgd.240.1665832581169; Sat, 15
 Oct 2022 04:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221014192742.162360-1-brgl@bgdev.pl>
In-Reply-To: <20221014192742.162360-1-brgl@bgdev.pl>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 15 Oct 2022 13:16:08 +0200
Message-ID: <CALbNGRSHfPO0OL-OC2Tt+RL8Jf5GL_H9vaLyjUKiFb_+t6LiWQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bluez5: add dbus to RDEPENDS
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 11:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171740

On Fri, Oct 14, 2022 at 9:27 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Unless we're using systemd, dbus is not pulled into the system
> automatically. Bluez5 will not work without dbus so add it to RDEPENDS
> explicitly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 79d4645ca8..b6f1c00c14 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>                      file://src/main.c;beginline=1;endline=24;md5=0ad83ca0dc37ab08af448777c581e7ac"
>  DEPENDS = "dbus glib-2.0"
> +RDEPENDS:${PN} = "dbus"
^ Other RDEPENDS are overwritten. So why not use '+=' ?

Andreas
>  PROVIDES += "bluez-hcidump"
>  RPROVIDES:${PN} += "bluez-hcidump"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171739): https://lists.openembedded.org/g/openembedded-core/message/171739
> Mute This Topic: https://lists.openembedded.org/mt/94334177/3617609
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [schnitzeltony@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

