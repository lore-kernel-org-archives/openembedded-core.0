Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A947C70E63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 14:49:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2014 07:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="374283395"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.111])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2014 07:45:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 07:49:12 -0700
Message-Id: <0c46a71f8ebffd118770b7002b1372963f92e701.1408459360.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
Subject: [PATCH 6/7] gnupg: Upgrade to 2.0.26
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
X-List-Received-Date: Tue, 19 Aug 2014 14:49:51 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnupg/{gnupg_2.0.25.bb => gnupg_2.0.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.0.25.bb => gnupg_2.0.26.bb} (88%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.25.bb b/meta/recipes-support/gnupg/gnupg_2.0.26.bb
similarity index 88%
rename from meta/recipes-support/gnupg/gnupg_2.0.25.bb
rename to meta/recipes-support/gnupg/gnupg_2.0.26.bb
index b677425..c460b7e 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.25.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.26.bb
@@ -13,8 +13,8 @@ inherit autotools gettext texinfo pkgconfig
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://pkgconfig.patch"
 
-SRC_URI[md5sum] = "048d8de797125f1d8e6cf3bdff9e2d12"
-SRC_URI[sha256sum] = "b3abe97df096cf53d6a422ac922f3c48e688bc892b7ccf669b92f0b7fc6c5823"
+SRC_URI[md5sum] = "fa7e704aad33eb114d1840164455aec1"
+SRC_URI[sha256sum] = "7758e30dc382ae7a7167ed41b7f936aa50af5ea2d6fccdef663b5b750b65b8e0"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.8.3.1


