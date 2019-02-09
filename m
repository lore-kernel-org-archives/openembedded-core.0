Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 071717C5C8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 18:37:10 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id r11so11646724itc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 10:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lTVjulZ68sNnGVnWKFXG/7JvLvN/CvzupnzcN2k2jiY=;
	b=KzXeyc6AHX5+0fAKjW/Tl4Jnhw3KO99RWzmoYomOyvhQu69XH0898qw8yCFeTo+Gfa
	XpZA46XC5Rfl+wbu3W3thIKMzDvxC3/i9hxH5QmmHhuVVCt0Qe1GiygczB2GyYDc/meT
	54qQsUBzfkdYVwzddeyyXuyq2aj/3N9qSB+1n91PbRFCiQpVBr108Q4s2kihNhrLTUzl
	Cyt379+raMevyXvt/U6OLaJfAyVtUxSqZQ2Ps2Mc5J3mE+1opZybAlWAvHIoktNzGrWa
	kG2hVjQ4Qccz7QvHK0VixdL+boKwRQGbMA4+2gS4TbOKVUaIsvHel/1zOdX6kMU2TUp6
	i07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lTVjulZ68sNnGVnWKFXG/7JvLvN/CvzupnzcN2k2jiY=;
	b=BmJozB742hRfjIUYY5SmdyOfwbGTAUk2zdS6AnvU6IUHUBcu2uZQJPu6YzqE2KmRwo
	C/82wUqInw9Urnf2lN8u85yJrzG20yknrX+UDj95KKPWtAgvNk1VlRvGD5C/iq8ZLXPL
	SFInwrDO6IPkNmjrgx1kQA4dKgugnKTAQfZ4BTB8NzCWCVFwKH0TVEtSewVHLY8KIDCw
	nwOr/AhUnODT4mNGsqU4dVWwMDymSflFbrBzB+jqnEXPZp+vZRwRvE1u8Wbn9Gjn5LNN
	Yl8RL8DZpZhQ5NY3n+T8jaLGnwuKi/M1wxTCP5nSON+x7IYbfLbiQQfTZxBNg9Pjk2U+
	sxJQ==
X-Gm-Message-State: AHQUAuavt74JdSQ3UadIBs4G6A1p0SfgK1m+4njuXfpve+UIduH3EV6m
	P1EoaQZTcoy0U7I5qKaThdI=
X-Google-Smtp-Source: AHgI3Iafx2PU5TV6P+XUC1S79gQzn4EzR4/uzRFsmo9EGDI6z466qMhtMEFNdaX9/pDEPMYzO9mMug==
X-Received: by 2002:a24:6b97:: with SMTP id v145mr2492467itc.155.1549737431951;
	Sat, 09 Feb 2019 10:37:11 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id h2sm2633643itk.0.2019.02.09.10.37.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 10:37:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sat,  9 Feb 2019 18:37:05 +0000
Message-Id: <a6e686fb731eb05844b021e5e8f676cf4e69a06e.1549737160.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1549737160.git.bruce.ashfield@gmail.com>
References: <cover.1549737160.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto: tweak console boot check
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
X-List-Received-Date: Sat, 09 Feb 2019 18:37:11 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

    boot/main: don't check console device file on fs when booting with
initrd/initramfs

    In case of initrd/initramfs /dev/console might not exist that early
    as devtmpfs is mounted a bit later by /init process so disable this
    check in that case.

    Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb               |  4 ++--
 .../linux/linux-yocto-tiny_4.19.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.19.bb  | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 79eebb49f5..591981aa31 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7759e970a7e106bd37bd62b63ab67bdae54a2152"
-SRCREV_meta ?= "4c0da29403e242f3d429196cf4a03200211e6ff4"
+SRCREV_machine ?= "3059029718900250904b9f587e37ba22fb949ea6"
+SRCREV_meta ?= "5d93f38b0eed56071261895aefecfca287595536"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 69d0a6136d..bb2ea2d991 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "64017daf053fdb31049248e45f42e0abd55117d3"
-SRCREV_machine ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
-SRCREV_meta ?= "4c0da29403e242f3d429196cf4a03200211e6ff4"
+SRCREV_machine_qemuarm ?= "6cc861e796ab19a6827cf9996e7755f1875d553e"
+SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
+SRCREV_meta ?= "5d93f38b0eed56071261895aefecfca287595536"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 11f7e15bad..13d6eb0ea0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "21a0a68be12c2e549fcc63c3253f22123dc46b72"
-SRCREV_machine_qemuarm64 ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
-SRCREV_machine_qemumips ?= "27542dfa0e04bf9d8453a172fce459176787fd97"
-SRCREV_machine_qemuppc ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
-SRCREV_machine_qemux86 ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
-SRCREV_machine_qemux86-64 ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
-SRCREV_machine_qemumips64 ?= "5abad938eff63706ca30fdf09b31f1c7b36f5308"
-SRCREV_machine ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
-SRCREV_meta ?= "4c0da29403e242f3d429196cf4a03200211e6ff4"
+SRCREV_machine_qemuarm ?= "0d83500d7377b68aeb42387350bb41dd7dc04315"
+SRCREV_machine_qemuarm64 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
+SRCREV_machine_qemumips ?= "0169796412b83d8835f3f9b81d19efe008199fdd"
+SRCREV_machine_qemuppc ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
+SRCREV_machine_qemux86 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
+SRCREV_machine_qemux86-64 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
+SRCREV_machine_qemumips64 ?= "fc7a2bf24e0e39b6a260f8650a3c8d497b8cdcfd"
+SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
+SRCREV_meta ?= "5d93f38b0eed56071261895aefecfca287595536"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.19.1


