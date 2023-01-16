Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D6BC63797
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 09:17:46 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.162600.1673860663659573182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 01:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RJGBiI0i;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id g13so41833090lfv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 01:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4T4mwTb3pvbouc74tDe76ERR63U8KszXWOUhA3Fy/XU=;
        b=RJGBiI0ioPLGykkqjekhnNTjQ88u3Bxs4sgHe8GeKBWvxhoEUuJmLjncF+Jsx6EmBG
         gzXA5KLPNuJO9M0mpA3g7g1T3qtR2oxcyvobZqbiwneU6C7LATBBOrH2w5MxWtrIfkQ5
         ylUGvHaZxVRm3vbaIZ5wRbX3jLsqKDpqfhJCTMlwJFjzsngueHEC7AllTajdshdq82Nn
         KcHFDez1LwwX5TpKCy6UIalXzQ+/BcRLt5Lp/x5B7vvVrM86guIC0vaq5FIFpRl8SdVQ
         kxEsrhGji6gMib2Dr5/i3yZReIxR2DK6j2qmcF1ykS7sXlgRoGNvUxl7lYbl7awZEVOO
         iDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4T4mwTb3pvbouc74tDe76ERR63U8KszXWOUhA3Fy/XU=;
        b=cUEpTRZ1HGYr4h+vo2qCKQCWX9Ig4Tw43Z+/CYcdCqkwUr4efIQXlACfrx4+OaKN4d
         6+Q8myFDRFL3Hj5TXB4PWti5e20+NfcmEu69gk45jhEYVJIp5RZ1Nlnm6dypfBQGSAVg
         rjOwvCNjxXQnVstggXETYq4PiK6/281gE/pKtphhtHM4tsiJEchRWtwhmW+EdvO9OsYk
         a+8GCdH7/5wxhWM7w9M7i9myQ5xn8qxIXQd7ttwrRV1ZpQxCrWISza5N2IsFmBJoj7Vl
         ZJLNGmF3+RYrPU7VbrXDFcSBKZPLdGAQPVjqs+idP4vpvqQDrUR9Pl7DgMQJR4Tzqffl
         Wjhw==
X-Gm-Message-State: AFqh2kqZkVQ4CvKW01e2ukcOWfqOEV0jdonCbyulKx40UqFIDbVHUfrQ
	w8UTDih+FjoIIouUgfcYCoch7k0VkglL2w+/Mco6STeP
X-Google-Smtp-Source: AMrXdXsyJ8tThFQj4oVavPua6z18i6Y3WiLH6nNIDt0dLX4wPXLY7bAXfblIsT5xojNyFwyVv3RymSsEAZfDhkSqnco=
X-Received: by 2002:a05:6512:3a86:b0:4cc:7ecb:32af with SMTP id
 q6-20020a0565123a8600b004cc7ecb32afmr2370810lfu.393.1673860661589; Mon, 16
 Jan 2023 01:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20230116084809.16470-1-Qi.Chen@windriver.com>
In-Reply-To: <20230116084809.16470-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Jan 2023 10:17:30 +0100
Message-ID: <CANNYZj9h_X1dKVuPfC+OpL4VOA-=nRy54eZHvrDfieW6AM4vWA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on nativesdk-file
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 09:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175965

I'm not sure I understand the issue. Why isn't file from the host
working properly in the presence of the MAGIC env var?

Alex

On Mon, 16 Jan 2023 at 09:48, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> For now, running `file' inside SDK errors out.
>   file: could not find any valid magic files!
>
> This is because nativesdk-rpm exports MAGIC. So let's
> make nativesdk-rpm depend on file for better user
> experiences.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.18.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> index 8eb0ab207e..3b7d4d640a 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> @@ -188,6 +188,7 @@ PROVIDES += "python3-rpm"
>  FILES:python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
>
>  RDEPENDS:${PN}-build = "bash perl python3-core"
> +RDEPENDS:nativesdk-rpm += "nativesdk-file"
>
>  PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175963): https://lists.openembedded.org/g/openembedded-core/message/175963
> Mute This Topic: https://lists.openembedded.org/mt/96303256/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

