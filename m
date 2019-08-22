Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B78F9731B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 01:40:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7M1eLrO014979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Aug 2019 18:40:21 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 21 Aug 2019 18:40:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 22 Aug 2019 09:40:16 +0800
Message-ID: <1566438018-16251-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] distcc: upgrade 3.3.2 -> 3.3.3
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
X-List-Received-Date: Thu, 22 Aug 2019 01:40:21 -0000
Content-Type: text/plain

From: Upgrade Helper <auh@auh.yoctoproject.org>

---
 meta/recipes-devtools/distcc/{distcc_3.3.2.bb => distcc_3.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/distcc/{distcc_3.3.2.bb => distcc_3.3.3.bb} (98%)

diff --git a/meta/recipes-devtools/distcc/distcc_3.3.2.bb b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
similarity index 98%
rename from meta/recipes-devtools/distcc/distcc_3.3.2.bb
rename to meta/recipes-devtools/distcc/distcc_3.3.3.bb
index a93604b..7942deb 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/distcc/distcc.git \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
-SRCREV = "8600f0857dac55ea393dc11a860948692d215fc8"
+SRCREV = "4cde9bcfbda589abd842e3bbc652ce369085eaae"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
-- 
2.7.4


