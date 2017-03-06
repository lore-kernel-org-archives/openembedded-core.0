Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 78A63773E5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 21:47:47 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id o126so4679449pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 13:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gygkQX3tYO5iLIsNZPElFmaACM1axljpg9rZAHFkaeQ=;
	b=ER8FkNWmeOCOkP+hrxJqtp2hltwGak7j7Ss30b3m8MlGVRipbdeXEz7hw2f5v46vkl
	SGA4ELW2I4d5PXFAeG472zE4ouoP5jnVoy1auAEVduO+5OL9N2FgMXq2O9IT886y70yG
	Ql1AMo0UY/d59bz19JVYgFBdA9kZrJfAIH1ITQPY+ZZEt1slDoaBEOebNiqZPlxcR7ET
	+NpnYEc/eJsvhHwc2IvGJu/zm/gOxLpfZw9ITyllwUgHAzt6FD1e9DdUoGvPipWvSCri
	zQ/j+DKTWNV5nulOwWVh/zmXLBwBwwC+8iUlVlX002grqRHGySR9JMzSzzFRmLrh5F/5
	ncfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gygkQX3tYO5iLIsNZPElFmaACM1axljpg9rZAHFkaeQ=;
	b=DLpBoZUDdYixmLIpRkzyIJYJ8pB5cJhKO5mg1LMsVLkOKc1hOT7FwebPZdogxXUnDs
	vXv9YUuU6GlxIdlVQ3dk1FQ2ryGnviUzA55AQO/UHGjViGG1eHgTlf0oJPiTgG2COtQJ
	JVDxo1x3uVAKXcQh9dZvwAO09ki5B6W+4ELxfIRUEdZGanSr/NL1x2s0zMiYQVbR5zq2
	116J4jVxJ7Wz+uTeLlrX4KB5a+iASDS9Sd8XqVeqge5buJ8l8Cigz4FbPZNTC+kpk4AK
	D1IDEv2rucV0F5bir9RGSwG7tga6Uqy/cKZ2fixILL2NqJNFt12hFaFE5eU67K1gPwsg
	dCDA==
X-Gm-Message-State: AMke39kdAVWU3q7AJfnyTKpK9dLSxo8qkSS+NWZP2rSGLxz4uWUAxc3MPhl9pBnq0q9RZA==
X-Received: by 10.84.143.1 with SMTP id 1mr29339438ply.81.1488836868516;
	Mon, 06 Mar 2017 13:47:48 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	o5sm21966415pgj.66.2017.03.06.13.47.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 13:47:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 13:47:42 -0800
Message-Id: <1488836862-18218-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] conf/machine/include: enable hardfloat by default for ARMv6 and above
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
X-List-Received-Date: Mon, 06 Mar 2017 21:47:47 -0000

Defaulting to softfp probably isn't the best choice anymore,
especially as there are now ARM BSP layers which leave DEFAULTTUNE
entirely up to the distro:

  https://lists.yoctoproject.org/pipermail/yocto/2017-February/034637.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv6.inc   | 2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc  | 2 +-
 meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
 meta/conf/machine/include/tune-cortexa15.inc   | 2 +-
 meta/conf/machine/include/tune-cortexa17.inc   | 2 +-
 meta/conf/machine/include/tune-cortexa5.inc    | 2 +-
 meta/conf/machine/include/tune-cortexa7.inc    | 2 +-
 meta/conf/machine/include/tune-cortexa8.inc    | 2 +-
 meta/conf/machine/include/tune-cortexa9.inc    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 91f0f07..5e1f973 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv6"
+DEFAULTTUNE ?= "armv6thf"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 5446048..bad1c27 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7a"
+DEFAULTTUNE ?= "armv7athf"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index 42d8d04..4d9260f 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7ve"
+DEFAULTTUNE ?= "armv7vethf"
 
 TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
 TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 53994ef..2cadbee 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv6"
+DEFAULTTUNE ?= "armv6thf"
 
 require conf/machine/include/arm/arch-armv6.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 03de602..25e99f9 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7ve-neon"
+DEFAULTTUNE ?= "armv7vethf-neon"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index f659a62..40392f9 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7ve-neon"
+DEFAULTTUNE ?= "armv7vethf-neon"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index 93f9ca4..1f0cda6 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 52e06b8..52415d9 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7ve-neon"
+DEFAULTTUNE ?= "armv7vethf-neon"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index a831bd5..8ee8de9 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 8b84e60..0cf323c 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
-- 
1.9.1


