Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.829.1624387251615953383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 11:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gE3c4PI0;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1807ab70cc=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MIa6EY024380
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 18:40:50 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 39bdsc8buw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 18:40:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqqxNQc9tUKv00kL0ZNT9aFfEajvTk2ZSvOh5Q2TcI0s0S5Om/3/j7NUWj+zISAlcoX7ZqcoVDGAfM+lNlIaD1DDx+paFPViJEsictJ4lGtBOwr63qpSEOwHMc/zuf56rWEpVl0Xd1ZoyxTT3l55wK+C8AOaVnI4d260k+Ox7CQEaC0jimImmzt67aSWkGhhqAJ6/yIGVj64DTu0x6VthuS/WkH44tDwiRclq0kmORXf3QpnwG+iHiaN60noWahEPFDq8BMKXhgzh0ll+5zOVjDFrn/cML23biixR6Ta4QMKLU3Q40FdKKTwnQNJgT+B2b3QywsIdotcP6VKQ+X8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STday8q8SIsaFvXwmzv20Wyumi/Jm6+DySrrmrETRj8=;
 b=dtarfpQnJ/nghE11qz8QLXesbxkOcqzqn9l/v+Ej+Hp6tglgbmELBsxUXucZsQbre8dfWxmK+yCmlMeEfcHkoznoihKxZDsTQIzHxGR5L0NC/JmX0gwrn/IpyxAn0jTWwffTmpZt/gwqrdcHAp43ZI1N3hmh1Nbh6RgQBzdU73izMLKVBkNY7DhSVUHSt8jjB3SyqPbECbNl20dXKoPUnECvNtN9srT96kNr8GnNMbwQublJrc9WrjFYzicYWE1b93ypltMHQYy31PrbcqOfM/Q491NUKhYGB27F3JuTN9g0qpJ7XAGNmhhESMFgudOlnKkBtDW7DJHVKgGfB8a39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STday8q8SIsaFvXwmzv20Wyumi/Jm6+DySrrmrETRj8=;
 b=gE3c4PI0//TEfmcfyUcf8ORIc/ebyZD7XxIOE/7EOsMJEbIuRSMoSvHY8p7Uwwztgrh4CtvNW40Z38ahpJte37cFRYKSSVoEXXFnQQE/S2OkOij5RLI/NiAxNVg+eAI1ewBlEQrVmXDJMXHMwU3jfLyjkZNCNQHcAIZM4cgSiUU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 18:40:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 18:40:47 +0000
