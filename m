Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQ8u-0000Rq-2b
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:25:44 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2512213faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iwHLwogCYOPYbh+hYBTLnRs9Yyr/yJSGVhESG+BAK/4=;
	b=GpFYB4FzZSU6Md5+7FWQXfNzfGuv7Oc2/DpfOuM29VL9yPeCygHZz0HEHgI/JIekGY
	GoMws6KBvCmRwxM7xSTuOlih2GGv8XAzHyXDysmYkki63qMq92JLH9pyv0pMze/Jw/EB
	EvIWAv5AjBV2K8zKm2yzcVAKp2Uwae9MAUw4k=
Received: by 10.152.105.236 with SMTP id gp12mr6591536lab.18.1320675572609;
	Mon, 07 Nov 2011 06:19:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr5sm8634619lab.5.2011.11.07.06.19.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:19:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:19:17 +0100
Message-Id: <ea69345b97a6115caa6b77782f2fd58dd9eb2507.1320675529.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
References: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320675529.git.Martin.Jansa@gmail.com>
References: <cover.1320675529.git.Martin.Jansa@gmail.com>
Subject: [oe-core 2/6] kbd: import from meta-oe
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
X-List-Received-Date: Mon, 07 Nov 2011 14:25:44 -0000

* replaces console-tools used in keymaps

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/kbd/kbd_1.15.2.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/kbd/kbd_1.15.2.bb

diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
new file mode 100644
index 0000000..36e68a0
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "This package contains keytable files and keyboard utilities"
+# everything minus console-fonts is GPLv2+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=587ce626d15bd61699a64a6b8a5afefb"
+
+inherit autotools gettext
+
+BBCLASSEXTEND = "native"
+
+SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
+SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
+SRC_URI[sha256sum] = "b3602d191eef7a6a8317fc3cd231efa40a89ac235dce57a77cac825a2a21eba6"
+
+PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
+
+FILES_${PN}-consolefonts = "${datadir}/consolefonts"
+FILES_${PN}-consoletrans = "${datadir}/consoletrans"
+FILES_${PN}-keymaps = "${datadir}/keymaps"
+FILES_${PN}-unimaps = "${datadir}/unimaps"
-- 
1.7.7.2



