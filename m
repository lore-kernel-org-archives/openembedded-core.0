Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6345DC61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 12:39:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.89884.1700743153756543007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 04:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DKivSQCE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so486980f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 04:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700743152; x=1701347952; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLI7p0CUCfh5inKMGz3GB8A2AzZK+FIQmeHt3quunTk=;
        b=DKivSQCEniVjofyrO6nIc0qq2M1N8m83Wbc7STcyL3b9pybNwpNUfv7kRLCjNjts0R
         SKKxvSl6XkXs5YGPA7jdIretJAc8oHdGDQu/o6p+HeFY6E9oy0W1CyY8CASd4+2jKX+O
         fgONgr1vLDEqXzpYdITirSM+uRP9AWo7TIWKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700743152; x=1701347952;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLI7p0CUCfh5inKMGz3GB8A2AzZK+FIQmeHt3quunTk=;
        b=qDP9aGR6GC2TWN306Tkv5ztnshxsouVmWQeEsrfhYBKsfXvoEBwDm75E2z7u9FBNSu
         Febqb53RAnIVAvZAnr/h4QliwCD3MpQKcCQAGE22IBapIGRYhqDjOiLCTNlu1T8ffCYZ
         7chAL0SCpDYDib+KqMU5ETtyxVhMvn5R2l6+gFprJ7uRgPf3AuKKjCUZBqz7CzUE1N1b
         XXdF8HUuz2KGDx/h0/fUMp/Mgc8QyXZ2KwZ8NmfJRF0ZXlIeVbcqzG281UxkurUPu0u9
         w2zEOmhMXMQVdy5IZFHaQw2ksaXItSH8jfTCFCI1zrcH1cx2XXAGyEm7IYdHuZjYLT4l
         6I7w==
X-Gm-Message-State: AOJu0Yw0MNboVAJTRGq50GoJYm4A5ziZZKdyYkW7IzTV0wkMKiTt6fOL
	hwtSBRZzDF4tq30FdeFrI8ZNMQ==
X-Google-Smtp-Source: AGHT+IG+CRZlixlJgzKaqap1MWUjsNUjK7gcBRKNpOQ4n/j4U0jz/q5oKpvFnbOWfGF4mnGJP33+jA==
X-Received: by 2002:a5d:6b4b:0:b0:332:c12c:367c with SMTP id x11-20020a5d6b4b000000b00332c12c367cmr2169735wrw.30.1700743152086;
        Thu, 23 Nov 2023 04:39:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c4e0500b003feae747ff2sm2619463wmq.35.2023.11.23.04.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 04:39:11 -0800 (PST)
Message-ID: <c54ab4f4e673b355bb0ee37bbf2d33c6dc0565fb.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 16/16] libxcrypt: fixed some build error
 for nativesdk with mingw
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2023 12:39:10 +0000
In-Reply-To: <ca4866d14f725ae6c99c6651a69333d9453713a2.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
	 <ca4866d14f725ae6c99c6651a69333d9453713a2.1700620126.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 12:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191143

On Tue, 2023-11-21 at 16:31 -1000, Steve Sakoman wrote:
> From: Wenlin Kang <wenlin.kang@windriver.com>
>=20
> Steps to reproduce
>   1) add layer meta-mingw
>   2) add line in local.conf
>      SDKMACHINE =3D "x86_64-mingw32"
>   3) bitbake nativesdk-libxcrypt
>=20
> Fixed:
> 1. .symver error
>   | {standard input}: Assembler messages:
>   | {standard input}:4: Error: unknown pseudo-op: `.symver'
>=20
> 2. pedantic error
>   | ../git/lib/crypt.c:316:24: error: ISO C does not allow extra ';' outs=
ide of a function [-Werror=3Dpedantic]
>   |   316 | SYMVER_crypt_gensalt_rn;
>   |       |
>=20
> 3. conversion error
>   | ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_by=
tes':
>   | ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 'si=
ze_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-W=
error=3Dconversion]
>   |   140 |           ssize_t nread =3D read (fd, buf, buflen);
>=20
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../0001-Fix-for-compilation-on-Windows.patch | 37 +++++++++++++++
>  ...dom-bytes.c-fixed-conversion-error-w.patch | 47 +++++++++++++++++++
>  meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++
>  3 files changed, 88 insertions(+)
>  create mode 100644 meta/recipes-core/libxcrypt/files/0001-Fix-for-compil=
ation-on-Windows.patch
>  create mode 100644 meta/recipes-core/libxcrypt/files/0001-lib-util-get-r=
andom-bytes.c-fixed-conversion-error-w.patch

This isn't in master, not is it going to be.

Cheers,

Richard

