Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09E98784F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 16:22:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w16GM7b5003383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Feb 2018 08:22:07 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Feb 2018 08:22:03 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Feb 2018 11:21:56 -0500
Message-ID: <fd1a8052840bae8f09adcb39de91716f0182ccd3.1517931042.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1517931042.git.bruce.ashfield@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] lttng-modules: update to v2.10.5 for kernel 4.15
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
X-List-Received-Date: Tue, 06 Feb 2018 16:22:06 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../lttng/{lttng-modules_2.10.4.bb => lttng-modules_2.10.5.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.4.bb => lttng-modules_2.10.5.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb
index dd695f835d12..370b78aae146 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
 "
 
-SRC_URI[md5sum] = "832452b321a4df6836549e72d05b2ce9"
-SRC_URI[sha256sum] = "f918e3b890f378f47a9ba8710ff52590e9b1d9c63b12a0e64d138e2e2e1b3c8a"
+SRC_URI[md5sum] = "4aaabaafd15d9455c83972e26ccfbca7"
+SRC_URI[sha256sum] = "b8dbbbee45a673c381f51b99c555e36655c3c2c7a5477aab927591cc7f003a1f"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.5.0


