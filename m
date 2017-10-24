Return-Path: <Yong.Lee@johnsonoutdoors.com>
X-Greylist: delayed 392 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Oct 2017 16:27:00 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.200])
	by mail.openembedded.org (Postfix) with ESMTP id 9200D719E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 16:27:00 +0000 (UTC)
Received: from [216.82.241.100] by server-8.bemta-8.messagelabs.com id
	AD/76-12728-D486FE95; Tue, 24 Oct 2017 16:20:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSbUhTYRTH9+zu5abeum6ap6UW08osh9oLvZH
	Rl4IQ7FMsorrL27bai927xaIgE8msyCwCN6lVWkRIZWEOtbL14gupYYYliqVjmjYHBYVU1u6e
	Wfbl4XfO/3+ec56HQxKKFpmKZB02lrMwJrUsStKlqbJnbDEEtZnB7ug1/ZMT8k1oa2ftLZSHd
	kqNFp3VsVdqKKr2yAqKUxzPJjcWIl/yaRRFSmgXAZ6Xl8VCoKAviqE3eAXhwItgqLI2FMwiZX
	QmeMo6JALH0TvhfYNffhqRpJLOgLqza3E6G35fqo9YNBDw+6QCS+hFcPLxkFxgit4F764/D3s
	QPRe+t9eIBSboBOjzucMMNA3VTV0E5nj4NDwlxbwAmktbZZiToNt9Jjwn0F45PLw4KMeCBurK
	AwhzLlTVNIuxyYmgaGw40iEdfFPNhPAARO+GospVOL0OTpW3RJodhDdvuyINeqQQ+PouMlEil
	LsqCCy0SeGpvyzcTRGqCPT8ClcraRUM9JQizIkw2v9Iip9pgbOuQYS/IhbanD7JebTYNeMHXD
	Nsrhk2nF8OVxu/yDAvg5vXxolpftU8LJ6Zv4rkt1Eaz3KHWS4je4VGxxn1BpuZMZoysjLXaMw
	szzN61sToeM0+q/k+Cq3QcZEIeVBF4xYvmkeK1fFUnj6oVczWWfOPGBjesIezm1jeixJJUg3U
	EkGL5Vg969hvNIX2cFoGMkYdR+ULMsUXMGbeqMdSO8ohfzb1/RST994PhM7H4dPvHC8kFBKL1
	cKqEqhsoYwWygx2y99Lp/e7GyWplBQSiUSKmAKWMxtt/+tjKIFEaiW+JcZosf3tPRYaSxwaKy
	nnszCWjfknqQpR8YqBVMexW51vf6vvrs5/7aRGfNE5ImrJHU3rR+2FkxtmpV4+7H0w/9u1idz
	6ksnNuuiOUa7kxIFKu2Ow/eicTez2srLtVs3AE7hhv69d+2JkW5c7JU1V6qbWn7sU7ChOSD63
	UhkcOlXhadqhYqfqShrsiz8Ua5Ofj/Q6fizdcGihWsIbmKx0guOZPz2jUsfaAwAA
X-Env-Sender: Yong.Lee@johnsonoutdoors.com
X-Msg-Ref: server-8.tower-220.messagelabs.com!1508862022!194888063!1
X-Originating-IP: [207.46.163.117]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 543 invoked from network); 24 Oct 2017 16:20:23 -0000
Received: from mail-sn1nam01lp0117.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) (207.46.163.117)
	by server-8.tower-220.messagelabs.com with AES256-SHA256 encrypted SMTP;
	24 Oct 2017 16:20:23 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=johnsonoutdoorsinc.onmicrosoft.com; s=selector1-johnsonoutdoors-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=CXiKjZ7o6aQsxfvITpyRy7pqNlDV6djXHlCXp0a3xyE=;
	b=30k6ZItmvG/JXtLrc+eYkKEL/gKz0uroTRZdVB3J5fNiUMbs4iafT3NhDHZWFUx6VxL5V4rNqWgtLQJP0QioIARz3Woq4JJ+JcrTlDWpd3nUHCQkzRqkX5zK89J21vz5qrcVqriSRHN2PU6cLlyIm3rayVhnsByS2OPKJfrmYzQ=
