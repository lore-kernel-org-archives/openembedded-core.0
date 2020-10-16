Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.88])
 by mx.groups.io with SMTP id smtpd.web12.12125.1602842344558539569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4K5kNA1t;
 spf=pass (domain: arm.com, ip: 40.107.14.88, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mPpPyaS74jzCL66PsssZTCQmlW/EVVwOpAU0uKa5mM=;
 b=4K5kNA1tqda8zgu9EF+WlUBUWQGTf7uSok8Q3OORrXLOIQ5HPDtc20BKsMfU8t4hqiM6yqAIPkwhspqcqhG0+5nXz/Ly5pE5RK4tVrfl0C6pQIwDgAtC/ZeT1FQUPcOc9ZB5nb/ezU7T8uIhmnKRP5fXZaw78M08/Dqspu+gXzU=
Received: from AM6P191CA0081.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::22)
 by AM6PR08MB4820.eurprd08.prod.outlook.com (2603:10a6:20b:d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 09:59:01 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::c6) by AM6P191CA0081.outlook.office365.com
 (2603:10a6:209:8a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Fri, 16 Oct 2020 09:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Fri, 16 Oct 2020 09:59:00 +0000
Received: ("Tessian outbound c189680f801b:v64"); Fri, 16 Oct 2020 09:59:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 788d4d44c747c137
X-CR-MTA-TID: 64aa7808
Received: from 7e384bf975da.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 73AC9E4D-F15F-4707-AF77-6FB2C97EE6AF.1;
	Fri, 16 Oct 2020 09:58:34 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e384bf975da.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 16 Oct 2020 09:58:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NefM9RBgFfcogiz6XY0XQ2ixoFiWBtm8QCVQI9KvL5VtR+/0R8s9Ka1Ki7Rzr95ISWX7IWxVMGuqgjM8Dm7G80acAQOinAFsyyWrJOVPDU01K+n3E0cUDHiQ5ClPcIofyTfsznuy0JzV5/FlQuTR8uRVVnSEAS0I966B8+haemwd2hI7z34fccceTRXgj7Nz+Yn+VSMVb60mv+5EM9Efl3K9Ily/9fE2ACh7ME9zDApMfqsIMHIbzc6Tzqom3CfVKDOhOJ1U8K0WBiA/UMnhihUJrPtBXLOVhmQX33v80oEts8f1KpSkHO3VmKKyqa0CjgE9LJPIVeSRXwrKTKj+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mPpPyaS74jzCL66PsssZTCQmlW/EVVwOpAU0uKa5mM=;
 b=GBeKj3Tz+yyYaCFaLFB6mt6gLG8G1ts9cdj4N6MATuXBywCgqo5Kfpl8bw8j2EB4/F2aIJbxPq/Dc5qMHiqS1Fn8n7zj0oEP808RUAzfiPQea1NDXE/jDzN0qptckqnSrI88F0zK8M7r3gTpVvd8osbCqhomy5Zmbvn5Ml4SzjVaU6eonzujWVvcueQdXMVM8j+qMyJORb3WRx3YcVXCmG1MposSmJ8L/zIrMlf79xxqIkgeRjPS7E5GeyXFKULoQ523rV4tHk++GN+rXD1jh5cL4WC3MI9smOvqRrZ+oPP1A248/Ks+TDkK2rZVheWKzF+27JMeOAA7mCvsAszXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mPpPyaS74jzCL66PsssZTCQmlW/EVVwOpAU0uKa5mM=;
 b=4K5kNA1tqda8zgu9EF+WlUBUWQGTf7uSok8Q3OORrXLOIQ5HPDtc20BKsMfU8t4hqiM6yqAIPkwhspqcqhG0+5nXz/Ly5pE5RK4tVrfl0C6pQIwDgAtC/ZeT1FQUPcOc9ZB5nb/ezU7T8uIhmnKRP5fXZaw78M08/Dqspu+gXzU=
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB6PR0802MB2199.eurprd08.prod.outlook.com (2603:10a6:4:82::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 16 Oct
 2020 09:58:31 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32%5]) with mapi id 15.20.3455.031; Fri, 16 Oct 2020
 09:58:31 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: nd <nd@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Lakshmi Kailasanathan
	<Lakshmi.Kailasanathan@arm.com>, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [OE-core] [meta-oe][PATCH 0/2] kernel-fitimage: adding support for Initramfs bundle and u-boot script
Thread-Topic: [OE-core] [meta-oe][PATCH 0/2] kernel-fitimage: adding support
 for Initramfs bundle and u-boot script
