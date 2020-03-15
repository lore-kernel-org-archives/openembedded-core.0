Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DA8116089D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 18:13:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gSGZ0Xmwz4f
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 19:13:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584295990;
	bh=VQpsOoQyLFGqKtxiUIKYhBXVwu8spD0BgFDaF3y+FAs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fJJhnEBh9ygMZP3ogoa0pND1qc5plo2ZG5PqcKgRQaSBKtT15kHR2C9yeyb97BdUz
	o9dUaIVqE68QJXYuypUNOe0te4auRocIe7k2eq+9OxEGksjSJfb/S8ptzGYgqrUxfM
	BJHwL6SNUMUXEOqvFyI13mHSktOTuqZ8JQxTwk60Z1ss68XnzyiEDRTjQKunuxMKng
	AmDJJjircicjAcHS4PmVocNqWocIfL7rWWHkKnRwTldXLhiGLfF7s2iMmrm10Ye/N8
	o0xRdv7+F3/GW+j9nPp6w3uxU7m9UNLA2ORVFRqya+EjSRCdsoDQwAv/yg8F6uU2QD
	5msMDQXlmYkENGcZYrQRn4aaQIITGUN1ZRME727csmodjmyN4u9+WrBl+vi46i1rZT
	KfLNCovw/IZ3SWZfs2RGm+fszkue8ieXVOXROw47NY13F53BOjmUu//y4O4RJYoL3v
	otr7ZbmmkDfys+5MKirRWjVKVOhU66U6iYRf75SGCMeMKdd/yJ3f620lTy0/ZnpXDI
	x/hYCS08QLY7pYlH8p88i5glnLUgj05sQX+K2CiLuoFj5ezGqjHTt/3P5ybFnxLgnE
	TW9ZlUzhwNuMWvW8U5amqFv+97JCMPGgniEaf/CLXpqzWaswxDu/GFlDLutG1k6RLs
	GXQDUz98WDivvBiRHnAvZ47Q=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 20:13:07 +0200
Message-Id: <20200315181308.12792-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200315181308.12792-1-bunk@stusta.de>
References: <20200315181308.12792-1-bunk@stusta.de>
Subject: [warrior][PATCH 2/3] gnupg: upgrade 2.2.15 -> 2.2.16
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

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

(From OE-Core rev: 825be9d66ae9f503f1dd2dce0fac530554057613)

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnupg/{gnupg_2.2.15.bb => gnupg_2.2.16.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.15.bb => gnupg_2.2.16.bb} (93%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.15.bb b/meta/recipes-support/gnupg/gnupg_2.2.16.bb
similarity index 93%
rename from meta/recipes-support/gnupg/gnupg_2.2.15.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.16.bb
index 06a257333d..cb7c6c5c62 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.15.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.16.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 
 
-SRC_URI[md5sum] = "3ab87e377aa0af2f463649515bf66508"
-SRC_URI[sha256sum] = "cb8ce298d7b36558ffc48aec961b14c830ff1783eef7a623411188b5e0f5d454"
+SRC_URI[md5sum] = "d90e186df1c06845880ea58a318f070b"
+SRC_URI[sha256sum] = "6cbe8d454bf5dc204621eed3016d721b66298fa95363395bb8eeceb1d2fd14cb"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1


