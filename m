Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 90E3165CE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:04:23 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 9CA28284FC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 13:04:23 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 13:04:16 +0200
Message-Id: <1410174256-3263-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] kernel.bbclass: handle .dsp firmware
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
X-List-Received-Date: Mon, 08 Sep 2014 11:04:26 -0000

A few firmware files use this filename extension, like korg/k1212.dsp .
Create respective packages.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b02036f..4710719 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -387,6 +387,7 @@ python split_kernel_packages () {
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.dsp$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 do_strip() {
-- 
1.9.1


