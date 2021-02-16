Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.9824.1613491361954935252
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 08:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uTgE9Lm5;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id l18so6214535pji.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nGqUZzWKjhOPqKgE74mRTeAhq4YNOCikEb28giV2fm0=;
        b=uTgE9Lm5edqc3NTtXxmKpqNQHGfqpamsqUWqRhDRJ1xPs6btKg4C75H1KbWl4Hc7Jr
         2Yh3lG0sLI+aUkp2DePpcr4A2WO8vtWaWLbUlrt5IKwu4/cJ4IKe3fN5NFrlvPbQrz65
         ukK9SUxEeJgsemWGQexG+olquVrt8+YONnjYqpAahMyDDPCfDlIbnGE+U6QMGb6uYvbH
         s000JiE6AhCt3egBa5DlxVl5TsxRbu5IxYdM74WGdh3V7hofgUkVb9bNwctYKdFR7GrI
         aVBpmBUV7lZlDwpyFt5GCG71FfayX1zPKhYAru8Vk2yrJBxVsYaHK0Xwkqg25LI0HxTx
         0/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=nGqUZzWKjhOPqKgE74mRTeAhq4YNOCikEb28giV2fm0=;
        b=SYeNayZRxGIjjWsVdvayrL2l75YQwYtxQS7Xiws7BfktS0agxBPfgFTn8v8A1OYKbC
         NjKgjtq2VSur25ubk/Hd41bK4ynSxNd8dx3PzzSOIDkiLmip+dpRc0UO7Y+CYWC07kRB
         NiRGvWg3ktqcn92cqZrZVktJ/ehlyW/oQ+299bKtqZgtPI/Fm86U2W5qsv0p7zPBUdmx
         i6nn6SqqjcE44w27l+v+lUgiRbKzigFBGyFYQZ6dBjuNfp7jwvFOA6hs3azIrs13FfTc
         zodlSM1D9tCShV3T0zHcca7fMgNigh/i+gM8lLzAbvHY5b+BYxxE/U4xmbs9MHptk7A4
         IOZw==
X-Gm-Message-State: AOAM532GWyvgHf4IZR1238+W0PDkk9diNyynYn2srzFUddvTADwWg/fX
	La6Aq9r6fMPoEBy1bGohOAQ=
X-Google-Smtp-Source: ABdhPJyoXpB/o1DIAw5gWXjmxqbcP3tbCsn2VRk/57y8ih0DtmNPJMKkkaPzwEBfQKk7jXCGaC5pIA==
X-Received: by 2002:a17:903:3049:b029:e2:8af3:76ec with SMTP id u9-20020a1709033049b02900e28af376ecmr20457678pla.51.1613491361317;
        Tue, 16 Feb 2021 08:02:41 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3567:4d62:c82e:b7f7? ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id d133sm21530832pfd.6.2021.02.16.08.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 08:02:40 -0800 (PST)
Subject: Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2: Add fix for CVE-2020-11080
To: Rahul Taya <Rahul.Taya@kpit.com>,
 Openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com, harpritkaur.bhandari@kpit.com
References: <20210216083900.7631-1-Rahul.Taya@kpit.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <8abf4b2a-c035-eba0-0a19-8136296e4ad4@gmail.com>
Date: Tue, 16 Feb 2021 08:02:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216083900.7631-1-Rahul.Taya@kpit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/16/21 12:39 AM, Rahul Taya wrote:
> Added patch for CVE-2020-11080 taken from below link:
> https://github.com/nghttp2/nghttp2/commit/336a98feb0d56b9ac54e12736b18785c27f75090
>
> Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
Wrong ML. 

Is master or Gatesgath affected by this?

Also the patch it self is missing your signoff.

