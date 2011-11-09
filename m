Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCHk-0007uS-76
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 18:50:04 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2005273faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Y2NTp8o5ZwZWMavwD2jPi5RPABN4ZM44RXzcc+OEEyU=;
	b=jGj3lDVs5uUFq1fXiSw3yXxYiCZ1lZ2Ntx4Pxb2mmFgQH+ZLuCp22hzT16c2tFx+5v
	rF4/TNjVzCwb2fiU9qDbOfBbsXaotmf2yYGHdShl+Hgt8p0wqHxy5DdJJIJNMhBqfXMU
	1DvJJEIBk7t2x5dU457VvOEQIqYJC5KHg6ndQ=
Received: by 10.223.63.206 with SMTP id c14mr6294349fai.3.1320860630739;
	Wed, 09 Nov 2011 09:43:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i3sm7450028faf.0.2011.11.09.09.43.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:43:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:43:23 +0100
Message-Id: <d6a0d907c2c5d75a3bee104e7eaef9e215f5ccdc.1320860288.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
References: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320860288.git.Martin.Jansa@gmail.com>
References: <cover.1320860288.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2][oe-core 02/10] kbd: add RREPLACES/RCONFLICTS/RPROVIDES for upgradeable path from console-tools
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
X-List-Received-Date: Wed, 09 Nov 2011 17:50:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/kbd/kbd_1.15.2.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index 36e68a0..2e0406b 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -6,6 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587ce626d15bd61699a64a6b8a5afefb"
 inherit autotools gettext
 
 BBCLASSEXTEND = "native"
+RREPLACES_${PN} = "console-tools"
+RPROVIDES_${PN} = "console-tools"
+RCONFLICTS_${PN} = "console-tools"
+
+PR = "r1"
 
 SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
 SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
-- 
1.7.8.rc1



