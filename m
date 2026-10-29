Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4361.1793244331738680729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zsU9JgTT;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c791d5460so20102216d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244331; x=1793849131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAgS8/D1o/lFD5laaJwVJFSKdpqEtar/rfWfZYSU5no=;
        b=zsU9JgTTLK7/OL24uvjfZZ9W73Gf2rrSXRq8Rt/oBbsg+uJZD9V7ItjRh+QsPPT8Q3
         xM9Gg2PtbYYY/S/wK1mIOInRUCERHl3lzowYUFglhNh6rlWbjxy73NuptURaI72U0AV/
         DP2NmbpLQU1x+Y3LFGuKI5sj2UH7kHgwomYU9i+eID5FKr4aTzBF7w+gKyiYKBHUSC1b
         w1YupwbJfWWGKQKdUp3IeHFpQ/mrFR1blQ3HT/xinHf8Z4Bxn3OUUsFE/XCNADOTvMpf
         2l7pLG5+eXq5zfE21ObVVQjsHRkI+UR8b0VVlsqKzcyuzP487Iv7VcI5TXrPi1we49wQ
         7gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244331; x=1793849131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAgS8/D1o/lFD5laaJwVJFSKdpqEtar/rfWfZYSU5no=;
        b=xhgdHjPXOg8XKnl4x8oP5S0y94iBXw1HgZKd9l7lxIetl4z9m7GGSXimDRXSMCDkXv
         OrOGImxWoM+sqXxhPpx7PyZ5ealj6oH6SwqsHadQd0AF0iwswgWgyk8oPcrt9XRFnKGn
         mOM/qqSv3GB+rxVNwIOnwFmzP2XKB332xS5pWyydoXpr4wCd0vN84pQHZfXOdndJvoJ8
         KDOh7NV4C2kS05XYuqAQMgedoS4Xd3HoQ+DPuhOwPigzoozUSDkyLCIJQZ6yEc6b5zIh
         +x2t4rWf7Jfsil4M8Qd2A1EkXYJNTCy736wH1/o7q/KyWg9GcEi1vGMzxV5S9DJipBlR
         Rouw==
X-Gm-Message-State: AFq9FYKZ7yqyJOpPUwXLEKotftM3h9d51PdBT6XaUlN+gWrUpMmMX0+e
	0WDifX0sWnZ7Yt3/mMwEiSewDJxoj8wsOLJEkG0snUa1wR3t+KLcxGUs
X-Gm-Gg: AYBFou0udK1NQl15hbesRck4alo3OVM94YxWhhOztBpAm5mISgc2HGnhbowi/l9gm80
	K0JQuiCDX+YIQbOjffdVDOMQ27B6FrBeQ2w62NvlgfASAu0f+19Nf7mI3+hDu5ciir3fEuxY9m6
	5AtSxddlOSl7GOffaggFU4o3dAiujqzY6eNflZTsoHdTxrQBuvNMK+nBv3r17PJZibq7W0zcTe0
	yY6fqzUQr6hmnQSLNx0Tv92KSnEm3F4cDQLOfkfwNfcMjaF5Rw2+vPQ1SHmtbzed1sJzJaponn/
	cGduuOHHmuO2HFoXm0daFZ9iAFz0LSKeuBYmPp4LLMob6JFn3XjU+W9H4+j7ClVFVcFDQej6Ogz
	Ac11HER3ozW1qFqvfl4K4qhVOy7TM9ywLNikB8iik15n88SNpyl75bALXg/BV0BZYLr5Wf4bgiR
	GZ5nUq57slUDGb1L4hgBDCkiFvO9pvsz1EORwNI2UQRfSqeY3tG4isgQCbAXkk6AWBnPc3vPaol
	qWrhrdLZmkkSQnQbLCw9NS1g9ZCiXaJsEN2EquXIBP3maawC8/1tzkcsjlzYODvgb4xEUUKtXCQ
	XI8RC0LcuBYG/jG55Xw8pHjLNO/ctUvjkdZBEYOZ758zASlLZIPO+XVQCtutfjIkgNYejCfhutP
	IyHWMFh42pR/FDehw57m+KKSidhJQnZC144SGQmDLCy3C/y/OVTbvyEQTGUp7ue5w4gzD448hZY
	Wy0pHnI+7pN/BgilJUPRP9/sVB5N/E0V3cXTF+CUkqwyK+nw==
X-Received: by 2002:a05:6214:3d0f:b0:91b:87cc:6d4b with SMTP id 6a1803df08f44-91c7ce21814mr75757566d6.8.1793244330425;
        Wed, 28 Oct 2026 20:25:30 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bda586sm147529056d6.8.2026.10.28.20.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:25:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/11] linux-yocto: consolidated pull request
Date: Wed, 28 Oct 2026 23:25:15 -0400
Message-ID: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248857
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

This is my combo-pull request for the refernece BSPs and linux-yocto
in master.

I was chasing some intermittent issues, which turned out to be a
hardware problem on my build server. So better late-than-never, here
these are.

Bruce

openembedded-core (7):
  linux-yocto/6.18: aufs: refresh to upstream aufs6.18
  linux-yocto/7.2: aufs: refresh to upstream aufs7.2
  linux-yocto/6.18: update to v6.18.57
  linux-yocto/7.2: update to v7.2.11
  linux-yocto/6.18: update to v6.18.59
  linux-yocto/7.2: update to v7.2.13
  linux-yocto/7.2: yaffs2: backport upstream fixes and restore

meta-yocto (4):
  yocto-bsps: update to v6.18.57
  yocto-bsps: update to v7.2.11
  yocto-bsps: update to v6.18.59
  yocto-bsps: update to v7.2.13

 openembedded-core:
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 24 ++++++++++++------------
 meta/recipes-kernel/linux/linux-yocto_7.2.bb       | 24 ++++++++++++------------
 6 files changed, 36 insertions(+), 36 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0
