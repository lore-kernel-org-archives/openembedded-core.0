Return-Path: <michael.davis@essvote.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Apr 2018 16:18:42 UTC
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE196212C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 16:18:42 +0000 (UTC)
X-AuditID: 0a00029b-de1ff70000000a0a-85-5ad4c95d36cc
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	1B.CB.02570.D59C4DA5; Mon, 16 Apr 2018 11:03:42 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%20]) with mapi
	id 14.03.0301.000; Mon, 16 Apr 2018 11:03:41 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE][sumo][python3] Generated SDK missing sqlite3
Thread-Index: AdPVnHwPMePtm6JKSBC4yynauRDLjQ==
Date: Mon, 16 Apr 2018 16:03:40 +0000
Message-ID: <655290B7709079438B7932553958E60DA14743CE@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.33]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWyRiBPQzfu5JUog8UPmS3u/HzH7sDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujN0L7jMVvNas+PnGtoHxnUoXIyeHhICJRN/TW+xdjFwcQgJH
	GSX2zu5hhnBOMkrcPHyZDaSKTcBI4tz1TYwgtohAtMTSGTOBOjg4hAXsJX4f8oIIu0gsfj6F
	GcLWk5jy9AxYCYuAqsS2P2CdvAJBEsdP7GUFsRkFxCS+n1rDBGIzC4hL3HoynwniHgGJJXvO
	M0PYohIvH/9jBRkjISAncfhWJER5vsThDYdZIEYKSpyc+YRlAqPgLCSTZiEpm4WkDCKuI7Fg
	9yc2CFtbYtnC18ww9pkDj5mQxRcwsq9i5Ms10kstLi7LL0nVS87P3cQIDHMuBqbZOxh7mmIP
	MQpwMCrx8OYuuhIlxJpYVlyZe4hRmoNFSZw34IpRlJBAemJJanZqakFqUXxRaU5q8SFGJg5O
	EMEl1cDoVVa/c913w/pt4a5V38/I99Q6svYcM+eZM3faxcs5F64I1hzdGnd6mrnof8++q8uT
	axiDXfWkeRviJi85KJO1QsQjaeVTX3fHQNeqeddivzp1nz765u7FSfVxu6cEivfMOFl5ZvoU
	hgDz3U7PZtfdP9LI53Kj8vJaAVZzuw9SdVOTN6+XSLNVYinOSDTUYi4qTgQA/+YkPFkCAAA=
Subject: [sumo][python3] Generated SDK missing sqlite3
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
X-List-Received-Date: Mon, 16 Apr 2018 16:18:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA14743CEESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA14743CEESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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


--_000_655290B7709079438B7932553958E60DA14743CEESSEX01essvotec_
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
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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

--_000_655290B7709079438B7932553958E60DA14743CEESSEX01essvotec_--
