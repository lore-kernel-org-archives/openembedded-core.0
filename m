Return-Path: <Yong.Lee@johnsonoutdoors.com>
X-Greylist: delayed 431 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Oct 2017 14:03:41 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.7])
	by mail.openembedded.org (Postfix) with ESMTP id 78B77606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 14:03:41 +0000 (UTC)
Received: from [216.82.251.38] by server-7.bemta-12.messagelabs.com id
	B4/41-02224-0964FE95; Tue, 24 Oct 2017 13:56:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBJsWRWlGSWpSXmKPExsVyQ2HLFt1+t/e
	RBm3nFSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owbHedYC14YVFxa2M3SwHhbu4uRi4NFYBaz
	xNU7DawgjpDAZCaJnaemMEM4hxglWvesZOxi5ORgEzCQ2NF/lgXEFhGIkri56xk7iC0sICVxc
	cIERoi4vMTW151sELaexNGNa8FqWARUJb58/wFm8wrESNw9vZYZxGYUEJP4fmoNE4jNLCAuce
	vJfDBbQkBAYsme88wQtqjEy8f/gK7jAKqPk2iabQoRlpc40HmCDcKWlbg0v5sR5GYJgUPsEpf
	3nIPq1ZPYOvEtI4TtK/Fh+RmoopmMEs9XnoYq0pKY3bEYqshKomPicVYIO1vi0OvHUPErrBI9
	J9UgbBmJibNmMEMMusQqsWv7ErAzhIAa3l75ywoLlbtXOhkhbBmJF3f2skJ8mSdxuuUXNCQEJ
	U7OfMIygVFtFlIAzEJSNgtJGURcR2LB7k9sELa2xLKFr5lh7DMHHjMhiy9gZF/FqFGcWlSWWq
	RrYqyXVJSZnlGSm5iZo2toaKSXm1pcnJiempOYVKyXnJ+7iRGYhuoZGBh3MF5eGH2IUZKDSUm
	U99/7d5FCfEn5KZUZicUZ8UWlOanFhxhlODiUJHi7Xd9HCgkWpaanVqRl5gATIkxagoNHSYQ3
	EiTNW1yQmFucmQ6ROsVozzFn760/TBwbbt4FkvvA5LOZrxuYhVjy8vNSpcR5A0HaBEDaMkrz4
	IbCEvglRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8M0Gm8GTmlcDtfgV0FhPQWbL2b0DOKk
	lESEk1ME63/yuyLu9rqoH9Qlcm0aCCz2F7t8rwzF9vuoj/7sxy/iNfJVds3p392Ntd94uBZ8f
	9WQbe95+/rmdd8/qpxtPzsjd/LJsqd+Q/V3WK6WRZEzOTbUujNePN91nNnnSD78Z9X7uPmpyK
	t2Z8Fq2bUKNUKb3kbNaycylTSxWXHnVMCwy9p+rBzqbEUpyRaKjFXFScCAA4ViY/2wMAAA==
X-Env-Sender: Yong.Lee@johnsonoutdoors.com
X-Msg-Ref: server-6.tower-163.messagelabs.com!1508853390!155805940!1
X-Originating-IP: [216.32.180.180]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 132087 invoked from network); 24 Oct 2017 13:56:31 -0000
Received: from mail-bn3nam01lp0180.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) (216.32.180.180)
	by server-6.tower-163.messagelabs.com with AES256-SHA256 encrypted SMTP;
	24 Oct 2017 13:56:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=johnsonoutdoorsinc.onmicrosoft.com; s=selector1-johnsonoutdoors-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=fhB2WrVHQzg1sC3xzOYPu3iYda2ImYmkw+eQ8QcNIP8=;
	b=QNGoy4Yr0H1ThE19NG46BVB3H9Ky7wA91sKsYQlW2BImQpJJKQK1nQoht1z24yURZ/75x71ZmDbYgUXKD3O3Izq1EAaJAlxCHHP7l3kd31C3Axj+LdfzA8GuQfDzRqZwzEixQFUl5sMIhfsGv47EE4+cp92DNyfWMbzu9VqJaWk=
