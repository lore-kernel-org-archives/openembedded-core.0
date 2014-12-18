Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE8C272784
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:53:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8rqww021978
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:53:52 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:53:52 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:51:05 +0800
Message-ID: <7608c388bda0bde8ecc5254bd21be584ec540aab.1418885581.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418885577.git.kai.kang@windriver.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/19] sysprof: disable build for aarch64
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
X-List-Received-Date: Thu, 18 Dec 2014 08:53:53 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

Add COMPATIBLE_HOST to the recipe and prohibit
building for aarch64 and aarch64_be.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-kernel/sysprof/sysprof_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index ef1e270..cfc814f 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -18,3 +18,8 @@ SRC_URI_append_mips64 = " file://rmb-mips.patch"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+# We do not yet work for aarch64.
+#
+COMPATIBLE_HOST = "^(?!aarch64).*"
+
-- 
1.9.1


