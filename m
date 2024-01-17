Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D463FC47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 08:03:08 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.4559.1705478580305544505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 00:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=H6nFPwh+;
 spf=pass (domain: mvista.com, ip: 209.85.208.178, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cd8b64a52dso64759421fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 00:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705478578; x=1706083378; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z9X7pZuTj5ZpRTJc5EnkX3XSKBDgLEJ6Dtx2dkG+gng=;
        b=H6nFPwh+sj0Hedn3jDdcRish1nwNBNBuYVnljx0R7EA36oNi6kOkknadbZu0K3TcP8
         3i3sERPkIPkTWM8Lz4574TG+A2fn3uUZGRDMhoJp+7bTQJU8xV363AUmodgL2yuAt7fG
         yyRjCzT4NGD2NJgAVcTVtsHSZdOtO7JK2Fi1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705478578; x=1706083378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9X7pZuTj5ZpRTJc5EnkX3XSKBDgLEJ6Dtx2dkG+gng=;
        b=Tk6zu/vrNgVeOZYm5SBvE8FtTR/JUaYnq9Og4jNdTUl66gKbq6bFzF6b9qr7tDn6D3
         CrZNPAtMa8EysKyoYpEtXPNr5KbxwNknqOd5F9iYOnOL3Za8x93rP9kFD81A0dBX83DO
         2/PdqNh76DrGvBecs3lb4b9VwDR+qygk9rPfCgkYVhmUHjrXfpZhzNI2iWMoOwzVqv7a
         zgYeC2aqOAtwQtYiaqwFhmMNrg3HKKeGAf0uKhcd2JBertGUdD+BNt3hYL1DlpD8f5su
         HFT403mTSvcwlZn3h3NibZ37sShpiHwOLH+7kF/j8pkj8wpwTv3JmQWstv/Es3m94lvK
         q5Uw==
X-Gm-Message-State: AOJu0YwA4mdnh1XnLYgBJCFJnKPIgCwDtBtuXgpVSS1H7OIl0qz5GEex
	8N2Uys0RW2jXwRE9pupO1CBI2XD5mCpyTLSIuqFdMAj9ZGbwvfKl1Plu5CZzsjo=
X-Google-Smtp-Source: AGHT+IFhu/VtFJ/HpgPeEfg9B8r9bgojyTbMB0mvZtKmOo0vCTayDCzWAxrqZpaqRyBeloDKFOrNXixPUoCZBE0Ntt4=
X-Received: by 2002:a2e:730f:0:b0:2cc:695a:ab4f with SMTP id
 o15-20020a2e730f000000b002cc695aab4fmr3969192ljc.104.1705478577903; Wed, 17
 Jan 2024 00:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20240117070817.1099249-1-meenali.gupta@windriver.com>
In-Reply-To: <20240117070817.1099249-1-meenali.gupta@windriver.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 17 Jan 2024 13:32:46 +0530
Message-ID: <CANQUz1-ZqGapAYxgUUiCfZoA5j+KvEFMQpz8nLAWA_S2jh-=Jg@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] openssh: fix CVE-2023-48795
To: meenali.gupta@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cee9c5060f1facfa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193897

--000000000000cee9c5060f1facfa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Meenali Gupta,

Already CVE-2023-48795 patch for openssh recipe has been merged to
kirkstone branch.

Please find the below links

https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3Ddf5dc8d67e67a2aebf1a552c3e22374e305270bf

https://lists.openembedded.org/g/openembedded-core/message/192819

Thanks & Regards,
Vijay

