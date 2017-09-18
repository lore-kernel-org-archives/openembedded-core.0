Return-Path: <stephen.k.jolley@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 91ADE6E688
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 14:49:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 18 Sep 2017 07:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,413,1500966000"; 
	d="scan'208,217";a="1220336826"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2017 07:49:27 -0700
Received: from fmsmsx111.amr.corp.intel.com ([169.254.12.234]) by
	FMSMSX106.amr.corp.intel.com ([169.254.5.207]) with mapi id
	14.03.0319.002; Mon, 18 Sep 2017 07:49:26 -0700
From: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW38=9217?=
Thread-Index: AdMwh3sF49ZHoeIpScioemIWNch7tA==
Date: Mon, 18 Sep 2017 14:49:26 +0000
Message-ID: <9ADD3FDE8B189B4AA2F8A3C711F8155E98CD65AC@fmsmsx111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjkwYmE0ZGMtMDE0MS00NjZiLWIzNzUtNDczYTY2ODIyY2U2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ik5WWWVkc1RrQzBmd1ZjSlN3R0xTZzlVXC8xNTNNcjZwbVwvcVcra2ZcLzluQ2c9In0=
MIME-Version: 1.0
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1czOOKAmTE3?=
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
X-List-Received-Date: Mon, 18 Sep 2017 14:49:27 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9ADD3FDE8B189B4AA2F8A3C711F8155E98CD65ACfmsmsx111amrcor_"

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E98CD65ACfmsmsx111amrcor_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.4 M4

Next Deadline: YP 2.4 Final Cut off is Sept. 18, 2017


SWAT team rotation: Alejandro -> Stephano on Sept. 15, 2017.

SWAT team rotation: Stephano -> Maxin on Sept. 22, 2017

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

=B7        YP 2.3.2 (pyro) is in progress and in QA about 57% complete.  Se=
e: https://wiki.yoctoproject.org/wiki/2.3_QA_Status

=B7        YP 2.2.2 (morty) has been through QA but there were a number of =
issues raised. See: https://wiki.yoctoproject.org/wiki/WW37_-_2017-09-13_-_=
Full_Point_Release_Test_Cycle_2.2.2_rc2

=B7        For 2.2.2, we are currently working on understanding the impact =
of one remaining issue in order to decide if it can be released, the issue =
concerns the presence of ptest packages in test images. There were a number=
 of other issues raised or open, many of the open issues were resolved in 2=
.2.2 and have been closed, some other issues were due to confusion of testi=
ng morty compared with master (which has a different eSDK configuration).

=B7        The rocko branches for 2.4 and the bitbake 1.36 branches have be=
en created in preparation for the 2.4 release rc builds which are due soon.

=B7        The branch name for the =912.5=92 release is =93sumo=94 (https:/=
/wiki.yoctoproject.org/wiki/Releases has been updated).

=B7        For 2.4 we continue to have a number of concerning issues, parti=
cularly in pseudo but on other areas too. Patches are being worked upon, th=
e patch backlog should be mostly under control at this point. Technically w=
e are due the first 2.4 rc build today, reality is we need to fix several m=
ore issues before we do that. We have had some image size issues we=92re st=
ruggling to pin down to a specific patch and that is holding up a number of=
 patches whilst we bisect where the issues are.


Planned upcoming dot releases:

YP 2.2.2 Cut off June 5, 2017 - Pending release soon.

YP 2.2.2 Release by June, 16 2017

YP 2.3.2 Cut off Sept. 1, 2017 - In QA now.

YP 2.3.2 Release by Sept. 15, 2017


Key YP 2.4 Dates are:

YP 2.4 M4 (Final) Cut off is Sept. 18, 2017

YP 2.4 M4 (Final) Release by Oct. 20, 2017


Tracking Metrics:

            WDD 2456 (last week 2540)

