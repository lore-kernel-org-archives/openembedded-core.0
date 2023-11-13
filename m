Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC8BC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 13:42:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.36910.1699882959301193609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 05:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d49hNaod;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4083740f92dso36104655e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 05:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699882957; x=1700487757; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFdskArmXf26GpYuD55lfqDc77wP70iwUdtFaywNpuE=;
        b=d49hNaodNFRNOpyRPPKJfLfMn/XRbffOFgL79SWR45VEZ2QBpGNw0NwijUQfsxzhG4
         d4S98lyuKrCy01CCiG60f1RezxnPf7V4yDa8Q5EcmkUZe271C+VmGRl+C7iMaUa6devW
         fhU0H2aP71ZGo+Mvv2WydaO6/U4E1CMDMk7Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699882957; x=1700487757;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFdskArmXf26GpYuD55lfqDc77wP70iwUdtFaywNpuE=;
        b=QKjRL0fZky1M+VyMpUnCR7d3ixZ8nu6IYWCpVWDSBeS7uRYQ9HQAj09OpzTLtdk4AJ
         rfky/7OBEa9YmDgEeK0eZLPdzTZjd6QgEYyGROU4fjokJEWHBBoh5xQVU36Xj6b27reE
         gruAhItoKtY5rglhXcwh9unzyOuqh5G50NVRyv+vJwlD5UwHNZEL/6SQkjthP0J34awg
         yh92aEGnFO3GBB4doJ0Tke1xFEEGLj6LOkjCOq96PlAtKv5XD+cxpbyRRCqBVOTi7kVd
         Nvl4Qci40xzrnJSmhKgfVP9rO7MX4s4cpGaWtC9Fjq8urvAD+fUvAK5LHURV3G8V/mB7
         /sCg==
X-Gm-Message-State: AOJu0Ywg5g51QTwTqJMG794MUUQpBUggf0rupWele/hxigwjbwIrs/P+
	5cbmTmadY1swB7h57ZDb8R3G2Q==
X-Google-Smtp-Source: AGHT+IHyYJxHghatRK6ZDvjkH3JvTxPy0W8ZQhHN1Ei9IWOA0tin28Fz5vsfZqV10r20AtBDe84CTA==
X-Received: by 2002:a5d:6809:0:b0:32f:7d70:529e with SMTP id w9-20020a5d6809000000b0032f7d70529emr5646366wru.63.1699882955807;
        Mon, 13 Nov 2023 05:42:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f440:7406:36f8:870a? ([2001:8b0:aba:5f3c:f440:7406:36f8:870a])
        by smtp.gmail.com with ESMTPSA id f14-20020a056000128e00b003313069be5dsm5457478wrx.46.2023.11.13.05.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 05:42:35 -0800 (PST)
Message-ID: <9d7f39468c47e3ce9f15729562cd69f74b064f15.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix
 reproducibility issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2023 13:42:34 +0000
In-Reply-To: <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
	 <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 13:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190468

On Sat, 2023-11-11 at 05:03 -1000, Steve Sakoman wrote:
> We are seeing reproducibility issues where gcc-cross sometimes defaults
> to gnu11 and other times to gnu17.
>=20
> Specify std=3Dgnu17 rather than leave this to chance.
>=20
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/lz4/lz4_1.9.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support=
/lz4/lz4_1.9.2.bb
> index c2e24b518c..8cf71fdc04 100644
> --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
> +++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
> @@ -23,6 +23,7 @@ S =3D "${WORKDIR}/git"
>  # Fixed in r118, which is larger than the current version.
>  CVE_CHECK_WHITELIST +=3D "CVE-2014-4715"
> =20
> +CFLAGS_append =3D " -std=3Dgnu17"
>  EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' D=
ESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=3D=
no"
> =20
>  do_install() {

I've looked into this a lot more and I'm now of the opinion this is
totally wrong and definitely should not merge.

An example failure is:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231109-ch73ktq=
p/packages/diff-html/

First, it is worth noting the huge size difference. It appears debug
line information is being missed out. The difference in cflags is a
false lead, it is because crti.S is compiled with c17 and the producer
string is being mis-compared, the data is missing on one side.

So what we're looking for really is a cflags issue where -g is going
missing.

I did check older failures which look similar:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231105-_xpb575=
y/packages/diff-html/

Since we're looking for cflags issues:

https://github.com/lz4/lz4/commit/7d8d1075e696d585238e6aa6a4f43dc759da250e

looks interesting and leads to:

https://savannah.gnu.org/bugs/?func=3Ddetailitem&item_id=3D59230

If the makefile had intermittently picked up CFLAGS from the
environment, the output would be identical to the previous cflags patch
in the series, which would cross link the hash equivalence
inputs/outputs and could generally confuse things.

The real question is which autobuilder worker is compiling without the
-g option and is it a make bug? Perhaps it doesn't matter and we just
need to force the input and output hashes to change to stop the errors
once the previous patch is applied.

Cheers,

Richard



