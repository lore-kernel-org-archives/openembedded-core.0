Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web12.10222.1602157897054899554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 04:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ur7vUjQn;
 spf=pass (domain: arm.com, ip: 40.107.20.63, mailfrom: brett.warren@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkxCxFesifHQ/xYZbd3yvWI5XHqAX0ms4rNAkjsb9/0=;
 b=Ur7vUjQnYuo2EdUXbIAJArt0S+bxnrd5LPzbAopinC7vKVybEk+FEr6NrpwI2NF4mDNyhppmcVXb3LYotplj4W8ULUU88a1RQ7h1FE9iOMuTDwVTDUcufhgVZejnHVQ3NBXkmt/weltslSP1UIz111DX+RKU+bHBNnN/DlgTuUg=
Received: from AM6P192CA0083.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::24)
 by HE1PR0802MB2378.eurprd08.prod.outlook.com (2603:10a6:3:c8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Thu, 8 Oct
 2020 11:51:34 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::c3) by AM6P192CA0083.outlook.office365.com
 (2603:10a6:209:8d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Thu, 8 Oct 2020 11:51:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Thu, 8 Oct 2020 11:51:34 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Thu, 08 Oct 2020 11:51:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3dcd3dd9013c08ab
X-CR-MTA-TID: 64aa7808
Received: from 2180467d064e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0A993777-4735-4775-886D-C2F43F2A6977.1;
	Thu, 08 Oct 2020 11:51:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2180467d064e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 08 Oct 2020 11:51:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcmNJ1AVk1h45A11BSPM9LTpzyWIJ8KxA37owSl6SZp6t8FvBlFHFGei00SxnLQ7FSZro9B3wWxi+KFOUu1fwXA2c4xFlli8z3ftBZfvIplgigav2oKKObxdqF2d6Jf0WpriLA7rMlWKtJGHPyqgfcAGyaiOqgbJ2NH/zhGIo7/VMQfiRI77awIFq/1fxXYzOVqvuNRMv3Re5b+WJwQTHlsCa8x5kCVH/QK/xgVmNNvwV73N0rt3dg5AHaAbuCBqgIjgyKABu6bOfOWKr8yqGclhhSJfmFflk7N8JlesJTTVdGJM8kj8F4nlTyP12SaXT08W6ZnXZ00orucS6d9pCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkxCxFesifHQ/xYZbd3yvWI5XHqAX0ms4rNAkjsb9/0=;
 b=FbRLdiMwZhpX/IFUBBDGLPPXY1Ss/MMw4UIwybAjbZa49sjEdi5DQjw/jNwzW/9YybO+l2SuCaUI5DsJCnc7o1BDPznDpo7vg74PImZJxZBoCmD2Kk/y0GROF0m1SnlQeUzC1rNjrEHSbz7DNB8nO6zVdv3PZwJsC5mnhozhwe56cXMgA/Vmy4HsOM3BvTeVUx9xzmGzsuXY4+0VmFK4c0WGJjF6CRe2JtvwcVQZ6TOyNHEMg/vVEJ1c/zPsedeZms5uJo4HRbsoXM8+EDoqjqmst4M/e6ZuIBX0i+xYgggBgGObS7ND5ofjJk3tQ53GHYJAv6jEYbIu9epRedyhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkxCxFesifHQ/xYZbd3yvWI5XHqAX0ms4rNAkjsb9/0=;
 b=Ur7vUjQnYuo2EdUXbIAJArt0S+bxnrd5LPzbAopinC7vKVybEk+FEr6NrpwI2NF4mDNyhppmcVXb3LYotplj4W8ULUU88a1RQ7h1FE9iOMuTDwVTDUcufhgVZejnHVQ3NBXkmt/weltslSP1UIz111DX+RKU+bHBNnN/DlgTuUg=
Received: from DB6PR0801MB2038.eurprd08.prod.outlook.com (2603:10a6:4:76::19)
 by DB6PR0801MB1765.eurprd08.prod.outlook.com (2603:10a6:4:38::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 8 Oct
 2020 11:51:21 +0000
Received: from DB6PR0801MB2038.eurprd08.prod.outlook.com
 ([fe80::446b:7bf2:5b39:f37b]) by DB6PR0801MB2038.eurprd08.prod.outlook.com
 ([fe80::446b:7bf2:5b39:f37b%10]) with mapi id 15.20.3455.024; Thu, 8 Oct 2020
 11:51:21 +0000
From: "Brett Warren" <brett.warren@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default strengths
Thread-Topic: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default
 strengths
Thread-Index: AQHWnWD+D5lzX03DCE2TzJMOyqp5SKmNk6eAgAAB61M=
Date: Thu, 8 Oct 2020 11:51:21 +0000
Message-ID: 
 <DB6PR0801MB203898E9E50E203D01B848C98D0B0@DB6PR0801MB2038.eurprd08.prod.outlook.com>
References: 
 <aNp1.1602154243596831287.CumO@lists.openembedded.org>,<CANNYZj9oAoE_Se7HPd3y=sce9Mak-6n9zEBqyxikZr8trgJQvw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9oAoE_Se7HPd3y=sce9Mak-6n9zEBqyxikZr8trgJQvw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:4b00:e031:2600:6dba:e15f:3b57:c0f]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d3f2ddf-4617-458f-220b-08d86b808141
x-ms-traffictypediagnostic: DB6PR0801MB1765:|HE1PR0802MB2378:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB2378EA3FE7BE81A16DED371F8D0B0@HE1PR0802MB2378.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ATNhsG6kElZM1gtG6y64jedF4tBG/KiRMig+XZsUZ9a1QacYDzL3iegaOPNgCCXccUuN8qfd2zzhwJ5Vnc9gvlrD+fPl0JYnjd6zhMz1tPxs4iGbHCBFif/BEhu6wyD2ixzzJXELxul1nIIlUWmFfGqKFpZSlrSQc/DOAwGqj3zt7eMOEfI/7RaVTx+hCOp5GODZ8sTXmd7fu5GMflsrYSlyGme/Tt97+OEr4cV4UhP5EYGztUdTLxSWI5+3pM94ZRfuvwzVTckqsKj7rF604m6ovYK7iHwpqW8M8NEtLPr2iJeXoDk+XW43sfqfUtGEu4W8TH0ki6w/vQbPyTzlDyrkmQwTyFSLhsNXNrvFv/HKFKDLThzqdBfzYxi0pGrLMQJ0Ol4gtkdG9mOXeU7S4w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2038.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(966005)(316002)(53546011)(4326008)(7696005)(478600001)(166002)(83080400001)(5660300002)(83380400001)(186003)(76116006)(33656002)(8936002)(52536014)(6506007)(2906002)(91956017)(9686003)(86362001)(19627405001)(71200400001)(6916009)(66446008)(64756008)(8676002)(66476007)(66556008)(66946007)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 rhZjEHFdjmePANXYbRZpmYbQumt0yfJCp9dX7rCYVIeQMJ9yrniWSPCGGcReFp9ioWVqCYcCZaj3b59HQjWSJwoi2XievlSpe53JGCxL6+TZaPrHs9J5m1mvhg0Vm5bPOxcIJmbZxwGoqVQOObtgPebvlZauhL/21mY/HFGtKlkc8L4myGaFw7Rw1nSp1+8ovhmeYSo+LZI9/tYJPkG4riNz23vq6nGY458gmomHiarW78m1GKpreMg+EgW6GzejkoU/7wWb6EoN49u8ol9whhJC5fSq/72LfcOl32k+BBNPTIr0LV5zdPDjetl/oUEwNr4uRdYWlYxoWLmU2y77Cu9hz9+BJo4bITqmznYwEFoPifZICM6lJJ9n/5cqiRhokYowK2pDsaZ5C5RDEkINgOF7MQoA3CVm/x7W2HwUp0Oq6dg3dKeFcCvYmEVv4cnK2PF3Pw6JbA5BkRaXxaLb6j+yc00GrOHV+WfVmDsd1ZGl2iKOycVjd9NZjCATPfUgt27dJEH23sjfbPz9cZOCfjCABkCdLgic+zVwcRWQYXYYTqW132CEAEgddYr17dvbdh+a324dh6n8kIogY6OmFntugPPjNdU4/LgyoROMFb20Sxslmuv3zz02DOHRPCj8QeWsvcmtlU+KgvA/R3xaYWlUilnIk48EE0qhh2cBISBYpVdTr7G+Cm5Tfaav3hPJOyJvJAoaWswtjNfNB8RnLw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1765
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Brett.Warren@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7c0f6f6d-b86f-4141-79c1-08d86b8079c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZYPHKiPO3GqIUrx3xviEhOMqMsBZxRIeWOzrxK9l48wYDwmnS48mS6V5CoXGlnxY0dI9hrYQClKxHdimgS+NNDqBtAe0RlPk4ONSotsRk5Qwra7+p8PR4jy4SchkgDGrL2e8RkUkraRN2m3ouVyHjxgrLAwrA2L9dR5/uR3qd8DLwefF/IBbyVJ/bpovckUROP9I1Y9TgVY5OV/A7HNsDYBh2yZSrLc6KZg/sH0PzPKRuzn9GW3+gw/0jdhJcqcTGtsGha+Whe9oD8ldKE8hLtJJ0PPKOr83SUN8vlJ2OaK2aaGA5KI1VCs8dq87QALU6faYLtlk6OORWbfGd9umVw2XXK1Xy2aallcnQ4WKlhxf45gRl9yF+QJEk5B904OlTMLjRTGLeacW+TDxlkOvsuVQnTwzrxA/DabSSlYpL+SVzHvCzdRAh2obYiLEjFjrFkq1dseyOOOyH+ERPtcuelbIajbd0Q5R3x6y82sHKT8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966005)(33656002)(7696005)(166002)(83380400001)(8676002)(81166007)(70206006)(83080400001)(70586007)(82740400003)(9686003)(36906005)(316002)(55016002)(356005)(336012)(47076004)(82310400003)(966005)(19627405001)(26005)(8936002)(6862004)(186003)(86362001)(6506007)(52536014)(53546011)(4326008)(478600001)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 11:51:34.0620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3f2ddf-4617-458f-220b-08d86b808141
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2378
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0801MB203898E9E50E203D01B848C98D0B0DB6PR0801MB2038_"

