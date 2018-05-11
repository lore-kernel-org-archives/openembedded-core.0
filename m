Return-Path: <chris.laplante@agilent.com>
X-Greylist: delayed 1950 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 May 2018 19:28:34 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0069.outbound.protection.outlook.com [104.47.33.69])
	by mail.openembedded.org (Postfix) with ESMTP id 18D227836E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=xNzn0biZxkKR8GVxeI/obc0bGwt8OtsPNgTLTsaHFTE=;
	b=Qfj5mbPAsLOX6fOtYVfE+Nbs5fTHl0+1Qe7nmv9GdeMEbzuvdqMny2zSKch2jWl+A/30cDjXpRm2NutwzgovNHe5lM8EU5J6hb0QD+G53eTfOuNeck9n3PcPFUdCdAazH5OzmvVeYlzYYvNRT/1TlBKm7FsFJMTc8Ak6Uo7i5zc=
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com (10.174.115.15) by
	BN6PR1201MB0066.namprd12.prod.outlook.com (10.174.114.16) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.755.16; Fri, 11 May 2018 19:28:34 +0000
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::3909:7346:7f5c:68a0]) by
	BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::3909:7346:7f5c:68a0%4]) with mapi id 15.20.0755.012;
	Fri, 11 May 2018 19:28:33 +0000
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: do_kernel_configme and defconfig
Thread-Index: AdPpWGk/TpeRD7IPTl22gQujYHEcvQABXGZA
Date: Fri, 11 May 2018 19:28:33 +0000
Message-ID: <BN6PR1201MB0195C7EC9D46A3F02DA9DCC38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
References: <BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [104.129.194.175]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR1201MB0066;
	7:iBibeul8GRrETL+uyKCi3vPM9ekL3Br7IWG+b2ljYjoWIbDn9Vr9RHvmIvCRffv3oDmf/qttA/cIGd+zQTselnZPF7pYQ+C0tnx9uP/eL9WpX4/SQHey97R8CNP9WMZlwwATDQhSf/No7gWYFwZZrTeD/QYkHv+7g7LS0vOsj/ehgKUJBUR2tptOY1Bg8xVAk2CPc84AnM3teJA/11VrfwugtANzb9yOvDgbsdRhXd5zoDziDCO8Sfy4YSbMIUC+
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(39380400002)(39860400002)(346002)(396003)(366004)(376002)(189003)(53754006)(199004)(29502001)(2940100002)(105586002)(186003)(106356001)(14454004)(2900100001)(25786009)(4326008)(53936002)(2501003)(81166006)(81156014)(7736002)(476003)(102836004)(8936002)(8676002)(5640700003)(86362001)(486006)(5250100002)(7116003)(11346002)(26005)(5660300001)(74316002)(446003)(59450400001)(53546011)(97736004)(76176011)(68736007)(99286004)(55236004)(6506007)(66066001)(7696005)(2906002)(3280700002)(33656002)(478600001)(2351001)(790700001)(6116002)(6916009)(3846002)(54896002)(107886003)(6306002)(6246003)(316002)(229853002)(3660700001)(9686003)(6436002)(55016002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0066;
	H:BN6PR1201MB0195.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR1201MB0066; 
x-ms-traffictypediagnostic: BN6PR1201MB0066:
x-microsoft-antispam-prvs: <BN6PR1201MB0066C112B52726D6005C2D408B9F0@BN6PR1201MB0066.namprd12.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(264703809997249)(21748063052155); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(11241501184)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:BN6PR1201MB0066; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR1201MB0066; 
x-forefront-prvs: 06691A4183
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 9z91OaxgMACxLVdTGIr1eMXO0tn6a0YSsiJt22B8VizW72NmaqbUaEgTy3+9mFdNNPsE+Ugc+vds1WnWSGYj36DajOjqVBrxWqRErovSxOUnDLL/SwxmI/vh/X+t55qRfMTzktSMQCvLDxJyDg6d2YJ0OgdFPVOZYlb9GecZ2nmIgN4dOGELAU2DIjf+fv3zzKTcxG92XPCZ5FA2GcHkBA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c80eb872-f0e8-4e8a-58a9-08d5b77562bd
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80eb872-f0e8-4e8a-58a9-08d5b77562bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2018 19:28:33.6863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0066
Cc: jared.smith@agilent.com
Subject: Re: do_kernel_configme and defconfig
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
X-List-Received-Date: Fri, 11 May 2018 19:28:35 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR1201MB0195C7EC9D46A3F02DA9DCC38B9F0BN6PR1201MB0195_"

--_000_BN6PR1201MB0195C7EC9D46A3F02DA9DCC38B9F0BN6PR1201MB0195_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK, I figured out why this happens. This line in kernel-yocto.bbclass:

scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} ${bsp_definition=
} ${sccs} ${patches} ${KERNEL_FEATURES}

