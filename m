Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYHLo-0001is-7K for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 15:20:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADE6XMA004383
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 14:06:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04019-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 14:06:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADE6NFL004377
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 14:06:24 GMT
Message-ID: <1352815584.24487.125.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Nov 2012 14:06:24 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] python.inc: make lsb override more concise
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
X-List-Received-Date: Tue, 13 Nov 2012 14:20:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

No functionality change, just a readability improvement

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index eee7a64..d0ed55b 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -16,6 +16,9 @@ PYTHON_MAJMIN = "2.7"
 
 inherit autotools
 
+PYTHONLSBOPTS = "--with-wctype-functions"
+PYTHONLSBOPTS_linuxstdbase = "ac_cv_sizeof_off_t=8"
+
 EXTRA_OECONF = "\
   --with-threads \
   --with-pymalloc \
@@ -24,14 +27,5 @@ EXTRA_OECONF = "\
   --with-signal-module \
   --with-wctype-functions \
   --enable-shared \
-"
-
-EXTRA_OECONF_linuxstdbase = "\
-  --with-threads \
-  --with-pymalloc \
-  --with-cyclic-gc \
-  --without-cxx \
-  --with-signal-module \
-  --enable-shared \
-  ac_cv_sizeof_off_t=8 \
+  ${PYTHONLSBOPTS} \
 "




