Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LSJ-0002K6-Vi
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:55:44 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118174052"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2012 17:45:49 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:38 +0800
Message-Id: <4ddf1bfe4a1f5bba7973f33f17faea7b4e4cf0bf.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 41/60] libXext: upgrade to 1.3.1
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
X-List-Received-Date: Fri, 16 Mar 2012 00:55:44 -0000

The license change is:

--- libXext-1.3.0/COPYING       2010-11-22 03:24:13.000000000 +0800
+++ libXext-1.3.1/COPYING       2012-03-08 11:54:58.000000000 +0800
@@ -34,14 +34,14 @@
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
-DIGITAL EQUIPMENT CORPORATION BE LIABLE FOR ANY CLAIM, DAMAGES, INCLUDING,
-BUT NOT LIMITED TO CONSEQUENTIAL OR INCIDENTAL DAMAGES, OR OTHER LIABILITY,
-WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
+DIGITAL EQUIPMENT CORPORATION BE LIABLE FOR ANY CLAIM, DAMAGES, INCLUDING,
+BUT NOT LIMITED TO CONSEQUENTIAL OR INCIDENTAL DAMAGES, OR OTHER LIABILITY,
+WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
 IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-Except as contained in this notice, the name of Digital Equipment Corporation
+Except as contained in this notice, the name of Digital Equipment Corporation
 shall not be used in advertising or otherwise to promote the sale, use or other
-dealings in this Software without prior written authorization from Digital
+dealings in this Software without prior written authorization from Digital
 Equipment Corporation.

 Copyright (c) 1997 by Silicon Graphics Computer Systems, Inc.
@@ -81,7 +81,7 @@
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL NCD.
 BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
-OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
+OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

 Copyright 1991,1993 by Digital Equipment Corporation, Maynard, Massachusetts,
@@ -116,8 +116,8 @@
 advertising or publicity pertaining to distribution of the
 software without specific, written prior permission.

-Hewlett-Packard makes no representations about the
-suitability of this software for any purpose.  It is provided
+Hewlett-Packard makes no representations about the
+suitability of this software for any purpose.  It is provided
 "as is" without express or implied warranty.

 This software is not subject to any license of the American

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxext_1.3.0.bb => libxext_1.3.1.bb}         |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.0.bb => libxext_1.3.1.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.0.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.1.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxext_1.3.0.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.1.bb
index 90b4405..82333dd 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.1.bb
@@ -11,7 +11,7 @@ extensions."
 require xorg-lib-common.inc
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9b0eca8f3540b7e7f8b447154a20b05a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f69eb72f85ce548e12791d049d81bc52"
 
 DEPENDS += "xproto virtual/libx11 xextproto libxau libxdmcp"
 PROVIDES = "xext"
@@ -23,5 +23,5 @@ XORG_PN = "libXext"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "161d200b690ace818db1cc7537e70ba9"
-SRC_URI[sha256sum] = "e9daeb400855b9836e328500cec356b2769033174fc1b2be0df4a80f031debc0"
+SRC_URI[md5sum] = "71251a22bc47068d60a95f50ed2ec3cf"
+SRC_URI[sha256sum] = "56229c617eb7bfd6dec40d2805bc4dfb883dfe80f130d99b9a2beb632165e859"
-- 
1.7.6



