Return-Path: <lewis.muhlenkamp@stryker.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
	by mail.openembedded.org (Postfix) with ESMTP id CD5867FB43;
	Fri,  8 Nov 2019 20:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=S+FD7uFlUFObX/5Lws3tIWylwQPrtrkol2llZcahT9/v3D5u+PSo5nIWKjKRe0MvFDCQmmz9vwa+uh0+vHQ4M93iSCfzO1gctZuRkyfbMmNF8Ht/+xYh8EE6Zg5ZZkqsJa2ujVEM8SuCAUhfko9F4FvQac8uv4sqECjskEKe/DpyNQQDd05fR1eFr3uCokuoCHADXfdjmYCbRDPuU+hXE8XbJIpUfNyk5nT9nfXiI0pEcjuhph7MGmYHSa9C2F2S50VKOL+9W4ZwwOMaKxep1E5aEVrRd9QT7MjWPntR7diFoHD+W7abJg3Y9xLFVWrCL7KWPYBdjHrOJrJd6zu1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yY+RvKL8GuYsjZtMzaVGuaee+2Tt4Tztz+VrElXMVWY=;
	b=QUdsw6xrjMSQHA3l5Hi1epBBnN/vIUxVVBmHUL4H4csCYpx/OWDUBeMvM2jZSEftySDHDQNLz7toAvZBL5A1T4PFzVsHDihiDAKrw53GscQ6Ogm56Fw60JTElkwG/sRC9tSuElwapg9gIcYRIwZ5tdqpP82Vg+tGO3GpiROQvGfxObWYb1w/FKfkWrm2OoWKVmKnN3IcsGsmYhd438zRj4bLfs0nUkj3ybR1M8EHInq2KmcpBKnaBPAqFWbmynZ4NELPBkyfdKomI9NC3LpBFH0EIiHJQUxPOLsXq10L6yL834LKDAcfndEI0wtaC2wJl4lWCcjkRASVnMyX0bNsQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=stryker.com;
	dmarc=pass action=none header.from=stryker.com; 
	dkim=pass header.d=stryker.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yY+RvKL8GuYsjZtMzaVGuaee+2Tt4Tztz+VrElXMVWY=;
	b=LGcdcj94BcRcJAr6n9exBJ4H2UUM23PEoZ6MpQAU6ZppNpo+f+SH/WfU0Fc69nsggUzkMZsO1m6+yOoU+pZafN9upn/kT7oWqtVBnZC9x9cXUvJMt1RqEpGP51rjhtZ9dCtHcSKVUaLaEacP83IGedSHodjNDygBPNWtH0U3ihg=
