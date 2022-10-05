Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2002DC4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:15:17 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web09.682.1664990112902501220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mBwq8flb;
 spf=pass (domain: gmail.com, ip: 209.85.219.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id j7so21092076ybb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vfjm47xkmEhYOLmB4MYjkPcgbPbyNjkvuy1rzjZe26s=;
        b=mBwq8flbJ4dDxaeI/HeSsUR3vWHYv9K60uH1mdR7cZQjVrtiLuEbXnGm3lyUstIVaN
         wx2sAC1lArNVcVa6ztXET4DC+gJeBtkC+kyQl+N+BAFX4FK7tEnr2Lcfu3n9i44gJjfp
         UarXekYKVQgHZU285e+8gNNS+9nuttETWCiKTAZwG4eZ8ttVVyuqL8QpNJLY8jW7thE5
         2o3qOd06hGyoI9jrEjYS6Zf8u1VD3zI0a/lO89RG3aXaSxirWFA4MBQKffpqfgIFm5d1
         f6elvoD1DvTNE4BZHfptu5jWr59hF8gFHczX5ivg1J9TLmlkV68JFsDblDAKYPSYweKV
         QhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vfjm47xkmEhYOLmB4MYjkPcgbPbyNjkvuy1rzjZe26s=;
        b=HtElF/DqXbYkhcQyFHy/01zSMUNvJn8q2Y8tDOwgY7FhLH6rfsOnobJZEcqay0AfZ6
         DM5n5XE98opjVmjdTXzhNLcDujEkNN6VNpvTG3nkHHbPXWyNg1w5BmPQtYzRNzv71klv
         xWItLhdpDSjA1YTufvYSguu5zBgjtK50JNNFBTz4hUOrjIWThKT5wanNajjaIxO5Orxm
         b66ViEtaDCnRoCoIn5SM3Ub8cnBsoPbRBE9tauZ054oPutusO4HrsdFyQ5jajWSwSyYZ
         JZxonLIwO2mF6ptrV0rxMlsYsi4bpCQRa1KC+HhvUmiJE78WRsfOwPu+E4Rl7+hPAGhu
         7rSg==
X-Gm-Message-State: ACrzQf35rIyKil63w70ilrXjqH+6ZBu58tEWMc3mh+Jk2wn9hXUkPT4L
	bN97qoGN6qQ5HfIE2f7c1gLNi/T6K8d1t7yIl0IqKmBaRu8i+A==
X-Google-Smtp-Source: 
 AMsMyM54Ke6CxIwPjzQ916ucZm0wYn4u5tf/GNZ0jm1YT7eN8G6Soqszmng8gcdLkOIFMaocfUugaYV0sdLuY7iefPw=
X-Received: by 2002:a05:6830:648c:b0:660:daf3:9bc6 with SMTP id
 ck12-20020a056830648c00b00660daf39bc6mr120289otb.111.1664986798335; Wed, 05
 Oct 2022 09:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
In-Reply-To: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2022 09:19:32 -0700
Message-ID: 
 <CAMKF1sps-=A9OpQK86jX=EkYDVxWVfabD84G27+75VdMiguJHg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 17:15:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171471

On Wed, Oct 5, 2022 at 8:01 AM Thomas Perrot via
lists.openembedded.org
<thomas.perrot=bootlin.com@lists.openembedded.org> wrote:
>
> Otherwise, it isn't possible to interact with the UI.

I wonder if it should be in the MACHINE_EXTRA_RRECOMMENDS in machine
configs, it will help a wide range of users who may be using
graphical images.

>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/recipes-sato/images/core-image-sato.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> index e63a229d1257..0e37c15097b3 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -12,6 +12,8 @@ inherit core-image
>  TOOLCHAIN_HOST_TASK:append = " nativesdk-intltool nativesdk-glib-2.0"
>  TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
>
> +IMAGE_INSTALL:append:qemuall = " kernel-module-virtio-input"
> +
>  QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
>  QB_MEM:qemuarmv5 = "-m 256"
>  QB_MEM:qemumips = "-m 256"
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171461): https://lists.openembedded.org/g/openembedded-core/message/171461
> Mute This Topic: https://lists.openembedded.org/mt/94137249/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

