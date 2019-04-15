Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6018D7D8DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:43:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3F3gur6027081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 20:43:06 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 14 Apr 2019 20:42:33 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Apr 2019 23:42:31 -0400
Message-ID: <20190415034231.105641-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] cryptodev: update SRCREV
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
X-List-Received-Date: Mon, 15 Apr 2019 03:43:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update SRCREV of cryptodev which only contains one fix for linux 5.0:

$ git log fd8b15ef1c8398a69a37932ee48c74ab40329a29..f971e0cd4a0ebe59fb2e8e17240399bf6901b09b
commit f971e0cd4a0ebe59fb2e8e17240399bf6901b09b
Author: Derald D. Woods <woods.technical@gmail.com>
Date:   Sun Feb 10 13:22:19 2019 -0600

    Fix module loading with Linux v5.0-rc5

    This commit fixes this module load error:
    [...]
    [   29.112091] cryptodev: loading out-of-tree module taints kernel.
    [   29.128906] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
    [   29.188842] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
    modprobe: can't load module cryptodev (extra/cryptodev.ko): unknown symbol in module, or unknown parameter
    [...]

    Upstream Linux support for unused GIVCIPHER, and others, was dropped here:

    c79b411eaa72 (crypto: skcipher - remove remnants of internal IV generators)

    Signed-off-by: Derald D. Woods <woods.technical@gmail.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 252d39d23a..79ddefd435 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux"
-SRCREV = "fd8b15ef1c8398a69a37932ee48c74ab40329a29"
+SRCREV = "f971e0cd4a0ebe59fb2e8e17240399bf6901b09b"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.0


