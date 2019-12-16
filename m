Return-Path: <lewis.muhlenkamp@stryker.com>
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700049.outbound.protection.outlook.com [40.107.70.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2EF7FE02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 18:37:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=f8On68p4xz46g/Lbm0P7Tt1gBean0vrvijdXcwyH6OqNqHsHNvROIdb+bLpdNSuwVL1Df7yd2laPhNFjM+nn/hWr/qKcukRwh2plZNMIjo6sWqVwp9ReibOcH5IKL09kR3bnFRC3iFyRhCwjojjVF632LOzfKhR5HCWIRweGNZxeww8DJ1TJEyMmrZmFdU647+Oo0p2Eu3jZ0+XwjkU9RbmK/4J6z+0be36mByRhPP2u2ObjlySEN18xlbuyMXaI72/AizNCe52nGOoDMwj6OQ1e5QmTBEb98lNzCYYRwfVG0T45dBG8W2zaFJkfna0ZOqoAe3YxE2avKtHVN36+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+8y8q3S2Nw5QGJwncW5XNP5ImQPHPnUrLjFV6bwabfw=;
	b=GybolXLcLAREHO90YPaAOhmab05SZP0BVddtQ5ffJQfWAbRRnRqllS6waXBJODbVY2C6aE51td7Y7O8iGm1FY4w7SbQWV5SHBzu+1eZoAqoh+FXEOsNA7eHrPTAohu+w8HKY31UJjIJyUGsa310bndiCAblJFddv+C2lP4PK975Ib3BGrwEhZyXMDJwjGp6QcjZw+sqXshqUuU28DBKwRKQd8bnBQHVbcxzMBHV4ZN7scUs+iz+LXRksFh665FwaG0RnnhlKIWUhDvOyoaPIC8Y6wjJqlH9778VCLDcU89nRpTgVHmNHvfuq+yLBqnlzdsGxBwPC/J9mjdIsvxSe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=stryker.com;
	dmarc=pass action=none header.from=stryker.com; 
	dkim=pass header.d=stryker.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+8y8q3S2Nw5QGJwncW5XNP5ImQPHPnUrLjFV6bwabfw=;
	b=ROCNV4sCe6lRbw45zoWyMC2KYeWoqQGfdmtUVOpCiO16LpRKgr0LJBiAdKfyqECXW1v46Ku/P9+2jP6Jvf2pmVvVxN20bR2xLQtX6rIIVbV4eBkwzivVtsZqUQTn2AV+GlDEwSepizUWm9T4wtWVuf52yiZxqcv9fodfTJBLozw=
Received: from BL0PR01MB4307.prod.exchangelabs.com (10.167.180.160) by
	BL0PR01MB4980.prod.exchangelabs.com (10.167.240.86) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2538.15; Mon, 16 Dec 2019 18:37:06 +0000
Received: from BL0PR01MB4307.prod.exchangelabs.com
	([fe80::a888:7ed8:1ec6:c81f]) by BL0PR01MB4307.prod.exchangelabs.com
	([fe80::a888:7ed8:1ec6:c81f%4]) with mapi id 15.20.2538.019;
	Mon, 16 Dec 2019 18:37:06 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: How to upgrade the kernel
Thread-Index: AdW0PUesbFF5bZ3sQ1S7q12G9Hr/3w==
Date: Mon, 16 Dec 2019 18:37:06 +0000
Message-ID: <BL0PR01MB43075451F85904018A14BF738F510@BL0PR01MB4307.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [198.72.46.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 75e24de8-9e48-4426-9b2d-08d78256f3c6
x-ms-traffictypediagnostic: BL0PR01MB4980:
x-microsoft-antispam-prvs: <BL0PR01MB4980159DFFF6AF66B79BDD0F8F510@BL0PR01MB4980.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(189003)(71200400001)(76116006)(86362001)(5660300002)(7696005)(2906002)(26005)(478600001)(81156014)(8676002)(81166006)(8936002)(55016002)(6506007)(64756008)(110136005)(186003)(66946007)(316002)(66446008)(66476007)(66556008)(9326002)(33656002)(52536014)(9686003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR01MB4980;
	H:BL0PR01MB4307.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /97EHk2ux0mpilvTcpoxH9dyrYv56vHQLX9nAE79s2bbcG8h1ilpxRv4O6FUZ/GthPx0VRUsdY2TkSAxJkKCRxxf8Y5F5eUk4QO6FljQ8NO7RYAOfjGAr0XwG5R2CEeIY1V9iKrRqWaIMEFRYFGFCdqIgz2RoMNqflwnfkMGPPuawfl4Dx1LxQoJT3/9Unu/aKNpbMkoQj3c7eURqG8NgnObHr5mY52wfeZSEhupYYOsv3dWpmm1AW50GL8ZEeF6HGW3ae+hd3RPtBIrRE+1RXXco+sDg/0wm39tiBYA0aafM4Iy9BCQMQ6ZWSsvSyNKwC8WW7qYJmaeHsVFlb/B/oxO5btC8npo0100K9iKO84GAarwrOYtzp17J/WkVBdMe+6fxKgVuxTJ88hqIb8/XSWYFn1jazjVF6+qb8vEthwj+X78wuwMq7ZVL3JdXjoW
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e24de8-9e48-4426-9b2d-08d78256f3c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:37:06.3592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rQ8ZGuU4Mg8KuHNYO8n/sIWw9hDkv0GdUUAWZA+kjH37CqXaJEnu7lPcOiJC7F9uPe5i4BLfvYTwkI5DwdSkaAwe3g7eD8+JLgVUpr54s38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4980
Subject: How to upgrade the kernel
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
X-List-Received-Date: Mon, 16 Dec 2019 18:37:06 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BL0PR01MB43075451F85904018A14BF738F510BL0PR01MB4307prod_"

--_000_BL0PR01MB43075451F85904018A14BF738F510BL0PR01MB4307prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am still fairly new to Yocto and Openembedded.  I've built a custom distr=
ibution and have a few images.  I'm now in the process of trying to determi=
ne how to upgrade from one version to another.

I created an image using Yocto 2.6.  When I install it, it installs the fol=
lowing kernel RPMs:

### Start "rpm -qa | grep kernel | grep -v kernel-module" output ###
kernel-4.14.110+git0+bc35d5bd22_f93147df5d-r0.corei7_64_intel_common
kernel-image-4.14.110-intel-pk-standard-4.14.110+git0+bc35d5bd22_f93147df5d=
-r0.corei7_64_intel_common
kernel-4.14.110-intel-pk-standard-4.14.110+git0+bc35d5bd22_f93147df5d-r0.co=
rei7_64_intel_common
kernel-image-bzimage-4.14.110-intel-pk-standard-4.14.110+git0+bc35d5bd22_f9=
3147df5d-r0.corei7_64_intel_common
### End "rpm -qa | grep kernel | grep -v kernel-module" output ###


I built a newer image using Yocto 3.0.  In the RPM repo I have the followin=
g kernel RPMs:

### Start "ls -1 /var/opt/repos/os | grep kernel | grep -v kernel-module" o=
utput ###
kernel-4.19.73+git0+a7cb57afb9_ca05e9cd64-r0.corei7_64_intel_common.rpm
kernel-4.19.73-intel-pk-standard-4.19.73+git0+a7cb57afb9_ca05e9cd64-r0.core=
i7_64_intel_common.rpm
kernel-dev-4.19.73+git0+a7cb57afb9_ca05e9cd64-r0.corei7_64_intel_common.rpm
kernel-image-4.19.73-intel-pk-standard-4.19.73+git0+a7cb57afb9_ca05e9cd64-r=
0.corei7_64_intel_common.rpm
kernel-image-bzimage-4.19.73-intel-pk-standard-4.19.73+git0+a7cb57afb9_ca05=
e9cd64-r0.corei7_64_intel_common.rpm
kernel-vmlinux-4.19.73+git0+a7cb57afb9_ca05e9cd64-r0.corei7_64_intel_common=
.rpm
systemd-kernel-install-243+0+efb536d0cb-r0.corei7_64.rpm
### End "ls -1 /var/opt/repos/os | grep kernel | grep -v kernel-module" out=
put ###


When I try to do "dnf upgrade" I get the following error messages:

### Start excerpt from "dnf upgrade" command ###
Last metadata expiration check: 0:40:06 ago on Mon Dec 16 17:43:31 2019.
Dependencies resolved.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Package
     Arch                   Version                               Repositor=
y
                                                                           =
Size
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Upgrading:
kernel
     corei7_64_intel_common 4.19.73+git0+a7cb57afb9_ca05e9cd64-r0 OS_Repo 5=
.6 k
kernel-4.19.73-intel-pk-standard
     corei7_64_intel_common 4.19.73+git0+a7cb57afb9_ca05e9cd64-r0 OS_Repo  =
16 k
kernel-image-4.19.73-intel-pk-standard
     corei7_64_intel_common 4.19.73+git0+a7cb57afb9_ca05e9cd64-r0 OS_Repo 5=
.8 k
kernel-image-bzimage-4.19.73-intel-pk-standard
     corei7_64_intel_common 4.19.73+git0+a7cb57afb9_ca05e9cd64-r0 OS_Repo 7=
.8 M
Transaction Summary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Install  1297 Packages
Upgrade   666 Packages
Skip        5 Packages

Total size: 232 M
Is this ok [y/N]: y
Downloading Packages:
Running transaction check
Transaction check succeeded.
Running transaction test
Error: Transaction check error:
  file /boot/bzImage from install of kernel-image-bzimage-4.19.73-intel-pk-=
standard-4.19.73+git0+a7cb57afb9_ca05e9cd64-r0.corei7_64_intel_common confl=
icts with file from package kernel-image-bzimage-4.14.110-intel-pk-standard=
-4.14.110+git0+bc35d5bd22_f93147df5d-r0.corei7_64_intel_common

Error Summary
-------------
### End excerpt from "dnf upgrade" command ###


I also tried running "dnf upgrade --best --allowerasing", but got the same =
results.

Can I upgrade a system using the dnf command?  If so, how?  If not, what do=
 I need to do to allow the system to be upgraded using the dnf command?

Thank you

Lewis Muhlenkamp

Follow this link to read our Privacy Statement<https://www.stryker.com/cont=
ent/stryker/gb/en/legal/global-policy-statement.html/>

--_000_BL0PR01MB43075451F85904018A14BF738F510BL0PR01MB4307prod_
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
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am still fairly new to Yocto and Openembedded.&nbs=
p; I&#8217;ve built a custom distribution and have a few images.&nbsp; I&#8=
217;m now in the process of trying to determine how to upgrade from one ver=
sion to another.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I created an image using Yocto 2.6.&nbsp; When I ins=
tall it, it installs the following kernel RPMs:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">### Start &#8220;rpm -qa | grep kernel | grep -v ker=
nel-module&#8221; output ###<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-4.14.110&#43;git0&#43;bc35d5bd22_f93147df5d-r=
0.corei7_64_intel_common<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-image-4.14.110-intel-pk-standard-4.14.110&#43=
;git0&#43;bc35d5bd22_f93147df5d-r0.corei7_64_intel_common<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-4.14.110-intel-pk-standard-4.14.110&#43;git0&=
#43;bc35d5bd22_f93147df5d-r0.corei7_64_intel_common<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-image-bzimage-4.14.110-intel-pk-standard-4.14=
.110&#43;git0&#43;bc35d5bd22_f93147df5d-r0.corei7_64_intel_common<o:p></o:p=
></p>
<p class=3D"MsoNormal">### End &#8220;rpm -qa | grep kernel | grep -v kerne=
l-module&#8221; output ###<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I built a newer image using Yocto 3.0.&nbsp; In the =
RPM repo I have the following kernel RPMs:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">### Start &#8220;ls -1 /var/opt/repos/os | grep kern=
el | grep -v kernel-module&#8221; output ###<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-4.19.73&#43;git0&#43;a7cb57afb9_ca05e9cd64-r0=
.corei7_64_intel_common.rpm<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-4.19.73-intel-pk-standard-4.19.73&#43;git0&#4=
3;a7cb57afb9_ca05e9cd64-r0.corei7_64_intel_common.rpm<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-dev-4.19.73&#43;git0&#43;a7cb57afb9_ca05e9cd6=
4-r0.corei7_64_intel_common.rpm<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-image-4.19.73-intel-pk-standard-4.19.73&#43;g=
it0&#43;a7cb57afb9_ca05e9cd64-r0.corei7_64_intel_common.rpm<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-image-bzimage-4.19.73-intel-pk-standard-4.19.=
73&#43;git0&#43;a7cb57afb9_ca05e9cd64-r0.corei7_64_intel_common.rpm<o:p></o=
:p></p>
<p class=3D"MsoNormal">kernel-vmlinux-4.19.73&#43;git0&#43;a7cb57afb9_ca05e=
9cd64-r0.corei7_64_intel_common.rpm<o:p></o:p></p>
<p class=3D"MsoNormal">systemd-kernel-install-243&#43;0&#43;efb536d0cb-r0.c=
orei7_64.rpm<o:p></o:p></p>
<p class=3D"MsoNormal">### End &#8220;ls -1 /var/opt/repos/os | grep kernel=
 | grep -v kernel-module&#8221; output ###<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When I try to do &#8220;dnf upgrade&#8221; I get the=
 following error messages:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">### Start excerpt from &#8220;dnf upgrade&#8221; com=
mand ###<o:p></o:p></p>
<p class=3D"MsoNormal">Last metadata expiration check: 0:40:06 ago on Mon D=
ec 16 17:43:31 2019.<o:p></o:p></p>
<p class=3D"MsoNormal">Dependencies resolved.<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal">Package<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; Arch&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; Version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Repository<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; Size<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal">Upgrading:<o:p></o:p></p>
<p class=3D"MsoNormal">kernel<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; corei7_64_intel_common 4.19=
.73&#43;git0&#43;a7cb57afb9_ca05e9cd64-r0 OS_Repo 5.6 k<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-4.19.73-intel-pk-standard<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; corei7_64_intel_common 4.19=
.73&#43;git0&#43;a7cb57afb9_ca05e9cd64-r0 OS_Repo&nbsp; 16 k<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-image-4.19.73-intel-pk-standard<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; corei7_64_intel_common 4.19=
.73&#43;git0&#43;a7cb57afb9_ca05e9cd64-r0 OS_Repo 5.8 k<o:p></o:p></p>
<p class=3D"MsoNormal">kernel-image-bzimage-4.19.73-intel-pk-standard<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; corei7_64_intel_common 4.19=
.73&#43;git0&#43;a7cb57afb9_ca05e9cd64-r0 OS_Repo 7.8 M<o:p></o:p></p>
<p class=3D"MsoNormal">Transaction Summary<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal">Install&nbsp; 1297 Packages<o:p></o:p></p>
<p class=3D"MsoNormal">Upgrade&nbsp;&nbsp; 666 Packages<o:p></o:p></p>
<p class=3D"MsoNormal">Skip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 Pac=
kages<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Total size: 232 M<o:p></o:p></p>
<p class=3D"MsoNormal">Is this ok [y/N]: y<o:p></o:p></p>
<p class=3D"MsoNormal">Downloading Packages:<o:p></o:p></p>
<p class=3D"MsoNormal">Running transaction check<o:p></o:p></p>
<p class=3D"MsoNormal">Transaction check succeeded.<o:p></o:p></p>
<p class=3D"MsoNormal">Running transaction test<o:p></o:p></p>
<p class=3D"MsoNormal">Error: Transaction check error:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; file /boot/bzImage from install of kernel-ima=
ge-bzimage-4.19.73-intel-pk-standard-4.19.73&#43;git0&#43;a7cb57afb9_ca05e9=
cd64-r0.corei7_64_intel_common conflicts with file from package kernel-imag=
e-bzimage-4.14.110-intel-pk-standard-4.14.110&#43;git0&#43;bc35d5bd22_f9314=
7df5d-r0.corei7_64_intel_common<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Error Summary<o:p></o:p></p>
<p class=3D"MsoNormal">-------------<o:p></o:p></p>
<p class=3D"MsoNormal">### End excerpt from &#8220;dnf upgrade&#8221; comma=
nd ###<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I also tried running &#8220;dnf upgrade --best --all=
owerasing&#8221;, but got the same results.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can I upgrade a system using the dnf command?&nbsp; =
If so, how?&nbsp; If not, what do I need to do to allow the system to be up=
graded using the dnf command?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Lewis Muhlenkamp<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
Follow this link to read our <a href=3D"https://www.stryker.com/content/str=
yker/gb/en/legal/global-policy-statement.html/">
Privacy Statement</a>
</body>
</html>

--_000_BL0PR01MB43075451F85904018A14BF738F510BL0PR01MB4307prod_--
