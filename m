Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQ9R-0000aU-8J
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:26:17 +0100
Received: by faat2 with SMTP id t2so2512884faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fvmhCcdQtBUHio/WG5KU1Vo44wKoeroDSKT18odRlzg=;
	b=FdX6a8EHAQvLN6qt/j7OlAnVaQ0ajrFnT/BuYSNre4WDNc99Q/RSpkTNipoTi18+OP
	95E9rycpNOWqsKYogOSImQwUH4BbmLQeWonNLOcYwbvidhSzSBviyeWb3oiqt6bxBaQT
	mmP+CUwn1Puf3R3TFcsVwSHlFaCZsUTRLc3kg=
Received: by 10.152.106.115 with SMTP id gt19mr6597268lab.27.1320675596168;
	Mon, 07 Nov 2011 06:19:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id tu2sm8616590lab.11.2011.11.07.06.19.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:19:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:19:20 +0100
Message-Id: <1e29953a5deb19a55f1928f0ed47be46e250a99b.1320675529.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
References: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320675529.git.Martin.Jansa@gmail.com>
References: <cover.1320675529.git.Martin.Jansa@gmail.com>
Subject: [oe-core 5/6] keymaps: depend on kbd instead of console-tools
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
X-List-Received-Date: Mon, 07 Nov 2011 14:26:17 -0000

* nowadays kbd seems more active

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 4fe7987..1876db8 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -5,11 +5,12 @@ SECTION = "base"
 # Distro can override initscripts provider
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_initscripts} console-tools"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_initscripts} kbd"
+
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PR = "r19"
+PR = "r20"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.7.2



