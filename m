Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC119C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 15:10:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94432.1782745849019821414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 08:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YYDppBrs;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493a440bc10so11603235e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782745847; x=1783350647; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmroZK0pvM8Ddd3ubefRx69+WipMTKpZOHJqOvynFuk=;
        b=YYDppBrsGkcN5OnRkP4OQk3AtseTN2fHDVko6OZXrrLVwgb9Ws0YWSxqOfVaWXBDNG
         R/UJVjnAKpaxBOVQ08ODH/ifRRRlwl85fgAGa9ettAT0izkyc6f+Xzk/lv8gqr/LW1hZ
         xXGq6Vh3ftE6G9/KqyiXcTGDexplkHhakj+TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745847; x=1783350647;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TmroZK0pvM8Ddd3ubefRx69+WipMTKpZOHJqOvynFuk=;
        b=qtLEgg8InT7p+7oRVVonTZCqJse6WpkXu5iNsOgHJCFuFHt44tp3D9fMYMdZKmXXKC
         mr7nTF3i9kCkra2e73kVjk+nBYEojKtChzdewzGOJludlvqlkiNNltHChVnEja6mVIRK
         FcdeVCqkP1XzdzNMrWD6fkzf330cED5I9u0nn7GF0V+ji2D16VswvJ0/iiSANEsYMDjB
         Ko2i1PqLyRUT933GdbneACaZZtuVONOqM4gCPVPZbkzVqALGDn75iM6JFIzN2CaiWDTw
         HG9T2gJloNpFLr1aBDywRJZnG6nFVofpD4plXOjIKqizboq5yyJH4ghDBnqvm0Kk5Ydx
         d7Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8IYw6yTra5FuYAQR2/Ss0KZnNtGjbFNaouc3xdr0Nbb3bXXS71eJXMDKgI/AL3efp3CFPlVMscm7lqCMsX9fbcXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyHyBITVl2NjwXlcYDtTr/FlRT6MKZm3tNGm+/X4Lr2K99O2sB
	CUrHFpyGt8gC9slfs3IjzKDgGjFLAd6+94RC2RCetIc4lhZ/oWu5h6TjYsMnwxQgyzM=
X-Gm-Gg: AfdE7clGbISbQdnGKHROJGZ91revPHnH+ISctwzUhOyvm5iFqiUT4kcNmTBdmV9Jz13
	8QpxiUhVwxqs7yACBPsHo7aM2QJu3yA7MkDaQ/Ba5u2ULSMOrifrdxWGoPMZ5Bcira0stNpEdd1
	VAosEjKtwyloMQ4C253VKwB7cAMHu4IgWbpsBGTVlPcYnKR0OIOLzIx6qwcftfgrpbX+cJ2/8EN
	weTYvnbPv5tnDeWFl2sTDMwOyEY8lRNaAMsZ80cq8rUvdh9wQMTqOkgjZfY5+UTF7e06RW6Ft7K
	z3x6juY+P+KCTtCCokNzyWfDW8UVQ4pnKbjWhS2E+1yrtR2cWpmw38XjI+zolZPPlIV9UU9cPZY
	idYv4qrGyJGVVP0F+cKxKljS7jvx+oB6jXz5V8neTMEGzZFQocs+QivJogkoNvRZF1WhJ/2CGLf
	TJkIP/2Aio2VvG9gM1novCmt5ZoXCurbG+WQ45QkvULiub+iTRC+X18W5cl0MMSf/egJgn/DkV
X-Received: by 2002:a05:600c:8b13:b0:492:409d:b7c3 with SMTP id 5b1f17b1804b1-493b8287f6cmr1556135e9.13.1782745846821;
        Mon, 29 Jun 2026 08:10:46 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a55be64esm172044165e9.7.2026.06.29.08.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:10:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 17:10:45 +0200
Message-Id: <DJLMNRBQBIWO.19UNDUO3AML50@smile.fr>
Subject: Re: [PATCH] gnutls: fix CVE-2026-33846 --> wrynose branch.
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Yi.Zhao@windriver.com>, <Shiva.Komati@windriver.com>,
 <Qi.Chen@windriver.com>, <Libo.Chen.CN@windriver.com>,
 <Jinfeng.Wang.CN@windriver.com>, <Shailesh.Masih@windriver.com>,
 <Tomas.Holmberg@windriver.com>, <Haixiao.Yan.CN@windriver.com>
To: "Randy MacLeod" <randy.macleod@windriver.com>, "Pritam Srichandan Sahoo"
 <PritamSrichandan.Sahoo@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629050225.2061089-1-PritamSrichandan.Sahoo@windriver.com>
 <1094aa0d-cc45-4dd5-92d6-7ee034ea858e@windriver.com>
In-Reply-To: <1094aa0d-cc45-4dd5-92d6-7ee034ea858e@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 15:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239809

On Mon Jun 29, 2026 at 3:52 PM CEST, Randy MacLeod wrote:
> Yoann,
>
> This is for wrynose.

I've took it in my branch to review.

Thanks Randy!

>
> Pritam, next time use the --subject-prefix option as shown:
>
> https://git.openembedded.org/openembedded-core/tree/README.OE-Core.md?h=
=3Dwrynose#n29

