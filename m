Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCLHW-0003Lm-93
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 03:00:50 +0200
Received: by eyx24 with SMTP id 24so2476182eyx.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 17:55:12 -0700 (PDT)
Received: by 10.223.17.11 with SMTP id q11mr14483500faa.13.1318035309425;
	Fri, 07 Oct 2011 17:55:09 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id b10sm15517471fam.1.2011.10.07.17.55.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 17:55:08 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Oct 2011 02:55:02 +0200
Message-Id: <1318035302-1354-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] git: update to 1.7.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Oct 2011 01:00:50 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/git/git_1.7.5.1.bb |   10 ----------
 meta/recipes-devtools/git/git_1.7.7.bb   |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_1.7.5.1.bb
 create mode 100644 meta/recipes-devtools/git/git_1.7.7.bb

diff --git a/meta/recipes-devtools/git/git_1.7.5.1.bb b/meta/recipes-devtools/git/git_1.7.5.1.bb
deleted file mode 100644
index b5eb015..0000000
--- a/meta/recipes-devtools/git/git_1.7.5.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require git.inc
-
-PR = "r3"
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-
-SRC_URI[md5sum] = "a49291116e3b0564e069ae989e4db6fb"
-SRC_URI[sha256sum] = "a1d4a1c59300e68fbc493a2cbe9257048d4d6f4363924bf34f38c413a825f80c"
diff --git a/meta/recipes-devtools/git/git_1.7.7.bb b/meta/recipes-devtools/git/git_1.7.7.bb
new file mode 100644
index 0000000..486e2e5
--- /dev/null
+++ b/meta/recipes-devtools/git/git_1.7.7.bb
@@ -0,0 +1,10 @@
+require git.inc
+
+SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
+SRC_URI[md5sum] = "5d645884e688921e773186783b65ce33"
+SRC_URI[sha256sum] = "5a977bc01e4989b9928345e99aab15ce896cf5897c6e32eb449538574df377f6"
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+
-- 
1.6.6.1



