Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52283.1795434095863498568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Kc33/YmK;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1700832f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 03:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795434094; x=1796038894; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q4oF97HR9YJ8mdBQcNrUTA+3LQuQ1WMVqqGtXCc1ctY=;
        b=Kc33/YmKPq1lIXzcrjgu68AKZuSqkqzuyUDpu9zeuxIvm5n4Rz++hP9boy84xdQBuG
         AssieXcn5KnMRHrCf/g2boY1AK+iQlAhaQXRFIXKKVP1+137fs6OCZN6WsIv/QsGq2xo
         4aZfTaSsKE2IvVC7nWbW4aVbL8hnxWjTQyOC3KV0yvy5C+1UjFo4CaX4t+WvThmeNbCj
         kAjg3flErzS5eWCMQ8Xb/J9oribzrBu6Ufzj9Ll8hLnnvVb+M1VQh7zg+utA4C9UW+j6
         txEi0bqJMvkiifEq/XflSKyQNxj5UNAci5icaJeVniB9FMrhSCenuqKzn7AGtEY+1l2s
         weog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434094; x=1796038894;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4oF97HR9YJ8mdBQcNrUTA+3LQuQ1WMVqqGtXCc1ctY=;
        b=GWnIymHC4gFcW+dOGFhocUKTImi480oUzlNsDzvMv0iNv5dgPJlgHYu9ueZNg/SUQ2
         +JjqA3TcbpFNqvTDMycR3dXMxg7S+S70WEt8AVfkjz5Wa55hUFR6EpoqxiBiDssmNXe5
         stAi5gKqUpRPzf96dFRMbonb5KFq9ZunSWMSGzQU4d5G2Z/tzTc8ZtDvfS9OZS/UzYiu
         ZSdS36tFCVYnWScesu3HSr/8ON/K2bylKh+M1vjsWiFU9T6QWMDOVS36ieJ7vEsNONVd
         f5s4ZGDAR/NNW2MA9ApIbkPoOmRZoyEp2/NfeuiHONCwnRrB0M+TR2DFFoiTBy2xGHB5
         U/qw==
X-Forwarded-Encrypted: i=1; AL+hErHk1CMbHVIPBY+FIYfFVFKIFK+cnI5A3LWpwmf00LOyTzMt/KHzg0li5GAqNey4CLh5+ANeNX+/GztgWsqlG2qmsw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/eOyL9I12ccgBm1zErDFZFBWySf8DtJwYt5EG94LqnWkCcyPL0
	3djrmS40CEad5I2ewJQ7SLXvilCTHZYK5b0mkLmmhqLTc2TEk+nFnBAQjSi4M9pYgQs=
X-Gm-Gg: AZFdTZcH+fCHb4npgYMHai9GY11AChgbqLwb56UpyIZ3xNHZyUqUdLuXa5VeW0hQ/fi
	yLHgak5pJzuhekVBhPd4L5EUzEPJ/4hwrvNcQsFtHnePasI+5KKuy3kHTjTxRHQmjhRozSa1wPP
	zEfznKfMCNB2WDa6u8/ckKmJyqr4limAWiQdXxgZVHzF4v9KJWlFveTHYa2l9MuJjGWaWWkJxxl
	N1xwdFKJygA2MtpFZsVKFRu7r0mZu1vS8keXxg1Xrvxvsi8hlUuUG5omkI1zIZO3Jv1omfZnHgV
	wu8SXvx4yZy2tbm1YDczuK7ECpIFEjM9UdSNy8I2+DRA7/omlTjv6MiGDat78aomhGGBQ3PxUbM
	i1AAg6F1EUYEKo6Kbmr2FvCHrvdva9BJqcrng+F72/McJYqOmtPW2h0RJTCY89JD8p02z7Dk68g
	6oot3ok5nMNwuVsA/Cws0/FEkUZLe6iqfsGZsUmeJQ7T9zcEG/YqkEvJ+6oI1Yvr7S8AONaoUe/
	wst02+/szhiro3quDc+4aWe+cJw0ut9j8w98iXpY8BU0SUzRyfeCT9ouZ7vbfckO+5FQRA7XJ46
	Gf+UEWqRkJbJqSqGsYlsaEiAeHpqLH5GI0FzhukTgOSF2j+vaNzSFISFAr+RBXBGPNKbP4h6op9
	sd3SHnq2HG/0cJQ==
