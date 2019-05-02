Return-Path: <sangeeta.jain@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC6C6B11A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 05:27:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2019 22:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,420,1549958400"; 
	d="scan'208,217";a="140576122"
Received: from pgsmsx112.gar.corp.intel.com ([10.108.55.201])
	by orsmga006.jf.intel.com with ESMTP; 01 May 2019 22:27:30 -0700
Received: from pgsmsx110.gar.corp.intel.com ([169.254.13.159]) by
	PGSMSX112.gar.corp.intel.com ([169.254.3.40]) with mapi id
	14.03.0415.000; Thu, 2 May 2019 13:27:29 +0800
From: "Jain, Sangeeta" <sangeeta.jain@intel.com>
To: akuster808 <akuster808@gmail.com>, "'yocto@yoctoproject.org'"
	<yocto@yoctoproject.org>, "Eggleton, Paul" <paul.eggleton@intel.com>,
	"'richard.purdie@linuxfoundation.org'"
	<richard.purdie@linuxfoundation.org>, 
	'Michael Halstead' <mhalstead@linuxfoundation.org>, "Erway, Tracey M"
	<tracey.m.erway@intel.com>, "'sjolley.yp.pm@gmail.com'"
	<sjolley.yp.pm@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] QA cycle report for 2.7 RC2
Thread-Index: AdT7KlRxvukjjGqjSYGEwxLZuqzKygAzyOYAAStCV5A=
Date: Thu, 2 May 2019 05:27:29 +0000
Message-ID: <015AB11D45F2C442929CB2765DAE738634DE5BDC@PGSMSX110.gar.corp.intel.com>
References: <015AB11D45F2C442929CB2765DAE738634DDE72D@PGSMSX110.gar.corp.intel.com>
	<6fe6873c-a35c-65e6-507b-1244610e7e3f@gmail.com>
In-Reply-To: <6fe6873c-a35c-65e6-507b-1244610e7e3f@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGM5N2FiZjYtMmFiMi00NWFjLTljODUtZTQ0MjAxODVmMDc4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUFFSbFwvY2xSYkRoSXgrSjRORXFBVVh2aUVhMG9JNkZcL3YwZWZ5YnlHQURcL3dlRnZZUnFnNlFuMlB6V1ZqemtSZSJ9
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: QA cycle report for 2.7 RC2
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
X-List-Received-Date: Thu, 02 May 2019 05:27:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_015AB11D45F2C442929CB2765DAE738634DE5BDCPGSMSX110garcor_"

--_000_015AB11D45F2C442929CB2765DAE738634DE5BDCPGSMSX110garcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi Armin,

From: akuster808 <akuster808@gmail.com>
Sent: Friday, 26 April, 2019 10:30 PM
To: Jain, Sangeeta <sangeeta.jain@intel.com>; 'yocto@yoctoproject.org' <yoc=
to@yoctoproject.org>; Eggleton, Paul <paul.eggleton@intel.com>; 'richard.pu=
rdie@linuxfoundation.org' <richard.purdie@linuxfoundation.org>; 'Michael Ha=
lstead' <mhalstead@linuxfoundation.org>; Erway, Tracey M <tracey.m.erway@in=
tel.com>; 'sjolley.yp.pm@gmail.com' <sjolley.yp.pm@gmail.com>; openembedded=
-core@lists.openembedded.org
Subject: Re: [OE-core] QA cycle report for 2.7 RC2

Sangeeta,

On 4/25/19 11:27 PM, Jain, Sangeeta wrote:

QA cycle report for 2.7 RC2:


  1.  No high milestone defects.
  2.  Test results are available at following location:
*        For results of all automated tests, please refer to results at pub=
lic AB [1].
*        For other test results, refer to attachment [2].
*        For test report for test cases run by Intel and WR team, refer att=
achment [3]
Since "compliance-test.compliance-test.LSB_subset_test_suite" was run, can =
you share the changes made to /opt/lsb-test/session file?

For "compliance-test.compliance-test.LSB_subset_test_suite", we follow the =
procedure as mentioned at https://wiki.yoctoproject.org/wiki/BSP_Test_Plan
Under compliance section.  Changes to /opt/lsb-test/session file are also h=
andled by script "compliance_test.py" (link to which you can find in wiki p=
age mentioned)


Can I get clarification on how "compliance-test.compliance-test.stress_test=
_-_ltp_-Beaglebone" was run?

To run stress test, we use "./runltp -f crashme" command.
Stress test for Beaglebone is run by Windriver team. Adding Yi Zhao in mail=
.



Regards,
Armin

*        For full test report, refer attachment [4]

  1.  No new defects are found in this cycle.
  2.  No existing issues observed in this release
  3.  No ptests are failing in this release which were passing in previous =
release. No timeout issues.

QA Hint: One failure was observed on public AB:

testseries | result_id : qemuppc | oeselftest_centos-7_qemuppc_201904142213=
29
runqemu.QemuTest.test_qemu_can_shutdown


