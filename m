Return-Path: <t-keweng@microsoft.com>
X-Greylist: delayed 35960 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Jul 2019 14:32:07 UTC
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690106.outbound.protection.outlook.com [40.107.69.106])
	by mail.openembedded.org (Postfix) with ESMTP id 360857EF10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:32:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ml/WPrQ0IA0haGvfx1W0FwkHwZ+kCiKsIMkufYp3qNEbpH3pCj5JscuCKuzbC6PvbFWGaBNp1AvsFvCHz3smW9firvk96QbI7ZFlN7gmFI5+EWK9bUUaCbdEdQaUB58tBQ9j+1gjqlgZcX+c62/zPCE4ycSysNPAROOfshkkMt+yu/nIg0morLJi8I+8G783VMXzEWOuhDlwAmCutoGFL6uBOYlY9522egwSDdrdCUA50xceVatILKWQoMi3EYcfMdE672O9GpTSelkQf8hRzgu6ogob4jx548rCXb6dk3AsKez7bGX1YxUxHkPFwWvz/yGUZ1p+WFSGIdjsPE6xZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3wDIN1MykDqCWJ2oGUWbHpW3AQ/n0T1w2mLf4NOJlbA=;
	b=lRN10zuGCzcuGnWkjIVKCL7Qhjr+XeaMLScXT2zkt7Lo7ONo1rTzoH1zMbiI5wWrsJ/z56HwygIBbueWK4f4PiY111tDZCMO8ygUZfS+RZ0C55CVomolE9ltwt+cK2dy56Ij5Ijxi1UUMKEaloM+XE0tJTAO/ynd4eaHcq9wBneoxsokx3aON0KObj3VQat2TJRG3Aa0Fynd3J0flYMZeJs4bjD4D2h1iKFl3qx6n/LlFVzC2tNC1NUJTfLn4TiYkrLXcadepxndQMwwMPgYLM34UUWgkpnxsRgtVIEDT8DgKp+xPk1kTdvnX7/o/4Tzp3+EVlu1NwOA1i+MPCHCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=microsoft.com;dmarc=pass action=none
	header.from=microsoft.com;dkim=pass header.d=microsoft.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3wDIN1MykDqCWJ2oGUWbHpW3AQ/n0T1w2mLf4NOJlbA=;
	b=eCKhy36FF9g+1PqzOF0WOS0erbu9QL9kmYpODNqDYs2EzegaKE2kxf3ct7mZET6LnV0BDNoQrVNcMAn6lPjMlbsjLeZqpaP4EnsDgRvSLXR2WxoSQqu8IYze52qwDAdqz8N9qJ5FlF3C2Nz7JMwVh8VRynun1lNHJUa+WnsZWS8=
Received: from DM5PR2101MB0967.namprd21.prod.outlook.com (52.132.133.25) by
	DM5PR2101MB1095.namprd21.prod.outlook.com (52.132.130.17) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2094.3; Tue, 9 Jul 2019 23:58:59 +0000
Received: from DM5PR2101MB0967.namprd21.prod.outlook.com
	([fe80::487c:7f1d:91ef:1487]) by
	DM5PR2101MB0967.namprd21.prod.outlook.com
	([fe80::487c:7f1d:91ef:1487%7]) with mapi id 15.20.2094.001;
	Tue, 9 Jul 2019 23:58:59 +0000
From: Kevin Weng <t-keweng@microsoft.com>
To: "lemagoup@gmail.com" <lemagoup@gmail.com>
Thread-Topic: Re: [OE-core] [PATCH 1/4] cve-update-db: New recipe to update
	CVE database
