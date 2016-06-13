Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BBFFA731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5D9Ghju019339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 02:16:43 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:28 -0400
Message-ID: <551f88d00466ca2f0e8f08f7c02a37dfc9a87736.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] gnugp: upgrade to 2.1.12
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:43 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.1.11.bb => gnupg_2.1.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.11.bb => gnupg_2.1.12.bb} (90%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.11.bb b/meta/recipes-support/gnupg/gnupg_2.1.12.bb
similarity index 90%
rename from meta/recipes-support/gnupg/gnupg_2.1.11.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.12.bb
index 5d1372b..8f1c67c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.11.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.12.bb
@@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
-SRC_URI[md5sum] = "873302c475c4c90badb67daac90ebd5d"
-SRC_URI[sha256sum] = "b7b0fb2c8c5d47d7ec916d4a1097c0ddcb94a12bb1c0ac424ad86b1ee316b61a"
+SRC_URI[md5sum] = "573bc2cd83934eed12f0d0db443f5bde"
+SRC_URI[sha256sum] = "ac34929d2400a58a349963865442ee6cdd75e500a8d5df083d29835e88bfc506"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.8.1


