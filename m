Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.11635.1628182250706202482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 09:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E6E06FF806;
	Thu,  5 Aug 2021 16:50:48 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/3] cve-check: improve comment about CVE patch file names
Date: Thu,  5 Aug 2021 18:50:46 +0200
Message-Id: <20210805165046.41103-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes/cve-check.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index bf7dd15c73..6582f97151 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -166,9 +166,12 @@ def get_patches_cves(d):
     pn = d.getVar("PN")
     cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
 
-    # Matches last CVE-1234-211432 in the file name, also if written
-    # with small letters. Not supporting multiple CVE id's in a single
-    # file name.
+    # Matches the last "CVE-YYYY-ID" in the file name, also if written
+    # in lowercase. Possible to have multiple CVE IDs in a single
+    # file name, but only the last one will be detected from the file name.
+    # However, patch files contents addressing multiple CVE IDs are supported
+    # (cve_match regular expression)
+
     cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
 
     patched_cves = set()
-- 
2.25.1

