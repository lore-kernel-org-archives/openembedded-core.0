Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF8BD705EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJl07022803
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:47 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:19:22 -0700
Message-ID: <67d8911bc85145bdb19b98eda51f4e90e5c2f2f3.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 27/38] libpam: add bash to RDEPENDS_libpam-xtests
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:46 -0000
Content-Type: text/plain

Bash scripts:
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_limits1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_access1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_unix4.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_access3.sh
libpam-xtests/usr/share/Linux-PAM/xtests/run-xtests.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack5.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_unix3.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_pwhistory1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_succeed_if1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_unix1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_unix2.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack2.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack4.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack3.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_access4.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_access2.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_assemble_line1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_group1.sh

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 3190aaf..789890d 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -72,8 +72,16 @@ libpam_suffix = "suffix${@get_multilib_bit(d)}"
 RPROVIDES_${PN} += "libpam-${libpam_suffix}"
 RPROVIDES_${PN}-runtime += "libpam-runtime-${libpam_suffix}"
 
-RDEPENDS_${PN}-runtime = "libpam-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
-RDEPENDS_${PN}-xtests = "libpam-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
+RDEPENDS_${PN}-runtime = "libpam-${libpam_suffix} \
+    pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} \
+    pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix} \
+    "
+RDEPENDS_${PN}-xtests = "libpam-${libpam_suffix} \
+    pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} \
+    pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} \
+    pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} \
+    coreutils bash \
+    "
 RRECOMMENDS_${PN} = "libpam-runtime-${libpam_suffix}"
 
 python populate_packages_prepend () {
-- 
1.7.9.5


