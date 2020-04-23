Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.60])
 by mx.groups.io with SMTP id smtpd.web12.1673.1587669134934550506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 12:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=n9pUmRo4;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.92.60, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2a4xNNNh/OPZYqbLxD9UcbkF2kwBRFA/l7iHeEqDJpsEfD9uI+F1VhuygjZYES4OXl+m1WQKnnKfog76tt7wD+r1vckW1X2ALWKext32bQ/UiBfIYxVXwT95Fa6VVXAE8jsi7LuxJ3KsQ/4ZuBY3YMokp2gwE9deZX5OjLUEVX3xt0Uu1ojy/z1KJdu+QpC+lAffzUjiNod9IHTfPEwQ8z3qA/mOKIcLbnrvxYo5Ps7TL0Mq1TviM+jsJtYHFFk/c4c+p6w+s/pmfYCFBXHzHRd7Dz+AETVg1TxuB8V32RYXqk515iIsnd7kZNWGBbzlXORLVdANpJwYnc4RZts5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSzqnZv8hYVqekpbTjKb70dYrN1MP9IDkdQYoPZ+36c=;
 b=MOuczOt2LVVA7al0XXuPNgURu1iN2v4yPVnycgRe9QfQfiAxP/6BLOMEtnVlEeO6hgwfuyGumxYiTkP2SKKcxPWzfWIZkXiWZVBRBtN3gbqwtMlciFCf3Wvo7VFIT4RhBLS8IDr8YExXNjQUMahxgZV45EeRAzawsPA9AFy8H2b+Cj5nCHyDpjy6XVRitjl2CDj60tjZvXQLspY6GGPTU8OjXZekz1KuwAL0IIJMhrUcz/UOMXulbs+ySLdmxsHMKIW2ghDgwTWPpkBKKOj+by/SJeAG4rsrT2/dIrFuTzPlp3PT7ZSo2cuw+s3EKxrScngNYEr42YSU2I+EdVcdew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSzqnZv8hYVqekpbTjKb70dYrN1MP9IDkdQYoPZ+36c=;
 b=n9pUmRo46Ztj5fGFwAymHf385RtM0cqRfGMKj4lPmsSuxwDpIHVfyQMKgZCa6Jq9hvZIwRYszYKIO33NBGiWNTUgvGrd2Mal+yWrO0+HnBQippv30IXCoW0Tr+ob9fD1ASGOG6VnSdhVFGIrO80rPUpZbBvbAJygePDyPHtySUg=
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SN1PR12MB2496.namprd12.prod.outlook.com (2603:10b6:802:2f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Thu, 23 Apr
 2020 19:12:13 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::b1d0:1320:b3eb:183c]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::b1d0:1320:b3eb:183c%2]) with mapi id 15.20.2937.020; Thu, 23 Apr 2020
 19:12:13 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Changing DISTRO_FEATURES / build directory
