Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrZx9-0004wX-W0
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 21:02:48 +0100
Received: by mail-la0-f41.google.com with SMTP id em20so11996992lab.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Jan 2013 11:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=b4mERjZhSwiVaPrUpEeNMhFtsSsbiBiqrss6ltQBPg0=;
	b=tPorzo1DJQPXMvwlwz6ljTXtPmEd1p1IZegclrVdFQuW+ZEBACo0w35/AQwMmDbfwI
	it+tfl+amu6jIz1cxiQiKl+bm/GUATTWrMBtX08Prc5MtDYPLHrk83TI4LunzyWMb8jL
	mfZdSNPy6ULsCdLfETFt1xSnxf2G6ifrITfhWL1Nz+rwL5GV9I3xHajdVHLB4R5jn1op
	m6AOz8MrUd/r1uveg+tgy+I6dC8n2bctjUXx4LxUtnzO0/XUDZiXVzgTDYk7+c0r70ut
	fYKLa4PONNhf3PxOldjghvF1QvenoYoxh2yNYML9ZBz5y6gsmAlEq8ShhHhEyfclUru+
	F1Mw==
X-Received: by 10.152.123.49 with SMTP id lx17mr1436237lab.52.1357415260742;
	Sat, 05 Jan 2013 11:47:40 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id sv4sm2171409lab.0.2013.01.05.11.47.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 Jan 2013 11:47:39 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrZiT-0005B3-IR; Sat, 05 Jan 2013 21:47:37 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Jan 2013 21:47:36 +0200
Message-Id: <1357415256-19871-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libxcomposite: update to upstream version 0.4.4
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
X-List-Received-Date: Sat, 05 Jan 2013 20:02:48 -0000

Compatible with automake-1.13.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../xorg-lib/{libxcomposite_0.4.3.bb => libxcomposite_0.4.4.bb}    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcomposite_0.4.3.bb => libxcomposite_0.4.4.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bb
rename to meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
index 7377711..8ee35b0 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
@@ -25,5 +25,5 @@ XORG_PN = "libXcomposite"
 
 SRC_URI += " file://change-include-order.patch"
 
-SRC_URI[md5sum] = "a60e0b5c276d0aa9e2d3b982c98f61c8"
-SRC_URI[sha256sum] = "32294d28f4ee46db310c344546d98484728b7d52158c6d7c25bba02563b41aad"
+SRC_URI[md5sum] = "f7a218dcbf6f0848599c6c36fc65c51a"
+SRC_URI[sha256sum] = "ede250cd207d8bee4a338265c3007d7a68d5aca791b6ac41af18e9a2aeb34178"
-- 
1.7.10.4



