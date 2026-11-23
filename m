Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49784.1795421547603227076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 00:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=RSLpHf/T;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so22191575e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 00:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795421546; x=1796026346; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/pZeyaH2OzZKNo3vgOl1zBe7nV7lzHGuMZmVCIAc5p0=;
        b=RSLpHf/Ti6Ckvd0JpXvnWsd1lWHDW6B1m2H5uC/OJ0r4NEjCXdXgg+rVefrS9WrwkX
         ZTQMrpQlUc6jktsZXOkCVpK8HjYVGXv8M5PtCXiSEWJzD3qvl44qKDtYGKevP9zQy9/i
         3IVjlPGa5Jcu1OVwCdYYXu27QfgRxl8XdLVp16TgPEfNWJliPSIMPLsj++SqQO7StEou
         mh9dTyE4uppneAKOjqCZ0Jod1WZY6FSYkgMX/8QPjBhChiVXgpwbyicdeN3a4S/jaeiM
         Ey9KXK6KkLNpr5KXDGU6ods20UL5h1Q9Avw/PpJ/nLVO+gTZ9Fh6Jg7FBdCWJ5ZMMp5M
         K8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421546; x=1796026346;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pZeyaH2OzZKNo3vgOl1zBe7nV7lzHGuMZmVCIAc5p0=;
        b=E4gJPssZLnrOHeBIlOHKigtxRTXyCLZZUkt4RvZhHGV3Oira2UmnqdWuwewB13PXV7
         MK1fbyTVCjsU++PgPfWP6m13qqNu6N2yNbqgnEOGbcyltkku8bZuYNAr3Q2ieWr/CLun
         qD2wgF0iEeXGzWuiQY+8aEs8g7At+tOMOd1tZoWMXhKwXvDGKkVstiaOIJrnpRKZ/3Pz
         ZrtYR1bLFx2W477dw1gph/0xj3EFDEKNnzk+92+OIYc8YFxQDqxfApO/1ExJfBPkr1s0
         xzV5GOeCpU3LgLgzHg12hWYFWMyW/Rde4jTEbfRySmWHQ+txO4mR8aG4iXXnjA16KzwH
         SzRQ==
X-Forwarded-Encrypted: i=1; AL+hErF5Q0caAqxzAfP2jiGP+77ECY/AQKgKWPGSj9n60vpmsmChcKnIaDHw9te2MwAzjMYoHMTo8x5t4so3cw2ytbLJHg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/QT2Fiv0BwKzYkBPWgriEra/lN8NjsobhYY/6H/anrQTaMtuF5
	OAFYSQGjqiZiKrwWS0xsdWehZodgGCJMEBYchmKxi/EGJ+JjV2cdG6Wv6EbzzmZ2Tpk=
X-Gm-Gg: AZFdTZeIlgqIuUR6a4ZgnpQV0tiPLJFXeTCVMHOEwVzLXt0srkJ34cSqWwBZYLERMuP
	1FMSYodHtb9neXs5EOqE+n3ENpKJ59FZU8cInUTTqZLqbtikoMwqrtMfICZR6SBQ4bZc5SYUKks
	vpRmuEZAhw+NVU+PjmOh4iBfvuqLvN5MYvZt/GL8QTTaq8vcy4iMU7PE+M4msDmJcNWdAimlTY/
	ZiYoQBvc5EwwzDOrQIOYochLdyCuuUqP/8c8MyQU5Cq6zqO/oYPhtaFz7kJvNADtZUQ//l26fd4
	LdPN3cEqkybn1f22Z31IseMb5HNJc4DhOZzl3bRQnothHxCBGwF1QepyJ+F+tvXWjxpbW1MYr0h
	ZIWJJsWvh4rg90xUDsKCCrqGhFKnUSfO24R2p0txIAtOXBmYSpFGIiZnov3X92242ccisg9JN5N
	TQ96/8Futii5OI1DbDuMVXJlCNUqLPsLvaLbiJO6KUHJ7Q3kVKwLfWHl2xNyRo+2tZQcyonxnGR
	NfYWsJ5ALYpDqLFE+BhtnSZioU22cGHrveSB2O3Logmt+H7hGftSFnTO8KRIk1X3MhV98l5OyIh
	M+lS3mYCBERPHjoPADvlacQQl7kR0y5e8zyPy0FXsckBk3823zox/ofHOS2WFD93FDTYcrmnoN1
	7fSru8isGdpWSqfz0
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr220872785e9.18.1795421545708;
        Mon, 23 Nov 2026 00:12:25 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a02-8440-2602-e6f2-7643-3c6b-a6f8-41ff.rev.sfr.net. [2a02:8440:2602:e6f2:7643:3c6b:a6f8:41ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm151238975e9.2.2026.11.23.00.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:12:25 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 09:12:24 +0100
Message-Id: <DN2FTIX5C6YZ.1S2ABPBCQPBGV@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2] curl: backport HTTP/2 and
 HTTP/3 error propagation fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Jackson James" <Jackson.James@bmwtechworks.in>
