Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 905 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 Feb 2016 16:03:38 UTC
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id D97EA7725C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 16:03:38 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 682177721; Mon, 01 Feb 2016 10:48:34 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQGiN-000C0O-4B; Mon, 01 Feb 2016 15:48:31 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQGiN-0002dV-3h; Mon, 01 Feb 2016 15:48:31 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 15:48:26 +0000
Message-Id: <1454341706-10089-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454341706-10089-1-git-send-email-mac@mcrowe.com>
References: <1454341706-10089-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [RESEND PATCH 2/2] util-linux: use ALTERNATIVE mechanism to manage 'nologin'
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
X-List-Received-Date: Mon, 01 Feb 2016 16:03:41 -0000

Both shadow and util-linux provide 'nologin' command, so use the
ALTERNATIVE mechanism in OE to manage it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Originally submitted by Chen Qi in
<eec4166509e494d1e0e6e36798eb4f5ebeec312f.1416554582.git.Qi.Chen@windriver.com>
I've just rebased it and fixed up the conflicts.

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f57284b..7ab8aeb 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -188,7 +188,7 @@ ALTERNATIVE_PRIORITY = "50"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last lastb logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
+ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -199,6 +199,7 @@ ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
+ALTERNATIVE_LINK_NAME[nologin] = "${sbindir}/nologin"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3"
 
-- 
2.1.4


