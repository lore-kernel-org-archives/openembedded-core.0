Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web12.4413.1616585193947836612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 04:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tdQkchnD;
 spf=pass (domain: arm.com, ip: 40.107.21.88, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wpewMyNgz+HF5bNASq2lym8dUxxzPsRjYRew1JLhxM=;
 b=tdQkchnDgLg/XaPRMMqBW2lHqyw4uVAfVykKjJGsxcOXtxhW7rWJXITV2jO8s0ddlTUsUKbIgVOBYIa+mdp5cgMhHEjj92kX8zw7LLs2ra5s6raibyJLiTJVkAIlt13umd6jmpJreJus10Nd7xKjlhVF0siNVETjVeE+6QUH6UM=
Received: from DB7PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:36::25)
 by VI1PR0801MB1629.eurprd08.prod.outlook.com (2603:10a6:800:4f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 11:26:29 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::78) by DB7PR05CA0012.outlook.office365.com
 (2603:10a6:10:36::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Wed, 24 Mar 2021 11:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 11:26:29 +0000
Received: ("Tessian outbound f15357ab733e:v89"); Wed, 24 Mar 2021 11:26:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b851c4f1bc641ef3
X-CR-MTA-TID: 64aa7808
Received: from ccc3cf1a61e9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81149619-606E-450C-A39C-8BA568C483E3.1;
	Wed, 24 Mar 2021 11:26:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ccc3cf1a61e9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Mar 2021 11:26:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNEjbUUO3Fkw/FvlWpF7rGX0MVRgUcy/gH66Fl1aOnEyVv2n1fstur6aCn27f71Nj34giPORmXjGv3/afTGGxVplzCyMmFWRHXUgFtxxiqcW8LZuIHgySDZIOpYLKaCNHJYBsPujRhF2xtgesRypiHvr0nhT8vyhsBzZmONa4dNyQCUVZQE+BkNPin3s4CGAMyay/qPm1IWpYmxXtZXkcdmnC61JGuWalme1yIR1sfAD9ZTll9+L+eG3yHs0/cmlr/M7+hzgD6/ISqCCllOFJGgfRHD4OzicQqrpFUABqLC1MnnAE2IGl1LO+KkI3qts/+BJmzHG9G/FJhbxw2J2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wpewMyNgz+HF5bNASq2lym8dUxxzPsRjYRew1JLhxM=;
 b=eNdN+2Yh7bV1dPhWN80ugmPCUcK1BSGFwf3n6n0O6Ry2QPDcz447F0inXRqpKh3QDEBqPDvESmECgWf4iiwvmeOxBnvuseB0o5UPqf2D0TverjgDIAEaDmwX8cN3Cr5VYGYzoakOZnEpxxSQhs3kgXuDjn/b3M28bQExsbvY+MZFU9g/IUXvh8LFXqqyn+S0PmJjIGBk2e0q1jWeIqro6eU4SfGo/xBMWN6ugl2/oNCh5qW8A2yBxct6S4/bIuYAXwFrOEyAZhNfOwOP7gtc8HKZjhQrBh9AHLy0SSfA0yy7K8c56s8/JkYtAdX8I69NMmX/ApvMOXxoOOwLBJhILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wpewMyNgz+HF5bNASq2lym8dUxxzPsRjYRew1JLhxM=;
 b=tdQkchnDgLg/XaPRMMqBW2lHqyw4uVAfVykKjJGsxcOXtxhW7rWJXITV2jO8s0ddlTUsUKbIgVOBYIa+mdp5cgMhHEjj92kX8zw7LLs2ra5s6raibyJLiTJVkAIlt13umd6jmpJreJus10Nd7xKjlhVF0siNVETjVeE+6QUH6UM=
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB6PR0801MB2039.eurprd08.prod.outlook.com (2603:10a6:4:79::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 11:26:21 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::2562:e4d0:c806:a496]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::2562:e4d0:c806:a496%3]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 11:26:20 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: Ilies CHERGUI <ilies.chergui@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "main+help@lists.yoctoproject.org" <main+help@lists.yoctoproject.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	Ross Burton <Ross.Burton@arm.com>, nd <nd@arm.com>, Lakshmi Kailasanathan
	<Lakshmi.Kailasanathan@arm.com>
