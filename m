Return-Path: <prvs=23130414b5=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id AC5EA78087
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 May 2017 17:16:45 +0000 (UTC)
X-AuditID: 0a00029b-58dff70000003bd4-95-592079fcaf81
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	78.67.15316.CF970295; Sat, 20 May 2017 12:16:45 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Sat, 20 May 2017 12:16:44 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core] DISK_SIGNATURE no longer functional
Thread-Index: AdLRjNlT3YpLq7j4SnSX4LjtvYzswQ==
Date: Sat, 20 May 2017 17:16:42 +0000
Message-ID: <655290B7709079438B7932553958E60DA13093A0@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWyRiBPQ/dvpUKkwerfNhZ3fr5jd2D0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd8aixtPMBVOlK3p2X2BrYPwg3sXIySEhYCLxYcULFhBbSOAo
	o0Try9guRi4gexajRMPtV0wgCTYBI4lz1zcxgtgiAtESS2fMZAexhQXMJJbPW8IGEbeWWPV+
	GlSNnkTr5M3MIDaLgKrEjENbwep5BYIkLn3qBlvGKCAm8f3UGrD5zALiEreezGeCOEhAYsme
	88wQtqjEy8f/WCFsOYl3TW2sEPX5EnOaLzFCzBSUODnzCcsERsFZSEbNQlI2C0nZAkbmVYx8
	uUZ6qcXFZfklqXrJ+bmbGIHhyMXANHsHY09T7CFGAQ5GJR5e1UKFSCHWxLLiytxDjNIcLEri
	vEUC8pFCAumJJanZqakFqUXxRaU5qcWHGJk4OA8xSnBwSYkUp+alpBYllpZkxIOCPr4YGPZS
	DYz9rVkT7K9yqU03mVbkF51W4G7aNuve/f3askFVXFffn8yzNGfctibc8NfbDs7o1IAL/xdN
	+d//eMLxFa+n+xpNv2286Z4Vo8q2e8oaDzjPJzlmyX7WCX/d4Rwhvc2bs6y5+tl3Vz2fJ5ej
	u9e+3p/H7KMlLLXIpvdA7benAr/Erq45IPqZf6MSS3FGoqEWc1FxIgBdkrABQwIAAA==
Subject: DISK_SIGNATURE no longer functional
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
X-List-Received-Date: Sat, 20 May 2017 17:16:47 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA13093A0ESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA13093A0ESSEX01essvotec_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

I am trying to create a generic MSDOS PC_BIOS hdddirect image with a root p=
artition set by the DISK_SIGNATURE.
SYSLINUX_ROOT =3D "root=3DPARTUUID=3D${DISK_SIGNATURE}-02"

However the signature generated in syslinux.cfg and the one on the disk don=
't match.
I tried defining my own signature and the one in syslinux changes, but the =
one on the disk doesn't match.

root=3DPARTUUID=3D22aaf83b-02

NAME   PARTUUID
sdd
=86=80sdd2 341e84a7-02
=86=80sdd3 341e84a7-03
=84=80sdd1 341e84a7-01

--_000_655290B7709079438B7932553958E60DA13093A0ESSEX01essvotec_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
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
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"Section1">
<p class=3D"MsoNormal">I am trying to create a generic MSDOS PC_BIOS hdddir=
ect image with a root partition set by the DISK_SIGNATURE.<o:p></o:p></p>
<p class=3D"MsoNormal">SYSLINUX_ROOT =3D &quot;root=3DPARTUUID=3D${DISK_SIG=
NATURE}-02&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">However the signature generated in syslinux.cfg and =
the one on the disk don&#8217;t match.<o:p></o:p></p>
<p class=3D"MsoNormal">I tried defining my own signature and the one in sys=
linux changes, but the one on the disk doesn&#8217;t match.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root=3DPARTUUID=3D22aaf83b-02<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">NAME&nbsp;&nbsp; PARTUUID<o:p></o:p></p>
<p class=3D"MsoNormal">sdd&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;">=86</span>=80sdd2 341e84a7-02<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;">=86</span>=80sdd3 341e84a7-03<o:p></o:p></p>
<p class=3D"MsoNormal">=84=80sdd1 341e84a7-01 <o:p></o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60DA13093A0ESSEX01essvotec_--
