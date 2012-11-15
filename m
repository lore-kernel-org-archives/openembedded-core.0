Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYxJt-0008RC-CA
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 12:09:17 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so602426bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 02:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=if1HdqDt+imSw7l5uzRJxa4remqLrcAsnwRRLuXjVdo=;
	b=ynXVD9sSCh9MAFzJhd0vJ9Fbvcdzm4z50xJU4BhSQ/JN7bLT7G9d+Nnpe3nakWnzlz
	uFSwyOhetlb92V+rGTgppoC1XHiPWjHiPNGOh10hM7HjtLzmr2aZvLDNx8+byMhlFXTC
	ph0KHUvdcv4m+tHg7Ay6JZs/3Uy38wMXMuX2P0AdZNdNb10z4ttr50nacx5XkbyWMRVK
	70Ch/W1Al7G/BxixQB9Ws8hZdYdqzFkFJA1VhvNC/mnwgWSRs/UPvz9ShMzFM7trAqCy
	oprI3ZJ3vmYwvM0BnV6npzlgFeBq0dPvk8h+Tl9RecxylZg+Wc7BEzz7xgs3NL8h6+VT
	Npkg==
Received: by 10.204.9.147 with SMTP id l19mr230159bkl.15.1352976920675;
	Thu, 15 Nov 2012 02:55:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hm4sm7731146bkc.7.2012.11.15.02.55.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 02:55:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2012 11:55:31 +0100
Message-Id: <1352976932-4150-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 1/2] udev-extraconf: drop allarch to allow setting to MACHINE_ARCH in some .bbappend
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2012 11:09:17 -0000

* if bsp needs some special rule for udev
* see https://bugzilla.yoctoproject.org/show_bug.cgi?id=3390 for details

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/udev/udev-extraconf_1.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
index 2c4a4f1..fd9a333 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
@@ -4,9 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-inherit allarch
-
-PR = "r7"
+PR = "r8"
 
 SRC_URI = " \
        file://automount.rules \
-- 
1.8.0