Received: from SN1PR13MB0272.namprd13.prod.outlook.com (10.162.98.29) by
	SN1PR13MB0400.namprd13.prod.outlook.com (10.163.201.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.3; Tue, 24 Oct 2017 13:56:30 +0000
Received: from SN1PR13MB0272.namprd13.prod.outlook.com ([10.162.98.29]) by
	SN1PR13MB0272.namprd13.prod.outlook.com ([10.162.98.29]) with mapi id
	15.20.0178.003; Tue, 24 Oct 2017 13:56:30 +0000
From: "Lee, Yong" <Yong.Lee@johnsonoutdoors.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: GCC 4.9 and Morty
Thread-Index: AdNMzpQ2HTI1rJifRmC47v2zQhqE5A==
Date: Tue, 24 Oct 2017 13:56:29 +0000
Message-ID: <SN1PR13MB027295287B467702CA7967E692470@SN1PR13MB0272.namprd13.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [12.48.212.2]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN1PR13MB0400;
	6:wQvNRz0uWGGBHoChC5oPgU1BqFFm5JgoyE6I3CCVsPFU/xNVdq27jgLiMp9yjDx9ak6Dg3DTNXlGu4jD7jt+9rcgR0R72LkhPfUI/syYlqGHChPeEhYkl7xMSyMAX5gJqvtJ83I1LD4eG499RU9RbTun1CxXJ+ip8QaLwxnVPvHpesS+3LFYg84KpUdKXwBCd7xCwmvPvMh3XRy690LQYFUmVxR62bAoRHtaXnFeQ78kMWj3A7oCn0VZ1EZzrdX7W5Iw0RGQyf3U9ZKyYM3JbCi2xXpRKcFeFBCeesb8Sq/VVOEeVgF85ziTSRnapLtM7IHHgMQLQANBwWd32tNjKfpJsSsHcl9DICAOnJV/mZs=;
	5:9i8tcUJCvl2in3zyPIZQ9v4MRXwjLz6H1FeKCKqwEhlkrlE60/LiGfl2d6x8CirzysIjddPJfrGZP7eXg+Xy/NcKXOEX+FJGZ4a+7AqbB6ykmNOeueKJDNMIXQH27qTdyo4Iq7mMivRLq+QzVQ4JXCa62UFpgqde6/PMIEWSf3c=;
	24:HxVKH7nsbi+ytg28Kr8cBslj9Ok+wHtFTVER+Tp88SneFC4Az44drEa8jRjieLcvLnGazLsJkkhAughajJEKcJSYAL3uleLZBioSuL+S1rg=;
	7:dTBFQ/vF7CcdMbWj4YzaeYnL72VxeMmdpBNP+lDySnwN/LbGoOMiVBmdi86EzUa/4dJ57cqqlh57KU4Hg+e0FyIGNva6mXx5Sm8HvdKr/SAWjP+SbWUdcGMRiIj3jc6TwtwFDNtW0xYRbUKSwSYXRnQWkga8svGWKNhPAG+s4LUyR55XHvXxpZuSXvPP/eL5ldg02+QzWwHOUMCWmEaRZhiX7JdolnuIcI4Z55r5rsM7eDYyUAigUTvxNu4u/PRN
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: bb5d2cf6-aadb-4bd3-ad55-08d51ae70706
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:SN1PR13MB0400; 
x-ms-traffictypediagnostic: SN1PR13MB0400:
x-exchange-antispam-report-test: UriScan:(21748063052155);
x-microsoft-antispam-prvs: <SN1PR13MB040037EB2DDEBB0512590E6192470@SN1PR13MB0400.namprd13.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3231020)(3002001)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR13MB0400; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR13MB0400; 
x-forefront-prvs: 047001DADA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(346002)(39830400002)(376002)(189002)(85714005)(199003)(8676002)(6916009)(7696004)(77096006)(50986999)(33656002)(25786009)(68736007)(54356999)(54896002)(478600001)(53936002)(7116003)(72206003)(66066001)(81166006)(6306002)(99286003)(55016002)(74316002)(81156014)(9686003)(189998001)(7736002)(8936002)(105586002)(101416001)(3660700001)(2906002)(5660300001)(3280700002)(2900100001)(316002)(6506006)(6436002)(86362001)(102836003)(5640700003)(5890100001)(106356001)(2351001)(2501003)(97736004)(790700001)(14454004)(6116002)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR13MB0400;
	H:SN1PR13MB0272.namprd13.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: johnsonoutdoors.com does not
	designate permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: johnsonoutdoors.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5d2cf6-aadb-4bd3-ad55-08d51ae70706
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2017 13:56:29.9188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 16ab962a-71e7-495f-a8ed-d682f863e008
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR13MB0400
Subject: GCC 4.9 and Morty
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Oct 2017 14:03:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN1PR13MB027295287B467702CA7967E692470SN1PR13MB0272namp_"

