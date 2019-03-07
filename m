Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 63E767CEEC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 16:49:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Fc6h3qxYz9N;
	Thu,  7 Mar 2019 17:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551977373;
	bh=gXGf0664zo6oa6w1puKKOmTEgci/Og5gD6vuTl/cKUM=;
	h=From:To:Cc:Subject:Date:From;
	b=RAW8XGQ9u0dJYFrWgNmQixnIwpBMAk8g5f2BM88gv5A41ez7aga3tnH4Dq2Kgds3f
	4FtfZm83AnDHdvi587niyLffaxTgtwBjdcTlN133FXfSd8Ke41/7cVBTNlVPxoNDWC
	h3oOnA1c/wFAQCwKL0oYs1HBkgNEX+/wPruTDyDoeR9GZ11pnXDVHm7Vh871F/sbOX
	u8Wuon6JgpWNwYJy2LpJscUG0tLbLbwo0bODG0ka8QqJBOp+d3/RBhk3I59XaEXDek
	brRmAM24ivHTPhFxYX9QlriSjnEzr+4QdzkHs0exbDuIqzgKHn4HFIFIXhgVHwGJZR
	mBjIA1k9Qvr40gqlH9kALN4TpIN62QtQ4XREfZ8ocegxQoKWZqktO7gTPfClyzojgQ
	QlO/glZpPkCm3N3TsP4gXDXesdKBwvLvqieZb4agz8LZN5NBiGftdUtHcvEBIC/aJq
	aHcIodhsfco7bXjIAmQMqmKXKh/jB+rAf35JESzTxcHup4au+2G66H3pYebvkfmMlF
	Eq8pNtPj/LU89ahoIimkPbrBglotZFo/h7QfQJ3wchR59aw3ZWoMmL+pduwAJ1CxtU
	DIqhODflePAkKL1FdsJ+5hdeTfvKh+GJaDx1qVp4aWhklqck9VCe9B76WlL7dWImtl
	qa3Igo4Fni9KU+71pzjdFCLQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 18:49:31 +0200
Message-Id: <20190307164931.16222-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Revert "systemd: RDEPENDS on util-linux-umount"
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
X-List-Received-Date: Thu, 07 Mar 2019 16:49:33 -0000

This reverts commit d31259fa464cfc8ae3a1f6209e98153aca101060.

busybox umount was already fixed, making this change obsolete.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd_241.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 44a132a4a0..de0a8e5d50 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -542,7 +542,7 @@ FILES_${PN} = " ${base_bindir}/* \
 
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS_${PN} += "volatile-binds update-rc.d systemd-conf"
 
-- 
2.17.1


