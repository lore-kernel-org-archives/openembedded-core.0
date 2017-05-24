Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id A31F8780A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 20:47:04 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wY4Fj6ZVsz1qryl;
	Wed, 24 May 2017 22:47:05 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wY4Fj6DJkz3hmmB;
	Wed, 24 May 2017 22:47:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id dXVpXR9cYVaf; Wed, 24 May 2017 22:47:03 +0200 (CEST)
X-Auth-Info: C2rLZnj1OmQTg9XaMzOTlKVqlHnv8d+Iu308KiPli34=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Wed, 24 May 2017 22:47:03 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 May 2017 22:46:59 +0200
Message-Id: <20170524204659.2850-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] libdrm: Add etnaviv support
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
X-List-Received-Date: Wed, 24 May 2017 20:47:05 -0000

Since etnaviv is now in mainline libdrm and is becoming quite mature,
add support for generating libdrm_etnaviv package.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/drm/libdrm_2.4.80.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.80.bb b/meta/recipes-graphics/drm/libdrm_2.4.80.bb
index 063381f178..4726aa2c79 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.80.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.80.bb
@@ -27,7 +27,10 @@ EXTRA_OECONF += "--disable-cairo-tests \
                  --enable-etnaviv-experimental-api \
                  --enable-install-test-programs \
                  --disable-valgrind \
+                 --enable-libkms \
+                 --enable-etnaviv-experimental-api \
                 "
+
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
 ALLOW_EMPTY_${PN}-drivers = "1"
-- 
2.11.0


