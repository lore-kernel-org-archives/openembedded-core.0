Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2BC77602
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 01:56:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2A1uFgZ023401
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Mar 2017 17:56:15 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 9 Mar 2017 17:56:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Mar 2017 09:57:00 +0800
Message-ID: <8f2b3514055b761fb291a6dca85ad9710eafe32e.1489110933.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1489110933.git.Qi.Chen@windriver.com>
References: <cover.1489110933.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] opkg-utils: bump revision
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
X-List-Received-Date: Fri, 10 Mar 2017 01:56:15 -0000
Content-Type: text/plain

Bump to latest revision so that update-alternatives could detect priority
conflict.

Also, we could remove the following patch because opkg-utils has already
fixed the problem in another way.

  0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch

[YOCTO #8314]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 7b3b86e..9deea0f 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
-SRCREV = "9228b38a81c94bd95ada3a6334404923d67bea66"
+SRCREV = "1a708fd73d10c2b7677dd4cc4e017746ebbb9166"
 PV = "0.3.4+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils \
-           file://0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 
-- 
1.9.1


