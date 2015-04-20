Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.228])
	by mail.openembedded.org (Postfix) with ESMTP id A8DD0738F4
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 18:43:38 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:49781]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge02 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id C9/73-18238-BD845355; Mon, 20 Apr 2015 18:43:39 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 14:43:32 -0400
Message-Id: <1429555412-18220-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
X-RR-Connecting-IP: 107.14.168.130:25
X-Cloudmark-Score: 0
Subject: [PATCHv2] util-linux: Add lastb to alternatives
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
X-List-Received-Date: Mon, 20 Apr 2015 18:43:42 -0000

util-linux creates lastb as a symlink to last during the build.
Just as other applications may provide last, other applications
may provide lastb.

Add alternatives designations for lastb to avoid installation
conflicts with other applications.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>

Conflicts:
	meta/recipes-core/util-linux/util-linux.inc
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 80065e3..60309a5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -174,7 +174,7 @@ do_install_append_class-native () {
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
-ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
+ALTERNATIVE_${PN} += "mkfs.minix hexdump last lastb logger mesg renice wall"
 ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
-- 
2.1.0