Subject: Re: [OE-core][PATCH 1/2] python3-pip: upgrade 20.0.2 -> 21.1.2
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <168AF829ECD17622.26593@lists.openembedded.org>
Message-ID: <a151451b-2b9b-4cc3-83f1-e6d1d8b41f4a@windriver.com>
Date: Tue, 22 Jun 2021 14:40:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <168AF829ECD17622.26593@lists.openembedded.org>
X-Originating-IP: [2607:fea8:c29d:d7c0::6e79]
X-ClientProxiedBy: YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::6e79] (2607:fea8:c29d:d7c0::6e79) by YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 18:40:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b31a2444-dff6-4979-58a4-08d935ad3fd7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2904DEA79389392197BEEF4A9F099@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tblz+v1/D20EvXlzdqR/qFDh7ihybGgR7/xlDwBdOjMM4vYDOWLn6h9orRaieUmf140EQYiRG2lEJ3ImsIiLnNAPgqFo2Db8jSNGcYw8/fJdW0whJDahhN16ZSnkWIeelFzkqqJuA+gZNGqkEPSrwo+5sgMFOPRgjeU6mF2ms1JqGWdfnptlnDSYtMt/IAMh/cC03zXK77x9KxXPY5EYgIrMbQr8HNu1FQ27LNL9fg+qSscUbaps9thSZwIhpFg0G5DdmUnUcyAozdDm27V//zKO4Z6gPbSTK4Ah/XO+zqL3DCHl1ANSbcGPZK2jyQat+hImdpHfd8OIJBpbYx/3coQiRURj591fdnd7ffFho0tgU/x71nppUjrT9pOnOGBJoUYk/CIxliR2kZeefdzmTwzRUK9OoW9T/99g/Ob9ik9Y5rE7ek/qzOoDzysEHC0kMQZfMZmtAnAvW+nBXfhrzibNASCLmtRWjA5C33vIgMonmBOdNoDGKz9dtTvvjpqv7DkILhRusthM/fKM9qHUm4SsoHE99ekn03OkYh5hDG5dCF/Zx/SXwyh4WDCwO4nTUDsZKrYEFWEWJjNRD0MlMfBL6STyCdIwnRh87BkHbgSQ7O7tpDLm3JWqrkt3c+m2fVYzeaHy9oA2LEPjD2V7Stt1jU7B6hyiHKMrKd5/y0KI16kIE1mrGdApQfWmoz4sTQCFYdPT4MsNOxPSnvJdS7QWzMI6jDRIXwRWufOiLx2v+KMlY7RrMljmTxBGqFZNN9wbFbvxD1i1utH0TNWR6qg1ul46s+4+sKtECLj0DVdaZX1M9XPF3tNy1BmrKAjP31ihwzrWJMSBuR+Cj+h3WXGdq7CWgGcYCiW1B030DTc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(396003)(136003)(366004)(16526019)(186003)(2616005)(44832011)(6916009)(8676002)(8936002)(53546011)(6666004)(36756003)(33964004)(31696002)(86362001)(2906002)(38100700002)(316002)(30864003)(6486002)(66574015)(166002)(478600001)(31686004)(5660300002)(66476007)(966005)(83380400001)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHRYRFAwc24vbHlYdC9CYjBKclVKUU9OZkFqSVY1UDRzcGh6YTBjQmU4ejVO?=
 =?utf-8?B?KzlXeGEweUp2bll6UzZyTFlVdk82QzlzYW1kbURwWnV6b2hBa2dqajBFd1hx?=
 =?utf-8?B?SWszNlhsOUdWOTZxU0R1Nm9XTk5NSnJWKzlxMjROZEZPNHI2QUVRa3o4NHd6?=
 =?utf-8?B?ZDVHZS80VkpjUXdFckp2blhlUzNkclRESDVnb2FobXN1ZWVmbURheFpOKzRM?=
 =?utf-8?B?TzRURVgySUZJQ3BURjc0aiswVkFvaVh6VFJOZTRzNUwvR1MvNnV1Y0p4YVZq?=
 =?utf-8?B?SzlCWUM3bWtDZ1g2T1N1TjNNU3ZkdkdBdmNGY1VyYjNXNFEzd2dvVlRRRi8r?=
 =?utf-8?B?Qzg3LythNThHcXJ4azZRVDE4S3FqQUg5dkllalVxUU4zNHJFK1VtUDJ2ZEdl?=
 =?utf-8?B?MGZhU0RhVTdRbS9URXk1NndWT3FMMit3ZjVreEJLUDF3a09hTGYvM2JkZXdM?=
 =?utf-8?B?WkZFN3BUL2ROR0xWYlZHNUQ5Z2pZZGVpd1hYTFFKTnhuTUNab3BaWm1kRzFG?=
 =?utf-8?B?YUNYRGVHMjh6NlZSZHkxeE0wMEVPZzg1L09IckJYK3JPeTJRR2x5a0FBc3cy?=
 =?utf-8?B?RXQyNDdNUi9kUjFBSy83bUJBRzNDU2kycDJRbnNWSnhabUoxNTJuVnhmd3FV?=
 =?utf-8?B?MDBGZUdBTnhDb1I0SXNnNmMvbUNNNDFPYmZkcGF3azRLbUlWaTZnS1cra2dv?=
 =?utf-8?B?MnVvT1B4dFZuM0FxUHVtaHVNKzhJdjB1Vi9XajdzWjJzTVlFSFlRcm9JOVJH?=
 =?utf-8?B?bURXM2pBR1B4NndENEZkVlVZbE9ySlNydncrOGtISEhoOGgyN0toeVd6T0pa?=
 =?utf-8?B?VzZvTnFyMlU1YzJuYlhVZXdJbkwwbjhKeFllRmc4aDMvOUlGdUNZMUVXL0hn?=
 =?utf-8?B?RVVEV1lvak1ZWGtBVTNuVFl3SW9NeHV3NUsxMTB0UG5CRnRNQmt3Z29wblpT?=
 =?utf-8?B?RXNHQkw2aTAxNEhUeFdadUZPcUtScEswcko0d3BTMWtSdndmVjYxVVhmOWFa?=
 =?utf-8?B?Zjd0d29WTGx4QlRVK3VoZWtVbVVydllMN3cwdlFQS3o1UzJSV08remNJSUhk?=
 =?utf-8?B?MFJ4dWw1OGhJbmZIQjFUYnBZRDM0MXBiZFpzQnd5NUQvRUNSZHVwMjN1R3Vl?=
 =?utf-8?B?RnlwckV1Q205RDBwaWFDOVVsNlJGbktkckJKT2l0dVYyNUFLNmt1SmxKZU5B?=
 =?utf-8?B?UHJvc1JVT2lwbkxCdFRQd252THFINlFlZUMyRmswa29VbHZGbEQyUExrblpP?=
 =?utf-8?B?OGJsd3VCcnR6aG5IZEgvZm5EbHUrSjFwN1o5WUhGSlhuMDQ4RytNcUNQUlQ5?=
 =?utf-8?B?ZnM0NXRHdHMvaElGWmxWWi9hOUR0VU9nWCsyS2c1aHl4QXBidzRwaGN6alVL?=
 =?utf-8?B?K0pBWHFLTVQzOFdCR2ZHYUVRRmdmVGdoMWFOekNmK01yKysxNnpJcXhWZzZ4?=
 =?utf-8?B?VzRyZUxkZVliUUs1STkrTmlVUmdsS3l1cE1rUWp6RUUzRDBZcWtYOVRPYksz?=
 =?utf-8?B?NHJWTzFCNGZOU0NJZkdGVFZxd3gxMERleUJGTisxY0JxeGhhazFXeUtrSkRH?=
 =?utf-8?B?NndOYVpGeHR2QzVaMGh3dE9TNzlTejJKcDZlcnBzcDA4L0pjemNjOWZsYXBE?=
 =?utf-8?B?TmJEQzZLVG9zTVRlU2xuY3YyZ2pUU1c1ZmtiSWRMWlVSSGFJVnZUbXQzQyt3?=
 =?utf-8?B?WmY2WWtNTXZlbWdjUDBVc0QzWTRSWTBtZTNtOGEyNEVuUEhTc05QZm40TkVB?=
 =?utf-8?B?VXpmdW9EOThIZi9VNnlvKzZXeUM0Ty9vVXBld3hvaldlTGY4VmZZc1hkYVlU?=
 =?utf-8?Q?jr0T0Om5SIzqMH0dEUxFJMGv57qgmXMWZMyxk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31a2444-dff6-4979-58a4-08d935ad3fd7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 18:40:46.9266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tvIuggvoeWtFKF7n2mnZ+lGZNyIVXQZlImnNyLIkxZbhuiBr6FQlQDgLAd4Zzpw/sVTPaVHqn1uIzIgIpOYsvecVz15kFAi1sS5NJ/O9lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
