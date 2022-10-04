Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7F8C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:28 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.12605.1664898679229440494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zmc90ERH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so2245361pjs.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=gY1durU+AsglM4KRJWtcU9k+p/a6U4KDmG7UFYwkfTk=;
        b=zmc90ERHMBF+0MRTdwzBtmdfd2MBWE/+n8okhCzoSr2KsbGHSZQowPpzGkk+HSodeU
         CCIweD6vHbuJrduuuzOLNtkRHIum5WTMRrZZ4G8pr8weAheROJ//wNU9/cNGKBv0hZhO
         UbcUrpDUKGcmvJ+u8IA0cSe9Yfan0DJ/LnQBghiu56cF10tYX3UGp+uY9qQfur7nsCua
         DXZt09J93KjftBj0u2UGmBrZsnGbiyXIusqoRkeuCcd/vjV/6QjzvHMxGhlKZXS4qrsm
         Aj4QeJ4cShyHECssd/vyBGe5sfPykaTdj2FQ/gs4M7mD5X5aSypbsiveAFhJrWZ5Dj0G
         E3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gY1durU+AsglM4KRJWtcU9k+p/a6U4KDmG7UFYwkfTk=;
        b=oZh1A/lDJO+ku7YZPqR/yfgPQ7CaCwvBS1tbjehKlBlsdyLj44AxibeTUQOoGFYqVM
         7EzBJxvRfu4GeZ1RL0vDXAWS7GADckfx+mK2dqM7KlGAQZA7y48rz2pCtPXFA67EM1DA
         6qJlL1BLuCliTleZRDKwdpAjBVkiW6zoD4iAsx7vW8UpinqDpYgVyPbiOfvQsvwFXPVG
         PJazjCLzkEuj07H5vuyUsAG8+Tkbr1SGnFamjYYJbYkwQsakUXXOIwxEZqCMWQB9djmc
         uW072NhQD0u5TGXb/zOwBKLhrLW/Y7RAxLqfl+EVT5Fbwdh//63YOLF8S4eRbyneUo/y
         g/7g==
X-Gm-Message-State: ACrzQf0U+aKmtX95yo7q9ML14wax+gLS/sc118xDRlAQum3MZvkDLRlu
	pVJigTTup+Enm4/4x41EhIvo6M/XQP1B/AhI
X-Google-Smtp-Source: 
 AMsMyM5g415c9kiBqwDAHmekbfDxprzY2yQHMsHZ96/KKofUQSvxTyJ8x/icaP/F2yG3Zz8XPezQjw==
X-Received: by 2002:a17:90a:c984:b0:20a:ac88:d39d with SMTP id
 w4-20020a17090ac98400b0020aac88d39dmr359252pjt.13.1664898678209;
        Tue, 04 Oct 2022 08:51:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/18] rsync: update 3.2.3 -> 3.2.4
Date: Tue,  4 Oct 2022 05:50:34 -1000
Message-Id: 
 <4a4097ed1db8ecedbcf12388207c546d4d106e17.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171412

From: Florin Diaconescu <florin.diaconescu009@gmail.com>

Drop configure options that have been removed upstream.

License-Update: formatting

Changelog: https://download.samba.org/pub/rsync/NEWS#3.2.4

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-the-hostname-in-the-certificate-whe.patch | 31 -------------------
 .../rsync/files/makefile-no-rebuild.patch     | 12 +++----
 .../rsync/{rsync_3.2.3.bb => rsync_3.2.4.bb}  | 17 +++++++---
 3 files changed, 19 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
 rename meta/recipes-devtools/rsync/{rsync_3.2.3.bb => rsync_3.2.4.bb} (67%)

