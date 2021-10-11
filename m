Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C68C433FE
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 16:07:05 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.450.1633968424524775271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 09:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K8Q27M0o;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id t2so16856300qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yTJDQQa0wRL9XyglQ0CjEVrfLdZXJT8Ezm2yfh6Bw6g=;
        b=K8Q27M0oJR7pmCmszM2mcYuVt3ZiHqa0VfMKaNFW96D6QnVco7+BiTIdGTkUwthcnw
         WalW/S7gzQqN2tkRBH1JTjG2GiUyhUWqYoznUqhFZso8RD7L6EiK9AeShMr2Czyc4Iie
         H88k7fpgvXxbe7pHn0ZUnyniZs95RZkD1m2dStXtZSMi4zmnrW3nRuy0TrhqN+FB4Ub4
         uujtapoieK7bXbfyxc2HY6qZvFdGcY8K0EhWc5I7QvnvwVO5oD+JyqrLlNZmM7S2go1V
         qN/Vt+/nr/FPExsWvEmyi0EyOMRZ6ldFuTwi7hmqboht80K4WDSz5hICQJkGw0TB21+0
         uBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yTJDQQa0wRL9XyglQ0CjEVrfLdZXJT8Ezm2yfh6Bw6g=;
        b=YM38HZRfuOhE357F82HOAoHUnPvdIfzDWaozX2WdPn1V+quBXHnCUcKib71OUgwVcQ
         gwwO9XNKelKzSnuG0OA6A951KmX1ifZ4qiiTpIXos3Eo1JVe/bBg8KCkKKT+dILujAbP
         /ASVz34d2DiCPhKYAKGPb/xR3rgNl1/oYle0IFadLJ9zwM2HjT8rcTvAyZqJgt2rOPTg
         Xe3418k042zGBtHHJl8VHEJDlaJIFVtG/RzKr/Eoxz0eTv3eCISviW3V13B40GGlksiN
         zIJXNfaOa+9nTN+ILFuqKY/9E7MRKURscWAoUtxDkgZ3DjrBMiU++dDf1LJ8ry8WxN1X
         Gz9A==
X-Gm-Message-State: AOAM5314rRqpUDs9wIBQmuycrLPcapYvFM2xsInIfbxFTX4e4bB2CNel
	/5s6Ebl6l4fb2TFRaEQ3ubGwmb1qc+w6Kd07WXY=
X-Google-Smtp-Source: 
 ABdhPJxFWk4FnoNj9uHrygnMPDJ3glq2veLuUfUL7Dqld6b0DVHT7LLFDKfQ1QWArjJmb7vfH4jAwHjs0n5ZdG+220I=
X-Received: by 2002:a05:622a:11d5:: with SMTP id
 n21mr16395072qtk.112.1633968423363;
 Mon, 11 Oct 2021 09:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-5-alex@linutronix.de>
In-Reply-To: <20211011094059.4184654-5-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Oct 2021 09:06:37 -0700
Message-ID: 
 <CAMKF1sr7U1BQC28EbLXX+qo7BEk73bS8c2DV_Mi0YAK19EwAZg@mail.gmail.com>
Subject: Re: [PATCH 05/25] libssh2: update 1.9.0 -> 1.10.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Stefan Ghinea <stefan.ghinea@windriver.com>,
	Li Zhou <li.zhou@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 16:07:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156840

On Mon, Oct 11, 2021 at 2:41 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> 0001-configure-Conditionally-undefine-backend-m4-macro.patch no
> longer needed; code removed upstream.
>

Looks good.

