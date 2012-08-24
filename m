Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4vwc-000599-Ox for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 17:37:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OFP3ex014112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 16:25:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11916-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 16:24:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OFOsWc014101
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 16:24:56 +0100
Message-ID: <1345821896.14369.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 16:24:56 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] mutter: Explictly disable libcanberra
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
X-List-Received-Date: Fri, 24 Aug 2012 15:37:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its not listed in DEPENDS, this ensures build reproducibility.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/mutter/mutter.inc b/meta/recipes-graphics/mutter/mutter.inc
index 27cf413..da78827 100644
--- a/meta/recipes-graphics/mutter/mutter.inc
+++ b/meta/recipes-graphics/mutter/mutter.inc
@@ -12,6 +12,7 @@ ALTERNATIVE_PRIORITY = "11"
 EXTRA_OECONF += "--disable-verbose	\
 	         --disable-xinerama	\
 	         --without-introspection \
+	         --without-libcanberra \
 		 --with-clutter"
 
 #RDEPENDS_${PN} = "zenity"