--_000_SN1PR13MB027295287B467702CA7967E692470SN1PR13MB0272namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a bunch of apps that require an old version of GCC (4.9 or less).
There are a few versions of GCC available in my Morty based SDK.

build@6e35408e8fa5:~/tisdk/build$ bitbake-layers show-recipes gcc
WARNING: No recipes available for:
  /home/build/tisdk/sources/meta-openamp/recipes-bsp/device-tree/device-tre=
e-generation_%.bbappend
Parsing recipes..done.
=3D=3D=3D Matching recipes: =3D=3D=3D
gcc:
  meta-linaro-toolchain linaro-4.9
  meta-linaro-toolchain linaro-6.2
  meta                 6.2.0
  meta                 5.4.0
  meta-linaro-toolchain linaro-5.3
  meta-linaro-toolchain linaro-5.2

Immediately I have set the PREFERRED_VERSION of gcc to 4.9 but bitbake does=
 not go beyond configuration.

I believe 4.9 + morty combination has not been tested at all. I understand =
my apps need to get updated, but that's not my call.

Adam
The information in this email and any attachments may contain proprietary a=
nd confidential information that is intended for the addressee(s) only. If =
you are not the intended recipient, you are hereby notified that any disclo=
sure, copying, distribution, retention or use of the contents of this infor=
mation is prohibited. If you have received this email in error, please imme=
diately contact the sender and delete the email.

--_000_SN1PR13MB027295287B467702CA7967E692470SN1PR13MB0272namp_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
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
<p class=3D"MsoNormal">I have a bunch of apps that require an old version o=
f GCC (4.9 or less).<o:p></o:p></p>
<p class=3D"MsoNormal">There are a few versions of GCC available in my Mort=
y based SDK.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">build@6e35408e8fa5:~/tisd=
k/build$ bitbake-layers show-recipes gcc<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">WARNING: No recipes avail=
able for:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp; /home/build/tisdk/=
sources/meta-openamp/recipes-bsp/device-tree/device-tree-generation_%.bbapp=
end<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Parsing recipes..done.<o:=
p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=3D=3D=3D Matching recipe=
s: =3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span lang=3D"IT">gcc:<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span lang=3D"IT">&nbsp; =
meta-linaro-toolchain linaro-4.9<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span lang=3D"IT">&nbsp; =
meta-linaro-toolchain linaro-6.2<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span lang=3D"IT">&nbsp; =
meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 6.2.0<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span lang=3D"IT">&nbsp; =
meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 5.4.0<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span lang=3D"IT">&nbsp; =
meta-linaro-toolchain linaro-5.3<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span lang=3D"IT">&nbsp; =
</span>meta-linaro-toolchain linaro-5.2<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Immediately I have set the PREFERRED_VERSION of gcc =
to 4.9 but bitbake does not go beyond configuration.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I believe 4.9 &#43; morty combination has not been t=
ested at all. I understand my apps need to get updated, but that&#8217;s no=
t my call.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Adam<o:p></o:p></p>
</div>
The information in this email and any attachments may contain proprietary a=
nd confidential information that is intended for the addressee(s) only. If =
you are not the intended recipient, you are hereby notified that any disclo=
sure, copying, distribution, retention
 or use of the contents of this information is prohibited. If you have rece=
ived this email in error, please immediately contact the sender and delete =
the email.
</body>
</html>

--_000_SN1PR13MB027295287B467702CA7967E692470SN1PR13MB0272namp_--
