Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.75])
 by mx.groups.io with SMTP id smtpd.web10.1486.1620241618183970329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 12:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=fi3CnIZy;
 spf=pass (domain: outlook.com, ip: 40.92.66.75, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWYE7l/gjvlSArshqzAgYkXZA1oTFY3bpg4l2EC6zmPA7BJ4J1DxYPZH7BIISGxzl83jPtzYCR50tXywGwYjpggeWkDVGoEuSflDWKuFmj/YGUssQLm6vr81GspDnxJdKRMaEAHW987Cbohn4V+fG5jURC3RW+NEMZKg+irtfvsBoBDfn9hpNvsDaJc5mwCamKu2J3JA6Tn/9qVY0wYry6wQtcvrVuG92SE9LzOTqrfiFq8fetHAgamss/WaUNYwhqLnj6xkSmf1q8Qd03j/OMWoADfcDANyckH4Y+VSWSloDMZbyvBWuC7BIogIS3ARLc9i5l2F34LOEXVG1+z09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8lsHnhDGcKgog9Rvxu8VigJ+obAZXp1jFXMXk8x6cU=;
 b=VaDRTOkF4LYilfBtLO9smRhMlEewNrplli42GXja8T/LPb/fnbASEiDxAF4Zulurm4Lh+hEQLnbuVg1DQqo2YT8Ouvpr2fst+TAJIDssuor4sRou900+KtEKkUVbl3PMGok4Ov14aurCcOOrHOmYMMqEyXaA8Z+kqBX+MKkBxBqQUp/mhpm/e7iO2lM/Csx8yqvh1Yk2ZjtV8waWZK/etoUyIUKvbtDxyq6GDJciM94+iWOJ6Ij7Do7dC1cDPRc1pG0qHHmg7jdXrNd8OJa25SW3+H8sKCUdE0NSbWfslTfCrbNCiC+d9m3s4GEvb2Z/xtQTHWufV08t9n4Sb/3NBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8lsHnhDGcKgog9Rvxu8VigJ+obAZXp1jFXMXk8x6cU=;
 b=fi3CnIZy+j6JMLbQas1DO31kBrZSzWR0wdMVgViZw5L8rz/p37enUngZB6RJOQ0wJ/dEFIp/IAivjDY1Q4O1x5VzYQxMkd64p1yAKIrVpSrHguAn6WhsbkDex3e+k0pIpXfUZhGOtYagOmp1D/jh0XdSikrU8bsDqRNRk6YqXVbj9Bxo4Fbb8S7E/+/KkVOOz4z/vzXF8dNCM4Epk4YD/zmD4JyQTV34oCoqGbl949WOaTICAWo8OXAH9XVygGzd77LSvupy0POS9FYVWqlhjddf5ASUvz8g6DBZ2rSgUnIlUAbwo5SyTBqN0qLgmRYnL0D3pv923HDQfgWw5uvKEA==
Received: from DB5EUR01FT029.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::49) by
 DB5EUR01HT107.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::167)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 5 May
 2021 19:06:55 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1a::4b) by DB5EUR01FT029.mail.protection.outlook.com
 (2a01:111:e400:7e1a::241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 5 May 2021 19:06:55 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:7A6553408358F773A3005D45E598680673498B81878FEA510ADAD9A1FD5AD6DC;UpperCasedChecksum:A200ED365C4E12DD4F15AC936505DBEAECCB1DEBD02ABE8EE0D403730ABFEEDC;SizeAsReceived:9064;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4108.025; Wed, 5 May 2021
 19:06:55 +0000
Subject: Re: [OE-core] [PATCH 57/61] python3: add markdown/smartypants/typogrify modules
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-57-alex.kanavin@gmail.com>
 <AM9PR09MB4642132C2006E4609CA966C7A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1sreCuyXW2wNh_1xaG+E_T=NFLuLq68vmFQegDJ1HTWiYg@mail.gmail.com>
 <CANNYZj8VfB5sO4O3tjpUDHseBTMwYG-kRGwVUERmAjJSH61=oA@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB464224482626504F72484641A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 5 May 2021 21:06:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CANNYZj8VfB5sO4O3tjpUDHseBTMwYG-kRGwVUERmAjJSH61=oA@mail.gmail.com>
X-TMN: [FIyoiVmv4WXUORdCTKaFV8AwP7Hg54q/]
X-ClientProxiedBy: BEXP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::15)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <d81d3957-a3e3-4207-8d99-8beee03c1d0c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.89.134) by BEXP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.9 via Frontend Transport; Wed, 5 May 2021 19:06:54 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8ee7c639-5532-49a7-d23a-08d90ff8f2a7
X-MS-TrafficTypeDiagnostic: DB5EUR01HT107:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tu2yad+hklVs8fKlYKf5VyPvJFOv3HeQHdkHvwnM4Ly/94yrO5NVlTL6krxRTCGb3fp6CMWD0XOCdaBYJfp09RsFadZPCsr6V2GpUTdVYDE7p60MumxQz6hHIL3zZPTMClixII7nOhKcwzF6X9ngU+OSg9f2Ck4jtEhnvVCVqZwPXoFJywrw+1RqdbV06X91kJb8etnhhvwL1rsFp9iqfQssy7HRvlzv9iirJPSLvalsS0efh25ZbxuX126iwnmiC+ZVSJJyhydMSHwTUxuRQWEUjmUrNi7ONHfDTJtpcpA1xZIhvJfJZ1ucPclTcKsUIYSv9zEiPIgzq5LyQvDhVzHq7eBArcrz4d2b44Mrp+ybinfElPOLvjMranpDL4FZteyeBuaryhy7qhgzB+BsCiAtgLheENlue48b2jWEuBQ=
X-MS-Exchange-AntiSpam-MessageData: 
	Daoz/lnhhF/dvRLSl5bwmopzx+nFM55rp5JrjzQmNYoFHjBEYULYJdOLvB5Xqr6joRZhhyT/r8AZFLAzqJpcDbPswSELHRXhnOmt5S1PkdkvzdG+61DXnb1vWLxC3MSyX1aje5YlJ6QdDFvIoUGBhQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee7c639-5532-49a7-d23a-08d90ff8f2a7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 19:06:55.0471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT029.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT107
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05.05.21 21:03, Alexander Kanavin wrote:
> The repo is here:
> https://github.com/leohemsted/smartypants.py=20
> <https://github.com/leohemsted/smartypants.py>
>=20
> I opened an issue:
> https://github.com/mintchaos/typogrify/issues/56=20
> <https://github.com/mintchaos/typogrify/issues/56>

