Return-Path: <Jonathan.Haigh@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0085.outbound.protection.outlook.com [104.47.2.85])
	by mail.openembedded.org (Postfix) with ESMTP id 6523E78A68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 18:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Lktdw3ytxetk3elo7W6KdEXzkhYOhR8aVzwBHuXnZ8k=;
	b=Q6ucxmGLWWuyyxQK1qf/woHMSZlaKPm6Z3TZHmcV6axiFXcMUXtJBl+ROxpxDZXTXUDrPooAxXBwyim2/Hlvhg7jdIpsEj2x4CAH2vN3MkZ5s35FKCdHPJzReqjNQsD3K4roexWrink66zpy7BIcTnqh4TQvNrJH6FXjzPAEicg=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB0743.eurprd08.prod.outlook.com (10.164.42.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.19; Thu, 19 Jul 2018 15:08:30 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::4d42:8b39:3bc0:7658]) by
	DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::4d42:8b39:3bc0:7658%4]) with mapi id 15.20.0973.018;
	Thu, 19 Jul 2018 15:08:29 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core] INCOMPATIBLE_LICENSE mechanism
Thread-Index: AQHUH2P1ipMkerX65UWFRjBAEJC/rqSWocT7
Date: Thu, 19 Jul 2018 15:08:29 +0000
Message-ID: <DB5PR08MB0888B7FFDFD5AA67F818105E93520@DB5PR08MB0888.eurprd08.prod.outlook.com>
References: <DB5PR08MB0888CF3B2340E729DD3B946193520@DB5PR08MB0888.eurprd08.prod.outlook.com>
In-Reply-To: <DB5PR08MB0888CF3B2340E729DD3B946193520@DB5PR08MB0888.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB0743;
	7:hzvy0utIs7rr//wRgMNStvWZRIs0hXRxvXnm2aV1AraSnjWd+1JOQcmWx2DnaSwZhYM4EONcFZ3N7IHykuTNjvkYnIRwiKNRO159iWhAtp35KJM60EbvT4hg/RXrcv7o3vEXZAxASu0GpSnBG5T2H5o4B7ICyVjBp9M0fUpRm4DnRHEWOWrB6YWWhmradrltOrrADuX7HZb+PN/Qic3uGaJjLPrTsBEJI5L71ra5FJdUE6ASl2Vl68b6a/ej+CmZ
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: d2c17fa9-f1e9-4eca-eb69-08d5ed897c6c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR08MB0743; 
x-ms-traffictypediagnostic: DB5PR08MB0743:
x-microsoft-antispam-prvs: <DB5PR08MB0743E8866E9BEC6165872C9A93520@DB5PR08MB0743.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(35073007944872)(223705240517415);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DB5PR08MB0743; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB0743; 
x-forefront-prvs: 0738AF4208
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(366004)(376002)(346002)(396003)(189003)(199004)(69224002)(40434004)(26005)(14454004)(486006)(256004)(14444005)(5024004)(2351001)(72206003)(106356001)(11346002)(2940100002)(446003)(476003)(478600001)(54896002)(68736007)(102836004)(33656002)(55016002)(105586002)(6436002)(5640700003)(9686003)(2900100001)(97736004)(6506007)(1857600001)(8936002)(316002)(81166006)(8676002)(5250100002)(76176011)(3846002)(6116002)(2501003)(5660300001)(53936002)(81156014)(19627405001)(7696005)(2906002)(6916009)(25786009)(6606003)(86362001)(4326008)(66066001)(7736002)(99286004)(74316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB0743;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: kn3Hx+VnyqP4g+SDflT1C7RT6r1UgNeo644eZcmk+r3GYtLoL0OzZGIPclRKAW66EZ8KEHLtToy+otrTgxzLg6lZqecpgYV90MQyhIRBfpef67BrnTo2c63IK/q5MvsuJjI0vqljHfyhkS/EoMe4oeHHNgPlGcyby14doB3MxvSVn4civFmc9Q7yP+pLsQbjXgNqECCI523Rxt3BmYQDpVCZpyHh9RHbT8Kkm0roZ0PVc9Do9rIX+fTm2oEggtAi9d7/JGNKa+IVUfUvpOneeyPl3FF3IM4Gk8uibovp3ncbKGdkc6dpuJ0AQhWpg0S7W1CVdheZPDZX0EHzwSVoqcBGLUH4ZYYCVIYnECnnXZo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c17fa9-f1e9-4eca-eb69-08d5ed897c6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2018 15:08:29.5983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB0743
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>
Subject: INCOMPATIBLE_LICENSE mechanism
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
X-List-Received-Date: Thu, 19 Jul 2018 18:42:55 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB5PR08MB0888B7FFDFD5AA67F818105E93520DB5PR08MB0888eurp_"

--_000_DB5PR08MB0888B7FFDFD5AA67F818105E93520DB5PR08MB0888eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 Hi,


I have some questions, comments and suggestions about the INCOMPATIBLE_LICE=
NSE mechanism:


1. If I specify licenseX in INCOMPATIBLE_LICENSE then I get an error when b=
uilding a recipe with a package (packageA) that just RRECOMMENDS a package =
(packageB) with licenceX, even if I add packageB to BAD_RECOMMENDATIONS_pn-=
packageA. Am I correct in thinking that this behaviour is unintentional?


2. When checking whether a license expression is compatible with INCOMPATIB=
LE_LICENSE, the code takes into account "or" operands in the license expres=
sion, such that if licenseX is in INCOMPATIBLE_LICENSE but licenseY isn't, =
and a package's license expression is "licenseX | licenseY" then the licens=
e will be deemed okay even though licenseX is incompatible. I don't think t=
his consideration of "or" operands is valid. Consider the case where:

  *   packageA has license expression "LGPLv3 | GPLv2;
  *   packageB has license expression "MIT";
  *   packageB dynamically links with packageA;
  *   INCOMPATIBLE_LICENSE =3D "LGPL-3.0".

PackageB mustn't be using packageA under the terms of the GPLv2 because the=
 resulting combination would have to be GPLv2, not MIT, to comply with the =
terms of the GPLv2. PackageB must therefore be using packageA under the ter=
ms of the LGPLv3, but LGPL-3.0 is in INCOMPATIBLE_LICENSE, so the combinati=
on should be rejected.


Actually keeping track of how licenses of packages and their dependents int=
eract might be too much work, too messy, or require too much legal knowledg=
e, so I suggest this special treatment of "or" operands in license expressi=
ons is removed. Another approach might be to allow packages explicitly decl=
are the licenses under which they are using their rdependencies. That would=
n't work nicely with the implicit RDEPENDS addition mechanism though.


3. If I understand correctly, INCOMPATIBLE_LICENSE doesn't let me have diff=
erent license policies for packages that go into different images. It would=
 be useful to be able to specify INCOMPATIBLE_LICENSE in an image recipe to=
 prevent just that image containing packages/recipes with incompatible lice=
nses. This would be useful e.g. to have a GPLv3-free production image but a=
llow GPLv3 packages in a debug image.


4. From the code in license.bbclass, it looks like when writing the rootfs =
and image manifest files, the intended behaviour is to modify the license e=
xpressions of packages/recipes by removing incompatible "or" branches (whic=
h seems a little odd, especially given #2). However, this is not the actual=
 behaviour of the code when run with Python3. From write_license_files() in=
 license.bbclass:

    bad_licenses =3D (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
    bad_licenses =3D map(lambda l: canonical_license(d, l), bad_licenses)
    bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)

expand_wildcard_licenses() expects a list, but in Python3 map() returns som=
e sort of iterator, which causes expand_wildcard_licenses() to return an em=
pty list. This can be fixed by wrapping the call to map() in a call to list=
(). I'll send a patch for this.


I have a bbclass that adds license checking at the rootfs/image stage and d=
oesn't take into account the "or" operands in license expressions, but I th=
ink it would be better to change/extend the functionality of the INCOMPATIB=
LE_LICENSE mechanism. Do the oe-core maintainers here agree with the follow=
ing approach?

  *   Don't fail a build if a package just RRECOMMENDs another package with=
 an incompatible license, only fail if the package is actually built.
  *   Don't take "or" operands into account when checking for incompatible =
licenses.
  *   Add functionality to allow INCOMPATIBLE_LICENSE to just apply to pack=
ages/recipes that go into a particular image.
  *   Don't modify package/recipe license expressions in the manifest files=
.

If so, I'd like to contribute patches to do this. I'm not at all familiar w=
ith how the RRECOMMENDS mechanism works though, so some guidance on that pa=
rt would be useful.

Thanks for all the work being done on OE, it is much appreciated.

Jonathan
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_DB5PR08MB0888B7FFDFD5AA67F818105E93520DB5PR08MB0888eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFont&quot;, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D=
"ltr">
<div style=3D"color: rgb(0, 0, 0);">
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div>&nbsp;Hi, </div>
</div>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,&quot;EmojiFont&quo=
t;,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,=
&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">I have some questions, comments =
and suggestions about the INCOMPATIBLE_LICENSE mechanism:</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">1. If I specify licenseX in INCO=
MPATIBLE_LICENSE then I get an error when building a recipe with a package =
(packageA) that just RRECOMMENDS a package (package<span><span>B)
</span></span>with licenceX, even if I add packageB to BAD_RECOMMENDATIONS_=
pn-packageA. Am I correct in thinking that this behaviour is unintentional?=
</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">2. When checking whether a licen=
se expression is compatible with INCOMPATIBLE_LICENSE, the code takes into =
account &quot;or&quot; operands in the license expression, such that if lic=
enseX is in INCOMPATIBLE_LICENSE but licenseY
 isn't, and a package's license expression is &quot;licenseX | licenseY&quo=
t; then the license will be deemed okay even though licenseX is incompatibl=
e. I don't think this consideration of &quot;or&quot; operands is valid. Co=
nsider the case where:</p>
<ul style=3D"margin-bottom:0px; margin-top:0px">
<li>packageA has license expression &quot;LGPLv3 | GPLv2;</li><li>packageB =
has license expression &quot;MIT&quot;;</li><li>packageB dynamically links =
with packageA;</li><li>INCOMPATIBLE_LICENSE =3D &quot;LGPL-3.0&quot;.</li><=
/ul>
<p style=3D"margin-top:0; margin-bottom:0">PackageB mustn't be using packag=
eA under the terms of the GPLv2 because the resulting combination would hav=
e to be GPLv2, not MIT, to comply with the terms of the GPLv2. PackageB mus=
t therefore be using packageA under
 the terms of the LGPLv3, but LGPL-3.0 is in INCOMPATIBLE_LICENSE, so the c=
ombination should be rejected.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Actually keeping track of how li=
censes of packages and their dependents interact might be too much work, to=
o messy, or require too much legal knowledge, so I suggest this special tre=
atment of &quot;or&quot; operands in license
 expressions is removed. Another approach might be to allow packages explic=
itly declare the licenses under which they are using their rdependencies. T=
hat wouldn't work nicely with the implicit RDEPENDS addition mechanism thou=
gh.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">3. If I understand correctly, IN=
COMPATIBLE_LICENSE doesn't let me have different license policies for packa=
ges that go into different images. It would be useful to be able to specify=
 INCOMPATIBLE_LICENSE in an image
 recipe to prevent just that image containing packages/recipes with incompa=
tible licenses. This would be useful e.g. to have a GPLv3-free production i=
mage but allow GPLv3 packages in a debug image.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">4. From the code in license.bbcl=
ass, it looks like when writing the rootfs and image manifest files, the in=
tended behaviour is to modify the license expressions of packages/recipes b=
y removing incompatible &quot;or&quot; branches
 (which seems a little odd, especially given #2). However, this is not the =
actual behaviour of the code when run with Python3. From write_license_file=
s() in license.bbclass:</p>
<div><br>
</div>
<div>
<div>&nbsp;&nbsp;&nbsp; bad_licenses =3D (d.getVar(&quot;INCOMPATIBLE_LICEN=
SE&quot;) or &quot;&quot;).split()<br>
&nbsp;&nbsp;&nbsp; bad_licenses =3D map(lambda l: canonical_license(d, l), =
bad_licenses)<br>
&nbsp;&nbsp;&nbsp; bad_licenses =3D expand_wildcard_licenses(d, bad_license=
s)</div>
</div>
<div><br>
</div>
<div>expand_wildcard_licenses() expects a list, but in Python3 map() return=
s some sort of iterator, which causes expand_wildcard_licenses() to return =
an empty list. This can be fixed by wrapping the call to map() in a call to=
 list(). I'll send a patch for this.</div>
<div><br>
</div>
<div><br>
</div>
<div>I have a bbclass that adds license checking at the rootfs/image stage =
and doesn't take into account the &quot;or&quot; operands in license expres=
sions, but I think it would be better to change/extend the functionality of=
 the INCOMPATIBLE_LICENSE mechanism. Do the
 oe-core maintainers here agree with the following approach?</div>
<div>
<ul>
<li>Don't fail a build if a package just RRECOMMENDs another package with a=
n incompatible license, only fail if the package is actually built.</li><li=
>Don't take &quot;or&quot; operands into account when checking for incompat=
ible licenses.</li><li>Add functionality to allow INCOMPATIBLE_LICENSE to j=
ust apply to packages/recipes that go into a particular image.</li><li>Don'=
t modify package/recipe license expressions in the manifest files. <br>
</li></ul>
If so, I'd like to contribute patches to do this. I'm not at all familiar w=
ith how the RRECOMMENDS mechanism works though, so some guidance on that pa=
rt would be useful.</div>
<div><br>
</div>
<div>Thanks for all the work being done on OE, it is much appreciated.</div=
>
<div><br>
</div>
<div>Jonathan<br>
</div>
</div>
</div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DB5PR08MB0888B7FFDFD5AA67F818105E93520DB5PR08MB0888eurp_--
