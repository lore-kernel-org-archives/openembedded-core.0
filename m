Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABF3C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 10:29:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.3374.1675506553508812929
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 02:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VpnbR4XI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q5so6638526wrv.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 02:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aalJ3Yng7Z3lKs9CKYWhLE59xTy8hNmW21vSW4FbaI=;
        b=VpnbR4XIFf9HJ5qsAnGM/48mG31xib4YIK2XO4HhK9WofIsmgQEY4r2QWdkgQQWK5d
         EBaI3IeOhtZ6yM33c4QzxTyleMz7vsGg9/NWXfcbQz4AFkAVQeuxy155wL61QOA+BxgN
         wkR7lV7vHuav5LTe91BjZ8foSLNEnYpMKD5GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7aalJ3Yng7Z3lKs9CKYWhLE59xTy8hNmW21vSW4FbaI=;
        b=za/S4C7yhIBK1+dkNIjbKNVc1i7LTzISvmZP/Cy78mon0WOxZ5xumsZnaAXRNyq2SS
         YHHSxCKGPcdBRbmStS8dzp5TQt83KzVF+1cFOJUc76v4nuGqy79BkPuvuaESjDmm/EeH
         wstTaBBnIrp0BsMaMkOq1/nP80iUjM7GwbTPr6GuPPyiYgum96A+M3HirSZ9AAH2uNUz
         g8FsJUozQgckhwDb8oUhhiHOwyqauSIaYFsS0CpYXzmmPqk/D07uYHhhdmBL3DelRLEO
         07P3a/BlEXKu05VY5ntjsQ2Lkdq8WD1KkFzabKhS9waXMXwbcdHTuDuoHyNyZ3f3Yr2h
         xnFQ==
X-Gm-Message-State: AO0yUKWWJGzfLqDXPGmE89qp7aq8h26m+FFYhdMRBe/6nlOhGTrtHUv6
	cFBl/7ecqhVhVhjLshQKn18EAQ==
X-Google-Smtp-Source: AK7set//XvXr4W2yHyU9w/d0l7ZZgZpqE5VdPT/M1CwZ52A3/H7g5PUsqSHs+qDFKIzLwcHqlinOKg==
X-Received: by 2002:a5d:660f:0:b0:2bf:ad43:8f08 with SMTP id n15-20020a5d660f000000b002bfad438f08mr10642482wru.14.1675506551684;
        Sat, 04 Feb 2023 02:29:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b45c:7b35:1c6a:a06d? ([2001:8b0:aba:5f3c:b45c:7b35:1c6a:a06d])
        by smtp.gmail.com with ESMTPSA id e7-20020adfdbc7000000b002425be3c9e2sm3395099wrj.60.2023.02.04.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 02:29:11 -0800 (PST)
Message-ID: <be77ae4531f1816f1690caeacd5fdb82c8f78501.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 14/14] python3-sphinx: upgrade 6.0.0 -> 6.1.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 04 Feb 2023 10:29:10 +0000
In-Reply-To: <8a230841f0fb99c8a40943862b49dd899bc52b99.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
	 <8a230841f0fb99c8a40943862b49dd899bc52b99.1675446372.git.tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 10:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176758

On Fri, 2023-02-03 at 09:50 -0800, Tim Orling wrote:
> https://www.sphinx-doc.org/en/master/changes.html#release-6-1-3-released-=
jan-10-2023
> https://www.sphinx-doc.org/en/master/changes.html#release-6-1-2-released-=
jan-07-2023
> https://www.sphinx-doc.org/en/master/changes.html#release-6-1-1-released-=
jan-05-2023
> https://www.sphinx-doc.org/en/master/changes.html#release-6-1-0-released-=
jan-05-2023
> https://www.sphinx-doc.org/en/master/changes.html#release-6-0-1-released-=
jan-05-2023
>=20
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  ...phinx_6.0.0.bb =3D> python3-sphinx_6.1.3.bb} | 26 +++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-sphinx_6.0.0.bb =3D> python=
3-sphinx_6.1.3.bb} (49%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb b/meta/=
recipes-devtools/python/python3-sphinx_6.1.3.bb
> similarity index 49%
> rename from meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
> rename to meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
> index 5e565e745d6..d77ad0a6fe1 100644
> --- a/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
> @@ -1,12 +1,34 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgra=
de'.
> +# The following is the difference between the old and the new license te=
xt.
> +# Please update the LICENSE value if needed, and summarize the changes i=
n
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- LICENSE
> +# +++ LICENSE
> +# @@ -4,7 +4,7 @@
> +#  Unless otherwise indicated, all code in the Sphinx project is licence=
d under the
> +#  two clause BSD licence below.
> +# =20
> +# -Copyright (c) 2007-2022 by the Sphinx team (see AUTHORS file).
> +# +Copyright (c) 2007-2023 by the Sphinx team (see AUTHORS file).
> +#  All rights reserved.
> +# =20
> +#  Redistribution and use in source and binary forms, with or without
> +#=20
> +#
> +
>  DESCRIPTION =3D "Python documentation generator"
>  HOMEPAGE =3D "http://sphinx-doc.org/"
>  SECTION =3D "devel/python"
>  LICENSE =3D "BSD-2-Clause & MIT & BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2214a89317448c7f792f5b75dd672=
6e4"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D066da51ab732319a06beae4f10788=
577"
> =20
> =20


The license copyright years changed so we need to mention that in the
commit message instead of the FIXME :)

Cheers,

Richard


