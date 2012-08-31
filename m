Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T7ODK-0005lL-Az
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 12:12:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7VA0Hjs016542
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 03:00:17 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 31 Aug 2012 03:00:16 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 18:00:12 +0800
Message-ID: <90d0ccf1d4b9e90545e3902bab6e3b29959b2b72.1346406022.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346406022.git.kai.kang@windriver.com>
References: <cover.1346406022.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 8/8] task-core-lsb: add packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 10:12:34 -0000
Content-Type: text/plain

Add package wget and perl modules.

LSB needs wget to download packages but wget provided by busybox doesn't
support some options such as '-N'.

LSB perl test 4.1.6-2 case all/tst_perlModPresent.pl,
../lib/Class/ISA/t/00_about_verbose and ../lib/Class/ISA/t/01_old_junk.t
fail because of lack of these modules, add them to make test pass.

[Yocto #3030 #3031]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index be9eac2..bda9353 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Small Image Tasks"
-PR = "r9"
+PR = "r10"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -138,6 +138,7 @@ RDEPENDS_task-core-lsb-command-add = "\
     foomatic-filters \
     cups \
     ghostscript \
+    wget \
 "
 
 RDEPENDS_task-core-lsb-perl-add = "\
@@ -183,6 +184,12 @@ RDEPENDS_task-core-lsb-runtime-add = "\
     pam-plugin-wheel \
     e2fsprogs-mke2fs \
     mkfontdir \
+    libclass-isa-perl \
+    libenv-perl \
+    libdumpvalue-perl \
+    libfile-checktree-perl \
+    libi18n-collate-perl \
+    libpod-plainer-perl \
     liburi-perl \
     libxml-parser-perl \
     libxml-perl \
-- 
1.7.5.4



