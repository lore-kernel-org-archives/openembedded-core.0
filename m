Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23CB4763BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:12:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S2CZZP025335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:12:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 19:12:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:12:29 -0700
Message-ID: <c26abcd737535b2cec854f8fd06ea05fda7672d3.1438049511.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438049511.git.liezhi.yang@windriver.com>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] gnupg: 2.1.5 -> 2.1.6
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
X-List-Received-Date: Tue, 28 Jul 2015 02:12:35 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnupg/{gnupg_2.1.5.bb => gnupg_2.1.6.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.5.bb => gnupg_2.1.6.bb} (89%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.5.bb b/meta/recipes-support/gnupg/gnupg_2.1.6.bb
similarity index 89%
rename from meta/recipes-support/gnupg/gnupg_2.1.5.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.6.bb
index 8eb6b90..59aac37 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.6.bb
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://dirmngr-uses-libgpg-error.patch \
           "
 
-SRC_URI[md5sum] = "ff16648f14ec164c7afce1066019364b"
-SRC_URI[sha256sum] = "b5105a7160c39ba6e3aa53789b09f1bfac6e3422d15cc9f3a2f71f82320aa84c"
+SRC_URI[md5sum] = "cc7345b1d9ada92a0d19f4ae406741b4"
+SRC_URI[sha256sum] = "5e599ad542199f3bd733eed2b88a539d1b4c3beda2dbab0ff69f1896f52e92fd"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.7.9.5


