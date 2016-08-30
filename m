Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5EE60746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 08:24:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7U8OXMW026598
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 01:24:33 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 01:24:32 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2016 16:08:51 +0800
Message-ID: <20160830080851.29283-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] meta-ide-support: set noexec for tasks
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
X-List-Received-Date: Tue, 30 Aug 2016 08:24:35 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The recipe is to generate an environment script in
do_populate_ide_support for using an IDE, the tasks
listed are not needed, so set 'noexec' for them.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/meta/meta-ide-support.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 86c57cd..ee87a45 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -9,6 +9,19 @@ PR = "r3"
 
 inherit meta toolchain-scripts
 
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_deb[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
+
 do_populate_ide_support () {
   toolchain_create_tree_env_script
 }
-- 
2.7.4