>
> Thanks,
>
> ../Randy
>
> On 2026-06-29 01:02, Pritam Srichandan Sahoo wrote:
>> Backport upstream fixes for DTLS handshake fragment reassembly
>> vulnerability (CVE-2026-33846).
>>
>> Includes:
>> - 4f94e5cfe1f2: add basic DTLS fragment reassembly test
>> - 9deffca528c2: shorten merge_handshake_packet using recv_buf
>> - 65ab33fa54e3: add validation checks for DTLS fragment length and bound=
s
>> - cf3f1955e58c: add reproducer for DTLS fragment reassembly bug (#1816)
>> - bb427ff74dba: add fragmented ClientHello test coverage
>> - 092c65d004e2: match DTLS datagrams by handshake sequence number
>> - a2b41be83a1a: add test for mismatched message_seq handling (#1839)
>>
>> These commits are included in gnutls 3.8.13 and are backported by
>> both Debian (gnutls28_3.8.9-3+deb13u4) and CentOS 10-stream
>> (gnutls-3.8.10-4.el10) using identical commit selection.
>>
>> Signed-off-by: Pritam Srichandan Sahoo<PritamSrichandan.Sahoo@windriver.=
com>"
>> ---
>>   .../gnutls/gnutls/CVE-2026-33846.patch        | 862 ++++++++++++++++++
>>   meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
>>   2 files changed, 863 insertions(+)
>>   create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.p=
atch
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/m=
eta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
>> new file mode 100644
>> index 0000000000..5c85a531b3
>> --- /dev/null
>> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
>> @@ -0,0 +1,862 @@
>> +From 4f94e5cfe1f252a431e41642b0752e7e0daf43b9 Mon Sep 17 00:00:00 2001
>> +From: Alexander Sosedkin<asosedkin@redhat.com>
>> +Date: Fri, 20 Mar 2026 16:09:40 +0100
>> +Subject: [PATCH 1/7] tests/mini-dtls-fragments: implement a basic DTLS =
test
>> +
>> +Upstream-Status: Backport
>> +[1]https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0=
752e7e0daf43b9
>> +[2]https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd=
4bb1bf4cbd1fc0
>> +[3]https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b=
7df3d383d1ff78
>> +[4]https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb=
101fb058565d87
>> +[5]https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8=
511e873f762743
>> +[6]https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84=
d801ac49a09f78
>> +[7]https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf549=
58da91a656550e
>> +
>> +CVE: CVE-2026-33846
>> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
>> +Signed-off-by: Pritam Srichandan Sahoo<PritamSrichandan.Sahoo@windriver=
.com>
>> +---
>> + tests/Makefile.am           |   7 +-
>> + tests/mini-dtls-fragments.c | 208 ++++++++++++++++++++++++++++++++++++
>> + 2 files changed, 214 insertions(+), 1 deletion(-)
>> + create mode 100644 tests/mini-dtls-fragments.c
>> +
>> +diff --git a/tests/Makefile.am b/tests/Makefile.am
>> +index aeeaaf79d..586f1952d 100644
>> +--- a/tests/Makefile.am
>> ++++ b/tests/Makefile.am
>> +@@ -241,7 +241,8 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast s=
et_pkcs12_cred cert certuniquei
>> + 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \
>> + 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-=
free \
>> + 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \
>> +-	 psk-importer privkey-derive dh-compute2 ecdh-compute2
>> ++	 psk-importer privkey-derive dh-compute2 ecdh-compute2 \
>> ++	 mini-dtls-fragments
>> +
>> + ctests +=3D tls-channel-binding
>> +
>> +@@ -513,6 +514,10 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \
>> + 	-I$(top_srcdir)/gl	\
>> + 	-I$(top_builddir)/gl
>> +
>> ++mini_dtls_fragments_CPPFLAGS =3D $(AM_CPPFLAGS) \
>> ++	-I$(top_srcdir)/gl	\
>> ++	-I$(top_builddir)/gl
>> ++
>> + if ENABLE_PKCS11
>> + if !WINDOWS
>> + ctests +=3D tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs1=
1-no-key \
>> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
>> +new file mode 100644
>> +index 000000000..ee75feeb6
>> +--- /dev/null
>> ++++ b/tests/mini-dtls-fragments.c
>> +@@ -0,0 +1,208 @@
>> ++/*
>> ++ * Copyright (C) 2026 Red Hat, Inc.
>> ++ *
>> ++ * Author: Alexander Sosedkin
>> ++ *
>> ++ * This file is part of GnuTLS.
>> ++ *
>> ++ * GnuTLS is free software; you can redistribute it and/or modify it
>> ++ * under the terms of the GNU General Public License as published by
>> ++ * the Free Software Foundation; either version 3 of the License, or
>> ++ * (at your option) any later version.
>> ++ *
>> ++ * GnuTLS is distributed in the hope that it will be useful, but
>> ++ * WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> ++ * General Public License for more details.
>> ++ *
>> ++ * You should have received a copy of the GNU Lesser General Public Li=
cense
>> ++ * along with this program.  If not, see<https://www.gnu.org/licenses/=
>
>> ++ */
>> ++
>> ++#ifdef HAVE_CONFIG_H
>> ++#include "config.h"
>> ++#endif
>> ++
>> ++#include <stdio.h>
>> ++#include <stdlib.h>
>> ++
>> ++#if defined(_WIN32)
>> ++
>> ++int main(void)
>> ++{
>> ++	exit(77);
>> ++}
>> ++
>> ++#else
>> ++
>> ++#include <assert.h>
>> ++#include <errno.h>
>> ++#include <stdbool.h>
>> ++#include <stdint.h>
>> ++#include <string.h>
>> ++#include <gnutls/gnutls.h>
>> ++#include <gnutls/dtls.h>
>> ++#include "cert-common.h"
>> ++#include "utils.h"
>> ++
>> ++#include "attribute.h"
>> ++
>> ++static void server_log_func(int level, const char *str)
>> ++{
>> ++	fprintf(stderr, "server|<%d>| %s", level, str);
>> ++}
>> ++
>> ++static void client_log_func(int level, const char *str)
>> ++{
>> ++	fprintf(stderr, "client|<%d>| %s", level, str);
>> ++}
>> ++
>> ++#define QUEUE_SIZE 1024
>> ++#define PACKET_SIZE 2048
>> ++
>> ++typedef struct {
>> ++	uint8_t buf[PACKET_SIZE];
>> ++	size_t len;
>> ++} packet_t;
>> ++typedef struct {
>> ++	packet_t packets[QUEUE_SIZE];
>> ++	size_t head;
>> ++	size_t tail;
>> ++} queue_t;
>> ++
>> ++static queue_t c2s, s2c;
>> ++
>> ++static int queue_put(queue_t *q, const void *buf, size_t len)
>> ++{
>> ++	assert(len <=3D PACKET_SIZE);
>> ++	memcpy(q->packets[q->tail].buf, buf, len);
>> ++	q->packets[q->tail].len =3D len;
>> ++	q->tail++;
>> ++	q->tail %=3D QUEUE_SIZE;
>> ++	assert(q->tail !=3D q->head);
>> ++	return len;
>> ++}
>> ++
>> ++static ssize_t queue_get(queue_t *q, gnutls_session_t s, void *buf, si=
ze_t len)
>> ++{
>> ++	if (q->head =3D=3D q->tail) {
>> ++		gnutls_transport_set_errno(s, EAGAIN);
>> ++		return -1;
>> ++	}
>> ++	size_t n =3D q->packets[q->head].len;
>> ++	memcpy(buf, q->packets[q->head].buf, n);
>> ++	q->head++;
>> ++	q->head %=3D QUEUE_SIZE;
>> ++	return n;
>> ++}
>> ++
>> ++static void queue_reset(queue_t *q)
>> ++{
>> ++	q->head =3D q->tail =3D 0;
>> ++}
>> ++
>> ++static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
>> ++{
>> ++	return 1;
>> ++}
>> ++
>> ++static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t =
l)
>> ++{
>> ++	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
>> ++}
>> ++
>> ++static ssize_t client_pull(gnutls_transport_ptr_t tr, void *b, size_t =
l)
>> ++{
>> ++	return queue_get(&s2c, (gnutls_session_t)tr, b, l);
>> ++}
>> ++
>> ++static ssize_t server_push(gnutls_transport_ptr_t tr, const void *b, s=
ize_t l)
>> ++{
>> ++	return queue_put(&s2c, b, l);
>> ++}
>> ++
>> ++static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const voi=
d *b,
>> ++				  size_t l)
>> ++{
>> ++	return queue_put(&c2s, b, l);
>> ++}
>> ++
>> ++static void test(gnutls_push_func client_push)
>> ++{
>> ++	gnutls_session_t client, server;
>> ++	gnutls_certificate_credentials_t ccred, scred;
>> ++	int cr =3D 0, sr =3D 0;
>> ++	bool cdone =3D false, sdone =3D false;
>> ++
>> ++	if (debug)
>> ++		gnutls_global_set_log_level(4711);
>> ++
>> ++	gnutls_certificate_allocate_credentials(&scred);
>> ++	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
>> ++					    GNUTLS_X509_FMT_PEM);
>> ++	gnutls_certificate_allocate_credentials(&ccred);
>> ++
>> ++	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
>> ++	gnutls_init(&client, GNUTLS_CLIENT | GNUTLS_DATAGRAM);
>> ++
>> ++	gnutls_priority_set_direct(server, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
>> ++				   NULL);
>> ++	gnutls_priority_set_direct(client, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
>> ++				   NULL);
>> ++
>> ++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
>> ++	gnutls_credentials_set(client, GNUTLS_CRD_CERTIFICATE, ccred);
>> ++
>> ++	gnutls_dtls_set_timeouts(client, get_dtls_retransmit_timeout(),
>> ++				 get_timeout());
>> ++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
>> ++				 get_timeout());
>> ++
>> ++	gnutls_transport_set_ptr(client, client);
>> ++	gnutls_transport_set_push_function(client, client_push);
>> ++	gnutls_transport_set_pull_function(client, client_pull);
>> ++	gnutls_transport_set_pull_timeout_function(client, pull_timeout);
>> ++
>> ++	gnutls_transport_set_ptr(server, server);
>> ++	gnutls_transport_set_push_function(server, server_push);
>> ++	gnutls_transport_set_pull_function(server, server_pull);
>> ++	gnutls_transport_set_pull_timeout_function(server, pull_timeout);
>> ++
>> ++	while (!cdone || !sdone) {
>> ++		gnutls_global_set_log_function(client_log_func);
>> ++		if (!cdone)
>> ++			cr =3D gnutls_handshake(client);
>> ++		if (!cr || gnutls_error_is_fatal(cr))
>> ++			cdone =3D true;
>> ++
>> ++		gnutls_global_set_log_function(server_log_func);
>> ++		if (!sdone)
>> ++			sr =3D gnutls_handshake(server);
>> ++		if (!sr || gnutls_error_is_fatal(sr))
>> ++			sdone =3D true;
>> ++	}
>> ++
>> ++	if (cr)
>> ++		fail("client: %s\n", gnutls_strerror(cr));
>> ++	if (sr)
>> ++		fail("server: %s\n", gnutls_strerror(sr));
>> ++
>> ++	success("OK\n");
>> ++
>> ++	queue_reset(&c2s);
>> ++	queue_reset(&s2c);
>> ++
>> ++	gnutls_deinit(client);
>> ++	gnutls_deinit(server);
>> ++	gnutls_certificate_free_credentials(ccred);
>> ++	gnutls_certificate_free_credentials(scred);
>> ++}
>> ++
>> ++void doit(void)
>> ++{
>> ++	global_init();
>> ++	test(client_push_normal);
>> ++	gnutls_global_deinit();
>> ++}
>> ++
>> ++#endif /* _WIN32 */
>> +--
>> +2.54.0
>> +
>> +
>> +From 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0 Mon Sep 17 00:00:00 2001
>> +From: Alexander Sosedkin<asosedkin@redhat.com>
>> +Date: Fri, 17 Apr 2026 17:49:31 +0200
>> +Subject: [PATCH 2/7] buffers: shorten merge_handshake_packet using recv=
_buf
>> +
>> +I had vague concerns about thread-safety of this,
>> +but then this pattern already exists within the file.
>> +
>> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
>> +---
>> + lib/buffers.c | 52 +++++++++++++++++----------------------------------
>> + 1 file changed, 17 insertions(+), 35 deletions(-)
>> +
>> +diff --git a/lib/buffers.c b/lib/buffers.c
>> +index 672380b05..d54c77022 100644
>> +--- a/lib/buffers.c
>> ++++ b/lib/buffers.c
>> +@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t=
 session,
