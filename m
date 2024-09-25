Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1386AC369AB
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 08:40:46 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.10628.1727253642773902978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 01:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0Hly4v7;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75c6ed397so68219221fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727253641; x=1727858441; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J3hSLWFopzHsM0b3FNMSQ9thblY7VH5ngi3nCy2IiVM=;
        b=I0Hly4v7uWfNYNRsdOld42YSj33pOZYnAVKV9u6WrRqPtnYYEMyfs4s7Wll3huqoI9
         66hoVTDXjkSB6E3Uhw5U2oBJE0g6wvxCDeBNMsHIy5GKm6MX9HYp9+VaV8PKaooltDg4
         yf/km+/e0oKmB77Ml4oCls4E2q6zWHUPR54IkM5HKCh955isSwr8hl1gjvGNVocCddoB
         ZmsSX2HEsv7Mp3YQvRVZJhhYs7DyaAnZWp2M9t67gLF54m9R4cfnRJe/CvFweksQTVi7
         XGt672u1qg9am04OG5aZmWi3eW4puuh3WUA2m/7bALi/ernuFdhP8lFQ0Xh7WXmOoGtT
         Ivaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253641; x=1727858441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3hSLWFopzHsM0b3FNMSQ9thblY7VH5ngi3nCy2IiVM=;
        b=xJFdbQfcnEV0/Mc/pDzXTjiM8U9Uk28lFd0mw3FhbGzrqoebLYMQA3kH8f6JSr/su8
         obS3kVYM4GzuyyL5jAletrlJkJwRltmInABYKA2umZyntofjIhVnLk/Zm/SQ105rRbD9
         E6CQi3UWaoWdmp7b2uCdokY/fxLwkSc+4DCBn5B7hKHGmcDqwXuadJka2n4knwORs4jC
         e915d4IFF0Bgv3YOnH7k7+pxZnR4R3i7btkdzlBOFciT+bG00MQ3SFPkzcU4SzxEFox2
         OoagQ6D1SEmmcKBG24MaGMmfCPnYPo5mdA/baq/raGllfrPhZ7FsZBi85xwv+VACeLgJ
         W8ww==
X-Gm-Message-State: AOJu0Yyc45FLFUoLAcwESynE0HfVDvmPQt8d/ADAMGde3vdNgyaiXqlz
	0s9sDmovu3NdNvZUMO/pYnT+n0oWG3LzxNHuZAMzcg7T/DHc7UxQGX6rf/IQsGCaIHuuLugMuT+
	+S6Z5cfP67TUageaOofAD5QVqUbk=
X-Google-Smtp-Source: AGHT+IGLBWYTvy0kLfWrMFh1I33yqMaeH0TLwxDJc+ENcQAYmQE7UAP7BjOysRFE8cWNMb/SqtQELVDItBXpJvdSIwo=
X-Received: by 2002:a05:651c:19a5:b0:2f7:500c:2212 with SMTP id
 38308e7fff4ca-2f915fdb910mr12084381fa.10.1727253640279; Wed, 25 Sep 2024
 01:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com> <1727246960-20665-44-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1727246960-20665-44-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Sep 2024 10:40:28 +0200
Message-ID: <CANNYZj_0rt2LEV4SOgexT36rbBQ0edBFVZm+q048xV7_vUzjEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 44/47] systemd: upgrade 256.5 -> 256.6
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 08:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204943

systemd-boot-native should be renamed at the same time.


Alex

On Wed, 25 Sept 2024 at 08:50, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../systemd/{systemd-boot_256.5.bb => systemd-boot_256.6.bb}    | 0
>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>  .../recipes-core/systemd/{systemd_256.5.bb => systemd_256.6.bb} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd-boot_256.5.bb => systemd-boot_256.6.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd_256.5.bb => systemd_256.6.bb} (100%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_256.5.bb b/meta/recipes-core/systemd/systemd-boot_256.6.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_256.5.bb
> rename to meta/recipes-core/systemd/systemd-boot_256.6.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index 83dcd65a83..d6a3332efe 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>                      file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>
> -SRCREV = "b45730389ba025489ec8d445bc91534fef515c28"
> +SRCREV = "230f5613c97175985f878580ef2f5f1937963da6"
>  SRCBRANCH = "v256-stable"
>  SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
>
> diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.6.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd_256.5.bb
> rename to meta/recipes-core/systemd/systemd_256.6.bb
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204937): https://lists.openembedded.org/g/openembedded-core/message/204937
> Mute This Topic: https://lists.openembedded.org/mt/108643638/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

