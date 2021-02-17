Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.8944.1613575220037882939
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 07:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RcoXh4X0;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id u11so7547744plg.13
        for <Openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 07:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EOdI0+OfYYDDF5OO5jVFcrEcdv9CeFfxIzCiVBiKJtc=;
        b=RcoXh4X05TW6AnBTM8T3WfnGpNPim3uNMf9lGsjXd25+qbLbfaqPn9qwGcVfHjHhgI
         TWeVv6TVA1cg2b3FhribxqzG8QRlGhoSADmBCilCNFQaXohohMC/SvOsOAPmVHDTQxCU
         /4Ax53CN/iGhlFc2AzwKRacdfrtp3BBhrl4gF4dSSlrS2DUyFVTIDC2Vo+RrkMgGVDD9
         uVpiTn/FkGRNt0z/0Q0JJhs8Verd5EdeGOASLMDLQUXWx0IOrSTJPd0GtxRh87zC5Nej
         4eZDov+AGAr9EISnq7WOQn9aCx7znkhV3RJ9cklHezWOBtPWa0+nlWhLbyUL4CYJu7Fk
         Uyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=EOdI0+OfYYDDF5OO5jVFcrEcdv9CeFfxIzCiVBiKJtc=;
        b=Tt1B4E1FCfL6G3iEaywe7/I0aEXLsvKa/zRyavl5usXYfjnJLhAxrBKkMhEP63TjYA
         geJhWD2MVqBXVK0WhF9hYpIBWHfnZzh4Ry3ikFuhe6JD4yM7HTUbYMQzYAJSwPrAQvz0
         ud/wsLq4/fzTFqPlgOmdXC4A9748yScxMdW3jhUCIRS/sbchSuO0oz4IOXS+2ufTyNn4
         TTAuCNxAB2EAUQEMJJ1/RLZfRKBXluIsfTp555egYcJ4YJBPHi14K5vcNM/WFYi0+KUL
         xL9WSrbLHRiPYSkeoc8Tez10ZToda6RYbwfb9bdnBLaQsYYLexDNgF+F0UxV4yQENVsA
         PRBg==
X-Gm-Message-State: AOAM532G5KCdNAIDXCFzbWzXPlicvwS9Fc1DkBHRqEGOWCbfcS7v/vK/
	dtYbe2q8QJPHBZEYpit3iKA=
X-Google-Smtp-Source: ABdhPJxccyMfDRdDXb7H8H+iyO/Rcuhr+WpgFbK13XHvqZm6HLvigpuAfpz3TvHgo0wbYVeJ9HPVKw==
X-Received: by 2002:a17:902:e54e:b029:de:8c70:2ec4 with SMTP id n14-20020a170902e54eb02900de8c702ec4mr25266717plf.56.1613575219387;
        Wed, 17 Feb 2021 07:20:19 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7db1:8052:decd:2a75? ([2601:202:4180:a5c0:7db1:8052:decd:2a75])
        by smtp.gmail.com with ESMTPSA id v185sm2786612pfb.125.2021.02.17.07.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Feb 2021 07:20:18 -0800 (PST)
Subject: Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2: Add fix for CVE-2020-11080
To: Rahul Taya <Rahul.Taya@kpit.com>,
 "Openembedded-core@lists.openembedded.org"
 <Openembedded-core@lists.openembedded.org>,
 "raj.khem@gmail.com" <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>,
 Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
References: <20210216083900.7631-1-Rahul.Taya@kpit.com>
 <8abf4b2a-c035-eba0-0a19-8136296e4ad4@gmail.com>
 <BMXPR01MB34318E8491F3B495127DDFB8F2869@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d0888474-b89b-51f3-5303-407c52fefad3@gmail.com>
Date: Wed, 17 Feb 2021 07:20:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BMXPR01MB34318E8491F3B495127DDFB8F2869@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/17/21 12:57 AM, Rahul Taya wrote:
> Hi,
>
> I have backported this patch from Master branch as in master(v1.43.0)
> and Gatesgarth(v1.41.0) the code of this patch is already present in
> the source code so it is only applicable for Dunfell(v1.40.0) and
> Zeus(v1.39.1) branch.
>
> Yes i will add my signoff in the patch.
>
> *Can you please tell which is the correct ML for sending this patch ?*
openembedded-devel@lists.openembedded.org