Thanks for that one - but if this project is still alive (just relocated=
=20
from bitbucket to GH), wouldn't it make more sense to introduce the=20
2.0.1 version pulled via git instead of the pretty outdated 2.0.0 from pyp=
i?

>=20
> gi-docgen doesn't depend on it directly, but rather through typogrify.
>=20
> Alex
>=20
> On Wed, 5 May 2021 at 19:51, Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     On Wed, May 5, 2021 at 8:39 AM Konrad Weihmann
>     <kweihmann@outlook.com <mailto:kweihmann@outlook.com>> wrote:
>      >
>      >
>      >
>      > On 05.05.21 17:18, Alexander Kanavin wrote:
>      > > This is needed to enable gi-docgen, a successor to gtk-doc
>      > >
>      > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>      > > ---
>      > >=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++
>      > >=C2=A0 =C2=A0.../python/python3-markdown_3.3.3.bb
>     <http://python3-markdown_3.3.3.bb>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++++++
>      > >=C2=A0 =C2=A0.../python/python3-smartypants_2.0.0.bb
>     <http://python3-smartypants_2.0.0.bb>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 | 12 ++++++++++++
>      > >=C2=A0 =C2=A0.../python/python3-typogrify_2.0.7.bb
>     <http://python3-typogrify_2.0.7.bb>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 14 ++++++++++++++
>      > >=C2=A0 =C2=A04 files changed, 43 insertions(+)
>      > >=C2=A0 =C2=A0create mode 100644
>     meta/recipes-devtools/python/python3-markdown_3.3.3.bb
>     <http://python3-markdown_3.3.3.bb>
>      > >=C2=A0 =C2=A0create mode 100644
>     meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
>     <http://python3-smartypants_2.0.0.bb>
>      > >=C2=A0 =C2=A0create mode 100644
>     meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
>     <http://python3-typogrify_2.0.7.bb>
>      > >
>      > > diff --git a/meta/conf/distro/include/maintainers.inc
>     b/meta/conf/distro/include/maintainers.inc
>      > > index 140f7b490e..0c3e3628ba 100644
>      > > --- a/meta/conf/distro/include/maintainers.inc
>      > > +++ b/meta/conf/distro/include/maintainers.inc
>      > > @@ -608,6 +608,7 @@ RECIPE_MAINTAINER_pn-python3-jinja2 =3D
>     "Richard Purdie <richard.purdie@linuxfound
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-libarchive-c =3D "Josh=
ua Watt
>     <JPEWhacker@gmail.com <mailto:JPEWhacker@gmail.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-magic =3D "Joshua Watt
>     <JPEWhacker@gmail.com <mailto:JPEWhacker@gmail.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-mako =3D "Oleksandr Kr=
avchuk
>     <open.source@oleksandr-kravchuk.com
>     <mailto:open.source@oleksandr-kravchuk.com>>"
>      > > +RECIPE_MAINTAINER_pn-python3-markdown =3D "Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-markupsafe =3D "Richar=
d Purdie
>     <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-more-itertools =3D "Ti=
m Orling
>     <timothy.t.orling@linux.intel.com
>     <mailto:timothy.t.orling@linux.intel.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-nose =3D "Oleksandr Kr=
avchuk
>     <open.source@oleksandr-kravchuk.com
>     <mailto:open.source@oleksandr-kravchuk.com>>"
>      > > @@ -630,11 +631,13 @@ RECIPE_MAINTAINER_pn-python3-scons-native
>     =3D "Tim Orling <timothy.t.orling@linux.
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-setuptools =3D "Oleksa=
ndr Kravchuk
>     <open.source@oleksandr-kravchuk.com
>     <mailto:open.source@oleksandr-kravchuk.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-setuptools-scm =3D "Ti=
m Orling
>     <timothy.t.orling@linux.intel.com
>     <mailto:timothy.t.orling@linux.intel.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-six =3D "Zang Ruochen
>     <zangrc.fnst@fujitsu.com <mailto:zangrc.fnst@fujitsu.com>>"
>      > > +RECIPE_MAINTAINER_pn-python3-smartypants =3D "Alexander Kanavi=
n
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-smmap =3D "Oleksandr K=
ravchuk
>     <open.source@oleksandr-kravchuk.com
>     <mailto:open.source@oleksandr-kravchuk.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-sortedcontainers =3D "=
Tim Orling
>     <timothy.t.orling@linux.intel.com
>     <mailto:timothy.t.orling@linux.intel.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-subunit =3D "Oleksandr=
 Kravchuk
