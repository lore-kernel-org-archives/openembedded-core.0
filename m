Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVcCN-0001kv-LC
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 06:22:55 +0200
Received: by pvc30 with SMTP id 30so1810995pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 21:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Gp8q7iQQzOsgQvR8Ajtmcpzz68u4UTIqUjwDTx+yx/Y=;
	b=XAs1QsoSZYLjO5Z1FBJ8B1/Gg3G2EjMR5HDUwEfarCYGW+dKJ1uPq89q1IpGZfgo5F
	zOf0xll+KbQSrS2YmYv4T2lvHLR8HJHaEtS7AkFICtT1YI8vcW8ci19Imnv11+qVFraK
	KdlMATzvb/lmdGpj3WmTYl4wX8RWuDGDHtSQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kkqTPTx9z5EFFBXrI6E0y7S/wiROd44lu6KytbO14FRH0iWudW78KUvnf4RhTmwBec
	pXUNJ8fbuRZeOSYsRMOBlxpYfxrkpf0XiUt3kqJemG5X9ANYMGUyZSJz3JbUKTu8+upS
	uyuvnN9UNi4VEST8fle6S05fhS9PsjSnP7E+c=
Received: by 10.68.33.70 with SMTP id p6mr1503255pbi.480.1307852370593;
	Sat, 11 Jun 2011 21:19:30 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm3579520pbb.18.2011.06.11.21.19.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 21:19:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 21:19:02 -0700
Message-Id: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1307852182.git.raj.khem@gmail.com>
References: <cover.1307852182.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] util-macros_1.13.0.bb: Depend on virtual/gettext instead of gettext
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
X-List-Received-Date: Sun, 12 Jun 2011 04:22:56 -0000

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



