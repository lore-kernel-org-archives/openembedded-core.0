Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9F86168E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g3so16011109wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rhveylFJnPYogR2BctG6DHkUqs7yhcsN1cX3fyhwfRQ=;
	b=DzV2bcwGLEKglgVXM3c29gDv//YJ9T9H+HPTcxX0y4TSP1zQgUCnkP24wWjcozlPVe
	sZWUnlvwzn9XzJ7yl9uVd2X5M6Anrpcut2zzQKrSNuJASEl9z2U4KN3WeBPP+r8TRU+K
	oxmTnYgJyKRnH4tBBWbfuKFU9cLm9ZdutnWVGMj7RRDwrcF6ulPdcoYDNtOujlVXK339
	XACGDdThg0zfnETRU2E139civJ8CfCz+vb0KCa6Kplc0rGxJX/35M+IjlrIFldDcK0Yu
	zxRcFN05vQhgUNxUxuIU2WGA0kxClsaB+B3vyO0K02LYzhue3hsTeTAnA25CPcDbNx7o
	v3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rhveylFJnPYogR2BctG6DHkUqs7yhcsN1cX3fyhwfRQ=;
	b=q1Y6bFh8TWhQDbNnsgEq+Ogz9m59VHSO03tNrTDk56mgfyXOpr2SFKfXZrbDQhB2ZV
	SrLchrmdmYNkx/wvUzMIPEbahs6ns5YcpcZq/uCLtYGd8QIXs6kCoRVHAh23NsityGA2
	97Xnu5gKdl33iYCniXCai7ZXjUq10W1WJe7UrtwREt8o87dklJeusEzid38Z0ftF83eG
	vppXDLTDDDOcvH6EDX+YRxVh8zowML+kcMC648MHRErjmUL4XRxfHqUiMKkR+Cs7TmnM
	HASYhBPmo4pHEHNTpBgF9x7HTxw3aJ1a+orT4DYD9XLyqljHUIZNp9FivzfiF5ovFqr7
	Th7w==
X-Gm-Message-State: APjAAAXnLy6fYNI9nXsgdY2xQ4zbOASwaKlUghzPX9xNN2Bzly9/Mhcf
	BdlL7pNOIi4+/LrOt3YuHqKe+pY1
X-Google-Smtp-Source: APXvYqzKgscgk/myRF0VgI0SlNovMrB2elVyX9qKY26g+PdIlPD25eV5f21DSLds/apKGqDTkwUDJA==
X-Received: by 2002:adf:fe0a:: with SMTP id n10mr547181wrr.229.1582656847978; 
	Tue, 25 Feb 2020 10:54:07 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:26 +0100
Message-Id: <20200225185335.19326-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/12] libpcre: upgrade 8.43 -> 8.44
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:07 -0000
Content-Transfer-Encoding: 8bit

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libpcre/libpcre/out-of-tree.patch         | 26 -------------------
 .../{libpcre_8.43.bb => libpcre_8.44.bb}      |  9 +++----
 2 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre/out-of-tree.patch
 rename meta/recipes-support/libpcre/{libpcre_8.43.bb => libpcre_8.44.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre/out-of-tree.patch b/meta/recipes-support/libpcre/libpcre/out-of-tree.patch
deleted file mode 100644
index d56789615f..0000000000
--- a/meta/recipes-support/libpcre/libpcre/out-of-tree.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-In out-of-tree builds the #include fails because $srcdir isn't in the include path.  Set CPPFLAGS so that it is.
-
-Upstream-Status: Backport [r1750]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: configure.ac
-===================================================================
---- a/configure.ac	(revision 1749)
-+++ b/configure.ac	(working copy)
-@@ -159,6 +159,8 @@
- 
- if test "$enable_jit" = "auto"; then
-   AC_LANG(C)
-+  SAVE_CPPFLAGS=$CPPFLAGS
-+  CPPFLAGS=-I$srcdir
-   AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
-   #define SLJIT_CONFIG_AUTO 1
-   #include "sljit/sljitConfigInternal.h"
-@@ -165,6 +167,7 @@
-   #if (defined SLJIT_CONFIG_UNSUPPORTED && SLJIT_CONFIG_UNSUPPORTED)
-   #error unsupported
-   #endif]])], enable_jit=yes, enable_jit=no)
-+  CPPFLAGS=$SAVE_CPPFLAGS
- fi
- 
- # Handle --disable-pcregrep-jit (enabled by default)
diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-support/libpcre/libpcre_8.44.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre_8.43.bb
rename to meta/recipes-support/libpcre/libpcre_8.44.bb
index f9a22fee9d..e5471e81da 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.44.bb
@@ -6,16 +6,15 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=91bee59d1b327eb1599b4c673e2fb3d1"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=3bb381a66a5385b246d4877922e7511e"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://fix-pcre-name-collision.patch \
-           file://out-of-tree.patch \
            file://run-ptest \
            file://Makefile \
-"
+           "
 
-SRC_URI[md5sum] = "636222e79e392c3d95dcc545f24f98c4"
-SRC_URI[sha256sum] = "91e762520003013834ac1adb4a938d53b22a216341c061b0cf05603b290faf6b"
+SRC_URI[md5sum] = "cf7326204cc46c755b5b2608033d9d24"
+SRC_URI[sha256sum] = "19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d"
 
 CVE_PRODUCT = "pcre"
 
-- 
2.25.0


