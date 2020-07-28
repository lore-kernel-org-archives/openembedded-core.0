Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web12.9314.1595931583361508573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 03:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TX3cnih7;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr49WBLcyMhjLWTyWflcuZQBwDcIcb3XJFJpNWyF578=;
 b=TX3cnih7k06zpT06qWa159wUoTmuAMiVOWkH7Jf374UW4LtnaVJGEYA/3/n3AGQduHyAJxdNSH1gXlihLG5pGbQ5NQ+5gBab+KL5yvgypaQ4hkq11eivYVQoyQ7nOeho1tbnoPuZ5YVOZ6xxxp6bFNIny3Sl0ZyA7MIgAABTvbU=
Received: from AM6PR0202CA0044.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::21) by DB6PR0801MB2119.eurprd08.prod.outlook.com
 (2603:10a6:4:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.27; Tue, 28 Jul
 2020 10:19:40 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::7b) by AM6PR0202CA0044.outlook.office365.com
 (2603:10a6:20b:3a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Tue, 28 Jul 2020 10:19:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Tue, 28 Jul 2020 10:19:40 +0000
Received: ("Tessian outbound 1c27ecaec3d6:v62"); Tue, 28 Jul 2020 10:19:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cabb69bbf76cad27
X-CR-MTA-TID: 64aa7808
Received: from cf29b8fb98c0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 43D474E2-1730-4CDF-93A9-AA737BB59B4A.1;
	Tue, 28 Jul 2020 10:19:33 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf29b8fb98c0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 28 Jul 2020 10:19:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Guxu5VAxPcDLXDSulc7uMEu/pMUtpdIZebPrqVBphQyB22PRDmp41z8GdAZiySAwfcNiA9XtcmGJ3dHMetw3Mg+sZJaPz+QvYPXkYoqOU3ZZRtYS0Dfr8ens0ok5Qsw7fJERy4EVtGRmJQPaH5djuBRfQlD5IY4qpsR1y34UsxvQynLrAb5+YdyLm8al5dHo+2RmPL8k7HFsDCiuS0C1CmThERA+sfd0Uwn/x7V5Qq0iWg4qtufDPeBod4yGB+F5fdLXEtsukLfuqghCcSskFEaCKzaypgMaMLQhTE402PrxdE2lxfzeOY9CBCZ4XwApPAmF0ghDiEqV7AGok+bsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr49WBLcyMhjLWTyWflcuZQBwDcIcb3XJFJpNWyF578=;
 b=AD+W4T/i0ffnECdA9gLAPTmp2XVwloZmqcFSYyIQx3O7De0mkbkf3X5+UHetDDJB5QI3EvV8rr9nyOY4cCb/VAGZ1K+fWNhNrsQ4XNALUNSwBkr5X8+fkPol3KaSWjo7YUz+bSoXZoywxzV+vglD838vVThKbyyG4Uhn7ZoPvwOHwUQVqS3UQiQeX/6PO268r9trY8ItjMY2ws2Oaif9fhrRgyz5TFiua7cCI67cgwHeLcdj2ZFrC7vkmwx9eAirYf4jyUYAqgaytnzeMX5RxjYAq7qT6gWDKHGPL4pqME5/OR4imBuj0KmQ1ovKkoBc7cBwfj7TyDOpZdHEwZcgyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr49WBLcyMhjLWTyWflcuZQBwDcIcb3XJFJpNWyF578=;
 b=TX3cnih7k06zpT06qWa159wUoTmuAMiVOWkH7Jf374UW4LtnaVJGEYA/3/n3AGQduHyAJxdNSH1gXlihLG5pGbQ5NQ+5gBab+KL5yvgypaQ4hkq11eivYVQoyQ7nOeho1tbnoPuZ5YVOZ6xxxp6bFNIny3Sl0ZyA7MIgAABTvbU=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB4586.eurprd08.prod.outlook.com (2603:10a6:10:34::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Tue, 28 Jul
 2020 10:19:32 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%6]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 10:19:32 +0000
Subject: Re: [OE-core] [PATCH] kernel-fitimage: build configuration for image tree when dtb is not present
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20200717141936.9689-1-usama.arif@arm.com>
 <540353726b3e013ad76aa299bbf836f30d618f14.camel@linuxfoundation.org>
 <28f469d4-6333-d1e7-0224-25d4c20eefcd@arm.com>
 <bdd76203978c7ff7bed205268a52a043b05447b4.camel@linuxfoundation.org>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <8e65b1de-b94e-e964-f16a-738680d34e88@arm.com>
Date: Tue, 28 Jul 2020 11:19:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <bdd76203978c7ff7bed205268a52a043b05447b4.camel@linuxfoundation.org>
X-ClientProxiedBy: CWLP265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:57::22) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.52) by CWLP265CA0322.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:57::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Tue, 28 Jul 2020 10:19:31 +0000
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0e07320-e8ba-4e18-63d2-08d832dfbcf7
X-MS-TrafficTypeDiagnostic: DB7PR08MB4586:|DB6PR0801MB2119:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB21199D7A0D8F9B912FDE85B992730@DB6PR0801MB2119.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RsZ8/onBn/9IGwh9Jt2xqC01MphewL9MNZ64Y7lO5JRh63RZTAu0FwnWprA+xy6bOCCDWU9ayC/CYoNUU7Di3gGkADVgiWLKTwZ7P46iVE/tpfofp5b548B7xuIUNeUjWMpITmIQiWWDDDK76pgv+o7ga43jyrLId35zrZ96FKLySX7v6Gt97TRD+t789NhcKgvIoPd1/wsD9FnsttmRdYnesDzd114qqRmYJnN/yfpZrtgCbG1fkiWrEiyzey5s1LJx7ieil7SB18Wt/RzCVnW2F3tWwFDv0B36Hghq+FnS2+Pb0IBupdlBJp/2edNwyfD2Z+qjd+SECCnFaMAJly2c7fdQvzuLpyIC3/j/HOl5ZZpp44ta1sMaEK6LVnV0I7zLCSQmnhZdFXHOVBpcsGmB41Lflaqdj+Dj42tvvm7arFqaASTKBzOHsfBexRMDHVKJRmbl+5tmtmMQap1wOA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(66946007)(66476007)(966005)(478600001)(8936002)(4326008)(66556008)(83380400001)(2616005)(44832011)(6486002)(31696002)(36756003)(86362001)(52116002)(16576012)(5660300002)(31686004)(316002)(2906002)(8676002)(956004)(186003)(53546011)(16526019)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 rukc9LoYkTuIq/XpiUGjTUQu3V7t7LRBjsuDVQMyw8tCaoQAxu1LeKUtOdD+8UZQgZii7g4pyrdZmINK2Op0v2nDjRUD/mO/6AXHRzzb6XopcyUm4K71ZNAHEQaBcr4SUFdRnRrvGZ2m/xMAT+De+NRWL8y7YwdsSEl9UVR0BhNplt8eQpvSaWj7Iu3Z3SuT2xyYQXYXahQ49FN2MtpbhP4TzMdPxYRT31bjy1dxWOVgtsx1e6xjm3EWMhtNVxM7THWYFuG6xT9s3GQIYNX8ULFs87zK+z3LijON/RJqq/1G/+gCNiX+YGbXdx8QvmgAoJRi1Y3ZoumHujiH/rQpupN/syrQHoHc6KTeqy+ioyezsTUKIjJvlYQlnk+mcSG85xz58Q1QVGO7Sv5gS37G9lI3ki3D2/C2w5AW0SB1BSFAMpiSgsjEVqTt8gsq7WThnlAvwmf83Nbth9aZ+FjZ3fOxdWsGy8A/8d5KScqajDo=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4586
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	da50d2fc-2264-4cc6-93de-08d832dfb806
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mAUFEYIrg5sFLUDY2WKBB3PBLL+9vp4lpa2VyrH2VMQqBW70vPYo3r4sqJ/T2hUFtT8tCXUiiaFn5Thdj0pIqoZ2RSxGg1DV7V9nSM+6+tIELXwC76oyRsQud0tyv+fdWAGHO/Yv3mAlgHWIHuN8LPRB/s2JF3O8CMADBZ2NIV9IaCH20mgr54cyaffApMMKOZxWLRmHhzeP/WFwedjmzsjNDL8j0NFrOSKtrgWIqNm+lVsSWdTzTyR2jWrxnpvlvLkfe+kQPeE+NMLArjthEoBxT5sBiGoo8zZaXpHucWe9OCQDqtsXmavY+KoT1nwlCT0QZK0bA8vqy9YP/CQ14s11mgneXwLAS0Zia9LUi/NDusvsr0fC3tDz0ZTJELAbzjpT6hVxN0sw/I3E8yI5HuITjcw0oCZxo6yb83GbnG1T+2Jzc8/cVz6cqrURXuNdJTcovzU93nSlIwOFq6+W8YiZXH1pD7zHBZDEHFi6zT+6QX3VqzL+5IBvC+sI93CY
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(4326008)(36756003)(36906005)(6486002)(2906002)(8936002)(26005)(8676002)(70206006)(70586007)(186003)(16526019)(316002)(53546011)(31696002)(86362001)(16576012)(478600001)(966005)(83380400001)(5660300002)(2616005)(956004)(82740400003)(47076004)(336012)(82310400002)(356005)(81166007)(44832011)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 10:19:40.1227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e07320-e8ba-4e18-63d2-08d832dfbcf7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2119
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 27/07/2020 11:56, Richard Purdie wrote:
> On Mon, 2020-07-20 at 18:21 +0100, Usama Arif wrote:
>> On 20/07/2020 08:41, Richard Purdie via lists.openembedded.org wrote:
>>> On Fri, 2020-07-17 at 15:19 +0100, Usama Arif wrote:
>>>> This patch adds support for adding default config node even
>>>> when dtb is not part of the FIT image. The conf options are
>>>> therefore changed to point to kernel ID rather than dtb
>>>> ID when dtb does not exist.
>>>>
>>>> Signed-off-by: Usama Arif <usama.arif@arm.com>
>>>> ---
>>>>    meta/classes/kernel-fitimage.bbclass | 14 ++++++++++++--
>>>>    1 file changed, 12 insertions(+), 2 deletions(-)
>>>
>>> I keep asking someone to start providing tests for kernel-fitimage
>>> but nobody does. Its near impossible to tell whether this is a good
>>> change or one that could cause someone else problems as we have
>>> little documented behaviour and no tests.
>>>
>>> Could someone please start looking at adding some (and
>>> documentation)?
>>
>> There are different components that can be added to a FIT image.
>> This include kernel, ramdisk, dtb, etc. However, it is not necessary
>> for any individual component to be part of the FIT image. In reality,
>> you can have 0-N (0 to N) kernels and/or 0-N ramdisks and/or 0-N
>> dtbs.
>>
>> However, kernel-fitimage.bbclass currently only supports limited
>> usescases: adding 1 (no more or less) kernel with 1-N dtbs and 0-1
>> ramdisks.
>>
>> Before support was added for multiple dtbs, the configuration of FIT
>> image without any dtbs was supported.
>>
>> This patchset adds back the original support to kernel-
>> fitimage.bbclass
>> for building a FIT image when no dtbs are present. i.e. adds support
>> for
>> 1 kernel with 0-N dtbs. It doesnot affect the existing usecases, but
>> adds back support for a usecase (0 dtb) that originally existed and
>> was
>> removed as a mistake.
>>
>> I have submitted a v2 of this patch which better documents the code I
>> have submitted so that hopefully its not blocked on the testing and
>> documentation of the entire kernel-fitimage. It also always creates a
>> configuration for FIT image.
>>
>> I guess i have spent some time debugging kernel-fitimage so am happy
>> to help with the documentation. I guess you would like a high level
>> description of kernel-fitimage at the top of this file as a seperate
>> patch?
>>
>> I havent worked with the test framework for oe-core so not sure how
>> helpful i could be on that. I tried to look for example test cases
>> that
>> would test any of the existing meta/classes/kernel*.bbclass but
>> couldnt
>> find any.
>>
>> Hopefully the extra documentation in v2 and the explanation would be
>> useful in understanding and progressing this patch.
> 
> Sorry for the delayed reply. Thanks for adding the extra info, it does
> help.
> 
> By documentation, I mean that kernel-fitimage.bbclass has no
> information in the reference manual:
> 
> https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-classes-kernel-fitimage
> 
> generated from:
> http://git.yoctoproject.org/cgit.cgi/yocto-docs/tree/documentation/ref-manual/ref-classes.xml
> 
> and also there is also no header at the start of the class saying what
> it does or how to use it.
> 
> Could we add something to these locations to give more information
> about the class?
> 
> For testing, have a look at
> meta/lib/oeqa/selftest/cases/imagefeatures.py. Its testing target image
> rootfs settings but I believe the concept is similar to how you'd test
> something like the kernel-fitimage class.
> 
> You can run these tests individually with "oe-selftest -r
> imagefeatures" to run that file or "oe-selftest -r
> imagefeatures.ImageFeatures.test_bmap" as an example of a specific
> test.
> 
> Cheers,
> 
> Richard
> 

Hi,

Thanks for the reply. I will submit the documentation and the tests in 
the next couple of days.

Regards,
Usama
