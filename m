Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web11.4883.1606299470495887261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 02:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=G9+zk9Vy;
 spf=pass (domain: siemens.com, ip: 40.107.22.62, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV1rkvrGhy67omCxfyM9/O34q+adeL4Kfhq+/FqITehxpT4f7bgU8hg5oIqQGM3aZErOSmbvU7pe8f+euZMLX0hBpk8iX0aZSQyndx7k6kC6/A0IT/kEPDikBQUxL1jOVjFyASalkcWdIhIBn0HEMOMZ8VFP9HUv74jPC7yCh3Dq0UDRYcAQnHtl/NL7Wl6pXQNm2AYPVd5xj4F4Cso9mc/Htw2bcAktH7LfnEE1iMj1NknsivPDJkb4JO4fuvqfoOOfYgFboxwP0ZNfabFy6Dg9z1OUDZj0pj381nR4GOAYSR1ygB1t97SqXginGHEamvTdHt7LLGJIIhyaVq9Ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcQx0kgw6z/IBd4UPDyR/CTQes22HVaVI3dQnlmEE3I=;
 b=gc9safiHfMu7ln2qKvr11V+kR0bnKXnNrlEaWtuxjZSo8WpekXj5UXN2etYlcuJy2/dTltno6Yj4PKg1R3dz75VuRGbIqbyTUfsjyCwSFpiO7pkta9aROMn5CcBAVzE9VtBS+wQcBWLmav1Mnx4BxlsoSvPc8j8hGaGvViu4/EYFBclWD+LqWoC9mZsQLsgOJBTlpaRk3erd4kqckB6uLP4agvqOINfGDA4u+WaA3f2ZsTubw1/TmMSUEMYqv5KyP3Lu0ioWj3prpV7+5K0Va9zFKXPnLBWHxaPrsUdDkI7UCTncbW2r2DI8o+lFchcJ+UG/3RNIjx+i3pe6vClc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcQx0kgw6z/IBd4UPDyR/CTQes22HVaVI3dQnlmEE3I=;
 b=G9+zk9Vy6gNHj/R9jHj4QZjesbU7mJ5xv9+6Td0D1u2IywJzSej8onBsp0adt41VsAj3Sc4W5r748g8HyjxFfJNm8pJN0UXNQQssvTEXKZAjRb/ClzxRzVxbyJCl1J9JxRUNfQuG3EITuq7tNtraMa4Ksn4CPZ1tAWeo/XFfVS0=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 10:17:47 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb%3]) with mapi id 15.20.3589.025; Wed, 25 Nov 2020
 10:17:47 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>
Subject: Error when building eSDK for a "linux-dummy"
Thread-Topic: Error when building eSDK for a "linux-dummy"
Thread-Index: AdbDE/O1+SckzD1QQfy3+6lqUg7xDg==
Date: Wed, 25 Nov 2020 10:17:47 +0000
Message-ID: 
 <DB8PR10MB3977EC83BB4D654A05D7615E92FA0@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-11-25T10:17:46Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=e9580770-0e07-4bd0-b09c-a5eb6fc6e2c7;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 67872d0f-b76b-41e6-e2be-08d8912b5b46