Received: from BN6PR0101MB2914.prod.exchangelabs.com (10.174.88.139) by
	BN6PR0101MB3154.prod.exchangelabs.com (10.174.87.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.22; Fri, 8 Nov 2019 20:46:36 +0000
Received: from BN6PR0101MB2914.prod.exchangelabs.com
	([fe80::5551:3fd0:8175:4dbb]) by BN6PR0101MB2914.prod.exchangelabs.com
	([fe80::5551:3fd0:8175:4dbb%6]) with mapi id 15.20.2430.023;
	Fri, 8 Nov 2019 20:46:36 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>, Anuj Mittal
	<anuj.mittal@intel.com>
Thread-Topic: How to enable x11 with intel-corei7-64 machine in meta-intel
	layer
Thread-Index: AdWWc06FYisVFQ2dQfCNAAWEp8chxQ==
Date: Fri, 8 Nov 2019 20:46:36 +0000
Message-ID: <BN6PR0101MB291467F2D2FCD0A1803982F58F7B0@BN6PR0101MB2914.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [165.225.32.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eaaee1f1-ba6b-40f6-a418-08d7648cbf8f
x-ms-traffictypediagnostic: BN6PR0101MB3154:
x-microsoft-antispam-prvs: <BN6PR0101MB315492002F6CB62FE27478468F7B0@BN6PR0101MB3154.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(376002)(39860400002)(136003)(366004)(346002)(189003)(199004)(81156014)(33656002)(5660300002)(52536014)(81166006)(8936002)(9326002)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007)(74316002)(110136005)(7736002)(2906002)(2501003)(66066001)(8676002)(14454004)(25786009)(790700001)(71200400001)(71190400001)(6306002)(99286004)(316002)(606006)(186003)(236005)(6436002)(9686003)(54896002)(55016002)(478600001)(256004)(7696005)(86362001)(26005)(476003)(6506007)(486006)(102836004)(3846002)(55236004)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB3154;
	H:BN6PR0101MB2914.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ABAS0qxpa9lTLurdnarjRoaLJAat8A9B4SbwLH5f3Gd0PmKRwTSStWP7YpcRn85nL59R26IaU3pTkfm5u3xI7hETawydVDKodpYLykMW4f00tPfZnIGE+iC84iyaJzAZQh39ot3S576rZTzQQB0ex1oZcnUgLeOSSBLciuKsGNJIXSewlmCIf+e9FAh8XLtQ0hTGkm+9yxDERfp/zkEFVxjgx+vkT6luZZgrDKJAAccg/uhyGqaPrzBexKpJSFo+xmM9p6Pg2A8FCr5paq+9YGGd7kAg9OBeXMEhrW7UZiXAZ4aVJXuMPxokiZSNT6TEJdMrM0NesaYEDhF/9paB8Y09S1dO4j7slggped3MO20ZYZQBELDwhqY4+XWGI4bhcwbU7c3SedlC21rfKtPfBSRA5TwikcgvhpPHfytcDebMV+haZd5cSXJNd/eU9A7i
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaaee1f1-ba6b-40f6-a418-08d7648cbf8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 20:46:36.5816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JM5SegMuzshzeFotXP6e83Z6Mw2HxpR1+DeHuxG84k3jwqJ5Pg9xHOnMADB+Ay8IBZIoz+krY1SAlCkwumnLPOtZDWxhnL2KYdr3RPOdEpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB3154
Subject: How to enable x11 with intel-corei7-64 machine in meta-intel layer
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
X-List-Received-Date: Fri, 08 Nov 2019 20:46:38 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR0101MB291467F2D2FCD0A1803982F58F7B0BN6PR0101MB2914_"

--_000_BN6PR0101MB291467F2D2FCD0A1803982F58F7B0BN6PR0101MB2914_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I've been trying to figure out how to get x11 enabled with my intel-corei7-=
64 machine.

If I have in my local.conf file MACHINE set to intel-corei7-64 and I run "b=
itbake core-image-x11", bitbake fails.  The error message I get in the .../=
tmp-glibc/work/corei7-64-oe-linux/xf86-video-intel/2_2.99.917+gitAUTOINC+e4=
fe79cf0d-r0/build/config.log file is as follows:

=3D=3D=3D Start config.log excerpt =3D=3D=3D
configure:22309: checking whether to include XvMC support
configure:22311: result: yes
configure:22345: checking which acceleration method to use by default
configure:22356: error: No default acceleration option
=3D=3D=3D End config.log excerpt =3D=3D=3D

I've tried different things I've found doing Google searches.  None of them=
 have worked.

This is a bare bone setup.  I am using the thud branch.  My bblayers.conf f=
ile is as follows:

=3D=3D=3D Start bblayers.conf =3D=3D=3D
# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION =3D "7"

BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""

BBLAYERS ?=3D " \
  ${HOME}/oe-core/meta \
  ${HOME}/meta-openembedded/meta-python \
  ${HOME}/meta-openembedded/meta-gnome \
  ${HOME}/meta-openembedded/meta-filesystems \
  ${HOME}/meta-openembedded/meta-oe \
  ${HOME}/meta-openembedded/meta-networking \
  ${HOME}/meta-openembedded/meta-initramfs \
  ${HOME}/meta-openembedded/meta-webserver \
  ${HOME}/meta-intel \
  ${HOME}/meta-virtualization \
  ${HOME}/meta-cloud-services \
  ${HOME}/meta-cloud-services/meta-openstack \
  ${HOME}/meta-iot-cloud \
  ${HOME}/meta-secure-core/meta-tpm \
 "
=3D=3D=3D End bblayers.conf =3D=3D=3D

The only change I made to the local.conf file was to set MACHINE to intel-c=
orei7-64.

I then ran "bitbake core-image-x11" and get the error.

I'm guessing I need to add something more to my local.conf, but all of the =
different things I've tried have failed.

Any and all help would be appreciated.

Thank you

Lewis Muhlenkamp

Follow this link to read our Privacy Statement<https://www.stryker.com/cont=
ent/stryker/gb/en/legal/global-policy-statement.html/>

--_000_BN6PR0101MB291467F2D2FCD0A1803982F58F7B0BN6PR0101MB2914_
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
<p class=3D"MsoNormal">I&#8217;ve been trying to figure out how to get x11 =
enabled with my intel-corei7-64 machine.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If I have in my local.conf file MACHINE set to intel=
-corei7-64 and I run &#8220;bitbake core-image-x11&#8221;, bitbake fails.&n=
bsp; The error message I get in the &#8230;/tmp-glibc/work/corei7-64-oe-lin=
ux/xf86-video-intel/2_2.99.917&#43;gitAUTOINC&#43;e4fe79cf0d-r0/build/confi=
g.log
 file is as follows:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D Start config.log excerpt =3D=3D=3D<o:p></o=
:p></p>
<p class=3D"MsoNormal">configure:22309: checking whether to include XvMC su=
pport<o:p></o:p></p>
<p class=3D"MsoNormal">configure:22311: result: yes<o:p></o:p></p>
<p class=3D"MsoNormal">configure:22345: checking which acceleration method =
to use by default<o:p></o:p></p>
<p class=3D"MsoNormal">configure:22356: error: No default acceleration opti=
on<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D End config.log excerpt =3D=3D=3D<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve tried different things I&#8217;ve found d=
oing Google searches.&nbsp; None of them have worked.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is a bare bone setup.&nbsp; I am using the thud=
 branch.&nbsp; My bblayers.conf file is as follows:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D Start bblayers.conf =3D=3D=3D<o:p></o:p></=
p>
<p class=3D"MsoNormal"># LAYER_CONF_VERSION is increased each time build/co=
nf/bblayers.conf<o:p></o:p></p>
<p class=3D"MsoNormal"># changes incompatibly<o:p></o:p></p>
<p class=3D"MsoNormal">LCONF_VERSION =3D &quot;7&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BBPATH =3D &quot;${TOPDIR}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">BBFILES ?=3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BBLAYERS ?=3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/oe-core/meta \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-python \<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-gnome \<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-filesystems \<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-oe \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-networking \<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-initramfs \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-webserver \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-intel \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-virtualization \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-cloud-services \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-cloud-services/meta-openstack \<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-iot-cloud \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta-tpm \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&#8220;<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D End bblayers.conf =3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The only change I made to the local.conf file was to=
 set MACHINE to intel-corei7-64.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I then ran &#8220;bitbake core-image-x11&#8221; and =
get the error.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m guessing I need to add something more to m=
y local.conf, but all of the different things I&#8217;ve tried have failed.=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any and all help would be appreciated.<o:p></o:p></p=
>
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

--_000_BN6PR0101MB291467F2D2FCD0A1803982F58F7B0BN6PR0101MB2914_--
