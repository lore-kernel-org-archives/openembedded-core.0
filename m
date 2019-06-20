Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 768557E7D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 07:52:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5K7qn7h009000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 00:52:49 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 00:52:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2019 16:15:23 +0800
Message-ID: <b0d4e2fd7162cf0b181d3a969418757a4e62fd72.1561018476.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561018476.git.liezhi.yang@windriver.com>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] linux-dummy: Add do_compile_kernelmodules
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
X-List-Received-Date: Thu, 20 Jun 2019 07:52:48 -0000
Content-Type: text/plain

Fixed:
PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"

$ bitbake world
ERROR: Task do_compile in make-mod-scripts_1.0.bb depends upon non-existent task do_compile_kernelmodules in linux-dummy.bb
ERROR: Command execution failed: Exited with 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index e1c7f76..62cf6f5 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -39,6 +39,10 @@ do_compile () {
 	:
 }
 
+do_compile_kernelmodules() {
+    :
+}
+
 do_shared_workdir () {
 	:
 }
@@ -58,3 +62,4 @@ do_deploy() {
 addtask bundle_initramfs after do_install before do_deploy
 addtask deploy after do_install
 addtask shared_workdir after do_compile before do_install
+addtask compile_kernelmodules
-- 
2.7.4


