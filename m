Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCHe-0007uS-2y
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 18:49:58 +0100
Received: by faat2 with SMTP id t2so2005273faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Of3cvvveThmXa5gFypbB/7a6OSzpToPb7Jilx3h1vig=;
	b=tXekB6xYhF/XL0nKMc35TmEas1mrHL2KHIE3cSidgoomghvj40v8OAoWa/tuHPI5Cv
	E7/Cy4D97jT1c/MhEk24MNt4adJUGtAMURg780WQf+VeEg7j9uqp9F+/IxkxVtTNiLvF
	IARftgeVUX33lQOHi2IzvUtDFySjdoaPMaUm4=
Received: by 10.223.76.197 with SMTP id d5mr6278412fak.13.1320860622476;
	Wed, 09 Nov 2011 09:43:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n25sm7417027fah.15.2011.11.09.09.43.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:43:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:43:22 +0100
Message-Id: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <cover.1320860288.git.Martin.Jansa@gmail.com>
References: <cover.1320860288.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2][oe-core 01/10] kbd: import from meta-oe
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
X-List-Received-Date: Wed, 09 Nov 2011 17:49:58 -0000

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
1.7.8.rc1



