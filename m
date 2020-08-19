Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.54])
 by mx.groups.io with SMTP id smtpd.web11.100384.1597879688067695347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 16:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qOVZwiag;
 spf=pass (domain: windriver.com, ip: 40.107.94.54, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8Q85BS0hqJzi6K8ETy1YcgrYKIhg14C3kfJCXqtTMd6+b7iqBdWKVWr05Xr3jcDR01pFHUIjOedbLrVZMUSZiLiFUuRK7rPEssUbmLctsB0aGe2bl48tjpsZkBJJWgsxgW+EwIXVyGXZzu+aTiTJrQnaJ7MzGB2WTawbu9V0/kscDkFwSDvkFou6If0aPCLpm3KRO5sjVnQXZ64KenTvMrp7bXUzc7dXbqSF6PgDOUdenxDRbgQzCPdPOxEQUXUtKE34VfHHJuOIik+ydJse/EfDKsu+dsHApy7TTCr54Je3Fs/lXZUu1z0RulQmN5Bf+FNASVzIDi402nuJcv0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgg/nSHYRp1RuRZBL5LvjJmKD3uKwfcdtt1NG6B5Dlk=;
 b=Ucoml4baw8WJ3V1bjZtD8UeU/tH3KzY8qZH8MMDLF0Nw8su3S186679eIDx+LuRaea6QPxnzusoYtSk7LsbyhDkgIZwBYTSe21UTNwjEbi8F94Mym3IfL9Zv7VMzZtjkFswQeYLvhSZGW37Vz9e29zxNc4bUb17mSzUMkxVCKNn5DuhAYv3o5tR+gqilQZWUB0X8U84riHoVrKYSykgQZSTZyN7lLUmjxyCzE7ng8EewkCYBSJodFZAUv3Sww9tg90uwI2r4eD+eSzY3nj2bAdhNZF35xnQBboAwT3lWXS6+hhsm+crTN4t/drl33BFuD48rqfsLCWyFblk+Bkkc8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgg/nSHYRp1RuRZBL5LvjJmKD3uKwfcdtt1NG6B5Dlk=;
 b=qOVZwiagKN+GkfDynVQKT6Zxw88ZlTOwNx5YtX+3wVuZdIuqOSAe5yjx30d7SeJnepepcXe4hho0+Rwln3y6dSbyeB0IJTZlnMjvOtz5JqRcSdzjonxya7M8lAcBDD9eXmHUZjmU3sPYJHpLRcrx8WB8/RDs8LDaMj9TjkCukig=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2949.namprd11.prod.outlook.com (2603:10b6:a03:81::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 23:28:01 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d93e:4c0f:e4a9:dfc6]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d93e:4c0f:e4a9:dfc6%2]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 23:28:00 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: cleansstate
Thread-Topic: cleansstate
Thread-Index: AdZ2f++6TJw6HumXThCCKg2pI169VQ==
Date: Wed, 19 Aug 2020 23:28:00 +0000
Message-ID: 
 <BY5PR11MB3992C1180C5A53CCD612FD47885D0@BY5PR11MB3992.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 431749e6-0bd3-4702-b552-08d84497835c