(https://wiki.yoctoproject.org/charts/combo.html)


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.4_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.4_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.4_Features


[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]


Thanks,

Stephen K. Jolley
Yocto Project Program Manager
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
=95   Work Telephone:        (503) 712-0534
=95    Cell:               (208) 244-4460
=95 Email:                          stephen.k.jolley@intel.com


--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E98CD65ACfmsmsx111amrcor_
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:"MS Sans Serif";}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
	{mso-list-id:1095324759;
	mso-list-template-ids:-1092057538;}
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
	{mso-list-id:1558587771;
	mso-list-template-ids:-151362988;}
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
on: YP 2.4 M4</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Next Deadline: YP =
2.4 Final Cut off is Sept. 18, 2017</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT team rotation=
: Alejandro -&gt; Stephano on Sept. 15, 2017.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT team rotation=
: Stephano -&gt; Maxin on Sept. 22, 2017</span><o:p></o:p></p>
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
&quot;Arial&quot;,sans-serif;color:black">YP 2.3.2 (pyro) is in progress an=
d in QA about 57% complete. &nbsp;See:
<a href=3D"https://wiki.yoctoproject.org/wiki/2.3_QA_Status"><span style=3D=
"color:#1155CC">https://wiki.yoctoproject.org/wiki/2.3_QA_Status</span></a>=
<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">YP 2.2.2 (morty) has been through=
 QA but there were a number of issues raised. See:
<a href=3D"https://wiki.yoctoproject.org/wiki/WW37_-_2017-09-13_-_Full_Poin=
t_Release_Test_Cycle_2.2.2_rc2">
<span style=3D"color:#1155CC">https://wiki.yoctoproject.org/wiki/WW37_-_201=
7-09-13_-_Full_Point_Release_Test_Cycle_2.2.2_rc2</span></a> &nbsp;<o:p></o=
:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">For 2.2.2, we are currently worki=
ng on understanding the impact of one remaining issue in order to decide if=
 it can be released, the issue concerns the
 presence of ptest packages in test images. There were a number of other is=
sues raised or open, many of the open issues were resolved in 2.2.2 and hav=
e been closed, some other issues were due to confusion of testing morty com=
pared with master (which has a different
 eSDK configuration).<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">The rocko branches for 2.4 and th=
e bitbake 1.36 branches have been created in preparation for the 2.4 releas=
e rc builds which are due soon.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">The branch name for the =912.5=92=
 release is =93sumo=94 (<a href=3D"https://wiki.yoctoproject.org/wiki/Relea=
ses"><span style=3D"color:#1155CC">https://wiki.yoctoproject.org/wiki/Relea=
ses</span></a>
 has been updated).<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1 level1 lfo=
3;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quo=
t;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">For 2.4 we continue to have a num=
ber of concerning issues, particularly in pseudo but on other areas too. Pa=
tches are being worked upon, the patch backlog
 should be mostly under control at this point. Technically we are due the f=
irst 2.4 rc build today, reality is we need to fix several more issues befo=
re we do that. We have had some image size issues we=92re struggling to pin=
 down to a specific patch and that
 is holding up a number of patches whilst we bisect where the issues are.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Planned upcoming d=
ot releases:</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.2.2 Cut off J=
une 5, 2017 - Pending release soon.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.2.2 Release b=
y June, 16 2017</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3.2 Cut off S=
ept. 1, 2017 - In QA now.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3.2 Release b=
y Sept. 15, 2017</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key YP 2.4 Dates a=
re:</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.4 M4 (Final) =
Cut off is Sept. 18, 2017</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.4 M4 (Final) =
Release by Oct. 20, 2017</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking Metrics:<=
/span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span class=3D"apple-tab-span=
"><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;=
color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
</span></span><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black">WDD 2456 (last week 2540)</span><o:p></o:p></p>
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
project.org/wiki/Yocto_Project_v2.4_Status"><span style=3D"font-size:11.0pt=
;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yoc=
to_Project_v2.4_Status</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.4_Schedule"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.4_=
Schedule</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.4_Features"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.4_=
Features</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">[If anyone has sug=
gestions for other information you=92d like to see on this weekly status up=
date, let us know!]</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><o:p>&nbsp;</o:p></p>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<u><span style=3D"color:blue">stephen.k.jolley@intel.com</span></u></span><=
span lang=3D"FR" style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sa=
ns-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E98CD65ACfmsmsx111amrcor_--