> License-Update: copyright years
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...nviroment-to-decide-if-a-test-is-bui.patch |   6 +-
>  ...ditionally-undefine-backend-m4-macro.patch |  30 ----
>  ...EC-macro-outside-of-if-check-549-550.patch | 112 ---------------
>  .../libssh2/files/CVE-2019-17498.patch        | 131 ------------------
>  .../{libssh2_1.9.0.bb => libssh2_1.10.0.bb}   |  10 +-
>  5 files changed, 5 insertions(+), 284 deletions(-)
>  delete mode 100644 meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
>  delete mode 100644 meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
>  delete mode 100644 meta/recipes-support/libssh2/files/CVE-2019-17498.patch
>  rename meta/recipes-support/libssh2/{libssh2_1.9.0.bb => libssh2_1.10.0.bb} (78%)
>
> diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> index 5ff9bf84622..b1204e49eb8 100644
> --- a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> +++ b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> @@ -1,4 +1,4 @@
> -From f9e3e2ee7b18ba5bb8efe083171f3e701eb0a663 Mon Sep 17 00:00:00 2001
> +From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 2001
>  From: Your Name <you@example.com>
>  Date: Mon, 28 Dec 2020 02:08:03 +0000
>  Subject: [PATCH] Don't let host enviroment to decide if a test is build
> @@ -9,6 +9,7 @@ don't use SSHD on host to decide weither to build a test
>  Upstream-Status: Inappropriate[oe specific]
>
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
>  ---
>   tests/Makefile.am | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> @@ -41,6 +42,3 @@ index dc0922f..6cbc35d 100644
>  -endif
>  \ No newline at end of file
>  +endif
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch b/meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
> deleted file mode 100644
> index 1128c7ea0c2..00000000000
> --- a/meta/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From efe7101786193eaddb749c0583af6b54aec6f289 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 2 Feb 2021 18:45:16 -0800
> -Subject: [PATCH] configure: Conditionally undefine backend m4 macro
> -
> -Unlike the M4 builtin, this macro fails if macro is not defined
> -therefore recover the behavior of the builtin.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index fe5054a..758f8c2 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -127,7 +127,7 @@ fi
> - m4_set_foreach([crypto_backends], [backend],
> -   [AM_CONDITIONAL(m4_toupper(backend), test "$found_crypto" = "backend")]
> - )
> --m4_undefine([backend])
> -+m4_ifdef([backend], [m4_undefine([backend])])
> -
> -
> - # libz
> ---
> -2.30.0
> -
> diff --git a/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch b/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
> deleted file mode 100644
> index b331c1bf81b..00000000000
> --- a/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -From 1f76151c92e1b52e9c24ebf06adc77fbd6c062bc Mon Sep 17 00:00:00 2001
> -From: Will Cosgrove <will@panic.com>
> -Date: Tue, 26 Jan 2021 11:41:21 -0800
> -Subject: [PATCH] kex.c: move EC macro outside of if check #549 (#550)
> -
> -File: kex.c
> -
> -Notes:
> -Moved the macro LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY outside of the LIBSSH2_ECDSA since it's also now used by the ED25519 code.
> -
> -Sha 256, 384 and 512 need to be defined for all backends now even if they aren't used directly. I believe this is already the case, but just a heads up.
> -
> -Credit:
> -Stefan-Ghinea
> -
> -Upstream-Status: Backport
> -
> -Reference to upstream patch:
> -https://github.com/libssh2/libssh2/commit/1f76151c92e1b52e9c24ebf06adc77fbd6c062bc
> -
> -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ----
> - src/kex.c | 66 +++++++++++++++++++++++++++----------------------------
> - 1 file changed, 33 insertions(+), 33 deletions(-)
> -
> -diff --git a/src/kex.c b/src/kex.c
> -index cb16639..19ab6ec 100644
> ---- a/src/kex.c
> -+++ b/src/kex.c
> -@@ -1885,39 +1885,6 @@ kex_method_diffie_hellman_group_exchange_sha256_key_exchange
> - }
> -
> -
> --#if LIBSSH2_ECDSA
> --
> --/* kex_session_ecdh_curve_type
> -- * returns the EC curve type by name used in key exchange
> -- */
> --
> --static int
> --kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
> --{
> --    int ret = 0;
> --    libssh2_curve_type type;
> --
> --    if(name == NULL)
> --        return -1;
> --
> --    if(strcmp(name, "ecdh-sha2-nistp256") == 0)
> --        type = LIBSSH2_EC_CURVE_NISTP256;
> --    else if(strcmp(name, "ecdh-sha2-nistp384") == 0)
> --        type = LIBSSH2_EC_CURVE_NISTP384;
> --    else if(strcmp(name, "ecdh-sha2-nistp521") == 0)
> --        type = LIBSSH2_EC_CURVE_NISTP521;
> --    else {
> --        ret = -1;
> --    }
> --
> --    if(ret == 0 && out_type) {
> --        *out_type = type;
> --    }
> --
> --    return ret;
> --}
> --
> --
> - /* LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY
> -  *
> -  * Macro that create and verifies EC SHA hash with a given digest bytes
> -@@ -2027,6 +1994,39 @@ kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
> - }                                                                       \
> -
> -
> -+#if LIBSSH2_ECDSA
> -+
> -+/* kex_session_ecdh_curve_type
> -+ * returns the EC curve type by name used in key exchange
> -+ */
> -+
> -+static int
> -+kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
> -+{
> -+    int ret = 0;
> -+    libssh2_curve_type type;
> -+
> -+    if(name == NULL)
> -+        return -1;
> -+
> -+    if(strcmp(name, "ecdh-sha2-nistp256") == 0)
> -+        type = LIBSSH2_EC_CURVE_NISTP256;
> -+    else if(strcmp(name, "ecdh-sha2-nistp384") == 0)
> -+        type = LIBSSH2_EC_CURVE_NISTP384;
> -+    else if(strcmp(name, "ecdh-sha2-nistp521") == 0)
> -+        type = LIBSSH2_EC_CURVE_NISTP521;
> -+    else {
> -+        ret = -1;
> -+    }
> -+
> -+    if(ret == 0 && out_type) {
> -+        *out_type = type;
> -+    }
> -+
> -+    return ret;
> -+}
> -+
> -+
> - /* ecdh_sha2_nistp
> -  * Elliptic Curve Diffie Hellman Key Exchange
> -  */
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-support/libssh2/files/CVE-2019-17498.patch b/meta/recipes-support/libssh2/files/CVE-2019-17498.patch
> deleted file mode 100644
> index 001080072b6..00000000000
> --- a/meta/recipes-support/libssh2/files/CVE-2019-17498.patch
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -From dedcbd106f8e52d5586b0205bc7677e4c9868f9c Mon Sep 17 00:00:00 2001
> -From: Will Cosgrove <will@panic.com>
> -Date: Fri, 30 Aug 2019 09:57:38 -0700
> -Subject: [PATCH] packet.c: improve message parsing (#402)
> -
> -* packet.c: improve parsing of packets
> -
> -file: packet.c
> -
> -notes:
> -Use _libssh2_get_string API in SSH_MSG_DEBUG/SSH_MSG_DISCONNECT. Additional uint32 bounds check in SSH_MSG_GLOBAL_REQUEST.
> -
> -Upstream-Status: Backport
> -CVE: CVE-2019-17498
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ----
> - src/packet.c | 68 ++++++++++++++++++++++------------------------------
> - 1 file changed, 29 insertions(+), 39 deletions(-)
> -
> -diff --git a/src/packet.c b/src/packet.c
> -index 38ab629..2e01bfc 100644
> ---- a/src/packet.c
> -+++ b/src/packet.c
> -@@ -419,8 +419,8 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> -                     size_t datalen, int macstate)
> - {
> -     int rc = 0;
> --    char *message = NULL;
> --    char *language = NULL;
> -+    unsigned char *message = NULL;
> -+    unsigned char *language = NULL;
> -     size_t message_len = 0;
> -     size_t language_len = 0;
> -     LIBSSH2_CHANNEL *channelp = NULL;
> -@@ -472,33 +472,23 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> -
> -         case SSH_MSG_DISCONNECT:
> -             if(datalen >= 5) {
> --                size_t reason = _libssh2_ntohu32(data + 1);
> -+                uint32_t reason = 0;
> -+                struct string_buf buf;
> -+                buf.data = (unsigned char *)data;
> -+                buf.dataptr = buf.data;
> -+                buf.len = datalen;
> -+                buf.dataptr++; /* advance past type */
> -
> --                if(datalen >= 9) {
> --                    message_len = _libssh2_ntohu32(data + 5);
> -+                _libssh2_get_u32(&buf, &reason);
> -+                _libssh2_get_string(&buf, &message, &message_len);
> -+                _libssh2_get_string(&buf, &language, &language_len);
> -
> --                    if(message_len < datalen-13) {
> --                        /* 9 = packet_type(1) + reason(4) + message_len(4) */
> --                        message = (char *) data + 9;
> --
> --                        language_len =
> --                            _libssh2_ntohu32(data + 9 + message_len);
> --                        language = (char *) data + 9 + message_len + 4;
> --
> --                        if(language_len > (datalen-13-message_len)) {
> --                            /* bad input, clear info */
> --                            language = message = NULL;
> --                            language_len = message_len = 0;
> --                        }
> --                    }
> --                    else
> --                        /* bad size, clear it */
> --                        message_len = 0;
> --                }
> -                 if(session->ssh_msg_disconnect) {
> --                    LIBSSH2_DISCONNECT(session, reason, message,
> --                                       message_len, language, language_len);
> -+                    LIBSSH2_DISCONNECT(session, reason, (const char *)message,
> -+                                       message_len, (const char *)language,
> -+                                       language_len);
> -                 }
> -+
> -                 _libssh2_debug(session, LIBSSH2_TRACE_TRANS,
> -                                "Disconnect(%d): %s(%s)", reason,
> -                                message, language);
> -@@ -539,24 +529,24 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> -                 int always_display = data[1];
> -
> -                 if(datalen >= 6) {
> --                    message_len = _libssh2_ntohu32(data + 2);
> --
> --                    if(message_len <= (datalen - 10)) {
> --                        /* 6 = packet_type(1) + display(1) + message_len(4) */
> --                        message = (char *) data + 6;
> --                        language_len = _libssh2_ntohu32(data + 6 +
> --                                                        message_len);
> --
> --                        if(language_len <= (datalen - 10 - message_len))
> --                            language = (char *) data + 10 + message_len;
> --                    }
> -+                    struct string_buf buf;
> -+                    buf.data = (unsigned char *)data;
> -+                    buf.dataptr = buf.data;
> -+                    buf.len = datalen;
> -+                    buf.dataptr += 2; /* advance past type & always display */
> -+
> -+                    _libssh2_get_string(&buf, &message, &message_len);
> -+                    _libssh2_get_string(&buf, &language, &language_len);
> -                 }
> -
> -                 if(session->ssh_msg_debug) {
> --                    LIBSSH2_DEBUG(session, always_display, message,
> --                                  message_len, language, language_len);
> -+                    LIBSSH2_DEBUG(session, always_display,
> -+                                  (const char *)message,
> -+                                  message_len, (const char *)language,
> -+                                  language_len);
> -                 }
> -             }
> -+
> -             /*
> -              * _libssh2_debug will actually truncate this for us so
> -              * that it's not an inordinate about of data
> -@@ -579,7 +569,7 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> -                 uint32_t len = 0;
> -                 unsigned char want_reply = 0;
> -                 len = _libssh2_ntohu32(data + 1);
> --                if(datalen >= (6 + len)) {
> -+                if((len <= (UINT_MAX - 6)) && (datalen >= (6 + len))) {
> -                     want_reply = data[5 + len];
> -                     _libssh2_debug(session,
> -                                    LIBSSH2_TRACE_CONN,
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-support/libssh2/libssh2_1.9.0.bb b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
> similarity index 78%
> rename from meta/recipes-support/libssh2/libssh2_1.9.0.bb
> rename to meta/recipes-support/libssh2/libssh2_1.10.0.bb
> index a0cbb6af6b7..072d6819c0c 100644
> --- a/meta/recipes-support/libssh2/libssh2_1.9.0.bb
> +++ b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
> @@ -5,19 +5,15 @@ SECTION = "libs"
>  DEPENDS = "zlib"
>
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3e089ad0cf27edf1e7f261dfcd06acc7"
>
>  SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
> -           file://CVE-2019-17498.patch \
> -           file://0001-configure-Conditionally-undefine-backend-m4-macro.patch \
>             file://run-ptest \
> -           file://0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch \
> -"
> +           "
>
>  SRC_URI:append:ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
>
> -SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
> -SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
> +SRC_URI[sha256sum] = "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
>
>  inherit autotools pkgconfig ptest
>
> --
> 2.20.1
>

