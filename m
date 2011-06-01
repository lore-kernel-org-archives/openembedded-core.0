Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerj-00041j-VX
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203793"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:31 -0700
Message-Id: <480850325ff79a2d19bf82375e16cf5b04ec9e70.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/32] libmad: add Upstream-Status
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:18 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libmad/libmad/add-pkgconfig.patch              |    2 ++
 .../libmad/fix_for_mips_with_gcc-4.5.0.patch       |    2 ++
 .../libmad/libmad/no-force-mem.patch               |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/libmad/libmad/add-pkgconfig.patch b/meta/recipes-multimedia/libmad/libmad/add-pkgconfig.patch
index 636b27a..b49dc8c 100644
--- a/meta/recipes-multimedia/libmad/libmad/add-pkgconfig.patch
+++ b/meta/recipes-multimedia/libmad/libmad/add-pkgconfig.patch
@@ -10,6 +10,8 @@ do not provide mad.pc (google: pkgconfig libmad).
 
 EMH
 
+Upstream-Status: Inappropriate [configuration]
+
 --h31gzZEtNLTqOjlF
 Content-Type: text/plain; charset=us-ascii
 Content-Disposition: attachment; filename=&quot;libmad-0.15.1b-pkgconfig.patch&quot;
diff --git a/meta/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch b/meta/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch
index 785a8a2..01c7aa3 100644
--- a/meta/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch
+++ b/meta/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch
@@ -6,6 +6,8 @@ Found a solution here:
 
 http://us.generation-nt.com/answer/bug-568418-libmad0-dev-mpg321-compilation-errors-mips-mipsel-architectures-help-169033451.html
 
+Upstream-Status: Pending
+
 2010/07/29
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
diff --git a/meta/recipes-multimedia/libmad/libmad/no-force-mem.patch b/meta/recipes-multimedia/libmad/libmad/no-force-mem.patch
index d4dab75..d5e6d20 100644
--- a/meta/recipes-multimedia/libmad/libmad/no-force-mem.patch
+++ b/meta/recipes-multimedia/libmad/libmad/no-force-mem.patch
@@ -2,6 +2,8 @@ This option no longer exists in gcc 3.4.1
 
 RP - 18/07/2008
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: libmad-0.15.1b/configure.ac
 ===================================================================
 --- libmad-0.15.1b.orig/configure.ac	2008-07-18 15:45:30.000000000 +0100
-- 
1.7.3.4



