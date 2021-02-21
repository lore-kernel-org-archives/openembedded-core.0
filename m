Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.14365.1613866070430389569
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 16:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g+brkJQp;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id s11so17140701edd.5
        for <Openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 16:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dMefjjLPZXSm9zqhsU6wQ4ha6c7kgBvdVAQU54c4w3A=;
        b=g+brkJQp93MvtUF5aktWOPWJ/ZxSvOfC9Hk56mgtbDAsYfjtYLwaUzexKvbY78ZFsr
         MYLc9FRY71DeeGnlOLRsBNxX4C3I/aKdMDqJoZHSXIGo57HJea8/aTA6MwzGhxTQAVxG
         qrShiMOmrVWTx4KF5iW14V68fOoEBsWmtKW7NDvh7WxhQsk0usLgntS1Y1jjqRzWRjZE
         5fxAM3WTkNw6rnkNJbqGc4VCYyjxBOq/aw6u2Xl0RvsyCAgD7nSXttI7hjztUwhLGx1N
         Bs5Wg5ijzWpiRAfD8jwDaEROVs9eTQONKczvNgyYTogdtjf7xg5zkTARSi0taRfvh/a+
         jHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dMefjjLPZXSm9zqhsU6wQ4ha6c7kgBvdVAQU54c4w3A=;
        b=nRGchUTGxLjzDFeptdqxiWUMwiH5nR7jLucAJ54mqhdEytPMMZzUW7hfZI3ioePq4G
         M+bFY8h244x5jlWmJWgwQzQSyjyp/TxzSNxWURINm3eHy0x3TuIPQKl6MHgVP+6RzTbQ
         vtFfwBQqDyb8EE3PQ9ljHwIHLzuVelMbUYv4ierLTakuQpO9BcclrPN3WBCECfIfEjXQ
         FmL6ftYiJuQlKJgYt/XlnG8JNKMJfS0MIahhQGp8XpgwzYM08KE+r7Ip7XrGYS9wiIPU
         4/XaQbrmXtMZ54sOh35oxfrw/WABdjMIHva1ozcBnCPshgXXshlDx4/2EO+6SQxjopEB
         op/Q==
X-Gm-Message-State: AOAM532D5agFrXr1QvW0ppCiHPj3FnhwrYFt3fcmxUldDh07Qc3+kS6h
	phQ9EMFX7Tc49hwUpPriVTvkuODlCR7lT3+ZxRU=
X-Google-Smtp-Source: ABdhPJzolastktvrzxfP+HbApJHzwPqbg2Oq1nNLGYE1UevNTk5WWxQQT3ap6UAt2TbjGhG0vHPtWTLNjDjdnVy53K8=
X-Received: by 2002:aa7:d849:: with SMTP id f9mr15464175eds.76.1613866068786;
 Sat, 20 Feb 2021 16:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20210216083900.7631-1-Rahul.Taya@kpit.com> <8abf4b2a-c035-eba0-0a19-8136296e4ad4@gmail.com>
 <BMXPR01MB34318E8491F3B495127DDFB8F2869@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <d0888474-b89b-51f3-5303-407c52fefad3@gmail.com>
In-Reply-To: <d0888474-b89b-51f3-5303-407c52fefad3@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 21 Feb 2021 01:07:37 +0100
Message-ID: <CA+chaQeiJaB2ngYNTsSgnD_MRy1COxUk5ivOfJxF2eLnO4Wi+A@mail.gmail.com>
Subject: Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2: Add fix for CVE-2020-11080
To: akuster <akuster808@gmail.com>
Cc: Rahul Taya <Rahul.Taya@kpit.com>, 
	"Openembedded-core@lists.openembedded.org" <Openembedded-core@lists.openembedded.org>, 
	"raj.khem@gmail.com" <raj.khem@gmail.com>, Nisha Parrakat <Nisha.Parrakat@kpit.com>, 
	Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Content-Type: multipart/alternative; boundary="000000000000bec18805bbcd794c"

--000000000000bec18805bbcd794c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like this version of the patch got merged to meta-oe today and it
fails to apply cleanly, will send update.

On Wed, Feb 17, 2021 at 4:20 PM akuster <akuster808@gmail.com> wrote:

