Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 262887F82F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:21 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f129so4210205wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JPiebKvNdDw1KgqIxmYbUi8ztzm+IIRTb4YYTlv5RAY=;
	b=E15Wd62A7o5BIH8Ijcy2EB6/+FS5KZ86IBzekJQNY91GL3VLE0fTSy2t206R7i0mNw
	gn4PKTQTTri2Ce3Rb86RAhVXlSyJTq22OrTvu1uN7iOFwOdz5MXCmF1omepFpJP9ABCz
	LwCUNGCa82mWsPWVdnz2BD8LZdls0RNKlh79yKxYf3Hh1texDyojNOq8M+k1lW81D+g2
	S5zFkWA/zVgC66bA5T7l26a4iH0G68UPg5bBfbMbh2NtYzl7f5KNSZ8fzyOmYDojBmO7
	zqaWaiXeU8Wgtqv/hNVhsOcDn/qMlBifbBVKTmQvQRRhxKU9CDziau7ny//IxgBOwUym
	YVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JPiebKvNdDw1KgqIxmYbUi8ztzm+IIRTb4YYTlv5RAY=;
	b=uCz9Z2EFqxjUG4zAeeA0MnZe3Zgu+ZpTzbBOMeKzHq8Nvfcun7aBxeP2WQzMAdRwU/
	PbK23DeNpR+z81xuT6fl/71eHMnjKw8mBeaCaXB2FI9/HZpKynh7veY3vqZI+GaXtd9M
	T0b79toU5sadEkUtcoOgbuux/6wQ0x2RPAQJWA5wJIrNUKW4avZwJx97KpL6yauTHdNw
	OBXf/rWnoPsZbO6p7Cbmm8IONuabAjfA0rif/HGizGyatkxvYbKcbchTTzDu7oGlhD0R
	7xEQp1T4axpruG+UMXAhugY5m9E0Y58ZyVqqjclWaRFeCg52a941q7IUdRa0aoFAW4BT
	DhbA==
X-Gm-Message-State: APjAAAV4zpN22c0xf+pUrFrVwnKfIEmzPv2dWlR6XLZEsG8v1+aB7Ln5
	LlSV6mxm8ETw0iv6AmeG9wpoeeXL
X-Google-Smtp-Source: APXvYqwgI12u8OrLNOqh+hsGDMnIL+R1tWIjWZKVClqFzE4HWhbKPLvwafoh/a6p8U5652xO9mHKkg==
X-Received: by 2002:a1c:39c4:: with SMTP id g187mr6253592wma.78.1575560661749; 
	Thu, 05 Dec 2019 07:44:21 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:54 +0100
Message-Id: <20191205154357.121346-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 21/24] xkeyboard-config: update to 2.28
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:21 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{xkeyboard-config_2.27.bb => xkeyboard-config_2.28.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.27.bb => xkeyboard-config_2.28.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
index 02156ad75b4..7a3d694bd62 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "316753e35d3906d042c74230612eab9f"
-SRC_URI[sha256sum] = "690daec8fea63526c07620c90e6f3f10aae34e94b6db6e30906173480721901f"
+SRC_URI[md5sum] = "5a968ab77846ff85a04242410b2a61de"
+SRC_URI[sha256sum] = "69adb25b0fc64e4075f8ec0eab8d869892419f474f91fb69db1713de2062bdce"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.17.1