Thread-Index: AQHWoVSP19Y0pxMwwUiS124Obi5dBqmZQIcAgAC8bS4=
Date: Fri, 16 Oct 2020 09:58:31 +0000
Message-ID: 
 <DB7PR08MB3531BEEDFF1946B8C0714865FD030@DB7PR08MB3531.eurprd08.prod.outlook.com>
References: 
 <20201013113232.29228-1-abdellatif.elkhlifi@arm.com>,<de3d7aef8f799ace3a55349c1d805e081b66e111.camel@linuxfoundation.org>
In-Reply-To: 
 <de3d7aef8f799ace3a55349c1d805e081b66e111.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37ed6f69-da65-4771-6881-08d871ba1af0
x-ms-traffictypediagnostic: DB6PR0802MB2199:|AM6PR08MB4820:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB48201285E222F1EDCFE56B14FD030@AM6PR08MB4820.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IXIrpTmbH1pVwR2qtgVELSn0BUm3UC+PTk531A1E7Lur00Zo2w9V9V/wBFFXMVY7bU4WtmgJ84/dHEeJH9KcVLfmOnf2aEA4975zWpHdeA08ZuZWDiRp5PgY0tvbMNXJeMpCO7PXFi4ENycS3JnpdZG+MCkRmzM12f4meS9ETGAcJtW5Qq2y6aLH777Z0/bX1ZzhZ5liyW4LTRt17rNDJLJRBScFk8OQSsfSzoUsXbhJFrqhwwV0bmP2viQCA6ngG5lG+DZxIevjLTUl4UpmAfgNohYizxwzXEFQI3uisAbh/C21tUUPYlKUK2oRels7RrpCFFwLjEZhJpoAQsZB9SlT93/uNwRMinGdrOsIGVTnh9KqBz16JAZwav1mt0kzzxLrY54LzjaShZoPlU63UA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(19627405001)(966005)(71200400001)(7696005)(4326008)(55016002)(4001150100001)(26005)(83380400001)(6916009)(53546011)(9686003)(66946007)(66556008)(186003)(316002)(76116006)(478600001)(66476007)(8936002)(2906002)(6506007)(5660300002)(52536014)(8676002)(86362001)(166002)(66446008)(33656002)(91956017)(54906003)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 /MLm92aFH0RrcFuu5Oqe4G4i8v38jEflf2dRmlwRE5/9Td4vA5m/qF6nqGsec6gWQsaR2WdfzSdanUsNR/nE1+2cpzothu3BbcZ/uQfqXmeRdrE98hS11bXGVAHMOnxUL29ML7S0p+ak8PjiyOwzUf+au5JF+StciX6nNk4yd/2XfEc2LemaetSifHcbgcLMx8eQPdUKGLLs3wqq+xsy91/ZNuQe6ffoe1GZRm7izB/SfuK5Thzv2ctcC9ZMUqVX4iPhO5f5G1vQckLb7Qr1fK/eflq4Al8FjudECINFXBq91PDuSP82aEObZp2hoLYX5cPl2/Pe610uATSYy4VvcM3LqYWF02f/CNZrXqluI9hp5BmYqOo7h+SDxbxbHyL6GKPj2EIO/hLisI+JFI5z2dajgbiD1dClWO9b/cxBuvrWdVtSgmCwPA3uIB/HTR2iqxWHtQHZxLOARttQ34OaAT5t6y1PWt7VpZxP2Z1yMQfyzbEvSAOBNVs+kElwQLZkFdjObqL7zof16Pmlowc495drXqWBbCiUOEvCgksdeX/qSNuA6ckWi1mO/0qkihDxtqudouBqj84WjcTqoPrrxJ1O0psunnH1EiQwmRX1PFmIs6SXVqsTqisJd+esh5c2P+GqThdv+75o9B5QhcbDrA==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2199
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	df4f4f5e-e032-471c-30a0-08d871ba0a0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sGX1VlOEg7nwfaYyShen9DaHz931MxaOd1H/hY3ekcLXHq99Uw2yXUhVYAnp1pR0vPWJYOhll9FhxSjGUY8FaD6SLnXXS2Nf+tD8NZK4hHUCgmP+Brv0ZNxkinDBgDgVklC+NP4O706/t9FXyRjvE3enMR45zjpemvhKdY3GyYJk/AVIH+YlcDC4sOIcsv/HVa4qLZRa2bDgwYkVqGJjBG/XseKM4BJz+ppxZ7NlLqNHPitc/89Lh7EJjPUWsKVT/BV/uWrvdWMtp4V6e6GmjaxLmhZgA9tfzAOL/rTWsEH7HOiixNf+weqMCRTQh/mj94ElMw5iT8LuRzRsRp12gL/q5owuLQR7tgP90vzFevzDxCHuJiHvNkvXT4lv4hWii/hTBrw3ysxqOxE8x8J01wB1bQawwOnhfQF2ahTGT4C432dZ7+qlJcPHfzW6lfy2DhzdcgJzz+7Ut1Hq5atPZ8B+CBS+SqpyIW410z3WVLE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(19627405001)(7696005)(47076004)(33656002)(70206006)(356005)(82740400003)(52536014)(83380400001)(81166007)(166002)(2906002)(86362001)(8936002)(55016002)(4001150100001)(4326008)(5660300002)(9686003)(316002)(966005)(26005)(82310400003)(70586007)(6506007)(53546011)(54906003)(186003)(478600001)(8676002)(6862004)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 09:59:00.1914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ed6f69-da65-4771-6881-08d871ba1af0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4820
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB7PR08MB3531BEEDFF1946B8C0714865FD030DB7PR08MB3531eurp_"

