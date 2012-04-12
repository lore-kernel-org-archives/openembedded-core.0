Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SIKQk-0006W7-Aw
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 15:51:22 +0200
Received: from archHP.dbnet.local (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id A71C12DD7F;
	Thu, 12 Apr 2012 14:18:14 +0100 (BST)
From: ml@communistcode.co.uk
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2012 14:42:27 +0100
Message-Id: <1334238147-15338-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.10
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] New recipe - jansson, C library for encoding, decoding and manipulating JSON data
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
X-List-Received-Date: Thu, 12 Apr 2012 13:51:22 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-support/jansson/jansson.inc    |    8 ++++++++
 meta-oe/recipes-support/jansson/jansson_2.3.bb |    4 ++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-support/jansson/jansson.inc
 create mode 100644 meta-oe/recipes-support/jansson/jansson_2.3.bb

diff --git a/meta-oe/recipes-support/jansson/jansson.inc b/meta-oe/recipes-support/jansson/jansson.inc
new file mode 100644
index 0000000..d3620ad
--- /dev/null
+++ b/meta-oe/recipes-support/jansson/jansson.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "Jansson is a C library for encoding, decoding and manipulating JSON data."
+HOMEPAGE = "http://www.digip.org/jansson/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f521466f4aa39f2dec7513bf8ad26805"
+
+SRC_URI = "http://www.digip.org/jansson/releases/${PN}-${PV}.tar.gz"
+
+inherit autotools
diff --git a/meta-oe/recipes-support/jansson/jansson_2.3.bb b/meta-oe/recipes-support/jansson/jansson_2.3.bb
new file mode 100644
index 0000000..7e6e797
--- /dev/null
+++ b/meta-oe/recipes-support/jansson/jansson_2.3.bb
@@ -0,0 +1,4 @@
+require jansson.inc
+
+SRC_URI[md5sum] = "17d92cb6200cc06d8403134cb37ad2b8"
+SRC_URI[sha256sum] = "db2a4202b4731398b16c97335f94536611283801236dbcd529e190f11e837292"
-- 
1.7.10



