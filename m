Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAihM-0005A2-VW
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:36:49 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=G9k1551ijXN7zuXSH0sB88z3SrcG+DLpHpJiYwETeyw=;
	b=DuuXoPt/JVp8cEi1ENCj3PF2eXmg1SNquI7gY33yfDOds+oAkPEAa0h7zwwbbUDXWQ
	BohU3/hPeyVLmq/OyO6wDJ7PCHb2deZNmjK32H1dauK46vbOea/Ri+kwFkPRRPqng7A5
	5K0oXXmGV88uHiVQnBJGVPxGpiZZlFm9lS7q8=
Received: by 10.204.149.137 with SMTP id t9mr943599bkv.177.1317648678953;
	Mon, 03 Oct 2011 06:31:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm13245991bka.0.2011.10.03.06.31.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:31:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:48 +0200
Message-Id: <983af06e1db3d2ff280dee45c567e8db19363c8e.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 17/30] xorg-driver-common: bump INC_PR to rebuild drivers agains new xserver-xorg ABI
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
X-List-Received-Date: Mon, 03 Oct 2011 13:37:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xorg-driver-common.inc             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 801d8d3..edcbbbc 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -5,7 +5,7 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
 PE = "1"
-INC_PR = "r15"
+INC_PR = "r17"
 
 DEPENDS = "virtual/xserver-xf86 xproto randrproto util-macros"
 
-- 
1.7.7



