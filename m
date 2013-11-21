Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 872666DB9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 13:14:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rALDEtfE007386
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 05:14:55 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 05:14:54 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 21:14:38 +0800
Message-ID: <0e29f77b1778e75f547289c20e670fc0ffd5e070.1385039538.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385039538.git.hongxu.jia@windriver.com>
References: <cover.1385039538.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/4] qemu: add bash and python to qemu's RDEPENDS
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
X-List-Received-Date: Thu, 21 Nov 2013 13:14:55 -0000
Content-Type: text/plain

| Note: adding Smart RPM DB channel
|
| Note: to be installed:  qemu@x86_64 run-postinsts@x86_64 kernel-modules@qemux86_64 packagegroup-core-boot@qemux86_64
| Loading cache...
| Updating cache...               ######################################## [100%]
|
| Computing transaction...error: Can't install qemu-1.5.0-r0.0@x86_64: no package provides /usr/bin/python
|
| Saving cache...
|
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_rootfs (log file is located at tmp/work/qemux86_64-wrs-linux/wrlinux-image-glibc-small/1.0-r1/temp/do_rootfs/log.do_rootfs.21373)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 21ce489..3f3431d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -5,6 +5,7 @@ DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
 DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
 RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
+RDEPENDS_${PN}_class-target += "bash python"
 
 require qemu-targets.inc
 inherit autotools
-- 
1.8.1.2


