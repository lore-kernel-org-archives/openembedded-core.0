Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588ABCD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 13:32:47 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25339.1780407157365038196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 06:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DEGKuS8I;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1100; q=dns/txt;
  s=iport01; t=1780407157; x=1781616757;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VBrlJI3felb9d4auGNTPWnxarLQyiGER9uab9vrdCP0=;
  b=DEGKuS8IWRVPGwo84t1dYXizY30VbQ19C5LKnYWnbK/W8+OXe7Iumd4i
   nxI0i/jEr/ar51CIXYgBTtv+W3QZ418d951kEpMdC+nCCWuX0jtgDDUEk
   0loj/1HA0PwsrdFBz2RweBkVEVRs1dLN4WHGeDA0YiY0cto7gECQsaTnV
   WbkfeuD8NWSKMaaqIqEXSegitFiQ3hRY6AJe7kdwBGrWm150/f0g8GjcJ
   KHvKxMI81ZO2nQv70AjoNd6L2xUBfXSryi81CeWI60uQ7YhKY+AJ3pn+D
   jysEkDyp9DDhcwdCQz9trGtKGdP3imF327Z/P3+Ad7oDLJVDA6dQj/Ykd
   A==;
X-CSE-ConnectionGUID: 4XvDvAO9SIi0qIFPwvE8Rw==
X-CSE-MsgGUID: PTUpXbShSoCMf1k+W6PyqA==
X-IPAS-Result: =?us-ascii?q?A0DCAgBx2h5q/5X/Ja1aglmCV3JeQ0mTWgGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUGjTQCJjUIDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCcwOzBIIsgQGDKAGBVNsoAQsUAYE4hT+IHYVvJ?=
 =?us-ascii?q?xsbgXKEfYUQhXcEgiKBDIF7jgZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQsbBwWBSoFVaoEEhRUjHwM5gReBf4EraWkQAwsYDUgRLDcUGwQ+bgeLb?=
 =?us-ascii?q?hcPgjUBPFGCaaNEgiGhDgoog3SMIZU6GjOqay6YWKRYhGiBagE5gVlwFUgBg?=
 =?us-ascii?q?lkJShkP22knMgI7AgcCBw4DC5NlAQE?=
IronPort-Data: A9a23:it/DBKlJfblM7Z52gaJJA2zo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeDTyHOf6DYjameth+YI+1pENQv5GHydI3GwI5/HtnFFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKs/jb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdEo5MppKEYfz
 t0ZcCksQCicmc/m+q3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9Ausrnn9ejFfrnqepLE85C7YywkZPL3FbIqEIoLTG50E9qqej
 lr6wnzJCCoaD9u07DTc8TGT2NfehAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:TllMfqMkYLLNQsBcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTnjAsm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AvRBhJmlmQ6fnPRgO02QXCwuVVx/XOSHt0lvOCmj?=
 =?us-ascii?q?pMkdoEKS0Z2eP5o40qdU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1xPq9A1NPQlH8lIzwVwtbIpUrjUj25iTEHAHqpU?=
 =?us-ascii?q?9vOKhO3VzeAjDtCWua9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,183,1774310400"; 
   d="scan'208";a="489061609"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 13:32:36 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 53BA818000300;
	Tue,  2 Jun 2026 13:32:36 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id EFDF8CC1611; Tue,  2 Jun 2026 06:32:35 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] apr-util: Add CVE_PRODUCT to support product name
Date: Tue,  2 Jun 2026 06:31:14 -0700
Message-ID: <20260602133226.3509807-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 13:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238048

From: Himanshu Jadon <hjadon@cisco.com>

apr-util is tracked in NVD under apache:apr-util, while a smaller set
of newer CVEs also appears under apache:portable_runtime_utility.
Set CVE_PRODUCT accordingly so cve-check can cover both the historical
and current NVD product identities used for APR-util.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 927b505c982ed7443aed348ca54b0073ac63d938)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-support/apr/apr-util_1.6.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 1371e262dd..3a5f52d250 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -95,3 +95,6 @@ do_install_ptest() {
 	  cp -r ${B}/test/$i $t; \
 	done
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:apr-util apache:portable_runtime_utility"
-- 
2.44.1


