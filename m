Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42725755C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 01:30:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t621U5Hp012590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jul 2015 18:30:05 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 1 Jul 2015 18:30:05 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jul 2015 09:25:00 +0800
Message-ID: <1435800300-6257-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Yue.Tao@windriver.com
Subject: [PATCH] man: replace ',' with '#'
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
X-List-Received-Date: Thu, 02 Jul 2015 01:30:06 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Sometimes, the parameters of CC contains the ',', which
cause the sed command failed, so replace the ',' with '#'

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 meta/recipes-extended/man/man/configure_sed.patch | 22 ++++++++++++++++++++++
 meta/recipes-extended/man/man_1.6g.bb             |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/man/man/configure_sed.patch

diff --git a/meta/recipes-extended/man/man/configure_sed.patch b/meta/recipes-extended/man/man/configure_sed.patch
new file mode 100644
index 0000000..6c047ac
--- /dev/null
+++ b/meta/recipes-extended/man/man/configure_sed.patch
@@ -0,0 +1,22 @@
+man: replace ',' with '#'
+
+Sometimes, the parameters of CC contains the ',', which
+cause the sed command failed, so replace the ',' with '#'
+
+Upstream-Status: Pending
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+---
+diff --git a/configure.old b/configure
+index 9f62cf9..b439055 100755
+--- a/configure.old
++++ b/configure
+@@ -1321,7 +1321,7 @@ do
+   echo "Creating $infile from $infile.in"
+   sed -e '
+ s,@version@,$version,
+-s,@CC@,$CC,
++s#@CC@#$CC#
+ s,@EXEEXT@,$EXEEXT,
+ s,@BUILD_CC@,$BUILD_CC,
+ s,@INSTALL@,$INSTALL,
diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index d4a4b26..6a4c734 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -52,6 +52,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP}.tar.gz/ba
            file://man.conf \
            file://manpath.5.gz;unpack=false \
            file://man-1.6g-whatis3.patch \
+           file://configure_sed.patch \
 "
 
 SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
-- 
1.9.1


