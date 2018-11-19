Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 19FB26C10D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:00:59 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id wAJF0xYO007909
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 19 Nov 2018 16:00:59 +0100
Received: from ATNETS99132MSX.ww300.siemens.net
	(atnets99132msx.ww300.siemens.net [158.226.163.55])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTPS id wAJF0xYE017326
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 19 Nov 2018 16:00:59 +0100
Received: from ATNETS9912WMSX.ww300.siemens.net ([169.254.10.142]) by
	ATNETS99132MSX.ww300.siemens.net ([158.226.163.55]) with mapi id
	14.03.0415.000; Mon, 19 Nov 2018 16:00:59 +0100
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: Update sdk dummy providers
Thread-Index: AdSAGK5Gqkk3i+EYRfOAk2tI/tEfvg==
Date: Mon, 19 Nov 2018 15:00:58 +0000
Message-ID: <D55698ECEC159B488D62A508E18D7FEC01696588@ATNETS9912WMSX.ww300.siemens.net>
Accept-Language: en-US, de-AT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.15]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Update sdk dummy providers
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
X-List-Received-Date: Mon, 19 Nov 2018 15:01:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_D55698ECEC159B488D62A508E18D7FEC01696588ATNETS9912WMSXw_"

--_000_D55698ECEC159B488D62A508E18D7FEC01696588ATNETS9912WMSXw_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

I would like to ask You a question about your commit (http://git.yoctoproje=
ct.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/meta/dummy-sdk-package.i=
nc?id=3D0d0984e1e616c9f1c211b7b980ba2ca54c096e6e) to update sdk providers. =
I have found an issue regarding to buildtools.

ERROR:  OE-core's config sanity checker detected a potential misconfigurati=
on.
    Either fix the cause of this error or at your own risk disable the chec=
ker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Required perl module(s) not found: Text::ParseWords Thread::Queue Data:=
:Dumper


After analyzing, I have found, that buildtools-tarball contains a nativesdk=
-perl (in manifest), which I guess should be excluded.

I have found, that after removing comments your comments of d.appendVar("RC=
ONFLICTS_%s" % p, "${DUMMYPROVIDES}") and RREPLACES_%s in meta/recipes-core=
/meta/dummy-sdk-package.inc it works. Is there any reason, why You have com=
mented out?



Regards,

Andrej


--_000_D55698ECEC159B488D62A508E18D7FEC01696588ATNETS9912WMSXw_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
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
	{margin:0cm;
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
code
	{mso-style-priority:99;
	font-family:"Courier New";}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Arial","sans-serif";
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;">Hello Richard,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;">I would like to ask You a question about =
your commit (<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/comm=
it/meta/recipes-core/meta/dummy-sdk-package.inc?id=3D0d0984e1e616c9f1c211b7=
b980ba2ca54c096e6e">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/m=
eta/recipes-core/meta/dummy-sdk-package.inc?id=3D0d0984e1e616c9f1c211b7b980=
ba2ca54c096e6e</a>)
 to update sdk providers. I have found an issue regarding to buildtools.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ERROR:&nbsp; OE-core's config sanity checker detected a po=
tential misconfiguration.</span><span style=3D"font-size:10.0pt;font-family=
:&quot;Courier New&quot;"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;"=
>&nbsp;&nbsp;&nbsp; Either fix the cause of this error or at your own risk =
disable the checker (see sanity.conf).</span><span style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;"=
>&nbsp;&nbsp;&nbsp; Following is the list of potential problems / advisorie=
s:</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot=
;"><br>
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;"=
>&nbsp;&nbsp;&nbsp; Required perl module(s) not found: Text::ParseWords Thr=
ead::Queue Data::Dumper
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<pre><span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">A=
fter analyzing, I have found, that buildtools-tarball contains a nativesdk-=
perl (in manifest), which I guess should be excluded.<o:p></o:p></span></pr=
e>
<pre><span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">I=
 have found, that after removing comments your comments of </span>d.appendV=
ar(&quot;RCONFLICTS_%s&quot; % p, &quot;${DUMMYPROVIDES}&quot;) <span style=
=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">and </span>RREPLA=
CES_%s<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">=
 in </span>meta/recipes-core/meta/dummy-sdk-package.inc <span style=3D"font=
-family:&quot;Arial&quot;,&quot;sans-serif&quot;">it works. Is there any re=
ason, why You have commented out?<o:p></o:p></span></pre>
<pre><span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;"><=
o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">R=
egards,<o:p></o:p></span></pre>
<pre><span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">A=
ndrej</span><o:p></o:p></pre>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_D55698ECEC159B488D62A508E18D7FEC01696588ATNETS9912WMSXw_--
