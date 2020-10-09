Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.45])
 by mx.groups.io with SMTP id smtpd.web11.1024.1602282940213025239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 15:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fCsLIg0l;
 spf=pass (domain: windriver.com, ip: 40.107.244.45, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHBNx7VCJoisvoJAGeaESkd4wVdbvmXHnq6CnWw9tMAtuyTQSVQn/DGHOB/mJiqFt0Hn4pkJaWSAdTRvC6ad2xtLv47WpNhLEpdxHEV2oO45C2NuVmZqy7gS6oj1/Y/Xjy0MOoGoaRIRUa/0bGrsQKwe6rNV6YaLpEPgqMmfP17+hu0VjXtuoQD4VzfSRpILCTKgkEDrrlb3WwHJIOLLC4pQASmfb2BSVL/A7PI78pu2/VOMqG/qh72BHZtRwz3nQumPUuG3vQ10vxWZMJNJ3nUOy73wFQIGh+2Khxxrm0QJWNy+bemYmWmfFTauOwS+6dbpEdUMxkmj9dK1rygNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSJxeB/aNWNvZzJLukFltQcMu5gdHPtOzBovkWclk0Y=;
 b=TmtcsT0td2wxrkwBoy5Agqi4UaHPVxgsvEbk6hXX+X/AItp3tSWWDDRDa4uAagEpw//yeiMvZJzRHPGpu5yaufBCNL5AmV4KNoRauOzoW6uidHtZy+wvNbU7ju1JcYvqHySPB35iLoPRL+hTdsbeo6rWIdqeykTYL2UKp2OB8pXy69+DLOUit9dpL9+3bqwZjDWCyRSH5iN306TjZPV7r+94Q/f0tLbP8mFG81J6So0o+6LI6Jt7+eN338seMjx2ey/iWRIFkasRxqGRctudVuFVy64P57wkifNAcs0jHJVli22rlQrCO2I4oerq+H4X3relbmrG6yi4u/yPyHRrxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSJxeB/aNWNvZzJLukFltQcMu5gdHPtOzBovkWclk0Y=;
 b=fCsLIg0lLtWRHmXPlL5wwl35Arl+v81d6lj8dFhXZ9OlIZHRXzb0hZLQz8YiAQJ4pWgYjBr0wJRANHz3WqDN78E7vIpxsfqKaR58j/f4SX/3Bgqmle1nVQBqQBUZsXolqrFwnQGwE77ntfpKUfTia1C55ttTpRRTkHa3inZlj6A=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB4291.namprd11.prod.outlook.com (2603:10b6:a03:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 9 Oct
 2020 22:35:37 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c%7]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 22:35:37 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Getting text of common licenses
Thread-Topic: Getting text of common licenses
Thread-Index: AdaejA6kP6Pbq1DtQOSmOG0lQzrpug==
Date: Fri, 9 Oct 2020 22:35:37 +0000
Message-ID: 
 <BY5PR11MB39921F61B3D63FFF0C50C0B788080@BY5PR11MB3992.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [24.5.219.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46b7ebb0-5508-46dd-263a-08d86ca3a500
x-ms-traffictypediagnostic: BY5PR11MB4291:
x-microsoft-antispam-prvs: 
 <BY5PR11MB4291BAFA3A527D72ACA058D088080@BY5PR11MB4291.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WoF9SwLtr1PcPVvp37dceJuJiawLDnPkcAGJZMZYM4UPu4KBCuUL+lybIKUuesiIXC61xOw+fI0K2ukRwMDptT/FhPrfEaPdzVl8Du9wL3wUSWuSXehcf5Ps05sPYkoP863Piaix5rlb7fumqmU2v7NVWlg48SFLpqmccqp7XF+HpQdtydxOFvhByBzn5nxvexkiSn8j5Kn21sSow5CYxJ24Pjmv+SITqnRBEY1ivcr6XHICK3/V47DvqXKG/+7pWehhSIm95ZR7WM8HRub05S/rhw11Qcqpi4ndqONpgX+lgLevOrhUby5PIGLXxlgjXydensljKEOjBULQZRmVmqJ3zP3DlxVft8GpG7jgkniC2uRXuIqiV3dNTmHmQBUv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(6916009)(6506007)(316002)(86362001)(33656002)(26005)(71200400001)(76116006)(52536014)(5660300002)(186003)(478600001)(8936002)(55016002)(8676002)(2906002)(66446008)(66946007)(558084003)(66556008)(66476007)(64756008)(9686003)(7696005)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 bvv2wqsH0kxot3ZBdiA3BCWmj+T29iijkJsbf0OKjUOOrLIJyaDHaeXY7CPF2Wz2alzgeRV42GPZS/oCuthZRvqI4SCU/rZKQ02aYF+K8gIMORSeRQaKDynysCy38QSTPpHZVTs/YwWc07PSiTNplZl6rVjTU5N6/mcmWuBXGsKOhrR3jZQ3/y7ipG+yqfGmwdBTJULVkZb8uDr02AK2uOVi2fWasUPIZuw7+OnXfqfhrADnL/9+MwTNmXX5LlgNmHJSvEuV2BIy1bTaPoDWI0dXEF0uD4HmfouLtL9qm7sIWSJhxZwNZrE3N5hdKATAw+Jn0GBSfh+MnOrPDxSKrLx8l0YRcPcy7ReZFkO//WKbbogNhosKc7ADY6J9VmCv6muuCK70MWdLMS5Rg4qwpOmx4lv+YTvulrRL4EJnmjrJn9FlAlksHUzhxKnCoIYnjnPl/pe4CV5uV2dRnIssBKFLgSzovdgiGOXTACjfzKiZkqXGCaui4s/c63aMqM3AXlmdiBDJ/z4FCL3QoMsX7GbVPVEM00ZBDeMlhNBRl2mpw9wTWCzkgl63xF5gGCNBr6PeeHEJWvuqJmweq58D4HLVbcWXW8zMrAc9TX+C/a5Z3tOd7rNmRvmP3GUHWK8Sxql0doCtKmFBRZL3piFbow==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b7ebb0-5508-46dd-263a-08d86ca3a500
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2020 22:35:37.5635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hq7J56Z3YxeJYceEdNVL+tep8ZlDIc4H+09yFzR7Cs6aWdjCMaGR1xwfxdRLE8UPdT4xFB4zntBNeyrDPp9ZO+FNrB5wQR++2z+prEg6THs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4291
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY5PR11MB39921F61B3D63FFF0C50C0B788080BY5PR11MB3992namp_"

--_000_BY5PR11MB39921F61B3D63FFF0C50C0B788080BY5PR11MB3992namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

One can modify do_unpack(), but maybe a GET_COMMON_LICENSE variable that wo=
uld fetch the text to S would be useful?

Joe


--_000_BY5PR11MB39921F61B3D63FFF0C50C0B788080BY5PR11MB3992namp_
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
<p class=3D"MsoNormal">One can modify do_unpack(), but maybe a GET_COMMON_L=
ICENSE variable that would fetch the text to S would be useful?<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Joe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BY5PR11MB39921F61B3D63FFF0C50C0B788080BY5PR11MB3992namp_--
