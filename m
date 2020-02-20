Return-Path: <sangeeta.jain@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Feb 2020 07:53:11 UTC
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 81A56606BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:53:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2020 23:46:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,463,1574150400"; 
	d="scan'208,217";a="315655077"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
	by orsmga001.jf.intel.com with ESMTP; 19 Feb 2020 23:46:05 -0800
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
	fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 19 Feb 2020 23:46:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
	by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 19 Feb 2020 23:46:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=FyE5Qe8+6xHfObmXi3dWgAbHfCIe23pEHmFAP0jw6vy9hDEIc3nuInA5BLUAFkhC1ySD30g3exnlU4cMEe6alYBLUi+twyJqVUMj+/YrviUU0z+prL8idnl1MxJcNLotwcE+QncVFUpKHGCIlQUs4ja9c2ApIf5eB+zWvBgPQYIog8CvcWAyPkcF9ln59Z1ZtWt4jPK97FwN1oLnZ5MEW7/B5xJomuZCpqmDnhpR1z6gNDzNom+9CHECLDcg1ae3LpoKOfdWcXDV5+U/iVpn5fsGAJf+zEdXKUdgg1stZQl2hdEnZ0TeZsz1BAL+ztMh0pCGPIRYzGPN0LUl3Yd6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=d/TXzNryIhJx8EvNuvl3l+TFkky3alIhKx82O1P+Cr0=;
	b=R90G4kM9AmA2Z7dsrw3UhJOro55KoIBW0sB50XFTSNH5nCy7SIbXS5qUGQclSe+BKs+BOtqUT2Boi28IE0udinjD7MvpRoTS8dTPg8fYYLcWBYHpvUw+8SwMTTSPQ6WQMGWGAQRLzwodAD9mlb/w6INO6vF2yE242NWxmwTEGSbFRG08OxTcK7cejYQQi1JKX4Qv0B0w7wgvBVt8SaYsTFT1Ycr8J1ZnAdOKhuQbVw6UDzJ32IelX5Gz0nqGPJ+dHeub4FSeZSQkYUKNgi/LtjOP3Jo2LjoXabAIhJblIvcaemoUQoyDVwHPwZpFnln+4aLDyozob5tMBUgQh+33Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com; 
	dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector2-intel-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=d/TXzNryIhJx8EvNuvl3l+TFkky3alIhKx82O1P+Cr0=;
	b=zFhSbLwULjHaSdHNQvvZHDHl3g9dJuVPZXzDdbnyXK6/4f8+DcJO9fR81Vyv/2i4aJO+vZWBlq16Ra78zLt6kKyO0EezdI+nfT/k8FGyd9nyiyoMZQoBLegFVOcK2p8lF0cEBXRR/lW0EF0SiCZA4GcKo0d4aetVFHZEwgaEcIU=