No bug filed for this issue, as it appears to be an intermittent failure an=
d worked on rc1 test run.

=3D=3D=3D=3D=3D=3D=3D Links =3D=3D=3D=3D=3D=3D=3D=3D

Link to testresults:

[1] - https://autobuilder.yocto.io/pub/releases/yocto-2.7.rc2/testresults/

[2] - 2.7_RC2_results_merged.zip

[3] - 2.7_ rc2_intel_wr_merged_report

[4] - 2.7 _rc2_full_report

Thanks & Regards,
Sangeeta Jain





--_000_015AB11D45F2C442929CB2765DAE738634DE5BDCPGSMSX110garcor_
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;
	mso-fareast-language:EN-US;}
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
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.5pt;
	font-family:Consolas;
	color:black;
	mso-fareast-language:EN-US;}
code
	{mso-style-priority:99;
	font-family:"Courier New";}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;
	mso-fareast-language:EN-US;}
span.EmailStyle24
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:366490912;
	mso-list-type:hybrid;
	mso-list-template-ids:1418230706 1141440527 1141440537 1141440539 11414405=
27 1141440537 1141440539 1141440527 1141440537 1141440539;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:981421318;
	mso-list-type:hybrid;
	mso-list-template-ids:1690970774 1141440513 1141440537 1141440539 11414405=
27 1141440537 1141440539 1141440527 1141440537 1141440539;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:1273780860;
	mso-list-template-ids:393493996;}
@list l3
	{mso-list-id:1528257845;
	mso-list-template-ids:158212780;}
@list l3:level1
	{mso-level-start-at:3;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-MY" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Hi Armin,<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b><span lang=3D=
"EN-US" style=3D"color:windowtext;mso-fareast-language:EN-MY">From:</span><=
/b><span lang=3D"EN-US" style=3D"color:windowtext;mso-fareast-language:EN-M=
Y"> akuster808 &lt;akuster808@gmail.com&gt;
<br>
<b>Sent:</b> Friday, 26 April, 2019 10:30 PM<br>
<b>To:</b> Jain, Sangeeta &lt;sangeeta.jain@intel.com&gt;; 'yocto@yoctoproj=
ect.org' &lt;yocto@yoctoproject.org&gt;; Eggleton, Paul &lt;paul.eggleton@i=
ntel.com&gt;; 'richard.purdie@linuxfoundation.org' &lt;richard.purdie@linux=
foundation.org&gt;; 'Michael Halstead' &lt;mhalstead@linuxfoundation.org&gt=
;;
 Erway, Tracey M &lt;tracey.m.erway@intel.com&gt;; 'sjolley.yp.pm@gmail.com=
' &lt;sjolley.yp.pm@gmail.com&gt;; openembedded-core@lists.openembedded.org=
<br>
<b>Subject:</b> Re: [OE-core] QA cycle report for 2.7 RC2<o:p></o:p></span>=
</p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Sangeeta,<br>
<br>
<span style=3D"mso-fareast-language:EN-MY"><o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal">On 4/25/19 11:27 PM, Jain, Sangeeta wrote:<o:p></o:p=
></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">QA cycle report for 2.7 RC2:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">&nbsp;</span><o:p></o:p></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo3"><span lang=3D"EN-=
US" style=3D"mso-fareast-language:EN-MY">No high milestone defects.&nbsp;
</span><o:p></o:p></li><li class=3D"MsoNormal" style=3D"mso-list:l0 level1 =
lfo3"><span lang=3D"EN-US" style=3D"color:windowtext;mso-fareast-language:E=
N-MY">Test results are available at following location:</span><o:p></o:p></=
li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:72.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo5">
<![if !supportLists]><span style=3D"font-family:Symbol"><span style=3D"mso-=
list:Ignore">&middot;<span style=3D"font:7.0pt &quot;Times New Roman&quot;"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"mso-fareast-language:EN-MY">F=
or results of all automated tests, please refer to results at public AB [1]=
.</span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:72.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo5">
<![if !supportLists]><span style=3D"font-family:Symbol"><span style=3D"mso-=
list:Ignore">&middot;<span style=3D"font:7.0pt &quot;Times New Roman&quot;"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"mso-fareast-language:EN-MY">F=
or other test results, refer to attachment [2].</span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:72.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo5">
<![if !supportLists]><span style=3D"font-family:Symbol"><span style=3D"mso-=
list:Ignore">&middot;<span style=3D"font:7.0pt &quot;Times New Roman&quot;"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"mso-fareast-language:EN-MY">F=
or test report for test cases run by Intel and WR team, refer attachment [3=
]</span><o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">Since &qu=
ot;compliance-test.compliance-test.LSB_subset_test_suite&quot; was run, can=
 you share the changes made to /opt/lsb-test/session file?<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext;mso-fareast-language=
:EN-MY"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext;mso-fareast-language=
:EN-MY">For
</span><span style=3D"mso-fareast-language:EN-MY">&quot;compliance-test.com=
pliance-test.LSB_subset_test_suite&quot;, we follow the procedure as mentio=
ned at
</span><a href=3D"https://wiki.yoctoproject.org/wiki/BSP_Test_Plan">https:/=
/wiki.yoctoproject.org/wiki/BSP_Test_Plan</a><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext;mso-fareast-language=
:EN-MY">Under compliance section. &nbsp;</span><span style=3D"mso-fareast-l=
anguage:EN-MY">Changes to /opt/lsb-test/session file are also handled by sc=
ript &#8220;compliance_test.py&#8221; (link to which you
 can find in wiki page mentioned)</span><span style=3D"color:windowtext;mso=
