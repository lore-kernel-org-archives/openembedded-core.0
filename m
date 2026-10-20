Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4458.1792491939438066964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 03:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cgl6x3YH;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1872119f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 03:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792491937; x=1793096737; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYrhNqdYbgUUUBykrZZocS8aNG6EQVfI8LjOtlaa6J4=;
        b=cgl6x3YHJ74JnRO0w22YgLAIFUH3kzMMtBMVI4SBqaveoBve7H/KtF0zSllJZgJesJ
         uLNnkegsn22yv+6e1Yz/UZTrID5ySUATqVatIPZmsXK4LMHv02nQJ5MHtVRQ9ORQgOy6
         HZ1rWhjwxUe8LuMmaH0mJamWA9jbcTH67rRck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491937; x=1793096737;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYrhNqdYbgUUUBykrZZocS8aNG6EQVfI8LjOtlaa6J4=;
        b=Z6AH/08fFQJoSVrjvmrGfCQN28xac1C0pU3Ey4S3jXGSoJw510GGwkmbf/IP5JIa/j
         st6hfftTyLOp8To/yhYCXcOcVprUk3pzsYIT7CvxLHb8iexRjrtiFPyCF6ixC5r0qQkm
         CkjX9QlyhLQdkBkxcFcS5UPklyUwWIteGAFpngrfnM7Svsv3JjwAz8om+fv3k24El8RY
         w/yRNw9khXTtuexjzTS+otXreKoJvrqjy116UwRJrRetomwMA9pFtUJ+qaqN6UFiHjNS
         YcXK15fxL4MD/kShL32U7ld+Yg89fuyqFxKDw2ykxT0BcmiTVWd1pVAXrqFRSA8XS4fJ
         ZqwA==
X-Forwarded-Encrypted: i=1; AKwUvBx7nJO2vJGTFcAE5i8gqHuoJnbYYxLkmuIAiME8Pp+kZ7yw2cgn0CzWChEkldU9TcBiycZlVhPnr19i0K9IJ95QRg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYK5uF54QfPeoj9J8HtV0K8ocifI7RW5xVrLGjMJbGLLQbrWVY34
	fKwlqmttZggEdwDZJd1QpiKUO9Hief2Xs+/G0ZbMuTfg1s8C+JcSJBudxBBtffIezmgwPbIlqSn
	YJ6YIvQY=
X-Gm-Gg: AYBFou3/ow6+Fasn42XmCpb0KbYHapz/d1s0pxpJkGSKd4VrUsQzDrUlHUV5wvNa0Nd
	onZkhCcyT+DOMSTXj+5AIjcmwziZLd6fw6uet0mqNAEu/peDMIuWFpKlBDVz86CQOWqhc4bbeTC
	7REZ+OxaRqxGbUilYEK7HotlRL8zA6v+Vr+l/jNgUSXea8sfDynPFdj4QEA0CNcjAqwd6jtDEhF
	c2ARZii98XgDHVL17TPEsukIYTAwSDaa+JV6XqZ7JQtIFwNhdYPdorooDXeecIXSSwOxbC/TAdG
	5qxhRoNqbv9iFhbsm9vKN3/fx4uZOlkznVObTJn69tuWvvUmYG+swoUS3etA82cw6VmH0++TlYO
	khV7YRKna9VLZ9ZOMt4yg5QudSUoE6jmygjq70kft9BYhJY5iV2O8D47XgPJKbmoTaD2STctLca
	lO5UOqRTl2bxnxELIa/zInKgsTHy1rK/lk2qWjmuj4thnsvOXKVP8nsKIolIbDzYM6vroPdcTKt
	QVrlmCZpr2V3mBLhHIU8bEL+4atCBiC10bO/GFly8VseTg0s2y8dVk5Sag=
X-Received: by 2002:a05:600c:608e:b0:4a1:e08e:46b5 with SMTP id 5b1f17b1804b1-4a1e08e4871mr156604125e9.16.1792491937348;
        Tue, 20 Oct 2026 03:25:37 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c242dcsm58095825e9.0.2026.10.20.03.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:25:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:25:36 +0200
Message-Id: <DM9LCZS5NJ7X.4WJWEMVY5D2M@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <yurade@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 04/27] python3-git: fix CVE-2026-67324
X-Mailer: aerc 0.20.0
References: <20261016054106.210444-1-yurade@cisco.com>
 <20261016054106.210444-5-yurade@cisco.com>
In-Reply-To: <20261016054106.210444-5-yurade@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 10:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248269

On Fri Oct 16, 2026 at 7:40 AM CEST, Yogita Urade -X (yurade - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/gitpython-developers/GitPython/commit/56806080c134=
8749b07daa4a2024ce47b3cad285
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-67324
>
> Signed-off-by: Yogita Urade <yurade@cisco.com>

Hello,

I don't see the commit reference in the NVD page.

Regards,
--=20
Yoann Congal
Smile ECS

