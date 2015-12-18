Return-Path: <stephen.k.jolley@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2C673176
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 16:17:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2015 08:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; 
	d="scan'208,217";a="864097192"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2015 08:16:43 -0800
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
	FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 18 Dec 2015 08:16:43 -0800
Received: from fmsmsx111.amr.corp.intel.com ([169.254.12.239]) by
	fmsmsx124.amr.corp.intel.com ([169.254.1.61]) with mapi id
	14.03.0248.002; Fri, 18 Dec 2015 08:16:43 -0800
From: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Yocto Project Status WW51
Thread-Index: AdE5r3KhvPdeKGIGRC61t3KWJz5/AQ==
Date: Fri, 18 Dec 2015 16:16:42 +0000
Message-ID: <9ADD3FDE8B189B4AA2F8A3C711F8155E56F780D7@fmsmsx111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.108]
x-ctpclassification: CTP_PUBLIC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTEzNjMzMDUtNzExYS00MTdlLWJlN2MtZjgwN2ZiNTE0ZDYxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX1BVQkxJQyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxNS40LjEwLjE5IiwiVHJ1c3RlZExhYmVsSGFzaCI6IjE5VXNcL2RCRm91ZGw5WVpONktFa0RrREE2dHZON25QaTFUbkc3STgzbFwvUT0ifQ==
MIME-Version: 1.0
Subject: Yocto Project Status WW51
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
X-List-Received-Date: Fri, 18 Dec 2015 16:17:07 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9ADD3FDE8B189B4AA2F8A3C711F8155E56F780D7fmsmsx111amrcor_"

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E56F780D7fmsmsx111amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.1 M2
Next Deadline: YP 2.1 M2 Cutoff (Feature Freeze) date is January 25, 2016 n=
oon GMT

SWAT team rotation: Saul -> Paul
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Due to the Holidays, the next weekly status report will be sent out Jan. 8t=
h, 2016.  Have happy holidays!

Key Status/Updates:

  *   M1 QA report is out. There are several comparatively major issues, e.=
g. busybox utilities in the SDK images instead of coreutils ones however we=
 have either fixes in master or mitigation factors and current feeling is w=
e'll release the rc1 and move on to concentrating on M2.
  *   The number of 'random' failures on the autobuilder continues to be a =
serious concern/risk.
  *   We automated -dbg FILES generation from the metadata, FILES_${PN}-dbg=
 is no longer needed.
  *   Bitbake trackback handling has been significantly improved (better fi=
lenames/line numbers)
  *   New "bitbake X -c task-" syntax where it will build up to but not inc=
luding task.
  *   toaster moved forward significantly with various key changes such as =
the Django 1.8 upgrade.
  *   musl integration patches landed
  *   Improvements to build statistics (buildstats) were made based on real=
 world performance debugging experiences.
  *   Worrying number of M1 bugs were not completed[1] and will presumably =
move to M2. WDD and bug trend continue to rise.

[1] See https://wiki.yoctoproject.org/wiki/Bug_Triage#Old_Milestone   If yo=
u have any on this list please move them to M2 or beyond.

Key YP 2.1 Dates:
YP 2.1 M1 Target release date is December 24, 2015
YP 2.1 M2 Cutoff (Feature Freeze) date is January 25, 2016 noon GMT
YP 2.1 M2 Target release date is February 12, 2016
YP 2.1 M3 Cutoff (Feature Freeze) date is February 29, 2016 noon GMT
YP 2.1 M3 Target release date is March 18, 2016
YP 2.1 M4 / Final Cutoff: March 28, 2016 noon GMT - Stabilization only mile=
stone.
YP 2.1 Final Release Target: April 29, 2016

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.1_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.1_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.1_Features

Tracking Metrics:
            WDD 2330 (last week 2300)
