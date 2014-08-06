Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 573C065D57
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 16:18:10 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 6 Aug 2014
	18:18:05 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 845C8288F36;
	Wed,  6 Aug 2014 18:18:05 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Aug 2014 18:18:01 +0200
Message-ID: <1407341881-18663-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] remake: fix build error
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
X-List-Received-Date: Wed, 06 Aug 2014 16:18:17 -0000
Content-Type: text/plain

Fix build error:
...
unknown command `colophon'
unknown command `cygnus'

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 ...ve-errors-about-colophon-and-cygnus-comma.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/remake/remake_git.bb         |  4 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/remake/remake/remake-remove-errors-about-colophon-and-cygnus-comma.patch

diff --git a/meta/recipes-devtools/remake/remake/remake-remove-errors-about-colophon-and-cygnus-comma.patch b/meta/recipes-devtools/remake/remake/remake-remove-errors-about-colophon-and-cygnus-comma.patch
new file mode 100644
index 0000000..98b6460
--- /dev/null
+++ b/meta/recipes-devtools/remake/remake/remake-remove-errors-about-colophon-and-cygnus-comma.patch
@@ -0,0 +1,39 @@
+From 1316f10a97a4a2f5d11a30ec367aa61101318742 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@enea.com>
+Date: Wed, 6 Aug 2014 15:05:56 +0200
+Subject: [PATCH] remake: remove errors about @colophon and @cygnus commands
+ not defined
+
+texinfo5 needs replacing @ with @@ when it is part of the text
+
+Upstream-Status: Backport
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+ doc/remake.texi | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/doc/remake.texi b/doc/remake.texi
+index cd73437..fa5ba16 100644
+--- a/doc/remake.texi
++++ b/doc/remake.texi
+@@ -2752,7 +2752,7 @@ this list, we would like to add your names!
+ @printindex cp
+ 
+ @tex
+-% I think something like @colophon should be in texinfo.  In the
++% I think something like @@colophon should be in texinfo.  In the
+ % meantime:
+ \long\def\colophon{\hbox to0pt{}\vfill
+ \centerline{The body of this manual is set in}
+@@ -2764,7 +2764,7 @@ this list, we would like to add your names!
+ \centerline{{\sl\fontname\tensl\/}}
+ \centerline{are used for emphasis.}\vfill}
+ \page\colophon
+-% Blame: doc@cygnus.com, 1991.
++% Blame: doc@@cygnus.com, 1991.
+ @end tex
+ 
+ @bye
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/remake/remake_git.bb b/meta/recipes-devtools/remake/remake_git.bb
index 405c69f..2ba2b80 100644
--- a/meta/recipes-devtools/remake/remake_git.bb
+++ b/meta/recipes-devtools/remake/remake_git.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
 require remake.inc
 
-SRC_URI += "file://version-remake.texi.patch"
+SRC_URI += "file://version-remake.texi.patch \
+            file://remake-remove-errors-about-colophon-and-cygnus-comma.patch \
+           "
 SRCREV = "f05508e521987c8494c92d9c2871aec46307d51d"
 S = "${WORKDIR}/git"
 
-- 
1.9.1


