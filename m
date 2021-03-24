Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.53])
 by mx.groups.io with SMTP id smtpd.web10.2135.1616567509554564358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 23:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LMtgsXLv;
 spf=pass (domain: windriver.com, ip: 40.107.223.53, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6R1fgTTppVXp3jV2o4n8dMv1pvDR9UMKdhuyS9zRoTmqzivgYGMlf7XlA91XJVHjohYH4sU+A3mgXGAoEMOXALbdYO1Bw/XjWapKNeKTJmNBvHwfwPzCCM+JXEIy3bfGHHszEvMzEUleAzR4jTJNoLXHlrGtEMPkJ3xYx6cP0dxttfmDNkMnEpwgNjQ1fnTAQ0O/ndHGdUwwwVdr3hDgAwUiLpXGDFPEq8sJ18HTn2d2XKMeA7RpvIVtbU2UaX4GMWs1cVFravuk+flzGlt0pg1/ZE66A4MqFIrf1S0XY3RR14G/nE7LeuVd9MTiPP0qwSPFSvGLtu33ypd2w5txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va15NGyer71e8M8AdextoTAEL1YBhYZH5xEfPnRRgK0=;
 b=CNnI6gOYhqUt4/0aigHD/jpwy2DC1PH0q91T6JukHgRsiA22AW8uYfBhOoLEB4DCOYKP7OP3Dag91eJ6MoUEPzS0iDlvRHefPnNnQVbegBepB4TkBWyv56Uw2Q+pYMS5QXVGq/WCFLU54pSY4IIzgPwhgiIZF0wgtuJbks/yyiqky/jUFyPHm4TtAcKaBeHUoIvbSbZDLo0eYAVryQW2vbJn9PTZZ2OKYC9aQvCFGeVR58+lk3XdYBSLaogLqRyMNOSJVJVh/h2da7u1FC3wkuo1SLNRTI4raVfKjXhlLkWjlAmbkQE/F8TfX7jkrmpPaJ47agqJiTaecDz4GXXC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va15NGyer71e8M8AdextoTAEL1YBhYZH5xEfPnRRgK0=;
 b=LMtgsXLvhtmzlHVLiksOQKnTw6/MvLt/VDHYsGwC7NzElZiJ0MUUuZV8r+736RbUjKzGERmbyruPnkThpEduy8i13WUdh65RcE2X5rU1fJWSs1BgVkwi6k4nSfAEJOPguF+xjHdx5Wu68YLkAA/ZBKWJc+n9qI+7VdGKOfYQkVc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1949.namprd11.prod.outlook.com (2603:10b6:300:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Wed, 24 Mar
 2021 06:31:46 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 06:31:46 +0000
Subject: Re: [OE-core] [PATCH v3 1/2] gettext-minimal: Disable the unnecessary check in iconv.m4
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <166D65C2E097270E.28077@lists.openembedded.org>
 <20210322075103.9694-1-mingli.yu@windriver.com>
 <CANNYZj-7gQg41Qpue1ZR3HCBHKQ8veD3TOwbvRYcD5=wv0Pj6A@mail.gmail.com>
 <d083f9194f73872623f20f81c697e0bff914764a.camel@linuxfoundation.org>
 <32564b97-5911-f9f4-43cf-1189c3b778ff@windriver.com>
 <7f206ae780b0275524b6ee99ed225e9147f976f9.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <c51ed122-b304-f022-c7ed-d71690e7c1cb@windriver.com>
Date: Wed, 24 Mar 2021 14:30:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7f206ae780b0275524b6ee99ed225e9147f976f9.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0198.apcprd02.prod.outlook.com
 (2603:1096:201:21::34) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR02CA0198.apcprd02.prod.outlook.com (2603:1096:201:21::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 24 Mar 2021 06:31:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e226355-19c7-4018-bf8c-08d8ee8e7f6c
X-MS-TrafficTypeDiagnostic: MWHPR11MB1949:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1949DB967915AC28C937BC1CF1639@MWHPR11MB1949.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VnMsixJPicLe0ODHc+SV7cmMSdIcE5Z1srZWCnKf8GB9uKRQKKMroxZ0a2gJbCCAPSyqj4XCb56IxNiUgBbu2JDVEyGmKqTIVs+ljVzrId6KC9lGduyLz7o99b4zTNGNvePMJfGA0INvmi/qOSP6a5TZvvesXf0uQ5b7uEs3u+p+HqsPYv90saG/E1aXblNCc3IAXKypbg7vTpIXk2FvLJByqr9H0TbC0KXwFkqhVEgSipajgIAmfGsUhniwXxkKy6R51/9nSnHZcW41oLoYjLOezFq7Pte5TbvNb+74gGqax8t/jz1qEopKppX0BuQSwjk4q4KNRiFREHRnEMhyYufMCXoRAbveoifPr+Ebd3DYCRqT8zlGN+AyBMC44AItI6kH/qdBzdvrMAOPWYgUiVqrSYsNnfNUB27cp7AylMm0YxHqzud4bZoOQE8g5amY7faAu1ZZ8sGuYBuhA1CcpmA7HoOYRDB3w9fYcUiCrYDw4ZODWwDxRWLaLJyaRrAICS70emw5emSGlKL7BrNAfbuQG+KDmB2Ge3fY2n/NAf+EJYOiHlPdauIunbdpp6Cszt4EGQMy7CBPBkpuw2tH0cEjP8u0+a3cj2BestGYrdsHBbLb83pBDi+K8wGHinOpJX2jAjyd/dx6b5OchiwtDmexI8YhL9rT0i/cL0sgayZNLkMJeFKUNvxfizf4MJwI71W6zfKTBI2G6/uZE1beSlxVvbA1q3qgueAchV+bKHmwlSbkgWD9Sby5iwOEuPk1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(346002)(396003)(366004)(110136005)(16576012)(186003)(16526019)(31686004)(66476007)(66946007)(31696002)(66556008)(316002)(26005)(36756003)(83380400001)(4326008)(6486002)(52116002)(478600001)(8936002)(86362001)(38100700001)(53546011)(2616005)(6666004)(956004)(5660300002)(6706004)(2906002)(8676002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?LduIUfIKPSB77KLWSdZHWDypRmuOrZ+np1F+O781nvbSMZ1AJW/QymCTXWzG?=
 =?us-ascii?Q?3f3KSk/pDd/sSPuvbemCkYMizBogrfg3fo6NVVuicv9dxKGeStDclBa1l0Me?=
 =?us-ascii?Q?4js55vvsvaTi6ht2rXTLSWG5wEfNBbXBl4wimJkfauswZdyaUMO4VnwGw6XL?=
 =?us-ascii?Q?92R3Ppuyokx5Y+5xWSU95s/BrdxMfu8kSSHs85H8AN/BROe60YZ/CBGALmae?=
 =?us-ascii?Q?eDWSV2S/cpfCrRUnePCu/JVT+rnIUFeYZBM+kbXb3gUWHo1dfccryy4SIPtU?=
 =?us-ascii?Q?6lEYx8PoJpKgAFha9/kjJuFl39NXGXmzzv79gmC8/cAF3UWYn0R1Lj0cIL+A?=
 =?us-ascii?Q?/AXeYhjJvVzPc7tKdX6aWHoMwo2PTyfdu9fLx3OnHDWua6eQrKVHrMJS53cn?=
 =?us-ascii?Q?/qCTlXRtLTmaqmNYUe49KfArdcNATb5BWcpyH6FFOCGVYvpAiKu1r/tUSC9v?=
 =?us-ascii?Q?v38/bhm1mvHnyStl2LETvL/ierd7AOSgFuthyxUkvP5tE9tJ4bE4WDqBt5/2?=
 =?us-ascii?Q?fAIszAiO8ca4ifChX5TmBLVKTn0V2tsZD3aSPDFHIo1yJboiD9jqlvz2CZVf?=
 =?us-ascii?Q?K/GW335MboYfqtplCWbUZq2+Qj4tht8lG3i5BG7iaiErKOrgxH43DlDl53sU?=
 =?us-ascii?Q?Yw/2f2eGDEb7KntCUhuV/YXLkOfkccnaL86+MfaoybxSm2n4bLfJFcheRtKZ?=
 =?us-ascii?Q?jBjSxRhSPcH39+vY7IUZbYjEUA/JTTWotrrd36ZqdMVHpd9ptWUkAeui++RK?=
 =?us-ascii?Q?cLAiqLSipYJlvcl3MG4BSgPgY326UuBsSbKHHQU9pn4aEfBEKsukrNQ/4QvR?=
 =?us-ascii?Q?sW0DDnhgA3ZihK1BSMuJw045Rw4ioQ4n7wJPOIsGeFIGrPLJ4umDwui8f+VY?=
 =?us-ascii?Q?IcoVcuJS0MvdhLT1wgvWbtjf8JBeG1Rwz9AosYBHHjty5CTZf4qTodFiLqAa?=
 =?us-ascii?Q?n4h8zhLdHjx7U9udRKGcjVv9Kpx8bz7HrXT0zY5qkvimh69HSJeChX3jA40O?=
 =?us-ascii?Q?JxTtde8/CZk13a7Yn0o42x7Pztc3fw80L88cbcSlNE69L+UJuyHkqiY+UFIT?=
 =?us-ascii?Q?PorjO2hTYGH5oJyfkUpRPCCgg1yIlNrELnVRXSMQyN9EEnTa3+GRj5yDGfw+?=
 =?us-ascii?Q?0L16ZTD2VmzU60VJg+zqivFmrFpwb9/cQQ7FoQ3GxPBZrniK2vRUEp7lhJkQ?=
 =?us-ascii?Q?+Gv2P2dv9q/lg24ktyReibDVsHdfeHEXirgN75MjpDrwL53vMXJ2Ti6BMsFQ?=
 =?us-ascii?Q?1/v+yzp/nFeBLPNAQUQvorkbmsnOQKdl0t+yoVEkLFiOsD+yVCwrVzTAgRBg?=
 =?us-ascii?Q?tV91UV3w0XE78y0Mv+Np8noM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e226355-19c7-4018-bf8c-08d8ee8e7f6c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 06:31:46.4839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oktLTZzOXNL2wPkNAivcnJhx0dC309vLwRT+QtjHz4ZxR44g8MOd2ZaLdMXjKKFJZ16M0P6vu3A/DQBHRmMtYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1949
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/23/21 7:11 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Tue, 2021-03-23 at 14:25 +0800, Yu, Mingli wrote:
>>
>> On 3/22/21 11:24 PM, Richard Purdie wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> On Mon, 2021-03-22 at 11:29 +0300, Alexander Kanavin wrote:
>>>> Note that this m4 file is copied verbatim from upstream gettext, and w=
ill
>>>> be again overwritten on next gettext upgrade. You should figure out wh=
at=E2=80=99s
>>>> wrong specifically in elfutils tree, and work with elfutils upstream t=
o
>>>> resolve it.
>>>
>>> It's more that there is a silly/pointless macro that breaks native buil=
ds for
>>> us, the issue is in gettext.
>>>
>>> How about we set the cache value globally for this macro and drop the p=
atch?
>>
>> Hi Richard,
>>
>> Do you mean define a cached value for the marco AM_ICONV_LINK which we
>> patch against?
>>
>> Seems the definition of the macro AM_ICONV_LINK we want to patch is too
>> long and I have searched via "grep -Rn CACHED_CONFIGUREVARS *" in
>> openembedded-core layer, didn't find this kind of usage. Not sure if
>> it's appropriate.
>=20
> I've sent out a patch showing what I mean, see:
> "site/elfutils/libunistring: Drop patching for iconv and set in site file=
"

Thanks!

>=20
> Hopefully that fixes the issue.
>=20
> Cheers,
>=20
> Richard
>=20
