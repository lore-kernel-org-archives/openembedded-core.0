Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12805.1793370198372570216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 07:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=C5QHh4Ul;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so7822095e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793370196; x=1793974996; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1J79NYYv95hZKvyvbCGzbNBrr9H3aqq/WPIu4hNxcHM=;
        b=C5QHh4UlcxQUPmqqORrkYf9yJ+uFkmh1Bn+lvQqxlt4M/Jx+9j/PRhL0/1vzD5mqzi
         Et5hJk8XrkbijdX8Bb6LAm2ZudmSkQnw4ZZTCcXzrKvsdEPTt+Mi1Hn++iz0oJAK9/jM
         /unLD1QjfhgFgmUcr9SDbqkYL9sECeYRZoTes/BneUKRaP6IglcoYuQQHjaYc7PePDdo
         V+Y3ROinX3/WhZVVbq0hrjxN/CO6T+I5pP6hUR7Yc+x4q7FVgqEQh+ihlxGwdC8K7ldb
         Wko35bbMmd7srEfZ9ZYMfj21Jv+ZZ0sCyDYznZJoNIuI6da+h++oPPhjaHe+C9NUMwbU
         3NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370196; x=1793974996;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1J79NYYv95hZKvyvbCGzbNBrr9H3aqq/WPIu4hNxcHM=;
        b=Zj8L5T2FdZroVS6pUaCJBJ+4S6Ry7Ebq2rqcsRhhKnhay8iIOBLT3oWnFU2QBSG6u5
         LP65+OhUsukYUdQWNcMrGB2ZEa9RBZiRbNEA5tkS8b4p4c5t4iyRvk0kPL5e1qiy8k1H
         LM8CfyAlYx5azW1QZtfP2rkF+iZUHX56io3Uw96JxsnxWScBQnVXwm7a7I5RZzQipak/
         mpz2rh6aPKE7ZN6xP1Z92+D4VhTm23X73mC7RvzWwckPL+FSVoR3SeI9B9+5nPLJjGWn
         6p8yExDMWXt249nV2xaKykIdNOCD66mVRqQipv9WssROXfHFA9eQrtJu4g8RwKgATwNC
         s2Jw==
X-Forwarded-Encrypted: i=1; AKwUvByjs5ep/mctBwusX2iiioNO/Yy6D2H+L56QIuL5MmDF1Dw50WoSJ0uGUTMbNBufyHQtcU9cfTok2fNlE/Osk5I/wA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJO3IfPfrLf7+V8nEvv4Yt8rprZq+haodUhRaXKyhUfe79nE/OM
	CyVF5CepYNIzb4OJ4jHcfwWxzNu7PV3zfR7d6lbmgYYzUCtZuqF9Kn4mv0wa0N1U3VQ=
X-Gm-Gg: AYBFou36mFqSJwGOq5KCPbVfWav9zlfJwwQTC2kt6d4ns1Jd4aZP2FGR5wDwzFV58V4
	LmDQoJ3JaUn72XWKqqFA6KkBCncblzF95VMs2JkB/DtdvBr+xJ1DgGSLZWoXOZ4SBxQajmaJ+xR
	OuLw7sr6JTTaWRcB7q3ctl6/U2DM5Ff8etP8AC6q6h3CyVV2pYfhBtvdxa9Q6T/2NMQRZZU1oCD
	ox7141UkqTWhNgBJy9stg8QcGA4/4ti0J6U2bxMu3m2Ec78COV31xiDtp1savdXw/bJ+GxP8iR6
	pEZGUewPSt4fsJl+XkEMEbqTRKrAOr0E47OUq7TJEA1zR8/qjp7ktSH0Cmpj1r6auy7p5Y+Ownh
	odeWeTDmpLa92RzdO3Z6PUf1wU1Tov2JSbI9SrY5zoAgjG5UZiu8B5ZpX8Atb7v6TofwvtntBl+
	TIN5eR7lPzpOwyAbmCZT8ph7p9zfDGYlX+NqbUmgsHn7v9I3fjJ/n2dAR+2JpABzxZZi4a71496
	HYIOrz2QH4YV0pRt+26iJvNZEm6wDKMapJfNZqbGt5OnKtPFLIsOO7s/ORGicvIqQ1MBTdKIXHc
	EJxT834OVkTGIVtdbcR3GXmNCqMlIH9zN9TOAtWPi9Wgliv2BamBMnP7Xedz5q+HRYXhlr/8p5R
	rYhsZW9PcI84N+97z
