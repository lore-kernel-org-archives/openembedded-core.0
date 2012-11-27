Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TdCTJ-00064N-NF
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 05:08:39 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so6081211lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 19:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BFf5irRROv+1DxUm8LnxLILD9Y/cxcHwDz5zIu86Y3k=;
	b=OIlLjvhrU+TQtQQ94sjK39hWHuDSIfbKZgli12JStsE+qoKqQew8MTzT85MCDUsOjL
	EQRcA2sP8WI+tAWJB/Xyl+T4iJLNV49Pva81XNgJ4tDdAjf3boobyY2HgTnVchRsD12l
	uMHI5e1qvM8xAPtWkZtF2NtNkccD/5O+qDnNL0u8NXJH65/YXVxnU2w+WPFXq1JVJBOR
	MsSfVoseZQWPBjnPbYyws4mimtzJlR6LLqOg+kd2DwcSynPduYM7l4C3yWAQdmoc3rGE
	Cx4d/d3oBnFNYqPLQY/JvWJXimPky53IPptur8we4pE3KzqZY2TpFY6koHAIYlsh7V9V
	/pHg==
Received: by 10.152.47.75 with SMTP id b11mr13011766lan.14.1353988461149;
	Mon, 26 Nov 2012 19:54:21 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id p9sm6443562lbc.3.2012.11.26.19.54.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 19:54:20 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TdCFV-0008JZ-Jl; Tue, 27 Nov 2012 05:54:17 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 05:54:16 +0200
Message-Id: <1353988456-31930-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] cairo: update to upstream version 1.12.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 04:08:39 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/cairo/{cairo_1.12.2.bb => cairo_1.12.8.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.12.2.bb => cairo_1.12.8.bb} (92%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.12.2.bb b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
similarity index 92%
rename from meta/recipes-graphics/cairo/cairo_1.12.2.bb
rename to meta/recipes-graphics/cairo/cairo_1.12.8.bb
index f4c2d58..058854c 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
@@ -2,12 +2,12 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "87649eb75789739d517c743e94879e51"
-SRC_URI[sha256sum] = "b786bc4a70542bcb09f2d9d13e5e6a0c86408cbf6d1edde5f0de807eecf93f96"
+SRC_URI[md5sum] = "8b3dcade859c44fb7e56fc68edfe9a45"
+SRC_URI[sha256sum] = "8fbb6fc66117ab4100bad830cb4479497e53c6f3facb98bf05c8d298554ebdd9"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-- 
1.7.10.4



