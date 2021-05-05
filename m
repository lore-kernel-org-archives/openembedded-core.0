Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.75])
 by mx.groups.io with SMTP id smtpd.web12.10166.1620229182445194455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Qm4otR5d;
 spf=pass (domain: outlook.com, ip: 40.92.64.75, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JW0ib+qXY12URGbi7jE6TVaxE85xkpz+v4V6hEl7GSBqE9wYt1jvdHEduKnFibi8sBOdKx6CwCLbzby2JvwZOqF5WJNmf8Yl7zhAp6HypPF6A5a8Vs6bVT/glYJJMPjyRpX2pBrgejVPpa3LUC0IYiRkTXWPOIkf/qGh8Az1Ia0ABoxNWSnwAVo3rnxe9VwODDR09Kg9cVQLOIjXjB3V6zTa2FUtkWsGwWgsV9L5uFdAjm1lac7ONCqhct6pk5D7VRE6JsMP1LB/m54ksrVoOFTJLZlsTB7iEsO1r6eTMixb/6Ukzrn9RgMbaoW62nal5h5KDXN1gc6HhurXCPb/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMRSVn1ogiPYy1u8O4di4B/ny/d1xetdqf07ZZ/HyIo=;
 b=KBSBou4ybaW4eCJjtiUmAo8VVd0t0bShLzgUg43/vmqetKKmFaftBonrq0u27+hrYMwRrUKRZFpQTbu+JVregDJShFhDGenY7LSEFmdLo7Boo/d8VgJ7TFZGCNJujnrUGYSQw+e5+tWm6tfTZIAfJReql/PG+nb0IkLkiYnz3RYr1Lp3XkAnINW3t1CovSmvokqxZ43y7frm8qKWLuKDuiAcm+s+Xb6PNdnUX0AL0gY27KraEHDV4a/BkLQ6k9mP+/T+fx69hOM3ss4l5lMfnVrxgCZnsmzr3hW1xOFlZ5o6e7TPbIOPHAsXZiU/B5P+jiG8EwXnsoplbN03G3CApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMRSVn1ogiPYy1u8O4di4B/ny/d1xetdqf07ZZ/HyIo=;
 b=Qm4otR5de5Owz9AATBNHXoQJPJarhzREI9pZk9DswZCCC7pUGnwfz3A+VQEc2r1xmN/2RE8jV6nIA8YpnDOJSYFAVDQSBOtkgq+BmeuN/duaBcKjC3q32/2TMgFpNLOm+J/rV7vmHn12NyFsFU/Ra302ixawQ3jy0FAj65A+mVxvaCPvSZ7JCYSqIUvbZo2XicIYRXskszhYoH/5ZpvNb7PwOmNIfyT4BhzLhrHsL9INFF0QHgHQA2MGSob2DItOCPVkZ1r23Fld7Ahm+vfd5UeZpd8XzKbUXtpVYppse15sXpon67u5QCqk0v8KUW5p8D/b8YcSTf5m4Dkazpirww==
Received: from HE1EUR01FT016.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e18::45) by
 HE1EUR01HT080.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e18::255)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27; Wed, 5 May
 2021 15:39:40 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e18::52) by HE1EUR01FT016.mail.protection.outlook.com
 (2a01:111:e400:7e18::169) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 5 May 2021 15:39:40 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:5F1B40F2D072A2C6311E18E43D70D92543D57BB46D9E3C6FED8E10866ED48257;UpperCasedChecksum:B202401D8670478673A9F4B53B8BD5F03787CBB8FA8FAA1CA074E1938A37CEC7;SizeAsReceived:8754;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4108.025; Wed, 5 May 2021
 15:39:40 +0000
