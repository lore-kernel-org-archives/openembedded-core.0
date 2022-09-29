Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FE5C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 14:34:26 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.11097.1664462056018069120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 07:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J2+OkOzY;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id y2so926897qkl.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 07:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=iy4+fm0l086AzOCKyAGSuSHbqx0XCJCLvDCKxUMogW4=;
        b=J2+OkOzYq0SXNC1fZHjTt8LqZMNLBwqmFKy1WkskeVKGFOrcQjZE5LWSwwSSseETss
         69QAUpKiazTugKSHQ4kQlLaoyrJ06wvGt5KaH01i+jSztzIJlGYMbq3LV6d0cL7B46sa
         y4B9a3u9b8D1gryUXcqVrBhKkmJQuAekd7QKw13lVRpZ8khhBCSH/X1IinAjEVUI0G7Z
         NDISSoRwQW0R/jt2AwEM/UZD5sAmGaQRuvFoCsCKi5vjQUrYZO8HU6o8fent3FU4b23D
         SbBMHfq1Eq8RCfNZBghTJW1RKc94jUmE5on0OcZzODGAIb4jHNYkB8LhOiV4k3GDKOmP
         ejxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=iy4+fm0l086AzOCKyAGSuSHbqx0XCJCLvDCKxUMogW4=;
        b=pH/35zD4N9cjNUEHVp6k5yXRdGwo16c/lBOriIa4EeRc+7kTrIyf6I8ThZ1x/IcN/L
         zw2vClFtUkpFcggnoNsmi3Y6EZyG2WyZrDrbeJhoOWimiXPkzUjq9B8bVtfgOX4GZQ/w
         uPo2WG3FKi5XOOp8t2OROK+1EIyz4VIc3N1EE9Ged6tFyT0kWHxX0Sqft14hlAOxbZdq
         vmxlG3Niq1ZNCVjGPKnv8e8enpaXojnkmjMVgmqHmb3hmtevSOyfG6Y9Y4+UY1CIaHwa
         vWeLNW7kb4Pz8lX9dY4fU3gQnZFAxLiVQen4f8r/lsdHo79hYw+hAZP44Jt1ur4/DQTZ
         uKJg==
X-Gm-Message-State: ACrzQf21j6SwLgguPNM6yuO71Fh/3xuLTtsRW481DcIDOKbYz5mlcPIe
	PpMCPdaY4fsIRV0lkfDPyaUDPPQftbKEBg==
X-Google-Smtp-Source: 
 AMsMyM4gaAMpUuoB/8FBAq7AzERHw8VuRWMPg39rWorjS2fBosTswtHKOX8j5jcrh30Boz3tO3xLJQ==
X-Received: by 2002:a05:620a:c4f:b0:6cf:8135:e803 with SMTP id
 u15-20020a05620a0c4f00b006cf8135e803mr2400749qki.67.1664462052268;
        Thu, 29 Sep 2022 07:34:12 -0700 (PDT)
Received: from FDIACONESCU-KS0.lenovo.com ([92.87.113.18])
        by smtp.gmail.com with ESMTPSA id
 m9-20020a05620a290900b006cdd0939ffbsm6209277qkp.86.2022.09.29.07.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 07:34:11 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [kirkstone][PATCH] rsync: update 3.2.3 -> 3.2.4
Date: Thu, 29 Sep 2022 17:33:19 +0300
Message-Id: <20220929143318.561-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 14:34:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171188

Drop configure options that have been removed upstream.

License-Update: formatting

Changelog: https://download.samba.org/pub/rsync/NEWS#3.2.4

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
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


