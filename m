Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14830.1794911518409712415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=lG3GtFvm;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9537025e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 02:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794911516; x=1795516316; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3SE6fRl80HSIKltaLY3B3PzHdwpbon2GeZVAFCaCuc=;
        b=lG3GtFvmMIjZNyxIIOzNySTWnhol72/gpFK83nKSf8clQz3Tq60ohuh/3t5S03Bssi
         u3b72zf2v7gZAONrwBpYsARa5a4Icbx3fxSJFtmTLssRgLPWA2DAQMEOQOdTTEXyZgY3
         Zx1g863kL0QugoewgovnoaTZa6AM4fZnANIX2y/qIxVRt16yz5gbyqkxcUIwfnb0UhoK
         vymMTbwRagKquvxZuLfMDjPWEPki4jhsSY+yXTeEO//TI3osRiBnZUaxajcWB0EzD4sU
         OjhtevFO14l6zYASIzJDKY8atuMzPmCs84JsPerSBksUu1n4wb7QxqOOBb8s7thSj0zE
         UWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911516; x=1795516316;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3SE6fRl80HSIKltaLY3B3PzHdwpbon2GeZVAFCaCuc=;
        b=wh42fz4OS0vfdqNlz7I0cfjdDk+onWEUIeeQiUzwf4wRgNwvi0k4fPzS7YNaM4RRQd
         ns6BbiXEL5yik8Aiumzqu4SeefcLTjaRPAkG5bH1tJtdm3BAXN516FUcWdW1XPJO07AU
         s8gk3be1KmGXET3AmroNmRhdomWjMGQP/JFkU5DxLaAIIwrkmyTJcJkxfjKmQ+P8+Thx
         5RfAUUngC0mfNNSjcHYdQFCPfgr12FauHaKJZQ/elrvwLNpgT8A3iiml54fSj4YKowxb
         i2Rp6nS6ApEruoRhtOOqWxe76we2MIdfmQinQkr2sA9g98I21obe5ZYr8mYGirk+f3fY
         Xx2Q==
X-Forwarded-Encrypted: i=1; AL+hErHFY/ZS/P/eIoBKt+m1qh0hNMUeK2jqdwigEImc9q2Qq3d3AmdJv2k6qDj8z/5rVyqqpnviuOZlq0kUUSEuL/3kQQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9UiA1+oKGYLcW0z79JzfK2ZtrbqdQ7k0VY0DI22vRZp4uSo7mU
	EVVKAskC78hw6jyfHo2Nnqzptib2AqxTWumw/c9ySE8TfPoPrp2dxH5heAb5QAcJXcY=
X-Gm-Gg: AYBFou1HaDGaqMlW5ocNmmwX3D+7xRRfcSKDQmkjjlSMBatpbezce5jyTn+RrKDqXkt
	DkSsmZssZ6av+hIPJrLCTssvrFBI8PtKE9UseGP1uTIjM4cnquJCnRsWnUgQZ/NOdmexwnvXXem
	hbuj9cVO2gPAQUcqL1+ZUfSZmC1qGkg9i6SSp65/GCLIaKvsY296/HQ2lyksmG5AnOFXNVpHrMk
	hD15TJAIUIf7nj4pYpRCRdG+Fs9E3CILdLpTqZFwToYoKy2WwpTzsph/5r+bLf3fUuT9PkeUABh
	JI+njB9SAB7FWoTHnZlTGg7ejTxV11Ow8Q857RYZLvcB1wtTN0w9eRQAoZQzfYsT8QhPYI0U8Cf
	URytIInFWxJBuJpVPfiWK10phU0xl+pMwJaetzYkKGmRryv/lC4B9XnCFipkCg7TFIyf/GHTJuo
	Uiux2Yyvc6yyQgupqLcuBcJQUvOBUq98z6pAAsIBQGdsjqMrKQemV0T7xHCYUZ6fvZMyYQaeGNA
	5Cpk6jUUXzuMqYOM2vNkMbJ8gVHPAvSN7zL7/n1mCZvlgL2lcPkSNdXqmipj5keosWAh1tQdhlC
	s/cEBzZsWdlweY4dithg6E7ghLz9jkKbfedlZZ/7sRF0yI8Lbr2G3PB/hMUHPx9V1sExMRqCaIb
	c+L34E6O0T1WsObIG
X-Received: by 2002:a05:600c:6589:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb783725bdmr52733515e9.4.1794911516512;
        Tue, 17 Nov 2026 02:31:56 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571df488sm196091345e9.4.2026.11.17.02.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 02:31:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 11:31:52 +0100
Message-Id: <DMXF11PX59DC.DCF26R7DEGAM@smile.fr>
To: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH v2 5/5] curl: fix CVE-2026-80231
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
 <20261023093331.1886272-6-dkelaiya@cisco.com>
In-Reply-To: <20261023093331.1886272-6-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250421

On Fri Oct 23, 2026 at 11:33 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Apply the native CA connection-reuse fix [1] after CVE-2026-11564.
> Store the effective native CA setting in the primary SSL configuration
> and include it in connection matching and cloning. Update each affected
> TLS backend to read the connection setting using the curl 8.19.0
> layout. The upstream advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/7be1e70cb6bcd83e130ecfe8cb91b6a7d=
cdeff42
> [2] https://curl.se/docs/CVE-2026-80231.html
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
> Changes in v2:
> - Explain the older struct/function locations and GnuTLS helpers.
> - Document that the omitted hunk only updates a flag access in a
>   later SecTrust session-reuse exception absent from curl 8.19.0.
> - Clarify that the existing cached-session verification check remains.
> ---
>  .../curl/curl/CVE-2026-80231.patch            | 225 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 226 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80231.patch

Hello,

While I will take 4/5 into my review cycle, this one (5/5) does not apply
anymore with 1-3/5 held.=20
Please refresh it for the next iteration.

Thanks!
--=20
Yoann Congal
Smile ECS

