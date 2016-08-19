Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 340D3760AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 08:00:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J80Tt1025480
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 01:00:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 19 Aug 2016 01:00:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 16:00:38 +0800
Message-ID: <66f3ae990040b760738eb50f275c61992d1e98dc.1471593530.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1471593530.git.Qi.Chen@windriver.com>
References: <cover.1471593530.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] diffutils: upgrade to 3.4
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
X-List-Received-Date: Fri, 19 Aug 2016 08:00:31 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch        | 0
 .../diffutils/{diffutils-3.3 => diffutils-3.4}/run-ptest              | 0
 .../recipes-extended/diffutils/{diffutils_3.3.bb => diffutils_3.4.bb} | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/diffutils/{diffutils-3.3 => diffutils-3.4}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-extended/diffutils/{diffutils-3.3 => diffutils-3.4}/run-ptest (100%)
 rename meta/recipes-extended/diffutils/{diffutils_3.3.bb => diffutils_3.4.bb} (87%)

diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/diffutils/diffutils-3.4/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-extended/diffutils/diffutils-3.4/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/run-ptest b/meta/recipes-extended/diffutils/diffutils-3.4/run-ptest
similarity index 100%
rename from meta/recipes-extended/diffutils/diffutils-3.3/run-ptest
rename to meta/recipes-extended/diffutils/diffutils-3.4/run-ptest
diff --git a/meta/recipes-extended/diffutils/diffutils_3.3.bb b/meta/recipes-extended/diffutils/diffutils_3.4.bb
similarity index 87%
rename from meta/recipes-extended/diffutils/diffutils_3.3.bb
rename to meta/recipes-extended/diffutils/diffutils_3.4.bb
index 5008690..cb7092b 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.3.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.4.bb
@@ -17,8 +17,8 @@ do_configure_prepend () {
 	done
 }
 
-SRC_URI[md5sum] = "99180208ec2a82ce71f55b0d7389f1b3"
-SRC_URI[sha256sum] = "a25e89a8ab65fded1731e4186be1bb25cda967834b6df973599cdcd5abdfc19c"
+SRC_URI[md5sum] = "df9ca465f30307cffd03da176a43a5d4"
+SRC_URI[sha256sum] = "db53c025f2ac3d217bcf753dad6dee7b410b33d0948495ff015aaf8b91189ce2"
 
 inherit ptest
 
-- 
1.9.1


