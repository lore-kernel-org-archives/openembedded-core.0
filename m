Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.721.1610713822642426781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 09DF338C1439
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.4.17 SUCCEEDED
Message-ID: <MADEUP.165A67B0EDD885AE.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146820
Content-Type: multipart/mixed; boundary="===============6923637613570853840=="

--===============6923637613570853840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libproxy* to *0.4.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.4.15-0.4.17.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6923637613570853840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libproxy/libproxy-dbg: RRECOMMENDS: added "dbus-lib-dbg"
packages/core2-32-poky-linux/libproxy/libproxy-dev: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_gnome3.so /usr/lib/libproxy/0.4.17/modules/config_pacrunner.so"
packages/core2-32-poky-linux/libproxy/libproxy-dev: RRECOMMENDS: added "dbus-lib-dev"
packages/core2-32-poky-linux/libproxy/libproxy-doc: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_gnome3.so /usr/lib/libproxy/0.4.17/modules/config_pacrunner.so"
packages/core2-32-poky-linux/libproxy/libproxy-locale: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_gnome3.so /usr/lib/libproxy/0.4.17/modules/config_pacrunner.so"
packages/core2-32-poky-linux/libproxy/libproxy-staticdev: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_gnome3.so /usr/lib/libproxy/0.4.17/modules/config_pacrunner.so"
packages/core2-32-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_gnome3.so /usr/lib/libproxy/0.4.17/modules/config_pacrunner.so"
packages/core2-32-poky-linux/libproxy/libproxy: RDEPENDS: added "dbus-lib (['>= 1.12.20'])"
Changes to packages/core2-32-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy/0.4.15 moved to /usr/lib/libproxy/0.4.17
  /usr/lib/libproxy/0.4.17/modules/config_pacrunner.so was added

--===============6923637613570853840==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.4.15-0.4.17.patch"

From 74056251d189954c6a3022a86173dc6ee1bcce23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 12:19:25 +0000
Subject: [PATCH] libproxy: upgrade 0.4.15 -> 0.4.17

---
 ...t-pac-test-Fix-build-with-clang-libc.patch | 31 ------
 .../libproxy/libproxy/CVE-2020-25219.patch    | 61 ------------
 .../libproxy/libproxy/CVE-2020-26154.patch    | 98 -------------------
 ...{libproxy_0.4.15.bb => libproxy_0.4.17.bb} |  9 +-
 4 files changed, 2 insertions(+), 197 deletions(-)
 delete mode 100644 meta/recipes-support/libproxy/libproxy/0001-get-pac-test-Fix-build-with-clang-libc.patch
 delete mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch
 delete mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
 rename meta/recipes-support/libproxy/{libproxy_0.4.15.bb => libproxy_0.4.17.bb} (78%)

