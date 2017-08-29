Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF0F978229
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 07:00:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7T70jLo010271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 29 Aug 2017 00:00:45 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 Aug 2017 00:00:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 29 Aug 2017 03:00:43 -0400
Message-ID: <1503990043-5633-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] gnupg: 2.1.23 -> 2.2.0
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
X-List-Received-Date: Tue, 29 Aug 2017 07:00:45 -0000
Content-Type: text/plain

https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.1.23.bb => gnupg_2.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.23.bb => gnupg_2.2.0.bb} (91%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.23.bb b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
similarity index 91%
rename from meta/recipes-support/gnupg/gnupg_2.1.23.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.0.bb
index 8cbe5e1..0176ddd 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.23.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
@@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
-SRC_URI[md5sum] = "86c2304ead54b74a422e76c3f1bc7a91"
-SRC_URI[sha256sum] = "a94476391595e9351f219188767a9d6ea128e83be5ed3226a7890f49aa2d0d77"
+SRC_URI[md5sum] = "789f16949fae2d003d387f49e9da4b74"
+SRC_URI[sha256sum] = "d4514a0be0f7a1ff263193330019eb4b53c82f0f5e230af3c14df371271a45e6"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.8.1


