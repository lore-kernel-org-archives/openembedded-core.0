Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1USqBG-0005Fs-HX
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 16:51:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IEXZN2009788; Thu, 18 Apr 2013 15:34:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZNbiOMKa9h1m; Thu, 18 Apr 2013 15:34:18 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IEYErY009800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 18 Apr 2013 15:34:15 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1USpu2-0001Dd-80; Thu, 18 Apr 2013 15:33:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 15:33:27 +0100
Message-Id: <1366295611-4646-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366295611-4646-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1366295611-4646-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/6] multilib: Ensure we map the USERADD_PACKAGES variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2013 14:52:09 -0000

If we don't do this, multilib packages don't have any code
added to the postinstalls to handle user additions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 3cc470e..4dbec73 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -100,6 +100,7 @@ python __anonymous () {
     clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
     clsextend.map_variable("PACKAGE_INSTALL")
     clsextend.map_variable("INITSCRIPT_PACKAGES")
+    clsextend.map_variable("USERADD_PACKAGES")
 }
 
 PACKAGEFUNCS_append = "do_package_qa_multilib"
-- 
1.7.10.4



