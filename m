Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LRN-0002AS-L6
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:54:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 17:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139662765"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:45:46 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:36 +0800
Message-Id: <09a1b03b1e9f3c1526910400399f929f460f5232.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 39/60] libXrender: upgrade to 0.9.7
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
X-List-Received-Date: Fri, 16 Mar 2012 00:54:45 -0000

The license change is:

--- libXrender-0.9.6/COPYING    2010-01-30 15:39:43.000000000 +0800
+++ libXrender-0.9.7/COPYING    2012-03-08 12:47:00.000000000 +0800
@@ -35,5 +35,5 @@
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL SuSE
 BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
-OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
+OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxrender_0.9.6.bb => libxrender_0.9.7.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.6.bb => libxrender_0.9.7.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.7.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
rename to meta/recipes-graphics/xorg-lib/libxrender_0.9.7.bb
index 893ea14..c4baba8 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.7.bb
@@ -9,7 +9,7 @@ drawn by loading glyphs into the server and rendering sets of them."
 require xorg-lib-common.inc
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0db75cc842842b36f097fdae571b4b70"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8bc71986d3b9b3639f6dfd6fac8f196"
 
 DEPENDS += "virtual/libx11 renderproto xproto xdmcp"
 
@@ -20,5 +20,5 @@ XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "3b3b7d076c2384b6c600c0b5f4ba971f"
-SRC_URI[sha256sum] = "7f58b1e263109e0a873eef8423aa14733a5499befbe645053aa622ed1f3ea668"
+SRC_URI[md5sum] = "ee62f4c7f0f16ced4da63308963ccad2"
+SRC_URI[sha256sum] = "f9b46b93c9bc15d5745d193835ac9ba2a2b411878fad60c504bbb8f98492bbe6"
-- 
1.7.6



