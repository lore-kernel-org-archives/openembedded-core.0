Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB16073D1E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOXM0026733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:26 -0700
Message-ID: <ae3201cd924e7c222b7dc049979da4df68a18126.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] gnupg: 2.1.1 -> 2.1.2
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
X-List-Received-Date: Tue, 07 Apr 2015 11:24:32 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnupg/{gnupg_2.1.1.bb => gnupg_2.1.2.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.1.bb => gnupg_2.1.2.bb} (89%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.1.bb b/meta/recipes-support/gnupg/gnupg_2.1.2.bb
similarity index 89%
rename from meta/recipes-support/gnupg/gnupg_2.1.1.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.2.bb
index a7c4254..4784869 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.1.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://dirmngr-uses-libgpg-error.patch \
           "
 
-SRC_URI[md5sum] = "9a314c3dcef0a091de90b6aa4d467db5"
-SRC_URI[sha256sum] = "70ecd01d2875db62624c911c2fd815742f50aef5492698eb3bfc09a08690ce49"
+SRC_URI[md5sum] = "156fbd6566f4c51caac741c858d30d96"
+SRC_URI[sha256sum] = "404f5a43d591dfe41f0ffb204b49a1533b67d77bc1fd68febd7e447575616792"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.7.9.5