Subject: Re: [OE-core] [PATCH 57/61] python3: add markdown/smartypants/typogrify modules
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-57-alex.kanavin@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642132C2006E4609CA966C7A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 5 May 2021 17:39:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210505151850.660512-57-alex.kanavin@gmail.com>
X-TMN: [o4MKLQw+YcgmHrcnIu1yODsdhy1k6Z6M]
X-ClientProxiedBy: AM5PR0701CA0013.eurprd07.prod.outlook.com
 (2603:10a6:203:51::23) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <e3181f3f-c799-8ed3-cfb8-95a0a92884e5@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.89.134) by AM5PR0701CA0013.eurprd07.prod.outlook.com (2603:10a6:203:51::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.14 via Frontend Transport; Wed, 5 May 2021 15:39:39 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 23b08db3-89c7-41c7-0a4c-08d90fdbfef0
X-MS-TrafficTypeDiagnostic: HE1EUR01HT080:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wxtzljbtnLtPsEKbVypqgXHyGV1w6RnGSKatsV4+ckcsocDYToG6yxJsupQ1NVdz6y8M4bmOX2yk9yVkabcAJR+Ao5mE9D9isvZ35y+USB49VcU2i74NiZytHUk/TxKgFh7ZtmyHohIlWEYyyj8byPkaqQlam1K6SQw+s0OaELiw7dhPezSbLN0Bnh1Mu2v62VmErRqOKEOF87Pdmsom7EAq6pXYkAt94IUGkLWaa48vM7xFJ6egdv1Z8RDMovB6VNSPEy5pJBUGmoznj/zOaltd0hlIJscsD1lHGr8aNIdKXA9lYuMX5YqFG334aoJOLGENpTHbLtvOVAsOdENm53J6o1kt+zocU7+qWYp2SP+TYChbLIU3LGL4RxRa9IjgcCRlHDPtfPAFXhRM5QzTsWu7w5sfa0G+/cMHikyLSNFB3zdYyqEhn1623MSL+lr6htTZ5Gxv1nKMQ6rqwfjB/Q==
X-MS-Exchange-AntiSpam-MessageData: 
	YdgY4WQHh7frrtWuLTy15DygXkZmOoavfSXwRRVHxPBQnL8L6CLuqOYif/rig+YAvMBcSXxXXxPEaMDXUhcWvMeVQ3cvhjM0rNR5ur0OtXFspQXbzdOZM6F3il/nCYiCbvqeZNwiXcFbuR1wv85utA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b08db3-89c7-41c7-0a4c-08d90fdbfef0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 15:39:40.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT016.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT080
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 05.05.21 17:18, Alexander Kanavin wrote:
> This is needed to enable gi-docgen, a successor to gtk-doc
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/conf/distro/include/maintainers.inc           |  3 +++
>   .../python/python3-markdown_3.3.3.bb               | 14 ++++++++++++++
>   .../python/python3-smartypants_2.0.0.bb            | 12 ++++++++++++
>   .../python/python3-typogrify_2.0.7.bb              | 14 ++++++++++++++
>   4 files changed, 43 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3-markdown_3.3.3.bb
>   create mode 100644 meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
>   create mode 100644 meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 140f7b490e..0c3e3628ba 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -608,6 +608,7 @@ RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfound
>   RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
>   RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
>   RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>   RECIPE_MAINTAINER_pn-python3-more-itertools = "Tim Orling <timothy.t.orling@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> @@ -630,11 +631,13 @@ RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.
>   RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>   RECIPE_MAINTAINER_pn-python3-setuptools-scm = "Tim Orling <timothy.t.orling@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
> +RECIPE_MAINTAINER_pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>   RECIPE_MAINTAINER_pn-python3-sortedcontainers = "Tim Orling <timothy.t.orling@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>   RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>   RECIPE_MAINTAINER_pn-python3-toml = "Tim Orling <timothy.t.orling@linux.intel.com>"
> +RECIPE_MAINTAINER_pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER_pn-python3-wcwidth = "Tim Orling <timothy.t.orling@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-python3-zipp = "Tim Orling <timothy.t.orling@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.3.bb b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
> new file mode 100644
> index 0000000000..c456f05541
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "A Python implementation of John Gruber's Markdown."
> +HOMEPAGE = "https://python-markdown.github.io/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "Markdown"
> +SRC_URI[md5sum] = "034e3bccfde211d44b4a7a69cb290ba0"
> +SRC_URI[sha256sum] = "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
> +
> +BBCLASSEXTEND = "native"
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-logging ${PYTHON_PN}-setuptools"
> diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
> new file mode 100644
> index 0000000000..8acc971c35
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb

According to pypi this isn't the latest version, but 2.0.1 isn't 
available as sources - also this project is unmaintained and the repo 
isn't even available anymore - what's the process for these kind of recipes?

> @@ -0,0 +1,12 @@
> +SUMMARY = "Translator of plain ASCII punctuation characters into 'smart' typographic punctuation HTML entities"
> +HOMEPAGE = "https://pythonhosted.org/smartypants/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=977036977591ac666c728921ecc54c4f"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "smartypants"
> +SRC_URI[sha256sum] = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
> +
> +BBCLASSEXTEND = "native"
> +
> diff --git a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
> new file mode 100644
> index 0000000000..3becb0dd8d
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Filters to enhance web typography, including support for Django & Jinja templates"
> +HOMEPAGE = "https://github.com/mintchaos/typogrify"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=12bc792d6f5415dbf421f3fd183c6dd2"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "typogrify"
> +SRC_URI[sha256sum] = "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38"
> +
> +BBCLASSEXTEND = "native"
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-smartypants"
> +
> 
> 
> 
> 
> 
