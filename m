Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BCBC5DF86
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:07:29 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3032.1787216847044408415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jTxXqrN7;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1353; q=dns/txt;
  s=iport01; t=1787216847; x=1788426447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2ptD80ZxyQvnafiMwoGTXuQeYk0dBUv2SywrSo0eylk=;
  b=jTxXqrN7KzobEQvq/rLrRpFq8/Nmf7I3fxYcPq+SZg316V4mYG4HCH/4
   27ce/hC9Po+o65e+8WY+id2bJ4zvPuUMCIg89fFImo1wak0mnphGn9qnI
   f4hqFUvMrNodQcVS9T7dpBZ+eUR0KkRlg1rwe2JOaNDg8l2PCa8hppBxA
   d9a0DNJjYutWJfQbKfj5i1VkEQd1r0Q0K9Y22oPNfYQkNfu1gzZpDUmeS
   cSZxskntgncGK1havfaYIg0d9C4BcjeHVrbmdpRxibp9L8Z3InAl+wfO6
   PFuT9UDAe9DdXGbvHBIs3353SFoliZ95sbuASSOiXT95mH8Mg39wpXHzF
   A==;
X-CSE-ConnectionGUID: xi3Zlu84TUeOqN2b/7Vksw==
X-CSE-MsgGUID: J3CaaSz3R2KOn4z/cOWjxg==
X-IPAS-Result: =?us-ascii?q?A0BCAgBrwoZq/5EQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdKwsBGAEtMFxEgwIBgnQDEcIxgXkzgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hRCFeASCIoEMgXiRUkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJR?=
 =?us-ascii?q?Q4JFwsYDUgRLDcUGQQ+bgeOUSCCS4EOgUSnCqEPCiiDdowhlToaM6psLphap?=
 =?us-ascii?q?FqEaYFoPIFZcBWDIglKGQ/eXCcyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:bTni5aAix4sWdBVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApD0rgTIAz
 mQWXGuPP6mDYGGmKdl1Pdng9hgC7cODzdZiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8imYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE0/Q1PkUrbdEkx+tQGEcU/
 7tHFjMWcUXW7w626OrTpuhEj8AnKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWcHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFUrgOmzaoWMEjCMbecOtU+Rn
 XCdxT7aJRdGJpuU7gWH4n3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvqS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:I8bJfK4Ooba4kEsT8APXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AW6PMp2jSAtJbHN21HQyfV7jPMjJuYnyG/nPNcxO?=
 =?us-ascii?q?ENGtOUZvPQxjPxqB/jJ87?=
X-Talos-MUID: 9a23:eeeS6gbBmYUsH+BTlWTHjThZJpxSuYeJDhwf1p4hhMuUOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812896271"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:26 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 62F0B18000203;
	Thu, 20 Aug 2026 09:07:26 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 030AFCC12A8; Thu, 20 Aug 2026 02:07:26 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-dbusmock: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:25 -0700
Message-Id: <20260820090725.60771-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243826

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-dbusmock (0.31.1)
Before -> After: python:python-dbusmock -> python-dbusmock_project:python-dbusmock
Newly caught CVEs: CVE-2015-1326 (.pyc code exec via AddTemplate)
Status: patched (fixed 0.15.1)

Note: The original commit targeted python3-dbusmock_0.38.1.bb. This is
adjusted for Scarthgap, where the recipe version is 0.31.1.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0405d7d4e476964239e1c27c987ec9c12372e95f)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
index fc32c6bbb6..4145ee8ea7 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
@@ -11,6 +11,8 @@ PYPI_PACKAGE = "python-dbusmock"
 inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
 
+CVE_PRODUCT = "python-dbusmock_project:python-dbusmock"
+
 RDEPENDS:${PN} += "\
     python3-dbus \
     python3-unittest \
-- 
2.35.6

