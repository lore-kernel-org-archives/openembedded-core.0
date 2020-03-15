Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DAF2C61BB4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 18:13:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gSGZ34zDz4n
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 19:13:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584295990;
	bh=U8fHd1bszXTx/KpKYfGQWE4sLj9riUahSAmeDUN1enk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MQs/DTv4GifTYfAiCRPQOrPgjdnShK+9MVu3IBbc/FucYFrCsJeOMhddxqbVyC9Uf
	+STi6pevmPFioMbYOLUwtabrb0JU1aLlrcFu/taufLvgtvC8OtWaN1aXWjn99oiczP
	rEOfICEnh3la/uLcLDZfKgxyWyMJRBrghWxooGA47hO3jvCmV27doZKPJEAOwSsW9H
	gjdD+ZHVJ/8Fxopc8gt3+Ogmi1vc19lwGzmUmxAWumrCQZj2p/qxVR/qH1yOaLmn0b
	p3PAcm/S/WvaSqmS99h2PVm84aZpJKl65iozg3kTqKWB91P9jdZPeFvh/lofiMefPM
	xZEZ4TnOhrPxaX6P41jfrcnZDRO47maUDW+gfxDnlOyfyPtjFJtnxqIO/PlTCJA348
	9HRMC/FRqZR8RUydJwO9Pzh/XHH2dGgLG003IaIPUd2PwVRJNEXMlJt8oOYGEQhLIR
	TjSq8clBe70QmqG1ik8kxRST3uATyHWGaRPpNugaq9N8a+xBZ9JVp6sb1Fe55Ck3ZH
	ui64lt+8x2/Xf4LoS2OHz4e1nn/wXQlqHjg5J2XbsRjR+hhlP/bZewidxFZmzJLLre
	7eotEJsqW5G1x99Fxc3FRcmmjjQUgCSF25B3jF7cY/8sv4MVgKm+HyLw28g+VASWBY
	jD9VTciRAtSZUAMlSZMUEy5E=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 20:13:08 +0200
Message-Id: <20200315181308.12792-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200315181308.12792-1-bunk@stusta.de>
References: <20200315181308.12792-1-bunk@stusta.de>
Subject: [warrior][PATCH 3/3] gnupg: upgrade 2.2.16 -> 2.2.17
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
X-List-Received-Date: Sun, 15 Mar 2020 18:13:10 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Also fixes CVE-2019-13050. Announcement:

https://lists.gnupg.org/pipermail/gnupg-announce/2019q3/000439.html

(From OE-Core rev: c6e46323f0d62daf8bd424e642581fdcba920ef7)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnupg/{gnupg_2.2.16.bb => gnupg_2.2.17.bb}               | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.16.bb => gnupg_2.2.17.bb} (92%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.16.bb b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
similarity index 92%
rename from meta/recipes-support/gnupg/gnupg_2.2.16.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.17.bb
index cb7c6c5c62..e5456dd9b9 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.16.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
@@ -19,9 +19,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 
-
-SRC_URI[md5sum] = "d90e186df1c06845880ea58a318f070b"
-SRC_URI[sha256sum] = "6cbe8d454bf5dc204621eed3016d721b66298fa95363395bb8eeceb1d2fd14cb"
+SRC_URI[md5sum] = "1ba2d9b70c377f8e967742064c27a19c"
+SRC_URI[sha256sum] = "afa262868e39b651a2db4c071fba90415154243e83a830ca00516f9a807fd514"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1


