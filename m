Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B76EEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:12:47 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.4866.1688699561993186554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123692424"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123692424"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:12:43 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3AEFCD6C0
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:12:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 30E13CFB9B
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:12:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C9C441050;
	Fri,  7 Jul 2023 12:12:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] taglib: upgrade 1.13 -> 1.13.1
Date: Fri,  7 Jul 2023 11:12:31 +0800
Message-Id: <1688699552-2480-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699552-2480-1-git-send-email-wangmy@fujitsu.com>
References: <1688699552-2480-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27736.002
X-TMASE-Result: 10--2.982200-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mr5sPqcQkI8pt9MesWtSDfsoD4
	BvtwgHRpIPDNxiJyzHSkUIaZS9ssK+UOexubVvUffOaYwP8dcX6MIZwc2RxJVt9RlPzeVuQQgg8
	W5tsFXID7tBxFpWhryf+1065WI2+4L/tBTZzO5Q3vVbHa5Rs8t3LhUU/qa4OGuRI/000hJfGV7V
	ueZm2O7PDMF4GcHV9aeTjw/FyRX6QfE8yM4pjsD3AruZnjhopuLzP5snaeb1Qqtq5d3cxkNXJGq
	vIuGJ8FH0881IpDgMHp6T8BAX2T1KFNiBO6r8DEFvExRHMQhLXFsqhamKb8TkOpm1/L5wIEm38u
	RWINiuD0p85yaDu0TTKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 03:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183993

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fixed parsing of TXXX frames without description.
 * Detect MP4 atoms with invalid length or type.
 * Do not miss ID3v2 frames when an extended header is present.
 * Use property "DISCSUBTITLE" for ID3v2 "TSST" frame.
 * Build system improvements: Use absolute path for macOS dylib install name,
   support --define-prefix when using pkg-config, fixed minimum required
   CppUnit version.
 * Code clean up using clang-tidy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/taglib/{taglib_1.13.bb => taglib_1.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_1.13.bb => taglib_1.13.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_1.13.bb b/meta/recipes-support/taglib/taglib_1.13.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_1.13.bb
rename to meta/recipes-support/taglib/taglib_1.13.1.bb
index 6560bc3660..3f0a759f95 100644
--- a/meta/recipes-support/taglib/taglib_1.13.bb
+++ b/meta/recipes-support/taglib/taglib_1.13.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0"
+SRC_URI[sha256sum] = "c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 
-- 
2.34.1


