Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id C884278589
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 23:09:16 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id b52so6402689wrd.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Feb 2018 15:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sGNrBiGji7GwPDhRB8fjgDngFFldiGkC8Ge6JsMjmWs=;
	b=u0kFv4cro1upijUD+2CRpu7PID2QfzXWBHWf9yOHQC6E9i0MEz/GHJB7R86HXdS4A+
	udVmDxzEEDFPhdVOtPWCMMOznn1BI03OEOQ0kWqUmfUzkLdbdIqBhdagw1lf2lhGSRa3
	cg4QMKXUiKdNZbVwqgvAHFEiUrUgXYMSGoBKht8lE1yYueLyMblWNi0wdQ08op2d9bo4
	l6gtpnR58jCIgVA7hdNm+JWlNbFE3y6tmunk6aaQo85zPso7sQtKKry2lVT2EENsmVcF
	/pkivHEFp4LFqhbJCF4tA85iSMBcN62jCOw3D+cqS4aVK2DwjTEnC+0V7LOpRkpRJGiT
	/fHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sGNrBiGji7GwPDhRB8fjgDngFFldiGkC8Ge6JsMjmWs=;
	b=jV/zZxDHLz/RAh3e9mnBr/pMLC+/QQdHU53gjf+AowfAlLStPkNzJPnUtZbkRBY29H
	NtmQ2IfGEh7f54Pn9Znvh7DGWFLEL1BEeS/3h+haJKS/PUlP/vQAhyjswBI881Tq7UgJ
	i45cMMkGTh3ZZPaWfLT6gGP1wGmqo4zMxd0DQrh3gCFdfwbJ78U/obHfCCLBBNeH4Eki
	m0bh3PkJiAb359URzWQz2+A7ZlLZHr604OJ/rEPBRGKltN1mf07HEsxyG05EtDwUJEcj
	EJt2803P4SEisMsDehPUiyBbp7hL9USUKYxa+YfJbbB9j4ZIhGE36FGdXQsaPgQQYxLp
	+hmQ==
X-Gm-Message-State: APf1xPAM/eFHo8UfhuOQUsrQMV6QDUDptXloHKBXPib0EAkO2XOLVNE0
	pwyf+FY1U5kGiKpd9wMuba2XWYfn
X-Google-Smtp-Source: AH8x226FEqy/qQ3424nUzEHEI+mmr6eBFLiTgrG3x0c9aFvuLsArCo3KU90alGreec45CsezX37dYw==
X-Received: by 10.223.151.158 with SMTP id s30mr615552wrb.70.1518131357485;
	Thu, 08 Feb 2018 15:09:17 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m11sm1349083wrf.75.2018.02.08.15.09.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 15:09:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Feb 2018 23:09:14 +0000
Message-Id: <20180208230914.19368-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cve-check: put log in T so it doesn't get deleted by rm_work
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 23:09:17 -0000

This is where the other task logs go, so it's a sensible place to put it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index bc2f03f7ddb..62dd6424d5c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -27,8 +27,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
 
-CVE_CHECK_LOCAL_DIR ?= "${WORKDIR}/cve"
-CVE_CHECK_LOCAL_FILE ?= "${CVE_CHECK_LOCAL_DIR}/cve.log"
+CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
@@ -251,11 +250,11 @@ def cve_write_data(d, patched, unpatched, cve_data):
     CVE manifest if enabled.
     """
 
-    cve_file = d.getVar("CVE_CHECK_LOCAL_FILE")
+    cve_file = d.getVar("CVE_CHECK_LOG")
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
     write_string = ""
     unpatched_cves = []
-    bb.utils.mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR"))
+    bb.utils.mkdirhier(os.path.dirname(cve_file))
 
     for cve in sorted(cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
-- 
2.11.0


