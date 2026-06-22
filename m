Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3872ACDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 15:10:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45277.1782140993755884449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 08:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LMbpWzCq;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4924f8db066so9385165e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782140992; x=1782745792; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GElJ0x+ZyC1L7lKX8CdyV98a5gcjW0kYItcPGk7nEow=;
        b=LMbpWzCqY/PoP857eQ0JoHW93AHDGFpdHTb64Uw84hBgKHhMzNbWXf1IKWO7HGcQQz
         0FSlChmLH15nLnGWybdjdUtG1gx+xO+y1L+FVZMAOc+aFSA7gtqmqzwuxH8nB2kSe2Kt
         PHfiEPk9OmFNXmmHFrnnfqduRqpcrWCbFV0Y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140992; x=1782745792;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GElJ0x+ZyC1L7lKX8CdyV98a5gcjW0kYItcPGk7nEow=;
        b=qWSTt1M/rKiGbuBGzINSG/FZZ5EPntAKVECxV78ryRg4ht8sBKJIUogzWGX++7L0Q8
         KH/J0l87aN3IhLJzJTWB5Tk6gMk+/pXbMsZInwUNuNyivpIcwMqeisXbezhJ3oFe2cdr
         m2mLY+crwW7f0AT/2FGRR97Lp3+BqqGs1Fedm4r4ZnfCluKyJYz6InXTfa1d3kgmqWQj
         MuH+OVrPFiPqu76WMAvXfEhe80zZcxXRlpCfB/Kvxfz8s60nn5SPIGK1YsyYoFFYjQRq
         KTgq3rK4QVqwObyQTED78lDfSuZw4v5H+wkJlzR+mokf10WpwBgI9iHOQKKcDvxTFAAk
         ioeg==
X-Forwarded-Encrypted: i=1; AFNElJ9DSLuPXNz1reKKwn6R4FHMFCROJ5Q7LH04HoYI5qu9/4554KKJCSouxERvkATA4nQAqtKgQRkukWtmK3dWpxt/sA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxosxKhVFqP/wYhvJX5BzW7YY3qX+5tPiTf7xeJDu467R/lUWIV
	d+KOWBJtMdDfFcL+Hm4amc1AZZQDQCP9TZVLS/OvWi0OvVD4hSzr382jHpM+Cy5W65Q=
X-Gm-Gg: AfdE7cnjPYZK7wLm2UmuHeu2i6hGX55WEUSVMXi2caNmvrG3sLChBJhYZm+QDoxseeB
	D1ADKhCu0YKWIkCxW81xEb1PmncZxZTjz5KnQlkOFr3bloKlECqs9evkNrH0Q1cV2B1XLZBUfFb
	Uo+8efniJmCDg0CMmDLHZW2HXbkvk7WVYfAdOPrOk0Z++JRiKPr6/IRBl3o3dt4Jt9GOjF5uJCq
	rcArv80tmoxP3rW4JmNhs1PuzKGas4Wl7+2g/kzsZNeS8J0NWAbEEHo08eBYdf00J2Zsb17VCnT
	PEUnk01qv17phsNjgFYc+7X+sRXZGaBrIi/Uh9qTIWEj4kuq8ivYta8n9eyBVpE3L/j4w5+/hAQ
	eGaEHn8wd0U+uB6ISyqaYuaX63VRffM3SPYwhkbg8dHnQn54kd2KWqlHiZ/ZDLFpQ+uczd5Si48
	ILU79SzGr9caVWZkcERGfq8SP6EuVsf7jqLlsIMVr1JYCcVeRa0OHSZnXCFQtq+9Vm50IwwOANq
	Uhc
X-Received: by 2002:a05:600c:3e83:b0:492:3fb5:4697 with SMTP id 5b1f17b1804b1-492423140e0mr284832555e9.5.1782140991939;
        Mon, 22 Jun 2026 08:09:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00ae343d7f26e6048e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae34:3d7f:26e6:48e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57a0esm25182485f8f.27.2026.06.22.08.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 08:09:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 17:09:51 +0200
Message-Id: <DJFO98ZBIM09.2L1GEXN2FKDYM@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 2/2] gnutls: fix CVE-2026-42009
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260613102520.3703528-1-sudumbha@cisco.com>
 <20260613102520.3703528-2-sudumbha@cisco.com>
In-Reply-To: <20260613102520.3703528-2-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 15:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239306

On Sat Jun 13, 2026 at 12:25 PM CEST, Sudhir Dumbhare via lists.openembedde=
d.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> This patch applies the upstream fix [1] and [2], as referenced in [3],
> to address a DTLS packet reordering flaw where duplicate sequence numbers
> could lead to unstable ordering or undefined behavior.
>
> [1] https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f096384079=
4c41d3b3ee66d
> [2] https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a17=
5ffc8f925b76f
> [3] https://security-tracker.debian.org/tracker/CVE-2026-42009
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-42009
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---

Same as patch 1/2: please send a patch for wrynose.

Regards,

