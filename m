Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.83])
 by mx.groups.io with SMTP id smtpd.web11.1998.1592553563353563268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 00:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dMYY2TuG;
 spf=pass (domain: windriver.com, ip: 40.107.243.83, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTMhHjB0SJYo9vW6UKaOVQQR2NxtaUPGL/Ef/2uuV6tsob+aAsl8FMZu6ntBYoe48zf92c4Uuh+jZXmZEI+wE0p35MUlwq/oupr2b3EEHQ1A3TTh1hZfbx3AHIDBg+HJ1VYMJhmq134Ppyowq2ifA9+3VGRUJ51WgVbscmQjnOZM8htYKnIn+fRDUVYmaFdP9DSe93FUUUPWw03Gap978hAUuliP4pmW9PhXG6r9KnIOHusn5J72O85NMNvKytk9pICI+psPDgL+juQRkByrWugMGjXo4dXyKVIMZduFoiUE5NaDzHO5y95BjW0H0ijL3zWLzSVExah1O3WQ6bpfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OpIp1wz/ku55t8wAOifyGogXqSWGY4ZtLT6UBrH8b4=;
 b=XOS/URdTDsaHa/lmnkZCIHt3yVPU1h7DEWfZnp0I3FnfXtsTk+B8VkPDG6UV/t4pvnLg03uc1pgTbQT3f5PE1mYoniN2eEzGO7juQ/NYabdwb0zGfb5JnUslrvVfasuwU8WAZqDuOyDRoBIGnso5mcca83JlWdEyFN1MFW8u0khCIWBg09akpx2AwKkRu7hCW+7yDCtrbs9nQZ0mGkmkhpBZB0PulctLw/b554Lum0RMV/7loSucg77JrSM8CTI3oK5+3PMzMrWIywJQ/YasmwE9AkCwywsmIDZbbFqMEtgIgFl8jvTQG/KUvs7vZRDWf4Om/sYDzMzoEweSXPNyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OpIp1wz/ku55t8wAOifyGogXqSWGY4ZtLT6UBrH8b4=;
 b=dMYY2TuGyR460T/MamYv/l9qUSXDA93pnSfTRgF65g9SRt28NHXgZNGPZGzkIhQjcUpECiPDIq1CkK7ftmJ4rMlukIX6K+dEAD74X+gs2livkcFxi2AWgR2SRwvXX+TjohuzsH4CZFQSB35rOmqdiq5E4ozUBXRWhhE0IjQyEFY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB4387.namprd11.prod.outlook.com (2603:10b6:a03:1cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 07:59:20 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 07:59:20 +0000
Subject: Re: [OE-core] [PATCH] netbase: use git fetcher
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1584350653-141457-1-git-send-email-mingli.yu@windriver.com>
 <796ecb1469a1944bb7386c5c6ba9bfe580795057.camel@linuxfoundation.org>
 <16189495E5DBCB85.29686@lists.openembedded.org>
Message-ID: <3089b5fa-4998-7a83-52c8-d6a535c60c14@windriver.com>
Date: Fri, 19 Jun 2020 15:57:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <16189495E5DBCB85.29686@lists.openembedded.org>
X-ClientProxiedBy: SG2PR0401CA0016.apcprd04.prod.outlook.com
 (2603:1096:3:1::26) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by SG2PR0401CA0016.apcprd04.prod.outlook.com (2603:1096:3:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Fri, 19 Jun 2020 07:59:18 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f992b4f-577a-4f6b-1651-08d81426abe7
X-MS-TrafficTypeDiagnostic: BY5PR11MB4387:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4387C4DCCC6D08F394E03565F1980@BY5PR11MB4387.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9FGzEDGWNUz6K7Q2AppZ+Xu0V0KirEZ/Ys81G668T4eOTZRmjePImmmw8hVF4MT8mcy1c7MPEpTHFSOgQ8K6+upvrwxQjgyWkQQydiFNYFZotamojfZbUGy4KG4gOucpdbqh9OcEDnCA6nuZ26yBUjgH1gA4GA12wgxhqx/fGoFAwhKyGsSlqNLF+7jQtuZ5nH8MX6VLiO2f7s4O9gUK9VtTFqOr4r8ZRyGEn52JV8237G1Tf0JCgoNPQzvaMJoq8DdjWn52G0eMj3gyDrd5XlLZn36QvFc5W13ehjpMA46NrOzaw4k4bTp1rh4YqM0t0xkSrwmzlEe4T3qnqSaG4iu2lUzF9CzpmwQe6BGJFSJe44M83lI/IcixgomZLKc0xSUbpkRiKEbBl7khiUiH+vPYDpS4vJRR71YQ1vSNDmnLV4gJTCt+TaIHWxssgjLWStQ9ueHefCG4ZZjZmeLSf2AfybNms7rvZwl1uDNB57cLBk44XxhNgsQupuGRyY7CgU8dGezgju5s/HEB/OMgfQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(396003)(366004)(346002)(39850400004)(8936002)(5660300002)(186003)(86362001)(2906002)(966005)(31696002)(53546011)(16526019)(26005)(8676002)(52116002)(31686004)(83380400001)(956004)(478600001)(2616005)(6706004)(316002)(16576012)(66476007)(66556008)(66946007)(36756003)(6666004)(6486002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0WW6m1n0jgqEaE6021SkfWCTiR+Mh5FCM2A5Jq1TSieohBva0LiyjveMKBb4TMnwb8pbhh3eu70DWDienNrxZ8RV60WIpSE9Jjh6lRlGI+OFfaVbI3G27yFLJg1e5/ClAjZW4gidj0pNUgYx6YPUeQvl66p5/hhQU7g/Vkk6/K07Ucqeai3BVoAiyu6qMgNDTj6q7eGcAc2E+0VGzxmP804YJ884hLRmj1C6XIh18Cdc3bgwXGYvfHY/ewajnexH8SN0Al16U40mYTHLnfbenA0H5kghrst2ra6ufRNxIAab5TvDfPE6YQjuhxv2aOpKwqjaxRbNaip2H5dIIbW/5SG7KsZyLY2wZ7dRhLdB6rfmtBdqvHxFy98mNnCu7RGuFdlN1yEWdzVps4PxglbCb+4z+mhEdjTPoq8oQFpIsbDzw0fIOqKyjWxoFut4Mp7irSefvkbvC9dZPhwybiaHEDNoQsZkYHHT4hxnXWqASAo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f992b4f-577a-4f6b-1651-08d81426abe7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 07:59:20.2424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEGiaIrK4E+MF5VYHF4NfTScJD5Kdwzk9YiGjwsNfsNO1muH5+iUkC9x1oKr0CAijrpgLvGmbxnkCAq3b462GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4387
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Ping.

Thanks,

On 6/15/20 9:49 AM, Yu, Mingli wrote:
> Hi RP,
>=20
> On 4/1/20 5:20 PM, Richard Purdie wrote:
>> On Mon, 2020-03-16 at 17:24 +0800, mingli.yu@windriver.com wrote:
>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>
>>> Use git repo as the the previous URL only stores
>>> the latest source file and fails to locate the
>>> source tar file if we don't upgrade timely.
>>>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>> =C2=A0 meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
>>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> Breaks reproducible builds:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/825
>=20
> I run reproducible build locally with "oe-selftest -r=20
> reproducible.ReproducibleTests.test_reproducible_builds" and It succeeds=
=
=20
> with this commit.
>=20
> BTW, the netbase only introduces 3 files as below:
> # rpm -ql netbase
>=20
> /etc
>=20
> /etc/protocols
>=20
> /etc/rpc
>=20
> /etc/services
>=20
> And I did the three files' checksum and the checksum turns out to be the=
=
=20
> same when with the commit and without the commit.
>=20
> Thanks,
> Grace
>=20
>>
>> Cheers,
>>
>> Richard
>>
>>
>=20
>=20
>=20
