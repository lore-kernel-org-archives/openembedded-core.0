Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B37C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 06:04:28 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15292.1782799458433843772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 23:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bXcJmZ4o;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1330; q=dns/txt;
  s=iport01; t=1782799458; x=1784009058;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q9jWmUKKgZceROyldYJLr3Ao+ibilVcrZgZSuIP+JEk=;
  b=bXcJmZ4oXKAWNLL7xfWbvMyNXtJLabeZ35ub9DbzEuOblPoQaIclgjCM
   DAfwE/73Mq/aPZ5T1w2ZBCR+e+ZfgZR2kVEo6Lw4RCjBwdPfnaenjIdE0
   3snzqjbBzShzTdHKfGb2gFIyEyrJAD7s3yJkpENkSz5Y14kU/r99Dieal
   YN8vZB90+gCEqHmJ9FdctYow0h/AewKkxqAHl/dHp9FD17WLKOL9U9yJ8
   3P/TkGjIeHGDd2igDAKhYec5pvFaYIocHSW4XqPDibh+laY5/NLYujn2Z
   y1XK5mMXE9uf8N9LotK+NRgYSMeEjhZFVdMQx9HS6+DNQANx2kqlcmEh1
   g==;
X-CSE-ConnectionGUID: 7ADaA7CMSAyUfJaScf7GaA==
X-CSE-MsgGUID: NpxN3H+3SACi6LqGKAcEsQ==
X-IPAS-Result: =?us-ascii?q?A0AyAwCQW0Nq/5L/Ja1aglmCV3RfQkmTWgGCcKAcDwEBA?=
 =?us-ascii?q?Q89FAQBAYUGjU0CJjcGDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GXSsLARgBLTBcRIMCAYJzAgERBrYJgXkzgQGDKAFDQVDbLAELFAEFg?=
 =?us-ascii?q?TOFP4gfcwGEfCcbG4FyhH6CQx4BAgEBgSSBBoV4BIIigQyBeFCOSUiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgWmBBIR9Ix8DOX+BMHVYZ?=
 =?us-ascii?q?hUwNYECARIeCoFSMAMLGA1IESw3FBsEPm4HjGMXD4I9gQQKCCICgkiSdWmRf?=
 =?us-ascii?q?KEPCiiDdYwhlToaM6psmQiOCpZQhGiBfiaBWXAVgyIJShkPlzbIICQ1AgEBO?=
 =?us-ascii?q?QIHAgcOAwuRaIF9AQE?=
IronPort-Data: A9a23:fWlJfqIkCt07CGmQFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS12RWz
 2MZDT/Xa/zbZzShe99/Pd+y90tU6JTUxoU2SAEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnR0
 T/Oi5eHYgH9hWUsajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0xJW0/FNIz391eEFxA1
 /UjIz5SQRmq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLo3h/+hnHz2aRVTqUmeouw85G27IAlZjeC0boeOJozWLSlTtmCAt
 kSd3yeiOTgxNYK70BWm23mBndaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1ffDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:+mdHeamqWS+4ok89LBEKGvDoX/jpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3A0VTKA2iZTwo5ZsTgRi/Aq6E0ozJuLVTxxV6PCGq?=
 =?us-ascii?q?DIHdURp+cclSep4xtup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AHI9dTQ+gUw4+L3R+ulboSs2Qf+Fw84L1KANWqrw?=
 =?us-ascii?q?tupegLANTEjywlw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,233,1774310400"; 
   d="scan'208";a="501653484"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Jun 2026 06:04:17 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 6C12018000224;
	Tue, 30 Jun 2026 06:04:17 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id C9982CC124B; Mon, 29 Jun 2026 23:04:16 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18.49
Date: Mon, 29 Jun 2026 23:04:10 -0700
Message-Id: <20260630060410.1203985-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239849

From: Ashishkumar Parmar <asparmar@cisco.com>

This upgrade fixes CVE-2026-1519, CVE-2026-3039, CVE-2026-3592, CVE-2026-5946 and CVE-2026-5950.

Changelog
=========
https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../bind/{bind_9.18.44.bb => bind_9.18.49.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.44.bb => bind_9.18.49.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.44.bb
rename to meta/recipes-connectivity/bind/bind_9.18.49.bb
index d424edcb4e..723a09e739 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
+SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.35.6


