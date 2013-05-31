Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 806C26102A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 05:26:33 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v14so1595811pde.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 22:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7rrk1U0JgyfiKgu1m8iDNQlonZEsbDCoWwelu5EVLtQ=;
	b=LZYeD5k6IMSoQ36jRrnQjSqPM3K8Y06K9RFm/ZbgQ8Q2qMLqt84vNI/aWx/HwuMaOE
	uUBqqFx4K1/fKRR6nTL8Atpj7DbqQS8KkfHhte4Uybv8mNs4nw3viUQtpQ6F85uymZfh
	WKQzvHdxbIc18T16SBtFq3S0ZMnsKytxBqurdzKthR1AXKdnP0hlz3x4pdSEXJBZhjjh
	K11MWyKCGJj9CkILh1nOeTB1e20BOQHZ/qlETZEkGFHfUuUhKRETavyjoQWGybXxtLEm
	+ediJ9TE1wFkd9wiWMmpIMtS0mMFRSmXtlNVqa3/YuUsa9CfAPNhmROkUuoP+3MtUBdf
	ZG2A==
X-Received: by 10.66.51.165 with SMTP id l5mr12008607pao.73.1369977994666;
	Thu, 30 May 2013 22:26:34 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	wt5sm45035223pbc.38.2013.05.30.22.26.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 22:26:33 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 15:40:15 +1000
Message-Id: <1369978815-15261-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] xf86-video-modesetting: update to git revision cba29fd8c2
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
X-List-Received-Date: Fri, 31 May 2013 05:26:33 -0000

This adds support for 32 bpp pixmaps when 24 bpp framebuffer is used
which fixes graphics corruption in some cases.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../xorg-driver/xf86-video-modesetting_0.7.0.bb                |  7 -------
 .../recipes-graphics/xorg-driver/xf86-video-modesetting_git.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_git.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
deleted file mode 100644
index e45703f..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
-
-DESCRIPTION = "X.Org X server -- modesetting display driver"
-
-SRC_URI[md5sum] = "38e64eb09cef9bdf1de400bbe9818321"
-SRC_URI[sha256sum] = "2bc55f776eaee7b4e13df13238d36c4facf1cdca095a11519baf2376f5c996ac"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_git.bb
new file mode 100644
index 0000000..31653a4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_git.bb
@@ -0,0 +1,10 @@
+require xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
+
+DESCRIPTION = "X.Org X server -- modesetting display driver"
+
+SRCREV = "cba29fd8c2f605ed66718aa3a6b5833deb5d4cf9"
+PV = "0.6.0+git${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-modesetting;protocol=git"
+S = "${WORKDIR}/git"
-- 
1.8.3


