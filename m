Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.231])
	by mail.openembedded.org (Postfix) with ESMTP id 9744672E49
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:07:48 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:49722]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge03 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id A8/CF-29784-34615355; Mon, 20 Apr 2015 15:07:47 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 11:07:38 -0400
Message-Id: <1429542458-4291-3-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429542458-4291-1-git-send-email-bevenson@melinkcorp.com>
References: <1429542458-4291-1-git-send-email-bevenson@melinkcorp.com>
X-RR-Connecting-IP: 107.14.168.142:25
X-Cloudmark-Score: 0
Subject: [PATCH 2/2] util-linux: Add lastb to alternatives
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
X-List-Received-Date: Mon, 20 Apr 2015 15:07:48 -0000

util-linux creates lastb as a symlink to last during the build.
Just as other applications may provide last, other applications
may provide lastb.

Add alternatives designations for lastb to avoid installation
conflicts with other applications.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 2c299e8..78cff02 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -168,7 +168,7 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
-ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
+ALTERNATIVE_${PN} += "mkfs.minix hexdump last lastb logger mesg renice wall"
 ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject getopt sulogin"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
-- 
2.1.0


