Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0A1EC872A
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 13:49:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.13298.1694094572169365778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 06:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CA56abVA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-401d24f1f27so11294325e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694094570; x=1694699370; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCqeEuRVGukwXDbofDel4CwY9d9TjqZRD9bDIGHNfp4=;
        b=CA56abVAI0+CuIsaVJpDXQx4+hIbaSaz6IASTqtKsL49nKHku0tVDqkA0ap9xysljj
         J3L+xOlms4Sk1Gko3KQiroyfyqQjyP83RPcf9naVHNkobnW6oT2g3fZABIoYVo1PJISm
         njHwA3xAgMd8Iv2254FTZwA1KYclZVKkk1hBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694094570; x=1694699370;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCqeEuRVGukwXDbofDel4CwY9d9TjqZRD9bDIGHNfp4=;
        b=IM34DrwyVE51zeaEjtBcOw7ODlmkZ92Bn/9AUv/7LVTGQBwgO67PlXixNIPRa+ZaCW
         97LoW6o4nu5zbSny61T+eJUcGusS79TeqOnJJwbXDsVWvufdoLZs6u9/WcwicpuddZ3R
         pw47ziof1XkKC8kx+RPlDyatPTKUNnh1z0PmvaKJGw+RKjRmauKzRb6f58WIQSEQ2+qY
         un0BMDKVsssIWRJsesYArezI9cHJ7cOVLduAWK0/IOuwjRZNXtBE7RWeLB7P1ssBFJRf
         GwEk8DhTvA85yiL7RmydvsJAYIOlxURTuE2ArngmkI3P48mJPNNDa5g99GOdItyx3Prl
         1eRA==
X-Gm-Message-State: AOJu0YyW9JmzIj1EKCsxIaJShTJn5lWt7ru6HuBNhSlS2G79HxFgXDOd
	fgVikkCgSUZmdb1QCFHNCOoebg==
X-Google-Smtp-Source: AGHT+IGAuZNhCuSdHdXlTZ+Wx178g7tDy5UE2BZWU5KA+y9MjDCt4vcwF6430HFOZ0mpLexQl9bIVQ==
X-Received: by 2002:a05:600c:4754:b0:402:ea6a:c955 with SMTP id w20-20020a05600c475400b00402ea6ac955mr2738826wmo.8.1694094570390;
        Thu, 07 Sep 2023 06:49:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id i16-20020adfefd0000000b0031c5d74ecd8sm23522379wrp.84.2023.09.07.06.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 06:49:30 -0700 (PDT)
Message-ID: <65d4e060a7e71735e5d76cd1dd7c05899c2e195e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] populate_sdk_base.bbclass: PATH to
 nativesdk-intercept chown/chgrp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Date: Thu, 07 Sep 2023 14:49:29 +0100
In-Reply-To: <7d08e28bb59c6734f3e018722411205630886419.1694086051.git.pidge@baylibre.com>
References: <cover.1694086051.git.pidge@baylibre.com>
	 <7d08e28bb59c6734f3e018722411205630886419.1694086051.git.pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 13:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187384

On Thu, 2023-09-07 at 11:38 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> [YOCTO #15023]
>=20
> This patch fixes building the sdk with api-documentation enabled by
> appending PATH with the nativesdk-intercept directory which contains a
> special version of chown and chgrp.
>=20
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  meta/classes-recipe/populate_sdk_base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
> index b23ea26d409..632266cc162 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -17,6 +17,7 @@ COMPLEMENTARY_GLOB[dbg-pkgs] =3D '*-dbg'
>  COMPLEMENTARY_GLOB[src-pkgs] =3D '*-src'
>  COMPLEMENTARY_GLOB[ptest-pkgs] =3D '*-ptest ${MLPREFIX}ptest-runner'
>  COMPLEMENTARY_GLOB[bash-completion-pkgs] =3D '*-bash-completion'
> +PATH:prepend =3D "${COREBASE}/scripts/nativesdk-intercept:"
> =20
>  def complementary_globs(featurevar, d):
>      all_globs =3D d.getVarFlags('COMPLEMENTARY_GLOB')

Sorry to be the bearer of bad news but that won't work. The class is
included for normal rootfs generation as well as sdk generation and so
it would add the intercepts for normal rootfs too :(

Cheers,

Richard

