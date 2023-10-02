Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6208FE784AC
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 12:30:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.80377.1696249809959924198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 05:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c9QoqbET;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-406618d0991so25888005e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 05:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696249808; x=1696854608; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TEkrD/mg1s8LF2LmIsUWd46/CHs4qzvaBHhVCkvqTqk=;
        b=c9QoqbET0ynBqvCdNVpsqfzQll3w/bTFsRIgKez2xJXzzW/pcujs+kSVIN9+p7nqXw
         fH9XrL/APCvxoyOvJ/DI4VXJi3gIk623UX+Wr0v8JvQIBCedt5H7wClbiQCjyDyl1jjE
         ZzksPxNUXICZxsdPpOuvO2GrbHIqIOsNRkXAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696249808; x=1696854608;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TEkrD/mg1s8LF2LmIsUWd46/CHs4qzvaBHhVCkvqTqk=;
        b=w6SfNKVjWwqJP2Yb3ADsIjK4JAJQvImvwJmfCOSarawXoIALIpzo2q83+5Hi5IIPY8
         OpRQgWTFdwHKOPc0WG2dHq+Ap5e8bk98y22XYEU9VpKHWZEwA4ES4PPNxOHh82zP3txm
         bNFp9bcn5s77vQ8A1lpInabu84qwVP6MEknsjB3KTDM1txXf9R+quL/yzR0V/bKiszjw
         Pjpy6rigox9Dg5Ew2baM15joZMVVN2ezEho7qxFF+6jxZHeJm3xZi7NBi1M/35NXm2wv
         S//WKUp8oUFRvYX0Nn/WBeGdBDX7adb4Pq/IeBxo+Ezzm0QTkojZ3rdK/crrlCZVE6a7
         u6vg==
X-Gm-Message-State: AOJu0YzxYidX+oKYGDFnZSC50aH+wLd3qJqbETOZBeljYz4vAN4piZMV
	ZfLmtcsCYq6ia4dmAsJ5D4/dUg==
X-Google-Smtp-Source: AGHT+IG0VkRPbrQejdoFN23vUV/eDhD/Uzts0EePzjz7qByHl7CBFgj/faFc1TqP5BCrD7+spL8Qgw==
X-Received: by 2002:a7b:ce89:0:b0:402:f07c:4b48 with SMTP id q9-20020a7bce89000000b00402f07c4b48mr8820535wmj.28.1696249808264;
        Mon, 02 Oct 2023 05:30:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:56f3:dc47:6cbe:b39e? ([2001:8b0:aba:5f3c:56f3:dc47:6cbe:b39e])
        by smtp.gmail.com with ESMTPSA id 6-20020a05600c22c600b00406447b798bsm7134867wmg.37.2023.10.02.05.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 05:30:07 -0700 (PDT)
Message-ID: <2adf30ea3f6de6bbb662cbac802c5ce7b3ac7cd5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-numpy: remove obsolete reproducible
 workaround
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Mon, 02 Oct 2023 13:30:07 +0100
In-Reply-To: <20231002110405.3695525-1-ross.burton@arm.com>
References: <20231002110405.3695525-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 12:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188605

On Mon, 2023-10-02 at 12:04 +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>=20
> We currently delete some pycache files because frozenset wasn't able to
> be reproducible, but this has been fixed in Python 3.11:
>=20
> https://github.com/python/cpython/commit/33d95c6facdfda3c8c0feffa7a99184e=
4abc2f63
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3-numpy_1.26.0.bb | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb b/meta/=
recipes-devtools/python/python3-numpy_1.26.0.bb
> index 4e1e34e8df3..3ae40a33fb4 100644
> --- a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
> @@ -30,15 +30,6 @@ do_compile:prepend() {
>      export NPY_DISABLE_SVML=3D1
>  }
> =20
> -# Unfortunately the following pyc files are non-deterministc due to 'fro=
zenset'
> -# being written without strict ordering, even with PYTHONHASHSEED =3D 0
> -# Upstream is discussing ways to solve the issue properly, until then le=
t's
> -# just not install the problematic files.
> -# More info: http://benno.id.au/blog/2013/01/15/python-determinism
> -do_install:append() {
> -	rm ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/typing/tests/data/pass/__pycach=
e__/literal.cpython*
> -}
> -
>  FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.=
a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
> =20

Are you 100% sure we use python3-native to build the pyc files? I ask
as I can't face chasing yet another reproducibility bug down!

Cheers,

Richard

