Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D95E7EE16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 02:33:43 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id r9so14535084ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 19:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=JMeLG4aoPhlqRq/CmS8AXmrh0zBTgZ24CRiu5o65R/s=;
	b=IQaXmQUDWuYiWr+qWtDaY4Z7FjEVqmBGjic4V098wItjVmVlheVAi4Yqyg9lnlktvA
	y1AbUlTmDx7eua3PA3hCYFkgeiId1GuHIc4VCN+fcoSQpydJXXvWRieqthdLKtLR9A1C
	Z0gkTO/yOLT5JaQHdaw6AHZP5u35tOpBHJWq6v4gQXi8lXkjgCxJc2hFWGcS9pZ1Nplf
	GmVslqjd7o5CiPUf5DFZOaYfMBx6O0QzF2hZ1HlBjwSnvJBG7D0EQEwPYh9u9FT4HI97
	7P9FR8d2iHt/R6vAaOt4A1mC+jdgkAasueDKPraC0Lv8MWdl230F3BATwQa8KK1WuEkG
	CXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JMeLG4aoPhlqRq/CmS8AXmrh0zBTgZ24CRiu5o65R/s=;
	b=M6ke/JcBn1mPgjdEb5o9cQnUk0i4+0quCSy7zlHB9LrTVP9E1Fa96NRk64rAhLkbph
	hnp2G2/znQmxl7gBvMb/TR0m81mkHMBmn7VlgtTJPGUc1Lmy1qEfEWLd2DbkCHNd21Cy
	EH7ixnQeRevdRIWnV0IHZvtWO1zHBukuUGBUOw8E/EQIHtR+vxV/Izan1FRf+IlmwpMr
	fHpM79C9IW/jCJILV5y7iOPLs8cgpo9ElDqeqIwvA2Uxpg2DuPn/iogL8nB4okTVUq3W
	fZuQHl1WHaW94D78YOncmS/Cg3pxda6zTKiTXxtaB27bPJRqTk+d/sdyLBh/RcYXQXft
	+NSQ==
X-Gm-Message-State: APjAAAW4FhlQss0imA3qZgc412LyLZ3xq9V0C0GLrK1DD4SRz/3Qzwz/
	SxLgimoTR751BFwPOn0nranbhu5G
X-Google-Smtp-Source: APXvYqxDW+HkH1MC1ArFxINTg1E0tt+Tr2jKF0yPwhdndbGP8twqjNoB5B24LYM31t44bkexH9isjA==
X-Received: by 2002:a2e:8155:: with SMTP id t21mr12393314ljg.80.1563158023434; 
	Sun, 14 Jul 2019 19:33:43 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id h3sm2894161lja.93.2019.07.14.19.33.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 14 Jul 2019 19:33:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 04:33:37 +0200
Message-Id: <20190715023337.18431-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] iproute2: update to 5.2.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2019 02:33:43 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../iproute2/{iproute2_5.1.0.bb => iproute2_5.2.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.1.0.bb => iproute2_5.2.0.bb} (68%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.2.0.bb
similarity index 68%
rename from meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.2.0.bb
index 6854a13004..8ef529d91a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.2.0.bb
@@ -5,8 +5,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
           "
 
-SRC_URI[md5sum] = "a2b8349abf4ae00e92155fda22de4d5e"
-SRC_URI[sha256sum] = "dc5a980873eabf6b00c0be976b6e5562b1400d47d1d07d2ac35d5e5acbcf7bcf"
+SRC_URI[md5sum] = "0cb2736e7bc2f56254a363d3d23703b7"
+SRC_URI[sha256sum] = "a5b95dec26353fc71dba9bb403e9343fad2a06bd69fb154a22a2aa2914f74da8"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1


