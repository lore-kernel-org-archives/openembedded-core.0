Received: from mail.rogue-research.com (mail.rogue-research.com [207.115.102.146])
 by mx.groups.io with SMTP id smtpd.web08.8830.1624027605954165556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 07:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: rogue-research.com, ip: 207.115.102.146, mailfrom: simon@rogue-research.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 7F7A19BD22A7;
	Fri, 18 Jun 2021 10:46:44 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFFvx3135Ibt; Fri, 18 Jun 2021 10:46:43 -0400 (EDT)
Received: from mail.rogue-research.com (carbon.rogue-research.com [10.29.19.147])
	by mail.rogue-research.com (Postfix) with ESMTPS id 691359BD2298;
	Fri, 18 Jun 2021 10:46:43 -0400 (EDT)
From: "simon" <simon@rogue-research.com>
To: openembedded-core@lists.openembedded.org
Cc: Simon Boucher <simon@rogue-research.com>
Subject: [PATCH] mesa: Add option for gallium driver iris
Date: Fri, 18 Jun 2021 10:46:40 -0400
Message-Id: <20210618144640.10281-1-simon@rogue-research.com>
X-Mailer: git-send-email 2.17.1

The gallium driver iris is required for intel nuc gen 8+ as it's now the default driver

Signed-off-by: Simon Boucher <simon@rogue-research.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5700cc9673..f2d73bb839 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -148,6 +148,7 @@ PACKAGECONFIG[virgl] = ""
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'iris', ',iris', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm${MESA_LLVM_RELEASE} llvm-native \
-- 
2.17.1

