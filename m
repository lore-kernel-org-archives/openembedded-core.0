Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D616BC3DA79
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 23:10:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.6975.1672355440552431264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 15:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LsQnuldL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id ja17so14113678wmb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 15:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpsIGvwpRmnBINN4wdoUPRgL2lxdZRw+KJKgym3qzLM=;
        b=LsQnuldLGPrUdWCpPZ8kst/TVs/fW65krcyvMWvEFrIZ2pwlYZaB1meRgJT/RJ9HGK
         ELDQyoyEUc+EWVoVmJwvXsg1sFEa4DYBkNU+BBhfcXeA1VgM6w+qjo4GxuEqYcOkAvy3
         clOPevkaOF5fHY3y6rtdFg1bzIxBTYdU2u+Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TpsIGvwpRmnBINN4wdoUPRgL2lxdZRw+KJKgym3qzLM=;
        b=ubm/6w4J3XxPRFloy6afXz23rPWl7uo0cTRZ5GJY+WB7iaZ5UrlEbSMbUbsTQ7AD0m
         /3KymQNmFpFsJl7Pnu8r2Bk+eqdwfV8Av0TeU0xPDbSl6ftTZsSJeyqv/LQlLqlqhWfi
         5jloyucoSuddkgw5VbqR3jRUpGyzGpJ+4oGKb3iYoeUm3dlxrF6nXjXvLJIeO0akadWf
         bqgIW/XUczVSZCWMaTISsDcQyZMDwlW+9EBJasszWdV42Z2Xxr7LtZMzByvK/asxjRCO
         mB2cYrkROvIKuqcu23q3G0sVqvB1pBmq1zidNb+UPPUis0SgksE242/Qb7srqn53WCuv
         bbcA==
X-Gm-Message-State: AFqh2kqE5Qqth01RkqNZwDjz8fIBPilLzuGdpjCpDZkts8mng+E6ZJRQ
	C4hKlMMKJnN9RFLdfdGnAedZiA==
X-Google-Smtp-Source: AMrXdXtdDI77GeIdpaKBJaoGuj/JBrWPYBPv5K62T8PRyO/n+YvVvR87xh3EojpZ8H9b3oAgRvIIAQ==
X-Received: by 2002:a05:600c:4d21:b0:3d2:2a72:2573 with SMTP id u33-20020a05600c4d2100b003d22a722573mr21411649wmp.11.1672355438870;
        Thu, 29 Dec 2022 15:10:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fd62:db1:ca71:a503? ([2001:8b0:aba:5f3c:fd62:db1:ca71:a503])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm28219514wmq.32.2022.12.29.15.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 15:10:38 -0800 (PST)
Message-ID: <8b9837c04e2f9bb684aa290761e00e9d072e3dba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] musl: Update to latest on tip of trunk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2022 23:10:36 +0000
In-Reply-To: <20221229071310.4111511-1-raj.khem@gmail.com>
References: <20221229071310.4111511-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 23:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175131

On Wed, 2022-12-28 at 23:13 -0800, Khem Raj wrote:
> Brings following changes
>=20
> * f47a8cdd ldso: fix invalid early references to extern-linkage libc.page=
_size
> * 377218cb pthread_atfork: fix return value on malloc failure
> * 29e43191 fix double-processing of DT_RELR relocations in ldso relocatin=
g itself
> * b50eb8c3 fix strverscmp comparison of digit sequence with non-digits
> * ad5dcd39 fix async thread cancellation stack alignment
> * 8f925945 fix return value of gethostby{name[2],addr} with no result but=
 no error
> * 63402be2 clean up dns_parse_callback
> * 0a7b4323 dns response handling: don't treat too many addresses as an er=
ror
> * 41603c77 dns response handling: ignore presence of wrong-type RRs
> * cf76df0e fix missing synchronization of pthread TSD keys with MT-fork
> * 5ff3eea9 fgets: avoid arithmetic overflow when n=3D=3DINT_MIN is passed
> * d8f35e29 fix AS-safety of close when aio is in use and fd map is expand=
ed
> * 26c76a90 fix use of uninitialized dummy_fut in aio_suspend
> * aebd6a36 fix potential deadlock between multithreaded fork and aio
> * d64148a8 fix potential unsynchronized access to killlock state at threa=
d exit
> * 36b72cd6 fix potential deadlock in dlerror buffer handling at thread ex=
it
> * 833a4691 configure: disable TBAA optimization because most compilers ar=
e buggy
> * e6e82132 disable MADV_FREE usage in mallocng
> * 25e6fee2 remove LFS64 programming interfaces (macro-only) from _GNU_SOU=
RCE
> * 246f1c81 remove LFS64 symbol aliases; replace with dynamic linker remap=
ping
> * dec8f0a4 dns query core: detect udp truncation at recv time
> * 8c408937 getaddrinfo dns lookup: use larger answer buffer to handle lon=
g CNAMEs
> * 759bf785 arpa/nameser.h: update RR types list
> * 51d4669f dns: implement tcp fallback in __res_msend query core
> * e2e95176 res_send: use a temp buffer if caller's buffer is under 512 by=
tes
> * c87d75f2 adapt res_msend DNS query core for working with multiple socke=
ts
> * 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish NODATA v=
s NxDomain
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
> index a72d87ea6f..7749495ec6 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
> =20
> -SRCREV =3D "dc9285ad1dc19349c407072cc48ba70dab86de45"
> +SRCREV =3D "f47a8cdd250d9163fcfb39bf4e9d813957c0b187"
> =20
>  BASEVER =3D "1.2.3"
> =20

I tested this with your 3 musl patches and it showed a few issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6421
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6439

Cheers,

Richard

