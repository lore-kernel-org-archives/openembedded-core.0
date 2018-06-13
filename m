Return-Path: <menschel-d@posteo.de>
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0610D78C6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 18:29:05 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 6E7DB21023
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 20:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1528914546; bh=ybl6gLgc4iFRGq9YstwuCyKnNiJMyYvIHzmH3I+y70g=;
	h=From:To:Cc:Subject:Date:From;
	b=X77iKoYa3W0b0SlRJcTQjziGn230ny/fm1PTgT9Fv+XE743JgKT/kbxh1tSuWCR8M
	0vfRMDV82g5iCYmN1KqluyL7Ib1wu8M3OwTIxu0BFw0sb5J4t6HznWBDs75+69/U4/
	Akk5Oqusx4yNO7Enzeq7Q1Uj8JFmac5Dt5LzrDxCW0SIw2W3ZGqQHMPVg9OoleYD3Q
	zpk53X5s8DiJuzeqXHqoXwAQiVzUQOxsmZStRPpgIeftt8b2/TqA6Doh0FvKpbcsuP
	quJUgpysKTtrSJV5pwri6c/JfYmkS79Fm1jbMh+xfRwmUgzx7JtnzuBpfb9JTADVuu
	4Gc1Ba50gUcpw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 415Zyp18Pxz9rxK;
	Wed, 13 Jun 2018 20:29:06 +0200 (CEST)
From: Dennis Menschel <menschel-d@posteo.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 20:28:16 +0200
Message-Id: <20180613182816.4775-2-menschel-d@posteo.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613182816.4775-1-menschel-d@posteo.de>
References: <20180613182816.4775-1-menschel-d@posteo.de>
Subject: [PATCH 2/2] runqemu-extract-sdk: fix whitespace errors
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
X-List-Received-Date: Wed, 13 Jun 2018 18:29:06 -0000

Indentation using a mix of whitespaces and tabs has been unified in
favor of tabs.

Signed-off-by: Dennis Menschel <menschel-d@posteo.de>
---
 scripts/runqemu-extract-sdk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 13e02fa2ca..4da3eb10a7 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -31,9 +31,9 @@ fi
 
 SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot 2> /dev/null`
 if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
-    echo "Error: Unable to find the oe-find-native-sysroot script"
-    echo "Did you forget to source your build system environment setup script?"
-    exit 1
+	echo "Error: Unable to find the oe-find-native-sysroot script"
+	echo "Did you forget to source your build system environment setup script?"
+	exit 1
 fi
 . $SYSROOT_SETUP_SCRIPT meta-ide-support
 PSEUDO_OPTS="-P $OECORE_NATIVE_SYSROOT/usr"
@@ -42,9 +42,9 @@ ROOTFS_TARBALL=$1
 SDK_ROOTFS_DIR=$2
 
 if [ ! -e "$ROOTFS_TARBALL" ]; then
-   	echo "Error: sdk tarball '$ROOTFS_TARBALL' does not exist"
-   	usage
-   	exit 1
+	echo "Error: sdk tarball '$ROOTFS_TARBALL' does not exist"
+	usage
+	exit 1
 fi
 
 # Convert SDK_ROOTFS_DIR to a full pathname
@@ -84,7 +84,7 @@ debug_image="`echo $ROOTFS_TARBALL | grep '\-dbg\.tar\.'`"
 if [ -e "$pseudo_state_dir" -a -z "$debug_image" ]; then
 	echo "Error: $pseudo_state_dir already exists!"
 	echo "Please delete the rootfs tree and pseudo directory manually"
-        echo "if this is really what you want."
+	echo "if this is really what you want."
 	exit 1
 fi
 
-- 
2.17.1