diff --git a/meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch b/meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
deleted file mode 100644
index 2d51ddf965..0000000000
--- a/meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fbe85634d88e82fbb439ae2a5d1aca8b8c309bea Mon Sep 17 00:00:00 2001
-From: Matt McCutchen <matt@mattmccutchen.net>
-Date: Wed, 26 Aug 2020 12:16:08 -0400
-Subject: [PATCH] rsync-ssl: Verify the hostname in the certificate when using
- openssl.
-
-CVE: CVE-2020-14387
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=c3f7414]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- rsync-ssl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rsync-ssl b/rsync-ssl
-index 8101975..46701af 100755
---- a/rsync-ssl
-+++ b/rsync-ssl
-@@ -129,7 +129,7 @@ function rsync_ssl_helper {
-     fi
- 
-     if [[ $RSYNC_SSL_TYPE == openssl ]]; then
--	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -connect $hostname:$port
-+	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -verify_hostname $hostname -connect $hostname:$port
-     elif [[ $RSYNC_SSL_TYPE == gnutls ]]; then
- 	exec $RSYNC_SSL_GNUTLS --logfile=/dev/null $gnutls_cert_opt $gnutls_opts $hostname:$port
-     else
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 4ba7665280..42a6372ba7 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 1f29584e57f5fda09970c66f3b94f4720e09c1bb Mon Sep 17 00:00:00 2001
+From 81700d1a0e51391028c761cc8ef1cd660084d114 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -14,12 +14,12 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 672fcc4..c12d8d4 100644
+index 3cde955..d963a70 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -168,60 +168,6 @@ gen: conf proto.h man
- gensend: gen
- 	rsync -aic $(GENFILES) $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/
+@@ -190,60 +190,6 @@ gensend: gen
+	fi
+	rsync -aic $(GENFILES) git-version.h $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/ || true
  
 -aclocal.m4: $(srcdir)/m4/*.m4
 -	aclocal -I $(srcdir)/m4
@@ -41,7 +41,7 @@ index 672fcc4..c12d8d4 100644
 -	else \
 -	    echo "config.h.in has CHANGED."; \
 -	fi
--	@if test -f configure.sh.old -o -f config.h.in.old; then \
+-	@if test -f configure.sh.old || test -f config.h.in.old; then \
 -	    if test "$(MAKECMDGOALS)" = reconfigure; then \
 -		echo 'Continuing with "make reconfigure".'; \
 -	    else \
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.4.bb
similarity index 67%
rename from meta/recipes-devtools/rsync/rsync_3.2.3.bb
rename to meta/recipes-devtools/rsync/rsync_3.2.4.bb
index 6168ee85fc..e6f917b5cd 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.4.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 # GPL-2.0-or-later (<< 3.0.0), GPL-3.0-or-later (>= 3.0.0)
 # Includes opennsh and xxhash dynamic link exception
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9e5a4f9b3a253d51520617aa54f8eb26"
+LIC_FILES_CHKSUM = "file://COPYING;md5=24423708fe159c9d12be1ea29fcb18c7"
 
 DEPENDS = "popt"
 
@@ -14,10 +14,9 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
-           file://0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch \
            "
 
-SRC_URI[sha256sum] = "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
+SRC_URI[sha256sum] = "6f761838d08052b0b6579cf7f6737d93e47f01f4da04c5d24d3447b7f2a5fad1"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_IGNORE += " CVE-2017-16548 "
@@ -41,7 +40,17 @@ PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 CACHED_CONFIGUREVARS += "rsync_cv_can_hardlink_special=yes rsync_cv_can_hardlink_symlink=yes"
 
 EXTRA_OEMAKE = 'STRIP=""'
-EXTRA_OECONF = "--disable-simd --disable-md2man --disable-asm --with-nobody-group=nogroup"
+EXTRA_OECONF = "--disable-md2man --with-nobody-group=nogroup"
+
+#| ./simd-checksum-x86_64.cpp: In function 'uint32_t get_checksum1_cpp(char*, int32_t)':
+#| ./simd-checksum-x86_64.cpp:89:52: error: multiversioning needs 'ifunc' which is not supported on this target
+#|    89 | __attribute__ ((target("default"))) MVSTATIC int32 get_checksum1_avx2_64(schar* buf, int32 len, int32 i, uint32* ps1, uint32* ps2) { return i; }
+#|       |                                                    ^~~~~~~~~~~~~~~~~~~~~
+#| ./simd-checksum-x86_64.cpp:480:1: error: use of multiversioned function without a default
+#|   480 | }
+#|       | ^
+#| If you can't fix the issue, re-run ./configure with --disable-roll-simd.
+EXTRA_OECONF:append:libc-musl = " --disable-roll-simd"
 
 # rsync 3.0 uses configure.sh instead of configure, and
 # makefile checks the existence of configure.sh
-- 
2.25.1


