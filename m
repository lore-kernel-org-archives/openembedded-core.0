Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B56D277AFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 17:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHBCLk015494; Thu, 23 Mar 2017 17:11:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nikx7mfmSMn8; Thu, 23 Mar 2017 17:11:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHBAqB015473
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Mar 2017 17:11:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cr6GU-00029J-BN; Thu, 23 Mar 2017 17:11:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 17:11:06 +0000
Message-Id: <1490289067-8206-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490289067-8206-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490289067-8206-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/5] staging: Update extend_recipe_sysroot vardepsexclude after code changes
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
X-List-Received-Date: Thu, 23 Mar 2017 17:11:13 -0000

Changed were made to the code but not reflected in vardepsexclude, fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index f7a1707..6dd21e8 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -603,7 +603,7 @@ python extend_recipe_sysroot() {
 
     bb.utils.unlockfile(lock)
 }
-extend_recipe_sysroot[vardepsexclude] += "MACHINE SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
+extend_recipe_sysroot[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
 
 python do_prepare_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
-- 
2.7.4


