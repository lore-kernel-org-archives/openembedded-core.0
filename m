Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCHy-0007uS-SG
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 18:50:18 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2005273faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=njHMv1qPwCVL8d8b3HoNfWnIb0V8AyD/YqRA5A2wc5k=;
	b=dlJve2wHzJBcDnIb1Gyu9WZMR+GxmIcwDiILQtJPPu3ddQfHLqa0DDJhMHOdW9/NBI
	gtbzInrb/p+EDYAPhhpkjMYHGv/bxXDRM8ua6kjSMooUE/aG7+0veBxCWSAbErVfXedh
	TKroj/WEYqJdN8zEi6uSh/1eP4Mrrp/vuDee4=
Received: by 10.223.61.131 with SMTP id t3mr6213092fah.26.1320860645477;
	Wed, 09 Nov 2011 09:44:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r7sm7442736faa.3.2011.11.09.09.44.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:44:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:43:25 +0100
Message-Id: <bed77a8e0a92cafcd83fd484b6f8b0fd2948f463.1320860288.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
References: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320860288.git.Martin.Jansa@gmail.com>
References: <cover.1320860288.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2][oe-core 04/10] keymaps: depend on kbd instead of console-tools
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
X-List-Received-Date: Wed, 09 Nov 2011 17:50:19 -0000

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
1.7.8.rc1



