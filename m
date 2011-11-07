Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNN7M-0000RY-Mf
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 12:11:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA7B5hOv000599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 03:05:43 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 7 Nov 2011 03:05:43 -0800
Message-ID: <2a7edb60d8e4495033d7e938fa6a1e2930529a8f.1320664163.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1320664163.git.xiaofeng.yan@windriver.com>
References: <cover.1320664163.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 7 Nov 2011 18:56:18 +0800
Date: Mon, 7 Nov 2011 19:13:38 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libarchive: update to 2.8.5
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
X-List-Received-Date: Mon, 07 Nov 2011 11:11:57 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

libarchive: update to 2.8.5

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 ...rchive_2.8.4.yocto.1.bb => libarchive_2.8.5.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_2.8.4.yocto.1.bb => libarchive_2.8.5.bb} (76%)

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
similarity index 76%
rename from meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
rename to meta/recipes-extended/libarchive/libarchive_2.8.5.bb
index 94d261b..1bc49e2 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -9,19 +9,19 @@ DEPENDS = "libxml2"
 
 # We need to repack the tarball due undistributable content on the upstream one.
 # More details at http://code.google.com/p/libarchive/issues/detail?id=162
-SRC_URI = "http://autobuilder.yoctoproject.org/sources/libarchive-${PV}.tar.gz \
+SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
            file://0001-Patch-from-upstream-revision-1990.patch \
            file://0002-Patch-from-upstream-revision-1991.patch \
-           file://0003-Patch-from-upstream-rev-2516.patch \
            file://0004-Patch-from-upstream-rev-2514.patch \
            file://0005-Patch-from-upstream-rev-2520.patch \
            file://0006-Patch-from-upstream-rev-2521.patch \
            file://0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch \
            "
 
-SRC_URI[md5sum] = "71242da5191f1218f13dd520d95a870e"
-SRC_URI[sha256sum] = "8cd55db11b1d6001ff8007e4d22b6f4a4bb215e70750e19ab44b84b99ab76053"
+SRC_URI[md5sum] = "9caf51dcf6213e9c9f5a1c27448b9c90"
+SRC_URI[sha256sum] = "13993e0ffbd121ccda46ea226b1f8eac218de0fa8da7d8b1f998093d5c32a72d"
 
 inherit autotools lib_package
 
 BBCLASSEXTEND = "nativesdk"
+
-- 
1.7.0.4