Subject: Re: fitImage in not installed into the rootfs
Thread-Topic: fitImage in not installed into the rootfs
Thread-Index: AQHXHk8KWE5rlpi+xEuNw/Q32fwrPqqP7BLOgAIntgCAAO9C4Q==
Date: Wed, 24 Mar 2021 11:26:20 +0000
Message-ID: 
 <DB7PR08MB3531FD8CC5E19B99C0F25BBAFD639@DB7PR08MB3531.eurprd08.prod.outlook.com>
References: 
 <CANg5h31VBwwSEdnhgKe2DGNzd2ezsLUgHmdQNdAEank+de1-ag@mail.gmail.com>
 <DB7PR08MB3531E7F460FC9886334581C8FD659@DB7PR08MB3531.eurprd08.prod.outlook.com>,<CANg5h32d53VEnWwV4_MU5iwL-gf+F1sk-xEhsA61L_yc1P7hDw@mail.gmail.com>
In-Reply-To: 
 <CANg5h32d53VEnWwV4_MU5iwL-gf+F1sk-xEhsA61L_yc1P7hDw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ccb2328-8259-4460-076b-08d8eeb7ab39
x-ms-traffictypediagnostic: DB6PR0801MB2039:|VI1PR0801MB1629:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1629C366CA1CBB0B7A77E08CFD639@VI1PR0801MB1629.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HLj9r83SmhP5ydnIz5nc7ICzP/noOpOzgI8MvtiPmZDASg8ltdu/JjQX6w1U9iCgX28aE+c4S4amzZSzx0W1wPETYvIZAvnL56V7KF1iyIBYkdyJI8uQXD370Pg4gjznBUeXodpkymvH6SRK7NMJ7LdAthchPhhAET9icrn4jJ12tTiBRK5lmgUoGVtI1HXF02OTsO+SfWLB4QA2Yy//GWSye26HzI9uFwZOfRBx+poEbPkbccJK6yRKDr6IFsKNjJeTz/GRhCo11YT0XfueZjvPqnWyOf3YpKWiqOKuAEoNZppHDsz2AVa4oJI0PrXlz4DPfhMvwguku43TJ7dZD5Xx7Jk3AbPs0FNcUwsFo9Co6RNV0B9KK4jBlGe/23GxeKAtkAAZG6tzxVNrKfj5jE5IGH/d0B40u+Nfuk0FVBGn+tlbxXSat6Nx4w/8DGdv7qGWXp1TTRKTBKfngUyjY5q5FZxRs+mm9yD43RGz0NGlzCgypIa2UK5aI2P2Odv70FItmFuNupJVVi0Vn7+AGPfX/Hkf1L2o6KyKNLvtj7ckRVCrJjZYtMLCxQg9WyPpxdseasSRhG/pyEERke4njK4Z67j3hNZkz/DC2VoriKZlbrotpwcYakLldX/jdVdMuvA1GM5Yr7NaHdoyi7K1qe1HbY//KGsC2wlTrAHuUv0suqShtYBUctJS3ts6CcxHhyDE1TMyszx0+Dbz/H8VxfyeXxAs7MjmF6Jpo89TKIq3ZsmCvb6lXWNDRuXEUyil
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(86362001)(9686003)(19627405001)(6506007)(4326008)(8936002)(53546011)(5660300002)(186003)(26005)(55016002)(83380400001)(966005)(33656002)(66556008)(66476007)(64756008)(66446008)(76116006)(166002)(66946007)(478600001)(8676002)(52536014)(7696005)(54906003)(110136005)(316002)(38100700001)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?AiMhrXIQN/uys1UFFP3UKnv5sOA25sPKX6yT2xUrh+oqt+kJw1cFlzi+K++r?=
 =?us-ascii?Q?NHosNVTRZHKTE9PnNYW8kNaaW9LkvSZujm8hMhXdJMHY1V1RTu5bq0aDU+MV?=
 =?us-ascii?Q?FEgV+ZoKuk9nu0cECuVlGnYyBV1RIOWn/4oYgsoXSUaSkW1QjNeO2U9ABgZR?=
 =?us-ascii?Q?1klvXvXBFEyQnRquOq95UbIaZ9QhricuQp65qcZx3xePzCKpVcDHdo4l8wN0?=
 =?us-ascii?Q?q2uIHiUWz/WHbDWZJG1CWA0i5bCNFkykhktW1i3J7WeqdhTV+PzG09LIgBKz?=
 =?us-ascii?Q?7gYvs8KxcLxKhZ/3YKR4D92DKnMD2IPLdzRqtBUcsOHZW7XeSghQFD12Q7e2?=
 =?us-ascii?Q?cbA0wwO0rFnT9qyKNMLU0migkl3ENPPf9N9OhgPHVxzCBbPdJypy4WlOOQbn?=
 =?us-ascii?Q?hVN0YYXbKGbwjvxWycLjmXOQ0JEyA3nZitTJlblkXNWBmhm6PtkqSqRYZ4eq?=
 =?us-ascii?Q?vu8yt2jf8pHxan1FHr/UZweJ1b/upfpAwfqgLjuLhIhdTTWLHaeHYoYzgS8M?=
 =?us-ascii?Q?nENttSzrrgR8IK2F21VDi7uA6Lfgu8g7QU3ypMDJzP5J/Bpf1VoRTYKLQAan?=
 =?us-ascii?Q?bg9Kc1jwmEWr+W4OR8A3EaYa9uTj84+ScOG3RR97+m8tvjMLth7wAi8ceequ?=
 =?us-ascii?Q?Xb1DB2hb4ZMiJwq06+csm/ujPooO3CH9kJvZ5aD8kIT16erGaaElTVm18Nde?=
 =?us-ascii?Q?zO2i7vhDoIzL/mwM1FGNMl2Z7k6QUbhUH2bgWZcz4WdZzf+vDEd8jTGrDiFM?=
 =?us-ascii?Q?5E3yXQZ12oJEzIlIZCHQ5RQ8/e/Ii1wbboNxkDvHES5JxMrg9D+2JiOqKGJ5?=
 =?us-ascii?Q?arcdIkwwsHqiR07STkRWahS2OhTqDrVIHvClNpRn5MGLQc6era1asxGwndKB?=
 =?us-ascii?Q?u+d1aldz9Zb5dzuAXIaVOkzOnDT6AtgwWJNjg7U5VbGeUkXgIiZPElqe0WcY?=
 =?us-ascii?Q?SUkC9+X2+IA7f1fkA26uRh9reJk1wW3Ev+X/RrlEasi96dA1fGU1vXG/f81M?=
 =?us-ascii?Q?IcQ4ThTl89ojsOHR98yRlbGfwsr/RwvYVZn/ejH/FoF0ilBu2zxmdT6OeHgV?=
 =?us-ascii?Q?EwQR8nJhGGq15N3CLvCxokCIHVZ2d2awmC0XvNEaf2irp7gOLIYfeUfDU7gh?=
 =?us-ascii?Q?FH0OBXMgJlOZZsfOXnwhpoWnj/gv+8WW4qVp3I7tjTDEQwdcgIJMtauBcbMq?=
 =?us-ascii?Q?yQhon9FQxRX0hbhAaU3DQeGV98kykKv8LjQq6ja4GabP9JryIIlQAek5jXK0?=
 =?us-ascii?Q?MzZG+KZ2ZH+8VfkR8Jh0TEv6OYZeVMhdPJv6WfogChOnhA/HVrzUu2YubYZz?=
 =?us-ascii?Q?OSrqnSLaCbvfIeaU700KJx+C?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2039
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	611e779f-9637-46f8-986a-08d8eeb7a64a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mIPiMbRHds9LGfaxBLXxZNPzTSATVUmdOGCr8aivtBpLRsAN70iCOAWh8wVyX7R/0IstoL/FIckAkfqxaXznFB6mzt/UiUP+2xYfFhuuuvrdVfzY4ndE3JX2A0DxWeTCt87P0e1BfH77rcggb6esklTuXwuVVKoA6GT+jRsgYHK2lyvrioERBtHMbA6wEFR2BS3aaUJfl3/xOm190ddRXKdvaEHjYKl+W4wwj1qhb1NWSPjskklM6MaMdNQ8slK13HfP97SH+6mqwXiLhj2XrZO7afmKGmqaaeGW5BeU+/PpaRDqscjcAckMy34eAsqK3hy0Hi/HkVACVRV2mmCc8CctxS4AIN3GgRdhyrs+0ItFEDEYu/WWGa54TDMTG6CYI0KYBWO8LM8v+8tCuz7sepjqtcdee+fU+i+oD0R/PbawluvINbu8xm0Ree5QnACxAkoPQtPRqsgMoOT8cL+0RkJo0Fjm6yIRlT+8JVtmako/53asy3qD4EbEzgiDpF5vE6en05JMLCNDUbzGJc8F+VcD1qnPdymd4vaFvN0uugRgA/fDs7BjLnRIiLEegRiYQ8Vwej7Jy8U58lP/jSjw4auXGPBfxbfyAw5bRgjP1mmwjKSW21jJPil0zGVmU/86BBEH6+qCSzPMIssn+qSDE3/rCpODI8ahVGsfzaGU3WZITdbgZliDd6V/cPZWONCLNnQakNz8p+s/HgVfz0gpF+zSPIZ/KZK6g97arx5w0bM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(36840700001)(46966006)(4326008)(8676002)(5660300002)(166002)(53546011)(6506007)(33656002)(82310400003)(70586007)(7696005)(8936002)(356005)(86362001)(70206006)(478600001)(55016002)(9686003)(83380400001)(52536014)(36860700001)(966005)(336012)(110136005)(82740400003)(19627405001)(26005)(316002)(186003)(2906002)(47076005)(54906003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 11:26:29.1912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccb2328-8259-4460-076b-08d8eeb7ab39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1629
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB7PR08MB3531FD8CC5E19B99C0F25BBAFD639DB7PR08MB3531eurp_"

--_000_DB7PR08MB3531FD8CC5E19B99C0F25BBAFD639DB7PR08MB3531eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please refer to the fitimage test module for FIT examples. More specificall=
y, take a look on the test_initramfs_bundle function as an example of using=
 initramfs bundles in the FIT image : https://github.com/openembedded/opene=
mbedded-core/blob/master/meta/lib/oeqa/selftest/cases/fitimage.py


Cheers
________________________________
From: Ilies CHERGUI <ilies.chergui@gmail.com>
Sent: 23 March 2021 21:05
To: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>; openembedded-core@l=
ists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: main+help@lists.yoctoproject.org <main+help@lists.yoctoproject.org>; ri=
chard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>; Ross=
 Burton <Ross.Burton@arm.com>; nd <nd@arm.com>
Subject: Re: fitImage in not installed into the rootfs

Hi Abdellatif,

Thanks for your response.

I tried to search for some examples in the Yocto git repository but I didn'=
t find an example concerning dealing with the FIT image with the latest imp=
lementation.

Could you please send me the link(s) where I can find the examples that you=
 suggest.

Any help would be much appreciated.

Best regards,
Ilies

On Mon, 22 Mar 2021 at 12:13, Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm=
.com<mailto:Abdellatif.ElKhlifi@arm.com>> wrote:
Hi,

It's fine that packages-split/kernel-image-fitimage is empty.

The fitImage is not expected to be in the rootfs. It's a container that inc=
ludes the initramfs bundle (kernel + rootfs) and the kernel DTB. You can ve=
rify its content by inspecting the generated ITS file.

The fitImage can be included in the final image. The final image is the ima=
ge to be copied to the storage device (flash, eMMC, sdcard ...).

At runtime, u-boot loads the fitImage from the storage device, copies the k=
ernel/DTB to their specified addresses, then starts the kernel.

So, in your case just update the task that populates the final image by cop=
ying the fitImage binary to the partition where u-boot is expecting to find=
 the fitImage. If your image is an sdcard image (ie: eMMC device) , the tas=
k name starts with IMAGE_CMD followed by the type you are specifying in IMA=
GE_FSTYPES. The task is implemented in a bbclass.

There are few examples in the Yocto Git repo.

Cheers
________________________________
From: Ilies CHERGUI <ilies.chergui@gmail.com<mailto:ilies.chergui@gmail.com=
>>
Sent: 21 March 2021 12:37
To: main+help@lists.yoctoproject.org<mailto:main%2Bhelp@lists.yoctoproject.=
org> <main+help@lists.yoctoproject.org<mailto:main%2Bhelp@lists.yoctoprojec=
t.org>>
Cc: richard.purdie@linuxfoundation.org<mailto:richard.purdie@linuxfoundatio=
n.org> <richard.purdie@linuxfoundation.org<mailto:richard.purdie@linuxfound=
ation.org>>; Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com<mailto:Abdel=
latif.ElKhlifi@arm.com>>
Subject: fitImage in not installed into the rootfs

Hi everyone,

I'm using Poky with a master branch, I'm enabling the fitImage. Unfortunate=
ly, the fitImage is not packaged and not installed into the root file syste=
m.

Here is my updates in the conf/local.conf file:
KERNEL_CLASSES +=3D "kernel-fitimage"
KERNEL_IMAGETYPE =3D "fitImage"
INITRAMFS_IMAGE_BUNDLE =3D "1"

The fitImage is well generated and deployed in the deploy directory but it =
is not installed into the root file system and it is not packaged. the dire=
ctory kernel-image-fitimage under the packages-split of the linux work dire=
ctory is empty.

Please see the attached picture ?

Am I missing something?
Any help would be much appreciated.

Best regards,
------------------------------------

M. Ilies CHERGUI

Senior Embedded Software Engineer

Mobile : +44 7309 350477

E-mail : ilies.chergui@gmail.com<mailto:ilies.chergui@gmail.com>

------------------------------------


--

------------------------------------

M. Ilies CHERGUI

Senior Embedded Software Engineer

Mobile : +44 7309 350477

E-mail : ilies.chergui@gmail.com<mailto:ilies.chergui@gmail.com>

------------------------------------

--_000_DB7PR08MB3531FD8CC5E19B99C0F25BBAFD639DB7PR08MB3531eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Please refer to the&nbsp;fitimage test module for FIT examples. More specif=
ically, take a look on
<span class=3D"pl-en"><span class=3D"pl-token" data-hydro-click=3D"{&quot;e=
vent_type&quot;:&quot;code_navigation.click_on_symbol&quot;,&quot;payload&q=
uot;:{&quot;action&quot;:&quot;click_on_symbol&quot;,&quot;repository_id&qu=
ot;:15777788,&quot;ref&quot;:&quot;master&quot;,&quot;language&quot;:&quot;=
Python&quot;,&quot;originating_url&quot;:&quot;https://github.com/openembed=
ded/openembedded-core/blob/master/meta/lib/oeqa/selftest/cases/fitimage.py?=
_pjax=3D%23repo-content-pjax-container&quot;,&quot;user_id&quot;:null}}" da=
ta-hydro-click-hmac=3D"e7cc7276edaaf42c49c6dccd8ef84a5c670207f167e0ce65f02b=
0ed0c546c3c7">the
 test_initramfs_bundle</span></span> function as an example of using initra=
