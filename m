Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sd1M5-0000z5-PO
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 17:44:06 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q58FXVfQ011107;
	Fri, 8 Jun 2012 08:33:32 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  8 Jun 2012 11:42:27 -0400
Message-Id: <c909caf522c3e75922f02d55d9a412984f37b2a0.1339169972.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1339169970.git.bruce.ashfield@windriver.com>
References: <cover.1339169970.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339169970.git.bruce.ashfield@windriver.com>
References: <cover.1339169970.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-libc-headers: set default LINUXLIBCVERSION to 3.4
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
X-List-Received-Date: Fri, 08 Jun 2012 15:44:07 -0000

The 3.4 kernel is released, and is the default for qemu* builds, so
we can safely update the default libc-headers version to 3.4.

Built and booted for qemu*

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ++++++
 2 files changed, 7 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 469233d..89c72c5 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.22"
 EGLIBCVERSION ?= "2.15"
 UCLIBCVERSION ?= "0.9.33"
-LINUXLIBCVERSION ?= "3.2"
+LINUXLIBCVERSION ?= "3.4"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
new file mode 100644
index 0000000..9cedd52
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
@@ -0,0 +1,6 @@
+require linux-libc-headers.inc
+
+PR = "r1"
+
+SRC_URI[md5sum] = "146af0160fc7a60cf9acf44aec13482b"
+SRC_URI[sha256sum] = "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d"
-- 
1.7.0.4



