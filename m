Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LO3-0001xl-Rn
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:51:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121479506"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:42:31 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:31 +0800
Message-Id: <cd951aed0fc6af3c4dc63dc5a51c88b103d8903a.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 34/60] libxkbfile: upgrade to 1.0.8
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
X-List-Received-Date: Fri, 16 Mar 2012 00:51:20 -0000

The license change is below (only removing a space in the end of each line):

--- libxkbfile-1.0.7/COPYING    2009-10-17 05:27:13.000000000 +0800
+++ libxkbfile-1.0.8/COPYING    2012-03-08 12:37:23.000000000 +0800
@@ -5,19 +5,19 @@
 fee is hereby granted, provided that the above copyright
 notice appear in all copies and that both that copyright
 notice and this permission notice appear in supporting
-documentation, and that the name of Silicon Graphics not be
-used in advertising or publicity pertaining to distribution
+documentation, and that the name of Silicon Graphics not be
+used in advertising or publicity pertaining to distribution
 of the software without specific prior written permission.
-Silicon Graphics makes no representation about the suitability
+Silicon Graphics makes no representation about the suitability
 of this software for any purpose. It is provided "as is"
 without any express or implied warranty.

-SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
-SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
+SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
+SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SILICON
-GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
-DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
+GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
+DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
 OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
 THE USE OR PERFORMANCE OF THIS SOFTWARE.

@@ -48,13 +48,13 @@
 Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts.
                         All Rights Reserved

-Permission to use, copy, modify, and distribute this software and its
-documentation for any purpose and without fee is hereby granted,
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose and without fee is hereby granted,
 provided that the above copyright notice appear in all copies and that
-both that copyright notice and this permission notice appear in
+both that copyright notice and this permission notice appear in
 supporting documentation, and that the name of Digital not be
 used in advertising or publicity pertaining to distribution of the
-software without specific, written prior permission.
+software without specific, written prior permission.

 DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
 ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxkbfile_1.0.7.bb => libxkbfile_1.0.8.bb}   |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbfile_1.0.7.bb => libxkbfile_1.0.8.bb} (61%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
similarity index 61%
rename from meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb
rename to meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
index 44e2fa0..f659c3c 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
@@ -6,16 +6,16 @@ description files for XKB, the X11 keyboard configuration extension."
 require xorg-lib-common.inc
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aa32e1b87f1da02948ab7b55e129bf5f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8be7367f7e5d605a426f76bb37d4d61f"
 
 DEPENDS += "virtual/libx11 kbproto"
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 EXTRA_OECONF += "--without-xcb"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "59b4fe0bdf8d9b05e45b59e8fe9e7516"
-SRC_URI[sha256sum] = "667e370a733b96b647a40211430cfc41dd2160c9a2aa701d0c839c626d0f2ae5"
+SRC_URI[md5sum] = "19e6533ae64abba0773816a23f2b9507"
+SRC_URI[sha256sum] = "8aa94e19c537c43558f30906650cea6e15fa012591445d9f927658c3b32a8f3a"
-- 
1.7.6