--_000_DB6PR0801MB203898E9E50E203D01B848C98D0B0DB6PR0801MB2038_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Do you mean instead of the machine configuration changing QB_MEM, it should=
 be done via another image recipe?

For context, I'm trying to enable the following line in qemuarm.confv (met=
a-arm):

QB_MEM =3D "-m 1024"

This is prevented by core-image-sato.bb overriding it instead.

Brett
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: 08 October 2020 12:36
To: Brett Warren <Brett.Warren@arm.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.open=
embedded.org>
Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default =
strengths

Isn=92t it better to just make a custom image recipe instead?

Alex

On Thu 8. Oct 2020 at 12.53, Brett Warren <brett.warren@arm.com<mailto:bre=
tt.warren@arm.com>> wrote:
Previously, to satisfy opengl's requirement for at least 512MB
of memory, QB_MEM was overriden by core-image-sato. This made it
impossible for machine configurations to specify their own values,
so this was changed to a default asssignment. To accomodate this,
qemuboot's default assignment of QB_MEM was changed to the week
variant.

Signed-off-by: Brett Warren <brett.warren@arm.com<mailto:brett.warren@arm.=
com>>
---
 meta/classes/qemuboot.bbclass               | 2 +-
 meta/recipes-sato/images/core-image-sato.bb<http://core-image-sato.bb> | =
