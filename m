Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T12AT-0004q4-CI
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 23:27:21 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 900633042C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:15:22 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 14:14:42 -0700
Message-Id: <48f93e0ade1c534b9af2b84874f9b17e3107c724.1344892361.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 900633042C.21641
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 01/32] xinetd: Update to 2.3.15
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
X-List-Received-Date: Mon, 13 Aug 2012 21:27:21 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xinetd/{xinetd_2.3.14.bb => xinetd_2.3.15.bb}  |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/xinetd/{xinetd_2.3.14.bb => xinetd_2.3.15.bb} (90%)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.14.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
similarity index 90%
rename from meta/recipes-extended/xinetd/xinetd_2.3.14.bb
rename to meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 26ba78f..3d55e99 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.14.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 
 DEPENDS = ""
-PR ="r1"
+PR = "r0"
 
 SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd.init \
@@ -17,8 +17,8 @@ SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch \
       "
 
-SRC_URI[md5sum] = "567382d7972613090215c6c54f9b82d9"
-SRC_URI[sha256sum] = "760e0e617c609a0509ef63fc7e9580d2f1d88c6113bb6d63273de7de7cd0bc1f"
+SRC_URI[md5sum] = "77358478fd58efa6366accae99b8b04c"
+SRC_URI[sha256sum] = "bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e01ba31b50a80a5be3"
 
 inherit autotools update-rc.d
 
-- 
1.7.9.5



