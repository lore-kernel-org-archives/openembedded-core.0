Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A2B8F60119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 18:08:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u66I8EBD016782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 11:08:15 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 6 Jul 2016 11:08:13 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 11:08:13 -0700
Message-ID: <1467828493-24176-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] l3afpad: add check for GTK3DISTROFEATURES
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
X-List-Received-Date: Wed, 06 Jul 2016 18:08:14 -0000
Content-Type: text/plain

We want world builds without GTK3DISTROFEATURES to work.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-sato/l3afpad/l3afpad_git.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 1e7c82f..ccfda26 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -19,5 +19,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig distro_features_check
 
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
 EXTRA_OECONF = "--disable-emacs --disable-print"
 FILES_${PN} += "${datadir}/icons"
-- 
1.7.9.5


