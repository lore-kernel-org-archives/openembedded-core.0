Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web12.456.1592848921982044975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0ZSzIdR6;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.193, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f193.google.com with SMTP id a21so16431576oic.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ythrDVuvSf3uKW1+Nqsltz1VLC0kVo1GrlLahQ/DNqk=;
        b=0ZSzIdR67OguTX+Z1DiIY2Nrstp5gYW8WAeisEvIH1CoK1qaBL9PVBcUAQsEupOe3L
         aFKq9zj9eszsb7bRl1raC4FVPU1nJECugM0odtnviUzvRg76Xh7a6+2C1Ui+FKmwRqMZ
         /L/RHl23ttb6qXkY5NHiIP8qd/HHi2RmX+Rkq6al5WVg0/6xQPLbSHCpRlBRgVosjf2X
         iykkCfCXMcQFE3/8zbXXtuZSagX6sAZOTWN4eWifP1iXSCb+BoBDNOZPpPzIvJfTocAN
         mM/LPbomUjpRpHKz/76xpFDmdwfr4VCxY0EMxvhWIbTVdQOUEP1DybPoFjO2+k1cYCuh
         OC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ythrDVuvSf3uKW1+Nqsltz1VLC0kVo1GrlLahQ/DNqk=;
        b=oC/08jbLYLwnwGrZAdZh6oSRrXVy4B9wMVGWUcUSN0wPeUkuh0LZ1e/RvrVRSASNol
         uyVjuKYd8aEZZOhuxirSmq+Un6gJx+Wa6gaGvsMLAXQLCmWVaUDq4qfFTD2f49c1MKHB
         jCz0y7BISyyYKyj4oiJIax2aF5gEJn1/bKh2vwrTg7mZDd9YBbItKGLsY1joM01cmzea
         V1X47hMUNz2+C6JzJqONwRoM9rfHjWxwKKfVrSVDqSdvwJp8VO1SdVcHenwQPOu6Jthx
         VpG0H9nWDMxEQ01VXmc3KAT3cpDWhKaoj6wlztAqTeLmSUvoDyEEkA+V3LdWiPSt05IG
         fWLw==
X-Gm-Message-State: AOAM5327Jj5c3+hvVF5zgsHLhx1HY/zr5TmHK+w7C2zSf2XJkzjyZIqU
	/+Z8QJE76cpTN464axSzz6BvfZU06n7Ziw==
X-Google-Smtp-Source: ABdhPJywvYsT/PttnxNE+nuyKww/k4/GdggKJwUa0TkgdLZ4YSWVRvyivhPOBI52PIzInY3pYDnr8g==
X-Received: by 2002:aca:cc8b:: with SMTP id c133mr13872721oig.5.1592848920845;
        Mon, 22 Jun 2020 11:02:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:02:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/33] apr-util: make gdbm optional
Date: Mon, 22 Jun 2020 07:58:24 -1000
Message-Id: <570d607007b528efa5dcec9f242d6e6825305ed4.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This helps with gpl3-free builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3260ad9e8ff185b4799269bbcdd9f638e976c4b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

