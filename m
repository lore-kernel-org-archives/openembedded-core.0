Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9AIV-0007Pj-ND
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 09:45:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q857WqHe028049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 00:32:52 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 00:32:51 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 5 Sep 2012 15:32:48 +0800
Message-ID: <5005901e3eda3b6c290bf31f2b2c73dbc4ccef39.1346829716.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346829716.git.kai.kang@windriver.com>
References: <cover.1346829716.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] task-core-lsb.bbappend: add bbappend file
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
X-List-Received-Date: Wed, 05 Sep 2012 07:45:18 -0000
Content-Type: text/plain

Add file task-core-lsb.bbappend. Packages added in layer meta-lsb should
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
 meta-lsb/recipes-core/tasks/task-core-lsb.bbappend |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-lsb/recipes-core/tasks/task-core-lsb.bbappend

diff --git a/meta-lsb/recipes-core/tasks/task-core-lsb.bbappend b/meta-lsb/recipes-core/tasks/task-core-lsb.bbappend
new file mode 100644
index 0000000..f964481
--- /dev/null
+++ b/meta-lsb/recipes-core/tasks/task-core-lsb.bbappend
@@ -0,0 +1,15 @@
+#
+# Copyright (c) 2012 Wind River Systems, Inc.
+#
+
+RDEPENDS_task-core-lsb-command-add_append += "wget"
+
+RDEPENDS_task-core-lsb-runtime-add_append += "\
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