mfs bundles in the FIT image :
<a href=3D"https://github.com/openembedded/openembedded-core/blob/master/me=
ta/lib/oeqa/selftest/cases/fitimage.py" id=3D"LPlnk">
https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oeqa=
/selftest/cases/fitimage.py</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Cheers<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ilies CHERGUI &lt;ili=
es.chergui@gmail.com&gt;<br>
<b>Sent:</b> 23 March 2021 21:05<br>
<b>To:</b> Abdellatif El Khlifi &lt;Abdellatif.ElKhlifi@arm.com&gt;; openem=
bedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded=
.org&gt;<br>
<b>Cc:</b> main+help@lists.yoctoproject.org &lt;main+help@lists.yoctoprojec=
t.org&gt;; richard.purdie@linuxfoundation.org &lt;richard.purdie@linuxfound=
ation.org&gt;; Ross Burton &lt;Ross.Burton@arm.com&gt;; nd &lt;nd@arm.com&g=
t;<br>
<b>Subject:</b> Re: fitImage in not installed into the rootfs</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
Hi&nbsp;Abdellatif,&nbsp;</div>
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
<br>
</div>
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
Thanks for your response.</div>
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
<br>
</div>
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
I tried to search for some examples in the Yocto git repository but I didn'=
t find an example concerning dealing with the FIT image with the&nbsp;lates=
t implementation.</div>
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
<br>
</div>
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
Could you please send me the link(s) where I can find the examples that you=
 suggest.</div>
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
<br>
</div>
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
<div><font face=3D"monospace"><span style=3D"color:rgb(32,31,30)">Any help =
would be much&nbsp;</span><span style=3D"margin:0px; padding:0px; border:0p=
x; font-variant-numeric:inherit; font-variant-east-asian:inherit; font-stre=
tch:inherit; line-height:inherit; vertical-align:baseline; color:rgb(32,31,=
30)">appreciated</span><span style=3D"color:rgb(32,31,30)">.</span><br>
</font></div>
<div><font face=3D"monospace"><br>
</font></div>
<div><span style=3D"font-size:12.8px"><font face=3D"monospace">Best regards=
,</font></span></div>
<div><span style=3D"font-size:12.8px"><font face=3D"monospace">Ilies</font>=
</span></div>
</div>
<div class=3D"x_gmail_default" style=3D"font-family:courier new,monospace; =
font-size:small">
<br>
</div>
</div>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Mon, 22 Mar 2021 at 12:13, Abdel=
latif El Khlifi &lt;<a href=3D"mailto:Abdellatif.ElKhlifi@arm.com">Abdellat=
if.ElKhlifi@arm.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi,
<div><br>
</div>
<div>It's fine that packages-split/kernel-image-fitimage is empty.</div>
<div><br>
</div>
<div>The fitImage is not expected to be in the rootfs. It's a container tha=
t includes the initramfs bundle (kernel + rootfs) and the kernel DTB. You c=
an verify its content by inspecting the generated ITS file.</div>
<div><br>
</div>
<div>The fitImage can be included in the final image. The final image is th=
e image to be copied to the storage device (flash, eMMC, sdcard ...).</div>
<div><br>
</div>
<div>At runtime, u-boot loads the fitImage from the storage device, copies =
the kernel/DTB to their specified addresses, then starts the kernel.</div>
<div><br>
</div>
<div>So, in your case just update the task that populates the final image b=
y copying the fitImage binary to the partition where u-boot is expecting to=
 find the fitImage. If your image is an sdcard image (ie: eMMC device) , th=
