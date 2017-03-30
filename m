Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4822277C31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2U9ZNEl030611; 
	Thu, 30 Mar 2017 10:35:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OSJyNuYu4ZN9; Thu, 30 Mar 2017 10:35:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2U9Zc9Q030672
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 10:35:39 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ctWUU-0005ko-GU; Thu, 30 Mar 2017 10:35:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 10:35:36 +0100
Message-Id: <1490866536-22063-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490866536-22063-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490866536-22063-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] bitbake.conf: Drop MULTIMACH_HOST_SYS
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
X-List-Received-Date: Thu, 30 Mar 2017 09:35:40 -0000

There are no users of this left after recipe specfic sysroots was implemented,
drop the variable as it no longer makes sense or is useful.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d756af4..5e98d45 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -150,7 +150,6 @@ PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 PACKAGE_ARCHS[vardepsexclude] = "MACHINE_ARCH"
 
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-MULTIMACH_HOST_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 ##################################################################
 # Date/time variables.
-- 
2.7.4