X-Proofpoint-ORIG-GUID: 6Ttg9Y1Ve2vVWcntLT32IpEQCsF8-J-k
X-Proofpoint-GUID: 6Ttg9Y1Ve2vVWcntLT32IpEQCsF8-J-k
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_12:2021-06-22,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106220113
Content-Type: multipart/alternative;
 boundary="------------08C50B139D8D9FA8A1FA2804"
Content-Language: en-US

--------------08C50B139D8D9FA8A1FA2804
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15MIa6EY024380


On 2021-06-22 1:37 p.m., Trevor Gamblin wrote:
> 21.1.2 contains a fix for CVE-2021-3572
> (https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847c=
b30b)
>
> The LICENSE.txt signature changed due to an update to the copyright
> dates, but the terms are the same.
>
> Also update 0001-change-shebang-to-python3.patch to cover all files in
> pip's src directory, since we need to ensure compatibility.
Re-submitting this patch (and not the second one to fix RDEPENDS)=20
because we detected a bug in the inherit/SRC_URI ordering in the recipe=20
file...
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-change-shebang-to-python3.patch      | 128 ++++++++++++++----
>   ...n3-pip_20.0.2.bb =3D> python3-pip_21.1.2.bb} |   6 +-
>   2 files changed, 101 insertions(+), 33 deletions(-)
>   rename meta/recipes-devtools/python/{python3-pip_20.0.2.bb =3D> python=
3-pip_21.1.2.bb} (73%)
>
> diff --git a/meta/recipes-devtools/python/python3-pip/0001-change-sheban=
g-to-python3.patch b/meta/recipes-devtools/python/python3-pip/0001-change-s=
hebang-to-python3.patch
> index 00cffe169b..0187001168 100644
> --- a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-py=
thon3.patch
> +++ b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-py=
thon3.patch
> @@ -1,32 +1,30 @@
> -From e7a00e9b5104ae2fbcea32a35c85760b77fae7e5 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 23 Apr 2020 09:42:10 +0000
> +From baa85a4dab2e8d64eb25d1181b6420db25ce919a Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <trevor.gamblin@windriver.com>
> +Date: Tue, 22 Jun 2021 12:31:46 -0400
>   Subject: [PATCH] change shebang to python3
>  =20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate (OE-specific)
>  =20
> -pip will drop support of python2 from 21.0
> +Despite no longer supporting python2, some files in the pip source refe=
r
> +to "python" instead of "python3", so patch them as needed to ensure tha=
t
> +they correctly reference the python3 binary.
>  =20
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>   ---
> - src/pip/_internal/__init__.py             | 2 +-
> - src/pip/_vendor/appdirs.py                | 2 +-
> - src/pip/_vendor/chardet/cli/chardetect.py | 2 +-
> - src/pip/_vendor/requests/certs.py         | 2 +-
> - 4 files changed, 4 insertions(+), 4 deletions(-)
> + src/pip/_vendor/appdirs.py                    | 2 +-
> + src/pip/_vendor/chardet/langbulgarianmodel.py | 2 +-
> + src/pip/_vendor/chardet/langgreekmodel.py     | 2 +-
> + src/pip/_vendor/chardet/langhebrewmodel.py    | 2 +-
> + src/pip/_vendor/chardet/langhungarianmodel.py | 2 +-
> + src/pip/_vendor/chardet/langrussianmodel.py   | 2 +-
> + src/pip/_vendor/chardet/langthaimodel.py      | 2 +-
> + src/pip/_vendor/chardet/langturkishmodel.py   | 2 +-
> + src/pip/_vendor/chardet/metadata/languages.py | 2 +-
> + src/pip/_vendor/requests/certs.py             | 2 +-
> + 10 files changed, 10 insertions(+), 10 deletions(-)
>  =20
> -diff --git a/src/pip/_internal/__init__.py b/src/pip/_internal/__init__=
.py
> -index 3aa8a46..e1ad179 100755
> ---- a/src/pip/_internal/__init__.py
> -+++ b/src/pip/_internal/__init__.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - import pip._internal.utils.inject_securetransport  # noqa
> - from pip._internal.utils.typing import MYPY_CHECK_RUNNING
> -
>   diff --git a/src/pip/_vendor/appdirs.py b/src/pip/_vendor/appdirs.py
> -index 3a52b75..ad3f81d 100644
> +index 33a3b7741..60b9ef5f7 100644
>   --- a/src/pip/_vendor/appdirs.py
>   +++ b/src/pip/_vendor/appdirs.py
>   @@ -1,4 +1,4 @@
> @@ -35,18 +33,88 @@ index 3a52b75..ad3f81d 100644
>    # -*- coding: utf-8 -*-
>    # Copyright (c) 2005-2010 ActiveState Software Inc.
>    # Copyright (c) 2013 Eddy Petri=C8=99or
> -diff --git a/src/pip/_vendor/chardet/cli/chardetect.py b/src/pip/_vendo=
r/chardet/cli/chardetect.py
> -index c61136b..a497e98 100644
> ---- a/src/pip/_vendor/chardet/cli/chardetect.py
> -+++ b/src/pip/_vendor/chardet/cli/chardetect.py
> +diff --git a/src/pip/_vendor/chardet/langbulgarianmodel.py b/src/pip/_v=
endor/chardet/langbulgarianmodel.py
> +index e963a5097..97ea6cea8 100644
> +--- a/src/pip/_vendor/chardet/langbulgarianmodel.py
> ++++ b/src/pip/_vendor/chardet/langbulgarianmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langgreekmodel.py b/src/pip/_vendo=
r/chardet/langgreekmodel.py
> +index d99528ede..4a127ea83 100644
> +--- a/src/pip/_vendor/chardet/langgreekmodel.py
> ++++ b/src/pip/_vendor/chardet/langgreekmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langhebrewmodel.py b/src/pip/_vend=
or/chardet/langhebrewmodel.py
> +index 484c652a4..676c1a711 100644
> +--- a/src/pip/_vendor/chardet/langhebrewmodel.py
> ++++ b/src/pip/_vendor/chardet/langhebrewmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langhungarianmodel.py b/src/pip/_v=
endor/chardet/langhungarianmodel.py
> +index bbc5cda64..042eae70a 100644
> +--- a/src/pip/_vendor/chardet/langhungarianmodel.py
> ++++ b/src/pip/_vendor/chardet/langhungarianmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langrussianmodel.py b/src/pip/_ven=
dor/chardet/langrussianmodel.py
> +index 5594452b5..564b02e58 100644
> +--- a/src/pip/_vendor/chardet/langrussianmodel.py
> ++++ b/src/pip/_vendor/chardet/langrussianmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langthaimodel.py b/src/pip/_vendor=
/chardet/langthaimodel.py
> +index 9a37db573..c97487959 100644
> +--- a/src/pip/_vendor/chardet/langthaimodel.py
> ++++ b/src/pip/_vendor/chardet/langthaimodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langturkishmodel.py b/src/pip/_ven=
dor/chardet/langturkishmodel.py
> +index 43f4230ae..7e710c371 100644
> +--- a/src/pip/_vendor/chardet/langturkishmodel.py
> ++++ b/src/pip/_vendor/chardet/langturkishmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/metadata/languages.py b/src/pip/_v=
endor/chardet/metadata/languages.py
> +index 3237d5abf..aa2ec7c35 100644
> +--- a/src/pip/_vendor/chardet/metadata/languages.py
> ++++ b/src/pip/_vendor/chardet/metadata/languages.py
>   @@ -1,4 +1,4 @@
>   -#!/usr/bin/env python
>   +#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
>    """
> - Script which takes one or more file paths and reports on their detecte=
d
> - encodings
> + Metadata about languages used by our model training code for our
>   diff --git a/src/pip/_vendor/requests/certs.py b/src/pip/_vendor/reque=
sts/certs.py
> -index 06a594e..bfa7839 100644
> +index 06a594e58..bfa7839a4 100644
>   --- a/src/pip/_vendor/requests/certs.py
>   +++ b/src/pip/_vendor/requests/certs.py
>   @@ -1,4 +1,4 @@
> @@ -56,5 +124,5 @@ index 06a594e..bfa7839 100644
>    
>    """
>   --
> -2.24.1
> +2.31.1
>  =20
> diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb b/meta/r=
ecipes-devtools/python/python3-pip_21.1.2.bb
> similarity index 73%
> rename from meta/recipes-devtools/python/python3-pip_20.0.2.bb
> rename to meta/recipes-devtools/python/python3-pip_21.1.2.bb
> index 99eeea2edf..fd7a145205 100644
> --- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
> @@ -2,14 +2,14 @@ SUMMARY =3D "The PyPA recommended tool for installing =
Python packages"
>   HOMEPAGE =3D "https://pypi.org/project/pip"
>   SECTION =3D "devel/python"
>   LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D8ba06d529c955048e5ddd7c4=
5459eb2e"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dc4fa2b50f55649f43060fa04=
b0919b9b"
>  =20
>   DEPENDS +=3D "python3 python3-setuptools-native"
>  =20
>   SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
>  =20
> -SRC_URI[md5sum] =3D "7d42ba49b809604f0df3d55df1c3fd86"
> -SRC_URI[sha256sum] =3D "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949=
920675563a5a6967f"
> +SRC_URI[md5sum] =3D "a867fd51eacfd5293f5b7e0c2e7867a7"
> +SRC_URI[sha256sum] =3D "eb5df6b9ab0af50fe1098a52fd439b04730b6e066887ff7=
497357b9ebd19f79b"
>  =20
>   inherit pypi distutils3
>  =20
>
>=20
>

