Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA13EC8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 04:23:58 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.6006.1756441436124321834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 21:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PCNewsdk;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e931cddb0e2so1462742276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 21:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756441435; x=1757046235; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUA6MnDKqc32Zy7lWdgy+GpbFDd0XWxr6LC2o9k9Mkw=;
        b=PCNewsdkFeSGjjBSTZUPy/BEG7CusThhxCC0QhT4P/fzodHDvZCGj2j09z4M/WN6EW
         VlHhUpeNr6nGBT7M7XUvaiSmlg7MFB06cOFjjoolcjymKZYMTFiQPjADThhoUl6RZ8Ax
         3yrNc0EtHLBCMBeAozEPkZkJMOrLYrlcOyPuyVSugIaLp/mBHg/WfK0SlTSSLGia5bXF
         RIgrHdfyuDOwfpPJIdDZkZXu6nszs2u9PqInM0N/vewOeRCkWsUT2M/pSCSF/MA8BONb
         /oAdnPAzpSmp5QT2/2kA1x1AAYFrBsUlR4LZ/0oaeeErn1v934yz8G+Q6Y5YsSWt6bd9
         Q6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756441435; x=1757046235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUA6MnDKqc32Zy7lWdgy+GpbFDd0XWxr6LC2o9k9Mkw=;
        b=dsnubwlDdgwIBHbCUgYnGhPw7+xnwHWSh2HLsSGVLwuhEcm5N+hGkgi1jZbdiMU2KY
         /sL79nU38QBm55SHl+vQizxMbZ4vvS5ITa+cmWMozmUgfF3Qqeop+t20VfwwmWTOHAQV
         UXjwo+wLRVzPRTWtp5ouaLqbv/f/cKPuOLkHQB+vmB2plxmM2vnLy5pJjNbkseFHhR3C
         OegALUpuBrnXvK+cHR1tsVYPZDBga//Z3DDPQrHzF8eS2+KCZAPVDoKiRaTnoAHfgm7i
         y0ocovbCMV+oea/kmR8Y2yLSl+KtSML2C0Wn8vwPpXM8kg6l8MLMNxpHVw/HyfVVnFJh
         Ac0A==
X-Gm-Message-State: AOJu0YzeUtbnIqPOrLAGroxSl/idYop2aeDz+yeS+7gEdyURUL/lcark
	6FQKJt5koD1jtKamX5FAgEVSmnL0tz42PKTIcJPEYc5RZIdmm2muwyEqDJmegW8XguKGcENuarE
	t0I7pAFXM4cgYqIydwIXF8NchAaa5Tas=
X-Gm-Gg: ASbGncu1cRGq97WGalO7GiVrL+DcCdcNWJBFsF44loA04ZUZMYlhmzOP4aDEVMNXVrk
	8UUFq/nSV/MBZ3x2Y7bpKxSKseV9iJ3LebHosVw0biYjbrIRDuNaK1qN0IBrBlDk2z5AFjOAOA8
	3R4mwlXJk/ZaTM63wtLWtRJQ1opxvE66liEZ4ciLh9/Raq6rxSbgY7tpYh6XYjdlICQ7B4CyqMO
	5Buvfuo+7pCcawP4UJX/X1UcVdLHCaYmuN82rkJDJWdLAUIEXuOUmQrNSq+P2dxcNpxjCWkJDFG
	kWVA/GDrnxZRMMKSipPb/fdPbvGJu/YSPGXUr7yLzXWQ9FYhaJR+BMaCDBqrasR6JeKq
X-Google-Smtp-Source: AGHT+IExh7zQtkH2KqgLUW6FMiWXvI6xnbPm4QTZ0hYSf7kx+9sWNJH0bBnbPsSAD2h1LGoHnfvbhc56iNZhOCMc5bM=
X-Received: by 2002:a05:690c:6f04:b0:721:3bd0:d5ce with SMTP id
 00721157ae682-7213bd0d83cmr131849667b3.44.1756441435013; Thu, 28 Aug 2025
 21:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
In-Reply-To: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Aug 2025 21:23:28 -0700
X-Gm-Features: Ac12FXzg-gSZHIYxtm32qCW7qMwtKMKgO3Q6NUQfqFWD4jzKVzqldEI0Ds3it4s
Message-ID: <CAMKF1soYB3s3YKy2Rtc1MP5fW3nmJpO6PFig5m8ZBpQCkbOJzw@mail.gmail.com>
Subject: Re: [OE-core] Drop rust-llvm and use clang instead
To: deepesh.varatharajan@windriver.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>, 
	"Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 04:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222600

On Thu, Aug 28, 2025 at 4:45=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi All,
>
> We have removed rust-llvm and updated the Rust build to depend on Clang i=
nstead.
> With this change, we successfully built Rust for both native and target. =
Additionally,
> we ran a full bitbake world build without encountering any issues after d=
ropping rust-llvm.
>
> We now add these flags "-C link-arg=3D-lz -C link-arg=3D-lzstd" because o=
f this following diff
> otherwise we will get errors during link time.
>
> Setup in rust-llvm
> -DLLVM_ENABLE_ZLIB=3DOFF \
> -DLLVM_ENABLE_ZSTD=3DOFF \
> -DLLVM_ENABLE_FFI=3DOFF \
>
> Setup in clang
> -DLLVM_ENABLE_FFI=3DON \
> -DLLVM_ENABLE_ZSTD=3DON \
>
> You can find the relevant changes on the poky-contrib branch here:
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dharish/rust-llvm
>
> Differences seen in builds:
>
> with rust-llvm for bitbake rust
> real    54m54.184s
> user   0m13.470s
> sys     0m1.380s
>
> f/s usage
> 41G
>
> without rust-llvm for bitbake rust
> real    57m51.015s
> user   0m18.129s
> sys     0m2.051s
>
> f/s usage
> 45G
>
> We are open for suggestions, improvements, or concerns regarding this cha=
nge.

This is cool. I think it will help regain the build time that
regressed by adding clang to core.
rust's llvm fork carries patches. I would like you to look into those
and see if they
are convenience patches or functional one's that we need to consider for cl=
ang.

>
> Regards,
> Deepesh
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222566): https://lists.openembedded.org/g/openembedde=
d-core/message/222566
> Mute This Topic: https://lists.openembedded.org/mt/114933250/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

