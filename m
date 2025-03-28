Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D9FC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 18:02:30 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.812.1743184950083871933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 11:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e02p6W6+;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-601b6146b9cso1338567eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743184949; x=1743789749; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMH/8DtmhoY+SOB/5ocfyrpjKaaBQTOEXwAWCZTWvEc=;
        b=e02p6W6+TDdHbrpLky1BsUizW/MAf5+oyUc9/Rb9lrXBzwlUFu83/CCRpKbyH0KOja
         vf0Ec1vB1NVaKVC0zJaDs8rXiFh+1z1JXwDwpUSWavT/je4UaKJPKFARBuJIoziFTYqf
         QWQGfM0XU1a3QeA5NVsH9+BhUQJ6PuIU1Vw1u7nWqXUN4m/+DfKokjWgUB+8bVMkWj4m
         iGFuDRjWp9/icZIZWDm6YWvsBivAedk/oWsbyZz2fRHtnVWzvRvGE13wrTHakQ7HlV90
         iA+moZlkoG39mtu+roodVpn5/jivV80GopfuQm8mTBO/jarS7cEgZyXZ4dTgaH2dOfos
         VlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743184949; x=1743789749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMH/8DtmhoY+SOB/5ocfyrpjKaaBQTOEXwAWCZTWvEc=;
        b=uYXOvqVamjOqviBiywEDX42OEsaDKZJetQDhGYfDrCQz2i4eMCqw1GTv3G2nmPwuai
         UEYmcDo2Pjvmfq/aPRj6yJzjNHhu9xt/tdOEEJM9fMarAclopqsZbYD5C/wE1S9C8Jlf
         l8MEXpQmdIFEgMdkjsRbthYZU0+xOe00P/R4CWZ0dcaX6elotXKxeAl+pnp4I76JqL0m
         9Oil5cbTr7ILW35qf9FsgyPQ9JOreJz5FYGLNwH/nRUFUoHIBCAQa0feNRBER30qOHPv
         M2RsEmDp3HJJQK8jLcISDnD9VeLpTKvz3z8ylxU9SQPBlPZKMwITgWUHk+m+hrjltt2l
         vS8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoLSg1px/pwfQqGs1Djl3ZcuyolKvv/AlP18dHfUSryzPxTHbGZlGdHJBX1cNcSkBwefLOyT7yZwQrOn/ohW2Arg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy42JS5IbOQ/dkSX0i+Ox45OeIJt5at/23KCor1XSvj0cvOI4aG
	Mho9Nt4cFWm6n2xwr8GgW08orCa2R2+pBmsZE6iWEaQ8lo8eaCKMZKZQKasccyod8v3LGSjL8PV
	Lt0jtS0wvAdaZEPAkvrr8qIWWiQE=
X-Gm-Gg: ASbGncv0ArMTZewjGlWVDGwPdoeuYbrq2+rx++EInWolxBxVgDEV/eVEtjU9ieX7Jzk
	udvQ5fY9ODE1N75nszusS6eB0aG3xNnRmx9LxrI5sY51gsIY3o9p+OteAIAPqr2SEeEs2+IgdWd
	Lc2dOcpEg4WR4uaYQcDNbY2iYHGRpV/MLINDFB
X-Google-Smtp-Source: AGHT+IH1mXF2VUxY3BrHRCJDHXtaFy+UNVKiCRgmdQYitYTl9Xgf210fcue/zN2EboRfyykZsZyVlTvRDBf+9l1gRTI=
X-Received: by 2002:a05:6820:1f02:b0:602:8233:8e94 with SMTP id
 006d021491bc7-60290e59248mr66607eaf.1.1743184949082; Fri, 28 Mar 2025
 11:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
 <20250328143005.880998-2-Yash.Shinde@windriver.com> <BB6CE0C2-6EA2-44F9-8B16-8981A0B19BDD@oss.qualcomm.com>
In-Reply-To: <BB6CE0C2-6EA2-44F9-8B16-8981A0B19BDD@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Mar 2025 11:02:02 -0700
X-Gm-Features: AQ5f1JrNOHWiItoVejKqhpYa69qW5QH-gPsOG5QtjoGwvDBqPtn0_OfzaO969Rs
Message-ID: <CAMKF1soMjq2unU3+i1iBVgPYZ=HEDY4SBdZ+Sx1DH1Po_p5TWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
To: koen.kooi@oss.qualcomm.com
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 18:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213860

On Fri, Mar 28, 2025 at 8:17=E2=80=AFAM Koen Kooi via lists.openembedded.or=
g
<koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
>
>
> > Op 28 mrt 2025, om 15:30 heeft Yash Shinde via lists.openembedded.org <=
Yash.Shinde=3Dwindriver.com@lists.openembedded.org> het volgende geschreven=
:
> >
> > From: Yash Shinde <Yash.Shinde@windriver.com>
> >
> > Rust stable version updated to 1.85.0
> > https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
> >
> > Some of the major updates:
>
> > [...]
> >
> > - Explicitly set float ABI for all ARM 32 bits targets.
> > Fix: https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e26005=
b50982d0049d905
>
> In OE we allow selecting the ABI using tunefiles, so this hardcoding to h=
f will do the wrong thing for non-hf builds (which are rare, but still).
>

this commit has LLVM_FLOATABI introduced, which is what we can set
based on tunes.

> regards,
>
> Koen
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213851): https://lists.openembedded.org/g/openembedde=
d-core/message/213851
> Mute This Topic: https://lists.openembedded.org/mt/111955030/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

