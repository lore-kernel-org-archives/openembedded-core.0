Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC426C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 09:23:01 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.86319.1677489778672262613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 01:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ih1vtaxI;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id z42so5660155ljq.13
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677489777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VGKG0KLH5iGglDBeA0bnre2R5oSkAsQ2lgSio2RIsMU=;
        b=Ih1vtaxII42IwMP4UjV2kmZDaAEyUrMdUKsusW3u7rHvgMrBtvwpl1xa7RBBTlHCqW
         UgqP4RVvgv3xl6giet1JARy2+jdXcVlTMPacfZJrt6pDfXpL/RjNJRst4Wukl5rMFCjs
         X5a/GaCAF2ISH8BjmYqws2mQCqodKf4i2SuZgRsOYZwJuOEy/irn1BB7gST8YeT/V27k
         CPSRlu4FZIsX3h7k3uUQlKe/vglmEy/iFtD0qonD7FWWl/+MV8Gjab+LfYMVwsn8ipEZ
         MHFyKBKBUhgzLmF0XpJy4+7HyImRmiHh7bSumg40zo0MwYmXTLa1+TYe/xbQgst4Frmp
         w1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677489777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGKG0KLH5iGglDBeA0bnre2R5oSkAsQ2lgSio2RIsMU=;
        b=KCX9f5CWEABiy5UuGw5N5+SdA2TmM+j+euSpWFFGM+amSXdCLfcI089EIqK+qVyqcn
         QkZ4QZLo+CVj84KupiOkUNCWaZlX9yhhmA9qsEZkwt/pbLbLXwIZjP8F/yyxbWwUQpuv
         vg94yzqd3lzbWJ9OV9a9ABwR/DPXfgFwG16cd8y5IbkMco3iiL/zDr9Lq6xFXFDfjOCZ
         QBZFIDAiN4riQmtfs+8Ad6YmlfWYJqsgqtQ8VjjCLE6JlbHU6ynoArMDBadc85YT8ySc
         BeOyEdB3xssBXkg0vVhMM1lmKMYocasx3iCMm8ABt9c7gjFOqCjZssyMpYbr9TQjSwr+
         tuEQ==
X-Gm-Message-State: AO0yUKXNOwjS1x9zg+5lFaVf3A6WnhK8awxCuhGbSzf6r0y6ld8rtx2U
	nVnYG1X2hInIfrzncf5W6BT2G81+Zz3mlJxRIQHLOUfx
X-Google-Smtp-Source: AK7set/hWkHq0+EfcJiYgcTO8waX3Y1dm3RN7TegAQsxr8Gdr6EP3u1COrH86QUqFwVYlfK1Ra0etSTuVLX9cxFOTjU=
X-Received: by 2002:a2e:8e32:0:b0:293:5f43:c7b0 with SMTP id
 r18-20020a2e8e32000000b002935f43c7b0mr7138082ljk.5.1677489776928; Mon, 27 Feb
 2023 01:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20230227032917.6940-1-vkumbhar@mvista.com>
In-Reply-To: <20230227032917.6940-1-vkumbhar@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Feb 2023 10:22:45 +0100
Message-ID: <CANNYZj9zYWg=4NV4=T8=cnQCQvUttfJyjo2LW45wrOc2j=XygQ@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] Upgrade bind-9.18.11 -> bind-9.19.9
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 09:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177779

Please read my previous feedback; you have simply resent the patch
without addressing the points.

Alex

On Mon, 27 Feb 2023 at 04:29, vkumbhar <vkumbhar@mvista.com> wrote:
>
> Fix below security CVEs:
> CVE-2022-3094
> CVE-2022-3736
> CVE-2022-3924
>
> Fix serve-stale crash when recursive clients soft quota
> is reached. (CVE-2022-3924) [GL #3619]
>
> Handle RRSIG lookups when serve-stale is active.
> (CVE-2022-3736) [GL #3622]
>
> An UPDATE message flood could cause named to exhaust all
> available memory. This flaw was addressed by adding a
> new "update-quota" statement that controls the number of
> simultaneous UPDATE messages that can be processed or
> forwarded. The default is 100. A stats counter has been
> added to record events when the update quota is
> exceeded, and the XML and JSON statistics version
> numbers have been updated. (CVE-2022-3094) [GL #3523]
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../0001-avoid-start-failure-with-bind-user.patch               | 0
>  .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
>  .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
>  .../bind/{bind-9.18.11 => bind-9.19.9}/bind9                    | 0
>  .../bind/{bind-9.18.11 => bind-9.19.9}/conf.patch               | 0
>  .../bind/{bind-9.18.11 => bind-9.19.9}/generate-rndc-key.sh     | 0
>  .../init.d-add-support-for-read-only-rootfs.patch               | 0
>  .../make-etc-initd-bind-stop-work.patch                         | 0
>  .../bind/{bind-9.18.11 => bind-9.19.9}/named.service            | 0
>  .../bind/{bind_9.18.11.bb => bind_9.19.9.bb}                    | 2 +-
>  10 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/0001-avoid-start-failure-with-bind-user.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/bind9 (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/conf.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/generate-rndc-key.sh (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/init.d-add-support-for-read-only-rootfs.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/make-etc-initd-bind-stop-work.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/named.service (100%)
>  rename meta/recipes-connectivity/bind/{bind_9.18.11.bb => bind_9.19.9.bb} (97%)
>
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.19.9/0001-avoid-start-failure-with-bind-user.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/0001-avoid-start-failure-with-bind-user.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.19.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.19.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind9 b/meta/recipes-connectivity/bind/bind-9.19.9/bind9
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/bind9
> rename to meta/recipes-connectivity/bind/bind-9.19.9/bind9
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/conf.patch b/meta/recipes-connectivity/bind/bind-9.19.9/conf.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/conf.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.19.9/generate-rndc-key.sh
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
> rename to meta/recipes-connectivity/bind/bind-9.19.9/generate-rndc-key.sh
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.19.9/init.d-add-support-for-read-only-rootfs.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/init.d-add-support-for-read-only-rootfs.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.19.9/make-etc-initd-bind-stop-work.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/make-etc-initd-bind-stop-work.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/named.service b/meta/recipes-connectivity/bind/bind-9.19.9/named.service
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/named.service
> rename to meta/recipes-connectivity/bind/bind-9.19.9/named.service
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.11.bb b/meta/recipes-connectivity/bind/bind_9.19.9.bb
> similarity index 97%
> rename from meta/recipes-connectivity/bind/bind_9.18.11.bb
> rename to meta/recipes-connectivity/bind/bind_9.19.9.bb
> index 55a06eae5f..375f24e222 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.11.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.19.9.bb
> @@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
>
> -SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
> +SRC_URI[sha256sum] = "d8916799832370edeeaa216111b5577675b99d47fc2554e0f93656afa8d5fb71"
>
>  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>  # follow the ESV versions divisible by 2
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177771): https://lists.openembedded.org/g/openembedded-core/message/177771
> Mute This Topic: https://lists.openembedded.org/mt/97259357/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

