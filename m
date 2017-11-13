Return-Path: <stephen.k.jolley@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AE0957867B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 15:47:15 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2017 07:47:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,389,1505804400"; 
	d="scan'208,217";a="149079827"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by orsmga004.jf.intel.com with ESMTP; 13 Nov 2017 07:47:16 -0800
Received: from fmsmsx111.amr.corp.intel.com ([169.254.12.234]) by
	FMSMSX105.amr.corp.intel.com ([169.254.4.92]) with mapi id
	14.03.0319.002; Mon, 13 Nov 2017 07:47:15 -0800
From: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW46=9217?=
Thread-Index: AdNclHYa0SnDCne/TyeVI1vxw3wRNA==
Date: Mon, 13 Nov 2017 15:47:15 +0000
Message-ID: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71CB41A@fmsmsx111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.108]
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjkwYmE0ZGMtMDE0MS00NjZiLWIzNzUtNDczYTY2ODIyY2U2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ik5WWWVkc1RrQzBmd1ZjSlN3R0xTZzlVXC8xNTNNcjZwbVwvcVcra2ZcLzluQ2c9In0=
MIME-Version: 1.0
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1c0NuKAmTE3?=
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
X-List-Received-Date: Mon, 13 Nov 2017 15:47:16 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9ADD3FDE8B189B4AA2F8A3C711F8155EC71CB41Afmsmsx111amrcor_"

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155EC71CB41Afmsmsx111amrcor_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 Planning and M1 development

Next Deadline: YP 2.5 M1 cut off of 12/4/17


SWAT team rotation: Leo -> Juro on Nov. 10, 2017.

SWAT team rotation: Juro -> Paul on Nov.17, 2017.

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

=B7        Master has started taking patches for 2.5. We were able to get s=
ome successful builds which allowed some patches to merge however the incid=
ence of failures increased again and we=92re again seeing multiple issues m=
entioned below in each build, stalling patch merging.

=B7        We continue to struggle with a raft of different build failures =
that keep occurring on the autobuilders. Compared to last week we did make =
some progress:

