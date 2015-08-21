Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5FA766E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:15:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LAFMCO027224
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:15:22 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 21 Aug 2015 03:15:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 03:15:16 -0700
Message-ID: <e8a437455ff32109425d7cc3d3793ad4252ae357.1440145857.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440145857.git.liezhi.yang@windriver.com>
References: <cover.1440145857.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] gnupg: 2.1.6 -> 2.1.7
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
X-List-Received-Date: Fri, 21 Aug 2015 10:15:22 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnupg/{gnupg_2.1.6.bb => gnupg_2.1.7.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.6.bb => gnupg_2.1.7.bb} (89%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.6.bb b/meta/recipes-support/gnupg/gnupg_2.1.7.bb
similarity index 89%
rename from meta/recipes-support/gnupg/gnupg_2.1.6.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.7.bb
index 59aac37..48c7c96 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.6.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.7.bb
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://dirmngr-uses-libgpg-error.patch \
           "
 
-SRC_URI[md5sum] = "cc7345b1d9ada92a0d19f4ae406741b4"
-SRC_URI[sha256sum] = "5e599ad542199f3bd733eed2b88a539d1b4c3beda2dbab0ff69f1896f52e92fd"
+SRC_URI[md5sum] = "ebdf92b15b8bcd8579b643c7f41a3238"
+SRC_URI[sha256sum] = "c18a3776d47fec98892d51d28b6574ef16bf0a25eabb0956231058aaf2e7846e"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.7.9.5