>> + 	int exists =3D 0, i, pos =3D 0;
>> + 	int ret;
>> +
>> ++	handshake_buffer_st *recv_buf =3D
>> ++		session->internals.handshake_recv_buffer;
>> ++
>> + 	for (i =3D 0; i < session->internals.handshake_recv_buffer_size; i++)=
 {
>> +-		if (session->internals.handshake_recv_buffer[i].htype =3D=3D
>> +-		    hsk->htype) {
>> ++		if (recv_buf[i].htype =3D=3D hsk->htype) {
>> + 			exists =3D 1;
>> + 			pos =3D i;
>> + 			break;
>> +@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_sessio=
n_t session,
>> + 		_gnutls_write_uint24(0, &hsk->header[6]);
>> + 		_gnutls_write_uint24(hsk->length, &hsk->header[9]);
>> +
>> +-		_gnutls_handshake_buffer_move(
>> +-			&session->internals.handshake_recv_buffer[pos], hsk);
>> ++		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
>> +
>> + 	} else {
>> +-		if (hsk->start_offset <
>> +-			    session->internals.handshake_recv_buffer[pos]
>> +-				    .start_offset &&
>> +-		    hsk->end_offset + 1 >=3D
>> +-			    session->internals.handshake_recv_buffer[pos]
>> +-				    .start_offset) {
>> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
>> +-					.data.data[hsk->start_offset],
>> ++		if (hsk->start_offset < recv_buf[pos].start_offset &&
>> ++		    hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
>> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
>> + 			       hsk->data.data, hsk->data.length);
>> +-			session->internals.handshake_recv_buffer[pos]
>> +-				.start_offset =3D hsk->start_offset;
>> +-			session->internals.handshake_recv_buffer[pos]
>> +-				.end_offset =3D MIN(
>> +-				hsk->end_offset,
>> +-				session->internals.handshake_recv_buffer[pos]
>> +-					.end_offset);
>> +-		} else if (hsk->end_offset >
>> +-				   session->internals.handshake_recv_buffer[pos]
>> +-					   .end_offset &&
>> +-			   hsk->start_offset <=3D
>> +-				   session->internals.handshake_recv_buffer[pos]
>> +-						   .end_offset +
>> +-					   1) {
>> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
>> +-					.data.data[hsk->start_offset],
>> ++			recv_buf[pos].start_offset =3D hsk->start_offset;
>> ++			recv_buf[pos].end_offset =3D
>> ++				MIN(hsk->end_offset, recv_buf[pos].end_offset);
>> ++		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
>> ++			   hsk->start_offset <=3D recv_buf[pos].end_offset + 1) {
>> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
>> + 			       hsk->data.data, hsk->data.length);
>> +
>> +-			session->internals.handshake_recv_buffer[pos]
>> +-				.end_offset =3D hsk->end_offset;
>> +-			session->internals.handshake_recv_buffer[pos]
>> +-				.start_offset =3D MIN(
>> +-				hsk->start_offset,
>> +-				session->internals.handshake_recv_buffer[pos]
>> +-					.start_offset);
>> ++			recv_buf[pos].end_offset =3D hsk->end_offset;
>> ++			recv_buf[pos].start_offset =3D MIN(
>> ++				hsk->start_offset, recv_buf[pos].start_offset);
>> + 		}
>> + 		_gnutls_handshake_buffer_clear(hsk);
>> + 	}
>> +--
>> +2.54.0
>> +
>> +
>> +From 65ab33fa54e34fba69d793735b7df3d383d1ff78 Mon Sep 17 00:00:00 2001
>> +From: Alexander Sosedkin<asosedkin@redhat.com>
>> +Date: Fri, 17 Apr 2026 18:21:36 +0200
>> +Subject: [PATCH 3/7] buffers: add more checks to DTLS reassembly
>> +
>> +Previously, gnutls didn't check that DTLS fragments claimed
>> +a consistent message_length value.
>> +Additionally, a crucial array size check was missing,
>> +enabling an attacker to cause a heap overwrite.
>> +The updated version rejects fragments with mismatching length
>> +and adds a missing boundary check.
>> +
>> +Reported-by: Haruto Kimura (Stella)
>> +Reported-by: Oscar Reparaz
>> +Reported-by: Zou Dikai
>> +Fixes: #1816
>> +Fixes: #1838
>> +Fixes: #1839
>> +Fixes: CVE-2026-33846
>> +Fixes: GNUTLS-SA-2026-04-29-1
>> +CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
>> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
>> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
>> +---
>> + lib/buffers.c | 20 ++++++++++++++++++++
>> + 1 file changed, 20 insertions(+)
>> +
>> +diff --git a/lib/buffers.c b/lib/buffers.c
>> +index d54c77022..5d4d16276 100644
>> +--- a/lib/buffers.c
>> ++++ b/lib/buffers.c
>> +@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session=
_t session,
>> + 		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
>> +
>> + 	} else {
>> ++		if (hsk->length !=3D recv_buf[pos].length) {
>> ++			/* inconsistent across fragments */
>> ++			_gnutls_handshake_buffer_clear(hsk);
>> ++			return gnutls_assert_val(
>> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
>> ++		}
>> ++		/* start_offset + data.length <=3D hsk->length <=3D max_length */
>> ++		if (hsk->length < hsk->start_offset + hsk->data.length) {
>> ++			/* impossible claims, overflow requested */
>> ++			_gnutls_handshake_buffer_clear(hsk);
>> ++			return gnutls_assert_val(
>> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
>> ++		}
>> ++		if (hsk->length > recv_buf[pos].data.max_length) {
>> ++			/* we don't have this much allocated, overflow guard */
>> ++			_gnutls_handshake_buffer_clear(hsk);
>> ++			return gnutls_assert_val(
>> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
>> ++		}
>> ++
>> + 		if (hsk->start_offset < recv_buf[pos].start_offset &&
>> + 		    hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
>> + 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
>> +--
>> +2.54.0
>> +
>> +
>> +From cf3f1955e58cbcc10373b841bb101fb058565d87 Mon Sep 17 00:00:00 2001
>> +From: Alexander Sosedkin<asosedkin@redhat.com>
>> +Date: Wed, 1 Apr 2026 19:51:45 +0200
>> +Subject: [PATCH 4/7] tests/mini-dtls-fragments: extend with a #1816 rep=
roducer
>> +
>> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
>> +---
>> + tests/mini-dtls-fragments.c | 120 ++++++++++++++++++++++++++++++++++++
>> + 1 file changed, 120 insertions(+)
>> +
>> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
>> +index ee75feeb6..8d5a18acd 100644
>> +--- a/tests/mini-dtls-fragments.c
>> ++++ b/tests/mini-dtls-fragments.c
>> +@@ -106,6 +106,11 @@ static int pull_timeout(gnutls_transport_ptr_t tr,=
 unsigned ms)
>> + 	return 1;
>> + }
>> +
>> ++static int c2s_pull_timeout_once(gnutls_transport_ptr_t tr, unsigned m=
s)
>> ++{
>> ++	return c2s.head !=3D c2s.tail ? 1 : 0;
>> ++}
>> ++
>> + static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t =
l)
>> + {
>> + 	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
>> +@@ -198,10 +203,125 @@ static void test(gnutls_push_func client_push)
>> + 	gnutls_certificate_free_credentials(scred);
>> + }
>> +
>> ++static void test_malicious1816(void)
>> ++{
>> ++	/* dgram1: msg_len=3D50, frag_offset=3D25, frag_len=3D25 */
>> ++	static const uint8_t dgram1_hdr[] =3D {
>> ++		0x16, /* type: handshake */
>> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
>> ++		0x00, 0x00, /* epoch: 0 */
>> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* seq: 0 */
>> ++		0x00, 0x25, /* record_length: 37 */
>> ++		0x01, /* msg_type: ClientHello */
>> ++		0x00, 0x00, 0x32, /* msg_length: 50 */
>> ++		0x00, 0x00, /* msg_seq: 0 */
>> ++		0x00, 0x00, 0x19, /* frag_offset: 25 */
>> ++		0x00, 0x00, 0x19, /* frag_length: 25 */
>> ++	};
>> ++	/* dgram2: msg_len=3D3000, frag_offset=3D0, frag_len=3D48 */
>> ++	static const uint8_t dgram2_hdr[] =3D {
>> ++		0x16, /* type: handshake */
>> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
>> ++		0x00, 0x00, /* epoch: 0 */
>> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x01, /* seq: 1 */
>> ++		0x00, 0x3c, /* record_length: 60 */
>> ++		0x01, /* msg_type: ClientHello */
>> ++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
>> ++		0x00, 0x00, /* msg_seq: 0 */
>> ++		0x00, 0x00, 0x00, /* frag_offset: 0 */
>> ++		0x00, 0x00, 0x30, /* frag_length: 48 */
>> ++	};
>> ++	/* dgram3: msg_len=3D3000, frag_offset=3D40, frag_len=3D1475 */
>> ++	static const uint8_t dgram3_hdr[] =3D {
>> ++		0x16, /* type: handshake */
>> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
>> ++		0x00, 0x00, /* epoch: 0 */
>> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x02, /* seq: 2 */
>> ++		0x05, 0xcf, /* record_length: 1487 */
>> ++		0x01, /* msg_type: ClientHello */
>> ++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
>> ++		0x00, 0x00, /* msg_seq: 0 */
>> ++		0x00, 0x00, 0x28, /* frag_offset: 40 */
>> ++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
>> ++	};
>> ++	/* dgram4: msg_len=3D3000, frag_offset=3D1500, frag_len=3D1475 */
>> ++	static const uint8_t dgram4_hdr[] =3D {
>> ++		0x16, /* type: handshake */
>> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
>> ++		0x00, 0x00, /* epoch: 0 */
>> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x03, /* seq: 3 */
>> ++		0x05, 0xcf, /* record_length: 1487 */
>> ++		0x01, /* msg_type: ClientHello */
>> ++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
>> ++		0x00, 0x00, /* msg_seq: 0 */
>> ++		0x00, 0x05, 0xdc, /* frag_offset: 1500 */
>> ++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
>> ++	};
>> ++	gnutls_session_t server;
>> ++	gnutls_certificate_credentials_t scred;
>> ++	uint8_t dgram[1500];
>> ++	int sr;
>> ++
>> ++	if (debug)
>> ++		gnutls_global_set_log_level(4711);
>> ++
>> ++	gnutls_certificate_allocate_credentials(&scred);
>> ++	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
>> ++					    GNUTLS_X509_FMT_PEM);
>> ++
>> ++	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
>> ++	gnutls_priority_set_direct(server, "NORMAL:+VERS-DTLS1.2", NULL);
>> ++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
>> ++
>> ++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
>> ++				 get_timeout());
>> ++
>> ++	gnutls_transport_set_ptr(server, server);
>> ++	gnutls_transport_set_push_function(server, server_push);
>> ++	gnutls_transport_set_pull_function(server, server_pull);
>> ++	gnutls_transport_set_pull_timeout_function(server,
>> ++						   c2s_pull_timeout_once);
>> ++
>> ++	memset(dgram, 0, sizeof(dgram));
>> ++	memcpy(dgram, dgram1_hdr, 25);
>> ++	queue_put(&c2s, dgram, 25 + 25);
>> ++
>> ++	memset(dgram, 0, sizeof(dgram));
>> ++	memcpy(dgram, dgram2_hdr, 25);
>> ++	queue_put(&c2s, dgram, 25 + 48);
>> ++
>> ++	memset(dgram, 0, sizeof(dgram));
>> ++	memcpy(dgram, dgram3_hdr, 25);
>> ++	queue_put(&c2s, dgram, 25 + 1475);
>> ++
>> ++	memset(dgram, 0, sizeof(dgram));
>> ++	memcpy(dgram, dgram4_hdr, 25);
>> ++	queue_put(&c2s, dgram, 25 + 1475);
>> ++
>> ++	gnutls_global_set_log_function(server_log_func);
>> ++	do {
>> ++		sr =3D gnutls_handshake(server); /* invalid write if vulnerable */
>> ++	} while (c2s.head !=3D c2s.tail && !gnutls_error_is_fatal(sr));
>> ++	if (sr !=3D GNUTLS_E_UNEXPECTED_PACKET_LENGTH)
>> ++		fail("server: expected GNUTLS_E_UNEXPECTED_PACKET_LENGTH, "
>> ++		     "got: %s\n",
>> ++		     gnutls_strerror(sr));
>> ++
>> ++	success("OK\n");
>> ++
>> ++	queue_reset(&c2s);
>> ++	queue_reset(&s2c);
>> ++
>> ++	gnutls_deinit(server);
>> ++	gnutls_certificate_free_credentials(scred);
>> ++}
>> ++
>> + void doit(void)
>> + {
>> + 	global_init();
>> + 	test(client_push_normal);
>> ++	success("malicious reassembly bug exploitation (#1816):\n");
>> ++	test_malicious1816();
>> + 	gnutls_global_deinit();
>> + }
>> +
>> +--
>> +2.54.0
>> +
>> +
>> +From bb427ff74dba849d40753ed9c8511e873f762743 Mon Sep 17 00:00:00 2001
>> +From: Alexander Sosedkin<asosedkin@redhat.com>
>> +Date: Mon, 20 Apr 2026 16:08:11 +0200
>> +Subject: [PATCH 5/7] tests/mini-dtls-fragments: extend with fragmenting
>> + ClientHello
>> +
>> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
>> +---
>> + tests/mini-dtls-fragments.c | 107 ++++++++++++++++++++++++++++++++++++
>> + 1 file changed, 107 insertions(+)
>> +
>> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
>> +index 8d5a18acd..93490bac2 100644
>> +--- a/tests/mini-dtls-fragments.c
>> ++++ b/tests/mini-dtls-fragments.c
>> +@@ -132,6 +132,39 @@ static ssize_t client_push_normal(gnutls_transport=
_ptr_t tr, const void *b,
>> + 	return queue_put(&c2s, b, l);
>> + }
>> +
>> ++static void write_u16(uint8_t *p, uint16_t val)
>> ++{
>> ++	p[0] =3D val >> 8;
>> ++	p[1] =3D val & 0xff;
>> ++}
>> ++
>> ++static void write_u24(uint8_t *p, uint32_t val)
>> ++{
>> ++	p[0] =3D (val >> 16) & 0xff;
>> ++	p[1] =3D (val >> 8) & 0xff;
>> ++	p[2] =3D val & 0xff;
>> ++}
>> ++
>> ++static void write_u48(uint8_t *p, uint64_t seq)
>> ++{
>> ++	int i;
>> ++	for (i =3D 5; i >=3D 0; i--) {
>> ++		p[i] =3D seq & 0xff;
>> ++		seq >>=3D 8;
>> ++	}
>> ++}
>> ++
>> ++static uint64_t read_u48(const uint8_t *p)
>> ++{
>> ++	uint64_t seq =3D 0;
>> ++	int i;
>> ++	for (i =3D 5; i >=3D 0; i--) {
>> ++		seq <<=3D 8;
>> ++		seq |=3D p[i];
>> ++	}
>> ++	return seq;
>> ++}
>> ++
>> + static void test(gnutls_push_func client_push)
>> + {
>> + 	gnutls_session_t client, server;
>> +@@ -316,12 +349,86 @@ static void test_malicious1816(void)
>> + 	gnutls_certificate_free_credentials(scred);
>> + }
>> +
>> ++static ssize_t queue_put_renumbered(queue_t *q, const uint8_t *data, s=
ize_t l,
>> ++				    int delta_n)
>> ++{
>> ++	if (delta_n =3D=3D 0 || l < 13 || data[3] !=3D 0 || data[4] !=3D 0)
>> ++		return queue_put(&c2s, data, l);
>> ++
>> ++	uint8_t *p =3D malloc(l);
>> ++	assert(p);
>> ++	memcpy(p, data, l);
>> ++	write_u48(p + 5, read_u48(p + 5) + delta_n);
>> ++	ssize_t ret =3D queue_put(q, p, l);
>> ++	free(p);
>> ++	return ret;
>> ++}
>> ++
>> ++static void split_client_hello(const uint8_t *data, size_t len, uint8_=
t **frag1,
>> ++			       size_t *frag1_len, uint8_t **frag2,
>> ++			       size_t *frag2_len)
>> ++{
>> ++	size_t body_size =3D len - 25;
>> ++	*frag1_len =3D 13 + 12 + 1;
>> ++	*frag2_len =3D 13 + 12 + (body_size - 1);
>> ++
>> ++	*frag1 =3D malloc(13 + 12 + 1);
>> ++	assert(*frag1);
>> ++	*frag2 =3D malloc(13 + 12 + body_size - 1);
>> ++	assert(*frag2);
>> ++
>> ++	/* first fragment: record header + handshake header + first body byte=
 */
>> ++	memcpy(*frag1, data, 13); /* record header */
>> ++	write_u16(*frag1 + 11, 12 + 1); /* record length */
>> ++	memcpy(*frag1 + 13, data + 13, 12); /* handshake header */
>> ++	write_u24(*frag1 + 19, 0); /* fragment_offset =3D 0 */
>> ++	write_u24(*frag1 + 22, 1); /* fragment_length =3D 1 */
>> ++	(*frag1)[25] =3D data[25]; /* first body byte */
>> ++
>> ++	/* second fragment: record header + handshake header + remaining body=
 */
>> ++	memcpy(*frag2, data, 13); /* record header */
>> ++	write_u16(*frag2 + 11, *frag2_len - 13); /* record length */
>> ++	write_u48(*frag2 + 5, read_u48(*frag2 + 5) + 1); /* sequence number *=
/
>> ++	memcpy(*frag2 + 13, data + 13, 12); /* handshake header */
>> ++	write_u24(*frag2 + 19, 1); /* fragment_offset =3D 1 */
>> ++	write_u24(*frag2 + 22, body_size - 1); /* shortened fragment_length *=
/
>> ++	memcpy(*frag2 + 25, data + 26, body_size - 1); /* remaining body */
>> ++}
>> ++
>> ++static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, cons=
t void *b,
>> ++				       size_t l)
>> ++{
>> ++	static int seq_offset =3D 0; /* for renumbering follow-up epoch0 ones=
 */
>> ++
>> ++	const uint8_t *data =3D (const uint8_t *)b;
>> ++	uint8_t *frag1, *frag2;
>> ++	size_t frag1_len, frag2_len;
>> ++
>> ++	/* Pass through anything that isn't an epoch0 ClientHello with body *=
/
>> ++	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
>> ++	    data[0] !=3D 22 || /* not a handshake record */
>> ++	    data[3] !=3D 0 || data[4] !=3D 0 || /* not epoch 0 */
>> ++	    data[13] !=3D 1) /* not ClientHello */
>> ++		return queue_put_renumbered(&c2s, b, l, seq_offset);
>> ++
>> ++	/* epoch0 Client Hello: special treatment of splitting into fragments=
 */
