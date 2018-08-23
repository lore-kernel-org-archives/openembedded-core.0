Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB12A79503
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:00:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N80wZa019903
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:00:58 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 01:00:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:11:26 +0800
Message-ID: <ff53db069cc9f4795e23f71fa1e9454cbf36cc76.1535011774.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011774.git.liezhi.yang@windriver.com>
References: <cover.1535011774.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] distcc: 3.3 -> 3.3.2
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
X-List-Received-Date: Thu, 23 Aug 2018 08:00:57 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/distcc/{distcc_3.3.bb => distcc_3.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/distcc/{distcc_3.3.bb => distcc_3.3.2.bb} (97%)

diff --git a/meta/recipes-devtools/distcc/distcc_3.3.bb b/meta/recipes-devtools/distcc/distcc_3.3.2.bb
similarity index 97%
rename from meta/recipes-devtools/distcc/distcc_3.3.bb
rename to meta/recipes-devtools/distcc/distcc_3.3.2.bb
index 33a64ce..0d06963 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/distcc/distcc.git \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
-SRCREV = "002e68b766ccd7ad05551e67d162b71a7a773d0d"
+SRCREV = "8600f0857dac55ea393dc11a860948692d215fc8"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
-- 
2.7.4