On Wed, Jan 17, 2024 at 12:38=E2=80=AFPM Meenali Gupta via lists.openembedd=
ed.org
<meenali.gupta=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Meenali Gupta <meenali.gupta@windriver.com>
>
> A flaw was found in the SSH channel integrity.By manipulating sequence
> numbers during the handshake,an attacker can remove the initial messages
> on the secure channel without causing a MAC failure. For example,an
> attacker
> could disable the ping extension and thus disable the new countermeasure =
in
> OpenSSH 9.5 against keystroke timing attacks.
>
> This CVE fix included function kex_proposal_populate_entries in kex.c fil=
e
> which
> is not present in 8.9p, so ignored this change.
>
> Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ---
>  .../openssh/openssh/CVE-2023-48795.patch      | 503 ++++++++++++++++++
>  .../openssh/openssh_8.9p1.bb                  |   1 +
>  2 files changed, 504 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
>
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
> b/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
> new file mode 100644
> index 0000000000..b1b16d5641
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
> @@ -0,0 +1,503 @@
> +From 1edb00c58f8a6875fad6a497aa2bacf37f9e6cd5 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Mon, 18 Dec 2023 14:45:17 +0000
> +Subject: [PATCH] upstream: implement "strict key exchange" in ssh and ss=
hd
> + This adds a protocol extension to improve the integrity of the SSH
> transport
> + protocol, particular in and around the initial key exchange (KEX) phase=
.
> +
> +Full details of the extension are in the PROTOCOL file.
> +
> +with markus@
> +
> +OpenBSD-Commit-ID: 2a66ac962f0a630d7945fee54004ed9e9c439f14
> +
> +CVE: CVE-2023-48795
> +Upstream-Status: Backport [
> https://github.com/openssh/openssh-portable/commit/1edb00c58f8a6875fad6a4=
97aa2bacf37f9e6cd5
> ]
> +
> +Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> +---
> + PROTOCOL      |  28 +++++++++++++-
> + kex.c         |  71 +++++++++++++++++++++-------------
> + kex.h         |   3 +-
> + packet.c      | 103 +++++++++++++++++++++++++++++---------------------
> + packet.h      |   3 +-
> + sshconnect2.c |  12 ++----
> + 6 files changed, 137 insertions(+), 83 deletions(-)
> +
> +diff --git a/PROTOCOL b/PROTOCOL
> +index e6a7d60..68912ce 100644
> +--- a/PROTOCOL
> ++++ b/PROTOCOL
> +@@ -102,6 +102,32 @@ OpenSSH supports the use of ECDH in Curve25519 for
> key exchange as
> + described at:
> +
> http://git.libssh.org/users/aris/libssh.git/plain/doc/curve25519-sha256@l=
ibssh.org.txt?h=3Dcurve25519
> +
> ++1.9 transport: strict key exchange extension
> ++
> ++OpenSSH supports a number of transport-layer hardening measures under
> ++a "strict KEX" feature. This feature is signalled similarly to the
> ++RFC8308 ext-info feature: by including a additional algorithm in the
> ++initiial SSH2_MSG_KEXINIT kex_algorithms field. The client may append
> ++"kex-strict-c-v00@openssh.com" to its kex_algorithms and the server
> ++may append "kex-strict-s-v00@openssh.com". These pseudo-algorithms
> ++are only valid in the initial SSH2_MSG_KEXINIT and MUST be ignored
> ++if they are present in subsequent SSH2_MSG_KEXINIT packets.
> ++
> ++When an endpoint that supports this extension observes this algorithm
> ++name in a peer's KEXINIT packet, it MUST make the following changes to
> ++the the protocol:
> ++
> ++a) During initial KEX, terminate the connection if any unexpected or
> ++   out-of-sequence packet is received. This includes terminating the
> ++   connection if the first packet received is not SSH2_MSG_KEXINIT.
> ++   Unexpected packets for the purpose of strict KEX include messages
> ++   that are otherwise valid at any time during the connection such as
> ++   SSH2_MSG_DEBUG and SSH2_MSG_IGNORE.
> ++b) After sending or receiving a SSH2_MSG_NEWKEYS message, reset the
> ++   packet sequence number to zero. This behaviour persists for the
> ++   duration of the connection (i.e. not just the first
> ++   SSH2_MSG_NEWKEYS).
> ++
> + 2. Connection protocol changes
> +
> + 2.1. connection: Channel write close extension "eow@openssh.com"
> +@@ -612,4 +638,4 @@ master instance and later clients.
> + OpenSSH extends the usual agent protocol. These changes are documented
> + in the PROTOCOL.agent file.
> +
> +-$OpenBSD: PROTOCOL,v 1.43 2021/12/19 22:15:42 djm Exp $
> ++$OpenBSD: PROTOCOL,v 1.50 2023/12/18 14:45:17 djm Exp $
> +diff --git a/kex.c b/kex.c
> +index 0bcd27d..da16568 100644
> +--- a/kex.c
> ++++ b/kex.c
> +@@ -1,4 +1,4 @@
> +-/* $OpenBSD: kex.c,v 1.172 2022/02/01 23:32:51 djm Exp $ */
> ++/* $OpenBSD: kex.c,v 1.183 2023/12/18 14:45:17 djm Exp $ */
> + /*
> +  * Copyright (c) 2000, 2001 Markus Friedl.  All rights reserved.
> +  *
> +@@ -63,7 +63,7 @@
> + #include "digest.h"
> +
> + /* prototype */
> +-static int kex_choose_conf(struct ssh *);
> ++static int kex_choose_conf(struct ssh *, uint32_t seq);
> + static int kex_input_newkeys(int, u_int32_t, struct ssh *);
> +
> + static const char * const proposal_names[PROPOSAL_MAX] =3D {
> +@@ -175,6 +175,18 @@ kex_names_valid(const char *names)
> +       return 1;
> + }
> +
> ++/* returns non-zero if proposal contains any algorithm from algs */
> ++static int
> ++has_any_alg(const char *proposal, const char *algs)
> ++{
> ++      char *cp;
> ++
> ++      if ((cp =3D match_list(proposal, algs, NULL)) =3D=3D NULL)
> ++              return 0;
> ++      free(cp);
> ++      return 1;
> ++}
> ++
> + /*
> +  * Concatenate algorithm names, avoiding duplicates in the process.
> +  * Caller must free returned string.
> +@@ -182,7 +194,7 @@ kex_names_valid(const char *names)
> + char *
> + kex_names_cat(const char *a, const char *b)
> + {
> +-      char *ret =3D NULL, *tmp =3D NULL, *cp, *p, *m;
> ++      char *ret =3D NULL, *tmp =3D NULL, *cp, *p;
> +       size_t len;
> +
> +       if (a =3D=3D NULL || *a =3D=3D '\0')
> +@@ -199,10 +211,8 @@ kex_names_cat(const char *a, const char *b)
> +       }
> +       strlcpy(ret, a, len);
> +       for ((p =3D strsep(&cp, ",")); p && *p !=3D '\0'; (p =3D strsep(&=
cp,
> ","))) {
> +-              if ((m =3D match_list(ret, p, NULL)) !=3D NULL) {
> +-                      free(m);
> ++              if (has_any_alg(ret, p))
> +                       continue; /* Algorithm already present */
> +-              }
> +               if (strlcat(ret, ",", len) >=3D len ||
> +                   strlcat(ret, p, len) >=3D len) {
> +                       free(tmp);
> +@@ -410,7 +420,12 @@ kex_protocol_error(int type, u_int32_t seq, struct
> ssh *ssh)
> + {
> +       int r;
> +
> +-      error("kex protocol error: type %d seq %u", type, seq);
> ++      /* If in strict mode, any unexpected message is an error */
> ++      if ((ssh->kex->flags & KEX_INITIAL) && ssh->kex->kex_strict) {
> ++              ssh_packet_disconnect(ssh, "strict KEX violation: "
> ++                  "unexpected packet type %u (seqnr %u)", type, seq);
> ++      }
> ++      error_f("type %u seq %u", type, seq);
> +       if ((r =3D sshpkt_start(ssh, SSH2_MSG_UNIMPLEMENTED)) !=3D 0 ||
> +           (r =3D sshpkt_put_u32(ssh, seq)) !=3D 0 ||
> +           (r =3D sshpkt_send(ssh)) !=3D 0)
> +@@ -496,7 +511,7 @@ kex_input_ext_info(int type, u_int32_t seq, struct
> ssh *ssh)
> +                       /* Ensure no \0 lurking in value */
> +                       if (memchr(val, '\0', vlen) !=3D NULL) {
> +                               error_f("nul byte in %s", name);
> +-                              return SSH_ERR_INVALID_FORMAT;
> ++                              return dispatch_protocol_error(type, seq,
> ssh);
> +                       }
> +                       debug_f("%s=3D<%s>", name, val);
> +                       kex->server_sig_algs =3D val;
> +@@ -600,7 +615,7 @@ kex_input_kexinit(int type, u_int32_t seq, struct ss=
h
> *ssh)
> +               error_f("no kex");
> +               return SSH_ERR_INTERNAL_ERROR;
> +       }
> +-      ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, NULL);
> ++      ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, &kex_protocol_error);
> +       ptr =3D sshpkt_ptr(ssh, &dlen);
> +       if ((r =3D sshbuf_put(kex->peer, ptr, dlen)) !=3D 0)
> +               return r;
> +@@ -636,7 +651,7 @@ kex_input_kexinit(int type, u_int32_t seq, struct ss=
h
> *ssh)
> +       if (!(kex->flags & KEX_INIT_SENT))
> +               if ((r =3D kex_send_kexinit(ssh)) !=3D 0)
> +                       return r;
> +-      if ((r =3D kex_choose_conf(ssh)) !=3D 0)
> ++      if ((r =3D kex_choose_conf(ssh, seq)) !=3D 0)
> +               return r;
> +
> +       if (kex->kex_type < KEX_MAX && kex->kex[kex->kex_type] !=3D NULL)
> +@@ -900,20 +915,14 @@ proposals_match(char *my[PROPOSAL_MAX], char
> *peer[PROPOSAL_MAX])
> +       return (1);
> + }
> +
> +-/* returns non-zero if proposal contains any algorithm from algs */
> + static int
> +-has_any_alg(const char *proposal, const char *algs)
> ++kexalgs_contains(char **peer, const char *ext)
> + {
> +-      char *cp;
> +-
> +-      if ((cp =3D match_list(proposal, algs, NULL)) =3D=3D NULL)
> +-              return 0;
> +-      free(cp);
> +-      return 1;
> ++      return has_any_alg(peer[PROPOSAL_KEX_ALGS], ext);
> + }
> +
> + static int
> +-kex_choose_conf(struct ssh *ssh)
> ++kex_choose_conf(struct ssh *ssh, uint32_t seq)
> + {
> +       struct kex *kex =3D ssh->kex;
> +       struct newkeys *newkeys;
> +@@ -938,13 +947,23 @@ kex_choose_conf(struct ssh *ssh)
> +               sprop=3Dpeer;
> +       }
> +
> +-      /* Check whether client supports ext_info_c */
> +-      if (kex->server && (kex->flags & KEX_INITIAL)) {
> +-              char *ext;
> +-
> +-              ext =3D match_list("ext-info-c", peer[PROPOSAL_KEX_ALGS],
> NULL);
> +-              kex->ext_info_c =3D (ext !=3D NULL);
> +-              free(ext);
> ++      /* Check whether peer supports ext_info/kex_strict */
> ++      if ((kex->flags & KEX_INITIAL) !=3D 0) {
> ++              if (kex->server) {
> ++                      kex->ext_info_c =3D kexalgs_contains(peer,
> "ext-info-c");
> ++                      kex->kex_strict =3D kexalgs_contains(peer,
> ++                          "kex-strict-c-v00@openssh.com");
> ++              } else {
> ++                      kex->kex_strict =3D kexalgs_contains(peer,
> ++                          "kex-strict-s-v00@openssh.com");
> ++              }
> ++              if (kex->kex_strict) {
> ++                      debug3_f("will use strict KEX ordering");
> ++                      if (seq !=3D 0)
> ++                              ssh_packet_disconnect(ssh,
> ++                                  "strict KEX violation: "
> ++                                  "KEXINIT was not the first packet");
> ++              }
> +       }
> +
> +       /* Check whether client supports rsa-sha2 algorithms */
> +diff --git a/kex.h b/kex.h
> +index c353295..c27f9d8 100644
> +--- a/kex.h
> ++++ b/kex.h
> +@@ -1,4 +1,4 @@
> +-/* $OpenBSD: kex.h,v 1.117 2022/01/06 21:55:23 djm Exp $ */
> ++/* $OpenBSD: kex.h,v 1.120 2023/12/18 14:45:17 djm Exp $ */
> +
> + /*
> +  * Copyright (c) 2000, 2001 Markus Friedl.  All rights reserved.
> +@@ -148,6 +148,7 @@ struct kex {
> +       u_int   kex_type;
> +       char    *server_sig_algs;
> +       int     ext_info_c;
> ++      int     kex_strict;
> +       struct sshbuf *my;
> +       struct sshbuf *peer;
> +       struct sshbuf *client_version;
> +diff --git a/packet.c b/packet.c
> +index bde6c10..322a8c2 100644
> +--- a/packet.c
> ++++ b/packet.c
> +@@ -1,4 +1,4 @@
> +-/* $OpenBSD: packet.c,v 1.307 2022/01/22 00:49:34 djm Exp $ */
> ++/* $OpenBSD: packet.c,v 1.313 2023/12/18 14:45:17 djm Exp $ */
> + /*
> +  * Author: Tatu Ylonen <ylo@cs.hut.fi>
> +  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
> +@@ -1205,8 +1205,13 @@ ssh_packet_send2_wrapped(struct ssh *ssh)
> +       sshbuf_dump(state->output, stderr);
> + #endif
> +       /* increment sequence number for outgoing packets */
> +-      if (++state->p_send.seqnr =3D=3D 0)
> ++      if (++state->p_send.seqnr =3D=3D 0) {
> ++              if ((ssh->kex->flags & KEX_INITIAL) !=3D 0) {
> ++                      ssh_packet_disconnect(ssh, "outgoing sequence
> number "
> ++                          "wrapped during initial key exchange");
> ++              }
> +               logit("outgoing seqnr wraps around");
> ++      }
> +       if (++state->p_send.packets =3D=3D 0)
> +               if (!(ssh->compat & SSH_BUG_NOREKEY))
> +                       return SSH_ERR_NEED_REKEY;
> +@@ -1214,6 +1219,11 @@ ssh_packet_send2_wrapped(struct ssh *ssh)
> +       state->p_send.bytes +=3D len;
> +       sshbuf_reset(state->outgoing_packet);
> +
> ++      if (type =3D=3D SSH2_MSG_NEWKEYS && ssh->kex->kex_strict) {
> ++              debug_f("resetting send seqnr %u", state->p_send.seqnr);
> ++              state->p_send.seqnr =3D 0;
> ++      }
> ++
> +       if (type =3D=3D SSH2_MSG_NEWKEYS)
> +               r =3D ssh_set_newkeys(ssh, MODE_OUT);
> +       else if (type =3D=3D SSH2_MSG_USERAUTH_SUCCESS && state->server_s=
ide)
> +@@ -1342,8 +1352,7 @@ ssh_packet_read_seqnr(struct ssh *ssh, u_char
> *typep, u_int32_t *seqnr_p)
> +       /* Stay in the loop until we have received a complete packet. */
> +       for (;;) {
> +               /* Try to read a packet from the buffer. */
> +-              r =3D ssh_packet_read_poll_seqnr(ssh, typep, seqnr_p);
> +-              if (r !=3D 0)
> ++              if ((r =3D ssh_packet_read_poll_seqnr(ssh, typep, seqnr_p=
))
> !=3D 0)
> +                       break;
> +               /* If we got a packet, return it. */
> +               if (*typep !=3D SSH_MSG_NONE)
> +@@ -1414,29 +1423,6 @@ ssh_packet_read(struct ssh *ssh)
> +       return type;
> + }
> +
> +-/*
> +- * Waits until a packet has been received, verifies that its type match=
es
> +- * that given, and gives a fatal error and exits if there is a mismatch=
.
> +- */
> +-
> +-int
> +-ssh_packet_read_expect(struct ssh *ssh, u_int expected_type)
> +-{
> +-      int r;
> +-      u_char type;
> +-
> +-      if ((r =3D ssh_packet_read_seqnr(ssh, &type, NULL)) !=3D 0)
> +-              return r;
> +-      if (type !=3D expected_type) {
> +-              if ((r =3D sshpkt_disconnect(ssh,
> +-                  "Protocol error: expected packet type %d, got %d",
> +-                  expected_type, type)) !=3D 0)
> +-                      return r;
> +-              return SSH_ERR_PROTOCOL_ERROR;
> +-      }
> +-      return 0;
> +-}
> +-
> + static int
> + ssh_packet_read_poll2_mux(struct ssh *ssh, u_char *typep, u_int32_t
> *seqnr_p)
> + {
> +@@ -1627,10 +1613,16 @@ ssh_packet_read_poll2(struct ssh *ssh, u_char
> *typep, u_int32_t *seqnr_p)
> +               if ((r =3D sshbuf_consume(state->input, mac->mac_len)) !=
=3D 0)
> +                       goto out;
> +       }
> ++
> +       if (seqnr_p !=3D NULL)
> +               *seqnr_p =3D state->p_read.seqnr;
> +-      if (++state->p_read.seqnr =3D=3D 0)
> ++      if (++state->p_read.seqnr =3D=3D 0) {
> ++              if ((ssh->kex->flags & KEX_INITIAL) !=3D 0) {
> ++                      ssh_packet_disconnect(ssh, "incoming sequence
> number "
> ++                          "wrapped during initial key exchange");
> ++              }
> +               logit("incoming seqnr wraps around");
> ++      }
> +       if (++state->p_read.packets =3D=3D 0)
> +               if (!(ssh->compat & SSH_BUG_NOREKEY))
> +                       return SSH_ERR_NEED_REKEY;
> +@@ -1696,6 +1688,10 @@ ssh_packet_read_poll2(struct ssh *ssh, u_char
> *typep, u_int32_t *seqnr_p)
> + #endif
> +       /* reset for next packet */
> +       state->packlen =3D 0;
> ++      if (*typep =3D=3D SSH2_MSG_NEWKEYS && ssh->kex->kex_strict) {
> ++              debug_f("resetting read seqnr %u", state->p_read.seqnr);
> ++              state->p_read.seqnr =3D 0;
> ++      }
> +
> +       if ((r =3D ssh_packet_check_rekey(ssh)) !=3D 0)
> +               return r;
> +@@ -1716,10 +1712,39 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh,
> u_char *typep, u_int32_t *seqnr_p)
> +               r =3D ssh_packet_read_poll2(ssh, typep, seqnr_p);
> +               if (r !=3D 0)
> +                       return r;
> +-              if (*typep) {
> +-                      state->keep_alive_timeouts =3D 0;
> +-                      DBG(debug("received packet type %d", *typep));
> ++              if (*typep =3D=3D 0) {
> ++                      /* no message ready */
> ++                      return 0;
> +               }
> ++              state->keep_alive_timeouts =3D 0;
> ++              DBG(debug("received packet type %d", *typep));
> ++
> ++              /* Always process disconnect messages */
> ++              if (*typep =3D=3D SSH2_MSG_DISCONNECT) {
> ++                      if ((r =3D sshpkt_get_u32(ssh, &reason)) !=3D 0 |=
|
> ++                          (r =3D sshpkt_get_string(ssh, &msg, NULL)) !=
=3D 0)
> ++                              return r;
> ++                      /* Ignore normal client exit notifications */
> ++                      do_log2(ssh->state->server_side &&
> ++                          reason =3D=3D SSH2_DISCONNECT_BY_APPLICATION =
?
> ++                          SYSLOG_LEVEL_INFO : SYSLOG_LEVEL_ERROR,
> ++                          "Received disconnect from %s port %d:"
> ++                          "%u: %.400s", ssh_remote_ipaddr(ssh),
> ++                          ssh_remote_port(ssh), reason, msg);
> ++                      free(msg);
> ++                      return SSH_ERR_DISCONNECTED;
> ++              }
> ++
> ++              /*
> ++               * Do not implicitly handle any messages here during
> initial
> ++               * KEX when in strict mode. They will be need to be allow=
ed
> ++               * explicitly by the KEX dispatch table or they will
> generate
> ++               * protocol errors.
> ++               */
> ++              if (ssh->kex !=3D NULL &&
> ++                  (ssh->kex->flags & KEX_INITIAL) &&
> ssh->kex->kex_strict)
> ++                      return 0;
> ++              /* Implicitly handle transport-level messages */
> +               switch (*typep) {
> +               case SSH2_MSG_IGNORE:
> +                       debug3("Received SSH2_MSG_IGNORE");
> +@@ -1734,19 +1759,6 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_cha=
r
> *typep, u_int32_t *seqnr_p)
> +                       debug("Remote: %.900s", msg);
> +                       free(msg);
> +                       break;
> +-              case SSH2_MSG_DISCONNECT:
> +-                      if ((r =3D sshpkt_get_u32(ssh, &reason)) !=3D 0 |=
|
> +-                          (r =3D sshpkt_get_string(ssh, &msg, NULL)) !=
=3D 0)
> +-                              return r;
> +-                      /* Ignore normal client exit notifications */
> +-                      do_log2(ssh->state->server_side &&
> +-                          reason =3D=3D SSH2_DISCONNECT_BY_APPLICATION =
?
> +-                          SYSLOG_LEVEL_INFO : SYSLOG_LEVEL_ERROR,
> +-                          "Received disconnect from %s port %d:"
> +-                          "%u: %.400s", ssh_remote_ipaddr(ssh),
> +-                          ssh_remote_port(ssh), reason, msg);
> +-                      free(msg);
> +-                      return SSH_ERR_DISCONNECTED;
> +               case SSH2_MSG_UNIMPLEMENTED:
> +                       if ((r =3D sshpkt_get_u32(ssh, &seqnr)) !=3D 0)
> +                               return r;
> +@@ -2211,6 +2223,7 @@ kex_to_blob(struct sshbuf *m, struct kex *kex)
> +           (r =3D sshbuf_put_u32(m, kex->hostkey_type)) !=3D 0 ||
> +           (r =3D sshbuf_put_u32(m, kex->hostkey_nid)) !=3D 0 ||
> +           (r =3D sshbuf_put_u32(m, kex->kex_type)) !=3D 0 ||
> ++          (r =3D sshbuf_put_u32(m, kex->kex_strict)) !=3D 0 ||
> +           (r =3D sshbuf_put_stringb(m, kex->my)) !=3D 0 ||
> +           (r =3D sshbuf_put_stringb(m, kex->peer)) !=3D 0 ||
> +           (r =3D sshbuf_put_stringb(m, kex->client_version)) !=3D 0 ||
> +@@ -2373,6 +2386,7 @@ kex_from_blob(struct sshbuf *m, struct kex **kexp)
> +           (r =3D sshbuf_get_u32(m, (u_int *)&kex->hostkey_type)) !=3D 0=
 ||
> +           (r =3D sshbuf_get_u32(m, (u_int *)&kex->hostkey_nid)) !=3D 0 =
||
> +           (r =3D sshbuf_get_u32(m, &kex->kex_type)) !=3D 0 ||
> ++          (r =3D sshbuf_get_u32(m, &kex->kex_strict)) !=3D 0 ||
> +           (r =3D sshbuf_get_stringb(m, kex->my)) !=3D 0 ||
> +           (r =3D sshbuf_get_stringb(m, kex->peer)) !=3D 0 ||
> +           (r =3D sshbuf_get_stringb(m, kex->client_version)) !=3D 0 ||
> +@@ -2701,6 +2715,7 @@ sshpkt_disconnect(struct ssh *ssh, const char
> *fmt,...)
> +       vsnprintf(buf, sizeof(buf), fmt, args);
> +       va_end(args);
> +
> ++      debug2_f("sending SSH2_MSG_DISCONNECT: %s", buf);
> +       if ((r =3D sshpkt_start(ssh, SSH2_MSG_DISCONNECT)) !=3D 0 ||
> +           (r =3D sshpkt_put_u32(ssh, SSH2_DISCONNECT_PROTOCOL_ERROR)) !=
=3D 0
> ||
> +           (r =3D sshpkt_put_cstring(ssh, buf)) !=3D 0 ||
> +diff --git a/packet.h b/packet.h
> +index 176488b..3e03f53 100644
> +--- a/packet.h
> ++++ b/packet.h
> +@@ -1,4 +1,4 @@
> +-/* $OpenBSD: packet.h,v 1.94 2022/01/22 00:49:34 djm Exp $ */
> ++/* $OpenBSD: packet.h,v 1.96 2023/12/18 14:45:17 djm Exp $ */
> +
> + /*
> +  * Author: Tatu Ylonen <ylo@cs.hut.fi>
> +@@ -124,7 +124,6 @@ int         ssh_packet_send2_wrapped(struct ssh *);
> + int    ssh_packet_send2(struct ssh *);
> +
> + int      ssh_packet_read(struct ssh *);
> +-int    ssh_packet_read_expect(struct ssh *, u_int type);
> + int      ssh_packet_read_poll(struct ssh *);
> + int ssh_packet_read_poll2(struct ssh *, u_char *, u_int32_t *seqnr_p);
> + int    ssh_packet_process_incoming(struct ssh *, const char *buf, u_int
> len);
> +diff --git a/sshconnect2.c b/sshconnect2.c
> +index b25225e..1deaa5e 100644
> +--- a/sshconnect2.c
> ++++ b/sshconnect2.c
> +@@ -1,4 +1,4 @@
> +-/* $OpenBSD: sshconnect2.c,v 1.356 2022/02/01 23:32:51 djm Exp $ */
> ++/* $OpenBSD: sshconnect2.c,v 1.370 2023/12/18 14:45:17 djm Exp $ */
> + /*
> +  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
> +  * Copyright (c) 2008 Damien Miller.  All rights reserved.
> +@@ -363,7 +363,6 @@ struct cauthmethod {
> + };
> +
> + static int input_userauth_service_accept(int, u_int32_t, struct ssh *);
> +-static int input_userauth_ext_info(int, u_int32_t, struct ssh *);
> + static int input_userauth_success(int, u_int32_t, struct ssh *);
> + static int input_userauth_failure(int, u_int32_t, struct ssh *);
> + static int input_userauth_banner(int, u_int32_t, struct ssh *);
> +@@ -477,7 +476,7 @@ ssh_userauth2(struct ssh *ssh, const char *local_use=
r,
> +
> +       ssh->authctxt =3D &authctxt;
> +       ssh_dispatch_init(ssh, &input_userauth_error);
> +-      ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, &input_userauth_ext_info=
);
> ++      ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, kex_input_ext_info);
> +       ssh_dispatch_set(ssh, SSH2_MSG_SERVICE_ACCEPT,
> &input_userauth_service_accept);
> +       ssh_dispatch_run_fatal(ssh, DISPATCH_BLOCK, &authctxt.success); /=
*
> loop until success */
> +       pubkey_cleanup(ssh);
> +@@ -530,12 +529,6 @@ input_userauth_service_accept(int type, u_int32_t
> seq, struct ssh *ssh)
> + }
> +
> + /* ARGSUSED */
> +-static int
> +-input_userauth_ext_info(int type, u_int32_t seqnr, struct ssh *ssh)
> +-{
> +-      return kex_input_ext_info(type, seqnr, ssh);
> +-}
> +-
> + void
> + userauth(struct ssh *ssh, char *authlist)
> + {
> +@@ -617,6 +610,7 @@ input_userauth_success(int type, u_int32_t seq,
> struct ssh *ssh)
> +       free(authctxt->methoddata);
> +       authctxt->methoddata =3D NULL;
> +       authctxt->success =3D 1;                  /* break out */
> ++      ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, dispatch_protocol_error)=
;
> +       return 0;
> + }
> +
> +--
> +2.40.0
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> index 3f3cd2a908..91f04bf08b 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> @@ -33,6 +33,7 @@ SRC_URI =3D "
> http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://CVE-2023-38408-0002.patch \
>             file://CVE-2023-38408-0003.patch \
>             file://CVE-2023-38408-0004.patch \
> +           file://CVE-2023-48795.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193892):
> https://lists.openembedded.org/g/openembedded-core/message/193892
> Mute This Topic: https://lists.openembedded.org/mt/103781431/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cee9c5060f1facfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Meenali Gupta,<br><br></div>Already CVE-=
2023-48795 patch for openssh recipe has been merged to kirkstone branch.<br=
><br></div>Please find the below links<br><br><a href=3D"https://git.openem=
bedded.org/openembedded-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;i=
d=3Ddf5dc8d67e67a2aebf1a552c3e22374e305270bf">https://git.openembedded.org/=
openembedded-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3Ddf5dc8d=
67e67a2aebf1a552c3e22374e305270bf</a><br><br><a href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/message/192819">https://lists.openembedded.=
org/g/openembedded-core/message/192819</a><br><br></div><div>Thanks &amp; R=
egards,</div><div>Vijay<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 17, 2024 at 12:38=E2=80=AFPM M=
eenali Gupta via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;meenali.gupta=3D<a href=3D"mailto:windriver.com@lists.openem=
bedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Meenali Gupta &lt;<a =
href=3D"mailto:meenali.gupta@windriver.com" target=3D"_blank">meenali.gupta=
@windriver.com</a>&gt;<br>
<br>
A flaw was found in the SSH channel integrity.By manipulating sequence<br>
numbers during the handshake,an attacker can remove the initial messages<br=
>
on the secure channel without causing a MAC failure. For example,an attacke=
r<br>
could disable the ping extension and thus disable the new countermeasure in=
<br>
OpenSSH 9.5 against keystroke timing attacks.<br>
<br>
This CVE fix included function kex_proposal_populate_entries in kex.c file =
which<br>
is not present in 8.9p, so ignored this change.<br>
<br>
Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver.=
com" target=3D"_blank">meenali.gupta@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../openssh/openssh/CVE-2023-48795.patch=C2=A0 =C2=A0 =C2=A0 | 503 ++=
++++++++++++++++<br>
=C2=A0.../openssh/<a href=3D"http://openssh_8.9p1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">openssh_8.9p1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 504 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023=
-48795.patch<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch<br>
new file mode 100644<br>
index 0000000000..b1b16d5641<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch<br>
@@ -0,0 +1,503 @@<br>
+From 1edb00c58f8a6875fad6a497aa2bacf37f9e6cd5 Mon Sep 17 00:00:00 2001<br>
+From: &quot;<a href=3D"mailto:djm@openbsd.org" target=3D"_blank">djm@openb=
sd.org</a>&quot; &lt;<a href=3D"mailto:djm@openbsd.org" target=3D"_blank">d=
jm@openbsd.org</a>&gt;<br>
+Date: Mon, 18 Dec 2023 14:45:17 +0000<br>
+Subject: [PATCH] upstream: implement &quot;strict key exchange&quot; in ss=
h and sshd<br>
+ This adds a protocol extension to improve the integrity of the SSH transp=
ort<br>
+ protocol, particular in and around the initial key exchange (KEX) phase.<=
br>
+<br>
+Full details of the extension are in the PROTOCOL file.<br>
+<br>
+with markus@<br>
+<br>
+OpenBSD-Commit-ID: 2a66ac962f0a630d7945fee54004ed9e9c439f14<br>
+<br>
+CVE: CVE-2023-48795<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/openssh/openssh-p=
ortable/commit/1edb00c58f8a6875fad6a497aa2bacf37f9e6cd5" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/openssh/openssh-portable/commit/1edb0=
0c58f8a6875fad6a497aa2bacf37f9e6cd5</a>]<br>
+<br>
+Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver=
.com" target=3D"_blank">meenali.gupta@windriver.com</a>&gt;<br>
+---<br>
+ PROTOCOL=C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +++++++++++++-<br>
+ kex.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 71 +++++++++++++++++++++--=
-----------<br>
+ kex.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
+ packet.c=C2=A0 =C2=A0 =C2=A0 | 103 +++++++++++++++++++++++++++++---------=
------------<br>
+ packet.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
+ sshconnect2.c |=C2=A0 12 ++----<br>
+ 6 files changed, 137 insertions(+), 83 deletions(-)<br>
+<br>
+diff --git a/PROTOCOL b/PROTOCOL<br>
+index e6a7d60..68912ce 100644<br>
+--- a/PROTOCOL<br>
++++ b/PROTOCOL<br>
+@@ -102,6 +102,32 @@ OpenSSH supports the use of ECDH in Curve25519 for ke=
y exchange as<br>
+ described at:<br>
+ <a href=3D"http://git.libssh.org/users/aris/libssh.git/plain/doc/curve255=
19-sha256@libssh.org.txt?h=3Dcurve25519" rel=3D"noreferrer" target=3D"_blan=
k">http://git.libssh.org/users/aris/libssh.git/plain/doc/curve25519-sha256@=
libssh.org.txt?h=3Dcurve25519</a><br>
+<br>
++1.9 transport: strict key exchange extension<br>
++<br>
++OpenSSH supports a number of transport-layer hardening measures under<br>
++a &quot;strict KEX&quot; feature. This feature is signalled similarly to =
the<br>
++RFC8308 ext-info feature: by including a additional algorithm in the<br>
++initiial SSH2_MSG_KEXINIT kex_algorithms field. The client may append<br>
++&quot;<a href=3D"mailto:kex-strict-c-v00@openssh.com" target=3D"_blank">k=
ex-strict-c-v00@openssh.com</a>&quot; to its kex_algorithms and the server<=
br>
++may append &quot;<a href=3D"mailto:kex-strict-s-v00@openssh.com" target=
=3D"_blank">kex-strict-s-v00@openssh.com</a>&quot;. These pseudo-algorithms=
<br>
++are only valid in the initial SSH2_MSG_KEXINIT and MUST be ignored<br>
++if they are present in subsequent SSH2_MSG_KEXINIT packets.<br>
++<br>
++When an endpoint that supports this extension observes this algorithm<br>
++name in a peer&#39;s KEXINIT packet, it MUST make the following changes t=
o<br>
++the the protocol:<br>
++<br>
++a) During initial KEX, terminate the connection if any unexpected or<br>
++=C2=A0 =C2=A0out-of-sequence packet is received. This includes terminatin=
g the<br>
++=C2=A0 =C2=A0connection if the first packet received is not SSH2_MSG_KEXI=
NIT.<br>
++=C2=A0 =C2=A0Unexpected packets for the purpose of strict KEX include mes=
sages<br>
++=C2=A0 =C2=A0that are otherwise valid at any time during the connection s=
uch as<br>
++=C2=A0 =C2=A0SSH2_MSG_DEBUG and SSH2_MSG_IGNORE.<br>
++b) After sending or receiving a SSH2_MSG_NEWKEYS message, reset the<br>
++=C2=A0 =C2=A0packet sequence number to zero. This behaviour persists for =
the<br>
++=C2=A0 =C2=A0duration of the connection (i.e. not just the first<br>
++=C2=A0 =C2=A0SSH2_MSG_NEWKEYS).<br>
++<br>
+ 2. Connection protocol changes<br>
+<br>
+ 2.1. connection: Channel write close extension &quot;<a href=3D"mailto:eo=
w@openssh.com" target=3D"_blank">eow@openssh.com</a>&quot;<br>
+@@ -612,4 +638,4 @@ master instance and later clients.<br>
+ OpenSSH extends the usual agent protocol. These changes are documented<br=
>
+ in the PROTOCOL.agent file.<br>
+<br>
+-$OpenBSD: PROTOCOL,v 1.43 2021/12/19 22:15:42 djm Exp $<br>
++$OpenBSD: PROTOCOL,v 1.50 2023/12/18 14:45:17 djm Exp $<br>
+diff --git a/kex.c b/kex.c<br>
+index 0bcd27d..da16568 100644<br>
+--- a/kex.c<br>
++++ b/kex.c<br>
+@@ -1,4 +1,4 @@<br>
+-/* $OpenBSD: kex.c,v 1.172 2022/02/01 23:32:51 djm Exp $ */<br>
++/* $OpenBSD: kex.c,v 1.183 2023/12/18 14:45:17 djm Exp $ */<br>
+ /*<br>
+=C2=A0 * Copyright (c) 2000, 2001 Markus Friedl.=C2=A0 All rights reserved=
.<br>
+=C2=A0 *<br>
+@@ -63,7 +63,7 @@<br>
+ #include &quot;digest.h&quot;<br>
+<br>
+ /* prototype */<br>
+-static int kex_choose_conf(struct ssh *);<br>
++static int kex_choose_conf(struct ssh *, uint32_t seq);<br>
+ static int kex_input_newkeys(int, u_int32_t, struct ssh *);<br>
+<br>
+ static const char * const proposal_names[PROPOSAL_MAX] =3D {<br>
+@@ -175,6 +175,18 @@ kex_names_valid(const char *names)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+ }<br>
+<br>
++/* returns non-zero if proposal contains any algorithm from algs */<br>
++static int<br>
++has_any_alg(const char *proposal, const char *algs)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 char *cp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if ((cp =3D match_list(proposal, algs, NULL)) =3D=3D=
 NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 free(cp);<br>
++=C2=A0 =C2=A0 =C2=A0 return 1;<br>
++}<br>
++<br>
+ /*<br>
+=C2=A0 * Concatenate algorithm names, avoiding duplicates in the process.<=
br>
+=C2=A0 * Caller must free returned string.<br>
+@@ -182,7 +194,7 @@ kex_names_valid(const char *names)<br>
+ char *<br>
+ kex_names_cat(const char *a, const char *b)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 char *ret =3D NULL, *tmp =3D NULL, *cp, *p, *m;<br>
++=C2=A0 =C2=A0 =C2=A0 char *ret =3D NULL, *tmp =3D NULL, *cp, *p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (a =3D=3D NULL || *a =3D=3D &#39;\0&#39;)<br=
>
+@@ -199,10 +211,8 @@ kex_names_cat(const char *a, const char *b)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strlcpy(ret, a, len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for ((p =3D strsep(&amp;cp, &quot;,&quot;)); p =
&amp;&amp; *p !=3D &#39;\0&#39;; (p =3D strsep(&amp;cp, &quot;,&quot;))) {<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((m =3D match_list(re=
t, p, NULL)) !=3D NULL) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 free(m);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (has_any_alg(ret, p))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue; /* Algorithm already present */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strlcat(ret, &q=
uot;,&quot;, len) &gt;=3D len ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strlc=
at(ret, p, len) &gt;=3D len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0free(tmp);<br>
+@@ -410,7 +420,12 @@ kex_protocol_error(int type, u_int32_t seq, struct ss=
h *ssh)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 error(&quot;kex protocol error: type %d seq %u&quot;=
, type, seq);<br>
++=C2=A0 =C2=A0 =C2=A0 /* If in strict mode, any unexpected message is an e=
rror */<br>
++=C2=A0 =C2=A0 =C2=A0 if ((ssh-&gt;kex-&gt;flags &amp; KEX_INITIAL) &amp;&=
amp; ssh-&gt;kex-&gt;kex_strict) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_packet_disconnect(ss=
h, &quot;strict KEX violation: &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unex=
pected packet type %u (seqnr %u)&quot;, type, seq);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 error_f(&quot;type %u seq %u&quot;, type, seq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((r =3D sshpkt_start(ssh, SSH2_MSG_UNIMPLEME=
NTED)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshpkt_put_u32(ssh, seq)) =
!=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshpkt_send(ssh)) !=3D 0)<=
br>
+@@ -496,7 +511,7 @@ kex_input_ext_info(int type, u_int32_t seq, struct ssh=
 *ssh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Ensure no \0 lurking in value */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (memchr(val, &#39;\0&#39;, vlen) !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_f(&quot;nul byte in %s&quot;, n=
ame);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return SSH_ERR_INVALID_FORMAT;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dispatch_protocol_error(type, seq, s=
sh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0debug_f(&quot;%s=3D&lt;%s&gt;&quot;, name, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kex-&gt;server_sig_algs =3D val;<br>
+@@ -600,7 +615,7 @@ kex_input_kexinit(int type, u_int32_t seq, struct ssh =
*ssh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_f(&quot;no ke=
x&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return SSH_ERR_INTE=
RNAL_ERROR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, &amp;kex_pro=
tocol_error);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D sshpkt_ptr(ssh, &amp;dlen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((r =3D sshbuf_put(kex-&gt;peer, ptr, dlen))=
 !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
+@@ -636,7 +651,7 @@ kex_input_kexinit(int type, u_int32_t seq, struct ssh =
*ssh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(kex-&gt;flags &amp; KEX_INIT_SENT))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((r =3D kex_send=
_kexinit(ssh)) !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return r;<br>
+-=C2=A0 =C2=A0 =C2=A0 if ((r =3D kex_choose_conf(ssh)) !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 if ((r =3D kex_choose_conf(ssh, seq)) !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kex-&gt;kex_type &lt; KEX_MAX &amp;&amp; ke=
x-&gt;kex[kex-&gt;kex_type] !=3D NULL)<br>
+@@ -900,20 +915,14 @@ proposals_match(char *my[PROPOSAL_MAX], char *peer[P=
ROPOSAL_MAX])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return (1);<br>
+ }<br>
+<br>
+-/* returns non-zero if proposal contains any algorithm from algs */<br>
+ static int<br>
+-has_any_alg(const char *proposal, const char *algs)<br>
++kexalgs_contains(char **peer, const char *ext)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 char *cp;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if ((cp =3D match_list(proposal, algs, NULL)) =3D=3D=
 NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 free(cp);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 1;<br>
++=C2=A0 =C2=A0 =C2=A0 return has_any_alg(peer[PROPOSAL_KEX_ALGS], ext);<br=
>
+ }<br>
+<br>
+ static int<br>
+-kex_choose_conf(struct ssh *ssh)<br>
++kex_choose_conf(struct ssh *ssh, uint32_t seq)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct kex *kex =3D ssh-&gt;kex;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct newkeys *newkeys;<br>
+@@ -938,13 +947,23 @@ kex_choose_conf(struct ssh *ssh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprop=3Dpeer;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Check whether client supports ext_info_c */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (kex-&gt;server &amp;&amp; (kex-&gt;flags &amp; K=
EX_INITIAL)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *ext;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ext =3D match_list(&quot=
;ext-info-c&quot;, peer[PROPOSAL_KEX_ALGS], NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kex-&gt;ext_info_c =3D (=
ext !=3D NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(ext);<br>
++=C2=A0 =C2=A0 =C2=A0 /* Check whether peer supports ext_info/kex_strict *=
/<br>
++=C2=A0 =C2=A0 =C2=A0 if ((kex-&gt;flags &amp; KEX_INITIAL) !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kex-&gt;server) {<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kex-&gt;ext_info_c =3D kexalgs_contains(peer, &quot;ext-info-c&quot;);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kex-&gt;kex_strict =3D kexalgs_contains(peer,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;<a href=3D"mailto:kex-strict-c-v00@openssh.com" tar=
get=3D"_blank">kex-strict-c-v00@openssh.com</a>&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kex-&gt;kex_strict =3D kexalgs_contains(peer,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;<a href=3D"mailto:kex-strict-s-v00@openssh.com" tar=
get=3D"_blank">kex-strict-s-v00@openssh.com</a>&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kex-&gt;kex_strict) =
{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 debug3_f(&quot;will use strict KEX ordering&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (seq !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_packet_disconnect(ssh,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;strict KEX violation: &=
quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;KEXINIT was not the fir=
st packet&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check whether client supports rsa-sha2 algor=
ithms */<br>
+diff --git a/kex.h b/kex.h<br>
+index c353295..c27f9d8 100644<br>
+--- a/kex.h<br>
++++ b/kex.h<br>
+@@ -1,4 +1,4 @@<br>
+-/* $OpenBSD: kex.h,v 1.117 2022/01/06 21:55:23 djm Exp $ */<br>
++/* $OpenBSD: kex.h,v 1.120 2023/12/18 14:45:17 djm Exp $ */<br>
+<br>
+ /*<br>
+=C2=A0 * Copyright (c) 2000, 2001 Markus Friedl.=C2=A0 All rights reserved=
.<br>
+@@ -148,6 +148,7 @@ struct kex {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u_int=C2=A0 =C2=A0kex_type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 *server_sig_algs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0ext_info_c;<br>
++=C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0kex_strict;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sshbuf *my;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sshbuf *peer;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sshbuf *client_version;<br>
+diff --git a/packet.c b/packet.c<br>
+index bde6c10..322a8c2 100644<br>
+--- a/packet.c<br>
++++ b/packet.c<br>
+@@ -1,4 +1,4 @@<br>
+-/* $OpenBSD: packet.c,v 1.307 2022/01/22 00:49:34 djm Exp $ */<br>
++/* $OpenBSD: packet.c,v 1.313 2023/12/18 14:45:17 djm Exp $ */<br>
+ /*<br>
+=C2=A0 * Author: Tatu Ylonen &lt;<a href=3D"mailto:ylo@cs.hut.fi" target=
=3D"_blank">ylo@cs.hut.fi</a>&gt;<br>
+=C2=A0 * Copyright (c) 1995 Tatu Ylonen &lt;<a href=3D"mailto:ylo@cs.hut.f=
i" target=3D"_blank">ylo@cs.hut.fi</a>&gt;, Espoo, Finland<br>
+@@ -1205,8 +1205,13 @@ ssh_packet_send2_wrapped(struct ssh *ssh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sshbuf_dump(state-&gt;output, stderr);<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* increment sequence number for outgoing packe=
ts */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (++state-&gt;p_send.seqnr =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 if (++state-&gt;p_send.seqnr =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ssh-&gt;kex-&gt;fla=
gs &amp; KEX_INITIAL) !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ssh_packet_disconnect(ssh, &quot;outgoing sequence number &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;wrapped during initial key exchange&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logit(&quot;outgoin=
g seqnr wraps around&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (++state-&gt;p_send.packets =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(ssh-&gt;compa=
t &amp; SSH_BUG_NOREKEY))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return SSH_ERR_NEED_REKEY;<br>
+@@ -1214,6 +1219,11 @@ ssh_packet_send2_wrapped(struct ssh *ssh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;p_send.bytes +=3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sshbuf_reset(state-&gt;outgoing_packet);<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 if (type =3D=3D SSH2_MSG_NEWKEYS &amp;&amp; ssh-&gt;=
kex-&gt;kex_strict) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug_f(&quot;resetting =
send seqnr %u&quot;, state-&gt;p_send.seqnr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;p_send.seqnr =
=3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D SSH2_MSG_NEWKEYS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D ssh_set_newke=
ys(ssh, MODE_OUT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (type =3D=3D SSH2_MSG_USERAUTH_SUCCESS =
&amp;&amp; state-&gt;server_side)<br>
+@@ -1342,8 +1352,7 @@ ssh_packet_read_seqnr(struct ssh *ssh, u_char *typep=
, u_int32_t *seqnr_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Stay in the loop until we have received a co=
mplete packet. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (;;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to read a pa=
cket from the buffer. */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D ssh_packet_read_po=
ll_seqnr(ssh, typep, seqnr_p);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((r =3D ssh_packet_re=
ad_poll_seqnr(ssh, typep, seqnr_p)) !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we got a pack=
et, return it. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*typep !=3D SSH=
_MSG_NONE)<br>
+@@ -1414,29 +1423,6 @@ ssh_packet_read(struct ssh *ssh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return type;<br>
+ }<br>
+<br>
+-/*<br>
+- * Waits until a packet has been received, verifies that its type matches=
<br>
+- * that given, and gives a fatal error and exits if there is a mismatch.<=
br>
+- */<br>
+-<br>
+-int<br>
+-ssh_packet_read_expect(struct ssh *ssh, u_int expected_type)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 int r;<br>
+-=C2=A0 =C2=A0 =C2=A0 u_char type;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if ((r =3D ssh_packet_read_seqnr(ssh, &amp;type, NUL=
L)) !=3D 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (type !=3D expected_type) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((r =3D sshpkt_discon=
nect(ssh,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Prot=
ocol error: expected packet type %d, got %d&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_t=
ype, type)) !=3D 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return r;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return SSH_ERR_PROTOCOL_=
ERROR;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-}<br>
+-<br>
+ static int<br>
+ ssh_packet_read_poll2_mux(struct ssh *ssh, u_char *typep, u_int32_t *seqn=
r_p)<br>
+ {<br>
+@@ -1627,10 +1613,16 @@ ssh_packet_read_poll2(struct ssh *ssh, u_char *typ=
ep, u_int32_t *seqnr_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((r =3D sshbuf_c=
onsume(state-&gt;input, mac-&gt;mac_len)) !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seqnr_p !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*seqnr_p =3D state-=
&gt;p_read.seqnr;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (++state-&gt;p_read.seqnr =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 if (++state-&gt;p_read.seqnr =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ssh-&gt;kex-&gt;fla=
gs &amp; KEX_INITIAL) !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ssh_packet_disconnect(ssh, &quot;incoming sequence number &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;wrapped during initial key exchange&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logit(&quot;incomin=
g seqnr wraps around&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (++state-&gt;p_read.packets =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(ssh-&gt;compa=
t &amp; SSH_BUG_NOREKEY))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return SSH_ERR_NEED_REKEY;<br>
+@@ -1696,6 +1688,10 @@ ssh_packet_read_poll2(struct ssh *ssh, u_char *type=
p, u_int32_t *seqnr_p)<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* reset for next packet */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;packlen =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 if (*typep =3D=3D SSH2_MSG_NEWKEYS &amp;&amp; ssh-&g=
t;kex-&gt;kex_strict) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug_f(&quot;resetting =
read seqnr %u&quot;, state-&gt;p_read.seqnr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;p_read.seqnr =
=3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((r =3D ssh_packet_check_rekey(ssh)) !=3D 0)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
+@@ -1716,10 +1712,39 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char=
 *typep, u_int32_t *seqnr_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D ssh_packet_re=
ad_poll2(ssh, typep, seqnr_p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return r;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*typep) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 state-&gt;keep_alive_timeouts =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DBG(debug(&quot;received packet type %d&quot;, *typep));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*typep =3D=3D 0) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* no message ready */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;keep_alive_tim=
eouts =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBG(debug(&quot;received=
 packet type %d&quot;, *typep));<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Always process discon=
nect messages */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*typep =3D=3D SSH2_M=
SG_DISCONNECT) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((r =3D sshpkt_get_u32(ssh, &amp;reason)) !=3D 0 ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (r =3D sshpkt_get_string(ssh, &amp;msg, NULL)) !=3D 0)<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Ignore normal client exit notifications */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 do_log2(ssh-&gt;state-&gt;server_side &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 reason =3D=3D SSH2_DISCONNECT_BY_APPLICATION ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 SYSLOG_LEVEL_INFO : SYSLOG_LEVEL_ERROR,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Received disconnect from %s port %d:&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%u: %.400s&quot;, ssh_remote_ipaddr(ssh),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ssh_remote_port(ssh), reason, msg);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 free(msg);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return SSH_ERR_DISCONNECTED;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Do not implicitl=
y handle any messages here during initial<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* KEX when in stri=
ct mode. They will be need to be allowed<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* explicitly by th=
e KEX dispatch table or they will generate<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* protocol errors.=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ssh-&gt;kex !=3D NUL=
L &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ssh-&gt;k=
ex-&gt;flags &amp; KEX_INITIAL) &amp;&amp; ssh-&gt;kex-&gt;kex_strict)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Implicitly handle tra=
nsport-level messages */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (*typep) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SSH2_MSG_IGNOR=
E:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0debug3(&quot;Received SSH2_MSG_IGNORE&quot;);<br>
+@@ -1734,19 +1759,6 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char =
*typep, u_int32_t *seqnr_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0debug(&quot;Remote: %.900s&quot;, msg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0free(msg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SSH2_MSG_DISCONNECT=
:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((r =3D sshpkt_get_u32(ssh, &amp;reason)) !=3D 0 ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (r =3D sshpkt_get_string(ssh, &amp;msg, NULL)) !=3D 0)<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Ignore normal client exit notifications */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 do_log2(ssh-&gt;state-&gt;server_side &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 reason =3D=3D SSH2_DISCONNECT_BY_APPLICATION ?<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 SYSLOG_LEVEL_INFO : SYSLOG_LEVEL_ERROR,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Received disconnect from %s port %d:&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%u: %.400s&quot;, ssh_remote_ipaddr(ssh),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ssh_remote_port(ssh), reason, msg);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 free(msg);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return SSH_ERR_DISCONNECTED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SSH2_MSG_UNIMP=
LEMENTED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ((r =3D sshpkt_get_u32(ssh, &amp;seqnr)) !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
+@@ -2211,6 +2223,7 @@ kex_to_blob(struct sshbuf *m, struct kex *kex)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_put_u32(m, kex-&gt;=
hostkey_type)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_put_u32(m, kex-&gt;=
hostkey_nid)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_put_u32(m, kex-&gt;=
kex_type)) !=3D 0 ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (r =3D sshbuf_put_u32(m, kex-&gt;kex_s=
trict)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_put_stringb(m, kex-=
&gt;my)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_put_stringb(m, kex-=
&gt;peer)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_put_stringb(m, kex-=
&gt;client_version)) !=3D 0 ||<br>
+@@ -2373,6 +2386,7 @@ kex_from_blob(struct sshbuf *m, struct kex **kexp)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_get_u32(m, (u_int *=
)&amp;kex-&gt;hostkey_type)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_get_u32(m, (u_int *=
)&amp;kex-&gt;hostkey_nid)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_get_u32(m, &amp;kex=
-&gt;kex_type)) !=3D 0 ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (r =3D sshbuf_get_u32(m, &amp;kex-&gt;=
kex_strict)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_get_stringb(m, kex-=
&gt;my)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_get_stringb(m, kex-=
&gt;peer)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshbuf_get_stringb(m, kex-=
&gt;client_version)) !=3D 0 ||<br>
+@@ -2701,6 +2715,7 @@ sshpkt_disconnect(struct ssh *ssh, const char *fmt,.=
..)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vsnprintf(buf, sizeof(buf), fmt, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(args);<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 debug2_f(&quot;sending SSH2_MSG_DISCONNECT: %s&quot;=
, buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((r =3D sshpkt_start(ssh, SSH2_MSG_DISCONNEC=
T)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshpkt_put_u32(ssh, SSH2_D=
ISCONNECT_PROTOCOL_ERROR)) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r =3D sshpkt_put_cstring(ssh, bu=
f)) !=3D 0 ||<br>
+diff --git a/packet.h b/packet.h<br>
+index 176488b..3e03f53 100644<br>
+--- a/packet.h<br>
++++ b/packet.h<br>
+@@ -1,4 +1,4 @@<br>
+-/* $OpenBSD: packet.h,v 1.94 2022/01/22 00:49:34 djm Exp $ */<br>
++/* $OpenBSD: packet.h,v 1.96 2023/12/18 14:45:17 djm Exp $ */<br>
+<br>
+ /*<br>
+=C2=A0 * Author: Tatu Ylonen &lt;<a href=3D"mailto:ylo@cs.hut.fi" target=
=3D"_blank">ylo@cs.hut.fi</a>&gt;<br>
+@@ -124,7 +124,6 @@ int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_packet_send2_=
wrapped(struct ssh *);<br>
+ int=C2=A0 =C2=A0 ssh_packet_send2(struct ssh *);<br>
+<br>
+ int=C2=A0 =C2=A0 =C2=A0 ssh_packet_read(struct ssh *);<br>
+-int=C2=A0 =C2=A0 ssh_packet_read_expect(struct ssh *, u_int type);<br>
+ int=C2=A0 =C2=A0 =C2=A0 ssh_packet_read_poll(struct ssh *);<br>
+ int ssh_packet_read_poll2(struct ssh *, u_char *, u_int32_t *seqnr_p);<br=
>
+ int=C2=A0 =C2=A0 ssh_packet_process_incoming(struct ssh *, const char *bu=
f, u_int len);<br>
+diff --git a/sshconnect2.c b/sshconnect2.c<br>
+index b25225e..1deaa5e 100644<br>
+--- a/sshconnect2.c<br>
++++ b/sshconnect2.c<br>
+@@ -1,4 +1,4 @@<br>
+-/* $OpenBSD: sshconnect2.c,v 1.356 2022/02/01 23:32:51 djm Exp $ */<br>
++/* $OpenBSD: sshconnect2.c,v 1.370 2023/12/18 14:45:17 djm Exp $ */<br>
+ /*<br>
+=C2=A0 * Copyright (c) 2000 Markus Friedl.=C2=A0 All rights reserved.<br>
+=C2=A0 * Copyright (c) 2008 Damien Miller.=C2=A0 All rights reserved.<br>
+@@ -363,7 +363,6 @@ struct cauthmethod {<br>
+ };<br>
+<br>
+ static int input_userauth_service_accept(int, u_int32_t, struct ssh *);<b=
r>
+-static int input_userauth_ext_info(int, u_int32_t, struct ssh *);<br>
+ static int input_userauth_success(int, u_int32_t, struct ssh *);<br>
+ static int input_userauth_failure(int, u_int32_t, struct ssh *);<br>
+ static int input_userauth_banner(int, u_int32_t, struct ssh *);<br>
+@@ -477,7 +476,7 @@ ssh_userauth2(struct ssh *ssh, const char *local_user,=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ssh-&gt;authctxt =3D &amp;authctxt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_dispatch_init(ssh, &amp;input_userauth_erro=
r);<br>
+-=C2=A0 =C2=A0 =C2=A0 ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, &amp;input_=
userauth_ext_info);<br>
++=C2=A0 =C2=A0 =C2=A0 ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, kex_input_e=
xt_info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_dispatch_set(ssh, SSH2_MSG_SERVICE_ACCEPT, =
&amp;input_userauth_service_accept);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_dispatch_run_fatal(ssh, DISPATCH_BLOCK, &am=
p;authctxt.success); /* loop until success */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pubkey_cleanup(ssh);<br>
+@@ -530,12 +529,6 @@ input_userauth_service_accept(int type, u_int32_t seq=
, struct ssh *ssh)<br>
+ }<br>
+<br>
+ /* ARGSUSED */<br>
+-static int<br>
+-input_userauth_ext_info(int type, u_int32_t seqnr, struct ssh *ssh)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 return kex_input_ext_info(type, seqnr, ssh);<br>
+-}<br>
+-<br>
+ void<br>
+ userauth(struct ssh *ssh, char *authlist)<br>
+ {<br>
+@@ -617,6 +610,7 @@ input_userauth_success(int type, u_int32_t seq, struct=
 ssh *ssh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(authctxt-&gt;methoddata);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0authctxt-&gt;methoddata =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0authctxt-&gt;success =3D 1;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* break out */<br>
++=C2=A0 =C2=A0 =C2=A0 ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, dispatch_pr=
otocol_error);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+--<br>
+2.40.0<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_8.=
9p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_8.9p1.bb</a> b/meta/re=
cipes-connectivity/openssh/<a href=3D"http://openssh_8.9p1.bb" rel=3D"noref=
errer" target=3D"_blank">openssh_8.9p1.bb</a><br>
index 3f3cd2a908..91f04bf08b 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_8.9p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_8.9p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_8.9p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_8.9p1.bb</a><br>
@@ -33,6 +33,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.org/pub/O=
penBSD/OpenSSH/portable/openssh-$%7BPV%7D.tar" rel=3D"noreferrer" target=3D=
"_blank">http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.=
tar</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-38408-0002.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-38408-0003.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-38408-0004.patch =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-48795.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;fd497654b7ab1686dac672fb83dfb4ba4096e8b5=
ffcdaccd262380ae58bec5e7&quot;<br>
<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193892): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193892" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193892</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103781431/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103781431/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cee9c5060f1facfa--

