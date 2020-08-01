Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.4583.1596317026097525902
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vd9dPeLe;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id o23so7389519ejr.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ndT6keImgl7rrhfJdDH2VyuxEqZGOvwGMyNKGJ/qEL0=;
        b=vd9dPeLeTuaR+5lCod83ZFR0GUjy5rcblRya9aEmjHa4VjBA/OMndNEIu75ovSz5hi
         gWUyc41e+SPkZGUcMvIa9u8m1PrjiIvXUD+yTxp9xXObVG24l4EEjdmk3t2BmePPfJR/
         jhhIUocXiZ9u3G5S0fuwoF2nEs8Dl8G0VP0EZbaSB+LCJ6zuWjJPhc5jMIbZ5NQLO1L4
         hFNanpKtX9dd3PyMI/Ft2xztob/jEZhYaFb6dRO4CeD/NWzh0DecFc6kRkf6autSlplM
         /K5Bv1fDRpzaPv3Kk2Ys7xoZIwOI3kHoPqKB1RR78PkAatrN7RZfi7Y5XBJJbYKX/AeV
         90JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ndT6keImgl7rrhfJdDH2VyuxEqZGOvwGMyNKGJ/qEL0=;
        b=bufUutK3Ve54VOJLrOOzwda+NDcXU/kZW+cexPjuRVqyYFIfVc7nkpVS3Do82gLMt1
         ggaQLsZ9TXtZ7HE9al/92cTw/+hE22Z5YkEyboJzfRIBHbOC5a9SwWaRrpxJoUcuCnQc
         hTRkIjNRVwrxLSoqmo6CUD+9GGeX08BTojFnvdwtsEP7Gln+VYOlrg0BF0gmTipaWeMS
         JUlCCzuIN2pH+CLs0mpX6OEo7zQYp8zJ4NClB/3LMJF6hRo2uZ+RO5IQ2N5mdbSFQnNO
         KV1QouCaP9chPgHFIG9g891o4BOfs3NssKAWYc/2zVl8olaVdwwTiW9F5gKO0OUEO0xw
         Kyvw==
X-Gm-Message-State: AOAM530Nq8aK5X0bQ3xbnZHVAU+JkOpzcarIwcWu/P12eTxXgIXQ4LUK
	hQhWSZ/mgtfYEl+x7OEErCOkIe9S0+E=
X-Google-Smtp-Source: ABdhPJwdYfa9sQCekYrSU8+RI9Iq7e3xvwSiYtrRcD+K4YMve0Yt5mtndTq8h0iulf50dRVNna6b+g==
X-Received: by 2002:a17:906:cc4d:: with SMTP id mm13mr9730762ejb.191.1596317024304;
        Sat, 01 Aug 2020 14:23:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:43 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/13] sysvinit: update 2.96 -> 2.97
