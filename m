Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDzA5-0001Nw-Af for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 15:47:57 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDmqcL005956 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:48:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l4u61rVwXi5a
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:48:52 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDmlwS005953
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:48:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 14:42:05 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318426933.23801.167.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] clutter-1.6: update to 1.6.18
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 13:47:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 345e2bbbb41830ea193c282691479add4a00b0d8 Mon Sep 17 00:00:00 2001
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 12 Oct 2011 13:15:11 +0000
Subject: 

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb
index 555133f..9c32efd 100644
--- a/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb
@@ -22,5 +22,5 @@ do_configure_prepend () {
 	sed -i -e 's/^DOLT//' ${S}/configure.ac
 }
 
-SRC_URI[md5sum] = "1da9f983115f9bd28b0be8176e53fe36"
-SRC_URI[sha256sum] = "0564e57ca8eb24e76014627c0bb28a80a6c01b620ba14bc4198365562549576d"
+SRC_URI[md5sum] = "7302513c96b00588b7779918fae0b33b"
+SRC_URI[sha256sum] = "d849f92944be193e9d8e707f1371e6bab7fca473e09a492265e2e2296febd749"




