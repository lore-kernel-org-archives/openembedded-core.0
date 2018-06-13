Return-Path: <menschel-d@posteo.de>
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by mail.openembedded.org (Postfix) with ESMTP id AC7CB78C6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 18:28:54 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 7D65E21108
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 20:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1528914534; bh=PLf+7Qlx2/cuq6jE22d+co/8G4PC8eKiUqQ3S2LQtvg=;
	h=From:To:Cc:Subject:Date:Autocrypt:OpenPGP:From;
	b=komtkdUnxTm/WK0RWdo7bZ3pRxFpGK/zPlM5VEF+7Y4aYjAiSci/EreF76wQQrVFs
	DOIElXmX6S9WxrY+WwUSCzOnKvj3PkHBDoNbKuTr+HY81taLGwUgmTxcwtgP9jaz29
	FQ1qCt40vj2omkDZIy6yVqX55hvLW7T0bRbOWDQ9lv/3v1vSLIquEwKswGcgdtMCDw
	VFCDei1nXwIi20YcWfXrg6mcrdmLWNc4H/JThI0aiZy2xnZ0x3xUXyfAUoKNMEb8Uj
	eqfTPrVznlDUdvRV6+2T7RXdwEIJEQO/iFZnYGs6doOtiQ0M9Y339BAcRUk7zO+Wfs
	3wDBchGLTN3sQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 415ZyZ09zBz9rxL;
	Wed, 13 Jun 2018 20:28:53 +0200 (CEST)
From: Dennis Menschel <menschel-d@posteo.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 20:28:15 +0200
Message-Id: <20180613182816.4775-1-menschel-d@posteo.de>
X-Mailer: git-send-email 2.17.1
Autocrypt: addr=menschel-d@posteo.de;
	keydata=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
	8VgVw1bAd13Ch1WOARIgQy1dLuk9Q=
OpenPGP: url=https://posteo.de/keys/menschel-d@posteo.de.asc
Subject: [PATCH 1/2] runqemu-extract-sdk: support tar.xz format
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
X-List-Received-Date: Wed, 13 Jun 2018 18:28:55 -0000

As the format "tar.xz" is included in the IMAGE_TYPES bitbake variable
as defined in meta/classes/image_types.bbclass, it should also be
possible to extract a rootfs that has been built using that format.

Signed-off-by: Dennis Menschel <menschel-d@posteo.de>
---
 scripts/runqemu-extract-sdk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index f4286efb1f..13e02fa2ca 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -53,6 +53,9 @@ if [[ ${SDK_ROOTFS_DIR:0:1} != "/" ]]; then
 fi
 
 TAR_OPTS=""
+if [[ "$ROOTFS_TARBALL" =~ tar\.xz$ ]]; then
+	TAR_OPTS="--numeric-owner -xJf"
+fi
 if [[ "$ROOTFS_TARBALL" =~ tar\.bz2$ ]]; then
 	TAR_OPTS="--numeric-owner -xjf"
 fi
@@ -64,7 +67,7 @@ if [[ "$ROOTFS_TARBALL" =~ \.tar$ ]]; then
 fi
 if [ -z "$TAR_OPTS" ]; then
 	echo "Error: Unable to determine sdk tarball format"
-	echo "Accepted types: .tar / .tar.gz / .tar.bz2"
+	echo "Accepted types: .tar / .tar.gz / .tar.bz2 / .tar.xz"
 	exit 1
 fi
 
-- 
2.17.1


