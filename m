Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38FFC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 12:12:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.9847.1647346375477271955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 05:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DCqRXCGP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647346373; i=@fujitsu.com;
	bh=+GskYC9Qwwujgnv7Z+y6vVN4VdwJ9jjtHjlZGBaSdD8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DCqRXCGP/NsUQILL4tef3OM2rwuoCZXGde4+3bD4vUq4jBEZDXodVYnQsN5MZx7jH
	 TvVLDBiuV1WRHZuIhQB4h8BNeiBw1cyrCwKZjy67Urb6jIJcy6W9Dbyo2Vpkq8qteA
	 QzeDK8G3YDJ1DIAH83RCO/aIdQGFUat11EMPBmjRuIGT1eTW2Z2QykiE6NChQFo8go
	 yCryOw7y+UQj30yRH3AxHXpj3kTaUU1dRX1z7lmkymb9Qz8AiIltU9OQHyWF+o6mrL
	 gECIVJQRfrWfyof/8xkR3NY3cuN6rbm4o2xOwbEnNF25dCQIuCC3p0PeYv3Si/doy4
	 UohviDQcCJKBg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8MxRfdok0G
  SQdNBFos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPyjcfsBRuEK+5MOM/cwNgm0MXIySEkMINJ
  oueDbxcjF5B9glFi0v3J7CAJNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxuwesRFjAXeLRt
  R1MIDaLgKrEzsN/wOK8Ak4S9/p3gNkSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIWoUJWZfbm
  aBsCskZs1qY5rAyDsLScssJC0LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGprqmuoaGZnqJVbpJuq
  lluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBlhKMevDHYyL+37qHWKU5GBSEuUtLDdI
  EuJLyk+pzEgszogvKs1JLT7EKMPBoSTBm1IPlBMsSk1PrUjLzAEGO0xagoNHSYT3ZSlQmre4I
  DG3ODMdInWK0Zhj0+Ere5k5/n76u5dZiCUvPy9VSpxXDRhHQgIgpRmleXCDYFF4iVFWSpiXkY
  GBQYinILUoN7MEVf4VozgHo5IwrzvIFJ7MvBK4fa+ATmECOmWetB7IKSWJCCmpBiYl4RC7p9e
  ObVgbtp7ztjZTvkG6rsGNaUdLe49KPLlc+0W5OXmzt2xlafyDqzrlny0/bRb7Zz2zNvaIZduy
  1vzJzvmrkubYRGm8ePDYpveN9q7tbhvz13X1x+U2Lmc/lH/HWC4v9/m90sYmy4TIgvZNWnw2N
  69VVR2MK7ibxfNzPldVzcdZ3XFMGxgLrX8e/2e24ueiTrXdl+qZlb//7nqpGGjPyVjTplxxIO
  1T15Xvxj3Pis/YPTpkP8M5QbRxkZ1BusNjy1vz2BI8csS/Hd77zjHyz5nzp3TYvLM5rM4tqvk
  +g81m51wtNXvm/8tfvZq05PePHLU/TEfSRb9m7pLeH7ElzmbKusA7z/neLFJiKc5INNRiLipO
  BAC7o0TSPQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1647346372!11608!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27076 invoked from network); 15 Mar 2022 12:12:53 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 12:12:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22FCClF3010308
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 12:12:52 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 12:12:45 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] linux-firmware: upgrade 20220209 -> 20220310
Date: Tue, 15 Mar 2022 20:12:28 +0800
Message-ID: <1647346351-79061-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 12:12:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163236

License-Update:
 year updated to 2022
 Version of some driver files updated
 Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inux-firmware_20220209.bb => linux-firmware_20220310.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220209.bb => linux-firmware_20220310.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
index fe51892eb4..fa0f906db0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
@@ -72,7 +72,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=d357524f5099e2a3db3c1838921c593f \
+                    file://LICENSE.amdgpu;md5=44c1166d052226cb2d6c8d7400090203 \
                     file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=ed3d7426e4df06fbadcca24ebf00cc5f \
+                    file://WHENCE;md5=45a9c4a92d152e9495db81e1192f2bdc \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e2e46fa618414952bbf2f6920cd3abcddbef45bfb7d1352994b4bfc35394d177"
+SRC_URI[sha256sum] = "5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182"
 
 inherit allarch
 
-- 
2.25.1


