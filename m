Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8087EC7EE2A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:03:58 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.26612.1685610235196119952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119096874"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119096874"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:53 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ED094CA1EE
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:50 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EAF29D5B23
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3358188851;
	Thu,  1 Jun 2023 18:03:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] curl: upgrade 8.1.1 -> 8.1.2
Date: Thu,  1 Jun 2023 17:03:08 +0800
Message-Id: <1685610221-29015-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--6.255900-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mr1jd10P+8LE9hGCe0pjZhr4IS
	RhVH2oABbP/Ei6ZWBVnzMy7C5b6e7NsoDJz5OAzcEhGH3CRdKUV15R4szu6uonWXr1sFb6UMULf
	C3mZUjoRS2sJ5DlYpVm0+CMNUhL8lltMZDSrqDEZIcJTn2HkqsReK/B+WKxKszAdJD7JeNMPu/Q
	yUVIt+aaIkYkaiW44WAV3bWT1nydov+0FNnM7lDQPZZctd3P4B8boZEVitthiMJxigKCCiS0Jmf
	ftVAWC9Fn50AtTqIL55OPD8XJFfpB8TzIzimOwPC24oEZ6SpSkj80Za3RRg8JmpUbSfX+RDMhXt
	q0uh6kTqjHbJ3jJ8uiaX71HiH3nI4LMLmAzUE38=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182058

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- lib1560: verify more scheme guessing
- page-header: minor wording polish in the URL segment
- page-header: mention curl version and how to figure out current release
- RELEASE-NOTES: synced
- configure: without pkg-config and no custom path, use -lnghttp2
- curl: cache the --trace-time value for a second
- libcurl.m4: remove trailing 'dnl' that causes this to break autoconf
- http3: send EOF indicator early as possible
- scripts/contri*sh: no longer grep -v ' '
- cf-socket: restore Curl_sock_assign_addr()
- libssh: when keyboard-interactive auth fails, try password
- configure: fix build with arbitrary CC and LD_LIBRARY_PATH
- urlapi: remove superfluous host name check
- http2: fix EOF handling on uploads with auth negotiation
- lib: remove unused functions, make single-use static
- scripts/singleuse.pl: add more API calls
- configure: quote the assignments for run-compiler
- misc: fix spelling mistakes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/curl/{curl_8.1.1.bb => curl_8.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.1.1.bb => curl_8.1.2.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_8.1.1.bb b/meta/recipes-support/curl/curl_8.1.2.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.1.1.bb
rename to meta/recipes-support/curl/curl_8.1.2.bb
index 89ab61fc59..d84f7d0f07 100644
--- a/meta/recipes-support/curl/curl_8.1.1.bb
+++ b/meta/recipes-support/curl/curl_8.1.2.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "08a948e061929645597c1ef7194e07b308b22084ff03fa7400b465e6c05149e5"
+SRC_URI[sha256sum] = "31b1118eb8bfd43cd95d9a3f146f814ff874f6ed3999b29d94f4d1e7dbac5ef6"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.34.1