-fareast-language:EN-MY"><o:p></o:p></span></p>
<pre><code><o:p>&nbsp;</o:p></code></pre>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">Can I get=
 clarification on how &quot;compliance-test.compliance-test.stress_test_-_l=
tp_-Beaglebone&quot; was run?
</span><span style=3D"color:windowtext;mso-fareast-language:EN-MY"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext;mso-fareast-language=
:EN-MY"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext;mso-fareast-language=
:EN-MY">To run stress test, we use &#8220;</span>./runltp -f crashme&#8221;=
 command.<o:p></o:p></p>
<p class=3D"MsoNormal">Stress test for Beaglebone is run by Windriver team.=
 Adding Yi Zhao in mail.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext;mso-fareast-language=
:EN-MY"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY"><br>
<br>
Regards,<br>
Armin<br>
<br>
<o:p></o:p></span></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-left:72.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo5">
<![if !supportLists]><span style=3D"font-family:Symbol"><span style=3D"mso-=
list:Ignore">&middot;<span style=3D"font:7.0pt &quot;Times New Roman&quot;"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"mso-fareast-language:EN-MY">F=
or full test report, refer attachment [4]</span><o:p></o:p></p>
<ol style=3D"margin-top:0cm" start=3D"3" type=3D"1">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo3"><span lang=3D"EN-=
US" style=3D"color:windowtext;mso-fareast-language:EN-MY">No new defects ar=
e found in this cycle.</span><o:p></o:p></li><li class=3D"MsoNormal" style=
=3D"mso-list:l0 level1 lfo3"><span lang=3D"EN-US" style=3D"color:windowtext=
;mso-fareast-language:EN-MY">No e</span><span lang=3D"EN-US" style=3D"mso-f=
areast-language:EN-MY">xisting issues observed in this release</span><span =
lang=3D"EN-US" style=3D"color:windowtext;mso-fareast-language:EN-MY">
</span><o:p></o:p></li><li class=3D"MsoNormal" style=3D"mso-list:l0 level1 =
lfo3"><span lang=3D"EN-US" style=3D"mso-fareast-language:EN-MY">No p</span>=
<span lang=3D"EN-US" style=3D"color:windowtext;mso-fareast-language:EN-MY">=
tests are failing in this release which were passing in previous release.
 No timeout issues.</span><o:p></o:p></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span lang=3D"EN-US" st=
yle=3D"mso-fareast-language:EN-MY">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">QA Hint: One failure was observed on public AB:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">testseries | result_id : qemuppc | oeselftest_centos-7_qemuppc_201904=
14221329</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">runqemu.QemuTest.test_qemu_can_shutdown</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"font-family:&quot;C=
alibri&quot;,sans-serif;mso-fareast-language:EN-MY">No bug filed for this i=
ssue, as
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">it appear=
s to be an intermittent failure and worked on rc1 test run.</span><o:p></o:=
p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">=3D=3D=3D=3D=3D=3D=3D Links =3D=3D=3D=3D=3D=3D=3D=3D</span><o:p></o:p=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"mso-fareast-languag=
e:EN-MY">Link to testresults:</span></b><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">&nbsp;</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">[1] - </s=
pan><span style=3D"color:#0070C0"><a href=3D"https://autobuilder.yocto.io/p=
ub/releases/yocto-2.7.rc2/testresults/"><span style=3D"color:#0070C0">https=
://autobuilder.yocto.io/pub/releases/yocto-2.7.rc2/testresults/</span></a><=
/span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">&nbsp;</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">[2] - 2.7=
_RC2_results_merged.zip</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">&nbsp;</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">[3] - 2.7=
_ rc2_intel_wr_merged_report</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">&nbsp;</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">[4] &#821=
1; 2.7 _rc2_full_report</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY">&nbsp;</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">Thanks &amp; Regards,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:E=
N-MY">Sangeeta Jain</span><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY"><br>
<br>
<o:p></o:p></span></p>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-MY"><o:p>&nbs=
p;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_015AB11D45F2C442929CB2765DAE738634DE5BDCPGSMSX110garcor_--
