Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B79F171995
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 15:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqMuF019020; Mon, 6 Feb 2017 15:52:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XC8nTIntLvY3; Mon,  6 Feb 2017 15:52:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqGw7019002
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 6 Feb 2017 15:52:17 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1calaS-00026o-CL; Mon, 06 Feb 2017 15:52:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 15:52:14 +0000
Message-Id: <1486396334-8039-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/6] staging: Add missing parameter to debug message
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
X-List-Received-Date: Mon, 06 Feb 2017 15:52:24 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 0cb46bf..0752009 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -464,7 +464,7 @@ python extend_recipe_sysroot() {
                 taskdeps[datadep] = setscenedeps[datadep][:2]
                 retval = setscene_depvalid(datadep, taskdeps, [], d, msgbuf)
                 if retval:
-                    msgbuf.append("Skipping setscene dependency %s for installation into the sysroot")
+                    msgbuf.append("Skipping setscene dependency %s for installation into the sysroot" % datadep)
                     continue
                 done.append(datadep)
                 new.append(datadep)
-- 
2.7.4