Also I am seeing this this  error.

Applying patch CVE-2020-11080.patch
patching file doc/CMakeLists.txt
patching file doc/Makefile.am
Hunk #1 FAILED at 69.
1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
patching file lib/includes/nghttp2/nghttp2.h
patching file lib/nghttp2_helper.c
patching file lib/nghttp2_option.c
patching file lib/nghttp2_option.h
patching file lib/nghttp2_session.c
Hunk #3 succeeded at 5694 (offset 31 lines).
Hunk #4 succeeded at 7470 (offset 29 lines).
patching file lib/nghttp2_session.h
patching file tests/main.c
Hunk #1 succeeded at 315 (offset -2 lines).
patching file tests/nghttp2_session_test.c
Hunk #1 succeeded at 10558 (offset -56 lines).
patching file tests/nghttp2_session_test.h
Patch CVE-2020-11080.patch does not apply (enforce with -f)*
*
-armin*
*
>
> Thanks and Regards,
> Rahul Taya
> ------------------------------------------------------------------------
> *From:* akuster808 <akuster808@gmail.com>
> *Sent:* Tuesday, February 16, 2021 9:32 PM
> *To:* Rahul Taya <Rahul.Taya@kpit.com>;
> Openembedded-core@lists.openembedded.org
> <Openembedded-core@lists.openembedded.org>; raj.khem@gmail.com
> <raj.khem@gmail.com>
> *Cc:* Nisha Parrakat <Nisha.Parrakat@kpit.com>; Harpritkaur Bhandari
> <Harpritkaur.Bhandari@kpit.com>
> *Subject:* Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2:
> Add fix for CVE-2020-11080
>  
>
>
> On 2/16/21 12:39 AM, Rahul Taya wrote:
> > Added patch for CVE-2020-11080 taken from below link:
> >
> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c27f75090&amp;data=04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=LO7%2BKX%2F6ZD4VSi85fOVS%2FydUAFSH1kCUamqOyQcV0Ww%3D&amp;reserved=0
> >
> > Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> Wrong ML. 
>
> Is master or Gatesgath affected by this?
>
> Also the patch it self is missing your signoff.
>
> -armin
> > ---
> >  .../nghttp2/nghttp2/CVE-2020-11080.patch      | 306 ++++++++++++++++++
> >  .../recipes-support/nghttp2/nghttp2_1.40.0.bb |   1 +
> >  2 files changed, 307 insertions(+)
> >  create mode 100644
> meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> >
> > diff --git
> a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> > new file mode 100644
> > index 000000000..a376e5372
> > --- /dev/null
> > +++
> b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> > @@ -0,0 +1,306 @@
> > +From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17 00:00:00 2001
> > +From: James M Snell <jasnell@gmail.com>
> > +Date: Fri, 17 Apr 2020 16:53:51 -0700
> > +Subject: [PATCH] Implement max settings option
> > +
> > +CVE: CVE-2020-11080
> > +Upstream-Status: Backport
> [https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c27f75090&amp;data=04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=LO7%2BKX%2F6ZD4VSi85fOVS%2FydUAFSH1kCUamqOyQcV0Ww%3D&amp;reserved=0]
> > +Comment: No hunks refreshed
> > +---
> > + doc/CMakeLists.txt             |  1 +
> > + doc/Makefile.am                |  1 +
> > + lib/includes/nghttp2/nghttp2.h | 23 +++++++++++++
> > + lib/nghttp2_helper.c           |  2 ++
> > + lib/nghttp2_option.c           |  5 +++
> > + lib/nghttp2_option.h           |  5 +++
> > + lib/nghttp2_session.c          | 21 ++++++++++++
> > + lib/nghttp2_session.h          |  2 ++
> > + tests/main.c                   |  2 ++
> > + tests/nghttp2_session_test.c   | 61 ++++++++++++++++++++++++++++++++++
> > + tests/nghttp2_session_test.h   |  1 +
> > + 11 files changed, 124 insertions(+)
> > +
> > +diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
> > +index 34c027929..f3aec84da 100644
> > +--- a/doc/CMakeLists.txt
> > ++++ b/doc/CMakeLists.txt
> > +@@ -42,6 +42,7 @@ set(APIDOCS
> > +   nghttp2_option_set_no_recv_client_magic.rst
> > +   nghttp2_option_set_peer_max_concurrent_streams.rst
> > +   nghttp2_option_set_user_recv_extension_type.rst
> > ++  nghttp2_option_set_max_settings.rst
> > +   nghttp2_pack_settings_payload.rst
> > +   nghttp2_priority_spec_check_default.rst
> > +   nghttp2_priority_spec_default_init.rst
> > +diff --git a/doc/Makefile.am b/doc/Makefile.am
> > +index 4d73cef50..f073bfa4c 100644
> > +--- a/doc/Makefile.am
> > ++++ b/doc/Makefile.am
> > +@@ -69,6 +69,7 @@ APIDOCS= \
> > +       nghttp2_option_set_peer_max_concurrent_streams.rst \
> > +       nghttp2_option_set_user_recv_extension_type.rst \
> > +       nghttp2_option_set_max_outbound_ack.rst \
> > ++      nghttp2_option_set_max_settings.rst \
> > +       nghttp2_pack_settings_payload.rst \
> > +       nghttp2_priority_spec_check_default.rst \
> > +       nghttp2_priority_spec_default_init.rst \
> > +diff --git a/lib/includes/nghttp2/nghttp2.h
> b/lib/includes/nghttp2/nghttp2.h
> > +index e3aeb9fed..9be6eea5c 100644
> > +--- a/lib/includes/nghttp2/nghttp2.h
> > ++++ b/lib/includes/nghttp2/nghttp2.h
> > +@@ -228,6 +228,13 @@ typedef struct {
> > +  */
> > + #define NGHTTP2_CLIENT_MAGIC_LEN 24
> > +
> > ++/**
> > ++ * @macro
> > ++ *
> > ++ * The default max number of settings per SETTINGS frame
> > ++ */
> > ++#define NGHTTP2_DEFAULT_MAX_SETTINGS 32
> > ++
> > + /**
> > +  * @enum
> > +  *
> > +@@ -398,6 +405,11 @@ typedef enum {
> > +    * receives an other type of frame.
> > +    */
> > +   NGHTTP2_ERR_SETTINGS_EXPECTED = -536,
> > ++  /**
> > ++   * When a local endpoint receives too many settings entries
> > ++   * in a single SETTINGS frame.
> > ++   */
> > ++  NGHTTP2_ERR_TOO_MANY_SETTINGS = -537,
> > +   /**
> > +    * The errors < :enum:`NGHTTP2_ERR_FATAL` mean that the library is
> > +    * under unexpected condition and processing was terminated (e.g.,
> > +@@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void
> nghttp2_option_set_no_closed_streams(nghttp2_option *option,
> > + NGHTTP2_EXTERN void
> nghttp2_option_set_max_outbound_ack(nghttp2_option *option,
> > +                                                         size_t val);
> > +
> > ++/**
> > ++ * @function
> > ++ *
> > ++ * This function sets the maximum number of SETTINGS entries per
> > ++ * SETTINGS frame that will be accepted. If more than those entries
> > ++ * are received, the peer is considered to be misbehaving and session
> > ++ * will be closed. The default value is 32.
> > ++ */
> > ++NGHTTP2_EXTERN void nghttp2_option_set_max_settings(nghttp2_option
> *option,
> > ++                                                    size_t val);
> > ++
> > + /**
> > +  * @function
> > +  *
> > +diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c
> > +index 91136a619..0bd541472 100644
> > +--- a/lib/nghttp2_helper.c
> > ++++ b/lib/nghttp2_helper.c
> > +@@ -334,6 +334,8 @@ const char *nghttp2_strerror(int error_code) {
> > +   case NGHTTP2_ERR_FLOODED:
> > +     return "Flooding was detected in this HTTP/2 session, and it
> must be "
> > +            "closed";
> > ++  case NGHTTP2_ERR_TOO_MANY_SETTINGS:
> > ++    return "SETTINGS frame contained more than the maximum allowed
> entries";
> > +   default:
> > +     return "Unknown error code";
> > +   }
> > +diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c
> > +index e53f22d36..34348e660 100644
> > +--- a/lib/nghttp2_option.c
> > ++++ b/lib/nghttp2_option.c
> > +@@ -121,3 +121,8 @@ void
> nghttp2_option_set_max_outbound_ack(nghttp2_option *option, size_t val) {
> > +   option->opt_set_mask |= NGHTTP2_OPT_MAX_OUTBOUND_ACK;
> > +   option->max_outbound_ack = val;
> > + }
> > ++
> > ++void nghttp2_option_set_max_settings(nghttp2_option *option,
> size_t val) {
> > ++  option->opt_set_mask |= NGHTTP2_OPT_MAX_SETTINGS;
> > ++  option->max_settings = val;
> > ++}
> > +diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h
> > +index 1f740aaa6..939729fdc 100644
> > +--- a/lib/nghttp2_option.h
> > ++++ b/lib/nghttp2_option.h
> > +@@ -67,6 +67,7 @@ typedef enum {
> > +   NGHTTP2_OPT_MAX_DEFLATE_DYNAMIC_TABLE_SIZE = 1 << 9,
> > +   NGHTTP2_OPT_NO_CLOSED_STREAMS = 1 << 10,
> > +   NGHTTP2_OPT_MAX_OUTBOUND_ACK = 1 << 11,
> > ++  NGHTTP2_OPT_MAX_SETTINGS = 1 << 12,
> > + } nghttp2_option_flag;
> > +
> > + /**
> > +@@ -85,6 +86,10 @@ struct nghttp2_option {
> > +    * NGHTTP2_OPT_MAX_OUTBOUND_ACK
> > +    */
> > +   size_t max_outbound_ack;
> > ++  /**
> > ++   * NGHTTP2_OPT_MAX_SETTINGS
> > ++   */
> > ++  size_t max_settings;
> > +   /**
> > +    * Bitwise OR of nghttp2_option_flag to determine that which fields
> > +    * are specified.
> > +diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
> > +index 563ccd7de..415e34776 100644
> > +--- a/lib/nghttp2_session.c
> > ++++ b/lib/nghttp2_session.c
> > +@@ -458,6 +458,7 @@ static int session_new(nghttp2_session
> **session_ptr,
> > +
> > +   (*session_ptr)->max_send_header_block_length =
> NGHTTP2_MAX_HEADERSLEN;
> > +   (*session_ptr)->max_outbound_ack =
> NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM;
> > ++  (*session_ptr)->max_settings = NGHTTP2_DEFAULT_MAX_SETTINGS;
> > +
> > +   if (option) {
> > +     if ((option->opt_set_mask & NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE) &&
> > +@@ -521,6 +522,11 @@ static int session_new(nghttp2_session
> **session_ptr,
> > +     if (option->opt_set_mask & NGHTTP2_OPT_MAX_OUTBOUND_ACK) {
> > +       (*session_ptr)->max_outbound_ack = option->max_outbound_ack;
> > +     }
> > ++
> > ++    if ((option->opt_set_mask & NGHTTP2_OPT_MAX_SETTINGS) &&
> > ++        option->max_settings) {
> > ++      (*session_ptr)->max_settings = option->max_settings;
> > ++    }
> > +   }
> > +
> > +   rv = nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
> > +@@ -5657,6 +5663,16 @@ ssize_t
> nghttp2_session_mem_recv(nghttp2_session *session, const uint8_t *in,
> > +           iframe->max_niv =
> > +               iframe->frame.hd.length /
> NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH + 1;
> > +
> > ++          if (iframe->max_niv - 1 > session->max_settings) {
> > ++            rv = nghttp2_session_terminate_session_with_reason(
> > ++                session, NGHTTP2_ENHANCE_YOUR_CALM,
> > ++                "SETTINGS: too many setting entries");
> > ++            if (nghttp2_is_fatal(rv)) {
> > ++              return rv;
> > ++            }
> > ++            return (ssize_t)inlen;
> > ++          }
> > ++
> > +           iframe->iv = nghttp2_mem_malloc(mem,
> sizeof(nghttp2_settings_entry) *
> > +                                                    iframe->max_niv);
> > +
> > +@@ -7425,6 +7441,11 @@ static int
> nghttp2_session_upgrade_internal(nghttp2_session *session,
> > +   if (settings_payloadlen % NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH) {
> > +     return NGHTTP2_ERR_INVALID_ARGUMENT;
> > +   }
> > ++  /* SETTINGS frame contains too many settings */
> > ++  if (settings_payloadlen / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH
> > ++        > session->max_settings) {
> > ++    return NGHTTP2_ERR_TOO_MANY_SETTINGS;
> > ++  }
> > +   rv = nghttp2_frame_unpack_settings_payload2(&iv, &niv,
> settings_payload,
> > +                                               settings_payloadlen,
> mem);
> > +   if (rv != 0) {
> > +diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h
> > +index d20827315..07bfbb6c9 100644
> > +--- a/lib/nghttp2_session.h
> > ++++ b/lib/nghttp2_session.h
> > +@@ -267,6 +267,8 @@ struct nghttp2_session {
> > +   /* The maximum length of header block to send.  Calculated by the
> > +      same way as nghttp2_hd_deflate_bound() does. */
> > +   size_t max_send_header_block_length;
> > ++  /* The maximum number of settings accepted per SETTINGS frame. */
> > ++  size_t max_settings;
> > +   /* Next Stream ID. Made unsigned int to detect >= (1 << 31). */
> > +   uint32_t next_stream_id;
> > +   /* The last stream ID this session initiated.  For client session,
> > +diff --git a/tests/main.c b/tests/main.c
> > +index 41e0b03eb..67eb4a1c2 100644
> > +--- a/tests/main.c
> > ++++ b/tests/main.c
> > +@@ -317,6 +317,8 @@ int main() {
> > +                    test_nghttp2_session_set_local_window_size) ||
> > +       !CU_add_test(pSuite, "session_cancel_from_before_frame_send",
> > +                   
> test_nghttp2_session_cancel_from_before_frame_send) ||
> > ++      !CU_add_test(pSuite, "session_too_many_settings",
> > ++                   test_nghttp2_session_too_many_settings) ||
> > +       !CU_add_test(pSuite, "session_removed_closed_stream",
> > +                    test_nghttp2_session_removed_closed_stream) ||
> > +       !CU_add_test(pSuite, "session_pause_data",
> > +diff --git a/tests/nghttp2_session_test.c
> b/tests/nghttp2_session_test.c
> > +index 6eb8e244d..33ee3ad84 100644
> > +--- a/tests/nghttp2_session_test.c
> > ++++ b/tests/nghttp2_session_test.c
> > +@@ -10614,6 +10614,67 @@ void
> test_nghttp2_session_cancel_from_before_frame_send(void) {
> > +   nghttp2_session_del(session);
> > + }
> > +
> > ++void test_nghttp2_session_too_many_settings(void) {
> > ++  nghttp2_session *session;
> > ++  nghttp2_option *option;
> > ++  nghttp2_session_callbacks callbacks;
> > ++  nghttp2_frame frame;
> > ++  nghttp2_bufs bufs;
> > ++  nghttp2_buf *buf;
> > ++  ssize_t rv;
> > ++  my_user_data ud;
> > ++  nghttp2_settings_entry iv[3];
> > ++  nghttp2_mem *mem;
> > ++  nghttp2_outbound_item *item;
> > ++
> > ++  mem = nghttp2_mem_default();
> > ++  frame_pack_bufs_init(&bufs);
> > ++
> > ++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
> > ++  callbacks.on_frame_recv_callback = on_frame_recv_callback;
> > ++  callbacks.send_callback = null_send_callback;
> > ++
> > ++  nghttp2_option_new(&option);
> > ++  nghttp2_option_set_max_settings(option, 1);
> > ++
> > ++  nghttp2_session_client_new2(&session, &callbacks, &ud, option);
> > ++
> > ++  CU_ASSERT(1 == session->max_settings);
> > ++
> > ++  nghttp2_option_del(option);
> > ++
> > ++  iv[0].settings_id = NGHTTP2_SETTINGS_HEADER_TABLE_SIZE;
> > ++  iv[0].value = 3000;
> > ++
> > ++  iv[1].settings_id = NGHTTP2_SETTINGS_INITIAL_WINDOW_SIZE;
> > ++  iv[1].value = 16384;
> > ++
> > ++  nghttp2_frame_settings_init(&frame.settings, NGHTTP2_FLAG_NONE,
> dup_iv(iv, 2),
> > ++                              2);
> > ++
> > ++  rv = nghttp2_frame_pack_settings(&bufs, &frame.settings);
> > ++
> > ++  CU_ASSERT(0 == rv);
> > ++  CU_ASSERT(nghttp2_bufs_len(&bufs) > 0);
> > ++
> > ++  nghttp2_frame_settings_free(&frame.settings, mem);
> > ++
> > ++  buf = &bufs.head->buf;
> > ++  assert(nghttp2_bufs_len(&bufs) == nghttp2_buf_len(buf));
> > ++
> > ++  ud.frame_recv_cb_called = 0;
> > ++
> > ++  rv = nghttp2_session_mem_recv(session, buf->pos,
> nghttp2_buf_len(buf));
> > ++  CU_ASSERT((ssize_t)nghttp2_buf_len(buf) == rv);
> > ++
> > ++  item = nghttp2_session_get_next_ob_item(session);
> > ++  CU_ASSERT(NGHTTP2_GOAWAY == item->frame.hd.type);
> > ++
> > ++  nghttp2_bufs_reset(&bufs);
> > ++  nghttp2_bufs_free(&bufs);
> > ++  nghttp2_session_del(session);
> > ++}
> > ++
> > + static void
> > + prepare_session_removed_closed_stream(nghttp2_session *session,
> > +                                       nghttp2_hd_deflater *deflater) {
> > +diff --git a/tests/nghttp2_session_test.h
> b/tests/nghttp2_session_test.h
> > +index e872c5d0b..818c808d0 100644
> > +--- a/tests/nghttp2_session_test.h
> > ++++ b/tests/nghttp2_session_test.h
> > +@@ -156,6 +156,7 @@ void
> test_nghttp2_session_repeated_priority_change(void);
> > + void test_nghttp2_session_repeated_priority_submission(void);
> > + void test_nghttp2_session_set_local_window_size(void);
> > + void test_nghttp2_session_cancel_from_before_frame_send(void);
> > ++void test_nghttp2_session_too_many_settings(void);
> > + void test_nghttp2_session_removed_closed_stream(void);
> > + void test_nghttp2_session_pause_data(void);
> > + void test_nghttp2_session_no_closed_streams(void);
> > diff --git
> a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> > index 9ed8c5642..b212ede4d 100644
> > --- a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> > +++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> > @@ -10,6 +10,7 @@ UPSTREAM_CHECK_URI =
> "https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases&amp;data=04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=misO%2FSEpB92THW3xVx9%2BWkvFsdI3Z%2FL%2Fy%2FdMcEG88AY%3D&amp;reserved=0"
> >  SRC_URI = "\
> >     
> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;data=04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=tq%2BGz4zgfP84bLfqf2UAI384FMhi%2BU4KvPghoPjGR9Y%3D&amp;reserved=0{PV}/nghttp2-${PV}.tar.xz
> \
> >      file://0001-fetch-ocsp-response-use-python3.patch \
> > +    file://CVE-2020-11080.patch \
> >  "
> >  SRC_URI[md5sum] = "8d1a6b96760254e4dd142d7176e8fb7c"
> >  SRC_URI[sha256sum] =
> "09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed3bc4cdcee69073"
> > --
> > 2.17.1
> >
> > This message contains information that may be privileged or
> confidential and is the property of the KPIT Technologies Ltd. It is
> intended only for the person to whom it is addressed. If you are not
> the intended recipient, you are not authorized to read, print, retain
> copy, disseminate, distribute, or use this message or any part
> thereof. If you receive this message in error, please notify the
> sender immediately and delete all copies of this message. KPIT
> Technologies Ltd. does not accept any liability for virus infected mails.
> >
> > 
> >
>
> This message contains information that may be privileged or
> confidential and is the property of the KPIT Technologies Ltd. It is
> intended only for the person to whom it is addressed. If you are not
> the intended recipient, you are not authorized to read, print, retain
> copy, disseminate, distribute, or use this message or any part
> thereof. If you receive this message in error, please notify the
> sender immediately and delete all copies of this message. KPIT
> Technologies Ltd. does not accept any liability for virus infected mails. 

