Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3D4372FD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 01:44:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1M1iX3s028674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:44:34 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Feb 2017 17:44:33 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2017 17:44:27 -0800
Message-ID: <291170734b440839f8539fc8b8368c32ea381530.1487727826.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1487727826.git.liezhi.yang@windriver.com>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] guile: 2.0.13 -> 2.0.14
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
X-List-Received-Date: Wed, 22 Feb 2017 01:44:33 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/guile/{guile_2.0.13.bb => guile_2.0.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/guile/{guile_2.0.13.bb => guile_2.0.14.bb} (97%)

diff --git a/meta/recipes-devtools/guile/guile_2.0.13.bb b/meta/recipes-devtools/guile/guile_2.0.14.bb
similarity index 97%
rename from meta/recipes-devtools/guile/guile_2.0.13.bb
rename to meta/recipes-devtools/guile/guile_2.0.14.bb
index c29e7528599..e0350e4aa4b 100644
--- a/meta/recipes-devtools/guile/guile_2.0.13.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.14.bb
@@ -24,8 +24,8 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://libguile-Makefile.am-hook.patch \
            "
 
-SRC_URI[md5sum] = "d50bbb19672b72aa1e1c96e8f024bf00"
-SRC_URI[sha256sum] = "3744f2addc282a0de627aaef048f062982b44564d54ac31ff5217972529ed88b"
+SRC_URI[md5sum] = "c64977c775effd19393364b3018fd8cd"
+SRC_URI[sha256sum] = "e8442566256e1be14e51fc18839cd799b966bc5b16c6a1d7a7c35155a8619d82"
 
 inherit autotools gettext pkgconfig texinfo
 BBCLASSEXTEND = "native"
-- 
2.11.0.rc2.dirty


