Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LRM-0002AS-VH
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:54:45 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 17:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129567574"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 17:45:45 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:35 +0800
Message-Id: <c3c06bc9302bebd48ccabde1774baa1d684128cc.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 38/60] libXxf86vm: upgrade to 1.1.2
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

--- libXxf86vm-1.1.1/COPYING    2010-01-30 15:40:42.000000000 +0800
+++ libXxf86vm-1.1.2/COPYING    2012-03-08 13:39:59.000000000 +0800
@@ -14,12 +14,12 @@
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL Kaleb S. KEITHLEY BE LIABLE FOR ANY CLAIM, DAMAGES
+IN NO EVENT SHALL Kaleb S. KEITHLEY BE LIABLE FOR ANY CLAIM, DAMAGES
 OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.

-Except as contained in this notice, the name of Kaleb S. KEITHLEY
-shall not be used in advertising or otherwise to promote the sale, use
+Except as contained in this notice, the name of Kaleb S. KEITHLEY
+shall not be used in advertising or otherwise to promote the sale, use
 or other dealings in this Software without prior written authorization
 from Kaleb S. KEITHLEY.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxxf86vm_1.1.1.bb => libxxf86vm_1.1.2.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.1.bb => libxxf86vm_1.1.2.bb} (66%)

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.2.bb
similarity index 66%
rename from meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.1.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.2.bb
index 4066f08..a93a399 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.2.bb
@@ -8,7 +8,7 @@ xvidtune program in particular."
 require xorg-lib-common.inc
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0fe722b85f452ce13ca763f323ff5da8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fa0b9c462d8f2f13eba26492d42ea63d"
 
 DEPENDS += "libxext xf86vidmodeproto"
 
@@ -17,5 +17,5 @@ PE = "1"
 
 XORG_PN = "libXxf86vm"
 
-SRC_URI[md5sum] = "34dc3df888c164378da89a7deeb245a0"
-SRC_URI[sha256sum] = "21cae9239aefd59353a4ddb0d6ed890402b681570ccd4bc977d80a75a020239e"
+SRC_URI[md5sum] = "ffd93bcedd8b2b5aeabf184e7b91f326"
+SRC_URI[sha256sum] = "a564172fb866b1b587bbccb7d041088931029845245e0d15c32ca7f1bb48fc84"
-- 
1.7.6



