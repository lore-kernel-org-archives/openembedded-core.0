Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu6q-0005YU-Bt
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:37:45 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tFym4rm67IZUAbeU2aCZzEaU+d5LT12EA4sBkoDLCYQ=;
	b=fsn6gJYXd152ykA+4LB+sfMjG2+Flz0SLGebzDGOWZlZfQW3zHAA4MOZDt270Q85TJ
	fPampkl3pwTZkOCnJXb1LU+VteybMsjVNjSfYGq7qeupFOsrKRBV8z0ZWsbsnvZD4Itc
	SjtkeWc3BSeTpWFFuSIPgo3LWs+cYKVyRTwh0=
Received: by 10.204.130.208 with SMTP id u16mr8918805bks.47.1321029088717;
	Fri, 11 Nov 2011 08:31:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h7sm1777106bkw.12.2011.11.11.08.31.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:31:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:53 +0100
Message-Id: <0df9fc7082d2465b0f74841250009f0ff99ee8e5.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 17/22] time: drop default S and 2 useless comments
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
X-List-Received-Date: Fri, 11 Nov 2011 16:42:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/time/time_1.7.bb |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/time/time_1.7.bb b/meta/recipes-extended/time/time_1.7.bb
index 9f9a9e5..35afb1e 100644
--- a/meta/recipes-extended/time/time_1.7.bb
+++ b/meta/recipes-extended/time/time_1.7.bb
@@ -5,8 +5,5 @@ SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
 
 SRC_URI[md5sum] = "e38d2b8b34b1ca259cf7b053caac32b3"
 SRC_URI[sha256sum] = "e37ea79a253bf85a85ada2f7c632c14e481a5fd262a362f6f4fd58e68601496d"
-#	   file://autofoo.patch
-#	   file://compile.patch
-S = "${WORKDIR}/time-${PV}"
 
 inherit autotools
-- 
1.7.8.rc1



