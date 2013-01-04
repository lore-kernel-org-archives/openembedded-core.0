Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tr1LY-0005m5-3J
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 08:05:47 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so9284788lab.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 22:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=wIKvwhSZ2jIhdeK6QAffsereFcd4s1bInb462RkFC+4=;
	b=ZK9ODE7j9hjHBGEpuHilUp214LlclAL20n3NbixSoDcoiZ0hOjIMLh/sHjMrSXBdlx
	bwH2MKWEOSGOlYBhh+EX+Uvffjyp5veAPwi1IlVT1ysqFrLyQ62IHkoU+IkFRZ+fheLv
	lKZ2sKEbLxXQj+9P0rFZA0kpnhDkcI2UgMkmyLtq2/sjmrm/h7ugPBMhMxI7V2nET2S8
	9uM2AVPH1iPJtCN4na0QjWT3+c4whfiEtQ8wmVHF5EukXLhQgh3kRflOvkuMAueXGVXr
	rbC69HGN5RpHorxPvrxoQJ8SP6LDxyNvaBkZu2WCuhe+0mLoFh5NsbAYnBiLsYsE0zAJ
	74Tg==
X-Received: by 10.112.103.202 with SMTP id fy10mr20646962lbb.13.1357282235244; 
	Thu, 03 Jan 2013 22:50:35 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id fe4sm17639650lbb.1.2013.01.03.22.50.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 22:50:34 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tr16u-0006i3-05; Fri, 04 Jan 2013 08:50:32 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 08:50:30 +0200
Message-Id: <1357282231-25713-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libxdamage: update to upstream version 1.1.4
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
X-List-Received-Date: Fri, 04 Jan 2013 07:06:09 -0000
X-List-Received-Date: Fri, 04 Jan 2013 07:06:09 -0000

Compatible with automake-1.13.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../xorg-lib/{libxdamage_1.1.3.bb => libxdamage_1.1.4.bb}        |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxdamage_1.1.3.bb => libxdamage_1.1.4.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
index dfc2425..deea451 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
@@ -20,10 +20,10 @@ DEPENDS += "virtual/libx11 damageproto libxfixes"
 PROVIDES = "xdamage"
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 XORG_PN = "libXdamage"
 
-SRC_URI[md5sum] = "44774e1a065158b52f1a0da5100cebec"
-SRC_URI[sha256sum] = "bc6169c826d3cb17435ca84e1b479d65e4b51df1e48bbc3ec39a9cabf842c7a8"
+SRC_URI[md5sum] = "0cf292de2a9fa2e9a939aefde68fd34f"
+SRC_URI[sha256sum] = "7c3fe7c657e83547f4822bfde30a90d84524efb56365448768409b77f05355ad"
-- 
1.7.10.4



