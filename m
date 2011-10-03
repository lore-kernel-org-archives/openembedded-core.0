Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAiiN-0005Ww-U7
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:37:51 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fM/3JaOY5xaamBSnPr9LadqGH+NQXP/n1208GulxMnA=;
	b=CRyYXhZ1kssiKu1pGyyD1xJzF/2NDpCh6/r/eYLsGMnwNx6q8DHCv7WMqrjVk8VPVt
	xznZ14qTQq6+AyRdXQYDA9tSiAJ1tLEXNbLKC6i0xwMwF9TtfDeuywePy186OnlkrLW+
	uNJIZ8BFJuCiEkvEXuX/i4ScWuRvd1lCflvgA=
Received: by 10.204.148.28 with SMTP id n28mr10124155bkv.20.1317648735832;
	Mon, 03 Oct 2011 06:32:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm13238311bkt.5.2011.10.03.06.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:32:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:55 +0200
Message-Id: <177b076f8466a261edc3beceb62a2608d67438a8.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 24/30] libx11-diet: add SRC_URI checksums
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
X-List-Received-Date: Mon, 03 Oct 2011 13:44:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
index 44e8765..a2fca63 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
@@ -14,6 +14,9 @@ SRC_URI += "file://x11_disable_makekeys.patch \
             file://fix-utf8-wrong-define.patch \
             file://nodolt.patch"
 
+SRC_URI[md5sum] = "0545089013213e90aac19b8f8045d32e"
+SRC_URI[sha256sum] = "34656d022ff2f94430b534612821428fe15ade028d86a42907958167f2e497ac"
+
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
-- 
1.7.7



