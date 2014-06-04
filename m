Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 870176FB37
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 03:27:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s543RfFC024757
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jun 2014 20:27:41 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 3 Jun 2014 20:27:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 4 Jun 2014 11:27:25 +0800
Message-ID: <b1950475abca2368f4c9d1272705aab8dde2d642.1401852113.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401852113.git.hongxu.jia@windriver.com>
References: <cover.1401852113.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/3] apr-util: upgrade to 1.5.3
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
X-List-Received-Date: Wed, 04 Jun 2014 03:27:45 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/apr/{apr-util_1.5.2.bb => apr-util_1.5.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.5.2.bb => apr-util_1.5.3.bb} (93%)

diff --git a/meta/recipes-support/apr/apr-util_1.5.2.bb b/meta/recipes-support/apr/apr-util_1.5.3.bb
similarity index 93%
rename from meta/recipes-support/apr/apr-util_1.5.2.bb
rename to meta/recipes-support/apr/apr-util_1.5.3.bb
index 4546b97..063a787 100644
--- a/meta/recipes-support/apr/apr-util_1.5.2.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.3.bb
@@ -15,8 +15,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "eb682cfb8642babba427a4fb391b15e8"
-SRC_URI[sha256sum] = "a1ec5025373815795d2fa5bfac40c0984675feffc88e049be9a162c408c2f613"
+SRC_URI[md5sum] = "71a11d037240b292f824ba1eb537b4e3"
+SRC_URI[sha256sum] = "76db34cb508e346e3bf69347c29ed1500bf0b71bcc48d54271ad9d1c25703743"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
 		--without-odbc \
-- 
1.8.1.2


