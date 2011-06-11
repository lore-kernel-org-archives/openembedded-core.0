Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVJy6-0001k0-Gk
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 10:54:58 +0200
Received: by pwj9 with SMTP id 9so1628735pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Gp8q7iQQzOsgQvR8Ajtmcpzz68u4UTIqUjwDTx+yx/Y=;
	b=F88eheDO1oxnW3eSH2Iy8sDJ/BoWAOOpF/R2duD4XEZaDQEXUpHutVZikEvDakjYFp
	y80mTknStpq9v1tecKgdWe30p5GqiYdEL0xxnmTyltMmIGI6kPvIbc7dcHahIjG24HbK
	kFgYNRfY8wCzsM7vUUd2Pp6T6v7xR+YxdU+tM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=fexk3enoo8WEYjPOB5d/PzSJtuB7kPGALK7+ASM67dQsmuf9TxJKoXueZWPPf4WGBV
	2+2Is1AXnRJr1YnjyUOZtT5TBNfMJpxPpcFudaFMdfgyWRtAs6jn4nU1aq9JGUNWjQAM
	ZBLrDOsVR9kNRJe3R9vizGsSfh4MWiRndfYu8=
Received: by 10.68.20.162 with SMTP id o2mr1354093pbe.394.1307782295809;
	Sat, 11 Jun 2011 01:51:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm3006882pbk.4.2011.06.11.01.51.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 01:51:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 01:51:10 -0700
Message-Id: <1307782272-6002-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/3] util-macros_1.13.0.bb: Depend on virtual/gettext instead of gettext
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
X-List-Received-Date: Sat, 11 Jun 2011 08:54:58 -0000

So multiple provider problem can be reolved amicably

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-util/util-macros_1.13.0.bb                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
index a6f5402..4bac614 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
@@ -12,8 +12,8 @@ PR = "r0"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 DEPENDS = "libgpg-error"
-DEPENDS_virtclass-native = "gettext"
-DEPENDS_virtclass-nativesdk = "gettext"
+DEPENDS_virtclass-native = "virtual/gettext"
+DEPENDS_virtclass-nativesdk = "virtual/gettext"
 
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
1.7.4.1