X-Received: by 2002:a05:600c:8b5c:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4ac1889c4b9mr58014765e9.20.1793370196507;
        Fri, 30 Oct 2026 07:23:16 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77c132sm45542385e9.1.2026.10.30.07.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:23:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 15:23:14 +0100
Message-Id: <DMI8OE0BA0GR.10SBSJ2SFLIA3@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2 2/5] libsoup-2.4: fix
 CVE-2026-1801
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jason.stasiak@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260929205055.2403390-2-jason.stasiak@gmail.com>
 <20261014161209.2227316-1-jason.stasiak@garmin.com>
 <20261014161209.2227316-2-jason.stasiak@garmin.com>
In-Reply-To: <20261014161209.2227316-2-jason.stasiak@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249044

On Wed Oct 14, 2026 at 6:12 PM CEST, Jason Stasiak via lists.openembedded.o=
rg wrote:
> Backport fix for CVE-2026-1801 from meta-oe to OE-core. Update CVE
> patch to restore the chunked server validation unit test from the
> upstream libsoup3 patch (b9a1c0663ff8ab6e79715db4b35b54f560416ddd).
>
> (From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)
>
> Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> ---
> Changes since v1:
>    - Resolved malformed patch lines
>
>  .../libsoup/libsoup-2.4/CVE-2026-1801.patch   | 217 ++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
>  2 files changed, 218 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-180=
1.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch=
 b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
> new file mode 100644
> index 0000000000..f7579a9834
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
> @@ -0,0 +1,217 @@
> +From f9c933e258e9ef2f221cca6395f8092a1c4b93dd Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 19 Mar 2026 17:10:36 +0800
> +Subject: [PATCH 2/4] Fix CVE-2026-1801
> +
> +This patch merges 3 upstream patches

Please do not merge patches like this. Instead, backport the 3 patches
into CVE-2026-1801-{01,02,03}.patch.
(Again, I know this is in the upstream meta-oe commit, but we simply
have different review expectation)

