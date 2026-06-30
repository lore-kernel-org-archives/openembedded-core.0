Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC7AC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 17:01:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25912.1782838865582833520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 10:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0XJlhhfU;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493be1b9682so1604305e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782838864; x=1783443664; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MsXSsLm37Sbbc/98NFWFNHxOgfzlTMRoqVjhXtiq0Q=;
        b=0XJlhhfUXcEYbXdw79drsernCz6Z0MJmH16G32ZVx6zw2fNhStxKn5RAFaWfCBPtL5
         GuOR04Wp5X3SltwFnOk9J/NNORFQ4zZ3OZ7JioiX+QbjjZ/QXF01buMZ7z2/sRNzDhhV
         dsNOOBMwt9h/wqFcLFf+VIYDPhpuHrImaqQ1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838864; x=1783443664;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5MsXSsLm37Sbbc/98NFWFNHxOgfzlTMRoqVjhXtiq0Q=;
        b=ZLUlywjpC4bM2IC1wIyxOG0yRrPEO0hMNvoh3Z5m9KyW6rXrOJJ06vD2yS/nYvC/YS
         tV0xlvdejPj6fDUmjen7B0YDCgZZWYRsQbV+E2K5zf8L35qUzF5ZsyhnWxKGOKtT2iNS
         qeuC7RwCpHT2j0vOf3Q7zVnx46jPhQaybIfUbOTS84hJzYmthX7z1i9X04vOHux9Mxmc
         7ZnLHan+WiWYRbt0z+Gy+fpelOusntQnfDl/D1xPcVFFYcKhqU/fqb8J2gnWeGe7XB3d
         ud9uYTxfADqlxFZLOMoRhjkitkHAVUJkQeA5LmfUEh431gzw1Tmo6f9/jyp80wVLY4jy
         5Jeg==
X-Forwarded-Encrypted: i=1; AFNElJ/XU0g7pkxsNK9SJeDtGwLJn2jwWZxQNFtl1dHAE4w+SK3JDaFE7hMqZlmhNTpaK2+v4rSdqe+VcJfjULjC4fThjw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMmCj3vjTJKbwMb/sVSlJRAQIaHE9wh03TOFC3HMz2Cfq/gH/v
	HyJObV7UZT2mCtKRl4s81tRCW1RtHly2oH4/9o0WbIyMJpD8efzeRt5cD8pm2G5JKTU=
X-Gm-Gg: AfdE7cmOB1R4izqHwzoFulXs4ezbIjfLzU7H3/rhMmzlnmj/0zQ1HqVLVWxjrak2qpz
	58TdKw0vfAhBOJpIOoFYQhOWiktPoLOIwHQeW1M3G1sv68ZgNzwil9AUOdjCtxHhoaBB+izqIHB
	TAm42x7pVY/vLZVL3RHjJ7E60m3QXLaLcA5gYZqRdSUM0j173tTNXD9TcVX8AIWw7ZsRYzC/cQ7
	EBMfEHhv/3I3d0mdtS6xAkImxisL3Ue3SSlyPrI+wjgxrOv7dzYHyxNqkWQXvCDd/etRC6LWhww
	mY71+Heyo7OyNtGcRYhOKzeBcsi0nhnwY8yaY3b4L3thgtcdpNAIYjnwhn6z0TkYwyb2KdHF4hk
	dYXAee7Gyea8EefT/x5Ou6skFoekTkXq39nMUkMeAxAnHGOfmJ85m8VsaQjVMnftR2VykC5BxCg
	q1uuRB/byCYtEwcrEfjy9K2uPqc+IEJPjuJCN/+CHO43YH76PtZ2GopcHU+qf8EdY2Vnb9jDKLL
	AF1ACVwUxQGFf7j
X-Received: by 2002:a05:600c:3546:b0:492:6113:d4fc with SMTP id 5b1f17b1804b1-493b82ad209mr65261355e9.17.1782838863301;
        Tue, 30 Jun 2026 10:01:03 -0700 (PDT)
