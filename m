Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7A106FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:10:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3D9AHFd016650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:10:17 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Apr 2016 02:10:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Apr 2016 02:10:15 -0700
Message-ID: <cd4b0f6aec63cbbdbd75e056500b7b6e5af74ff2.1460538591.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1460538591.git.liezhi.yang@windriver.com>
References: <cover.1460538591.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] buildtools-tarball.bb: set TOOLCHAIN_NEED_CONFIGSITE_CACHE to null
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
X-List-Received-Date: Wed, 13 Apr 2016 09:10:19 -0000
Content-Type: text/plain

buildtools-tarball doesn't need config site, set
TOOLCHAIN_NEED_CONFIGSITE_CACHE to null so that no target recipes will
be built when bitbake buildtools-tarball.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 9e05390..7186ac4 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -64,3 +64,6 @@ create_sdk_files_append () {
 		echo '[ $? != 0 ] && export BB_ENV_EXTRAWHITE="NO32LIBS $BB_ENV_EXTRAWHITE"' >>$script
 	fi
 }
+
+# buildtools-tarball doesn't need config site
+TOOLCHAIN_NEED_CONFIGSITE_CACHE = ""
-- 
2.8.0