> +
> +Chery-pick the first two patches to make the context is the same as the
> +third patch that fix CVE-2026-1801
> +
> +Upstream-Status: Backport
> +[https://gitlab.gnome.org/GNOME/libsoup/-/commit/1e32b5e123aa1689505472b=
dbfcbd897eac41977,
> +https://gitlab.gnome.org/GNOME/libsoup/-/commit/8a2e15c88512ae4517d2c2c8=
87d39299725b22da,
> +https://gitlab.gnome.org/GNOME/libsoup/-/commit/b9a1c0663ff8ab6e79715db4=
b35b54f560416ddd]
> +CVE: CVE-2026-1801
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +Backport the chunked server validation unit test from the upstream
> +libsoup3 patch (b9a1c0663ff8ab6e79715db4b35b54f560416ddd).
> +
> +Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> +---
> + libsoup/soup-body-input-stream.c | 66 +++++++++++++++++++------------
> + tests/server-test.c              | 67 ++++++++++++++++++++++++++++++++
> + 2 files changed, 108 insertions(+), 25 deletions(-)
> +
> +diff --git a/libsoup/soup-body-input-stream.c b/libsoup/soup-body-input-=
stream.c
> +index 6b95884..25d9312 100644
> +--- a/libsoup/soup-body-input-stream.c
> ++++ b/libsoup/soup-body-input-stream.c
> +@@ -159,15 +159,18 @@ soup_body_input_stream_read_chunked (SoupBodyInput=
Stream  *bistream,
> + again:
> + 	switch (bistream->priv->chunked_state) {
> + 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK_SIZE:
> +-		nread =3D soup_filter_input_stream_read_line (
> +-			fstream, metabuf, sizeof (metabuf), blocking,
> +-			&got_line, cancellable, error);
> +-		if (nread <=3D 0)
> ++		nread =3D soup_filter_input_stream_read_until (
> ++				fstream, metabuf, sizeof (metabuf),
> ++				"\r\n", 2, blocking, TRUE,
> ++				&got_line, cancellable, error);
> ++		if (nread < 0)
> + 			return nread;
> +-		if (!got_line) {
> +-			g_set_error_literal (error, G_IO_ERROR,
> +-					     G_IO_ERROR_PARTIAL_INPUT,
> +-					     _("Connection terminated unexpectedly"));
                        ^ This indentation is different from upstream.
Please avoid changing upstream patch if not needed.

> ++		if (nread =3D=3D 0 || !got_line) {
> ++			if (error && *error =3D=3D NULL) {
> ++				g_set_error_literal (error, G_IO_ERROR,
> ++									G_IO_ERROR_PARTIAL_INPUT,
> ++									("Connection terminated unexpectedly"));
> ++			}
> + 			return -1;
> + 		}
> +=20
> +@@ -180,9 +183,9 @@ again:
> +=20
> + 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK:
> + 		nread =3D soup_body_input_stream_read_raw (
> +-			bistream, buffer,
> +-			MIN (count, bistream->priv->read_length),
> +-			blocking, cancellable, error);
> ++				bistream, buffer,
> ++				MIN (count, bistream->priv->read_length),
> ++				blocking, cancellable, error);
> + 		if (nread > 0) {
> + 			bistream->priv->read_length -=3D nread;
> + 			if (bistream->priv->read_length =3D=3D 0)
> +@@ -191,16 +194,19 @@ again:
> + 		return nread;
> +=20
> + 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK_END:
> +-		nread =3D soup_filter_input_stream_read_line (
> +-			SOUP_FILTER_INPUT_STREAM (bistream->priv->base_stream),
> +-			metabuf, sizeof (metabuf), blocking,
> +-			&got_line, cancellable, error);
> +-		if (nread <=3D 0)
> ++		nread =3D soup_filter_input_stream_read_until (
> ++				SOUP_FILTER_INPUT_STREAM (bistream->priv->base_stream),
> ++				metabuf, sizeof (metabuf),
> ++				"\r\n", 2, blocking, TRUE,
> ++				&got_line, cancellable, error);
> ++		if (nread < 0)
> + 			return nread;
> +-		if (!got_line) {
> +-			g_set_error_literal (error, G_IO_ERROR,
> +-					     G_IO_ERROR_PARTIAL_INPUT,
> +-					     _("Connection terminated unexpectedly"));
> ++		if (nread =3D=3D 0 || !got_line) {
> ++			if (error && *error =3D=3D NULL) {
> ++				g_set_error_literal (error, G_IO_ERROR,
> ++				G_IO_ERROR_PARTIAL_INPUT,
> ++				_("Connection terminated unexpectedly"));
> ++			}
> + 			return -1;
> + 		}
> +=20
> +@@ -208,13 +214,23 @@ again:
> + 		break;
> +=20
> + 	case SOUP_BODY_INPUT_STREAM_STATE_TRAILERS:
> +-		nread =3D soup_filter_input_stream_read_line (
> +-			fstream, buffer, count, blocking,
> +-			&got_line, cancellable, error);
> +-		if (nread <=3D 0)
> ++		nread =3D soup_filter_input_stream_read_until (
> ++				fstream, metabuf, sizeof (metabuf),
> ++				"\r\n", 2, blocking, TRUE,
> ++				&got_line, cancellable, error);
> ++		if (nread < 0)
> + 			return nread;
> +=20
> +-		if (strncmp (buffer, "\r\n", nread) || strncmp (buffer, "\n", nread))=
 {
> ++		if (nread =3D=3D 0) {
> ++			if (error && *error =3D=3D NULL) {
> ++				g_set_error_literal (error, G_IO_ERROR,
> ++				G_IO_ERROR_PARTIAL_INPUT,
> ++				_("Connection terminated unexpectedly"));
> ++			}
> ++			return -1;
> ++		}
> ++
> ++		if (nread =3D=3D 2 && strncmp (metabuf, "\r\n", nread) =3D=3D 0) {
> + 			bistream->priv->chunked_state =3D SOUP_BODY_INPUT_STREAM_STATE_DONE;
> + 			bistream->priv->eof =3D TRUE;
> + 		}
> +diff --git a/tests/server-test.c b/tests/server-test.c
> +index 8976103e..fbe8bdcc 100644
> +--- a/tests/server-test.c
> ++++ b/tests/server-test.c

Same remarks as patch 1/5 about test code. If we don't exercise it we
don't have to backport/review it.

Thanks!
--=20
Yoann Congal
Smile ECS

