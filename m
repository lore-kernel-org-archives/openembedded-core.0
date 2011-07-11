Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QgKKX-0005kI-3E
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 19:31:37 +0200
Received: by mail-yi0-f47.google.com with SMTP id 18so1691397yib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=vHiEFP5O0yYUrBoZV+WCc+8PVz08PbonoHarFpS7/hc=;
	b=LafBxmqD/DCSjSbcbXI7Xz5irCh6MnjPJSZKrAIVHyQYC91y4QXDCLOtBucwhNrbWN
	0cku9wZHhXIXpMGAEuQ957SdIp0ANH6MRv3uLAz5r4a4lwAFvWLR8Vpw/p5rjOvJMxCA
	ePwT6ilFyoL+rDUW5VcpfHixPm4lRYNN5usBU=
Received: by 10.236.29.73 with SMTP id h49mr5477957yha.453.1310405262949;
	Mon, 11 Jul 2011 10:27:42 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id z28sm3592901yhn.35.2011.07.11.10.27.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 10:27:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 17:27:18 +0000
Message-Id: <8e42cc4c6a96394988e32d8f8be3ca10c13724ac.1310405202.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310405202.git.otavio@ossystems.com.br>
References: <cover.1310405202.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310405202.git.otavio@ossystems.com.br>
References: <cover.1310405202.git.otavio@ossystems.com.br>
Subject: [PATCH 4/5] libarchive: remove undistributable copyright content from source
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
X-List-Received-Date: Mon, 11 Jul 2011 17:31:37 -0000

The original tarball has two undistributable files that we have
removed from the repacked tarball. The issue has been reported
upstream at:

http://code.google.com/p/libarchive/issues/detail?id=162

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...rchive_2.8.4.bb => libarchive_2.8.4.yocto.1.bb} |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_2.8.4.bb => libarchive_2.8.4.yocto.1.bb} (68%)

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.4.bb b/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
similarity index 68%
rename from meta/recipes-extended/libarchive/libarchive_2.8.4.bb
rename to meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
index 6d4fb39..94d261b 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
@@ -7,7 +7,9 @@ PR = "r0"
 
 DEPENDS = "libxml2"
 
-SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
+# We need to repack the tarball due undistributable content on the upstream one.
+# More details at http://code.google.com/p/libarchive/issues/detail?id=162
+SRC_URI = "http://autobuilder.yoctoproject.org/sources/libarchive-${PV}.tar.gz \
            file://0001-Patch-from-upstream-revision-1990.patch \
            file://0002-Patch-from-upstream-revision-1991.patch \
            file://0003-Patch-from-upstream-rev-2516.patch \
@@ -17,8 +19,8 @@ SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
            file://0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch \
            "
 
-SRC_URI[md5sum] = "83b237a542f27969a8d68ac217dc3796"
-SRC_URI[sha256sum] = "86cffa3eaa28d3116f5d0b20284026c3762cf4a2b52b9844df2b494d4a89f688"
+SRC_URI[md5sum] = "71242da5191f1218f13dd520d95a870e"
+SRC_URI[sha256sum] = "8cd55db11b1d6001ff8007e4d22b6f4a4bb215e70750e19ab44b84b99ab76053"
 
 inherit autotools lib_package
 
-- 
1.7.2.5



