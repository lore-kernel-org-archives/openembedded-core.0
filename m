Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58477.1795454028370205785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 09:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=FqXpC4cq;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so2048772f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 09:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795454026; x=1796058826; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n2yCzVW9Ez8sTCZWZ7gRaHb7Zoq2y0JNaw6C5kr3Cq8=;
        b=FqXpC4cqe2y0jV4XFevTHtpMsG/6mItNOpKpe+NsJbxh18DL6aHKrKbRr4PST+FvpH
         krHMidM82nX4slzyNLh4Kvm4WyFLHEF943zqKnksv/jBbAv2EGPcaemEgSRRizEjn22E
         8TXYmTNhFUgqYpnMrQrU3Ld+B5Et1gx4hWpHgIvyj6NvPU5UShpmgo5fdyv+fYPb9Rcm
         D3dlT17uvHhSzwbGoXyzxB4+egeF8mqFX6xpojg1EZxX2nChU+eHkEtzdcaKX6Af1jDA
         EiZ77kfGB6hMcKJYx8d04tx+xmQwxWsPf1OO9FKBtU/YQyhsLvt9Evg1AGBjD3Fk6xAE
         K+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454026; x=1796058826;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2yCzVW9Ez8sTCZWZ7gRaHb7Zoq2y0JNaw6C5kr3Cq8=;
        b=dScDpAnGTSeFeAUFbqLrER14+aygSGKF+GpFOKSNOZFdSyjV+SL38U5+B8CzXpGzJx
         S1Jza4nFr5yZP3DBRdezHBhimfau+uvveW1NCl796mkpKnZKFUeZ9QGdGoqfCp9u8wum
         Tj+jvZAns6rOelTZkYlTmzghFWRq96QSCMgNEZi8mJhXHlXshQ3dtkJ6iz6WFTLpfEUJ
         OMGVQv3IJ7Nub1N2Vx5tyNa1fRc4SMN3vxC1coszDoOea30s/G9+r/PR6TAcEnlXS8u6
         bjzYD3TIfNZEMH+NZGjLvuOQnLjDkHs5mU/fs1rR6igx7jmpP7jyCFEAHDu2id9MuT0b
         NHcg==
X-Forwarded-Encrypted: i=1; AL+hErG8FFV5Gr9fjmPlZtXeMfx3RigLWyJo6TsZYHE8tcF+KGx8PK87fU94VecriA6cwwczkqy4OSApaksHS+L/ThulBQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z84PIvj6tnhhnrcPrKDpTghEwkiQ3NfeJBLtZJT6PpW1Msx769l
	dbrZS7fojHQ3IhYymJEhCha7NshjEE0MoVGrJWLG26tKgZVuD53NPDIPJD22Qdk2cbw=
X-Gm-Gg: AZFdTZe7a+b39nx6MMEMcBx5/76XGewZOiiHCR1bvdIv4XwEset1EYM5wa6+o875vl8
	jCuBlCfPi/si+zjwyQeR3Y9cJWrZ9gBM1b9xx8fyoeQjK3HLIfGCM0lZZQWBhXvbkE7jrANKPbr
	M46IDbeW0Gnt5PnjVhfjjm4pw08OteznfsedR5X2lDeq9PtCajCrXAIc6GZDTgTs4JQzSLlQ/Rf
	3dQBKrp/w/uLCN7I5deS6XGKwk0yFv1bR+osiORo0IhKpCGqdT9y7ucEuFMDXje7720jnD2U559
	SwmQNA4Gy5cJSm0/XFq9yDZo/j989kDjU6YOURJgaKATa5osMuXMxAy8BgC/u5dNfL0arHdNrk2
	d7awOTODUIf0VqV36iTR5+GRyzMsLA4hMjTkH88Hl2PcPwyb7nBEKGe1U86A/+w5rQfyCO7BVlT
	oxQa1WSi81I3+2pSd4xw8JItIVvG+Al5FkzhcUVmclMjWb5L9EA4hkSSYivbt4tee6x/SAogzo4
	NsPBnzXzpsmx4ktH7VEZRzWOUNNhu7aKupqGoBDO5mbD6ADvZT4XZP6nMavi2oVy6n1eYwjnvg0
	KN1THWtxgVxVewF1YJSk9vLmJd6IV1t5jTzVBfk5EM8Qz8c8vaUxXkdAVnUJQTBQqh9oF6W0HQV
	979b0f3IbEuxgHQ==
X-Received: by 2002:a05:6000:46c7:b0:49d:a36c:2d66 with SMTP id ffacd0b85a97d-4abb2726975mr16248014f8f.27.1795454026521;
        Mon, 23 Nov 2026 09:13:46 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm20163414f8f.27.2026.11.23.09.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:13:46 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 18:13:45 +0100
Message-Id: <DN2RC0R0XR5C.2CL2S4LGW8YOL@smile.fr>
Subject: Re: [blacksail][PATCH 3/4] curl: fix CVE-2026-92391
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>, <bastien.jauny@smile.fr>
To: =?utf-8?b?Sm/Do28gTWFyY29zIENvc3RhIChTY2huZWlkZXIgRWxlY3RyaWMp?=
 <joaomarcos.costa@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261120172126.3187901-1-joaomarcos.costa@bootlin.com>
 <20261120172126.3187901-4-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261120172126.3187901-4-joaomarcos.costa@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 17:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250928

On Fri Nov 20, 2026 at 6:21 PM CET, Jo=C3=A3o Marcos Costa (Schneider Elect=
ric) wrote:
> This vulnerability, marked as High [1], was fixed upstream [2] since
> v8.23.0.
>
> Backport the fix to curl v8.22.0.
>
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-92391
> [2] https://curl.se/docs/CVE-2026-92391.html
>
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
> ---
>  .../curl/curl/CVE-2026-92391.patch            | 200 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.22.0.bb      |   1 +
>  2 files changed, 201 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92391.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-92391.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92391.patch
> new file mode 100644
> index 0000000000..55288d5296
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-92391.patch
> @@ -0,0 +1,200 @@
> +From 8f839f842ec95a897d3f716f7220d1460109e3d0 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sun, 13 Sep 2026 00:06:44 +0200
> +Subject: [PATCH] mime: do curl_mime_free() non-recursively
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Verify with test 3595: deeply nested curl_mime_free()
> +
> +Closes #22927
> +
> +CVE: CVE-2026-92391
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/d7546809d=
5bd548b69ec49fca26565c8f6f0d344]
> +
> +Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> +---
> + lib/mime.c                 | 28 +++++++++++----
> + tests/data/Makefile.am     |  2 +-
> + tests/data/test3595        | 21 ++++++++++++
> + tests/libtest/Makefile.inc |  3 +-
> + tests/libtest/lib3595.c    | 70 ++++++++++++++++++++++++++++++++++++++
> + 5 files changed, 115 insertions(+), 9 deletions(-)
> + create mode 100644 tests/data/test3595
> + create mode 100644 tests/libtest/lib3595.c
> +
> +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
> +index 26c72e5672..9cdc7b2da1 100644
> +--- a/tests/libtest/Makefile.inc
> ++++ b/tests/libtest/Makefile.inc
> +@@ -325,5 +325,4 @@ TESTS_C =3D \
> +   lib3105.c \
> +   lib3207.c \
> +   lib3208.c \
> +-  lib5000.c \
> +-  lib5004.c

This patch removes lib500{0,4}.c tests but this is not documented nor in
the upstream patch. A error while solving the conflicts?

Regards,
--=20
Yoann Congal
Smile ECS

