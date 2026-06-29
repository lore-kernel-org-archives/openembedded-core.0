Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C84C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 11:53:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90407.1782734006853193214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 04:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WH/7H1C2;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4927014c0deso14123525e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 04:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782734005; x=1783338805; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQ1v9i/XIk9M9ltpOwyb0TMHsNlyyb/Pw0Rp2JtZ5BM=;
        b=WH/7H1C268HCyegDVtIO3lmUJplvtJs+x0gu+gWqWVJlKXUMx3QiQ29vInzbYFkmj5
         I8fDh3ePxhbnINMAQcPJFa6zNBRFZzs4KOe5qaAnVjhp1ehBEyvIW1o8sObUatsL09aL
         Ue4GlTsrk38NicB22y3motOM1UDljpch9Q6m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734005; x=1783338805;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQ1v9i/XIk9M9ltpOwyb0TMHsNlyyb/Pw0Rp2JtZ5BM=;
        b=Xb3j91CAQ8ssQHzOpIZRGUKy2Nsz5LUmdfyGHbcs6uglwFeDwJ/NYBsAEg8ONDWTzr
         57REVBb8U8d4QB1itAbUKMr6E0xZjcpBQCs0TLKe4D86X71w4P+cLTO++yh4sPMH04g9
         aYSsugUlVIcb+QQk83K0/3W/QF9tTG/gKR/pYupMUdOwXAyy8px6Hi5T6dfd3cyJTB3r
         EpuGWsm/ySrmDUfFF44WIxC2fmxMlLi7emyeq1sg39NP89JVG6c4TZjTaCIGgAbhNADK
         9gVX1KR6hT9PKPZsU0Mc1y/7cQ3ps62H9TgPe87KhQhSbMvjekiYqcy46DHfiMADutEw
         MnQw==
X-Forwarded-Encrypted: i=1; AFNElJ/7xC8+7siCWl/L5A51Qo/jECVGD07r6mOc18XHUsOdvEsvlgTVt18p0ktHyFsEXRrZxogp6yRelHMUWYZyoL3zkg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3bJWYvJi0kXgRa1PcA+8ybA0jIXYK9SY8yjgLNb+TnMpJl8+m
	s3iljDEYb+PAPeY4RFXR2uhENM0ZSidHUWzJT2xeV4gPlZ3she7LOQS4r7o+XM28nX0=
X-Gm-Gg: AfdE7ckj2y6dzAN3uP6/GEBSt9v4sklH97dyah2Cpnag8PZYeHtH2gXaiK2B0AWW08J
	q8IMbRKJy4OvIq3c6nm3oHub1AtU/LG1wZT2swWTdKkzcO66A9SeCe+jh5QTfjuyTx94paDCPKn
	4c1+hF18S4buA4Mn28jpufAlwOycGzQVwicYvnmirAGTPt2qnny69waRfZTnzz5nR9l6Rw/9th2
	IdDbbBXaFXOWZiy+QpzGnCqvRnE2kfYOKrKBLFcviuHRQgNIATjDekEEIfTonaa9hKHd6DxIQij
	A+UGJZ4lX6y0Mrx3C1EKkBpnCpDEqYy8rZbE/kPwH4DWmwFzMS2KxPORIHUBPoZZJmslE6hMpw4
	gJfomekqflJd5a3YmHkJDY7ZFELqFp08wkCfNHjfRhj9aZdtJblz/xdiBm/d+H75PErLy7unwD6
	o0YmGN8RYt15X6k975b8VMGZHR9/rtFMzhfFPgmroyO4vbN2ldx6yJFqICTe723ZQurqJt88q5
X-Received: by 2002:a05:600c:4fd6:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-4926684a3cbmr246546715e9.6.1782734004985;
        Mon, 29 Jun 2026 04:53:24 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c2954efsm203803985e9.2.2026.06.29.04.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:53:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 13:53:24 +0200
Message-Id: <DJLIGNIA29T0.UP5MNHAPJBCH@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH 1/7] curl: ignore CVE-2026-4873
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629104801.972184-1-adongare@cisco.com>
In-Reply-To: <20260629104801.972184-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239759

On Mon Jun 29, 2026 at 12:47 PM CEST, Anil Dongare -X (adongare - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated w=
ith
>   clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
>   transfer.
> - In scarthgap, these protocols are optional PACKAGECONFIG entries and ar=
e not
>   enabled by default in `curl_8.7.1.bb`.
> - Record this CVE as configuration-not-applicable for the default recipe
>   configuration instead of carrying the upstream fix unconditionally.
>
> Reference:
> - https://curl.se/docs/CVE-2026-4873.html
> - https://nvd.nist.gov/vuln/detail/CVE-2026-4873

Hello,

That CVE applies to wrynose, but I don't think I received a
equivalent patch.

Before sending more scarthgap fixes, do you plan to send the wrynose
fixes blocking some of your previous patches?
You can see them here:
https://patchwork.yoctoproject.org/project/oe-core/list/?submitter=3D1525&s=
tate=3D8&series=3D&q=3D&delegate=3D&archive=3Dboth

Regards,

>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  meta/recipes-support/curl/curl_8.7.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 14d63d6373..ad7ceceb69 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -51,6 +51,7 @@ CVE_STATUS[CVE-2024-32928] =3D "ignored: CURLOPT_SSL_VE=
RIFYPEER was disabled on go
>  CVE_STATUS[CVE-2025-0725] =3D "not-applicable-config: gzip decompression=
 of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` optio=
n, using zlib 1.2.0.3 or older"
>  CVE_STATUS[CVE-2025-5025] =3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
enssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d=
)}"
>  CVE_STATUS[CVE-2025-10966] =3D "${@bb.utils.contains('PACKAGECONFIG', 'o=
penssl', 'not-applicable-config: applicable only with wolfssl','unpatched',=
d)}"
> +CVE_STATUS[CVE-2026-4873] =3D "${@bb.utils.contains_any('PACKAGECONFIG',=
 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop=
3/smtp support is not enabled in PACKAGECONFIG', d)}"
> =20
> =20
>  inherit autotools pkgconfig binconfig multilib_header ptest


--=20
Yoann Congal
Smile ECS


