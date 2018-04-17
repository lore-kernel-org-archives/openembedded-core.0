Return-Path: <michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 68F9D7454A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 13:50:39 +0000 (UTC)
X-AuditID: 0a000213-f29ff70000000dce-87-5ad5fbb0aa53
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	8F.17.03534.0BBF5DA5; Tue, 17 Apr 2018 08:50:40 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%20]) with mapi
	id 14.03.0301.000; Tue, 17 Apr 2018 08:50:39 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE][sumo][python3] Generated SDK missing sqlite3
Thread-Index: AdPVnHwPMePtm6JKSBC4yynauRDLjQAEquQQAA5LisAAGiCmMA==
Date: Tue, 17 Apr 2018 13:50:38 +0000
Message-ID: <655290B7709079438B7932553958E60DA1475972@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60DA1475431@ESS-EX01.essvote.corp.local>
	<CY4PR02MB3334C4C5BD7719470CB91CA6ACB70@CY4PR02MB3334.namprd02.prod.outlook.com>
In-Reply-To: <CY4PR02MB3334C4C5BD7719470CB91CA6ACB70@CY4PR02MB3334.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.33]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWyRiBPQ3fD76tRBqeXaVmcWGtjcefnO3YH
	Jo9zG1cweuz9/JslgCmKyyYlNSezLLVI3y6BK2P2ht+MBS3xFUcP7mJpYNwV0sXIwSEhYCLx
	+DBTFyMXh5DACUaJQ0cesHQxcgI5JxklPr+NArHZBIwkzl3fxAhSJCIwi1Hi/ZFWNpCEsICz
	xM+/85hBbBEBF4nFz6dA2U4Sn499YgWxWQRUJdp2tDGC2LwCQRJ3DjVDbVvKKLHz4wZ2kASn
	QKzEsWvrwDYzCohJfD+1hgnEZhYQl7j1ZD6YLSEgILFkz3lmCFtU4uXjf6wQH8hJHL4VCVGe
	L/H41xZ2iF2CEidnPmGZwCg8C8mkWUjKZiEpg4jrSCzY/YkNwtaWWLbwNTOMfebAYyZk8QWM
	7KsYBXMTM3MM9VKLi8vyS1L1kvNzNzECo4aLgUl4B+OCGbGHGAU4GJV4ePWB0STEmlhWXJl7
	iFGag0VJnNf/ilGUkEB6YklqdmpqQWpRfFFpTmrxIUYmDk4QwSXVwHh04b6dEhJ8x3fKaXDN
	fRJ1p0cyRpthe23HYl7xBMdNnmudH8+dIq3w/aPMxomhv8rN/Y4kpbnvfrrtfqnsusk6ixYc
	cyvurXisXpZ56spt9Q+vT0T+5lzz0FWmuXL2ql9Lvr7taxHzZud5uiYyVkk+wzJqnsI01p45
	q6t0X6xqOHBpgYXQEi8lluKMREMt5qLiRAA3Vhf5gAIAAA==
Subject: Re: [sumo][python3] Generated SDK missing sqlite3
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
X-List-Received-Date: Tue, 17 Apr 2018 13:50:40 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA1475972ESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA1475972ESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was on the HEAD of sumo(commit d012a9acdc3dce014705224a1261145628e75931) =
so that commit was already included when I had the issue.  Just generated a=
nother test today and the issue was still there.  If I remove native-python=
3-misc from TOOLCHAIN_HOST_TASK it fails on installing the SDK.  With it th=
ere it succeeds.

Mike



From: Alejandro Enedino Hernandez Samaniego [mailto:alejandr@xilinx.com]
Sent: Monday, April 16, 2018 8:07 PM
To: Davis, Michael; openembedded-core@lists.openembedded.org
Subject: RE: [OE-CORE][sumo][python3] Generated SDK missing sqlite3

Which commit are you using?

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D4379b29e7eede7=
27993ee68c9eba2bdebace5108

In any case, that one should've solved it.

Alejandro

From: openembedded-core-bounces@lists.openembedded.org<mailto:openembedded-=
core-bounces@lists.openembedded.org> [mailto:openembedded-core-bounces@list=
s.openembedded.org]<mailto:[mailto:openembedded-core-bounces@lists.openembe=
dded.org]> On Behalf Of Davis, Michael
Sent: Monday, April 16, 2018 11:19 AM
To: Davis, Michael <michael.davis@essvote.com<mailto:michael.davis@essvote.=
com>>; openembedded-core@lists.openembedded.org<mailto:openembedded-core@li=
sts.openembedded.org>
Subject: Re: [OE-core] [OE-CORE][sumo][python3] Generated SDK missing sqlit=
e3

Adding python3-misc to the SDK seems to have solved the issue.
I saw some commits about separating the two so perhaps this is a side effec=
t?

From: Davis, Michael
Sent: Monday, April 16, 2018 11:04 AM
To: 'openembedded-core@lists.openembedded.org'
Subject: [OE-CORE][sumo][python3] Generated SDK missing sqlite3

Testing out the upcoming sumo release and ran into an issue.  Whenever I at=
tempt to generate an sdk-ext with sumo I get a failure about missing sqlite=
3.
Traceback (most recent call last):
 File "/home/mdavis/core_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/devtool"=
, line 344, in <module>
   ret =3D main()
 File "/home/mdavis/core_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/devtool"=
