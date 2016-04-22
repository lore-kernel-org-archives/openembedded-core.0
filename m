Return-Path: <sujith.h@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4E0607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:41:39 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 145so2469161pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1IIUGLiNqUKN8CoqFDItIq103csXH8hrEiRUZD/piFs=;
	b=FyGmZg+mkkjOPkeIeA7F7TujHnMOrDi4/VsJGBIWVTZ4Mq9kguk+0nfMFnMCV15lpo
	rXe09PpFf5s1th/7dKsq5MYbr8ljrtmd+GZMj2AMC14E0fvdSISSvdL5xIXrkVlf4Myt
	ftawFqhgE+cWnkmbtNRdXgnlk60kCERZiTggmOfTaheD3w9HrhLUHw3PdntRXX+7PSf7
	MPgNmIxkFKl8ZWoXBuF018DxGXcdQcRdEu/XcRjx/Q3j9fU58LyTvXSrkQ+kyFI6vVZO
	jsLubjRMO1DyQ/0oU4DvJQYYOjGyrAx3dEDyMVG8ppMkgfQdXBtJdDI84cbpZiDJTyWp
	RItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1IIUGLiNqUKN8CoqFDItIq103csXH8hrEiRUZD/piFs=;
	b=Ph9ABtVedjcfDu/sCmcm4Ldwd0/ra89gl1RuOrHT2BlYuhsOmcdjzNv5q+vHHgai9v
	EOzDj2Rjto0sFUTUiLNU4Lw3bI0WLT01VX6eFJgsnIP+aRh9VhQklpEi01C9+WBTp3dO
	3zAItLML8Q0adNNFmpMg/LyEssfhgcKLIK0Whk5AEvstXY9z2N8o5nja2my55K6NBl9j
	ugMouP30by/YHoKrjN+PNvh35lE52Sc1WCBI29xthH1BmNZnEzU01bR3Fykp61+NVhFO
	m3O+NF2ee2EfuvfcqhHAGEp0bMPCKdqdxK6zjII02HsmN2rrfaKLPdy6YTrQVNc199+6
	4faA==
X-Gm-Message-State: AOPr4FU/eVxM369HmdC1H0q5vVssVfcI4P1NT4EJWyrgaTQJBvzBPUVQc9ZjA7uVB1/9Cg==
X-Received: by 10.98.19.151 with SMTP id 23mr18354365pft.62.1461328900526;
	Fri, 22 Apr 2016 05:41:40 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	136sm8318842pfz.44.2016.04.22.05.41.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 05:41:39 -0700 (PDT)
From: Sujith Haridasan <sujith.h@gmail.com>
X-Google-Original-From: Sujith Haridasan <Sujith_Haridasan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 18:11:28 +0530
Message-Id: <1461328888-5911-1-git-send-email-Sujith_Haridasan@mentor.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] webkitgtk: package debug files properly and move -g removal to staging
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
X-List-Received-Date: Fri, 22 Apr 2016 12:41:42 -0000

From: Fahad Usman <fahad_usman@mentor.com>

Package debug files properly to get rid of build time warnings.
Remove -g option from the DEBUG_FLAGS.

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
index 8eb6b9f..49fa0bb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
@@ -75,7 +75,13 @@ EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=OFF "
 
+# Link fails due to memory exhaustion, so disable debug info to reduce the
+# memory footprint
+DEBUG_FLAGS_remove = "-g"
+
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
+FILES_${PN}-dbg += "${libdir}/webkit2gtk-4.0/injected-bundle/.debug \
+                    ${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
 
 # http://errors.yoctoproject.org/Errors/Details/20370/
 ARM_INSTRUCTION_SET = "arm"
-- 
1.9.1


