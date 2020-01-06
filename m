Return-Path: <lewis.muhlenkamp@stryker.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
	by mail.openembedded.org (Postfix) with ESMTP id EA66D7FCF3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Qb2UHiA0oz+30Tf2TQ9EhV8TsCTMTgPIhPQTUiNCfKj0Iw5rIDKnl8i38lKT+Sb7E7YhDkbeBtD/Exn4sXXAUPF894T7nKuQ+a6QoNy9uyIre3DA2FKfpDXRembia7q+EvjNYYeiW4TAdPJ+LJ2tB7rX4RP15R5T8CK7yro/E+TozAgAHhdVFplnOgbkFlBpoZumm/U5ojjdUONBWMpWwYI9aZcaHuV6v8RPoOY0iRBrGuH/HgZ8PpefSEor2lTmkzUQvylSlRo3XO9RBl1UjImWn69px1Zzsn3fQNMGj1psSGVNcR7ZSEIGss7aqKFuLraOpMyVtzLYLxksDQxcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=55eOq0e3a3npCOg7KwGyiJzk4xGyFAE+cqOX1/2t2Kw=;
	b=Fruk3Uh2gzTqVvxxXkScv9Av2d6kFXQeAIP5C6B6rGFMyvLOqQPfuWIE7z5UjLZs9dh/Hb+qmPdJqpyzu6Hs2p+ALeiaz1RIWsQjy6kG+dqq+ibnUemseBJVOwI9skM/UwZaIhjdhwFq05TSwLQcHPNHKUe8cGSnWMNCxtZI2smZMpz4bq1QEPx+n6y6WcjE3LJoezzOpPeCbQH2j95ZAe+B9Ys2jHoPsMpDn9OpdRgPEhllr7wH8Nr6O6vji5dpOiFj48qgbguLzPXbGeT3/S5c5ER0ulCv+CZqHp+gAPS0NxySh4//0K1VrDTSodoKIycRBrfh4PaT8XdEiEWpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=stryker.com;
	dmarc=pass action=none header.from=stryker.com; 
	dkim=pass header.d=stryker.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=55eOq0e3a3npCOg7KwGyiJzk4xGyFAE+cqOX1/2t2Kw=;
	b=ECUFPpQxXaWmqiPGr3l8Vzyb9vsgC3otTV0BYyU57wt+9N1tej+6zIkHHW3Rcz3qg7B7Fl0OilS/Cq1nf10KqLJx182zbePKgEwWvOe4loTR+HzmgFfSRhpae9YpzamKuioDtqLKrf9ROiztXhGtzUkw132svJKYGS9F06duPAk=
Received: from BL0PR01MB4307.prod.exchangelabs.com (10.167.180.160) by
	BL0PR01MB5042.prod.exchangelabs.com (20.177.204.161) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2602.15; Mon, 6 Jan 2020 16:34:02 +0000
Received: from BL0PR01MB4307.prod.exchangelabs.com
	([fe80::a888:7ed8:1ec6:c81f]) by BL0PR01MB4307.prod.exchangelabs.com
	([fe80::a888:7ed8:1ec6:c81f%4]) with mapi id 15.20.2602.015;
	Mon, 6 Jan 2020 16:34:02 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: How to upgrade the kernel
