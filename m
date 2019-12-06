Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3608A7FA47
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:09:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c20so6781811wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 10:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GXvvwuMTtn7BSCspEqUFRpU8HfCVt1xbiWsfz+wYI5U=;
	b=nNB67w4QYODUfxj0ederJ7d1cO7Hsl/WZE9EW3NBoi6KzOwgHJgtq7LLGTawTIyMsV
	plcowR9nXhKTBsgi/x+UApOOJO0x3VqoD6M6/sD8eC8wKRDEPVJ05GQyEC+oKCHzKxe7
	AU4mg74QjV0MSqvNvZgcsG7se4SsiexwQvariFlfYCWsGsfoJTyN2Pq1lGHtEdOayXYM
	SSmTa9vWqfGI3GGzqnZOh2dZIofnyCwr2HjOZ9ndNy6BgyCKLE+ZRYZWn5aMGGdB+jyA
	VQ9oLMRLveakrmwPJsgqvqCQZ5YjN640Bv3Rp5tu8a8jwTRHxVJ4QjPTeBUPq+NU5WZ7
	gLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GXvvwuMTtn7BSCspEqUFRpU8HfCVt1xbiWsfz+wYI5U=;
	b=fOeGBqM7b4qsCHQyCJ4n8NOw2V0e5f+HbVbRi7klARvQIvlwAaznebogCkwFIU4uFf
	VEOi1nc+GkppScj7u0sPmF9uth6kGYokJ30HqlRfIQLgFikPfY/tK2WtDAKAM509E1LT
	3wWJsI4A0xZ7i0hUpFj3F72/JhnzExB4Vm1J4UIjL1WsQl/VIcoetYVEsMsgWI5XVfF4
	jlVi+RF03RjFTqDRz4U1MwJ2BhcBfFfYWeOGvyxvcanoyaqlnO0dpf9MLcWfriWbesM2
	EIfAjzT8KZ3G+lrPxB59Npu6ilI3La25dat4KS4ULAgnvmATLp+wIzs3uU1ZcrecfBse
	uPOg==
X-Gm-Message-State: APjAAAUSXKMJI8L20cvvDEPyYpM/On77TxCdke27aSsB+iHDEhLwYm6X
	OGj8vqZ3Ok8HjlLrI+FOUy9TWI/E
X-Google-Smtp-Source: APXvYqzth1qNUva9TmP5enepbuwqt7VInKPAblZThzep/ZAefkauNKLRUO14jdrR20h7YFOxQq6fwA==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr11680381wmj.105.1575655797762; 
	Fri, 06 Dec 2019 10:09:57 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	v14sm17011347wrm.28.2019.12.06.10.09.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 10:09:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:09:41 +0100
Message-Id: <20191206180949.59953-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206180949.59953-1-alex.kanavin@gmail.com>
References: <20191206180949.59953-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/10] vulkan: update to 1.1.126
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
X-List-Received-Date: Fri, 06 Dec 2019 18:09:57 -0000

Disable assembly for vulkan-loader, as it tries to execute
a target binary (previously it would fail to detect a working
assembler and do the same fallback quietly).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...vulkan-headers_1.1.108.bb => vulkan-headers_1.1.126.0.bb} | 4 ++--
 .../{vulkan-loader_1.1.108.bb => vulkan-loader_1.1.126.0.bb} | 5 +++--
 .../{vulkan-tools_1.1.108.bb => vulkan-tools_1.1.126.0.bb}   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.1.108.bb => vulkan-headers_1.1.126.0.bb} (87%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.1.108.bb => vulkan-loader_1.1.126.0.bb} (92%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.1.108.bb => vulkan-tools_1.1.126.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.1.108.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
similarity index 87%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.1.108.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
index 284c19d7979..72c29a72a2c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.1.108.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-${PV}"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.1.126"
 
-SRCREV = "097a1045098213919fd56442f52c716fc78eeb27"
+SRCREV = "5bc459e2921304c32568b73edaac8d6df5f98b84"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb
similarity index 92%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb
index a539c5a3ce8..504cf85a2b7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-${PV}"
-SRCREV = "ecb0b1e69fb2f4d3cae262e6da24c170ce62ae13"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.1.126"
+SRCREV = "4adad4ff705fa76f9edb2d37cb57e593decb60ed"
 
 S = "${WORKDIR}/git"
 
@@ -24,6 +24,7 @@ DEPENDS += "vulkan-headers"
 EXTRA_OECMAKE = "\
                  -DBUILD_TESTS=OFF \
                  -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
+                 -DASSEMBLER_WORKS=FALSE \
                  "
 
 # must choose x11 or wayland or both
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
index 4ac1bafd173..2fd61c989ab 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
@@ -5,8 +5,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-${PV}"
-SRCREV = "3ccd7f6ebae3e1919adf837718c04feb6c2acc61"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.1.126"
+SRCREV = "09695dfc5dbe54f869aeaff8db93bb7bb6a220e0"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