X-Received: by 2002:a05:6000:4812:b0:491:a219:8506 with SMTP id ffacd0b85a97d-4abb55183dbmr21640745f8f.48.1795434094018;
        Mon, 23 Nov 2026 03:41:34 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm20387400f8f.26.2026.11.23.03.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:41:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 12:41:33 +0100
Message-Id: <DN2K9NVN0739.1ZT0ITGNS0QQG@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 3/3] expat: fix CVE-2026-118370
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: =?utf-8?q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20261105091719.1622520-1-dkelaiya@cisco.com>
 <20261105091719.1622520-3-dkelaiya@cisco.com>
In-Reply-To: <20261105091719.1622520-3-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250904

On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport the upstream prefix and attribute-index fixes [1,2]
> identified by the release announcement [3]. Use size_t for storeAtts
> bookkeeping and reject values that cannot be represented by the
> existing public int attribute-count interfaces.
>
> Include the related tokenizer-count correction [4] so XmlGetAttributes
> and getAtts do not overflow a signed count or narrow the available
> attribute capacity before the storeAtts checks. This closes the same
> large-attribute data path; it corrects a pre-existing issue rather than
> a regression introduced by the first two fixes. Preserve Expat 2.8.3's
> PTRCALL annotations on the tokenizer callback and implementation.
>
> Validated with the full native unit suite, inline undefined-behavior
> traps and an arithmetic boundary model. A multi-gigabyte attribute
> payload and BitBake were not run.
>
> [1] https://github.com/libexpat/libexpat/commit/621cb2c78b253ee023a86bc91=
d6ddb048481c04c
> [2] https://github.com/libexpat/libexpat/commit/1bac53c4fc460a03cd9860f39=
501c7979f6750ae
> [3] https://www.openwall.com/lists/oss-security/2026/11/02/6
> [4] https://github.com/libexpat/libexpat/commit/c67cbc6185d1b494f521f2f46=
280d5982f50f2cf
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../expat/expat/CVE-2026-118370_p1.patch      | 29 +++++++
>  .../expat/expat/CVE-2026-118370_p2.patch      | 58 ++++++++++++++
>  .../expat/expat/CVE-2026-118370_p3.patch      | 77 +++++++++++++++++++
>  meta/recipes-core/expat/expat_2.8.3.bb        |  3 +
>  4 files changed, 167 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370_p1.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370_p2.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370_p3.patc=
h
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-118370_p3.patch b/met=
a/recipes-core/expat/expat/CVE-2026-118370_p3.patch
> new file mode 100644
> index 0000000000..2ad72abee6
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-118370_p3.patch
> @@ -0,0 +1,77 @@
> +From c67cbc6185d1b494f521f2f46280d5982f50f2cf Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Fri, 30 Oct 2026 18:37:11 +0100
> +Subject: [PATCH] lib: Fix integer truncation in `XmlGetAttributes`/`getA=
tts`
> +
> +CVE: CVE-2026-118370
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/c=
67cbc6185d1b494f521f2f46280d5982f50f2cf]
> +
> +Backport Changes:
> +- Retain PTRCALL on the getAtts callback and implementation for Expat
> +  2.8.3 calling-convention compatibility, and align the callback
> +  continuation with the retained annotation.
> +
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + lib/xmlparse.c    | 5 ++---
> + lib/xmltok.h      | 4 ++--
> + lib/xmltok_impl.c | 6 +++---
> + 3 files changed, 7 insertions(+), 8 deletions(-)

Hello,

If I'm not mistaken, this _p3 never was submitted for master &
blacksail. Specifically, it was not part of Jo=C3=A3o's patch:
https://patchwork.yoctoproject.org/project/oe-core/patch/20261118103042.182=
5679-2-joaomarcos.costa@bootlin.com/
Note that I've taken this patch in my review branch.

Please submit this _p3 for master/blacksail so I can take this one here.

Jo=C3=A3o (CC'd), do we need this for blacksail?

Thanks,
--=20
Yoann Congal
Smile ECS

