Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0EB6D9AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 06:36:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL6aRfh019125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 22:36:27 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 20 Nov 2013 22:36:27 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 14:36:32 +0800
Message-ID: <1385015792-19943-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] libidn: enable TLD
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
X-List-Received-Date: Thu, 21 Nov 2013 06:36:28 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

enable TLD, and other releases always enable it

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-extended/libidn/libidn_0.6.14.bb |    2 --
 meta/recipes-extended/libidn/libidn_1.28.bb   |    2 --
 2 files changed, 4 deletions(-)

diff --git a/meta/recipes-extended/libidn/libidn_0.6.14.bb b/meta/recipes-extended/libidn/libidn_0.6.14.bb
index 5352b41..a13ed27 100644
--- a/meta/recipes-extended/libidn/libidn_0.6.14.bb
+++ b/meta/recipes-extended/libidn/libidn_0.6.14.bb
@@ -16,8 +16,6 @@ SRC_URI = "http://alpha.gnu.org/gnu/libidn/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "040f012a45feb56168853998bb87ad4d"
 SRC_URI[sha256sum] = "98910c2ad664bdf4eed2c2fff88e24f8882636ec9d26669366ff03b469c05ae3"
 
-EXTRA_OECONF = " --disable-tld"
-
 do_configure_prepend() {
 	# this version of libidn copies AC_USE_SYSTEM_EXTENSIONS from 
 	# autoconf CVS because atm the autoconf it uses is a bit old
diff --git a/meta/recipes-extended/libidn/libidn_1.28.bb b/meta/recipes-extended/libidn/libidn_1.28.bb
index e253be4..5daff43 100644
--- a/meta/recipes-extended/libidn/libidn_1.28.bb
+++ b/meta/recipes-extended/libidn/libidn_1.28.bb
@@ -27,8 +27,6 @@ SRC_URI[sha256sum] = "dd357a968449abc97c7e5fa088a4a384de57cb36564f9d4e0d898ecc63
 PACKAGES =+ "idn"
 FILES_idn = "${bindir}/*"
 
-EXTRA_OECONF = " --disable-tld"
-
 do_install_append() {
 	rm -rf ${D}${libdir}/Libidn.dll
 	rm -rf ${D}${datadir}/emacs
-- 
1.7.10.4


