Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DBCC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 14:10:18 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7392.1700143815469415389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 06:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZYYGfOZk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4084095722aso6918315e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 06:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700143814; x=1700748614; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E30GZC7oWlzHTB+wXvFgx5TotFxdVrzUeYXxpfSjukE=;
        b=ZYYGfOZkKaLb015LVDcRQDB86EV2XxKp937YeifOnfzQDqBxv56i0RlSk4zUIQRXrp
         7SO6PWQgb3yZeZcW5nP1NzCpm6wT2mxsAOqc2H7oUp5aYHjINTuz3nLw0WXAQVt+f4Km
         XwwTDoEgpwkmCXddDlQPNN5KnHl6ecZF6qkbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700143814; x=1700748614;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E30GZC7oWlzHTB+wXvFgx5TotFxdVrzUeYXxpfSjukE=;
        b=FbCdC/GQJbgpDoiK1QPzY1Vqviyd0gI2h8N5Hj3GOI92Iz/L/Z0jJdbycmfq4I9GqG
         ooyy1nkzgx2SjoWic5UAZlrX/QbmgqoUwz6HcyTakzNGy1/g5fh5/vXGxGXmDY8cwuuP
         D5TJHzfHMUy2Uu6LJ3qrt2nDkj4GWca/ebHsr23plZ80lKQpYH2sId4HI3sskz3UZHys
         0lCV0wEP2KMk9fI67Df1veOI7J3cjIQFCYL28PEOSYCK+lIt4YRIJPxLp6wduEbWaE3b
         TeLUxnxJd4PxMdvJKAVUAxFRMWVYGVNCtgsMHUV+RduBymUqNR2BxQlgr0zI59VAY52V
         WZrQ==
X-Gm-Message-State: AOJu0YzRaT/8RmHhDcO4xhvkTzywKhdh8IIw73uIASSqMoti8MO2vPa5
	JVMxYt5R/MFfGNdS9ZE750dCOQ==
X-Google-Smtp-Source: AGHT+IFVLCNLy2AWPgx6TLsuOW5xkatVcPgf7SASpDcJRNtjKfBEH6WZeeS6PvJe1iMTPx5ZjQsG3w==
X-Received: by 2002:a05:600c:3ca2:b0:405:3a3d:6f53 with SMTP id bg34-20020a05600c3ca200b004053a3d6f53mr12719491wmb.3.1700143813502;
        Thu, 16 Nov 2023 06:10:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952? ([2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b00405959bbf4fsm3847659wmo.19.2023.11.16.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 06:10:12 -0800 (PST)
Message-ID: <de0eb61e388850417747b3b417a88f402cd595ca.camel@linuxfoundation.org>
Subject: Re: [oe-core][master][kirkstone][PATCH 1/1] vim: Upgrade 9.0.2048
 -> 9.0.2068
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: archana.polampalli@windriver.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2023 14:10:12 +0000
In-Reply-To: <20231116041524.1344040-1-archana.polampalli@windriver.com>
References: <20231116041524.1344040-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190797

On Thu, 2023-11-16 at 04:15 +0000, Polampalli, Archana via
lists.openembedded.org wrote:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>=20
> This includes CVE fix for CVE-2023-46246.
> 9198c1f2b (tag: v9.0.2068) patch 9.0.2068: [security] overflow in :histor=
y
>=20
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-46246
>=20
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  meta/recipes-support/vim/vim.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 38212a1fa6..2ef7fecc3f 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://no-path-adjust.patch \
>             "
> =20
> -PV .=3D ".2048"
> +PV .=3D ".2068"
>  SRCREV =3D "982ef16059bd163a77271107020defde0740bbd6"
> =20
>  # Do not consider .z in x.y.z, as that is updated with every commit

This doesn't change SRCREV so the update isn't correct.

Cheers,

Richard


