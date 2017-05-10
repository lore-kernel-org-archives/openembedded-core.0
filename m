Return-Path: <prvs=5303f0d878=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 5BE1760107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:47:27 +0000 (UTC)
X-AuditID: 0a000213-dcfff7000000261c-d0-59136e4c3e47
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	75.0E.09756.C4E63195; Wed, 10 May 2017 14:47:27 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 May 2017 14:47:24 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE][morty]NPM and BB_NO_NETWORK
Thread-Index: AdLJxj1Obgqj+er6SPqlR+8N61A7sQ==
Date: Wed, 10 May 2017 19:47:23 +0000
Message-ID: <655290B7709079438B7932553958E60D16D2C8FF@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: Aw33 CPdd C4+t D2/s Fl9f GID2 GTiP GchZ HbPq HhQ0 H2pX
	Iivu JCxo JHJw KsS0 Kx2R; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA=;
	Sosha1_v1; 7; {F84A8E01-8D58-42DC-8334-EB2D3C1C985A};
	bQBpAGMAaABhAGUAbAAuAGQAYQB2AGkAcwBAAGUAcwBzAHYAbwB0AGUALgBjAG8AbQA=;
	Wed, 10 May 2017 19:47:21 GMT;
	WwBPAEUALQBDAE8AUgBFAF0AWwBtAG8AcgB0AHkAXQBOAFAATQAgAGEAbgBkACAAQgBCAF8ATgBPAF8ATgBFAFQAVwBPAFIASwA=
x-cr-puzzleid: {F84A8E01-8D58-42DC-8334-EB2D3C1C985A}
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWyRiBPQ9c/TzjSYMknE4s7P9+xOzB6nNu4
	gjGAMYrbJimxpCw4Mz1P3y6BO2PywRmMBRs1Kl7PXsDWwDhXuYuRk0NCwESif+9Fti5GLg4h
	gROMEvfmzYZyZjFKbPl+hwmkik3ASOLc9U2MILaIQLTE0hkz2UFsYQE9ib7zh1m7GDmA4sYS
	Z/bFQ5ToSUzYegisnEVAVeLuykVgY3gFgiQ2XFzBAmIzCohJfD+1BizOLCAucevJfCaIgwQk
	luw5zwxhi0q8fPyPFeQeCYErzBJr5qxigUiYShzrW84IYctJvGtqY4UYlC+xYMZxRohlghIn
	Zz5hmcAoPAvJjllIymYhKVvAyLyKUTA3MTPHUC+1uLgsvyRVLzk/dxMjMIy5GJiEdzDOmWJ7
	iFGAg1GJh/cCn3CkEGtiWXFl7iFGaQ4WJXHeZyuZI4UE0hNLUrNTUwtSi+KLSnNSiw8xMnFw
	HmKU4OCSEilOzUtJLUosLcmIB0VLfDEwXqQaGHXeNu++uP1c3/vAix6f2g488G3OC441Pu7q
	cWTzpQU87k7yFW82Oy+/NOXXulcdysy9AQ/v/V68csPXlcGX9Ey/SWY6axfc3rdRTlOmoij8
	pFSwg/TuxPxPUmUeOeXxmYZbGnclfnsqYqK+wbcnyyR49uZVz2cevq6otzElXSbxTyLnnJ9u
	GUosxRmJhlrMRcWJAPM2OYNfAgAA
Subject: [morty]NPM and BB_NO_NETWORK
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
X-List-Received-Date: Wed, 10 May 2017 19:47:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60D16D2C8FFESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60D16D2C8FFESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am having an issue with npm sources and BB_GENERATE_MIRROR_TARBALLS.
The tarballs generate fine, but then when you try to use them with prefetch=
 only or no network the system won't find them.
It then tries to download them.   Tried it both on morty and master with th=
e same issue.

This is my first real python experience, but I think I got it tracked down =
to uri_replace.

Example debug line of a working git replace vs a non working npm one.

DEBUG: For url ['git', 'git.yoctoproject.org', '/psplash', '', '', OrderedD=
ict()] comparing ['git', '.*', '/.*', '', '', OrderedDict()] to ['file', ''=
, '/build/downloads/', '', '', OrderedDict()]
DEBUG: For url git://git.yoctoproject.org/psplash returning file:///build/d=
ownloads/git2_git.yoctoproject.org.psplash.tar.gz<file:///\\build\downloads=
\git2_git.yoctoproject.org.psplash.tar.gz>

DEBUG: For url ['npm', 'registry.npmjs.org', '', '', '', OrderedDict([('nam=
e', 'nopt'), ('version', '3.0.6'), ('subdir', 'node_modules/nopt')])] compa=
ring ['npm', '.*', '/.*', '', '', OrderedDict()] to ['file', '', '/build/do=
wnloads/', '', '', OrderedDict()]

Don't know if maybe the OrderedDict vs the path is causing the issue or not=
.


--_000_655290B7709079438B7932553958E60D16D2C8FFESSEX01essvotec_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
<p class=3D"MsoNormal">I am having an issue with npm sources and BB_GENERAT=
E_MIRROR_TARBALLS.<o:p></o:p></p>
<p class=3D"MsoNormal">The tarballs generate fine, but then when you try to=
 use them with prefetch only or no network the system won&#8217;t find them=
.<o:p></o:p></p>
<p class=3D"MsoNormal">It then tries to download them.&nbsp;&nbsp; Tried it=
 both on morty and master with the same issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is my first real python experience, but I think=
 I got it tracked down to uri_replace.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Example debug line of a working git replace vs a non=
 working npm one.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">DEBUG: For url ['git', 'git.yoctoproject.org', '/psp=
lash', '', '', OrderedDict()] comparing ['git', '.*', '/.*', '', '', Ordere=
dDict()] to ['file', '', '/build/downloads/', '', '', OrderedDict()]<o:p></=
o:p></p>
<p class=3D"MsoNormal">DEBUG: For url git://git.yoctoproject.org/psplash re=
turning <a href=3D"file:///\\build\downloads\git2_git.yoctoproject.org.pspl=
ash.tar.gz">
file:///build/downloads/git2_git.yoctoproject.org.psplash.tar.gz</a><o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">DEBUG: For url ['npm', 'registry.npmjs.org', '', '',=
 '', OrderedDict([('name', 'nopt'), ('version', '3.0.6'), ('subdir', 'node_=
modules/nopt')])] comparing ['npm', '.*', '/.*', '', '', OrderedDict()] to =
['file', '', '/build/downloads/',
 '', '', OrderedDict()]<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Don&#8217;t know if maybe the OrderedDict vs the pat=
h is causing the issue or not.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60D16D2C8FFESSEX01essvotec_--
