Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 462C973632
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1K5bLYp006891
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:37:22 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Feb 2015 21:37:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Feb 2015 21:37:16 -0800
Message-ID: <c7bdfc1dea1ef5a562772e01cd6014ea8a991236.1424410597.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1424410597.git.liezhi.yang@windriver.com>
References: <cover.1424410597.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] quilt: 0.63 -> 0.64
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
X-List-Received-Date: Fri, 20 Feb 2015 05:37:26 -0000
Content-Type: text/plain

quilt-0.63.inc -> quilt.inc: we don't have multiple quilt-xxx.inc, so
use quilt.inc rather than quilt-0.63.inc.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{quilt-native_0.63.bb => quilt-native_0.64.bb} |    2 +-
 .../quilt/{quilt-0.63.inc => quilt.inc}            |    4 ++--
 .../quilt/{quilt_0.63.bb => quilt_0.64.bb}         |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-native_0.63.bb => quilt-native_0.64.bb} (51%)
 rename meta/recipes-devtools/quilt/{quilt-0.63.inc => quilt.inc} (92%)
 rename meta/recipes-devtools/quilt/{quilt_0.63.bb => quilt_0.64.bb} (95%)

diff --git a/meta/recipes-devtools/quilt/quilt-native_0.63.bb b/meta/recipes-devtools/quilt/quilt-native_0.64.bb
similarity index 51%
rename from meta/recipes-devtools/quilt/quilt-native_0.63.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.64.bb
index a089a83..6bc7dcd 100644
--- a/meta/recipes-devtools/quilt/quilt-native_0.63.bb
+++ b/meta/recipes-devtools/quilt/quilt-native_0.64.bb
@@ -1,2 +1,2 @@
-require quilt-${PV}.inc
+require quilt.inc
 require quilt-native.inc
diff --git a/meta/recipes-devtools/quilt/quilt-0.63.inc b/meta/recipes-devtools/quilt/quilt.inc
similarity index 92%
rename from meta/recipes-devtools/quilt/quilt-0.63.inc
rename to meta/recipes-devtools/quilt/quilt.inc
index 220a3bc..ac7ef93 100644
--- a/meta/recipes-devtools/quilt/quilt-0.63.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -10,8 +10,8 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://Makefile \
 "
 
-SRC_URI[md5sum] = "c0ef4beb58a6fa72563b955e70624b6e"
-SRC_URI[sha256sum] = "2846788221aa8844c54f10239c7cbc5e88031859162bcc285449446c3cfffe52"
+SRC_URI[md5sum] = "fc0310db5868a0873d602d4332a76d43"
+SRC_URI[sha256sum] = "c4bfd3282214a288e8d3e921ae4d52e73e24c4fead72b5446752adee99a7affd"
 
 inherit autotools-brokensep ptest
 
diff --git a/meta/recipes-devtools/quilt/quilt_0.63.bb b/meta/recipes-devtools/quilt/quilt_0.64.bb
similarity index 95%
rename from meta/recipes-devtools/quilt/quilt_0.63.bb
rename to meta/recipes-devtools/quilt/quilt_0.64.bb
index 3a08d13..00f900a 100644
--- a/meta/recipes-devtools/quilt/quilt_0.63.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.64.bb
@@ -1,4 +1,4 @@
-require quilt-${PV}.inc
+require quilt.inc
 inherit gettext
 RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
-- 
1.7.9.5


