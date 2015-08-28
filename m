Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6CDA576DC0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 20:53:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Aug 2015 13:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,426,1437462000"; 
	d="scan'208,217";a="757509733"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga001.jf.intel.com with ESMTP; 28 Aug 2015 13:53:31 -0700
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 28 Aug 2015 13:53:30 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.2.154]) by
	ORSMSX114.amr.corp.intel.com ([169.254.8.101]) with mapi id
	14.03.0224.002; Fri, 28 Aug 2015 13:53:30 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "joshua.lock@collabora.co.uk"
	<joshua.lock@collabora.co.uk>
Thread-Topic: [fido] Please backport commit
Thread-Index: AdDh0qS0dfK5KoeyThaDmJB/jBleAA==
Date: Fri, 28 Aug 2015 20:53:29 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6101E559A@ORSMSX109.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: [fido] Please backport commit
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
X-List-Received-Date: Fri, 28 Aug 2015 20:53:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B6101E559AORSMSX109amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B6101E559AORSMSX109amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Joshua,
please backport the Yocto master  commit (cherry-pick)
625e0ec8b5e5f1c39b3bfad0e6adfecaf957d689 :"glibc: Consider adding -Wno-erro=
r in cases when not using -O2"
to Fido.

This is needed in order to fix the Fido bug https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D8214.

Thanks

Juro Bystricky

--_000_6E51916E4A1F32428260031F4C7CD2B6101E559AORSMSX109amrcor_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Joshua,<o:p></o:p></p>
<p class=3D"MsoNormal">please backport the Yocto master &nbsp;commit (cherr=
y-pick) <o:p>
</o:p></p>
<p class=3D"MsoNormal">625e0ec8b5e5f1c39b3bfad0e6adfecaf957d689 :&#8220;gli=
bc: Consider adding -Wno-error in cases when not using -O2&#8221;<o:p></o:p=
></p>
<p class=3D"MsoNormal">to Fido.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is needed in order to fix the Fido bug <a href=
=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8214">
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8214</a>.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Juro Bystricky<o:p></o:p></p>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B6101E559AORSMSX109amrcor_--
