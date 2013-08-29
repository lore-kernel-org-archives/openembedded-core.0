Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id BEA016BEC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:01:59 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so347776eek.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=3aOeuGx/RbugtbZqXN2W4S3lLiIxkaxhkjkDuBJVzD0=;
	b=TkIJwpkdaW1AUccUTaxBaJ0P90Zwc+QAuXPwEOMp8TdHGvQ7rs9vzjsHT5UmyU7m/e
	VWxsvhk5Ba8TxEzgaryQshaW0yjNbwhDtVKDNnwA5QdRyE8G7rKAykY+w1GeHB6pQzMl
	2UnLa4I+EE4VBNenwPhIm93alMR+cAfrNT+RZPBscx50WiYR58mX2Tr3FGTHsaj+mjgn
	+Ul0UE9ByRp117MMnp15QwCAklR0PN8+GdvXeaMR838Rk9xelrXO8jsQur9pBeFv+Gor
	mlfYBNyw6Bih1IZ3RVCra7n7lilxPAygRP4r/vLOJWQd3xMKGCE+1nsbvkmeQpngN1L5
	EBRw==
X-Received: by 10.14.4.1 with SMTP id 1mr5502945eei.21.1377792120216;
	Thu, 29 Aug 2013 09:02:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm47246811eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:01:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:51 +0200
Message-Id: <560bb5cc0269236f925874b6b6673fbde3456d56.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 04/20] xf86-input-synaptics: Add dependency on libxtst
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb | 2 +-
 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
index 9125613..f678e8b 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
@@ -15,6 +15,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 SRC_URI[md5sum] = "6505de717972b6a24b8eb13e69eb996c"
 SRC_URI[sha256sum] = "db5825660e1fb23190697f609bf75d4450fe707344a14298e1c9b47039bbb58e"
 
-DEPENDS += "libxi mtdev"
+DEPENDS += "libxi mtdev libxtst"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
index 73b8089..30c142c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
@@ -15,4 +15,4 @@ PR = "${INC_PR}.1"
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-synaptics;protocol=git"
 S = "${WORKDIR}/git"
 
-DEPENDS += "libxi mtdev"
+DEPENDS += "libxi mtdev libxtst"
-- 
1.8.3.2