Received: from SN1PR13MB0272.namprd13.prod.outlook.com (10.162.98.29) by
	SN1PR13MB0320.namprd13.prod.outlook.com (10.163.202.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.3; Tue, 24 Oct 2017 16:20:21 +0000
Received: from SN1PR13MB0272.namprd13.prod.outlook.com ([10.162.98.29]) by
	SN1PR13MB0272.namprd13.prod.outlook.com ([10.162.98.29]) with mapi id
	15.20.0178.003; Tue, 24 Oct 2017 16:20:21 +0000
From: "Lee, Yong" <Yong.Lee@johnsonoutdoors.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Q. Changing Preferred Version of GCC
Thread-Index: AdNM4XaRr/ccJB21Ty+UTaD+juupcA==
Date: Tue, 24 Oct 2017 16:20:20 +0000
Message-ID: <SN1PR13MB0272E11648777C091CAD8D8F92470@SN1PR13MB0272.namprd13.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [12.48.212.2]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN1PR13MB0320;
	6:p21sNmlY8iPmHjCDuKobrISE//Mknt9LJ5Qoba9zl6GQKMsNMgoeE4I6mE5Odq9v8jgz73SiaaDpYfT25qp1IlsUTshyp4YLtxWPRB4g6LqiWofXSms4IqW2zOnP/wAQavjkei8INPJ7hzDkvHqod8tbmeD+AC3KAaoqQAv24o6yDLB3IZwGEBZTeujFEjwwTmoCaTubuyQWug7z4EysxTCQTDsCAWfhAhpsLttPLQRh4fztfJhm+I6k9tK+Iej0NERvST88owTvsWecqO0rcy16ZCR5wpqtPiqjcUBSeKTq/2P7mzamV5bYdnGmLBvGXL/y/WRO8fS9wZ/+e61tsrw6idtGAUN1ZsL2le3/WFc=;
	5:ek1SZrACCMQIR/bGlKgWnaZqXgYTfpMkfBTMfQ/oCjdV5pzIPmO5Ae30m9x5mLcvhqMfhYybj2URYp2z0ebvtKm7PszdaruDe5AaLKvCiedbKYrrZMPoN+l/NzlktICM9AyI9jQNl8bMYvWdaStEZSHciIeLmLym6alqEkpBlzA=;
	24:Ee6BdmJghy+FlVUIxGirJPz01dv4O+UVYgWW+0wZ1qevnZONoAGrwN+DAk5G0P944hE0hUz52+jX2EzSgrGFn4dFAQq7lx/rsUy7jouoRwI=;
	7:mAgc7LRjD6QSj2QCRbzLcnAh9pvmCPLxleuLNWjFh4IuXAtGXHAdTKWHEdWWAFKgygxh+ycaqkwO5MbKSvOUSXQsHWPjsBwWiD7RN6epH5nBsKGp44yXg8MQgtvDQszhBaxT10q5dsLc02Q54eqrm2VWmhVi5tleAX8UzpHdDcVLYAEABEh1WCpwfruC6clQJcTigiC+d8ubPZbgXSwkQCC4+QpJQwN34CXAzxFFPnsRth+ZT5oydkIWwy+g76Rg
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 35b87493-7774-4519-8973-08d51afb1fab
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603229);
	SRVR:SN1PR13MB0320; 
x-ms-traffictypediagnostic: SN1PR13MB0320:
x-exchange-antispam-report-test: UriScan:(21748063052155);
x-microsoft-antispam-prvs: <SN1PR13MB032050CF11C364A630A572AF92470@SN1PR13MB0320.namprd13.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(100000703101)(100105400095)(3231020)(10201501046)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123558100)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR13MB0320; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR13MB0320; 
x-forefront-prvs: 047001DADA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(346002)(39830400002)(376002)(189002)(199003)(85714005)(99286003)(55016002)(102836003)(6916009)(8676002)(316002)(790700001)(6116002)(106356001)(101416001)(50986999)(5640700003)(14454004)(478600001)(105586002)(189998001)(5660300001)(33656002)(3280700002)(8936002)(81156014)(5890100001)(6436002)(72206003)(81166006)(54356999)(66066001)(54896002)(74316002)(2351001)(77096006)(3660700001)(53936002)(25786009)(2906002)(86362001)(6506006)(3846002)(9686003)(7696004)(2900100001)(6306002)(97736004)(2501003)(7736002)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR13MB0320;
	H:SN1PR13MB0272.namprd13.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: johnsonoutdoors.com does not
	designate permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: johnsonoutdoors.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b87493-7774-4519-8973-08d51afb1fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2017 16:20:21.1367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 16ab962a-71e7-495f-a8ed-d682f863e008
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR13MB0320
Subject: Q. Changing Preferred Version of GCC
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
X-List-Received-Date: Tue, 24 Oct 2017 16:27:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN1PR13MB0272E11648777C091CAD8D8F92470SN1PR13MB0272namp_"

--_000_SN1PR13MB0272E11648777C091CAD8D8F92470SN1PR13MB0272namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello, I posted earlier but my question was unclear. Apologies!

Is it acceptable to expect different versions of GCC (via PREFERRED_VERSION=
_gcc) to play well with the rest of recipes/packages included in the same r=
elease branch?
Default for my current Yocto SDK (morty) is linaro-6.2, but I have a few pa=
ckages that require an older version (possibly 5.4, which is included in me=
ta).
Unfortunately GCC 5.4 is refusing to build at the moment.

I can post the error log, but I would like to run it by the developers here=
 if this approach makes sense.

Adam
The information in this email and any attachments may contain proprietary a=
nd confidential information that is intended for the addressee(s) only. If =
you are not the intended recipient, you are hereby notified that any disclo=
sure, copying, distribution, retention or use of the contents of this infor=
mation is prohibited. If you have received this email in error, please imme=
diately contact the sender and delete the email.

--_000_SN1PR13MB0272E11648777C091CAD8D8F92470SN1PR13MB0272namp_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
<p class=3D"MsoNormal">Hello, I posted earlier but my question was unclear.=
 Apologies!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is it acceptable to expect different versions of GCC=
 (via PREFERRED_VERSION_gcc) to play well with the rest of recipes/packages=
 included in the same release branch?<o:p></o:p></p>
<p class=3D"MsoNormal">Default for my current Yocto SDK (morty) is linaro-6=
.2, but I have a few packages that require an older version (possibly 5.4, =
which is included in meta).<o:p></o:p></p>
<p class=3D"MsoNormal">Unfortunately GCC 5.4 is refusing to build at the mo=
ment.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I can post the error log, but I would like to run it=
 by the developers here if this approach makes sense.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Adam<o:p></o:p></p>
</div>
The information in this email and any attachments may contain proprietary a=
nd confidential information that is intended for the addressee(s) only. If =
you are not the intended recipient, you are hereby notified that any disclo=
sure, copying, distribution, retention
 or use of the contents of this information is prohibited. If you have rece=
ived this email in error, please immediately contact the sender and delete =
the email.
</body>
</html>

--_000_SN1PR13MB0272E11648777C091CAD8D8F92470SN1PR13MB0272namp_--
