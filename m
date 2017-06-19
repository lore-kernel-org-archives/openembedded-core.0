Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id B312E7820F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 21:28:59 +0000 (UTC)
X-AuditID: 0a00029b-951ff70000000a36-82-59484219dd3c
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	87.F8.02614.91248495; Mon, 19 Jun 2017 16:28:59 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Mon, 19 Jun 2017 16:28:57 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "Aaron_Wright@selinc.com" <Aaron_Wright@selinc.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Yocto Extensible SDK (eSDK) and CMake
Thread-Index: AQHS6UIw3ArDCR0wY0uLGBNYBZho3aIssvoA
Date: Mon, 19 Jun 2017 21:28:57 +0000
Message-ID: <655290B7709079438B7932553958E60DA13193EF@ESS-EX01.essvote.corp.local>
References: <OFF99D52E7.784FCCB0-ON88258144.00749469-88258144.0075679D@selinc.com>
In-Reply-To: <OFF99D52E7.784FCCB0-ON88258144.00749469-88258144.0075679D@selinc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsWyRiBPQ1faySPSYOtqJYvJa2cxW9z5+Y7d
	gcnj3MYVjB57bnxiDmCK4rJJSc3JLEst0rdL4Mr4/W49Y8GpoIoj5xezNTAu9epi5OCQEDCR
	+PKGu4uRi0NI4CijxKGH6xghnFmMEgsvrQZyODnYBIwkzl3fBJYQEZjEKLG55xArSEJYwEZi
	3rrPbCC2iICtxNkvr1ggbCOJu8f62EFsFgFVifazu5lAbF6BIIlvW+aA1QgB2X1/LoPFOQWC
	JR61/AazGQXEJL6fWgNmMwuIS9x6Mh/MlhAQkFiy5zwzhC0q8fLxP1YIW07iXVMbK0R9vsSG
	g+vZIHYJSpyc+YRlAqPwLCSjZiEpm4WkbAEj8ypGvlwjvdTi4rL8klS95PzcTYzAkOZiYJq9
	g7GnKfYQowAHoxIP74LX7pFCrIllxZW5hxilOViUxHnFQi0ihQTSE0tSs1NTC1KL4otKc1KL
	DzEycXCCCC6pBsYFe3YrmXAXTfvCd6LoTbporXco87flZQdut31+OXGtXvjxO5+brjPurPZt
	uxZruX5DhOuabt8VBXHMRbbrg12sZgfv2Tih54HH5urAJAWtd4pMTOq8vsvPTbS+oB2111KW
	9/vci7earjls3el82PnJp/1t6SsFq6oez3/tO4fpcZlriN27xNtKLMUZiYZazEXFiQAiPGPS
	TwIAAA==
Subject: Re: Yocto Extensible SDK (eSDK) and CMake
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
X-List-Received-Date: Mon, 19 Jun 2017 21:29:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA13193EFESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA13193EFESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Aaron,

You are not missing anything.  I just emailed the same bug to the mailing l=
ist a few hours ago.
[OE-core] [OE-CORE][pyro] Cmake Alias Broken
The alias ends up in a location that doesn't get correctly applied.
This causes the cmake to not have the correct toolchain file and start usin=
g host libraries which is not good.
I am trying to figure out how to fix it, but someone else may come up with =
a patch well before I get around to it.

Mike


From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Aaron_Wright@selinc.com
Sent: Monday, June 19, 2017 4:22 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] Yocto Extensible SDK (eSDK) and CMake

I've been trying to figure out some workflows for my developers using the e=
SDK, and I am running into a roadblock with CMake. I would love for my deve=
lopers to be able to run build tools that they're familiar with, such as au=
totools, CMake, and make, but the required command line to CMake to get it =
to work right is much too long.

A stackoverflow question (https://stackoverflow.com/questions/41964891/yoct=
o-sdk-with-cmake-toolchain-file[stackoverflow.com]<https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__stackoverflow.com_questions_41964891_yocto-2=
Dsdk-2Dwith-2Dcmake-2Dtoolchain-2Dfile&d=3DDwMBAg&c=3DzVFQZQ67ypsA9mYKSCqWm=
QHiVkCCaN-Gb60_N6TVnLk&r=3Dak_pMnzuMKndrbvJGok-seoFenjTGhP3oPNUzKUOwzHhGpNM=
wSJsaHunyXDlBGjO&m=3DeSDGDMNHufVzPE8auZWFVn-tHcve220-IgczS5MR6Oc&s=3Dtq3czs=
cbBcY8BjXvD1J_53wlPnE6XjryI8yzzMPPd_Y&e=3D>) seems to address this for the =
SDK, but the solution presented doesn't work for the eSDK.

