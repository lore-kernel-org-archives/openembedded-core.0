Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B0BCA0EED
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 14:08:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.25891.1694527688688658678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 07:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JDBlAJ0r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so66296775e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694527687; x=1695132487; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXQ40H0ooPhbrDlgHww3pO8MTT2Yx/mDqucxg6xhsR4=;
        b=JDBlAJ0rHUBw+/BgsdS+1ZEpMXYY51PTEKjnnPm4BZC6K2Jj5oWj/R+2oyYxMHO0Sx
         qE8IyKf6y/MRlaQSB4AbFXtso6I6uByzLMA6cRt8Cd0e16XRtVJoasWfSN0XNoPtwjmb
         gIX3uhuxLwGWusNFX+xAUqR3y2L1FR4bmeHiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694527687; x=1695132487;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXQ40H0ooPhbrDlgHww3pO8MTT2Yx/mDqucxg6xhsR4=;
        b=RLNNX/yJfFdpNrkhZN5MiQ/+6LpvqnhV0R7mtFsBJObMYDKyr6DZjYbRklP5XE3c9l
         SIQlekQvm9Rmr1Zoq+Rwi1L6t4OPpwYyffBXxymHYyRr4FpyZj3aVF7GT3QWgbanrJG+
         WEy/kaTmAb7XUX5NYW1E63PrsPUu8LRRNRnI14KYPj7d2i0VL21SlmkSDfTjCbluUjbe
         K5+1IZCHl5XwpMX8GowHzztKYBdr6hq6d8KL00jmI6GF4ZtDosZxNHxhP7HhQ7RDsBqJ
         Y1ZI1P51bd035G8ToKd5gHuxof/f74bY/3be2lwjWs+xyyV3lBW+I7CzpCUkA8qT+f/u
         p2IA==
X-Gm-Message-State: AOJu0Yycng2/ERCvWJL1/0bP6xDwcFvOgbTBVIY0gNgAYqFMlwUricHV
	Mxy94f1arRLg4oz27kk7OPD5JTYOf3rQJ6DP7kA=
X-Google-Smtp-Source: AGHT+IHzMNwKovDc5jCpjTKYHgVV8pGot+aCdr3kbAVXVbTBkx+0Fh480fBuzXY7RoSOpR+Yn8a4cA==
X-Received: by 2002:a7b:c416:0:b0:3fe:1db2:5179 with SMTP id k22-20020a7bc416000000b003fe1db25179mr10618767wmi.19.1694527687085;
        Tue, 12 Sep 2023 07:08:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c19a:2e97:b04:7abd? ([2001:8b0:aba:5f3c:c19a:2e97:b04:7abd])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c22c200b003fefca26c72sm13163111wmg.23.2023.09.12.07.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 07:08:06 -0700 (PDT)
Message-ID: <b07067e7ad05f94cbb34ebebb18724f43401adf3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] meta-selftest/staticids: add nogroup
 group for distcc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JD Schroeder <sweng5080@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2023 15:08:05 +0100
In-Reply-To: <20230912134347.3355-1-sweng5080@gmail.com>
References: <20230912134347.3355-1-sweng5080@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 14:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187530

On Tue, 2023-09-12 at 08:43 -0500, JD Schroeder wrote:
> This patch adds the nogroup to the staticids to help address the
> warning about changing the nogroup's gid.
>=20
> Signed-off-by: JD Schroeder <sweng5080@gmail.com>
> ---
>  meta-selftest/files/static-group | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-selftest/files/static-group b/meta-selftest/files/stati=
c-group
> index af2fa0f016..4471feb688 100644
> --- a/meta-selftest/files/static-group
> +++ b/meta-selftest/files/static-group
> @@ -26,3 +26,4 @@ wayland:x:526:
>  render:x:527:
>  sgx:x:528:
>  ptest:x:529:
> +nogroup:x:530:

I was looking at this earlier today. It looks like nogroup is already
defined by base-passwd so there is something else going on here which
means that isn't visible somehow. We need to work that out before we
can merge the other two patches though.

This isn't right as it would setup two different group IDs for nogroup.

Cheers,

Richard

