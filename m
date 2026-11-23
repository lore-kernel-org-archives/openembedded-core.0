Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54721.1795443365823713297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 06:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=oBFrrSw0;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24078275e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 06:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795443364; x=1796048164; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQN/h08TfEZADulDJ4UIDnbvg2dqMjjIgzsGuaeQXQI=;
        b=oBFrrSw0dwfo1esjK2nyNHC1husxW3dz81em2/dTFmW3FRWNRGVNOB8Rc2PG6Gibdu
         2byma+xrPhaPhF+6Rau2J2O3P4KuVxoF23kjqVU5X48jWfoog5rouzpaJAB1dJ9ylmqy
         cqOauZC0bZM2ZVXJYNTlFVd0zIovF+fP8X1dwlH0Ld4Iy7ivsZH+kE5x4VRVFaxGDgQj
         yp3gxiuGZWhJWd1xnm/M1IiT6M6W+Uy1g7wgSvkh525tu9dj/mooAD42Kvo5u64+/gag
         lhHLts6ip1b9uIjXDyBZTcA+eS7+1BWnnCL/q5tmIzTdSLwJPVchzsLRjp8NS/awlSRe
         gHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443364; x=1796048164;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQN/h08TfEZADulDJ4UIDnbvg2dqMjjIgzsGuaeQXQI=;
        b=wevKYud6oR6d2N7e/c72nfqTxogY4N1B6SIZUwDmQbZn9/eOm3NRynb5OwimdMCWWB
         8ADTDzjazj4VllhQOtYlO3Vhxa0VC/2VVYtAQDh+fGBtp5KLqCANYmtDF84uVUv0uq9X
         Ny4PiUcRRoxNRPcWUIlv2fbECaC1NopSywzptLf+hbp7U+2Dz+/2GaiyKCDVNFNDuCM1
         M+DxGkCa+cGKaiCHgNBo/jniS4LTLjUVw01BqiW3LSaFB2SYx7JyaDIDalSqGgiXmwgS
         iNafM2Sl2TzEgXLDUQ1odjv8WZc/LXHapQUUwNNYargYMOtrZakHILe3CItePA88dH1t
         tBxg==
X-Forwarded-Encrypted: i=1; AL+hErEE57g2rmPziv+e4RfI92KuKKizDC3OS9aB92TLeX13z5e64W3LNheIaH+/OUZf7WnetmqZRTMkzfHR/tLjDGeGJQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/diO/0GVpM6OvDIM0h4sb/l3d6pU02wuR5tryZJ3xO3mS2ExhM
	yVqn7nwakS3TY+xmOkatusZFfhZPItqnSrnoNqyddaPyPxkFkeZwxThIGTAyp7vPD8w=
X-Gm-Gg: AZFdTZfxU/jHNw1UUtSuwbvvQ8vMDDTEhsaHtdN1dHsszWD3ZrMZFZAktoNvdVJROjl
	cSv2ltUNvT2LGyXJoLZUJShl7DPaNlL0AB6eOsYv080A/WpzoKVwKVhiGUbti55u5n6lcigufMQ
	Wl3UtB43bV0UOP9LTmYp1nENS7vAfpK8z6IiHE7/FmqZSeU1NWiQqGn2FQHDyJ5WmWtlw2BBGHz
	CoB4EpqSNGWa6WM0409rDqXI2EMfp4FPr1bx3+hUaJBtaBNA+GVxoVvvMnR7eqe3jqfrbJBPwxd
	XT2N38iociIm2bMJjHelleVU8PfeE37mhsv/iz3DGp0F/PAcYCN6Z2IF7w0LvPcvejKPHGBVAf0
	aaLMC2OTY4QlIoCLutxH81tZoAanBOgDXdoip41NZ8HEpzTWh1EzdxVt1PkPpAUkXpSg1zncxMr
	QwG7ZkHiOW62LoiRHIYCPtjm4tJCA5VPPeSwbhA0VIgq1FWsaiOSo4eWf6R5MHJCGjfgk8ByuUe
	w34yuoB7HLzcVd4q//sktS5XJZZ25mMt5pQP/hzkfAex0BCCU+a0CkCE+wt9CduAZHNApgfNZnT
	y7VOzhO9BYteCz4TLD1JzADd9wUwd2sdoFfE0YD/Y56VCNdvfRri1XZpW6W5fFa/xF9SiNqKwJl
	EKfI3W7q3OngC2njwy+XlPEqik6E7wV6ZCjXD
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr258254505e9.22.1795443363799;
        Mon, 23 Nov 2026 06:16:03 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm24376737f8f.13.2026.11.23.06.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:16:03 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:16:03 +0100
Message-Id: <DN2NJYBRINEC.1DFZUD8E4B7GN@smile.fr>
Subject: Re: [OE-core] [blacksail][PATCH] alsa-lib: patch CVE-2026-96674 and
 CVE-2026-96675
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261104224816.2433428-1-peter.marko@siemens.com>
In-Reply-To: <20261104224816.2433428-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 14:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250921

On Wed Nov 4, 2026 at 11:48 PM CET, Peter Marko via openembedded-core wrote=
:
> From: Prasanth R <ragaprasanth@gmail.com>
>
> Backport the two upstream fixes:
> - CVE-2026-96674 & CVE-2026-96675
>
> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (From OE-Core rev: fbe75cba76c36924d7569bafc5f2d4f037c429c4)
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../alsa/alsa-lib/CVE-2026-96674.patch        | 68 +++++++++++++++++++
>  .../alsa/alsa-lib/CVE-2026-96675.patch        | 45 ++++++++++++
>  .../alsa/alsa-lib_1.2.16.1.bb                 |  2 +
>  3 files changed, 115 insertions(+)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.=
patch
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96675.=
patch
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch b=
/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch
> new file mode 100644
> index 0000000000..1060723bf9
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch
> @@ -0,0 +1,68 @@
> +From f8253a68baf9a5f57cdff1cd178920d13e5beb2b Mon Sep 17 00:00:00 2001
> +From: Harsh Raj Singhania <raj.harshraut@gmail.com>
> +Date: Thu, 1 Oct 2026 00:28:15 +0530
> +Subject: [PATCH] topology: fix uint32_t overflow in control decoder size
> + checks
> +
> +size2 =3D x->size + x->priv.size was computed in 32-bit arithmetic and c=
ould
> +wrap on a 64-bit host, bypassing the subsequent bounds check. Pre-check
> +for overflow then cast to size_t. Affects tplg_decode_control_mixer,
> +tplg_decode_control_enum, and tplg_decode_control_bytes.
> +
> +Closes: https://github.com/alsa-project/alsa-lib/pull/527
> +Signed-off-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
> +Signed-off-by: Takashi Iwai <tiwai@suse.de>
> +
> +CVE: CVE-2026-96674
> +Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/comm=
it/f8253a68baf9a5f57cdff1cd178920d13e5beb2b]
> +Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>

Hello,

Traceability is not easy on this one:
https://nvd.nist.gov/vuln/detail/cve-2026-96674 references
https://github.com/alsa-project/alsa-lib/pull/527 but this returns 404.

Commit on the branch reference pull/527 but those 2 are not the only
ones...

Can you help clarify?

Thanks!
--=20
Yoann Congal
Smile ECS