--_000_DB7PR08MB3531BEEDFF1946B8C0714865FD030DB7PR08MB3531eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for the feedback.

I'd like to make sure the configurations listed in the test cases "Usage" s=
ection are provided before running the tests. Without these, the tests will=
 not pass of course.

So, for the test_signed_fit_image_initramfs, please set the following varia=
bles in the machine conf file:

                    INITRAMFS_IMAGE_BUNDLE =3D "1"
                    INITRAMFS_IMAGE =3D "<the initramfs image>"
                    UBOOT_CONFIG ??=3D "FIT"
                    UBOOT_CONFIG[FIT] =3D "<machine>_defconfig"
                    KERNEL_CLASSES =3D " kernel-fitimage "
                    KERNEL_IMAGETYPES =3D "fitImage"
                    UBOOT_SIGN_ENABLE =3D "1"
                    UBOOT_SIGN_KEYNAME =3D "<key name>"
                    UBOOT_SIGN_KEYDIR ?=3D "${DEPLOY_DIR_IMAGE}"
                    UBOOT_DTB_BINARY =3D "u-boot.dtb"
                    UBOOT_ENTRYPOINT  =3D "<initramfs bundle address in RAM=
>"
                    UBOOT_LOADADDRESS =3D "<initramfs bundle address in RAM=
>"
                    UBOOT_DTB_LOADADDRESS =3D "<DTB address in RAM>"
                    UBOOT_ARCH =3D "arm"
                    UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb -p 2000"
                    UBOOT_EXTLINUX =3D "0"
                    KERNEL_IMAGETYPE_REPLACEMENT =3D "<the value set in the=
 kernel-fitimage.bbclass, for ARM 32-bit it's zImage >"
                    FIT_HASH_ALG =3D "<sha algorithm>"

And for test_signed_fit_image_bootscr, in addition to the settings above, p=
lease set the following additional variables in the machine conf file:

                    UBOOT_ENV_SUFFIX =3D "scr"
                    UBOOT_ENV_BINARY =3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"

For more information about the test cases, please check the test cases docu=
mentation in imagefeatures.py (Summary, Expected, Usage).

Many thanks,

Abdel

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: 15 October 2020 23:21
To: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>; openembedded-core@l=
ists.openembedded.org <openembedded-core@lists.openembedded.org>; Lakshmi K=
ailasanathan <Lakshmi.Kailasanathan@arm.com>; Ross Burton <Ross.Burton@arm.=
com>
Cc: nd <nd@arm.com>
Subject: Re: [OE-core] [meta-oe][PATCH 0/2] kernel-fitimage: adding support=
 for Initramfs bundle and u-boot script

On Tue, 2020-10-13 at 12:32 +0100, Abdellatif El Khlifi wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>
> This patchset adds Initramfs bundle support to the FIT image kernel class=
 in
> addition to u-boot boot script capability.
>
> A third patch will be sent which adds the description of the new features=
 in
> the Yocto reference manual.
>
> Abdellatif El Khlifi (2):
>   kernel-fitimage: adding support for Initramfs bundle and u-boot script
>   oeqa/selftest/imagefeatures: adding fitImage testcases for initramfs
>     bundle and boot script
>
>  meta/classes/kernel-fitimage.bbclass          | 148 ++++++++++--
>  meta/lib/oeqa/selftest/cases/imagefeatures.py | 215 ++++++++++++++++++
>  2 files changed, 339 insertions(+), 24 deletions(-)

Unfortunately this failed on the autobuilder in both the test it adds
and in other related ones:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1462/step=
s/8/logs/step2d
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1447

and others builds too.