x-ms-traffictypediagnostic: DB7PR10MB2475:
x-microsoft-antispam-prvs: 
 <DB7PR10MB247518545892BC909792EC6992FA0@DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 54KYtBTnstCI3F2eyII9ISUisTgbyVESB/ccFvX/6C25Jbmt/yxJUTKaym4lSHKm+ygeTpRZIyYpEfuS3r8UzJD4PW7dRqiL2Q/J24+DEC18lEWfeZ9H5NJikq3vigW37tPq/cBR8U5z68rVNIjgj2kMt4GbIGl6rR2PTnguWFX67CRXrorWR3bDWSj8OojpyVhJfa+GZ9DmNaZZqCEvmoLoNJIhORnr8zlriosy2xHasBC7+qa3MfnTwfoFr0ygZvIiEyrTL2OrxyTDEWgY7X2gJ9EReXjBEgqBikGT1VJGZHtFxqMyk7xwqY0y7KQXop8pvBkvxV2kGu2Mw+CQPMskAFfP8sYdMlPCBO9PhU0FpNtnxQUmaudBTZ+oI+RfgXFIWgG1mpc3HMYualnPow==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(55236004)(316002)(52536014)(966005)(8676002)(6506007)(186003)(4326008)(5660300002)(478600001)(9326002)(8936002)(7696005)(166002)(26005)(9686003)(6916009)(55016002)(66476007)(33656002)(54906003)(66446008)(2906002)(71200400001)(558084003)(66556008)(86362001)(76116006)(64756008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?1B8bmQ1DRsn/W/bA5UYo2im2aqalLosvzEDHMUzociIpbnaA5iRr1OJFctHd?=
 =?us-ascii?Q?cjQWcVaCL9aIkfSdBDXGKcgaoinmc8+VS11pUgKrvOtzmjwi8j0a393Ksrru?=
 =?us-ascii?Q?W2afN4ZSd3wex45874aTfJnd5qsj0420TnGcd+ph0ylMKxbpI9CJm6zDm7WE?=
 =?us-ascii?Q?hsMhQs1E/uOTPnenYDIl+Yvpx9xeJEx288WeaSh43SjnociBReZHVM0N0hlI?=
 =?us-ascii?Q?oWHjzHr5pHlCbG2pI9pEY3+/qsS2LBRD+XUSLI00NBdKSOKwKqS3l4LXsQtE?=
 =?us-ascii?Q?pyVRqwT+D0U/gB/yMrGnmX7KQ4JdmJM5V2tWku4JiRq/E79YNmMiDuxiV3vd?=
 =?us-ascii?Q?ZpbnDW2ybV0xmRPUd0SAdlyqfLWD5INEFz9xMtlN/NX7AM9p1zwgG19E5yLl?=
 =?us-ascii?Q?AuuCUadA2elK3+4viVjboO48hM0d+In8NSMfeasrsLD4pxTQlkc3aOnAW3M3?=
 =?us-ascii?Q?tqSVu4wL80vWrZPcFVI5IUZp6H8G4jDSLTjUbFXXBBS7w/CnG7c/A8cIJlwc?=
 =?us-ascii?Q?sI9D7F18yT8lo04kF/gGiM6gvdsiYPNbSVKH9QQHiOc95+ed1KJ8hPUnem5M?=
 =?us-ascii?Q?j03mgUcBKGAHb6XPhxsL8hDUpkW159DL041Ck9p0k1fGahCwwkYVeOLIKo5s?=
 =?us-ascii?Q?t3BVE384N4C0MU+WyKLatYH8bK2DKWzKgszPCnL6HwH+qJwSW048cEM0nCpb?=
 =?us-ascii?Q?c1ATR6M8sjSz/IcbdxD+PbpRLoapES42wX5d1TupIc/uWsp++hW3IgdGfU0l?=
 =?us-ascii?Q?0HHkm7phyjNwOir5A/MlBJENwhWnlDbQm9/pUdu6nG6fQDWwyNO04fPg4Sf1?=
 =?us-ascii?Q?ZCKqnk/6e8TF+X2BNxijbWa+91a0TWQmk7BXknlmGpdVrD5dJ+MMPpht3Lgh?=
 =?us-ascii?Q?kLKD9Rn3MF+SwtrNfv4oxHHkt4rt5YDKPwTC//b/ayD1WWLkFtUunR00VcNG?=
 =?us-ascii?Q?B+/+N7kvY4gEcOOGvs6oONnD3NN3nvFbg/Dm7hqzm9A=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67872d0f-b76b-41e6-e2be-08d8912b5b46
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 10:17:47.2385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HrFTbcxqcQ24P636Im2+pw0EcX+91ezqsJZbs7+3tXdC9g7hU4Efzy8TVG07ZdDKV5C+iBPKvcxK0Cvi63RpJ5YX/SebjUerDkE4hLwTMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2475
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB8PR10MB3977EC83BB4D654A05D7615E92FA0DB8PR10MB3977EURP_"

--_000_DB8PR10MB3977EC83BB4D654A05D7615E92FA0DB8PR10MB3977EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

I was, that you were trying to figure you, what's going wrong with "linux-d=
ummy" kernel in eSDK case. Did you or somebody else find something?

I have the same problem as described here https://lists.yoctoproject.org/g/=
yocto/topic/78096462#51336.


Regards,
Andrej

--_000_DB8PR10MB3977EC83BB4D654A05D7615E92FA0DB8PR10MB3977EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Khem,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was, that you were trying to figure you, what&#821=
7;s going wrong with &#8220;linux-dummy&#8221; kernel in eSDK case. Did you=
 or somebody else find something?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have the same problem as described here <a href=3D=
"https://lists.yoctoproject.org/g/yocto/topic/78096462#51336">
https://lists.yoctoproject.org/g/yocto/topic/78096462#51336</a><span style=
=3D"color:black">.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Regards,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Andrej</span><o:p></o:p>=
</p>
</div>
</body>
</html>

--_000_DB8PR10MB3977EC83BB4D654A05D7615E92FA0DB8PR10MB3977EURP_--
