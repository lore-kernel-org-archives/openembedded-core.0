Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.61])
 by mx.groups.io with SMTP id smtpd.web12.4730.1588910572261402530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 21:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mRbQ2DV0;
 spf=pass (domain: windriver.com, ip: 40.107.223.61, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVm0XrWgP9UDOjPezvF8qRp3o1+NUYe164yg+T9Bbrvnh9J9gIqm9Hf/9B1h5ZpCDevgPCH+tGVBv/Wfsl8bddO91vq7HWVLHf0AODXIbVhD4BKiuHNDvjToU56ZzD5amHSFGqT4VKhKI3Ftkl4NC62q9oFwSmfJNuBhiVN8TBSuTCP8eWwA6imcExFQJj3FAprCC3AYzA6U20s8nq6Wo987FdOai+Nbh1Wkp/6xpWlKQUswaqCxOjbqTT7QuHxFDSndOGrX+TPJQ3JxwEQuJBc+q3C0lwXkxZD+NxyQeo3GZ3JEYEYeR+BQwXXxwYU00iC04djfKP6gyHZxlNll0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puryvXtUPRHOorinpzOgFyz1rFEnyG7FrfCR3ffXoT4=;
 b=hdB8oDCg+gUHP2oRZnhF/NPUZNZ7GHiOitS9F+SweOEEqJrP3MtYBpDbPm5s4m4zJG43xxWjnsvRYBCOzMDfptO8qBvPMJF21x4eMhET2WvX/PwIZhtHB0xGMSWesTVkfqPXXC93TGcsCIL9Ke0ulCwrDHGd8x9OcZ9ryFT7d1RhXXPobeJE3Sq4nIubc+2znB8/02nYADWzHl2YEUkqvjBKBx7pu2CrbgGWnNKoTaolyuqv3s4Yt641PFl0qkT4x29i8n2cDJc3Gjfh2MOrdKTBYuDghjfxwECnC3c5T6EhceSCqGWj2qwxVzgZZdGqthIc9erQ5iXytdFIzGAxTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puryvXtUPRHOorinpzOgFyz1rFEnyG7FrfCR3ffXoT4=;
 b=mRbQ2DV07tQlUTCtr4qK/obk4sBEw4nqcZBPuFFN11orn1Ffm+PIG9fxziYfjoCe+YicGKk8pRnqnQOW8/BUqBi5RIYqcNnZQhMyOQb+T6USY9cv+Tih3yN830CRkeFTJcBQVGAts+SamwzC0YDNYd6drNW8xDrO18LW9Gd4XRQ=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2861.namprd11.prod.outlook.com (2603:10b6:805:61::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Fri, 8 May
 2020 04:02:50 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d%6]) with mapi id 15.20.2979.028; Fri, 8 May 2020
 04:02:50 +0000
Subject: Re: [OE-core] [PATCH] iproute2.inc: clean .o before do_configure
To: Jacob Kroon <jacob.kroon@gmail.com>,
 openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1588817159-434433-1-git-send-email-changqing.li@windriver.com>
 <015c4b93-6ca1-0668-0c1d-2a3150c65a38@gmail.com>
 <f27cfb11-458a-510f-c696-eee661e4c109@windriver.com>
 <21a173ab-7496-d134-21a6-a49fe4fd46c5@gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <9f9edaaf-18fc-78e7-f7d2-7dc12c6356f7@windriver.com>
