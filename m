Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AC6FB6B57C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010038"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:13 +0000
Message-Id: <6b882daba1f4b4148e628c402840093ed89c8353.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 17/38] gawk: set reasonable SUMMARY and DESCRIPTION
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:08 -0000

Also ensure both recipe versions have the same values.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/gawk/gawk_3.1.5.bb | 6 +++---
 meta/recipes-extended/gawk/gawk_4.0.2.bb | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index 5500974..4d9d6e4 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -1,6 +1,6 @@
-SUMMARY = "The GNU awk text processing utility"
-DESCRIPTION = "The gawk package contains the GNU version of awk, a text processing \
-utility. Awk interprets a special-purpose programming language to do \
+SUMMARY = "GNU awk text processing utility"
+DESCRIPTION = "The GNU version of awk, a text processing utility. \
+Awk interprets a special-purpose programming language to do \
 quick and easy text pattern matching and reformatting jobs."
 HOMEPAGE = "www.gnu.org/software/gawk"
 BUGTRACKER  = "bug-gawk@gnu.org"
diff --git a/meta/recipes-extended/gawk/gawk_4.0.2.bb b/meta/recipes-extended/gawk/gawk_4.0.2.bb
index 63dace4..424b6b0 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.2.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.2.bb
@@ -1,5 +1,7 @@
-DESCRIPTION = "A program that you can use to select particular records in a \
-file and perform operations upon them."
+SUMMARY = "GNU awk text processing utility"
+DESCRIPTION = "The GNU version of awk, a text processing utility. \
+Awk interprets a special-purpose programming language to do \
+quick and easy text pattern matching and reformatting jobs."
 HOMEPAGE = "www.gnu.org/software/gawk"
 BUGTRACKER  = "bug-gawk@gnu.org"
 SECTION = "console/utils"
-- 
1.8.1.2


