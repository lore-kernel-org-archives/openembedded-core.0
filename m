Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4437FC433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:35:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.26368.1653305694361753679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KdriSGXk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id h5so19793434wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=ZYi6rlizKbBZmE310xoEK/VdQhmVVFzbDFvLogJN3LY=;
        b=KdriSGXkANgrZA9fZMjc2NSh/U+LmQRNL9PpmmSsOJiqMRaLoW0WLUFhYjaZxaX2+/
         Yg0MesfENzzCt2D+vtBis6kPXUVMsXjO440HUq0P8hYdR9Ycp5f5brLiOTzyQzUi1qHg
         L2g+y3x7NN5YgQgsYCk0r8SN/y8lV0iG4x8/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=ZYi6rlizKbBZmE310xoEK/VdQhmVVFzbDFvLogJN3LY=;
        b=0Ca+D1dCSyMEhmRjj+oqfEjRhVCOPZsGaDMYPpdvMgTvaQ+rvaU8MHGpdE6qEgi9iu
         pg+au1ezK6UqemMRMtCFHQS2F4OSwiehKzBzSAh4EZ7LMM1Z6SUoF6XbF2bisXYrW0E+
         01s/C8RneFijN5+bXPJ1QzrFD6j4Xce6ulimzqDxoSIZtR9Z1AW63udE351rf3tETP5b
         73O81o4VcJi4t9AhovLKXI8as6GFCCwwbt5aMZ6eqlmNINgd8Xuw9Rm/V7zETxLB4Wm+
         vXf1dhR4JFEyrym4RfcUda3D6a3v2ShWbCJC3cct5laznxv4Ca73t5ezte/Jtippzir+
         dXeQ==
X-Gm-Message-State: AOAM5318Li8ZK2hng0tknU/MhnnrE5Yb1fOcr3Fvom38v/kqg+KEj77N
	E60AJZkM0+2B5zPbMFKIKkefhg==
X-Google-Smtp-Source: 
 ABdhPJzvxvGx2RZg+qLI+Xiuom5+rO9tEBjWaFb4QFO/i1CqcD5qDNFQeeKwIOJkHSPoQEMFaaZvbg==
X-Received: by 2002:adf:f152:0:b0:20d:740:beba with SMTP id
 y18-20020adff152000000b0020d0740bebamr18834272wro.512.1653305692555;
        Mon, 23 May 2022 04:34:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24?
 ([2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24])
        by smtp.gmail.com with ESMTPSA id
 w11-20020adfbacb000000b0020d03c14b9csm9955485wrg.1.2022.05.23.04.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 04:34:51 -0700 (PDT)
Message-ID: 
 <18e8883e3582f2d8057f0608a6edab4a0837f031.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH] glibc-common.inc: add BSD-4-Clause-UC,
 BSD-3-Clause, ISC to LICENSE
From: richard.purdie@linuxfoundation.org
To: Martin Jansa <Martin.Jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2022 12:34:49 +0100
In-Reply-To: <20220523112433.383046-1-Martin.Jansa@gmail.com>
References: <20220523112433.383046-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 11:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166007

On Mon, 2022-05-23 at 13:24 +0200, Martin Jansa wrote:
> * the main motivation is to get rid of this bbappend from 2014:
>   https://github.com/openwebos/meta-webos/commit/8eb313e4303defbe495cf7f9=
1974799046975fca
>   which unfortunately doesn't explain which files under BSD license are i=
ncluded
>   in which package and also uses ambiguous 'BSD' license which was
>   removed from oe-core's common-licenses in:
>   https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=
=3D14d4c007c49652d836d325a12bdbcd3bfa42e6d5
>=20
> * COPYING mentions only GPL-2.0-only & LGPL-2.1-only as our LICENSE varia=
ble says,
> , but the LICENSES files lists various licenses with various Copyright
>   holders, the ones I was able to figure out where:
>   BSD-4-Clause-UC (but with 3rd clause explicitly removed)
>   ISC
>   BSD-3-Clause (with Intel Corportion copyright)
>   BSD-3-Clause (with Oracle America copyright)
>   which have just small formatting changes compared to corresponding
>   license in common-licenses, but there are couple more, should we
>   list them all (and create new common-licenses if needed)?
>=20
> * there were only 7 changes in LICENSES file since 2002:
>   https://sourceware.org/git/?p=3Dglibc.git;a=3Dhistory;f=3DLICENSES;h=3D=
530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=3DHEAD
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core=
/glibc/glibc-common.inc
> index 90a6a534f3..7e3dc3b816 100644
> --- a/meta/recipes-core/glibc/glibc-common.inc
> +++ b/meta/recipes-core/glibc/glibc-common.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "GLIBC (GNU C Library)"
>  DESCRIPTION =3D "The GNU C Library is used as the system C library in mo=
st systems with the Linux kernel."
>  HOMEPAGE =3D "http://www.gnu.org/software/libc/libc.html"
>  SECTION =3D "libs"
> -LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> +LICENSE =3D "GPL-2.0-only & LGPL-2.1-only & BSD-4-Clause-UC & BSD-3-Clau=
se & ISC"
> =20
>  LIC_FILES_CHKSUM ?=3D "file://LICENSES;md5=3D1541fd8f5e8f1579512bf05f533=
371ba \
>        file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \

I don't mind updating this but I think we'd need to add something to
LIC_FILES_CHKSUM to show where the context under BSD* is...

Cheers,

Richard



