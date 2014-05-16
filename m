Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95B6666007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 07:39:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4G7dkfe014440
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 00:39:46 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 16 May 2014 00:39:44 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 15:39:42 +0800
Message-ID: <0ef05da81e3e9cfdfde11f37c8f5e70888d5d349.1400225924.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1400225924.git.Chong.Lu@windriver.com>
References: <cover.1400225924.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] quilt: Update to 0.63 version
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
X-List-Received-Date: Fri, 16 May 2014 07:39:49 -0000
Content-Type: text/plain

Upgrade quilt to 0.63 version and add perl-module-text-parsewords to
RDEPENDS of ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/quilt/{quilt-0.61.inc => quilt-0.63.inc}       | 5 +++--
 .../quilt/{quilt-native_0.61.bb => quilt-native_0.63.bb}             | 0
 meta/recipes-devtools/quilt/{quilt_0.61.bb => quilt_0.63.bb}         | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-0.61.inc => quilt-0.63.inc} (89%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.61.bb => quilt-native_0.63.bb} (100%)
 rename meta/recipes-devtools/quilt/{quilt_0.61.bb => quilt_0.63.bb} (100%)

diff --git a/meta/recipes-devtools/quilt/quilt-0.61.inc b/meta/recipes-devtools/quilt/quilt-0.63.inc
similarity index 89%
rename from meta/recipes-devtools/quilt/quilt-0.61.inc
rename to meta/recipes-devtools/quilt/quilt-0.63.inc
index 9ae4377..f375785 100644
--- a/meta/recipes-devtools/quilt/quilt-0.61.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.63.inc
@@ -10,8 +10,8 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://Makefile \
 "
 
-SRC_URI[md5sum] = "24417eba5961592b64103bdda001ebf4"
-SRC_URI[sha256sum] = "1eec0a270ac4d41eea0fd5823603c9d2a35ab6b8ab73a90dd92ce1291b2a9fc3"
+SRC_URI[md5sum] = "c0ef4beb58a6fa72563b955e70624b6e"
+SRC_URI[sha256sum] = "2846788221aa8844c54f10239c7cbc5e88031859162bcc285449446c3cfffe52"
 
 inherit autotools-brokensep ptest
 
@@ -55,4 +55,5 @@ do_install_ptest() {
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
                         perl-module-filehandle perl-module-getopt-std \
                         perl-module-posix perl-module-file-temp \
+                        perl-module-text-parsewords \
 "
diff --git a/meta/recipes-devtools/quilt/quilt-native_0.61.bb b/meta/recipes-devtools/quilt/quilt-native_0.63.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt-native_0.61.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.63.bb
diff --git a/meta/recipes-devtools/quilt/quilt_0.61.bb b/meta/recipes-devtools/quilt/quilt_0.63.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt_0.61.bb
rename to meta/recipes-devtools/quilt/quilt_0.63.bb
-- 
1.8.1.2


