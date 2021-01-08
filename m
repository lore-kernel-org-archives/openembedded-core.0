Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.59])
 by mx.groups.io with SMTP id smtpd.web12.2888.1610074088004974674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 18:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lgI45aYn;
 spf=pass (domain: windriver.com, ip: 40.107.92.59, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyaaxBE/N1/f7oFZ4c5YKWcXUz2CbkEDnFxCzhbX1e5ofl9JkL4P3Kox+0c6lFQg7MmYQc+mybx5mKFBEmHMgk5ZSNsKykqd3q3ltRl0LuWE/kW+QJf/SyK5tKta3krAPIMag0tpKhwpUiKCg2o/PwjPuMacUShSM/yvYYicJ+JfBkYMP9myme0dNl9PCriw3SgjL4+S3jGBLIWPzdw1YzppgrMq+TZk/OrAcDstgHFO05Zh0UORKy1Uz5x+/1TmFQ6vBKyzh9faVX7bDLLX7a0woykhPTtksV2IUKtnX9KfXd6XRj0k6nU3BJgKlvB7kay/5AiHRdVx/Dd/vojyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDl+Mx+XddjtyOyIvXQzHnPdpB8MHUyhU+1lgN9OYdY=;
 b=XJNRi6UIpBs6kaEsi7+4EAMu37BnAao597LncCe1FmuKVMnL4+uNEmdqmvfyma5v5s/NcA21LJGZoWj2YSMiuKsXdxlMxRIY2o1lPEaTBiMhU8lpXiCAQMWNFR1b6ZCfO8RpZf8bR6uAXjTlGN8iXF8Xb/dUqvqAQbvTZc4zLVee9eDoKCYTYUebm6w4nGbp4tGS7zqpUm4QAwTZWlTtmVa4X0GWJtOmlgCZyEMnidz7WthIowVvak8AuF+9GvE66ybD0/2HSl+TUbReMM1HgdiPvpPWZLSwMBAmgIPsMYixFKHmJ3HQC6gOShnR/uorCKxTyIzoT2TiEZzCp6/AXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDl+Mx+XddjtyOyIvXQzHnPdpB8MHUyhU+1lgN9OYdY=;
 b=lgI45aYni5pdsN93NDSG6e1nNqz9jgX8h5XyftfCgfGjJ0WVky8C/WgPN1t4AwJbc95AdhJVndDlWWxTQe9rdD+zSFMvINLJopfXUpzhjmVODPbfw2kRx3rYD7JLpqvBN+IkEcrutY8Va0i3+Y3XP0Fbij+TpvM1E4i+utDwojo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SN6PR11MB2654.namprd11.prod.outlook.com (2603:10b6:805:54::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Fri, 8 Jan
 2021 02:48:05 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 02:48:05 +0000
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <cover.1609934927.git.liezhi.yang@windriver.com>
 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
 <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
 <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com>
 <3966f6f4c6c748f36c73bfccaaa36fdea6b34e63.camel@linuxfoundation.org>
 <8eb45b12-acb2-ce3e-c821-3c381c1107f7@windriver.com>
 <180e76098a5349241c44436e0a146dbbd2fbdf46.camel@linuxfoundation.org>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <3ab16d01-971f-3b44-dbe4-2b0fbe52a02e@windriver.com>
Date: Fri, 8 Jan 2021 18:48:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <180e76098a5349241c44436e0a146dbbd2fbdf46.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by HK2PR0302CA0022.apcprd03.prod.outlook.com (2603:1096:202::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 02:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b4c06ce-86d3-4878-87f3-08d8b37fd2b9
X-MS-TrafficTypeDiagnostic: SN6PR11MB2654:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2654247BE1FFCB9E67459862FFAE0@SN6PR11MB2654.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ItuM6Hi99RIMnFO6f22FUoUJZc8PS7V8dJIus6g/EWQf3jmPLmSG5G3DxHlNh0LBgmM3uMVy3n6pI7q3U/Is8jEl6BBUWHBiTUYHUpXRyGcBQe2roRNImqn3gKDGJVt2rdU1ShW0k/QETrN9dLw5dnH4K9xyYRCySttdVwNaZIZ8yom9TB+9/KeKf5uThEfpCDqYLPbS2KiGadvhAszOZDG3vNJD2iCQYv/T48Z48rkUQ8zGmWnZDT4GUP34aMesgxxCdytPCgbCRjF+6J2jVOGjZwHPquYNUkhgQvcDOLpZSrNxVFcAcFPKt38rOakahhloc1n1CjMe3y3Xemc+mGylmV9F1jcvU1gEDUt6SFpVfRRUkajDNZyHF7EeyRpksJ3SKRU2qYmR7rSz/vhuRPDhBzt44A3Bib0YVieTNMbYp16YNrB/yxfYRG4g8yHvNsXsyXSAevL+5Th9CvN2ppV2C5ZuhZlNDS3Isr8YcO0E1jwKzghgueMdGGy0KftZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(366004)(66476007)(2616005)(956004)(31686004)(2906002)(186003)(66556008)(5660300002)(66946007)(8936002)(26005)(6666004)(8676002)(36756003)(16576012)(316002)(52116002)(86362001)(478600001)(53546011)(6706004)(16526019)(6486002)(31696002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?geq6FEWBBOjPSgP9c4MSAQRba/m3HcqJMErhuJ9A/UK1IcXhpQZ1y5RTSjzM?=
 =?us-ascii?Q?a4405B1lE5N+wT8HoyPP1/HopAjPEI2rNdQilIF7sIvdvLqSm3zCDwlSLOdp?=
 =?us-ascii?Q?1ZCVEUmz6BvlbNV0iNFMFTJr8WQE1wqQYGhZtAtl4ZKEbAqQssxDaokELwel?=
 =?us-ascii?Q?w0RY+RQiGEU41jx+lp/As4VEmgBYJimTFV8EkpSfNVbkoFZTj4RVV5Dwc1sx?=
 =?us-ascii?Q?HxlGMbfUY4b+GFm8jRxX10zQ4tVY41mIT+lmgJqpfqXyZyQN00pXN86+TuAu?=
 =?us-ascii?Q?EhHhRPcT9DUHN0j8FzrWfLXK4jaIz1GJsPaY7PgvFBmNDEl4WYaOQItzHNl2?=
 =?us-ascii?Q?arbspUURZPOcXnSYZYHKlLAaEWot1DaTO/2DhDlqj1PRiz7DUyr3wGCLiM1M?=
 =?us-ascii?Q?HxjEIeH0wF0f8bs24ZJczUnVxP9QESFr40YCoDLSVrpIEBoYFICteTdh0Fia?=
 =?us-ascii?Q?ALmEv/hAV2YICrfAQ4s2bfeMGAUYjbZGXgSYcfB7C8kHr7oaXyHzHMzVXtfC?=
 =?us-ascii?Q?ouoCIWkhoGMy1gtQhVxcvJA5Wi/WrMvm9O1Ju5GfKQAuFb4FPy/74IIS8p4D?=
 =?us-ascii?Q?21QaIvkO1EbRxr+7PJGUbSgOnbFwiV2p81J7DW9bgE5SWmXuiOUO2uEzxrsr?=
 =?us-ascii?Q?a1eOV6OM4HFskAsfWAJNJJarMXjoYK6x9DQnuQ/Ge/nX/4q73AaES1q/9mki?=
 =?us-ascii?Q?iWveDLVAxu1kvBaaJ5yo31HoQ7++0kVDz30zEv8mVT84tg3iP3C5Orz5ScYW?=
 =?us-ascii?Q?5wXFr9W9rZB3j5ubdcRMJXGsEUaj3pY2xyZ2stQ+1Da8gre4HEGU+yCl9RTt?=
 =?us-ascii?Q?/uA3c5RVYeAPaJPPQJlXdvL9rDsBFHPcbb1rOHEW7Cjs0blZvpexWZC+67+E?=
 =?us-ascii?Q?dLNeFCpPfV1HwXcNFSPp2OZefXA/xrlZnE9sJXB4dySEoE8qdf/VSDQx7xyq?=
 =?us-ascii?Q?czbh3vDyFI3hnkSRIRLFhs/5YakK/E8Fy5guM1gggNIWa9FO+WVki/4mHPDf?=
 =?us-ascii?Q?rt87?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 02:48:04.9508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4c06ce-86d3-4878-87f3-08d8b37fd2b9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4LVu/humYW+M0QFtF9U+9kvPTDuid4C1V/gJ4FSaL1UwTwvy2rVI6VDmYFVje3hpjaa7FWfUzuaGBvrdHpY7WeFWMvXAr2OzVVV2gC/+UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2654
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 1/8/21 1:10 AM, Richard Purdie wrote:
> On Thu, 2021-01-07 at 18:59 +0800, Robert Yang wrote:
>> There are two problems to use cache-native now:
>> * ccache-native depends on cmake-native and zstd-native which makes it r=
equires
>>  =C2=A0=C2=A0=C2=A0more time to build, so it might be a bottleneck for t=
he build
>>
>> * We need disable ccache-native for about 20 native recipes to resolve t=
he
>> circular dependency.
>>
>> It seems that there isn't a good way to fix the problem, or we have to d=
isable
>> ccache for native recipes, only make other recipes (cross, target and na=
tivesdk)
>> use ccache-native.
>>
>> Host's ccache isn't reliable from the history.
>=20
> Thanks for the analysis. I think I'd be inclined to disable ccache for
> native recipes then. If anyone does want to use it for native recipes,
> they can build a buildtools tarball of their own that contains it but I
> don't want to default to that.

Yes, make sense, I will send a patch to disable ccache for native recipes a=
nd=20
enable ccache-native for other recipes.

// Robert

>=20
> Cheers,
>=20
> Richard
>=20
