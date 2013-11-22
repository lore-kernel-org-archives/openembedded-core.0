Return-Path: <mcrowe@brightsign.biz>
Received: from elite.brightsigndigital.co.uk
	(cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net [86.30.57.232])
	by mail.openembedded.org (Postfix) with ESMTP id 55E226D0CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:23:19 +0000 (UTC)
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Vjrde-0006Vg-Gx; Fri, 22 Nov 2013 14:23:18 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Vjrde-0002Cp-Fz; Fri, 22 Nov 2013 14:23:18 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 14:23:01 +0000
Message-Id: <1385130182-8421-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1385130182-8421-1-git-send-email-mac@mcrowe.com>
References: <1385129059-941-1-git-send-email-mac@mcrowe.com>
	<1385130182-8421-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] Revert "kernel.bbclass: move bundle_initramfs after kernel_link_vmlinux"
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
X-List-Received-Date: Fri, 22 Nov 2013 14:23:19 -0000

This reverts commit 3baa63b4d588c3262254528b406ede265dd117bf. It broke
builds that aren't using kernel-yocto.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 48999fe..ba13e67 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -152,7 +152,7 @@ python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_kernel_link_vmlinux before do_build
+addtask bundle_initramfs after do_compile before do_build
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-- 
1.7.10.4