Cheers,

Richard


--_000_DB7PR08MB3531BEEDFF1946B8C0714865FD030DB7PR08MB3531eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Richard,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the feedback.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I'd like to make sure the configurations listed in the test cases &quot;Usa=
ge&quot; section are provided before running the tests. Without these, the =
tests will not pass of course.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
So, for the test_signed_fit_image_initramfs, please set the following varia=
bles in the machine conf file:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; INITR=
AMFS_IMAGE_BUNDLE =3D &quot;1&quot;
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
INITRAMFS_IMAGE =3D &quot;&lt;the initramfs image&gt;&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_CONFIG ??=3D &quot;FIT&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_CONFIG[FIT] =3D &quot;&lt;machine&gt;_defconfig&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
KERNEL_CLASSES =3D &quot; kernel-fitimage &quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
KERNEL_IMAGETYPES =3D &quot;fitImage&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_SIGN_ENABLE =3D &quot;1&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_SIGN_KEYNAME =3D &quot;&lt;key name&gt;&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_SIGN_KEYDIR ?=3D &quot;${DEPLOY_DIR_IMAGE}&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_DTB_BINARY =3D &quot;u-boot.dtb&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_ENTRYPOINT &nbsp;=3D &quot;&lt;initramfs bundle address in RAM&gt;&qu=
ot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_LOADADDRESS =3D &quot;&lt;initramfs bundle address in RAM&gt;&quot;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_DTB_LOADADDRESS =3D &quot;&lt;DTB address in RAM&gt;&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_ARCH =3D &quot;arm&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_MKIMAGE_DTCOPTS =3D &quot;-I dts -O dtb -p 2000&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_EXTLINUX =3D &quot;0&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
KERNEL_IMAGETYPE_REPLACEMENT =3D &quot;&lt;the value set in the kernel-fiti=
mage.bbclass, for ARM 32-bit it's zImage &gt;&quot;</div>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FIT_H=
ASH_ALG =3D &quot;&lt;sha algorithm&gt;&quot;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
And for test_signed_fit_image_bootscr, in addition to the settings above, p=
lease set the following additional variables in the machine conf file:<br>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
UBOOT_ENV_SUFFIX =3D &quot;scr&quot;</div>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; UBOOT=
_ENV_BINARY =3D &quot;${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}&quot;<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
For more information about the test cases, please check the test cases docu=
mentation in imagefeatures.py (Summary, Expected, Usage).<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Many thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Abdel<br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Richard Purdie &lt;=
richard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> 15 October 2020 23:21<br>
<b>To:</b> Abdellatif El Khlifi &lt;Abdellatif.ElKhlifi@arm.com&gt;; openem=
bedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded=
.org&gt;; Lakshmi Kailasanathan &lt;Lakshmi.Kailasanathan@arm.com&gt;; Ross=
 Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>Cc:</b> nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [meta-oe][PATCH 0/2] kernel-fitimage: adding =
support for Initramfs bundle and u-boot script</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Tue, 2020-10-13 at 12:32 +0100, Abdellatif El K=
hlifi wrote:<br>
&gt; From: Abdellatif El Khlifi &lt;abdellatif.elkhlifi@arm.com&gt;<br>
&gt; <br>
&gt; This patchset adds Initramfs bundle support to the FIT image kernel cl=
ass in<br>
&gt; addition to u-boot boot script capability.<br>
&gt; <br>
&gt; A third patch will be sent which adds the description of the new featu=
res in<br>
&gt; the Yocto reference manual.<br>
&gt; <br>
&gt; Abdellatif El Khlifi (2):<br>
&gt;&nbsp;&nbsp; kernel-fitimage: adding support for Initramfs bundle and u=
-boot script<br>
&gt;&nbsp;&nbsp; oeqa/selftest/imagefeatures: adding fitImage testcases for=
 initramfs<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; bundle and boot script<br>
&gt; <br>
&gt;&nbsp; meta/classes/kernel-fitimage.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 148 ++++++++++--<br>
&gt;&nbsp; meta/lib/oeqa/selftest/cases/imagefeatures.py | 215 ++++++++++++=
++++++<br>
&gt;&nbsp; 2 files changed, 339 insertions(+), 24 deletions(-)<br>
<br>
Unfortunately this failed on the autobuilder in both the test it adds<br>
and in other related ones:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/1462/steps/8/logs/step2d">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/79/builds/1462/steps/8/logs/step2d</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/1447">https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1=
447</a><br>
<br>
and others builds too.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DB7PR08MB3531BEEDFF1946B8C0714865FD030DB7PR08MB3531eurp_--
