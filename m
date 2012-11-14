Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TYejd-00088e-Hx
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:18:37 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAEF343O022189;
	Wed, 14 Nov 2012 07:03:11 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Nov 2012 10:03:04 -0500
Message-Id: <17efdd800ce28d91fd0113eb7ec4aee1338605b9.1352840087.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, Rahul.Saxena@intel.com,
	dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] guilt: change upstream tgz location
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
X-List-Received-Date: Wed, 14 Nov 2012 15:18:37 -0000

The kernel.org mirror of the guilt tarball has been missing for a while
and the yocto mirrors have been keeping builds working. Switching to a
debian upstream is better than solely relying on the yocto mirrors for
serving the tgz.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-devtools/guilt/guilt-native_0.33.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
index 03763f7..754b528 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
@@ -4,11 +4,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6f3400dc1a01cebafe8a52b3f344135"
 
 PV = "0.33"
-PR = "r1"
+PR = "r2"
 
 inherit native
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/people/jsipek/guilt/guilt-${PV}.tar.gz\
+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/g/guilt/guilt_${PV}.orig.tar.gz\
            file://guilt-push.patch \
 	   file://guilt-pop.patch \
 	   file://guilt.patch \
-- 
1.7.10.4



