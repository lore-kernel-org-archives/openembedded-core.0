Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.5895.1609856795643588401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nhf6i7S/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id c132so10048560pga.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=e6Mozz9QWBuw4c0rWvRaTymZYY0G61h6pyPqDjsmzKo=;
        b=nhf6i7S/p08kro1mk6EZy2v5oROjGkWnhD6Fe8/5cz+g0CJnBhm2t/uKxn7FZ+VXus
         OQkCU7uH483LFbWvKe3EmNdxptH7kNxvukOjcTa3MlVff1N44MSN3m6anVjsDmPX2u7e
         On/dgV7vP5tpUM2LZZWPxqC0Rjs+9YV5QLGYkQOzgW88kjFDMYqscP+OyjiC4Ikm+FER
         7xA3DUknZfSyiHL0EGTnL0YscDTUwlTybeNqGCj70mRtaoCI2ns07OonqIIXou8Dn6cE
         /h/kLe8yb2FYBI9+YchoNjq2r11OnBJ1q/oSPHY2FZgT5uOu4SsoLkOGkXbk5YxCi+cD
         Jidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=e6Mozz9QWBuw4c0rWvRaTymZYY0G61h6pyPqDjsmzKo=;
        b=ai07I7IOJMgiv19HfC1fujcSqnD0MOr6XUr/C2HwOenpfARgApKDJ4lf8m06/mel+F
         mEvmxUaIKCYQiCDJwmb0E5FcbGYun8gBvQlpteaXOv8hetzPUK4Sa5IqddtHaeDjRtfB
         DCiY6R3hUi0Ks7KfgxLphbbjbFAlwazuse2Pu0BKrXBbScG+cg81tq0iDk9qvy2Yamh6
         +GrdeRJay8vkQ0mX4pdCDPNJMv0nzOUGELBelgVymglo2vGuOubTcx6eC2CgYXca8Q/k
         Vk+761BFj3Sca7M6ZXfucFrocVFAi0xHA5hiBUxIA4cTc7tmkaNKC9o2BrElph8hemrE
         ptdw==
X-Gm-Message-State: AOAM5309bHW5Cubpfmdhm40NRmeCrkyzUnar8hrzuwnwovdwgxNW3S+9
	63Unb1viJmVTt4w8XETKnAw4kdRD5xxntEyjo9g=
X-Google-Smtp-Source: ABdhPJz4I3hUE7qL3mS29Dzxr00Mdu0t4HlZZ+p+q3XXvJq+eQ9uYTtuQw/hk8btTqvIRBX52lizpw==
X-Received: by 2002:a62:c504:0:b029:1a5:b198:18dc with SMTP id j4-20020a62c5040000b02901a5b19818dcmr50376789pfg.79.1609856794801;
        Tue, 05 Jan 2021 06:26:34 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:34 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/30] gdk-pixbuf: fix CVE-2020-29385
Date: Tue,  5 Jan 2021 04:23:53 -1000
Message-Id: <710aa67534d569a19fbe371e87e758bb08499ecc.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Backport patch from
https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81

image file in upstream patch is for test purpose only, it cause error during
do_patch so drop it:
File tests/test-images/fail/hang_114.gif: git binary diffs are not supported.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7cd401b7c60dba91f6fb10395ab4a10a267cf23d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gdk-pixbuf/CVE-2020-29385.patch           | 55 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
new file mode 100644
index 0000000000..3fef2bc1eb
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
@@ -0,0 +1,55 @@
+From bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81 Mon Sep 17 00:00:00 2001
+From: Robert Ancell <robert.ancell@canonical.com>
+Date: Mon, 30 Nov 2020 12:26:12 +1300
+Subject: [PATCH 02/13] gif: Fix LZW decoder accepting invalid LZW code.
+
+The code value after a reset wasn't being validated, which means we would
+accept invalid codes. This could cause an infinite loop in the decoder.
+
+Fixes CVE-2020-29385
+
+Fixes https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/164
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81]
+CVE: CVE-2020-29385
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ gdk-pixbuf/lzw.c                    |  13 +++++++------
+ 1 files changed, 7 insertions(+), 6 deletions(-)
+ create mode 100644 tests/test-images/fail/hang_114.gif
+
+diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
+index 9e052a6f7..105daf2b1 100644
+--- a/gdk-pixbuf/lzw.c
++++ b/gdk-pixbuf/lzw.c
+@@ -195,19 +195,20 @@ lzw_decoder_feed (LZWDecoder *self,
+                                 if (self->last_code != self->clear_code && self->code_table_size < MAX_CODES) {
+                                         if (self->code < self->code_table_size)
+                                                 add_code (self, self->code);
+-                                        else if (self->code == self->code_table_size)
++                                        else
+                                                 add_code (self, self->last_code);
+-                                        else {
+-                                                /* Invalid code received - just stop here */
+-                                                self->last_code = self->eoi_code;
+-                                                return output_length;
+-                                        }
+ 
+                                         /* When table is full increase code size */
+                                         if (self->code_table_size == (1 << self->code_size) && self->code_size < LZW_CODE_MAX)
+                                                 self->code_size++;
+                                 }
+ 
++                                /* Invalid code received - just stop here */
++                                if (self->code >= self->code_table_size) {
++                                        self->last_code = self->eoi_code;
++                                        return output_length;
++                                }
++
+                                 /* Convert codeword into indexes */
+                                 n_written += write_indexes (self, output + n_written, output_length - n_written);
+                         }
+-- 
+2.25.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index 0405fa78b5..54861e83c6 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0004-Do-not-run-tests-when-building.patch \
            file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
            file://missing-test-data.patch \
+           file://CVE-2020-29385.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.17.1

