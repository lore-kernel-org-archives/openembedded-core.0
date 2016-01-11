Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 667046E6B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BF16Ww003655; Mon, 11 Jan 2016 15:01:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PVOBaFwhhnc6; Mon, 11 Jan 2016 15:01:06 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BF12A4003648
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Jan 2016 15:01:03 GMT
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1aIdxu-0008DF-Sc; Mon, 11 Jan 2016 15:01:02 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 15:01:01 +0000
Message-Id: <1452524461-31509-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452524461-31509-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1452524461-31509-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/5] subversion: Upgrade 1.9.2 -> 1.9.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 15:01:08 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/{subversion_1.9.2.bb => subversion_1.9.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.9.2.bb => subversion_1.9.3.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.9.2.bb b/meta/recipes-devtools/subversion/subversion_1.9.3.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.9.2.bb
rename to meta/recipes-devtools/subversion/subversion_1.9.3.bb
index f432b8f..a19a675 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.9.3.bb
@@ -15,8 +15,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            "
-SRC_URI[md5sum] = "0a7e55bb58fe77072f19e108a56b468b"
-SRC_URI[sha256sum] = "023da881139b4514647b6f8a830a244071034efcaad8c8e98c6b92393122b4eb"
+SRC_URI[md5sum] = "243036eb28b50ce517fc228eb3250add"
+SRC_URI[sha256sum] = "8bbf6bb125003d88ee1c22935a36b7b1ab7d957e0c8b5fbfe5cb6310b6e86ae0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=af81ae49ba359e70626c05e9bf313709"
 
-- 
2.5.0