I created a new question on stackoverflow (https://stackoverflow.com/questi=
ons/44598647/yocto-extensible-sdk-esdk-and-cmake[stackoverflow.com]<https:/=
/urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__stackoverflow.com_questions=
_44598647_yocto-2Dextensible-2Dsdk-2Desdk-2Dand-2Dcmake&d=3DDwMBAg&c=3DzVFQ=
ZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=3Dak_pMnzuMKndrbvJGok-seoFenjTGhP=
3oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&m=3DeSDGDMNHufVzPE8auZWFVn-tHcve220-IgczS=
5MR6Oc&s=3D_SisNaFvLXKa912DqmXImCDmGjJ1hM-jyzOf09zlcUU&e=3D>) to address th=
is in the eSDK.

The meta/recipes-devtools/cmake/cmake_3.6.1.bb file references an  environm=
ent-setup.d/cmake.sh file as part of a nativesdk package, but that doesn't =
seem to get installed when I install the eSDK.

Am I missing something simple?

--_000_655290B7709079438B7932553958E60DA13193EFESSEX01essvotec_
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
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Lucida Console";
	panose-1:2 11 6 9 4 5 4 2 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D">Aaron,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D">You are not missing anything.&nbsp; I just emailed the same =
bug to the mailing list a few hours ago.&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D">[OE-core] [OE-CORE][pyro] Cmake Alias Broken<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D">The alias ends up in a location that doesn&#8217;t get corre=
ctly applied.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D">This causes the cmake to not have the correct toolchain file=
 and start using host libraries which is not good.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D">I am trying to figure out how to fix it, but someone else ma=
y come up with a patch well before I get around to it.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D">Mike<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;
color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> openembe=
dded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@=
lists.openembedded.org]
<b>On Behalf Of </b>Aaron_Wright@selinc.com<br>
<b>Sent:</b> Monday, June 19, 2017 4:22 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> [OE-core] Yocto Extensible SDK (eSDK) and CMake<o:p></o:p><=
/span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;">I've been trying to figure out some workf=
lows for my developers using the eSDK, and I am running into a roadblock wi=
th CMake. I would love for my developers to be able to run
 build tools that they're familiar with, such as autotools, CMake, and make=
, but the required command line to CMake to get it to work right is much to=
o long.</span>
<br>
<br>
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;">A stackoverflow question (</span><a href=3D"https://urldefense.p=
roofpoint.com/v2/url?u=3Dhttps-3A__stackoverflow.com_questions_41964891_yoc=
to-2Dsdk-2Dwith-2Dcmake-2Dtoolchain-2Dfile&amp;d=3DDwMBAg&amp;c=3DzVFQZQ67y=
psA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&amp;r=3Dak_pMnzuMKndrbvJGok-seoFenjTGhP3=
oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&amp;m=3DeSDGDMNHufVzPE8auZWFVn-tHcve220-Ig=
czS5MR6Oc&amp;s=3Dtq3czscbBcY8BjXvD1J_53wlPnE6XjryI8yzzMPPd_Y&amp;e=3D"><sp=
an style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif=
&quot;">https://stackoverflow.com/questions/41964891/yocto-sdk-with-cmake-t=
oolchain-file</span>[stackoverflow.com]</a><span style=3D"font-size:10.0pt;=
font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">)
 seems to address this for the SDK, but the solution presented doesn't work=
 for the eSDK.
</span><br>
<br>
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;">I created a new question on stackoverflow (</span><a href=3D"htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__stackoverflow.com_quest=
ions_44598647_yocto-2Dextensible-2Dsdk-2Desdk-2Dand-2Dcmake&amp;d=3DDwMBAg&=
amp;c=3DzVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&amp;r=3Dak_pMnzuMKndrbv=
JGok-seoFenjTGhP3oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&amp;m=3DeSDGDMNHufVzPE8au=
ZWFVn-tHcve220-IgczS5MR6Oc&amp;s=3D_SisNaFvLXKa912DqmXImCDmGjJ1hM-jyzOf09zl=
cUU&amp;e=3D"><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;=
,&quot;sans-serif&quot;">https://stackoverflow.com/questions/44598647/yocto=
-extensible-sdk-esdk-and-cmake</span>[stackoverflow.com]</a><span style=3D"=
font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">)
 to address this in the eSDK.</span> <br>
<br>
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;">The </span><span style=3D"font-size:7.5pt;font-family:&quot;Luci=
da Console&quot;">meta/recipes-devtools/cmake/cmake_3.6.1.bb</span><span st=
yle=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot=
;"> file references
 an &nbsp;environment-setup.d/cmake.sh file as part of a nativesdk package,=
 but that doesn't seem to get installed when I install the eSDK.</span>
<br>
<br>
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;">Am I missing something simple?</span><o:p></o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60DA13193EFESSEX01essvotec_--