-armin
> ---
>  .../nghttp2/nghttp2/CVE-2020-11080.patch      | 306 ++++++++++++++++++
>  .../recipes-support/nghttp2/nghttp2_1.40.0.bb |   1 +
>  2 files changed, 307 insertions(+)
>  create mode 100644 meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
>
> diff --git a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> new file mode 100644
> index 000000000..a376e5372
> --- /dev/null
> +++ b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> @@ -0,0 +1,306 @@
> +From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17 00:00:00 2001
> +From: James M Snell <jasnell@gmail.com>
> +Date: Fri, 17 Apr 2020 16:53:51 -0700
> +Subject: [PATCH] Implement max settings option
> +
> +CVE: CVE-2020-11080
> +Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/336a98feb0d56b9ac54e12736b18785c27f75090]
> +Comment: No hunks refreshed
> +---
> + doc/CMakeLists.txt             |  1 +
> + doc/Makefile.am                |  1 +
> + lib/includes/nghttp2/nghttp2.h | 23 +++++++++++++
> + lib/nghttp2_helper.c           |  2 ++
> + lib/nghttp2_option.c           |  5 +++
> + lib/nghttp2_option.h           |  5 +++
> + lib/nghttp2_session.c          | 21 ++++++++++++
> + lib/nghttp2_session.h          |  2 ++
> + tests/main.c                   |  2 ++
> + tests/nghttp2_session_test.c   | 61 ++++++++++++++++++++++++++++++++++
> + tests/nghttp2_session_test.h   |  1 +
> + 11 files changed, 124 insertions(+)
> +
> +diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
> +index 34c027929..f3aec84da 100644
> +--- a/doc/CMakeLists.txt
> ++++ b/doc/CMakeLists.txt
> +@@ -42,6 +42,7 @@ set(APIDOCS
> +   nghttp2_option_set_no_recv_client_magic.rst
> +   nghttp2_option_set_peer_max_concurrent_streams.rst
> +   nghttp2_option_set_user_recv_extension_type.rst
> ++  nghttp2_option_set_max_settings.rst
> +   nghttp2_pack_settings_payload.rst
> +   nghttp2_priority_spec_check_default.rst
> +   nghttp2_priority_spec_default_init.rst
> +diff --git a/doc/Makefile.am b/doc/Makefile.am
> +index 4d73cef50..f073bfa4c 100644
> +--- a/doc/Makefile.am
> ++++ b/doc/Makefile.am
> +@@ -69,6 +69,7 @@ APIDOCS= \
> +       nghttp2_option_set_peer_max_concurrent_streams.rst \
> +       nghttp2_option_set_user_recv_extension_type.rst \
> +       nghttp2_option_set_max_outbound_ack.rst \
> ++      nghttp2_option_set_max_settings.rst \
> +       nghttp2_pack_settings_payload.rst \
> +       nghttp2_priority_spec_check_default.rst \
> +       nghttp2_priority_spec_default_init.rst \
> +diff --git a/lib/includes/nghttp2/nghttp2.h b/lib/includes/nghttp2/nghttp2.h
> +index e3aeb9fed..9be6eea5c 100644
> +--- a/lib/includes/nghttp2/nghttp2.h
> ++++ b/lib/includes/nghttp2/nghttp2.h
> +@@ -228,6 +228,13 @@ typedef struct {
> +  */
> + #define NGHTTP2_CLIENT_MAGIC_LEN 24
> +
> ++/**
> ++ * @macro
> ++ *
> ++ * The default max number of settings per SETTINGS frame
> ++ */
> ++#define NGHTTP2_DEFAULT_MAX_SETTINGS 32
> ++
> + /**
> +  * @enum
> +  *
> +@@ -398,6 +405,11 @@ typedef enum {
> +    * receives an other type of frame.
> +    */
> +   NGHTTP2_ERR_SETTINGS_EXPECTED = -536,
> ++  /**
> ++   * When a local endpoint receives too many settings entries
> ++   * in a single SETTINGS frame.
> ++   */
> ++  NGHTTP2_ERR_TOO_MANY_SETTINGS = -537,
> +   /**
> +    * The errors < :enum:`NGHTTP2_ERR_FATAL` mean that the library is
> +    * under unexpected condition and processing was terminated (e.g.,
> +@@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void nghttp2_option_set_no_closed_streams(nghttp2_option *option,
> + NGHTTP2_EXTERN void nghttp2_option_set_max_outbound_ack(nghttp2_option *option,
> +                                                         size_t val);
> +
> ++/**
> ++ * @function
> ++ *
> ++ * This function sets the maximum number of SETTINGS entries per
> ++ * SETTINGS frame that will be accepted. If more than those entries
> ++ * are received, the peer is considered to be misbehaving and session
> ++ * will be closed. The default value is 32.
> ++ */
> ++NGHTTP2_EXTERN void nghttp2_option_set_max_settings(nghttp2_option *option,
> ++                                                    size_t val);
> ++
> + /**
> +  * @function
> +  *
> +diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c
> +index 91136a619..0bd541472 100644
> +--- a/lib/nghttp2_helper.c
> ++++ b/lib/nghttp2_helper.c
> +@@ -334,6 +334,8 @@ const char *nghttp2_strerror(int error_code) {
> +   case NGHTTP2_ERR_FLOODED:
> +     return "Flooding was detected in this HTTP/2 session, and it must be "
> +            "closed";
> ++  case NGHTTP2_ERR_TOO_MANY_SETTINGS:
> ++    return "SETTINGS frame contained more than the maximum allowed entries";
> +   default:
> +     return "Unknown error code";
> +   }
> +diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c
> +index e53f22d36..34348e660 100644
> +--- a/lib/nghttp2_option.c
> ++++ b/lib/nghttp2_option.c
> +@@ -121,3 +121,8 @@ void nghttp2_option_set_max_outbound_ack(nghttp2_option *option, size_t val) {
> +   option->opt_set_mask |= NGHTTP2_OPT_MAX_OUTBOUND_ACK;
> +   option->max_outbound_ack = val;
> + }
> ++
> ++void nghttp2_option_set_max_settings(nghttp2_option *option, size_t val) {
> ++  option->opt_set_mask |= NGHTTP2_OPT_MAX_SETTINGS;
> ++  option->max_settings = val;
> ++}
> +diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h
> +index 1f740aaa6..939729fdc 100644
> +--- a/lib/nghttp2_option.h
> ++++ b/lib/nghttp2_option.h
> +@@ -67,6 +67,7 @@ typedef enum {
> +   NGHTTP2_OPT_MAX_DEFLATE_DYNAMIC_TABLE_SIZE = 1 << 9,
> +   NGHTTP2_OPT_NO_CLOSED_STREAMS = 1 << 10,
> +   NGHTTP2_OPT_MAX_OUTBOUND_ACK = 1 << 11,
> ++  NGHTTP2_OPT_MAX_SETTINGS = 1 << 12,
> + } nghttp2_option_flag;
> +
> + /**
> +@@ -85,6 +86,10 @@ struct nghttp2_option {
> +    * NGHTTP2_OPT_MAX_OUTBOUND_ACK
> +    */
> +   size_t max_outbound_ack;
> ++  /**
> ++   * NGHTTP2_OPT_MAX_SETTINGS
> ++   */
> ++  size_t max_settings;
> +   /**
> +    * Bitwise OR of nghttp2_option_flag to determine that which fields
> +    * are specified.
> +diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
> +index 563ccd7de..415e34776 100644
> +--- a/lib/nghttp2_session.c
> ++++ b/lib/nghttp2_session.c
> +@@ -458,6 +458,7 @@ static int session_new(nghttp2_session **session_ptr,
> +
> +   (*session_ptr)->max_send_header_block_length = NGHTTP2_MAX_HEADERSLEN;
> +   (*session_ptr)->max_outbound_ack = NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM;
> ++  (*session_ptr)->max_settings = NGHTTP2_DEFAULT_MAX_SETTINGS;
> +
> +   if (option) {
> +     if ((option->opt_set_mask & NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE) &&
> +@@ -521,6 +522,11 @@ static int session_new(nghttp2_session **session_ptr,
> +     if (option->opt_set_mask & NGHTTP2_OPT_MAX_OUTBOUND_ACK) {
> +       (*session_ptr)->max_outbound_ack = option->max_outbound_ack;
> +     }
> ++
> ++    if ((option->opt_set_mask & NGHTTP2_OPT_MAX_SETTINGS) &&
> ++        option->max_settings) {
> ++      (*session_ptr)->max_settings = option->max_settings;
> ++    }
> +   }
> +
> +   rv = nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
> +@@ -5657,6 +5663,16 @@ ssize_t nghttp2_session_mem_recv(nghttp2_session *session, const uint8_t *in,
> +           iframe->max_niv =
> +               iframe->frame.hd.length / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH + 1;
> +
> ++          if (iframe->max_niv - 1 > session->max_settings) {
> ++            rv = nghttp2_session_terminate_session_with_reason(
> ++                session, NGHTTP2_ENHANCE_YOUR_CALM,
> ++                "SETTINGS: too many setting entries");
> ++            if (nghttp2_is_fatal(rv)) {
> ++              return rv;
> ++            }
> ++            return (ssize_t)inlen;
> ++          }
> ++
> +           iframe->iv = nghttp2_mem_malloc(mem, sizeof(nghttp2_settings_entry) *
> +                                                    iframe->max_niv);
> +
> +@@ -7425,6 +7441,11 @@ static int nghttp2_session_upgrade_internal(nghttp2_session *session,
> +   if (settings_payloadlen % NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH) {
> +     return NGHTTP2_ERR_INVALID_ARGUMENT;
> +   }
> ++  /* SETTINGS frame contains too many settings */
> ++  if (settings_payloadlen / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH
> ++        > session->max_settings) {
> ++    return NGHTTP2_ERR_TOO_MANY_SETTINGS;
> ++  }
> +   rv = nghttp2_frame_unpack_settings_payload2(&iv, &niv, settings_payload,
> +                                               settings_payloadlen, mem);
> +   if (rv != 0) {
> +diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h
> +index d20827315..07bfbb6c9 100644
> +--- a/lib/nghttp2_session.h
> ++++ b/lib/nghttp2_session.h
> +@@ -267,6 +267,8 @@ struct nghttp2_session {
> +   /* The maximum length of header block to send.  Calculated by the
> +      same way as nghttp2_hd_deflate_bound() does. */
> +   size_t max_send_header_block_length;
> ++  /* The maximum number of settings accepted per SETTINGS frame. */
> ++  size_t max_settings;
> +   /* Next Stream ID. Made unsigned int to detect >= (1 << 31). */
> +   uint32_t next_stream_id;
> +   /* The last stream ID this session initiated.  For client session,
> +diff --git a/tests/main.c b/tests/main.c
> +index 41e0b03eb..67eb4a1c2 100644
> +--- a/tests/main.c
> ++++ b/tests/main.c
> +@@ -317,6 +317,8 @@ int main() {
> +                    test_nghttp2_session_set_local_window_size) ||
> +       !CU_add_test(pSuite, "session_cancel_from_before_frame_send",
> +                    test_nghttp2_session_cancel_from_before_frame_send) ||
> ++      !CU_add_test(pSuite, "session_too_many_settings",
> ++                   test_nghttp2_session_too_many_settings) ||
> +       !CU_add_test(pSuite, "session_removed_closed_stream",
> +                    test_nghttp2_session_removed_closed_stream) ||
> +       !CU_add_test(pSuite, "session_pause_data",
> +diff --git a/tests/nghttp2_session_test.c b/tests/nghttp2_session_test.c
> +index 6eb8e244d..33ee3ad84 100644
> +--- a/tests/nghttp2_session_test.c
> ++++ b/tests/nghttp2_session_test.c
> +@@ -10614,6 +10614,67 @@ void test_nghttp2_session_cancel_from_before_frame_send(void) {
> +   nghttp2_session_del(session);
> + }
> +
> ++void test_nghttp2_session_too_many_settings(void) {
> ++  nghttp2_session *session;
> ++  nghttp2_option *option;
> ++  nghttp2_session_callbacks callbacks;
> ++  nghttp2_frame frame;
> ++  nghttp2_bufs bufs;
> ++  nghttp2_buf *buf;
> ++  ssize_t rv;
> ++  my_user_data ud;
> ++  nghttp2_settings_entry iv[3];
> ++  nghttp2_mem *mem;
> ++  nghttp2_outbound_item *item;
> ++
> ++  mem = nghttp2_mem_default();
> ++  frame_pack_bufs_init(&bufs);
> ++
> ++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
> ++  callbacks.on_frame_recv_callback = on_frame_recv_callback;
> ++  callbacks.send_callback = null_send_callback;
> ++
> ++  nghttp2_option_new(&option);
> ++  nghttp2_option_set_max_settings(option, 1);
> ++
> ++  nghttp2_session_client_new2(&session, &callbacks, &ud, option);
> ++
> ++  CU_ASSERT(1 == session->max_settings);
> ++
> ++  nghttp2_option_del(option);
> ++
> ++  iv[0].settings_id = NGHTTP2_SETTINGS_HEADER_TABLE_SIZE;
> ++  iv[0].value = 3000;
> ++
> ++  iv[1].settings_id = NGHTTP2_SETTINGS_INITIAL_WINDOW_SIZE;
> ++  iv[1].value = 16384;
> ++
> ++  nghttp2_frame_settings_init(&frame.settings, NGHTTP2_FLAG_NONE, dup_iv(iv, 2),
> ++                              2);
> ++
> ++  rv = nghttp2_frame_pack_settings(&bufs, &frame.settings);
> ++
> ++  CU_ASSERT(0 == rv);
> ++  CU_ASSERT(nghttp2_bufs_len(&bufs) > 0);
> ++
> ++  nghttp2_frame_settings_free(&frame.settings, mem);
> ++
> ++  buf = &bufs.head->buf;
> ++  assert(nghttp2_bufs_len(&bufs) == nghttp2_buf_len(buf));
> ++
> ++  ud.frame_recv_cb_called = 0;
> ++
> ++  rv = nghttp2_session_mem_recv(session, buf->pos, nghttp2_buf_len(buf));
> ++  CU_ASSERT((ssize_t)nghttp2_buf_len(buf) == rv);
> ++
> ++  item = nghttp2_session_get_next_ob_item(session);
> ++  CU_ASSERT(NGHTTP2_GOAWAY == item->frame.hd.type);
> ++
> ++  nghttp2_bufs_reset(&bufs);
> ++  nghttp2_bufs_free(&bufs);
> ++  nghttp2_session_del(session);
> ++}
> ++
> + static void
> + prepare_session_removed_closed_stream(nghttp2_session *session,
> +                                       nghttp2_hd_deflater *deflater) {
> +diff --git a/tests/nghttp2_session_test.h b/tests/nghttp2_session_test.h
> +index e872c5d0b..818c808d0 100644
> +--- a/tests/nghttp2_session_test.h
> ++++ b/tests/nghttp2_session_test.h
> +@@ -156,6 +156,7 @@ void test_nghttp2_session_repeated_priority_change(void);
> + void test_nghttp2_session_repeated_priority_submission(void);
> + void test_nghttp2_session_set_local_window_size(void);
> + void test_nghttp2_session_cancel_from_before_frame_send(void);
> ++void test_nghttp2_session_too_many_settings(void);
> + void test_nghttp2_session_removed_closed_stream(void);
> + void test_nghttp2_session_pause_data(void);
> + void test_nghttp2_session_no_closed_streams(void);
> diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> index 9ed8c5642..b212ede4d 100644
> --- a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> +++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> @@ -10,6 +10,7 @@ UPSTREAM_CHECK_URI = "https://github.com/nghttp2/nghttp2/releases"
>  SRC_URI = "\
>      https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
>      file://0001-fetch-ocsp-response-use-python3.patch \
> +    file://CVE-2020-11080.patch \
>  "
>  SRC_URI[md5sum] = "8d1a6b96760254e4dd142d7176e8fb7c"
>  SRC_URI[sha256sum] = "09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed3bc4cdcee69073"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
>
> 
>

