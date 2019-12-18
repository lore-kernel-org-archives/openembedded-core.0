Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 082A46BE2A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:07:38 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id 38so1986692qtb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nBorfcp6Bjr3K91U8JHIcDqjB77PN802swKLVH+V4MA=;
	b=XTZ8bMkwndR7A44pSyDAY54SrMvol3w4HB6IvxJ63HfRjQ7aVmwX4CelZU0ej42Q2f
	ipbX4136+d8xxx4pLEVJLn7qQZJfMyA0lelwe+F9rVQNVLex8wUxqHeDMbVnvr3PG/s2
	xzwZU0AGX4A6fQqBDJAZl39Ho56vJ1UiocS9wwzL7nEPZmqrQHdwXwVFl/3WeLuXTDQZ
	YgXMtKJrF+wAy5gjUBhQD54cT1FCvaJ0XvqNoqjcexrtRA+TDux+4NfjGhUbHd5dy7xQ
	wgOf/L3utoUd0/MejY2bwEE+ZB90IKfqo8fATNi0+uT6CVD3+q80C37h7vwuK3M7KLtz
	+tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nBorfcp6Bjr3K91U8JHIcDqjB77PN802swKLVH+V4MA=;
	b=aBUsxDar+T6dPp7pF5f02+tBgO+QVFiMzzR9aHN9NngnG+yUpeH9gxiub6sB+QTFX9
	3DYBOLLrDWxEb22EbCqASLhgw9AFheKJUNQmez6NpIXG7/suymylu4VyoCraJVkaMPMx
	ZZCuNgPlD+6fKxT9JbHP+y/YgnMvkhHM2vSLGSQFj6UnHS/Yd55E/WvMGbeG2PAtLaQ6
	66Mj2kgiD8q1jFM2IO0PM/fqK+Ok/JnD8TT5jrveY9Q5e3rJ0lu3M9trMTmEkUMUyzU4
	nQJfoy9VOpuV2oXQc+Dv0k+UC5okJ0AYSesA/iFEQ42n28uTP0qF4KDaA1oW5B+0Y2Bf
	8Qsg==
X-Gm-Message-State: APjAAAVkTmSp7QMg3BGYqerj2CjD16zS4pYPVuInfHxHOFwcy/MXXUgp
	2OhOSsYIUMEZDhrpjdXFfQBzRDh+tzRr1g==
X-Google-Smtp-Source: APXvYqzQ9BF3dXQ2uVJkiPZKJXy0OJxDzf5Eixfqgmhj41Ei0lX2jDj8q8uYzpG3RJI/hp4/Qj9tPg==
X-Received: by 2002:ac8:685:: with SMTP id f5mr2234488qth.199.1576678059820;
	Wed, 18 Dec 2019 06:07:39 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id k14sm668918qki.66.2019.12.18.06.07.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:07:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 Dec 2019 09:07:27 -0500
Message-Id: <8238943ca801820180463553468306dea4c9e358.1576677592.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1576677592.git.bruce.ashfield@gmail.com>
References: <cover.1576677592.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/5.2: update to v5.2.21
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
X-List-Received-Date: Wed, 18 Dec 2019 14:07:39 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    e91ef5bcdeda Linux 5.2.21

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 423331e19a..83b44a8c4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "55e3ee387b073d8d609e8899859561340d8b6911"
-SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
+SRCREV_machine ?= "ab16819b1520191e73213bc0cd7a7433349efcca"
+SRCREV_meta ?= "57c5933eb4c46ddaeee331717360e68380724126"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.20"
+LINUX_VERSION ?= "5.2.21"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index f7239d0229..7ece6e0dce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.20"
+LINUX_VERSION ?= "5.2.21"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "501d680535903acc00808c36f2cc07f2dc725adc"
-SRCREV_machine ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
+SRCREV_machine_qemuarm ?= "1c68baaea976d9e28b5f2b445a90afb4865994c8"
+SRCREV_machine ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_meta ?= "57c5933eb4c46ddaeee331717360e68380724126"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 8f75f67c39..c7f601769f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fcbe51dfa0a763a07e4cd66204d6c0ba054663ce"
-SRCREV_machine_qemuarm64 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemumips ?= "9cad7bb8bcd3686f580a3363847ee9c9e86928b1"
-SRCREV_machine_qemuppc ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemuriscv64 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemux86 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemux86-64 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemumips64 ?= "dc2be1a546e937374590ce3858b717489ded2c21"
-SRCREV_machine ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
+SRCREV_machine_qemuarm ?= "fcd7089abefcf3025b6a49baa0604fb7215886ce"
+SRCREV_machine_qemuarm64 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemumips ?= "30bbc3b38f5caa851d01b37ab1cdd2dae75e9592"
+SRCREV_machine_qemuppc ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemuriscv64 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemux86 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemux86-64 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemumips64 ?= "4dab38a25c5b32491b23cd95eca75a68f02b3339"
+SRCREV_machine ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_meta ?= "57c5933eb4c46ddaeee331717360e68380724126"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.20"
+LINUX_VERSION ?= "5.2.21"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


