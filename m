Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E898C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:46:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.66835.1680518793573456756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WD3lFYqA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id e18so28834687wra.9
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 03:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680518792;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CaqBp9puv56Ib/NNjw28/BQpCKW2omyehUTOGuMFKUs=;
        b=WD3lFYqAqW/FblrJZB9mBbXk+YIdq+/R8/I5KrAo7ETjOs+onPJZxA0X4aB/6A983k
         ILqxa2/eUQNYqNqkz2Pt50g4cPCSiRYKjRDIQrTFgYGIxQLeMwrpIPqZxxtWaR0bJzUD
         Lo7oCm5cRHFe1Di2S137nJrdFv3zzc/KHEtJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680518792;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CaqBp9puv56Ib/NNjw28/BQpCKW2omyehUTOGuMFKUs=;
        b=nOvb6bZjK0Hh74R3kMgVg9iGj4nV7EO4NL7rTt/fwY8TTgLYJhCpwFILlaJI/X/9/r
         INQXSlyFwSCXLZh7bZQ6yyf5v/mfN2g6Byx9QPuvT7gJf78qpJUn08gMZSHxh+gHJ3py
         BH86r9H10w8qfAJfB/1VHvtIlCyZDCkubAuPxpjEPW9llsTYB8FO1TkeVXQBYBMjSvwe
         JB5etq/bijy952RTVoZarAOijR9uQCgxakYfoBEpdCsZh0WrH0MMe1oJ6GlphhBvnyxx
         1jr3iFpR7+KLWoYx61INomAILIIKW+KixfsbsQ56FgJ+BiOM7UduTPkKawZzWMVBN/E6
         4QAQ==
X-Gm-Message-State: AAQBX9dZNCXZwrVBVDVl/sDLTxFmU/3Ki2enO7hkdP+vqLAlplARTaQ2
	AqKPv8cpIrJVwy4Hgg+MmmtVgA==
X-Google-Smtp-Source: AKy350YPobmhEjbSdH4kwoc1FfhasKh8B6MMBdZ5X45hRztsdwyIZm3W9fQXd6AC2Jbmp3QHmHM/Rw==
X-Received: by 2002:adf:f1c3:0:b0:2ce:adbf:cb14 with SMTP id z3-20020adff1c3000000b002ceadbfcb14mr26785672wro.28.1680518792042;
        Mon, 03 Apr 2023 03:46:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8? ([2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d6386000000b002e558f1c45fsm9350527wru.69.2023.04.03.03.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 03:46:31 -0700 (PDT)
Message-ID: <62ee9047a3d7ed89e44fc7d5e2c9c1d3e2c80595.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone][PATCH] cargo : non vulnerable
 cve-2022-46176 added to excluded list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, 
	shivams@gmail.com
Date: Mon, 03 Apr 2023 11:46:31 +0100
In-Reply-To: <20230402152836.9157-1-sundeep.kokkonda@gmail.com>
References: <20230402152836.9157-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179611

On Sun, 2023-04-02 at 20:58 +0530, Sundeep KOKKONDA wrote:
> This cve (https://nvd.nist.gov/vuln/detail/CVE-2022-46176) is a security =
vulnirability when using cargo ssh.
> Kirkstone doesn't support rust on-target images and the bitbake using the=
 'wget' (which uses 'https') for fetching the sources instead of ssh.
> So, cargo-native also not vulnerable to this cve and so added to excluded=
 list.
>=20
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/conf/distro/include/cve-extra-exclusions.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
> index 8b5f8d49b8..cb2d920441 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -15,6 +15,11 @@
>  # the aim of sharing that work and ensuring we don't duplicate it.
>  #
> =20
> +#cargo https://nvd.nist.gov/vuln/detail/CVE-2022-46176
> +#cargo security advisor https://blog.rust-lang.org/2023/01/10/cve-2022-4=
6176.html
> +#This CVE is a security issue when using cargo ssh. In kirkstone, rust 1=
.59.0 is used and the rust on-target is not supported, so the target images=
 are not vulnerable to the cve.
> +#The bitbake using the 'wget' (which uses 'https') for fetching the sour=
ces instead of ssh. So, the cargo-native are also not vulnerable to this cv=
e and so added to excluded list.
> +CVE_CHECK_IGNORE +=3D "CVE-2022-46176"
> =20
>  # strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2000-000=
6
>  # CVE is more than 20 years old with no resolution evident

Since I've been following the discussion on this one:

Acked-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cheers,

Richard