>> ++	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
>> ++	queue_put(&c2s, frag1, frag1_len);
>> ++	queue_put(&c2s, frag2, frag2_len);
>> ++	free(frag1);
>> ++	free(frag2);
>> ++	seq_offset++;
>> ++	return l;
>> ++}
>> ++
>> + void doit(void)
>> + {
>> + 	global_init();
>> + 	test(client_push_normal);
>> + 	success("malicious reassembly bug exploitation (#1816):\n");
>> + 	test_malicious1816();
>> ++	success("split client hello smoke-test\n");
>> ++	test(client_push_split_hello);
>> + 	gnutls_global_deinit();
>> + }
>> +
>> +--
>> +2.54.0
>> +
>> +
>> +From 092c65d004e2f125f2fea3db84d801ac49a09f78 Mon Sep 17 00:00:00 2001
>> +From: Alexander Sosedkin<asosedkin@redhat.com>
>> +Date: Mon, 20 Apr 2026 16:32:02 +0200
>> +Subject: [PATCH 6/7] buffers: match DTLS datagrams by sequence number
>> +
>> +DTLS handshake fragment reassembly previously matched incoming fragment=
s
>> +by handshake type only, without checking the sequence number.
>> +This allowed fragments from different handshake messages
>> +to be merged into the same reassembly buffer.
>> +
>> +Now sequence number is accounted for during reassembly,
>> +ensuring fragments are only merged when they belong
>> +to the same handshake message.
>> +
>> +Reported-by: Zou Dikai
>> +Fixes: #1839
>> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
>> +---
>> + lib/buffers.c | 3 ++-
>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/lib/buffers.c b/lib/buffers.c
>> +index 5d4d16276..62f140ed3 100644
>> +--- a/lib/buffers.c
>> ++++ b/lib/buffers.c
>> +@@ -971,7 +971,8 @@ static int merge_handshake_packet(gnutls_session_t =
session,
>> + 		session->internals.handshake_recv_buffer;
>> +
>> + 	for (i =3D 0; i < session->internals.handshake_recv_buffer_size; i++)=
 {
>> +-		if (recv_buf[i].htype =3D=3D hsk->htype) {
>> ++		if (recv_buf[i].htype =3D=3D hsk->htype &&
>> ++		    recv_buf[i].sequence =3D=3D hsk->sequence) {
>> + 			exists =3D 1;
>> + 			pos =3D i;
>> + 			break;
>> +--
>> +2.54.0
>> +
>> +
>> +From a2b41be83a1a3529c551ccf54958da91a656550e Mon Sep 17 00:00:00 2001
>> +From: Alexander Sosedkin<asosedkin@redhat.com>
>> +Date: Mon, 20 Apr 2026 16:36:08 +0200
>> +Subject: [PATCH 7/7] tests/mini-dtls-fragments: #1839 mismatching messa=
ge_seq
>> +
>> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
>> +---
>> + tests/mini-dtls-fragments.c | 54 ++++++++++++++++++++++++++++++++-----
>> + 1 file changed, 47 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
>> +index 93490bac2..499a92a92 100644
>> +--- a/tests/mini-dtls-fragments.c
>> ++++ b/tests/mini-dtls-fragments.c
>> +@@ -165,7 +165,7 @@ static uint64_t read_u48(const uint8_t *p)
>> + 	return seq;
>> + }
>> +
>> +-static void test(gnutls_push_func client_push)
>> ++static void test(gnutls_push_func client_push, bool expect_success)
>> + {
>> + 	gnutls_session_t client, server;
>> + 	gnutls_certificate_credentials_t ccred, scred;
>> +@@ -218,12 +218,22 @@ static void test(gnutls_push_func client_push)
>> + 			sr =3D gnutls_handshake(server);
>> + 		if (!sr || gnutls_error_is_fatal(sr))
>> + 			sdone =3D true;
>> ++
>> ++		if (c2s.head =3D=3D c2s.tail && s2c.head =3D=3D s2c.tail)
>> ++			break; /* speed the test up */
>> + 	}
>> +
>> +-	if (cr)
>> +-		fail("client: %s\n", gnutls_strerror(cr));
>> +-	if (sr)
>> +-		fail("server: %s\n", gnutls_strerror(sr));
>> ++	if (expect_success) {
>> ++		if (cr)
>> ++			fail("client: %s\n", gnutls_strerror(cr));
>> ++		if (sr)
>> ++			fail("server: %s\n", gnutls_strerror(sr));
>> ++
>> ++	} else {
>> ++		if (cr =3D=3D 0 && sr =3D=3D 0)
>> ++			fail("handshake unexpectedly succeeded: %s / %s\n",
>> ++			     gnutls_strerror(cr), gnutls_strerror(sr));
>> ++	}
>> +
>> + 	success("OK\n");
>> +
>> +@@ -421,14 +431,44 @@ static ssize_t client_push_split_hello(gnutls_tra=
nsport_ptr_t tr, const void *b,
>> + 	return l;
>> + }
>> +
>> ++static ssize_t client_push_split_hello_bad_seq(gnutls_transport_ptr_t =
tr,
>> ++					       const void *b, size_t l)
>> ++{
>> ++	/* gnutls wasn't matching on message_seq on merging, see #1839 */
>> ++	static int seq_offset =3D 0; /* for renumbering follow-up epoch0 ones=
 */
>> ++
>> ++	const uint8_t *data =3D (const uint8_t *)b;
>> ++	uint8_t *frag1, *frag2;
>> ++	size_t frag1_len, frag2_len;
>> ++
>> ++	/* Pass through anything that isn't an epoch0 ClientHello with body *=
/
>> ++	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
>> ++	    data[0] !=3D 22 || /* not a handshake record */
>> ++	    data[3] !=3D 0 || data[4] !=3D 0 || /* not epoch 0 */
>> ++	    data[13] !=3D 1) /* not ClientHello */
>> ++		return queue_put_renumbered(&c2s, b, l, seq_offset);
>> ++
>> ++	/* epoch0 Client Hello: special treatment of splitting into fragments=
 */
>> ++	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
>> ++	queue_put(&c2s, frag1, frag1_len);
>> ++	frag2[18]++; /* WRONG, message_seq mismatch must be rejected, #1839 *=
/
>> ++	queue_put(&c2s, frag2, frag2_len);
>> ++	free(frag1);
>> ++	free(frag2);
>> ++	seq_offset++;
>> ++	return l;
>> ++}
>> ++
>> + void doit(void)
>> + {
>> + 	global_init();
>> +-	test(client_push_normal);
>> ++	test(client_push_normal, true);
>> + 	success("malicious reassembly bug exploitation (#1816):\n");
>> + 	test_malicious1816();
>> + 	success("split client hello smoke-test\n");
>> +-	test(client_push_split_hello);
>> ++	test(client_push_split_hello, true);
>> ++	success("split client hello smoke-test and mangle sequence number\n")=
;
>> ++	test(client_push_split_hello_bad_seq, false);
>> + 	gnutls_global_deinit();
>> + }
>> +
>> +--
>> +2.54.0
>> +
>> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes=
-support/gnutls/gnutls_3.8.12.bb
>> index 8554ab943d..3ae7a2eb78 100644
>> --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
>> +++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
>> @@ -24,6 +24,7 @@ SRC_URI =3D"https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar=20
>> file://run-ptest \ file://Add-ptest-support.patch \ file://c99.patch \=
=20
>> + file://CVE-2026-33846.patch \ "
>>  =20
>>   SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792=
b2bf470bea012b8e51"


--=20
Yoann Congal
Smile ECS


