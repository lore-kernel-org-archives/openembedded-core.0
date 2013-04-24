Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47d-0004XV-Fz
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:08:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Apr 2013 10:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632488"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:47 +0100
Message-Id: <4368fa2075bbd861e890fd4505ec2046930ffc04.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/21] which: use the same meta fields for both versions
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
X-List-Received-Date: Wed, 24 Apr 2013 18:09:00 -0000

Use the same SUMMARY, DESCRIPTION, SECTION and HOMEPAGE for the recipes
for both "which" versions.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/which/which_2.18.bb |    6 +++---
 meta/recipes-extended/which/which_2.20.bb |   11 ++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/which/which_2.18.bb b/meta/recipes-extended/which/which_2.18.bb
index 27a567c..4f78010 100644
--- a/meta/recipes-extended/which/which_2.18.bb
+++ b/meta/recipes-extended/which/which_2.18.bb
@@ -1,10 +1,10 @@
-SUMMARY = "Displays the full path of executables that bash would execute"
+SUMMARY = "Displays the full path of shell commands"
 DESCRIPTION = "Which is a utility that prints out the full path of the \
 executables that bash(1) would execute when the passed \
 program names would have been entered on the shell prompt. \
 It does this by using the exact same algorithm as bash."
-HOMEPAGE = "http://www.xs4all.nl/~carlo17/which/"
-BUGTRACKER = "n/a"
+SECTION = "libs"
+HOMEPAGE = "http://carlo17.home.xs4all.nl/which/"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta/recipes-extended/which/which_2.20.bb b/meta/recipes-extended/which/which_2.20.bb
index 312688f..f4e87de 100644
--- a/meta/recipes-extended/which/which_2.20.bb
+++ b/meta/recipes-extended/which/which_2.20.bb
@@ -1,9 +1,14 @@
-DESCRIPTION = "which - shows the full path of (shell) commands."
-SECTION     = "libs"
+SUMMARY = "Displays the full path of shell commands"
+DESCRIPTION = "Which is a utility that prints out the full path of the \
+executables that bash(1) would execute when the passed \
+program names would have been entered on the shell prompt. \
+It does this by using the exact same algorithm as bash."
+SECTION = "libs"
+HOMEPAGE = "http://carlo17.home.xs4all.nl/which/"
+
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://which.c;beginline=1;endline=17;md5=a9963693af2272e7a8df6f231164e7a2"
-HOMEPAGE = "http://ftp.gnu.org/gnu/which/"
 DEPENDS     = "cwautomacros-native"
 
 inherit autotools update-alternatives
-- 
1.7.10.4