Date: Fri, 8 May 2020 12:02:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
In-Reply-To: <21a173ab-7496-d134-21a6-a49fe4fd46c5@gmail.com>
X-ClientProxiedBy: HK2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:202:2e::20) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR06CA0008.apcprd06.prod.outlook.com (2603:1096:202:2e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 04:02:48 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cbf9dbf-ca29-4bc7-acf0-08d7f304aca7
X-MS-TrafficTypeDiagnostic: SN6PR11MB2861:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2861293F3205AD4FE6ED685182A20@SN6PR11MB2861.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cl0svDWQP6qzPO2FA4YKZntm7u8y39FBmP5S68eub4kx1ekfxHgNWnqILe5iQVI/KhWKeJim4CVK5Tbah4Lz/y0PNf5doSCmhyYsEfppWsxMPXDv5vbZWel0l/mwjCsBFNZOEPuexNiV93cpmk6KbV+whXGrmkyAxFi2L9EhyoHWFMsDlIfjVHCvx2rydNVDWnKmmgocDkq8HJXqpUmgPeE23RuTLe8KLWkMjYH+JEbvcUkju80/EedRwWaaCAgFIV0KyBS4YP3xoTc/9ThBPHv9XoXByaP9nVyHgDI9JIEE4eq1sykaKuwwU7xFv2gW7PxBC1CMzh82yg7DHHGV5D4W0ZlXRnFmceoT1tglYnteWf7wWKPLtopCfLGx9RKF01J+FwVT7xvRvoAAobhglvJoUajehQLrUSzlX5EpkCExoabPL6dwYFcGfBjwX90MfCGuD9CdpA8Ltaug8YOTxgcugYLyug+ZhfJdCpD+fvwJf0h0qNSv8rS9OSrh8ZTq34LvPus28W7Bmxl7Zdn1aL5THmVHIv7kWWf+M8GkTCom9K68L91npj4QrS8LK4zzbDPd9ti9lioGhENXsMLTkoPnlXLmtU27dW2PbckkadvYZ4R3yb3GcTvgbR1QGFu4oO/Z3zU0HqWpFsdV+dLpUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(396003)(136003)(376002)(346002)(33430700001)(2906002)(8676002)(53546011)(86362001)(110136005)(186003)(956004)(33440700001)(16526019)(66946007)(66476007)(66556008)(2616005)(5660300002)(316002)(31696002)(26005)(16576012)(6706004)(36756003)(6666004)(478600001)(52116002)(83280400001)(83320400001)(83290400001)(83310400001)(83300400001)(44832011)(31686004)(6486002)(8936002)(78286006)(142923001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HkvVwa4xKidlyogWyqhVqdvM5twz7zHchUI6aLnvmAghUysQfK7lPYiZI0Q/GcNnhLfae8n18G8htBvFy74RoUl6bfhaxDBn9YzBh0pu9F6QOHjbPYWykHkXKJSezUhtO3f6Lkx92NjkdMfDQwUKPD2zCbkBonjwgQJMh74eohSJzQeYQM8fxHCSNcDZddQ0SbwEjcWa0VDwEgZDtSDEL0cbbjDjpRcioMW+gj61VtWqboxR5iCBk/5yc9/nY16sT+jugBjWZhcGjbiqEJotlyXTBA1cyO+k8dWs/QFq934zvvlho5xY1GKrAL7frnMKQzA8s3m9fRoPHv5HjojIaxMgKyw9ytxtNuNRfMEYVgvMJy0zCmrZSODOGgzgERcyBLv9AzhEPujaV3Z9Yi6a9YYi+h+bRvrs4O+BjqLHFqwWZRXBJaIi9WOukThS7XmQqMngMKyq9tfUyPY3ShlOvpy2dYyN1U/eKuTEFOOSNIM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbf9dbf-ca29-4bc7-acf0-08d7f304aca7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 04:02:50.1711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKqjwyAaZuHz1d26nm4zaHeLIrGkjlW9W2q1KtTttTjkTXMl9NjEl//h25E5aPVqhSSYZSJez8HZ1gbtpaE5ynQc5P6vl0bFeDkn5k/Tgcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2861
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 5/7/20 2:19 PM, Jacob Kroon wrote:
> On 5/7/20 8:10 AM, Changqing Li wrote:
>> On 5/7/20 1:56 PM, Jacob Kroon wrote:
>>> On 5/7/20 4:05 AM, Changqing Li wrote:
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> Reproduce steps:
>>>> 1. add 'DISTRO_FEATURES_append =3D ' usrmerge'' in local.conf
>>>> 2. bitbake iproute2
>>>> 3. remove 'DISTRO_FEATURES_append =3D ' usrmerge'' from local.conf
>>>> 4. bitbake iproute2
>>>>
>>>> In step4, since CLEANBROKEN is set, files generated in step2 is not
>>>> cleaned and rebuilded. Check after step4:
>>>>
>>>> file /sbin/ip.iproute2
>>>> /sbin/ip.iproute2: ELF 64-bit LSB pie executable, x86-64, version 1
>>>> (SYSV), dynamically linked, interpreter=20
>>>> /usr/lib64/ld-linux-x86-64.so.2,
>>>>
>>>> interpreter path is wrong, it should be /lib64/ld-linux-x86-64.so.2
>>>>
>>>> This will make run ip.iproute2 report error:
>>>> -sh: /sbin/ip.iproute2: No such file or directory
>>>>
>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>> ---
>>>> =C2=A0 meta/recipes-connectivity/iproute2/iproute2.inc | 4 ++++
>>>> =C2=A0 1 file changed, 4 insertions(+)
>>>>
>>>
>>> Isn't this a general problem, and not specific to just iproute2 ?
>>
>> For=C2=A0 those recipe ${B} !=3D ${S} ,=C2=A0 ${B} will be cleaned,=C2=
=A0 will not=20
>> have this problem.
>>
>> and by default, CLEANBROKEN is not set,=C2=A0 make clean will be execute=
d.
>>
>> but for this specific recipe,=C2=A0 both condition not matched.
>>
>>
>
> btrfs-tools inherits autotools-brokensep and sets CLEANBROKEN =3D "1",=20
> will it also require a similar fix ?

In theory=EF=BC=8C btrfs-tools and other recipes like this will met similar=
=20
problem.


But I tested on btrfs-tools, it don't met problem even without clean,=20
since some dependency changed, so

binary btrfs also recompiled. so this is also related to respective=20
makefile.


And your suggestion to make it commons also make sense,=C2=A0 in this way,=
=C2=A0=20
we need to

handle condition (${B} and ${S} is same,and CLEANBROKEN =3D "1")

in base.bbclass and autotools-brokensep.bbclass.=C2=A0=C2=A0 But one proble=
m here=20
is=C2=A0 that

we have kinds of recipes,=C2=A0 not all Intermediate file are *.o, how to=20
handle this, any suggestion?

or still handle this in seperate recipes?



