Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TkVJK-0001qF-O9
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 08:40:28 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so2355332bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2012 23:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Rj0dAMMz3hvnN8LFpcteaKvxKSklrknkoyG6r0Do1mI=;
	b=KezPBfY7q34xMuObLoNBdwePNX1Tr9mdxu8UuemYv9Y0JqcAGYv42tGEdOI3qInwQx
	/LXpX0iHsOdwnTV4sl9Do0blbv6ZxNHk5QqwyC9dL6Mk3pHl4o4dzBVSOse9KrUa4Ecj
	1ETTWFXIM5DY/AknF14CfDdxMCztKkhiOzhUnN8lG2elqhOiAVbX+TIOGlxFXgS2Vk04
	Vk46QKSxH45OUsszp/L5cw/th2pjCSrp7u7HSYqIz/YUa2lc7NS5q5T+9PZGteKev6Zl
	kVCBlVIEUi2qpggXNj0IcM21CrxbpEnVTKwLFnNnHz5FuN+rUJAMw3vldZuDn24tmGvQ
	VEfw==
Received: by 10.204.8.18 with SMTP id f18mr5666407bkf.82.1355729146921;
	Sun, 16 Dec 2012 23:25:46 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id v8sm8370047bku.6.2012.12.16.23.25.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 23:25:46 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TkV55-00046D-Qg; Mon, 17 Dec 2012 09:25:43 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 09:25:41 +0200
Message-Id: <1355729141-15722-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355729141-15722-1-git-send-email-cazfi74@gmail.com>
References: <1355729141-15722-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 2/2] patch: update to upstream version 2.7.1
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
X-List-Received-Date: Mon, 17 Dec 2012 07:40:28 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-devtools/patch/patch_2.6.1.bb |   11 -----------
 meta/recipes-devtools/patch/patch_2.7.1.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/patch/patch_2.6.1.bb
 create mode 100644 meta/recipes-devtools/patch/patch_2.7.1.bb

diff --git a/meta/recipes-devtools/patch/patch_2.6.1.bb b/meta/recipes-devtools/patch/patch_2.6.1.bb
deleted file mode 100644
index 2733854..0000000
--- a/meta/recipes-devtools/patch/patch_2.6.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require patch.inc
-LICENSE = "GPLv3"
-
-PR = "r2"
-
-SRC_URI[md5sum] = "d758eb96d3f75047efc004a720d33daf"
-SRC_URI[sha256sum] = "d1563731e9cffed11cc5f011b2b8e074c325e86a383a91889b5c5b80b09781b9"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-acpaths = "-I ${S}/gl/m4 -I ${S}/m4 "
diff --git a/meta/recipes-devtools/patch/patch_2.7.1.bb b/meta/recipes-devtools/patch/patch_2.7.1.bb
new file mode 100644
index 0000000..38df034
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch_2.7.1.bb
@@ -0,0 +1,11 @@
+require patch.inc
+LICENSE = "GPLv3"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "95dd8d7e41dcbcecdd5cd88ef915378d"
+SRC_URI[sha256sum] = "c05f28668c3474bc63adcd48abae921d15e71c254fbebdbaeda40456d64039d5"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+acpaths = "-I ${S}/m4 "
-- 
1.7.10.4



