Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id EFA9D7713C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:27:02 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f6so3857902ith.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LGHAAJmaOylbG7/tS/U3BtLiXj6Y1U/h9bt/GaKLGhk=;
	b=OdGasr7/CLQybByLnoU0XG5iELkcuYT9SY9AdctA/R4dOMvWFY7i4Oy+2Bdwhxerfc
	V4C7tMHaO/7gOn/0kX1oKvSO6tGneHgN6kJsF3Lg9suLfCowFxqU0LU+44eojH2MPdCj
	nQTrCJGCesmWmODGuYgoXC2V/RZSA3hJ6PgoSEcJCCEgB528zkS4xsMBA+iIkVJUtd2K
	nEEo9Dliorh/kifL9SYsQ0zdQ6EMWZ13wlj5Wt/IpQKhViiMbKbsfc6lRBD+BvOjMOJ7
	LEpU/etrS9aHOaizK7PxchpgAXKTCkj9WWV2RPzpwr9W2fSxjzvJHbNUJFYGmFaRRZpM
	URaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=LGHAAJmaOylbG7/tS/U3BtLiXj6Y1U/h9bt/GaKLGhk=;
	b=mOg6GnhIQ6jPXaCiRv0SW/8pnag/1yIux6n1O/8Zk9e79rRpu2yxwLja2xN7fnRJYh
	bsphHSZ+090vDSAYwRgEWtGAm40WciAyqy0AsrYC0+y/YKL2ySzsMiqrmM7f4uUGRNQ/
	oIH089Hg59ae8HO0CUDhae8Bh2sQ7eDxd1ZSLgt9KwUuMewYn+pDfRx3pZuddfFPadMd
	wIUSDpPnem3Z9VPLgJjwqJSbiKNDHYhd0dwXPWSxRNA9j3Tf6/rRdLkKivWIDMTRRuUi
	694LlmwATqjbg9j2Zj/2fax0Uo0D+EcWX0Jxhdm1+oYOnGJDSTFcI7sN3K6LYcza7FkN
	7pQg==
X-Gm-Message-State: AEkoouutvz2VggGvaEfu81Bps3Wkye8LBuM393AhpEb0TSR9+NvhATpdiqzPt16yg7DM9g==
X-Received: by 10.36.219.65 with SMTP id c62mr15065528itg.44.1471285623739;
	Mon, 15 Aug 2016 11:27:03 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94])
	by smtp.gmail.com with ESMTPSA id 65sm7908858itl.16.2016.08.15.11.27.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 11:27:03 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2016 14:26:57 -0400
Message-Id: <9b6185357833cbc91c7dacf7fe74abe1f63036de.1471281772.git.bruce@zedd.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/4.1: config updates
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
X-List-Received-Date: Mon, 15 Aug 2016 18:27:03 -0000

Integrating the following configuration changes:

 features: usb-net: provide more coverage on USB network devices
 features: broxton: enable iTCO watchdog support
 features: broxton: enable iSMT support
 features: broxton: enable LPC bridge function for Intel ICH and SCH

Signed-off-by: Bruce Ashfield <bruce@zedd.org>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index d25911d..0fd78ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b1e722634976e1bcf9dc73bcbcfe3487c3fd7e4d"
-SRCREV_meta ?= "71dddd41d8395014d942ac8f20f1255751cb144f"
+SRCREV_meta ?= "497e2eb5c259c4ac434d09555b33da9ed4a8667e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index afc8819..485843d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
-SRCREV_meta ?= "71dddd41d8395014d942ac8f20f1255751cb144f"
+SRCREV_meta ?= "497e2eb5c259c4ac434d09555b33da9ed4a8667e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b17d591..d3963f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
 SRCREV_machine_qemux86-64 ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
 SRCREV_machine_qemumips64 ?= "ca25d7656f7eaeb8454a182cfa38fb704ec85276"
 SRCREV_machine ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
-SRCREV_meta ?= "71dddd41d8395014d942ac8f20f1255751cb144f"
+SRCREV_meta ?= "497e2eb5c259c4ac434d09555b33da9ed4a8667e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.5.0


