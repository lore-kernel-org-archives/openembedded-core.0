Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28AAEDE9B8
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 12:25:58 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.10787.1694694353746566637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 05:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fOiTRt7a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31c3df710bdso781728f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694694352; x=1695299152; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZW5MMcXpixeHMm0mjn0MCoUkoY6iPZwzW63u/65mPow=;
        b=fOiTRt7alhwQnsqwsG1b7Jsq9mIZFTfXZYWkGTl3j9T7GCJ+EdysKxkdjluRkb315V
         gN2qyQs1Wqrz1/i9q4n5EbTr0VEzn3L6jt7PTCVbmK8/RC+VVtYw9p1ccyGH5UCW6A2E
         1jYtUMzQ7UmYg/ubMEvy6p05hpfOjt6Unk9fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694694352; x=1695299152;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZW5MMcXpixeHMm0mjn0MCoUkoY6iPZwzW63u/65mPow=;
        b=BfbfY5hd5aKIiWTALrctrkBN1uySJste/lgAc/g772Gj1QNlOUD2qRS3ET0bzpM7SB
         WTSAMOryDcYh7U0YyNuJEeV7kW6sLMvvE5DZF86HdNZpGCjf5rtfBrlMMdj+OKjmOI+W
         GZwtBRY42x31qED8vH/F7JaI4RmGmeQa5D6dcvNl9aGqyzSleFKPm/1Ne7TW7rCSURxz
         Oe8BIqJulN2EHj1oSD0AF1+Q2HOOCCrvitJpufkL4HZuCXJAgotaDwRCQoDh6zFqAgp0
         RT8mmwdIUYrHtJCIltVSaMTxDEBOuK21zenQdE1qBkUrpXahADNWG13YhBiBidyxHTKe
         KqrA==
X-Gm-Message-State: AOJu0YyhqK3qR4dMiuTHgryxjuFze/7+YVrYuU/lmwgR0PuFemUzruXK
	cVH0YKb59mlfuMK/vqPjwouN/w==
X-Google-Smtp-Source: AGHT+IFVSaRBWQscxoNOSTSSfjNNgjivRvd2eEpj/XSvWCL/Ofp5dEbBr8XGYJgWEGH16u7jxDqz7Q==
X-Received: by 2002:a5d:538f:0:b0:319:67da:ed68 with SMTP id d15-20020a5d538f000000b0031967daed68mr4481477wrv.7.1694694352075;
        Thu, 14 Sep 2023 05:25:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a6e7:41e3:896b:6b97? ([2001:8b0:aba:5f3c:a6e7:41e3:896b:6b97])
        by smtp.gmail.com with ESMTPSA id e25-20020a5d5959000000b003143c9beeaesm1670236wri.44.2023.09.14.05.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 05:25:51 -0700 (PDT)
Message-ID: <e2183185b17a61ff195aa8f9a4832add753644f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] removing PN from BB_HASH_CODEPARSER_VALS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: matthias.schoepfer@googlemail.com, 
	openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <m.schoepfer@rethinkrobotics.com>
Date: Thu, 14 Sep 2023 13:25:50 +0100
In-Reply-To: <20230914105052.112829-1-m.schoepfer@rethinkrobotics.com>
References: <20230914105052.112829-1-m.schoepfer@rethinkrobotics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 12:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187639

On Thu, 2023-09-14 at 12:50 +0200, Matthias Schoepfer via
lists.openembedded.org wrote:
> When using icecc.bbclass for builds, the build will break
> due to the fact, that during parsing stage, PN is set to
> no-pn, which leads to the issue that the ICECC_RECIPE_DISABLE
> recipes (appended or within icecc.bbclass) are no longer
> parsed / ignored correctly. This will lead to an error.
>=20
> Unfortunately, it is not sufficient to set the
> BB_HASH_CODEPARSER_VALS in the local.conf.
>=20
> Fixes [YOCTO #15213]
>=20
> Signed-off-by: Matthias Schoepfer <m.schoepfer@rethinkrobotics.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8b26461874..a9d851c87c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -961,7 +961,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D "doc deps depends \
>      sstate-lockfile-shared prefuncs postfuncs export_func deptask rdepta=
sk \
>      recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename l=
ineno \
>      progress mcdepends number_threads"
> -BB_HASH_CODEPARSER_VALS =3D "LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D1234 T=
IME=3D1234 PV=3D0.0-1 PN=3Dno-pn METADATA_REVISION=3D1234 SRC_URI=3D"
> +BB_HASH_CODEPARSER_VALS =3D "LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D1234 T=
IME=3D1234 PV=3D0.0-1 METADATA_REVISION=3D1234 SRC_URI=3D"
> =20
>  MLPREFIX ??=3D ""
>  MULTILIB_VARIANTS ??=3D ""

I'd like to understand a little bit more detail about what/where/why
this is breaking.

What this implies is that there is code changing it's dependencies
depending on the value of PN which is a little bit worrying and
potentially suggests a deeper issue.

Cheers,

Richard