>  .../gnutls/gnutls/CVE-2026-42009_p1.patch     | 66 +++++++++++++++++++
>  .../gnutls/gnutls/CVE-2026-42009_p2.patch     | 47 +++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
>  3 files changed, 115 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.=
patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.=
patch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch b=
/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
> new file mode 100644
> index 0000000000..03214bab0e
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
> @@ -0,0 +1,66 @@
> +From e1f366666c12f431151a04ada9cf9a30d602751b Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Tue, 21 Apr 2026 16:52:48 +0200
> +Subject: [PATCH] lib/buffers: ensure packets have differing sequence
> + numbers
> +
> +There should normally be no packets with same sequence number and
> +differing handshake type, unless an adversary crafts them.
> +Discarding them allows to get rid of packets
> +with duplicate sequence ID in the buffer,
> +relieving us from the question of how to sort them later.
> +
> +CVE: CVE-2026-42009
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f01=
e21441e29052a6f0963840794c41d3b3ee66d]
> +
> +Backport Changes:
> +- Adjusted the upstream hunk to match the GnuTLS 3.8.4 code layout.
> +- The upstream commit uses the local recv_buf alias introduced later
> +  in v3.8.13 by commit;
> +  https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4b=
b1bf4cbd1fc0.
> +- GnuTLS 3.8.4 does not have that local recv_buf alias in
> +  merge_handshake_packet(), so the backport replaces recv_buf[i] with th=
e
> +  existing session->internals.handshake_recv_buffer[i] access pattern.
> +
> +Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
> +Fixes: #1848
> +Fixes: CVE-2026-42009
> +Fixes: GNUTLS-SA-2026-04-29-2
> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +(cherry picked from commit f01e21441e29052a6f0963840794c41d3b3ee66d)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + lib/buffers.c | 16 ++++++++++++++--
> + 1 file changed, 14 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index 672380b054..e7f08b5625 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -968,8 +968,20 @@ static int merge_handshake_packet(gnutls_session_t =
session,
> + 	int ret;
> +=20
> + 	for (i =3D 0; i < session->internals.handshake_recv_buffer_size; i++) =
{
> +-		if (session->internals.handshake_recv_buffer[i].htype =3D=3D
> +-		    hsk->htype) {
> ++		if (session->internals.handshake_recv_buffer[i].sequence =3D=3D hsk->=
sequence) {
> ++			if (session->internals.handshake_recv_buffer[i].htype !=3D hsk->htyp=
e) {
> ++				_gnutls_audit_log(
> ++					session,
> ++					"Discarded unexpected handshake packet "
> ++					"with duplicate sequence %d, but "
> ++					"mismatched type %s (previously %s)\n",
> ++					hsk->sequence,
> ++					_gnutls_handshake2str(hsk->htype),
> ++					_gnutls_handshake2str(
> ++						session->internals.handshake_recv_buffer[i].htype));
> ++				_gnutls_handshake_buffer_clear(hsk);
> ++				return 0;
> ++			}
> + 			exists =3D 1;
> + 			pos =3D i;
> + 			break;
> +--=20
> +2.35.6
> +
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch b=
/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
> new file mode 100644
> index 0000000000..b26491840b
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
> @@ -0,0 +1,47 @@
> +From 23fdcec4c6b5669296295ad3a9f87f6467eeb0f3 Mon Sep 17 00:00:00 2001
> +From: Joshua Rogers <joshua@joshua.hu>
> +Date: Tue, 21 Apr 2026 18:11:39 +0200
> +Subject: [PATCH] buffers: fix handshake_compare when sequence numbers
> + match
> +
> +The comparator function used for ordering DTLS packets
> +by sequence numbers did not follow qsort comparator contracts
> +in case of packets with duplicate sequence numbers,
> +which could lead to unstable ordering or undefined behaviour.
> +Returning 0 in such cases makes the sorting stable.
> +
> +CVE: CVE-2026-42009
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f34=
1441fad91142897d83b44a175ffc8f925b76f]
> +
> +Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
> +Fixes: #1848
> +Fixes: CVE-2026-42009
> +Fixes: GNUTLS-SA-2026-04-29-2
> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
> +Signed-off-by: Joshua Rogers <joshua@joshua.hu>
> +(cherry picked from commit f341441fad91142897d83b44a175ffc8f925b76f)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + lib/buffers.c | 6 +-----
> + 1 file changed, 1 insertion(+), 5 deletions(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index e7f08b5625..1ac27e4e96 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -844,11 +844,7 @@ static int handshake_compare(const void *_e1, const=
 void *_e2)
> + {
> + 	const handshake_buffer_st *e1 =3D _e1;
> + 	const handshake_buffer_st *e2 =3D _e2;
> +-
> +-	if (e1->sequence <=3D e2->sequence)
> +-		return 1;
> +-	else
> +-		return -1;
> ++	return (e1->sequence < e2->sequence) - (e1->sequence > e2->sequence);
> + }
> +=20
> + #define SSL2_HEADERS 1
> +--=20
> +2.35.6
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.4.bb
> index 6d43c58df2..d27d2cfa74 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> @@ -43,6 +43,8 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
>             file://CVE-2025-14831-7.patch \
>             file://CVE-2025-14831-8.patch \
>             file://CVE-2025-14831-9.patch \
> +           file://CVE-2026-42009_p1.patch \
> +           file://CVE-2026-42009_p2.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd4=
4cdfa7f36ebc3a9b"


--=20
Yoann Congal
Smile ECS


