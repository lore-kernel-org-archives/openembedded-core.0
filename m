Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGIM8-00024Y-CX
	for openembedded-core@lists.openembedded.org;
	Sun, 01 May 2011 00:09:41 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so2272452pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 15:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+MjHrhemvF1wk5lYNuF/xCU00CRyGtfETMTNXEM6qFo=;
	b=kdUlcKPGWCD8o7TvczQhTCWx1IH78jByk8BC9dMU9GsskV568dw24+nbaAdRZqeFa5
	BVh/RARij4fgQt8Kf73NYlLeg9gaAQtPWSs/jDm7pdMRDQSs4k08rB9jX0aDz5g69GI5
	MmA9eUH7OtdA7eJyKwmQ+gMlK2JD+J7hC+jq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mCm4LJezySlTs1x+Twgx9HGLlKjSSXfzov56rHW0s7visLkJF7cjSiogqxoFYBSfmD
	EV+5O6tmeFE9X3n3DvBAamx2qzAaxcNmVmvUk0MV+lR0mZLx1TO8Qf9THr2PN6Ofp6q9
	wRiJ9+ic/AZKnmEku70hg8u3DMxuIvRvLpt2g=
Received: by 10.143.27.23 with SMTP id e23mr2360214wfj.274.1304201227843;
	Sat, 30 Apr 2011 15:07:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z10sm4974966wfj.12.2011.04.30.15.07.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2011 15:07:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Apr 2011 15:06:57 -0700
Message-Id: <de9484337b54df02c3934f11feeec30938b2a2aa.1304200899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304200899.git.raj.khem@gmail.com>
References: <cover.1304200899.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] libx11: Use inherit gettext
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
X-List-Received-Date: Sat, 30 Apr 2011 22:09:41 -0000

Avoid direct depependency on gettext, inherit class instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb |    3 ++-
 meta/recipes-graphics/xorg-lib/libx11_git.bb   |    6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
index c572d5e..08ba07b 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
@@ -1,4 +1,5 @@
 require libx11.inc
+inherit gettext
 
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bf75bfe4d05068311b5e6862d4b5f2c5"
@@ -14,7 +15,7 @@ SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
 SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
 
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
-            libxdmcp xf86bigfontproto kbproto inputproto xproto-native gettext"
+            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
 EXTRA_OECONF += "--without-xcb"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_git.bb b/meta/recipes-graphics/xorg-lib/libx11_git.bb
index a976a16..aa69f4a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_git.bb
@@ -1,11 +1,13 @@
 require libx11.inc
 require libx11_git.inc
 
+inherit gettext
+
 PR = "r2"
 
 DEPENDS = "xproto xextproto xcmiscproto xf86bigfontproto kbproto inputproto \
-           bigreqsproto xtrans libxau libxcb libxdmcp util-macros gettext"
+           bigreqsproto xtrans libxau libxcb libxdmcp util-macros"
 
 DEFAULT_PREFERENCE = "-1"
 
-BBCLASSEXTEND = "nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.4.1



