Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Nov 2017 16:49:10 UTC
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 7592378342
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:49:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4917C20BEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:40:02 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Mon, 27 Nov 2017 11:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=cMVYwxurXXqei6xXfmBhtPjTjRiTiWoZ9tMY0c2OCYI=; b=gaPqjvMz
	EzX94rVsqOOHdAPG5PXiW/xUJl2LK9xkux78Lm1GB5vXfoh2opOg2V2w2zrdntbu
	pWybMdivRR0x1P0cYkE2e2OS9qtAKkz6xls1VE4eU61+kxUJXcbUugLchhQ+wBvE
	DdpxpF4d2b7frXLA+hyjivqw7pZL1kqbujiMs5DW+NKHB3mAwIRj1h7bpVk2/ZWg
	Zf7C37159BUZ2b1rsqShTyuwFS6aZkbu4rI2VJcdjBRn8IbTBjSP6XV1daddSSeY
	R8fW5NMV1R9s0PM+iQGtyXhV3dnwS/KpJivKOMp2GWj8Ri5p9BGDqNtRt8002PDO
	3amXNiGENQ/QBA==
X-ME-Sender: <xms:4j8cWpJMHXMIz6_J2kwJWB6nC-RDW-rkM5CSSLXyBiMEFTqOLrGCMA>
Received: from localhost.localdomain (unknown [192.40.95.17])
	by mail.messagingengine.com (Postfix) with ESMTPA id 57C1E7F813
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:40:01 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 18:39:34 +0200
Message-Id: <20171127163934.31597-7-tanuk@iki.fi>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171127163934.31597-1-tanuk@iki.fi>
References: <20171127163934.31597-1-tanuk@iki.fi>
Subject: [PATCH 6/6] alsa-utils: 1.1.4 -> 1.1.5
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
X-List-Received-Date: Mon, 27 Nov 2017 16:49:10 -0000

Changes:
http://www.alsa-project.org/main/index.php/Changes_v1.1.4_v1.1.5

Rebased 0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...sa-utils-scripts_1.1.4.bb => alsa-utils-scripts_1.1.5.bb} |  0
 ...lsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch | 12 ++++++------
 .../alsa/{alsa-utils_1.1.4.bb => alsa-utils_1.1.5.bb}        |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.4.bb => alsa-utils-scripts_1.1.5.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.4.bb => alsa-utils_1.1.5.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.5.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.5.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
index e578dfe743..907ca5ce0e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
@@ -1,4 +1,4 @@
-From 8c3e0ef9625066c2bb67ee3d2b8cd37fd44eadac Mon Sep 17 00:00:00 2001
+From b9d41b784657152a4c5683a9458dffab557f0689 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 29 Aug 2014 18:58:56 +0300
 Subject: [PATCH] alsactl: don't let systemd unit restore the volume when
@@ -22,7 +22,7 @@ Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
-index cac8094..ff865dc 100644
+index 90fab9d..190525a 100644
 --- a/alsactl/Makefile.am
 +++ b/alsactl/Makefile.am
 @@ -38,9 +38,10 @@ install-data-hook:
@@ -40,17 +40,17 @@ index cac8094..ff865dc 100644
  
  alsa-state.service: alsa-state.service.in
 diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
-index 2884098..bac3ccc 100644
+index 80fd5fd..6beb36d 100644
 --- a/alsactl/alsa-restore.service.in
 +++ b/alsactl/alsa-restore.service.in
-@@ -8,6 +8,7 @@ Description=Save/Restore Sound Card State
+@@ -7,6 +7,7 @@
+ Description=Save/Restore Sound Card State
  ConditionPathExists=!@daemonswitch@
  ConditionPathExistsGlob=/dev/snd/control*
- After=alsa-state.service
 +ConditionPathExists=@localstatedir@/lib/alsa/asound.state
  
  [Service]
  Type=oneshot
 -- 
-2.7.0.rc3
+2.14.2
 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
index c8f4b861bd..f2231f34f0 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
@@ -23,8 +23,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-SRC_URI[md5sum] = "01e3934ca5bd22a80c27289d1b0adcdc"
-SRC_URI[sha256sum] = "a7831044de92c5bf33bf3365a3f36e49397f4191e934df460ae1ca15138c9d9d"
+SRC_URI[md5sum] = "dfe6ea147a5e07a056919591c2f5dac3"
+SRC_URI[sha256sum] = "320bd285e91db6e7fd7db3c9ec6f55b02f35449ff273c7844780ac6a5a3de2e8"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.14.2


