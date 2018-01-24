Return-Path: <hainsvdbosch@ziggo.nl>
Received: from smtpq3.tb.mail.iss.as9143.net (smtpq3.tb.mail.iss.as9143.net
	[212.54.42.166])
	by mail.openembedded.org (Postfix) with ESMTP id EE0217876D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 10:32:53 +0000 (UTC)
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
	by smtpq3.tb.mail.iss.as9143.net with esmtp (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>) id 1eeHzf-0001vP-KF
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Jan 2018 11:09:23 +0100
Received: from 524978c1.cm-4-2b.dynamic.ziggo.nl ([82.73.120.193]
	helo=localhost.localdomain)
	by smtp7.tb.mail.iss.as9143.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>)
	id 1eeHzf-0005fh-HC; Wed, 24 Jan 2018 11:09:23 +0100
From: Hains van den Bosch <hainsvdbosch@ziggo.nl>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jan 2018 11:08:54 +0100
Message-Id: <20180124100855.4551-1-hainsvdbosch@ziggo.nl>
X-Mailer: git-send-email 2.15.1
X-SourceIP: 82.73.120.193
X-Authenticated-Sender: hainsvdbosch@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=JJMVTfCb c=1 sm=1 tr=0
	a=Q7YWMR2eS1SS1617XCK1UA==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19
	a=RgaUWeydRksA:10 a=FP58Ms26AAAA:8 a=owKgz8PGAg_C-DH5x5QA:9
	none
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Subject: [meta-oe][PATCH 1/2] smbnetfs: update to version 0.6.1
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
X-List-Received-Date: Wed, 24 Jan 2018 10:32:54 -0000

---
 .../recipes-filesystems/smbnetfs/smbnetfs/configure.patch             | 2 +-
 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
index 152507cf3..55275669b 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
@@ -3,7 +3,7 @@ Index: git/configure.in
 --- git.orig/configure.ac	2014-06-18 16:06:16.040721349 +0000
 +++ git/configure.ac	2014-07-18 07:49:17.085552256 +0000
 @@ -1,5 +1,5 @@
- AC_INIT([SMBNetFS],[0.6.0])
+ AC_INIT([SMBNetFS],[0.6.1])
 -AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([foreign])
  AC_CONFIG_HEADERS([src/config.h])
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index 0fcfd6ae7..fefc04538 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -15,14 +15,14 @@ inherit autotools gitpkgv pkgconfig
 
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "21c63ed60202e5540613d4c822a57a0b81764499"
+SRCREV = "bc6b94b015fdaf7c4dab56ccb996eecea8bc4373"
 
 SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
            file://configure.patch \
            file://Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
+PACKAGECONFIG[libsecret] = "--with-libsecret=yes,--with-libsecret=no,libsecret"
 
 S = "${WORKDIR}/git"
 
-- 
2.15.1


