Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325CFCF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 10:04:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.51204.1727690657063641548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 03:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hLr6bgOv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so51631335e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727690655; x=1728295455; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CkCt2S8yuZ0OWc6fIRSLBsu4hTqrINdN0kzUoXO/5RI=;
        b=hLr6bgOvPWHZHl3/f0t2eo8RhzZpitsw/Kf5++fC9DXFb9F823pcNqBtMql7kmr+QN
         peOuLu9vtOkYMkJ81d4GNXIev+KJYrG0ioXTXOm5N7H7MYBLBzyLf4jKOPc0eHPtcrEo
         /VqkIreM60r1xIQ38BPKq6WFYh7LhIptiFjJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727690655; x=1728295455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkCt2S8yuZ0OWc6fIRSLBsu4hTqrINdN0kzUoXO/5RI=;
        b=MmkmSTKgVwtSdvLJ8VuPcL/+tIjIamOIBnJ8ik8yViiYKvb5YQRPO9qXGa3mpKeG1h
         8woYi5v5cv8ZuWQEPNDCaM7Mo1HPy4jBJ4qyYCeT468MFNUu8UgLwKGiFNE+Oa97yZ4/
         l79NgIPWK2aX7yg7d27JdJ4PTx4vOnp3jvq3WE0F7hzHn3HKSGfzDYhiCSA16TQcbZpG
         weneidwzQNtsPQcGSoeysaq5BHH2q18gaj8hIlXbClmHRze7xJP4Cd3ziNQwA4MOlDGt
         P+irodGxKZRdjFwfiu0iIRqYbZQQvbA+rSODvlvg/3SfZ/HPtA+ALw57atY0TDl+U44x
         YC5g==
X-Gm-Message-State: AOJu0YxcrFATHjDfQcLE68VqmE4a79yjtYEP/tlD5TcZBeEkZYZWJ+Zs
	ynj7hqFi5p0TefRt0xKUKPoTm5MW3vumuiSAWvuHbqEW4IVDLnjp9vo2fpU5Y9g=
X-Google-Smtp-Source: AGHT+IEr58TtQ+nti17c44cvo6xnHWNoQFEFQbOa4mfTinc7l+S9PkMnsRPA8EeX18Y96+W0/YXfGQ==
X-Received: by 2002:a05:600c:1712:b0:42c:c8be:4215 with SMTP id 5b1f17b1804b1-42f6b1a2b69mr25111315e9.4.1727690655318;
        Mon, 30 Sep 2024 03:04:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbd1:92ec:a53b:af7d? ([2001:8b0:aba:5f3c:bbd1:92ec:a53b:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565e479sm8571522f8f.37.2024.09.30.03.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:04:14 -0700 (PDT)
Message-ID: <65fece89c560e7c11f2c9ba4780d294642102f2c.camel@linuxfoundation.org>
Subject: Re: [PATCH] ffmpeg: Add libswresample to CVE_PRODUCT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 30 Sep 2024 11:04:13 +0100
In-Reply-To: <20240930073632.23711-1-shin.matsunaga@fujitsu.com>
References: <20240930073632.23711-1-shin.matsunaga@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 10:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205110

On Mon, 2024-09-30 at 16:36 +0900, Shinji Matsunaga wrote:
> Currently, CVE_PRODUCT only detects vulnerabilities where the product
> is "ffmpeg".
>=20
> However, there are also vulnerabilities where the product is
> "libswresample", as shown below.
> https://app.opencve.io/cve/?vendor=3Dffmpeg&product=3Dlibswresample
>=20
> Therefore, add "libswresample" to CVE_PRODUCT to detect
> vulnerabilities
> where the product is "libswresample" as well.
>=20
> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
> ---
> =C2=A0meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> index 9e60b5cd23..d80fe03794 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> @@ -190,3 +190,5 @@ INSANE_SKIP:${MLPREFIX}libavutil =3D "textrel"
> =C2=A0INSANE_SKIP:${MLPREFIX}libswscale =3D "textrel"
> =C2=A0INSANE_SKIP:${MLPREFIX}libswresample =3D "textrel"
> =C2=A0INSANE_SKIP:${MLPREFIX}libpostproc =3D "textrel"
> +
> +CVE_PRODUCT:append =3D " libswresample"

Please just use +=3D, there is no need for append here.

Cheers,

Richard