diff --git a/meta/recipes-support/libproxy/libproxy/0001-get-pac-test-Fix-build-with-clang-libc.patch b/meta/recipes-support/libproxy/libproxy/0001-get-pac-test-Fix-build-with-clang-libc.patch
deleted file mode 100644
index fedda9dd95..0000000000
--- a/meta/recipes-support/libproxy/libproxy/0001-get-pac-test-Fix-build-with-clang-libc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2d73469c7a17ebfe4330ac6643b0c8abdc125d05 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Jan 2019 09:29:44 -0800
-Subject: [PATCH] get-pac-test: Fix build with clang/libc++
-
-get-pac-test.cpp:55:10: error: assigning to 'int' from incompatible type '__bind<int &, sockaddr *, unsigned int>'
-                        ret = bind(m_sock, (sockaddr*)&addr, sizeof (struct sockaddr_in));                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/libproxy/libproxy/pull/97]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libproxy/test/get-pac-test.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libproxy/test/get-pac-test.cpp b/libproxy/test/get-pac-test.cpp
-index 0059dfb..911f296 100644
---- a/libproxy/test/get-pac-test.cpp
-+++ b/libproxy/test/get-pac-test.cpp
-@@ -52,7 +52,7 @@ class TestServer {
- 
- 			setsockopt(m_sock, SOL_SOCKET, SO_REUSEADDR, &i, sizeof(i));
- 
--			ret = bind(m_sock, (sockaddr*)&addr, sizeof (struct sockaddr_in));
-+			ret = ::bind(m_sock, (sockaddr*)&addr, sizeof (struct sockaddr_in));
- 			assert(!ret);
- 
- 			ret = listen(m_sock, 1);
--- 
-2.20.1
-
diff --git a/meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch b/meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch
deleted file mode 100644
index 3ef7f85451..0000000000
--- a/meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From a83dae404feac517695c23ff43ce1e116e2bfbe0 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@gnome.org>
-Date: Wed, 9 Sep 2020 11:12:02 -0500
-Subject: [PATCH] Rewrite url::recvline to be nonrecursive
-
-This function processes network input. It's semi-trusted, because the
-PAC ought to be trusted. But we still shouldn't allow it to control how
-far we recurse. A malicious PAC can cause us to overflow the stack by
-sending a sufficiently-long line without any '\n' character.
-
-Also, this function failed to properly handle EINTR, so let's fix that
-too, for good measure.
-
-Fixes #134
-
-Upstream-Status: Backport [https://github.com/libproxy/libproxy/commit/836c10b60c65e947ff1e10eb02fbcc676d909ffa]
-CVE: CVE-2020-25219
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- libproxy/url.cpp | 28 ++++++++++++++++++----------
- 1 file changed, 18 insertions(+), 10 deletions(-)
-
-diff --git a/libproxy/url.cpp b/libproxy/url.cpp
-index ee776b2..68d69cd 100644
---- a/libproxy/url.cpp
-+++ b/libproxy/url.cpp
-@@ -388,16 +388,24 @@ string url::to_string() const {
- 	return m_orig;
- }
- 
--static inline string recvline(int fd) {
--	// Read a character.
--	// If we don't get a character, return empty string.
--	// If we are at the end of the line, return empty string.
--	char c = '\0';
--	
--	if (recv(fd, &c, 1, 0) != 1 || c == '\n')
--		return "";
--
--	return string(1, c) + recvline(fd);
-+static string recvline(int fd) {
-+	string line;
-+	int ret;
-+
-+	// Reserve arbitrary amount of space to avoid small memory reallocations.
-+	line.reserve(128);
-+
-+	do {
-+		char c;
-+		ret = recv(fd, &c, 1, 0);
-+		if (ret == 1) {
-+			if (c == '\n')
-+				return line;
-+			line += c;
-+		}
-+	} while (ret == 1 || (ret == -1 && errno == EINTR));
-+
-+	return line;
- }
- 
- char* url::get_pac() {
diff --git a/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch b/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
deleted file mode 100644
index 0ccb99da81..0000000000
--- a/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 4411b523545b22022b4be7d0cac25aa170ae1d3e Mon Sep 17 00:00:00 2001
-From: Fei Li <lifeibiren@gmail.com>
-Date: Fri, 17 Jul 2020 02:18:37 +0800
-Subject: [PATCH] Fix buffer overflow when PAC is enabled
-
-The bug was found on Windows 10 (MINGW64) when PAC is enabled. It turned
-out to be the large PAC file (more than 102400 bytes) returned by a
-local proxy program with no content-length present.
-
-Upstream-Status: Backport [https://github.com/libproxy/libproxy/commit/6d342b50366a048d3d543952e2be271b5742c5f8]
-CVE: CVE-2020-26154
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- libproxy/url.cpp | 44 +++++++++++++++++++++++++++++++-------------
- 1 file changed, 31 insertions(+), 13 deletions(-)
-
-diff --git a/libproxy/url.cpp b/libproxy/url.cpp
-index ee776b2..8684086 100644
---- a/libproxy/url.cpp
-+++ b/libproxy/url.cpp
-@@ -54,7 +54,7 @@ using namespace std;
- #define PAC_MIME_TYPE_FB "text/plain"
- 
- // This is the maximum pac size (to avoid memory attacks)
--#define PAC_MAX_SIZE 102400
-+#define PAC_MAX_SIZE 0x800000
- // This is the default block size to use when receiving via HTTP
- #define PAC_HTTP_BLOCK_SIZE 512
- 
-@@ -478,15 +478,13 @@ char* url::get_pac() {
- 		}
- 
- 		// Get content
--		unsigned int recvd = 0;
--		buffer = new char[PAC_MAX_SIZE];
--		memset(buffer, 0, PAC_MAX_SIZE);
-+		std::vector<char> dynamic_buffer;
- 		do {
- 			unsigned int chunk_length;
- 
- 			if (chunked) {
- 				// Discard the empty line if we received a previous chunk
--				if (recvd > 0) recvline(sock);
-+				if (!dynamic_buffer.empty()) recvline(sock);
- 
- 				// Get the chunk-length line as an integer
- 				if (sscanf(recvline(sock).c_str(), "%x", &chunk_length) != 1 || chunk_length == 0) break;
-@@ -498,21 +496,41 @@ char* url::get_pac() {
- 
- 			if (content_length >= PAC_MAX_SIZE) break;
- 
--			while (content_length == 0 || recvd != content_length) {
--				int r = recv(sock, buffer + recvd,
--				             content_length == 0 ? PAC_HTTP_BLOCK_SIZE
--				                                 : content_length - recvd, 0);
-+			while (content_length == 0 || dynamic_buffer.size() != content_length) {
-+				// Calculate length to recv
-+				unsigned int length_to_read = PAC_HTTP_BLOCK_SIZE;
-+				if (content_length > 0)
-+					length_to_read = content_length - dynamic_buffer.size();
-+
-+				// Prepare buffer
-+				dynamic_buffer.resize(dynamic_buffer.size() + length_to_read);
-+
-+				int r = recv(sock, dynamic_buffer.data() + dynamic_buffer.size() - length_to_read, length_to_read, 0);
-+
-+				// Shrink buffer to fit
-+				if (r >= 0)
-+					dynamic_buffer.resize(dynamic_buffer.size() - length_to_read + r);
-+
-+				// PAC size too large, discard
-+				if (dynamic_buffer.size() >= PAC_MAX_SIZE) {
-+					chunked = false;
-+					dynamic_buffer.clear();
-+					break;
-+				}
-+
- 				if (r <= 0) {
- 					chunked = false;
- 					break;
- 				}
--				recvd += r;
- 			}
- 		} while (chunked);
- 
--		if (content_length != 0 && string(buffer).size() != content_length) {
--			delete[] buffer;
--			buffer = NULL;
-+		if (content_length == 0 || content_length == dynamic_buffer.size()) {
-+			buffer = new char[dynamic_buffer.size() + 1];
-+			if (!dynamic_buffer.empty()) {
-+				memcpy(buffer, dynamic_buffer.data(), dynamic_buffer.size());
-+			}
-+			buffer[dynamic_buffer.size()] = '\0';
- 		}
- 	}
- 
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.17.bb
similarity index 78%
rename from meta/recipes-support/libproxy/libproxy_0.4.15.bb
rename to meta/recipes-support/libproxy/libproxy_0.4.17.bb
index 6f704d7a91..ad81cccf52 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.17.bb
@@ -8,13 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://0001-get-pac-test-Fix-build-with-clang-libc.patch \
-           file://CVE-2020-25219.patch \
-           file://CVE-2020-26154.patch \
-          "
-SRC_URI[md5sum] = "f6b1d2a1e17a99cd3debaae6d04ab152"
-SRC_URI[sha256sum] = "654db464120c9534654590b6683c7fa3887b3dad0ca1c4cd412af24fbfca6d4f"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI[sha256sum] = "bc89f842f654ee1985a31c0ba56dc7e2ce8044a0264ddca84e650f46cd7f8b05"
 
 UPSTREAM_CHECK_URI = "https://github.com/libproxy/libproxy/releases"
 UPSTREAM_CHECK_REGEX = "libproxy-(?P<pver>.*)\.tar"
-- 
2.27.0


--===============6923637613570853840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libproxy: PV changed from "0.4.15" to "0.4.17"
packages/core2-32-poky-linux/libproxy: PKGV changed from 0.4.15 [default] to 0.4.17 [default]
packages/core2-32-poky-linux/libproxy: SRC_URI changed from "https://github.com/libproxy/libproxy/releases/download/0.4.15/libproxy-0.4.15.tar.xz file://0001-get-pac-test-Fix-build-with-clang-libc.patch file://CVE-2020-25219.patch file://CVE-2020-26154.patch" to "https://github.com/libproxy/libproxy/releases/download/0.4.17/libproxy-0.4.17.tar.xz"
packages/core2-32-poky-linux/libproxy/libproxy-dbg: RRECOMMENDS: added "dbus-lib-dbg"
packages/core2-32-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 3101760 to 3253252 (+5%)
packages/core2-32-poky-linux/libproxy/libproxy-dbg: PV changed from "0.4.15" to "0.4.17"
packages/core2-32-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.4.15 [default] to 0.4.17 [default]
packages/core2-32-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_pacrunner.so /usr/lib/libproxy/0.4.17/modules/config_gnome3.so"
packages/core2-32-poky-linux/libproxy/libproxy-dev: RRECOMMENDS: added "dbus-lib-dev"
packages/core2-32-poky-linux/libproxy/libproxy-dev: PKGSIZE changed from 5386 to 5624 (+4%)
packages/core2-32-poky-linux/libproxy/libproxy-dev: PV changed from "0.4.15" to "0.4.17"
packages/core2-32-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.4.15 [default] to 0.4.17 [default]
packages/core2-32-poky-linux/libproxy/libproxy-dev: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_pacrunner.so /usr/lib/libproxy/0.4.17/modules/config_gnome3.so"
packages/core2-32-poky-linux/libproxy/libproxy-doc: PV changed from "0.4.15" to "0.4.17"
packages/core2-32-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.4.15 [default] to 0.4.17 [default]
packages/core2-32-poky-linux/libproxy/libproxy-doc: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_pacrunner.so /usr/lib/libproxy/0.4.17/modules/config_gnome3.so"
packages/core2-32-poky-linux/libproxy/libproxy-locale: PV changed from "0.4.15" to "0.4.17"
packages/core2-32-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.4.15 [default] to 0.4.17 [default]
packages/core2-32-poky-linux/libproxy/libproxy-locale: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_pacrunner.so /usr/lib/libproxy/0.4.17/modules/config_gnome3.so"
packages/core2-32-poky-linux/libproxy/libproxy-src: PKGSIZE changed from 97422 to 102944 (+6%)
packages/core2-32-poky-linux/libproxy/libproxy-src: PV changed from "0.4.15" to "0.4.17"
packages/core2-32-poky-linux/libproxy/libproxy-src: PKGV changed from 0.4.15 [default] to 0.4.17 [default]
packages/core2-32-poky-linux/libproxy/libproxy-src: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_pacrunner.so /usr/lib/libproxy/0.4.17/modules/config_gnome3.so"
packages/core2-32-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.4.15" to "0.4.17"
packages/core2-32-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.4.15 [default] to 0.4.17 [default]
packages/core2-32-poky-linux/libproxy/libproxy-staticdev: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_pacrunner.so /usr/lib/libproxy/0.4.17/modules/config_gnome3.so"
packages/core2-32-poky-linux/libproxy/libproxy: PKGSIZE changed from 218645 to 236473 (+8%)
packages/core2-32-poky-linux/libproxy/libproxy: PV changed from "0.4.15" to "0.4.17"
packages/core2-32-poky-linux/libproxy/libproxy: PKGV changed from 0.4.15 [default] to 0.4.17 [default]
packages/core2-32-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.4.15/modules", added "/usr/lib/libproxy/0.4.17/modules"
packages/core2-32-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy/0.4.15/modules/config_gnome3.so", added "/usr/lib/libproxy/0.4.17/modules/config_pacrunner.so /usr/lib/libproxy/0.4.17/modules/config_gnome3.so"
packages/core2-32-poky-linux/libproxy/libproxy: RDEPENDS: added "dbus-lib (['>= 1.12.20'])"
Changes to packages/core2-32-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy/0.4.15 moved to /usr/lib/libproxy/0.4.17
  /usr/lib/libproxy/0.4.17/modules/config_pacrunner.so was added

--===============6923637613570853840==--