Thread-Index: AdU2seUntUvelcmwTXOgASUMIo9fzg==
Date: Tue, 9 Jul 2019 23:58:59 +0000
Message-ID: <DM5PR2101MB09676734C5E89ADA88372B358DF10@DM5PR2101MB0967.namprd21.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=t-keweng@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-07-09T23:58:57.7183864Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=6957ed85-4eef-4f0d-8452-950e4248a7ba;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=t-keweng@microsoft.com; 
x-originating-ip: [2001:4898:80e8:a:50ea:9b4d:b902:a460]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 182d54a9-4208-4d34-f461-08d704c96932
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:DM5PR2101MB1095; 
X-MS-TrafficTypeDiagnostic: DM5PR2101MB1095:|DM5PR2101MB1095:|DM5PR2101MB1095:|DM5PR2101MB1095:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR2101MB1095445A3584C17B958CBB9F8DF10@DM5PR2101MB1095.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(199004)(189003)(8676002)(256004)(52536014)(2906002)(4744005)(1411001)(25786009)(86362001)(9326002)(7736002)(1730700003)(5660300002)(14454004)(476003)(81156014)(6916009)(2501003)(81166006)(6506007)(2351001)(53936002)(99286004)(74316002)(71190400001)(8936002)(55016002)(1361003)(71200400001)(229853002)(6246003)(7696005)(66446008)(54896002)(10090500001)(316002)(22452003)(66946007)(8990500004)(6436002)(486006)(46003)(6116002)(6306002)(4326008)(10290500003)(76116006)(64756008)(66556008)(66476007)(790700001)(68736007)(9686003)(186003)(5640700003)(102836004)(33656002)(478600001)(130980200001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR2101MB1095;
	H:DM5PR2101MB0967.namprd21.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rKgG3fpif94or81mwo9gSjUmWMNv+epU5wlF7XN3cyu2jjlXm9NEuO2cA2STHFh2zaPvdAZie9ieIQqGL5QR9icuTDaxvKVVs0XUB/x4+uG34lrADc7IgXiTUjyqF6jtiWl54+rBH9hwOFpm01Sg5W45oojM62LJzYRaezk6GgjN8w24Axz2+OnPjfNIspTP3JU/WTyaU92vgyZAjvxa4QAMUvuPdguJrK56by2QtwoVg1bSIkBdDasq4ejgs3DEiXXFc+xOmmLcwKxbjguDsi05fp8RiTk0dtqToOQ8UR57P893Sl0sgBfrXBCfjCfs3taqhnh2w5TdyNJWbNXCQwLhLl+GoHxvVy7WZYXoCeEJEperlg8rD1InD89d0rLIMZ0C2KLaRmMCb3GP7ZrQ1tOM0SI9fl6wHv9YrGrUgr8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 182d54a9-4208-4d34-f461-08d704c96932
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 23:58:59.4530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t-keweng@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR2101MB1095
X-OriginatorOrg: microsoft.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Wed, 10 Jul 2019 14:32:07 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR2101MB09676734C5E89ADA88372B358DF10DM5PR2101MB0967_"

--_000_DM5PR2101MB09676734C5E89ADA88372B358DF10DM5PR2101MB0967_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Pierre,

I found that the hash function is causing collisions in the generated datab=
ase such that some CVEs are being overwritten because of the UNIQUE constra=
int on the HASH column. For example, CVE-2018-1000873 has the same hash of =
623198722 as CVE-2018-18338. This results in one of the two CVEs not appear=
ing in the database.

--
Kevin Weng


--_000_DM5PR2101MB09676734C5E89ADA88372B358DF10DM5PR2101MB0967_
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
<p class=3D"MsoNormal">Hi Pierre,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I found that the hash function is causing collisions=
 in the generated database such that some CVEs are being overwritten becaus=
e of the UNIQUE constraint on the HASH column. For example, CVE-2018-100087=
3 has the same hash of 623198722 as
 CVE-2018-18338. This results in one of the two CVEs not appearing in the d=
atabase.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">--<o:p></o:p></p>
<p class=3D"MsoNormal">Kevin Weng<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM5PR2101MB09676734C5E89ADA88372B358DF10DM5PR2101MB0967_--
