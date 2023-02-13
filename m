Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CC4C6379F
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:42:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.5831.1676256138249971225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bkxDvaie;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676256136; i=@fujitsu.com;
	bh=U7kH2jS+GlkUZeGCHHs6STzwjUhcj1UCbCzhMuG/0HM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bkxDvaieLovUvcW6WUWtu3XLtvBw7CUypRHmMNtuUJE/x57klA7Qaai8yVDTi3j8/
	 DdeMeyKhWfddZdaBYikOuqBDCEynhHsGNyPQxr7nMIGrEfVUp/XdJ8njNMG27UiT62
	 dSFf+G6dXb8x0wegPS+EJUn4vt5NeRmvLvou3/Wg7Ex9xkWJL5mr+9pxq3mpHiBott
	 SDWY5vXK9oOrW8sN7HPgLXBmUCxhu6tXKPCqUn2qZ+EKjZ9p9qvGcTljl6ZV78oUWW
	 lqdDj8117fs8Qr6++ete8ov39vCqDRtmcy4mY7AtmfLwRdGwLn5jUfnSVzsqfu/0Ci
	 oayl2w9D0XbDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpNu++GW
  ywfJuA4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePN5h/sBat5K5q2r2FpYGzi6WLk4hASeMAo
  0X50FxOEc4VJovNdA0sXIyeQs5dRomtTFYjNJiAlceP+f7YuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MIC5hJf3q1jA7FZBFQlHr6cCWbzCjhJXF5/HqxGQkBBYsrD98wgNqeAs8T32T9ZIVY5SZ
  yYuIQJol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2lxalFZapGusV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYOCmFKsJ72D80vtX7xCjJAeTkihvH8fLZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  FILgHKCRanpqRVpmTnAKIJJS3DwKInwWkwASvMWFyTmFmemQ6ROMRpztG/vOsDM0bkfSAqx5O
  XnpUqJ8/IvBCoVACnNKM2DGwSL7kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl3zwKawpO
  ZVwK37xXQKUxApzzmAzulJBEhJdXAxLCjb17j36kaTL/knHPcQiNZ5C/IRklVPKm14DsuvELC
  MZfv/exY99ro2X6e/kwZv669Mds6wWKWnf/cXkmG7KlPGz7uyHBjiNmRG1mvVbxr3j6JltTQ3
  t/aFt7qF2Xr8hN8svcpzb6WWzWrds41JrV7V1a8Mfu9/fuJVtMTsf1PIr809/E0codv+/LlmN
  OWJTnpXMlRLI1JTbe5ZiwuuX39ykGhubJpa5h+CzJq15uYf5WZXNG8cnfm9+R3tU2L5xcfmP/
  tOEe54hufzHWLD8dosd60i6i1m65z/NvNfWe4rm5Ic7qSK2b5Wbjk/6NJM7nlG7LmO8QLnFzw
  4IIGe65g2WRNhuCFu24sZgxTYinOSDTUYi4qTgQAiCF96WkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1676256135!149165!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17391 invoked from network); 13 Feb 2023 02:42:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:42:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7CC4A1AE
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:42:15 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 711EA1AD
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:42:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:42:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.66 -> 2.67
Date: Mon, 13 Feb 2023 10:42:02 +0800
Message-ID: <1676256123-19590-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676256123-19590-1-git-send-email-wangmy@fujitsu.com>
References: <1676256123-19590-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177082

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Add description: # +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0-only */

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/libcap/{libcap_2.66.bb => libcap_2.67.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.66.bb => libcap_2.67.bb} (94%)

diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-support/libcap/libcap_2.67.bb
similarity index 94%
rename from meta/recipes-support/libcap/libcap_2.66.bb
rename to meta/recipes-support/libcap/libcap_2.67.bb
index c50e9d8cc7..4d4d6d9df1 100644
--- a/meta/recipes-support/libcap/libcap_2.66.bb
+++ b/meta/recipes-support/libcap/libcap_2.67.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM_PAM = "file://pam_cap/License;md5=0ad4c9c052b9719ee4fce1bfc7c7dee4"
 LIC_FILES_CHKSUM = "\
-    file://License;md5=e2370ba375efe9e1a095c26d37e483b8 \
+    file://License;md5=2965a646645b72ecee859b43c592dcaa \
     ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${LIC_FILES_CHKSUM_PAM}', '', d)} \
 "
 
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2"
+SRC_URI[sha256sum] = "ce9b22fdc271beb6dae7543da5f74cf24cb82e6848cfd088a5a069dec5ea5198"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.34.1


