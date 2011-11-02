Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLW0y-0002Kc-DD
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 09:17:40 +0100
Received: by faas16 with SMTP id s16so155807faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uQAbf1u4rBdI4eZ3qrNMcPa+6d1GskwELJhuHaEyt3Y=;
	b=lFezxdld3njMHxBLaQ3dTaifBJRHsokUn3cW8/mHAi834J70FPhpgY5BKo4Iaigh/N
	gQX36UF4wZ2UStnaJIPpFtYpBAO0ySMkoqne4EXAEiI5CKOwN/UBKcDckZ7BNV+KzYgO
	XbY/zW83MgUgXaH8N8f4WaBkbBU8vLDdeV38o=
Received: by 10.223.92.135 with SMTP id r7mr6978986fam.35.1320221490750;
	Wed, 02 Nov 2011 01:11:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i3sm4043248faf.0.2011.11.02.01.11.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 01:11:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 09:11:18 +0100
Message-Id: <1320221478-9707-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
Subject: [PATCH] lame: add SRC_URI checksums
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
X-List-Received-Date: Wed, 02 Nov 2011 08:17:40 -0000

---
 meta/recipes-multimedia/lame/lame_3.98.4.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/lame/lame_3.98.4.bb b/meta/recipes-multimedia/lame/lame_3.98.4.bb
index 6e098c6..680ea48 100644
--- a/meta/recipes-multimedia/lame/lame_3.98.4.bb
+++ b/meta/recipes-multimedia/lame/lame_3.98.4.bb
@@ -10,6 +10,9 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch"
 
+SRC_URI[md5sum] = "8e9866ad6b570c6c95c8cba48060473f"
+SRC_URI[sha256sum] = "ac3144c76617223a9be4aaa3e28a66b51bcab28141050c3af04cb06836f772c8"
+
 inherit autotools
 
 PACKAGES += "libmp3lame libmp3lame-dev"
-- 
1.7.7.1



