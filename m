Return-Path: <alejandr@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0085.outbound.protection.outlook.com [104.47.32.85])
	by mail.openembedded.org (Postfix) with ESMTP id 15D3365CE9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 01:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=xVa3/PxLZZWwLb+GJRX9RFqEZL4MzBlFtQTee3bMyvg=;
	b=Ssjx2lycBBwPd1WNd2+rKZwBBwIgl/8CmWJbqmokNA+KfqlOPQQmnBPEpMKCyCBQyEKKLHva2jgYg601KHTDc2BFt7rvAoIdVg8stDCZz0RylKNMFQh4vYgIQte7TQ6WhAt3M9jRYrSGOQtM5cNAR5UC3xReDTXjwOur1gGqaOc=
Received: from CY4PR02MB3334.namprd02.prod.outlook.com (10.165.89.141) by
	CY4PR02MB2760.namprd02.prod.outlook.com (10.175.59.146) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.675.14; Tue, 17 Apr 2018 01:07:26 +0000
Received: from CY4PR02MB3334.namprd02.prod.outlook.com
	([fe80::a436:1da6:604f:4a13]) by
	CY4PR02MB3334.namprd02.prod.outlook.com
	([fe80::a436:1da6:604f:4a13%13]) with mapi id 15.20.0675.014;
	Tue, 17 Apr 2018 01:07:26 +0000
From: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
To: "Davis, Michael" <michael.davis@essvote.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE][sumo][python3] Generated SDK missing sqlite3
Thread-Index: AdPVnHwPMePtm6JKSBC4yynauRDLjQAEquQQAA5LisA=
Date: Tue, 17 Apr 2018 01:07:26 +0000
Message-ID: <CY4PR02MB3334C4C5BD7719470CB91CA6ACB70@CY4PR02MB3334.namprd02.prod.outlook.com>
References: <655290B7709079438B7932553958E60DA1475431@ESS-EX01.essvote.corp.local>
In-Reply-To: <655290B7709079438B7932553958E60DA1475431@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alejandr@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR02MB2760;
	7:+1aCOuJS+wpSKHtcBEeUsCH7zDOeZsZ2S2KdH/Bhezqa/i0xMyaEVpbkfDb93MbABA6LtWYLvMvn8ZvDgkcnS0jBHebp1wq4ZcHVCrFCneGaCHz9sQrhwfcCWd0g3DsaaNKeZvJmbhjTtvm1ijdxLDCt28PTnAoUMd5nV4Giab3UVHwdJpRUMk3+tB+H0rJCo/7UTsnhJ9axBSbjh/U8S2uKPHhQDzmUYtm/ljj7pUdnWNs20wYkoZLjt6cuLX3i
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR02MB2760; 
x-ms-traffictypediagnostic: CY4PR02MB2760:
x-microsoft-antispam-prvs: <CY4PR02MB2760B1F8CAC315F69E009513ACB70@CY4PR02MB2760.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(264703809997249)(21748063052155); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231232)(944501327)(52105095)(10201501046)(6055026)(6041310)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR02MB2760; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2760; 
x-forefront-prvs: 0645BEB7AA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(366004)(396003)(39380400002)(346002)(189003)(199004)(476003)(6506007)(2501003)(59450400001)(966005)(102836004)(3280700002)(6306002)(11346002)(81156014)(8936002)(81166006)(53936002)(53546011)(446003)(7696005)(99286004)(110136005)(236005)(55016002)(8676002)(9686003)(6246003)(316002)(6436002)(186003)(19609705001)(106356001)(5250100002)(76176011)(54896002)(7736002)(2906002)(5660300001)(25786009)(26005)(2900100001)(478600001)(790700001)(86362001)(6116002)(3846002)(68736007)(97736004)(74316002)(66066001)(606006)(3660700001)(33656002)(486006)(229853002)(105586002)(14454004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2760;
	H:CY4PR02MB3334.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: d3QQ8THIHz/aOThlv52Mhfjg6+9SIR4ZlIaKQq619+//+iKTkNhyCGcCeux2PIsCCeKlnhdTjbA/78t6HrIL21N04d4SeUdYMV38gMW/bWfUL+jSXL0GPneaXSqptCr7zFxo92clmQGvnjS4A7bbhULnZc2PEF75Hk87KzDgiv07pfG+Ej4EfLdGG0rH0iRT
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 74273f0a-2b8f-4406-5000-08d5a3ff95a6
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74273f0a-2b8f-4406-5000-08d5a3ff95a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2018 01:07:26.3610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2760
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
X-List-Received-Date: Tue, 17 Apr 2018 01:07:28 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR02MB3334C4C5BD7719470CB91CA6ACB70CY4PR02MB3334namp_"

--_000_CY4PR02MB3334C4C5BD7719470CB91CA6ACB70CY4PR02MB3334namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Which commit are you using?

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D4379b29e7eede7=
27993ee68c9eba2bdebace5108

In any case, that one should've solved it.

Alejandro

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Davis, Michael
Sent: Monday, April 16, 2018 11:19 AM
To: Davis, Michael <michael.davis@essvote.com>; openembedded-core@lists.ope=
nembedded.org
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


--_000_CY4PR02MB3334C4C5BD7719470CB91CA6ACB70CY4PR02MB3334namp_
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<span style=3D"mso-bookmark:_MailEndCompose"></span>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openembedded-core-bounces@lists.openemb=
edded.org [mailto:openembedded-core-bounces@lists.openembedded.org]
<b>On Behalf Of </b>Davis, Michael<br>
<b>Sent:</b> Monday, April 16, 2018 11:19 AM<br>
<b>To:</b> Davis, Michael &lt;michael.davis@essvote.com&gt;; openembedded-c=
ore@lists.openembedded.org<br>
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
;Tahoma&quot;,sans-serif">From:</span></b><span style=3D"font-size:10.0pt;f=
ont-family:&quot;Tahoma&quot;,sans-serif"> Davis, Michael
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

--_000_CY4PR02MB3334C4C5BD7719470CB91CA6ACB70CY4PR02MB3334namp_--
