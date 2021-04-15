Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.57])
 by mx.groups.io with SMTP id smtpd.web08.610.1618507634058705183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 10:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jEKZAUWL;
 spf=pass (domain: windriver.com, ip: 40.107.102.57, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3cYHyf6vrtG1x7zf49FSEiyVCNVMeDo9LpyfvWRmlQlZFV8KtI0MwPzJk2Ncp2xcjwCJBkYuxGXiQx6PPRBwTZR7G8GsvXYc0sabeodl1bNrYhcCcvpwbmdFKBQvCSlmscCMjz3GWtNTSjvltn0ElBQmTfAZUDaYJBiqscXPuzEFDhuBDL5fL3zvaDUeoGcdIjqSKgJY5B/gOq+AlGBBpL908sDYBu2B/eOqE8JXipicVnjnWXLye7yLxpUX/jEUNbtWqy2/nmI/4GrDj0xtrubhqPL5f2HtI9DaT4oO45xMZNbsDMYatr5032GdgM8aZpFxKLdJidR1gy051aykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgliD2p+d33DjzoyNXFSjMMoyrVpRTdny4Vy+PNdkQQ=;
 b=TKD8/ed78I7BTOPM6UTrMbrOwFDLPwpmEmsGioV/6ngrdHw+hrfR5IXIZpubs0A0GDAANVKGQrGiSn/jUzS7hbyZ4XL0CCVUEoI6EHQYLJQLz7QlP1StPMDxktjqHhOYUeGw3z2TrnqojgQjv3gIXbuudmbBJWLde/FRU10gYlsSdcKBs0k/nRMVf70kUAFYV2CCjiTCaJ4TqF8cUREoPuR4dsEr+y2E5NeQ3ncT//AW3zWqEY9CAJ9C9v4BpJ/MqgPzE7ZmQpQ6H6MIQMA/0OBQYsiotlsy0F/J7PZijvCmRt29c9qlEOEz/gK8ZPXmq6cV0Q60nS33VzjI/ZCocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgliD2p+d33DjzoyNXFSjMMoyrVpRTdny4Vy+PNdkQQ=;
 b=jEKZAUWLuEIbm7PSCZxhSbJc+YrY8c3tcN5s8St0UK4FWp9IPt4nNuaqAt8vHjG8YbetzpLhow3TRa18oejEdiTgCyESBYUrUiMdo4a2vvZjUzBCNrp/7TqylVuIQuZ/Jux5uK311B+ZMURpY9PrHp+o7s7fm6oAlMBkTuiD/HU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Thu, 15 Apr 2021 17:27:12 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 17:27:11 +0000
Subject: Re: [OE-core] [PATCH] linux-yocto[-rt]_5.4: remove feature/gpio/mockup.scc
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210405190833.53066-1-sakib.sajal@windriver.com>
 <CADkTA4NtZxz0vPb+Ska8++1T_Q2v5LAkV3PNVyDAyEFO6-tpbg@mail.gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <397aa941-6da4-e0ad-d83d-7dff27d191d4@windriver.com>
Date: Thu, 15 Apr 2021 13:27:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4NtZxz0vPb+Ska8++1T_Q2v5LAkV3PNVyDAyEFO6-tpbg@mail.gmail.com>
X-Originating-IP: [184.147.76.169]
X-ClientProxiedBy: MN2PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:208:15e::19) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (184.147.76.169) by MN2PR17CA0006.namprd17.prod.outlook.com (2603:10b6:208:15e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18 via Frontend Transport; Thu, 15 Apr 2021 17:27:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e4c2daf-b7c0-4a88-b218-08d90033b441
X-MS-TrafficTypeDiagnostic: DM6PR11MB4692:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4692E17E0EE0D4281A14B62DF24D9@DM6PR11MB4692.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l+DM0DxZ9hcqNW+atOlqPMN6b6ULhCDyRjS9rc3uxEi+3EGM5rE8RMd0A19nqODWmXHy2+D1OYfW1bcEQAaZXrGUZWzkiUsZP3gQsVh7xVuomZVwlA9ycqelraLIPV8YIX4s43su1/LXyotCSfHzbbN5Azb3HKE8hOrHljvU+4WbbTpo5gbe3RWNG9oaf+U6H+GaaVppxiCx0CYKB8EmSYdb8H8W9ga59a8Y0sdgdM/auA4sI5Os+i9xdbJ1Lx27ll2Lj6IKqdwnDfXFIsEyku+MRKyAk3Jr+VPU8eJrgBZ1vxLFflsASEiFRpxCQeqs/TKAI7eFQlywenvsRxHuWxH1wk4VysPHqQyILyeMoNBfOp7PVGVkNSawlg+P8KpJeQOzsQ/jvNcLQ1r/Y3v9gzD2Nye/5XQA4agv1NiFD32gxAKPZsnqMOAdtvL+YoArp3AWtlNqX/xT1cXFvxKfowhv6QxfXHIp0bytpUEYWtETLbfIUFg+Lcnv4qpvlSqiwbDzEXGFqAWEKd6YryR1aAGhNAfLDRTj9xyZflpXL60QpJFjzUtRo2WM5m5ROYFOCgl7+xtmFNO0GAR9WDklhQxHRBwfL2X4w+QZqqwkbt7bstqEAtL70/AGZGaZR9f6PPunIHONr33rqT1+ZoGxvalCF4gotzsGep94VwkeO8SDAAGPt9IoLJvVCDif5HagS48HwU95F39hsbv92xnkrLkL28jinx7tv9RW7ybni7WS10FK2OwBtvIFQKzz4JgGg+F8CUwmbIhbuLtDxchX2MxWe9+4PWX+ZngxnvdfD1A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39850400004)(16576012)(31696002)(6666004)(38350700002)(316002)(38100700002)(83380400001)(6486002)(44832011)(2906002)(956004)(36756003)(86362001)(2616005)(31686004)(5660300002)(52116002)(4326008)(186003)(966005)(53546011)(66476007)(8936002)(66556008)(66946007)(8676002)(478600001)(26005)(6916009)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/izAU+wAM1StAgC/mAQdqBXV6OkzW8wSfHhAhKGXXRZr2koKmZhISOol6gdK?=
 =?us-ascii?Q?CQiRuR0q/wxXOcu0QbTOV4ztK1GcFfh8Yv44mYW9WAC5533VrqwsOUeHJggn?=
 =?us-ascii?Q?vTXiaf1nKtqlbh42XNYX5YXdlISjzyqL7wuyNxmi2CSj/gUp50z5vp7Q88bg?=
 =?us-ascii?Q?F2Eiw7e4i6Z5DaibX+GzukrqqoIP6bbAgCYvMfzI784It7QQeO4c6heE1kOA?=
 =?us-ascii?Q?329Tvik0i0NXFnJVhu+FDFr/JznDQVVKanbr0WdoW1qvi4vUG6yJdTVMm0oG?=
 =?us-ascii?Q?UwMeF6VAFKX+xS5qayg6yArXKNtp3jup/RhrOLc0FYvtCQ2KfVy3RI/UHH6h?=
 =?us-ascii?Q?v/4yv4R0FNo+cQsWgaUA863rs0mt8W5dqADRxsUPj11IW+x4NSWQeOTa6TF6?=
 =?us-ascii?Q?130okYgo7zX1DquIlb1+7/fBmPhYtkex7cHRdnQXUASgAXjUUq8+XebRXwoI?=
 =?us-ascii?Q?q2SklCMrUr0w1zSoK09K4udmYWCenDCa9WAx93dOU8v88VWQEqhmX4YaaOef?=
 =?us-ascii?Q?9IisuljsWjDc6yJzuS0D8Ui5STZ9UJImE3dmg1fwa0Trwg1UFMWitkb7DmQ7?=
 =?us-ascii?Q?L1DotcCahFvaTCoxhc1O9dudTLJEa0Y7gMpCqBMULnaVJ5ZUHwNY/mSu2EET?=
 =?us-ascii?Q?XnW5vwcuyibvhMxy1SpPV0o4GyWUT01vxa8IAuTVt7qzZodDDP4+g6LcKFcx?=
 =?us-ascii?Q?HUb+c7h0D1nQPOVPJZ2LtBKYFwaTz1hYAb921C4by6UuJXhcE5PndHtMw0P3?=
 =?us-ascii?Q?YMuvbwbbnWiAB78Tc5MSv3i8vvyx96A9PW9Odi4tzGSjxAFV0p2Za8hPGUGk?=
 =?us-ascii?Q?XTEDcNTdrIGR4jQB03tgJz86bYtv+r0T5eXItqeG6ckx3zzK4AG/5r4xM30/?=
 =?us-ascii?Q?x/CRYwbj2Aa5YMg4dkODQVdZe+CWt28o+NxUkY93Wu0iAwUJSaetolPDjLo9?=
 =?us-ascii?Q?YuM6qfEz8ddjdhWrD81i438CC6od22T08QiwE1yuTfX684RC+ciwYqBuxh3H?=
 =?us-ascii?Q?OHtZ+SPnmFbySS5/f3FodvS72V6SkUhzeHXQNcO2Jsbs+/yD49Y2HkAS/IPd?=
 =?us-ascii?Q?KaNtJ7YvCOQNALtx+ppN8jhaajOrnLUs+sCsflkeHXRwWQdR0hATXg/Jdl2v?=
 =?us-ascii?Q?AZ505RFmd7IuiwHN6bezC69SZ+EjI2gfg4gfmj3MQ9SYfpTRG73kYx0+PkIR?=
 =?us-ascii?Q?TGNRn7FnWXEd7kaJ8Nc3n3bALbiaMlzNmdMy1SzRTH0BuIPS6Kx1lOGGnq4X?=
 =?us-ascii?Q?1efVL3+O+8vn1sZs//rs16zK5D2gV4Ca4KbxM6XkOs7pifVBRzH5CV8twtA9?=
 =?us-ascii?Q?IWFzpyGFWU63xOvZAxDl8AkI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4c2daf-b7c0-4a88-b218-08d90033b441
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 17:27:11.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8z3fR1tcpjlCzIcx60perNaYeU8vMcFtLVqPPV2/DXcUHMoCsB4Zr/oZckIIOLq+bPYYzN+v10fXOWePKp1fm10mJjR0ODQ3YVSebLJaK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2021-04-06 7:36 p.m., Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Mon, Apr 5, 2021 at 3:08 PM Sakib Sajal <sakib.sajal@windriver.com> w=
rote:
>> mockup.scc is not supported in 5.4 kernel
>>
> Can you elaborate ? Are you seeing build issues ? Something else ?
>
> The Kconfig options are in our 5.4.109 kernel tree, so you must mean
> something more than that.
>
> Bruce

