Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PztbI-0006cp-UH
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:29:33 +0100
Received: by gxk3 with SMTP id 3so6971gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=RgY+Ay9kbOswE5ZTAnTjFrbqoW/v9Yrhy326nJLLFKg=;
	b=ca/9j+coDvtVLHohNaKnG4OVUh2ygteZybykXd0oSlA0osTHYjvaw2O1LDesl2wyO1
	yJd+tnBq824JV4FaMgkXcJiyioBRDfdQgkFHC9Oylle1FbUZk42yLuIYR3wQZ3ZKUc5c
	O1p1xdB4curJBF6MCmy60TUAcf4PnmsBKrav0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UUoxDLGDdglXO9AR4r0EkcO7apZVw1m2ez2CrMAg260pwM23vW2H4AXzdK4uP6Angh
	UJQIGC3mQ5b9G1Te49aBji67JXEr/NIz16lQTniOgF6UhiqHAXwjJPuSc6GVXx5tXSNT
	XQp1C4WX7unFWgjG1JtbNE6abLGHBSb8pYyjE=
Received: by 10.91.197.7 with SMTP id z7mr249100agp.195.1300292840742;
	Wed, 16 Mar 2011 09:27:20 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r8sm1433658ane.19.2011.03.16.09.27.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:27:19 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2011 11:27:06 -0500
Message-Id: <1300292827-21236-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300292827-21236-1-git-send-email-Chase.Maupin@ti.com>
References: <1300292827-21236-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 3/4][angstrom-layers] matrix-gui: Add support for dm368-evm machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 16:29:33 -0000

* Add support for the dm368-evm machine type.  This requires
  bumping the SRCREV used as well.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 BSP/TI/recipes-bsp/ti/matrix-gui.inc    |    5 +++--
 BSP/TI/recipes-bsp/ti/matrix-gui_1.3.bb |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/BSP/TI/recipes-bsp/ti/matrix-gui.inc b/BSP/TI/recipes-bsp/ti/matrix-gui.inc
index 1b2968e..1e54401 100644
--- a/BSP/TI/recipes-bsp/ti/matrix-gui.inc
+++ b/BSP/TI/recipes-bsp/ti/matrix-gui.inc
@@ -6,11 +6,12 @@ LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=37;md5=a802a01a3a58f2ebb
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
-PLATFORM_dm365 = "dm365"
+PLATFORM_dm365-evm = "dm365"
+PLATFORM_dm368-evm = "dm368"
 PLATFORM_omapl138 = "omapl138"
 PLATFORM_omap3evm = "omap3530"
 PLATFORM_dm37x-evm = "dm3730"
diff --git a/BSP/TI/recipes-bsp/ti/matrix-gui_1.3.bb b/BSP/TI/recipes-bsp/ti/matrix-gui_1.3.bb
index 53db8af..cfdf47e 100644
--- a/BSP/TI/recipes-bsp/ti/matrix-gui_1.3.bb
+++ b/BSP/TI/recipes-bsp/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "192"
+SRCREV = "222"
 PR = "${INC_PR}.0"
-- 
1.7.0.4



