Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3571BC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 13:09:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.12291.1676898551639862564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 05:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iELQETzj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id l25so746464wrb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 05:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOd+oUgAGNkDmgDn5sDZB1Y79H+fydCn5Z1pO/PWd3I=;
        b=iELQETzjKAWaemJAoGBQTcdBaNMjZxu5TLogURPkfhazvkSOyccmLVKXSd2PdYP4YC
         5mWxQeUn/uEwi6HezSy2v7AsQII5XBxOiF45/cfX3JWYn3SHd0NAUrq+qxudpc5g6ly7
         +gf04dBQosPzwRwDs7kx0XpwdF/+0JK2qyHJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOd+oUgAGNkDmgDn5sDZB1Y79H+fydCn5Z1pO/PWd3I=;
        b=yPLhRHgR2FyxW4RyWAS4pWUJsaP6TC9A0w3o7MldQcqUNHdNxjskdEdo9E00Fk8is3
         mKIcOXrfw+m96+Eli2Dzb8kQezPZPk4aBwP8CBiyjGfx1UFwzWESOyfOkXQYhOtuzr3o
         MLxlhWyd04AR8KXCtuvJ0YP1wedsCKFaX90vHvC5VAQehYzGIdcOg7c0aeGGQuQbcLW1
         +LknC4d1F6VZG+Sy7qevRLZVmDsgKyKbj0ZyVs4vASRUIP+vF3jd+k5VxIGvJa/nBGj8
         oRQAPpDxCHi0yN94XZPoVItyKdseWk92MEWKtaqvLNQ0GIK+JWLKVkvu59F2lKBCsGEh
         n3dA==
X-Gm-Message-State: AO0yUKU140D/wYus5sZMlFrAHBBbl13yeCigILVf7/pNbKf0zEjqNrz3
	2NNQ42W4c/xrzSOo/q8r7CgIqw==
X-Google-Smtp-Source: AK7set8eQsJoxEfR5RmceKsTtoZl42bMNBnY3pFWKzzgPhiBxuytfxstHzVTkMIP9tfjF+kmOc82yA==
X-Received: by 2002:adf:fe87:0:b0:2c5:54a7:363e with SMTP id l7-20020adffe87000000b002c554a7363emr1749649wrr.3.1676898550022;
        Mon, 20 Feb 2023 05:09:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6c6b:45a8:4f0f:7fab? ([2001:8b0:aba:5f3c:6c6b:45a8:4f0f:7fab])
        by smtp.gmail.com with ESMTPSA id f4-20020a7bcd04000000b003e00c9888besm9289228wmj.30.2023.02.20.05.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 05:09:09 -0800 (PST)
Message-ID: <fc03a41ca8542e5f7f83e828f310f57ea8ff1209.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] [YOCTO #13270] Refactor the docbook-xml
 recipe to use docbook.org packages rather than hacked up debian package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Richard Elberger <rich@richelberger.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Feb 2023 13:09:08 +0000
In-Reply-To: <010001866b9cf531-82d2c73e-d459-4055-93f9-a7c83fcce6f9-000000@email.amazonses.com>
References: <20230219213807.3415938-1-rich@richelberger.com>
	 <010001866b9cf531-82d2c73e-d459-4055-93f9-a7c83fcce6f9-000000@email.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 13:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177401

Hi Richard,

Thanks for the patch!

There are a few things that need tweaking. Firstly, the shortlog and
commit log aren't quite right. The shortlog needs to be along the lines
of:

<area/recipename>: <short summary of the change>

so something like:

docbook-xml: Switch from debian packages to upstream docbook sources

This means someone glancing at the shortlogs can know which area it
applies to and what it was about (in summary).

After this you'd have a more verbose log message and I usually put the
[YOCTO #13270] at the end on a line of it's own.

I've commented a little more below inline.=C2=A0

I think 4.0 support was removed, if so, that should be mentioned in the
commit message log. I then noticed the note about that is in the other
commit, it should be in this one!

On Sun, 2023-02-19 at 21:38 +0000, Richard Elberger wrote:
> ---
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 74 ++++++++++++-------
>  1 file changed, 49 insertions(+), 25 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/=
meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> index 2bec1442af..71aa8c14ec 100644
> --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> @@ -1,30 +1,54 @@
>  SUMMARY =3D "Document type definitions for verification of XML data file=
s"
>  DESCRIPTION =3D "Document type definitions for verification of XML data =
\
> -files against the DocBook rule set, it ships with the latest DocBook 4.5=
 \
> -XML DTD, as well as a selected set of legacy DTDs for use with older \
> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
> -HOMEPAGE =3D "http://www.docbook.org/xml/"
> +files against the DocBook rule set."
> +HOMEPAGE =3D "https://docbook.org"
> =20
> -LICENSE =3D "OASIS"
> -LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7=
f215e669e7639a0b1d2e"
> +inherit allarch
> +BBCLASSEXTEND =3D "native"

BBCLASSEXTEND by concention is at the end of the recipe. I see it moves
in the second patch and it wasn't clear what the two different purposes
of the patch were. Style fixes are ok as patch but if the first patch
is introducing them, we may as well squash things?
>=20
> -# Note: the upstream sources are not distributed with a license file.
> -# LICENSE-OASIS is included as a "patch" to workaround this. When
> -# upgrading this recipe, please verify whether this is still needed.
> -SRC_URI =3D "http://snapshot.debian.org/archive/debian/20160728T043443Z/=
pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
> -           file://LICENSE-OASIS \
> -           file://docbook-xml-update-catalog.xml.patch \
> -"
> +# To support apps with xml schema backward compatibility, we must
> +# install a set of schemas. Install the latest based on PV and then
> +# name any specific versions as required. TODO: Figure out a mechanism
> +# to filter exactly which versions are necessary, if that's even
> +# possible.
> +#
> +# DocBook.org lists available packages at https://docbook.org/xml/
> +#
> +# These packages are available as source but it requires the ability
> +# to use the Gradle build system to do so. It might be safer to use
> +# the source tree which would also enable proper SBOM generation
> +# through the bitbake build system. https://github.com/docbook/docbook

"packages" is an overloaded term. Do you mean packages here? Components
maybe?

> +#=20
> =20
> -SRC_URI[md5sum] =3D "487b4d44e15cffb1f4048af23f98208e"
> -SRC_URI[sha256sum] =3D "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441=
db372e0f17b2a44f"
> +S =3D "${WORKDIR}"
> =20
> -UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/d/docbook-xml/"
> +SRC_URI +=3D "https://docbook.org/xml/4.1.2/docbkx412.zip;name=3Dpayload=
412;subdir=3Ddocbook-xml-4.1.2"
> +SRC_URI[payload412.md5sum] =3D "900d7609fb7e6d78901b357e4acfbc17"

We've effectively dropped md5sums so there is no need to add new ones.

Cheers,

Richard

