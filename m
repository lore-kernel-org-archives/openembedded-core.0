Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.75])
 by mx.groups.io with SMTP id smtpd.web12.392.1613596850682047052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 13:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fnxnGGg2;
 spf=pass (domain: windriver.com, ip: 40.107.223.75, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmOP9+LCunoxXsH70LEO1DLhIqdXwZ+5HNxmnOXCJkaY4aJva4MwcovgbpsfNH3mLq+Qslkr1tGt5NVSIivaatgJrmeqKh75iVms0Oeth5Cw5MJ4UWPLyQnA97VNlTZnjULepJVdL8ckplezbv9Rp7A6EC0fbqWsPOnWVqyfNZBJLVaMqCayS7vmyWZRtKOiRtSz8pdgcCMaBOALPldJLu0KiH4PU/f5KPvM3brsvkfCW22A5fCoTemZB+6ppKzyvsBBYH7v2+HZ2oFOsT89UvyFPh8z4yLvSUrKirhdVVpyDpMS/vHA18I4VD1niF8bd0mpKuF2nPyigLM0keSDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVH6GuCHE0isRlS029tLmOc+7koEZdYBsio/5s9IoZ4=;
 b=EEWqA29oCRGHj+mYTm+q9hlr7+w/Ijiz2zUZm+aOaLFRYYL+HPds1MxIpQzhT0bGxb0GAjL5yMD0+BXqa7wkg+XL24U2woeqqm7A3/ZrgGpyPtr2sqPrS/E5HwUocTLMMVgeZOKebqYuUMeeaL4Y+z+UO8VH5/f6wjxA36g3WhFNuNidXE3fb0wa0x4+zZpZ/qsvGWCO8pI0f8KyoMkDLt9eaLPf5+P+48ltLfI/LGlA+vstqWmosVPFr9nfBahBv/mIzmitO1hCNZfrvq5KGDozqz0cM3DAe+9uiHZjiHKcI3BBij8ATh7VSnWIoJgrYdRyJd8pUBaC97iTjaxFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVH6GuCHE0isRlS029tLmOc+7koEZdYBsio/5s9IoZ4=;
 b=fnxnGGg2bJfyO4oqxHxHLaVG6vx81RTVnrNtxdBe8GHPWSQVLCX/CcS9YCpmqD3fR2GkQlYhzgWznoG39RUMXY89qiJrA3cPRxLsLcjPsaSTuL9gGlAl1OnKuGsOhLUxSvjQFDeMdYk92Fw1MrnchfOEac4h4/CHJZmGsBW87zA=
Authentication-Results: blackfigtech.com; dkim=none (message not signed)
 header.d=none;blackfigtech.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 17 Feb
 2021 21:20:49 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3846.042; Wed, 17 Feb 2021
 21:20:49 +0000
Subject: Re: [OE-core] meta-rust -> oe-core
To: anbelski@linux.microsoft.com,
 openembedded-core <openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
 <schnitzeltony@gmail.com>, Vinay Kumar <vinay.kumar@blackfigtech.com>
References: <e9e8693d-2e4c-40be-55ac-37ae001ec7b5@windriver.com>
 <557d69ebe7e78cc245a3b4a9cd90223e9a2d7021.camel@linux.microsoft.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <2a4a5d44-5013-d74e-f2ed-3fa031c96aeb@windriver.com>
Date: Wed, 17 Feb 2021 16:20:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <557d69ebe7e78cc245a3b4a9cd90223e9a2d7021.camel@linux.microsoft.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: CY4PR14CA0034.namprd14.prod.outlook.com
 (2603:10b6:903:101::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by CY4PR14CA0034.namprd14.prod.outlook.com (2603:10b6:903:101::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Wed, 17 Feb 2021 21:20:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: def78560-e4f0-4fcc-947e-08d8d389e5d3
X-MS-TrafficTypeDiagnostic: DM6PR11MB4580:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB458049C54C3B76F4CA56B74EF8869@DM6PR11MB4580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8GysAc6w32/O58p47NqFyluxaxdzccSOJafdTzVTa2ToH78rx7vdLyDR7RszRuffklZJbkF3mEX4vF9UiYz5KvAVYiLj1d+Y1jr4bdm0AVcmTNDywzu/hkroZt4TMv3sZ/l15LkafefyVkeokFj244rHuXa7Ut5qizpMLEEuw8Qad+Y7oF49DN5EWOdIH0WVEV9ZakOpQakhmR8Kmbt+RH432BDIBS7x31CRqDBVXM/tZ1odUVB6DZL4DrOyNekupEgqZHPhYxUAk9m2iHsfmJ7nUREgoWmiDKJzFsl6TN5sK/DkuE/H7UW1z7SETo4CCL1EwfCafc3tZzHCWIsqE+c45M0/7EIwOR2nycUu9VK7okzbV/ImrKa3Js3RLncG4m86QOC5pf2Qw24uCSiikMsmESyOvvukGmAmbRPlHQFaPtXpAiJI6oXSpKmhDW0v27CwkKKVvpZHxlYtMmHblZYVsId+YfeGUmgnj1b13uYkrPUsfxSE1LMe5EbhCrEUKIbO9ZHEoU5uBnH7Xh9g6gfvB/ms8y2YhLQ5EJQfpZD4cOBiIDM8pakr4KKTJ7A4RaMSCi467H91c/91bUTBtkmUcR/zXf/G/fr0ebkFdQCVMm+gNWiutLz7QVQtlhHhtp1cO6dyo225brhSxRHAHK95q6uQ2dPYgNcOSixb6QckN65neQnLvlBTxo5Q4vvw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(136003)(346002)(396003)(2906002)(31686004)(186003)(16526019)(26005)(16576012)(6486002)(316002)(4326008)(36756003)(956004)(83380400001)(2616005)(53546011)(8936002)(31696002)(8676002)(6916009)(66556008)(54906003)(478600001)(52116002)(5660300002)(86362001)(66946007)(66476007)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?X6abyE86Fw32EqxzZnxZ2TbePdD9zJhaHUVpdTBu2VN6F6T6bHmm0VXz9H88?=
 =?us-ascii?Q?JG14HNUWJUt+LlVQHPlI8ymmr+s/luC5VEkCFHov8yGBbhf4ZfSxyANtrBpt?=
 =?us-ascii?Q?WILFxFRaHDZNEEd7BWkPfCbxAfb3LX4W+weq32r//eZExVyVvIqEqy6GZszJ?=
 =?us-ascii?Q?aGcnVWZZRivb6xoqQkU65t1gCdIvQWZIqgcNhYxlikyyUNwWUyaEDKTC+VZc?=
 =?us-ascii?Q?67KmBYAbOE0u1i/dSEM8JeEpkL8xxhHyumMZr/CS3I55buVFutGKsUQrENdn?=
 =?us-ascii?Q?qy0lDpIDQFXgCjnN+pgQ96G41uhOZVtRcsm62z50AZC4ipTXa5usW/7CDJpg?=
 =?us-ascii?Q?FnSr1eKIH5ipRWtet5TR9Y9YPJ1I6X4wnmZauMIWbbWQbz7jWWAhvy8Jw65R?=
 =?us-ascii?Q?/NxKVU7Or5S06dyQh00zAPzTjeauJB8te4CazWSYAaLDXSqxjEFn1xcsyY8A?=
 =?us-ascii?Q?S4voTGqtotjGUecw62fPTjjzow3KA+7YrRCaOI0uF7qwfinyD7XqaD9q5yjG?=
 =?us-ascii?Q?7OneeoNilJrLNTZc2EUgvE8qRb9Zg9HerW0CIfANPfCb2pGBn9SrDjW73y5j?=
 =?us-ascii?Q?ZpJOemaWAhoYTBC0u/V6vfsCrjX4++LFbdGgOaLV4wKi5D5Kt9nS9Crz6ty/?=
 =?us-ascii?Q?+YU2V2c46QFbd2nhbZP0WYDCterjVcq6MPY3rADqXSAuu49mpz6l/LZhDJyh?=
 =?us-ascii?Q?Jd1ihmoZoXmRT0dS04vzvxSEIpDFvvJUe8/VGVk1JBS1iq9etJYpjQuZoDPr?=
 =?us-ascii?Q?ZZom7CeZz4dndPgOQB1FH4GKtOY6xm3J7Z/k9jvCvg/kQYu82R5scc90g8BD?=
 =?us-ascii?Q?a0p8zb660FfH1puxKD7gmIUWjjZcIgJWCjzKJGeSY10QLtPX4DssOfovasTH?=
 =?us-ascii?Q?k9O5RMtjNHPzW3kGrwgH+9CKtB1v0pTYS10gWUjpzvPDPL+V04xTU8oj5l9j?=
 =?us-ascii?Q?/lTlyWwPqtp6/Fv0xRowhDUWHwxZ48ZGY77Std0Qmxdg1pLSZx6L+Pf3/qQr?=
 =?us-ascii?Q?yvgt8JZjOFuwfV4U0DfbXLei1aZ6pEAMunZnK/Y0vHHRqziJhC26+L0DCECA?=
 =?us-ascii?Q?TMEGBKxXy9MPvfCqIAk9+XwFw64rtVHbtaq4VJ29GnR66xA/Ryx1eWzoOvIU?=
 =?us-ascii?Q?usDaLNo0DzfC1Hm0VlxPaUVzwthPskK+Fuo2wYAd++//oT+6IKle+elLp736?=
 =?us-ascii?Q?7ziI1UWoxpgvagfYUuWCTqpXg/0bkFDPDqdrk95ISEfGwN6UAjmbECTJ9LiX?=
 =?us-ascii?Q?yMLPoNrabaNh3SK/f8j8WF8vv9i4MzPE1qa3XeKvlthy5NF3NWsZf28c7Ub5?=
 =?us-ascii?Q?7epYvT34AxVdQQUB0fXxP6iv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def78560-e4f0-4fcc-947e-08d8d389e5d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 21:20:49.4602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CirjVa7E3THjyvwqJ43cUvnvn9e1SvBvtxWtimX+HldCv7IjoTQpZqGYzDY2QK8Y1svX8pHtyR5doJMPH1sIcjW39eOocCVcWywtaLlYUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-CA

On 2021-02-17 6:45 a.m., Anatol Belski wrote:
> Hi Randy,
>
> thanks for driving progress on this work.
>
> On Tue, 2021-02-16 at 21:40 -0500, Randy MacLeod wrote:
>> I've updated poky-contrib with my merge of meta-rust to oe-core:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacleo=
d/rust-wip-2021-02-16
>>
>> The build status is fine (shown below) aside from qemuriscv64/musl
>> and qemuppc/musl.
>>
>> Khem is working on the qemuriscv64/musl problem with upstream rust
>> devs.
>> qemuppc/musl fails due to:
>>  =C2=A0=C2=A0=C2=A0 libunwind.cpp:66:3: error: #error Architecture not =
supported
>>
>> Known issues if someone is interested:
>>
>> 1. I have an updated librsvg that isn't building using autotools
>>  =C2=A0=C2=A0=C2=A0 It does build with cargo but I doubt that will prod=
uce a library
>>  =C2=A0=C2=A0=C2=A0 that is usable. See
>> https://github.com/meta-rust/meta-rust/issues/264
>>
>>  =20
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacleo=
d/librsvg-broken-wip-2021-02-16
>>
>> 2. native-sdk support is broken:
>>  =C2=A0=C2=A0=C2=A0=C2=A0 https://github.com/meta-rust/meta-rust/issues=
/236
>>  =C2=A0=C2=A0=C2=A0 As shown in my OE talk last year, you can do rust a=
pplication
>>  =C2=A0=C2=A0=C2=A0 development and testing without this but it would b=
e best to
>>  =C2=A0=C2=A0=C2=A0 fix this bug and have rust behave like other YP too=
lchains.
>>
> I was working on the SDK support some passt weeks and coincidentially
> filed a PR yesterday
>
> https://github.com/meta-rust/meta-rust/pull/313
>
> This is definitely a wanted feature. If some would have time for a
> review, it'd be great.

That's great! I've been stuck in meetings all day but
I should have time tomorrow to review and test this change.


> Please also let me know how it would best be
> integrated into your patch.
Let's use the meta-rust review process and once it's
merged to master, I'll bring it over to my poky-contrib

branch.

Thanks,

../Randy


>
> Thanks
>
> Anatol
>
>> 3. There's an cargo-fetcher proposal sent to the bitbake
>>  =C2=A0=C2=A0=C2=A0 list from Andreas but I don't see a patch to meta-r=
ust to
>>  =C2=A0=C2=A0=C2=A0 make the two patchsets work together. Andreas, is t=
hat something
>>  =C2=A0=C2=A0=C2=A0 that you can do, even if it's just a quick change t=
o get started?
>>
>> 4. We're (Vinay via WR) working on a way to use the rustc test suite.
>>  =C2=A0=C2=A0=C2=A0 More to come on that later this week.
>>
>> Sorry that this has dragged on for so long.
>> Any help would be appreciated.
>>
>>
>>
>>=20
>>
>

--=20
# Randy MacLeod
# Wind River Linux