, line 285, in main
   scriptutils.logger_setup_color(logger, global_args.color)
 File "/home/mdavis/core_sdk/layers/core/scripts/lib/scriptutils.py", line =
38, in logger_setup_color
   from bb.msg import BBLogFormatter
 File "/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/__init__.py", line =
79, in <module>
   from bb import fetch2 as fetch
 File "/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/fetch2/__init__.py"=
, line 39, in <module>
   import bb.persist_data, bb.utils
 File "/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/persist_data.py", l=
ine 33, in <module>
   sqlversion =3D sqlite3.sqlite_version_info
AttributeError: module 'sqlite3' has no attribute 'sqlite_version_info'

The issue seems to be isolated only to python3. The sdk partially installs =
and I am able to source it.  I created a small python sqlite app and was ab=
le to run it properly with python2, but not 3.


--_000_655290B7709079438B7932553958E60DA1475972ESSEX01essvotec_
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
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I was on the HEAD of sumo(<span style=3D"background:=
white">commit d012a9acdc3dce014705224a1261145628e75931)</span> so that comm=
it was already included when I had the issue.&nbsp; Just generated another =
test today and the issue was still there.&nbsp;
 If I remove native-python3-misc from <span style=3D"background:white">TOOL=
CHAIN_HOST_TASK it fails on installing the SDK.&nbsp; With it there it succ=
eeds.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Mike<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Alejandr=
o Enedino Hernandez Samaniego [mailto:alejandr@xilinx.com]
<br>
<b>Sent:</b> Monday, April 16, 2018 8:07 PM<br>
<b>To:</b> Davis, Michael; openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> RE: [OE-CORE][sumo][python3] Generated SDK missing sqlite3<=
o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Which commit are you using?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://git.yoctoproject.org/cgit/cgit.cg=
i/poky/commit/?id=3D4379b29e7eede727993ee68c9eba2bdebace5108">https://git.y=
octoproject.org/cgit/cgit.cgi/poky/commit/?id=3D4379b29e7eede727993ee68c9eb=
a2bdebace5108</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In any case, that one should&#8217;ve solved it.<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Alejandro<o:p></o:p></p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><o:p>&nbsp;</o:p></a></p=
>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:openembedded-core-bou=
nces@lists.openembedded.org">
openembedded-core-bounces@lists.openembedded.org</a> <a href=3D"mailto:[mai=
lto:openembedded-core-bounces@lists.openembedded.org]">
[mailto:openembedded-core-bounces@lists.openembedded.org]</a> <b>On Behalf =
Of </b>
Davis, Michael<br>
<b>Sent:</b> Monday, April 16, 2018 11:19 AM<br>
<b>To:</b> Davis, Michael &lt;<a href=3D"mailto:michael.davis@essvote.com">=
michael.davis@essvote.com</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-co=
re@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [OE-CORE][sumo][python3] Generated SDK missin=
g sqlite3<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Adding python3-misc to=
 the SDK seems to have solved the issue.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I saw some commits abo=
ut separating the two so perhaps this is a side effect?</span><span style=
=3D"font-family:&quot;Courier New&quot;;color:black;background:white"><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Davis, M=
ichael
<br>
<b>Sent:</b> Monday, April 16, 2018 11:04 AM<br>
<b>To:</b> 'openembedded-core@lists.openembedded.org'<br>
<b>Subject:</b> [OE-CORE][sumo][python3] Generated SDK missing sqlite3<o:p>=
</o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Testing out the upcoming sumo release and ran into a=
n issue.&nbsp; Whenever I attempt to generate an sdk-ext with sumo I get a =
failure about missing sqlite3.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;;c=
olor:black;background:white">Traceback (most recent call last):
</span><span style=3D"font-family:&quot;Courier New&quot;"><br>
&nbsp;File &quot;/home/mdavis/core_sdk/sysroots/x86_64-pokysdk-linux/usr/bi=
n/devtool&quot;, line 344, in &lt;module&gt;
<br>
&nbsp;&nbsp;&nbsp;ret =3D main() <br>
&nbsp;File &quot;/home/mdavis/core_sdk/sysroots/x86_64-pokysdk-linux/usr/bi=
n/devtool&quot;, line 285, in main
<br>
&nbsp;&nbsp;&nbsp;scriptutils.logger_setup_color(logger, global_args.color)=
 <br>
&nbsp;File &quot;/home/mdavis/core_sdk/layers/core/scripts/lib/scriptutils.=
py&quot;, line 38, in logger_setup_color
<br>
&nbsp;&nbsp;&nbsp;from bb.msg import BBLogFormatter <br>
&nbsp;File &quot;/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/__init__.=
py&quot;, line 79, in &lt;module&gt;
<br>
&nbsp;&nbsp;&nbsp;from bb import fetch2 as fetch <br>
&nbsp;File &quot;/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/fetch2/__=
init__.py&quot;, line 39, in &lt;module&gt;
<br>
&nbsp;&nbsp;&nbsp;import bb.persist_data, bb.utils <br>
&nbsp;File &quot;/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/persist_d=
ata.py&quot;, line 33, in &lt;module&gt;
<br>
&nbsp;&nbsp;&nbsp;sqlversion =3D sqlite3.sqlite_version_info <br>
AttributeError: module 'sqlite3' has no attribute 'sqlite_version_info'<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">The issue seems to be isolated only to python3. The =
sdk partially installs and I am able to source it.&nbsp; I created a small =
python sqlite app and was able to run it properly with python2, but not 3.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60DA1475972ESSEX01essvotec_--
