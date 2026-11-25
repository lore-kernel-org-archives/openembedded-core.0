Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36413.1795585636802208073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BpOlAE9Q;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1451; q=dns/txt;
  s=iport01; t=1795585637; x=1796795237;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=f8ka1IU1iMNtWv82G/lfRTyATeoBNg2nF4IpIt0wA7o=;
  b=BpOlAE9QW++scZdCsopajpEwXiMJQ7NlBlqR2oXLgEThVAgyr3Cz1/ag
   Ew79TN5aBm0mXS/mJRBwhtGY2/MepMMwIzksXUl0EKfY06luWAbeDarDb
   LYl5PZkmRJtRozbUcpVqEF+Cy5q5v/hV/ZMAK1g3DTioKuh+TrI2k3e7E
   j+QPnCKEcx0b7ZB3JybOEZNwznRonCbMn43ofK+H5IHA6e0SeRNKfs1WE
   zrXorRGnLJN/UpvLuv1KHIpuiuL6PgquMB//9xCE7Ledp2op3svSRn22O
   G8czl5zwK2IttJRJ5P/g7YdllgjMFBek0OtWO3ujsMjfqclFU/fuLeOtw
   g==;
X-CSE-ConnectionGUID: AY3ymaRzSX2FdUCgEZ22eA==
X-CSE-MsgGUID: s8JpXMm3Ry6t8psp7ztfKw==
X-IPAS-Result: =?us-ascii?q?A0BHAgD8dAZr/9FK/pBaHgE8DAILgWWCV3VgQ0kDlCeCI?=
 =?us-ascii?q?QOeKYF+DwEBAQ89FAQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZATAgEDMgEYAT0gMSsrGYMCAYJ0AxG5cIIsgQGDK?=
 =?us-ascii?q?QE/AkNQ2zMBCxQBgTiFQogldQGEficbG4FygRWDaoEFhAuFeQSCInoSgXKMd?=
 =?us-ascii?q?YodSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdg?=
 =?us-ascii?q?SsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VD?=
 =?us-ascii?q?GcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGFiELNBgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5QTgxuBDiwEHIFlJwWlcKERCiiDeYwklToaM6pyC5h9jgqWUYRqgWg8g?=
 =?us-ascii?q?VlwFYMiCUoZD445g2vOWyYyDi8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:xrQybKgz8vV8SNhYASUE6gnBX161NREKZh0ujC45NGQN5FlHY01je
 htvCz2EMvqMMGv3e4x2Pdmw8RlU6sPWztBiTgRtpSEzEXljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvje8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUxy71mBGh05
 8coch4BUzuMqtDsmr+SH7wEasQLdKEHPasWt2slyXTSCuwrBMiTBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXaz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGISOJIbbGpUL9qqej
 nmW3XzJJxRBDs3B1Wqd6WrzlPPBvjyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:3/ZmuqnGuj2ckMul28BL9dgWlLLpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:9GQbiWwYxBq/8F+WKQ4gBgU9K5s0d3Tn3kzgeWG0NE1mZY/PE1K5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AkxhSUw5GrxpWyy+0Aplm8La+xoxzs4a2OGUIyq8?=
 =?us-ascii?q?X5dXULTdoZCWBgheoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="63629786"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:14 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 5C37218000189
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:14 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 99763CBEF8A; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 07/10] openssh: Ignore CVE-2026-106589
Date: Tue, 24 Nov 2026 21:47:08 -0800
Message-Id: <20261125054711.2691239-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251147
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- This issue concerns platforms lacking file descriptor passing and
  unprivileged PTY allocation, notably QNX 6 and SCO OpenServer 5.
- Wrynose builds OpenSSH for Linux, where the affected platform-specific
  configuration is not selected.

Reference:
https://ubuntu.com/security/CVE-2026-106589

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 76ae969b8a..44d9881815 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -60,6 +60,7 @@ CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos',
 CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-106588] = "not-applicable-platform: Requires the macOS 27 or later SDK and Darwin sandbox; Wrynose builds OpenSSH for Linux."
+CVE_STATUS[CVE-2026-106589] = "not-applicable-platform: Requires platforms without file descriptor passing and unprivileged PTY allocation, such as QNX 6 or SCO OpenServer 5; Wrynose targets Linux."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.35.6

