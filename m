Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F25C17E45D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 02:07:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7M27Xcj021123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Aug 2019 19:07:33 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 21 Aug 2019 19:07:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 22 Aug 2019 10:07:29 +0800
Message-ID: <1566439650-17423-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20190822020240.2334.69764@do>
References: <20190822020240.2334.69764@do>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 1/3] distcc: upgrade 3.3.2 -> 3.3.3
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
X-List-Received-Date: Thu, 22 Aug 2019 02:07:33 -0000
Content-Type: text/plain

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