>     <open.source@oleksandr-kravchuk.com
>     <mailto:open.source@oleksandr-kravchuk.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-testtools =3D "Oleksan=
dr Kravchuk
>     <open.source@oleksandr-kravchuk.com
>     <mailto:open.source@oleksandr-kravchuk.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-toml =3D "Tim Orling
>     <timothy.t.orling@linux.intel.com
>     <mailto:timothy.t.orling@linux.intel.com>>"
>      > > +RECIPE_MAINTAINER_pn-python3-typogrify =3D "Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-wcwidth =3D "Tim Orlin=
g
>     <timothy.t.orling@linux.intel.com
>     <mailto:timothy.t.orling@linux.intel.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-zipp =3D "Tim Orling
>     <timothy.t.orling@linux.intel.com
>     <mailto:timothy.t.orling@linux.intel.com>>"
>      > >=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-qemu =3D "Richard Purdie
>     <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>"
>      > > diff --git
>     a/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
>     <http://python3-markdown_3.3.3.bb>
>     b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
>     <http://python3-markdown_3.3.3.bb>
>      > > new file mode 100644
>      > > index 0000000000..c456f05541
>      > > --- /dev/null
>      > > +++ b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
>     <http://python3-markdown_3.3.3.bb>
>      > > @@ -0,0 +1,14 @@
>      > > +SUMMARY =3D "A Python implementation of John Gruber's Markdown=
."
>      > > +HOMEPAGE =3D "https://python-markdown.github.io/
>     <https://python-markdown.github.io/>"
>      > > +LICENSE =3D "BSD-3-Clause"
>      > > +LIC_FILES_CHKSUM =3D
>     "file://LICENSE.md;md5=3D745aaad0c69c60039e638bff9ffc59ed"
>      > > +
>      > > +inherit pypi setuptools3
>      > > +
>      > > +PYPI_PACKAGE =3D "Markdown"
>      > > +SRC_URI[md5sum] =3D "034e3bccfde211d44b4a7a69cb290ba0"
>      > > +SRC_URI[sha256sum] =3D
>     "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
>      > > +
>      > > +BBCLASSEXTEND =3D "native"
>      > > +
>      > > +RDEPENDS_${PN} +=3D "${PYTHON_PN}-logging ${PYTHON_PN}-setupto=
ols"
>      > > diff --git
>     a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
>     <http://python3-smartypants_2.0.0.bb>
>     b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
>     <http://python3-smartypants_2.0.0.bb>
>      > > new file mode 100644
>      > > index 0000000000..8acc971c35
>      > > --- /dev/null
>      > > +++ b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
>     <http://python3-smartypants_2.0.0.bb>
>      >
>      > According to pypi this isn't the latest version, but 2.0.1 isn't
>      > available as sources - also this project is unmaintained and the =
repo
>      > isn't even available anymore - what's the process for these kind
>     of recipes?
>      >
>=20
>     looking at the URL https://pythonhosted.org/smartypants/
>     <https://pythonhosted.org/smartypants/>
>=20
>      =C2=A0As of 2016-12-28, smartypants is looking for new maintainer t=
o take
>     over, please contact project owner on Bitbucket.
>=20
>     yeah we should not add unmaintained new recipe additions for dead
>     packages to at least oe-core
>     if gi-docgen, is next-gen for gtk-doc then report it upstream that
>     they have such a dependency and whats their plan
>     because next-gen tells me that they might looking into future
>=20
>      > > @@ -0,0 +1,12 @@
>      > > +SUMMARY =3D "Translator of plain ASCII punctuation characters
>     into 'smart' typographic punctuation HTML entities"
>      > > +HOMEPAGE =3D "https://pythonhosted.org/smartypants/
>     <https://pythonhosted.org/smartypants/>"
>      > > +LICENSE =3D "BSD-3-Clause"
>      > > +LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3D977036977591ac666c728921ecc54c4f"
>      > > +
>      > > +inherit pypi setuptools3
>      > > +
>      > > +PYPI_PACKAGE =3D "smartypants"
>      > > +SRC_URI[sha256sum] =3D
>     "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
>      > > +
>      > > +BBCLASSEXTEND =3D "native"
>      > > +
>      > > diff --git
>     a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
>     <http://python3-typogrify_2.0.7.bb>
>     b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
>     <http://python3-typogrify_2.0.7.bb>
>      > > new file mode 100644
>      > > index 0000000000..3becb0dd8d
>      > > --- /dev/null
>      > > +++ b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
>     <http://python3-typogrify_2.0.7.bb>
>      > > @@ -0,0 +1,14 @@
>      > > +SUMMARY =3D "Filters to enhance web typography, including
>     support for Django & Jinja templates"
>      > > +HOMEPAGE =3D "https://github.com/mintchaos/typogrify
>     <https://github.com/mintchaos/typogrify>"
>      > > +LICENSE =3D "BSD-3-Clause"
>      > > +LIC_FILES_CHKSUM =3D
>     "file://LICENSE.txt;md5=3D12bc792d6f5415dbf421f3fd183c6dd2"
>      > > +
>      > > +inherit pypi setuptools3
>      > > +
>      > > +PYPI_PACKAGE =3D "typogrify"
>      > > +SRC_URI[sha256sum] =3D
>     "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38"
>      > > +
>      > > +BBCLASSEXTEND =3D "native"
>      > > +
>      > > +RDEPENDS_${PN} +=3D "${PYTHON_PN}-smartypants"
>      > > +
>      > >
>      > >
>      > >
>      > >
>      > >
>      >
>      >=20
>      >
>=20
