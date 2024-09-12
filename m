Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4ADEED615
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 15:22:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.50647.1726154528876247302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 08:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KhtCFxF5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so9145805e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 08:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726154527; x=1726759327; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qx077O6TReFXf4eRuOUPYMhhebEoot50Hx+26pu3kv0=;
        b=KhtCFxF56NX6wrOkxJXiU1pr8hvC0auJQ0N8iI6vtxg8eCKEq0fOoaOmx9RUSvtSr9
         Mb17JfJFbGCL4MGwYqAOEzG8hK071g6+we8quehE7VkqXHLUVkc0y1LCFEE1LllkhBuR
         MzAajg6/H1igOOqz0gVvpLKwKIfEWFq96n4Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726154527; x=1726759327;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qx077O6TReFXf4eRuOUPYMhhebEoot50Hx+26pu3kv0=;
        b=RATokwhd02FLvA5IvwfWbNS7yCqcaFkaTOvrwaVC2HThdRKYmfDD1VFCYNeq161gMH
         R+M+VdBsEkyu7iBNrNlYjE/xFtZ5mYE4RLvS3AuezR+UMR7ALgwCrdIDM2f1w7JLkWF6
         yn3rZZwGV4Y5fGPaCEfVhPZEo3pUIXWKziQwUuXjFbDr9b87kPef2oeflI3QjD0xsl/h
         8hzfO7boGEoVEbcZcRUsAx3GNlbcq8lsKQ2Q2Hivi04fpbPKvq8SQ5s4I4TCcUSmtx/J
         8hIXn5S0Ntwd8g798xU6Y/a65my7+qGyFNFCdQb2JWD//VhQVpoVr9vunz/OX6p6otyx
         aIzw==
X-Forwarded-Encrypted: i=1; AJvYcCXFMssaCGNSH3mnFGfOJtvE1Ps2c5lM8OZYFXUAaCyKGfXqjxaZNLh5NbZ+PZQgyucu/JSS+3iPf590Z3bflYP5Dw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6WIhdA2CEZ2ZhFDwJVvB9f2oO0roWeVqCxXkNVTq6AYqaXeLT
	908jnkOgmDVBRYO3ATxan+L0ehezFNBf5h6SV/GG/dj5PKXWAyxv9cq7HLL+QoU=
X-Google-Smtp-Source: AGHT+IG6eH+DafF2qksWMfW0mGt7E1rc7eNKqdmIWmvdLOQZkFQuSdKdscXhwOvHRH8fuTPrkKCalQ==
X-Received: by 2002:adf:ed42:0:b0:374:c35a:7335 with SMTP id ffacd0b85a97d-378c2cf3d47mr1775766f8f.18.1726154526823;
        Thu, 12 Sep 2024 08:22:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:de38:f6d9:2bf6:3fa2? ([2001:8b0:aba:5f3c:de38:f6d9:2bf6:3fa2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895665ba0sm14707526f8f.48.2024.09.12.08.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 08:22:06 -0700 (PDT)
Message-ID: <be3c1eed539e0568b5272bb9f0e88b49f7cb886a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3: Upgrade 3.12.5 -> 3.12.6
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Divya.Chellam@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2024 16:22:05 +0100
In-Reply-To: <20240912064407.2503089-1-divya.chellam@windriver.com>
References: <20240912064407.2503089-1-divya.chellam@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 15:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204446

On Thu, 2024-09-12 at 06:44 +0000, dchellam via lists.openembedded.org wrot=
e:
> From: Divya Chellam <divya.chellam@windriver.com>
>=20
> Includes security fixes for CVE-2024-7592, CVE-2024-8088, CVE-2024-6232
> and other bug fixes.
>=20
> Removed below patches, as the fix is included in 3.12.6 upgrade:
> 1. CVE-2024-7592.patch
> 2. 0001-test_readline-skip-limited-history-test.patch
>=20
> Release Notes:
> https://www.python.org/downloads/release/python-3126/
>=20
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---


Unfortunately "0001-test_readline-skip-limited-history-test.patch" is still=
 needed as it failed in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6985/step=
s/12/logs/stdio

Could you rebase that patch and resend with it included please?

Thanks,

Richard

