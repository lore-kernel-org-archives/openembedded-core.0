Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18135.1795794432714401141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:47:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=N5hbq0pP;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: ddrake@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso75682715e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 07:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795794431; x=1796399231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Acsp8TyFfTZwfEXpXTd0FXRcn43irdcJ+WK3iCxo4c=;
        b=N5hbq0pPUpl3MtxgyMzNo8fMSh3nmx4OEok4ET92JDshrm4Rs5m6tF16z7OkhDMbMa
         1h2pLSPrNMVjheqUXnByy0OyqczuzX1hIi+cet7CX3rNx7he+5RhpykbvcNlVz5hCXHs
         OxiWkXUrddZxD7Tgro2MrlyTEMGiVwhiJbv7yaewhwJofLbEgaLuhMRHnnphbG+x3HyR
         Ys5pmf8upbTWyPclk6cNYVEIHHRChuQjqmmjmwUBjvOdtRaIVO+4578ogvyIK/zpqT6U
         Ltpec1V0yG/9S/MLJSF91kbp9P6k9GscAuv5cxyR6uS0Iy9nsF2rQzPcfHMmkDmSem1h
         tKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794431; x=1796399231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Acsp8TyFfTZwfEXpXTd0FXRcn43irdcJ+WK3iCxo4c=;
        b=S8C6k3vUcm1liKBUrSicS2McChEANui2IFCDwqUY5oF6Bdf6dRhZq3hMKvkYEfxF7L
         nLlZvRlj1d2IWjJtTEJfrEL3vbSbs6DdVgeVCD5HuOZq9JzvTxLGD+6KyYSOBTeK90Rl
         jBv4awT71X3s59SdosUQoWqVQ6+SmRfmYzw7ZrJKmDpxupA5xKLOGHweMhFCN90tK5wl
         /x54WngKv6TJ6+3+5l10O4Og1TML18Irn1dedU8AuT2yui9YS7XbQmRYmdL8E0ODlseE
         e4KqHfmPlR8mFnst5NGN//ASNKo7cB8mzjzzzpnur9D3DXDSabfCEKy5t7V5vRNs4b0a
         4q/A==
X-Gm-Message-State: APuU4Z+UI9rWsIdy4rT0hQP4EZPAOL1x5g7sVpRNNQF58p99JM6t7TPK
	RbL2aiab0BcJiA646R9s15c+q7TgMWcO0HkvZt3iepIpHvsP6R05CD/hGv6WQR0vqfsb9IIMgAt
	ow3KCt/g=
X-Gm-Gg: AZFdTZfFHKD1KCGjBjYgplJclGM50XwSZaw9tkuVqT0ZQbp/MajkFXf9NlRgQT4M5tj
	sCBx1+vV2doGvVLIK17nzyHU7Mlq/k3IuPuONwtIaO1PCJ59JZsWaCR6U124qtSfNc7rGE85Rxe
	O9XZShWPzWCNCsjJcQmNArnzrqoW7FdW2qayRZKDJmdoTrLcqSCd1qC7Z3PF3ApPKAOIPWOOCap
	loajofejIoKYjIB8FuOGMujV/ugLSpYOCA8sys2D7/oi063WTF57xMhnrV7Tp/KJCp977OHmlmW
	uCM5H0TayEU3S+nyJKEw4C/HB+YbCSVji41QD9xPvV3g3g9EJ7FOUtYvGIiGQHN8w0XBHsgXx4E
	XE7Ux6tVann8X5Zyy21CeXnvysUbCzbZkojdyHcMF09PDfZRCmPkeHvkQtm57sVJEdVmhJOg9Rf
	Ycntzzk7d9l0Y1x1rJHpkQtJLyQyB1J9HLeIRegt6UGq1AxRuW8BafktmI7AV7Efrgi96t4nVFj
	MYEEW6vyjg6694uqy+S91G3Zk6x/Xv7M/c5VxKUONPQdk7vWqNv91Hp3e0oOMBkhElE0SlfHVtw
	XEgkE7wOOyRlX/63JiBUy236/yY=
X-Received: by 2002:a05:600c:e40b:b0:4bb:9a6c:8712 with SMTP id 5b1f17b1804b1-4bb9a6c8724mr270188965e9.12.1795794430897;
        Fri, 27 Nov 2026 07:47:10 -0800 (PST)
Return-Path: <ddrake@baylibre.com>
Received: from numbers ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm350261255e9.4.2026.11.27.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:47:10 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>,
	Daniel Drake <ddrake@baylibre.com>
Subject: [PATCH 1/2] venus-protocol: add recipe
Date: Fri, 27 Nov 2026 15:46:51 +0000
Message-ID: <20261127154652.253316-2-ddrake@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127154652.253316-1-ddrake@baylibre.com>
References: <20261127154652.253316-1-ddrake@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 15:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251403
Content-Type: text/plain; charset="utf-8"

Venus is the protocol used by the Mesa Venus Vulkan driver (virtio-gpu)
to serialize Vulkan commands to the host renderer. As of Mesa-26.3,
these protocol headers have been moved into their own external package.

Add a recipe which installs the generated headers and pkg-config file.

Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../mesa/venus-protocol_1.1.3.bb              | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/venus-protocol_1.1.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 62de04001e..7fbd8eafde 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -873,6 +873,7 @@ RECIPE_MAINTAINER:pn-util-macros = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-v86d = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vala = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-valgrind = "Venkata Adhitya Navuduri <venkata.navuduri@windriver.com>"
+RECIPE_MAINTAINER:pn-venus-protocol = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vim = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vim-tiny = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-virglrenderer = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/mesa/venus-protocol_1.1.3.bb b/meta/recipes-graphics/mesa/venus-protocol_1.1.3.bb
new file mode 100644
index 0000000000..e7701a76f6
--- /dev/null
+++ b/meta/recipes-graphics/mesa/venus-protocol_1.1.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Venus protocol headers for Vulkan over virtio-gpu"
+DESCRIPTION = "Venus is the protocol used to serialize Vulkan commands \
+between a guest Vulkan driver and a host renderer over virtio-gpu. This \
+package provides the C headers generated from the protocol definition, \
+which are used to build the Mesa Venus Vulkan driver."
+HOMEPAGE = "https://gitlab.freedesktop.org/virgl/venus-protocol"
+BUGTRACKER = "https://gitlab.freedesktop.org/virgl/venus-protocol/-/issues"
+SECTION = "graphics"
+
+LICENSE = "MIT AND (Apache-2.0 OR MIT)"
+# Use meson.build for MIT license checksum temporarily; future releases will include a LICENSE file.
+LIC_FILES_CHKSUM = "file://meson.build;beginline=1;endline=2;md5=7e736041c5167e57165490a93689761e \
+                    file://xmls/vk.xml;beginline=4;endline=5;md5=6784716613b13820761ca251591ef4e1"
+
+SRC_URI = "git://gitlab.freedesktop.org/virgl/venus-protocol.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "ca19b6358d7cc491bc3e4de76f04c6700876a8fa"
+
+DEPENDS = "python3-mako-native"
+
+inherit meson pkgconfig python3native
-- 
2.56.1

