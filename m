Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B280270603
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQTvC011066; Wed, 16 Jul 2014 17:26:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id t-denZydo5au; Wed, 16 Jul 2014 17:26:29 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQRnk011041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:28 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2A-0004NI-1n; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:04 +0100
Message-Id: <73524fefa1af25ad7f1917280f6fbdeb657ffbde.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/19] mdadm: Upgrade 3.3 -> 3.3.1
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:13 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/mdadm/{mdadm_3.3.bb => mdadm_3.3.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mdadm/{mdadm_3.3.bb => mdadm_3.3.1.bb} (90%)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.bb b/meta/recipes-extended/mdadm/mdadm_3.3.1.bb
similarity index 90%
rename from meta/recipes-extended/mdadm/mdadm_3.3.bb
rename to meta/recipes-extended/mdadm/mdadm_3.3.1.bb
index 40d68d6..59bc587 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.1.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://mdadm-3.2.2_fix_for_x32.patch \
            file://gcc-4.9.patch \
 	  "
 
-SRC_URI[md5sum] = "8ac04259cdd74b4566c3b6dea9414b57"
-SRC_URI[sha256sum] = "9c07e518bdf3392ebac8874eb686258e10ea3ae0ff7a8acb6d014718a9c3ed45"
+SRC_URI[md5sum] = "4227d48de62dfb217c92fa0c54171bbe"
+SRC_URI[sha256sum] = "d8c74112cfd77bdc1dbc1291fe8d9243c76d91bfa276fcb95f2a75ca7717ab02"
 
 CFLAGS += "-fno-strict-aliasing"
 
-- 
1.9.2


