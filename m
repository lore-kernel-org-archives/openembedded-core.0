Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C49975AF8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:55:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8tSWm005621
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:55:28 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 01:55:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 01:55:23 -0700
Message-ID: <a61f09c0baba8a4d8ea74f119789c458f9414863.1435135356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435135356.git.liezhi.yang@windriver.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] gnupg: 2.1.4 -> 2.1.5
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
X-List-Received-Date: Wed, 24 Jun 2015 08:55:29 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnupg/{gnupg_2.1.4.bb => gnupg_2.1.5.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.4.bb => gnupg_2.1.5.bb} (89%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.4.bb b/meta/recipes-support/gnupg/gnupg_2.1.5.bb
similarity index 89%
rename from meta/recipes-support/gnupg/gnupg_2.1.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.5.bb
index 72635a2..8eb6b90 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.5.bb
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://dirmngr-uses-libgpg-error.patch \
           "
 
-SRC_URI[md5sum] = "c36f1a4c261ecc81fa5df551356c33f1"
-SRC_URI[sha256sum] = "64127eedd868510f2bccccb22c507a4878ffa07495db16a0f976c67f56426cb0"
+SRC_URI[md5sum] = "ff16648f14ec164c7afce1066019364b"
+SRC_URI[sha256sum] = "b5105a7160c39ba6e3aa53789b09f1bfac6e3422d15cc9f3a2f71f82320aa84c"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.7.9.5


