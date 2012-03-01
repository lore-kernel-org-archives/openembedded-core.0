Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S34je-0004c2-KJ for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 13:03:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21BtLHj015121
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 11:55:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13604-09 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 11:55:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21BtDFw015115
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 11:55:14 GMT
Message-ID: <1330602916.31767.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 11:55:16 +0000
In-Reply-To: <C2C41049-7169-4851-B07A-9CDDD5A5ED45@dominion.thruhere.net>
References: <cover.1330587785.git.sgw@linux.intel.com>
	<8166980a5f0696c1f88bce1fb9bdcff7089690b8.1330587785.git.sgw@linux.intel.com>
	<C2C41049-7169-4851-B07A-9CDDD5A5ED45@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libx11-trim/diet: Add RPROVIDES for libx11-dev
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
X-List-Received-Date: Thu, 01 Mar 2012 12:03:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have things that depend on libx11-dev, this patch ensures the -trim
and -diet versions provide it. This resolves some multiple providers
warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

Koen/Saul: This is how I think we should be fixing the libx11 issues...


diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
index 6106986..4bab148 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://x11_disable_makekeys.patch \
             file://fix-utf8-wrong-define.patch \
            "
 
+RPROVIDES_${PN}-dev = "libx11-dev"
 
 SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
 SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
index 3fd5d82..b2c753d 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
@@ -5,7 +5,7 @@ DESCRIPTION += " Support for XCMS is disabled in this version."
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
@@ -13,6 +13,7 @@ SRC_URI += "file://x11_disable_makekeys.patch \
             file://keysymdef_include.patch \
             file://makekeys_crosscompile.patch"
 
+RPROVIDES_${PN}-dev = "libx11-dev"
 
 SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
 SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"




