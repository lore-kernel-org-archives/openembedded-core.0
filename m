Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.228.1793314319755460128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 15:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=dqXtgXZR;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so97319f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 15:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793314318; x=1793919118; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZFvLxLTXFSOLy/rCziO1WqAvO2jAd1DwfBnNQkx2N3s=;
        b=dqXtgXZRyiVtvlj1rT7J6Czcci3BWIOCHE88alK0YoejWJPCvHQiBXqFK+XLfKx78/
         3JHaCrpwb3bIZt7UMflX6XactJdgQr0kShjoCd/QI0AavPOgCYD6jX0b+c8BJ1/No6xL
         SkJj9ASznt6RdJ45vFjghR4lZqb2sR0kGUi4gpcjrMZ8L/bhDBm1RGm6rDwT3kc/gIbS
         qdMAaHkETN+5cm9lBmz1xWZ4VBIFAjtdYIEmuc7uQyZY001dTPwj+v6cTwu1EzIq4Ax8
         SprxNXXR5OevAFUf4m4pep+9SJ0iZ6ribbt6+LAysd+/ltppr61DondYYoOsgjzyzIQ3
         XNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314318; x=1793919118;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZFvLxLTXFSOLy/rCziO1WqAvO2jAd1DwfBnNQkx2N3s=;
        b=R0BCKaLMZ1DlI+D6CxN86F1/zgxtzGwzWnCFzqXXyZDIPy6lw9s4TEYUdY97bQtJaT
         k/m9spl9Bp/nzNmEBoKrrhNr0Mk/K6eYXeAScEe09OVhwdt9Au4IJgnKoF6i3w7RDfbL
         NddXGBDioiEgSJtuswk9s66D4+Lnr4iEte78G0hQrM+1zIyVqsNdHSsi5+OeLfs7QTt/
         6lrDB7YLXG5ufGQBI+bof1WNbm22pz6HhMuylMo3r5t2iUkBvV1mANagdqYf42WNk8po
         BTGnoxAopGsKtJhknFqJ2m0S4HEUI+T9svAozBoi35tMNfQa8RouSXG2VHE6rch9/qEj
         gMgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEUzS9SvTHMM62zsWoR24pDWHSrXlKEyWNIijncql4QhT8bQrrW9BQfw5fUmZgP5N6CNc7zdCoblQbd51YOKYGBA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKGT0o6TbcQTAs+EW4M/ARKJO2ExocevYAdlgCUWYpVjlO8/847
	kB5ihsLPndfQIUg+j+8rq5nrpkeeAAE1BqLKwkDNoq6edZwQj5DlJUK88Z+Jc8xHXwE=
X-Gm-Gg: AYBFou19IAF0vzqDEs9OaVzKj/+k4kq7n4Dg8meo2P/KZJye3d/K/2wg+4SCHXA9y6L
	MAH0RTrh521pDG2Gr1g3Pkhmr42nSPo50VBzbwbX7/7c5tBnZ4PN54tmdWsoHqXy2/CKGo80/r+
	BQMzRpxfQFosHIqG+rgAhsC+UdRQywjJzzfE+XHbgtdnZ7kvrmVymDyyWShEbRr/BwLe9uf/7pf
	WteObJJxcqJSAfTcLv0lHJjLEuAYGvs5G5ZA1HoZPW83bWios4o5PbmR/GB4llGHxLa3OYc5OMC
	w+WQQ+6f3Ml5dIPe4KmoH4NXanka8ZNlTocE8P3x0UpIexN9RHggqg4w7iFcVm+kzkrfTSScvrf
	wTzTV/xpTPS3zsFV9jH80ofyTB9yNshys4gL+70yTwz6c1l6RvpeZxxI0BzGy7zLd0lMMit1P0q
	teWCBOuLxfJEXFNlGsiOSPCe/5ZTBk7Cg/A1VDUS7FaESwmxpjODe+jxSyUQ8tOBjvT3l42Uqa8
	dCSJlkNu+FXXaZfYeScHgw0bxd+NuNdWpOMWHotpMyYKA0oQJ889CdBvqkEJKWqWKjhTzNpfO1v
	gAuw7wJS38CEKQVuPE6hsP7OwC7m45DeYjvZrtOBs6yeg//4Da31BAOoqxUdwh8F8arIJD9bQdd
	QvABDMb8VxXkHNIW7
X-Received: by 2002:a05:6000:40c7:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e6e5016f1mr1763313f8f.25.1793314317971;
        Thu, 29 Oct 2026 15:51:57 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e712c2996sm179224f8f.25.2026.10.29.15.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:51:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 23:51:57 +0100
Message-Id: <DMHOVC3580CN.26K60XV4TXQHN@smile.fr>
Subject: Re: [OE-core] [PATCH scarthgap] b4-config: Add configuration for
 scarthgap
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <paul@pbarker.dev>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261023-b4-scarthgap-v1-1-6a85c3fec09e@pbarker.dev>
In-Reply-To: <20261023-b4-scarthgap-v1-1-6a85c3fec09e@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 22:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248977

On Fri Oct 23, 2026 at 12:41 PM CEST, Paul Barker via lists.openembedded.or=
g wrote:
> This should simplify sending patches for scarthgap using `b4`.
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  .b4-config | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/.b4-config b/.b4-config
> new file mode 100644
> index 000000000000..5876a9f2691d
> --- /dev/null
> +++ b/.b4-config
> @@ -0,0 +1,4 @@
> +[b4]
> +  send-series-to =3D openembedded-core@lists.openembedded.org
> +  prep-pre-flight-checks =3D disable-needs-auto-to-cc, disable-needs-che=
cking
> +  send-prefixes =3D scarthgap
>
> ---
> base-commit: c9b000059a37241c5b97426f0aadc012b13bd20f
> change-id: 20261023-b4-scarthgap-31cd33af24d9
>
> Best regards,
> -- =20
> Paul Barker

Hello,

Are you sure there are no bad interactions with combo-layer and
poky.git?
When we started adding those .b4-config I avoided doing it for scarthgap
because of that.

Regards,
--=20
Yoann Congal
Smile ECS

