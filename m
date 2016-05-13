Return-Path: <stephen.k.jolley@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 77E9C6E630
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 15:10:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 May 2016 08:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,614,1455004800"; 
	d="scan'208,217";a="702306691"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
	by FMSMGA003.fm.intel.com with ESMTP; 13 May 2016 08:10:45 -0700
Received: from fmsmsx111.amr.corp.intel.com ([169.254.12.196]) by
	fmsmsx104.amr.corp.intel.com ([169.254.3.58]) with mapi id
	14.03.0248.002; Fri, 13 May 2016 08:10:44 -0700
From: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Yocto Project Status WW20
Thread-Index: AdGtKGWQEuvaL88ATVS6z4k560dTdQ==
Date: Fri, 13 May 2016 15:10:44 +0000
Message-ID: <9ADD3FDE8B189B4AA2F8A3C711F8155E57110F75@fmsmsx111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzIyNTUzYzQtYTAzZC00ZjJlLWEyMTktZGI1Mzg5NTMxOWVkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IlA5MHZ1MThCYldHcWprTEdkQ2hIMmFqR1dwbkJKQ2lsN01KeFhPSUZFQXc9In0=
MIME-Version: 1.0
Subject: Yocto Project Status WW20
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
X-List-Received-Date: Fri, 13 May 2016 15:10:47 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9ADD3FDE8B189B4AA2F8A3C711F8155E57110F75fmsmsx111amrcor_"

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E57110F75fmsmsx111amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.2 M1
Next Deadline: YP 2.2 cut off: June 13, 2016

SWAT team rotation: Juro -> Anibal
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Key Status/Updates:

  *   The bitbake python3 branch is nearing readiness, the OE-Core branch i=
s not quite at the same level of cleanliness but has the functionality and =
just needs cleanup. Known issues remaining are toaster and various tools in=
 scripts/, help in testing would be most welcome as we have found several d=
istro specific issues so far.
  *   With python3, basic image execution is known to work, as is testimage=
 (qemu runtime testing) and basic oe-selftests.
  *   We have various significant changes from Khem such as gcc 6, glibc up=
grade and so on. A portion of these have merged into master, the rest shoul=
d enter -next for testing over the weekend.
  *   We now have automated BuildLog generation in the wiki to help our bui=
ld triage (SWAT) process which starts the process improvements planned in 2=
.2 (thanks Joshua!)
  *   There was a nice cleanup to staging.bbclass from Peter (thanks!)
  *   There is a good discussion happening on the architecture list about t=
