Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED4DC3DA4A
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 06:41:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.4002.1722667267785918713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 23:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e9bRMjwJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.176, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f15dd0b489so21849711fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722667266; x=1723272066; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzo44B6bHNM1UnQxfz/TFD91h/MdE6U+rxE2hTV9AIo=;
        b=e9bRMjwJhHfHI8l2lowKRFVKan++ce/2oHA4aNjH2gBHpIywN0sgoKx/drh2v8qRy0
         KDzpNFkjM2nrA/CokbZDQu0LijMMh3oEmrQ4EXg2/XMHsUmCzxAdCTDcIFF+zqTLs4ny
         RPwkxN8/s1PVzYUfULXNapxOKQO/KxZpYcm0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722667266; x=1723272066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qzo44B6bHNM1UnQxfz/TFD91h/MdE6U+rxE2hTV9AIo=;
        b=w77LYTRJdAuRJsR+pK8K3J7l4qEZX7EgY+0maTzljIdJirwwLr6rg2OYGET8xNOIvX
         Ro8yOc7PZgbKsgYyxA5zmKbBSgm2Newou43J9YCdf00hurBOiS/0hggSB8Wlz/glVfOD
         ftp6wqp/aoEvb9WoF0vQpmjLVFKj9XQY7Uf+9KNEAm5mwm9nIvM843tg3SR7Q7K/bGaP
         fqUK08avRGCTlprMKKx2LmBYLc93X6+oe5+25gUKfmwEpsQeMJgNrsXAcGUijSoQ93+C
         X3tW/446hvJddjoNLW9OGuUyJ3E0TZiRzD9ICl3feqn2cZbIT6M+hxgBWbv5c7fuJv9y
         lyQw==
X-Forwarded-Encrypted: i=1; AJvYcCX9NqDTJLC/hbjuYnKFCom4/SYB9ipS3EsLg4dW1g2c49dH2/XSVo77bf/09IeftdUjUOLAqBqXIWLWmZTGBuAfSPT+RZ40X8ukIjxGP74CQbM7Lym2TLQj
X-Gm-Message-State: AOJu0YyzAR7JgEL30ptEk1QM6hx+tqOoRkuSUy4GW/XSJey5Ew1zKUgT
	o4tCsyQEKR3sV9DM4xunJN3NCbYpNYxyGFfEsPQNjXkrsirqF6n+hVQOcMEfqWU=
X-Google-Smtp-Source: AGHT+IG2PGfRHO0DiXObbQPvHya4UktgPyrXN8iOdXutWHax7rDa+I4LFi8v5vdg99MElHJAy/3KnA==
X-Received: by 2002:a2e:3c18:0:b0:2ef:251f:785 with SMTP id 38308e7fff4ca-2f15aa7195bmr35010451fa.1.1722667265639;
        Fri, 02 Aug 2024 23:41:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9e27:8cf1:6607:747c? ([2001:8b0:aba:5f3c:9e27:8cf1:6607:747c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b89a86dsm116945515e9.1.2024.08.02.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 23:41:05 -0700 (PDT)
Message-ID: <2088c6988f3248242a391db34289295c21490a20.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kea: upgrade 2.4.1 -> 2.6.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Date: Sat, 03 Aug 2024 07:41:04 +0100
In-Reply-To: <20240801171848.3102197-1-tgamblin@baylibre.com>
References: <20240801171848.3102197-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Aug 2024 06:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202932

On Thu, 2024-08-01 at 13:18 -0400, Trevor Gamblin via lists.openembedded.or=
g wrote:
> Refresh patch 'fix_pid_keactrl.patch' to apply on new version.
>=20
> Add an extra sed call to do_install:append() to remove a reference to
> TMPDIR from ${D}/usr/sbin/kea-admin.
>=20
> License-Update: Update copyright year
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 fixes the sed call so that it adds the right
> '@abs_top_builddir_placeholder@' prefix into the resulting string,
> matching the other variables found in that part of kea-admin.

There looks to be a multilib issue in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6252/ste=
ps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/9165/step=
s/11/logs/stdio

Cheers,

Richard


