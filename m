Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E68686A5A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:42:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7NHgdQa007829
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:42:39 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 23 Aug 2013 10:42:38 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2013 10:42:38 -0700
Message-ID: <1377279758-18920-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [v2][PATCH 1/1] libpam: add PACKAGECONFIG data concerning audit
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
X-List-Received-Date: Fri, 23 Aug 2013 17:42:38 -0000
Content-Type: text/plain

We do not want libpam to build using audit just
because it happens to be lying around, so we
create PACKAGECONFIG[] data to give us explicit
control.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 3d8999d..448a67b 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -47,6 +47,8 @@ S = "${WORKDIR}/Linux-PAM-${PV}"
 
 inherit autotools gettext pkgconfig
 
+PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
+
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES_${PN} = "${base_libdir}/lib*${SOLIBS}"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug \
-- 
1.7.3.4


