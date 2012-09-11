Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBRbb-0007UK-9x for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 16:38:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8BEPh3m010393
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 15:25:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09947-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 15:25:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8BEPagD010387
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 15:25:36 +0100
Message-ID: <1347373537.2122.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 15:25:37 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libgpg-error: Use the source file for the licence checksum
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
X-List-Received-Date: Tue, 11 Sep 2012 14:38:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It makes sense to us the license checksum from the source .in file rather
than that from the generated file which configure can change (or remove).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
index 8186236..64b50b9 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h;endline=23;md5=83c16c8f5cea85affa1ff270a6f4fcff \
+                    file://src/gpg-error.h.in;endline=23;md5=508c78081f11544da0fbb8c95913a301 \
                     file://src/init.c;endline=20;md5=b69742f2a8827d494c6f6a4b1768416c"
 
 




