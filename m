Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 24FD975874
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 14:53:03 +0000 (UTC)
Received: by wgav7 with SMTP id v7so67193809wga.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 07:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+RKbDvfhZJ99QyuBY0gl36rTwh92rFIxsudpdJ6/3ig=;
	b=OZxyQCmAbIUogxVjhabbV7Mi0jr6qcbc+ha03xBvdBTVFRTfM1zOhQavARUnmujgXx
	CrrcY6w3YRdqEOlg1LeKfAlY3Xn39/6ue9vMDmEdCbC4a3oU0Hmrg66/06/ALWgUm4l9
	WVu2uOM4geHymKxBxIxaVd1+Qdk5ZHGB2ko5u3U1Bot9SSE2oNPS5s86uErPI7M2uL79
	5JGm84bs6B5NwZaeWiigByc01k8+pFJHf31DCNJQAHrwqzntEX3ahpo4aIOmKk+Ed3bE
	R8FUfp6aBX2EUhio5bxI2rpYmnejD1EtR3pG0Bv43skdx6XUhGqROlQbjKUsmDgorTIb
	7N6w==
X-Gm-Message-State: ALoCoQkcUdQZObc8HmLVn+VR6rjquZRL4JYheP2qXGLUXUXT7JfjsXgeiveT42LDCL3tnnL8q/ha
X-Received: by 10.194.249.100 with SMTP id yt4mr60704381wjc.0.1437403983348;
	Mon, 20 Jul 2015 07:53:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ez4sm12178421wid.14.2015.07.20.07.53.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jul 2015 07:53:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 15:47:17 +0100
Message-Id: <1437403637-20013-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] qemu: upgrade to 2.4.0-rc1
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
X-List-Received-Date: Mon, 20 Jul 2015 14:53:10 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/qemu/{qemu_2.4.0-rc0.bb => qemu_2.4.0-rc1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_2.4.0-rc0.bb => qemu_2.4.0-rc1.bb} (81%)

diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0-rc1.bb
similarity index 81%
rename from meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb
rename to meta/recipes-devtools/qemu/qemu_2.4.0-rc1.bb
index 62df46e..7c2d782 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0-rc1.bb
@@ -8,10 +8,11 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BPN}-${REALPV}.tar.bz2"
-SRC_URI[md5sum] = "0c890db3811f2ad9cc7bb2a5afe08e4c"
-SRC_URI[sha256sum] = "8dda3e0f9baffbe29b524c03fd46d611afed1dfb5da1becec033beaf76a1bc6d"
+SRC_URI[md5sum] = "3c8d29abea2b61516bb7ef5b5ff62d03"
+SRC_URI[sha256sum] = "c0c6072ed9196ee17b4120f03fa9cdf9f63e893f7cb8008aa12ea1678450a481"
+
 S="${WORKDIR}/${BPN}-${REALPV}"
-REALPV = "2.4.0-rc0"
+REALPV = "2.4.0-rc1"
 PV = "2.3.99+${REALPV}"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
-- 
2.1.4