--------------08C50B139D8D9FA8A1FA2804
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15MIa6EY024380

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2021-06-22 1:37 p.m., Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:168AF829ECD17622.26593@lists.ope=
nembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">21.1.2 contains a fix for CVE=
-2021-3572
(<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/pypa/pip/co=
mmit/e46bdda9711392fec0c45c1175bae6db847cb30b">https://github.com/pypa/pip/=
commit/e46bdda9711392fec0c45c1175bae6db847cb30b</a>)

The LICENSE.txt signature changed due to an update to the copyright
dates, but the terms are the same.

Also update 0001-change-shebang-to-python3.patch to cover all files in
pip's src directory, since we need to ensure compatibility.</pre>
    </blockquote>
    Re-submitting this patch (and not the second one to fix RDEPENDS)
    because we detected a bug in the inherit/SRC_URI ordering in the
    recipe file...<br>
    <blockquote type=3D"cite" cite=3D"mid:168AF829ECD17622.26593@lists.ope=
nembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Signed-off-by: Trevor Gamblin <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a=
>
---
 .../0001-change-shebang-to-python3.patch      | 128 ++++++++++++++----
 ...n3-pip_20.0.2.bb =3D&gt; python3-pip_21.1.2.bb} |   6 +-
 2 files changed, 101 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_20.0.2.bb =3D&gt; python=
