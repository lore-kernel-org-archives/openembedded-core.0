Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECE46F301
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:15:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1RMF8f6001281 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:15:08 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kmz-98XukzlC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:15:08 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1RMF5PN001275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:15:06 GMT
Message-ID: <1393539297.31769.190.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Feb 2014 22:14:57 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] webkit-gtk: Fix separate builddir support
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
X-List-Received-Date: Thu, 27 Feb 2014 22:15:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index cd571b1..3db8e6d 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -85,7 +85,7 @@ CONFIGUREOPT_DEPTRACK = ""
 
 do_configure_append() {
 	# somethings wrong with icu, fix it up manually
-	for makefile in $(find ${S} -name "GNUmakefile") ; do
+	for makefile in $(find ${B} -name "GNUmakefile") ; do
 		sed -i s:-I/usr/include::g $makefile
 	done
 }



