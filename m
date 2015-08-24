Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1C776BEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:46 +0000 (UTC)
Received: by iodb91 with SMTP id b91so161611605iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FKnpe7Oi43tGdJdM3uljNaCEwsWBPpO3u05v1A90QWo=;
	b=BS5/igyNTLlzd4ecm+1o86qbBV3dE0ylk47X4ZoZy7uDj9b7jCqYfS4xRt38ctvSil
	olrMTm4Pj9cbGfvB2d4R7S9EKEx9Kljz1f74K5uH+xDSUKIQTCw6R+pi8iBvs5TepcZ5
	SSZesPJFu17pX5zUhkg4ooFtH1hHTbwn4qHu6pWvtjVSC02HEd5zX8AsSiiZJzNlkLH8
	KeCq3Xb8Ce+UYBH7g7Y7mXOccUlXnGRuIPQJMV2DqYYVM/GMSRdqwyp/26LUwzMfVoYD
	+KArn8TqBem2TXlI8yDZbpdHsTh4HiVX0KKzw9penU4gwKtt/EyoUbhOK/m3dWTJ+NiU
	ITcg==
X-Received: by 10.107.11.29 with SMTP id v29mr20742793ioi.186.1440446626442;
	Mon, 24 Aug 2015 13:03:46 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:29 -0700
Message-Id: <e4e54bd80de2c8c0959d7c544935e93b0849fca1.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 11/17] bitbake.conf: Define fallback DISTRO_NAME
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:46 -0000

When using OE-Core only we miss this define and its now used in recipes
like os-release, which goes undefined and when booting we see messages
like

Welcome to ${DISTRO_NAME} nodistro.0!

This would change to
Welcome to OpenEmbedded nodistro.0!

Remove all trailing whitespaces while touching this file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 21f1698..c382c58 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -2,7 +2,7 @@
 # Standard target filesystem paths.
 ##################################################################
 #
-# If changing these values, beware that native/cross/nativesdk bbclass 
+# If changing these values, beware that native/cross/nativesdk bbclass
 # files may also need changes to keep in sync.
 #
 
@@ -161,7 +161,7 @@ DATETIME = "${DATE}${TIME}"
 # Openembedded Software Prerequisites.
 ##################################################################
 
-# python-native should be here but python relies on building 
+# python-native should be here but python relies on building
 # its own in staging
 ASSUME_PROVIDED = "\
     bzip2-native \
@@ -417,7 +417,7 @@ IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 # This option allows for a percentage overage of the actual image size rather than a
 # fixed extra space, this is space needed for initial startup and basic operations.
 IMAGE_OVERHEAD_FACTOR ?= "1.3"
-# This option allows for adding additional space in K above and beyond what the 
+# This option allows for adding additional space in K above and beyond what the
 # IMAGE_OVERHEAD_FACTOR might add. This space is for additional packages, user data, ...
 # To set a fixed size then overriding IMAGE_ROOTFS_SIZE with the max size one wants
 # should do the trick
@@ -646,18 +646,18 @@ export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 ### Config file processing
 ###
 
-# An empty distro leads to :: entries in OVERRIDES and FILEOVERRIDES which 
+# An empty distro leads to :: entries in OVERRIDES and FILEOVERRIDES which
 # is a bad idea. Setting a dummy value is better than a ton of anonymous python.
 DISTRO ??= "nodistro"
-
+DISTRO_NAME ??= "OpenEmbedded"
 # Overrides are processed left to right, so the ones that are named later take precedence.
 # You generally want them to go from least to most specific.
-# 
+#
 # This means that an envionment variable named '<foo>_arm' overrides an
 # environment variable '<foo>' (when ${TARGET_ARCH} is arm).
 # An environment variable '<foo>_qemuarm' overrides '<foo>' and overrides
-# '<foo>_arm' when ${MACHINE} is 'qemuarm'. 
-# If you use combination ie '<foo>_qemuarm_arm', then '<foo>_qemuarm_arm' will override 
+# '<foo>_arm' when ${MACHINE} is 'qemuarm'.
+# If you use combination ie '<foo>_qemuarm_arm', then '<foo>_qemuarm_arm' will override
 # '<foo>_qemuarm' and then '<foo>' will be overriden with that value from '<foo>_qemuarm'.
 # And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
 #
@@ -706,7 +706,7 @@ MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 # and no effect if less than it.
 IMAGE_ROOTFS_SIZE ??= "65536"
 
-# Forcefully set CACHE now so future changes to things like 
+# Forcefully set CACHE now so future changes to things like
 # MACHINE don't change the path to the cache
 CACHE := "${CACHE}"
 
@@ -755,7 +755,7 @@ BAD_RECOMMENDATIONS ?= ""
 MACHINE[unexport] = "1"
 
 # Make sure TARGET_ARCH isn't exported
-# (breaks Makefiles using implicit rules, e.g. quilt, as GNU make has this 
+# (breaks Makefiles using implicit rules, e.g. quilt, as GNU make has this
 # in them, undocumented)
 TARGET_ARCH[unexport] = "1"
 
-- 
2.1.4


