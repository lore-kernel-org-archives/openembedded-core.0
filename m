Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PztgG-0006j9-F9
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:34:40 +0100
Received: by yxn22 with SMTP id 22so725205yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=mc9qOBywMGIO0vqztQ8Nt7c4ood2lfcindHSr9Hd5HU=;
	b=FIvwMZ1tE/vpektZ/ihuHXzxHS8NYOkofHYklqSgMq3pNYQkfNYA0vukA/4de2edKn
	1P82QU9faaNnfjPaYICz86PR58zt/d8lTQH1DOgPFfx62JBjctxmMebIf+dh7DdooCND
	QrB6j0BcB7TyCHHrF2JYx5qMEAHsDNMuUVZ88=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=c2DpRSN86Fe7atTbbBw67wxiYEXGAqBbIjSDQFzANnQvFmwTkcyxS53SEJWrhJDjRX
	KHjHd6WpkNK6V3PMSVbcpvMliZoMUSCXucHKzt3Ed1lBJHhOu/+hHWMzCVKp5KjIhQWO
	bGhm8JAln9v2PBTSkoXm5akKA4AWU3e7XmjYw=
Received: by 10.100.110.9 with SMTP id i9mr105039anc.152.1300292842953;
	Wed, 16 Mar 2011 09:27:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r8sm1433658ane.19.2011.03.16.09.27.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:27:22 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2011 11:27:07 -0500
Message-Id: <1300292827-21236-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300292827-21236-1-git-send-email-Chase.Maupin@ti.com>
References: <1300292827-21236-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 4/4][angstrom-layers] matrix-tui: add version 1.1 of matrix-tui
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
X-List-Received-Date: Wed, 16 Mar 2011 16:34:40 -0000

* Add version 1.1 of the matrix-tui package.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 BSP/TI/recipes-bsp/ti/matrix-tui_1.1.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 BSP/TI/recipes-bsp/ti/matrix-tui_1.1.bb

diff --git a/BSP/TI/recipes-bsp/ti/matrix-tui_1.1.bb b/BSP/TI/recipes-bsp/ti/matrix-tui_1.1.bb
new file mode 100644
index 0000000..9814d5f
--- /dev/null
+++ b/BSP/TI/recipes-bsp/ti/matrix-tui_1.1.bb
@@ -0,0 +1,4 @@
+require matrix-tui.inc
+
+SRCREV = "37"
+PR = "${INC_PR}.4"
-- 
1.7.0.4