3-pip_21.1.2.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-=
to-python3.patch b/meta/recipes-devtools/python/python3-pip/0001-change-she=
bang-to-python3.patch
index 00cffe169b..0187001168 100644
--- a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-pyth=
on3.patch
+++ b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-pyth=
on3.patch
@@ -1,32 +1,30 @@
-From e7a00e9b5104ae2fbcea32a35c85760b77fae7e5 Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Thu, 23 Apr 2020 09:42:10 +0000
+From baa85a4dab2e8d64eb25d1181b6420db25ce919a Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:tr=
evor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
+Date: Tue, 22 Jun 2021 12:31:46 -0400
 Subject: [PATCH] change shebang to python3
=20
-Upstream-Status: Pending
+Upstream-Status: Inappropriate (OE-specific)
=20
-pip will drop support of python2 from 21.0
+Despite no longer supporting python2, some files in the pip source refer
+to &quot;python&quot; instead of &quot;python3&quot;, so patch them as ne=
eded to ensure that
+they correctly reference the python3 binary.
=20
-Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Signed-off-by: Trevor Gamblin <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</=
a>
 ---
- src/pip/_internal/__init__.py             | 2 +-
- src/pip/_vendor/appdirs.py                | 2 +-
- src/pip/_vendor/chardet/cli/chardetect.py | 2 +-
- src/pip/_vendor/requests/certs.py         | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
+ src/pip/_vendor/appdirs.py                    | 2 +-
+ src/pip/_vendor/chardet/langbulgarianmodel.py | 2 +-
+ src/pip/_vendor/chardet/langgreekmodel.py     | 2 +-
+ src/pip/_vendor/chardet/langhebrewmodel.py    | 2 +-
+ src/pip/_vendor/chardet/langhungarianmodel.py | 2 +-
+ src/pip/_vendor/chardet/langrussianmodel.py   | 2 +-
+ src/pip/_vendor/chardet/langthaimodel.py      | 2 +-
+ src/pip/_vendor/chardet/langturkishmodel.py   | 2 +-
+ src/pip/_vendor/chardet/metadata/languages.py | 2 +-
+ src/pip/_vendor/requests/certs.py             | 2 +-
+ 10 files changed, 10 insertions(+), 10 deletions(-)
=20
-diff --git a/src/pip/_internal/__init__.py b/src/pip/_internal/__init__.p=
y
-index 3aa8a46..e1ad179 100755
---- a/src/pip/_internal/__init__.py
-+++ b/src/pip/_internal/__init__.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- import pip._internal.utils.inject_securetransport  # noqa
- from pip._internal.utils.typing import MYPY_CHECK_RUNNING
-=20
 diff --git a/src/pip/_vendor/appdirs.py b/src/pip/_vendor/appdirs.py