(https://wiki.yoctoproject.org/charts/combo.html)

[If anyone has suggestions for other information you'd like to see on this =
weekly status update, let us know!]

Thanks,

Stephen K. Jolley
Yocto Project Program Manager
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
*   Work Telephone:          (503) 712-0534
*    Cell:                                (208) 244-4460
* Email:                             stephen.k.jolley@intel.com


--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E56F780D7fmsmsx111amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:p=3D"urn:schemas-m=
icrosoft-com:office:powerpoint" xmlns:a=3D"urn:schemas-microsoft-com:office=
:access" xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:s=3D"=
uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" xmlns:rs=3D"urn:schemas-microsof=
t-com:rowset" xmlns:z=3D"#RowsetSchema" xmlns:b=3D"urn:schemas-microsoft-co=
m:office:publisher" xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadshee=
t" xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" xmlns=
:odc=3D"urn:schemas-microsoft-com:office:odc" xmlns:oa=3D"urn:schemas-micro=
soft-com:office:activation" xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:rtc=3D"http://m=
icrosoft.com/officenet/conferencing" xmlns:D=3D"DAV:" xmlns:Repl=3D"http://=
schemas.microsoft.com/repl/" xmlns:mt=3D"http://schemas.microsoft.com/share=
point/soap/meetings/" xmlns:x2=3D"http://schemas.microsoft.com/office/excel=
/2003/xml" xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" xmlns:ois=
=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" xmlns:dir=3D"http://=
schemas.microsoft.com/sharepoint/soap/directory/" xmlns:ds=3D"http://www.w3=
.org/2000/09/xmldsig#" xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint=
/dsp" xmlns:udc=3D"http://schemas.microsoft.com/data/udc" xmlns:xsd=3D"http=
://www.w3.org/2001/XMLSchema" xmlns:sub=3D"http://schemas.microsoft.com/sha=
repoint/soap/2002/1/alerts/" xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#"=
 xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" xmlns:sps=3D"http://=
schemas.microsoft.com/sharepoint/soap/" xmlns:xsi=3D"http://www.w3.org/2001=
/XMLSchema-instance" xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/so=
ap" xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" xmlns:udc=
p2p=3D"http://schemas.microsoft.com/data/udc/parttopart" xmlns:wf=3D"http:/=
/schemas.microsoft.com/sharepoint/soap/workflow/" xmlns:dsss=3D"http://sche=
mas.microsoft.com/office/2006/digsig-setup" xmlns:dssi=3D"http://schemas.mi=
crosoft.com/office/2006/digsig" xmlns:mdssi=3D"http://schemas.openxmlformat=
s.org/package/2006/digital-signature" xmlns:mver=3D"http://schemas.openxmlf=
ormats.org/markup-compatibility/2006" xmlns:m=3D"http://schemas.microsoft.c=
om/office/2004/12/omml" xmlns:mrels=3D"http://schemas.openxmlformats.org/pa=
ckage/2006/relationships" xmlns:spwp=3D"http://microsoft.com/sharepoint/web=
partpages" xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/20=
06/types" xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/200=
6/messages" xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/Sli=
deLibrary/" xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortal=
Server/PublishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" xmlns:=
st=3D"&#1;" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
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
	{mso-list-id:366030956;
	mso-list-template-ids:-1104788310;}
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
	{mso-list-id:1865367502;
	mso-list-template-ids:-445212160;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Current Dev Position: YP 2.1 M2</span><span st=
yle=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif=
&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Next Deadline: YP 2.1 M2 Cutoff (Feature Freez=
e) date is January 25, 2016 noon GMT</span><span style=3D"font-size:12.0pt;=
font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">SWAT team rotation: Saul -&gt; Paul</span><spa=
n style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;s=
erif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoctoproject=
.org/wiki/Yocto_Build_Failure_Swat_Team"><span style=3D"font-size:11.0pt;fo=
nt-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_=
Build_Failure_Swat_Team</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Due to the Holidays, the next weekly status re=
port will be sent out Jan. 8th, 2016. &nbsp;Have happy holidays!</span><spa=
n style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;s=
erif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Key Status/Updates:</span><span style=3D"font-=
size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p=
></o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level1 lfo3;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">M1 QA =
report is out. There are several comparatively major issues, e.g. busybox u=
tilities in the SDK images instead of coreutils ones however we have either=
 fixes in master or mitigation factors and current feeling
 is we&#8217;ll release the rc1 and move on to concentrating on M2.<o:p></o=
:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 lev=
el1 lfo3;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">The nu=
mber of &#8216;random&#8217; failures on the autobuilder continues to be a =
serious concern/risk.<o:p></o:p></span></li><li class=3D"MsoNormal" style=
=3D"color:black;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">We aut=
omated -dbg FILES generation from the metadata, FILES_${PN}-dbg is no longe=
r needed.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:blac=
k;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Bitbak=
e trackback handling has been significantly improved (better filenames/line=
 numbers)<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:blac=
k;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">New &#=
8220;bitbake X -c task-&#8221; syntax where it will build up to but not inc=
luding task.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:b=
lack;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">toaste=
r moved forward significantly with various key changes such as the Django 1=
.8 upgrade.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:bl=
ack;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">musl i=
ntegration patches landed<o:p></o:p></span></li><li class=3D"MsoNormal" sty=
le=3D"color:black;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Improv=
ements to build statistics (buildstats) were made based on real world perfo=
rmance debugging experiences.<o:p></o:p></span></li><li class=3D"MsoNormal"=
 style=3D"color:black;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Worryi=
ng number of M1 bugs were not completed[1] and will presumably move to M2. =
WDD and bug trend continue to rise. &nbsp;<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">[1] See
</span><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&qu=
ot;,&quot;serif&quot;"><a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Tr=
iage#Old_Milestone"><span style=3D"font-size:11.0pt;font-family:&quot;Arial=
&quot;,&quot;sans-serif&quot;;color:#1155CC">https://wiki.yoctoproject.org/=
wiki/Bug_Triage#Old_Milestone</span></a></span><span style=3D"font-family:&=
quot;Arial&quot;,&quot;sans-serif&quot;;color:black">
 &nbsp;&nbsp;If you have any on this list please move them to M2 or beyond.=
</span><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&qu=
ot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Key YP 2.1 Dates:</span><span style=3D"font-si=
ze:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">YP 2.1 M1 Target re=
lease date is December 24, 2015</span><span style=3D"font-size:12.0pt;font-=
family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">YP 2.1 M2 Cutoff (F=
eature Freeze) date is January 25, 2016 noon GMT</span><span style=3D"font-=
size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">YP 2.1 M2 Target re=
lease date is February 12, 2016</span><span style=3D"font-size:12.0pt;font-=
family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">YP 2.1 M3 Cutoff (F=
eature Freeze) date is February 29, 2016 noon GMT</span><span style=3D"font=
-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">YP 2.1 M3 Target re=
lease date is March 18, 2016</span><span style=3D"font-size:12.0pt;font-fam=
ily:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">YP 2.1 M4 / Final C=
utoff: March 28, 2016 noon GMT - Stabilization only milestone.</span><span =
style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;ser=
if&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">YP 2.1 Final Releas=
e Target: April 29, 2016</span><span style=3D"font-size:12.0pt;font-family:=
&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Key Status Links for YP:</span><span style=3D"=
font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoctoproject=
.org/wiki/Yocto_Project_v2.1_Status"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Proj=
ect_v2.1_Status</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoctoproject=
.org/wiki/Yocto_2.1_Schedule"><span style=3D"font-size:11.0pt;font-family:C=
onsolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.1_Schedul=
e</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoctoproject=
.org/wiki/Yocto_2.1_Features"><span style=3D"font-size:11.0pt;font-family:C=
onsolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.1_Feature=
s</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Tracking Metrics:</span><span style=3D"font-si=
ze:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; WDD 2330 (last week 2300)</span><span style=3D"font-si=
ze:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-famil=
y:Consolas;color:black">(</span><span style=3D"font-size:12.0pt;font-family=
:&quot;Times New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoc=
toproject.org/charts/combo.html"><span style=3D"font-size:11.0pt;font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#1155CC">https://wiki.yoct=
oproject.org/charts/combo.html</span></a></span><span style=3D"font-family:=
Consolas;color:black">)</span><span style=3D"font-size:12.0pt;font-family:&=
quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><br>
</span><span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;=
color:black">[If anyone has suggestions for other information you&#8217;d l=
ike to see on this weekly status update, let us know!]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Thanks,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><i><span style=3D"font-size:16.0pt;font-family:&quot;Times New Roman&qu=
ot;,&quot;serif&quot;;color:purple">Stephen K. Jolley</span></i></b><b><i><=
span style=3D"font-size:16.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-se=
rif&quot;;color:purple"><o:p></o:p></span></i></b></p>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
">(503) 712-0534<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
;color:black">(</span><span style=3D"font-size:9.0pt;font-family:&quot;MS S=
ans Serif&quot;;color:teal">&nbsp;&nbsp;&nbsp;
</span><b><span style=3D"font-size:8.0pt;font-family:&quot;Comic Sans MS&qu=
ot;;color:teal">Cell</span></b><span style=3D"font-size:9.0pt;font-family:&=
quot;MS Sans Serif&quot;;color:teal">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
sp;&nbsp;&nbsp;
<u><span style=3D"color:blue">stephen.k.jolley@intel.com</span></u></span><=
span lang=3D"FR" style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,&q=
uot;sans-serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E56F780D7fmsmsx111amrcor_--
