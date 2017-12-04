Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83DFB7858B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:24:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB4AOJO8010835
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Dec 2017 02:24:20 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Dec 2017 02:24:19 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Dec 2017 18:25:36 +0800
Message-ID: <6738f34a7fff628636b703f8534af6feb55b099d.1512383059.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1512383059.git.Qi.Chen@windriver.com>
References: <cover.1512383059.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] coreutils: upgrade to 8.28
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
X-List-Received-Date: Mon, 04 Dec 2017 10:24:19 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../coreutils/{coreutils_8.27.bb => coreutils_8.28.bb}            | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_8.27.bb => coreutils_8.28.bb} (95%)

diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb b/meta/recipes-core/coreutils/coreutils_8.28.bb
similarity index 95%
rename from meta/recipes-core/coreutils/coreutils_8.27.bb
rename to meta/recipes-core/coreutils/coreutils_8.28.bb
index ea8740a..0543ceb 100644
--- a/meta/recipes-core/coreutils/coreutils_8.27.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.28.bb
@@ -23,10 +23,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
           "
 
-SRC_URI[tarball.md5sum] = "502795792c212932365e077946d353ae"
-SRC_URI[tarball.sha256sum] = "8891d349ee87b9ff7870f52b6d9312a9db672d2439d289bc57084771ca21656b"
-SRC_URI[manpages.md5sum] = "1b31a688d06764e0e94aa20b7ea08222"
-SRC_URI[manpages.sha256sum] = "1f615819e9167646c731636b6c5ecbe79837e82a18666bacc82c3fb1dfcfaea3"
+SRC_URI[tarball.md5sum] = "e7cb20d0572cc40d9f47ede6454406d1"
+SRC_URI[tarball.sha256sum] = "1117b1a16039ddd84d51a9923948307cfa28c2cea03d1a2438742253df0a0c65"
+SRC_URI[manpages.md5sum] = "3a7c626aad1c9077f254e5c2553a2f60"
+SRC_URI[manpages.sha256sum] = "d72c3fa79ae328a4fd1107102e8946755aa2e908044e1efcf1e71ef206dca042"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
-- 
1.9.1


