Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2225.1626374434902333038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 11:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=INciBLuZ;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2830b77ae9=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16FIbKsa011516
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 18:40:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tcr8gjev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 18:40:33 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16FIeXqJ015477
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 18:40:33 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tcr8gjet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jul 2021 18:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eg81E2ZjHkGHzRt3U0rDfG1kSZL9XIh7GiOGMx/ZcD8ajJAq/QhZpdO6PjhtRbh/kIxBtPiVpiajdap78GCFfoRX4h6o+uo1lHzTJI9lSCB/cEqWnNSUKTrhnb3T9jhit3A7S2vyOAMbSgg6j7XzNZkreicWoEQ8gnq5P7VAkIuAEq2nJBF7q2hQXOu3syJhyMTl+ENBrVwEe+Qgny8WCh8NLoVxgI9zn1m8xk2xekkF3oQT7lyf92QGEblapZuO7/yEfe2fHfX99IO6WYe8zOWUzshdy27xeq1EZV6mTXdkbkoOsZqFt4FLq76OyCrdKdEaqONdsU3i2CPkSAI69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm9rDsrvvAn/xKtatkCv9iKjqy/0DU0MnxyWbZKaKCI=;
 b=X+1lWg0RxQtjdIyuuad8PzdkteecsDdjuHRUokr2b2cYqc15eYU7i+BmOgyeMZtRbf4kMnEMp9S693pLujnlCfhJR+9XuFtPIvM3y4fpKThskKz+s7PSZIAtQEWHDuPH7F2QdHOUdzqv9npfxZi5y338rrcsMSgGaItaEowt+2M75vlkBADVsPqH34m5WxBNuRVvvfryZpowbVvJ58QAxk6Lv1MSOb8q0D2ZQp7Bvh1Pwk4x3P2HLVGsHayft7WCuV0iNimAuMx7gDEAN7HjPPeJz/eD02BG8mqe5fGHDhlp/RZZq+cFvN0dGmj80n9dgHuNr5IhpjAB6QNSFd8RXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm9rDsrvvAn/xKtatkCv9iKjqy/0DU0MnxyWbZKaKCI=;
 b=INciBLuZU3d0rSP1G8U3GuklJlPOO2RKOUdH3KI7ImS6ZPSBI7DHrYHigZe3S+EQb6yS/zkGC/YpbQULnsvB37lu3XzCV4pGi4mldqiFTVD1D3HW1RZssOarBhgS1j0IAK6AWl7YSMj1PFKxg8y83RAEGoqib6D/hwTNLbzfM2I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4324.namprd11.prod.outlook.com (2603:10b6:a03:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Thu, 15 Jul
 2021 18:40:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 18:40:29 +0000
Subject: Re: [OE-core] [PATCH v4] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: Konrad Weihmann <kweihmann@outlook.com>, Khem Raj <raj.khem@gmail.com>,
        Martin Jansa <Martin.Jansa@gmail.com>, wangmy <wangmy@fujitsu.com>,
        Leon Anavi <leon.anavi@konsulko.com>, Derek Straka <derek@asterius.io>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1626076608-17034-1-git-send-email-wangmy@fujitsu.com>
 <CA+chaQfWtGf7gsUCLXcTuB985YYHM=FQszdX1d2y4fcjjEepOg@mail.gmail.com>
 <17064fad-db99-80e0-f9b7-ab8c4685ec7d@gmail.com>
 <AM9PR09MB46422B3F8BEFD4663D00D74DA8129@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <25443103-7c77-5576-8365-e4dacaae5db4@windriver.com>
Date: Thu, 15 Jul 2021 14:40:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <AM9PR09MB46422B3F8BEFD4663D00D74DA8129@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::f245] (2607:fea8:c29d:d7c0::f245) by BL1PR13CA0128.namprd13.prod.outlook.com (2603:10b6:208:2bb::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.11 via Frontend Transport; Thu, 15 Jul 2021 18:40:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8a1312c-2341-4e84-d600-08d947c00503
X-MS-TrafficTypeDiagnostic: BY5PR11MB4324:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB432423F82C69EFE95FBAE9629F129@BY5PR11MB4324.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yWyeqdAg+vz/oiNSnBYos5scwCwEZUOljqXgb3j/8PzXZt/2Fq1LELHsd3KqBcPiU8tp0qcD4vt78ByHCGgmBf1DLVr+aJ42o9FgwSmiOgbF+jF6HqaiOTKPTrzwdFZJM9ccmmjobk4BXSW7+NLZhb7bYrqJH/alDdeTfcfaJ+gzVp0PcjPjRhOBeeJD1bcI6hINMXLh6cLChW+/23tXWQ9f68OfPcT2t4rf7Kk7OgJA6W19/wIOu0/cXimW9GeOtmHQEOuLD8kS5OiknNKjbbMl8assF5l3oSBKfxm480ep9ko2z6VwYnPk1sAG66uJD4IFBUDzaHfNh9qwfPAQ6qMRzNxo4tLzvziKIEL5H6aR/HehAWFK7PjfdHKMZhD0yP5bo4evuJyeZqzSB2uP5ChhCfLBlAMAQ/2zPFLWrkLqM60Q8Ol9POdQeW97rXchb9+WAmaKFRDSyCVLNnjhszfPdBh8Mr/FJIODDi5XeAxkh/BKmdJKFWB+0phOrhVvD9VXmM3aNEm9leqzmywTba3JWPlY5KOlY/Liy68STDZvLESE2vq4kjIzzYubPR0Nmh8aqqEnJwUdvVrMqy5797GbULzD6D5aZ5gLsGUnVz2nK33EBe/p3Pbjq+gPfXvcUjW+9p/Y1XbKQyZh7WkS1rewtqCByeWuEnz/lCL8QzIUA9MrNGIfTvqCKwzRvxew9LZrEw4h96zdDC/K3G2voihK79EMnYc4rGkGLvICmOKb9tUq04GCVH4Wh0dvEkSzMYXyzw6Lcjac9gLDHxAk1W23sULRHcTAoHMi9wHMBL2qC9KAn2sjyLHcdBfT8g65pWNKMfQ2CU3nMES+3L5fsdS5GDsIiEJONcx3GcnNxm8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(366004)(346002)(396003)(66556008)(4326008)(83380400001)(186003)(86362001)(2616005)(5660300002)(44832011)(53546011)(2906002)(478600001)(38100700002)(66476007)(31686004)(31696002)(966005)(8676002)(8936002)(6486002)(66946007)(316002)(36756003)(45080400002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTk4OERvTnI5dHFxdWRJVUphcm9lM09mZ1lDcXFRZUFLejE2SjBHaE5tT2Zi?=
 =?utf-8?B?dnR0YitVRGpjelVvUGFtUzU1VHM0NXpFK1h1K0JXamcwT3dzakVxd2pQSGFL?=
 =?utf-8?B?SzJnM1VHS04wZTd4ak9wMHpNQ016d0ROVy9TOXY2eUV6eEt0MUI3YklXeWhl?=
 =?utf-8?B?K1ZOVCtVRjhaaU1VdGxJNGJ2aTVIUmN6N2tNZ2dXVURjcjBYYkI3RmM3anZM?=
 =?utf-8?B?MDYvTWZGWjdQMmRJU1NXRGhhNXBtbEJYTmMwSHB5cGVPbkdCWkJQM2Y2a0pT?=
 =?utf-8?B?YUl3L3VjNTBEVVdxSVRuZEtucDg1aFZsNDJLOGZoYXEvSFFxRWorNUIxQVBF?=
 =?utf-8?B?eDdGSnJPaFpOQzBjNG8rWEtYN0dSMFkzcXYrZE8xbDJFejR3Qit1MExjblRW?=
 =?utf-8?B?WXU2TDJlY3dmSVRSOUNRZUtscE9QTVRMUXlsTkVKdXJtTnFBb3d0TWJlOVhs?=
 =?utf-8?B?eTNaZHRJbHBTZUZETU80NWxjelFTVGhKMGMybDByMGF4ajdMdWRoQk9QanVS?=
 =?utf-8?B?ZHJxREllY0FHdEk0b2RqNy84eTdiQ1djQlZ3MFBLelF6YVl0ajNCWm1UeCsw?=
 =?utf-8?B?dEhpRWV4eXRxYkFaRXI4L2o5M2hlU0d4TThCc1NZQ0FxT1c0eWN0Z2c1S2tQ?=
 =?utf-8?B?YjFUOGc0TktBOStBSXlIcnlHNjVvRUt6ZG9sZzNhOGxBRHZrUUltU09HUXRV?=
 =?utf-8?B?Tk41RVJHWUlRZmNZWjhYSm9yVU5LcEt1UlBJdHY4ZnZsdWpsN1FhdEVZZDNG?=
 =?utf-8?B?Tmxtejhsb3d6Yys0WVdlSm9OSDMzYnVsaklmOEhCOXhlWHZKeEFtSFVsR1ht?=
 =?utf-8?B?UkhLeXJDM0NvS0xNdkdKeFR0c0JvTndadXR3Q2JhWlRZcHFRbXg5Y3dmcFhF?=
 =?utf-8?B?Uks2VWZBamdRZmtzN0VnUTBPMWJmWU5Mcm1OMi9WaXFCTWZueXN2a2c1dXJy?=
 =?utf-8?B?cnBIQ3dJbzl6YTMxUDJSZ0oyN0hmd3V4dEUwU01mYnk5SnZHOVhOTnlJTzVI?=
 =?utf-8?B?aDN2Q0hFL3NiL01BRlVwS1N5YVk5QzNLTzBGRldJUmxUem5nTm1Oeko5REZX?=
 =?utf-8?B?ZXlDM2h2eEdKWHY4OGJ4aEpyUy9sYXpDb2ZrZGNRTGpMYzRzampVQ3NCc2Fj?=
 =?utf-8?B?Y1FERkNYVEw5WTJwOWFJdlFBMzBiUU0wWGd6eXlGRGt6RUpzSHlROE5PVkxO?=
 =?utf-8?B?NDE0M2tyRlFNbTJCZTJHQU9WclZBcXRUbG1xQ1c5b1lCcklmR0NBU044SGJM?=
 =?utf-8?B?MGFickc3K2JtRTM2bVlBN2tIWkFMa2RLcmlqRG56UDdWSVJKZWozU0I4aFp3?=
 =?utf-8?B?bTRhVFV3R21IeGlvOUlhc3Z0eWxQQlRzM2FDQytFWGl6bmhVTkJGWFF5WWcr?=
 =?utf-8?B?WXJNQW56YlVsMkJnSzhwRmdrWWFycG0wbnd0cXZCM0NvdkpTL3d0L1B3eWQy?=
 =?utf-8?B?enlaK05SZjNhT2thR1BhUDhkcnphWGRIczdZMzF2V1IxZTZvblB1eDVpaXRK?=
 =?utf-8?B?RVFjK01KM2M5ZHZubVlhVS9CMTNzazBwb2kweGowU3BTOHMvTSsvamhEbkF4?=
 =?utf-8?B?WTEzUHZ1VmxrdTAxYVdFOWdienFsUVp6MzVSUGNDUG44MzlHR2Z1WmVJMEFm?=
 =?utf-8?B?M0Q1ZGowVkpPTzZlWFA4ZzJPbGNxaE1VbDJtQkdHSUFsaWpBaThZVjkvclND?=
 =?utf-8?B?K080SGZ1SjcwaWg2azBBczdhczRPaE4wOWVPd2JaeDRyZ0VndEJEM0lTMWd2?=
 =?utf-8?B?b09nSHJZSThxOVhmYkx0L1VTUjZRbFMxRWVWMEQ1dHRCTlBYRzhiUWNrbmlt?=
 =?utf-8?B?aEkrZ0c2VDNvK0hNVEpvdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a1312c-2341-4e84-d600-08d947c00503
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 18:40:29.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRN6XEoorvC7RHaBmbVryku8OGjmxslOHlY3a1zlJgA+BpeJijnSFQzuAYaJnyVnheNaqzpR63i4c+AAD70eihy5x+YZHKyaxjwfvZc3TZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4324
X-Proofpoint-GUID: iFOBtx2PLVSQ0DJVd-W7vPoZP6evC245
X-Proofpoint-ORIG-GUID: hRPUihWiNqMqRJkcZsjYlti2dWW7PLZR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-15_14:2021-07-14,2021-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107150126
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16FIbKsa011516
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 2021-07-15 1:57 p.m., Konrad Weihmann wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 15.07.21 19:22, Khem Raj wrote:
>>
>>
>> On 7/15/21 7:43 AM, Martin Jansa wrote:
>>> On Mon, Jul 12, 2021 at 9:57 AM wangmy <wangmy@fujitsu.com
>>> <mailto:wangmy@fujitsu.com>> wrote:
>>>
>>> =C2=A0=C2=A0=C2=A0 reproducibility.patch
>>> =C2=A0=C2=A0=C2=A0 deleted since it's been merged upstream.
>>>
>>> =C2=A0=C2=A0=C2=A0 v57.1.0
>>> =C2=A0=C2=A0=C2=A0 -------
>>>
>>> =C2=A0=C2=A0=C2=A0 Changes
>>> =C2=A0=C2=A0=C2=A0 ^^^^^^^
>>> =C2=A0=C2=A0=C2=A0 * #2692: Globs are now sorted in 'license_files' re=
storing
>>> =C2=A0=C2=A0=C2=A0 reproducibility by eliminating variance from disk o=
rder.
>>> =C2=A0=C2=A0=C2=A0 * #2714: Update to distutils at pypa/distutils@e262=
7b7.
>>> =C2=A0=C2=A0=C2=A0 * #2715: Removed reliance on deprecated ssl.match_h=
ostname by
>>> =C2=A0=C2=A0=C2=A0 removing the ssl support. Now any index operations =
rely on the
>>> =C2=A0=C2=A0=C2=A0 native SSL implementation.
>>>
>>>
>>> FWIW: this change
>>> breaks=20
>>> meta-openembedded/meta-python/recipes-devtools/python/python3-cassandr=
a-driver_3.25.0.bb:do_install:
>>>
>>>
>>> + people who might be interested in python3-cassandra-driver.
>>>
>>> | Installed
>>> /jenkins/mjansa/build/ros/ros2-rolling-honister/tmp-glibc/work/core2-6=
4-oe-linux/python3-cassandra-driver/3.25.0-r0/recipe-sysroot-native/usr/lib=
/python3.9/site-packages/cassandra_driver-3.25.0-py3.9-linux-x86_64.egg=20
>>>
>>>
>>> | Processing dependencies for cassandra-driver=3D=3D3.25.0
>>> | Searching for geomet<0.3,>=3D0.1
>>> | Reading https://pypi.org/simple/geomet/
>>> <https://pypi.org/simple/geomet/>
>>> | Download error on https://pypi.org/simple/geomet/
>>> <https://pypi.org/simple/geomet/>: [SSL: CERTIFICATE_VERIFY_FAILED]
>>> certificate verify failed: unable to get local issuer certificate
>>> (_ssl.c:1129) -- Some packages may not be found!
>>> | Couldn't find index page for 'geomet' (maybe misspelled?)
>>> | Scanning index of all packages (this may take a while)
>>> | Reading https://pypi.org/simple/ <https://pypi.org/simple/>
>>> | Download error on https://pypi.org/simple/
>>> <https://pypi.org/simple/>: [SSL: CERTIFICATE_VERIFY_FAILED]
>>> certificate verify failed: unable to get local issuer certificate
>>> (_ssl.c:1129) -- Some packages may not be found!
>>> | No local packages or working download links found for=20
>>> geomet<0.3,>=3D0.1
>
> But that not directly an issue of the setuptools upgrade, but a not well
> written recipe here.
> I'm more than lucky that this update revealed the issue, because
> otherwise no one would have really noticed that the original recipe of
> cassandra-driver is pulling sources while installing.
> So just in case I would rather pull in this upgrade than to mind the
> broken recipe from meta-python here (just my 2c)

FYI, I am working on a recipe for python3-geomat to make this work=20
better in the future.

- Trevor

>
>>> | error: Could not find suitable distribution for
>>> Requirement.parse('geomet<0.3,>=3D0.1')
>>>
>>>
>>
>> yes its reproduced on AB as well.
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1397
>>
>>>
>>>
>>>
>>>
>>
>>
>>=20
>>
