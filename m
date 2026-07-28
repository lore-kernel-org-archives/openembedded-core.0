Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98494C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 05:17:48 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5132.1785215861275998262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 22:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IOIg0Cfn;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2046; q=dns/txt;
  s=iport01; t=1785215861; x=1786425461;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9SY41c6uI10NkEPwBv1V9yJvd0aIateo6vRqOf6dpQI=;
  b=IOIg0CfnoKWYdlOqQsESTJ7bnS1/VnfmbOif2b7zaB/ZWzBWC1aoG7NP
   rn2JrfZJpvvkYseINJwcpOUL8jKTB+/luYG4Zl00BFhqRZ3rdFBpeIKXF
   pWQKNeBjtk+5H7M2PJCGuVkjGR1DeEZtxGDEQ2zCRJV0ZZUtINC1KREV6
   MYpRyYhQBN27YV08kafIFBvjyXgei69z69EPlJR59xtAkgfyJafzCADT0
   TMdqFWHa+JerCKhXfjLFec4AhwrIL37/9OFG2eltyN/bVfstcO5aOOoIu
   ch9AJECBLFE7K/lvb1XrEyxog37s1XcIUeL47v6udZzPDrX8cR1T4kFGk
   Q==;
X-CSE-ConnectionGUID: wbd+ebsWRDejKNzuomH6Aw==
X-CSE-MsgGUID: twC7FFshSISvFfoxmd88PQ==
X-IPAS-Result: =?us-ascii?q?A0DBAgAZH2hq/44QJK1aglmCV3RfQkmWSp4eFIFqDwEBA?=
 =?us-ascii?q?Q8xIAQBAYUFjWUCJjUIDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8Nhl02AUaBDESDAgGCdAIBwFKCLIEBhH3ZSIFmAQsUAQWBM4Vxh26Fc?=
 =?us-ascii?q?ScbgUlEhH6EKWeFeASDLoF4kEpIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBHYEsYYRYIxk5f4ExdUp3LWkBEheBGoM8AoIVAwsYDUgRLDcUG?=
 =?us-ascii?q?QQ+bgeNdSKCPQ8uHDWBTIEdCwKlWKEPhCeBZoo7lToaM4VbpRGZCKNyG02Ea?=
 =?us-ascii?q?YFpATqBWU0jFYMiCUoZD5FFziMkNT0CBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:nZ8B3qOggKy7TazvrR31lsFynXyQoLVcMsEvi/4bfWQNrUolgzcDz
 WofC22GMvffMTb8fopxPN6/oRsP68eDm95qSnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD+kfF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWEsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+pkAAI7N5YnwMp6A0Jo5
 +EfLRBTRw/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY1BPjDS0Un1lM/E5I/mvqjhnDXeDxDo1XTrq0yi4TW5FwpjuS1bIeMKrRmQ+1JgW3Hi
 Ezd/1/YOQ80OtuPzDbVokqV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOHIFhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:mbtzsKj3eLbPepArailZI68b8XBQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:+EvIaGwOfu1vqwAqrAtfBgULEMxmf3fG8038Lk2bL3R0T7i1F3aPrfY=
X-Talos-MUID: 9a23:rC761wtfzUHZ/hfR6c2nmC5Ja+lG+KSVKXsTv5sBq8yIZXxIAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,189,1779148800"; 
   d="scan'208";a="806404518"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 05:16:59 +0000
Received: from sjc-ads-8046.cisco.com (sjc-ads-8046.cisco.com [171.68.208.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 4DD8118000F40;
	Tue, 28 Jul 2026 05:16:47 +0000 (GMT)
Received: by sjc-ads-8046.cisco.com (Postfix, from userid 1784405)
	id DEB75CC160A; Mon, 27 Jul 2026 22:16:46 -0700 (PDT)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shinu Chandran <shinucha@cisco.com>
Subject: [OE-core] [master] [PATCH] boost: make Boost.Locale ICU backend optional
Date: Mon, 27 Jul 2026 22:16:41 -0700
Message-Id: <20260728051641.1997335-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8046.cisco.com [171.68.208.84];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.84, sjc-ads-8046.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 05:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242158

Boost.Locale currently always depends on ICU when the locale library is
enabled. That makes ICU a mandatory dependency for users that need
boost-locale but do not need the ICU backend.

Add a separate icu PACKAGECONFIG option and keep it enabled by default
so existing builds retain the same feature set and runtime linkage.
When icu is removed, pass boost.locale.icu=off to Boost.Build so
boost-locale can still be built using the non-ICU backends without
pulling ICU into the dependency graph.

Tie the icu dependency to the locale option so configurations that
disable locale do not keep an unused ICU build dependency. This gives
distros and SDK builds a smaller dependency closure while preserving
the current default behavior.

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
---
 meta/recipes-support/boost/boost.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 7a343e54f6..9ad23b279c 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -49,8 +49,10 @@ BOOST_LIBS = "\
 	"
 
 # optional libraries
-PACKAGECONFIG ??= "locale python"
-PACKAGECONFIG[locale] = ",,icu"
+PACKAGECONFIG ??= "locale python icu"
+BOOST_LOCALE_ICU_DEP = "${@bb.utils.contains('PACKAGECONFIG', 'locale', 'icu', '', d)}"
+PACKAGECONFIG[locale] = ",,"
+PACKAGECONFIG[icu] = ",,${BOOST_LOCALE_ICU_DEP}"
 PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] = ",,mpich"
 PACKAGECONFIG[python] = ",,python3"
@@ -148,7 +150,7 @@ BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d')}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
-		-sICU_PATH=${STAGING_EXECPREFIXDIR} \
+		${@bb.utils.contains('PACKAGECONFIG', 'locale icu', '-sICU_PATH=${STAGING_EXECPREFIXDIR}', 'boost.locale.icu=off', d)} \
 		--build-dir=${B} \
 		--disable-icu \
 		${BJAM_EXTRA}'
-- 
2.35.6


