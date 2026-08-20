Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39414C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:08:00 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3041.1787216875055117220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PrrmCnki;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1322; q=dns/txt;
  s=iport01; t=1787216875; x=1788426475;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JurpM6yOhP0da4RW4RwJIcK3xluoOOM1YI3e+Hebf/0=;
  b=PrrmCnkitl7GfH5Xy7gDck9uGa/P8Ml+FNf/Z5g4OQTEcvoEMqfKdNjx
   mbuJKgfnm9Q7GQaeUL8xdrzY51yVrunonaC5bx3jqcjIB7LoXRdKAk8br
   bdxV+yyq9anuRqNE348jtY+7T6ak8MkUDmVU+fJ1n3s6md+mIibKwk7jt
   UWgixwZTb/QUy/wm0ZFwFyf/OBrXBeMRb4ThzF2sIy5IwB/ZJ5tzPR061
   CM221WfEfENhmhrk5KwAlK4cj+uvDxIfLpne2PPPeCaADuHa/9JeotQyc
   ARm+AMka0J3zUowA9UUqIZaEqCfus+hXFWsyOududYkDfmTLaim8GKLKO
   g==;
X-CSE-ConnectionGUID: hlsgv1TDRLuWgaSkjqoIFw==
X-CSE-MsgGUID: pcusgTFgQwKQZ7nzJE5DeA==
X-IPAS-Result: =?us-ascii?q?A0BCAgAdw4Zq/4wQJK1aglmCV3ReQ0mTWQGCBJ8KgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBcRIMCAYJ0A8JDgiyBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6FEIV4BIIigQyTSkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJRQ4JF?=
 =?us-ascii?q?wsYDUgRLDcUGQQ+bgeOUSCCS4EOMagdoQ8KKIN2jCGVOhozqmwumFqkIzeEa?=
 =?us-ascii?q?YFoPIFZcBWDIglKGQ+OLhXQGScyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:124DQKD/iyGBkRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApG8i1WQAm
 GcXWjuFPP7YNjH8LYsjYYq3oRsP7JKEndZqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8imYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEw/F1A19vAaEi3vtIDmh19
 v4BLxEjcUXW7w626OrTpuhEj8AnKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWIHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFUqiea2a4qPEjCMbd1eg12Xm
 kzJxnvaOyNFMs695Gep/1v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvGS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6eX9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:mKzEKarjAq18WGYGtQN0ccEaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AdfiirGtoO9eoXqzDAOA3+eJs6IsldmbS0i7sD3W?=
 =?us-ascii?q?cFFlmQYaWS0aX2Y17xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3APSSXeg9eYVmBYIATkLOn/U+Qf99j/r+hNG4CqIo?=
 =?us-ascii?q?lgvvbMz5SFmqxgR3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813163382"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:51 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id B57DC180007D8;
	Thu, 20 Aug 2026 09:07:50 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 53EDCCC12A9; Thu, 20 Aug 2026 02:07:50 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-git: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:50 -0700
Message-Id: <20260820090750.61951-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243842

From: Tim Orling <tim.orling@konsulko.com>

Using the pypi.bbclass default CPE of python:GitPython detects no CVEs.
With CVE_PRODUCT = "gitpython_project:gitpython" we properly detect
9 CVEs, with 4 unpatched.

WARNING: core-image-full-cmdline-1.0-r0 do_sbom_cve_check:
python3-git-3.1.43: Found unpatched CVEs: CVE-2026-42215, CVE-2026-42284,
CVE-2026-44243, CVE-2026-44244

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a6af75a33b4e007f0d3a247b6a149e32d51e510)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-git_3.1.43.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 45c988117b..ccf6def292 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
 
+CVE_PRODUCT = "gitpython_project:gitpython"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
-- 
2.35.6

