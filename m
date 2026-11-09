Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1859.1794243483920520784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 08:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=j9Y66TCa;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6683365e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794243482; x=1794848282; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmWvUQPdU9BV9uGcfEJ0+WMAPZTxH9BJINaNrzjZe0g=;
        b=j9Y66TCaGDHYRItLK2hX9W9zmtTIvIus4f1JIm4nRX4I++/uzpnZXc0KN2UqjmsOoT
         jAsqRbuuJ3nya4MxH0CRTgh3l7TKZ9vBTD/r1QtgZtItWgTxU82u/n+OIdDoBErYrKyN
         MnnQp4kd5k0tUz54EXT3/ucMh+eAvgGfbMlHoq5a5yc1ipTTgFpzuisaGaBPauOrOxZ9
         qQRNhxjgO8bu5iKonKtmDlVRC+YOJvlYIxARFd6HCLppY7pIj8CktF1hQ4UjL3f2BUpL
         GvJfx0HM9CeH3v9AHHE8Dd1YPwFeiE1/7gcYZT8Ehg236GqyZj9lDHkREOjsVVJUhj2Z
         trVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243482; x=1794848282;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmWvUQPdU9BV9uGcfEJ0+WMAPZTxH9BJINaNrzjZe0g=;
        b=gltIS81UVYdBWMver5wpXUEL5pbFhJdbzPsd7vqv0emUIWrGJ7JLcyNJQyT0DPJ9UI
         9PIfMRH0wSstptFxPzueo24NDXBOyVFBMkw+GAAH/AVqQmgW7KInsp5kZ1R/R2EpAoak
         NdU9I3iMdLbrqhnpj5uxqbde48k4sf0A0q9/Yhhf5/6q+bg4Y/a2FZCq9ikvBYa1Sisz
         Dgkgm7RLWBjsqaD3ZhKFG2HKL635kT6+e+Ul8xLzq7zJAIaDf1TL4Kb9IDVZmCclGXDL
         HzR0/ijxaIe/47tlgk3iMnCKg9T7mVj3WwgALTOt8ZO00s908fanyTP6UT9n9XYv49in
         XzRg==
X-Forwarded-Encrypted: i=1; AL+hErFcoQ8/ClQKLMVNKm8rZF/vOxG/Xe+tbiqzKTMPYNN2tYimgEk2vHwo+4/e0Tpm7H379JwShjFnpWmhsNWPlXceeQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+7ar4h1Bpre3vOwIxd4lKQQUg2oSgqiXCo0cEZPf3WxJe4USl1
	vhT4DKJbRgw1Yj9wsEHe/MXz8uecUwfrbmBQoAsTd2G5swk27DFv1fchxtJF4wJDMrY=
X-Gm-Gg: AYBFou2G+k+lbaz1UvuPuJVoxh/QApNQ3dZEQJNucflBxHSHn6NArNl1/6WnT5eGsUN
	RbT/aYLzhJ+8Mcs30+48Z8KCOaj5DX3mrFlgp0xdhN/7X6wa4y3jRVrrCJx9NGpRVb6wuEs+mbX
	rQ2gaE8fs64eKiE+w3lW5QsWg96lIXKtKO5oTIczpJcBOR5GzH+RsnqLnkFoYzhUQWqxrpNLaJi
	yDp6eHRUi+/PAOsjL6CAtqb3Xu/mABxerLoejRc0qfwg5xhwAQ/bZxxA45/5pfIbPrDcj1N7Nz2
	ZbU9T2QGY6L18LdhjiW9nYFqdfajie7/MTx9XHvX4FSH5DniWLbCUIWdUYmxCwOhqM2dis5mI8w
	Xt6sq59vNIUI+qBfhL0F8q2yx6l+DYwRWEWimmy5nq3Vun68X5s/cIfGpDylCxtVrM2Y2GVkTGj
	526uiLjNTJkoY4W1lsTWUJZ7Zu4d4NN/DlJwHjtFYVRbRuUVJQwMjcAIAiyz2IWTnqH9e8etQgS
	1ZGyJMD4tZNjzhOs+FGEQvUnZeUFsZB3n565SYFQGbMoaKVXEO1x6nyTn1wkvvP8fHS9YWPxGN/
	HsMCE/vqFS23y/Zr0O5AkSwj3xbdCIBYCDsdURy/N/UnEPlwnkODT3mFhOnCWhqrengBqVDkcBR
	yMvEORlYNOyQOIQ==
X-Received: by 2002:a05:600c:310e:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4b963c70cb2mr82906935e9.18.1794243482047;
        Mon, 09 Nov 2026 08:58:02 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm22435f8f.3.2026.11.09.08.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:58:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 17:58:01 +0100
Message-Id: <DMQU8C661EIP.20I8FSF0VPP9L@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 1/2] dropbear: add follow-up patches
 for CVE-2019-6111
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261023192914.159339-1-peter.marko@siemens.com>
In-Reply-To: <20261023192914.159339-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 16:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249861

On Fri Oct 23, 2026 at 9:29 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick additional patches referencing this CVE from 2026.90 or 2026.91
> releases.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../dropbear/dropbear/CVE-2019-6111-01.patch  | 364 ++++++++++++++++++
>  .../dropbear/dropbear/CVE-2019-6111-02.patch  |  43 +++
>  .../dropbear/dropbear/CVE-2019-6111-03.patch  |  34 ++
>  .../recipes-core/dropbear/dropbear_2025.89.bb |   3 +
>  4 files changed, 444 insertions(+)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-01.=
patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-02.=
patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-03.=
patch

Hello,

Should'nt we also backport this commit?
https://github.com/mkj/dropbear/commit/16ce059ed8e914e210af67e199041943ec74=
7034
| scp: fix recursive overwrite check
| Non-recursive transfers were incorrectly disallowed to an existing
| destination.
|=20
| In addition, the destination check logic was wrong.
|=20
| Fixes: 61bd0e3 ("scp: Disallow -r to an existing directory")

Regards,
--=20
Yoann Congal
Smile ECS

