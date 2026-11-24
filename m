Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18208.1795527880080901072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 05:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=cTAEADEF;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso49294645e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 05:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795527878; x=1796132678; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjrrXGKag1+iQKPQefaKugBrPxFeF9zFMnyYkk4mJfs=;
        b=cTAEADEFwi2u8lXtgQsyqTOkTsOh0EEsiEh2T5eqdPLK5F7MwgusvgqYxb4Fa3jI2u
         L7UmmmVRSGkvnl5s2n4CM5cYdgKn8/yvQNqBL78ruWz+/8sb0Z+szWiiUgujH0Xd1v/h
         /w1a9KXdI3W1BeCwPm1Xn512t9dk+8NBiIjdY2ldxQEv9n+fn3kAzdo5VfrwXIIzNRTI
         KLcwcPdZ7eaLojf7vWiWPqXbxGKenfCvZFfthm6pT1xLBWSUtKoTccbFp57ov5a+c7EE
         BR/pXhka25tm2yWyCln5QSEYoEmAWt8fxpVC0swgZwFyD499Em88bzbO1Prp0QtYBGW7
         OWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527878; x=1796132678;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjrrXGKag1+iQKPQefaKugBrPxFeF9zFMnyYkk4mJfs=;
        b=ByWxQRgzCXMdwMyPgmoDJQXcwHbABxbwkJrqg3Zks7ACcmVuCxCxu8rdBDQxoYAJM4
         mt0n5WJNGadb0P3eU5BXLFu7Pjnj7Vu1dsa1yFHfXMAxIzQiNGEP3/HwVUJ3t+Iykgri
         T+XGuHTHIV/FqHv+JN4EIrOjXg1Cj/ltyMIl4aWHfhSsjCYDnRCtzxuVh6Xnua8CV+1X
         FEAERho1/TsYyInoNC1/EizBH6TQWy1zbbqktJi6Vq0TyLyBl1/YHYsgtCSkqY8CEhYv
         FcnT3xnM+dZVVu2Y5plX1O23/sdfQ1lB0+dRaEr/mDj1NT/ITQ27GdvnN3ktB1NdV3CY
         zPZQ==
X-Forwarded-Encrypted: i=1; AL+hErG2qOzTSe5i2KoUGH/FQvHMERuuNcxoKLoZz4iwBtfW5qv+f8EOF6J1HIkGs6e1RVqgm/Mv18cDMYSrGmAsmygqcA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9PA9Blp7SCrAyeffAQr9jHGcerkTAiD05Di/tAgvzEH1ljLqbo
	Y3UKE2TIpLUOgS2/z+WqEONDYnV7ww67eH+By0XJ/sgecyQIsuuVzRw8BSCnW56qTTo=
X-Gm-Gg: AZFdTZcelJn3bUuS8Z82qx7qT2IqlBdnyF9S03d6npvUEwktukhoAdF/ARDqDRlYeVl
	k9LLrOwso5+cmUA0zrhVicfg0eDJZDUfnqAKg9WCIallMnEVcR5s+xWujMMNFIu9XI5DGQqBJ7n
	qKtgxnLaoLq9F2ePeyiVKWJx0MsUEZS7CVjwqovQ/s2WjfsSHJyWvOAtZ10LbgBTB5GdjkX0Oel
	bggq1aFR2rFB3lYR9G4CLYWmoRbiG+Qvi0bzPrjdGCzyvKQfZzRnTjCWXFR7mFMhgUCP7IXHp73
	vqo99/0jNwaQHf8O5SzjdFMgJu16FCf3UozwltFES91lEEakCGpE9CDErCjPLjBdUcv8+VVe1x8
	FJkYDU3pImNwmu5jE28hHUMJ0z6J55/DlTFFxChUoECb0DOWOxMY8DQgY79nYtgfN9p1vI0dmQy
	2Wh2FvhHcaaOxEoidpSVoMdT7xewx+JvcxAUTyOomdTKQOND3T7zN303ttrg528gGvrwN+VI4Yd
	QDxDDZZ7b7CbENcLNetckm6dFnTJQCOeaYAxd0EMdKQdAIMfvWuC3jMMVdqaHGBnP+oUm3lIHY+
	gQWFxsVMK+sVmacQRR6wucI35xMc25a6MbZg/CDEaLcx9toOBBdXmboQzrIa/fDW01znHaW8gU0
	xCrQQvrPnngq12iO/xDraGFnQLzZL31kzWBWwyA==
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr297900645e9.16.1795527878311;
        Tue, 24 Nov 2026 05:44:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm466980825e9.8.2026.11.24.05.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:44:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 14:44:37 +0100
Message-Id: <DN3HIFQQI2AC.2WUSZVLDT6R56@smile.fr>
Subject: Re: [OE-core] [blacksail][PATCH] python3-certifi: correct license
 to MPL-2.0
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <tim.orling@konsulko.com>, "Henrik Nilsson" <henrik.b.nilsson@est.tech>
To: <anders.heimer@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261107074201.1995747-1-anders.heimer@est.tech>
In-Reply-To: <20261107074201.1995747-1-anders.heimer@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251033

On Sat Nov 7, 2026 at 8:42 AM CET, Anders Heimer via openembedded-core wrot=
e:
> Correct the LICENSE variable to match upstreams MPL 2.0.
> The LICENSE file and checksum remain the same.
>
> License-Update: Change declared license from ISC to MPL 2.0
>
> Reviewed-by: Henrik Nilsson <henrik.b.nilsson@est.tech>
> Signed-off-by: Anders Heimer <anders.heimer@est.tech>
> (cherry picked from commit dc95b2df65be00643f280a5ee9c885131f001263)
That commit is not from oe-core ^

I fixed it. But, in the future, I prefer no "cherry picked" message to a
wrong one.

Thanks!
--=20
Yoann Congal
Smile ECS

