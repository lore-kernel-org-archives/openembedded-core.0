Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1962C4708D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 03:45:18 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.5321.1672890316264447501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 19:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JJWGuTqJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id d127so29762301oif.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 19:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+yOhFMdHzBQMlMPBP1CzwAK7Z29mGXptoK4QnclMUzA=;
        b=JJWGuTqJf0+b0zf/cfxH5zNseI++GEyL+FBFD6db64U9FNRGoxQDtPIO9qIb9T5FVC
         p0dEfkvJa49flS85F1teWm/Rcv+w6/tHzLqNLdJrQIvVBfT8476DWGYfps5jsy8jj6cO
         eAwc2FnDIq4OMPaa2yIYX/z015ScJi8aOAwfmDeZ4NGUFiDjrT1bO67b78iOx2O90ZqT
         uUxIztu+7uwDRZs7CGgm2LExP2yWA8FRJJbK5WMtYtJ+V9/RU6KO729zlbiEXzaO73m6
         ie3WfhTRr97Vp+7afBar4JagH5BYSofaIB5MUobwdH6a8hsy/Eo6wyyZBXRHQjxLW4u7
         xsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yOhFMdHzBQMlMPBP1CzwAK7Z29mGXptoK4QnclMUzA=;
        b=oG8tvxEyHt9Dy/3nbaa/8B+JA49GoKZQ7pQzQCVnlcl3PPhPPsyFBSmuKbhLKvxxpU
         NXa/neYwU3MHUGVR1ZHl2B4rKt7huFaqAJmp3yeDGbiG5dBZjEAtaA10ZMgTnwkTLsVQ
         QFBLN/1xBIuIewNX36h24TbqXEUE/DxPkivafE7KJiTEVWfea6Po+kCXDlXabnwDciMG
         UsEKgzm4Ka2wKxRlPCiLniGZjBX/eofK6yrFL6mqMrt803Pzt4NxEFdol1V3MdiClPu2
         22ApXLYIU9OemLIerXuSufAqs0PWkWVQ6VvrEG6Y9wl+0+UfqpHlicAJIbbI/nxiH54G
         qqbw==
X-Gm-Message-State: AFqh2kp1lrTB0Ix2vm2G8cpwR2fp4WGiaC3XtbgHY/4zi1mc8HhTOXqe
	jXnrQqpDGaS/BRwVsADH273ODDNQxBWXQklJM3c=
X-Google-Smtp-Source: AMrXdXvDPrVY0VEccEmdHBuwppRCwNqtAz2Dmb/IkShZ7GCYs4kPBFVrZdmqSwR/A458g6u/v3ILRXpUGjn24QIXdYE=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr2761245oia.262.1672890315342; Wed, 04
 Jan 2023 19:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20230104110548.2537259-1-alex@linutronix.de> <20230104110548.2537259-45-alex@linutronix.de>
In-Reply-To: <20230104110548.2537259-45-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2023 19:44:49 -0800
Message-ID: <CAMKF1spQg77ziLGXKtB7GaNp1FBFWgf+RrGgHe7ZUVr0NcSiMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 45/77] python3-setuptools: upgrade 65.5.1 -> 65.6.3
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 03:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175513

This setuptools upgrade is regressing nftables build

| make[2]: Entering directory
'/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/build/py'
| cd ../../nftables-1.0.6/py && \
|       /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/bin/python3-native/python3
setup.py build --build-base /mnt/b/yoe/master/build/tmp/work/cort
exa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/build/py
| Traceback (most recent call last):
|   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/nftables-1.0.6/py/setup.py",
line 5, in <module>
|     setup(name='nftables',
|   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/core.py",
line 185, in setup
|     return run_commands(dist)
|            ^^^^^^^^^^^^^^^^^^
|   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/core.py",
line 201, in run_commands
|     dist.run_commands()
|   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/dist.py",
line 969, in run_commands
|     self.run_command(cmd)
|   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/dist.py",
line 986, in run_command
|     cmd_obj = self.get_command_obj(command)
|               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/dist.py",
line 861, in get_command_obj
|     cmd_obj = self.command_obj[command] = klass(self)
|                                           ^^^^^^^^^^^
|   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py",
line 158, in __init__
|     super().__init__(dist)
|   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/cmd.py",
line 61, in __init__
|     raise TypeError("dist must be a Distribution instance")
| TypeError: dist must be a Distribution instance
| make[2]: *** [Makefile:455: all-local] Error 1
| make[2]: Leaving directory
'/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/build/py'
| make[1]: *** [Makefile:478: all-recursive] Error 1
| make[1]: Leaving directory
'/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/build'
| make: *** [Makefile:387: all] Error 2



On Wed, Jan 4, 2023 at 3:06 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
>  ...ython3-setuptools_65.5.1.bb => python3-setuptools_65.6.3.bb} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_65.5.1.bb => python3-setuptools_65.6.3.bb} (95%)
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> index 1b5f9c7577..2110c4a877 100644
> --- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> +++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> @@ -1,4 +1,4 @@
> -From a0e0873a8ee6674d43e604d66bf66d94fc8eeb6f Mon Sep 17 00:00:00 2001
> +From 2e57369593ede5336f947e7b9903ebc673f98fef Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 17 Jul 2018 10:13:38 +0800
>  Subject: [PATCH] conditionally do not fetch code by easy_install
> diff --git a/meta/recipes-devtools/python/python3-setuptools_65.5.1.bb b/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
> similarity index 95%
> rename from meta/recipes-devtools/python/python3-setuptools_65.5.1.bb
> rename to meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
> index 8dc724e55a..a8bcb3a602 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_65.5.1.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
> @@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
>  SRC_URI += "file://0001-change-shebang-to-python3.patch \
>              file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
>
> -SRC_URI[sha256sum] = "e197a19aa8ec9722928f2206f8de752def0e4c9fc6953527360d1c36d94ddb2f"
> +SRC_URI[sha256sum] = "a7620757bf984b58deaf32fc8a4577a9bbc0850cf92c20e1ce41c38c19e5fb75"
>
>  DEPENDS += "${PYTHON_PN}"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175430): https://lists.openembedded.org/g/openembedded-core/message/175430
> Mute This Topic: https://lists.openembedded.org/mt/96047915/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

