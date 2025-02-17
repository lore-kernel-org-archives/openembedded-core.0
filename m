Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E806C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 18:24:14 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.635.1739816644760440156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 10:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NVpiHynI;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2bcc5c887efso615146fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 10:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739816644; x=1740421444; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpXL7T/SCSCpqravAnovVPaBvbaicV0duFBqoBY4Oq4=;
        b=NVpiHynIshkp0BlKfbSqbt82etvotbgPSbGz4IIv/cyEdnUtrnt2qBFBBe56QK6HBX
         OZafmdd+FKOCMzMDPZ54fGY+Tpruqth04wEW7FkPk5Kp7zXvTy0x4hz78i13iXOtlbBo
         M2S7aYlnpmKj5Zl81Hu04XUKJa3ZzbkWl5cz7P4hsJ9bG3Q3FJZxPVcediTQNSxhnf7F
         6IHNtQtV+ScTnrsoF3PO1i1UDezErBq2A1/JU9XsgfYk06Kqt1tbR4MoPLAoGzCyAUxs
         HKr8iFbHqCxkOjkCCXdySp7oyrlURo7fvyOOMe6Tc3sSI8zKnx8BnleMrzIM2gWs96mZ
         HkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739816644; x=1740421444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpXL7T/SCSCpqravAnovVPaBvbaicV0duFBqoBY4Oq4=;
        b=s5mItcBun1k484WYk9RXJ9OXC1axh8TlUpS05M+ZY7jRRJ+bPj85Yhef2nK+6EMkfZ
         ZS0DgqzcAOP0wD3ramtMyr9BDk2/9FvD3I6YVmHzfLo1ChNWVCL03RPQlDxFErTsokGC
         u2evxt7ZIsgZTySGa7ENYvQ3iypcVNQixhuzW9tkC6K5Xs32v2CdWSTcaWmQd0sc1Fuy
         d2gjNu+6WxFuLvcFgLsHNYstshcPoU+l+lJ3yXGMQ9YhcATJIHKy3vvN5fSUykdC8X+K
         nVeVqlW4o68402PV7nvYcz6PObUjGkF39LIbGBf6jkDPaOYe1dFE02Z6kjXUhg7boW/C
         s3UA==
X-Forwarded-Encrypted: i=1; AJvYcCXZRq9vxWelBRrYjsXoGjXi2MZ3zEYRUgYz3eeqQOE9VV8TwP7UlesFeyH6upUtY2yea/Grs76aUie5J1AeZWn33Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyw/2q8ggnQfANl4AFlXkYt5C4x2gVyz0L6HVbnRky46plTps9M
	a+ERI3+bJnRT79592am+c94yZqE0AwHVg4gU7wTWpvOQ0/wv9CJVcayZc6Z8US3ON9qXasJM3gy
	ihtwIhXcbTsxbSXSG1YsL7MGZwIvl5SupaTQ=
X-Gm-Gg: ASbGncsefqr9VC4NrZ6sKE12HGbaGbz+DyUftS03XMsC5gT+O+bsewRYkrcuAmgOBNX
	+o7IhhL/SYBYHjMEyviiY66Ct22POBGFTVz9iu5poLwf3KksqWGzhxyVPojGNE5ViyC5mbFMJrv
	PQgrOKcSvE0n9WA4F4v4czD1I8bA==
X-Google-Smtp-Source: AGHT+IEEnuowjGkKGKNaZVik8sKS0tbG02hiFHLybQo0GdyRrzx1kcTyEFAIRySX3f8/WFFGaEynr3smCuE0gine3Rk=
X-Received: by 2002:a05:6871:739e:b0:29e:460d:f74a with SMTP id
 586e51a60fabf-2bc99a383a5mr6974446fac.3.1739816644063; Mon, 17 Feb 2025
 10:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20250215204941.1453502-1-festevam@gmail.com> <D7ULRO9YDXHS.1QDCIQ63BGI8E@bootlin.com>
 <CAMKF1sr1MZ1d6hPMMezqQgyWe0dOdDd3CZHgp5KCiEANWJw8xA@mail.gmail.com> <CAOMZO5A3qo50F3=tGpoLZZZvyGNLxpLJqKsSPsfKA2q0LLpp-g@mail.gmail.com>
In-Reply-To: <CAOMZO5A3qo50F3=tGpoLZZZvyGNLxpLJqKsSPsfKA2q0LLpp-g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2025 10:23:37 -0800
X-Gm-Features: AWEUYZkV1XoYw7mm8Hbf46FaL33eLuHjfqpUnGpECjy-BJnG6A-SW--Cp3dndzU
Message-ID: <CAMKF1sqjHGr+GfsX2tw1YTDuQv_+4Jg75rwB=14bxLfN-5sD9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mtd-utils: Upgrade to 2.3.0
To: Fabio Estevam <festevam@gmail.com>
Cc: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 18:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211551

On Mon, Feb 17, 2025 at 9:31=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Khem,
>
> On Mon, Feb 17, 2025 at 12:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>
> > you need to DEPEND on libexecinfo for musl and also add -lexecinfo to L=
DFLAGS
>
> I appreciate your suggestion.
>
> To make your suggestion work, I locally copied the libexecinfo recipe
> from meta-oe to one-core.
>
> Is it acceptable to move the libexecinfo recipe from meta-oe to one-core?
>

I think it makes sense perhaps add it to recipe-core/musl in oe-core

> One more error needs to be fixed:
>
> | In file included from ../git/ubifs-utils/common/defs.h:18,
> |                  from ../git/ubifs-utils/common/bitops.c:7:
> | ../git/ubifs-utils/libubifs/ubifs.h:313:9: error: unknown type name
> 'loff_t'; did you mean 'off_t'?

yeah you need to include fcntl.h and add -D_GNU_SOURCE in the compiler
commandline.

> |   313 |         loff_t ui_size;
> |       |         ^~~~~~
> |       |         off_t
> | ../git/ubifs-utils/libubifs/ubifs.h:1341:9: error: unknown type name
> 'loff_t'; did you mean 'off_t'?
> |  1341 |         loff_t i_size;
> |       |         ^~~~~~
> |       |         off_t
> | ../git/ubifs-utils/libubifs/ubifs.h:1342:9: error: unknown type name
> 'loff_t'; did you mean 'off_t'?
> |  1342 |         loff_t d_size;
> |       |         ^~~~~~
> |       |         off_t
> | ../git/ubifs-utils/libubifs/ubifs.h:1899:44: error: unknown type
> name 'loff_t'; did you mean 'off_t'?
> |  1899 |                              int deletion, loff_t new_size);
> |       |                                            ^~~~~~
> |       |                                            off_t
> | make: *** [Makefile:4822: ubifs-utils/common/mkfs_ubifs-bitops.o] Error=
 1
>
> Thanks

