Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tdg7s-00069Z-6c
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 12:48:24 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so9799563lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 03:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=jSuK690+Rkgy14WUcRshbOnz2vPmBiCONwNrXF2zj9Y=;
	b=Pib4RGgqoguCUz0zWZ6pnhZfY+/gNa6Y1/cC8AVrHiZRAcmlZc+KWvQ6rLwqlALDoQ
	IiLHZT0WkFSxPoragzFuoVYeuZTHDevU4pi+1hhEMkLF9xA5rSupMsOX4yjAe8G0wN+x
	0D5xpmpHTD4JoY+RasPKPhkHPxh01ZiZ64WCwnq5wemR1tbPyhhDwdu9qZVqaab29YVh
	BhjEYYNc+5A6cCyxbeCo9Vzi97dw3uindMIBjzdrf2TQluKEr91w+5P26Hx2gqqTKOcJ
	ziWrFJ9XJrxyPdJXOqvu1Nf+UuinVn9fQkeK9/qtoTe5WyUxp38FELBwQdk040heZVcS
	62bQ==
Received: by 10.152.104.50 with SMTP id gb18mr18180354lab.9.1354102449618;
	Wed, 28 Nov 2012 03:34:09 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id hu6sm7928586lab.13.2012.11.28.03.34.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 03:34:08 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tdfu2-0007ky-J5; Wed, 28 Nov 2012 13:34:06 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 13:34:05 +0200
Message-Id: <1354102445-29004-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] pango: update to upstream version 1.30.1
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
X-List-Received-Date: Wed, 28 Nov 2012 11:48:24 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../{pango-1.30.0 => pango-1.30.1}/multilib-fix-clean.patch      |    0
 .../pango/{pango-1.30.0 => pango-1.30.1}/no-tests.patch          |    0
 meta/recipes-graphics/pango/{pango_1.30.0.bb => pango_1.30.1.bb} |    6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/pango/{pango-1.30.0 => pango-1.30.1}/multilib-fix-clean.patch (100%)
 rename meta/recipes-graphics/pango/{pango-1.30.0 => pango-1.30.1}/no-tests.patch (100%)
 rename meta/recipes-graphics/pango/{pango_1.30.0.bb => pango_1.30.1.bb} (57%)

diff --git a/meta/recipes-graphics/pango/pango-1.30.0/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
similarity index 100%
rename from meta/recipes-graphics/pango/pango-1.30.0/multilib-fix-clean.patch
rename to meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
diff --git a/meta/recipes-graphics/pango/pango-1.30.0/no-tests.patch b/meta/recipes-graphics/pango/pango-1.30.1/no-tests.patch
similarity index 100%
rename from meta/recipes-graphics/pango/pango-1.30.0/no-tests.patch
rename to meta/recipes-graphics/pango/pango-1.30.1/no-tests.patch
diff --git a/meta/recipes-graphics/pango/pango_1.30.0.bb b/meta/recipes-graphics/pango/pango_1.30.1.bb
similarity index 57%
rename from meta/recipes-graphics/pango/pango_1.30.0.bb
rename to meta/recipes-graphics/pango/pango_1.30.1.bb
index de562b1..7254321 100644
--- a/meta/recipes-graphics/pango/pango_1.30.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.30.1.bb
@@ -2,14 +2,14 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r1"
+PR = "r0"
 
 GNOME_COMPRESS_TYPE="xz"
 
 SRC_URI += "file://no-tests.patch \
             file://multilib-fix-clean.patch"
 
-SRC_URI[archive.md5sum] = "2a70627ffd9f43c52c04cc0b05fe359f"
-SRC_URI[archive.sha256sum] = "7c6d2ab024affaed0e942f9279b818235f9c6a36d9fc50688f48d387f4102dff"
+SRC_URI[archive.md5sum] = "ec3c1f236ee9bd4a982a5f46fcaff7b9"
+SRC_URI[archive.sha256sum] = "3a8c061e143c272ddcd5467b3567e970cfbb64d1d1600a8f8e62435556220cbe"
 
 #PARALLEL_MAKE = ""
-- 
1.7.10.4



