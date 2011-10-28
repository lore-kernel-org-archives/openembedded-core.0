Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RJicE-0000Gr-8F
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 11:20:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9S9EejO027948
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 02:14:40 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 28 Oct 2011 02:14:40 -0700
Message-ID: <377fce979410d7c10e766353ea5e95ec62ddbaf7.1319793342.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1319793342.git.xiaofeng.yan@windriver.com>
References: <cover.1319793342.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 28 Oct 2011 16:59:26 +0800
Date: Fri, 28 Oct 2011 17:21:36 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libarchive update to 2.8.5
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
X-List-Received-Date: Fri, 28 Oct 2011 09:20:42 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Modify md5 sum justly

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../libarchive/libarchive_2.8.5.bb                 |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive_2.8.5.bb

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
new file mode 100644
index 0000000..1bc49e2
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "C library and command-line tools for reading and writing tar, cpio, zip, ISO, and other archive formats"
+HOMEPAGE = "http://code.google.com/p/libarchive/"
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4255e2e6f0349a4ac8fbd68459296e46"
+PR = "r0"
+
+DEPENDS = "libxml2"
+
+# We need to repack the tarball due undistributable content on the upstream one.
+# More details at http://code.google.com/p/libarchive/issues/detail?id=162
+SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
+           file://0001-Patch-from-upstream-revision-1990.patch \
+           file://0002-Patch-from-upstream-revision-1991.patch \
+           file://0004-Patch-from-upstream-rev-2514.patch \
+           file://0005-Patch-from-upstream-rev-2520.patch \
+           file://0006-Patch-from-upstream-rev-2521.patch \
+           file://0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch \
+           "
+
+SRC_URI[md5sum] = "9caf51dcf6213e9c9f5a1c27448b9c90"
+SRC_URI[sha256sum] = "13993e0ffbd121ccda46ea226b1f8eac218de0fa8da7d8b1f998093d5c32a72d"
+
+inherit autotools lib_package
+
+BBCLASSEXTEND = "nativesdk"
+
-- 
1.7.0.4