2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index d8f62ef6ea..8e4ee9e49b 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -73,7 +73,7 @@
 # IMAGE_CLASSES +=3D "qemuboot"
 # See "runqemu help" for more info

-QB_MEM ?=3D "-m 256"
+QB_MEM ??=3D "-m 256"
 QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null"
 QB_DEFAULT_KERNEL ?=3D "${KERNEL_IMAGETYPE}"
 QB_DEFAULT_FSTYPE ?=3D "ext4"
diff --git a/meta/recipes-sato/images/core-image-sato.bb<http://core-image=
-sato.bb> b/meta/recipes-sato/images/core-image-sato.bb<http://core-image-s=
ato.bb>
index 673106eb6d..ec5e2e20fc 100644
--- a/meta/recipes-sato/images/core-image-sato.bb<http://core-image-sato.b=
b>
+++ b/meta/recipes-sato/images/core-image-sato.bb<http://core-image-sato.b=
b>
@@ -11,5 +11,5 @@ inherit core-image
 TOOLCHAIN_HOST_TASK_append =3D " nativesdk-intltool nativesdk-glib-2.0"
 TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D " nativesdk-intltool=
 nativesdk-glib-2.0"

-QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "=
-m 256", d)}'
+QB_MEM ?=3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", =
"-m 256", d)}'
 QB_MEM_qemumips =3D "-m 256"