o   We found one issue due to depletion of entropy on autobuilder workers (=
https://wiki.yoctoproject.org/wiki/Entropy_on_Autobuilders has details)

o   We fixed the ftp proxy issues (we were unable to remove all the ftp url=
s since gcc and alsa still use ftp servers)

o   We fixed the oe-selftest log duplication and various other logging inco=
nsistency issues.

=B7        Currently open issues are:

o   qemuppc continues to demonstrate random hangs in boot  in userspace

o   Issues with 4.13.10 host kernels booting kvm x86 guests on Tumbleweed (=
Suse) and Fedora 26

o   nfs inode count for the sstate/dldir share appears to break periodicall=
y causing the disk monitor to halt the builds (bug 12267)

o   a perf build race (bug 12302)

o   An ext filesystem creation/sizing issue (bug 12304)

=B7        Until we resolve these issues patches will continue to be slow t=
o merge, if at all. This also blocks several core developers from doing any=
 feature work at this point in time (e.g. layer setup tool is on hold, agai=
n).

=B7        We can only continue to stress that unless others step up and he=
lp to try and root cause these issues, things will stall with the project.


Planned upcoming dot releases:

YP 2.2.3 is planned and should be out in the next few weeks.

YP 2.3.3 is planned, but date TBD during YP 2.5 planning.

YP 2.4.1 is planned, but date TBD during YP 2.5 planning.


Key YP 2.5 Dates are:

YP 2.5 M1 cut off of 12/4/17

YP 2.5 M1 release of 12/15/17

YP 2.5 M2 cut off of 1/15/18

YP 2.5 M2 release of 1/26/18

YP 2.5 M3 cut off of 2/19/18

YP 2.5 M3 release of 3/2/18

YP 2.5 M4 cut off of 4/2/18

YP 2.5 M4 release of 4/27/18


Tracking Metrics:

            WDD 2640 (last week 2633)

(https://wiki.yoctoproject.org/charts/combo.html)


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features

[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]

Thanks,

Stephen K. Jolley
Yocto Project Program Manager
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
=95   Work Telephone:        (503) 712-0534
=95    Cell:                              (208) 244-4460
=95 Email:                            stephen.k.jolley@intel.com


--_000_9ADD3FDE8B189B4AA2F8A3C711F8155EC71CB41Afmsmsx111amrcor_
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
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	{mso-list-id:1114057376;
	mso-list-template-ids:-674957818;}
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
	{mso-list-id:1909923734;
	mso-list-template-ids:-928090320;}
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
on: YP 2.5 Planning and M1 development</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Next Deadline: YP =
2.5 M1 cut off of 12/4/17</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT team rotation=
: Leo -&gt; Juro on Nov. 10, 2017.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT team rotation=
: Juro -&gt; Paul on Nov.17, 2017.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Build_Failure_Swat_Team"><span style=3D"font-size:11=
.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki=
/Yocto_Build_Failure_Swat_Team</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key Status/Updates=
:</span><o:p></o:p></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">Master has started taking patches=
 for 2.5. We were able to get some successful builds which allowed some pat=
ches to merge however the incidence of failures
 increased again and we=92re again seeing multiple issues mentioned below i=
n each build, stalling patch merging.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">We continue to struggle with a ra=
ft of different build failures that keep occurring on the autobuilders. Com=
pared to last week we did make some progress:<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level2 lf=
o3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><span style=3D"mso-list:Ignore">o<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">We found one issue due to depleti=
on of entropy on autobuilder workers (<a href=3D"https://wiki.yoctoproject.=
org/wiki/Entropy_on_Autobuilders"><span style=3D"color:#1155CC">https://wik=
i.yoctoproject.org/wiki/Entropy_on_Autobuilders</span></a>
 has details)<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level2 lf=
o3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><span style=3D"mso-list:Ignore">o<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">We fixed the ftp proxy issues (we=
 were unable to remove all the ftp urls since gcc and alsa still use ftp se=
rvers)<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level2 lf=
o3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><span style=3D"mso-list:Ignore">o<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">We fixed the oe-selftest log dupl=
ication and various other logging inconsistency issues.<o:p></o:p></span></=
p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">Currently open issues are:<o:p></=
o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level2 lf=
o3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><span style=3D"mso-list:Ignore">o<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">qemuppc continues to demonstrate =
random hangs in boot &nbsp;in userspace<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level2 lf=
o3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><span style=3D"mso-list:Ignore">o<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">Issues with 4.13.10 host kernels =
booting kvm x86 guests on Tumbleweed (Suse) and Fedora 26<o:p></o:p></span>=
</p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level2 lf=
o3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><span style=3D"mso-list:Ignore">o<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">nfs inode count for the sstate/dl=
dir share appears to break periodically causing the disk monitor to halt th=
e builds (bug 12267)<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level2 lf=
o3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><span style=3D"mso-list:Ignore">o<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">a perf build race (bug 12302)<o:p=
></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level2 lf=
o3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><span style=3D"mso-list:Ignore">o<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">An ext filesystem creation/sizing=
 issue (bug 12304)<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">Until we resolve these issues pat=
ches will continue to be slow to merge, if at all. This also blocks several=
 core developers from doing any feature work
 at this point in time (e.g. layer setup tool is on hold, again).<o:p></o:p=
></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">We can only continue to stress th=
at unless others step up and help to try and root cause these issues, thing=
s will stall with the project.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Planned upcoming d=
ot releases:</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.2.3 is planne=
d and should be out in the next few weeks.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3.3 is planne=
d, but date TBD during YP 2.5 planning.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.4.1 is planne=
d, but date TBD during YP 2.5 planning.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key YP 2.5 Dates a=
re:</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.5 M1 cut off =
of 12/4/17</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.5 M1 release =
of 12/15/17</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.5 M2 cut off =
of 1/15/18</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.5 M2 release =
of 1/26/18</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.5 M3 cut off =
of 2/19/18</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.5 M3 release =
of 3/2/18</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.5 M4 cut off =
of 4/2/18</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.5 M4 release =
of 4/27/18</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking Metrics:<=
/span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span class=3D"apple-tab-span=
"><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;=
color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
</span></span><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black">WDD 2640 (last week 2633)</span><o:p></o:p></p>
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
project.org/wiki/Yocto_Project_v2.5_Status"><span style=3D"font-size:11.0pt=
;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yoc=
to_Project_v2.5_Status</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.5_Schedule"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_=
Schedule</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.5_Features"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_=
Features</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">[If anyone has sug=
gestions for other information you=92d like to see on this weekly status up=
date, let us know!]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Thanks,</span><o:p></o:p></p>
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
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
">(208) 244-4460<span style=3D"color:black"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
">* </span>
<b><span lang=3D"FR" style=3D"font-size:8.0pt;font-family:&quot;Comic Sans =
MS&quot;;color:teal">Email</span></b><span lang=3D"FR" style=3D"font-size:9=
.0pt;font-family:&quot;MS Sans Serif&quot;;color:teal">:</span><span lang=
=3D"FR" style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;<u><span style=3D"color:blue">stephen.k.jolley@intel.com</span=
></u></span><span lang=3D"FR" style=3D"font-size:12.0pt;font-family:&quot;A=
rial&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155EC71CB41Afmsmsx111amrcor_--
