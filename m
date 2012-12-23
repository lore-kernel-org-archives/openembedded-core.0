Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TmvPb-00060Y-5n
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 00:56:55 +0100
Received: by mail-la0-f45.google.com with SMTP id p9so7897414laa.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Dec 2012 15:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Ouwg5tIswfSoLRGi+Dydz0krbJ2UZpg26eYFh11lcnw=;
	b=AhaOCTsqFRqIytj+gyXDHmkWW8xglqqRwHIlWZYXr7n2MsuIXDgy/17rMp3IctO9Vn
	7RhkZQ28XSHprkTmbNcJ82tALvjj9O2ILEnf0CrvdDeta5oIWcshPDk0KfEGrP0L/g4p
	ytQrj7KUqdpxyNxIixnTWIg+D7j+6NpTV4qV04qLAAIThJIgSwjI21BlLjxH/UPXWaqx
	j9BqBO9h8rA1FFBYJFeRjbMWd6CpuFtLR7j9sWVn72OZu6/ZTgHEEsGRTBp2zNtX2NNX
	HRRVwDAmLVSifKkcLCmePiPCnyi2ftXb/lxNgRhDZX4pdJ9dVAzi84PIHN2wMybpDczd
	G2Aw==
X-Received: by 10.152.110.229 with SMTP id id5mr18683778lab.36.1356306125837; 
	Sun, 23 Dec 2012 15:42:05 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id b3sm6864831lbl.0.2012.12.23.15.42.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 15:42:04 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TmvBD-0001uA-2o; Mon, 24 Dec 2012 01:42:03 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 01:42:01 +0200
Message-Id: <1356306122-7292-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] freetype: update to upstream version 2.4.11
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
X-List-Received-Date: Sun, 23 Dec 2012 23:56:55 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../{freetype-2.4.10 => freetype-2.4.11}/no-hardcode.patch         |    0
 .../freetype/{freetype_2.4.10.bb => freetype_2.4.11.bb}            |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.10 => freetype-2.4.11}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.10.bb => freetype_2.4.11.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.10/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
similarity index 100%
rename from meta/recipes-graphics/freetype/freetype-2.4.10/no-hardcode.patch
rename to meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.10.bb b/meta/recipes-graphics/freetype/freetype_2.4.11.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.4.10.bb
rename to meta/recipes-graphics/freetype/freetype_2.4.11.bb
index 9365475..8e8d273 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.10.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.11.bb
@@ -18,8 +18,8 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
 
-SRC_URI[md5sum] = "13286702e9390a91661f980608adaff1"
-SRC_URI[sha256sum] = "0c8e242c33c45928de560d7d595db06feb41d1b22167e37260ceabe72f9e992f"
+SRC_URI[md5sum] = "b93435488942486c8d0ca22e8f768034"
+SRC_URI[sha256sum] = "ef9d0bcb64647d9e5125dc7534d7ca371c98310fec87677c410f397f71ffbe3f"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.10.4



