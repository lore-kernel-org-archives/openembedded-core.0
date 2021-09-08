Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.15614.1631124107700075010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VaSr5y8a;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id u16so4560949wrn.5
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pKYi0n6StOL13ZddcFN4KzodXGZs9gTV+AlCylnMJWA=;
        b=VaSr5y8aMN6QNWxWsJcn+5ZcaKWibkT1NIsn7XiV+cSZysIv71R8zogF/x1S6kFriy
         KB/KNdcc1D6QjD+85bVsfOITKTSwH+HGOResJrBytYJR8zfsUoL9Wkin4FPHrg5rUQeW
         WUT9JnF2kh5Dr03f4rZxWuzfHSlSLMjWU+36w1v9jjoPjQF1uw1Wn2GL7xBi3nczVbnt
         dAm4+IUpaZ9VySW4KrRt86Tdj1twkDF2g6HWVCTwvEfERxu9wjEWW7IUR49uGZzobDmA
         ZuE2h3mo1TnjulbbogtDtR4g8fXEmk6qXGvHIAPOSEBeXkXAjOzGWRKELljmVphnRmGz
         7i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pKYi0n6StOL13ZddcFN4KzodXGZs9gTV+AlCylnMJWA=;
        b=fsk+JSvnM1IzweOVus0uTQdmxupq4kqgUNJ646c9uI3VO2rkXxZoVrXsQbej0PXDdt
         qLVJapHajP66VloITQEtkWnp0r6b6kXLI8ZWHgPp7SNhlPDp4wSdcqhi0PCqSXtL7dJl
         Gw/supANSsnU8JqB8PSkIdPU/DusHKrPaflRBAla5K/46U15SeGKpAYuUKvICglfp4WT
         9rXpDu2seWtCU5BXAjqvQc5W6Whjenx/MJp6uCuh2F9r+HlW5VuVL4RymHWp5hWT9Y6X
         FkxHR+UuQ/MaKU7C+IuvcWdaMY6vvsq9htu+kcKukQebxTESaIsy6S7okfb+rtXZHk6P
         RZmA==
X-Gm-Message-State: AOAM533Qm6MZpMWxTWyPaJcGPMqb79MHRz4QazWdSxSelLqYpWy/NGmh
	yBeLDFDtLWpHthkii4WfG2squKJEq3w=
X-Google-Smtp-Source: ABdhPJyN/FBnj7uHRVkannvtiOOTqMmkQdTl4BTFAH+Ar3OUX3w6/+MNzgbvYLtiZr9qR22IzWn+7w==
X-Received: by 2002:adf:e0cd:: with SMTP id m13mr5481690wri.137.1631124106244;
        Wed, 08 Sep 2021 11:01:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/26] libssh2: update 1.9.0 -> 1.10.0
Date: Wed,  8 Sep 2021 20:01:25 +0200
Message-Id: <20210908180125.103473-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

0001-configure-Conditionally-undefine-backend-m4-macro.patch no
longer needed; code removed upstream.

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...nviroment-to-decide-if-a-test-is-bui.patch |   6 +-
 ...ditionally-undefine-backend-m4-macro.patch |  30 ----
 ...EC-macro-outside-of-if-check-549-550.patch | 112 ---------------
 .../libssh2/files/CVE-2019-17498.patch        | 131 ------------------
 .../{libssh2_1.9.0.bb => libssh2_1.10.0.bb}   |  10 +-
 5 files changed, 5 insertions(+), 284 deletions(-)
 delete mode 100644 meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
 delete mode 100644 meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
 delete mode 100644 meta/recipes-support/libssh2/files/CVE-2019-17498.patch
 rename meta/recipes-support/libssh2/{libssh2_1.9.0.bb => libssh2_1.10.0.bb} (78%)

diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
index 5ff9bf8462..b1204e49eb 100644
--- a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
+++ b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
@@ -1,4 +1,4 @@
-From f9e3e2ee7b18ba5bb8efe083171f3e701eb0a663 Mon Sep 17 00:00:00 2001
+From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 2001
 From: Your Name <you@example.com>
 Date: Mon, 28 Dec 2020 02:08:03 +0000
 Subject: [PATCH] Don't let host enviroment to decide if a test is build
