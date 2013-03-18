Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHPFD-0005zH-GB for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 02:52:12 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I1iP6B022683 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 01:44:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id U1OjY4y2WFwt
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 01:44:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I1iLDq022679
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 01:44:24 GMT
Message-ID: <1363570511.4315.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 01:35:11 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] valgrind: Fix case where ${B} != ${S}
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
X-List-Received-Date: Mon, 18 Mar 2013 01:52:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fix out of tree builds by referring to the build object in ${B}.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
index 75c3e73..ba42001 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
@@ -33,7 +33,7 @@ EXTRA_OEMAKE = "-w"
 PARALLEL_MAKE = ""
 
 do_install_append () {
-    install -m 644 ${S}/default.supp ${D}/${libdir}/valgrind/
+    install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
 }
 
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"




