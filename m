Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E422B76209
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 02:09:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6N29mk1002892
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 19:09:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 22 Jul 2015 19:09:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jul 2015 10:10:45 +0800
Message-ID: <3e07b3cb41ab64e363d452c58a6e1418f219d19f.1437617250.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437617250.git.Qi.Chen@windriver.com>
References: <cover.1437617250.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] sudo: upgrade to 1.8.14p2
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
X-List-Received-Date: Thu, 23 Jul 2015 02:09:48 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                             | 2 +-
 meta/recipes-extended/sudo/{sudo_1.8.13.bb => sudo_1.8.14p2.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.13.bb => sudo_1.8.14p2.bb} (87%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index cdee6bb..462325f 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=346ce81ebf0f7f89fd379b40b6a4233b \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=c16e542408abda013d672be8eb88d174 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=cfe41112f96c19a074934d128f45c693 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://lib/util/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.13.bb b/meta/recipes-extended/sudo/sudo_1.8.14p2.bb
similarity index 87%
rename from meta/recipes-extended/sudo/sudo_1.8.13.bb
rename to meta/recipes-extended/sudo/sudo_1.8.14p2.bb
index 4494170..208ed42 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.13.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.14p2.bb
@@ -6,8 +6,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "f61577ec330ad1bd504c0e2eec6ea2d8"
-SRC_URI[sha256sum] = "e374e5edf2c11c00d6916a9f51cb0ad15e51c7b028370fa15169b07e61e05a25"
+SRC_URI[md5sum] = "150f6a2a53a5d29838bf75557543f151"
+SRC_URI[sha256sum] = "b4bca9cca52fc6a409709995014af5e9fb905a4a6c5bda977f78e568954dfe21"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.9.1


