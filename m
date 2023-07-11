Return-Path: <heiko.thole@entwicklung.eq-3.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EABBEB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 11:13:09 +0000 (UTC)
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (DEU01-BE0-obe.outbound.protection.outlook.com [40.107.127.75])
 by mx.groups.io with SMTP id smtpd.web10.4931.1689073986748679964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 04:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: entwicklung.eq-3.de, ip: 40.107.127.75, mailfrom: heiko.thole@entwicklung.eq-3.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBguv3Y4OKnK5xFUL/NDCl9TdezMQPpyc6ai16XPFNXyvwMFaSdP7DkSBjDVsUWEDuSWmFixvdO7NnUTMMe05aaykTcQSSXydrnOTK0bA12aqQJNlYwfMl0hL2efwhwa34EBBmeYt41R6DsPnFMYtNAFQzVMyObPTQ2/qEGICmCUkaUXJKup3IhxyCFxv+Jo32LTVLlrHVp6zpeyjpqk+p55DhIAYp2b79WcAZEUC2/iVq3mN30J+9TWkyx1vZJK5mpwrPqUJ/hIxpNZEci5Ldi1dPjmUcJxWjqEwXkFVuRJHFXwtX/D0vydoZEulSQjYiC+20DBjgrabpGy91pFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfmSFfRlRSGDnIR44+sZmaJsEn1XAjgBh8qzFEqGmew=;
 b=jVLnEpMJ1ek8ONQKGSf2uCMVrZzCHuPtLfsjlIMt6baLQt9rGVfi58d2wgdAAG/+j1mJhKGm/QjxBTMkdDy7KI/f49utF2xQUwVSTj21iWMtdQ0VHcj+aRNxw9M7DUMS8FCdXjN7bEtufRgI9sC+fVCDhfep3jQXbFBrhnQbxyar7Sjjkmvu06QdywW7rEwYCG8UDySDrPzRYy3qc28ubN6RAEq+br3oUFSkk8un6uOvI3HZMKv8evzTVOaCK4vSl1EQVEzdE+TbZiTmihYZOr06U9Ue6wQiat/gt0dtYkCwxb3XadVdkeO75Lf76Hkq1Ehwur9PgdeI6hPXuteUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=entwicklung.eq-3.de; dmarc=pass action=none
 header.from=entwicklung.eq-3.de; dkim=pass header.d=entwicklung.eq-3.de;
 arc=none
Received: from BE0P281MB0242.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:11::14)
 by BE1P281MB2788.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 11:13:02 +0000
