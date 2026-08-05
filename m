Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12ECC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:10:08 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37129.1785924601266609622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VL4MbSHk;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=955; q=dns/txt;
  s=iport01; t=1785924601; x=1787134201;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LHOsWHeJq4OzxKBB9LdieciN0sE5b/kdup6x9YrmJiw=;
  b=VL4MbSHkN+bXreJuSqet0Xci0CmN/FSByYodOC1iqHo8uc+/9i7R/NOk
   xy5PP/556a3YFVRlq/OQPH5YNYWMHJ5QpIXWXOekWdrLkFBjtIqFWTGT4
   OY+Db+63+Kx0Q5Ghu5yL+V9+iwhVTEnTKV3Mw4/yVcPYuYmPeVn50sPhs
   WbibDPSHUd99hPpAdKOsQ5tvQf6RdetN397pMy/1tml9hpYl23M80pv6q
   f7xDBA1TC7pMWuuR77rz1zPUzgTEYnRvgnRyO/QZvb7mqWcIYyBrFZlJD
   TpVk96Zkgnpk4bdISBFCAVoOXmlTuQwqLAXjqMVa+Wmq4V73VKBe73kAL
   Q==;
X-CSE-ConnectionGUID: b1Piak08RRaPF9l3srdD0A==
X-CSE-MsgGUID: O3H59wnhS366aQDtFxKiCw==
X-IPAS-Result: =?us-ascii?q?A0BCAgBiC3Nq/48QJK1aglmCV3ReQ0mTWQGOV5I3gX4PA?=
 =?us-ascii?q?QEBDzEgBAEBhQWNaAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBRC0SDAgGCOgM3A71ygiyBAYMoAYFU2EkNglgBCxQBB?=
 =?us-ascii?q?YEzhT+CfoUjbYUFJxsbgXKEfoIfgWuBBoV4BIIigQySUUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSiEbSMZNnyBCV6BLSpkARIXgQmCe?=
 =?us-ascii?q?wKCem8LGA1IESw3FBkEPm4HjWgggkCBDqhOoB5xCiiDdYwhjz6FfBozhASma?=
 =?us-ascii?q?C6YWoJZjzqSR4RpgWg8gVlwFYMiCUoZD95cJzICOwIHAgcOAwuRaIF+AQE?=
IronPort-Data: A9a23:EjiFn6PRiui2K17vrR30lsFynXyQoLVcMsEvi/4bfWQNrUpz3zcAy
 2QdXW2GbKyDYWfzfNl+YIjj90lS6J6EytVmQXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1g2Msawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/83NEA/PtVIwNx+OU8f8
 acDMjwhNjnW0opawJrjIgVtrs0nKM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY0BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FMggeO2aYGIK7RmQ+1yxWbF9
 33A/1+iXE8TDfCD5yqm81mz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOTNIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:wO3k66nEjGz0Lm/knsGW4/CYvVrpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:+AcxiGBM+RHLfbn6EyM+zE8dGZh1SEfU9FmBJxSjE2pFEJTAHA==
X-Talos-MUID: 9a23:NVd8NwXWyE3GNUTq/Bi3pGwzK8Fo2P/wVkk0vYkoq+qFHjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="799331359"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 10:09:54 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 1508418000100;
	Wed,  5 Aug 2026 10:09:54 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id A7D81CC12A7; Wed,  5 Aug 2026 03:09:53 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] flex: update CVE_PRODUCT
Date: Wed,  5 Aug 2026 03:09:53 -0700
Message-Id: <20260805100953.2617262-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242855

From: Marta Rybczynska <rybczynska@gmail.com>

NVD uses westes:flex for recent CVEs in flex, based on the GitHub repo

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bb6aa4b4acb16c59b66aa55b33053e3e8749e72)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 52543b6e02..e424aa58e8 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -83,4 +83,4 @@ do_install_ptest() {
 do_install_ptest[vardepsexclude] += "UNINATIVE_LOADER"
 
 # Not Apache Flex, or Adobe Flex, or IBM Flex.
-CVE_PRODUCT = "flex_project:flex"
+CVE_PRODUCT = "flex_project:flex westes:flex"
-- 
2.35.6


