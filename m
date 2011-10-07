Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDxV-0005jd-83
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:11:41 +0200
Received: by mail-yw0-f47.google.com with SMTP id 7so3895515ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wSfBXzeYOfGD6Bh5atihbZypzamxmZj6A6Wxh0tTBkM=;
	b=SdxZrVKU9ClRTgjjW53QI/wYcjVyILUGyE6GR0TKsR8fwUYmn1PfOBM25TJpQ5cM4z
	KThoL6iB/rhJtIUmvmm9TInM7h4oNszIPviuruW1IALe9uvNL4iXwTHVVBo9zjiCFiC+
	AIeDrBhuVQkLEfu5ZbHqV2Pu1sPTOxlFVw7X0=
Received: by 10.223.58.138 with SMTP id g10mr11833863fah.20.1318007165907;
	Fri, 07 Oct 2011 10:06:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w14sm13604149fae.13.2011.10.07.10.06.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:06:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:00 +0200
Message-Id: <da0561d0a9b61ddaba1b41ae37f9f65d11497a30.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 05/31] xserver-xorg-common: move SRC_URI closer together
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
X-List-Received-Date: Fri, 07 Oct 2011 17:11:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-common.inc           |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 3a69d7d..67edbcf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -14,6 +14,7 @@ PROVIDES += "virtual/xserver"
 
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI += "file://macro_tweak.patch"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
@@ -32,8 +33,6 @@ FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
 		    ${libdir}/xorg/modules/*/*/.debug \
 		    "
 
-SRC_URI += "file://macro_tweak.patch"
-
 EXTRA_OECONF = "--with-fop=no"
 
 PACKAGECONFIG ??= "udev"
-- 
1.7.7



