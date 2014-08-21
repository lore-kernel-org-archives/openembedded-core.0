Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3867865D56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 16:47:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7LGlsl6015413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 09:47:55 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.39]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Thu, 21 Aug 2014 09:47:54 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: INCOMPATIBLE_LICENSE - native vs target
Thread-Index: Ac+9XwnLnHWDpgQyS0+2f5lS4HfiDA==
Date: Thu, 21 Aug 2014 16:47:54 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF845CC0FECE@ALA-MBB.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
Subject: INCOMPATIBLE_LICENSE - native vs target
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
X-List-Received-Date: Thu, 21 Aug 2014 16:47:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF845CC0FECEALAMBBcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF845CC0FECEALAMBBcorpadwrs_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there some way to specify incompatible licenses for native recipes?  An =
alternate mechanism might work,
but here is a case in which it would be valuable:

If I do not allow AGPL licenses, rpm builds with db-5.  rpm-native builds w=
ith db-6.  When you try
to run rpm on the target it gets very upset, apparently with the database. =
 In any event, it is happy
if both rpm and rpm-native use db-6.

In this particular case, there could be some way, although I don't know wha=
t, to force rpm-native to
use the same db version as the target, but that doesn't sound like a great =
idea.

Joe


--_000_007BD92917A2324FA403BCF9A464CF845CC0FECEALAMBBcorpadwrs_
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
<p class=3D"MsoNormal">Is there some way to specify incompatible licenses f=
or native recipes?&nbsp; An alternate mechanism might work,<o:p></o:p></p>
<p class=3D"MsoNormal">but here is a case in which it would be valuable:<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If I do not allow AGPL licenses, rpm builds with db-=
5.&nbsp; rpm-native builds with db-6.&nbsp; When you try<o:p></o:p></p>
<p class=3D"MsoNormal">to run rpm on the target it gets very upset, apparen=
tly with the database.&nbsp; In any event, it is happy<o:p></o:p></p>
<p class=3D"MsoNormal">if both rpm and rpm-native use db-6.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In this particular case, there could be some way, al=
though I don't know what, to force rpm-native to<o:p></o:p></p>
<p class=3D"MsoNormal">use the same db version as the target, but that does=
n't sound like a great idea.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Joe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF845CC0FECEALAMBBcorpadwrs_--