-index 3a52b75..ad3f81d 100644
+index 33a3b7741..60b9ef5f7 100644
 --- a/src/pip/_vendor/appdirs.py
 +++ b/src/pip/_vendor/appdirs.py
 @@ -1,4 +1,4 @@
@@ -35,18 +33,88 @@ index 3a52b75..ad3f81d 100644
  # -*- coding: utf-8 -*-
  # Copyright (c) 2005-2010 ActiveState Software Inc.
  # Copyright (c) 2013 Eddy Petri=C8=99or
-diff --git a/src/pip/_vendor/chardet/cli/chardetect.py b/src/pip/_vendor/=
chardet/cli/chardetect.py
-index c61136b..a497e98 100644
---- a/src/pip/_vendor/chardet/cli/chardetect.py
-+++ b/src/pip/_vendor/chardet/cli/chardetect.py
+diff --git a/src/pip/_vendor/chardet/langbulgarianmodel.py b/src/pip/_ven=
dor/chardet/langbulgarianmodel.py
+index e963a5097..97ea6cea8 100644
+--- a/src/pip/_vendor/chardet/langbulgarianmodel.py
++++ b/src/pip/_vendor/chardet/langbulgarianmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langgreekmodel.py b/src/pip/_vendor/=
chardet/langgreekmodel.py
+index d99528ede..4a127ea83 100644
+--- a/src/pip/_vendor/chardet/langgreekmodel.py
++++ b/src/pip/_vendor/chardet/langgreekmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langhebrewmodel.py b/src/pip/_vendor=
/chardet/langhebrewmodel.py
+index 484c652a4..676c1a711 100644
+--- a/src/pip/_vendor/chardet/langhebrewmodel.py
++++ b/src/pip/_vendor/chardet/langhebrewmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langhungarianmodel.py b/src/pip/_ven=
dor/chardet/langhungarianmodel.py
+index bbc5cda64..042eae70a 100644
+--- a/src/pip/_vendor/chardet/langhungarianmodel.py
++++ b/src/pip/_vendor/chardet/langhungarianmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langrussianmodel.py b/src/pip/_vendo=
r/chardet/langrussianmodel.py
+index 5594452b5..564b02e58 100644
+--- a/src/pip/_vendor/chardet/langrussianmodel.py
++++ b/src/pip/_vendor/chardet/langrussianmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langthaimodel.py b/src/pip/_vendor/c=
hardet/langthaimodel.py
+index 9a37db573..c97487959 100644
+--- a/src/pip/_vendor/chardet/langthaimodel.py
++++ b/src/pip/_vendor/chardet/langthaimodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langturkishmodel.py b/src/pip/_vendo=
r/chardet/langturkishmodel.py
+index 43f4230ae..7e710c371 100644
+--- a/src/pip/_vendor/chardet/langturkishmodel.py
++++ b/src/pip/_vendor/chardet/langturkishmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/metadata/languages.py b/src/pip/_ven=
dor/chardet/metadata/languages.py
+index 3237d5abf..aa2ec7c35 100644
+--- a/src/pip/_vendor/chardet/metadata/languages.py
++++ b/src/pip/_vendor/chardet/metadata/languages.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
  &quot;&quot;&quot;
