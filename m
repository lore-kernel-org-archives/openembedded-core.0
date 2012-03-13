Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fe0-00011v-7O
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:16 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cfc0004604 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:41 GMT
X-Quarantine-ID: <sgf-Uyoal5I5>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sgf-Uyoal5I5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:40 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cZAD004538
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:36 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVT-0002ea-Pd
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:27 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:17 +0000
Message-Id: <14ae4991d8067eb047acf77b30b3abef2cecef5f.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/17] shadow: Correct license Artistic -> Artistic-1.0
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:16 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../shadow/shadow-native_4.1.4.3.bb                |    4 ++--
 .../shadow/shadow-sysroot_4.1.4.3.bb               |    4 ++--
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index 1f6ef1b..42ecc6a 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "Tools to change and administer password and group data"
 HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
 BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
 SECTION = "base utils"
-LICENSE = "BSD | Artistic"
+LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow.automake-1.11.patch \
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
index 1fb6c56..d379c1f 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "Shadow utils requirements for useradd.bbclass"
 HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
 BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
 SECTION = "base utils"
-LICENSE = "BSD | Artistic"
+LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;md5=25e2f2de4dfc8f966ac5cdfce45cd7d5"
 
 DEPENDS = "base-passwd"
 
-PR = "r2"
+PR = "r3"
 
 # The sole purpose of this recipe is to provide the /etc/login.defs
 # file for the target sysroot - needed so the shadow-native utilities
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index a69eb7c..f892eb9 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "Tools to change and administer password and group data"
 HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
 BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
 SECTION = "base utils"
-LICENSE = "BSD | Artistic"
+LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
-- 
1.7.5.4