--
2.17.1


IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.

--_000_DB6PR0801MB203898E9E50E203D01B848C98D0B0DB6PR0801MB2038_
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
Do you mean instead of the machine configuration changing QB_MEM, it shoul=
d be done via another image recipe?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
For context, I'm trying to enable the following line in qemuarm.confv (met=
a-arm):</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
QB_MEM =3D &quot;-m 1024&quot;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
This is prevented by core-image-sato.bb overriding it instead.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Brett<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &l=
t;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> 08 October 2020 12:36<br>
<b>To:</b> Brett Warren &lt;Brett.Warren@arm.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@=
lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM d=
efault strengths</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto">Isn=92t it better to just make a custom image recipe ins=
tead?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alex</div>
<div><br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu 8. Oct 2020 at 12.53, Brett=
 Warren &lt;<a href=3D"mailto:brett.warren@arm.com">brett.warren@arm.com</a=
>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bor=
der-left-width:1px; border-left-style:solid; padding-left:1ex; border-left-=
color:rgb(204,204,204)">
Previously, to satisfy opengl's requirement for at least 512MB<br>
of memory, QB_MEM was overriden by core-image-sato. This made it<br>
impossible for machine configurations to specify their own values,<br>
so this was changed to a default asssignment. To accomodate this,<br>
qemuboot's default assignment of QB_MEM was changed to the week<br>
variant.<br>
<br>
Signed-off-by: Brett Warren &lt;<a href=3D"mailto:brett.warren@arm.com" ta=
rget=3D"_blank">brett.warren@arm.com</a>&gt;<br>
---<br>
&nbsp;meta/classes/qemuboot.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&nbsp;meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" targe=
t=3D"_blank">core-image-sato.bb</a> | 2 +-<br>
&nbsp;2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass=
<br>
index d8f62ef6ea..8e4ee9e49b 100644<br>
--- a/meta/classes/qemuboot.bbclass<br>
+++ b/meta/classes/qemuboot.bbclass<br>
@@ -73,7 +73,7 @@<br>
&nbsp;# IMAGE_CLASSES +=3D &quot;qemuboot&quot;<br>
&nbsp;# See &quot;runqemu help&quot; for more info<br>
&nbsp;<br>
-QB_MEM ?=3D &quot;-m 256&quot;<br>
+QB_MEM ??=3D &quot;-m 256&quot;<br>
&nbsp;QB_SERIAL_OPT ?=3D &quot;-serial mon:stdio -serial null&quot;<br>
&nbsp;QB_DEFAULT_KERNEL ?=3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
&nbsp;QB_DEFAULT_FSTYPE ?=3D &quot;ext4&quot;<br>
diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb=
" target=3D"_blank">core-image-sato.bb</a> b/meta/recipes-sato/images/<a hr=
ef=3D"http://core-image-sato.bb" target=3D"_blank">core-image-sato.bb</a><b=
r>
index 673106eb6d..ec5e2e20fc 100644<br>
--- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" targe=
t=3D"_blank">core-image-sato.bb</a><br>
+++ b/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" targe=
t=3D"_blank">core-image-sato.bb</a><br>
@@ -11,5 +11,5 @@ inherit core-image<br>
&nbsp;TOOLCHAIN_HOST_TASK_append =3D &quot; nativesdk-intltool nativesdk-g=
lib-2.0&quot;<br>
&nbsp;TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D &quot; nativesd=
k-intltool nativesdk-glib-2.0&quot;<br>
&nbsp;<br>
-QB_MEM =3D '${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;openg=
l&quot;, &quot;-m 512&quot;, &quot;-m 256&quot;, d)}'<br>
+QB_MEM ?=3D '${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;open=
gl&quot;, &quot;-m 512&quot;, &quot;-m 256&quot;, d)}'<br>
&nbsp;QB_MEM_qemumips =3D &quot;-m 256&quot;<br>
-- <br>
2.17.1 <br>
<br>
<br>
</blockquote>
</div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DB6PR0801MB203898E9E50E203D01B848C98D0B0DB6PR0801MB2038_--
