Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 51B43744F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 18:18:47 +0000 (UTC)
X-AuditID: 0a00029b-19fe89c000000a0a-ca-5ad4e90887d6
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	38.DC.02570.809E4DA5; Mon, 16 Apr 2018 13:18:48 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%20]) with mapi
	id 14.03.0301.000; Mon, 16 Apr 2018 13:18:47 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "Davis, Michael" <michael.davis@essvote.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE][sumo][python3] Generated SDK missing sqlite3
Thread-Index: AdPVnHwPMePtm6JKSBC4yynauRDLjQAEquQQ
Date: Mon, 16 Apr 2018 18:18:45 +0000
Message-ID: <655290B7709079438B7932553958E60DA1475431@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.33]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWyRiBPQ5fj5ZUogz0fxCzu/HzH7sDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujG/PmpgLNphV/JzdxtTA+E2/i5GTQ0LARGLHs6NsXYxcHEIC
	Rxklfl54zwzhnGSU2LnpBiNIFZuAkcS565sYQRIiAt2MEtebfzGBJIQFnCV+/p3HDGKLCLhI
	LH4+Bco2krg07TBYDYuAqsT3+YdZQGxegSCJlm33wWxGATGJ76fWgNUwC4hL3HoynwniJAGJ
	JXvOM0PYohIvH/9j7WLkALLlJA7fioQoz5eY+Wo7E8RIQYmTM5+wTGAUnIVk0iwkZbOQlEHE
	dSQW7P7EBmFrSyxb+JoZxj5z4DETsvgCRvZVjHy5RnqpxcVl+SWpesn5uZsYgeHOxcA0ewdj
	T1PsIUYBDkYlHt7cRVeihFgTy4orcw8xSnOwKInzBlwxihISSE8sSc1OTS1ILYovKs1JLT7E
	yMTBCSK4pBoYmfhuSUy0MlnZ4xfCMPVKj8rMY2F7p+91Vb1SGDMtY5l3/rnkR0vWnXuckWyT
	/LNOQ6+tSXPJGqWkm2LN+1YVHlbRVN1l9TRlp2KxUs+xnc6cf1ojayYURvutrPF9tm7F5+Tv
	/jvj9/POST94JtJzxeOJIVzP+sK8ahdN6Iqdlm4r0/rnV2+5EktxRqKhFnNRcSIAQgeLfV0C
	AAA=
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
X-List-Received-Date: Mon, 16 Apr 2018 18:18:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA1475431ESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA1475431ESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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


--_000_655290B7709079438B7932553958E60DA1475431ESSEX01essvotec_
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
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
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

--_000_655290B7709079438B7932553958E60DA1475431ESSEX01essvotec_--
