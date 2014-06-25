Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C34DA65D42
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2014 17:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,541,1400050800"; d="scan'208";a="560482008"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2014 17:13:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 17:13:14 -0700
Message-Id: <2cdbb3bfb445868c18454297569165d6570d7dc6.1403654908.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
Subject: [PATCH 04/10] gnupg: Update to 2.0.23
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
X-List-Received-Date: Wed, 25 Jun 2014 00:13:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnupg/{gnupg_2.0.22.bb => gnupg_2.0.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.0.22.bb => gnupg_2.0.23.bb} (88%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.22.bb b/meta/recipes-support/gnupg/gnupg_2.0.23.bb
similarity index 88%
rename from meta/recipes-support/gnupg/gnupg_2.0.22.bb
rename to meta/recipes-support/gnupg/gnupg_2.0.23.bb
index 0b00362..30414f9 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.23.bb
@@ -13,8 +13,8 @@ inherit autotools gettext texinfo pkgconfig
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://pkgconfig.patch"
 
-SRC_URI[md5sum] = "ee22e7b4fdbfcb50229c2e6db6db291e"
-SRC_URI[sha256sum] = "437d0ab259854359fc48aa8795af80cff4975e559c111c92c03d0bc91408e251"
+SRC_URI[md5sum] = "1c30b3aa1f99f17b4988e1ab616355d4"
+SRC_URI[sha256sum] = "cf196b8056eafb4236f000a3e12543e0022a1fec4d6edff1b91b48936c109841"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.8.3.1


