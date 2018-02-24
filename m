Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id DC7E678698
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 23:20:08 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id y19so17270388lfd.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 15:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7nI2g3pERPNM69AFr907uQJ3En3M6WrOxWfurnEB+Nc=;
	b=FvYdjNFJfXOGi49htm78ujEkH5VVxaiV5VHdw+fQYdwZJdItUBgkXkxOK+npBPP0BA
	Yn61r7rDvhd8gVM66FCvr6vbOCTVGRqcc4KXGHXk4TxQEg1r3B7SxLDAv10aWUSo0LNA
	TZUymdG8cNbdagf4JpN6CjFL8Y4vq9VWUEZGiIsaGBKxpaqUPXUOFDQJP+KR4PNFtVtL
	MIaJ71MEvr5R16oWxSA+uhG9qma4ERHkJOd5S0xEY1VT447DAA+u82mVMvHhRsSFVDNp
	Tr5gkquFKs1X+LONGQILN2NwWkBOqvq+UmzWrjQO08e9UaaQH4t+2lTu5LgHdkGSRiny
	N95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7nI2g3pERPNM69AFr907uQJ3En3M6WrOxWfurnEB+Nc=;
	b=BUi0avfgk30TS+n5f8lgqkIYTVqkjCabrLbZDxIJ9isYxx+p4dkmOHmB9ZFO8wV4P4
	qfWb0BRqMwX8/GKkjPN9f7NFjwNJSpILiA0qnK9Fz4zcHRsJSdj1/vFqFe7fr0CAMRaw
	9t8X9X05UKVmaeiWb/kpVjg57KdLt51BvVViqW8VQIISN9Zs2itvSIrjLWvTypRgnGcD
	edkGEaZ4mO5WQX+Ge8a2CMsCa1Z+nNWsAmpPZyI9f2u3hneOduPGmHb2GeOzNuYVUCjf
	HUOlE9LnaOUOYjHxioPiSQnUDHsA6AaOT73iz9TrponV0BE634/mx0NtVf6e12XkgJtS
	lV5w==
X-Gm-Message-State: APf1xPCW0XWzJ+edEpltYCi1bl0JrVOfwszSIUuHVgPGDnP7+6flklXB
	GEOpcnJNp4XbsWs4GDCIEuyMA2zS
X-Google-Smtp-Source: AH8x225zyYKV8kdh8Rw/AEVQIGXktJGAkxIX5rGo6ayvrrJVAsoNd076jzSqHQC59h+MqwIewOuLow==
X-Received: by 10.46.91.20 with SMTP id p20mr4517987ljb.61.1519514409235;
	Sat, 24 Feb 2018 15:20:09 -0800 (PST)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:f495:dd31:4406:dfb4])
	by smtp.gmail.com with ESMTPSA id
	x66sm1159635lff.80.2018.02.24.15.20.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Feb 2018 15:20:08 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Feb 2018 00:19:39 +0100
Message-Id: <20180224231939.6145-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.14.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH v2] libmpc: upgrade to 1.1.0
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
X-List-Received-Date: Sat, 24 Feb 2018 23:20:09 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/libmpc/{libmpc_1.0.3.bb => libmpc_1.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libmpc/{libmpc_1.0.3.bb => libmpc_1.1.0.bb} (69%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.0.3.bb b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
similarity index 69%
rename from meta/recipes-support/libmpc/libmpc_1.0.3.bb
rename to meta/recipes-support/libmpc/libmpc_1.1.0.bb
index d37de3831a..2d25d388f1 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.3.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
@@ -5,8 +5,8 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "https://ftp.gnu.org/gnu/mpc/mpc-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d6a1d5f8ddea3abd2cc3e98f58352d26"
-SRC_URI[sha256sum] = "617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3"
+SRC_URI[md5sum] = "4125404e41e482ec68282a2e687f6c73"
+SRC_URI[sha256sum] = "6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
 
 UPSTREAM_CHECK_URI = "http://www.multiprecision.org/mpc/download.html"
 
-- 
2.14.1


