Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAig3-0005A2-6x
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:27 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ICgjZhdwBX19xj5CXJah61jFYBx5w+wucPXoX8Ty9eU=;
	b=TYxs/fAq9hevvYYLivaZXSgqLOKtSzyZFg0ZjtlJ0Zz8X4CH6Prsel5THvLtBjsnpJ
	e16rJZNq/pCkW2KuTJhD06LaU18KO/EvHLLlBF2nu095Y72akQth2R/T/ZPXpJBESHgf
	bV28oZoTte3YRXnv2BPKM2/RMBcea2AHoyw2o=
Received: by 10.204.6.22 with SMTP id 22mr9238321bkx.319.1317648597179;
	Mon, 03 Oct 2011 06:29:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm13242022bka.0.2011.10.03.06.29.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:38 +0200
Message-Id: <18c32f4bf0645980c7b65f94fcc21b50931698f0.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 07/30] rgb: import from meta-oe layer
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
X-List-Received-Date: Mon, 03 Oct 2011 13:35:27 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-app/rgb_1.0.4.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-app/rgb_1.0.4.bb

diff --git a/meta/recipes-graphics/xorg-app/rgb_1.0.4.bb b/meta/recipes-graphics/xorg-app/rgb_1.0.4.bb
new file mode 100644
index 0000000..59dca2a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/rgb_1.0.4.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DEPENDS += " xproto util-macros"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "35c6cccbf25a872bdd62bfcb1a73d951"
+SRC_URI[sha256sum] = "80887da011ad086fff88bfd16c6d9d5ac7da45ef1bc9d0c192a6f370423370f1"
+
+FILES_${PN} += "${datadir}/X11"
-- 
1.7.7



