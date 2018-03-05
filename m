Return-Path: <lars.persson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8900A789BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 12:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 53A07182AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:30:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id JohEGCW1m1jh
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:30:55 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id E36E218107
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:30:55 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3F541E078
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:30:55 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8DE61E075
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:30:55 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:30:55 +0100 (CET)
Received: from lnxlarper1.se.axis.com (lnxlarper1.se.axis.com [10.88.41.2])
	by seth.se.axis.com (Postfix) with ESMTP id ACB9F272F;
	Mon,  5 Mar 2018 13:30:55 +0100 (CET)
Received: by lnxlarper1.se.axis.com (Postfix, from userid 20456)
	id A63F28DD9F; Mon,  5 Mar 2018 13:30:55 +0100 (CET)
From: Lars Persson <lars.persson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 13:30:54 +0100
Message-Id: <20180305123054.12418-1-larper@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Lars Persson <larper@axis.com>
Subject: [PATCH] util-linux: add taskset to alternatives list
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
X-List-Received-Date: Mon, 05 Mar 2018 12:30:55 -0000

The taskset command is provided by both busybox and util-linux.

Signed-off-by: Lars Persson <larper@axis.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 248e8bee95..e228bde299 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -204,7 +204,7 @@ ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
 ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin"
+ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
-- 
2.11.0


