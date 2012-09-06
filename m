Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9S1V-0000AY-Ey
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 04:40:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q862SSlx007479
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 19:28:28 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 19:28:28 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Thu, 6 Sep 2012 10:28:25 +0800
Message-ID: <fa38549c28aa15a0d2ce500d71a176f6fb92ae77.1346836639.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346836639.git.kai.kang@windriver.com>
References: <cover.1346836639.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] packagegroup-core-lsb.bbappend: add bbappend file
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
X-List-Received-Date: Thu, 06 Sep 2012 02:40:54 -0000
Content-Type: text/plain

Add file packagegroup-core-lsb.bbappend. Packages added in layer meta-lsb should
put in this file.

Add package wget and perl modules.

LSB needs wget to download packages. But wget provided by busybox doesn't
support some options such as '-N'.

LSB perl test 4.1.6-2 case all/tst_perlModPresent.pl,
../lib/Class/ISA/t/00_about_verbose and
../lib/Class/ISA/t/01_old_junk.t
fail because of lack of these modules, add them to make test pass.

[Yocto #3030 #3031]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-core-lsb.bbappend   |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-lsb/recipes-core/packagegroups/packagegroup-core-lsb.bbappend

diff --git a/meta-lsb/recipes-core/packagegroups/packagegroup-core-lsb.bbappend b/meta-lsb/recipes-core/packagegroups/packagegroup-core-lsb.bbappend
new file mode 100644
index 0000000..9fba0b0
--- /dev/null
+++ b/meta-lsb/recipes-core/packagegroups/packagegroup-core-lsb.bbappend
@@ -0,0 +1,15 @@
+#
+# Copyright (c) 2012 Wind River Systems, Inc.
+#
+
+RDEPENDS_packagegroup-core-lsb-core_append += "wget"
+
+RDEPENDS_packagegroup-core-lsb-perl_append += "\
+    libclass-isa-perl \
+    libenv-perl \
+    libdumpvalue-perl \
+    libfile-checktree-perl \
+    libi18n-collate-perl \
+    libpod-plainer-perl"
+
+
-- 
1.7.5.4



