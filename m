Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.77])
 by mx.groups.io with SMTP id smtpd.web12.3794.1603490176862260591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 14:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=heIFlLxJ;
 spf=pass (domain: windriver.com, ip: 40.107.77.77, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnpGk0TsUx90fiLepz844XgusSW3aYZVd7th/0FrwuQIYpV8ZDo9qT9mXXyPK23KmjviPzpEh1evsTeapmbmkWU0ZsD13DAx+VUyBm2UgZXq9vymC8p4lpkiyg3V3pp7c88U+g7H3qiZv/Q25TvSYC75mLcaY4eCtZZbL6M2qRWnQkBDwFIqdu/SZdyXuw3SZcsPSHLVo2Rsid5GtymRbnQ4BQO+XTsMyh6C7cmnf82Qyt171EUtL6nfN+MW/SpVjdsFcXdFDKNuoFatFcCENwl2p8YzCrYIm+K3Uy8TmWJxS3mRTqvZ0Kqs2dRK9X8XHCHPEFfORvNOUWqaX3AeXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au+Lh6hdcdb3JcUpeVeKaK0F01BCXuRW62FFrwdXjpY=;
 b=ECYV7FwtOMi6XzPCbviWfExOWdXhinyKdRy2BreXEFq0rYgG16uEO9bcMDdm6RySX1BJgtXscGLp5BWbF9TWfvO9c9cSfqNygp+Qrxj9dyxaVwtjeikUvwc9jYycJkVDFgMdcJwdQUe0U7V6qiZeokM6U75iQCsHvLYLoUr3HoEKLSTLGBi5/0F9HgjxcfATQ+54LG5UM/IYvj3MIC60CtshnxR5uT1ydZsdhtx+aovyR4qNQM+kD4zfVNhKdHu6gi+jyFpF8SXpfM7iHet9OHCnztgnvNHF7ob1suWu9j395Pvs1RL+0c/lES2Ti2kqhAsT3bfYCvCrw7CWTR9oJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au+Lh6hdcdb3JcUpeVeKaK0F01BCXuRW62FFrwdXjpY=;
 b=heIFlLxJRr+tkm7wCAK9oMkl4QOVqoVM8KG159pf4S3YrG+TNWxOywQ8LjLcFX0ROvolf6ig+yJ2L7Cmjzlaa7IzJQxLY8ogYZNauEe/XVc0yhXgAuI8zToF/qT511/ZNXP55VUNOx25JSe/Kw/nsk7G1gVuCsD/Jt7D5Ysoacg=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3494.namprd11.prod.outlook.com (2603:10b6:a03:86::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23; Fri, 23 Oct
 2020 21:56:14 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c%7]) with mapi id 15.20.3499.019; Fri, 23 Oct 2020
 21:56:14 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: git repo vs archive for source
Thread-Topic: git repo vs archive for source
Thread-Index: AdaphrH3XaiH33SSSPy9HGb76fjUIA==
Date: Fri, 23 Oct 2020 21:56:13 +0000
Message-ID: 
 <BY5PR11MB3992E2FBAD8DAF232D5321B5881A0@BY5PR11MB3992.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [24.5.219.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ec1951d-578d-4f39-0f23-08d8779e7607
x-ms-traffictypediagnostic: BYAPR11MB3494:
x-microsoft-antispam-prvs: 
 <BYAPR11MB34949B2A6DEC758610943570881A0@BYAPR11MB3494.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IJyw00j1V2i4FqoZD1PLj0JGP0A+Z28YrHZ6i9v/s2P6tALOPQqLc8m/IJgQ8P2GDtloc5mvl2x0V4BStiw4e3MVKnnneBnY6micTp8Df5mwh7q2sPbUrBattuB3BA3QlqSosvEU6Hp5cNtlFx1kbrBnPuA67+n+lj1Be4bqcLH4MthRu5652pwHUqs7ZEvrEf5yKd+WpW7y53m+K4KIeW/cc6/1p61SZ0Lt155hG+FQYjUNWVqRtML1tOUUwnqliD0cZza3E+vixIoqzkbKIv/lezaSzEJfH0HNY12idm0wYT9fCLfL/DYoaMI7kp+ltem2lXDgRVbrDM9P2w0I01OSYqCpi8WwqVIWutgqYeAe4cF6qUE+iU7c79JAlG3c
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39850400004)(396003)(2906002)(66556008)(186003)(26005)(66946007)(9686003)(7696005)(64756008)(66446008)(76116006)(5660300002)(66476007)(316002)(86362001)(8676002)(8936002)(6506007)(558084003)(71200400001)(6916009)(478600001)(55016002)(33656002)(52536014)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 ySqGeI3PIj0SpWCgxelfZCiZuY9gWg80FBGIvAQvpHv+ODxWjrKQzMpegqpoEneT6FGx/UsgfDQ7+b31OjYtUdWFQoJdaqUNp6Zg7J4NMyez8vkLMtu+xLdMmhLZDLd3ITLl38rjdXq09RkaZ6Ttxq1a7Alp0UFhj+HHHULoWWm+wQZ0VTC445G+VIopzjKinMBov947KU5+JTtQcMvEQHfuX1T/R0VWyOnRoq56dwU1jjj4Vzd9di5LXlSWjt2RhDjQvyuM8VAIHkwceu+4nfn+O8oCH7hvZUu2RMwsMpTs7AMpPCsPFMOl7s/TsVam6bcZokIrTUsBTNXo0+oWemJLsSDwI0kWvf1UE6RS1LaCxZlBCkakPThMjWHB5TgCH6Fvow7q1/tuDsQgW21xX5VjJWR0YtJ40SpM+aO4REVVUyBp6a6nPBM3/D/vAKi23fmSNZ55adt+G4tZIOcIL+HMeqTsl45MuSVY2/N6yWwKTe21Em6/GId6e0QYxROwK2mHUfCOkWqY32pTlgLvhOnLkBzEo5A3BIxVmT9zMULxUHDqII8f8AAJOdVfT1ER2jH9yngy3FrQxzkLFU6ONDQE8Yg2J40lZUhqQzTaRD+N3TZgL5iaqsAU1ZZV6gCW/JFbhCNKiAvagxxG+b8wug==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec1951d-578d-4f39-0f23-08d8779e7607
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 21:56:14.0608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x3cE9FQaHqyINzodrKXSCVZVSZNCc1WL7QooOtj5OdNOwoluzvDyXwKHQP5E9/i48T1/FS3ofV5iSrCboBrxEyaJdt8XcXlEGQBIHudaaps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3494
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY5PR11MB3992E2FBAD8DAF232D5321B5881A0BY5PR11MB3992namp_"

--_000_BY5PR11MB3992E2FBAD8DAF232D5321B5881A0BY5PR11MB3992namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

When updating versions, like for ruby, say, is it desirable to switch from =
using "released" archives to using the git(hub) repo with the corresponding=
 branch/tag?

Joe

--_000_BY5PR11MB3992E2FBAD8DAF232D5321B5881A0BY5PR11MB3992namp_
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
<p class=3D"MsoNormal">When updating versions, like for ruby, say, is it de=
sirable to switch from using &#8220;released&#8221; archives to using the g=
it(hub) repo with the corresponding branch/tag?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Joe<o:p></o:p></p>
</div>
</body>
</html>

--_000_BY5PR11MB3992E2FBAD8DAF232D5321B5881A0BY5PR11MB3992namp_--
