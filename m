Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA639C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 03:41:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.21752.1639453262576513345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 19:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GBDHgbLp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639453260; i=@fujitsu.com;
	bh=HMSoHgrcW2eYIN8u1mmaK8J7VL0Vq4oXV4blVFTXWGY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GBDHgbLpDhUBETvC4jPf7ZDBmqUoXEqgjZdcg6EWu+dB18bEW2jrPESJPZIiLFIeg
	 eewTNBmr0jyHUIzstj+NUJI4gjHGwRljV/UQF1mYM328x+ht2DzVeldCEtI40M1MQb
	 6g7wbjD2T1L9f3ICRg+YYaYw1kPxGqAxbSyeNFoaPCIqixVx0gf4m67q7SZLBbnVgx
	 nBY2lA4Vod40gFQagUUTwYagkqyhRl9jI5BtqiKuzYQmSDJoakDFAbl1bpxNksS9Kl
	 BLrI8xGnLuIPBbg74/Td49tDg0BRtspASv0jjomw7nnZvxInW8aZvS1CIC1KbGPPTl
	 av2gdL4bLdoPQ==
Received: from [100.115.1.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id F6/26-30341-C4218B16;
 Tue, 14 Dec 2021 03:41:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8ORqOsjtCP
  RYO0Obos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeN4xyrmgjbuimXTahsY33B2MXJxCAk8ZpTY
  8nEfO4RznknixO1rzBDOCUaJO1uXMnUxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAlcTsZ+fZQEpYBFQlVn2MBwnzCjhJbJ24kBXElhBQkJjy8D0zRFxQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNVUlFmekZJbmJmjq6
  hgYGuoaGprqGukYGxXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYECmFDOe
  3sG4qe+n3iFGSQ4mJVHevX+2JwrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4O0S2JEoJFiUmp5ak
  ZaZA4wOmLQEB4+SCG8MD1Cat7ggMbc4Mx0idYpRl2PVgemrmIVY8vLzUqXEeVn4gIoEQIoySv
  PgRsAi9RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4pQaApPJl5JXCbXgEdwQR0xLHc7SB
  HlCQipKQamHS/P7i/ZfL5u96rDf42SNdotjaZXjhfsGzm09vB278/qlJSvMm+ffk9rQ1ph7Sz
  n29WviC9VeGsh6rv7lPTe5bodyuuj7kox/irYHMu18x/AqGRtnxRbqsdnnZOt7rqqzdVmE2FQ
  U2qZ+/3VUcrHdpj7uVcuSqi/uWMlMd1jScPL/cK6Gn6eUdf7rnm9fWC7Ckj83TVhKizuV5uca
  96Nqzfo/Kp+fXJAyw5zAfqDBT0lxXdea6zr3ZjdlPt2XhP55t2IZKzZ09atnpOgPgP4+2a6y6
  Etu/XY+P99KDm/qnyTqtIjncHn0XyVz/PmGUgpMrWwHpy8/Z1srOU1V3Dv05Ymub2Mu6g78r9
  iWvj5ZVYijMSDbWYi4oTASDPI15PAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1639453259!57661!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28280 invoked from network); 14 Dec 2021 03:41:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Dec 2021 03:41:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BDA03100238
	for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 03:40:59 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B29B3100231
	for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 03:40:59 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 14 Dec 2021 03:40:46 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] libcap: upgrade 2.61 -> 2.62
Date: Tue, 14 Dec 2021 11:40:38 +0800
Message-ID: <1639453238-29672-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 03:41:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159680

Replace BUILD_GPERF with USE_GPERF since it is now reserved.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/libcap/{libcap_2.61.bb => libcap_2.62.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.61.bb => libcap_2.62.bb} (95%)

diff --git a/meta/recipes-support/libcap/libcap_2.61.bb b/meta/recipes-support/libcap/libcap_2.62.bb
similarity index 95%
rename from meta/recipes-support/libcap/libcap_2.61.bb
rename to meta/recipes-support/libcap/libcap_2.62.bb
index a3a6e10b89..e08cac7218 100644
--- a/meta/recipes-support/libcap/libcap_2.61.bb
+++ b/meta/recipes-support/libcap/libcap_2.62.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "c1e29680f8bcc51b172e9a8eb9a7a4d7255a00a14301a7c2cf96d1febf7449a5"
+SRC_URI[sha256sum] = "190c5baac9bee06a129eae20d3e827de62f664fe3507f0bf6c50a9a59fbd83a2"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
@@ -32,7 +32,7 @@ EXTRA_OEMAKE = " \
   lib='${baselib}' \
   RAISE_SETFCAP=no \
   DYNAMIC=yes \
-  BUILD_GPERF=yes \
+  USE_GPERF=yes \
 "
 
 EXTRA_OEMAKE:append:class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
-- 
2.25.1


