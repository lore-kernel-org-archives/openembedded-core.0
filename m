Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 19CB060851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 22:30:20 +0000 (UTC)
X-AuditID: 0a00029b-de1ff70000000a0a-bc-5ae3a47da3dc
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	FC.52.02570.D74A3EA5; Fri, 27 Apr 2018 17:30:21 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%20]) with mapi
	id 14.03.0301.000; Fri, 27 Apr 2018 17:30:20 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]npm offline builds
Thread-Index: AdPed1I9XDrAJ9L1QHez2qi8MrSpVA==
Date: Fri, 27 Apr 2018 22:30:18 +0000
Message-ID: <655290B7709079438B7932553958E60DA147C321@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.33]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsWyRiBPQ7d2yeMog9bXshZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxsyFJ1gL5spWHN66lrGBcYNkFyMnh4SAiUTj113sXYxcHEIC
	RxklDl7awwjhnGSU2LG9hwmkik3ASOLc9U2MILaIQLTE0hkz2UFsYQEVieUv70LFNSXeN12D
	svUktjzfC2RzcLAIqEq8W2AIEuYVCJJonbYFbCSjgJjE91NrwGxmAXGJW0/mM0EcJCCxZM95
	ZghbVOLl43+sIGMkBOQkDt+KhCjPl7g+dyMzxEhBiZMzn7BMYBSchWTSLCRls5CUQcR1JBbs
	/sQGYWtLLFv4mhnGPnPgMROy+AJG9lWMfLlGeqnFxWX5Jal6yfm5mxiBoc7FwDR7B2NPU+wh
	RgEORiUe3ic9j6OEWBPLiitzDzFKc7AoifMGXDGKEhJITyxJzU5NLUgtii8qzUktPsTIxMEJ
	IrikGhjzVC/qSvMsmLWWzUdSwO0yt1ZG6uHbwTycD4Xcn0+26T15bk3I9cr93frzWL85zP9p
	wvbtsaoMX5rsyoMnpTOjXZjYEhTffDllrp45TftZrcXyx1e1Fnju2VsqMPPdrd/LNqmp8SyY
	ftM6OnX/10NV9ztNY5j4PE6xiWenWy/tqn0huL/+p4YSS3FGoqEWc1FxIgBzKcwCWwIAAA==
Subject: npm offline builds
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
X-List-Received-Date: Fri, 27 Apr 2018 22:30:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA147C321ESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA147C321ESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a been working on getting npm v5 (nodejs 8+) offline builds working =
again.
I have a solution I am currently testing, but it is going to break current =
npm recipes which would need to be regenerated with recipetool  / devtool.
Do I need to worry about backwards compatibility for those still working wi=
th older recipes or is the upgrade path to 8 good enough?

Additionally I have the choice between preferring offline mode( it goes to =
the internet if the cache doesn't work), or forcing offline mode.
Should I only force offline if the BB_NO_NETWORK is enabled?

Thanks,
Mike




--_000_655290B7709079438B7932553958E60DA147C321ESSEX01essvotec_
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
<p class=3D"MsoNormal">I have a been working on getting npm v5 (nodejs 8&#4=
3;) offline builds working again.<o:p></o:p></p>
<p class=3D"MsoNormal">I have a solution I am currently testing, but it is =
going to break current npm recipes which would need to be regenerated with =
recipetool &nbsp;/ devtool.<o:p></o:p></p>
<p class=3D"MsoNormal">Do I need to worry about backwards compatibility for=
 those still working with older recipes or is the upgrade path to 8 good en=
ough?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Additionally I have the choice between preferring of=
fline mode( it goes to the internet if the cache doesn&#8217;t work), or fo=
rcing offline mode.<o:p></o:p></p>
<p class=3D"MsoNormal">Should I only force offline if the BB_NO_NETWORK is =
enabled?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Mike<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60DA147C321ESSEX01essvotec_--
