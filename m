Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4497B76FF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 07:36:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7F7a5q8025956
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Aug 2016 00:36:05 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 15 Aug 2016 00:36:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 15 Aug 2016 03:35:58 -0400
Message-ID: <67b3ac11355a9b9433a77e6fcba8e3145a0f66f7.1471246475.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1471246474.git.hongxu.jia@windriver.com>
References: <cover.1471246474.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gnupg: upgrade to 2.1.14
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
X-List-Received-Date: Mon, 15 Aug 2016 07:36:06 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.1.12.bb => gnupg_2.1.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.12.bb => gnupg_2.1.14.bb} (90%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.12.bb b/meta/recipes-support/gnupg/gnupg_2.1.14.bb
similarity index 90%
rename from meta/recipes-support/gnupg/gnupg_2.1.12.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.14.bb
index 8f1c67c..5ea9b96 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.12.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.14.bb
@@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
-SRC_URI[md5sum] = "573bc2cd83934eed12f0d0db443f5bde"
-SRC_URI[sha256sum] = "ac34929d2400a58a349963865442ee6cdd75e500a8d5df083d29835e88bfc506"
+SRC_URI[md5sum] = "46cf0a42ffad6c2615cafd633580b2de"
+SRC_URI[sha256sum] = "9450dee9693b6a12bf0c374dae77b66c30f69ff8f35fc9266ab8dd76998eba42"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.8.1


