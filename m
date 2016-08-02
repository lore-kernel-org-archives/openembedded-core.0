Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB076E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 08:51:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u728pVos005270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2016 01:51:31 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 2 Aug 2016 01:51:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Aug 2016 01:51:27 -0700
Message-ID: <e30b15f715b7f2115d8e3550d4ce87242f9ba6c3.1470127858.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1470127858.git.liezhi.yang@windriver.com>
References: <cover.1470127858.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] libcap-ng: 0.7.7 -> 0.7.8
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
X-List-Received-Date: Tue, 02 Aug 2016 08:51:32 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libcap-ng/{libcap-ng_0.7.7.bb => libcap-ng_0.7.8.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.7.7.bb => libcap-ng_0.7.8.bb} (89%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.8.bb
similarity index 89%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.7.8.bb
index a38a818..3583194 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.8.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
 
 inherit lib_package autotools python3native
 
-SRC_URI[md5sum] = "3d7d126b29e2869a0257c17c8b0d9b2e"
-SRC_URI[sha256sum] = "615549ce39b333f6b78baee0c0b4ef18bc726c6bf1cca123dfd89dd963f6d06b"
+SRC_URI[md5sum] = "0dece96644bd798020e170fbf7663802"
+SRC_URI[sha256sum] = "c21af997445cd4107a55d386f955c5ea6f6e96ead693e9151277c0ab5f97d05f"
 
 DEPENDS += "swig-native python3"
 
-- 
2.9.0