e task name starts with IMAGE_CMD
 followed by the type you are specifying in IMAGE_FSTYPES. The task is impl=
emented in a bbclass.
</div>
<div><br>
</div>
<div>There are few examples in the Yocto Git repo.</div>
<div><br>
</div>
Cheers<br>
</div>
<div id=3D"x_gmail-m_2240127513189070899appendonsend"></div>
<hr style=3D"display:inline-block; width:98%">
<div id=3D"x_gmail-m_2240127513189070899divRplyFwdMsg" dir=3D"ltr"><font fa=
ce=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>Fr=
om:</b> Ilies CHERGUI &lt;<a href=3D"mailto:ilies.chergui@gmail.com" target=
=3D"_blank">ilies.chergui@gmail.com</a>&gt;<br>
<b>Sent:</b> 21 March 2021 12:37<br>
<b>To:</b> <a href=3D"mailto:main%2Bhelp@lists.yoctoproject.org" target=3D"=
_blank">main+help@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:main%2Bh=
elp@lists.yoctoproject.org" target=3D"_blank">main+help@lists.yoctoproject.=
org</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"=
_blank">richard.purdie@linuxfoundation.org</a> &lt;<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundat=
ion.org</a>&gt;; Abdellatif El Khlifi &lt;<a href=3D"mailto:Abdellatif.ElKh=
lifi@arm.com" target=3D"_blank">Abdellatif.ElKhlifi@arm.com</a>&gt;<br>
<b>Subject:</b> fitImage in not installed into the rootfs</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div style=3D"font-family:&quot;courier new&quot;,monospace; font-size:smal=
l"><span style=3D"font-family:monospace">Hi everyone,</span><br>
</div>
<div>
<div><font face=3D"monospace"><br>
I'm using Poky with a master branch, I'm enabling the fitImage. Unfortunate=
ly, the fitImage is not packaged and not installed into the root file syste=
m.<br>
</font></div>
<div><font face=3D"monospace"><br>
</font></div>
<div><font face=3D"monospace">Here is my updates in the conf/local.conf fil=
e:</font></div>
<div><font face=3D"monospace"><b>KERNEL_CLASSES +=3D &quot;kernel-fitimage&=
quot;<br>
KERNEL_IMAGETYPE =3D &quot;fitImage&quot;<br>
INITRAMFS_IMAGE_BUNDLE =3D &quot;1&quot;</b><br>
</font></div>
<div><font face=3D"monospace"><br>
</font></div>
<div><font face=3D"monospace">The fitImage is well generated and deployed i=
n the deploy directory but it is not installed&nbsp;into the root file syst=
em and it is not packaged. the directory&nbsp;<b>kernel-image-fitimage&nbsp=
;</b>under the&nbsp;<b>packages-split</b>&nbsp;of<b>&nbsp;</b>the
 linux work directory<b>&nbsp;is empty.</b></font></div>
