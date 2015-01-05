Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8C74572143
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:27:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 05 Jan 2015 03:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646388901"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:27:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:27:45 +0000
Message-Id: <f54cd933c0625e35215af6b18bd91d3d47c04a8e.1420457243.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420457243.git.paul.eggleton@linux.intel.com>
References: <cover.1420457243.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420457243.git.paul.eggleton@linux.intel.com>
References: <cover.1420457243.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] dropbear: upgrade to 2014.66
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
X-List-Received-Date: Mon, 05 Jan 2015 11:27:51 -0000

* Upgrade to upstream 2014.66; incorporates several minor bugfix
  releases.
* LIC_FILES_CHKSUM changed because the copyright year changed; there was
  no change to the license text itself.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/dropbear/dropbear.inc                               | 2 +-
 .../dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch   | 2 +-
 meta/recipes-core/dropbear/dropbear_2014.63.bb                        | 4 ----
 meta/recipes-core/dropbear/dropbear_2014.66.bb                        | 4 ++++
 4 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2014.63.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2014.66.bb

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 947a491..e187d04 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -5,7 +5,7 @@ SECTION = "console/network"
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
 LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4d290ce0ac102c828dfc9ce836784688"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3a1b9604afd1648b28b0c6f1709e9f4"
 
 DEPENDS = "zlib"
 RPROVIDES_${PN} = "ssh sshd" 
diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 71a4666..dc9d578 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -13,7 +13,7 @@ index 7d06322..71a21c2 100644
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
  #ifndef XAUTH_COMMAND
--#define XAUTH_COMMAND "/usr/bin/X11/xauth -q"
+-#define XAUTH_COMMAND "/usr/bin/xauth -q"
 +#define XAUTH_COMMAND "xauth -q"
  #endif
  
diff --git a/meta/recipes-core/dropbear/dropbear_2014.63.bb b/meta/recipes-core/dropbear/dropbear_2014.63.bb
deleted file mode 100644
index bb7e617..0000000
--- a/meta/recipes-core/dropbear/dropbear_2014.63.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "7066bb9a2da708f3ed06314fdc9c47fd"
-SRC_URI[sha256sum] = "595992de432ba586a0e7e191bbb1ad587727678bb3e345b018c395b8c55b57ae"
diff --git a/meta/recipes-core/dropbear/dropbear_2014.66.bb b/meta/recipes-core/dropbear/dropbear_2014.66.bb
new file mode 100644
index 0000000..8931eb7
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2014.66.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "c21a01111aa5015db038c6efdb85717d"
+SRC_URI[sha256sum] = "ab3fe2670a517cc0bbe398ff5d15e9ca12cd14f2fc18930a8111ae2baa64ab76"
-- 
1.9.3


