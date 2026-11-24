Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14745.1795513690117840712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:48:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=caZfN61d;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1597; q=dns/txt;
  s=iport01; t=1795513690; x=1796723290;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WaeUBsPjvV0jtPwKv+Fuhmdr+GSuyBthjwYA1YjaxPY=;
  b=caZfN61dRnzecYAzJtZvAKlvfl7WKD5gja9O9i+TCu5s2uAxsQpYveG4
   dR7qcRsTdv9mRRsghB57TKBPnCKJDzRd7EZTD8pFcPdK3ambbYfoUfhB1
   r06tLvIOwipvpZsYLiqpagu6X0dxE89aLSrYcK8DPOpdMnHoD53xAWErv
   6IKdoL5h+/EvanqCU8zld5i3WNJpLzQck6tZm+T6MrwztHXio+W9XkHBI
   4kQvsXLVtQZUHcUBPOasUeojzkzTrVZJ96MoZbYz4V5xaTKaGav0WQK4v
   mz2b86//brJXfEtkSeaFUE1XvROiBZX5i61W423t+dZFVlUHMoG2E02vS
   Q==;
X-CSE-ConnectionGUID: RlsGw/6vSrmtF2RVphsoYA==
X-CSE-MsgGUID: ZkRKRMd/QfiFzUjfkiam1A==
X-IPAS-Result: =?us-ascii?q?A0D4AgBZWwVr/9RK/pBaglmCV3VgQ0kDlCeCIZ4sgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD+OagImNgcOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QSwEYAV1cHQEmgwIBgnQDEQa6XoIsgQGDKQFDQVDbMwELFAGBO?=
 =?us-ascii?q?IVCiCR1AYR9JxsbgXKBFYNqgQWBXAICgiuFeQSCIoEMgXKMeYoaSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2A?=
 =?us-ascii?q?oJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAIND?=
 =?us-ascii?q?HQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ+bgeUFIMaA?=
 =?us-ascii?q?WADKioCBByCDKV1oREKKIN5jCSVOhozqnILmH2OCpZRhGqBbwUwgVlwFYJuA?=
 =?us-ascii?q?QEBMQlKGQ+OOYNrhRPJSCYyAgEIAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:V3oJ06OcvKOTPqrvrR3xlsFynXyQoLVcMsEvi/4bfWQNrUpzg2MPn
 DBLUWvSb/bZMTfxfYsgbNiz9E0E7ZXSyIQ1SnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWUsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj689qF24petMGwfxyHU8Uz
 8IAKCsKXznW0opawJrjIgVtrs0uNozveYgYoHwllGifBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2M1BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FIpiOCwYYSFEjCMbfdWpGWig
 26Bxmr4LAMnNtKcyDOAq1v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTUk+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:n4l2kK7ohroYBptxuQPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AgKWOwGtUQjRIQ81hTxpKFZSO6Isfdmby0zCOPXS?=
 =?us-ascii?q?iDHpHEoerUV+L/5JNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AZXeY4wxNzd0aEKOFWRR1gUrQZomaqJatMmM3tJl?=
 =?us-ascii?q?BgseFGz5NOTmejT2yG6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60005968"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:48:06 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id E4AB2180001F7
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:48:05 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 9B2D5CC2EF3; Tue, 24 Nov 2026 01:48:04 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] python3-mako: Ignore CVE-2026-102991
Date: Tue, 24 Nov 2026 01:48:04 -0800
Message-Id: <20261124094804.1558240-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250993
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- The advisory describes drive-designator traversal on Windows in
  versions before 1.4.2. [1]
- The fix switches the Template URI check from os.path to posixpath.
  Linux already uses posixpath for os.path. [2]
- Wrynose provides Mako 1.3.12. [3]
- Yocto documents not-applicable-platform for Windows-only CVEs. [4]
- Hence ignoring the CVE for standard Wrynose Linux builds.

Reference:
[1] https://github.com/sqlalchemy/mako/security/advisories/GHSA-5639-2j2p-m4mx
[2] https://github.com/sqlalchemy/mako/commit/000ed85e4e48771eff460bf4fc721fb43de80e08
[3] https://layers.openembedded.org/layerindex/branch/wrynose/layer/openembedded-core/
[4] https://docs.yoctoproject.org/6.0/ref-manual/variables.html#term-CVE_STATUS

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-mako_1.3.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.12.bb b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
index 48f6608..e76d7c9 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.12.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
@@ -11,6 +11,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 SRC_URI[sha256sum] = "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a"
 
 CVE_PRODUCT = "makotemplates:mako sqlalchemy:mako"
+CVE_STATUS[CVE-2026-102991] = "not-applicable-platform: Issue only applies on Windows"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.35.6

