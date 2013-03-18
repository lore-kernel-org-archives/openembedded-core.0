Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHNnF-0002x7-FI for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 01:19:16 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I0BRBh018299 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:11:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IujlWNzgt6Yc
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:11:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I0BMiq018295
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:11:25 GMT
Message-ID: <1363564932.4315.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 00:02:12 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] mesa-common: Fix confused variable assignment/comment
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
X-List-Received-Date: Mon, 18 Mar 2013 00:19:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its clear this was meant to be a prepend. Also fix an out
of date comment.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 1ff08fb..aa26aee 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -18,8 +18,8 @@ DEPENDS = "expat makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
-# for mesa-dri and mesa-xlib
-FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
+# for mesa-dri
+FILESEXTRAPATHS_prepend := "${THISDIR}/mesa:"
 
 inherit autotools pkgconfig pythonnative
 




