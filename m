Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 400207273E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 05:10:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBN5A7eC021601
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 21:10:08 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 22 Dec 2014 21:10:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Dec 2014 13:09:56 +0800
Message-ID: <4e2b830f3c5462338c630fbbc851c400aed1ef37.1419309149.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419309149.git.hongxu.jia@windriver.com>
References: <cover.1419309149.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] apr-util: upgrade to 1.5.4
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
X-List-Received-Date: Tue, 23 Dec 2014 05:10:07 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/apr/{apr-util_1.5.3.bb => apr-util_1.5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.5.3.bb => apr-util_1.5.4.bb} (93%)

diff --git a/meta/recipes-support/apr/apr-util_1.5.3.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
similarity index 93%
rename from meta/recipes-support/apr/apr-util_1.5.3.bb
rename to meta/recipes-support/apr/apr-util_1.5.4.bb
index 063a787..1cd47b1 100644
--- a/meta/recipes-support/apr/apr-util_1.5.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -15,8 +15,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "71a11d037240b292f824ba1eb537b4e3"
-SRC_URI[sha256sum] = "76db34cb508e346e3bf69347c29ed1500bf0b71bcc48d54271ad9d1c25703743"
+SRC_URI[md5sum] = "866825c04da827c6e5f53daff5569f42"
+SRC_URI[sha256sum] = "976a12a59bc286d634a21d7be0841cc74289ea9077aa1af46be19d1a6e844c19"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
 		--without-odbc \
-- 
1.9.1


