Return-Path: <stephen.k.jolley@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 017E271979
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 15:44:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 06 Feb 2017 07:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; 
	d="scan'208,217";a="221907971"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2017 07:44:47 -0800
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
	FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 6 Feb 2017 07:44:48 -0800
Received: from fmsmsx111.amr.corp.intel.com ([169.254.12.234]) by
	fmsmsx124.amr.corp.intel.com ([169.254.8.190]) with mapi id
	14.03.0248.002; Mon, 6 Feb 2017 07:44:47 -0800
From: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW06=9217?=
Thread-Index: AdKAj+UpyzbiOOLTQjKsehMqKQlxRQ==
Date: Mon, 6 Feb 2017 15:44:47 +0000
Message-ID: <9ADD3FDE8B189B4AA2F8A3C711F8155E57356ED5@fmsmsx111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzQ5Y2RhNjAtNWI1NC00ODI1LTk2Y2QtZGIzOTVmMWYzZDA1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6InhNcU1nTVwvb041c3VLdDkxbHc3S2loVUZkd2VGQ1Myc0RVZWljOFhDbnlNPSJ9
MIME-Version: 1.0
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cwNuKAmTE3?=
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
X-List-Received-Date: Mon, 06 Feb 2017 15:44:49 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9ADD3FDE8B189B4AA2F8A3C711F8155E57356ED5fmsmsx111amrcor_"

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E57356ED5fmsmsx111amrcor_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.3 M3

Next Deadline: YP 2.3 M3 by Feb. 27, 2017


SWAT team rotation: Ross -> Leo on Feb. 3, 2017.

SWAT team rotation: Leo-> Juro on Feb. 10, 2017.

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

=B7        The issues encountered in M2-rc1, particularly from the oeqa cha=
nges have meant we=92ve taken M2 to another rc build which is now in QA. We=
 decided to include several recipe specific sysroot (RSS) fixes in that as =
well.

=B7        There have been several patches submitted to try and improve the=
 performance of RSS. On higher spec machines, the performance seems to be r=
easonable and the performance issues we=92ve seen have tended to be on olde=
r/slower hardware where disk IO (triggered by limited memory) may be a part=
icular bottleneck. We=92re probably starting to reach the point of diminish=
ing returns for performance improvements which most of the ones we=92ve bee=
n able to identify having been implemented by now.

=B7        The 2.2.1 release will happen after M2.

=B7        Patch merging continues to be steady and we=92re aware we=92re c=
ontinuing to lag behind.

=B7        ELC may distract people and continue to impact patch merging pro=
gress amongst other things.


Proposed upcoming dot releases:

YP 2.2.1 Release by Jan. 20, 2017 (Will be after YP 2.3 M2 is out of QA)

YP 2.1.3 Cut off May 8, 2017

YP 2.1.3 Release by May 19, 2017

YP 2.2.2 Cut off May 22, 2017

YP 2.2.2 Release by June 2, 2017


Key YP 2.3 Dates:

YP 2.3 M2 Release is targeted for Feb. 3, 2017

YP 2.3 M3 Cutoff is Feb 27, 2017

YP 2.3 M3 Release is Mar. 10, 2017

YP 2.3 M4 Cutoff is April 3, 2017

YP 2.3 M4 Release is April 28, 2017


Tracking Metrics:

            WDD 2667 (last week 2630)

