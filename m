Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0001AC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:16:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.14056.1671200203894104045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WrHRBrhH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id o5so2657272wrm.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=by8D0vAPPsokpzpLhNWDDjR1evP3RwwK+0+dsme5UXU=;
        b=WrHRBrhHyXqiVb4YjVElI/a1HnPYbAwRE5FSRBGnc8V68D6herlys1egw9RmWPsOIL
         ekg4ovelx3wbcR/l2F+90JYOB3X0Jyg4jCgzCGmsLFK8SwhwHN026J4M//rYDZdiYiYH
         FXPKHvDxIXCpWQTcLVzmXcQL5UOJ4XgB36DlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=by8D0vAPPsokpzpLhNWDDjR1evP3RwwK+0+dsme5UXU=;
        b=K3THisqfduH8S7StjwhebQ1j3UbSU7mFATJtgLBeEwCoxWgdqqhJOFne0wDAPRbdRJ
         x+bYKvG4KmTUTp6GHs7m5lxSAzUpxoaBYJjQ0YrbH+WA/qAOl/kzvpqW75qcInOG8k4L
         L+1NVXa4lFPIBUL/ScrpZnyxsaDziWjOGFv1edSs4blxmnvEfdE/Y/RQ4afEG1otM2Vt
         TEcwtN+x+0wDlhDQFB4bRIDkNANsBce+t7TpBOywWVsQB5jZDkI4LMyggB4FkvqHP+4O
         OP+dnvIggAH0e0Yych1uJOfEDe5afydes2+HVrwFFb3sPlX/6tDMa+m+pqjUG3SBZpGf
         wW3g==
X-Gm-Message-State: AFqh2krVxsne8iRKZeEFKaqKz62CeddX12VykBy/e17vxr7gB1aUHpnV
	Yr+J69vpSiPBic06Tog7IArV8w==
X-Google-Smtp-Source: AMrXdXuTnm4w9CyU/K/4gwWOVmiky2KSjErpZgmJnaOQGH24AssdhGJEhz++tE0q8CXxCzSnsbrypw==
X-Received: by 2002:adf:e9c7:0:b0:25b:d0ca:1bb1 with SMTP id l7-20020adfe9c7000000b0025bd0ca1bb1mr1878625wrn.10.1671200202293;
        Fri, 16 Dec 2022 06:16:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2cd:ac7d:867d:e6a2? ([2001:8b0:aba:5f3c:f2cd:ac7d:867d:e6a2])
        by smtp.gmail.com with ESMTPSA id bn22-20020a056000061600b002366e3f1497sm2486620wrb.6.2022.12.16.06.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:16:41 -0800 (PST)
Message-ID: <56cb8d9eb90734fcb59851040f5ca9d7ed0d4f7c.camel@linuxfoundation.org>
Subject: Re: [OE-core] Target rust
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2022 14:16:40 +0000
In-Reply-To: <CAO5Uq5R6p-cWBUDVtULZou_1XSae4AnJRmEgr9pw6ORZ-fQpjw@mail.gmail.com>
References: 
	<CAO5Uq5R6p-cWBUDVtULZou_1XSae4AnJRmEgr9pw6ORZ-fQpjw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174743

On Fri, 2022-12-16 at 10:42 +0000, Alex Kiernan wrote:
> Does anyone actually use target rust? I thought we had some test
> coverage, but I'm failing to find it.

A basic hello world on target:

https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/runtime/cases/rust.py

but we could do with something more along the lines of:

https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/runtime/cases/gcc.py

adding.

We do also have:

https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/sdk/cases/rust.py

which are basic tests for rust in the SDK.

> After the thread on stable/beta/nightly, I started playing with it on
> target and so far have:
>=20
> * we're missing the rustlib/<target>/target.json
> * we don't have gcc/binutils in RDEPENDS so there's no linker
> * no libc-dev/libgcc-dev
>=20
> I'm not sure how target dev tools ever get used/installed as it's not
> something I've ever touched, so maybe the last one/two are expected?
> But the missing target.json just makes rustc bail on startup - looks
> like 16b4ac3f558f ("rust: Enable nativesdk and target builds + replace
> rust-tools-cross-canadian") might be where it got dropped, just
> checking.

On target rust never worked. I made it build and tried to clean up a
variety of things but I moved on to other things before getting to the
target toolchain/runtime testing. Patches to move forward welcome,
especially with tests. The work I did was to at least try and get
things onto a proper footing for the future.

Cheers,

Richard



