Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA3106AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 20:53:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5SKrMxP029150
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 13:53:22 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 28 Jun 2016 13:53:21 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<randy.macleod@windriver.com>
Date: Tue, 28 Jun 2016 13:53:21 -0700
Message-ID: <1467147201-31282-1-git-send-email-jslater@windriver.com>
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
X-List-Received-Date: Tue, 28 Jun 2016 20:53:26 -0000
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


