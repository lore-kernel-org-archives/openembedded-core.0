Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQ91-0000Rq-Gl
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:25:51 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2512213faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wq497crRnqJMH/c3NdCvwlL+omdDYZaPM2a8N2KDHlE=;
	b=V0FQwYmbuEj4zfq8MavNpEGX497HLF4pPXaOdfCdyQpc7Efea0W04kLxp6XperDFhz
	0E3Xxasqm/oMCnnZRMxupaat/AIIGmmiLaVu6LpbON53zAB0tgy9PygUdBPUe9PkzBOf
	IYZxTC5MoTJRoXsvgP4aPjEg6Knv8rlTO07Ww=
Received: by 10.152.135.179 with SMTP id pt19mr2633782lab.47.1320675580620;
	Mon, 07 Nov 2011 06:19:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id lr11sm8633250lab.6.2011.11.07.06.19.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:19:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:19:18 +0100
Message-Id: <eda8de879459cd5300719aeabc34e6f79ce29010.1320675529.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
References: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320675529.git.Martin.Jansa@gmail.com>
References: <cover.1320675529.git.Martin.Jansa@gmail.com>
Subject: [oe-core 3/6] kbd: add RREPLACES/RCONFLICTS/RPROVIDES for upgradeable path from console-tools
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
X-List-Received-Date: Mon, 07 Nov 2011 14:25:51 -0000

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
1.7.7.2



