Return-Path: <chris.laplante@agilent.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0048.outbound.protection.outlook.com [104.47.41.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1884078594
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=83Oog7bM3shsi975v8xhzB7GNn7chgjNmzDNPtjb9F8=;
	b=jIGq2BWtENGVEykhabitihY2h/FWtapBTfz2EY8skJY2NfYgvNo6+cSYapSaf2EtyGnwl/TvtiJGKQrt/OkcaErfI7x7NSovqpONjpbSCFDk+D1jaXhx4DwfGMLd1vG1oxcyDcy+QiSlgqmwrXh8yu/5bmtJowKQ4KPfCM95e3c=
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com (10.174.115.15) by
	BN6PR1201MB0100.namprd12.prod.outlook.com (10.174.114.137) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.631.10; Wed, 28 Mar 2018 12:49:50 +0000
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::31bb:ae63:3595:7ba8]) by
	BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::31bb:ae63:3595:7ba8%4]) with mapi id 15.20.0631.010;
	Wed, 28 Mar 2018 12:49:50 +0000
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: "devtool modify"-ing kernel recipes with .scc files
Thread-Index: AdO8ivnMWnAF+nbWS92K3nBsywyqew==
Date: Wed, 28 Mar 2018 12:49:49 +0000
Message-ID: <BN6PR1201MB01953D66E7B3B86431286BDD8BA30@BN6PR1201MB0195.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [165.225.38.219]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR1201MB0100;
	7:uKmNwxWCayv8QpKT8cgh3KxwsaXkDXZq4/qSj45kpKA1KHx2PxUpv2KMWyr36j3BaqFr/s8GTj6iNhXUBaLOH+iZOyGrG80zavIdy30+hVIIynDwK2+0F3GhfbDFfNihIpNdCaGbhfSku2H+jJrKajretigs4bSaE1eUWVesGCJPhqVKaLPkf5O0bQwu0nellTjAVfFfo9XprHdoF3fKuUHmbBTaRrGHihQOZZpkov6VXurwtlbJW8FTMpZeOb5b
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a9d3981b-dd2b-4972-b82c-08d594aa64f0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR1201MB0100; 
x-ms-traffictypediagnostic: BN6PR1201MB0100:
x-microsoft-antispam-prvs: <BN6PR1201MB01009299B6495CDE9244E43B8BA30@BN6PR1201MB0100.namprd12.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231221)(11241501184)(944501327)(52105095)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR1201MB0100; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR1201MB0100; 
x-forefront-prvs: 06259BA5A2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39380400002)(376002)(396003)(39860400002)(346002)(366004)(189003)(199004)(29502001)(53754006)(7736002)(8676002)(81156014)(105586002)(81166006)(2351001)(97736004)(33656002)(66066001)(74316002)(5250100002)(2501003)(106356001)(26005)(316002)(5660300001)(102836004)(25786009)(186003)(14454004)(2906002)(68736007)(3280700002)(486005)(2900100001)(6506007)(476003)(486005)(3660700001)(9686003)(5640700003)(6436002)(53936002)(6306002)(6916009)(54896002)(55016002)(86362001)(478600001)(99286004)(6116002)(7696005)(3846002)(790700001)(8936002)(55236004)(142923001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0100;
	H:BN6PR1201MB0195.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: kGiyWRd6QU3xfFSXDF9TrtVNzfbUpB09mB3aQ+2GVUhxz/bwXeqHrUSOUwzMo0qvddr9QojS8LtYHANJ0xuHjXX3zzXy8O1N74kGtLXr63D8fcw2mk6gfeZwNHzaUt9lm8O2YdIvam3Ovboy2TWc/Rp4gNLsUJphbeqXnNFdYLFNvpdoyjQzhHHr7HjuuoNoAzYZ5LD/UEnntsFMHnNishgH7suvNjgfMpexZEb5Xs5JJ2Dok637NQep6SYFM68I7IXaDLPS9UplZloIZSnvkhZXLu0nbrVEDLSCStc7F2f4SlyCMclj/jzDuW8lN/CP54NHcZZGRDjXTfvhGmOtVg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d3981b-dd2b-4972-b82c-08d594aa64f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2018 12:49:50.0470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0100
Subject: "devtool modify"-ing kernel recipes with .scc files
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
X-List-Received-Date: Wed, 28 Mar 2018 12:49:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR1201MB01953D66E7B3B86431286BDD8BA30BN6PR1201MB0195_"

--_000_BN6PR1201MB01953D66E7B3B86431286BDD8BA30BN6PR1201MB0195_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I have noticed that the "get_recipe_local_files" function of meta/lib/oe/re=
cipeutils.py doesn't have any kind of logic to handle .scc files. This mean=
s when you try to 'devtool modify' a kernel recipe that uses them, compilat=
ion can fail, for instance if the .scc file includes some config fragments.

Would the OE project be interested in a patch to fix this? I am considering=
 two possible ways to resolve it:

  1.  get_recipe_local_files could handle .scc files directly, perhaps by u=
sing something in classes/kernel-yocto.bbclass.
  2.  Add a variable like DEVTOOL_EXTRA_LOCAL_FILES that represents extra f=
iles for get_recipe_local_files to include.

I'd be happy to implement either (or both) of these and send in a patch. Or=
 maybe someone has a different solution I could look at.

Thanks,
Chris

--_000_BN6PR1201MB01953D66E7B3B86431286BDD8BA30BN6PR1201MB0195_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-compose;
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
/* List Definitions */
@list l0
	{mso-list-id:1243832977;
	mso-list-template-ids:1034554670;}
@list l1
	{mso-list-id:1557400817;
	mso-list-type:hybrid;
	mso-list-template-ids:178030722 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
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
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have noticed that the &#8220;get_recipe_local_file=
s&#8221; function of meta/lib/oe/recipeutils.py doesn&#8217;t have any kind=
 of logic to handle .scc files. This means when you try to &#8216;devtool m=
odify&#8217; a kernel recipe that uses them, compilation can fail,
 for instance if the .scc file includes some config fragments. <o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Would the OE project be interested in a patch to fix=
 this? I am considering two possible ways to resolve it:<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoNormal" style=3D"mso-list:l1 level1 lfo3">get_recipe_local_=
files could handle .scc files directly, perhaps by using something in class=
es/kernel-yocto.bbclass.<o:p></o:p></li><li class=3D"MsoNormal" style=3D"ms=
o-list:l1 level1 lfo3">Add a variable like DEVTOOL_EXTRA_LOCAL_FILES that r=
epresents extra files for get_recipe_local_files to include.<o:p></o:p></li=
></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;d be happy to implement either (or both) of =
these and send in a patch. Or maybe someone has a different solution I coul=
d look at.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN6PR1201MB01953D66E7B3B86431286BDD8BA30BN6PR1201MB0195_--
