Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFCE76128
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:52 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so77377712pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=e4cc9JqtYPrlOq+jZTWT9zuEV7BJCbm7TG1Hu0tK/qA=;
	b=CU2hm6N4JskN+HafXq+lYUCHH6oP8Z9cs/NYC6xWQTKwZ7145pj5VmnFCp/byy8wbD
	rh5zbrX4+FzqF7VN9EeB2w/UeHX869hOJ5X2rhTN2z4lqiV4fZNHubLzhyvlL51O3Vuo
	vJEd7ZTJ2Jz/qwfpcDgsP7e2rLRDBO8MjyTGeYDOHtYW0LhjFEvHHgwsRlUQw8Ki5PIk
	nBx3KtKFFhXGxs/ZGY6uG/y20hWgU+A00H0VpkoAImhWZNFCTtVsLRz/vwoZCtcV5kLu
	qQDtLDIurgGHXCF1RM/lstXoxetwxcjqJGnkhMpQRBP/p4BxezrIwu35ovIV3XsthT4G
	kg5A==
X-Received: by 10.68.130.98 with SMTP id od2mr40104284pbb.73.1437232612955;
	Sat, 18 Jul 2015 08:16:52 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ql9sm14589478pbc.65.2015.07.18.08.16.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:50 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id EF34CFC12F8; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:23 -0700
Message-Id: <f51348093aefab500c95466e660cedaef1d8366f.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 16/25] mesa: update --with-llvm-shared-libs configure option
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:52 -0000

From: Andre McCurdy <armccurdy@gmail.com>

As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
has been renamed to "--enable-llvm-shared-libs".

  http://www.mesa3d.org/relnotes/10.2.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1857f3c..658bd3a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -62,7 +62,7 @@ PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --witho
 PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
 PACKAGECONFIG[gallium-gbm]  = "--enable-gallium-gbm, --disable-gallium-gbm"
 MESA_LLVM_RELEASE ?= "3.3"
-PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
+PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --enable-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 
-- 
1.9.1


