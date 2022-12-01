Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C4BC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 10:05:31 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.39324.1669889122388816620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 02:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qVGhTCsf;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id d6so1687175lfs.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 02:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uUC74gAUlOwgnnuOQ1JEa9a1YtNWs7S7VMgDa5MIRbM=;
        b=qVGhTCsfuImZoczDrTDkp5AookwSxQZs2LqOGsTuYWSHI5txZU69S/HeR505fynHQy
         KvGK2NRxABImq5+54vbYg4Se2IAlYxa9V80S89p7e3S8FiP2WQEG3qlKoHqWQB1Ose4c
         3E0pMFMwWBfXioq6uvlOP9R/aC35aphSTVqkQY3DkpKHsrivbQQS6NBa3NaN/haBivsC
         yas6jDAth+G4J36nUfKfOIpzIP1veVQH1uWGs+kjrBPsCJD7td7M8lMrQIoZAzABIZQM
         75NeH56Lm8oZ5wqDjnZKULDai8lfyidQ0M1IPvY2B8uVJeu4vezsVnMNzd44vDaoQm4i
         s3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUC74gAUlOwgnnuOQ1JEa9a1YtNWs7S7VMgDa5MIRbM=;
        b=B4oFNt6yPl+XY4HNLCxuZOVRbDS7XKLN0kAOE6jX83wvVP/fBwUNrlR0K3KfM4UPzW
         HKIqCglOw6RJRv0uinG2+mkMO770DU1r5alPq5sfS1Vw+De8Uh4Qjtudc9ytCcymqSPx
         bvHFsapVM014uT7dxw7PlLsEAZNKzfW2dtKh9BCypCyKuhnbD2zUqQzx+Mxi80daNH6P
         zGNX2JcuP+xpDvWl/yYYsNVGM+vgbqoKNJYo0aW5dg0fVFgCdLlUy8sz1Df0rbWHxMu+
         JwQ/e3l9Y0U57IbQ3fU0VEXKvr24FtrGIEw7EqAJm6dAlFxS4GjyiorrrKGjApLIrPoc
         Fjag==
X-Gm-Message-State: ANoB5pmihHJtC7HbiJ4Z77hTDKmgPTZ3Zv7QYtqGpCnnIn4WepnqQzlk
	2T1IJqzCPZRCm5NuEyfwYAnLN92JjghdMq8Dccg=
X-Google-Smtp-Source: AA0mqf6ESAEEi+mIA8IUzJCSBruJchE7CaWlCaMirj1QT0710fglT983YpTPXMv2wpTgGilTLte/ZtoWHbnPLkxEjAU=
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr21246888lfs.367.1669889119959; Thu, 01
 Dec 2022 02:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20221201075324.353632-1-f_l_k@t-online.de> <20221201075324.353632-4-f_l_k@t-online.de>
In-Reply-To: <20221201075324.353632-4-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Dec 2022 11:05:08 +0100
Message-ID: <CANNYZj8rZCrFz9anm4ad0dLD6nJhq7qZbSHECLkmJ+b7W96QLA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv9 4/4] Add entries for the newly added recipes to maintainers.inc
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 10:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174047

Not unassigned please. Why not add yourself?

Alex

On Thu, 1 Dec 2022 at 08:53, Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/distro/include/maintainers.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 03db94824d..1bd0993eec 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -188,6 +188,7 @@ RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcc-source-12.2.0 = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
> +RECIPE_MAINTAINER:pn-gcr3 = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gdb-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
> @@ -229,6 +230,7 @@ RECIPE_MAINTAINER:pn-gperf = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-gpgme = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-gptfdisk = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-graphene = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-grep = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-groff = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-grub = "Anuj Mittal <anuj.mittal@intel.com>"
> @@ -249,6 +251,7 @@ RECIPE_MAINTAINER:pn-gstreamer1.0-python = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-gstreamer1.0-rtsp-server = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-gstreamer1.0-vaapi = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-gtk+3 = "Ross Burton <ross.burton@arm.com>"
> +RECIPE_MAINTAINER:pn-gtk4 = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-gtk-doc = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-gzip = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-harfbuzz = "Anuj Mittal <anuj.mittal@intel.com>"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174040): https://lists.openembedded.org/g/openembedded-core/message/174040
> Mute This Topic: https://lists.openembedded.org/mt/95377614/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

