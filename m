Return-Path: <scott.branden@broadcom.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F22D60F06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:39:26 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 4so3326779pfz.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=zXIGmLivW9tD6gmLRd9iaqUH20zXeOA3B1TOXqrH4BM=;
	b=afUw8E29H/zAYmxq0xIfFLNXuM/Txx47RAgJgTbls9qpDou/hUZI8Wy6i81daj/dLp
	faHrSc1WpSirzjb8uN8caCMRi4HY+WieV81BkAJFLYg1n/X3vmD/6viCPZYCJ665rHJm
	t9tdPGfh9JtiFilRgu15FlzRFDdydFgcM8wG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zXIGmLivW9tD6gmLRd9iaqUH20zXeOA3B1TOXqrH4BM=;
	b=ggxbbsxoDWAIBkeSmwSq6ralgUwt2KHzAvFNTCxVNlKrc4yiooiYMl1ohp4X64X+bz
	lPc7gxNlG21uUchLa1fuSrc2gHdYsMMFfxUSfq7VmWmEeGCMCzk7Cv76SGR9RULsa9MG
	MHyjuvanDooZZDUEJI7pcqOiZ3OE7uY4/J6CJJJD+9v15v/3/Kh5ogDPaNVcgFPzuzri
	uizr1VuPIwKCsobiFVauWjPXsgFpqlmnEPrdmQt08mzWY8Gazfa3Xqa7D17cYvmpBGvt
	3v843LIlZRCMxzVyAOjhgRw+/nxnoBB3/hkE4qkhrvRdAHO2t6bGSw20d0B5t5VfhMd2
	Msjw==
X-Gm-Message-State: APjAAAXEgoTuzsymapy/R5iCUHjDVWu2AwxOxDbdnq03ipIxkVR6Eifu
	cebEDWW4kbZsk7sErbQ4ZNLiixthOYNA6n4nZkhpZDn31rx7nafov0GqbeM9dtKP4rF6/+FSsSh
	i/SVatSkbR1sYhyQOep57edEekQ8b/VvBfNVkW52oupX/iEb/B9Y6fVABvUuYqgrLmK2Fq3KtJK
	g/JWZhO6qEkW5gUukcTsb6j5SOHhA=
X-Google-Smtp-Source: APXvYqzUa5TjOl8ROyTyI8/NSXEML4LQZgyEQ4ur+3yTF4XaDbAUYiXYhLA7p1i5KwQ93BOMxiwMKg==
X-Received: by 2002:aa7:8804:: with SMTP id c4mr14997794pfo.214.1581611966796; 
	Thu, 13 Feb 2020 08:39:26 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id 11sm3836629pfz.25.2020.02.13.08.39.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 08:39:25 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 08:39:18 -0800
Message-Id: <20200213163918.29470-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] x265: add x265 recipe
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
X-List-Received-Date: Thu, 13 Feb 2020 16:39:26 -0000

Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 .../recipes-multimedia/x265/x265_3.2.1.bb     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb

diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
new file mode 100644
index 0000000000..68c1a55c8c
--- /dev/null
+++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "H.265/HEVC video encoder"
+DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
+HOMEPAGE = "http://www.videolan.org/developers/x265.html"
+
+LICENSE = "GPLv2"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
+
+DEPENDS = "nasm-native gnutls zlib libpcre"
+
+SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
+
+S = "${WORKDIR}/x265_${PV}/source"
+
+SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
+SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
+
+inherit lib_package pkgconfig cmake
+
+AS[unexport] = "1"
+
+COMPATIBLE_MACHINE = "^$"
+COMPATIBLE_MACHINE_x86 = ".*"
+COMPATIBLE_MACHINE_x86-64 = ".*"
-- 
2.17.1


