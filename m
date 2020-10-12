Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.55])
 by mx.groups.io with SMTP id smtpd.web11.37280.1602497757908303876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 03:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=k4ej2BcI;
 spf=pass (domain: arm.com, ip: 40.107.15.55, mailfrom: brett.warren@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbosIz+ujXLy/ECGIipAviwHqb39/Gt9aechIyrOkQY=;
 b=k4ej2BcIRT01pb5OHxl8brAot07l+aS4A12jiojLsNE1ZrIViUqPfvyvyifwuFztyQXxCWrBUNebh2fhCphuFtvXNhnDlZ6eSziEHGxPuQvGCOaumH7V6YBUKku53tmNphmz/N45ozhex3xs6d7mX8I/VVwyqxgH9+3NGwstMxY=
Received: from DBBPR09CA0015.eurprd09.prod.outlook.com (2603:10a6:10:c0::27)
 by AM0PR08MB4499.eurprd08.prod.outlook.com (2603:10a6:208:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Mon, 12 Oct
 2020 10:15:51 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::44) by DBBPR09CA0015.outlook.office365.com
 (2603:10a6:10:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend
 Transport; Mon, 12 Oct 2020 10:15:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Mon, 12 Oct 2020 10:15:50 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Mon, 12 Oct 2020 10:15:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f372f9f2a989f64a
X-CR-MTA-TID: 64aa7808
Received: from 3ade8397cb49.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C925DA9D-AE2B-4E65-ACC9-C4D593E3AA87.1;
	Mon, 12 Oct 2020 10:15:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ade8397cb49.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Oct 2020 10:15:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxrRU2ORnGUuIxpIvgB62iomFAkQeaDK2zv/3aFxm9zrVzam0NUA925gQ1Sck4S/BiMMx7pqe0MdeGKERw6vxP/inFWeDgoLkfbrsVXWPxFB2Dh8dXbY74x04BwaPrj+jgXk9nQM8zns4DWY8U9NbZH5Yd9KVHNtf7OHY1+pxpBMaSTEqszz+JLuWxab0pl1evSiGMxuI1bXte95Ceq/JUk8VFpHn3Hgbis3T8vQSIiug1G8DSkqBnKW72vATE+foxXdo7XGumfk4GKaPhks6tUUgj23Bx0LqJTz/M/+UWgbpG4vYRtgstaQhsfDzU8ku+JoV77N9Mttqh5NOW3gtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbosIz+ujXLy/ECGIipAviwHqb39/Gt9aechIyrOkQY=;
 b=GlSokVtUr4C2kW/CE/ay1TdJI8soPyEHyyHSU3rRc3sdb4tT109XK13AQdC1bym3Tudvo+H9LRN7pN4iC6wKCpEGsIC5XjF0tXNfw6DBHh71GN++yRAMprAhOMMdqgrBLJa0QSxTcd8Sr8eCa8QWv9jhXpbOhQVXgb+gqRK0df4wEhN2i5oepnx/B4ytuLS5b1sk6UvsYfodayofqLtywx8X9Itf//c2u3iwXy9hIiYwf6dXwWpWM6D2iIkzn76pxcjtFNWYWhS8rpvchI8F2N8fC7TE2O9sHcvEVVheLyEu8wif8eOrkzuynAxbt+HzVIJwmEWW5OdoF4vT/u21yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbosIz+ujXLy/ECGIipAviwHqb39/Gt9aechIyrOkQY=;
 b=k4ej2BcIRT01pb5OHxl8brAot07l+aS4A12jiojLsNE1ZrIViUqPfvyvyifwuFztyQXxCWrBUNebh2fhCphuFtvXNhnDlZ6eSziEHGxPuQvGCOaumH7V6YBUKku53tmNphmz/N45ozhex3xs6d7mX8I/VVwyqxgH9+3NGwstMxY=
Received: from DB6PR0801MB2038.eurprd08.prod.outlook.com (2603:10a6:4:76::19)
 by DB6PR0802MB2598.eurprd08.prod.outlook.com (2603:10a6:4:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Mon, 12 Oct
 2020 10:15:43 +0000
Received: from DB6PR0801MB2038.eurprd08.prod.outlook.com
 ([fe80::446b:7bf2:5b39:f37b]) by DB6PR0801MB2038.eurprd08.prod.outlook.com
 ([fe80::446b:7bf2:5b39:f37b%10]) with mapi id 15.20.3455.030; Mon, 12 Oct
 2020 10:15:43 +0000
From: "Brett Warren" <brett.warren@arm.com>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default strengths
Thread-Topic: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default
 strengths
Thread-Index: AQHWnWD+D5lzX03DCE2TzJMOyqp5SKmNk6eAgAAB61OAAKypgIAAAuOAgAV4GyU=
Date: Mon, 12 Oct 2020 10:15:43 +0000
Message-ID: 
 <DB6PR0801MB2038207620081E154446C8E98D070@DB6PR0801MB2038.eurprd08.prod.outlook.com>
References: <aNp1.1602154243596831287.CumO@lists.openembedded.org>
 <CANNYZj9oAoE_Se7HPd3y=sce9Mak-6n9zEBqyxikZr8trgJQvw@mail.gmail.com>
 <DB6PR0801MB203898E9E50E203D01B848C98D0B0@DB6PR0801MB2038.eurprd08.prod.outlook.com>
 <CANNYZj_RSJHxOYOWk=LGFKqbS3TH937J3HZtTn79drkM-HpgTQ@mail.gmail.com>,<CAMKF1sqiXdHUDNTknBQMkJd=g28dtSRhSt1KvqxpXDP8r7ibQA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqiXdHUDNTknBQMkJd=g28dtSRhSt1KvqxpXDP8r7ibQA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:4b00:e031:2600:8a5:58c8:f377:83c3]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 97c62e92-dc2c-4acc-6e7c-08d86e97cb9e
x-ms-traffictypediagnostic: DB6PR0802MB2598:|AM0PR08MB4499:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB44990D729C4BB782C860FC098D070@AM0PR08MB4499.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ARcT3GXUk4sFSZGYj2PN/ROV7q0rQ95izMAxRPwuMK4EfNSwoyFG56QTulWC0VsEa1G3SdMXeF3pSdq/+FtQVASr8FbVTGBHwVhoe9dIvgJIbSUp+f++n4U58F9JVg4uII3r4dQ5/E8olherGsPCcOje78ZQitpcZvb2UEChsgzG9ttLc2ioCd2RAwUEfOa/p/Unf/LOHsSDnbkOcPPHNYeib184ZEclw06UA+w3mB7PtzifI107Y0hutofuNdsn7eyMYGUZuWw98/1PZAg3TqyQKGCjIAt2OZAioUC5xml+q+T15g9Gpcg0yukNXUjPF7ulAlaNkv402e+AuEhZl54UDUx3isHq8Z3YZpdaF1+6jZWNnKU1LOcDEzYcDmXlK7U8iGXJkEu26jITtQGDEA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2038.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(186003)(33656002)(66556008)(64756008)(19627405001)(2906002)(71200400001)(55016002)(8936002)(66446008)(66946007)(83080400001)(166002)(8676002)(966005)(91956017)(53546011)(6506007)(316002)(52536014)(4326008)(21615005)(76116006)(66476007)(86362001)(5660300002)(7696005)(9686003)(83380400001)(478600001)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 6d8vYHvbYeD+hESkTOHDGf5kASpwAneiCbgXeKMcJhphwxDxQAqoCS2q+TJK23/sGtbaiRfBGfGg5XdsmlpVPOdAmHn0fpYu0YZv+NhxyncS96xmV7qKbbc8RliiQZoD4hVzXFqHGnsmNyiB4FJw8BIDmDLXSVtj1TBcVC+P0ViPMagEqLAzD2mLqM8/m6Z6smzzAOnnZLk3EfCrmmcf+lM9ugAzBemvfNIakwfhR+tPJOlSN5sxtAAK7WrQ+5pZ9jX/DYMQQuwuGALun1QOTkBM/oXAlSDoin6nyJ9ek+5xtGfI7zIlQ0cF1WQOI1dUbgowr2JjDHsWp7v4ldahT7/oyQxIivGq7+AUirqLaGhxJqeVjF/GEahNq0l8kC/kktA+6DTsGHB7cY6/bItDgYi8SUtEQoJbR6I96/GcQzG8k65ic8siJvv4LTM+YzFEjBjZVZGWzm0d8flfnBgQF61t3GOtMH8DU8eTvwLGZ071xktoScf27AoVX1eCOdLEP3mRGi7U2Qm41rWdKqvjSQG3uQQq07pGduOC8dymqttAkiICnV61KrHBmDm9p8i4sUKwWB8jkU1aenZJsg3KMnyfVFFYg/pqjcJq5Yi2OeoKbODO+DY+1rnOe5Bz0GGuIbCHKyh8EhE7FAVvhe4jxQ1HM7Bub2wcYdAxHjd9RfluFIpzPV0aPQ1F/z1KkYyUyE5boKyHLkweZcp2F0sdKA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2598
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Brett.Warren@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9053ce4f-62b9-4f70-ffcc-08d86e97c769
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q19MqqBfjihADE3A16lcV4E+udunDBQ4NhCoS50tECHuReu91jR/CfYWevhdi+QYfn+Rv92nTeTHeZ0g1wxJeMjCWirWHUuiEuKAXsKn68G70EQe4Y8oOKTO0hmRzKHJxdMoefK39yl2xNo0mOhBCUlsQjxgRWPTVSUExmQrk7bjRXr+zgVgQGuzNKEiO21JZLX1pIXB3yic53jn7aHd/ea4HRdNwAmUDRzzu+f04+LrRpTKjoHhfaMD3j1NVcukxDuyt4o0pEZUgkdq4sfsEgpIzfJ2BytXW9ZHq+IMgCbRJnj23qs/K2vgKA5OxBG9oGLFAncbtMCKs64NIseh0jb+l/MDPUlGi4aBJGORd2nS0eaLf7aLrisfwleXTGUqWtNvChUdRg0UYA/tiWeKKeOnNXZvhVhMVZUgXsD6+xcbx885XpnbiCLu5w8U4p43lIi4DlErLOy+/bkALhTLH8S9XCAGTvv5j+z9P1ZSgLo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(83080400001)(81166007)(21615005)(8936002)(166002)(47076004)(478600001)(5660300002)(82310400003)(356005)(86362001)(33656002)(6506007)(4326008)(8676002)(9686003)(70586007)(7696005)(53546011)(316002)(52536014)(966005)(110136005)(82740400003)(336012)(19627405001)(26005)(186003)(30864003)(55016002)(70206006)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 10:15:50.8120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c62e92-dc2c-4acc-6e7c-08d86e97cb9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4499
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0801MB2038207620081E154446C8E98D070DB6PR0801MB2038_"

--_000_DB6PR0801MB2038207620081E154446C8E98D070DB6PR0801MB2038_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

For qemuarm64-secureboot, trusted-firmware-a needed 1024MB of memory to ope=
rate when using u-boot, so an override was provided in the machine configur=
ation. This is because the default BL33 load address is set to 512MB, so u-=
boot always ends up overflowing without increasing the memory available.

There is a possibility that this load address could be set lower later (ht=
tps://lists.denx.de/pipermail/u-boot/2020-September/427616.html) but for no=
w this patch is needed to make core-image-sato work on qemuarm64-secureboot=
.
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: 08 October 2020 23:11
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Brett Warren <Brett.Warren@arm.com>; openembedded-core@lists.openembed=
ded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default =
strengths

someone may decide to allocate large amount of RAM to the machine as a
distro policy so images should not be overwriting that unless its less
than what it requires to run,

On Thu, Oct 8, 2020 at 3:01 PM Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>
> Can you provide a bit more context? Why is that setting desirable to hav=
e in meta-arm's machine definition?
>
> The problem with setting QB_MEM in machine configurations is that differ=
ent images need completely different amounts of memory; for some (such as p=
test images) even 1024 is not enough, for others (core-image-minimal) 256 i=
s plenty. The right place to set this is in the image recipes, with qemuboo=
t class providing the smallest possible default.
>
> Alex
>
> On Thu, 8 Oct 2020 at 13:51, Brett Warren <Brett.Warren@arm.com> wrote:
>>
>> Do you mean instead of the machine configuration changing QB_MEM, it sh=
ould be done via another image recipe?
>>
>> For context, I'm trying to enable the following line in qemuarm.confv (=
meta-arm):
>>
>> QB_MEM =3D "-m 1024"
>>
>> This is prevented by core-image-sato.bb overriding it instead.
>>
>> Brett
>> ________________________________
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>> Sent: 08 October 2020 12:36
>> To: Brett Warren <Brett.Warren@arm.com>
>> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org>
>> Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM defau=
lt strengths
>>
>> Isn=92t it better to just make a custom image recipe instead?
>>
>> Alex
>>
>> On Thu 8. Oct 2020 at 12.53, Brett Warren <brett.warren@arm.com> wrote:
>>
>> Previously, to satisfy opengl's requirement for at least 512MB
>> of memory, QB_MEM was overriden by core-image-sato. This made it
>> impossible for machine configurations to specify their own values,
>> so this was changed to a default asssignment. To accomodate this,
>> qemuboot's default assignment of QB_MEM was changed to the week
>> variant.
>>
>> Signed-off-by: Brett Warren <brett.warren@arm.com>
>> ---
>>  meta/classes/qemuboot.bbclass               | 2 +-
>>  meta/recipes-sato/images/core-image-sato.bb | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbcl=
ass
>> index d8f62ef6ea..8e4ee9e49b 100644
>> --- a/meta/classes/qemuboot.bbclass
>> +++ b/meta/classes/qemuboot.bbclass
>> @@ -73,7 +73,7 @@
>>  # IMAGE_CLASSES +=3D "qemuboot"
>>  # See "runqemu help" for more info
>>
>> -QB_MEM ?=3D "-m 256"
>> +QB_MEM ??=3D "-m 256"
>>  QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null"
>>  QB_DEFAULT_KERNEL ?=3D "${KERNEL_IMAGETYPE}"
>>  QB_DEFAULT_FSTYPE ?=3D "ext4"
>> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes=
-sato/images/core-image-sato.bb
>> index 673106eb6d..ec5e2e20fc 100644
>> --- a/meta/recipes-sato/images/core-image-sato.bb
>> +++ b/meta/recipes-sato/images/core-image-sato.bb
>> @@ -11,5 +11,5 @@ inherit core-image
>>  TOOLCHAIN_HOST_TASK_append =3D " nativesdk-intltool nativesdk-glib-2.0=
"
>>  TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D " nativesdk-intlt=
ool nativesdk-glib-2.0"
>>
>> -QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512"=
, "-m 256", d)}'
>> +QB_MEM ?=3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512=
", "-m 256", d)}'
>>  QB_MEM_qemumips =3D "-m 256"
>> --
>> 2.17.1
>>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
>
>
>=20
>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.

