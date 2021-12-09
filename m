Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BAFC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:31:43 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.14785.1639071103051166878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IOuLOOWC;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id gu12so5733708qvb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f25r2c21H54Su8IQP8EvUL/b5ZVZrezkEeEcml+Uwvo=;
        b=IOuLOOWCJaTIMrQC8IAvQxX8XiKdQY7pcBLBgOmmp02gIkJqbtPht8d71OsBjHmkOQ
         r2G2/xw6kVXnGCFLsRhebJRgq2/WgIt1wA9WglIrSWdXTUARJMYOO+RW2hClmX7vAQpx
         vs8z3hoGoQV+rRyt/ErBZfFDkkjy7m0whPBBk6uvF2iuSUGmW1lL95VMssIXX2zPIb3k
         0LjeoQRpUagfy3y48npaUF1MRuw4lJDckN06IP4YmLWkXvto2buEXLU9XlGLbOBD2HXg
         NjjqQxWEk96xlBPH9KXsHRQhzIHDofVg7+Wa/OwbVUoiEVK4SQ1FWEmrB6evzTZ7RCL+
         QOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f25r2c21H54Su8IQP8EvUL/b5ZVZrezkEeEcml+Uwvo=;
        b=04F+lAwGhihkwldG6qdwZKKOPE7sHAnPIEyXPILASxQ+DCrMvxDg7GI/cp4R45dGcS
         kreHPaWsZ5AziC6WoVQKii4IIGXhT0hkNWOUU1ZqPKCsP9NiizssVacNMkuT/310/Iqb
         O8vwWXmgkvxR8QbDIhoNYyxey+jBiWMM32VY47z26aRn+p8fCnVYkbbXUh9XpPiLDmX8
         /q6G+Rk2xuF/8iK+YGggL4NeuVf9Xi17hdSEc2p894TmA8ivGyxAiCr18QzsfDgL/Xz7
         FFMhfEwJ02XMWMZu5/GKiI7h0m/bhcrQnFxyMVPRW7A1oI5WTVSltinvDxZpDaiQwwTc
         xorQ==
X-Gm-Message-State: AOAM530luX5phHG8L7pfnRdWQEDLYUEDZX/LdyCsK8Ka4ihd7zVNW3E8
	jNGQxYGBpqmXs9wqfYkYE+lAYa5bBgFEMlxn0R0=
X-Google-Smtp-Source: 
 ABdhPJxysnURuQVCNAwbBriYxyiHBjB6x0iSJpPv/Bz+AGxAzwayQgqElGcqNpiMYtSUsIpYhjjUxgc78xft29wAPaU=
X-Received: by 2002:a05:6214:e63:: with SMTP id
 jz3mr17951941qvb.16.1639071101970;
 Thu, 09 Dec 2021 09:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
 <20211209172537.641755-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211209172537.641755-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 09:31:15 -0800
Message-ID: 
 <CAMKF1sqMKEK5M891-7g0WN0HFVYRC7ZpV0vfr5nZmMEyShxOqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] binutils: Add more detail to the ppc patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 17:31:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159471

On Thu, Dec 9, 2021 at 9:25 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This adds useful detail from the orginal commit.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...1-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> index 389232c1e3e..a271f55ea1a 100644
> --- a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> @@ -3,6 +3,10 @@ From: Zhenhua Luo <zhenhua.luo@nxp.com>
>  Date: Sat, 11 Jun 2016 22:08:29 -0500
>  Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
>
> +The wait mnemonic for ppc targets is incorrectly assembled into 0x7c00003c due
> +to duplicated address definition with waitasec instruction. The issue causes
> +kernel boot calltrace for ppc targets when wait instruction is executed.

This patch bothers me a bit. This either is upstream bug or it is not.
So it should be perhaps forwarded upstream and if it is still needed
and accepted that will be good.
otherwise we should drop it.

> +
>  Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
>
>  Upstream-Status: Pending
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159463): https://lists.openembedded.org/g/openembedded-core/message/159463
> Mute This Topic: https://lists.openembedded.org/mt/87616746/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

