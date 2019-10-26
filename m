Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C041C7FC05
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 20:42:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 470tFk72QyzKB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 22:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572122539;
	bh=gkiSD2GFWE6Y7150Ol6Y8qx7SvMKKJiIE7KQio9wZro=;
	h=From:To:Subject:Date:From;
	b=HqwBDWxfOh7jh897Thy+UGBeFKEwIpPPKT7cbabZSszdS1/w20kvTf+Iv+TM/Nw4N
	cMRzNFe+okcvdDQILFdIMQ/qdsW2aR6fivUQp1nG5LNnxJIppkYLBaRaGjWVA32AQc
	Hv+wRbK0zzTmsoQ7O3EEALfoapMWAzbD44CyRnoZUnGHjD+2JbeWs35LzaPFg9y4EO
	eD0zw/3nBzQNlUMkspKG1KRGeEHrSJN9hymiJ8IPs6sHpEkYS9JWhK+DgcR90jTOKZ
	yRVVYJ3TPYVwkRFXBdHS0kB7ogHertwgh1xO1B0YnTKnqa6ezPLL2wnwfrgx9kChTS
	SqX5zaC2uSP/6ngB7/hv36MGDg+vJLf4AF6+wd5LeeX+/IyzPt6F6qN0LNSwDuEPRh
	SYsLdXWUxK9vFnaXQ2/8RpwgVlh3TGnniJu4clrxflVGHYqoEMxj66z7hdMvdEGQDv
	0OuA1EohirWmAXA07t1S9jjEFJuMrluVDVO8rwDhwj5tNbKtmk6pjF+VYi5Y0I77n8
	HLZEF5qa9auoHGzjqW1Tw4xbAVFfCCuQsLHiSZYGqGh048tPBRokQVMo+z/EkcBgNN
	UFTMTJcawGaK8XNlPWXCgfi3dZpMxkL0F2zUMKMrAvQEnMytGtM7C41To/PeLJVSGH
	NMD18Ckw/FnUXwBcrWB86MIU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Oct 2019 23:42:15 +0300
Message-Id: <20191026204216.9298-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] stress-ng: Upgrade 0.10.00 -> 0.10.08
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
X-List-Received-Date: Sat, 26 Oct 2019 20:42:19 -0000

Patch applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...tion-remove-the-shebang-at-the-start.patch | 23 -------------------
 ...ess-ng_0.10.00.bb => stress-ng_0.10.08.bb} |  5 ++--
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-bash-completion-remove-the-shebang-at-the-start.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.10.00.bb => stress-ng_0.10.08.bb} (76%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-bash-completion-remove-the-shebang-at-the-start.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-bash-completion-remove-the-shebang-at-the-start.patch
deleted file mode 100644
index 66d99dd885..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-bash-completion-remove-the-shebang-at-the-start.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 042147675c7c2ea7dd65b2597f2e350376a710aa Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 6 Aug 2019 17:28:56 +0200
-Subject: [PATCH] bash-completion: remove the shebang at the start
-
-bash completion files do not need to specify that.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- bash-completion/stress-ng | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/bash-completion/stress-ng b/bash-completion/stress-ng
-index 8b1421c..7f195be 100755
---- a/bash-completion/stress-ng
-+++ b/bash-completion/stress-ng
-@@ -1,5 +1,3 @@
--#!/bin/bash
--#
- # stress-ng tab completion for bash.
- #
- # Copyright (C) 2019 Canonical
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.08.bb
similarity index 76%
rename from meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.10.08.bb
index 7d194b305e..470f42295f 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.08.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
-           file://0001-bash-completion-remove-the-shebang-at-the-start.patch \
            "
-SRC_URI[md5sum] = "46aa41d37690324ceab4febfcc549018"
-SRC_URI[sha256sum] = "d09dd2a1aea549e478995bf9be90b38906a4cdf33ea7b245ef9d46aa5213c074"
+SRC_URI[md5sum] = "e02acd0bc00d3c6a81412537393c2436"
+SRC_URI[sha256sum] = "4addeaabcfcb709581cbc4c61182317b8d91bcf31f529bfa899d170facfd75ce"
 
 DEPENDS = "coreutils-native"
 
-- 
2.17.1


