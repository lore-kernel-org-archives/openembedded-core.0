Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 324CA73E36
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 17:47:28 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so96706684wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 May 2015 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ioE4M9BqX0pVPk7Dy//UEMfRe3P7sOJwYAI/UKfRLkI=;
	b=gQP0ElIqo01eIXMUC0kJUBSfkv3BLkjef4rW9GPajaem7P6jGqzqKg2z+cDLwIyhGB
	Z5fDu8cVbixaL6rqci2HqUmdbxHLTDFGpp1j3LgKz9ywqdufRP/VAvBLHSq7CcF2J8UZ
	0+E6HEpDdwmptCdn899+o8jL/fhwdkn9DLiOGenK0s0/Rfs3jjmtvJrCu0iIzJl0CSoP
	qvCXapxxyL5guT0mJ0/yBoq552n3NLUd2sgj16s7uOo4CX3I12KtjzMFqC1No3EyqKzA
	G64FjxtxDRkXaJl++7s7lDy8K0ItTEZPq1ckRlaO9GtLcZ0dpbX9B3jhBg9R47QwfQsy
	IBGA==
X-Received: by 10.194.79.199 with SMTP id l7mr19550979wjx.158.1430502449209;
	Fri, 01 May 2015 10:47:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id nb9sm7592974wic.10.2015.05.01.10.47.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 May 2015 10:47:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 May 2015 19:47:42 +0200
Message-Id: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [dizzy][PATCH] mesa: update --with-llvm-shared-libs configure option
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
X-List-Received-Date: Fri, 01 May 2015 17:47:36 -0000

From: Andre McCurdy <armccurdy@gmail.com>

As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
has been renamed to "--enable-llvm-shared-libs".

  http://www.mesa3d.org/relnotes/10.2.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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
2.3.5


