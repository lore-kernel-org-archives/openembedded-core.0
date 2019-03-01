Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F61B7CD37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 05:34:31 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r136so18656701iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 21:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LLxL1C7OIdHkSlet0YSRQmnCmZW+chrgRPDDJg7WZOc=;
	b=mFBrg2oEx6WuPVuc2xtTo1ZcteG2vy9N4EjKU4zJ9ntkKPuWmceiNcIQmG5ms3gr4j
	ZeWAHqWQ5yFsRAcnTQ2k6BWasfD/0RLSw+jiPXws4yLmFo247wYNV2xVGwV6Ni+oBQQp
	YQWtdsoN6QH9PqueCtPBiJ34IK/pHrjXIK+NQCCzi5jCzDxgPPeGP9jkIp2ZG40vUPj2
	8emN14Bd/rzSh+IGT2rzOqsuqOi2MBMVwuUOEn80NnFJBRDF+x2yQiX4kaztL3Da5uPP
	rQ5gAnzyjhrHJruXRhhsRQ53i5IMoBsL/6cRoMUY6iOVay9CRUisOvtXOagNtjz1G/lW
	RsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LLxL1C7OIdHkSlet0YSRQmnCmZW+chrgRPDDJg7WZOc=;
	b=DcXfn4ckhndsVL/iyqkiEfaH0ukxG95+i7eZzzbj6R5VHj1sgSjhqcIi+MNE8aXi/J
	Vyx4tlN30RpTVNep6DPvvtT2wQur+rVWxzz01dfQeMH/9+YCWycXn0oGSQ+/HbDkk87M
	vocV+JgVliZ15agm2xJQv6NDM196LFimKivYs4d4q9B+BRBkwG2Ltnk7pZ1fJPJdDUf7
	Zxb2ckai5jl0VuRFdcrYq1bB38Ztp2NAgKiZTDJ1ploGj6T0r9oYUGZBLy4HB7Yy2ejy
	4pTW4DSslwjzNRqdR6/6IEGAdweD4RyfdQvfNlOAquZsk5dyXTTI/kjPGNaNgvM7DsRv
	3XAg==
X-Gm-Message-State: APjAAAXireCUA7uIeQnXzEfmJ/fU3zVN7XJNo96JGDWgJl4RScnCu64Q
	02kwJ4WS2gNaEGsbwPKBV8o=
X-Google-Smtp-Source: APXvYqwLFCCZ5okYaDXtmcrFJ8xz4rKRlf4CZeVV+qLfXY/3+/gClGYeq8r/i3Tsm/koxo8AhKn+hw==
X-Received: by 2002:a5d:834f:: with SMTP id q15mr1779306ior.25.1551418472338; 
	Thu, 28 Feb 2019 21:34:32 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id k77sm3935110itb.7.2019.02.28.21.34.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 21:34:31 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Mar 2019 00:34:24 -0500
Message-Id: <2f745b2d2ca3f47c1ff8d05ac0d8b65437f0c320.1551418113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1551418113.git.bruce.ashfield@gmail.com>
References: <cover.1551418113.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/4.19: configuration cleanups
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
X-List-Received-Date: Fri, 01 Mar 2019 05:34:31 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration tweaks (which were already
on yocto-4.18):

   9bddc4aa1eb bsp/intel-x86: Rename CONFIG_R8723BE to CONFIG_RTL8723BE
   6504b0ed616 features: drop the obsolete kernel option
   5d18756a7fc features/hostapd: drop obsolete configs
   bdf91f835b9 bsp/intel-x86: Drop configs that has been removed by kernel
   0f8bb536c22 intel-x86: Drop configs which are not defined in kernel

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 328cd2ac12..18f84827fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3059029718900250904b9f587e37ba22fb949ea6"
-SRCREV_meta ?= "83d017da0cc6c84b0167eafcf2811d0717c35b86"
+SRCREV_meta ?= "17912f45855984e53a3416a88699c9f0f2233972"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index b52c82d569..8efa9cbe3e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "6cc861e796ab19a6827cf9996e7755f1875d553e"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "83d017da0cc6c84b0167eafcf2811d0717c35b86"
+SRCREV_meta ?= "17912f45855984e53a3416a88699c9f0f2233972"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index bfc9285ccd..9e29379a73 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemux86-64 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemumips64 ?= "fc7a2bf24e0e39b6a260f8650a3c8d497b8cdcfd"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "83d017da0cc6c84b0167eafcf2811d0717c35b86"
+SRCREV_meta ?= "17912f45855984e53a3416a88699c9f0f2233972"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.19.1


