Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01A6275715
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:57:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9vTmK016911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:57:29 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:57:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:57:24 -0700
Message-ID: <3f54438476356e37954a8e1a7035f048eb81b06d.1432805258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432805258.git.liezhi.yang@windriver.com>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] gnupg: 2.1.2 -> 2.1.4
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
X-List-Received-Date: Thu, 28 May 2015 09:57:29 -0000
Content-Type: text/plain

Updated dirmngr-uses-libgpg-error.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnupg/gnupg/dirmngr-uses-libgpg-error.patch    |    8 ++++----
 .../gnupg/{gnupg_2.1.2.bb => gnupg_2.1.4.bb}       |    4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.2.bb => gnupg_2.1.4.bb} (89%)

diff --git a/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
index 3dc506c..7af1955 100644
--- a/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
+++ b/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
@@ -4,13 +4,13 @@ Index: gnupg-2.1.0/dirmngr/Makefile.am
 ===================================================================
 --- gnupg-2.1.0.orig/dirmngr/Makefile.am
 +++ gnupg-2.1.0/dirmngr/Makefile.am
-@@ -71,7 +71,8 @@ endif
+@@ -78,7 +78,8 @@ endif
  dirmngr_LDADD = $(libcommontlsnpth) $(libcommonpth) \
-         ../gl/libgnu.a $(DNSLIBS) $(LIBASSUAN_LIBS) \
+         $(DNSLIBS) $(LIBASSUAN_LIBS) \
  	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
 -	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV)
 +	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) \
-+        $(GPG_ERROR_LIBS)
- if !USE_LDAPWRAPPER
++	$(GPG_ERROR_LIBS)
+ if USE_LDAP
  dirmngr_LDADD += $(ldaplibs)
  endif
diff --git a/meta/recipes-support/gnupg/gnupg_2.1.2.bb b/meta/recipes-support/gnupg/gnupg_2.1.4.bb
similarity index 89%
rename from meta/recipes-support/gnupg/gnupg_2.1.2.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.4.bb
index 4784869..72635a2 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.4.bb
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://dirmngr-uses-libgpg-error.patch \
           "
 
-SRC_URI[md5sum] = "156fbd6566f4c51caac741c858d30d96"
-SRC_URI[sha256sum] = "404f5a43d591dfe41f0ffb204b49a1533b67d77bc1fd68febd7e447575616792"
+SRC_URI[md5sum] = "c36f1a4c261ecc81fa5df551356c33f1"
+SRC_URI[sha256sum] = "64127eedd868510f2bccccb22c507a4878ffa07495db16a0f976c67f56426cb0"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.7.9.5


