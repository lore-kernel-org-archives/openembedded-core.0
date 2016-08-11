Return-Path: <simo.kuusela@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E3D5B7016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 08:32:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2016 01:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; 
	d="scan'208,217";a="863571521"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2016 01:32:01 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 11 Aug 2016 09:31:59 +0100
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.203]) by
	irsmsx111.ger.corp.intel.com ([169.254.2.19]) with mapi id
	14.03.0248.002; Thu, 11 Aug 2016 09:31:59 +0100
From: "Kuusela, Simo" <simo.kuusela@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE] Why Pythons default encoding is set to UTF-8?
Thread-Index: AdHzqYRQmRY8QjC1Q/qc2VlaMsN3xwAAToLA
Date: Thu, 11 Aug 2016 08:31:59 +0000
Message-ID: <8C4744E0DF24D848970965DB9980B643805B20@IRSMSX104.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Why Pythons default encoding is set to UTF-8?
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
X-List-Received-Date: Thu, 11 Aug 2016 08:32:03 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8C4744E0DF24D848970965DB9980B643805B20IRSMSX104gercorpi_"

--_000_8C4744E0DF24D848970965DB9980B643805B20IRSMSX104gercorpi_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I recently ran all of the Pythons unit tests and 13 tests failed because th=
e default encoding wasn't ASCII which is what Python uses by default. I fou=
nd that in meta/recipes-devtools/python/python/sitecustomize.py there is a =
line: sys.setdefaultencoding("utf8")

Does anyone know why this has been done? At least I didn't find any commit =
message or reasoning for it.

Best regards,
Simo Kuusela

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--_000_8C4744E0DF24D848970965DB9980B643805B20IRSMSX104gercorpi_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 2.0cm 70.85pt 2.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FI" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I recently ran all of the Pytho=
ns unit tests and 13 tests failed because the default encoding wasn&#8217;t=
 ASCII which is what Python uses by default. I found that in meta/recipes-d=
evtools/python/python/sitecustomize.py there
 is a line: sys.setdefaultencoding(&#8221;utf8&#8221;)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Does anyone know why this has b=
een done? At least I didn&#8217;t find any commit message or reasoning for =
it.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards, <o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Simo Kuusela<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<p>---------------------------------------------------------------------<br>
Intel Finland Oy<br>
Registered Address: PL 281, 00181 Helsinki <br>
Business Identity Code: 0357606 - 4 <br>
Domiciled in Helsinki </p>

<p>This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></body>
</html>

--_000_8C4744E0DF24D848970965DB9980B643805B20IRSMSX104gercorpi_--
