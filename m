Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8027.1792504404328671909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 06:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0aZB4UFh;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so40469915e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792504402; x=1793109202; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRHNszbXDN1tkezUMAf9J1LR005PV+snB9aYwCm+wp0=;
        b=0aZB4UFhNdnTZ02l3jfQk3R+5Grr1xVfiih2oSi+jg+l1LhH+3DeV8L3V3jyX3lLfB
         xb6y68goZsfKfoi5d8BKSa+T7BfNOnA0b0+feuRiqmYYWWGw4eCxSrjyR5aAsgNd4XWQ
         +iKaxY7i6OxpR64KeFXhwrx7H3tcX1wmTjWIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504402; x=1793109202;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRHNszbXDN1tkezUMAf9J1LR005PV+snB9aYwCm+wp0=;
        b=NBERujzvM6SFbNyXLLqM41MILyrzgkalids7T1KAOh1ndNSxvNOf64VgBy9NRtINUy
         AePoavZG1i8xv8LtluBQSdD1Cuj8ccLnG4+bzpHEnebb+/Ds27MD8aZk22kDVhTCtS6X
         6YGYZkg/0bW3fwNGcLMWfgXEHkTDCRmppHkPxpf3dzl2mjVcEwZveo+9xba7iPmmL0jb
         khhN6bMWP8j6BeJHculz9btw+5BnJ8lKrfTpVhr4zLi2/85c5rKLkUGUi2cA6VpJilHr
         NDKRrlx+NcEGF2nXZsNFxSZ8R3Mla/VPrxnKne9Tcm4iPcDH/HEXd1dma9/9CmlcStMx
         OU8A==
X-Forwarded-Encrypted: i=1; AKwUvBwl09ad3ttV6FLUFqNxVbAFAjbyFaYTaj2G44z/ztU8BTIirbhNzMlfTJ0vdLi3UESJtzqqC1KV2ol/XwwBLsj9fg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJ6eY5dyXJBRShkJfVVi4DfhYDcfNrH+X1s2HfU5Dmu+WEw6w9/
	4DYTSv3TI/APo0iSl8eZnMtJFz4RoEPQ8CzOq8J+PdA0s4z3gavpLUJxMbSMwva972Y=
X-Gm-Gg: AYBFou1R8DpWG53znLSfGAg0xU5vrgED6EGKeOYrcs2iDLcCHFUk8Mf5SCG2oGSUy7t
	zwutvrq8CL9TBKWAa0R7Qit6UI+rYBhoj1qaEJuc1EtFK6M0UjEvNxI4X1hdeIrmOBzkVwtCDs4
	bsxyJR0Er/vuIQOZYdYk4FQN7TTQdjMckYhZ7VWgEG2wdY4sn6T/dbymu9c/tRUR65aA80MAiYI
	1L5+So/yNQE0UpNtMf9gv3DKoTAbvwyRR+vyHRFA0f7jrmYeA14/aTMQ8CxKIHJlhCd49EjCvnA
	BPZ3KMBouuaRWrSx4Us3RFNbgoHrKikuTa+p0IFtiAgLCuWD+2wdnGa76WiW6rDmq8m0VLbcTh/
	Fu0qBBpzlVmB338odRv0jok2DGAjSr/eWMxsx59e6CzlKHu+0GLA0Hj8pO8y/lDGiHAK7YuE8lu
	q51IDmIfWdLPNbZPzIq64fqDPI6MXY09kbihNM38fCm+kWvRkg4qLbfec0jGrh9FrYqWAp13CGJ
	+BmoLgQG7P/s+5lR1CaQuYNIXyi9LA3gdiIoZMkVonzT6/cXc+3QnOf2AU=
X-Received: by 2002:a05:600c:870b:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1d7608614mr211577235e9.15.1792504402269;
        Tue, 20 Oct 2026 06:53:22 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e701f272sm71083115e9.1.2026.10.20.06.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:53:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 15:53:21 +0200
Message-Id: <DM9PS1WEN3IK.2OL0OY55EBHO0@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 2/5] curl: fix CVE-2026-11564
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261019064320.3978613-1-dkelaiya@cisco.com>
 <20261019064320.3978613-3-dkelaiya@cisco.com>
In-Reply-To: <20261019064320.3978613-3-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248292

On Mon Oct 19, 2026 at 8:43 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> Restore the upstream native CA and proxy-origin comments while
> retaining the curl 8.19.0 option-completion API.
>
> [1] https://github.com/curl/curl/commit/d69bfad3fa3daf5e72331f68706676078=
28d5891
> [2] https://curl.se/docs/CVE-2026-11564.html
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../curl/curl/CVE-2026-11564.patch            | 132 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 133 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11564.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-11564.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-11564.patch
> new file mode 100644
> index 0000000000..539236228c
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-11564.patch
> @@ -0,0 +1,132 @@
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
> +- Retained the curl 8.19.0 auto-client-certificate behavior because the
> +  later initial-origin tracking API is not available.
Isn't that a vuln in itself? Something like certificate confusion?

Regards,
--=20
Yoann Congal
Smile ECS

