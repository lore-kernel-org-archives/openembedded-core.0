Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0D9601A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 00:36:00 +0000 (UTC)
Received: by iecvy18 with SMTP id vy18so1590081iec.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Feb 2015 16:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fkKqQufxsvERbmGSYUHDmhb/NNOFitDmGAxH7V4/Xfo=;
	b=nzoUvqgCbVYMlzQ0MVtrRCv9tOPPMyRUss9Inl/T54za9bAQazL/MqM86ng8qTJULY
	IHMqQf5QfeiHZcVMjLWfmYWQKyJBFuYcFWE/a+CsHXeL+VjWsYyTTKba7/l6VCVa6fFx
	3Byf/9fMun+QA9ces8wsXoLH8U5/ySlbVYtGK02OmekffxTG0lRgqi69XKVL2D+QDfXB
	/A2NjMzMiK5xy2eLfG29oTAzbpCGtXC4dO8jTjsjgFcBiTUajb2NAfdoIW/l3XuXYI+T
	9MmQgxyLpbM20Id0VRYXkBRZSiP4iEu6pr3jk78F3aOdu46NjfxQyqplaU3cijDIt0ZZ
	LYXw==
X-Received: by 10.50.136.228 with SMTP id qd4mr20604083igb.13.1423528561419;
	Mon, 09 Feb 2015 16:36:01 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id h191sm7505340ioh.0.2015.02.09.16.36.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Feb 2015 16:36:00 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Feb 2015 16:34:27 -0800
Message-Id: <1423528467-19457-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] mesa: update --with-llvm-shared-libs configure option
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
X-List-Received-Date: Tue, 10 Feb 2015 00:36:04 -0000

As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
has been renamed to "--enable-llvm-shared-libs".

  http://www.mesa3d.org/relnotes/10.2.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c9748e2..97ed02f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -60,7 +60,7 @@ GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-l
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?= "3.3"
-PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
+PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --enable-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
-- 
1.9.1