x-ms-traffictypediagnostic: BYAPR11MB2949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BYAPR11MB294900EA5C4C38B7B6181F3D885D0@BYAPR11MB2949.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 C2xxWMMejGQ9Z558mYyHzzibbq3eIt2pUCLTVEtYMzS/W+eDMWw0kcLBt1WSOCsD8EodxSrKgQwX+h5Qf2ottXPIqvy1s8KCxZqDZ3wSI7GKKBXnv08QrMFLywERYOfEaT3wffvCt74QF20Y0G9ZdumYrJiMDyqF6gFSwoKg/rmqyiSC+43k/wmhtoBrS1SO8k/jm6GauHwNq+NZTwo5+glLfka9mJmGPHHhSyKJSu5s70kNCpNx1x56deZkHUAlOaf/qy7THZzxqzC0wtnlgYedlgC0k5QHcbI3ob39x9ix4ateAfUnTnAd/8HSii1oRn9rW6i7KW9y7md0NbB4uP7S2yEeJAidGwDhkB0NRF10oBBCBEuEjh4r6ZOyPnO4fJrGGwAx3dJaVJkxbwcLiSU5hDPgtCr5J4OGVQF2gz4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(39850400004)(366004)(136003)(4744005)(64756008)(8676002)(33656002)(66476007)(71200400001)(5660300002)(316002)(186003)(83380400001)(66446008)(8936002)(6916009)(52536014)(7116003)(7696005)(478600001)(2906002)(9686003)(66556008)(76116006)(86362001)(6506007)(55016002)(26005)(66946007)(3480700007)(166393002)(491001)(220243001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 wfeXfj31Ob+a0d6J2GEb1UaVqz/YQF0F4ofwyVTqfhnjkIzFna8qvzsON9ef12CCWJ+f22VtrmerEGQLkJFetS7m/1v8CCOfGBvyobQeGjFVhyeXns0mmqG170moTiLndiUuuJxrA7w+FPdDYz8kzl2TjlQFyvzsoLuSPEhNAw4Rmf8n8aDrQ/o24Mvyq4lbbcefTN8v79umSDQdcUbCsosy+IZ8hmSMc7oOv7Sa/8puLaJNCuIpF1e3HGA4QHadgPQ52AYqKFzrNlavBAYROg8LxZAssl27EwFGu107SVStcqK9iMZlasfFqDMWp6mFVc+0FvQvR1bovUQEYYqkDhXgsFiIX9Ro1hkmeSfgD23z8qLjZwjy3wmuYcDmz4rhhtC6P5y2pX+B7GPiC6l9fEz/kORzkVH5KG1uFfjR1XZupeuqlYHUhZpVpmo3j6a+QA1UCrQm1BhnA4c3f+GDZG8FRkGYENFnIxRxvzBedJMzHc42GoUSdr/oNW1K1fiKF86MNlCeVozy9E+IpH9nD4V5sHe7uNh7ISdiXRaxavBGZcpuy7hSrmYVfjGygel/CAND4V2os/b+EmDKt21CD5KujFM6I68ThkLxi2wwsN5nblJhS2nK2iX4AYSgss02JzuSqNSUGPqD5K+mVzCcyQ==
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431749e6-0bd3-4702-b552-08d84497835c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2020 23:28:00.6137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wtx6pLCJlDINI5ewSPlk9vDe13UK0HS+fH8TVzKzsZt/caaT1HA5Ku41ok5OGCbLtZX1g+SlgiYoEsSHuvx8vwis9mzTHUq27hJ2W1pNv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2949
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY5PR11MB3992C1180C5A53CCD612FD47885D0BY5PR11MB3992namp_"

--_000_BY5PR11MB3992C1180C5A53CCD612FD47885D0BY5PR11MB3992namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This might be specific to the distro I am typically using (take a guess) bu=
t I notice that cleansstate usually pauses at the 33% mark for a significan=
t amount of time.  I don't think this used to be quite as bad as it is now,=
 but it is hard to remember.  Just an observation that someone might be abl=
e to confirm/deny/explain.

Joe


--_000_BY5PR11MB3992C1180C5A53CCD612FD47885D0BY5PR11MB3992namp_
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
<p class=3D"MsoNormal">This might be specific to the distro I am typically =
using (take a guess) but I notice that cleansstate usually pauses at the 33=
% mark for a significant amount of time.&nbsp; I don&#8217;t think this use=
d to be quite as bad as it is now, but it is
 hard to remember.&nbsp; Just an observation that someone might be able to =
confirm/deny/explain.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Joe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BY5PR11MB3992C1180C5A53CCD612FD47885D0BY5PR11MB3992namp_--
