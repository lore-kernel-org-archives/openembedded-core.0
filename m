Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.70])
 by mx.groups.io with SMTP id smtpd.web11.7739.1596034639873245063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 07:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tzfHDko6;
 spf=pass (domain: arm.com, ip: 40.107.20.70, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUuBXMUaARM0JnsnE6MogGKVw/FYKbAfGjYX0Vgkoqg=;
 b=tzfHDko6Qz7qV9aHxY56jDoAF45TM4T9Gefmt9tqlXABv7MtgFvso1Ex10GsTvRsXJKlBQcN2nz6OpLbidJYy0l7njAZOOr6BSmssw0A7iVXOjvVErVHlhxCSWMTNRUxj0NsLzrbi3CnUzHK8kCSXpTWfKy6Cj6pvkV+fP+723c=
Received: from DB6P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::16) by
 AM6PR08MB5286.eurprd08.prod.outlook.com (2603:10a6:20b:aa::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23; Wed, 29 Jul 2020 14:57:17 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::25) by DB6P195CA0006.outlook.office365.com
 (2603:10a6:4:cb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Wed, 29 Jul 2020 14:57:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 14:57:17 +0000
Received: ("Tessian outbound c83312565ef4:v62"); Wed, 29 Jul 2020 14:57:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5dcb25dfca9277db
X-CR-MTA-TID: 64aa7808
Received: from a7d3359e9a10.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5528D3B3-D57B-48A1-85C7-281CE62352AB.1;
	Wed, 29 Jul 2020 14:57:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7d3359e9a10.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Jul 2020 14:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYl1WGMlKBmG4tyPLFmofzeb2sfJcMHWRLb2Q+3NgeynKTWIug1/ntqOH0EkQH951+xMW5z6JNctBIsfJxzYer0uoxx5sbHSZhfHjW0mjy9StfwbXAdVeZwSEayezfdKcPeZu1a7bipcJ+XKP/bwDgB7syD8Y9emwXabMWGoZbV1bKVLZnxH8EGMc6r0nBb0TG2SiAjF8IiRFWLVeHgTpYlpOWMtjRDs9QM9YZeTEgr+eaS+sfvqwfY3+joFEVzWURkE+LT/gCvVLh8VnwT6FI9ZyGC+eixv4Q0dCp6f5NiMOC8WggdJpN9Zb5B5wN5MgDP305Cbxx14EiZoEW8x6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUuBXMUaARM0JnsnE6MogGKVw/FYKbAfGjYX0Vgkoqg=;
 b=X0HiCp+efxIv4gu+O59PL8F2aeE/vWbL07q1IwL+uQ78yrEIK2+J5mFoI9pqkL03RXms5M9IGyjfdxQ63Pu9Hoj4IKm3qnUSHv3BRQaglVw4fVjSHsp3katUIlh9rTldXT58UnTgW1BrePDT0UCy12yBPzOPiBftkUuo7T05HFU20PbReDOTbuvx9tM7svA6RBLdoEK0ZlxWyQiu4QMDmHuImUQqkTOvELvI4MKYtXUPRjp/Z6o8AtSQA3d01mwt1oJPlrw0kgGz2eTTyux5WYMEuIf5DvpKGBfQWaixaxADNv2XypNhDRWry+zu5jCHO2k7VG4V4Fi4z9ibYTy0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUuBXMUaARM0JnsnE6MogGKVw/FYKbAfGjYX0Vgkoqg=;
 b=tzfHDko6Qz7qV9aHxY56jDoAF45TM4T9Gefmt9tqlXABv7MtgFvso1Ex10GsTvRsXJKlBQcN2nz6OpLbidJYy0l7njAZOOr6BSmssw0A7iVXOjvVErVHlhxCSWMTNRUxj0NsLzrbi3CnUzHK8kCSXpTWfKy6Cj6pvkV+fP+723c=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB3753.eurprd08.prod.outlook.com (2603:10a6:10:7e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 29 Jul
 2020 14:57:09 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.017; Wed, 29 Jul 2020
 14:57:09 +0000
Subject: Re: [OE-core] [PATCH] kernel-fitimage: build configuration for image tree when dtb is not present
From: "Usama Arif" <usama.arif@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
CC: nd@arm.com
References: <20200717141936.9689-1-usama.arif@arm.com>
 <540353726b3e013ad76aa299bbf836f30d618f14.camel@linuxfoundation.org>
 <28f469d4-6333-d1e7-0224-25d4c20eefcd@arm.com>
 <bdd76203978c7ff7bed205268a52a043b05447b4.camel@linuxfoundation.org>
 <8e65b1de-b94e-e964-f16a-738680d34e88@arm.com>
Message-ID: <0c418aa8-8260-4aff-5ee0-494d00a3d328@arm.com>
Date: Wed, 29 Jul 2020 15:57:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <8e65b1de-b94e-e964-f16a-738680d34e88@arm.com>
X-ClientProxiedBy: LO2P265CA0442.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::22) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.52) by LO2P265CA0442.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Wed, 29 Jul 2020 14:57:08 +0000
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b1560251-9da4-4b49-2257-08d833cfafb2
X-MS-TrafficTypeDiagnostic: DB7PR08MB3753:|AM6PR08MB5286:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB52867016A2BA39BDBAF28F3E92700@AM6PR08MB5286.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +eQGwBkRKW49rsfXkizIyJS23ItGaIUfjYLLNahAQ+GNOM8OVMelyLZCOJNCL9t0RWk4Fz9+S/uLSR1IT6RUNADDT3nQ288Lq8JQg/pM806r/o8bFU3rUH6nE1A9V7gKxjvr9RlSJOk4SlMM457GbEZmwvkC7PxpzdP79E2wewl0aSPjtxTIgVEo7j6G9xrQGzC6XV2ZnvhWek8d88KP+TxOyvJxZi2yagIxm55WE2NSlGFBCKSVNH9G3d+Jpts7WG26U5LEqzWoZclXqgRj+UcSJ8/0GTmLjBHteKYxyUkyeoQO0sxXJVSFQ1LxJvPWdlSbXeQG1IKew4UxT14eikYpYclF79yohGtfRP02wgxPcFkdatUgn32pp41p25FcA2BdolLQO0sTjp9Z6bd6F5L+xhHKFLBllfrAzCzN5bXKwWqDPcn3dE8PPghvDb49EJazmDvQeXg89kKn/SpHTw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39850400004)(31696002)(6486002)(53546011)(5660300002)(2906002)(31686004)(4326008)(16526019)(26005)(83380400001)(86362001)(66946007)(36756003)(66476007)(66556008)(16576012)(52116002)(8936002)(956004)(2616005)(186003)(8676002)(44832011)(478600001)(316002)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: sTvq8A+a/G1R30KzEOjzxIhdORGINQqs1s7NCzV6WzfdOfDWTf9Qcq5fQ5tevUiL6ulhCH2NDVr9B5JZVTziQ4rtetYexreOoRDyxy4gMXTlW9+v81v5NLtOPCehnY29Kl8qPMEPTgr/EPpdGEaXxKMLas7vsTXgi5erh6lgEq3rHEVoqiN0TdUFUj30coWNUTFTFDvTntjHOGmyqduoYI60ibouWUhkJ7BKGmdoQBJr85ln+0f6q7ttafbp9r4Np7dwBTekV4iHCDxX8W5uVBdXSiPR1eWqws3UjBpM6aeWws9+i6g/9lOySlyz17hxhbFhuwl/+FGzmTpoIpx6sU9xhj9PNQ1wagSGBHLlahZT2ZVivq46F52oZHBhG6+eOJCqwXkvrXhnwspwxDkKbT+7imoA/bUjT+G2bI7sitLDYz3MRER/UFStaEDTW5Lvxhg/d1XG2ZYNayLagt6iW/Qs5lK46SslfIqnFrJfpu7bjsAhpPdBZKmN/68EEnjQ
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3753
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	77c3c3a6-7403-44d6-ff0f-08d833cfaace
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	milBHVQI+m1OmwbZ/f6Ctuy+RQAf+Yw+JgQ5H4PLE7UPkWn5Z5X+rzRDJGgzM3XA4L0HsEjx6yrMXAY9+1G/0ZFMqaC+ybccDnUHt/SHYXmB2UEqm5AaxI9WSBBi4ZxGDtuJx5SBqMlqgD6ATy/AhXpp5bCXjumgeG0H5ozj5a3sgq5kxT8kbIM8/OMrztcrOgHxd9vFOv8qiiEDimpj0TWMteeVdpVA6Od6HMVyQ4zElIKAkhtAxZIOnjkeR3GjySY7+N5yRKUfyhF9LwtWyl4C4/n8k1HPy/AWSvAbr/g9tQ4SEtWeO8WmPGF0xQg1Uf/SlOFWtGUaGNnCO2lFXlq8gLU6gGl5GOeIkENMmWEZmQR9qkBGXcb+hpSGTOYMgUEA2JLKZe53TeUIPpIX+l6zRWabVTImf6F8vyu0nu5g248iKKXlxlM1GEvmi3u10o+qSV4EaJaMSn2A2A+eC3Q47sFz6e9Tpa5oXq7HFX4rpluz8phX4YOQI8fmWhnS
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(5660300002)(83380400001)(16576012)(316002)(186003)(4326008)(86362001)(16526019)(336012)(44832011)(31696002)(356005)(26005)(81166007)(70206006)(36756003)(8936002)(6486002)(53546011)(2906002)(2616005)(956004)(70586007)(82310400002)(966005)(82740400003)(8676002)(31686004)(47076004)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 14:57:17.1789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1560251-9da4-4b49-2257-08d833cfafb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5286
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 28/07/2020 11:19, Usama Arif wrote:
>=20
>=20
> On 27/07/2020 11:56, Richard Purdie wrote:
>> On Mon, 2020-07-20 at 18:21 +0100, Usama Arif wrote:
>>> On 20/07/2020 08:41, Richard Purdie via lists.openembedded.org wrote:
>>>> On Fri, 2020-07-17 at 15:19 +0100, Usama Arif wrote:
>>>>> This patch adds support for adding default config node even
>>>>> when dtb is not part of the FIT image. The conf options are
>>>>> therefore changed to point to kernel ID rather than dtb
>>>>> ID when dtb does not exist.
>>>>>
>>>>> Signed-off-by: Usama Arif <usama.arif@arm.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 meta/classes/kernel-fitimage.bbclass | 14 ++++++++++++--
>>>>> =C2=A0=C2=A0 1 file changed, 12 insertions(+), 2 deletions(-)
>>>>
>>>> I keep asking someone to start providing tests for kernel-fitimage
>>>> but nobody does. Its near impossible to tell whether this is a good
>>>> change or one that could cause someone else problems as we have
>>>> little documented behaviour and no tests.
>>>>
>>>> Could someone please start looking at adding some (and
>>>> documentation)?
>>>
>>> There are different components that can be added to a FIT image.
>>> This include kernel, ramdisk, dtb, etc. However, it is not necessary
>>> for any individual component to be part of the FIT image. In reality,
>>> you can have 0-N (0 to N) kernels and/or 0-N ramdisks and/or 0-N
>>> dtbs.
>>>
>>> However, kernel-fitimage.bbclass currently only supports limited
>>> usescases: adding 1 (no more or less) kernel with 1-N dtbs and 0-1
>>> ramdisks.
>>>
>>> Before support was added for multiple dtbs, the configuration of FIT
>>> image without any dtbs was supported.
>>>
>>> This patchset adds back the original support to kernel-
>>> fitimage.bbclass
>>> for building a FIT image when no dtbs are present. i.e. adds support
>>> for
>>> 1 kernel with 0-N dtbs. It doesnot affect the existing usecases, but
>>> adds back support for a usecase (0 dtb) that originally existed and
>>> was
>>> removed as a mistake.
>>>
>>> I have submitted a v2 of this patch which better documents the code I
>>> have submitted so that hopefully its not blocked on the testing and
>>> documentation of the entire kernel-fitimage. It also always creates a
>>> configuration for FIT image.
>>>
>>> I guess i have spent some time debugging kernel-fitimage so am happy
>>> to help with the documentation. I guess you would like a high level
>>> description of kernel-fitimage at the top of this file as a seperate
>>> patch?
>>>
>>> I havent worked with the test framework for oe-core so not sure how
>>> helpful i could be on that. I tried to look for example test cases
>>> that
>>> would test any of the existing meta/classes/kernel*.bbclass but
>>> couldnt
>>> find any.
>>>
>>> Hopefully the extra documentation in v2 and the explanation would be
>>> useful in understanding and progressing this patch.
>>
>> Sorry for the delayed reply. Thanks for adding the extra info, it does
>> help.
>>
>> By documentation, I mean that kernel-fitimage.bbclass has no
>> information in the reference manual:
>>
>> https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-=
classes-kernel-fitimage=20
>>
>>
>> generated from:
>> http://git.yoctoproject.org/cgit.cgi/yocto-docs/tree/documentation/ref-m=
anual/ref-classes.xml=20
>>
>>
>> and also there is also no header at the start of the class saying what
>> it does or how to use it.
>>
>> Could we add something to these locations to give more information
>> about the class?
>>
>> For testing, have a look at
>> meta/lib/oeqa/selftest/cases/imagefeatures.py. Its testing target image
>> rootfs settings but I believe the concept is similar to how you'd test
>> something like the kernel-fitimage class.
>>
>> You can run these tests individually with "oe-selftest -r
>> imagefeatures" to run that file or "oe-selftest -r
>> imagefeatures.ImageFeatures.test_bmap" as an example of a specific
>> test.
>>
>> Cheers,
>>
>> Richard
>>
>=20
> Hi,
>=20
> Thanks for the reply. I will submit the documentation and the tests in=20
> the next couple of days.
>=20
> Regards,
> Usama

Hi,

Thanks for the pointers on the documentation and testcase. I have=20
submitted patches for documentation=20
(https://lists.yoctoproject.org/g/docs/message/319) and testcase=20
(https://lists.openembedded.org/g/openembedded-core/message/141097).=20
These assume that the 1 kernel, 1 RAM disk and no dtb case that the v2=20
version of this patch solves will be supported and the testcase will=20
only pass when the usecase is supported. I hope that the v2 of this=20
patch can now progress.

Thanks,
Usama
