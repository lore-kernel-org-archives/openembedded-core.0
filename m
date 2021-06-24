Received: from mail-gw4.it.volvo.com (mail-gw4.it.volvo.com [192.138.117.78])
 by mx.groups.io with SMTP id smtpd.web08.3757.1624515827397172521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 23:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: consultant.volvo.com, ip: 192.138.117.78, mailfrom: sander.visser.2@consultant.volvo.com)
IronPort-SDR: ZaSb7jhad9jgm+/3p4ZCzO+UDNlELGRxJUntp8D5i3EWAYieWX7V7jbjELpYdgvwSGSLaV+prj
 oTsFdt8a++Fw==
X-IronPort-AV: E=Sophos;i="5.83,295,1616454000"; 
   d="scan'208,217";a="143669918"
X-Amp-Result: SKIPPED(no attachment in message)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXaTMVtUB9wSH7SxQm7KTX16vGzXa0N2jHpTjDPBMewNDkAuC9LQw7elGu2UIWUChTwxco5w5o+gIdOlYtChVEIjAQfOM14dKws1VzYRVFhZO4bnsEtDaxSq5IjW4iqtR811XQGo4iwk+F4xDdd/rUuRHjpm9OYoTpHqo9+6Lt9xlTopdAiEzp7vALra4R+n/E1uoeKskDJYZMK9oU3VcWdPKkuxEQvmXQcy6vsFONqtS/k53V6Y22n49r1HBNAKInoqW/bBOlcuFKv0pcTAzcOfYDPEb1LrHOQ6RtFw1soxrZ0oqrw4y1TxpMmJKacHksKqn3rYFgvoLRD9LxnQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43BlyY7FDHfhg5ecUu8jye0l9P49S2SiDpqT6BsuN3g=;
 b=JUrtzybygNL2hucBUY5qY8MCO3lJjb7pSxk48m6ySbdDFoHyVXd4Hfga22C4viyVvlsjzpdhMge4Gynz9Qjxf6gu9UvATA98Vv5IIq87nGeIb+2T9Dt8rslQqAliTZEn1f2hx9hZcgE1B+HNzbwjggPyiz3kxkjXWPotTcN3Mq2AhYLX0SQDbzwZUIzUSBET+G5sHQknn0vqnFJWsmf+NNnVdcyXJaUkUKRdzXIZQrKf8RnXjc9wkbMjmwXFG5iEisG/roDKqOCneG6ST8gTQAbgjkahgW68HTsIq88lEzZPcECB4FdXblN3H/xwIJ920CywSZdisXg0zD7BRsnYcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=consultant.volvo.com; dmarc=pass action=none
 header.from=consultant.volvo.com; dkim=pass header.d=consultant.volvo.com;
 arc=none