Date: Sat,  1 Aug 2020 23:23:23 +0200
Message-Id: <20200801212335.14922-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../sysvinit/sysvinit/crypt-lib.patch            | 16 +++++++++-------
 .../recipes-core/sysvinit/sysvinit/install.patch |  7 ++++---
 .../{sysvinit_2.96.bb => sysvinit_2.97.bb}       |  3 +--
 3 files changed, 14 insertions(+), 12 deletions(-)
 rename meta/recipes-core/sysvinit/{sysvinit_2.96.bb => sysvinit_2.97.bb} (96%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
index bd4444b81b..5c39fb001b 100644
--- a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
@@ -1,4 +1,4 @@
-From 7276275d9a08d5ae268fb263027bbc60bc0ab2e8 Mon Sep 17 00:00:00 2001
+From c3a068cf24a22bea7349849ec111ae8d91a54db4 Mon Sep 17 00:00:00 2001
 From: Jeff Dike <jdike@x86_64.user-mode-linux.org>
 Date: Wed, 14 Jul 2010 14:35:52 -0400
 Subject: [PATCH] sysvinit - Remove sulogin dependency on /usr/lib*/libcrypt.a
@@ -11,24 +11,26 @@ Upstream-Status: Inappropriate [configuration]
 # - jdike@linux.intel.com
 
 ---
- src/Makefile | 9 ++-------
- 1 file changed, 2 insertions(+), 7 deletions(-)
+ src/Makefile | 11 ++---------
+ 1 file changed, 2 insertions(+), 9 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 1380d7f..628e77f 100644
+index 5b1a5a2..b686394 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -97,13 +97,8 @@ else
+@@ -97,15 +97,8 @@ else
  endif
  
  # Additional libs for GNU libc.
--ifneq ($(wildcard /usr/lib*/libcrypt.*),)
+-ifneq ($(wildcard $(ROOT)/usr/lib*/libcrypt.*),)
 -  SULOGINLIBS	+= -lcrypt
 -endif
 -
 -# Additional libs for GNU libc / multiarch on Debian based systems.
--ifneq ($(wildcard /usr/lib/*/libcrypt.*),)
+-ifneq ($(wildcard $(ROOT)/usr/lib/*/libcrypt.*),)
+-ifneq ($(findstring -lcrypt, $(SULOGINLIBS)), -lcrypt)
 -  SULOGINLIBS	+= -lcrypt
+-endif
 +ifneq ($(LCRYPT),)
 +  SULOGINLIBS	+= $(LCRYPT)
  endif
diff --git a/meta/recipes-core/sysvinit/sysvinit/install.patch b/meta/recipes-core/sysvinit/sysvinit/install.patch
index 2930fb0195..90563a6294 100644
--- a/meta/recipes-core/sysvinit/sysvinit/install.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/install.patch
@@ -1,4 +1,4 @@
-From b6cc66ab245ceb6bca0116dff7a41f6d7677b96a Mon Sep 17 00:00:00 2001
+From 5e35aa105e7a2e85db2a89fee4114090b1ac55be Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Fri, 18 Jun 2010 09:40:30 +0800
 Subject: [PATCH] sysvinit: upgrade to version 2.88dsf
@@ -10,7 +10,7 @@ Upstream-Status: Pending
  1 file changed, 30 insertions(+), 23 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 9f9f09e..1380d7f 100644
+index 1b368dc..5b1a5a2 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -77,7 +77,14 @@ else
@@ -29,7 +29,7 @@ index 9f9f09e..1380d7f 100644
  
  ifeq ($(WITH_SELINUX),yes)
    SELINUX_DEF	=  -DWITH_SELINUX
-@@ -189,42 +196,42 @@ clobber:	cleanobjs
+@@ -191,43 +198,43 @@ clobber:	cleanobjs
  distclean:	clobber
  
  install:	all
@@ -50,6 +50,7 @@ index 9f9f09e..1380d7f 100644
 +			$(INSTALL_EXEC) $$i $(ROOT)$(bindir)/ ; \
  		done
  		# $(INSTALL_DIR) $(ROOT)/etc/
+ 		$(INSTALL_DIR) $(ROOT)/etc/inittab.d
  		# $(INSTALL_EXEC) ../doc/initscript.sample $(ROOT)/etc/
 -		ln -sf halt $(ROOT)/sbin/reboot
 -		ln -sf halt $(ROOT)/sbin/poweroff
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.96.bb b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
similarity index 96%
rename from meta/recipes-core/sysvinit/sysvinit_2.96.bb
rename to meta/recipes-core/sysvinit/sysvinit_2.97.bb
index d2b85ed9c0..80ab9d70e7 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.96.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
@@ -21,8 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[md5sum] = "48cebffebf2a96ab09bec14bf9976016"
-SRC_URI[sha256sum] = "2a2e26b72aa235a23ab1c8471005f890309ce1196c83fbc9413c57b9ab62b587"
+SRC_URI[sha256sum] = "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 B = "${S}/src"
-- 
2.27.0