Thread-Index: AdW0PUesbFF5bZ3sQ1S7q12G9Hr/3wQccufA
Date: Mon, 6 Jan 2020 16:34:02 +0000
Message-ID: <BL0PR01MB43079DB401BCEDD3098BD91E8F3C0@BL0PR01MB4307.prod.exchangelabs.com>
References: <BL0PR01MB43075451F85904018A14BF738F510@BL0PR01MB4307.prod.exchangelabs.com>
In-Reply-To: <BL0PR01MB43075451F85904018A14BF738F510@BL0PR01MB4307.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [198.72.46.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af56f006-0eb3-40e8-5bac-08d792c63d71
x-ms-traffictypediagnostic: BL0PR01MB5042:
x-microsoft-antispam-prvs: <BL0PR01MB50428D1E31B5C17733B062028F3C0@BL0PR01MB5042.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(396003)(346002)(366004)(376002)(39860400002)(189003)(199004)(6506007)(7696005)(53546011)(52536014)(81156014)(81166006)(110136005)(9686003)(33656002)(478600001)(316002)(2906002)(8936002)(186003)(5660300002)(76116006)(66556008)(64756008)(66946007)(26005)(66446008)(55016002)(8676002)(66476007)(86362001)(71200400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR01MB5042;
	H:BL0PR01MB4307.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G0+uqSK7Ef2ucFVEV7TW9UQ0cjVHy0AJUVq0nOMhJZ690sirDwzHhk9xYFXYkwUln9aRIGHgYgiELSQx4ua3Wue84ZLs8ZQYQzU9fKmt16UMYytQewNWrjLDpWxQgnVHgAhClxZ5hIUXYIuAXR/y4wh08AQcneWqtvz9gw1n5mqBivLxE9JwQAQt+NmApStBTBJ2Y2iGFWD0jzHGMilPU1UVvltKL2IsxanAf6II3eK2dTIQgyCDFpyxT/sRV0woOHvUE6RIGWj4EZ9uqLdYjLDtQRExmTOxj3SHbRq8u+lV/Hg9Fzg7vW3mLCgilzGx+ygSLmG/sMtrnA6qpZ9oJlZOyHdN0aChxaF2iWh55IFn91cYQA7Vz+Xy9fUSPF1aDfc66HSDB7TtykhGlbuLxWCK5Dh99K3ir7m1s74CQMpdQwssytK9CdZtGAs+6Pit0nlbMpkRDr6tGLWA6NO6G4iB81EsehXNIzqwMs9ziRc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af56f006-0eb3-40e8-5bac-08d792c63d71
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 16:34:02.6944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wfRvy606xobNY8FiaNtSzGBNlJOdugEyEC5FlyK1B+qXT8e8wovZaAf9Vu9B60EK2ecwMLdNJHyU14Sd1nbNkeDFpgwAnTUdezgJpbSaSgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5042
Subject: Re: How to upgrade the kernel
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
X-List-Received-Date: Mon, 06 Jan 2020 16:34:03 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BL0PR01MB43079DB401BCEDD3098BD91E8F3C0BL0PR01MB4307prod_"

--_000_BL0PR01MB43079DB401BCEDD3098BD91E8F3C0BL0PR01MB4307prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> On Behalf Of Muhlenkamp, Lewis
Sent: Monday, December 16, 2019 1:37 PM
To: yocto@lists.yoctoproject.org; openembedded-core@lists.openembedded.org
Subject: [OE-core] How to upgrade the kernel

EXTERNAL EMAIL
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
CAUTION: External email. Do not click links or open attachments unless you =
recognize the sender and know the content is safe. Please forward all suspi=
cious emails to informationsecurity@stryker.com<mailto:informationsecurity@=
stryker.com>.

Follow this link to read our Privacy Statement<https://www.stryker.com/cont=
ent/stryker/gb/en/legal/global-policy-statement.html/>

--_000_BL0PR01MB43079DB401BCEDD3098BD91E8F3C0BL0PR01MB4307prod_
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
@font-face
	{font-family:Cambria;
	panose-1:2 4 5 3 5 4 6 3 2 4;}
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal">ping<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openembedded-core-bounces@lists.openemb=
edded.org &lt;openembedded-core-bounces@lists.openembedded.org&gt;
<b>On Behalf Of </b>Muhlenkamp, Lewis<br>
<b>Sent:</b> Monday, December 16, 2019 1:37 PM<br>
<b>To:</b> yocto@lists.yoctoproject.org; openembedded-core@lists.openembedd=
ed.org<br>
<b>Subject:</b> [OE-core] How to upgrade the kernel<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
;color:red">EXTERNAL EMAIL</span>
<o:p></o:p></p>
</div>
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
<p class=3D"MsoNormal">Follow this link to read our <a href=3D"https://www.=
stryker.com/content/stryker/gb/en/legal/global-policy-statement.html/">
Privacy Statement</a> <o:p></o:p></p>
<div>
<table class=3D"MsoNormalTable" border=3D"0" cellpadding=3D"0" width=3D"100=
%" style=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"background:#EDEDED;padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><strong><span style=3D"font-family:&quot;Calibri&quo=
t;,sans-serif;color:red">CAUTION:</span></strong> External email. Do not cl=
ick links or open attachments unless you recognize the sender and know the =
content is safe. Please forward all suspicious
 emails to <span style=3D"color:#1B00FF"><a href=3D"mailto:informationsecur=
ity@stryker.com">informationsecurity@stryker.com</a>.</span><o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
;color:red"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
Follow this link to read our <a href=3D"https://www.stryker.com/content/str=
yker/gb/en/legal/global-policy-statement.html/">
Privacy Statement</a>
</body>
</html>

--_000_BL0PR01MB43079DB401BCEDD3098BD91E8F3C0BL0PR01MB4307prod_--
