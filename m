Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1Stvnk-0001d6-Ls
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:14:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6P732ZI020122
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 00:03:02 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 25 Jul 2012 00:03:02 -0700
From: <xin.ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2012 15:02:58 +0800
Message-ID: <53dbda715b2463385ddc70e489d299026f260d3b.1343199345.git.Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343199345.git.Xin.Ouyang@windriver.com>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mtools: add glibc-gconv-* to RDEPENDS/RRECOMMENDS
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
X-List-Received-Date: Wed, 25 Jul 2012 07:14:33 -0000
Content-Type: text/plain

From: Xin Ouyang <Xin.Ouyang@windriver.com>

[YOCTO #2829]

mtools commands use cp850 as the "mtools_default_codepage", they would
use this to do some coverting tasks.

So, add glibc-gconv-ibm850 to RDEPENDS for mtools commands to run
correctly.

Also add other MSDOS/FAT codepages related packages to RRECOMMENDS.

Code Pages for MSDOS/FAT:
 *http://msdn.microsoft.com/en-us/library/cc195051.aspx

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 meta/recipes-devtools/mtools/mtools_3.9.9.bb  |   20 +++++++++++++++++++-
 meta/recipes-devtools/mtools/mtools_4.0.17.bb |   20 +++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index cced7da..5f5403a 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -6,7 +6,25 @@ DESCRIPTION = "Mtools is a collection of utilities for accessing MS-DOS disks fr
 HOMEPAGE = "http://www.gnu.org/software/mtools/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92b58ec77696788ce278b044d2a8e9d3"
-PR = "r5"
+PR = "r6"
+
+RDEPENDS_${PN} = "glibc-gconv-ibm850"
+RRECOMMENDS_${PN} = "\
+	glibc-gconv-ibm437 \
+	glibc-gconv-ibm737 \
+	glibc-gconv-ibm775 \
+	glibc-gconv-ibm851 \
+	glibc-gconv-ibm852 \
+	glibc-gconv-ibm855 \
+	glibc-gconv-ibm857 \
+	glibc-gconv-ibm860 \
+	glibc-gconv-ibm861 \
+	glibc-gconv-ibm862 \
+	glibc-gconv-ibm863 \
+	glibc-gconv-ibm865 \
+	glibc-gconv-ibm866 \
+	glibc-gconv-ibm869 \
+	"
 
 #http://mtools.linux.lu/mtools-${PV}.tar.gz 
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.17.bb b/meta/recipes-devtools/mtools/mtools_4.0.17.bb
index e4666ff..5ce6c09 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.17.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.17.bb
@@ -5,7 +5,25 @@ SECTION = "optional"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r0"
+PR = "r1"
+
+RDEPENDS_${PN} = "glibc-gconv-ibm850"
+RRECOMMENDS_${PN} = "\
+	glibc-gconv-ibm437 \
+	glibc-gconv-ibm737 \
+	glibc-gconv-ibm775 \
+	glibc-gconv-ibm851 \
+	glibc-gconv-ibm852 \
+	glibc-gconv-ibm855 \
+	glibc-gconv-ibm857 \
+	glibc-gconv-ibm860 \
+	glibc-gconv-ibm861 \
+	glibc-gconv-ibm862 \
+	glibc-gconv-ibm863 \
+	glibc-gconv-ibm865 \
+	glibc-gconv-ibm866 \
+	glibc-gconv-ibm869 \
+	"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
1.7.9.5



