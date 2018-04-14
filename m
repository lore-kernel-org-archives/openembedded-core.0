Return-Path: <chris.laplante@agilent.com>
X-Greylist: delayed 3553 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 14 Apr 2018 16:28:48 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0050.outbound.protection.outlook.com [104.47.36.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7198960279
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=/pxmMJAK/fB8YCxkQISHBqaM4+PvJpqLj91ExbAXui4=;
	b=dI95WrnOABzJmYNdgiZMPY06RV7j8AUR2+te0vQbAHYCRVu8XvlRRkdVNPuvflzAof4BL7acGg5wtxgR1eBITFI80ornPQaaLJu4m58nVFq/nDudsZLmrRRvwFZUy3Sq5Ki/m4xFu/dezxfRTpo52sv0doNTbE53y4R8HCJB2A0=
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com (10.174.115.15) by
	BN6PR1201MB0066.namprd12.prod.outlook.com (10.174.114.16) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.675.10; Sat, 14 Apr 2018 14:56:46 +0000
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::31bb:ae63:3595:7ba8]) by
	BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::31bb:ae63:3595:7ba8%4]) with mapi id 15.20.0675.014;
	Sat, 14 Apr 2018 14:56:46 +0000
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: Custom progress handlers
Thread-Index: AdPUAA6EkL125dkUStaOUcFUgz5/fQ==
Date: Sat, 14 Apr 2018 14:56:46 +0000
Message-ID: <BN6PR1201MB01959BEFC4A5E0745C4211E38BB20@BN6PR1201MB0195.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [2601:42:c300:8513:aced:c8e5:fe20:5754]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR1201MB0066;
	7:ezzCVWQI1x7yDyUMelmyS5O1d/8bb96VZcnPsswAkQmSVzTClR2cgEOyTVN42X/liWAkuSxLl59E9jc+UZHpCGTBN5TBJj2B321BKfc6Ocom9eL5zIvRPPqjFoloc8WFAaz0XkN7RHTo9vhHXuE5tvYbgdNkBnhRpBAjRwx/V62b5OpJUqPZJctyaO9oMI0XIw1yG4sLpSIQc6FyaNBpXcAZMfHLhsPbOFAoPuGCABArWbQL9NEkrp33fae+Fguu
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR1201MB0066; 
x-ms-traffictypediagnostic: BN6PR1201MB0066:
x-microsoft-antispam-prvs: <BN6PR1201MB0066ACA4639D2E9E4498B4028BB20@BN6PR1201MB0066.namprd12.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231232)(11241501184)(944501327)(52105095)(6041310)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:BN6PR1201MB0066; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR1201MB0066; 
x-forefront-prvs: 0642A5E7BA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(39380400002)(396003)(39860400002)(376002)(29502001)(53754006)(199004)(189003)(105586002)(97736004)(478600001)(2351001)(486006)(102836004)(7116003)(6116002)(86362001)(186003)(790700001)(6506007)(68736007)(46003)(25786009)(7736002)(2906002)(7696005)(99286004)(316002)(81156014)(33656002)(14454004)(6436002)(6916009)(476003)(3660700001)(5640700003)(2900100001)(3480700004)(9686003)(5250100002)(8936002)(54896002)(74316002)(55016002)(3280700002)(8676002)(81166006)(2501003)(5660300001)(53936002)(106356001)(6306002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0066;
	H:BN6PR1201MB0195.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: F2miqycwhC/MoGBW5V4R/HEQyWcfe/ytCTx5KBsM5iFs1J74K3NRXPT3lH2xv5jAHmlKnAB6mKtK2VIKKD/fyvqKFlZJbeDftozpMqLltZyi4ZH6pFzgHYa5bY09GCnU3TFeK3GyFgjxtH9Cj4B+LoMuOEXiZFdxQFf5YNWuUfpXpraasF0ILAGtqep+8lLbWi+fv9XUS1Mpf65ToTFYmQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 19e925d0-adff-4f90-f055-08d5a217f171
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e925d0-adff-4f90-f055-08d5a217f171
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2018 14:56:46.0476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0066
Subject: Custom progress handlers
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
X-List-Received-Date: Sat, 14 Apr 2018 16:28:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR1201MB01959BEFC4A5E0745C4211E38BB20BN6PR1201MB0195_"

--_000_BN6PR1201MB01959BEFC4A5E0745C4211E38BB20BN6PR1201MB0195_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I have implemented a simple custom progress handler in bitbake/lib/bb/progr=
ess.py. It's designed to handle bar-style progress. To use it for my shell =
tasks, I have modified "exec_func_shell" in bitbake/lib/bb/build.py. It's i=
mplemented as a new value for the "progress" varflag.

Is there a better, more extensible way to add a custom progress handler tha=
t doesn't require modifying progress.py and build.py? It would be nice to b=
e able to specify the name of the progress handler class to use (e.g. via a=
 [progress-class] varflag) and then have build.py dynamically instantiate i=
t. Is that possible? If so, would OE be interested in a patch to implement =
it?

Thanks,
Chris

--_000_BN6PR1201MB01959BEFC4A5E0745C4211E38BB20BN6PR1201MB0195_
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
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have implemented a simple custom progress handler =
in bitbake/lib/bb/progress.py. It&#8217;s designed to handle bar-style prog=
ress. To use it for my shell tasks, I have modified &#8220;exec_func_shell&=
#8221; in bitbake/lib/bb/build.py. It&#8217;s implemented
 as a new value for the &#8220;progress&#8221; varflag. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there a better, more extensible way to add a cust=
om progress handler that doesn&#8217;t require modifying progress.py and bu=
ild.py? It would be nice to be able to specify the name of the progress han=
dler class to use (e.g. via a [progress-class]
 varflag) and then have build.py dynamically instantiate it. Is that possib=
le? If so, would OE be interested in a patch to implement it?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris <o:p></o:p></p>
</div>
</body>
</html>

--_000_BN6PR1201MB01959BEFC4A5E0745C4211E38BB20BN6PR1201MB0195_--
