Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lq-0007cz-Ls
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:47 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1751842wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=5gVMBBaRFzdKfBB5b8x47ZfJYueWz2eUmdBL7owUEyA=;
	b=EQjrOlvQA05FgxNI8v5p5fpePQpIkRV+QnUghSvtPYyFJziNXB4AGHCk1REIZaqz1X
	QFuP9KCimO2LLhz4MwBdT+rrJYm067sq0Kws7x6mHecjaDRRYKgKOD6pTvSqDQfapzso
	Vr+9sarCaoJ0wGxm+w8rBwLVSSCgPdz7UF8Kbbd0SbZ0oYy9wbxMWQcllaeVe2Ii+L11
	W0MaATR3iQtPaJ2aqQCyY5LyLViroso+ZZnIF+SzVvzs50RyooArnLtZaGFi2uJy4rwR
	A6dhFM0vrJSXV7RtztAz9/Jl8b5j9KCksCyAOLU+TKgTVbTZUFxkIbBKzwZXtlePLcE3
	mFnw==
Received: by 10.180.109.129 with SMTP id hs1mr11547097wib.0.1344182105505;
	Sun, 05 Aug 2012 08:55:05 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:04 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:59 +0200
Message-Id: <1344182057-15981-13-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlbX5P3GZ7JiwHW2jlnB05m3yZ+Wato33+z3MPbnn/v+p6aMHkC5oB42jq/FA3FcvRnqIqz
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/30] mingetty: use ${base_sbindir} instead of /sbin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:47 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/mingetty/mingetty_1.08.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index fed5dfd..cbc13c9 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -14,7 +14,7 @@ EXTRA_OEMAKE = "CC='${CC}'"
 
 do_install(){
     mkdir -p ${D}${mandir}/man8
-    mkdir -p ${D}/sbin
+    mkdir -p ${D}${base_sbindir}
     oe_runmake install DESTDIR=${D}
 }
 
-- 
1.7.7.6



