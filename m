Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 45CFB7D00B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:12:01 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v4so6434838ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 20:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5qgDEleuZhkqX1AeZIFcFYZJ7UrkfIQVuBaC+Ms1yD8=;
	b=TUriyOjcaD1G4VPWqCuac9/OQETM5LOC6f1jVSNNVLLKIlQRUso3KoEv7EE0Qa5OOO
	fHozkQOfJpOmZonl28Hg7asj/J0gdeS3fBldDFWKgvntDL82B6tAVwHSF2h3qHjmVMeE
	gDJHmt8l8ikJ+YTFuS4McJuHze8bWmR76Cn9jMq/s8QqCz5dalSeaMdI0FHKVYFwelf1
	RrOHj3PWNEJ7i2Qcgbxa0IzitoKyadPNZhevndYS5LxEBlQgKGwg8xz3i3Op4MOLgWub
	Ho/FL4ni43zVn1rnAlY0V4q2lJJE1YIINra8VuQ3MBVY1MmG+9Xlzxq5vjeU4GeNkSBI
	C7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5qgDEleuZhkqX1AeZIFcFYZJ7UrkfIQVuBaC+Ms1yD8=;
	b=dgMTAIAu2m77bZyJ3UdInXFnzUsm9n9TlQfGX+FNJn9uBORfICs7mUOuFYi7nPOYL1
	tbwNBUQ5TmvyTSkG8qUGfk4m33sO98OfAvoy67jLOyx2BLrdU1skJufrvjaYmrIN7RR/
	3/qcauxNBPHZpph3HThmwwMqavzRgeL+jlM+i/Gfps4128L4s8otZE0hFfeakzF9FL2v
	36JiAztoeJt0uaE1yhvDpq3lkJPEaITBO63i63zGiNcCts6VgyF/lNXEv7/wKX6NgUdW
	Q3kl4mEBmh2SU5zkE1+iAlnxWKCQ37dBVU1+15OdapRB6APrc/FbafD0RjNuvOfTn2OG
	p2zQ==
X-Gm-Message-State: APjAAAUUlMAXHBT0KhF5au8z+Cy6fS+xmgAa5iHRLF6w+53OIuqvXdXc
	ZVEMe1GdVeH7Y6VOZvLmiR6Efyi9mOc=
X-Google-Smtp-Source: APXvYqwRDgddkzG+2HVjAbzMG7wwNaEY+PL1WB6RgHwD4uivxsufN0N5zqzMjJN1WWNQBAa1RQ4Frw==
X-Received: by 2002:a6b:660d:: with SMTP id a13mr15298101ioc.186.1553483522169;
	Sun, 24 Mar 2019 20:12:02 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id l8sm5443416itl.26.2019.03.24.20.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 20:12:01 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 24 Mar 2019 23:11:51 -0400
Message-Id: <853a069622ceeaabeaec453ef45417a8ccc295b8.1553483380.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1553483380.git.bruce.ashfield@gmail.com>
References: <cover.1553483380.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto: pinctrl config change for cannonlake
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
X-List-Received-Date: Mon, 25 Mar 2019 03:12:01 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating a configuration change to enable pinctrl for the cannonlake
platform.

Signed-off-by: Pradhan Surya Narayanx <surya.narayanx.pradhan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 18a6fad2d2..979ffcdddc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3059029718900250904b9f587e37ba22fb949ea6"
-SRCREV_meta ?= "8bbb1a762d4370b0698403f75a5b98ed25a3517f"
+SRCREV_meta ?= "b173a1b0a218f2bebc28251ef08ee592652b6bc0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index ead031166c..bec4931012 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_meta ?= "c713269d5c5a3dffb7e4aabeecbcb3d481a59151"
+SRCREV_meta ?= "122f60c86239e6b181f4c59a444140138ec074b6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 065e112ccd..0129d6a6e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "6cc861e796ab19a6827cf9996e7755f1875d553e"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "8bbb1a762d4370b0698403f75a5b98ed25a3517f"
+SRCREV_meta ?= "b173a1b0a218f2bebc28251ef08ee592652b6bc0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 589aee3431..760a1fbc56 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "2260c031075188dce4d30223527dda68e3940574"
 SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_meta ?= "c713269d5c5a3dffb7e4aabeecbcb3d481a59151"
+SRCREV_meta ?= "122f60c86239e6b181f4c59a444140138ec074b6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 3beba32c34..d5d99e7d77 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemux86-64 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemumips64 ?= "fc7a2bf24e0e39b6a260f8650a3c8d497b8cdcfd"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "8bbb1a762d4370b0698403f75a5b98ed25a3517f"
+SRCREV_meta ?= "b173a1b0a218f2bebc28251ef08ee592652b6bc0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 81845c48da..bba6829571 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
 SRCREV_machine_qemux86-64 ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
 SRCREV_machine_qemumips64 ?= "8322515ba7a858c47386b95c6e7201c8a3a41175"
 SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_meta ?= "c713269d5c5a3dffb7e4aabeecbcb3d481a59151"
+SRCREV_meta ?= "122f60c86239e6b181f4c59a444140138ec074b6"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


