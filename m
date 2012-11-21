Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tb7Wn-0006mw-CT for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 11:27:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qALADSQ1013876;
	Wed, 21 Nov 2012 10:13:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12353-05; Wed, 21 Nov 2012 10:13:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qALADJvt013870
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 21 Nov 2012 10:13:21 GMT
Message-ID: <1353492799.10459.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2012 10:13:19 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] multilib.bbclass: Drop populate_sdk_base exclusion
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
X-List-Received-Date: Wed, 21 Nov 2012 10:27:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With this recently introduced exclusion, <multilib>-meta-toolchain-sdk
throws errors about missing DEPENDS that don't exist since it needs the
PROVIDES/DEPENDS remapping. This patch tweaks the class tests to fix
the errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index c249925..b379754 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -73,7 +73,7 @@ python __anonymous () {
         clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK")
         clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY")
 
-    if bb.data.inherits_class('image', d) or bb.data.inherits_class('populate_sdk_base', d):
+    if bb.data.inherits_class('image', d):
         return
 
     clsextend.map_depends_variable("DEPENDS")