Received: from localhost (2a01cb001331aa0041d7d5fc68d4e77b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:41d7:d5fc:68d4:e77b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4c7f90sm8602355e9.2.2026.06.30.10.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 10:01:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 19:01:02 +0200
Message-Id: <DJMJMQLPT6XT.3N7DDSPUVEBY0@smile.fr>
Subject: Re: [OE-core] [PATCH] gnutls: fix CVE-2026-33846
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Yi.Zhao@windriver.com>,
 <Shiva.Komati@windriver.com>, <Qi.Chen@windriver.com>,
 <Libo.Chen.CN@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
 <Shailesh.Masih@windriver.com>, <Tomas.Holmberg@windriver.com>,
 <Haixiao.Yan.CN@windriver.com>
To: <PritamSrichandan.Sahoo@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629050225.2061089-1-PritamSrichandan.Sahoo@windriver.com>
In-Reply-To: <20260629050225.2061089-1-PritamSrichandan.Sahoo@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 17:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239909

On Mon Jun 29, 2026 at 7:02 AM CEST, Pritam Srichandan Sahoo via lists.open=
embedded.org wrote:
> Backport upstream fixes for DTLS handshake fragment reassembly
> vulnerability (CVE-2026-33846).
>
> Includes:
> - 4f94e5cfe1f2: add basic DTLS fragment reassembly test
> - 9deffca528c2: shorten merge_handshake_packet using recv_buf
> - 65ab33fa54e3: add validation checks for DTLS fragment length and bounds
> - cf3f1955e58c: add reproducer for DTLS fragment reassembly bug (#1816)
> - bb427ff74dba: add fragmented ClientHello test coverage
> - 092c65d004e2: match DTLS datagrams by handshake sequence number
> - a2b41be83a1a: add test for mismatched message_seq handling (#1839)
>
> These commits are included in gnutls 3.8.13 and are backported by
> both Debian (gnutls28_3.8.9-3+deb13u4) and CentOS 10-stream
> (gnutls-3.8.10-4.el10) using identical commit selection.
>
> Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.=
com>"
> ---

Hello,

looks like it breaks musl build:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/109/builds/643/st=
eps/12/logs/stdio (line 18053)

Can you check please?

Thanks!

>  .../gnutls/gnutls/CVE-2026-33846.patch        | 862 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
>  2 files changed, 863 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.pat=
ch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/me=
ta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> new file mode 100644
> index 0000000000..5c85a531b3
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> @@ -0,0 +1,862 @@
> +From 4f94e5cfe1f252a431e41642b0752e7e0daf43b9 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 20 Mar 2026 16:09:40 +0100
> +Subject: [PATCH 1/7] tests/mini-dtls-fragments: implement a basic DTLS t=
est
> +
> +Upstream-Status: Backport
> +[1] https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0=
752e7e0daf43b9
> +[2] https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd=
4bb1bf4cbd1fc0
> +[3] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b=
7df3d383d1ff78
> +[4] https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb=
101fb058565d87
> +[5] https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8=
511e873f762743
> +[6] https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84=
d801ac49a09f78
> +[7] https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf549=
58da91a656550e
> +
> +CVE: CVE-2026-33846
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver=
.com>
> +---
> + tests/Makefile.am           |   7 +-
> + tests/mini-dtls-fragments.c | 208 ++++++++++++++++++++++++++++++++++++
> + 2 files changed, 214 insertions(+), 1 deletion(-)
> + create mode 100644 tests/mini-dtls-fragments.c
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index aeeaaf79d..586f1952d 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -241,7 +241,8 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast se=
t_pkcs12_cred cert certuniquei
> + 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \
> + 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-f=
ree \
> + 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \
> +-	 psk-importer privkey-derive dh-compute2 ecdh-compute2
> ++	 psk-importer privkey-derive dh-compute2 ecdh-compute2 \
> ++	 mini-dtls-fragments
> +=20
> + ctests +=3D tls-channel-binding
> +=20
> +@@ -513,6 +514,10 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \
> + 	-I$(top_srcdir)/gl	\
> + 	-I$(top_builddir)/gl
> +=20
> ++mini_dtls_fragments_CPPFLAGS =3D $(AM_CPPFLAGS) \
> ++	-I$(top_srcdir)/gl	\
> ++	-I$(top_builddir)/gl
> ++
> + if ENABLE_PKCS11
> + if !WINDOWS
> + ctests +=3D tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs11=
-no-key \
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +new file mode 100644
> +index 000000000..ee75feeb6
> +--- /dev/null
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -0,0 +1,208 @@
> ++/*
> ++ * Copyright (C) 2026 Red Hat, Inc.
> ++ *
> ++ * Author: Alexander Sosedkin
> ++ *
> ++ * This file is part of GnuTLS.
> ++ *
> ++ * GnuTLS is free software; you can redistribute it and/or modify it
> ++ * under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 3 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * GnuTLS is distributed in the hope that it will be useful, but
> ++ * WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Lesser General Public Lic=
ense
> ++ * along with this program.  If not, see <https://www.gnu.org/licenses/=
>
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++
> ++#if defined(_WIN32)
> ++
> ++int main(void)
> ++{
> ++	exit(77);
> ++}
> ++
> ++#else
> ++
> ++#include <assert.h>
> ++#include <errno.h>
> ++#include <stdbool.h>
> ++#include <stdint.h>
> ++#include <string.h>
> ++#include <gnutls/gnutls.h>
> ++#include <gnutls/dtls.h>
> ++#include "cert-common.h"
> ++#include "utils.h"
> ++
> ++#include "attribute.h"
> ++
> ++static void server_log_func(int level, const char *str)
> ++{
> ++	fprintf(stderr, "server|<%d>| %s", level, str);
> ++}
> ++
> ++static void client_log_func(int level, const char *str)
> ++{
> ++	fprintf(stderr, "client|<%d>| %s", level, str);
> ++}
> ++
> ++#define QUEUE_SIZE 1024
> ++#define PACKET_SIZE 2048
> ++
> ++typedef struct {
> ++	uint8_t buf[PACKET_SIZE];
> ++	size_t len;
> ++} packet_t;
> ++typedef struct {
> ++	packet_t packets[QUEUE_SIZE];
> ++	size_t head;
> ++	size_t tail;
> ++} queue_t;
> ++
> ++static queue_t c2s, s2c;
> ++
> ++static int queue_put(queue_t *q, const void *buf, size_t len)
> ++{
> ++	assert(len <=3D PACKET_SIZE);
> ++	memcpy(q->packets[q->tail].buf, buf, len);
> ++	q->packets[q->tail].len =3D len;
> ++	q->tail++;
> ++	q->tail %=3D QUEUE_SIZE;
> ++	assert(q->tail !=3D q->head);
> ++	return len;
> ++}
> ++
> ++static ssize_t queue_get(queue_t *q, gnutls_session_t s, void *buf, siz=
e_t len)
> ++{
> ++	if (q->head =3D=3D q->tail) {
> ++		gnutls_transport_set_errno(s, EAGAIN);
> ++		return -1;
> ++	}
> ++	size_t n =3D q->packets[q->head].len;
> ++	memcpy(buf, q->packets[q->head].buf, n);
> ++	q->head++;
> ++	q->head %=3D QUEUE_SIZE;
> ++	return n;
> ++}
> ++
> ++static void queue_reset(queue_t *q)
> ++{
> ++	q->head =3D q->tail =3D 0;
> ++}
> ++
> ++static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
> ++{
> ++	return 1;
> ++}
> ++
> ++static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l=
)
> ++{
> ++	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
> ++}
> ++
> ++static ssize_t client_pull(gnutls_transport_ptr_t tr, void *b, size_t l=
)
> ++{
> ++	return queue_get(&s2c, (gnutls_session_t)tr, b, l);
> ++}
> ++
> ++static ssize_t server_push(gnutls_transport_ptr_t tr, const void *b, si=
ze_t l)
> ++{
> ++	return queue_put(&s2c, b, l);
> ++}
> ++
> ++static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void=
 *b,
> ++				  size_t l)
> ++{
> ++	return queue_put(&c2s, b, l);
> ++}
> ++
> ++static void test(gnutls_push_func client_push)
> ++{
> ++	gnutls_session_t client, server;
> ++	gnutls_certificate_credentials_t ccred, scred;
> ++	int cr =3D 0, sr =3D 0;
> ++	bool cdone =3D false, sdone =3D false;
> ++
> ++	if (debug)
> ++		gnutls_global_set_log_level(4711);
> ++
> ++	gnutls_certificate_allocate_credentials(&scred);
> ++	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
> ++					    GNUTLS_X509_FMT_PEM);
> ++	gnutls_certificate_allocate_credentials(&ccred);
> ++
> ++	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
> ++	gnutls_init(&client, GNUTLS_CLIENT | GNUTLS_DATAGRAM);
> ++
> ++	gnutls_priority_set_direct(server, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
> ++				   NULL);
> ++	gnutls_priority_set_direct(client, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
> ++				   NULL);
> ++
> ++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
> ++	gnutls_credentials_set(client, GNUTLS_CRD_CERTIFICATE, ccred);
> ++
> ++	gnutls_dtls_set_timeouts(client, get_dtls_retransmit_timeout(),
> ++				 get_timeout());
> ++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
> ++				 get_timeout());
> ++
> ++	gnutls_transport_set_ptr(client, client);
> ++	gnutls_transport_set_push_function(client, client_push);
> ++	gnutls_transport_set_pull_function(client, client_pull);
> ++	gnutls_transport_set_pull_timeout_function(client, pull_timeout);
> ++
> ++	gnutls_transport_set_ptr(server, server);
> ++	gnutls_transport_set_push_function(server, server_push);
> ++	gnutls_transport_set_pull_function(server, server_pull);
> ++	gnutls_transport_set_pull_timeout_function(server, pull_timeout);
> ++
> ++	while (!cdone || !sdone) {
> ++		gnutls_global_set_log_function(client_log_func);
> ++		if (!cdone)
> ++			cr =3D gnutls_handshake(client);
> ++		if (!cr || gnutls_error_is_fatal(cr))
> ++			cdone =3D true;
> ++
> ++		gnutls_global_set_log_function(server_log_func);
> ++		if (!sdone)
> ++			sr =3D gnutls_handshake(server);
> ++		if (!sr || gnutls_error_is_fatal(sr))
> ++			sdone =3D true;
> ++	}
> ++
> ++	if (cr)
> ++		fail("client: %s\n", gnutls_strerror(cr));
> ++	if (sr)
> ++		fail("server: %s\n", gnutls_strerror(sr));
> ++
> ++	success("OK\n");
> ++
> ++	queue_reset(&c2s);
> ++	queue_reset(&s2c);
> ++
> ++	gnutls_deinit(client);
> ++	gnutls_deinit(server);
> ++	gnutls_certificate_free_credentials(ccred);
> ++	gnutls_certificate_free_credentials(scred);
> ++}
> ++
> ++void doit(void)
> ++{
> ++	global_init();
> ++	test(client_push_normal);
> ++	gnutls_global_deinit();
> ++}
> ++
> ++#endif /* _WIN32 */
> +--=20
> +2.54.0
> +
> +
> +From 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 17 Apr 2026 17:49:31 +0200
> +Subject: [PATCH 2/7] buffers: shorten merge_handshake_packet using recv_=
buf
> +
> +I had vague concerns about thread-safety of this,
> +but then this pattern already exists within the file.
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + lib/buffers.c | 52 +++++++++++++++++----------------------------------
> + 1 file changed, 17 insertions(+), 35 deletions(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index 672380b05..d54c77022 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t =
session,
> + 	int exists =3D 0, i, pos =3D 0;
> + 	int ret;
> +=20
> ++	handshake_buffer_st *recv_buf =3D
> ++		session->internals.handshake_recv_buffer;
> ++
> + 	for (i =3D 0; i < session->internals.handshake_recv_buffer_size; i++) =
{
> +-		if (session->internals.handshake_recv_buffer[i].htype =3D=3D
> +-		    hsk->htype) {
> ++		if (recv_buf[i].htype =3D=3D hsk->htype) {
> + 			exists =3D 1;
> + 			pos =3D i;
> + 			break;
> +@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_session=
_t session,
> + 		_gnutls_write_uint24(0, &hsk->header[6]);
> + 		_gnutls_write_uint24(hsk->length, &hsk->header[9]);
> +=20
> +-		_gnutls_handshake_buffer_move(
> +-			&session->internals.handshake_recv_buffer[pos], hsk);
> ++		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> +=20
> + 	} else {
> +-		if (hsk->start_offset <
> +-			    session->internals.handshake_recv_buffer[pos]
> +-				    .start_offset &&
> +-		    hsk->end_offset + 1 >=3D
> +-			    session->internals.handshake_recv_buffer[pos]
> +-				    .start_offset) {
> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
> +-					.data.data[hsk->start_offset],
> ++		if (hsk->start_offset < recv_buf[pos].start_offset &&
> ++		    hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> + 			       hsk->data.data, hsk->data.length);
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.start_offset =3D hsk->start_offset;
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.end_offset =3D MIN(
> +-				hsk->end_offset,
> +-				session->internals.handshake_recv_buffer[pos]
> +-					.end_offset);
> +-		} else if (hsk->end_offset >
> +-				   session->internals.handshake_recv_buffer[pos]
> +-					   .end_offset &&
> +-			   hsk->start_offset <=3D
> +-				   session->internals.handshake_recv_buffer[pos]
> +-						   .end_offset +
> +-					   1) {
> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
> +-					.data.data[hsk->start_offset],
> ++			recv_buf[pos].start_offset =3D hsk->start_offset;
> ++			recv_buf[pos].end_offset =3D
> ++				MIN(hsk->end_offset, recv_buf[pos].end_offset);
> ++		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
> ++			   hsk->start_offset <=3D recv_buf[pos].end_offset + 1) {
> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> + 			       hsk->data.data, hsk->data.length);
> +=20
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.end_offset =3D hsk->end_offset;
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.start_offset =3D MIN(
> +-				hsk->start_offset,
> +-				session->internals.handshake_recv_buffer[pos]
> +-					.start_offset);
> ++			recv_buf[pos].end_offset =3D hsk->end_offset;
> ++			recv_buf[pos].start_offset =3D MIN(
> ++				hsk->start_offset, recv_buf[pos].start_offset);
> + 		}
> + 		_gnutls_handshake_buffer_clear(hsk);
> + 	}
> +--=20
> +2.54.0
> +
> +
> +From 65ab33fa54e34fba69d793735b7df3d383d1ff78 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 17 Apr 2026 18:21:36 +0200
> +Subject: [PATCH 3/7] buffers: add more checks to DTLS reassembly
> +
> +Previously, gnutls didn't check that DTLS fragments claimed
> +a consistent message_length value.
> +Additionally, a crucial array size check was missing,
> +enabling an attacker to cause a heap overwrite.
> +The updated version rejects fragments with mismatching length
> +and adds a missing boundary check.
> +
> +Reported-by: Haruto Kimura (Stella)
> +Reported-by: Oscar Reparaz
> +Reported-by: Zou Dikai
> +Fixes: #1816
> +Fixes: #1838
> +Fixes: #1839
> +Fixes: CVE-2026-33846
> +Fixes: GNUTLS-SA-2026-04-29-1
> +CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + lib/buffers.c | 20 ++++++++++++++++++++
> + 1 file changed, 20 insertions(+)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index d54c77022..5d4d16276 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session_=
t session,
> + 		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> +=20
> + 	} else {
> ++		if (hsk->length !=3D recv_buf[pos].length) {
> ++			/* inconsistent across fragments */
> ++			_gnutls_handshake_buffer_clear(hsk);
> ++			return gnutls_assert_val(
> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++		}
> ++		/* start_offset + data.length <=3D hsk->length <=3D max_length */
> ++		if (hsk->length < hsk->start_offset + hsk->data.length) {
> ++			/* impossible claims, overflow requested */
> ++			_gnutls_handshake_buffer_clear(hsk);
> ++			return gnutls_assert_val(
> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++		}
> ++		if (hsk->length > recv_buf[pos].data.max_length) {
> ++			/* we don't have this much allocated, overflow guard */
> ++			_gnutls_handshake_buffer_clear(hsk);
> ++			return gnutls_assert_val(
> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++		}
> ++
> + 		if (hsk->start_offset < recv_buf[pos].start_offset &&
> + 		    hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
> + 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> +--=20
> +2.54.0
> +
> +
> +From cf3f1955e58cbcc10373b841bb101fb058565d87 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Wed, 1 Apr 2026 19:51:45 +0200
> +Subject: [PATCH 4/7] tests/mini-dtls-fragments: extend with a #1816 repr=
oducer
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + tests/mini-dtls-fragments.c | 120 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 120 insertions(+)
> +
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +index ee75feeb6..8d5a18acd 100644
> +--- a/tests/mini-dtls-fragments.c
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -106,6 +106,11 @@ static int pull_timeout(gnutls_transport_ptr_t tr, =
unsigned ms)
> + 	return 1;
> + }
> +=20
> ++static int c2s_pull_timeout_once(gnutls_transport_ptr_t tr, unsigned ms=
)
> ++{
> ++	return c2s.head !=3D c2s.tail ? 1 : 0;
> ++}
> ++
> + static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l=
)
> + {
> + 	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
> +@@ -198,10 +203,125 @@ static void test(gnutls_push_func client_push)
> + 	gnutls_certificate_free_credentials(scred);
> + }
> +=20
> ++static void test_malicious1816(void)
> ++{
> ++	/* dgram1: msg_len=3D50, frag_offset=3D25, frag_len=3D25 */
> ++	static const uint8_t dgram1_hdr[] =3D {
> ++		0x16, /* type: handshake */
> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
> ++		0x00, 0x00, /* epoch: 0 */
> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* seq: 0 */
> ++		0x00, 0x25, /* record_length: 37 */
> ++		0x01, /* msg_type: ClientHello */
> ++		0x00, 0x00, 0x32, /* msg_length: 50 */
> ++		0x00, 0x00, /* msg_seq: 0 */
> ++		0x00, 0x00, 0x19, /* frag_offset: 25 */
> ++		0x00, 0x00, 0x19, /* frag_length: 25 */
> ++	};
> ++	/* dgram2: msg_len=3D3000, frag_offset=3D0, frag_len=3D48 */
> ++	static const uint8_t dgram2_hdr[] =3D {
> ++		0x16, /* type: handshake */
> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
> ++		0x00, 0x00, /* epoch: 0 */
> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x01, /* seq: 1 */
> ++		0x00, 0x3c, /* record_length: 60 */
> ++		0x01, /* msg_type: ClientHello */
> ++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
> ++		0x00, 0x00, /* msg_seq: 0 */
> ++		0x00, 0x00, 0x00, /* frag_offset: 0 */
> ++		0x00, 0x00, 0x30, /* frag_length: 48 */
> ++	};
> ++	/* dgram3: msg_len=3D3000, frag_offset=3D40, frag_len=3D1475 */
> ++	static const uint8_t dgram3_hdr[] =3D {
> ++		0x16, /* type: handshake */
> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
> ++		0x00, 0x00, /* epoch: 0 */
> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x02, /* seq: 2 */
> ++		0x05, 0xcf, /* record_length: 1487 */
> ++		0x01, /* msg_type: ClientHello */
> ++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
> ++		0x00, 0x00, /* msg_seq: 0 */
> ++		0x00, 0x00, 0x28, /* frag_offset: 40 */
> ++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
> ++	};
> ++	/* dgram4: msg_len=3D3000, frag_offset=3D1500, frag_len=3D1475 */
> ++	static const uint8_t dgram4_hdr[] =3D {
> ++		0x16, /* type: handshake */
> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
> ++		0x00, 0x00, /* epoch: 0 */
> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x03, /* seq: 3 */
> ++		0x05, 0xcf, /* record_length: 1487 */
> ++		0x01, /* msg_type: ClientHello */
> ++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
> ++		0x00, 0x00, /* msg_seq: 0 */
> ++		0x00, 0x05, 0xdc, /* frag_offset: 1500 */
> ++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
> ++	};
> ++	gnutls_session_t server;
> ++	gnutls_certificate_credentials_t scred;
> ++	uint8_t dgram[1500];
> ++	int sr;
> ++
> ++	if (debug)
> ++		gnutls_global_set_log_level(4711);
> ++
> ++	gnutls_certificate_allocate_credentials(&scred);
> ++	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
> ++					    GNUTLS_X509_FMT_PEM);
> ++
> ++	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
> ++	gnutls_priority_set_direct(server, "NORMAL:+VERS-DTLS1.2", NULL);
> ++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
> ++
> ++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
> ++				 get_timeout());
> ++
> ++	gnutls_transport_set_ptr(server, server);
> ++	gnutls_transport_set_push_function(server, server_push);
> ++	gnutls_transport_set_pull_function(server, server_pull);
> ++	gnutls_transport_set_pull_timeout_function(server,
> ++						   c2s_pull_timeout_once);
> ++
> ++	memset(dgram, 0, sizeof(dgram));
> ++	memcpy(dgram, dgram1_hdr, 25);
> ++	queue_put(&c2s, dgram, 25 + 25);
> ++
> ++	memset(dgram, 0, sizeof(dgram));
> ++	memcpy(dgram, dgram2_hdr, 25);
> ++	queue_put(&c2s, dgram, 25 + 48);
> ++
> ++	memset(dgram, 0, sizeof(dgram));
> ++	memcpy(dgram, dgram3_hdr, 25);
> ++	queue_put(&c2s, dgram, 25 + 1475);
> ++
> ++	memset(dgram, 0, sizeof(dgram));
> ++	memcpy(dgram, dgram4_hdr, 25);
> ++	queue_put(&c2s, dgram, 25 + 1475);
> ++
> ++	gnutls_global_set_log_function(server_log_func);
> ++	do {
> ++		sr =3D gnutls_handshake(server); /* invalid write if vulnerable */
> ++	} while (c2s.head !=3D c2s.tail && !gnutls_error_is_fatal(sr));
> ++	if (sr !=3D GNUTLS_E_UNEXPECTED_PACKET_LENGTH)
> ++		fail("server: expected GNUTLS_E_UNEXPECTED_PACKET_LENGTH, "
> ++		     "got: %s\n",
> ++		     gnutls_strerror(sr));
> ++
> ++	success("OK\n");
> ++
> ++	queue_reset(&c2s);
> ++	queue_reset(&s2c);
> ++
> ++	gnutls_deinit(server);
> ++	gnutls_certificate_free_credentials(scred);
> ++}
> ++
> + void doit(void)
> + {
> + 	global_init();
> + 	test(client_push_normal);
> ++	success("malicious reassembly bug exploitation (#1816):\n");
> ++	test_malicious1816();
> + 	gnutls_global_deinit();
> + }
> +=20
> +--=20
> +2.54.0
> +
> +
> +From bb427ff74dba849d40753ed9c8511e873f762743 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Mon, 20 Apr 2026 16:08:11 +0200
> +Subject: [PATCH 5/7] tests/mini-dtls-fragments: extend with fragmenting
> + ClientHello
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + tests/mini-dtls-fragments.c | 107 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 107 insertions(+)
> +
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +index 8d5a18acd..93490bac2 100644
> +--- a/tests/mini-dtls-fragments.c
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -132,6 +132,39 @@ static ssize_t client_push_normal(gnutls_transport_=
ptr_t tr, const void *b,
> + 	return queue_put(&c2s, b, l);
> + }
> +=20
> ++static void write_u16(uint8_t *p, uint16_t val)
> ++{
> ++	p[0] =3D val >> 8;
> ++	p[1] =3D val & 0xff;
> ++}
> ++
> ++static void write_u24(uint8_t *p, uint32_t val)
> ++{
> ++	p[0] =3D (val >> 16) & 0xff;
> ++	p[1] =3D (val >> 8) & 0xff;
> ++	p[2] =3D val & 0xff;
> ++}
> ++
> ++static void write_u48(uint8_t *p, uint64_t seq)
> ++{
> ++	int i;
> ++	for (i =3D 5; i >=3D 0; i--) {
> ++		p[i] =3D seq & 0xff;
> ++		seq >>=3D 8;
> ++	}
> ++}
> ++
> ++static uint64_t read_u48(const uint8_t *p)
> ++{
> ++	uint64_t seq =3D 0;
> ++	int i;
> ++	for (i =3D 5; i >=3D 0; i--) {
> ++		seq <<=3D 8;
> ++		seq |=3D p[i];
> ++	}
> ++	return seq;
> ++}
> ++
> + static void test(gnutls_push_func client_push)
> + {
> + 	gnutls_session_t client, server;
> +@@ -316,12 +349,86 @@ static void test_malicious1816(void)
> + 	gnutls_certificate_free_credentials(scred);
> + }
> +=20
> ++static ssize_t queue_put_renumbered(queue_t *q, const uint8_t *data, si=
ze_t l,
> ++				    int delta_n)
> ++{
> ++	if (delta_n =3D=3D 0 || l < 13 || data[3] !=3D 0 || data[4] !=3D 0)
> ++		return queue_put(&c2s, data, l);
> ++
> ++	uint8_t *p =3D malloc(l);
> ++	assert(p);
> ++	memcpy(p, data, l);
> ++	write_u48(p + 5, read_u48(p + 5) + delta_n);
> ++	ssize_t ret =3D queue_put(q, p, l);
> ++	free(p);
> ++	return ret;
> ++}
> ++
> ++static void split_client_hello(const uint8_t *data, size_t len, uint8_t=
 **frag1,
> ++			       size_t *frag1_len, uint8_t **frag2,
> ++			       size_t *frag2_len)
> ++{
> ++	size_t body_size =3D len - 25;
> ++	*frag1_len =3D 13 + 12 + 1;
> ++	*frag2_len =3D 13 + 12 + (body_size - 1);
> ++
> ++	*frag1 =3D malloc(13 + 12 + 1);
> ++	assert(*frag1);
> ++	*frag2 =3D malloc(13 + 12 + body_size - 1);
> ++	assert(*frag2);
> ++
> ++	/* first fragment: record header + handshake header + first body byte =
*/
> ++	memcpy(*frag1, data, 13); /* record header */
> ++	write_u16(*frag1 + 11, 12 + 1); /* record length */
> ++	memcpy(*frag1 + 13, data + 13, 12); /* handshake header */
> ++	write_u24(*frag1 + 19, 0); /* fragment_offset =3D 0 */
> ++	write_u24(*frag1 + 22, 1); /* fragment_length =3D 1 */
> ++	(*frag1)[25] =3D data[25]; /* first body byte */
> ++
> ++	/* second fragment: record header + handshake header + remaining body =
*/
> ++	memcpy(*frag2, data, 13); /* record header */
> ++	write_u16(*frag2 + 11, *frag2_len - 13); /* record length */
> ++	write_u48(*frag2 + 5, read_u48(*frag2 + 5) + 1); /* sequence number */
> ++	memcpy(*frag2 + 13, data + 13, 12); /* handshake header */
> ++	write_u24(*frag2 + 19, 1); /* fragment_offset =3D 1 */
> ++	write_u24(*frag2 + 22, body_size - 1); /* shortened fragment_length */
> ++	memcpy(*frag2 + 25, data + 26, body_size - 1); /* remaining body */
> ++}
> ++
> ++static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const=
 void *b,
> ++				       size_t l)
> ++{
> ++	static int seq_offset =3D 0; /* for renumbering follow-up epoch0 ones =
*/
> ++
> ++	const uint8_t *data =3D (const uint8_t *)b;
> ++	uint8_t *frag1, *frag2;
> ++	size_t frag1_len, frag2_len;
> ++
> ++	/* Pass through anything that isn't an epoch0 ClientHello with body */
> ++	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
> ++	    data[0] !=3D 22 || /* not a handshake record */
> ++	    data[3] !=3D 0 || data[4] !=3D 0 || /* not epoch 0 */
> ++	    data[13] !=3D 1) /* not ClientHello */
> ++		return queue_put_renumbered(&c2s, b, l, seq_offset);
> ++
> ++	/* epoch0 Client Hello: special treatment of splitting into fragments =
*/
> ++	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
> ++	queue_put(&c2s, frag1, frag1_len);
> ++	queue_put(&c2s, frag2, frag2_len);
> ++	free(frag1);
> ++	free(frag2);
> ++	seq_offset++;
> ++	return l;
> ++}
> ++
> + void doit(void)
> + {
> + 	global_init();
> + 	test(client_push_normal);
> + 	success("malicious reassembly bug exploitation (#1816):\n");
> + 	test_malicious1816();
> ++	success("split client hello smoke-test\n");
> ++	test(client_push_split_hello);
> + 	gnutls_global_deinit();
> + }
> +=20
> +--=20
> +2.54.0
> +
> +
> +From 092c65d004e2f125f2fea3db84d801ac49a09f78 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Mon, 20 Apr 2026 16:32:02 +0200
> +Subject: [PATCH 6/7] buffers: match DTLS datagrams by sequence number
> +
> +DTLS handshake fragment reassembly previously matched incoming fragments
> +by handshake type only, without checking the sequence number.
> +This allowed fragments from different handshake messages
> +to be merged into the same reassembly buffer.
> +
> +Now sequence number is accounted for during reassembly,
> +ensuring fragments are only merged when they belong
> +to the same handshake message.
> +
> +Reported-by: Zou Dikai
> +Fixes: #1839
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + lib/buffers.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index 5d4d16276..62f140ed3 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -971,7 +971,8 @@ static int merge_handshake_packet(gnutls_session_t s=
ession,
> + 		session->internals.handshake_recv_buffer;
> +=20
> + 	for (i =3D 0; i < session->internals.handshake_recv_buffer_size; i++) =
{
> +-		if (recv_buf[i].htype =3D=3D hsk->htype) {
> ++		if (recv_buf[i].htype =3D=3D hsk->htype &&
> ++		    recv_buf[i].sequence =3D=3D hsk->sequence) {
> + 			exists =3D 1;
> + 			pos =3D i;
> + 			break;
> +--=20
> +2.54.0
> +
> +
> +From a2b41be83a1a3529c551ccf54958da91a656550e Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Mon, 20 Apr 2026 16:36:08 +0200
> +Subject: [PATCH 7/7] tests/mini-dtls-fragments: #1839 mismatching messag=
e_seq
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + tests/mini-dtls-fragments.c | 54 ++++++++++++++++++++++++++++++++-----
> + 1 file changed, 47 insertions(+), 7 deletions(-)
> +
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +index 93490bac2..499a92a92 100644
> +--- a/tests/mini-dtls-fragments.c
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -165,7 +165,7 @@ static uint64_t read_u48(const uint8_t *p)
> + 	return seq;
> + }
> +=20
> +-static void test(gnutls_push_func client_push)
> ++static void test(gnutls_push_func client_push, bool expect_success)
> + {
> + 	gnutls_session_t client, server;
> + 	gnutls_certificate_credentials_t ccred, scred;
> +@@ -218,12 +218,22 @@ static void test(gnutls_push_func client_push)
> + 			sr =3D gnutls_handshake(server);
> + 		if (!sr || gnutls_error_is_fatal(sr))
> + 			sdone =3D true;
> ++
> ++		if (c2s.head =3D=3D c2s.tail && s2c.head =3D=3D s2c.tail)
> ++			break; /* speed the test up */
> + 	}
> +=20
> +-	if (cr)
> +-		fail("client: %s\n", gnutls_strerror(cr));
> +-	if (sr)
> +-		fail("server: %s\n", gnutls_strerror(sr));
> ++	if (expect_success) {
> ++		if (cr)
> ++			fail("client: %s\n", gnutls_strerror(cr));
> ++		if (sr)
> ++			fail("server: %s\n", gnutls_strerror(sr));
> ++
> ++	} else {
> ++		if (cr =3D=3D 0 && sr =3D=3D 0)
> ++			fail("handshake unexpectedly succeeded: %s / %s\n",
> ++			     gnutls_strerror(cr), gnutls_strerror(sr));
> ++	}
> +=20
> + 	success("OK\n");
> +=20
> +@@ -421,14 +431,44 @@ static ssize_t client_push_split_hello(gnutls_tran=
sport_ptr_t tr, const void *b,
> + 	return l;
> + }
> +=20
> ++static ssize_t client_push_split_hello_bad_seq(gnutls_transport_ptr_t t=
r,
> ++					       const void *b, size_t l)
> ++{
> ++	/* gnutls wasn't matching on message_seq on merging, see #1839 */
> ++	static int seq_offset =3D 0; /* for renumbering follow-up epoch0 ones =
*/
> ++
> ++	const uint8_t *data =3D (const uint8_t *)b;
> ++	uint8_t *frag1, *frag2;
> ++	size_t frag1_len, frag2_len;
> ++
> ++	/* Pass through anything that isn't an epoch0 ClientHello with body */
> ++	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
> ++	    data[0] !=3D 22 || /* not a handshake record */
> ++	    data[3] !=3D 0 || data[4] !=3D 0 || /* not epoch 0 */
> ++	    data[13] !=3D 1) /* not ClientHello */
> ++		return queue_put_renumbered(&c2s, b, l, seq_offset);
> ++
> ++	/* epoch0 Client Hello: special treatment of splitting into fragments =
*/
> ++	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
> ++	queue_put(&c2s, frag1, frag1_len);
> ++	frag2[18]++; /* WRONG, message_seq mismatch must be rejected, #1839 */
> ++	queue_put(&c2s, frag2, frag2_len);
> ++	free(frag1);
> ++	free(frag2);
> ++	seq_offset++;
> ++	return l;
> ++}
> ++
> + void doit(void)
> + {
> + 	global_init();
> +-	test(client_push_normal);
> ++	test(client_push_normal, true);
> + 	success("malicious reassembly bug exploitation (#1816):\n");
> + 	test_malicious1816();
> + 	success("split client hello smoke-test\n");
> +-	test(client_push_split_hello);
> ++	test(client_push_split_hello, true);
> ++	success("split client hello smoke-test and mangle sequence number\n");
> ++	test(client_push_split_hello_bad_seq, false);
> + 	gnutls_global_deinit();
> + }
> +=20
> +--=20
> +2.54.0
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.12.bb
> index 8554ab943d..3ae7a2eb78 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
>             file://run-ptest \
>             file://Add-ptest-support.patch \
>             file://c99.patch \
> +           file://CVE-2026-33846.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2=
bf470bea012b8e51"


--=20
Yoann Congal
Smile ECS