(https://wiki.yoctoproject.org/charts/combo.html)


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.3_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.3_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.3_Features


[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]

Thanks,

Stephen K. Jolley
Yocto Project Program Manager
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
=95   Work Telephone:        (503) 712-0534
=95    Cell:               (208) 244-4460
=95 Email:                            stephen.k.jolley@intel.com


--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E57356ED5fmsmsx111amrcor_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:"MS Sans Serif";}
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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.apple-tab-span
	{mso-style-name:apple-tab-span;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:11298028;
	mso-list-template-ids:117056730;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1946645403;
	mso-list-template-ids:-2144166266;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Current Dev Positi=
on: YP 2.3 M3
</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Next Deadline: YP =
2.3 M3 by Feb. 27, 2017</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT team rotation=
: Ross -&gt; Leo on Feb. 3, 2017.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT team rotation=
: Leo-&gt; Juro on Feb. 10, 2017.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Build_Failure_Swat_Team"><span style=3D"font-size:11=
.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki=
/Yocto_Build_Failure_Swat_Team</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key Status/Updates=
:</span><o:p></o:p></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">The issues encountered in M2-rc1,=
 particularly from the oeqa changes have meant we=92ve taken M2 to another =
rc build which is now in QA. We decided to include
 several recipe specific sysroot (RSS) fixes in that as well.<o:p></o:p></s=
pan></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">There have been several patches s=
ubmitted to try and improve the performance of RSS. On higher spec machines=
, the performance seems to be reasonable and
 the performance issues we=92ve seen have tended to be on older/slower hard=
ware where disk IO (triggered by limited memory) may be a particular bottle=
neck. We=92re probably starting to reach the point of diminishing returns f=
or performance improvements which most
 of the ones we=92ve been able to identify having been implemented by now.<=
o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">The 2.2.1 release will happen aft=
er M2.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">Patch merging continues to be ste=
ady and we=92re aware we=92re continuing to lag behind.<o:p></o:p></span></=
p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">ELC may distract people and conti=
nue to impact patch merging progress amongst other things.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Proposed upcoming =
dot releases:</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.2.1 Release b=
y Jan. 20, 2017 (Will be after YP 2.3 M2 is out of QA)</span><o:p></o:p></p=
>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.1.3 Cut off M=
ay 8, 2017</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.1.3 Release b=
y May 19, 2017</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.2.2 Cut off M=
ay 22, 2017</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.2.2 Release b=
y June 2, 2017</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key YP 2.3 Dates:<=
/span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3 M2 Release =
is targeted for Feb. 3, 2017</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3 M3 Cutoff i=
s Feb 27, 2017</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3 M3 Release =
is Mar. 10, 2017</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3 M4 Cutoff i=
s April 3, 2017</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3 M4 Release =
is April 28, 2017</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking Metrics:<=
/span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span class=3D"apple-tab-span=
"><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;=
color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
</span></span><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black">WDD 2667 (last week 2630)</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;text-indent:.5in"><span style=
=3D"font-size:11.0pt;font-family:Consolas;color:black">(</span><a href=3D"h=
ttps://wiki.yoctoproject.org/charts/combo.html"><span style=3D"font-size:11=
.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.y=
octoproject.org/charts/combo.html</span></a><span style=3D"font-size:11.0pt=
;font-family:Consolas;color:black">)</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key Status Links f=
or YP:</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Project_v2.3_Status"><span style=3D"font-size:11.0pt=
;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yoc=
to_Project_v2.3_Status</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.3_Schedule"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.3_=
Schedule</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.3_Features"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.3_=
Features</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">[If anyone has sug=
gestions for other information you=92d like to see on this weekly status up=
date, let us know!]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><i><span style=3D"font-size:16.0pt;font-family:&quot;Times New Roman&qu=
ot;,serif;color:purple">Stephen K. Jolley</span></i></b><b><i><span style=
=3D"font-size:16.0pt;font-family:&quot;Tahoma&quot;,sans-serif;color:purple=
"><o:p></o:p></span></i></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;;color:blue">Yocto Project Program Manager<o:p></o:p></spa=
n></b></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;col=
or:fuchsia">INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Wingdings;color:black">(<=
/span><span style=3D"font-family:&quot;MS Sans Serif&quot;;color:teal">
</span><span style=3D"font-size:8.0pt;font-family:&quot;MS Sans Serif&quot;=
;color:teal">&nbsp;&nbsp;</span><b><span style=3D"font-size:8.0pt;font-fami=
ly:&quot;Comic Sans MS&quot;;color:teal">Work Telephone</span></b><span sty=
le=3D"font-family:&quot;MS Sans Serif&quot;;color:teal">:&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
">(503) 712-0534<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
;color:black">(</span><span style=3D"font-size:9.0pt;font-family:&quot;MS S=
ans Serif&quot;;color:teal">&nbsp;&nbsp;&nbsp;
</span><b><span style=3D"font-size:8.0pt;font-family:&quot;Comic Sans MS&qu=
ot;;color:teal">Cell</span></b><span style=3D"font-size:9.0pt;font-family:&=
quot;MS Sans Serif&quot;;color:teal">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
">(208) 244-4460<span style=3D"color:black"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
">* </span>
<b><span lang=3D"FR" style=3D"font-size:8.0pt;font-family:&quot;Comic Sans =
MS&quot;;color:teal">Email</span></b><span lang=3D"FR" style=3D"font-size:9=
.0pt;font-family:&quot;MS Sans Serif&quot;;color:teal">:</span><span lang=
=3D"FR" style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;
<u><span style=3D"color:blue">stephen.k.jolley@intel.com</span></u></span><=
span lang=3D"FR" style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sa=
ns-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E57356ED5fmsmsx111amrcor_--
