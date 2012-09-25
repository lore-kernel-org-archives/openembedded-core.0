Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGVj4-0002Ni-NL
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 16:03:02 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 25 Sep 2012 06:49:59 -0700
Received: by wibhn17 with SMTP id hn17so5329696wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 06:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=NEuepsZzL2n4VBiXQGPiPWdaIJswuhQOfctZ9chR6As=;
	b=gsZzcni3v6MI7BWOGC3qTBQaEx7IHzddSmojBNxqIGvWZv30+3x3krVCD/dCuBdvXz
	ZdUyWnU8eWRnGiGsTe3V8DOKP802tuqB5UDhVuBR83JnWT2Ruk2en9xBgrzP+51iz0IE
	zOM1x0lWpW7gVBfi0bmmxLcylKEjq856aFEbgpqT8gae7Vq9WQ0miIMOGaWfZg1mgFY/
	xmHOrrMMpcyJP46OZtwjfoTFEzhCRlosAtYYoMRFB5oBQ2PW9SCXl7BFzcTUgvzySKFk
	LkxfYccnhVeOIQIvgzyzSeYtdfc7XqJ9Y6/DbS5zBWahL8aoGES8iOE8T9cjFL+d/SCs
	Wy4w==
Received: by 10.216.243.10 with SMTP id j10mr9535531wer.211.1348580997529;
	Tue, 25 Sep 2012 06:49:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bn7sm692469wib.8.2012.09.25.06.49.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 06:49:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2012 14:49:03 +0100
Message-Id: <1348580943-30362-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmqLIwsTTrd48i1+++81KkbwSTAECpmjR/cZtI3P3q2X/dTwV7qJHbV9Qypnw7dfrrB7Cmt
Subject: [PATCH] xf86-input-keyboard: upgrade to 1.6.2
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
X-List-Received-Date: Tue, 25 Sep 2012 14:03:02 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-driver/xf86-input-keyboard_1.6.1.bb            |   15 ---------------
 .../xorg-driver/xf86-input-keyboard_1.6.2.bb            |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.1.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.2.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.1.bb
deleted file mode 100644
index ac398b5..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- keyboard input driver"
-
-DESCRIPTION = "keyboard is an Xorg input driver for keyboards. The \
-driver supports the standard OS-provided keyboard interface.  The driver \
-functions as a keyboard input device, and may be used as the X server's \
-core keyboard."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "09744e8dc9a1fe5e61927c1073cd3428"
-SRC_URI[sha256sum] = "aa9ec96e7f7f87bc086cb86b871ee6f4b9a7809fb1e7d50d0abbd7c2e50a8cc3"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.2.bb
new file mode 100644
index 0000000..b635499
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.2.bb
@@ -0,0 +1,15 @@
+require xorg-driver-input.inc
+
+SUMMARY = "X.Org X server -- keyboard input driver"
+
+DESCRIPTION = "keyboard is an Xorg input driver for keyboards. The \
+driver supports the standard OS-provided keyboard interface.  The driver \
+functions as a keyboard input device, and may be used as the X server's \
+core keyboard."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "ec2ea4c3faf5af15f2b3192d84252703"
+SRC_URI[sha256sum] = "76651a84f5031f7c6ecf075d55989c04a00689642579df6d1a1bee6d5c2e5f8a"
-- 
1.7.10