mockup kernel module was added for the purpose of testing libgpiod=20
(v1.6.3 on master meta-oe).

The minimum kernel version required for testing is v5.5.

from libgpiod-1.6.3/tests/gpiod-test.c:

#define MIN_KERNEL_MAJOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5
#define MIN_KERNEL_MINOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5


Sakib


>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 1 -
>>   meta/recipes-kernel/linux/linux-yocto_5.4.bb    | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-rt_5.4.bb
>> index 2ffc8ed542..7629229601 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>> @@ -42,4 +42,3 @@ KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc fea=
tures/drm-bochs/drm-bochs.scc
>>   KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
>>   KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.=
scc"
>>   KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES", "=
ptest", " features/scsi/scsi-debug.scc", "", d)}"
>> -KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES", "p=
test", " features/gpio/mockup.scc", "", d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipe=
s-kernel/linux/linux-yocto_5.4.bb
>> index 245c3d574b..04e64c028b 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
>> @@ -52,4 +52,3 @@ KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/=
paravirt_kvm.scc"
>>   KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.=
scc"
>>   KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES", "m=
x32", " cfg/x32.scc", "", d)}"
>>   KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEATURES", =
"ptest", " features/scsi/scsi-debug.scc", "", d)}"
>> -KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "=
ptest", " features/gpio/mockup.scc", "", d)}"
>> --
>> 2.25.1
>>
>>
>>=20
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
