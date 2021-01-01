Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.77])
 by mx.groups.io with SMTP id smtpd.web10.8860.1609508062464499145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jan 2021 05:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LhFHVi/y;
 spf=pass (domain: arm.com, ip: 40.107.3.77, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTxX8YZQ4Lgq/r6TNPTeNQ598SsVTU385YleZiXRSFc=;
 b=LhFHVi/yWmLDnWVYOeRXXSmsgm6kRh+hV5Ek+sBTRhInte+RcxdUevkxNBnm24JSXDCVEDaOufgvLBPUWuSmTMPZxdne95fuOqEWiaR70sCYrHuCenc0Yb0wC7dvei9yQFhjEvjwfkjurL8BDnshKGwg+XQwLs7c3hhd6M8asbc=
Received: from DB6PR1001CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::16)
 by AM6PR08MB3160.eurprd08.prod.outlook.com (2603:10a6:209:45::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Fri, 1 Jan
 2021 13:34:19 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::d3) by DB6PR1001CA0006.outlook.office365.com
 (2603:10a6:4:b7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Fri, 1 Jan 2021 13:34:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Fri, 1 Jan 2021 13:34:19 +0000
Received: ("Tessian outbound fc5cc0046d61:v71"); Fri, 01 Jan 2021 13:34:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f905182ec20aeea
X-CR-MTA-TID: 64aa7808
Received: from 933936f92761.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 30BE11E1-F0C5-40D3-AD65-A4303B7572B8.1;
	Fri, 01 Jan 2021 13:34:03 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 933936f92761.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 Jan 2021 13:34:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmKOWPClmW/VB/X7kAiWmOUpVoy+uUvBCpeqHaBLGnWBjy3jqY1R0RzUDudxohRVz9bM6JgPJhDKyyoonnzUFPmp7NmAODgSglvuyLasmfQIU2+pKVLmI3Wo6inw7hMun5jrwYrtsiDfuiQJXkxI/Et605kPv+d3iatlj6rS0kWuXTiQYqMuSaSj1Fv8JuiAqcw2B5O8OJuoh2xNoxhga0skEVChJQufOQg7WY4payCPWcri7Q/CNZXDCIHkzECCo+4vtP8LeTf1bZahFSWG+jMrchMzg0fOs14qlUVIlPeT/6GWipdExILi/juPOldqPyTkSJuLQXh8WvfzpiJ0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTxX8YZQ4Lgq/r6TNPTeNQ598SsVTU385YleZiXRSFc=;
 b=lxAAsVULyAPyE783QiHbaJz7Xoc8ijGrZSHwZ/klALULf3upS8voYW/e4jrpaZQgQ7bPv2C9ktLekasa8eysjnkMArWAD1VAbQC32wy7dtdZhZ48x0+l7qkhwb2CjqCMLWf98U08fhHbXyAjUu23ssxLI4e6tRwIQiIMtpFgB3hTXj7c28m+4W4fTLtPQ0RkbFl5FM93qKJQgU0SdbIqfMPkRNm/XOn9SI0fgdl0K7RPJGyvx8F9nIld8MeiO5f7SuNjSkoDWxrZX8MJc58DGN9rlSeLGv7kaGku2ANjHRYGL79D/8z+Hwx+PZMAzgohQw3+eT4fZvKRPVIq1albpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTxX8YZQ4Lgq/r6TNPTeNQ598SsVTU385YleZiXRSFc=;
 b=LhFHVi/yWmLDnWVYOeRXXSmsgm6kRh+hV5Ek+sBTRhInte+RcxdUevkxNBnm24JSXDCVEDaOufgvLBPUWuSmTMPZxdne95fuOqEWiaR70sCYrHuCenc0Yb0wC7dvei9yQFhjEvjwfkjurL8BDnshKGwg+XQwLs7c3hhd6M8asbc=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4123.eurprd08.prod.outlook.com (2603:10a6:10:b2::16)
 by DB7PR08MB3753.eurprd08.prod.outlook.com (2603:10a6:10:7e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Fri, 1 Jan
 2021 13:34:00 +0000
Received: from DB8PR08MB4123.eurprd08.prod.outlook.com
 ([fe80::554b:1d82:e874:b606]) by DB8PR08MB4123.eurprd08.prod.outlook.com
 ([fe80::554b:1d82:e874:b606%6]) with mapi id 15.20.3700.031; Fri, 1 Jan 2021
 13:34:00 +0000
Subject: Re: [PATCH 0/8] kernel-fitimage extensions
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <97b0439f-5cf1-49de-1bd0-bf5c3de41f70@arm.com>
Date: Fri, 1 Jan 2021 13:33:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::36) To DB8PR08MB4123.eurprd08.prod.outlook.com
 (2603:10a6:10:b2::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.55) by LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Fri, 1 Jan 2021 13:33:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8ab9a51-7bd6-44e5-be2d-08d8ae59f11d
X-MS-TrafficTypeDiagnostic: DB7PR08MB3753:|AM6PR08MB3160:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3160569D54F1EA6B38B4BCBC92D50@AM6PR08MB3160.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 J7r3X1xQEcrFn78OKCVf48gRHR1tTZ3Ec9Th4oARpWBNbipo7v9wrp6NrpCFBKiDb5tJ3nzzuWzkhazXCvAK4P8ShTN3mKtVeOm3vonV7c6/CclB/V8wjRxw2ffZ7RtC3zzrH/ZNOX1s+W5rkja3r+lkk5d6Une2P5xPZSy4MJNYbOM/IsXpDfVivPxh8xywEDFsrOHMd1BDaZGpIGMxrzgiBPKJvKAzY3MJIWCx05v6lAkKbqGSyW2QnfJLUhXaqyawNXKviqVkLqOoQbH3SIq2chz1R84BPbiqHEf9IzMHD9FzbHFgj6Fi7M0naJo5uBOL/FJK1xwRUjgDw9Uy5022p3s9EtBaEwaDenn1dd/2QZ1+jz/wGTKFT1aAdYlAHdUIH8ZvCXwz/ZwewG1GdTdLzD48U57m25goj7iOjfDvKsuLjPY5FZanq1T9TxKE+kNdAlRbwbx+Zsu3KyZ9/YgoC/76W6wKhnEJcsl3/7/RsLGWqjQniOR64lAkE1SvzeVvw0gsHIuXImb+tlL27PWdut8JysSuJOyP4oh87xZ5TOLfdyN0s7g6znUPAB0g
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4123.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(66476007)(36756003)(31686004)(26005)(52116002)(8936002)(966005)(316002)(66556008)(16576012)(44832011)(4001150100001)(6486002)(478600001)(2616005)(956004)(16526019)(186003)(31696002)(5660300002)(86362001)(8676002)(2906002)(66946007)(83380400001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?utf-8?B?L0xvK0YxOHM0SWhCZTVZaUdZaWVGMGdrVk5jL2x3cEx6MktNQjBIWHlTTTBp?=
 =?utf-8?B?M1IveXQ2aUJLMS9WNjRDV2U3TnlwTGcxQ3g0MWpqVDZOUit1L0lQOVN2V2dv?=
 =?utf-8?B?Zit4TjB3ZG5DcU9PdTgvemYxS25NanA3MEp0bUtoTDY5TmRjZkcwSVRKeit2?=
 =?utf-8?B?UjNyS2VWZWRsMW5kZzhreU0vSkxXamhuWVNwbnBYazROcm1sclYwTXVuRXhh?=
 =?utf-8?B?TzhKRm5kRkFkbzNlUXd6VlcvRFFLdnIyWEtpRCtUVlY0RDU2Yy95WXBCZ3or?=
 =?utf-8?B?NytlQTA2c0ZSdndYcUFyVVY0M29TVWlybUNuY0NzYWZMOS9KTmY1Q05oRUJT?=
 =?utf-8?B?WHlPaFo0Q3NLN2xXT3lkVUZCMThiTGlzSzVoZVdqKzBwdU5lMDU3TFRNMmh5?=
 =?utf-8?B?V3E5eGVRQlJiRjVkc1ppTEcvZDdLT0hEUktDRVY5SWZ5eml6bit0KzQyRVVH?=
 =?utf-8?B?MHdjREhUbjA5dm0yUEJyTGx4ZnI1TFRtNGRJUmhnZWhVanBwWU1yMFJDc3JP?=
 =?utf-8?B?cWVjb2FMZFlINlJUS0JaZEllem5yMVhPVUdCNnJDYzlLNzFhdXorZjdjdlpI?=
 =?utf-8?B?aEc4cDVWd2VSRVhJUDVXeU1jY0JCeWZSSldlUWJsWUtNTm00RjVjZ3FKQWRq?=
 =?utf-8?B?U0hjWjM3L0ZYbTBSMzBjTjIwdVV0b1M5OTRZamEwL1VMM0t5eTBZcFpNTitx?=
 =?utf-8?B?b2djS2VMdHNYNWdNa0tMWDJSWHBtaXhzSFJBMlZQVDNHMjkwVXQzeXVnd2F0?=
 =?utf-8?B?amk0VC80c2p0NXllVzhwSjhmK1g5S2llU1Q2SUttSm1ZZnh2ekMrM1VReXBJ?=
 =?utf-8?B?R2I3d1E5YXI2czNIaEdoVDJlSXZCMWR5MmI2Z1JrTGdtOHVWcVBvT3RRRWxl?=
 =?utf-8?B?UEVjVUVLK3dTMXlCQjdmUzM4c3hGMTNzRU0xVHNWVDQ4bVZxaGtZS01FVzBt?=
 =?utf-8?B?dEdGRm42a0JxNHh0S1ZwbGwwMUNja3dyWENua1F6aWRGRTQxNmNsZEhDalFv?=
 =?utf-8?B?K2FHYktmbmc5Z2N2Um9aWUxsR3hhOHl5QlNXcnJSNzRjazhQc2VubjQvSU0z?=
 =?utf-8?B?bCtSbjdjN0IzbzF3ZFNrTTJuVVkwb3dnWHkxNkJNWXJ1UG9xSktvbVZmWmll?=
 =?utf-8?B?aFJUQmRuL25pVm5oUC9BZjZPa01WQWVxUXZFVUMxZXQ3VU1iSEZQVUpGbHJU?=
 =?utf-8?B?REdva3ZudUh3ZnZPcFV3QjcvM09HbC9tSXJFVmw2SjJaV2ZMZEpjVnI4Y0FN?=
 =?utf-8?B?Q3BEd1J2bUVnakVnVHQ5NUIwOFVUNkdxUElqSVNJYmw1Rmw3SnFYaklwNGZC?=
 =?utf-8?Q?NRdqflnu5x/5PdGCcj/QvT8M0avkkytDtf?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3753
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3400d565-9e40-4bd3-ee4e-08d8ae59e5b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LpUxBn0+b8hfTkn2y9MMl4NLa9Pi8+Cdbq+8oviO9ZH0buuJ/cKpSPMwGN94iLXIPaCzK84/+K6Ibpk2PCJVEhI5RU2t8yeIusYh6Ld/XQS1p3y+FShW6CjECircJUla4zV/DDNtEu4HqdVJD5u1PJdGie2uUlm7Gk187mci4wbUMHjQ+a0xxNKqe+/5OAyp7gCMFvy9o9OfaqdbIg2cOXgJrX4nWObmzIMfxqWZJ9SNYmIonJ9SfsS9VUEnq6GXONpDmJU6N64ZJSZtymK0WfQKO0VndXwmhrsBNV3Ij3S2zg3UnbfHhR72JH1qcV+Scj1XhlE678BshDOwqTt9bCB4lsYpJ59WYD7TEn4QXByeBZJcUXZO/7cPHABhMdZPp0UeXX3Rde0M5Haq49pXCqHMsoiEZpvTvI6sWYJ4HHHDD/tm5v4O9Ka9umua08ocWoQIq1Ynf7QXIvulQ6vxcFUbkOz/xrF5PcIyFjkQt6GCuTBvLp9r/T+UsPzlzSQN6zrn187hYOi9DxN5imwRtSh2eC7dqY1KX66+1JGSpZrUFmCRYeozqGgUJTMoq2is
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(46966006)(2616005)(956004)(8676002)(83380400001)(82310400003)(86362001)(31686004)(186003)(16526019)(4001150100001)(81166007)(336012)(6486002)(356005)(2906002)(478600001)(966005)(70586007)(31696002)(44832011)(8936002)(5660300002)(70206006)(53546011)(47076005)(82740400003)(16576012)(316002)(26005)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2021 13:34:19.3381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ab9a51-7bd6-44e5-be2d-08d8ae59f11d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3160
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

Hi,

I have reviewed the patches and they look good to me.

Thanks,

Usama

On 17/12/2020 02:51, Paul Eggleton wrote:
> Some minor extensions to the kernel-fitimage class, mostly for signing,
> with associated oe-selftest tests.
>
> (Separate docs patch is queued and will follow once these changes are
> pass review).
>
>
> The following changes since commit 6012fffa99b600956ea1076d60e050d0737b4c=
4f:
>
>    systemd: Fix reallocarray check (2020-12-16 19:44:45 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/fitimage
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dpaule/=
fitimage
>
> Easwar Hariharan (1):
>    classes/kernel-fitimage: make fitimage_emit_section_config more
>      readable
>
> Luca Boccassi (1):
>    classes/kernel-fitimage: add ability to sign individual images
>
> Paul Eggleton (6):
>    classes/kernel-fitimage: add variable for description
>    classes/kernel-fitimage: allow substituting mkimage command
>    classes/kernel-fitimage: add ability to add additional signing options
>    oe-selftest: move FIT image tests to their own module
>    oe-selftest: fitimage: Test for FIT_DESC
>    oe-selftest: fitimage: add test for signing FIT images
>
>   meta-selftest/classes/test-mkimage-wrapper.bbclass |  19 ++
>   meta/classes/kernel-fitimage.bbclass               | 114 +++++++---
>   meta/lib/oeqa/selftest/cases/fitimage.py           | 233 ++++++++++++++=
+++++++
>   meta/lib/oeqa/selftest/cases/imagefeatures.py      |  74 -------
>   4 files changed, 339 insertions(+), 101 deletions(-)
>   create mode 100644 meta-selftest/classes/test-mkimage-wrapper.bbclass
>   create mode 100644 meta/lib/oeqa/selftest/cases/fitimage.py
>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
