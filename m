Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 872807555E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 02:34:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w552Y68S010580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jun 2018 19:34:06 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 4 Jun 2018 19:34:06 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2018 22:32:59 -0400
Message-ID: <1528165980-163833-2-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1528165980-163833-1-git-send-email-hongzhi.song@windriver.com>
References: <1528165980-163833-1-git-send-email-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [meta][PATCH 1/2] meta runtime testcases: enable kernel-sample features for runtime tests
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
X-List-Received-Date: Tue, 05 Jun 2018 02:34:05 -0000
Content-Type: text/plain

Enable kernel-sample features by default with the machine of qemu.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 3bb872a..b7511e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -67,3 +67,6 @@ do_install_append(){
 addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
+
+# enable kernel-sample for oeqa/runtime/cases's ksample.py test
+KERNEL_FEATURES_append_qemuall=" features/kernel-sample/kernel-sample.scc"
-- 
2.8.1


