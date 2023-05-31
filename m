Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A789CC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 19:13:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.3231.1685560394502181502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 12:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=fotZFM5D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f603d4bc5bso134295e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 12:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685560393; x=1688152393;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVz/R8Rf5T/5ZGC0bpS6e4mQItUDnHrEG/pwO/DaOhY=;
        b=fotZFM5Dlj/ybQk5dUq6aHgYrANhlWuHDdSvvPKgl+FTjiIEajm+fy62ghLKMUIF5N
         CAUGN7UnQLhaQHgL1nQZpeROEcUfXnO8WyUck+3LCKkox8IvfSqkKkaKkvRozta+gCom
         dgbRVcSY364o/DUwH97Gx1WTqgWHapqbEIh3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560393; x=1688152393;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nVz/R8Rf5T/5ZGC0bpS6e4mQItUDnHrEG/pwO/DaOhY=;
        b=KBm/MXMvrn8nmLJwEm2t4KQNbMmF0x3WEjbPvv2XTl+hZGjnvb47FoiIr3D1EI4dqj
         WSiwRd+sRRfv9PfeHZevbLnileU3prVB1F7Npcz8LG/5BavqQr/pI0DOPHmXaO1A6Kj8
         w4jmhSoRCHbZorACF0xVfpBYS9ASu6by8THC0sR7XL7mBMcbHtzynPJeSXN8KN3R9UoJ
         cja/8aM9osa9/z18X9JpP+6XQGlYWSlHlvYBKHuvIDc5uWcPvwe6S6JSDZWerZmP9E18
         nB4lcoiLceP/JJJquoXZ5RW0HjLS/zv2QUISIeuZH2UECSCgBy/6/DCmWflU5SejBr9M
         fDHw==
X-Gm-Message-State: AC+VfDzF4L9b38QNXhPm7EqVJlYTfhmHJWsDue13Px+oMeGPClraxSSe
	kC4YbEaqQGfB+Ehf6/h8QnvJpw==
X-Google-Smtp-Source: ACHHUZ65ex2CvAwGx/lMWpAsgU4vn8TG5stfQ7gh4LsU65Hk9KT2xeAyKtHU3WMKCiLpHBH+WWFsYg==
X-Received: by 2002:a7b:cb57:0:b0:3f6:15f:e401 with SMTP id v23-20020a7bcb57000000b003f6015fe401mr195295wmj.37.1685560392875;
        Wed, 31 May 2023 12:13:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422? ([2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422])
        by smtp.gmail.com with ESMTPSA id j12-20020a5d564c000000b0030af31c8c63sm6987891wrw.47.2023.05.31.12.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:13:12 -0700 (PDT)
Message-ID: <c6356dfa396b9f72c11ecf111102db4437636454.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] python_hatchling: remove empty python sysroot
 dirs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2023 20:13:11 +0100
In-Reply-To: <20230531190816.1656739-1-tgamblin@baylibre.com>
References: <20230531190816.1656739-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 19:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182036

On Wed, 2023-05-31 at 15:08 -0400, Trevor Gamblin wrote:
> In some cases, empty versioned directories are being left behind in
> sysroots from previous versions of packages. This appears to be found
> with recipes relying on hatchling, and causes errors at the do_compile
> step:
>=20
> >   File "/workspace/yocto/manual/openembedded-core/build/tmp-glibc/work/=
core2-64-oe-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/=
python3.11/site-packages/packaging/version.py", line 197, in __init__
> >     match =3D self._regex.search(version)
> >             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > TypeError: expected string or bytes-like object, got 'NoneType'
>=20
> To fix this error, add a do_prepare_recipe_sysroot postfunc in the
> python_hatchling class that removes any nested empty directories from
> the sysroots during build, so that dependent recipes don't get caught
> on them.
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  meta/classes-recipe/python_hatchling.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/classes-recipe/python_hatchling.bbclass b/meta/classes-=
recipe/python_hatchling.bbclass
> index b9e6582eb5..a20e243161 100644
> --- a/meta/classes-recipe/python_hatchling.bbclass
> +++ b/meta/classes-recipe/python_hatchling.bbclass
> @@ -7,3 +7,12 @@
>  inherit python_pep517 python3native python3-dir setuptools3-base
> =20
>  DEPENDS +=3D "python3-hatchling-native"
> +
> +# delete nested, empty directories from the python site-packages path. W=
e don't use=20
> +# ${PYTHON_SITEPACKAGES_DIR} in the path specification so that python3-h=
atchling=20
> +# still builds OK
> +hatchling_rm_emptydirs () {
> +        find ${RECIPE_SYSROOT_NATIVE}/usr/lib/${PYTHON_DIR}/site-package=
s/* -depth -type d -empty -delete
> +}
> +
> +do_prepare_recipe_sysroot[postfuncs] +=3D " hatchling_rm_emptydirs"

Looking at the patch, this is the right direction I'm not 100%
convinced the details are quite right.

Should we be clearing from RECIPE_SYSROOT or RECIPE_SYSROOT_NATIVE?
Also, can we avoid hardcoding /usr/lib? That probably won't work for
multilibs or some other combinations of settings some use.

Cheers,

Richard



