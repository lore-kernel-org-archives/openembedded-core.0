Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEc-0005Qu-OB
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2011 00:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028522"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:29:58 -0700
Message-Id: <4f7dbd5e04801efb00ecf8b2b28eb6b4f5ac6dc3.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Fri, 22 Apr 2011 11:23:20 -0700
Date: Wed, 27 Apr 2011  0:29:58 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 37/52] insane.bbclass: Move code to add function to tasks toward the end
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:31 -0000

From: Khem Raj <raj.khem@gmail.com>

Cosmetic change to make syntax highlighters happy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 22a5086..98acf7f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -554,9 +554,6 @@ python do_package_qa () {
 }
 
 
-# The Staging Func, to check all staging
-#addtask qa_staging after do_populate_sysroot before do_build
-do_populate_sysroot[postfuncs] += "do_qa_staging "
 python do_qa_staging() {
     bb.note("QA checking staging")
 
@@ -564,10 +561,6 @@ python do_qa_staging() {
         bb.fatal("QA staging was broken by the package built above")
 }
 
-# Check broken config.log files, for packages requiring Gettext which don't
-# have it in DEPENDS and for correct LIC_FILES_CHKSUM
-#addtask qa_configure after do_configure before do_compile
-do_configure[postfuncs] += "do_qa_configure "
 python do_qa_configure() {
     configs = []
     workdir = bb.data.getVar('WORKDIR', d, True)
@@ -603,3 +596,11 @@ Missing inherit gettext?""" % config)
     if not package_qa_check_license(workdir, d):
         bb.fatal("Licensing Error: LIC_FILES_CHKSUM does not match, please fix")
 }
+# The Staging Func, to check all staging
+#addtask qa_staging after do_populate_sysroot before do_build
+do_populate_sysroot[postfuncs] += "do_qa_staging "
+
+# Check broken config.log files, for packages requiring Gettext which don't
+# have it in DEPENDS and for correct LIC_FILES_CHKSUM
+#addtask qa_configure after do_configure before do_compile
+do_configure[postfuncs] += "do_qa_configure "
-- 
1.7.1.1



