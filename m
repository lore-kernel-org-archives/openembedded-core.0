Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Pztat-0006cd-FC
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:29:07 +0100
Received: by gwb11 with SMTP id 11so721432gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=IgKrmO9nVq1iAuYY64chtXTP3CvDKcVeE8BSKEofjwo=;
	b=JBDpcXLDlbgXEQMZ7NpI/fAIdIWaYk4D9+7JOpYZvj2C6zxRxETR7JdRXhVKSiwSU9
	r9IFEC6f5XzxPDEbn9jQdX8iUd94PcQwOiPpa1F5nO+7dU02U9AUO211r3LjAqTdmcWu
	sFfZdq4YSlvDFZ7m6HaIDlmdnUi+0i3yDLN4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RwvnKQAcJBn6akTfiZRZ9AERUFa3QJ75bkkFcMEqIc8DvEN/q+GKfYXFjdWF06KQbi
	fOkC9dYfCo7TnKNx/O3oANVpSIRpZMrzF3kfhdjTeT8cJ4J1uOO6batGVLT7V6AptHDP
	HjBHZxYgFS7pQnVIG3isfX6wpE4jvnTwP+2kg=
Received: by 10.101.37.11 with SMTP id p11mr105577anj.146.1300292838342;
	Wed, 16 Mar 2011 09:27:18 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r8sm1433658ane.19.2011.03.16.09.27.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:27:17 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2011 11:27:05 -0500
Message-Id: <1300292827-21236-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300292827-21236-1-git-send-email-Chase.Maupin@ti.com>
References: <1300292827-21236-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/4][angstrom-layers] matrix-gui-e: Add support for dm368-evm machine
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
X-List-Received-Date: Wed, 16 Mar 2011 16:29:07 -0000

* Add support for the dm368-evm machine type.  This requires
  bumping the SRCREV used as well.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 BSP/TI/recipes-bsp/ti/matrix-gui-e.inc    |    5 +++--
 BSP/TI/recipes-bsp/ti/matrix-gui-e_1.3.bb |    3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/BSP/TI/recipes-bsp/ti/matrix-gui-e.inc b/BSP/TI/recipes-bsp/ti/matrix-gui-e.inc
index a04327b..9fdc6f6 100644
--- a/BSP/TI/recipes-bsp/ti/matrix-gui-e.inc
+++ b/BSP/TI/recipes-bsp/ti/matrix-gui-e.inc
@@ -6,11 +6,12 @@ LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=37;md5=a802a01a3a58f2ebb
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r21"
+INC_PR = "r22"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
-PLATFORM_dm365 = "dm365"
+PLATFORM_dm365-evm = "dm365"
+PLATFORM_dm368-evm = "dm368"
 PLATFORM_omapl138 = "omapl138"
 PLATFORM_omap3evm = "omap3530"
 PLATFORM_dm37x-evm = "dm3730"
diff --git a/BSP/TI/recipes-bsp/ti/matrix-gui-e_1.3.bb b/BSP/TI/recipes-bsp/ti/matrix-gui-e_1.3.bb
index dd1b16b..e7254c9 100644
--- a/BSP/TI/recipes-bsp/ti/matrix-gui-e_1.3.bb
+++ b/BSP/TI/recipes-bsp/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,4 @@
 require matrix-gui-e.inc
 
-SRCREV = "192"
+SRCREV = "222"
 PR = "${INC_PR}.0"
-
-- 
1.7.0.4



