Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424A2C55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:09:58 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37140.1785924595180495215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ROw9MIhU;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1339; q=dns/txt;
  s=iport01; t=1785924595; x=1787134195;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cMdQWS8yMT8B5zuwnIxtMrCQO6eO4qUN9rQ0t9QuYgE=;
  b=ROw9MIhU4YyxTZ+67fostFScUA8gRBCqi4H7rCQxetTThNc0/NfHyf4G
   jwN3Fy8sSJnb58KSAhX4jEetVJ7wjff9Xe801OXek9BaNNQMgs+NIkqS0
   BFnq+c8t016clCcyBC5xOsQ67/wbykDROaywm+slNtCxdT5eGJv8w2mSi
   MrsBTUPm92N0MrUCcfcaouUPjVg8l5PUkncDnS2OTPKwgV/pCapmOAR0s
   vNHTje29javECmLBABlY5LNf5ljlFDobiR6qPu1q5axkUANJBRhYbtvol
   vApbuzcsGcogGY1ANfFNEP2EY2AwPoTgqKuwLVN/KL4ccPAc63v4t6q7G
   A==;
X-CSE-ConnectionGUID: c7QeBJ72T5SdzHg4J0/O+Q==
X-CSE-MsgGUID: pHw+nW06RdyP+t52XAvqhg==
X-IPAS-Result: =?us-ascii?q?A0BBAgBzCnNq/5UQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q9KBwQBAYUFjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8Nhl02AUYwXESDAgGCdAMRBr1cgiyBAYNaAwsCQ1DbLgEFBhQBBYEzh?=
 =?us-ascii?q?T+IIW2FBScbG4FyhH6CYQICgSUhZYV4BIIigQyBeJBZSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKIRtIxk2fIEJXoEtKmQBEheBCYJ7A?=
 =?us-ascii?q?oJ6bwsYDUgRLDcUGQQ+bgeNaCCCQFM7LKgioQ8KKIN1jCGVOhozhASmaC6YW?=
 =?us-ascii?q?oJZizGWUIRpgWg8gVlwFYMiUxkPkiPMOScyPQIHAgcOAwuRaIF+AQE?=
IronPort-Data: A9a23:hpOxeKOvYUQqSVLvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUoh0TxTn
 2obDGvTP/beY2Lwctp2bo2y9EgFvJbdm4VhTXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD+kfF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1g2Msawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/4xNUwcH9JCxrtMDXNu+
 qA6cHcqLSnW0opawJrjIgVtrs0nKM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY+BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FwojOmwaoOOI7RmQ+1Nvlnbo
 F2eoV71EylZKIHF+ROb63Kj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOb9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:oX2WRK4qnbbK69/nXgPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:nKB2OmwOHYkgeyv1xbmyBgUfRfkoWF+ClkuNGEOqKWk1auXSbhyprfY=
X-Talos-MUID: 9a23:MAR0hwTSdWglg3MWRXT0pC4hMvgwvZ6iGXhOjchci+CaLCx/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="814952131"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 10:09:54 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 3CC7518000162;
	Wed,  5 Aug 2026 10:09:54 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id D19FACC12A8; Wed,  5 Aug 2026 03:09:53 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] xserver-org: update CVE_PRODUCT
Date: Wed,  5 Aug 2026 03:09:53 -0700
Message-Id: <20260805100953.2617379-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242852

From: Peter Marko <peter.marko@siemens.com>

In cvelistV5, CVE-2024-21886 uses CPE xorg:xserver ([1]).
Detected because this CVE is shown for xwayland recipe.

[1] https://github.com/CVEProject/cvelistV5/blob/cve_2026-04-12_1800Z/cves/2024/21xxx/CVE-2024-21886.json#L646

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5311f2a08842612b74472c843be2ae0d47cff6f5)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 815be6a498..9bf5137de1 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -19,7 +19,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
 
 UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
 
-CVE_PRODUCT = "xorg-server x_server"
+CVE_PRODUCT = "xorg-server x_server xorg:xserver"
 
 CVE_STATUS[CVE-2011-4613] = "not-applicable-platform: This is specific to Debian's xserver-wrapper.c"
 CVE_STATUS[CVE-2020-25697] = "upstream-wontfix: \
-- 
2.35.6


