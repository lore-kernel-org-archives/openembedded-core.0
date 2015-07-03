Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD4975D29
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 08:59:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t638x7NR028903
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 01:59:07 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 3 Jul 2015 01:59:06 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 16:53:56 +0800
Message-ID: <1435913636-26231-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] man: replace ',' with '#'
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
X-List-Received-Date: Fri, 03 Jul 2015 08:59:07 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Sometimes, the parameters of CC/BUILD_CC contains the ',', which
cause the sed command failed, so replace the ',' with '#'

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/man/man/configure_sed.patch | 32 +++++++++++++++++++++++
 meta/recipes-extended/man/man_1.6g.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/man/man/configure_sed.patch

diff --git a/meta/recipes-extended/man/man/configure_sed.patch b/meta/recipes-extended/man/man/configure_sed.patch
new file mode 100644
index 0000000..d49e683
--- /dev/null
+++ b/meta/recipes-extended/man/man/configure_sed.patch
@@ -0,0 +1,32 @@
+man: replace ',' with '#'
+
+Sometimes, the parameters of CC/BUILD_CC contains the ',', which
+cause the sed command failed, so replace the ',' with '#'
+
+Upstream-Status: Pending
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 9f62cf9..9a565ae 100755
+--- a/configure
++++ b/configure
+@@ -1321,9 +1321,9 @@ do
+   echo "Creating $infile from $infile.in"
+   sed -e '
+ s,@version@,$version,
+-s,@CC@,$CC,
++s#@CC@#$CC#
+ s,@EXEEXT@,$EXEEXT,
+-s,@BUILD_CC@,$BUILD_CC,
++s#@BUILD_CC@#$BUILD_CC#
+ s,@INSTALL@,$INSTALL,
+ s,@DEFS@,$DEFS,
+ s,@LIBS@,$LIBS,
+-- 
+1.9.1
+
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


