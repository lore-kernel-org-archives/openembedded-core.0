Return-Path: <joe.slater@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 273EA6B5A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 20:07:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7GK7T1b000594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 16:07:29 -0400 (EDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 13:07:29 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 13:07:27 -0700
Message-ID: <1376683648-21673-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [v3][PATCH 1/2] coreutils: add PACKAGECONFIG info for acl support
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
X-List-Received-Date: Fri, 16 Aug 2013 20:07:31 -0000
Content-Type: text/plain

Sent to oe-core.  Updates GPLv2 version of coreutils.  They also want
patches for other packages that might use act.

CQID: 430353

Add configuration data to enable acl support if
it is a distro feature.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index c0778ba..2654028 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -32,6 +32,17 @@ SRC_URI_class-native = "${SRC_URI_BASE}"
 SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
 SRC_URI[sha256sum] = "89c2895ad157de50e53298b22d91db116ee4e1dd3fdf4019260254e2e31497b0"
 
+
+# acl is not a default feature
+#
+PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG_class-native ??= ""
+
+# with, without, depends, rdepends
+#
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
+
+
 # [ gets a special treatment and is not included in this
 bindir_progs = "base64 basename cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
-- 
1.7.3.4