rying to come up with a standardized way of defining builds and possibly ha=
ndling layer checkout. Please join the discussion if interested.
  *   WDD continues to rise :(
  *   YP 1.8.2 is now in QA
  *   meta-intel 5.0 should finish QA today

Key YP 2.2 Dates:

  *   YP 2.2 M1 cut off would be: 6/13/16
  *   YP 2.2 M1 release would be: 6/24/16
  *   YP 2.2 M2 cut off would be: 7/18/16
  *   YP 2.2 M2 release would be: 7/29/16
  *   YP 2.2 M3 cut off would be: 8/29/16
  *   YP 2.2 M3 release would be: 9/9/16
  *   YP 2.2 M4 cut off would be: 10/3/16
  *   YP 2.2 M4 release would be: 10/28/16

Tracking Metrics:
            WDD 2618 (last week 2532)
(https://wiki.yoctoproject.org/charts/combo.html)

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features

[If anyone has suggestions for other information you'd like to see on this =
weekly status update, let us know!]

Thanks,

Stephen K. Jolley
Yocto Project Program Manager
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
*   Work Telephone:        (503) 712-0534
*    Cell:               (208) 244-4460
* Email:                            stephen.k.jolley@intel.com


--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E57110F75fmsmsx111amrcor_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
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
	{mso-list-id:602570704;
	mso-list-template-ids:873202654;}
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
	{mso-list-id:864056009;
	mso-list-template-ids:-1842837632;}
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
@list l2
	{mso-list-id:886527821;
	mso-list-template-ids:-1045808668;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3
	{mso-list-id:1672836576;
	mso-list-template-ids:-528710576;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level9
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
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Current Dev Position: YP 2.2 M1</span><span style=3D"font-=
size:12.0pt;font-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Next Deadline: YP 2.2 cut off: June 13, 2016</span><span s=
tyle=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">SWAT team rotation: Juro -&gt; Anibal</span><span style=3D=
"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><a href=3D"https://wiki.yoctoproject.org/wiki/Yo=
cto_Build_Failure_Swat_Team"><span style=3D"font-size:11.0pt;font-family:Co=
nsolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failur=
e_Swat_Team</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Key Status/Updates:</span><span style=3D"font-size:12.0pt;=
font-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l2 level1 lfo5;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The bitbake python=
3 branch is nearing readiness, the OE-Core branch is not quite at the same =
level of cleanliness but has the functionality and just needs cleanup. Know=
n issues remaining are toaster and various tools
 in scripts/, help in testing would be most welcome as we have found severa=
l distro specific issues so far.<o:p></o:p></span></li><li class=3D"MsoNorm=
al" style=3D"color:black;mso-list:l2 level1 lfo5;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">With python3, basi=
c image execution is known to work, as is testimage (qemu runtime testing) =
and basic oe-selftests.
<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-lis=
t:l2 level1 lfo5;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We have various si=
gnificant changes from Khem such as gcc 6, glibc upgrade and so on. A porti=
on of these have merged into master, the rest should enter -next for testin=
g over the weekend.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"=
color:black;mso-list:l2 level1 lfo5;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We now have automa=
ted BuildLog generation in the wiki to help our build triage (SWAT) process=
 which starts the process improvements planned in 2.2 (thanks Joshua!)<o:p>=
</o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l2 =
level1 lfo5;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">There was a nice c=
leanup to staging.bbclass from Peter (thanks!)<o:p></o:p></span></li><li cl=
ass=3D"MsoNormal" style=3D"color:black;mso-list:l2 level1 lfo5;vertical-ali=
gn:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">There is a good di=
scussion happening on the architecture list about trying to come up with a =
standardized way of defining builds and possibly handling layer checkout. P=
lease join the discussion if interested.<o:p></o:p></span></li><li class=3D=
"MsoNormal" style=3D"color:black;mso-list:l2 level1 lfo5;vertical-align:bas=
eline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">WDD continues to r=
ise :(<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;m=
so-list:l2 level1 lfo5;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 1.8.2 is now in=
 QA<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-=
list:l2 level1 lfo5;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">meta-intel 5.0 sho=
uld finish QA today<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Key YP 2.2 Dates:</span><span style=3D"font-size:12.0pt;fo=
nt-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level1 lfo6;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2 M1 cut off =
would be: 6/13/16<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"co=
lor:black;mso-list:l0 level1 lfo6;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2 M1 release =
would be: 6/24/16<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"co=
lor:black;mso-list:l0 level1 lfo6;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2 M2 cut off =
would be: 7/18/16<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"co=
lor:black;mso-list:l0 level1 lfo6;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2 M2 release =
would be: 7/29/16<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"co=
lor:black;mso-list:l0 level1 lfo6;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2 M3 cut off =
would be: 8/29/16<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"co=
lor:black;mso-list:l0 level1 lfo6;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2 M3 release =
would be: 9/9/16<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"col=
or:black;mso-list:l0 level1 lfo6;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2 M4 cut off =
would be: 10/3/16<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"co=
lor:black;mso-list:l0 level1 lfo6;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2 M4 release =
would be: 10/28/16<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Tracking Metrics:</span><span style=3D"font-size:12.0pt;fo=
nt-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; WDD 2618 (last week 2532)</span><span style=3D"font-size:12.0pt;fo=
nt-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-famil=
y:Consolas;color:black">(</span><span style=3D"font-size:12.0pt;font-family=
:&quot;Times New Roman&quot;,serif"><a href=3D"https://wiki.yoctoproject.or=
g/charts/combo.html"><span style=3D"font-size:11.0pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/charts/comb=
o.html</span></a></span><span style=3D"font-family:Consolas;color:black">)<=
/span><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quo=
t;,serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Key Status Links for YP:</span><span style=3D"font-size:12=
.0pt;font-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><a href=3D"https://wiki.yoctoproject.org/wiki/Yo=
cto_Project_v2.2_Status"><span style=3D"font-size:11.0pt;font-family:Consol=
as;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Sta=
tus</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><a href=3D"https://wiki.yoctoproject.org/wiki/Yo=
cto_2.2_Schedule"><span style=3D"font-size:11.0pt;font-family:Consolas;colo=
r:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule</span></a>=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><a href=3D"https://wiki.yoctoproject.org/wiki/Yo=
cto_2.2_Features"><span style=3D"font-size:11.0pt;font-family:Consolas;colo=
r:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features</span></a>=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">[If anyone has suggestions for other information you&#8217=
;d like to see on this weekly status update, let us know!]</span><span styl=
e=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif"><o:p><=
/o:p></span></p>
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

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E57110F75fmsmsx111amrcor_--
