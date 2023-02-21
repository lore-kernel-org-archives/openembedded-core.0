Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C79C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:34:16 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.39475.1676975649046638572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qDPBXUE2;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id x24so5197485lfr.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 02:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b1sLZKV0TD4FGebi4w11qahin2ZAGRqoqrE0oLmG2iE=;
        b=qDPBXUE28hyJYaJ0BVFUnsci+Nw4fYvJQ8LqkNbj5+1OD/4G13z16e3iUYwTHqmXJ1
         JmaFSrkg2stPlIqoqiBdAl1bWaNIjHIWdIGxWoRzvt2Do6nxCWoaBXcNc7wkN9d7bwzN
         wWHd8+wgodHRAGuXzZ8b4JU4zlGZjV7HwkVjwmZP2Iv2dGmOXPloKVluZSE7bnoo6ei9
         eoDh0RC9FtmjbIpN8DYZl72NsiERfhIHOFCNKngOWMmpI6sPjWTYw/qeQEnF2dPM2Xb2
         5Oon0F2zoJ1ByVbp8SkjU/b3U6b6bgkO0S8e+tiLrfZidjVQbnF/i9ksz6F8cviEkcux
         YIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1sLZKV0TD4FGebi4w11qahin2ZAGRqoqrE0oLmG2iE=;
        b=d1/l3qgePfHvrZSAHxwc9LTgdWAZzGCdJgyW5GTBn/IPhGghZ8M+wyy3Hy4xUzt9g7
         c71gKFMJJaBu/2WKZfISkuyEpU1cR09NdjXrpVzKJpJAQ/+YNKJRlJKzIqFGc5stSKcY
         i1m1bMACf4f1Ea7fxYpFaxrfpcvHPlfp7bA5Vl6gNIXOx4S1n/Dnt2Wnw0Xi33gCYlh/
         b3rcECjIJGamabFK48UkKkXl64ZlJ/5rzUU6cT/nqgzCLlS9YyblN+6uV0nGhYnU0LpM
         shAdujqY9zL26Nyyc12dvRXZOWwkjZomnNc4HwSWP9sGUoryDv3f5brQlzP9Q3gRSUcc
         j2VA==
X-Gm-Message-State: AO0yUKVI+LGmEyQex/QdFObLanCYi6mA2g7o/7cJZAajShUVHEitw0iG
	XXTybRJSupht678cTQZBm0ooQRJjcC1bQo5PKV4=
X-Google-Smtp-Source: AK7set+ZgKknGzyxJYtm83lizPKF2ef2+6hOaBl+2kH00EE/0uMjhIWEq53zwq0AinchFLKSX6emmvpmVZlRtWuBHV4=
X-Received: by 2002:ac2:548c:0:b0:4db:345d:4f8a with SMTP id
 t12-20020ac2548c000000b004db345d4f8amr1513095lfk.11.1676975646855; Tue, 21
 Feb 2023 02:34:06 -0800 (PST)
MIME-Version: 1.0
References: <20230221102927.3454570-1-rich@richelberger.com> <0100018673857e8b-00b0aec2-b383-481a-bf90-e830b0590bc8-000000@email.amazonses.com>
In-Reply-To: <0100018673857e8b-00b0aec2-b383-481a-bf90-e830b0590bc8-000000@email.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Feb 2023 11:33:55 +0100
Message-ID: <CANNYZj9RvpmMR=GK-H806n7RK2KPRK0Accwc-b7LNBGxfJ_UZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] docbook-xml: Switch from debian packages to
 upstream docbook sources
To: Richard Elberger <rich@richelberger.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177492

Thanks, I do not have any further comments. The next step is taking
this through the automated test matrix.

Alex

