Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 382B465D56
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 14:25:47 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so6142790pab.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mh6Bbr4qJnsHqX0/kj+M1RzgQv+FCX9Y1GiMEunIp5A=;
	b=GTnpp1qAmtZm21MM8fLrcM1lj+xZiRrvL62XBN1STHUBXlNfP0CW1PwK0D7NkCBfCQ
	1EGzpRUVwcrAK49NLHT+T19Dn5cbxOaWgeEGCY7/t4v90IyWsSNl3zk+XahO+IP3T3zr
	Ewf8QjXZBeZms6FVO2mPFJmymHUy46X+hZSKUWTZoCYC6QrjH86WyoL2z3PfOzfiZzUF
	0I8dxXcogFY4pnLYmKlheYH7vT/3xL6J9u2lzJP01aPn3KRBqR9PEDV4JcE1zTaAZSTf
	KHi6kKUYIOEcYKTuwxsEIJ/AQGl+h7Cl41GQJrKbUTcXou4JHqm2iSE70aadmx3ri564
	SZDA==
X-Received: by 10.66.161.130 with SMTP id xs2mr26381509pab.36.1408285548260;
	Sun, 17 Aug 2014 07:25:48 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	kl7sm20657495pdb.13.2014.08.17.07.25.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Aug 2014 07:25:47 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Aug 2014 00:35:50 +1000
Message-Id: <1408286150-24277-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.0.3
Subject: [PATCH] qemu: Explicitly disable libiscsi, its not in DEPENDS
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
X-List-Received-Date: Sun, 17 Aug 2014 14:25:50 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d47a44e..f737ded 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -22,7 +22,7 @@ SRC_URI_append_class-native = "\
     file://fix-libcap-header-issue-on-some-distro.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
 				"
-- 
2.0.3


