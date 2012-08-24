Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4utd-0002lU-JG for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 16:30:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OEHsoY013824
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 15:17:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12212-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 15:17:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OEHjE9013818
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 15:17:46 +0100
Message-ID: <1345817867.14369.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 15:17:47 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] xev: Add missing dependencies on libxrandr and xproto
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
X-List-Received-Date: Fri, 24 Aug 2012 14:30:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.0.bb b/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
index b340409..8d45e2e 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
@@ -4,6 +4,8 @@ DESCRIPTION = "X Event Viewer"
 LICENSE = "MIT"
 PE = "1"
 
+DEPENDS += "libxrandr xproto"
+
 SRC_URI += "file://diet-x11.patch"
 
 SRC_URI[md5sum] = "2727c72f3eba0c23f8f6b2e618d195a2"




