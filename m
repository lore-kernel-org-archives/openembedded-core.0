Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0136E747
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 17:30:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 09:26:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,696,1384329600"; d="scan'208";a="470222836"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.212])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 09:30:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 17:30:03 +0000
Message-Id: <bb0154301b985fb684c6c0664c778b16b824ca0c.1390325320.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <cover.1390325320.git.paul.eggleton@linux.intel.com>
References: <cover.1390325320.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1390325320.git.paul.eggleton@linux.intel.com>
References: <cover.1390325320.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 1/2] grep: Add patch for texinfo 5.1
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
X-List-Received-Date: Tue, 21 Jan 2014 17:30:25 -0000

From: Saul Wold <sgw@linux.intel.com>

(From OE-Core master rev: bc6258f88705b0e7989089a8666ac5e5d2355823)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../grep/grep-2.5.1a/fix-for-texinfo-5.1.patch              | 13 +++++++++++++
 meta/recipes-extended/grep/grep_2.5.1a.bb                   |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch

diff --git a/meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch b/meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch
new file mode 100644
index 0000000..02dbd20
--- /dev/null
+++ b/meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch
@@ -0,0 +1,13 @@
+Index: grep-2.5.1a/doc/grep.texi
+===================================================================
+--- grep-2.5.1a.orig/doc/grep.texi
++++ grep-2.5.1a/doc/grep.texi
+@@ -288,7 +288,7 @@ This version number should be included i
+ Print a usage message briefly summarizing these command-line options
+ and the bug-reporting address, then exit.
+ 
+-@itemx --binary-files=@var{type}
++@item --binary-files=@var{type}
+ @opindex --binary-files
+ @cindex binary files
+ If the first few bytes of a file indicate that the file contains binary
diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
index 247c837..088959c 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
            file://fix64-int-to-pointer.patch \
            file://Makevars \
            file://grep-CVE-2012-5667.patch \
+           file://fix-for-texinfo-5.1.patch \
           "
 
 SRC_URI[md5sum] = "52202fe462770fa6be1bb667bd6cf30c"
-- 
1.8.4.2