Received: from BE0P281MB0242.DEUP281.PROD.OUTLOOK.COM
 ([fe80::319:fb1e:c315:4cff]) by BE0P281MB0242.DEUP281.PROD.OUTLOOK.COM
 ([fe80::319:fb1e:c315:4cff%3]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 11:13:02 +0000
From: "Thole, Heiko" <Heiko.Thole@entwicklung.eq-3.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Steve Sakoman <steve@sakoman.com>
Subject: WIC: erofs-utils-native: Cherrypick commit from master to #kirkstone
Thread-Topic: WIC: erofs-utils-native: Cherrypick commit from master to
 #kirkstone
Thread-Index: Admz6JFIt82vV01qTLeW+nwPwWBXJQ==
Date: Tue, 11 Jul 2023 11:13:02 +0000
Message-ID: 
 <BE0P281MB024249FEF2246FD96803CEE9BC31A@BE0P281MB0242.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=entwicklung.eq-3.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BE0P281MB0242:EE_|BE1P281MB2788:EE_
x-ms-office365-filtering-correlation-id: 26850cd0-a7b4-4376-3341-08db81ffcac9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UQKaOYGRdjRlR+nh9dgX6ctxIPGc0MZq88l2aodohW2Yhwulp8HkVrzGpK3+VeL+TwB/bkOERHe5437LhFvDovur6GM32po+DhNu9dDFBX8OlIidPJG2KrH/zf5B9tKEPNoofbkxY9Rm1IdcWcass0PlbZaddlF/cKxpMDz6nnD98XGzwh7nkjzRIAUrv/8elZFPi0NTroZgI1+plK3wxVE//Ym9B5uIokaKuLIkNRInJ0JQ+Oserdsp/HcsNIuf9pl4Vt2h9bos/oUEWl4lo/nkNy1Cz72SlWQpq/syLKjJPoX3jTTtIjU5WuZqAJI4bDM9T3Z598UWNh93ZQFVUpswsIlkA2VagEh7uXySTtq4Is9xirJ/BxjbgPXS1VXNjoaQgycniUYhQhslHpwGc7BtSWClQB+0vfFda4v3ghtl/gepyr92y+II/nnR+ZmK7q723kcwEQh5ZRDQ5g2jeyDHClFLZNDfeqm+lrgB93KFNqI68KT99OhLuufjMT9jnnG9c9HCliLjG3TxDFv6VIeRh62VOhvIgrEGF+ABkv4TgmklLgRXalEGzXIXhGJx7ETXaUfVCekJUTe3XScbOTj3TdQo/us9hFaSm55E+3j7j5HSDyLYh9Y/FXX62cr8jZLKRedQCV7te6jhuDpoRA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE0P281MB0242.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(451199021)(166002)(7696005)(71200400001)(478600001)(122000001)(52536014)(5660300002)(8676002)(8936002)(2906002)(4744005)(33656002)(86362001)(38070700005)(6916009)(4326008)(316002)(76116006)(55016003)(64756008)(66446008)(66476007)(38100700002)(66946007)(66556008)(41300700001)(26005)(6506007)(9686003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fEGQaJp9jJ7OXiyxc8nMpAr0sTy5FqkpdZaVFHxsn53RwVeJJyL4seAtwCHO?=
 =?us-ascii?Q?FRpk2Y2yTAhojQoO+G7wvW6bgSiggJ2/Bc+ox7yNUwSK5R4LjDebY4w/TJvF?=
 =?us-ascii?Q?5KsBKzR1l3MGl1ITOnZL00R/4QxnAzkdjBYdEl0ioHB9NVFD/qPVCUn/LEbI?=
 =?us-ascii?Q?OTr4ve8atUwbD0Bvc26l3pSdDb4A+yfXaMH0uWM6DHTiC2QTWeKFtF+JFtjf?=
 =?us-ascii?Q?I9/VeDRJE1v3ipl6xABkM0ejzArM7FpVD77B7Yf+5yzbW3BHedVfbC9kcA5H?=
 =?us-ascii?Q?SfE524ZJ0nAMtunJCO55MKXUVJE356bWauwSxqp8sFEJICclbD2DYr8WCtA6?=
 =?us-ascii?Q?e/iJciuftL2+YOTrzjMK+/17U4X+vbt4A0blJG075r//qAnk2qUToAWu3LQa?=
 =?us-ascii?Q?IklkAZFIjMwM4mdSYc3z0vZ/Gv6JQ0RADk7mhX8oapoePMSJUZHktJzCayUG?=
 =?us-ascii?Q?73JimZMk0t+5EkfpcuKYZe5W3Q/r87QP8KY19a150S0NPPxlb22oHmnAOFYZ?=
 =?us-ascii?Q?3dYW3lPytvh9VLxacIG/7oSyFqLkoExW+dkloZ00MtbGdvlHUovERSIF5B0Z?=
 =?us-ascii?Q?0J/uGv7k5zLoD2ajkwLeZvQdo1co5nh3P7Yf1Q81CMIvxrzV4RWFV3wMWt7I?=
 =?us-ascii?Q?6KwDWKkj9swZHrWSQ2Ka34zWTFanTBZ9SJk6xHDGfpWA3j2ISPuL6+5eF0SN?=
 =?us-ascii?Q?t3edQWF8c/Ny/C7N+ynyZPp76RHj1Z+d+Di0m/KZ37B/Ob3eTfbDwcu8lBST?=
 =?us-ascii?Q?8rP6V0Kb5pejfMVUWqH0F6uYsHBn6eKe2v8kgUaqmk6gOCt9Pk9jvTSHsnuG?=
 =?us-ascii?Q?Ml9KrNavVBhHw8zeeIejJkyRbz79PN+94Y11RbeMAbVBs/VF/34iB1mmAoSf?=
 =?us-ascii?Q?yp4VTj2Gt2Aa7gmYJJSILUH9GlrsKGOuK0Ax/GkMzRlnKqB2LSHSTBcKywMC?=
 =?us-ascii?Q?C0Yqv7xDoFIZWQOFzPWJzps2yMEiFpfs9n6hZlTQ0krE7r+0/MwAFHJeY+My?=
 =?us-ascii?Q?+2GgCjiQftpjrZVOrXHVaRnAUXAX87afV9kLwyTG1k2hJk4i91PMIkF9UNcM?=
 =?us-ascii?Q?EFbc/umLAEbSJ+pBN5ccpTPqVUWMxcbcmCfRHrNw1rvOurn/EWfCd4NO582+?=
 =?us-ascii?Q?LgUmZvFWdwyo/bNjN8mgMzibQBvtNC/z9ulavPXsszQp+7X2AjJ8mY+YNoZ5?=
 =?us-ascii?Q?qDWjKzPiJk7QMf+RY5aMcTB63ukoPsyz6ARvz+Li6YqDuDDqm9cokbRS9d9p?=
 =?us-ascii?Q?HTzQvk03S8OTiuh7Vp2U07+wFFUOKeyafRe2ou+ldqCzZ5sqp+h1AcNgt8Vt?=
 =?us-ascii?Q?m8QMUrf6+1ZIxWkJ+NQert4/T8fcpRKvDgforHXwHfjZobvFlnW9fRpVAW+E?=
 =?us-ascii?Q?PKk/TVMqZnZXx/HuH01ToPQnfMUDxTsMdUMrlDHcvgBv8XDq96rReZVAQlQS?=
 =?us-ascii?Q?WBirezy5eNZuIhL71Up1FN3I9xVYf1OlCaX1M4HXPqlBVTKfYCWwtwKuVkqx?=
 =?us-ascii?Q?IQCPui0celg7VZ5AnSobb7nfm0TnBb72UC0MT4y0x0yC6F05B3+Rz5n/Y/kq?=
 =?us-ascii?Q?bPC2AcumOhzsigv3E5P9ccTsX338IQOYGTDBmyTQ?=
Content-Type: multipart/alternative;
	boundary="_000_BE0P281MB024249FEF2246FD96803CEE9BC31ABE0P281MB0242DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: entwicklung.eq-3.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BE0P281MB0242.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 26850cd0-a7b4-4376-3341-08db81ffcac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 11:13:02.1719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6bb70bfd-56fb-4f95-99c8-16d0dd9d5592
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +LD90JsuyAaRIsR3iEm/Rjz8NURUEyke+6bseCSRq4sJFh6fzlcks5YzPig6GnmTkSXBLeGQ2qa2ItdV2Ec18g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2788
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 11:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184129

--_000_BE0P281MB024249FEF2246FD96803CEE9BC31ABE0P281MB0242DEUP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

we are using Yocto (Kirkstone) for a new device. We want to build an image =
which contains an erofs partition.
But bitbake shows the following error:
"Wic failed to find a recipe to build native mkfs.erofs. Please file a bug =
against wic."

The problem is already solved in the master branch in commit 4e9102a (https=
://git.yoctoproject.org/poky/commit/?id=3D4e9102a83cd2ac42c39f1d3153a1d3945=
e4668d5 ).

Is it possible, that you cherrypick the commit to the kirkstone branch?

Thanks and best regards,
Heiko


eQ-3 Entwicklung GmbH, Maiburger Str. 36, 26789 Leer
Gesch?ftsf?hrer: Prof. Heinz-G. Redeker
Registergericht: Amtsgericht Aurich, HRB 110388

eQ-3 AG, Maiburger Str. 29, 26789 Leer
Vorstand: Prof. Heinz-G. Redeker (Vorsitzender), Helga Redeker
Vorsitzende des Aufsichtsrats: Irmgard Keplin
Registergericht: Amtsgericht Aurich, HRB 200335

--_000_BE0P281MB024249FEF2246FD96803CEE9BC31ABE0P281MB0242DEUP_
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">Hello Steve,</span><span lang=3D"EN-US"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">&nbsp;</span><span lang=3D"EN-US"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">we are using Yocto (Kirkstone) for a new =
device. We want to build an image which contains an erofs partition.</span>=
<span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">But bitbake shows the following error:</s=
pan><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">&#8220;Wic failed to find a recipe to bui=
ld native mkfs.erofs. Please file a bug against wic.&#8221;</span><span lan=
g=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">&nbsp;</span><span lang=3D"EN-US"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">The problem is already solved in the mast=
er branch in commit 4e9102a (</span><span style=3D"font-family:&quot;Arial&=
quot;,sans-serif;color:#595959"><a href=3D"https://git.yoctoproject.org/pok=
y/commit/?id=3D4e9102a83cd2ac42c39f1d3153a1d3945e4668d5"><span lang=3D"EN-U=
S">https://git.yoctoproject.org/poky/commit/?id=3D4e9102a83cd2ac42c39f1d315=
3a1d3945e4668d5</span></a></span><span style=3D"font-family:&quot;Arial&quo=
t;,sans-serif;color:#595959">
<span lang=3D"EN-US">).</span></span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">&nbsp;</span><span lang=3D"EN-US"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">Is it possible, that you cherrypick the c=
ommit to the kirkstone branch?</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">&nbsp;</span><span lang=3D"EN-US"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">Thanks and best regards,</span><o:p></o:p=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#595959">Heiko</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:#595959"><o:p>&nbsp;</o:p></span></p>
</div>
<p style=3D"font-size:8px">eQ-3 Entwicklung GmbH, Maiburger Str. 36, 26789 =
Leer<br>
Gesch&auml;ftsf&uuml;hrer: Prof. Heinz-G. Redeker<br>
Registergericht: Amtsgericht Aurich, HRB 110388</p>
<p style=3D"font-size:8px">eQ-3 AG, Maiburger Str. 29, 26789 Leer<br>
Vorstand: Prof. Heinz-G. Redeker (Vorsitzender), Helga Redeker<br>
Vorsitzende des Aufsichtsrats: Irmgard Keplin<br>
Registergericht: Amtsgericht Aurich, HRB 200335</p>
</body>
</html>

--_000_BE0P281MB024249FEF2246FD96803CEE9BC31ABE0P281MB0242DEUP_--

