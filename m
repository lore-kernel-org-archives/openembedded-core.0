Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TcCMF-0000VK-6i
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Nov 2012 10:49:07 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so4493949lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2012 01:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Hn3ONNpoB9dMXdhL9qjc3fYMjkiuL451dp9lRtrctOQ=;
	b=rR0nSO9YWyZYhw4Bl9qz7Bul0nIaEpXYavZD/EN32k+rKWQ+E8/vshRQU8XlHV0uMt
	ozZbSIV37s68u24wmwhZ23tfg2l9F4pOA/0QDpfpWLcwm+9fERtcOpcCteSEkKjJS97X
	BeRJOjKixVPA/fqMPEX0575UudDmzEEyQrYNsYOyaDIumlNPlLDvTpZaj82edc/PkQFN
	WFhlOEehXgKUw+lh70SAejL8EHFf3rBwtozsnGzDvYRv4ahcfGRv522npt7Iw4ZXYoaV
	GxG1uisc2P+BN6BQqLkS7SqvjuiFZFYF+5BAQRtqKo/QwFeaf3tbqas7db+sBiZHwaIn
	ORjw==
Received: by 10.112.25.6 with SMTP id y6mr2774914lbf.17.1353749698136;
	Sat, 24 Nov 2012 01:34:58 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id e4sm3384183lby.12.2012.11.24.01.34.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Nov 2012 01:34:57 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TcC8U-0003HZ-SC; Sat, 24 Nov 2012 11:34:54 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Nov 2012 11:34:45 +0200
Message-Id: <1353749685-12585-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] automake: update to upstream version 1.12.5
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
X-List-Received-Date: Sat, 24 Nov 2012 09:49:07 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../automake/{automake_1.12.3.bb => automake_1.12.5.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.12.3.bb => automake_1.12.5.bb} (90%)

diff --git a/meta/recipes-devtools/automake/automake_1.12.3.bb b/meta/recipes-devtools/automake/automake_1.12.5.bb
similarity index 90%
rename from meta/recipes-devtools/automake/automake_1.12.3.bb
rename to meta/recipes-devtools/automake/automake_1.12.5.bb
index aaa5ee5..ee85617 100644
--- a/meta/recipes-devtools/automake/automake_1.12.3.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.5.bb
@@ -25,10 +25,10 @@ SRC_URI += "${PATHFIXPATCH} \
 	    file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch"
 
-SRC_URI[md5sum] = "d2af8484de94cdee16d89c50aaa1c729"
-SRC_URI[sha256sum] = "095ffaa3ac887d1eb3511bf13d7f1fc9ec0503c6a06aeae05c93730cdda9a5a0"
+SRC_URI[md5sum] = "674f6d28f8723e0f478cb03de30f36f1"
+SRC_URI[sha256sum] = "82089e23b384d3e64efa4f09f133a02dadb91c0593d4f1d4e12c29d806be9925"
 
-PR = "r2"
+PR = "r1"
 
 do_install () {
     oe_runmake 'DESTDIR=${D}' install
-- 
1.7.10.4



