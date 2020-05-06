Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.496.1588787843811729366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 10:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 046HvMXH006151
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2020 10:57:22 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 10:57:21 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 91BF4900659;
 Wed,  6 May 2020 10:57:21 -0700 (PDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] git: uprev v2.24.1 -> v2.26.2
Date: Wed, 6 May 2020 10:57:13 -0700
Message-ID: <20200506175713.5443-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fixes CVE-2020-11008
https://github.com/git/git/commit/af6b65d45ef179ed52087e80cb089f6b2349f4ec

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/git/git_2.24.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.26.2.bb | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.24.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.26.2.bb

diff --git a/meta/recipes-devtools/git/git_2.24.1.bb b/meta/recipes-devtools/git/git_2.24.1.bb
deleted file mode 100644
index daea31eab2..0000000000
--- a/meta/recipes-devtools/git/git_2.24.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "166bde96adbbc11c8843d4f8f4f9811b"
-SRC_URI[tarball.sha256sum] = "ad5334956301c86841eb1e5b1bb20884a6bad89a10a6762c958220c7cf64da02"
-SRC_URI[manpages.md5sum] = "31c2272a8979022497ba3d4202df145d"
-SRC_URI[manpages.sha256sum] = "9a7ae3a093bea39770eb96ca3e5b40bff7af0b9f6123f089d7821d0e5b8e1230"
diff --git a/meta/recipes-devtools/git/git_2.26.2.bb b/meta/recipes-devtools/git/git_2.26.2.bb
new file mode 100644
index 0000000000..b01e2fa1e9
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.26.2.bb
@@ -0,0 +1,18 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 ac_cv_iconv_omits_bom=no \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "3553e81289e1871437c05bde6a2361e3"
+SRC_URI[tarball.sha256sum] = "e1c17777528f55696815ef33587b1d20f5eec246669f3b839d15dbfffad9c121"
+SRC_URI[tarball.sha1sum] = "94c63314efac6d284a7e90987faccf7f54d7eee4"
+SRC_URI[tarball.sha384sum] = "c69e07d1202b0be1a8c055d99239a293b90beba759b3c56a69372b9b6b6becb658a721f51a0507b39ad46807b2345208"
+SRC_URI[tarball.sha512sum] = "fedbb92bd9064e0b36c08b9746648aa388831c5461606fa56f68b662329801240d5c3de1bdc3d62f4de8f667992370d47f806010837d0df2444ee4c9a43024e5"
+SRC_URI[manpages.md5sum] = "22eb30d54fa739a54e5e917354ec218c"
+SRC_URI[manpages.sha256sum] = "b3c6cfc980f3c593d0cd0c63e0c97d6f1cafe7b72321fc3a94948758b9529c5b"
+SRC_URI[manpages.sha1sum] = "99d810d3f7e61b16fffd27b8a2f6dcaf68056ff5"
+SRC_URI[manpages.sha384sum] = "442fe39cb1c2ecb4a94da4f6063544fa9e7801f6db114587bf2d2fb8203dc1b97169215cd7b8ef06861bb26e6f9ac640"
+SRC_URI[manpages.sha512sum] = "9b228e409060a1b36801a26344744c0856e7461b39e35002764478c0a8970ca9fe14860b49f3eae07bc8a2a30254c4d4dcd449762ce881ba868e50be55b54834"
-- 
2.17.1

