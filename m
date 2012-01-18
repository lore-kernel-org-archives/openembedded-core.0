Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rnf6x-0003a7-1I
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 00:40:11 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jan 2012 15:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97329162"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2012 15:32:29 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2012 15:32:23 -0800
Message-Id: <19d739c1ea85da2d374665924b8d004f06a2f30e.1326929307.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <f37166f3f48c2747fbcc4d9ca8e9c2ddbe9aa637.1326929307.git.nitin.a.kamble@intel.com>
References: <f37166f3f48c2747fbcc4d9ca8e9c2ddbe9aa637.1326929307.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326929307.git.nitin.a.kamble@intel.com>
References: <cover.1326929307.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 3/7] libunistring: new recipe for autogen
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
X-List-Received-Date: Wed, 18 Jan 2012 23:40:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nitin A Kamble <nitin.a.kamble@intel.com>

libunistring recipe is needed by guile.
And guile is needed by autogen.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libunistring/libunistring_0.9.3.bb             |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libunistring/libunistring_0.9.3.bb

diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
new file mode 100644
index 0000000..7d09761
--- /dev/null
+++ b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
@@ -0,0 +1,27 @@
+SUMMARY = "libunistring provides functions for manipulating according to the Unicode standard."
+
+DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may consist of very\
+ different scripts – from Latin letters to Chinese Hanzi –, with many kinds of special\
+ characters – accents, right-to-left writing marks, hyphens, Roman numbers, and much\
+ more. But the POSIX platform APIs for text do not contain adequate functions for\
+ dealing with particular properties of many Unicode characters. In fact, the POSIX\
+ APIs for text have several assumptions at their base which don't hold for Unicode\
+ text. \
+ This library provides functions for manipulating Unicode strings and for manipulating\
+ C strings according to the Unicode standard."
+
+HOMEPAGE = "http://www.gnu.org/software/libunistring/"
+SECTION = "devel"
+LICENSE = "GPLv3&LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6" 
+
+SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "db8eca3b64163abadf8c40e5cecc261f"
+SRC_URI[sha256sum] = "610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f764041006a3"
+
+PR = "r0"
+
+inherit autotools
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.4