<div><font face=3D"monospace"><br>
</font></div>
<div><font face=3D"monospace">Please see the attached&nbsp;picture ?</font>=
</div>
<div><font face=3D"monospace"><br>
</font></div>
<div><font face=3D"monospace">Am&nbsp;I missing something?</font></div>
<div><font face=3D"monospace"><span style=3D"color:rgb(32,31,30)">Any help =
would be much&nbsp;</span><span style=3D"margin:0px; padding:0px; border:0p=
x; font-variant-numeric:inherit; font-variant-east-asian:inherit; font-stre=
tch:inherit; line-height:inherit; vertical-align:baseline; color:rgb(32,31,=
30)">appreciated</span><span style=3D"color:rgb(32,31,30)">.</span><br>
</font></div>
<div><font face=3D"monospace"><br>
</font></div>
<div><span style=3D"font-size:12.8px"><font face=3D"monospace">Best regards=
,</font></span></div>
<div><b style=3D"font-family:monospace,monospace; font-size:12.8px">-------=
-----------------------------</b></div>
</div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<p><b><font face=3D"monospace, monospace">M. Ilies CHERGUI</font></b></p>
<p><b><font face=3D"monospace, monospace">Senior Embedded Software Engineer=
&nbsp;</font></b></p>
<p><font face=3D"monospace, monospace"><b><u>Mobile :</u> </b>+44 7309 3504=
77</font></p>
<p></p>
<p><font face=3D"monospace, monospace"><b><u>E-mail :</u></b> <a href=3D"ma=
ilto:ilies.chergui@gmail.com" target=3D"_blank">
ilies.chergui@gmail.com</a></font></p>
<p><font face=3D"monospace, monospace"><b>---------------------------------=
---</b></font></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<br clear=3D"all">
<div><br>
</div>
-- <br>
<div dir=3D"ltr" class=3D"x_gmail_signature">
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<p><b style=3D"font-family:monospace,monospace; font-size:12.8px">---------=
---------------------------</b><br>
</p>
<p><b><font face=3D"monospace, monospace">M. Ilies CHERGUI</font></b></p>
<p><b><font face=3D"monospace, monospace">Senior Embedded Software Engineer=
&nbsp;</font></b></p>
<p><font face=3D"monospace, monospace"><b><u>Mobile :</u> </b>+44 7309 3504=
77</font></p>
<p></p>
<p><font face=3D"monospace, monospace"><b><u>E-mail :</u></b> <a href=3D"ma=
ilto:ilies.chergui@gmail.com" target=3D"_blank">
ilies.chergui@gmail.com</a></font></p>
<p><font face=3D"monospace, monospace"><b>---------------------------------=
---</b></font></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DB7PR08MB3531FD8CC5E19B99C0F25BBAFD639DB7PR08MB3531eurp_--
