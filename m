Return-Path: <nick.lewis@usa.g4s.com>
X-Greylist: delayed 409 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Aug 2014 10:20:58 UTC
Received: from mail1.bemta14.messagelabs.com (mail1.bemta14.messagelabs.com
	[193.109.254.114])
	by mail.openembedded.org (Postfix) with ESMTP id E9EA560169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 10:20:58 +0000 (UTC)
Received: from [85.158.140.195:41010] by server-10.bemta-14.messagelabs.com id
	51/E4-06615-1F1D1F35; Mon, 18 Aug 2014 10:14:09 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-2.tower-193.messagelabs.com!1408356849!15428490!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8120 invoked from network); 18 Aug 2014 10:14:09 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-2.tower-193.messagelabs.com with RC4-SHA encrypted SMTP;
	18 Aug 2014 10:14:09 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Mon, 18 Aug 2014
	11:14:09 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 11:14:08 +0100
Thread-Topic: image build with python fails due to missing berkeley db 5.3
Thread-Index: Ac+6zMbez4Ds+snzSuW+U7sSfo4oBg==
Message-ID: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45E56@GBTWK10E001.Technology.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: image build with python fails due to missing berkeley db 5.3
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
X-List-Received-Date: Mon, 18 Aug 2014 10:21:05 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AAE0766F5AF36B46BAB7E0EFB927320633FFF45E56GBTWK10E001Te_"

--_000_AAE0766F5AF36B46BAB7E0EFB927320633FFF45E56GBTWK10E001Te_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My image build on yocto master fails reporting that python-bsddb cannot be =
installed as no package provides libdb-5.3.so. On examination it is evident=
 that the "bitbake db" command builds BerkeleyDB 6.0 instead of 5.3

As an experiment I temporarily renamed the "recipe-support/db_6.0.30.bb" re=
cipe in order to force the "recipe-support/db_5.3.28.bb" recipe to run (I g=
uess there is a proper way to do this with preferred provider but I cannot =
remember how). The db_5.3.28.bb recipe ran but failed on missing include "#=
include <iostream.h>" in tmp/work/cortexa9hf-neon-poky-linux-gnueabi/db/5.3=
.28-r0/db-5.3.28/build_unix/db_cxx.h

As an experiment I added "#define HAVE_CXX_STDHEADERS" to the top of this f=
ile (I guess I should have made a patch or passed it from the recipe). The =
db_5.3.28.bb recipe then built okay and the image build stopped complaining=
 about missing libdb-5.3 when installing python-bsddb

Does anyone else have this issue? Should python-bsddb be using BerkeleyDB 6=
.0 now?

Best Regards
Nick

Nick Lewis
nick.lewis@usa.g4s.com<mailto:nick.lewis@usa.g4s.com>
+44 1684 277137<tel:+441684277137>
www.g4stechnology.com<http://www.g4stechnology.com/>
New Challenge House, International Drive, Tewkesbury, Gloucestershire, GL20=
 8UQ, UK

P Please consider the environment before printing this email


________________________________
The details of this company are as follows:
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.

This communication may contain information which is confidential, personal =
and/or privileged.

It is for the exclusive use of the intended recipient(s).
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.

Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.

Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.

This e-mail has been scanned for all viruses by MessageLabs.

--_000_AAE0766F5AF36B46BAB7E0EFB927320633FFF45E56GBTWK10E001Te_
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
@font-face
	{font-family:Webdings;
	panose-1:5 3 1 2 1 5 9 6 7 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">My image build on yocto master fails reporting that =
python-bsddb cannot be installed as no package provides libdb-5.3.so. On ex=
amination it is evident that the &#8220;bitbake db&#8221; command builds Be=
rkeleyDB 6.0 instead of 5.3<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As an experiment I temporarily renamed the &#8220;re=
cipe-support/db_6.0.30.bb&#8221; recipe in order to force the &#8220;recipe=
-support/db_5.3.28.bb&#8221; recipe to run (I guess there is a proper way t=
o do this with preferred provider but I cannot remember how).
 The db_5.3.28.bb recipe ran but failed on missing include &#8220;#include =
&lt;iostream.h&gt;&#8221; in tmp/work/cortexa9hf-neon-poky-linux-gnueabi/db=
/5.3.28-r0/db-5.3.28/build_unix/db_cxx.h<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As an experiment I added &#8220;#define HAVE_CXX_STD=
HEADERS&#8221; to the top of this file (I guess I should have made a patch =
or passed it from the recipe). The db_5.3.28.bb recipe then built okay and =
the image build stopped complaining about missing
 libdb-5.3 when installing python-bsddb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does anyone else have this issue? Should python-bsdd=
b be using BerkeleyDB 6.0 now?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Nick<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,&quot;sans-serif&quot;;color:black;mso-fareast-language:EN-GB"=
>Nick Lewis<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;;color:black;mso-fareast-language:EN-GB"><a=
 href=3D"mailto:nick.lewis@usa.g4s.com">nick.lewis@usa.g4s.com</a><o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;;color:black;mso-fareast-language:EN-GB"><a=
 href=3D"tel:&#43;441684277137">&#43;44 1684 277137</a><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><a href=
=3D"http://www.g4stechnology.com/">www.g4stechnology.com</a><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D;mso-fare=
ast-language:EN-GB">New Challenge House, International Drive, Tewkesbury, G=
loucestershire, GL20 8UQ, UK<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:Webdi=
ngs;color:#00B050;mso-fareast-language:EN-GB"><o:p>&nbsp;</o:p></span></b><=
/p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:Webdi=
ngs;color:#00B050;mso-fareast-language:EN-GB">P</span></b><b><span style=3D=
"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;colo=
r:#00B050;mso-fareast-language:EN-GB"> Please consider the
 environment before printing this email</span></b><b><span style=3D"font-fa=
mily:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#00B050;mso-fareast-lan=
guage:EN-GB"><o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<br>
<hr>
<font face=3D"Arial" color=3D"Gray" size=3D"1">The details of this company =
are as follows:<br>
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.<br>
<br>
This communication may contain information which is confidential, personal =
and/or privileged.<br>
<br>
It is for the exclusive use of the intended recipient(s).<br>
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.<br>
<br>
Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.<br>
<br>
Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.<br>
<br>
This e-mail has been scanned for all viruses by MessageLabs.<br>
</font>
</body>
</html>

--_000_AAE0766F5AF36B46BAB7E0EFB927320633FFF45E56GBTWK10E001Te_--
