Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34B4C54E76
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 21:54:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.213.1673992482975776387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 13:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JaaFfN9p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so148686wml.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 13:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DA6kQ622ikTCl2I2CrGk0YhDixMW95VCD+zK9XY3to4=;
        b=JaaFfN9pY8mJOwlE2JGMgzfX3MXhcivFxUeGbFc2GC3MnE8i+wPtnM4RIPoDihAP4j
         cO8H0lAITUeQRs/aAhKRLVJEvkQOifkyZaqpcsYW/GIHCAE+RuiG0oA2DHC5Y1BK3ewA
         UFF7YBTgND87xtxgBoRXPRaiWZ1kIkKE6Qm0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DA6kQ622ikTCl2I2CrGk0YhDixMW95VCD+zK9XY3to4=;
        b=xaJat8afH0w8yN3gxjE+21BmFdUiZLtGq5QrvSORALfymTeA5DNcUR/TYdfSQbOjSt
         bxsjw61rI4OGrxlQslWHwNq29Ee0tdJRngSqZWadHa/usoBAVep4suxKUsh4ci7n/QCv
         JFLolpKXFUettELwiwvNJgvunOFbnC/uluDG44gFI8EF4wGbQZnn/2KDOTBFVsK3ZL6Y
         aHIHJFMWTKG11S5MM5Dfp+B1W7bMu1YQXlCmI9BF0rrwXA2o2qkVCgJcTm+lsOT7xyk7
         pYJfAiOP9o53XS3wLWNMAXwYiw0PEdglO/JOSVHQptVXmKxjOtNwAZNb475p6ZqhORp0
         KEJw==
X-Gm-Message-State: AFqh2kqcrYb5bOZuth+Z+LZ4B+y1aMUeYaq3sOqzWD/+jNhvFcciHJz/
	FED8vbzetFp+yu2uHo9u9fImog==
X-Google-Smtp-Source: AMrXdXvvErNAQjyQ083kl4/ZqQvj2rgKqceCtX/dOJFP5BxgvHTpT/g3NUfYqCW5l9fRjgiUDJOS/A==
X-Received: by 2002:a05:600c:3b05:b0:3d6:b691:b80d with SMTP id m5-20020a05600c3b0500b003d6b691b80dmr4484110wms.21.1673992479378;
        Tue, 17 Jan 2023 13:54:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:54cb:642:5dda:e3f7? ([2001:8b0:aba:5f3c:54cb:642:5dda:e3f7])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c190f00b003d9aa76dc6asm170373wmq.0.2023.01.17.13.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 13:54:39 -0800 (PST)
Message-ID: <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, 
	sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org, 
	"steve@sakoman.com"
	 <steve@sakoman.com>
Date: Tue, 17 Jan 2023 21:54:37 +0000
In-Reply-To: <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
References: <17490.1673869297796319682@lists.openembedded.org>
	 <17490.1673882452401971192@lists.openembedded.org>
	 <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 21:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176062

On Tue, 2023-01-17 at 15:29 -0500, Randy MacLeod wrote:
> On 2023-01-16 10:20, Kokkonda, Sundeep via lists.openembedded.org
> wrote:
> =C2=A0
> > =C2=A0Rust community said the security fixes are only for the current
> > stable relases.
> > =C2=A0
> > https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older
> > -releases/18152/3?u=3Dsundeep-kokkonda
> > =C2=A0For old release we've to backport the patches ourselves.
> The other alternatives are
> 1. upgrade to 1.66.1 on older branches,
> 2. add 1.66.1, which will be the PREFERRED_VERSION but keep the older
> version for those who are risk averse,
> 3. add a mix-in layer (1) with the upgrade to 1.66.1.
> =C2=A0For langdale, we'd update from 1.63 and for kirkstone, we'd update
> from 1.59=20
> See the link above for a discussion about what Fedora/RHEL and other
> distros are doing
> =C2=A0and a description of the rust / crates.io test system known as
> crater that builds the=20
> =C2=A0world for any significant rust change.
>=20
> Is there any objection to doing 2 and if we don't see any problems
> after some time,
> =C2=A0then removing the older version?
> Sundeep,=20
> If no one object, please update kirkstone and see if librsvg or
> python-cryptography or=20
> =C2=A0anything else encounters a problem.=20

I'm afraid I don't like option 2. We don't do this for anything else so
we're now inventing some new policy. Either the upgrade is what we
decide is right or it isn't, I don't really like the idea of hedging
our bets and providing two versions, one of which nobody will use until
they're forced. It will also make security scans tricky as is the issue
dealt with or not?

Just for context, going back in time OE used to be awash with many
version of recipes and I'm reluctant to go back there as it was
horrible. They were added for exactly this kind of reasoning, which at
first seemed like a good idea.

Cheers,

Richard



