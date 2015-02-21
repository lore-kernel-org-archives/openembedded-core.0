Return-Path: <holger@moiji-mobile.com>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id 55E30732B1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 20:13:55 +0000 (UTC)
Received: from sangmingze-mail.local (ip5b42f21c.dynamic.kabel-deutschland.de
	[91.66.242.28])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 93A61ABB07
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 20:13:51 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=sangmingze-mail.local)
	by sangmingze-mail.local with esmtp (Exim 4.84)
	(envelope-from <holger@moiji-mobile.com>) id 1YPGQX-0005Ib-30
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Feb 2015 21:13:25 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Feb 2015 21:13:07 +0100
Message-Id: <1424549588-20334-1-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] busybox:udhcpc: Start with a metric of 10 for routes
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
X-List-Received-Date: Sat, 21 Feb 2015 20:14:00 -0000

Linux allows to install multiple default routes with
different metrics. Start with a metric above 0 to
allow other parts of the system to install routes
with a lower metric.

Signed-off-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>
---
 meta/recipes-core/busybox/files/simple.script | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 757e487..b294d57 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -56,7 +56,7 @@ case "$1" in
                                 fi
 			fi
 
-			metric=0
+			metric=10
 			for i in $router ; do
                                 if [ $have_bin_ip -eq 1 ]; then
                                         ip route add default via $i metric $metric
-- 
2.1.4


