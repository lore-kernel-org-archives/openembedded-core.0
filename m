Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCXO-00034h-O6
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:47:27 +0200
Received: by pzk2 with SMTP id 2so236581pzk.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zHePbWz1jHSvUMAwlRgN5EosrpqBMxn5kNja4N21hOc=;
	b=mgacEjBMWb3dG/zMaM2GCADlp3zFtv0z6uCPtwHo13ygKAoreR5t3oBz6ZkeKijYg3
	7/myRKhfjCRS6+f9Fj5bYFB8MEr0Hj35sIKdCzm/N5ThdzfHewfLrRCBoFNyBetag1QY
	1aeOqdAFOym1Nfcij3H0HXAXi1OYDFzAykCA8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=L1votTrZW/gnqgpyJG2cAVJk7E7FljxDllvt6AFv2dB5l2+SVd2aBTFPqHoiJrS+bA
	DsNfI3FCYDE6XeEjrag5aawRPBIj9bBhgkNE8utUN98W99UUtV7fPb+7o/8JWCfCldHW
	7PxbIhOIjHpjbb69BfwBZauuNHnddsLaO3C3A=
Received: by 10.142.120.1 with SMTP id s1mr12726wfc.252.1308707031196;
	Tue, 21 Jun 2011 18:43:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o2sm64885pbj.17.2011.06.21.18.43.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:43:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:43:41 -0700
Message-Id: <c51f708783d1e320787117e68f2f98aa53ed292e.1308706423.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308706423.git.raj.khem@gmail.com>
References: <cover.1308706423.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] eglibc: Upgrade recipes from 2.13 -> 2.14
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
X-List-Received-Date: Wed, 22 Jun 2011 01:47:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tive_2.13.bb => cross-localedef-native_2.14.bb} |    0
 .../IO-acquire-lock-fix.patch                      |    0
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
 .../{eglibc-2.13 => eglibc-2.14}/etc/ld.so.conf    |    0
 .../generate-supported.mk                          |    0
 .../ld-search-order.patch                          |    0
 .../mips-rld-map-check.patch                       |    0
 .../shorten-build-commands.patch                   |    0
 .../stack-protector-test.patch                     |    0
 ...libc-initial_2.13.bb => eglibc-initial_2.14.bb} |    0
 .../eglibc/{eglibc_2.13.bb => eglibc_2.14.bb}      |    7 +++----
 11 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-core/eglibc/{cross-localedef-native_2.13.bb => cross-localedef-native_2.14.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/IO-acquire-lock-fix.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/etc/ld.so.conf (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/generate-supported.mk (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/ld-search-order.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/mips-rld-map-check.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/shorten-build-commands.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/stack-protector-test.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-initial_2.13.bb => eglibc-initial_2.14.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc_2.13.bb => eglibc_2.14.bb} (97%)

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
similarity index 100%
rename from meta/recipes-core/eglibc/cross-localedef-native_2.13.bb
rename to meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch b/meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
rename to meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevellock-include-tls.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
rename to meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevellock-include-tls.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf b/meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf
rename to meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk b/meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk
rename to meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch b/meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
rename to meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
rename to meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch b/meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
rename to meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch b/meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
rename to meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.patch
diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.13.bb b/meta/recipes-core/eglibc/eglibc-initial_2.14.bb
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-initial_2.13.bb
rename to meta/recipes-core/eglibc/eglibc-initial_2.14.bb
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.14.bb
similarity index 97%
rename from meta/recipes-core/eglibc/eglibc_2.13.bb
rename to meta/recipes-core/eglibc/eglibc_2.14.bb
index 3490d2d..8936d9c 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.14.bb
@@ -1,13 +1,12 @@
 require eglibc.inc
 
-SRCREV = "14157"
+SRCREV = "14285"
 
 DEPENDS += "gperf-native"
-FILESPATHPKG =. "eglibc-svn:"
-PR = "r2"
+PR = "r0"
 PR_append = "+svnr${SRCPV}"
 
-EGLIBC_BRANCH="eglibc-2_13"
+EGLIBC_BRANCH="eglibc-2_14"
 SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
-- 
1.7.5.1



