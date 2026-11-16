Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30506.1794844298477743920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 07:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZxlGM/Ay;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so36403645e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 07:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794844296; x=1795449096; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJGR9PHypdLZBKVkfh0t/xi8HDibCTX51VShbVBK+ko=;
        b=ZxlGM/Ay8o6FSQB31aZ6jsgcj76S33YJJbWiIAZOiGMmukohZAqOzQ9iYnHCChWYXD
         MTw3D5YOPb+A/9srawyI/QgGXDS7736f86+YqO923ocMGvi84I212ZNTVq8jHp6fBd6M
         dzLIpXLnKcQc7b8mmfbdxomZIEGmf97hbZ1QYJtwORYCr9o6hoeV2aQYh7BcDB+kXSqh
         KKt3HM1OfgBDJltaxNs0jkFjNIVS6NGWEzaK9ogSA6afTUuWAMbJ8Y1zjNfBkVuWiKm1
         DwgKa3G3jgBCHHwLOQlB6RBMYtSkXqa92u6G9EcTdu2I84e81/QXcCRfK8KBXpGTxuSz
         H5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844296; x=1795449096;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJGR9PHypdLZBKVkfh0t/xi8HDibCTX51VShbVBK+ko=;
        b=e/iuP7NlBWI4DXmynFV15Cb5q8SUYW8tIia1nB4fDyZOxoL25I3VGN53QlStkhjTLC
         p1E05adXe8XShnfbDfEXWTibLASUYlSclynrzMhDo67OY7xqcjjProSxOXOYi64L29Ed
         +pa4ffq4GKusWR3M7TbHvvWdsyM4C8nJZW0T7/gghzGp+pdAiFQx0JwTcf3DtYQPrLZT
         lKemB9WkYoMdkvquZ3cgD4GdLg7k7T1lj8JT9o5hyDNmv7gEE/ojstNiCLwvjbiK065b
         PrFqXSxs0+voXyQznr4t1bKKNCtKwzkv4BiT8BiwkPLYrzEsa0BoalflrRkq7dbSfi/Z
         1NYQ==
X-Forwarded-Encrypted: i=1; AL+hErFDch6jLC/1ktYGJ+/W3fTtKteNk7hyHrxHRBoTVaKTKCpIaFlzhy9ev2KOmL7AzMjLX/lMjO3YEzyQrPVgVlVyqQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+FadWSHnU2bFbgbXDggQ1WlzCI+54wNyOX4unMnI1TGakBYXsC
	czD7XIC0z4AB4dmA7YrLfeOcLr/wz91Ns8uRqtpUGr61fhgm7YrvP+6ICzUFYAky2Rk=
X-Gm-Gg: AYBFou1hIQB8Vxg6wEwDPYHktXQCIWZ4C4YnJwQEVL8UljQuVW7Uq5rTMzTOeBj/kak
	AdtXqPeG9001SexJnxQzKLfwhFWIy3+wBKPp5Irvv+rG0oA2OGvf9ZOMukFQLvj9NBNkGKCBSmT
	JGiEkEU9AeIHQE6wD0Orf3DtcLeblvUu+HH/ERGkxMYTDQXAyNWPTKt09n0BHNIpQnuAk2swtQ2
	IC38Qqstfj5cMR+gtUddv/061hfq7tiIDkdz6B05OTKPLQA4G7uVRejqCesAV7uPWNUNdYCXyga
	iNl5m21gZGi0Ae7okOw2Kh1SLwt6GdUixe9ooEhUapdpnSGEUqTrtnYfYpUFOjlkVj6JkGJvzkA
	qtrKy+3eSDE/DBQ77G068M0lmTudHCinhvxQnwFu+nf7vjLth+IAoZOJOHREAAfdpQrS2KiHzkb
	yLbLCjvhG49LP+GEjAEubnaSi6JkI8fA+Y8FAJ/AcgsyxkMJDbZRkChH/Qra43WEOTe3mkXOo9A
	zFWHbYFL/5YMAGiYWknm5y3FfXbze+xd/WrM7Jv+lqYTdl3NyqSyWmTdyc5H1CkYSc1R/op59NF
	7tflQ0K59MH0ZnGd33ZxdWjl5IcCPiX9kInPAKbjFHFtboraSdwNmai+gWXkydwTSHywXozUUBs
	zqGHAD55W5rwU3g==
X-Received: by 2002:a05:600c:3d91:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb686166e8mr135100585e9.21.1794844296453;
        Mon, 16 Nov 2026 07:51:36 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb729b2801sm79988365e9.5.2026.11.16.07.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:51:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 16:51:35 +0100
Message-Id: <DMWR7AJXCNJ1.105TD3KM0QL29@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v2 2/5] curl: fix CVE-2026-11564
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
 <20261023093331.1886272-3-dkelaiya@cisco.com>
In-Reply-To: <20261023093331.1886272-3-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 15:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250349