On Tue, 21 Feb 2023 at 11:29, Richard Elberger <rich@richelberger.com> wrote:
>
> This patch changes the docbook-xml distribution package source from
> debian to docbook which aligns the recipe with the source
> originator. Other changes made to the recipe include:
>
> This patch resolves [YOCTO #13270].
>
> - removal of version 4.0 given docbook no longer distributes version
>   4.0
> - simplification of the header description.
> - inline comments to communicate the rationale behind gathering
>   multiple versions and LICENSE file handling.
> - minor ordering changes to align with styling conventions and better
>   context to better communicate use - i.e. the inherit statements and
>   related operations.
>
> Signed-off-by: Richard Elberger <rich@richelberger.com>
> ---
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 60 ++++++++++++-------
>  1 file changed, 39 insertions(+), 21 deletions(-)
>
> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> index 2bec1442af..dd6159b2f3 100644
> --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> @@ -1,28 +1,46 @@
>  SUMMARY = "Document type definitions for verification of XML data files"
>  DESCRIPTION = "Document type definitions for verification of XML data \
> -files against the DocBook rule set, it ships with the latest DocBook 4.5 \
> -XML DTD, as well as a selected set of legacy DTDs for use with older \
> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
> -HOMEPAGE = "http://www.docbook.org/xml/"
> +files against the DocBook rule set."
> +HOMEPAGE = "https://docbook.org"
> +
> +# The upstream sources are not distributed with a license file.
> +# LICENSE-OASIS is included as a "patch" to workaround this. When
> +# upgrading this recipe, please verify whether this is still needed.
>
>  LICENSE = "OASIS"
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
>
> -# Note: the upstream sources are not distributed with a license file.
> -# LICENSE-OASIS is included as a "patch" to workaround this. When
> -# upgrading this recipe, please verify whether this is still needed.
> -SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
> -           file://LICENSE-OASIS \
> -           file://docbook-xml-update-catalog.xml.patch \
> -"
> +# To support apps with xml schema backward compatibility, we must
> +# install a set of schemas. Install the latest based on PV and then
> +# name any specific versions as required. TODO: Figure out a mechanism
> +# to filter exactly which versions are necessary, if that's even
> +# possible.
> +#
> +# DocBook.org lists available release packages at https://docbook.org/xml/.
> +#
> +# The release packages relate docbook source at
> +# https://github.com/docbook/docbook but building them requires the
> +# Gradle build system. In future, it might be safer to use the source
> +# tree which would also enable proper SBOM generation through the
> +# bitbake build system.
> +#
>
> -SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
> -SRC_URI[sha256sum] = "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
> +SRC_URI = "https://docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=docbook-xml-4.1.2 \
> +           https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=payload42;subdir=docbook-xml-4.2 \
> +           https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=payload43;subdir=docbook-xml-4.3 \
> +           https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-xml-4.4 \
> +           https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-xml-${PV} \
> +           file://LICENSE-OASIS"
>
> -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/"
> +SRC_URI[payload412.sha256sum] = "30f0644064e0ea71751438251940b1431f46acada814a062870f486c772e7772"
> +SRC_URI[payload42.sha256sum] = "acc4601e4f97a196076b7e64b368d9248b07c7abf26b34a02cca40eeebe60fa2"
> +SRC_URI[payload43.sha256sum] = "23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d6b62cc1695931f5c143464"
> +SRC_URI[payload44.sha256sum] = "02f159eb88c4254d95e831c51c144b1863b216d909b5ff45743a1ce6f5273090"
> +SRC_URI[payloadPV.sha256sum] = "4e4e037a2b83c98c6c94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4"
>
> -S = "${WORKDIR}/docbook-xml-4.5.c31424"
> +UPSTREAM_CHECK_REGEX = "docbook-xml-(?P<pver>4(\.\d+)).zip"
>
> +S = "${WORKDIR}"
>  inherit allarch
>  BBCLASSEXTEND = "native"
>
> @@ -34,19 +52,19 @@ do_compile (){
>      :
>  }
>
> +inherit xmlcatalog
> +
>  do_install () {
>      install -d ${D}${sysconfdir}/xml/
>      xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-xml.xml
>
> -    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
> +    for DTDVERSION in 4.1.2 4.2 4.3 4.4 4.5; do
>          DEST=${datadir}/xml/docbook/schema/dtd/$DTDVERSION
>          install -d -m 755 ${D}$DEST
> -        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
> -        xmlcatalog --verbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
> +        cp -v -R docbook-xml-$DTDVERSION/* ${D}$DEST
> +        xmlcatalog --verbose --noout --add nextCatalog unused \
> +          file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
>      done
>  }
>
> -XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
> -inherit xmlcatalog
> -
>  FILES:${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
> --
> 2.34.1
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177490): https://lists.openembedded.org/g/openembedded-core/message/177490
> Mute This Topic: https://lists.openembedded.org/mt/97106035/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

