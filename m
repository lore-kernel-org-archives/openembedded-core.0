Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXKXy-0004SO-Vk
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 01:00:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2012 15:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103525814"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 15:50:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 15:46:16 -0700
Message-Id: <83cb37a2a4287e0dbbde41a736da058d4bd3169a.1337805812.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337805812.git.sgw@linux.intel.com>
References: <cover.1337805812.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337805812.git.sgw@linux.intel.com>
References: <cover.1337805812.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 5/5] qemu: disable vnc-jpeg compression
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
X-List-Received-Date: Wed, 23 May 2012 23:00:51 -0000

This is disabled by default to ensure a deterministic build, qemu
configure would sometimes detect the libjpeg and then enable this.
Since mostly qemu is used locally disable by default.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc       |    2 +-
 meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 75ff962..e618c1d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -12,7 +12,7 @@ SDL ?= "--disable-sdl"
 SDL_virtclass-native ?= ""
 SDL_virtclass-nativesdk ?= ""
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg"
 
 #EXTRA_OECONF += "--disable-sdl"
 
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index bdffcf4..986fa19 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r6"
+PR = "r7"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
-- 
1.7.7.6



