Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q1bcU-0007vI-4K
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 10:41:50 +0100
Received: by wwb17 with SMTP id 17so6308159wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 02:39:58 -0700 (PDT)
Received: by 10.216.11.205 with SMTP id 55mr4775452wex.72.1300700398292;
	Mon, 21 Mar 2011 02:39:58 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ed10sm2667716wbb.49.2011.03.21.02.39.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 02:39:57 -0700 (PDT)
From: koen@dominion.thruhere.net
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2011 10:38:39 +0100
Message-Id: <1300700320-25880-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] alsa-lib: extend to -native for qemu-native
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
X-List-Received-Date: Mon, 21 Mar 2011 09:41:50 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Qemu-needed is needed for the qemu* machines to build, but needs alsa-lib

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.23.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.23.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.23.bb
index db58abb..936f299 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.23.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.23.bb
@@ -6,6 +6,8 @@ LICENSE = "LGPLv2.1 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://src/socket.c;beginline=1;endline=26;md5=11ff89a8a7a4a690a5c78effe8159545"
 
+BBCLASSEXTEND = "native"
+
 # configure.in sets -D__arm__ on the command line for any arm system
 # (not just those with the ARM instruction set), this should be removed,
 # (or replaced by a permitted #define).
-- 
1.6.6.1



