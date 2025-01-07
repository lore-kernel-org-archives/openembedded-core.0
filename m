Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9910DE77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 11:35:47 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web10.14598.1736228747621394640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 21:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=E0btxhBd;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: mmeerasa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2509; q=dns/txt; s=iport;
  t=1736228747; x=1737438347;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=coBmJ+NI0o278N+1UES7vd8XeSDxfmXb8p1j7gN987U=;
  b=E0btxhBdhjUNp8o+RGll4KhyNdyIjUIii1/iO6AWAMrRGxUF/J5O+H2B
   d4Hd74eCkO0Bkm+GV3mhKDcXJfrkGyGbiW4398jn445ajoLrfx3v41hN5
   kz5vrjcHsm4RrUPuolwRWTuPtEfmWFWTlzQA5E7zJSOJWk2b9tXH5FEDg
   o=;
X-CSE-ConnectionGUID: Zo0Y24WZR1a5LDTQdYxGLg==
X-CSE-MsgGUID: 5TqYhGy1TMeliKcPb6pHeg==
X-IPAS-Result: =?us-ascii?q?A0BfAwBZvnxn/4//Ja1aH4I9gkt2WkJIA5ZAnhuBJQNWD?=
 =?us-ascii?q?wEBAQ85CwQBAYUHinYCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThXsNhl02ARgBLYEMRIMBAYJkAgERBrA9giyBAYMoAYFS2TiBb?=
 =?us-ascii?q?YFIjUpwhHcnFQaCDYJQgi2CYQMBgiuFdwSHbIZmhx6PcEiBIQNZLAFVEw0KC?=
 =?us-ascii?q?wcFgXMDOAwLMBWBW0Q5gkZpSTcCDQI1gh58giuEXIRHYS8DAwMDgzqFZoIXh?=
 =?us-ascii?q?QRAAwsYDUgRLDcUGwY+bgeaZQE8g20BDm0TKgIEHVqBMRGTUpF1oQOEJYwYl?=
 =?us-ascii?q?S4aM4QEpk+YfIJYoFWBGiuEO4FnPIFZMxoIGxWDIglJGQ+SG7RVIjUCDC4CB?=
 =?us-ascii?q?wsBAQMJkXQBAQ?=
IronPort-Data: A9a23:sTcI4ahb9PBVnMa3cQGFX2cFX161MREKZh0ujC45NGQN5FlHY01je
 htvDDyOP6nYYzH1KI0nadi39E5V6MfWmNBjSAVvr3wzEH5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOCn9SQkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZSFULOZ82QsaD9Msvrd8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUq/b5GWz1xx
 8ZBIW0pQiy6i9Om75a0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgx/5JEWxI9EglH6djBVsluOrII84nPYy0p6172F3N/9IYTQFZ4NwxjHz
 o7A1znFGyAaG83G9R+I9nOPjdfFwzvbVY1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmAHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:Hzr36asyLBMld8a1n8K9zO397skDfdV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldK0Ec
 xbAs9D4BqaNykfsfrH
X-Talos-CUID: 9a23:IjzXPm0w/5y8IZNdphZ+U7xfKMd9QyeB80XqekblLUpVcbGkWXC09/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AI4tOlQ/sfpvp7xH9XCpRhyCQf5pU+pWuJ1FUrbA?=
 =?us-ascii?q?Lv8inPhR6ZS+9gTviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,294,1728950400"; 
   d="scan'208";a="302830567"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jan 2025 05:45:46 +0000
Received: from sjc-ads-10442.cisco.com (sjc-ads-10442.cisco.com [171.70.96.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id B5FD718000253;
	Tue,  7 Jan 2025 05:45:46 +0000 (GMT)
Received: by sjc-ads-10442.cisco.com (Postfix, from userid 1839048)
	id 39934CC12B5; Mon,  6 Jan 2025 21:45:46 -0800 (PST)
From: Mohamed Meera Sahib <mmeerasa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	pooadire@cisco.com,
	Mohamed Meera Sahib <mmeerasa@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] db 5.3.28: Ignore multiple CVEs
Date: Mon,  6 Jan 2025 21:45:39 -0800
Message-Id: <20250107054539.4002240-1-mmeerasa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.70.96.195, sjc-ads-10442.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 11:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209451

Analysis:
- Unspecified vulnerability in the various components of Oracle
  Berkeley Db was identified as potentially exploitable without
  authentication. Later these were closed by the Critical Patch
  Update (CPU).

Reference:
[1] https://www.oracle.com/security-alerts/cpujul2015.html
[2] https://www.oracle.com/security-alerts/cpuapr2016v3.html
[3] https://www.oracle.com/security-alerts/cpujul2020.html

Signed-off-by: Mohamed Meera Sahib <mmeerasa@cisco.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index a7d061e0da..d93e77a1ee 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -120,3 +120,20 @@ BBCLASSEXTEND = "native nativesdk"
 # many configure tests are failing with gcc-14
 CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
 BUILD_CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
+
+# The risk matrix of Oracle Berkeley Db was published in July 2015 by which many vulnerabilities
+# in different Oracle products were identified.
+# https://www.oracle.com/security-alerts/cpujul2015verbose.html#DB
+# The Oracle Berkeley Db issued the Critical Patch Update Advisory in July 2015
+# which determined the status of the vulnerability whether applicable or not.
+# https://www.oracle.com/security-alerts/cpujul2015.html#AppendixDB
+# Apart from this, different CPUs change status of the vulnerabilities e.g.
+# CVE-2020-2981: https://www.oracle.com/security-alerts/cpujul2020.html
+# CVE-2016-0682, CVE-2016-0689, CVE-2016-0692, CVE-2016-0694, CVE-2016-3418: https://www.oracle.com/security-alerts/cpuapr2016v3.html
+
+CVE_STATUS_GROUPS = "CVE_STATUS_INGR"
+CVE_STATUS_INGR = "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 \
+CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 \
+CVE-2015-4783 CVE-2015-4784 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2020-2981 \
+CVE-2016-0682 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418"
+CVE_STATUS_INGR[status] = "fixed-version: The Critical Patch Update of Oracle Berkeley DB discovers these vulnerabilities may not be remotely exploitable without authentication."
-- 
2.35.6