On Fri Oct 23, 2026 at 11:33 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> Retain the curl 8.19.0 option-completion API and existing opt-in
> automatic client certificate behavior. Reset native CA options per
> transfer without adding the newer initial-origin restriction.
>
> [1] https://github.com/curl/curl/commit/d69bfad3fa3daf5e72331f68706676078=
28d5891
> [2] https://curl.se/docs/CVE-2026-11564.html
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
> Changes in v2:
> - Clarify that Schannel selection remains opt-in and disabled by
>   default, preserving the existing CURLSSLOPT_AUTO_CLIENT_CERT flag.
> - Document the per-transfer native-CA reset and omitted newer
>   initial-origin restriction. Schannel redirect behavior has not been
>   runtime tested.
> ---
>  .../curl/curl/CVE-2026-11564.patch            | 139 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 140 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11564.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-11564.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-11564.patch
> new file mode 100644
> index 0000000000..86f0181630
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-11564.patch
> @@ -0,0 +1,139 @@
> +From d69bfad3fa3daf5e72331f6870667607828d5891 Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Mon, 8 Jun 2026 10:11:30 +0200
> +Subject: [PATCH] ssl native_ca_store: always reinit
> +
> +Add bit `native_ca_store_opt` to keep the setting of
> +CURLOPT_(PROXY_)SSL_OPTIONS and use that to calculate every easy
> +transfer if a native CA store shall be used or not.
> +
> +This avoids `native_ca_store` getting stuck on TRUE after being set
> +once.
> +
> +Closes #21902
> +
> +CVE: CVE-2026-11564
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/d69bfad3f=
a3daf5e72331f6870667607828d5891]
> +
> +Backport Changes:
> +- Applied the option-completion helper to lib/vtls/vtls.c because curl
> +  8.19.0 does not have lib/vtls/vtls_config.c.
> +- Kept auto_client_cert derived from CURLSSLOPT_AUTO_CLIENT_CERT, as
> +  in the old set_ssl_options(). This preserves the existing Schannel
> +  opt-in behavior; automatic selection remains disabled by default.
> +- Omitted the initial-origin restriction from the newer origin-aware
> +  configuration, introduced by [1].
> +  Curl 8.19.0 has no equivalent origin state. This backport resets
> +  native CA options per transfer without adding that restriction.
> +
> +[1] https://github.com/curl/curl/commit/d3391229b0a0eb04f1ffe85f1483a890=
c5e00009
> +
> +(cherry picked from commit d69bfad3fa3daf5e72331f6870667607828d5891)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + lib/doh.c       |  3 ++-
> + lib/setopt.c    | 20 ++------------------
> + lib/vtls/vtls.c | 21 +++++++++++++++++++++
> + 3 files changed, 25 insertions(+), 19 deletions(-)
> +
> +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
> +index 6dcc67d..35cb4f0 100644
> +--- a/lib/vtls/vtls.c
> ++++ b/lib/vtls/vtls.c
> +@@ -306,6 +306,22 @@ static void free_primary_ssl_config(struct ssl_prim=
ary_config *sslc)
> + #endif
> + }
> +=20
> ++static void ssl_easy_config_compl_options(struct ssl_config_data *sslc)
> ++{
> ++  uint8_t options =3D sslc->primary.ssl_options;
> ++  /* If set via CURLOPT_(PROXY_)SSL_OPTIONS, we definitely use it.
> ++   * If not, we switch it on for supported backends if no custom
> ++   * ca settings exist. */
> ++  sslc->native_ca_store =3D !!(options & CURLSSLOPT_NATIVE_CA);
> ++  sslc->enable_beast =3D !!(options & CURLSSLOPT_ALLOW_BEAST);
> ++  sslc->no_partialchain =3D !!(options & CURLSSLOPT_NO_PARTIALCHAIN);
> ++  sslc->no_revoke =3D !!(options & CURLSSLOPT_NO_REVOKE);
> ++  sslc->revoke_best_effort =3D !!(options & CURLSSLOPT_REVOKE_BEST_EFFO=
RT);
> ++  sslc->earlydata =3D !!(options & CURLSSLOPT_EARLYDATA);
> ++
> ++  sslc->auto_client_cert =3D !!(options & CURLSSLOPT_AUTO_CLIENT_CERT);

I'm sorry, I'm still not conviced that this change from upstream patch
is safe:
-+  sslc->auto_client_cert =3D Curl_peer_equal(origin, initial_origin) &&
-+                           !!(options & CURLSSLOPT_AUTO_CLIENT_CERT);
++  sslc->auto_client_cert =3D !!(options & CURLSSLOPT_AUTO_CLIENT_CERT);

The fact that the function is not available is not reason enough to just
omit the call. If the function is simple, maybe inline it?

> ++}
> ++
> + CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
> + {
> +   struct ssl_config_data *sslc =3D &data->set.ssl;

Regards,
--=20
Yoann Congal
Smile ECS

