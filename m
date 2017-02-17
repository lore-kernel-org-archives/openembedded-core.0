Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC4D5772E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 10:59:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1HAxG73020323
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 02:59:16 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 17 Feb 2017 02:59:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Feb 2017 18:59:24 +0800
Message-ID: <1f3643c5e63b1771dc73c89b8f69e794944bf284.1487329062.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1487329062.git.Qi.Chen@windriver.com>
References: <cover.1487329062.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] sudo: upgrade to 1.8.19p2
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
X-List-Received-Date: Fri, 17 Feb 2017 10:59:16 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                               | 2 +-
 meta/recipes-extended/sudo/{sudo_1.8.18p1.bb => sudo_1.8.19p2.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.18p1.bb => sudo_1.8.19p2.bb} (90%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index a25876b..d42a04a 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=c16e542408abda013d672be8eb88d174 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=f600a47c2a2cdde5899e449607810ed1 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=cfe41112f96c19a074934d128f45c693 \
                     file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.18p1.bb b/meta/recipes-extended/sudo/sudo_1.8.19p2.bb
similarity index 90%
rename from meta/recipes-extended/sudo/sudo_1.8.18p1.bb
rename to meta/recipes-extended/sudo/sudo_1.8.19p2.bb
index 95e1b84..deb60de 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.18p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.19p2.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "28f5214d5bcb5af5710decb95184a0a6"
-SRC_URI[sha256sum] = "e5a0471c721281a693025bbde33ebd9d3db43245d83ab8516bbfc23980379434"
+SRC_URI[md5sum] = "31a6090ed1d0946fa22cba19e86aafef"
+SRC_URI[sha256sum] = "237e18e67c2ad59ecacfa4b7707198b09fcf84914621585a9bc670dcc31a52e0"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.9.1


