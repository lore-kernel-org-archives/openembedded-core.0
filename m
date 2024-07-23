Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325E6C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 10:43:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.41261.1721731389822903546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 03:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dzKEnSIB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so46305845e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721731388; x=1722336188; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1LxulK2VOvFUlf44ZburleTgsfHdEq49FM5mGkWNtg=;
        b=dzKEnSIBvz74GGyvy6avyZbIuGnzgdvoTkxYychl8dHtqGz1kj3L5uMkkrZTSInI9w
         F/KlCOIJt6k1mC5LQ+jJdNelD8LiTA0zMMWiVsP4sIq451bEqy/yW7NN1isDYz01ERV0
         Q47byWwnqCJOphSbukQwxAqGnPRgmeichvass=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721731388; x=1722336188;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1LxulK2VOvFUlf44ZburleTgsfHdEq49FM5mGkWNtg=;
        b=woUTN7eWeFQPytXDRmZCTecGSTd1xiF33pOgMxsF43fcCbit1F8UTXQlM3gZBNnVfu
         QrF+r11cUm4PqWBbGDQStW9lREbrQZOE9ArJ5lc4oUDlnrvkiTL3y+1N5J82YXg3YEkT
         CJB8MSJkVAkbTfwobBv0acIpHtT8GNP5BoDI1tIaIG22yBNRE5zxZCBj0IcGqWphvEVD
         N70iy2s2ZS/VKZ+w82zRYtXmJxj4kp7Des9OL55whdzQORvcxuZsIrMbfmfsl0NSH18J
         C45Aa/UGQzEyJQSIPVWDUrNqa+vGAA59/FJuMu+l2n4Y+iH6rchKBgir9HPPV6oI67gU
         MsLA==
X-Forwarded-Encrypted: i=1; AJvYcCWS0R3pM6aYKmAVgiGS5hCRc43nVWbXWIFtMjNFpjJTg3wal5NFiMUazYv4rAquMrgWuHvkWtRBzuvImWKj6+Cq9aY6o1kKxTLpHK0QupUV2/AuxhECxio4
X-Gm-Message-State: AOJu0Ywt2OdHBQb4Ph+L5xevUroR9mT89B9g8lmtUFPwBIS5b1A5gLtn
	M8ghuSH+ZEYz9YM7RhFarX98+BE/dn5zTNSPKObd6UrcMRGzn9+dz/DrFCvGlBE=
X-Google-Smtp-Source: AGHT+IH5j1ltuthgjlWx1MPY+sljog+VTeZRMYz9Z7lhYqd6oufZlNxwSr2BtSdOfWZENP7jNViyLg==
X-Received: by 2002:a05:6000:1845:b0:367:9049:da36 with SMTP id ffacd0b85a97d-369bb2b3c32mr9118363f8f.44.1721731388228;
        Tue, 23 Jul 2024 03:43:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcbe:ae7b:e03d:272d? ([2001:8b0:aba:5f3c:dcbe:ae7b:e03d:272d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787ecbd5sm11118794f8f.100.2024.07.23.03.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 03:43:07 -0700 (PDT)
Message-ID: <70d4c1cb9c9218484054b79115c787d351155a43.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv1] libgcrypt: upgrade 1.10.3 -> 1.11.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: simit.ghane@lge.com, openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2024 11:43:07 +0100
In-Reply-To: <20240718101457.4078289-1-simit.ghane@lge.com>
References: <20240718101457.4078289-1-simit.ghane@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 10:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202334

On Thu, 2024-07-18 at 15:44 +0530, simit.ghane via
lists.openembedded.org wrote:
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Add Kyber algorithm according to FIPS 203 ipd 2023-08-24
> - Fix AESWRAP padding length check.
>=20
> License-Update: Add 3-clause BSD license for poly1305-amd64-avx512.S.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Add 'cipher/keccak-amd64-avx512.S'.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Update license docs for FSF new address and update
> gcrypt.texi.
>=20
> Apart from upgrade also refreshed the patches like
> 0001-libgcrypt-fix-m4-file-for-oe-core.patch
> 0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
> no-bench-slope.patch
>=20
> In 0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
> reverted back the change in cipher/Makefile.am related to
> o_flag_munging
>=20
> Signed-off-by: simit.ghane <simit.ghane@lge.com>

There are several issues here. The changelog looks incomplete and does
not cover all the changes between those two versions.

The license update is also not correct since the 3-clause BSD license
is not added to the license list.

Please could you correct the issues and resubmit.

Cheers,

Richard