- Script which takes one or more file paths and reports on their detected
- encodings
+ Metadata about languages used by our model training code for our
 diff --git a/src/pip/_vendor/requests/certs.py b/src/pip/_vendor/requests=
/certs.py
-index 06a594e..bfa7839 100644
+index 06a594e58..bfa7839a4 100644
 --- a/src/pip/_vendor/requests/certs.py
 +++ b/src/pip/_vendor/requests/certs.py
 @@ -1,4 +1,4 @@
@@ -56,5 +124,5 @@ index 06a594e..bfa7839 100644
  
  &quot;&quot;&quot;
 --=20
-2.24.1
+2.31.1
=20
diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb b/meta/rec=
ipes-devtools/python/python3-pip_21.1.2.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-pip_20.0.2.bb
rename to meta/recipes-devtools/python/python3-pip_21.1.2.bb
index 99eeea2edf..fd7a145205 100644
--- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
@@ -2,14 +2,14 @@ SUMMARY =3D &quot;The PyPA recommended tool for installi=
ng Python packages&quot;
 HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://pypi.org/=
project/pip">&quot;https://pypi.org/project/pip&quot;</a>
 SECTION =3D &quot;devel/python&quot;
 LICENSE =3D &quot;MIT&quot;
-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LI=
CENSE.txt;md5=3D8ba06d529c955048e5ddd7c45459eb2e">&quot;file://LICENSE.txt;=
md5=3D8ba06d529c955048e5ddd7c45459eb2e&quot;</a>
+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LI=
CENSE.txt;md5=3Dc4fa2b50f55649f43060fa04b0919b9b">&quot;file://LICENSE.txt;=
md5=3Dc4fa2b50f55649f43060fa04b0919b9b&quot;</a>
=20
 DEPENDS +=3D &quot;python3 python3-setuptools-native&quot;
=20
 SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://0001-chang=
e-shebang-to-python3.patch">&quot;file://0001-change-shebang-to-python3.pat=
ch&quot;</a>
=20
-SRC_URI[md5sum] =3D &quot;7d42ba49b809604f0df3d55df1c3fd86&quot;
-SRC_URI[sha256sum] =3D &quot;7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4=
949920675563a5a6967f&quot;
+SRC_URI[md5sum] =3D &quot;a867fd51eacfd5293f5b7e0c2e7867a7&quot;
+SRC_URI[sha256sum] =3D &quot;eb5df6b9ab0af50fe1098a52fd439b04730b6e066887=
ff7497357b9ebd19f79b&quot;
=20
 inherit pypi distutils3
=20
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------08C50B139D8D9FA8A1FA2804--