Received: from CY4PR11MB1879.namprd11.prod.outlook.com (10.175.60.137) by
	CY4PR11MB0039.namprd11.prod.outlook.com (10.171.253.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.31; Thu, 20 Feb 2020 07:46:02 +0000
Received: from CY4PR11MB1879.namprd11.prod.outlook.com
	([fe80::69a4:ad54:33d6:41b]) by CY4PR11MB1879.namprd11.prod.outlook.com
	([fe80::69a4:ad54:33d6:41b%9]) with mapi id 15.20.2729.033;
	Thu, 20 Feb 2020 07:46:00 +0000
From: "Jain, Sangeeta" <sangeeta.jain@intel.com>
To: "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Yocto Project Status WW07'20
Thread-Index: AdXmdcUD2UQ7LOb7QeyyPqIozFyarABS7BRw
Date: Thu, 20 Feb 2020 07:46:00 +0000
Message-ID: <CY4PR11MB18792EA8DAE6F08AD3CED448E3130@CY4PR11MB1879.namprd11.prod.outlook.com>
References: <0b8a01d5e675$d2363e30$76a2ba90$@gmail.com>
In-Reply-To: <0b8a01d5e675$d2363e30$76a2ba90$@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2U4MzFmNGYtYmFiNS00MjRkLTkxODQtOWE3NmZiYmE3ZmYxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTTdMRHRCUWdKc1dlTTVWd2RaMUYzVkRiZEVzMUpmNW11WXMxc3ZVVml6bmpmcXZ0blwvbnl3UG4zZGhEZzRXVlcifQ==
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=sangeeta.jain@intel.com; 
x-originating-ip: [192.198.147.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2aa7b3ee-4ecc-4a2b-88ff-08d7b5d8ee12
x-ms-traffictypediagnostic: CY4PR11MB0039:
x-microsoft-antispam-prvs: <CY4PR11MB00397A486DA437E67D225244E3130@CY4PR11MB0039.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(366004)(136003)(396003)(346002)(189003)(199004)(478600001)(86362001)(966005)(52536014)(71200400001)(66556008)(64756008)(66946007)(6506007)(66446008)(53546011)(5660300002)(66476007)(2906002)(81156014)(21615005)(9686003)(76116006)(316002)(81166006)(8676002)(33656002)(8936002)(7696005)(110136005)(186003)(55016002)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB0039;
	H:CY4PR11MB1879.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6zfMSyyggaV0kTHwvWlXp9Tr9fNg9kTLHNGjo1Ar3Nh4lYuFKcdveTyI1JoRnp3VHnuo4kVq8RQfozpzUoh5aoabCNHV8C+4KTTRTfKWH5I1L0ngSubaSkkBBbdfxqEowsSZi3ENBA4yOaVVNRqhkfKkN4naR4CDS4vU+zjgsDYnLpeBI4OfuJE12SpS5yNyVuXVXSkA0ltTvEFqz+RiET4/dnRjNNaQxFZg1KLezz44zb0omPpq8BFpcBBUawQQwGK1WakJdrIqvdw6q6DpFMNIO0KPO0MFrKFzuwPNeeMgUXEHOqsHvz14jLj/H5YcFZop0bLPr416N4zsJ6/yCgNIVnkxVIg9aPnxeXlVs71qFR3zAdEb5SUmYLxTcn52bVdzYOneka5nhi02i3TxuLC2uq8Nm/TCwj+nb0wgss690nwkPV6p8fIEyfvPtGST/1Ovrezv8k0+6POEFK1nyz4GXJF2k0MTpVuLId7xwwC+c3qBuosVksYPnoNHMpy2YyKN/9L3WQhiPFO/oBqg8Q==
x-ms-exchange-antispam-messagedata: FDE5ORA12HZ6n13ILYJGFJMn0lg9zbhACgqNxOGEAZI4FvyMWGk7OaJpBQ40OemETUv8xdZQfNelaGBY9gtuFDBGcvHWB4PWidqFJi1C9DD4BbIhWbzt4/KkCsb0vAjHV3XNMrbAWTKTpxmoFb99tw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa7b3ee-4ecc-4a2b-88ff-08d7b5d8ee12
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 07:46:00.7240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hw1c8IMry4mVkfwLAVpPHdwNEHsalSGqX35gSLvwL5DzIf40c0pSCw8J5T/09YAQ3dZikOQ0sWA8l52srC1ivA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0039
X-OriginatorOrg: intel.com
Subject: Re: Yocto Project Status WW07'20
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
X-List-Received-Date: Thu, 20 Feb 2020 07:53:11 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB18792EA8DAE6F08AD3CED448E3130CY4PR11MB1879namp_"

--_000_CY4PR11MB18792EA8DAE6F08AD3CED448E3130CY4PR11MB1879namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Planned upcoming dot releases:

  *   YP 2.7.3 built and in QA

I didn't see any notification for this build. Am I missing something?

Thanks,
Sangeeta

From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> On Behalf Of sjolley.yp.pm@gmail.com
Sent: Wednesday, 19 February, 2020 12:10 AM
To: yocto@yoctoproject.org; openembedded-core@lists.openembedded.org
Subject: [OE-core] Yocto Project Status WW07'20


Current Dev Position: YP 3.1 M3

Next Deadline: YP 3.1 M3 build date 2/24/2020


Next Team Meetings:

  *   Bug Triage meeting Thursday Feb. 20th  at 7:30am PDT (https://zoom.us=
/j/454367603)
  *   Monthly Project Meeting Tuesday Mar. 3rd  at 8am PDT (https://zoom.us=
/j/990892712)<https://zoom.us/j/990892712>
  *   Weekly Engineering Sync Tuesday Feb. 18th at 8am PDT (https://zoom.us=
/j/990892712)<https://zoom.us/j/990892712>
  *   Twitch - Next event is Tuesday Mar. 10th at 8am PDT (https://www.twit=
ch.tv/yocto_project)


Key Status/Updates:

  *   The project recently updated its git hosting infrastructure and there=
 were some issues encountered with the cgit http/https repository sharing. =
Those issues should now be resolved, apologies if they caused issues for an=
yone. The git:// protocol sharing was unaffected.
  *   YP 3.0.2 rc2 is in QA with the report due soon.
  *   We continue to see a small number of reproducibility issues with mast=
er which need resolving for green builds (in particular gstreamer and perl)=
.
  *   A significant memory usage issue was identified during bitbake parsin=
g where memory usage would grow in each parser thread linearly per number o=
f recipes parsed. This would therefore particularly affect large numbers of=
 layers, multilibs and multiconfig. The fix has merged into bitbake along w=
ith the corresponding zeus and warrior branches. For one test case it reduc=
ed peak memory usage during parsing for 5 multiconfigs from 20GB to 2GB.
  *   Warrior patches for 2.7.3 are out for review.
  *   With the git infrastructure issue updated, we now have centos8 worker=
s added to the autobuilder.
  *   We are making various queued changes to the autobuilder configuration=
 to fix bugs, improve efficiency and test coverage but this may result in s=
ome test result instability as we test and resolve issues.
  *   We're collecting a list of companies, products and projects which use=
 the Yocto Project on the wiki: https://wiki.yoctoproject.org/wiki/Project_=
Users Please add any you know are missing (or email Richard/Stephen who can=
 add).
  *   The triage team is worried about attendance at triage meetings and th=
e project is finding it hard to find people to help fix bugs. If anyone is =
willing to work on bugs, assistance would be greatly appreciated.


YP 3.1 Milestone Dates:

  *   YP 3.1 M3 build date 2/24/2020
  *   YP 3.1 M3 release date 3/6/2020
  *   YP 3.1 M4 build date  3/30/2020
  *   YP 3.1 M4 release date  4/24/2020


Planned upcoming dot releases:

  *   YP 2.7.3 built and in QA
  *   YP 2.7.3 release date 2/21/2020
  *   YP 3.0.2 build date  2/3/2020
  *   YP 3.0.2 release date 2/14/2020


Tracking Metrics:

  *   WDD 2710 (last week 2728) (https://wiki.yoctoproject.org/charts/combo=
.html)
  *   Poky Patch Metrics

     *   Total patches found: 1360 (last week 1361)
     *   Patches in the Pending State: 546 (40%) [last week 547 (40%)]


The Yocto Project's technical governance is through its Technical Steering =
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC


The Status reports are now stored on the wiki at: https://wiki.yoctoproject=
.org/wiki/Weekly_Status


[If anyone has suggestions for other information you'd like to see on this =
weekly status update, let us know!]

Thanks,

Stephen K. Jolley
Yocto Project Program Manager
*    Cell:                (208) 244-4460
* Email:              sjolley.yp.pm@gmail.com<mailto:sjolley.yp.pm@gmail.co=
m>


--_000_CY4PR11MB18792EA8DAE6F08AD3CED448E3130CY4PR11MB1879namp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:278224696;
	mso-list-template-ids:1096997340;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:540675062;
	mso-list-template-ids:667983700;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2
	{mso-list-id:641545171;
	mso-list-template-ids:-910756348;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3
	{mso-list-id:916986907;
	mso-list-template-ids:-774855812;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4
	{mso-list-id:1612783981;
	mso-list-template-ids:779533080;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l4:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-MY" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">Planned upcoming dot=
 releases:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level1 lfo4;vertic=
al-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
2.7.3 built and in QA<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">I didn&#8=
217;t see any notification for this build. Am I missing something?<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Thanks,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Sangeeta<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b><span lang=3D=
"EN-US">From:</span></b><span lang=3D"EN-US"> openembedded-core-bounces@lis=
ts.openembedded.org &lt;openembedded-core-bounces@lists.openembedded.org&gt=
;
<b>On Behalf Of </b>sjolley.yp.pm@gmail.com<br>
<b>Sent:</b> Wednesday, 19 February, 2020 12:10 AM<br>
<b>To:</b> yocto@yoctoproject.org; openembedded-core@lists.openembedded.org=
<br>
<b>Subject:</b> [OE-core] Yocto Project Status WW07'20<o:p></o:p></span></p=
>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">Current Dev Position=
: YP 3.1 M3</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">Next Deadline: YP 3.=
1 M3 build date 2/24/2020</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">Next Team Meetings:<=
/span><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l3 level1 lfo1;vertic=
al-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">Bug=
 Triage meeting Thursday Feb. 20th&nbsp; at 7:30am PDT (<a href=3D"https://=
zoom.us/j/454367603"><span style=3D"font-size:10.0pt;color:#1155CC">https:/=
/zoom.us/j/454367603</span></a>)<o:p></o:p></span></li><li class=3D"MsoNorm=
al" style=3D"color:black;mso-list:l3 level1 lfo1;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">Mon=
thly Project Meeting Tuesday Mar. 3rd&nbsp; at 8am PDT (<a href=3D"https://=
zoom.us/j/990892712"><span style=3D"color:#1155CC">https://zoom.us/j/990892=
712)</span></a><o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"colo=
r:black;mso-list:l3 level1 lfo1;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">Wee=
kly Engineering Sync Tuesday Feb. 18th at 8am PDT (<a href=3D"https://zoom.=
us/j/990892712"><span style=3D"color:#1155CC">https://zoom.us/j/990892712)<=
/span></a><o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:bla=
ck;mso-list:l3 level1 lfo1;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">Twi=
tch - Next event is Tuesday Mar. 10th at 8am PDT (<a href=3D"https://www.tw=
itch.tv/yocto_project"><span style=3D"color:#1155CC">https://www.twitch.tv/=
yocto_project</span></a>)<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">Key Status/Updates:<=
/span><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l1 level1 lfo2;vertic=
al-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">The=
 project recently updated its git hosting infrastructure and there were som=
e issues encountered with the cgit http/https repository sharing. Those iss=
ues should now be resolved, apologies if they
 caused issues for anyone. The git:// protocol sharing was unaffected.<o:p>=
</o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l1 =
level1 lfo2;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
3.0.2 rc2 is in QA with the report due soon.<o:p></o:p></span></li><li clas=
s=3D"MsoNormal" style=3D"color:black;mso-list:l1 level1 lfo2;vertical-align=
:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">We =
continue to see a small number of reproducibility issues with master which =
need resolving for green builds (in particular gstreamer and perl).<o:p></o=
:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l1 lev=
el1 lfo2;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">A s=
ignificant memory usage issue was identified during bitbake parsing where m=
emory usage would grow in each parser thread linearly per number of recipes=
 parsed. This would therefore particularly affect
 large numbers of layers, multilibs and multiconfig. The fix has merged int=
o bitbake along with the corresponding zeus and warrior branches. For one t=
est case it reduced peak memory usage during parsing for 5 multiconfigs fro=
m 20GB to 2GB.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color=
:black;mso-list:l1 level1 lfo2;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">War=
rior patches for 2.7.3 are out for review.<o:p></o:p></span></li><li class=
=3D"MsoNormal" style=3D"color:black;mso-list:l1 level1 lfo2;vertical-align:=
baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">Wit=
h the git infrastructure issue updated, we now have centos8 workers added t=
o the autobuilder.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"c=
olor:black;mso-list:l1 level1 lfo2;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">We =
are making various queued changes to the autobuilder configuration to fix b=
ugs, improve efficiency and test coverage but this may result in some test =
result instability as we test and resolve issues.<o:p></o:p></span></li><li=
 class=3D"MsoNormal" style=3D"color:black;mso-list:l1 level1 lfo2;vertical-=
align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">We&=
#8217;re collecting a list of companies, products and projects which use th=
e Yocto Project on the wiki:
<a href=3D"https://wiki.yoctoproject.org/wiki/Project_Users"><span style=3D=
"color:#1155CC">https://wiki.yoctoproject.org/wiki/Project_Users</span></a>=
 Please add any you know are missing (or email Richard/Stephen who can add)=
.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-li=
st:l1 level1 lfo2;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">The=
 triage team is worried about attendance at triage meetings and the project=
 is finding it hard to find people to help fix bugs. If anyone is willing t=
o work on bugs, assistance would be greatly appreciated.<o:p></o:p></span><=
/li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">YP 3.1 Milestone Dat=
es:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l4 level1 lfo3;vertic=
al-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
3.1 M3 build date 2/24/2020<o:p></o:p></span></li><li class=3D"MsoNormal" s=
tyle=3D"color:black;mso-list:l4 level1 lfo3;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
3.1 M3 release date 3/6/2020<o:p></o:p></span></li><li class=3D"MsoNormal" =
style=3D"color:black;mso-list:l4 level1 lfo3;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
3.1 M4 build date&nbsp; 3/30/2020<o:p></o:p></span></li><li class=3D"MsoNor=
mal" style=3D"color:black;mso-list:l4 level1 lfo3;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
3.1 M4 release date&nbsp; 4/24/2020<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">Planned upcoming dot=
 releases:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level1 lfo4;vertic=
al-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
2.7.3 built and in QA<o:p></o:p></span></li><li class=3D"MsoNormal" style=
=3D"color:black;mso-list:l0 level1 lfo4;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
2.7.3 release date 2/21/2020<o:p></o:p></span></li><li class=3D"MsoNormal" =
style=3D"color:black;mso-list:l0 level1 lfo4;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
3.0.2 build date&nbsp; 2/3/2020<o:p></o:p></span></li><li class=3D"MsoNorma=
l" style=3D"color:black;mso-list:l0 level1 lfo4;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">YP =
3.0.2 release date 2/14/2020<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking Metrics:</s=
pan><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l2 level1 lfo5;vertic=
al-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">WDD=
 2710 (last week 2728)</span><span lang=3D"EN-US" style=3D"font-family:Cons=
olas"> (</span><span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,=
sans-serif"><a href=3D"https://wiki.yoctoproject.org/charts/combo.html"><sp=
an style=3D"color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html<=
/span></a></span><span lang=3D"EN-US" style=3D"font-family:Consolas">)</spa=
n><span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif"><=
o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list=
:l2 level1 lfo5;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">Pok=
y Patch Metrics&nbsp;&nbsp;</span><span lang=3D"EN-US" style=3D"font-family=
:Consolas"><o:p></o:p></span></li></ul>
<ul style=3D"margin-top:0cm" type=3D"disc">
<ul style=3D"margin-top:0cm" type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l2 level2 lfo5;vertic=
al-align:baseline">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">Tot=
al patches found: 1360 (last week 1361)<o:p></o:p></span></li><li class=3D"=
MsoNormal" style=3D"color:black;mso-list:l2 level2 lfo5;vertical-align:base=
line">
<span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">Pat=
ches in the Pending State: 546 (40%) [last week 547 (40%)]</span><span lang=
=3D"EN-US" style=3D"font-family:Consolas"><o:p></o:p></span></li></ul>
</ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">The Yocto Project&#8=
217;s technical governance is through its Technical Steering Committee, mor=
e information is available at:</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US"><a href=
=3D"https://wiki.yoctoproject.org/wiki/TSC"><span style=3D"font-family:&quo=
t;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/wiki/=
TSC</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">The Status reports a=
re now stored on the wiki at:
</span><span lang=3D"EN-US"><a href=3D"https://wiki.yoctoproject.org/wiki/W=
eekly_Status"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color=
:#1155CC">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-family:&quot;Arial&quot;,sans-serif;color:black">[If anyone has sugge=
stions for other information you&#8217;d like to see on this weekly status =
update, let us know!]</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><i><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-family:&quot;Tim=
es New Roman&quot;,serif;color:purple">Stephen K. Jolley</span></i></b><b><=
i><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-family:&quot;Tahoma&q=
uot;,sans-serif;color:purple"><o:p></o:p></span></i></b></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:8.0pt;fon=
t-family:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager<=
o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:Wingdings;color:black">(</span><span lang=3D"EN-US" style=3D"font-siz=
e:9.0pt;font-family:&quot;MS Sans Serif&quot;;color:teal">&nbsp;&nbsp;&nbsp=
;
</span><b><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-family:&quot;C=
omic Sans MS&quot;;color:teal">Cell</span></b><span lang=3D"EN-US" style=3D=
"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;;color:teal">:&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:&quot;MS S=
ans Serif&quot;">(208) 244-4460<span style=3D"color:black"><o:p></o:p></spa=
n></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:Wingdings">*
</span><b><span lang=3D"FR" style=3D"font-size:8.0pt;font-family:&quot;Comi=
c Sans MS&quot;;color:teal">Email</span></b><span lang=3D"FR" style=3D"font=
-size:9.0pt;font-family:&quot;MS Sans Serif&quot;;color:teal">:</span><span=
 lang=3D"FR" style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;<u><span style=3D"color:blue"><a href=3D"mailto:sjolley.yp.pm@gm=
ail.com">sjolley.yp.pm@gmail.com</a></span></u></span><span lang=3D"FR" sty=
le=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_CY4PR11MB18792EA8DAE6F08AD3CED448E3130CY4PR11MB1879namp_--
