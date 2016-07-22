Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4E46067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 23:41:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6MNewVn016224
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 16:41:00 -0700
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.195]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Fri, 22 Jul 2016 16:40:56 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: odd problem finding oe-gnome-terminal-phonehome
Thread-Index: AdHkcQVn4jnCJDRuTc+Zx9rjdQmfUw==
Date: Fri, 22 Jul 2016 23:40:55 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84B61EB990@ALA-MBA.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.160]
MIME-Version: 1.0
Cc: +lpd-eng-userspace <lpd-eng-userspace@sympa-int.wrs.com>
Subject: odd problem finding oe-gnome-terminal-phonehome
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
X-List-Received-Date: Fri, 22 Jul 2016 23:41:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF84B61EB990ALAMBAcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF84B61EB990ALAMBAcorpadwrs_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm seeing strange behavior in terminal.py since the use of oe-gnome-termin=
al-phonehome was added.  If the script is on
my "base" path before starting a bitbake shell, everything is fine.  If it =
is under oe-core/scripts, terminal.py does not find it.  If I manually sear=
ch PATH in terminal.py, I
will find it in oe-core/scripts and I can pass the full name when construct=
ing sh_cmd.  That works fine, too.

I am wondering if something is not right with env as it is passed to XTermi=
nal.__init__(self, sh_cmd, title, env, d), but that is just a wild guess.

Joe


--_000_007BD92917A2324FA403BCF9A464CF84B61EB990ALAMBAcorpadwrs_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
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
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I'm seeing strange behavior in terminal.py since the=
 use of oe-gnome-terminal-phonehome was added.&nbsp; If the script is on<o:=
p></o:p></p>
<p class=3D"MsoNormal">my &quot;base&quot; path before starting a bitbake s=
hell, everything is fine.&nbsp; If it is under oe-core/scripts, terminal.py=
 does not find it.&nbsp; If I manually search PATH in terminal.py, I<o:p></=
o:p></p>
<p class=3D"MsoNormal">will find it in oe-core/scripts and I can pass the f=
ull name when constructing sh_cmd.&nbsp; That works fine, too.<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am wondering if something is not right with env as=
 it is passed to XTerminal.__init__(self, sh_cmd, title, env, d), but that =
is just a wild guess.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Joe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF84B61EB990ALAMBAcorpadwrs_--