--_000_DB6PR0801MB2038207620081E154446C8E98D070DB6PR0801MB2038_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-=
1252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
For qemuarm64-secureboot, trusted-firmware-a needed 1024MB of memory to op=
erate when using u-boot, so an override was provided in the machine configu=
ration. This is because the default BL33 load address is set to 512MB, so u=
-boot always ends up overflowing
 without increasing the memory available.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
There is a possibility that this load address could be set lower later (<a=
 href=3D"https://lists.denx.de/pipermail/u-boot/2020-September/427616.html"=
 id=3D"LPlnk366421">https://lists.denx.de/pipermail/u-boot/2020-September/4=
27616.html</a>) but for now this patch
 is needed to make core-image-sato work on qemuarm64-secureboot.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khe=
m@gmail.com&gt;<br>
<b>Sent:</b> 08 October 2020 23:11<br>
<b>To:</b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Cc:</b> Brett Warren &lt;Brett.Warren@arm.com&gt;; openembedded-core@li=
sts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM d=
efault strengths</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">someone may decide to allocate large amount of RA=
M to the machine as a<br>
distro policy so images should not be overwriting that unless its less<br>
than what it requires to run,<br>
<br>
On Thu, Oct 8, 2020 at 3:01 PM Alexander Kanavin &lt;alex.kanavin@gmail.co=
m&gt; wrote:<br>
&gt;<br>
&gt; Can you provide a bit more context? Why is that setting desirable to =
have in meta-arm's machine definition?<br>
&gt;<br>
&gt; The problem with setting QB_MEM in machine configurations is that dif=
ferent images need completely different amounts of memory; for some (such a=
s ptest images) even 1024 is not enough, for others (core-image-minimal) 25=
6 is plenty. The right place to set
 this is in the image recipes, with qemuboot class providing the smallest =