>
>
> On 2/17/21 12:57 AM, Rahul Taya wrote:
> > Hi,
> >
> > I have backported this patch from Master branch as in master(v1.43.0)
> > and Gatesgarth(v1.41.0) the code of this patch is already present in
> > the source code so it is only applicable for Dunfell(v1.40.0) and
> > Zeus(v1.39.1) branch.
> >
> > Yes i will add my signoff in the patch.
> >
> > *Can you please tell which is the correct ML for sending this patch ?*
> openembedded-devel@lists.openembedded.org
>
>
> Also I am seeing this this  error.
>
> Applying patch CVE-2020-11080.patch
> patching file doc/CMakeLists.txt
> patching file doc/Makefile.am
> Hunk #1 FAILED at 69.
> 1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
> patching file lib/includes/nghttp2/nghttp2.h
> patching file lib/nghttp2_helper.c
> patching file lib/nghttp2_option.c
> patching file lib/nghttp2_option.h
> patching file lib/nghttp2_session.c
> Hunk #3 succeeded at 5694 (offset 31 lines).
> Hunk #4 succeeded at 7470 (offset 29 lines).
> patching file lib/nghttp2_session.h
> patching file tests/main.c
> Hunk #1 succeeded at 315 (offset -2 lines).
> patching file tests/nghttp2_session_test.c
> Hunk #1 succeeded at 10558 (offset -56 lines).
> patching file tests/nghttp2_session_test.h
> Patch CVE-2020-11080.patch does not apply (enforce with -f)*
> *
> -armin*
> *
> >
> > Thanks and Regards,
> > Rahul Taya
> > ----------------------------------------------------------------------=
--
> > *From:* akuster808 <akuster808@gmail.com>
> > *Sent:* Tuesday, February 16, 2021 9:32 PM
> > *To:* Rahul Taya <Rahul.Taya@kpit.com>;
> > Openembedded-core@lists.openembedded.org
> > <Openembedded-core@lists.openembedded.org>; raj.khem@gmail.com
> > <raj.khem@gmail.com>
> > *Cc:* Nisha Parrakat <Nisha.Parrakat@kpit.com>; Harpritkaur Bhandari
> > <Harpritkaur.Bhandari@kpit.com>
> > *Subject:* Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2:
> > Add fix for CVE-2020-11080
> >
> >
> >
> > On 2/16/21 12:39 AM, Rahul Taya wrote:
> > > Added patch for CVE-2020-11080 taken from below link:
> > >
> >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c27f75=
090&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2=
944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;sdata=3DLO7%2BKX%2F6ZD4VSi85fOVS%2FydUAFSH1kCUamqOyQ=
cV0Ww%3D&amp;reserved=3D0
> > >
> > > Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> > Wrong ML.
> >
> > Is master or Gatesgath affected by this?
> >
> > Also the patch it self is missing your signoff.
> >
> > -armin
> > > ---
> > >  .../nghttp2/nghttp2/CVE-2020-11080.patch      | 306 +++++++++++++++=
+++
> > >  .../recipes-support/nghttp2/nghttp2_1.40.0.bb |   1 +
> > >  2 files changed, 307 insertions(+)
> > >  create mode 100644
> > meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> > >
> > > diff --git
> > a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> > b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> > > new file mode 100644
> > > index 000000000..a376e5372
> > > --- /dev/null
> > > +++
> > b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
> > > @@ -0,0 +1,306 @@
> > > +From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17 00:00:00 2=
001
> > > +From: James M Snell <jasnell@gmail.com>
> > > +Date: Fri, 17 Apr 2020 16:53:51 -0700
> > > +Subject: [PATCH] Implement max settings option
> > > +
> > > +CVE: CVE-2020-11080
> > > +Upstream-Status: Backport
> > [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c27f75=
090&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2=
944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;sdata=3DLO7%2BKX%2F6ZD4VSi85fOVS%2FydUAFSH1kCUamqOyQ=
cV0Ww%3D&amp;reserved=3D0
> ]
> > > +Comment: No hunks refreshed
> > > +---
> > > + doc/CMakeLists.txt             |  1 +
> > > + doc/Makefile.am                |  1 +
> > > + lib/includes/nghttp2/nghttp2.h | 23 +++++++++++++
> > > + lib/nghttp2_helper.c           |  2 ++
> > > + lib/nghttp2_option.c           |  5 +++
> > > + lib/nghttp2_option.h           |  5 +++
> > > + lib/nghttp2_session.c          | 21 ++++++++++++
> > > + lib/nghttp2_session.h          |  2 ++
> > > + tests/main.c                   |  2 ++
> > > + tests/nghttp2_session_test.c   | 61
> ++++++++++++++++++++++++++++++++++
> > > + tests/nghttp2_session_test.h   |  1 +
> > > + 11 files changed, 124 insertions(+)
> > > +
> > > +diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
> > > +index 34c027929..f3aec84da 100644
> > > +--- a/doc/CMakeLists.txt
> > > ++++ b/doc/CMakeLists.txt
> > > +@@ -42,6 +42,7 @@ set(APIDOCS
> > > +   nghttp2_option_set_no_recv_client_magic.rst
> > > +   nghttp2_option_set_peer_max_concurrent_streams.rst
> > > +   nghttp2_option_set_user_recv_extension_type.rst
> > > ++  nghttp2_option_set_max_settings.rst
> > > +   nghttp2_pack_settings_payload.rst
> > > +   nghttp2_priority_spec_check_default.rst
> > > +   nghttp2_priority_spec_default_init.rst
> > > +diff --git a/doc/Makefile.am b/doc/Makefile.am
> > > +index 4d73cef50..f073bfa4c 100644
> > > +--- a/doc/Makefile.am
> > > ++++ b/doc/Makefile.am
> > > +@@ -69,6 +69,7 @@ APIDOCS=3D \
> > > +       nghttp2_option_set_peer_max_concurrent_streams.rst \
> > > +       nghttp2_option_set_user_recv_extension_type.rst \
> > > +       nghttp2_option_set_max_outbound_ack.rst \
> > > ++      nghttp2_option_set_max_settings.rst \
> > > +       nghttp2_pack_settings_payload.rst \
> > > +       nghttp2_priority_spec_check_default.rst \
> > > +       nghttp2_priority_spec_default_init.rst \
> > > +diff --git a/lib/includes/nghttp2/nghttp2.h
> > b/lib/includes/nghttp2/nghttp2.h
> > > +index e3aeb9fed..9be6eea5c 100644
> > > +--- a/lib/includes/nghttp2/nghttp2.h
> > > ++++ b/lib/includes/nghttp2/nghttp2.h
> > > +@@ -228,6 +228,13 @@ typedef struct {
> > > +  */
> > > + #define NGHTTP2_CLIENT_MAGIC_LEN 24
> > > +
> > > ++/**
> > > ++ * @macro
> > > ++ *
> > > ++ * The default max number of settings per SETTINGS frame
> > > ++ */
> > > ++#define NGHTTP2_DEFAULT_MAX_SETTINGS 32
> > > ++
> > > + /**
> > > +  * @enum
> > > +  *
> > > +@@ -398,6 +405,11 @@ typedef enum {
> > > +    * receives an other type of frame.
> > > +    */
> > > +   NGHTTP2_ERR_SETTINGS_EXPECTED =3D -536,
> > > ++  /**
> > > ++   * When a local endpoint receives too many settings entries
> > > ++   * in a single SETTINGS frame.
> > > ++   */
> > > ++  NGHTTP2_ERR_TOO_MANY_SETTINGS =3D -537,
> > > +   /**
> > > +    * The errors < :enum:`NGHTTP2_ERR_FATAL` mean that the library =
is
> > > +    * under unexpected condition and processing was terminated (e.g=
.,
> > > +@@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void
> > nghttp2_option_set_no_closed_streams(nghttp2_option *option,
> > > + NGHTTP2_EXTERN void
> > nghttp2_option_set_max_outbound_ack(nghttp2_option *option,
> > > +                                                         size_t val=
);
> > > +
> > > ++/**
> > > ++ * @function
> > > ++ *
> > > ++ * This function sets the maximum number of SETTINGS entries per
> > > ++ * SETTINGS frame that will be accepted. If more than those entrie=
s
> > > ++ * are received, the peer is considered to be misbehaving and sess=
ion
> > > ++ * will be closed. The default value is 32.
> > > ++ */
> > > ++NGHTTP2_EXTERN void nghttp2_option_set_max_settings(nghttp2_option
> > *option,
> > > ++                                                    size_t val);
> > > ++
> > > + /**
> > > +  * @function
> > > +  *
> > > +diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c
> > > +index 91136a619..0bd541472 100644
> > > +--- a/lib/nghttp2_helper.c
> > > ++++ b/lib/nghttp2_helper.c
> > > +@@ -334,6 +334,8 @@ const char *nghttp2_strerror(int error_code) {
> > > +   case NGHTTP2_ERR_FLOODED:
> > > +     return "Flooding was detected in this HTTP/2 session, and it
> > must be "
> > > +            "closed";
> > > ++  case NGHTTP2_ERR_TOO_MANY_SETTINGS:
> > > ++    return "SETTINGS frame contained more than the maximum allowed
> > entries";
> > > +   default:
> > > +     return "Unknown error code";
> > > +   }
> > > +diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c
> > > +index e53f22d36..34348e660 100644
> > > +--- a/lib/nghttp2_option.c
> > > ++++ b/lib/nghttp2_option.c
> > > +@@ -121,3 +121,8 @@ void
> > nghttp2_option_set_max_outbound_ack(nghttp2_option *option, size_t val=
) {
> > > +   option->opt_set_mask |=3D NGHTTP2_OPT_MAX_OUTBOUND_ACK;
> > > +   option->max_outbound_ack =3D val;
> > > + }
> > > ++
> > > ++void nghttp2_option_set_max_settings(nghttp2_option *option,
> > size_t val) {
> > > ++  option->opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTINGS;
> > > ++  option->max_settings =3D val;
> > > ++}
> > > +diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h
> > > +index 1f740aaa6..939729fdc 100644
> > > +--- a/lib/nghttp2_option.h
> > > ++++ b/lib/nghttp2_option.h
> > > +@@ -67,6 +67,7 @@ typedef enum {
> > > +   NGHTTP2_OPT_MAX_DEFLATE_DYNAMIC_TABLE_SIZE =3D 1 << 9,
> > > +   NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 << 10,
> > > +   NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 << 11,
> > > ++  NGHTTP2_OPT_MAX_SETTINGS =3D 1 << 12,
> > > + } nghttp2_option_flag;
> > > +
> > > + /**
> > > +@@ -85,6 +86,10 @@ struct nghttp2_option {
> > > +    * NGHTTP2_OPT_MAX_OUTBOUND_ACK
> > > +    */
> > > +   size_t max_outbound_ack;
> > > ++  /**
> > > ++   * NGHTTP2_OPT_MAX_SETTINGS
> > > ++   */
> > > ++  size_t max_settings;
> > > +   /**
> > > +    * Bitwise OR of nghttp2_option_flag to determine that which fie=
lds
> > > +    * are specified.
> > > +diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
> > > +index 563ccd7de..415e34776 100644
> > > +--- a/lib/nghttp2_session.c
> > > ++++ b/lib/nghttp2_session.c
> > > +@@ -458,6 +458,7 @@ static int session_new(nghttp2_session
> > **session_ptr,
> > > +
> > > +   (*session_ptr)->max_send_header_block_length =3D
> > NGHTTP2_MAX_HEADERSLEN;
> > > +   (*session_ptr)->max_outbound_ack =3D
> > NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM;
> > > ++  (*session_ptr)->max_settings =3D NGHTTP2_DEFAULT_MAX_SETTINGS;
> > > +
> > > +   if (option) {
> > > +     if ((option->opt_set_mask & NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE)=
 &&
> > > +@@ -521,6 +522,11 @@ static int session_new(nghttp2_session
> > **session_ptr,
> > > +     if (option->opt_set_mask & NGHTTP2_OPT_MAX_OUTBOUND_ACK) {
> > > +       (*session_ptr)->max_outbound_ack =3D option->max_outbound_ac=
k;
> > > +     }
> > > ++
> > > ++    if ((option->opt_set_mask & NGHTTP2_OPT_MAX_SETTINGS) &&
> > > ++        option->max_settings) {
> > > ++      (*session_ptr)->max_settings =3D option->max_settings;
> > > ++    }
> > > +   }
> > > +
> > > +   rv =3D nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
> > > +@@ -5657,6 +5663,16 @@ ssize_t
> > nghttp2_session_mem_recv(nghttp2_session *session, const uint8_t *in,
> > > +           iframe->max_niv =3D
> > > +               iframe->frame.hd.length /
> > NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH + 1;
> > > +
> > > ++          if (iframe->max_niv - 1 > session->max_settings) {
> > > ++            rv =3D nghttp2_session_terminate_session_with_reason(
> > > ++                session, NGHTTP2_ENHANCE_YOUR_CALM,
> > > ++                "SETTINGS: too many setting entries");
> > > ++            if (nghttp2_is_fatal(rv)) {
> > > ++              return rv;
> > > ++            }
> > > ++            return (ssize_t)inlen;
> > > ++          }
> > > ++
> > > +           iframe->iv =3D nghttp2_mem_malloc(mem,
> > sizeof(nghttp2_settings_entry) *
> > > +                                                    iframe->max_niv=
);
> > > +
> > > +@@ -7425,6 +7441,11 @@ static int
> > nghttp2_session_upgrade_internal(nghttp2_session *session,
> > > +   if (settings_payloadlen % NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH) {
> > > +     return NGHTTP2_ERR_INVALID_ARGUMENT;
> > > +   }
> > > ++  /* SETTINGS frame contains too many settings */
> > > ++  if (settings_payloadlen / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH
> > > ++        > session->max_settings) {
> > > ++    return NGHTTP2_ERR_TOO_MANY_SETTINGS;
> > > ++  }
> > > +   rv =3D nghttp2_frame_unpack_settings_payload2(&iv, &niv,
> > settings_payload,
> > > +                                               settings_payloadlen,
> > mem);
> > > +   if (rv !=3D 0) {
> > > +diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h
> > > +index d20827315..07bfbb6c9 100644
> > > +--- a/lib/nghttp2_session.h
> > > ++++ b/lib/nghttp2_session.h
> > > +@@ -267,6 +267,8 @@ struct nghttp2_session {
> > > +   /* The maximum length of header block to send.  Calculated by th=
e
> > > +      same way as nghttp2_hd_deflate_bound() does. */
> > > +   size_t max_send_header_block_length;
> > > ++  /* The maximum number of settings accepted per SETTINGS frame. *=
/
> > > ++  size_t max_settings;
> > > +   /* Next Stream ID. Made unsigned int to detect >=3D (1 << 31). *=
/
> > > +   uint32_t next_stream_id;
> > > +   /* The last stream ID this session initiated.  For client sessio=
n,
> > > +diff --git a/tests/main.c b/tests/main.c
> > > +index 41e0b03eb..67eb4a1c2 100644
> > > +--- a/tests/main.c
> > > ++++ b/tests/main.c
> > > +@@ -317,6 +317,8 @@ int main() {
> > > +                    test_nghttp2_session_set_local_window_size) ||
> > > +       !CU_add_test(pSuite, "session_cancel_from_before_frame_send"=
,
> > > +
> > test_nghttp2_session_cancel_from_before_frame_send) ||
> > > ++      !CU_add_test(pSuite, "session_too_many_settings",
> > > ++                   test_nghttp2_session_too_many_settings) ||
> > > +       !CU_add_test(pSuite, "session_removed_closed_stream",
> > > +                    test_nghttp2_session_removed_closed_stream) ||
> > > +       !CU_add_test(pSuite, "session_pause_data",
> > > +diff --git a/tests/nghttp2_session_test.c
> > b/tests/nghttp2_session_test.c
> > > +index 6eb8e244d..33ee3ad84 100644
> > > +--- a/tests/nghttp2_session_test.c
> > > ++++ b/tests/nghttp2_session_test.c
> > > +@@ -10614,6 +10614,67 @@ void
> > test_nghttp2_session_cancel_from_before_frame_send(void) {
> > > +   nghttp2_session_del(session);
> > > + }
> > > +
> > > ++void test_nghttp2_session_too_many_settings(void) {
> > > ++  nghttp2_session *session;
> > > ++  nghttp2_option *option;
> > > ++  nghttp2_session_callbacks callbacks;
> > > ++  nghttp2_frame frame;
> > > ++  nghttp2_bufs bufs;
> > > ++  nghttp2_buf *buf;
> > > ++  ssize_t rv;
> > > ++  my_user_data ud;
> > > ++  nghttp2_settings_entry iv[3];
> > > ++  nghttp2_mem *mem;
> > > ++  nghttp2_outbound_item *item;
> > > ++
> > > ++  mem =3D nghttp2_mem_default();
> > > ++  frame_pack_bufs_init(&bufs);
> > > ++
> > > ++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
> > > ++  callbacks.on_frame_recv_callback =3D on_frame_recv_callback;
> > > ++  callbacks.send_callback =3D null_send_callback;
> > > ++
> > > ++  nghttp2_option_new(&option);
> > > ++  nghttp2_option_set_max_settings(option, 1);
> > > ++
> > > ++  nghttp2_session_client_new2(&session, &callbacks, &ud, option);
> > > ++
> > > ++  CU_ASSERT(1 =3D=3D session->max_settings);
> > > ++
> > > ++  nghttp2_option_del(option);
> > > ++
> > > ++  iv[0].settings_id =3D NGHTTP2_SETTINGS_HEADER_TABLE_SIZE;
> > > ++  iv[0].value =3D 3000;
> > > ++
> > > ++  iv[1].settings_id =3D NGHTTP2_SETTINGS_INITIAL_WINDOW_SIZE;
> > > ++  iv[1].value =3D 16384;
> > > ++
> > > ++  nghttp2_frame_settings_init(&frame.settings, NGHTTP2_FLAG_NONE,
> > dup_iv(iv, 2),
> > > ++                              2);
> > > ++
> > > ++  rv =3D nghttp2_frame_pack_settings(&bufs, &frame.settings);
> > > ++
> > > ++  CU_ASSERT(0 =3D=3D rv);
> > > ++  CU_ASSERT(nghttp2_bufs_len(&bufs) > 0);
> > > ++
> > > ++  nghttp2_frame_settings_free(&frame.settings, mem);
> > > ++
> > > ++  buf =3D &bufs.head->buf;
> > > ++  assert(nghttp2_bufs_len(&bufs) =3D=3D nghttp2_buf_len(buf));
> > > ++
> > > ++  ud.frame_recv_cb_called =3D 0;
> > > ++
> > > ++  rv =3D nghttp2_session_mem_recv(session, buf->pos,
> > nghttp2_buf_len(buf));
> > > ++  CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
> > > ++
> > > ++  item =3D nghttp2_session_get_next_ob_item(session);
> > > ++  CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item->frame.hd.type);
> > > ++
> > > ++  nghttp2_bufs_reset(&bufs);
> > > ++  nghttp2_bufs_free(&bufs);
> > > ++  nghttp2_session_del(session);
> > > ++}
> > > ++
> > > + static void
> > > + prepare_session_removed_closed_stream(nghttp2_session *session,
> > > +                                       nghttp2_hd_deflater *deflate=
r)
> {
> > > +diff --git a/tests/nghttp2_session_test.h
> > b/tests/nghttp2_session_test.h
> > > +index e872c5d0b..818c808d0 100644
> > > +--- a/tests/nghttp2_session_test.h
> > > ++++ b/tests/nghttp2_session_test.h
> > > +@@ -156,6 +156,7 @@ void
> > test_nghttp2_session_repeated_priority_change(void);
> > > + void test_nghttp2_session_repeated_priority_submission(void);
> > > + void test_nghttp2_session_set_local_window_size(void);
> > > + void test_nghttp2_session_cancel_from_before_frame_send(void);
> > > ++void test_nghttp2_session_too_many_settings(void);
> > > + void test_nghttp2_session_removed_closed_stream(void);
> > > + void test_nghttp2_session_pause_data(void);
> > > + void test_nghttp2_session_no_closed_streams(void);
> > > diff --git
> > a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> > b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> > > index 9ed8c5642..b212ede4d 100644
> > > --- a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> > > +++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> > > @@ -10,6 +10,7 @@ UPSTREAM_CHECK_URI =3D
> > "
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fnghttp2%2Fnghttp2%2Freleases&amp;data=3D04%7C01%7CRahul.Taya%40kpi=
t.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DmisO%2FSEp=
B92THW3xVx9%2BWkvFsdI3Z%2FL%2Fy%2FdMcEG88AY%3D&amp;reserved=3D0
> "
> > >  SRC_URI =3D "\
> > >
> >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;data=3D04%7C01%=
7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3Dtq%2BGz4zgfP84bLfqf2UAI384FMhi%2BU4KvPghoPjGR9Y%3D&amp;reserved=3D0=
{PV}/nghttp2-${PV}.tar.xz
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;data=3D04%7C01=
%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dtq%2BGz4zgfP84bLfqf2UAI384FMhi%2BU4KvPghoPjGR9Y%3D&amp;reserved=3D=
0%7BPV%7D/nghttp2-$%7BPV%7D.tar.xz>
> > \
> > >      file://0001-fetch-ocsp-response-use-python3.patch \
> > > +    file://CVE-2020-11080.patch \
> > >  "
> > >  SRC_URI[md5sum] =3D "8d1a6b96760254e4dd142d7176e8fb7c"
> > >  SRC_URI[sha256sum] =3D
> > "09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed3bc4cdcee69073"
> > > --
> > > 2.17.1
> > >
> > > This message contains information that may be privileged or
> > confidential and is the property of the KPIT Technologies Ltd. It is
> > intended only for the person to whom it is addressed. If you are not
> > the intended recipient, you are not authorized to read, print, retain
> > copy, disseminate, distribute, or use this message or any part
> > thereof. If you receive this message in error, please notify the
> > sender immediately and delete all copies of this message. KPIT
> > Technologies Ltd. does not accept any liability for virus infected mai=
ls.
> > >
> > >
> > >
> >
> > This message contains information that may be privileged or
> > confidential and is the property of the KPIT Technologies Ltd. It is
> > intended only for the person to whom it is addressed. If you are not
> > the intended recipient, you are not authorized to read, print, retain
> > copy, disseminate, distribute, or use this message or any part
> > thereof. If you receive this message in error, please notify the
> > sender immediately and delete all copies of this message. KPIT
> > Technologies Ltd. does not accept any liability for virus infected
> mails.
>
>
>=20
>
>

--000000000000bec18805bbcd794c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like this version of the patch got merged to meta-oe=
 today and it fails to apply cleanly, will send update.</div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 17, 202=
1 at 4:20 PM akuster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
<br>
On 2/17/21 12:57 AM, Rahul Taya wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I have backported this patch from Master branch as in master(v1.43.0)=
<br>
&gt; and Gatesgarth(v1.41.0) the code of this patch is already present in<=
br>
&gt; the source code so it is only applicable for Dunfell(v1.40.0) and<br>
&gt; Zeus(v1.39.1) branch.<br>
&gt;<br>
&gt; Yes i will add my signoff in the patch.<br>
&gt;<br>
&gt; *Can you please tell which is the correct ML for sending this patch ?=
*<br>
<a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_bl=
ank">openembedded-devel@lists.openembedded.org</a><br>
<br>
<br>
Also I am seeing this this=C2=A0 error.<br>
<br>
Applying patch CVE-2020-11080.patch<br>
patching file doc/CMakeLists.txt<br>
patching file doc/Makefile.am<br>
Hunk #1 FAILED at 69.<br>
1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am<br>
patching file lib/includes/nghttp2/nghttp2.h<br>
patching file lib/nghttp2_helper.c<br>
patching file lib/nghttp2_option.c<br>
patching file lib/nghttp2_option.h<br>
patching file lib/nghttp2_session.c<br>
Hunk #3 succeeded at 5694 (offset 31 lines).<br>
Hunk #4 succeeded at 7470 (offset 29 lines).<br>
patching file lib/nghttp2_session.h<br>
patching file tests/main.c<br>
Hunk #1 succeeded at 315 (offset -2 lines).<br>
patching file tests/nghttp2_session_test.c<br>
Hunk #1 succeeded at 10558 (offset -56 lines).<br>
patching file tests/nghttp2_session_test.h<br>
Patch CVE-2020-11080.patch does not apply (enforce with -f)*<br>
*<br>
-armin*<br>
*<br>
&gt;<br>
&gt; Thanks and Regards,<br>
&gt; Rahul Taya<br>
&gt; ---------------------------------------------------------------------=
---<br>
&gt; *From:* akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com" target=
=
=3D"_blank">akuster808@gmail.com</a>&gt;<br>
&gt; *Sent:* Tuesday, February 16, 2021 9:32 PM<br>
&gt; *To:* Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" target=3D=
"_blank">Rahul.Taya@kpit.com</a>&gt;;<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D=
"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &lt;<a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a>&gt;; <a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a><br>
&gt; &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt;<br>
&gt; *Cc:* Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kpit.com" t=
arget=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;; Harpritkaur Bhandari<br>
&gt; &lt;<a href=3D"mailto:Harpritkaur.Bhandari@kpit.com" target=3D"_blank=
">Harpritkaur.Bhandari@kpit.com</a>&gt;<br>
&gt; *Subject:* Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2:=
<br>
&gt; Add fix for CVE-2020-11080<br>
&gt; =C2=A0<br>
&gt;<br>
&gt;<br>
&gt; On 2/16/21 12:39 AM, Rahul Taya wrote:<br>
&gt; &gt; Added patch for CVE-2020-11080 taken from below link:<br>
&gt; &gt;<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e127=
36b18785c27f75090&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a5=
89c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63749=
0881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLO7%2BKX%2F6ZD4VSi85fO=
VS%2FydUAFSH1kCUamqOyQcV0Ww%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" tar=
get=3D"_blank">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736=
b18785c27f75090&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589=
c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6374908=
81707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLO7%2BKX%2F6ZD4VSi85fOVS=
%2FydUAFSH1kCUamqOyQcV0Ww%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.=
com" target=3D"_blank">Rahul.Taya@kpit.com</a>&gt;<br>
&gt; Wrong ML.=C2=A0<br>
&gt;<br>
&gt; Is master or Gatesgath affected by this?<br>
&gt;<br>
&gt; Also the patch it self is missing your signoff.<br>
&gt;<br>
&gt; -armin<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../nghttp2/nghttp2/CVE-2020-11080.patch=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0 | 306 ++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../recipes-support/nghttp2/<a href=3D"http://nghttp2_1.40=
.0.bb" rel=3D"noreferrer" target=3D"_blank">nghttp2_1.40.0.bb</a> |=C2=A0=
=C2=A0 1 +<br>
&gt; &gt;=C2=A0 2 files changed, 307 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644<br>
&gt; meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch<=
br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patc=
h<br>
&gt; b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patc=
h<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..a376e5372<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patc=
h<br>
&gt; &gt; @@ -0,0 +1,306 @@<br>
&gt; &gt; +From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From: James M Snell &lt;<a href=3D"mailto:jasnell@gmail.com" ta=
rget=3D"_blank">jasnell@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Fri, 17 Apr 2020 16:53:51 -0700<br>
&gt; &gt; +Subject: [PATCH] Implement max settings option<br>
&gt; &gt; +<br>
&gt; &gt; +CVE: CVE-2020-11080<br>
&gt; &gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12=
736b18785c27f75090&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a=
589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6374=
90881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLO7%2BKX%2F6ZD4VSi85f=
OVS%2FydUAFSH1kCUamqOyQcV0Ww%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" ta=
rget=3D"_blank">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e1273=
6b18785c27f75090&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a58=
9c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490=
881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLO7%2BKX%2F6ZD4VSi85fOV=
S%2FydUAFSH1kCUamqOyQcV0Ww%3D&amp;amp;reserved=3D0</a>]<br>
&gt; &gt; +Comment: No hunks refreshed<br>
&gt; &gt; +---<br>
&gt; &gt; + doc/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt; &gt; + doc/Makefile.am=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt; &gt; + lib/includes/nghttp2/nghttp2.h | 23 +++++++++++++<br>
&gt; &gt; + lib/nghttp2_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++<br>
&gt; &gt; + lib/nghttp2_option.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++<br>
&gt; &gt; + lib/nghttp2_option.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++<br>
&gt; &gt; + lib/nghttp2_session.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 21 ++++++++++++<br>
&gt; &gt; + lib/nghttp2_session.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 ++<br>
&gt; &gt; + tests/main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++<=
br>
&gt; &gt; + tests/nghttp2_session_test.c=C2=A0=C2=A0 | 61 ++++++++++++++++=
++++++++++++++++++<br>
&gt; &gt; + tests/nghttp2_session_test.h=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt; &gt; + 11 files changed, 124 insertions(+)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt<br>
&gt; &gt; +index 34c027929..f3aec84da 100644<br>
&gt; &gt; +--- a/doc/CMakeLists.txt<br>
&gt; &gt; ++++ b/doc/CMakeLists.txt<br>
&gt; &gt; +@@ -42,6 +42,7 @@ set(APIDOCS<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_option_set_no_recv_client_magic.rst<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_option_set_peer_max_concurrent_streams.rst=
<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_option_set_user_recv_extension_type.rst<br=
>
&gt; &gt; ++=C2=A0 nghttp2_option_set_max_settings.rst<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_pack_settings_payload.rst<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_priority_spec_check_default.rst<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_priority_spec_default_init.rst<br>
&gt; &gt; +diff --git a/doc/Makefile.am b/doc/Makefile.am<br>
&gt; &gt; +index 4d73cef50..f073bfa4c 100644<br>
&gt; &gt; +--- a/doc/Makefile.am<br>
&gt; &gt; ++++ b/doc/Makefile.am<br>
&gt; &gt; +@@ -69,6 +69,7 @@ APIDOCS=3D \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_option_set_peer_ma=
x_concurrent_streams.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_option_set_user_re=
cv_extension_type.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_option_set_max_out=
bound_ack.rst \<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_option_set_max_settings=
.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_pack_settings_payl=
oad.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_priority_spec_chec=
k_default.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_priority_spec_defa=
ult_init.rst \<br>
&gt; &gt; +diff --git a/lib/includes/nghttp2/nghttp2.h<br>
&gt; b/lib/includes/nghttp2/nghttp2.h<br>
&gt; &gt; +index e3aeb9fed..9be6eea5c 100644<br>
&gt; &gt; +--- a/lib/includes/nghttp2/nghttp2.h<br>
&gt; &gt; ++++ b/lib/includes/nghttp2/nghttp2.h<br>
&gt; &gt; +@@ -228,6 +228,13 @@ typedef struct {<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; + #define NGHTTP2_CLIENT_MAGIC_LEN 24<br>
&gt; &gt; +<br>
&gt; &gt; ++/**<br>
&gt; &gt; ++ * @macro<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * The default max number of settings per SETTINGS frame<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++#define NGHTTP2_DEFAULT_MAX_SETTINGS 32<br>
&gt; &gt; ++<br>
&gt; &gt; + /**<br>
&gt; &gt; +=C2=A0 * @enum<br>
&gt; &gt; +=C2=A0 *<br>
&gt; &gt; +@@ -398,6 +405,11 @@ typedef enum {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 * receives an other type of frame.<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 */<br>
&gt; &gt; +=C2=A0=C2=A0 NGHTTP2_ERR_SETTINGS_EXPECTED =3D -536,<br>
&gt; &gt; ++=C2=A0 /**<br>
&gt; &gt; ++=C2=A0=C2=A0 * When a local endpoint receives too many setting=
s entries<br>
&gt; &gt; ++=C2=A0=C2=A0 * in a single SETTINGS frame.<br>
&gt; &gt; ++=C2=A0=C2=A0 */<br>
&gt; &gt; ++=C2=A0 NGHTTP2_ERR_TOO_MANY_SETTINGS =3D -537,<br>
&gt; &gt; +=C2=A0=C2=A0 /**<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 * The errors &lt; :enum:`NGHTTP2_ERR_FATAL` =
mean that the library is<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 * under unexpected condition and processing =
was terminated (e.g.,<br>
&gt; &gt; +@@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void<br>
&gt; nghttp2_option_set_no_closed_streams(nghttp2_option *option,<br>
&gt; &gt; + NGHTTP2_EXTERN void<br>
&gt; nghttp2_option_set_max_outbound_ack(nghttp2_option *option,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t val);<br>
&gt; &gt; +<br>
&gt; &gt; ++/**<br>
&gt; &gt; ++ * @function<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * This function sets the maximum number of SETTINGS entries p=
er<br>
&gt; &gt; ++ * SETTINGS frame that will be accepted. If more than those en=
tries<br>
&gt; &gt; ++ * are received, the peer is considered to be misbehaving and =
session<br>
&gt; &gt; ++ * will be closed. The default value is 32.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++NGHTTP2_EXTERN void nghttp2_option_set_max_settings(nghttp2_op=
tion<br>
&gt; *option,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t val);<br>
&gt; &gt; ++<br>
&gt; &gt; + /**<br>
&gt; &gt; +=C2=A0 * @function<br>
&gt; &gt; +=C2=A0 *<br>
&gt; &gt; +diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c<br>
&gt; &gt; +index 91136a619..0bd541472 100644<br>
&gt; &gt; +--- a/lib/nghttp2_helper.c<br>
&gt; &gt; ++++ b/lib/nghttp2_helper.c<br>
&gt; &gt; +@@ -334,6 +334,8 @@ const char *nghttp2_strerror(int error_code=
) {<br>
&gt; &gt; +=C2=A0=C2=A0 case NGHTTP2_ERR_FLOODED:<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 return &quot;Flooding was detected in =
this HTTP/2 session, and it<br>
&gt; must be &quot;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 &quot;closed&quot;;<br>
&gt; &gt; ++=C2=A0 case NGHTTP2_ERR_TOO_MANY_SETTINGS:<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return &quot;SETTINGS frame contained more =
than the maximum allowed<br>
&gt; entries&quot;;<br>
&gt; &gt; +=C2=A0=C2=A0 default:<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 return &quot;Unknown error code&quot;;=
<br>
&gt; &gt; +=C2=A0=C2=A0 }<br>
&gt; &gt; +diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c<br>
&gt; &gt; +index e53f22d36..34348e660 100644<br>
&gt; &gt; +--- a/lib/nghttp2_option.c<br>
&gt; &gt; ++++ b/lib/nghttp2_option.c<br>
&gt; &gt; +@@ -121,3 +121,8 @@ void<br>
&gt; nghttp2_option_set_max_outbound_ack(nghttp2_option *option, size_t va=
l) {<br>
&gt; &gt; +=C2=A0=C2=A0 option-&gt;opt_set_mask |=3D NGHTTP2_OPT_MAX_OUTBO=
UND_ACK;<br>
&gt; &gt; +=C2=A0=C2=A0 option-&gt;max_outbound_ack =3D val;<br>
&gt; &gt; + }<br>
&gt; &gt; ++<br>
&gt; &gt; ++void nghttp2_option_set_max_settings(nghttp2_option *option,<b=
r>
&gt; size_t val) {<br>
&gt; &gt; ++=C2=A0 option-&gt;opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTINGS;<=
br>
&gt; &gt; ++=C2=A0 option-&gt;max_settings =3D val;<br>
&gt; &gt; ++}<br>
&gt; &gt; +diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h<br>
&gt; &gt; +index 1f740aaa6..939729fdc 100644<br>
&gt; &gt; +--- a/lib/nghttp2_option.h<br>
&gt; &gt; ++++ b/lib/nghttp2_option.h<br>
&gt; &gt; +@@ -67,6 +67,7 @@ typedef enum {<br>
&gt; &gt; +=C2=A0=C2=A0 NGHTTP2_OPT_MAX_DEFLATE_DYNAMIC_TABLE_SIZE =3D 1 &=
lt;&lt; 9,<br>
&gt; &gt; +=C2=A0=C2=A0 NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 &lt;&lt; 10,<b=
r>
&gt; &gt; +=C2=A0=C2=A0 NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 &lt;&lt; 11,<br=
>
&gt; &gt; ++=C2=A0 NGHTTP2_OPT_MAX_SETTINGS =3D 1 &lt;&lt; 12,<br>
&gt; &gt; + } nghttp2_option_flag;<br>
&gt; &gt; +<br>
&gt; &gt; + /**<br>
&gt; &gt; +@@ -85,6 +86,10 @@ struct nghttp2_option {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 * NGHTTP2_OPT_MAX_OUTBOUND_ACK<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 */<br>
&gt; &gt; +=C2=A0=C2=A0 size_t max_outbound_ack;<br>
&gt; &gt; ++=C2=A0 /**<br>
&gt; &gt; ++=C2=A0=C2=A0 * NGHTTP2_OPT_MAX_SETTINGS<br>
&gt; &gt; ++=C2=A0=C2=A0 */<br>
&gt; &gt; ++=C2=A0 size_t max_settings;<br>
&gt; &gt; +=C2=A0=C2=A0 /**<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 * Bitwise OR of nghttp2_option_flag to deter=
mine that which fields<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 * are specified.<br>
&gt; &gt; +diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c<br>
&gt; &gt; +index 563ccd7de..415e34776 100644<br>
&gt; &gt; +--- a/lib/nghttp2_session.c<br>
&gt; &gt; ++++ b/lib/nghttp2_session.c<br>
&gt; &gt; +@@ -458,6 +458,7 @@ static int session_new(nghttp2_session<br>
&gt; **session_ptr,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0 (*session_ptr)-&gt;max_send_header_block_length =
=3D<br>
&gt; NGHTTP2_MAX_HEADERSLEN;<br>
&gt; &gt; +=C2=A0=C2=A0 (*session_ptr)-&gt;max_outbound_ack =3D<br>
&gt; NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM;<br>
&gt; &gt; ++=C2=A0 (*session_ptr)-&gt;max_settings =3D NGHTTP2_DEFAULT_MAX=
_SETTINGS;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0 if (option) {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if ((option-&gt;opt_set_mask &amp; NGH=
TTP2_OPT_NO_AUTO_WINDOW_UPDATE) &amp;&amp;<br>
&gt; &gt; +@@ -521,6 +522,11 @@ static int session_new(nghttp2_session<br>
&gt; **session_ptr,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (option-&gt;opt_set_mask &amp; NGHT=
TP2_OPT_MAX_OUTBOUND_ACK) {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (*session_ptr)-&gt;max_out=
bound_ack =3D option-&gt;max_outbound_ack;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 if ((option-&gt;opt_set_mask &amp; NGHTTP2_=
OPT_MAX_SETTINGS) &amp;&amp;<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 option-&gt;max_sett=
ings) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (*session_ptr)-&gt;max_settings=
 =3D option-&gt;max_settings;<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +=C2=A0=C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0 rv =3D nghttp2_hd_deflate_init2(&amp;(*session_ptr=
)-&gt;hd_deflater,<br>
&gt; &gt; +@@ -5657,6 +5663,16 @@ ssize_t<br>
&gt; nghttp2_session_mem_recv(nghttp2_session *session, const uint8_t *in,=
<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
rame-&gt;max_niv =3D<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 iframe-&gt;frame.hd.length /<br>
&gt; NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH + 1;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ifr=
ame-&gt;max_niv - 1 &gt; session-&gt;max_settings) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 rv =3D nghttp2_session_terminate_session_with_reason(<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 session, NGHTTP2_ENHANCE_YOUR_CALM,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;SETTINGS: too many setting entries&qu=
ot;);<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (nghttp2_is_fatal(rv)) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return rv;<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return (ssize_t)inlen;<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
rame-&gt;iv =3D nghttp2_mem_malloc(mem,<br>
&gt; sizeof(nghttp2_settings_entry) *<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 iframe-&gt;max_niv);<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -7425,6 +7441,11 @@ static int<br>
&gt; nghttp2_session_upgrade_internal(nghttp2_session *session,<br>
&gt; &gt; +=C2=A0=C2=A0 if (settings_payloadlen % NGHTTP2_FRAME_SETTINGS_E=
NTRY_LENGTH) {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 return NGHTTP2_ERR_INVALID_ARGUMENT;<b=
r>
&gt; &gt; +=C2=A0=C2=A0 }<br>
&gt; &gt; ++=C2=A0 /* SETTINGS frame contains too many settings */<br>
&gt; &gt; ++=C2=A0 if (settings_payloadlen / NGHTTP2_FRAME_SETTINGS_ENTRY_=
LENGTH<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; session-&gt;ma=
x_settings) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return NGHTTP2_ERR_TOO_MANY_SETTINGS;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; +=C2=A0=C2=A0 rv =3D nghttp2_frame_unpack_settings_payload2(&amp=
;iv, &amp;niv,<br>
&gt; settings_payload,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sett=
ings_payloadlen,<br>
&gt; mem);<br>
&gt; &gt; +=C2=A0=C2=A0 if (rv !=3D 0) {<br>
&gt; &gt; +diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h<br>
&gt; &gt; +index d20827315..07bfbb6c9 100644<br>
&gt; &gt; +--- a/lib/nghttp2_session.h<br>
&gt; &gt; ++++ b/lib/nghttp2_session.h<br>
&gt; &gt; +@@ -267,6 +267,8 @@ struct nghttp2_session {<br>
&gt; &gt; +=C2=A0=C2=A0 /* The maximum length of header block to send.=C2=
=A0 Calculated by the<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 same way as nghttp2_hd_deflate_b=
ound() does. */<br>
&gt; &gt; +=C2=A0=C2=A0 size_t max_send_header_block_length;<br>
&gt; &gt; ++=C2=A0 /* The maximum number of settings accepted per SETTINGS=
 frame. */<br>
&gt; &gt; ++=C2=A0 size_t max_settings;<br>
&gt; &gt; +=C2=A0=C2=A0 /* Next Stream ID. Made unsigned int to detect &gt=
;=3D (1 &lt;&lt; 31). */<br>
&gt; &gt; +=C2=A0=C2=A0 uint32_t next_stream_id;<br>
&gt; &gt; +=C2=A0=C2=A0 /* The last stream ID this session initiated.=C2=
=A0 For client session,<br>
&gt; &gt; +diff --git a/tests/main.c b/tests/main.c<br>
&gt; &gt; +index 41e0b03eb..67eb4a1c2 100644<br>
&gt; &gt; +--- a/tests/main.c<br>
&gt; &gt; ++++ b/tests/main.c<br>
&gt; &gt; +@@ -317,6 +317,8 @@ int main() {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_nghttp2_session_s=
et_local_window_size) ||<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot=
;session_cancel_from_before_frame_send&quot;,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; test_nghttp2_session_cancel_from_before_frame_send) ||<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;sess=
ion_too_many_settings&quot;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_nghttp2_session_too_=
many_settings) ||<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot=
;session_removed_closed_stream&quot;,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_nghttp2_session_r=
emoved_closed_stream) ||<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot=
;session_pause_data&quot;,<br>
&gt; &gt; +diff --git a/tests/nghttp2_session_test.c<br>
&gt; b/tests/nghttp2_session_test.c<br>
&gt; &gt; +index 6eb8e244d..33ee3ad84 100644<br>
&gt; &gt; +--- a/tests/nghttp2_session_test.c<br>
&gt; &gt; ++++ b/tests/nghttp2_session_test.c<br>
&gt; &gt; +@@ -10614,6 +10614,67 @@ void<br>
&gt; test_nghttp2_session_cancel_from_before_frame_send(void) {<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_session_del(session);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++void test_nghttp2_session_too_many_settings(void) {<br>
&gt; &gt; ++=C2=A0 nghttp2_session *session;<br>
&gt; &gt; ++=C2=A0 nghttp2_option *option;<br>
&gt; &gt; ++=C2=A0 nghttp2_session_callbacks callbacks;<br>
&gt; &gt; ++=C2=A0 nghttp2_frame frame;<br>
&gt; &gt; ++=C2=A0 nghttp2_bufs bufs;<br>
&gt; &gt; ++=C2=A0 nghttp2_buf *buf;<br>
&gt; &gt; ++=C2=A0 ssize_t rv;<br>
&gt; &gt; ++=C2=A0 my_user_data ud;<br>
&gt; &gt; ++=C2=A0 nghttp2_settings_entry iv[3];<br>
&gt; &gt; ++=C2=A0 nghttp2_mem *mem;<br>
&gt; &gt; ++=C2=A0 nghttp2_outbound_item *item;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 mem =3D nghttp2_mem_default();<br>
&gt; &gt; ++=C2=A0 frame_pack_bufs_init(&amp;bufs);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;callbacks, 0, sizeof(nghttp2_session_callba=
cks));<br>
&gt; &gt; ++=C2=A0 callbacks.on_frame_recv_callback =3D on_frame_recv_call=
back;<br>
&gt; &gt; ++=C2=A0 callbacks.send_callback =3D null_send_callback;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_option_new(&amp;option);<br>
&gt; &gt; ++=C2=A0 nghttp2_option_set_max_settings(option, 1);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_session_client_new2(&amp;session, &amp;callback=
s, &amp;ud, option);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1 =3D=3D session-&gt;max_settings);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_option_del(option);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 iv[0].settings_id =3D NGHTTP2_SETTINGS_HEADER_TABLE_SIZ=
E;<br>
&gt; &gt; ++=C2=A0 iv[0].value =3D 3000;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 iv[1].settings_id =3D NGHTTP2_SETTINGS_INITIAL_WINDOW_S=
IZE;<br>
&gt; &gt; ++=C2=A0 iv[1].value =3D 16384;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_frame_settings_init(&amp;frame.settings, NGHTTP=
2_FLAG_NONE,<br>
&gt; dup_iv(iv, 2),<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 rv =3D nghttp2_frame_pack_settings(&amp;bufs, &amp;fram=
e.settings);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(0 =3D=3D rv);<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(nghttp2_bufs_len(&amp;bufs) &gt; 0);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_frame_settings_free(&amp;frame.settings, mem);<=
br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 buf =3D &amp;bufs.head-&gt;buf;<br>
&gt; &gt; ++=C2=A0 assert(nghttp2_bufs_len(&amp;bufs) =3D=3D nghttp2_buf_l=
en(buf));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ud.frame_recv_cb_called =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 rv =3D nghttp2_session_mem_recv(session, buf-&gt;pos,<b=
r>
&gt; nghttp2_buf_len(buf));<br>
&gt; &gt; ++=C2=A0 CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 item =3D nghttp2_session_get_next_ob_item(session);<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item-&gt;frame.hd.type)=
;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_bufs_reset(&amp;bufs);<br>
&gt; &gt; ++=C2=A0 nghttp2_bufs_free(&amp;bufs);<br>
&gt; &gt; ++=C2=A0 nghttp2_session_del(session);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + static void<br>
&gt; &gt; + prepare_session_removed_closed_stream(nghttp2_session *session=
,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 nghttp2_hd_deflater *deflater) {<br>
&gt; &gt; +diff --git a/tests/nghttp2_session_test.h<br>
&gt; b/tests/nghttp2_session_test.h<br>
&gt; &gt; +index e872c5d0b..818c808d0 100644<br>
&gt; &gt; +--- a/tests/nghttp2_session_test.h<br>
&gt; &gt; ++++ b/tests/nghttp2_session_test.h<br>
&gt; &gt; +@@ -156,6 +156,7 @@ void<br>
&gt; test_nghttp2_session_repeated_priority_change(void);<br>
&gt; &gt; + void test_nghttp2_session_repeated_priority_submission(void);<=
br>
&gt; &gt; + void test_nghttp2_session_set_local_window_size(void);<br>
&gt; &gt; + void test_nghttp2_session_cancel_from_before_frame_send(void);=
<br>
&gt; &gt; ++void test_nghttp2_session_too_many_settings(void);<br>
&gt; &gt; + void test_nghttp2_session_removed_closed_stream(void);<br>
&gt; &gt; + void test_nghttp2_session_pause_data(void);<br>
&gt; &gt; + void test_nghttp2_session_no_closed_streams(void);<br>
&gt; &gt; diff --git<br>
&gt; a/meta-networking/recipes-support/nghttp2/<a href=3D"http://nghttp2_1=
.40.0.bb" rel=3D"noreferrer" target=3D"_blank">nghttp2_1.40.0.bb</a><br>
&gt; b/meta-networking/recipes-support/nghttp2/<a href=3D"http://nghttp2_1=
.40.0.bb" rel=3D"noreferrer" target=3D"_blank">nghttp2_1.40.0.bb</a><br>
&gt; &gt; index 9ed8c5642..b212ede4d 100644<br>
&gt; &gt; --- a/meta-networking/recipes-support/nghttp2/<a href=3D"http://=
nghttp2_1.40.0.bb" rel=3D"noreferrer" target=3D"_blank">nghttp2_1.40.0.bb</=
a><br>
&gt; &gt; +++ b/meta-networking/recipes-support/nghttp2/<a href=3D"http://=
nghttp2_1.40.0.bb" rel=3D"noreferrer" target=3D"_blank">nghttp2_1.40.0.bb</=
a><br>
&gt; &gt; @@ -10,6 +10,7 @@ UPSTREAM_CHECK_URI =3D<br>
&gt; &quot;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases&amp;amp;data=3D=
04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C353945=
1eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;amp;sdata=3DmisO%2FSEpB92THW3xVx9%2BWkvFsdI3Z%2FL%2Fy%2FdMcEG88AY%3=
D&amp;amp;reserved=3D0" rel=3D"noreferrer" target=3D"_blank">https://apc01.=
safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%=
2Fnghttp2%2Freleases&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b=
0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63=
7490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DmisO%2FSEpB92THW3xV=
x9%2BWkvFsdI3Z%2FL%2Fy%2FdMcEG88AY%3D&amp;amp;reserved=3D0</a>&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;a=
mp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5=
f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C1000&amp;amp;sdata=3Dtq%2BGz4zgfP84bLfqf2UAI384FMhi%2BU4KvPghoPjGR=
9Y%3D&amp;amp;reserved=3D0%7BPV%7D/nghttp2-$%7BPV%7D.tar.xz" rel=3D"norefer=
rer" target=3D"_blank">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%=
24&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d=
8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dtq%2BGz4zgfP84bLfqf2UAI384FMhi%2BU4Kv=
PghoPjGR9Y%3D&amp;amp;reserved=3D0{PV}/nghttp2-${PV}.tar.xz</a><br>
&gt; \<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-fetch-ocsp-response-us=
e-python3.patch \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 file://CVE-2020-11080.patch \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;=C2=A0 SRC_URI[md5sum] =3D &quot;8d1a6b96760254e4dd142d7176e8fb7c=
&quot;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt; &quot;09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed3bc4cdcee6907=
3&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt; This message contains information that may be privileged or<br>
&gt; confidential and is the property of the KPIT Technologies Ltd. It is<=
br>
&gt; intended only for the person to whom it is addressed. If you are not<=
br>
&gt; the intended recipient, you are not authorized to read, print, retain=
<br>
&gt; copy, disseminate, distribute, or use this message or any part<br>
&gt; thereof. If you receive this message in error, please notify the<br>
&gt; sender immediately and delete all copies of this message. KPIT<br>
&gt; Technologies Ltd. does not accept any liability for virus infected ma=
ils.<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
&gt; This message contains information that may be privileged or<br>
&gt; confidential and is the property of the KPIT Technologies Ltd. It is<=
br>
&gt; intended only for the person to whom it is addressed. If you are not<=
br>
&gt; the intended recipient, you are not authorized to read, print, retain=
<br>
&gt; copy, disseminate, distribute, or use this message or any part<br>
&gt; thereof. If you receive this message in error, please notify the<br>
&gt; sender immediately and delete all copies of this message. KPIT<br>
&gt; Technologies Ltd. does not accept any liability for virus infected ma=
ils. <br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000bec18805bbcd794c--
