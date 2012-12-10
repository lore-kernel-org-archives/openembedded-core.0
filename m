Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1Ti4wA-0007jk-5K
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 16:06:30 +0100
Received: by mail-wi0-f179.google.com with SMTP id o1so1194749wic.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=5t1TilzVf0OWYzNLa/vRblCzW5O3tcP2Nce/RXUeTc4=;
	b=HBQD0kSjfDyTSpuU5SKzaFGTrpWvDYjKrSB5I30oLGuHf45SGcv1Y0zEiBsWwqTfh6
	jVsYDTMtt3yZIllnzmENxGBA4x9DaBqUeHs8WQOQELjrhO+W9LETM2vCHZmCoAL8qhUw
	QDd79AY4pqsSbFJb2UVmbQxCAW6T1d693PnYjBLU8/nFtZpNoqcAxwMuDFKUDeaGSF9H
	a4WIMz/pK2ew/OYmOfTALNhB8ahdBT1saS1O9IFoNEmFTq/Wfjh8MeTZ1K0JcjyvxE/g
	mU5ssLqwm6uM5bAGmIJIupcvWiJp7/xkGQ0/m/7lME0zo6plu9vB9NBsbmA32oaMV0Dj
	Hg/Q==
Received: by 10.180.107.130 with SMTP id hc2mr10111329wib.12.1355151119370;
	Mon, 10 Dec 2012 06:51:59 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id u6sm11843592wif.2.2012.12.10.06.51.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 06:51:58 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 19:51:20 +0500
Message-Id: <1355151081-4889-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <fahad_usman@mentor.com>
References: <fahad_usman@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH 1/2] libpcre: upgrade to 8.32
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
X-List-Received-Date: Mon, 10 Dec 2012 15:06:30 -0000

- Also improve description
- Add summary and homepage

Signed-off-by: Christopher Larson <chris_larson@mentor.com>

- the patch was imported from meta-mentor layer on yoctoproject git server
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
62f819b97e356c1d7468fbccbf3a3ceed78b09a8

- broken up the original patch in two parts, this first part upgrades the
version to 8.32

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 .../libpcre/{libpcre_8.31.bb => libpcre_8.32.bb}   |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.31.bb => libpcre_8.32.bb} (74%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.31.bb b/meta/recipes-support/libpcre/libpcre_8.32.bb
similarity index 74%
rename from meta/recipes-support/libpcre/libpcre_8.31.bb
rename to meta/recipes-support/libpcre/libpcre_8.32.bb
index e1dad8b..b6847e8 100644
--- a/meta/recipes-support/libpcre/libpcre_8.31.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.32.bb
@@ -1,9 +1,9 @@
-DESCRIPTION = "Perl-compatible regular expression library. PCRE has its own native \
-API, but a set of 'wrapper' functions that are based on the POSIX API \
-are also supplied in the library libpcreposix. Note that this just \
-provides a POSIX calling interface to PCRE; the regular expressions \
-themselves still follow Perl syntax and semantics. The header file for \
-the POSIX-style functions is called pcreposix.h."
+DESCRIPTION = "The PCRE library is a set of functions that implement regular \
+expression pattern matching using the same syntax and semantics as Perl 5. PCRE \
+has its own native API, as well as a set of wrapper functions that correspond \
+to the POSIX regular expression API."
+SUMMARY = "Perl Compatible Regular Expressions"
+HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 PR = "r0"
 LICENSE = "BSD"
@@ -12,8 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch"
 
-SRC_URI[md5sum] = "1c9a276af932b5599157f96e945391f0"
-SRC_URI[sha256sum] = "5778a02535473c7ee7838ea598c19f451e63cf5eec0bf0307a688301c9078c3c"
+SRC_URI[md5sum] = "62f02a76bb57a40bc66681760ed511d5"
+SRC_URI[sha256sum] = "a913fb9bd058ef380a2d91847c3c23fcf98e92dc3b47cd08a53c021c5cde0f55"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
1.7.9.5



