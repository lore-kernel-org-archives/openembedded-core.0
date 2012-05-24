Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXV4d-0004H7-PX for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 12:15:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4OA55fi022360
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 11:05:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21227-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 11:05:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4OA4tF4022346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 11:04:56 +0100
Message-ID: <1337853894.8248.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 11:04:54 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] opkg-nogpg: add file path
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
X-List-Received-Date: Thu, 24 May 2012 10:15:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Paul Eggleton <paul.eggleton@linux.intel.com>

There was no explicit path in FILESPATH for this recipe to allow it to
find files referred to in SRC_URI (files shared with the standard opkg
recipe). This problem may have been masked by the fetcher behaviour of
looking for files last in DL_DIR, thus if opkg has been fetched
beforehand there would have been no error.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
b/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
index 259a60e..64a34f8 100644
--- a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
+++ b/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
@@ -3,6 +3,8 @@ require opkg_${PV}.bb
 DEPENDS = "curl"
 PROVIDES += "opkg"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/opkg-0.1.8:"
+
 EXTRA_OECONF += "--disable-gpg"
 
 DEFAULT_PREFERENCE = "-1"




