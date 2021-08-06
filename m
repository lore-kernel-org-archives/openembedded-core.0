Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.3321.1628247222401742705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 03:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id AB05F200002;
	Fri,  6 Aug 2021 10:53:40 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] cve-check: remove deprecated CVE_CHECK_CVE_WHITELIST
Date: Fri,  6 Aug 2021 12:53:27 +0200
Message-Id: <20210806105327.50542-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This variable has been deprecated since Yocto Project version 3.0.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes/cve-check.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6582f97151..04d19f53fd 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -238,9 +238,6 @@ def check_cves(d, patched_cves):
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [], [])
 
-    old_cve_whitelist =  d.getVar("CVE_CHECK_CVE_WHITELIST")
-    if old_cve_whitelist:
-        bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE_CHECK_WHITELIST.")
     cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
 
     import sqlite3
-- 
2.25.1

