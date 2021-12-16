Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7F1C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 17:25:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.13483.1639675524245240575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199,
 mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 33B54FF805;
	Thu, 16 Dec 2021 17:25:21 +0000 (UTC)
Date: Thu, 16 Dec 2021 18:25:19 +0100
From: Quentin Schulz <foss@0leil.net>
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-idna: Drop from OE-Core
In-Reply-To: <20211216132218.857571-1-richard.purdie@linuxfoundation.org>
References: <20211216132218.857571-1-richard.purdie@linuxfoundation.org>
Message-ID: <1D26D2EC-227C-469A-8051-C4808091ECF0@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 17:25:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159800

Hi Richard,

On December 16, 2021 2:22:18 PM GMT+01:00, Richard Purdie <richard=2Epurdi=
e@linuxfoundation=2Eorg> wrote:
>The only recipe mentioning python3-idna in OE-Core is python3-jsonschema=
=2E
>python3-jsonschema only depends on it if the nongpl package config option
>is set=2E We don't set this option=2E
>

That is unfortunately incorrect, it is also part of the format PACKAGECONF=
IG which is by default included=2E

>The idna recipe has license issues with questions around the Unicode lice=
nse
>(still in meta-oe) and which version variant it should mean=2E We see QA =
warnings
>in automated testing from this:
>

I still shall open an issue on the GitHub tracker of the project to raise =
this=2E

Cheers,
Quentin

>do_populate_lic: QA Issue: python3-idna: No generic license file exists f=
or: Unicode in any provider [license-exists]
>
>Lets drop the recipe and if needed, it can be in meta-oe=2E
>
>Signed-off-by: Richard Purdie <richard=2Epurdie@linuxfoundation=2Eorg>
>---
> meta/conf/distro/include/maintainers=2Einc      |  1 -
> =2E=2E=2E/python/python3-idna_3=2E3=2Ebb                | 19 -----------=
--------
> 2 files changed, 20 deletions(-)
> delete mode 100644 meta/recipes-devtools/python/python3-idna_3=2E3=2Ebb
>
>diff --git a/meta/conf/distro/include/maintainers=2Einc b/meta/conf/distr=
o/include/maintainers=2Einc
>index 8e86ea45d2f=2E=2E85d8a5396aa 100644
>--- a/meta/conf/distro/include/maintainers=2Einc
>+++ b/meta/conf/distro/include/maintainers=2Einc
>@@ -605,7 +605,6 @@ RECIPE_MAINTAINER:pn-python3-extras =3D "Oleksandr Kr=
avchuk <open=2Esource@oleksandr
> RECIPE_MAINTAINER:pn-python3-git =3D "Oleksandr Kravchuk <open=2Esource@=
oleksandr-kravchuk=2Ecom>"
> RECIPE_MAINTAINER:pn-python3-gitdb =3D "Oleksandr Kravchuk <open=2Esourc=
e@oleksandr-kravchuk=2Ecom>"
> RECIPE_MAINTAINER:pn-python3-hypothesis =3D "Tim Orling <timothy=2Et=2Eo=
rling@intel=2Ecom>"
>-RECIPE_MAINTAINER:pn-python3-idna =3D "Bruce Ashfield <bruce=2Eashfield@=
gmail=2Ecom>"
> RECIPE_MAINTAINER:pn-python3-importlib-metadata =3D "Tim Orling <timothy=
=2Et=2Eorling@intel=2Ecom>"
> RECIPE_MAINTAINER:pn-python3-iniconfig =3D "Tim Orling <timothy=2Et=2Eor=
ling@intel=2Ecom>"
> RECIPE_MAINTAINER:pn-python3-iniparse =3D "Oleksandr Kravchuk <open=2Eso=
urce@oleksandr-kravchuk=2Ecom>"
>diff --git a/meta/recipes-devtools/python/python3-idna_3=2E3=2Ebb b/meta/=
recipes-devtools/python/python3-idna_3=2E3=2Ebb
>deleted file mode 100644
>index a0e6b79a565=2E=2E00000000000
>--- a/meta/recipes-devtools/python/python3-idna_3=2E3=2Ebb
>+++ /dev/null
>@@ -1,19 +0,0 @@
>-SUMMARY =3D "Internationalised Domain Names in Applications"
>-HOMEPAGE =3D "https://github=2Ecom/kjd/idna"
>-LICENSE =3D "BSD-3-Clause & Python-2=2E0 & Unicode"
>-LIC_FILES_CHKSUM =3D "file://LICENSE=2Emd;md5=3D239668a7c6066d9e0c5382e9=
c8c6c0e1"
>-
>-SRC_URI[sha256sum] =3D "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160b=
c32796e824360e6d"
>-
>-inherit pypi setuptools3
>-
>-# Remove bundled egg-info
>-do_compile:prepend() {
>-    rm -rf ${S}/idna=2Eegg-info
>-}
>-
>-RDEPENDS:${PN}:class-target =3D "\
>-    ${PYTHON_PN}-codecs \
>-"
>-
>-BBCLASSEXTEND =3D "native nativesdk"