@@ -9,6 +9,7 @@ don't use SSHD on host to decide weither to build a test
 Upstream-Status: Inappropriate[oe specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
  tests/Makefile.am | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
@@ -41,6 +42,3 @@ index dc0922f..6cbc35d 100644
 -endif
 \ No newline at end of file
 +endif
--- 
-2.20.1
-
diff --git a/meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch b/meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
deleted file mode 100644
index 1128c7ea0c..0000000000
--- a/meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From efe7101786193eaddb749c0583af6b54aec6f289 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Feb 2021 18:45:16 -0800
-Subject: [PATCH] configure: Conditionally undefine backend m4 macro
-
-Unlike the M4 builtin, this macro fails if macro is not defined
-therefore recover the behavior of the builtin.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index fe5054a..758f8c2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -127,7 +127,7 @@ fi
- m4_set_foreach([crypto_backends], [backend],
-   [AM_CONDITIONAL(m4_toupper(backend), test "$found_crypto" = "backend")]
- )
--m4_undefine([backend])
-+m4_ifdef([backend], [m4_undefine([backend])])
- 
- 
- # libz
--- 
-2.30.0
-
diff --git a/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch b/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
deleted file mode 100644
index b331c1bf81..0000000000
--- a/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 1f76151c92e1b52e9c24ebf06adc77fbd6c062bc Mon Sep 17 00:00:00 2001
-From: Will Cosgrove <will@panic.com>
-Date: Tue, 26 Jan 2021 11:41:21 -0800
-Subject: [PATCH] kex.c: move EC macro outside of if check #549 (#550)
-
-File: kex.c
-
-Notes:
-Moved the macro LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY outside of the LIBSSH2_ECDSA since it's also now used by the ED25519 code.
-
-Sha 256, 384 and 512 need to be defined for all backends now even if they aren't used directly. I believe this is already the case, but just a heads up.
-
-Credit:
-Stefan-Ghinea
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://github.com/libssh2/libssh2/commit/1f76151c92e1b52e9c24ebf06adc77fbd6c062bc
-
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- src/kex.c | 66 +++++++++++++++++++++++++++----------------------------
- 1 file changed, 33 insertions(+), 33 deletions(-)
-
-diff --git a/src/kex.c b/src/kex.c
-index cb16639..19ab6ec 100644
---- a/src/kex.c
-+++ b/src/kex.c
-@@ -1885,39 +1885,6 @@ kex_method_diffie_hellman_group_exchange_sha256_key_exchange
- }
- 
- 
--#if LIBSSH2_ECDSA
--
--/* kex_session_ecdh_curve_type
-- * returns the EC curve type by name used in key exchange
-- */
--
--static int
--kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
--{
--    int ret = 0;
--    libssh2_curve_type type;
--
--    if(name == NULL)
--        return -1;
--
--    if(strcmp(name, "ecdh-sha2-nistp256") == 0)
--        type = LIBSSH2_EC_CURVE_NISTP256;
--    else if(strcmp(name, "ecdh-sha2-nistp384") == 0)
--        type = LIBSSH2_EC_CURVE_NISTP384;
--    else if(strcmp(name, "ecdh-sha2-nistp521") == 0)
--        type = LIBSSH2_EC_CURVE_NISTP521;
--    else {
--        ret = -1;
--    }
--
--    if(ret == 0 && out_type) {
--        *out_type = type;
--    }
--
--    return ret;
--}
--
--
- /* LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY
-  *
-  * Macro that create and verifies EC SHA hash with a given digest bytes
-@@ -2027,6 +1994,39 @@ kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
- }                                                                       \
- 
- 
-+#if LIBSSH2_ECDSA
-+
-+/* kex_session_ecdh_curve_type
-+ * returns the EC curve type by name used in key exchange
-+ */
-+
-+static int
-+kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
-+{
-+    int ret = 0;
-+    libssh2_curve_type type;
-+
-+    if(name == NULL)
-+        return -1;
-+
-+    if(strcmp(name, "ecdh-sha2-nistp256") == 0)
-+        type = LIBSSH2_EC_CURVE_NISTP256;
-+    else if(strcmp(name, "ecdh-sha2-nistp384") == 0)
-+        type = LIBSSH2_EC_CURVE_NISTP384;
-+    else if(strcmp(name, "ecdh-sha2-nistp521") == 0)
-+        type = LIBSSH2_EC_CURVE_NISTP521;
-+    else {
-+        ret = -1;
-+    }
-+
-+    if(ret == 0 && out_type) {
-+        *out_type = type;
-+    }
-+
-+    return ret;
-+}
-+
-+
- /* ecdh_sha2_nistp
-  * Elliptic Curve Diffie Hellman Key Exchange
-  */
--- 
-2.17.1
-
diff --git a/meta/recipes-support/libssh2/files/CVE-2019-17498.patch b/meta/recipes-support/libssh2/files/CVE-2019-17498.patch
deleted file mode 100644
index 001080072b..0000000000
--- a/meta/recipes-support/libssh2/files/CVE-2019-17498.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From dedcbd106f8e52d5586b0205bc7677e4c9868f9c Mon Sep 17 00:00:00 2001
-From: Will Cosgrove <will@panic.com>
-Date: Fri, 30 Aug 2019 09:57:38 -0700
-Subject: [PATCH] packet.c: improve message parsing (#402)
-
-* packet.c: improve parsing of packets
-
-file: packet.c
-
-notes:
-Use _libssh2_get_string API in SSH_MSG_DEBUG/SSH_MSG_DISCONNECT. Additional uint32 bounds check in SSH_MSG_GLOBAL_REQUEST.
-
-Upstream-Status: Backport
-CVE: CVE-2019-17498
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- src/packet.c | 68 ++++++++++++++++++++++------------------------------
- 1 file changed, 29 insertions(+), 39 deletions(-)
-
-diff --git a/src/packet.c b/src/packet.c
-index 38ab629..2e01bfc 100644
---- a/src/packet.c
-+++ b/src/packet.c
-@@ -419,8 +419,8 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-                     size_t datalen, int macstate)
- {
-     int rc = 0;
--    char *message = NULL;
--    char *language = NULL;
-+    unsigned char *message = NULL;
-+    unsigned char *language = NULL;
-     size_t message_len = 0;
-     size_t language_len = 0;
-     LIBSSH2_CHANNEL *channelp = NULL;
-@@ -472,33 +472,23 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
- 
-         case SSH_MSG_DISCONNECT:
-             if(datalen >= 5) {
--                size_t reason = _libssh2_ntohu32(data + 1);
-+                uint32_t reason = 0;
-+                struct string_buf buf;
-+                buf.data = (unsigned char *)data;
-+                buf.dataptr = buf.data;
-+                buf.len = datalen;
-+                buf.dataptr++; /* advance past type */
- 
--                if(datalen >= 9) {
--                    message_len = _libssh2_ntohu32(data + 5);
-+                _libssh2_get_u32(&buf, &reason);
-+                _libssh2_get_string(&buf, &message, &message_len);
-+                _libssh2_get_string(&buf, &language, &language_len);
- 
--                    if(message_len < datalen-13) {
--                        /* 9 = packet_type(1) + reason(4) + message_len(4) */
--                        message = (char *) data + 9;
--
--                        language_len =
--                            _libssh2_ntohu32(data + 9 + message_len);
--                        language = (char *) data + 9 + message_len + 4;
--
--                        if(language_len > (datalen-13-message_len)) {
--                            /* bad input, clear info */
--                            language = message = NULL;
--                            language_len = message_len = 0;
--                        }
--                    }
--                    else
--                        /* bad size, clear it */
--                        message_len = 0;
--                }
-                 if(session->ssh_msg_disconnect) {
--                    LIBSSH2_DISCONNECT(session, reason, message,
--                                       message_len, language, language_len);
-+                    LIBSSH2_DISCONNECT(session, reason, (const char *)message,
-+                                       message_len, (const char *)language,
-+                                       language_len);
-                 }
-+
-                 _libssh2_debug(session, LIBSSH2_TRACE_TRANS,
-                                "Disconnect(%d): %s(%s)", reason,
-                                message, language);
-@@ -539,24 +529,24 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-                 int always_display = data[1];
- 
-                 if(datalen >= 6) {
--                    message_len = _libssh2_ntohu32(data + 2);
--
--                    if(message_len <= (datalen - 10)) {
--                        /* 6 = packet_type(1) + display(1) + message_len(4) */
--                        message = (char *) data + 6;
--                        language_len = _libssh2_ntohu32(data + 6 +
--                                                        message_len);
--
--                        if(language_len <= (datalen - 10 - message_len))
--                            language = (char *) data + 10 + message_len;
--                    }
-+                    struct string_buf buf;
-+                    buf.data = (unsigned char *)data;
-+                    buf.dataptr = buf.data;
-+                    buf.len = datalen;
-+                    buf.dataptr += 2; /* advance past type & always display */
-+
-+                    _libssh2_get_string(&buf, &message, &message_len);
-+                    _libssh2_get_string(&buf, &language, &language_len);
-                 }
- 
-                 if(session->ssh_msg_debug) {
--                    LIBSSH2_DEBUG(session, always_display, message,
--                                  message_len, language, language_len);
-+                    LIBSSH2_DEBUG(session, always_display,
-+                                  (const char *)message,
-+                                  message_len, (const char *)language,
-+                                  language_len);
-                 }
-             }
-+
-             /*
-              * _libssh2_debug will actually truncate this for us so
-              * that it's not an inordinate about of data
-@@ -579,7 +569,7 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-                 uint32_t len = 0;
-                 unsigned char want_reply = 0;
-                 len = _libssh2_ntohu32(data + 1);
--                if(datalen >= (6 + len)) {
-+                if((len <= (UINT_MAX - 6)) && (datalen >= (6 + len))) {
-                     want_reply = data[5 + len];
-                     _libssh2_debug(session,
-                                    LIBSSH2_TRACE_CONN,
--- 
-2.17.1
-
diff --git a/meta/recipes-support/libssh2/libssh2_1.9.0.bb b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
similarity index 78%
rename from meta/recipes-support/libssh2/libssh2_1.9.0.bb
rename to meta/recipes-support/libssh2/libssh2_1.10.0.bb
index a0cbb6af6b..072d6819c0 100644
--- a/meta/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
@@ -5,19 +5,15 @@ SECTION = "libs"
 DEPENDS = "zlib"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3e089ad0cf27edf1e7f261dfcd06acc7"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
-           file://CVE-2019-17498.patch \
-           file://0001-configure-Conditionally-undefine-backend-m4-macro.patch \
            file://run-ptest \
-           file://0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch \
-"
+           "
 
 SRC_URI:append:ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
 
-SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
-SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
+SRC_URI[sha256sum] = "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
 
 inherit autotools pkgconfig ptest
 
-- 
2.31.1

