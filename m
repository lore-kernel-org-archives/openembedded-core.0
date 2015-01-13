Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30CEA72BAE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5ia3W003254
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:36 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:04 +0800
Message-ID: <4799cf28c756059c7ce619108d4c0fc16498f25a.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421127484.git.hongxu.jia@windriver.com>
References: <cover.1421127484.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] gnupg: upgrade to 2.1.1
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:36 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.1.0.bb => gnupg_2.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.0.bb => gnupg_2.1.1.bb} (89%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.0.bb b/meta/recipes-support/gnupg/gnupg_2.1.1.bb
similarity index 89%
rename from meta/recipes-support/gnupg/gnupg_2.1.0.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.1.bb
index e9ade3b..a7c4254 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.0.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://dirmngr-uses-libgpg-error.patch \
           "
 
-SRC_URI[md5sum] = "43a809789a1d897f4386680be0b09d02"
-SRC_URI[sha256sum] = "16a8c3f50a15bf37d2dfb1c5e4bb3ec533e1d0b6a4043ff3680a376a3ad4058b"
+SRC_URI[md5sum] = "9a314c3dcef0a091de90b6aa4d467db5"
+SRC_URI[sha256sum] = "70ecd01d2875db62624c911c2fd815742f50aef5492698eb3bfc09a08690ce49"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.9.1