... passes the BSP def before the sccs. In my case, the BSP def is mymachin=
e.scc, and the sccs is the defconfig. So that's why the defconfig comes aft=
er the BSP.

My takeaway is that a BSP plus a defconfig is not a supported use case. Is =
that correct?

If so, I think it's important to add some sanity checking to kernel-yocto.b=
bclass.

Thanks,
Chris

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Chris Laplante via Opene=
mbedded-core
Sent: Friday, May 11, 2018 2:51 PM
To: openembedded-core@lists.openembedded.org
Cc: SMITH,JARED (A-Little Falls,ex1) <jared.smith@agilent.com>
Subject: [OE-core] do_kernel_configme and defconfig

Hi all,

Is it expected for do_kernel_configme to apply the defconfig last (after co=
nfiguration fragments introduced by sccs)?

For some reason, in the call to merge_config, ".kernel-meta/configs//./defc=
onfig" is passed last whereas I'd expect it would be first (since that shou=
ld be the base config). This is causing problems, because config options th=
at my config fragments are setting are getting overridden by the defconfig =
- it should be the other way around.

For reference, I'm using Rocko and have just updated to the latest commit. =
We have an in-tree defconfig, and we set KBUILD_DEFCONFIG_machinename appro=
priately. We are using the separate kernel-meta repository to store kernel =
metadata. I have KMACHINE_machinename set up so that it finds the correct B=
SP definition .scc file. Still seem to be missing something, though.

Thanks,
Chris

--_000_BN6PR1201MB0195C7EC9D46A3F02DA9DCC38B9F0BN6PR1201MB0195_
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">OK, I figured out why this happens. This line in ker=
nel-yocto.bbclass:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">scc --force -o ${S}/${met=
a_dir}:cfg,merge,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KE=
RNEL_FEATURES}<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&#8230; passes the BSP def before the sccs. In my ca=
se, the BSP def is mymachine.scc, and the sccs is the defconfig. So that&#8=
217;s why the defconfig comes after the BSP.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My takeaway is that a BSP plus a defconfig is not a =
supported use case. Is that correct?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If so, I think it&#8217;s important to add some sani=
ty checking to kernel-yocto.bbclass.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openembedded-core-bounces@lists.openemb=
edded.org [mailto:openembedded-core-bounces@lists.openembedded.org]
<b>On Behalf Of </b>Chris Laplante via Openembedded-core<br>
<b>Sent:</b> Friday, May 11, 2018 2:51 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> SMITH,JARED (A-Little Falls,ex1) &lt;jared.smith@agilent.com&gt;=
<br>
<b>Subject:</b> [OE-core] do_kernel_configme and defconfig<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is it expected for do_kernel_configme to apply the d=
efconfig last (after configuration fragments introduced by sccs)?<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For some reason, in the call to merge_config, &#8220=
;.kernel-meta/configs//./defconfig&#8221; is passed last whereas I&#8217;d =
expect it would be first (since that should be the base config). This is ca=
using problems, because config options that my config
 fragments are setting are getting overridden by the defconfig &#8211; it s=
hould be the other way around.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For reference, I&#8217;m using Rocko and have just u=
pdated to the latest commit. We have an in-tree defconfig, and we set KBUIL=
D_DEFCONFIG_machinename appropriately. We are using the separate kernel-met=
a repository to store kernel metadata. I
 have KMACHINE_machinename set up so that it finds the correct BSP definiti=
on .scc file. Still seem to be missing something, though.<span style=3D"fon=
t-variant:small-caps"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN6PR1201MB0195C7EC9D46A3F02DA9DCC38B9F0BN6PR1201MB0195_--
