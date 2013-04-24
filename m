Received: from smtp12.smtpout.orange.fr ([80.12.242.134]
	helo=smtp.smtpout.orange.fr) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UV8Fa-0002pG-65
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 00:33:22 +0200
Received: from localhost.localdomain ([10.163.22.217]) by mwinf5d35 with ME
	id Ty831l00D4h1lPN03y83tC; Thu, 25 Apr 2013 00:08:04 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 00:08:01 +0200
Message-Id: <1366841282-9445-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH 1/2] apt: update to 0.9.7.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 22:33:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../disable-configure-in-makefile.patch                            | 0
 .../fix-gcc-4.6-null-not-defined.patch                             | 0
 .../apt/{apt-0.9.7.7 => apt-0.9.7.8}/makerace.patch                | 0
 .../apt/{apt-0.9.7.7 => apt-0.9.7.8}/no-ko-translation.patch       | 0
 .../apt/{apt-0.9.7.7 => apt-0.9.7.8}/no-nls-dpkg.patch             | 0
 .../apt/{apt-0.9.7.7 => apt-0.9.7.8}/noconfigure.patch             | 0
 meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/nodoc.patch | 0
 .../apt/{apt-0.9.7.7 => apt-0.9.7.8}/truncate-filename.patch       | 0
 .../apt/{apt-0.9.7.7 => apt-0.9.7.8}/use-host.patch                | 0
 .../apt/{apt-native_0.9.7.7.bb => apt-native_0.9.7.8.bb}           | 6 ++----
 meta/recipes-devtools/apt/{apt_0.9.7.7.bb => apt_0.9.7.8.bb}       | 7 ++-----
 11 files changed, 4 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.7 => apt-0.9.7.8}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.7.7.bb => apt-native_0.9.7.8.bb} (52%)
 rename meta/recipes-devtools/apt/{apt_0.9.7.7.bb => apt_0.9.7.8.bb} (72%)

diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/disable-configure-in-makefile.patch b/meta/recipes-devtools/apt/apt-0.9.7.8/disable-configure-in-makefile.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.7.7/disable-configure-in-makefile.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.8/disable-configure-in-makefile.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/fix-gcc-4.6-null-not-defined.patch b/meta/recipes-devtools/apt/apt-0.9.7.8/fix-gcc-4.6-null-not-defined.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.7.7/fix-gcc-4.6-null-not-defined.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.8/fix-gcc-4.6-null-not-defined.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/makerace.patch b/meta/recipes-devtools/apt/apt-0.9.7.8/makerace.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.7.7/makerace.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.8/makerace.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/no-ko-translation.patch b/meta/recipes-devtools/apt/apt-0.9.7.8/no-ko-translation.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.7.7/no-ko-translation.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.8/no-ko-translation.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt-0.9.7.8/no-nls-dpkg.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.7.7/no-nls-dpkg.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.8/no-nls-dpkg.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/noconfigure.patch b/meta/recipes-devtools/apt/apt-0.9.7.8/noconfigure.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.7.7/noconfigure.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.8/noconfigure.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/nodoc.patch b/meta/recipes-devtools/apt/apt-0.9.7.8/nodoc.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.7.7/nodoc.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.8/nodoc.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/truncate-filename.patch b/meta/recipes-devtools/apt/apt-0.9.7.8/truncate-filename.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.7.7/truncate-filename.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.8/truncate-filename.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/use-host.patch b/meta/recipes-devtools/apt/apt-0.9.7.8/use-host.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.7.7/use-host.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.8/use-host.patch
diff --git a/meta/recipes-devtools/apt/apt-native_0.9.7.7.bb b/meta/recipes-devtools/apt/apt-native_0.9.7.8.bb
similarity index 52%
rename from meta/recipes-devtools/apt/apt-native_0.9.7.7.bb
rename to meta/recipes-devtools/apt/apt-native_0.9.7.8.bb
index d71ab2f..000a18d 100644
--- a/meta/recipes-devtools/apt/apt-native_0.9.7.7.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.9.7.8.bb
@@ -1,11 +1,9 @@
 require apt-native.inc
 
-PR = "r1"
-
 SRC_URI += "file://noconfigure.patch \
 	    file://no-curl.patch"
 
-SRC_URI[md5sum] = "039fc57668d1a0c2f62dc22e71900a16"
-SRC_URI[sha256sum] = "6eca4285f1ac2e8cb837b9546553b0546881ed15853aa5bbeb860bab6bfa1700"
+SRC_URI[md5sum] = "d44f459d59d8fa7fc5f455f1f982f08c"
+SRC_URI[sha256sum] = "9570905992f4a83b0c182f11f9e0a8c20a1209a52996d1a01ddbfa359ae2c819"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta/recipes-devtools/apt/apt_0.9.7.7.bb b/meta/recipes-devtools/apt/apt_0.9.7.8.bb
similarity index 72%
rename from meta/recipes-devtools/apt/apt_0.9.7.7.bb
rename to meta/recipes-devtools/apt/apt_0.9.7.8.bb
index a9dcc74..9653ee9 100644
--- a/meta/recipes-devtools/apt/apt_0.9.7.7.bb
+++ b/meta/recipes-devtools/apt/apt_0.9.7.8.bb
@@ -3,11 +3,8 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r0"
-
-
-SRC_URI[md5sum] = "039fc57668d1a0c2f62dc22e71900a16"
-SRC_URI[sha256sum] = "6eca4285f1ac2e8cb837b9546553b0546881ed15853aa5bbeb860bab6bfa1700"
+SRC_URI[md5sum] = "d44f459d59d8fa7fc5f455f1f982f08c"
+SRC_URI[sha256sum] = "9570905992f4a83b0c182f11f9e0a8c20a1209a52996d1a01ddbfa359ae2c819"
 
 require apt-package.inc
 
-- 
1.7.11.7



