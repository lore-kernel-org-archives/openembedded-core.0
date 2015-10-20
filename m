Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA20A76F8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:18:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9K9Ibrf017275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 02:18:37 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 20 Oct 2015 02:18:36 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Oct 2015 17:10:12 +0800
Message-ID: <5cd1b829176c73a7bd0c0143b69874ffae0cbfe8.1445332133.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1445332132.git.kai.kang@windriver.com>
References: <cover.1445332132.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libidn: 1.30 -> 1.32
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
X-List-Received-Date: Tue, 20 Oct 2015 09:18:38 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/libidn/{libidn_1.30.bb => libidn_1.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.30.bb => libidn_1.32.bb} (91%)

diff --git a/meta/recipes-extended/libidn/libidn_1.30.bb b/meta/recipes-extended/libidn/libidn_1.32.bb
similarity index 91%
rename from meta/recipes-extended/libidn/libidn_1.30.bb
rename to meta/recipes-extended/libidn/libidn_1.32.bb
index 7234747..d9ee346 100644
--- a/meta/recipes-extended/libidn/libidn_1.30.bb
+++ b/meta/recipes-extended/libidn/libidn_1.32.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
 "
 
-SRC_URI[md5sum] = "b17edc8551cd31cc5f14c82a9dabf58e"
-SRC_URI[sha256sum] = "39b9fc94d74081c185757b12e0891ce5a22db55268e7d1bb24533ff4432eb053"
+SRC_URI[md5sum] = "4dd8356ba577287ea7076bfa1554b534"
+SRC_URI[sha256sum] = "ba5d5afee2beff703a34ee094668da5c6ea5afa38784cebba8924105e185c4f5"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
2.6.1


