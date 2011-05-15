Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEj-00068K-OL
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2011 18:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="436235842"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2011 18:32:22 -0700
Message-Id: <abe8b0b94e16820d22270ccc51681ddc1a9854ce.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 15:58:14 +0800
Date: Sat, 14 May 2011 18:32:21 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 02/15] task-core-lsb: add packages into lsb image
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
X-List-Received-Date: Sun, 15 May 2011 01:35:14 -0000

From: Kang Kai <kai.kang@windriver.com>

Add gettext-runtime, libxml-sax-perl and foomatic-filters to
task-core-image.bb
Bump PR to r4

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index 6de24b4..70eb2d6 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Small Image Tasks"
-PR = "r3"
+PR = "r4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -111,6 +111,7 @@ RDEPENDS_task-core-tcl = "\
 RDEPENDS_task-core-misc = "\
     elfutils \
     gettext \
+    gettext-runtime \
     groff \
     lsb \
     lsbsetup \
@@ -131,6 +132,7 @@ RDEPENDS_task-core-lsb-command-add = "\
     msmtp \
     chkconfig \
     xdg-utils \
+    foomatic-filters \
 "
 #    cups
 
@@ -188,6 +190,7 @@ RDEPENDS_task-core-lsb-runtime-add = "\
     liburi-perl \
     libxml-parser-perl \
     libxml-perl \
+    libxml-sax-perl \
     eglibc-localedatas \
     eglibc-gconvs \
     eglibc-charmaps \
-- 
1.7.1.1



