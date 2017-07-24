Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D82E783C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 09:47:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O9lDsm000089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:47:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 24 Jul 2017 02:47:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 17:51:11 +0800
Message-ID: <2bebbefd55e678f0a873b78f9ba74f5bbd141055.1500889785.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1500889785.git.Qi.Chen@windriver.com>
References: <cover.1500889785.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] sudo: upgrade to 1.8.20p2
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
X-List-Received-Date: Mon, 24 Jul 2017 09:47:11 -0000
Content-Type: text/plain

The checksum for doc/LICENSE is changed, but the content only changes
year from '2013' to '2017', so the license remains the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                               | 2 +-
 meta/recipes-extended/sudo/{sudo_1.8.19p2.bb => sudo_1.8.20p2.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.19p2.bb => sudo_1.8.20p2.bb} (90%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index d42a04a..8c16d83 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=f600a47c2a2cdde5899e449607810ed1 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=652fb4334c13b511597d7940ef8b3323 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=cfe41112f96c19a074934d128f45c693 \
                     file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.19p2.bb b/meta/recipes-extended/sudo/sudo_1.8.20p2.bb
similarity index 90%
rename from meta/recipes-extended/sudo/sudo_1.8.19p2.bb
rename to meta/recipes-extended/sudo/sudo_1.8.20p2.bb
index a9659c3..4f24b3c 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.19p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.20p2.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "31a6090ed1d0946fa22cba19e86aafef"
-SRC_URI[sha256sum] = "237e18e67c2ad59ecacfa4b7707198b09fcf84914621585a9bc670dcc31a52e0"
+SRC_URI[md5sum] = "03da8e711caca6fd93e57751bfb74adc"
+SRC_URI[sha256sum] = "bd42ae1059e935f795c69ea97b3de09fe9410a58a74b5d5e6836eb5067a445d9"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.9.1


