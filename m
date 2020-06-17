Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.4386.1592388991932813653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 03:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WFKKURmY;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id s28so1457914edw.11
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9dW6AHSSfFQre5YryxFn+ru7/jbt1cd/h6Xchz6GrQY=;
        b=WFKKURmYFbwLi/EjZhOvVtNBveUPgRx1CKnnOB5BzS706kISM8wSDZpFOSzMHAgaia
         3EdTth63kj3/vu8I3gxfW4ErIHQ6vvmrDZ3NQlm5PpM3QnuErTTeD65GYKEws6V2M3zw
         7fl8iJVy0IIkZW3dJTOsOMZgvki7Shho6ICZ4kM+mfK83Irovwa5lhNeb3V7Uo6aNJnA
         0Y7tHTL7Ux7fPKnmq0rsuTi4xRknLTj9dPM/1/dSetNm1To/X6jfKFEnJ3MLXUVypn+3
         QIoeHwTFMO41EXCa2ZpVGfl/B8iZg32mETnFrw84suzGUrfXQpaF8n2IpxK/e478RUe/
         14Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9dW6AHSSfFQre5YryxFn+ru7/jbt1cd/h6Xchz6GrQY=;
        b=sD7lcqONMZwChJCb4BgnfEv2BIlLdiaKuH14WZ/4T/Dc+iNGIILm1WaUkhL/GiX9n2
         n9tIWBHMLwvbzmbupT0WBgJE2ri/8APGf/fNrP3dmCthj7nqydNTA2ML2I01ST3/wvpf
         jkfBLj5HtzAzCKVqSfSgGEioHGHDqEW5v/tX2uEqxqnLsCwynRuVGisdHTUMCtuJ2pMR
         INFjs6rw0m4HzfiSU2XoBaY/EGgrWJjX08BNI5X+ndD+TZCUPd0PDG1E47KCdE+/uBNz
         z8knRi5eIRCPG3fOJSxHcS2AyUGUeBMMx2mlv4sPFk8VyMjUzWBmzjuEePtajEh3LyQq
         RRMQ==
X-Gm-Message-State: AOAM5334wt1sq5+ITAoAds1P+OAq9W3tH0O2QswIi8thrhiTo8wVvIre
	bDfqGnD3BnD0YRQ9C/0j10Y6UNhIVqE=
X-Google-Smtp-Source: ABdhPJxWcIJRb6hM1dK3NeIgVltzq8+w6yXTdXL9AYu93dvgczK8f+IxhjVqaBhbusSP8+KjPDLu+g==
X-Received: by 2002:a50:e1c5:: with SMTP id m5mr6596505edl.47.1592388990108;
        Wed, 17 Jun 2020 03:16:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id q12sm13031985ejn.23.2020.06.17.03.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:16:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] apr-util: make gdbm optional
Date: Wed, 17 Jun 2020 12:15:51 +0200
Message-Id: <20200617101552.23867-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps with gpl3-free builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/apr/apr-util_1.6.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index 3896c924f0..0dd8f025e8 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Apache Portable Runtime (APR) companion library"
 HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
-DEPENDS = "apr expat gdbm"
+DEPENDS = "apr expat"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -23,7 +23,6 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-odbc \
 		--without-pgsql \
 		--with-dbm=gdbm \
-		--with-gdbm=${STAGING_DIR_HOST}${prefix} \
 		--without-sqlite2 \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
@@ -66,10 +65,11 @@ do_install_append_class-target() {
 	       -e 's,APU_BUILD_DIR=.*,APR_BUILD_DIR=,g' ${D}${bindir}/apu-1-config
 }
 
-PACKAGECONFIG ??= "crypto"
+PACKAGECONFIG ??= "crypto gdbm"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[crypto] = "--with-openssl=${STAGING_DIR_HOST}${prefix} --with-crypto,--without-crypto,openssl"
 PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_DIR_HOST}${prefix},--without-sqlite3,sqlite3"
+PACKAGECONFIG[gdbm] = "--with-gdbm=${STAGING_DIR_HOST}${prefix},--without-gdbm,gdbm"
 
 #files ${libdir}/apr-util-1/*.so are not symlinks but loadable modules thus they are packaged in ${PN}
 FILES_${PN}     += "${libdir}/apr-util-1/apr*${SOLIBS} ${libdir}/apr-util-1/apr*${SOLIBSDEV}"
-- 
2.27.0

