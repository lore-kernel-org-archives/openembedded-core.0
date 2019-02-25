Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id E65137C60D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 19:39:40 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id y5so4958164plk.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:content-language
	:thread-index; bh=9Wzmat26S8m41eW4xqZ8HmG4AhN/0ljicCisxjtqHn8=;
	b=tQ6LCsKtuGXcZGNcioa7Jd8Q2bJ0X2ltsBc9BHctIlC5bEQT0nZ7TcFZUOWi4rHMyB
	8yl5VuaE9f5LZopXRZdK+5ywbTfVlCsaIHc5oAU9XKpH0FEPlcxjao4yHUoFBuKfKdXs
	gX6Hs0ztz7hWsAXM2wZOkKTaBQ2iWd3DlUp5nVKMXDaMMQjPpnB7LDBNmClOIL3Yio/i
	6aE8/NTtb7hGUX7szzmp5yb0H7bMf226NhgUyQ/lfy9CP2f79it1L+2+peA81Ix9exBW
	wl+Vut9kLmrNk2sYBDYH8DJBQQCqxNMzVzzdYOLWTwPr1ScoQzbKvxoyb48LFU2kUKc5
	aGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-language:thread-index;
	bh=9Wzmat26S8m41eW4xqZ8HmG4AhN/0ljicCisxjtqHn8=;
	b=PoLVIxTwpwhhOqphP6rW9KM+NciSTiHhd/8Ypcelljwes9gCtsjs1gA5DE3wKF+I/G
	otNCFGL3e3fqQgFbMzQ8D8Azu+HK53+gWdgbqk/cl3oib+x6ip/Dtytdkp+sViHrz43z
	xqOcrh89FB7Zr0TCFLnmckxMszVWkP3VQsQl7pP1Y8LfvBR6ipenSSXGgibB4zP8fHoz
	spR7YA94JoX0DlBsCSy9woSpiJtcj2ChkI7EuAjeeQeDa85iZJr1Mx+RU8YJvWtbFYDc
	U9+PAawe3+7qUtywpWL2r8l0pUVM6FnwLDtWDcfCJIphh2TbqdKLTb9calgIC8RUBiT5
	2zpw==
X-Gm-Message-State: AHQUAuZgSz8kug9xicJzF6t4mv9/f4/bxaPa1sssihYFl6m1g9peDBUy
	rJNDCVse9lteOwuOXQo0euk/kJ2P
X-Google-Smtp-Source: AHgI3IYO4G9lwE5ncJGp1F4qmC0ggtg8Il578OLT5LNU8SuTee8Py3R5AyvsZ5JKsY5SKyx9wyOQBA==
X-Received: by 2002:a17:902:e711:: with SMTP id
	co17mr21694443plb.171.1551123581694; 
	Mon, 25 Feb 2019 11:39:41 -0800 (PST)
Received: from sjolley (c-71-59-136-149.hsd1.or.comcast.net. [71.59.136.149])
	by smtp.gmail.com with ESMTPSA id
	j4sm13944180pfn.132.2019.02.25.11.39.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 11:39:40 -0800 (PST)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Feb 2019 11:39:40 -0800
Message-ID: <017301d4cd41$da081c80$8e185580$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIzYHlkwwUGiIlspGIPIMKTYck2OA==
Subject: Yocto Project Unassigned Bugs - Help Needed
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
X-List-Received-Date: Mon, 25 Feb 2019 19:39:41 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0174_01D4CCFE.CBE551B0"
Content-Language: en-us

------=_NextPart_000_0174_01D4CCFE.CBE551B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

 

The triage team meets weekly and does its best to handle the bugs reported
into the Bugzilla. The number of people attending that meeting has fallen,
as have the number of people available to help fix bugs. One of the things
we hear users report is they don't know how to help. We (the triage team)
are therefore going to start reporting out the currently 294 unassigned
bugs.

 

We're hoping people may be able to spare some time now and again to help out
with these.

 

Bugs are split into two types, "true bugs" where things don't work as they
should and "enhancements" which are features we'd want to add to the system.

 

There are also roughly four different "priority" classes right now, "2.7",
"2.8", "2.99" and "Future", the more pressing/urgent issues being in "2.7"
and then "2.8".

 

Please review this link and if a bug is something you would be able to help
with either take ownership of the bug, or send me
(Stephen.k.jolley@intel.com <mailto:Stephen.k.jolley@intel.com> ) an e-mail
with the bug number you would like and I will assign it to you (please make
sure you have a Bugzilla account).

 

The list is at:
https://wiki.yoctoproject.org/wiki/Bug_Triage#Unassigned_Bugs

 

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 

 


------=_NextPart_000_0174_01D4CCFE.CBE551B0
Content-Type: text/html;
	boundary="----=_NextPart_000_0030_01D4C87D.1A826F50";
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoPlainText>All,<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>The =
triage team meets weekly and does its best to handle the bugs reported =
into the Bugzilla. The number of people attending that meeting has =
fallen, as have the number of people available to help fix bugs. One of =
the things we hear users report is they don't know how to help. We (the =
triage team) are therefore going to start reporting out the currently =
294 unassigned bugs.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>We're =
hoping people may be able to spare some time now and again to help out =
with these.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>Bugs =
are split into two types, &quot;true bugs&quot; where things don't work =
as they should and &quot;enhancements&quot; which are features we'd want =
to add to the system.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>There =
are also roughly four different &quot;priority&quot; classes right now, =
&#8220;2.7&#8221;, &#8220;2.8&#8221;, &quot;2.99&quot; and =
&quot;Future&quot;, the more pressing/urgent issues being in =
&quot;2.7&quot; and then &#8220;2.8&#8221;.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>Please =
review this link and if a bug is something you would be able to help =
with either take ownership of the bug, or send me (<a =
href=3D"mailto:Stephen.k.jolley@intel.com">Stephen.k.jolley@intel.com</a>=
) an e-mail with the bug number you would like and I will assign it to =
you (please make sure you have a Bugzilla account).<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>The =
list is at: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Unassigned_Bugs">ht=
tps://wiki.yoctoproject.org/wiki/Bug_Triage#Unassigned_Bugs</a><o:p></o:p=
></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'page-break-after:avoid;text-autospace:none'><b><i><span =
style=3D'font-size:16.0pt;font-family:"Times New =
Roman",serif;color:purple'>Stephen K. Jolley</span></i></b><b><i><span =
style=3D'font-size:16.0pt;font-family:"Tahoma",sans-serif;color:purple'><=
o:p></o:p></span></i></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:8.0pt;font-family:"Courier New";color:blue'>Yocto =
Project Program Manager<o:p></o:p></span></b></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings;color:black'>(</span><span=
 style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>&nbsp;&nbsp;&nbsp; </span><b><span =
style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Cell</span></b><span =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:9.0pt;font-family:"MS Sans Serif"'>(208) =
244-4460<span style=3D'color:black'><o:p></o:p></span></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings'>* </span><b><span =
lang=3DFR style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Email</span></b><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:</span><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;<a =
href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a><o:p><=
/o:p></span></p><p class=3DMsoNormal><span lang=3DFR =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:=
p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_000_0174_01D4CCFE.CBE551B0--
