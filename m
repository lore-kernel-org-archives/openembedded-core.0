Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 225E572861
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:51:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 4266E426955;
	Thu, 18 Dec 2014 15:51:40 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Magnus Olsson <magnus@minimum.se>, Matt Fleming <matt.fleming@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 18 Dec 2014 15:51:21 +0100
Message-Id: <1418914282-18186-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1418914282-18186-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1418914282-18186-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 1/2] python-argparse: remove external argparse module
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
X-List-Received-Date: Thu, 18 Dec 2014 14:51:42 -0000

Python argparse module is a part of a standard library since Python 2.7
release. Remove externally built module in favor of the stdlib one.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 meta/recipes-devtools/python/python-argparse_1.2.1.bb | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-argparse_1.2.1.bb

diff --git a/meta/recipes-devtools/python/python-argparse_1.2.1.bb b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
deleted file mode 100644
index b2850a3..0000000
--- a/meta/recipes-devtools/python/python-argparse_1.2.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Python command-line parsing library"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=09d08bb5b7047e2688ea3faad6408aa8"
-SRCNAME = "argparse"
-PR = "r4"
-RDEPENDS_${PN} += "python-codecs python-textutils"
-
-SRC_URI = "http://argparse.googlecode.com/files/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2fbef8cb61e506c706957ab6e135840c"
-SRC_URI[sha256sum] = "ddaf4b0a618335a32b6664d4ae038a1de8fbada3b25033f9021510ed2b3941a4"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-BBCLASSEXTEND = "native"
-- 
1.9.3