From: "Sander Visser" <sander.visser.2@consultant.volvo.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Curl CVE-2021-22876 backport in hardknott
Thread-Topic: Curl CVE-2021-22876 backport in hardknott
Thread-Index: AddowXoZJo54LY/gRJuZdOeZFV4Z/w==
Date: Thu, 24 Jun 2021 06:23:43 +0000
Message-ID: <AM9PR05MB8794557053459960C7945AC4C5079@AM9PR05MB8794.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_19540963-e559-4020-8a90-fe8a502c2801_Enabled=true;
 MSIP_Label_19540963-e559-4020-8a90-fe8a502c2801_SetDate=2021-06-24T06:23:24Z;
 MSIP_Label_19540963-e559-4020-8a90-fe8a502c2801_Method=Standard;
 MSIP_Label_19540963-e559-4020-8a90-fe8a502c2801_Name=19540963-e559-4020-8a90-fe8a502c2801;
 MSIP_Label_19540963-e559-4020-8a90-fe8a502c2801_SiteId=f25493ae-1c98-41d7-8a33-0be75f5fe603;
 MSIP_Label_19540963-e559-4020-8a90-fe8a502c2801_ActionId=9198a4b5-5786-4a87-8404-546991490733;
 MSIP_Label_19540963-e559-4020-8a90-fe8a502c2801_ContentBits=0
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=consultant.volvo.com;
x-originating-ip: [192.157.9.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd011691-a09f-4884-1ad8-08d936d89d69
x-ms-traffictypediagnostic: AM9PR05MB8889:
x-microsoft-antispam-prvs: <AM9PR05MB8889DCC1F4E06B7A0559C65CC5079@AM9PR05MB8889.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XQofC9kfnRPDsU/NNTwCeIIT4rQ/sg6nBrbAzENTz7HAyRNPDdKSimFkALnmMIjlae/rJJbIXAZ1pFTkjgCM9o9wN43neFMvBNgnXNk7LyXyM1dt5WRTNeGdN2Nut+ngK/3GPlPlknJykVRRytUI+EPy5n/s6BdJ3yeEMOalvmxmmQPyfRcUgP4QjLTGLX9ft/EXauPc5Q8UYYdygohJxkZeSv+Uew6kKwEqQcF6iYF/y6LeCBI3zaqsL65BXA44lxNWfbEMhezVKscST1NXHFZWhKc2Tq0SeE7WDcyVVGS5yLMeE9iHEn+twqr2dOVTx4ry12qqCiqfN+jMJiQCBZgjcbaWPt5YhqW6AwQ3jMFpVfKB+c3aug2PK9Eza0fOYt0bACijCQHjlPVVL+JQXvIu9KLWhmjzwVPvBn8kzVWXJqurFVMWD39/NGzvlyV2nQ4oBwVOGy7xv4Dzl8yIURJCH5qh4/IC5PhwlDzqsFJvx2Cgr0SY4JCZWm2P1qA1D/x77TG1GYbm4KxTklxiT7C5ke99pig/qqDCspfdVg79GcBS6kRwAOPp8JwSg/0so3zUIb5OWyGONxhiMOvJEmgcCPDY+EgOv+DIRglteS7tA3BOFy5AaTSDPz37kJWtgYsITfT+SAdP21d2yTAPHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR05MB8794.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(66446008)(76116006)(64756008)(66556008)(66476007)(9686003)(86362001)(55016002)(66946007)(6506007)(33656002)(9326002)(5660300002)(38100700002)(71200400001)(7696005)(8936002)(2906002)(26005)(83380400001)(8676002)(966005)(52536014)(478600001)(4744005)(186003)(122000001)(6916009)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+HL87nOvulShtlUd1K2JbH8cToW1W7+9BrXOmpaL0TwxewswP7KTD20+UsUe?=
 =?us-ascii?Q?3Ce36BguBgoUrlGjutfzgDwPDAlhD3+7qoXXwKTu1l3w5lX77bGlHokOrLra?=
 =?us-ascii?Q?ba8XjJ/GT6YXI0BJsVigxFTBEFJPHsAU2pHmFvg+VCqiK1uRJ2Un6Z8QAXEi?=
 =?us-ascii?Q?YXeVYqkAMYO3FHiU/m2UCkrWHlZQuLU1Tz1Y7iy4C7sr6xF91koWx3TjM3Sc?=
 =?us-ascii?Q?gq1Dxhmd16L44KjV87eIZhhavSmvimztbitd4NOpNdU+oLquvPfd27IJSXqZ?=
 =?us-ascii?Q?Yy6axCySmbNdbqLt44s/fL+j6C9ak/RY7DkMGS+QoQk7WX21dkBr746IN3sY?=
 =?us-ascii?Q?jdHB9hcMiOWbS8VZzAZw1AQhb0o5sHqCkahyUEvglIUhzk58sdT9uDqoOKqg?=
 =?us-ascii?Q?XkyJBO6Eyytbw72HGRw7Xiylpwlkd2b9DUwT+S9MeE1tiaDE6GnxW0UYc/Sy?=
 =?us-ascii?Q?/qbgjq3tevudP/JiJ9b90GCWltHCN4aKlh5fXkNMQ05TykD/IWJ7y1FET0lk?=
 =?us-ascii?Q?Y0Pv5UrdY3FIobahYgcAN0PPWuRxP8RJcnS3XcyiCDFvpJTenwOPZ1yJ10Z3?=
 =?us-ascii?Q?b4Q26diuVUQscAAEWnrmZo79z7HRiL2QNC/ZvNb9g0LhH3h6xauB1izXOPWh?=
 =?us-ascii?Q?+h4XcwYTAbyy66ry3uZGLc0zfpQQGKI/oF5SciNhe56lNl+pNS74fzRw7sSS?=
 =?us-ascii?Q?dWavCc1lW3ob/oBTJ5nJxmVHI/S2AFlTqx+2hS0hb5nGq0GWFXB5M31kI2W6?=
 =?us-ascii?Q?GMjqavJv9v6/19YGqGAQOBdYV9l6dwZi9T/UrdWm4KpX+pexqbVtWIox90Mk?=
 =?us-ascii?Q?f8wH/9qm4H/vuTqaTRWauX2gUjwg46n07bcZDMQae9ak58H8czlkvBRNKbhA?=
 =?us-ascii?Q?FC+Z7BSDYR0+QKG/HIo9EHddnWxhGnQqV6wdxUnG3uUdFMLpDBrh8csI98Eo?=
 =?us-ascii?Q?CSf33PzvS6d5/+lFDG/+oygl8i6Wm9pb8Ug+PkglqCD4JopeSWh6pSmA1mRW?=
 =?us-ascii?Q?A3J+o1PrBJEoHxl6XUCDHeshuFgLTV+YcziS1RDskLUGLlAanfdd8GYqY5x+?=
 =?us-ascii?Q?PwzqJQN2zcruxR59UvQRQOwRW7YjeNy6YdOiJ7277uLBRgbZL19RsdpNMpWe?=
 =?us-ascii?Q?7edEQlAcX5DspvU9tFwQeFPM3tmE5/P67I3VQNl5U4enMZ7wl5CUs1GMwQDQ?=
 =?us-ascii?Q?1e+/XFDCUsiepbmSHebR1YeGia6vWkgbpxYZSuxPOoL33gqgeYZUL2ycU/hJ?=
 =?us-ascii?Q?7jzpyhqRmb06B0vZg1KzyZOiIj4Ob1CAbNzy/SsGciMmjYavW8wcLJQq8X7V?=
 =?us-ascii?Q?Di3nhPc9gIimFJkXEEcO6wL7?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR05MB8794.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd011691-a09f-4884-1ad8-08d936d89d69
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 06:23:43.0964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f25493ae-1c98-41d7-8a33-0be75f5fe603
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRqqXfy5fauqlTOspJBpon7si07g4lsMfVPCSR8e0EKpaprtDxWBzte1ry61IacpZz3cDOlJo6y1efQfYwIq+dGAKD18n2pQEfjc0czmoW55wd7rN/LB3OJrioxsQuWz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR05MB8889
Return-Path: sander.visser.2@consultant.volvo.com
X-OriginatorOrg: consultant.volvo.com
X-PassedThroughOnPremises: Yes
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM9PR05MB8794557053459960C7945AC4C5079AM9PR05MB8794eurp_"

--_000_AM9PR05MB8794557053459960C7945AC4C5079AM9PR05MB8794eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

0002-transfer-strip-credentials-from-the-auto-referer-hea.patch does not al=
low building of Curl without PACKAGECONFIG "proxy"

/Regards Sander

This email message (including its attachments) is confidential and may cont=
ain privileged information and is intended solely for the use of the indivi=
dual and/or entity to whom it is addressed. If you are not the intended rec=
ipient of this e-mail you may not disseminate, distribute or copy this e-ma=
il (including its attachments), or any part thereof. If this e-mail is rece=
ived in error, please notify the sender immediately by return e-mail and ma=
ke sure that this e-mail (including its attachments), and all copies thereo=
f, are immediately deleted from your system. Please further note that when =
you communicate with us via email or visit our website we process your pers=
onal data. See our privacy policy for more information about how we process=
 it: https://www.volvogroup.com/en-en/privacy.html

--_000_AM9PR05MB8794557053459960C7945AC4C5079AM9PR05MB8794eurp_
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">0002-transfer-strip-credentials-from-the-auto-refere=
r-hea.patch does not allow building of Curl without PACKAGECONFIG &#8220;pr=
oxy&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/Regards Sander<o:p></o:p></p>
</div>
<br>
<div style=3D"font-size:8pt; color:#333333; font-style: 'italic';  font-fam=
ily: 'Arial';">
This email message (including its attachments) is confidential and may cont=
ain privileged information and is intended solely for the use of the indivi=
dual and/or entity to whom it is addressed. If you are not the intended rec=
ipient of this e-mail you may not
 disseminate, distribute or copy this e-mail (including its attachments), o=
r any part thereof. If this e-mail is received in error, please notify the =
sender immediately by return e-mail and make sure that this e-mail (includi=
ng its attachments), and all copies
 thereof, are immediately deleted from your system. Please further note tha=
t when you communicate with us via email or visit our website we process yo=
ur personal data. See our privacy policy for more information about how we =
process it: https://www.volvogroup.com/en-en/privacy.html
</div>
</body>
</html>

--_000_AM9PR05MB8794557053459960C7945AC4C5079AM9PR05MB8794eurp_--
