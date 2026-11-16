Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3736.1794864134901009053
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MlQwtbcV;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so3465743137.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864134; x=1795468934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8CG0VVlxeSgYCoKmASt8Tix2jJvESRJOCxptgyB1bHM=;
        b=MlQwtbcVZsGdDcgSyUnwmJdNbOaiA41wplo1CuytJ6b148jf5PyJ7/g7Y+BsbZo2Or
         XaUsucWlglnSqrsnBlHSr1hJGA8Lx8K1YkLDLlC9cW7AYObPmpBV0r976kqB5naYbLIU
         F5wHkEoOQrDiNjQY2E0Fmot3/ickdawFHFsNTKFW8Pg2Z2SZtWSJQoFSGZ1oWWmU1dAc
         0WulhkZaz65GjVaCuBZB4D/phxpPZ0njvOJiRiM+2f8w1hgm0d0XKTtgPVHmPSrg8Mff
         5csVz2eOFHyNTRcR3rhXfI04xylAc7YY2Qp24agyFxtB8uBBYE9Kh3zgSlxwdwM0PkuA
         vMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864134; x=1795468934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CG0VVlxeSgYCoKmASt8Tix2jJvESRJOCxptgyB1bHM=;
        b=PaAYD41A5XXDKfqkYV58lqi/XRmE9615wF3lsPE3bRyR9QkI9UiexaX6r+M0KGBANC
         bgjxlUp8PUet3UsBIYqRWM3rYMwpkF2N4SWVePdmUJaiWVUcgO1rGNT/gECEp+3JNfz2
         5MPbumjpaeYOasdkN97nraZYF04ITQcAkfPH6XiIOk5zZQPXuOokQUPjwP8DupA7GLsO
         7dVYmsHdPWVPErtPmsv28uf7rQZirPBVgstxhZCCid9INBhYJP6QDq5+unxwELacz4JK
         TIGOpsWF4LcnuLEB87xeyLiRFy8mh3N8kiwc/sjUOeNgiu3gbdHgua6Zlo264zi9tMh6
         rG+w==
X-Gm-Message-State: APuU4Z+W6XUUKcO5rFyz45q/cMRaQTnC4OLNmJReU+loCYn8PXIjj+mh
	qGpo9R5rtz+n2MHfAjM1qI6NuoqZbQznpoKDf+kZcwkRTzj7nAs6nunR
X-Gm-Gg: AYBFou1p9GokfPUkx4wnT+p+Wv60N6m1mfTX6UnJLf2qNXtLrZZ6Grg0DasE2xcyuFI
	VbgfntjFp98/ABcbPYPY4Gmp7E3QTgmn6ey0G2jWZTLgBIC4906KcANJ5Uv6amqiqdttJutoMNm
	pWGw9mHatIT13zh1jfVuItMKNWBGBNFargTaPntqg8sWhtWfX+VkL0Joe5rdvn6rD+SMxpugzMh
	PrgG8Qrt4c9/344FK0DyNGcXILqA9oQOEmRPBXstwP7BnIjHoASJTMNWigXuVsHKqCDRt8Glztq
	TnFxpfkDerZosz6DGHY2uRwRhnBx/WYHNU2JT9kcbIkU1CZgy9ecVGy6WlhJSx31zF5k1IHuirg
	/NkKVA70PmrMEpMK/17cb+ZPwgcnqIydOhpTD4UrOMySKBBP+Ya1IeGjhwSQ2u+RD9zL7u516PS
	vzOmXyK8oyJraaNfKn0iGfOO8d0p4zGBT2RY69Q7RjHHNVLYJWmFSjFrMXZ0G6z1sO0I6HuhRpd
	GzWfJGwsT00NGvcAVKn3KL9oTzaRHZy/fjjun2ZHet3f9bjBx6A1maKlYXRDhPxUsH55HigL3Tc
	szreuDpYwJmAuTGypasOvQE+N1od5ExElie+bjDBTjLlNiEAIK7hTdQvpfvozo21jauo6Oxasol
	2ngqcznzfJ+1B2CAHsPtmkDiK9ePb6AzW/rjFuwI397RSz9t89UTsAP2OMVKDmu2kqZ8rOE2mNV
	YRJh5Wd8Om5Nqxo+IORU736xzCOik+274+v/hoSlpGfp0=
X-Received: by 2002:a05:6102:a52:b0:7c3:2f13:d905 with SMTP id ada2fe7eead31-7d64d4683ecmr4851607137.3.1794864133443;
        Mon, 16 Nov 2026 13:22:13 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e0c53a8sm896282137.11.2026.11.16.13.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
Date: Mon, 16 Nov 2026 16:22:06 -0500
Message-ID: <20261116212211.4068570-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 21:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250382
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

(relatively) routine -stable updates for the kernel's in master.

I'll send updates to the active stable releases shortly as well.

The -dev kernel is now 7.4, I'm holding on libc-headers, but will
bump them shortly as well.

Bruce

openembedded-core (3):
  linux-yocto/6.18: update to v6.18.63
  linux-yocto/7.2: update to v7.2.15
  linux-yocto-dev: bump to v7.4

meta-yocto (2):
  yocto-bsps: update to v6.18.63
  yocto-bsps: update to v7.2.15

Pull requests:
  openembedded-core: git pull https://git.openembedded.org/openembedded-core zedd/kernel
  meta-yocto: git pull https://git.yoctoproject.org/meta-yocto zedd/kernel

 openembedded-core:
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 24 +++++++++++-----------
 meta/recipes-kernel/linux/linux-yocto_7.2.bb       | 24 +++++++++++-----------
 7 files changed, 38 insertions(+), 38 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0
