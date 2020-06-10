Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.70])
 by mx.groups.io with SMTP id smtpd.web10.3104.1591759118861748803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 20:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TfDxl4ko;
 spf=pass (domain: windriver.com, ip: 40.107.236.70, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUa2bEvEF8gqP/70lcCHWcyQbCb4Kv1xPSUN+dteRT+QGtir5xRuoUEMByvGZyOliW0/Uvlyg4mt6YtNBBYLPD/0I8mVqA3AtDsPsYFsE6XXD5C/UJB/X1p2CGQYqD5CEWC/2EDK9D0kDzX6cJf3g24udiOWlcYyaout7+3I9I145RfbaKhvVAH3uvF1ty3hE0SMnvOEWjbnsYmpzy0SBY82yQjqEviY5UDfR9hWczL7F1/bE0pyRvJl/3AIabSOXKcjOBx78kWSCH/f2CP3qaKISklz/pc4DtdKNtiKoC33zof/9wxsk/UHhkSCAwydewNB9Re322mtzrE4DQDSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkmrQW2hNLguLhkQnb8tMLbWxhOU1HTGhlf6WbjyQic=;
 b=OKGi2JGWmOHINHblSavE3vVlwiJam2rsgiMlCNBKvyBfQLfjOZvetAyS2iWDmY5xYJnB0hi4AFtBDbTbp0/4b8WLIUfQuiu1LZBMV4OPneNJn2FsrmZNz0Jy2bN6NC9Vls4dOdFyHAxQL35I9iXw7W6J14L6bhbCECC0gK+meNxzYeZSp1fCZFqAG9LHcrspxAUuqKDk4VD6R8oSTfa+6hq3jcXb3Z8DXMb/yyR7t1IJOPoxLKbs3GeWlwTG+u3MK29ZZroKh0w9dCHaqvI/joWDn5GPY8tmKrcekBg7llY+KL3IHIs7MdAeoCatgUC1hyAiFEjxwGQEqvb2O/aMFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkmrQW2hNLguLhkQnb8tMLbWxhOU1HTGhlf6WbjyQic=;
 b=TfDxl4kotl1RPSS3nepk6ZcD8gohhs22OKYwBn1U9Ol/waTG4hwV3m3zRVFVQokNGDN49a/8a45AfnWtmca7RZMezm6Guudsx3VD9uVZaumM5g8vAEcr9SwCFB8hjOE5AnLerfz/riHqAFYrLpyGa7V7euRak1WSNSAatwa47hs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3703.namprd11.prod.outlook.com (2603:10b6:a03:b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Wed, 10 Jun
 2020 03:18:34 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 03:18:34 +0000
Subject: Re: [OE-core] [PATCH 1/4] python: Add libarchive-c recipe
To: Joshua Watt <jpewhacker@gmail.com>
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
 <20200212031435.792802-2-JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <62dc43ba-0d87-6913-0b1e-ad2eb989a705@windriver.com>
Date: Wed, 10 Jun 2020 11:17:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200212031435.792802-2-JPEWhacker@gmail.com>
X-ClientProxiedBy: HK2PR0302CA0003.apcprd03.prod.outlook.com
 (2603:1096:202::13) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR0302CA0003.apcprd03.prod.outlook.com (2603:1096:202::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.7 via Frontend Transport; Wed, 10 Jun 2020 03:18:33 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 057e3830-aa04-4140-bd02-08d80cecf551
X-MS-TrafficTypeDiagnostic: BYAPR11MB3703:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37036B8C5C5A20C9D6B10013F1830@BYAPR11MB3703.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lJ9z8cRDbpGt1YzNtjQBMlP3/aGByNV9ULGjZ2RvoySugnkLm1ofr+7NomwpxW+NnVCpU49Jmzk1ogwKg9T1hkSWNLBpClai/mqNcOhtIzEYEdHZdw7ub06/l4q91mO4EBSDJLB2nm1WDgaREQ8i6G/Fa4jYDBjaew/6HmikFhIyh+s06UA9FF1givgATfWeYp64pI1OFCxlmOtL3oI3knGg1dGHUbT96+3dWGKhxG4pdgfzoxeba+KjbA/Mpgus4deUJwDOiErLh9cKVuWfiaaSuYn3Ga7Hc+Ae71ySsAI+i/k0Z9JvfIDNRxUFq8N1Z93epxwF1JSx7lREYscythUNjDfgQhMn7P8UZLZZsYnJU3m6HFKtWhkM1CK+wFUpqxdNXC3t1AiWYp08z3QeadLKG4H1HLad9Qi/JAtbhWEre9P0iLfvZz1LLOAJcXbQgjvgm+ilVFEZCxPN/a6kY1JKzRu5kI4xvMCRbOoq8Jvz0+PW5aNhyZDUKXJp53UmIKyf5EWx8LnNtecJ6paVWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(39840400004)(366004)(136003)(376002)(956004)(26005)(86362001)(5660300002)(52116002)(53546011)(478600001)(2616005)(16576012)(31696002)(83380400001)(4326008)(8676002)(66556008)(66476007)(8936002)(16526019)(36756003)(2906002)(6706004)(31686004)(186003)(6916009)(316002)(6486002)(66946007)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ZW/0ST0hvp1j/EsIy26/RXdoytF4eQ12c0ZBbOWLNGxuID1IVb6lbP61aHZllx93ZrBuCwwPD9Y+VMQtuBFlzI2TA4iX2CUoSmcoNdwn+Q13HsQBKR3t2g6UUiNGrBNYDczB1QemN7IWiZjDXOSWse7p0L59UN91cqoGje/xufBuQ6m//XraAczUZDN9foNocNFS97Q21PWAEgksHt26arSspOYWW1Wzkw2xIdsQtPc1KRPMDZbV/n1dbLjaa6Parw/JtSorEFfnclTM+kE/NyEY77fdVlEJ27PfEu1vES4F0yYFL0Dnm0DuiWpq4sAC3ALEq+q1IbHmeJ7HQolYcnuYTfQvBgxaUi3OqJuucWKlyKTuYyH6+FaZhu1jpsLOXBKT0DiVoif3NZgy59LTfmLq/u0nJy/FCqMJdUtHnQYJ6T2ACdTeH6d56RO4uCpk+GMQUaXgxyY7m88geaWpikswMREhVGoPaMFDAJcNGes=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057e3830-aa04-4140-bd02-08d80cecf551
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 03:18:34.4052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhPhvPDNPQM0Na7N5uKNk/nOZ8WV6LMinGKdu1KaCv8zk/lZsZnm2REgaomE9ZPpNU+q/PYJcK9EXH5A4UhSEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3703
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Joshua,

I encounter below error when use the libarchive module, could you help 
to take a look?

# python3
Python 3.8.2 (default, Jun  8 2020, 06:35:32)
[GCC 10.1.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
 >>> import libarchive
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib64/python3.8/site-packages/libarchive/__init__.py", 
line 1, in <module>
     from .entry import ArchiveEntry
   File "/usr/lib64/python3.8/site-packages/libarchive/entry.py", line 
6, in <module>
     from . import ffi
   File "/usr/lib64/python3.8/site-packages/libarchive/ffi.py", line 
109, in <module>
     errno = ffi('errno', [c_archive_p], c_int)
   File "/usr/lib64/python3.8/site-packages/libarchive/ffi.py", line 96, 
in ffi
     f = getattr(libarchive, 'archive_'+name)
   File "/usr/lib64/python3.8/ctypes/__init__.py", line 386, in __getattr__
     func = self.__getitem__(name)
   File "/usr/lib64/python3.8/ctypes/__init__.py", line 391, in __getitem__
     func = self._FuncPtr((name_or_ordinal, self))
AttributeError: python3: undefined symbol: archive_errno
 >>>

Thanks,


On 2/12/20 11:14 AM, Joshua Watt wrote:
> The libarchive python module is used by diffoscope tool to
> make build comparisons.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/conf/distro/include/maintainers.inc        |  1 +
>   .../python/python3-libarchive-c_2.9.bb          | 17 +++++++++++++++++
>   2 files changed, 18 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index c68e9edf634..abbdb74a0d3 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -579,6 +579,7 @@ RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr
>   RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>   RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>   RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
>   RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>   RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>   RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> diff --git a/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb b/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
> new file mode 100644
> index 00000000000..4983ae527a1
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Python interface to libarchive"
> +DESCRIPTION = "A Python interface to libarchive. It uses the standard ctypes module to \
> +    dynamically load and access the C library."
> +HOMEPAGE = "https://github.com/Changaco/python-libarchive-c"
> +LICENSE = "CC0-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=bcab380227a83bc147350b40a81e6ffc"
> +
> +PYPI_PACKAGE = "libarchive-c"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "083bd2cb0043c1e22a52cb9a05e31532"
> +SRC_URI[sha256sum] = "9919344cec203f5db6596a29b5bc26b07ba9662925a05e24980b84709232ef60"
> +
> +RDEPENDS_${PN} += "libarchive"
> +
> +BBCLASSEXTEND = "native"
> 