To: <UpStream_IP-JJ@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261118115531.17374-1-UpStream_IP-JJ@bmwtechworks.in>
In-Reply-To: <20261118115531.17374-1-UpStream_IP-JJ@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250889

On Wed Nov 18, 2026 at 12:55 PM CET, Jackson James via openembedded-core wr=
ote:
> From: Jackson James <Jackson.James@bmwtechworks.in>
>
> Backport upstream commits:
> https://github.com/curl/curl/commit/8dd81bd5db6d087c1d0f1b0332a5e8d0ad50d=
634
> https://github.com/curl/curl/commit/5c59f91427c6e14036070d4e1426360393458=
b25
>
> These fixes correct handling of transfer write errors in HTTP/2 and HTTP/=
3 (ngtcp2)
> during parallel transfers. In curl 8.7.1, write callback errors were not =
properly
> propagated, leading to incorrect exit codes and improper stream cancellat=
ion.
>
> Tests:
> - curl ptest in qemux86-64: passed
> - curl HTTP pytest (tests/http) in qemux86-64, with curl built with
>   HTTP/2 (nghttp2) and HTTP/3 (ngtcp2 + nghttp3): test_02_14_not_found
>   and test_02_15_fail_not_found passed for both h2 and h3 (4 passed)
>
> Signed-off-by: Jackson James <Jackson.James@bmwtechworks.in>
> ---
>  ...-pass-CURLcode-errors-from-callbacks.patch |  332 ++++
>  .../lib-add-Curl_xfer_write_resp_hd.patch     | 1746 +++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |    2 +
>  3 files changed, 2080 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/http2-ngtcp2-pass-CURL=
code-errors-from-callbacks.patch
>  create mode 100644 meta/recipes-support/curl/curl/lib-add-Curl_xfer_writ=
e_resp_hd.patch

Hello,

This is a big refactor: 1700+ line patch. But the bug it is trying to fix
is unclear to me. As of now, it does not seem critical enough to me to just=
ify
merging this and take the risks of regression and highten maintenance
work.

Can you explain a bit more:
* What this is fixing?
* Why is this the best way to fix this?

> diff --git a/meta/recipes-support/curl/curl/http2-ngtcp2-pass-CURLcode-er=
rors-from-callbacks.patch b/meta/recipes-support/curl/curl/http2-ngtcp2-pas=
s-CURLcode-errors-from-callbacks.patch
> new file mode 100644
> index 0000000000..c44322fb63
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/http2-ngtcp2-pass-CURLcode-errors-fr=
om-callbacks.patch
> @@ -0,0 +1,332 @@
> +From 5c59f91427c6e14036070d4e1426360393458b25 Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Thu, 18 Apr 2024 23:24:34 +0200
> +Subject: [PATCH] http2 + ngtcp2: pass CURLcode errors from callbacks
> +
> +- errors returned by Curl_xfer_write_resp() and the header variant are
> +  not errors in the protocol. The result needs to be returned on the
> +  next recv() from the protocol filter.
> +
> +- make xfer write errors for response data cause the stream to be
> +  cancelled
> +
> +- added pytest test_02_14 and test_02_15 to verify that also for
> +  parallel processing
> +
> +Reported-by: Laramie Leavitt
> +Fixes #13411
> +Closes #13424
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/5c59f9142=
7c6e14036070d4e1426360393458b25]
> +Comment: Hunks are refreshed; CURL_PRId64 replaced with PRId64 (not defi=
ned in 8.7.1)
> +
> +Signed-off-by: Jackson James <Jackson.James@bmwtechworks.in>
> +---=20
> + lib/http2.c                    | 64 +++++++++++++++++++++--------
> + lib/vquic/curl_ngtcp2.c        | 73 +++++++++++++++++++++++-----------
> + tests/http/test_02_download.py | 28 +++++++++++++
> + 3 files changed, 125 insertions(+), 40 deletions(-)
> +
> +diff --git a/lib/http2.c b/lib/http2.c
> +index 1ee57a4320ac..50dd878bb02e 100644
> +--- a/lib/http2.c
> ++++ b/lib/http2.c
> +@@ -955,7 +955,6 @@ static CURLcode on_stream_frame(struct C
> +   struct cf_h2_ctx *ctx =3D cf->ctx;
> +   struct h2_stream_ctx *stream =3D H2_STREAM_CTX(data);
> +   int32_t stream_id =3D frame->hd.stream_id;
> +-  CURLcode result;
> +   int rv;
> +
   ^ Also, this patch is not properly formatted, e.g. it lacks a space
   here indicating a context line. (There are other lines like this).
   To help you clean this, here is the script I use to check patch
   format: https://gist.github.com/ycongal-smile/3692790a48269e59d602e5be1d=
667982

Finally, this patch conflicts with another patch from the review series.
You will have to rebase once the next series merges.

Thanks!
--=20
Yoann Congal
Smile ECS

