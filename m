Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A307C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 17:35:52 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.238.1638898542568649260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 09:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ftB2CQeB;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id p4so15406855qkm.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 09:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7sdVkbRF0hbtYOXJlB0h+sQxn9XSvL1cRge/eaG7Cuw=;
        b=ftB2CQeB/b4DYcgy+qzC0IYO0TJUJinnAHGbRosAcY3Po24bpQZRjAFmrwES8zxiGW
         3J4aG809HY//hJIDf5br3ivp+hJJbXxUI7xywOF3oprc4W4gOYeblp5ksmc5U0Snrzq3
         C3tQAtJAjRI0zj4hn7ufQSfC5hvczhAADZxp4di5zi8mbi9gzDGH19XYC7rnmqaDXFYZ
         GTW27GU0Vy0MtVHyoO2ST2mMUWw4q059bUC6tm8oswaIyf8MZ/O42/nL17CTlNqjRScz
         O78mS7gSwt1lpcdjAjHAZGsi6Ar2mmgp8Ucvtm4UqzVIQIninBByBOUp/8JY04Em/4x7
         gX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7sdVkbRF0hbtYOXJlB0h+sQxn9XSvL1cRge/eaG7Cuw=;
        b=KjmX3dyKPF6SrvGbAWCfinslLEGvUrO0cUzw99Z2OCnpSP/9lFEZN8UKE0LI4YYJQr
         oTKXA++vnXxxSKD4cwqKkssbk1M5Hqeq5hoiK00nmGLhswKqy/ORdnf0WOIo+ysWEjis
         0981QpuZmSYJbMdScnWFW/f5GcMDuqfPQ52+Qml7HDoEzYny+Eso1kfU0+OzHC1PLNUz
         7AFRRdSCmU9B1vvjhJam8whR3hORs+7St05HD9n3CNlgEoXBRWtNtAqXG2LnJsA+WN9n
         VAtL+PWFI4knfm84keCIKsPvCEStLTZwtysvh1IUamJJTYw9IqqvsJpH4r6o6LXnLdwQ
         hIGA==
X-Gm-Message-State: AOAM531EE0b91XgCCDLq0aLk+wWGgsltIL6LFxg/8b1b/M6jKAv6YfKN
	5UfNUImoXOkO6a6qmcmVQWREQIOIPUx2OCQVceI=
X-Google-Smtp-Source: 
 ABdhPJxrztCTSxdIOYRKE9J3kRwj3Ab1n9T4SZT9R+4csTOeuaxa1+G+z6NEeeoQB3hWvjeOdaRnR0jCz5tmc1nFgcI=
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr689936qkb.72.1638898541652;
 Tue, 07 Dec 2021 09:35:41 -0800 (PST)
MIME-Version: 1.0
References: <20211207170002.1573-1-jdmason@kudzu.us>
In-Reply-To: <20211207170002.1573-1-jdmason@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Dec 2021 09:35:15 -0800
Message-ID: 
 <CAMKF1sq+VHjwCEB9rrRLb7R5Xy=7DyLbPJFFk78GWrFrP6o8GQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] tune-cortexa72: remove crypto for the
 default cortex-a72
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 17:35:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159325

On Tue, Dec 7, 2021 at 9:00 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
>
> The cryptographic unit is optional for the Cortex-A72, but it was
> included by default previously.  This breaks building systems that
> lack this functionality when using tune-cortexa72.inc.
>
> To correct this, add a crypto entry in the tune file.  Since CRC is
> optional for ARMv8.0, do the same thing while we're at it.
>
> For platforms that had been happily using tune-cortexa72.inc, a slight
> degradation of performance will occur using the default.  To correct
> this, simply add:
> DEFAULTTUNE = "cortexa72-crc-crypto"

sounds good to me. meta-rockpi might need to pay attention here once merged.

>
> Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us> (rewording commit message)
> ---
>  .../include/arm/armv8a/tune-cortexa72.inc        | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> index 2a510bd45bdf..3651cf6e802b 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> @@ -6,8 +6,16 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
>  require conf/machine/include/arm/arch-armv8a.inc
>
>  # Little Endian base configs
> -AVAILTUNES += "cortexa72"
> +AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
>  ARMPKGARCH:tune-cortexa72             = "cortexa72"
> -TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc-crypto} cortexa72"
> -PACKAGE_EXTRA_ARCHS:tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72"
> -BASE_LIB:tune-cortexa72               = "lib64"
> +ARMPKGARCH:tune-cortexa72-crc         = "cortexa72"
> +ARMPKGARCH:tune-cortexa72-crc-crypto  = "cortexa72"
> +TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a} cortexa72"
> +TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72} crc"
> +TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crc crypto"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72 cortexa72-crc"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
> +BASE_LIB:tune-cortexa72            = "lib64"
> +BASE_LIB:tune-cortexa72-crc        = "lib64"
> +BASE_LIB:tune-cortexa72-crc-crypto = "lib64"
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159324): https://lists.openembedded.org/g/openembedded-core/message/159324
> Mute This Topic: https://lists.openembedded.org/mt/87569173/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

