Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UAZTx-0000TQ-1q
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 06:23:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1R56m6U000733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 21:06:48 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 21:06:47 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Feb 2013 00:06:39 -0500
Message-ID: <e94c982249ff44d6d3b372952c727b517b539967.1361940628.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361940628.git.bruce.ashfield@windriver.com>
References: <cover.1361940628.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-libc-headers: update to v3.8
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
X-List-Received-Date: Wed, 27 Feb 2013 05:23:27 -0000
Content-Type: text/plain

Now that the 3.8 kernel has been released we can bump the libc-headers
to that version and remove the 3.7 variant. Userspace compatibility is
maintained through kernel versions, we also make the single 3.8 version
the toolchain default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                      |    2 +-
 .../{linux-libc-headers_3.7.bb => linux-libc-headers_3.8.bb}     |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_3.7.bb => linux-libc-headers_3.8.bb} (42%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6e282df..93df37c 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.23.1"
 EGLIBCVERSION ?= "2.17"
 UCLIBCVERSION ?= "0.9.33+git%"
-LINUXLIBCVERSION ?= "3.7"
+LINUXLIBCVERSION ?= "3.8"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb
similarity index 42%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb
index a363289..5672bd4 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 SRC_URI += "file://scripts-Makefile.headersinst-install-headers-from-sc.patch"
 
-PR = "r1"
+PR = "r0"
 
-SRC_URI[md5sum] = "5323f3faadd051e83af605a63be5ea2e"
-SRC_URI[sha256sum] = "dc08d87a579fe2918362e6666e503a95a76296419195cb499aa9dd4dbe171a9e"
+SRC_URI[md5sum] = "fcd1d2e60e1033c935a13ef81c89ea2d"
+SRC_URI[sha256sum] = "fce774b5313e73949cb35f128e91e7b2ccd7fa2438abc5cff69267e504395a45"
-- 
1.7.10.4