possible default.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Thu, 8 Oct 2020 at 13:51, Brett Warren &lt;Brett.Warren@arm.com&gt=
; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Do you mean instead of the machine configuration changing QB_MEM,=
 it should be done via another image recipe?<br>
&gt;&gt;<br>
&gt;&gt; For context, I'm trying to enable the following line in qemuarm.c=
onfv (meta-arm):<br>
&gt;&gt;<br>
&gt;&gt; QB_MEM =3D &quot;-m 1024&quot;<br>
&gt;&gt;<br>
&gt;&gt; This is prevented by core-image-sato.bb overriding it instead.<br=
>
&gt;&gt;<br>
&gt;&gt; Brett<br>
&gt;&gt; ________________________________<br>
&gt;&gt; From: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&gt;&gt; Sent: 08 October 2020 12:36<br>
&gt;&gt; To: Brett Warren &lt;Brett.Warren@arm.com&gt;<br>
&gt;&gt; Cc: openembedded-core@lists.openembedded.org &lt;openembedded-cor=
e@lists.openembedded.org&gt;<br>
&gt;&gt; Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM=
 default strengths<br>
&gt;&gt;<br>
&gt;&gt; Isn=92t it better to just make a custom image recipe instead?<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Thu 8. Oct 2020 at 12.53, Brett Warren &lt;brett.warren@arm.co=
m&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Previously, to satisfy opengl's requirement for at least 512MB<br=
>
&gt;&gt; of memory, QB_MEM was overriden by core-image-sato. This made it<=
br>
&gt;&gt; impossible for machine configurations to specify their own values=
,<br>
&gt;&gt; so this was changed to a default asssignment. To accomodate this,=
<br>
&gt;&gt; qemuboot's default assignment of QB_MEM was changed to the week<b=
r>
&gt;&gt; variant.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Brett Warren &lt;brett.warren@arm.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; meta/classes/qemuboot.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt;&gt;&nbsp; meta/recipes-sato/images/core-image-sato.bb | 2 +-<br>
&gt;&gt;&nbsp; 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboo=
t.bbclass<br>
&gt;&gt; index d8f62ef6ea..8e4ee9e49b 100644<br>
&gt;&gt; --- a/meta/classes/qemuboot.bbclass<br>
&gt;&gt; +++ b/meta/classes/qemuboot.bbclass<br>
&gt;&gt; @@ -73,7 +73,7 @@<br>
&gt;&gt;&nbsp; # IMAGE_CLASSES +=3D &quot;qemuboot&quot;<br>
&gt;&gt;&nbsp; # See &quot;runqemu help&quot; for more info<br>
&gt;&gt;<br>
&gt;&gt; -QB_MEM ?=3D &quot;-m 256&quot;<br>
&gt;&gt; +QB_MEM ??=3D &quot;-m 256&quot;<br>
&gt;&gt;&nbsp; QB_SERIAL_OPT ?=3D &quot;-serial mon:stdio -serial null&quo=
t;<br>
&gt;&gt;&nbsp; QB_DEFAULT_KERNEL ?=3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
&gt;&gt;&nbsp; QB_DEFAULT_FSTYPE ?=3D &quot;ext4&quot;<br>
&gt;&gt; diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/r=
ecipes-sato/images/core-image-sato.bb<br>
&gt;&gt; index 673106eb6d..ec5e2e20fc 100644<br>
&gt;&gt; --- a/meta/recipes-sato/images/core-image-sato.bb<br>
&gt;&gt; +++ b/meta/recipes-sato/images/core-image-sato.bb<br>
&gt;&gt; @@ -11,5 +11,5 @@ inherit core-image<br>
&gt;&gt;&nbsp; TOOLCHAIN_HOST_TASK_append =3D &quot; nativesdk-intltool na=
tivesdk-glib-2.0&quot;<br>
&gt;&gt;&nbsp; TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D &quot;=
 nativesdk-intltool nativesdk-glib-2.0&quot;<br>
&gt;&gt;<br>
&gt;&gt; -QB_MEM =3D '${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &q=
uot;opengl&quot;, &quot;-m 512&quot;, &quot;-m 256&quot;, d)}'<br>
&gt;&gt; +QB_MEM ?=3D '${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &=
quot;opengl&quot;, &quot;-m 512&quot;, &quot;-m 256&quot;, d)}'<br>
&gt;&gt;&nbsp; QB_MEM_qemumips =3D &quot;-m 256&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; IMPORTANT NOTICE: The contents of this email and any attachments =
are confidential and may also be privileged. If you are not the intended re=
cipient, please notify the sender immediately and do not disclose the conte=
nts to any other person, use it for any
 purpose, or store or copy the information in any medium. Thank you.<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DB6PR0801MB2038207620081E154446C8E98D070DB6PR0801MB2038_--
