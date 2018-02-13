Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C8308782E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 05:48:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37020277"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Feb 2018 13:48:35 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C56548AE761
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 13:48:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 13 Feb 2018 13:48:32 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Feb 2018 13:48:41 +0800
Message-ID: <1518500921-19848-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 7C56548AE761.A5531
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sudo: 1.8.21P1 -> 1.8.22
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
X-List-Received-Date: Tue, 13 Feb 2018 05:48:35 -0000
Content-Type: text/plain

1.Upgrade sudo from 1.8.21P1 to 1.8.22.
2.Update the checksum of LIC_FILES_CHKSUM.
  The following content is appended to doc/LICENSE, plugins/sudoers/redblack.c.

    Todd C. Miller <Todd.Miller@courtesan.com> -> Todd C. Miller <Todd.Miller@sudo.ws>

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/sudo/sudo.inc                             | 4 ++--
 meta/recipes-extended/sudo/{sudo_1.8.21p2.bb => sudo_1.8.22.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.21p2.bb => sudo_1.8.22.bb} (90%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 80ec0ae..362bd3a 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=652fb4334c13b511597d7940ef8b3323 \
-                    file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=cfe41112f96c19a074934d128f45c693 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
+                    file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=805782a8466975716f8376b2be9aedde \
                     file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://lib/util/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.21p2.bb b/meta/recipes-extended/sudo/sudo_1.8.22.bb
similarity index 90%
rename from meta/recipes-extended/sudo/sudo_1.8.21p2.bb
rename to meta/recipes-extended/sudo/sudo_1.8.22.bb
index acd0025..9150178 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.21p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.22.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "cd3993d910c713ae72e94beebd230b22"
-SRC_URI[sha256sum] = "74c5746cd33a814e2431c39faf0d76f7f8a697379bd073862e3b156cf0d76368"
+SRC_URI[md5sum] = "24abdea48db4c5abcd410167c801cc8c"
+SRC_URI[sha256sum] = "7256cb27c20883b14360eddbd17f98922073d104b214cf65aeacf1d9c9b9fd02"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.7.4