Thread-Topic: Changing DISTRO_FEATURES / build directory
Thread-Index: AdYZoreS4f0qd/lxRTy9wl3fvQ25kw==
Date: Thu, 23 Apr 2020 19:12:13 +0000
Message-ID: 
 <SN1PR12MB2480D4132DF632E5161532E38BD30@SN1PR12MB2480.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [76.72.138.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71b71b70-6739-4f91-992b-08d7e7ba3b1c
x-ms-traffictypediagnostic: SN1PR12MB2496:
x-microsoft-antispam-prvs: 
 <SN1PR12MB24963DD034BAA4B76CB92BA18BD30@SN1PR12MB2496.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(136003)(39860400002)(376002)(346002)(366004)(29502001)(966005)(71200400001)(9686003)(52536014)(86362001)(4744005)(66476007)(66556008)(66946007)(66446008)(64756008)(76116006)(6916009)(55016002)(33656002)(8676002)(8936002)(81156014)(2906002)(478600001)(26005)(186003)(7696005)(5660300002)(316002)(6506007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: agilent.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wAJmO09UxkFzqsxB5GFO9dzSjWlB6Xzili0Py7Y52YebNoPtDKskx9RtMNPMLO6YX/HF+2pg27IDkCpCpfsXZDpujzAZEfvJYuwPbJ68LiabrsXo7BuD8CiEAjpdMfYK0LNfVtgjwUk/fkEBVAwAUcEhsPOIOHW2+Kc7d0OGzR4IWUJ499SJh8996JGiwEg5xDpEqgrW7y2xXcC55LCeRsIzQpn3ZVpMaxTOaiZ9VdUe9lImIuhaoZgAQjaJmgYhGNu58jSdz7Z1xixKweCYxOQ6FOURnM8sse3DJq2OGe1kwt7hv4UijLdDEWLKO2uVxEwNjrqKfo8IUiGNh9q7WmOqeNf/rqL0OYrTbBOENUnhi2qtfYL3HKA2YEKqFrx81cE4GpwZgYI0iOGtruZxHKncWgRcGY+FseiC51l+c3dyo7aFJshShvDteCeWlFUC61B/YId1rzWmNczk1VEYpW8q3ha2N5aC+BxhjYgw1A5U/1xoRykeGx+XCdH0p0t+Kgixq4YOXaILONiU4FKWaqsNKOiz2kDsKpAnJ39ROyQ5MYWHIXOkXODY88rLFg0DgVyXiJMHSrKM6OxAX4GqFQ==
x-ms-exchange-antispam-messagedata: 
 3uAa9sF383HO0aoed4JvIgPxHTi45/Nqhx1FlHbWaypD0jInK1tf+Qnm2kSwcsHtNbOA7TJW02QpszUhCALa9JoEhv/pElSA+XNsTSDsk6n+gAOwEyM1C6oBFI/Z/u379cLck0TWPezdO0J3VW7JUw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b71b70-6739-4f91-992b-08d7e7ba3b1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 19:12:13.7068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4habzaaqcQHyfMmwB80jqd/rVcNGR+QPOYazdj/ePo1t0MjGRg8GrxJi4fRMrnOVnKJvHxban9izVdW/9iQIw6v39ZOSVgToc09/PsBSHhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2496
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN1PR12MB2480D4132DF632E5161532E38BD30SN1PR12MB2480namp_"

--_000_SN1PR12MB2480D4132DF632E5161532E38BD30SN1PR12MB2480namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There is a familiar message in sstate.bbclass that explains: "... It may be=
 you changed DISTRO_FEATURES from systemd to udev or vice versa. Cleaning t=
hose recipes should again resolve this error, however switching DISTRO_FEAT=
URES on an existing build directory is not supported - you should really cl=
ean out tmp and rebuild (reusing sstate should be safe)..."

But the release notes for the 2.0 release suggest that it should work: http=
s://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#migration-2=
.0-automatic-stale-sysroot-file-cleanup.

So, is changing DISTRO_FEATURES but not changing the build directory expect=
ed to work?

Thanks,
Chris

--_000_SN1PR12MB2480D4132DF632E5161532E38BD30SN1PR12MB2480namp_
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
<p class=3D"MsoNormal">There is a familiar message in sstate.bbclass that e=
xplains: &#8220;&#8230; It may be you changed DISTRO_FEATURES from systemd =
to udev or vice versa. Cleaning those recipes should again resolve this err=
or, however switching DISTRO_FEATURES on an existing
 build directory is not supported &#8211; you should really clean out tmp a=
nd rebuild (reusing sstate should be safe)&#8230;&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But the release notes for the 2.0 release suggest th=
at it should work:
<a href=3D"https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.h=
tml#migration-2.0-automatic-stale-sysroot-file-cleanup">
https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#migrati=
on-2.0-automatic-stale-sysroot-file-cleanup</a>.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So, is changing DISTRO_FEATURES but not changing the=
 build directory expected to work?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris <o:p></o:p></p>
</div>
</body>
</html>

--_000_SN1PR12MB2480D4132DF632E5161532E38BD30SN1PR12MB2480namp_--
