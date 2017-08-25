Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2CE783AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 12:37:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7PCbbT1012493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 25 Aug 2017 13:37:38 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dlDrl-0002sv-RJ; Fri, 25 Aug 2017 13:37:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 13:37:37 +0100
Message-Id: <1503664657-11050-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 25 Aug 2017 13:37:38 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] bitbake.conf: Drop usage of build/BUILD_SYS and target/TARGET_SYS conf files
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
X-List-Received-Date: Fri, 25 Aug 2017 12:37:39 -0000

Its been highlighted that TARGET_SYS can be changed by MACHINE and DISTRO files
so this doesn't work at all today. build/ configuration files also don't see to
be used. Drop these forms of include files for those reasons and simplfy the code
slightly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 334ba23..d4ed894 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -729,10 +729,8 @@ include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
 require conf/multiconfig/${BB_CURRENT_MC}.conf
-include conf/build/${BUILD_SYS}.conf
 include conf/machine/${MACHINE}.conf
 include conf/machine-sdk/${SDKMACHINE}.conf
-include conf/target/${TARGET_SYS}.conf
 include conf/distro/${DISTRO}.conf
 include conf/distro/defaultsetup.conf
 include conf/documentation.conf
-- 
2.7.4


