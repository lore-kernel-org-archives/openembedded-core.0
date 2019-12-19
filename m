Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4687FDC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q6so5942090wro.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kfl9c9FgRxnyYXc+QswqEm2fbV45pU59lnFl0gTwNck=;
	b=OSh9l1Hd2bdOypvgC3VM8TasdnZPsEpe3HBEZHaRWmTxmE2Pa0j/Rt2rIY4Cv3ooVl
	+YkCVvYOXY3gSI+u605Ziexc4vII8gjSKp1kB3E0+wJRD8SxAT2eorx4xUCZ34uOvtkf
	5VWNw6BReEQqtK+y4VSHnVMvLns9lk/8spfy7ZUb6Ss4PPmkAXVvqmyP+/9YB8vt+X/r
	6zykeOcwOSFE0fcgyou+wCCLTcui/gnfsNSoTCkcm8m3RsMq68+Ul6c8Y8XPNUvhdBwn
	M43qiFPnfyEeFFQ5nEW2L3Y5qeOBXiG9vNhhrpXJbKN7XTcRCoGdt0iIF+EPCtDqdl8P
	45pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kfl9c9FgRxnyYXc+QswqEm2fbV45pU59lnFl0gTwNck=;
	b=JFBcAtHaoR5QSahlaj02eOpMG7o+uQk46ITL3jgY1vxiq0BVFzokYFtyb7ywGJraBU
	0apMqAsfikd7WAOh/XZZm5WAhLoFQR9uIfWejkMaPktrINhmvu2j6BitjjdJ6le8LdZP
	eUM7+xEcm94GczyRMm68w6HcwSke9tM+pyvH2oZHVPxNFGpFHMSxXnNp8eyMx2/m570k
	mFC6DxK22vGo4piI9oiP0OHumYKWJakSeDzJDQFtEmPtaN6S8TxJhc3mxAQK/M4yKSJd
	hoAad+1pdQBMxgV9fkLhi2Jf7PGhyUSRmmX1EwUVOGcoFjRZ6SUWB0yaywz1CPN7ERM1
	1KYQ==
X-Gm-Message-State: APjAAAWC9VRveSo3YC6P1w54go1K98II49ZRI5YjpB1e/DN+SciYJiGN
	OrTl5Nzlv5JRZ1IBGLFE/o5bQR/ya+8=
X-Google-Smtp-Source: APXvYqwSNUezcjFK1pzENycehY9BRV7ozdXJFB9T3vPbM0W/jkcKly8kXF0Ihqq9+Y9rWGSuj84RFQ==
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr9056922wru.395.1576761812625; 
	Thu, 19 Dec 2019 05:23:32 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:59 +0100
Message-Id: <20191219132301.80034-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/16] gnutls: update to 3.6.11.1
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:32 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gnutls/gnutls/posix-shell.patch                | 14 ++++++++++++--
 .../gnutls/{gnutls_3.6.8.bb => gnutls_3.6.11.1.bb} |  4 ++--
 2 files changed, 14 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.8.bb => gnutls_3.6.11.1.bb} (94%)

diff --git a/meta/recipes-support/gnutls/gnutls/posix-shell.patch b/meta/recipes-support/gnutls/gnutls/posix-shell.patch
index 938e2d1e18f..eda1c6c300e 100644
--- a/meta/recipes-support/gnutls/gnutls/posix-shell.patch
+++ b/meta/recipes-support/gnutls/gnutls/posix-shell.patch
@@ -1,3 +1,8 @@
+From 0fce96e7d702d8f3bdbea57c1e77027446a91d37 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 25 Jul 2019 16:20:23 +0100
+Subject: [PATCH] gnutls: don't use HOSTTOOLS_DIR/bash as a shell on target
+
 Don't embed the path to the build-time POSIX shell as this will be
 $TMPDIR/hosttools/bash, which is no good on the target.
 
@@ -10,16 +15,21 @@ integrated.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ src/libopts/m4/libopts.m4 | 17 +----------------
+ 1 file changed, 1 insertion(+), 16 deletions(-)
+
 diff --git a/src/libopts/m4/libopts.m4 b/src/libopts/m4/libopts.m4
-index c6ad738..a62faca 100644
+index 23738ca..b47c0da 100644
 --- a/src/libopts/m4/libopts.m4
 +++ b/src/libopts/m4/libopts.m4
-@@ -112,21 +112,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
+@@ -105,22 +105,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
    AC_CHECK_FUNCS([mmap canonicalize_file_name snprintf strdup strchr \
                   strrchr strsignal fchmod fstat chmod])
    AC_PROG_SED
 -  [while :
 -  do
+-      test -x "$POSIX_SHELL" && break
 -      POSIX_SHELL=`which bash`
 -      test -x "$POSIX_SHELL" && break
 -      POSIX_SHELL=`which dash`
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.8.bb b/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
similarity index 94%
rename from meta/recipes-support/gnutls/gnutls_3.6.8.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
index c927063f0a3..14c858eaec2 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.8.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
@@ -22,8 +22,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://posix-shell.patch \
 "
 
-SRC_URI[md5sum] = "9dcf0aa45d1a42e1b3ca5d39ec7c61a8"
-SRC_URI[sha256sum] = "aa81944e5635de981171772857e72be231a7e0f559ae0292d2737de475383e83"
+SRC_URI[md5sum] = "3670ee0b0d95b3dee185eff2dc910ee7"
+SRC_URI[sha256sum] = "fbba12f3db9a55dbf027e14111755817ec44b57eabec3e8089aac8ac6f533cf8"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1


