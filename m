Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.68])
 by mx.groups.io with SMTP id smtpd.web10.7520.1587333507183291073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2020 14:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=QSwvuq0s;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.68, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/CE84h4udPQHoKYsxJq1ddOF9/Ls3nvD55rQU2BEfifkOCDM9L/b+jpDxzbR+X+X4vBUi3nxgp+BviKc/PkcV17qp3HrIaGKaQFsNPUCjrg/LhVVRJuwcuxRKVfLS9v74igPUKzUuQlJtPOf9VQaU73GWZe2vMPOTn3DU8a7wiGjOx/F8Z4qU+lDF7tW0CBTxsjzHKyJqcKD+h3YvncU5A/LlAR2FiAFGPki4LV4TYjLMbq2T99utjeGcy6oT+CeOvaexvKKqjhgUbPyoC0i9RDO7Jj98wXJOwns0tDTI+nfNxTMwDananLBexZkibA+SLGWPBiRiFT6ZqKZmY4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+sRfIcusWHDtUVgd8J4fQdk6X3l9t0PbrKDQ/zejJI=;
 b=j+xqsWZrSQ4oUs17hLhUobN7MtVep9vsWR51PJVeqXAPe48QUqBWzUIIPq1eO097BPVFVqyAMBwEz9f+WU6c6LFL+S3UHvCMnJS23Hw2C7xgM799cNjLDcZDp5eh8CqcgDafvTDKvPHPpcV4HZA1Og5PCCRS6ULwtDdVwg6vR0ol2g364egldl/GQrYHF2Mhp5SFyNVispCJfFrEmFpfQWSQsyDaBp9ITPDoxgOoCqutBoIFr6qkYHEgCEmI1ebcAFZnO6viSiMp3Va2rNQ1JAlzW9EnwZgtk5p80A1WiLvR2DcWt9f2jue0QYeJYx04a5UZPCnQV2qjjL6vC01cMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+sRfIcusWHDtUVgd8J4fQdk6X3l9t0PbrKDQ/zejJI=;
 b=QSwvuq0sKyWeSkZxGTIerud99Si89EPdrTfoNlT4LPLHDNShnCXfAexuLfNrxd7e9n8GOKe5uIxHP4U6Vu4XLllIA3ACRysSZWeCmPa624BLa1L+YwIh5dcpk848gcKHiWdbS3yqLOFRr69y0xG0o3NwZVGJXT+vrZA5BV5MtRs=
Received: from DM5PR12MB2471.namprd12.prod.outlook.com (2603:10b6:4:b5::10) by
 DM5PR12MB1404.namprd12.prod.outlook.com (2603:10b6:3:77::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27; Sun, 19 Apr 2020 21:58:25 +0000
Received: from DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab]) by DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab%5]) with mapi id 15.20.2921.027; Sun, 19 Apr 2020
 21:58:25 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Uninative for i386 native tool?
Thread-Topic: [OE-core] Uninative for i386 native tool?
Thread-Index: AdYWkVM2trCb21KjTGaQ4NZX8woV6AAAwS0AAAATDeA=
Date: Sun, 19 Apr 2020 21:58:25 +0000
Message-ID: 
 <DM5PR12MB2471B5B5A25824BCF32B57DA8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
References: 
 <DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
 <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [71.225.127.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c34aedfc-ac98-4ebb-5313-08d7e4acc936
x-ms-traffictypediagnostic: DM5PR12MB1404:
x-microsoft-antispam-prvs: 
 <DM5PR12MB14047DC2C18C739544FDF81C8BD70@DM5PR12MB1404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0378F1E47A
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2471.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(366004)(29502001)(2906002)(186003)(5660300002)(26005)(86362001)(8936002)(55016002)(4326008)(8676002)(6506007)(81156014)(66556008)(9686003)(6916009)(7696005)(33656002)(52536014)(4744005)(71200400001)(76116006)(316002)(64756008)(66446008)(66946007)(66476007)(478600001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: agilent.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HGpD9uuvG2GFSA9LlexO7ueylcCgwzhpfoK2sScdvsCNgJVjudXTJxk4QzbY9xukxqoEN3bLqd9OXTqFYDv7DAhdeBLFPNZTQenUhAkbRalrdCaNSQ9po8M30vou1I2lDGbe3kTt3HKBcXgRh/wB0kgi0VxECklVDTmPWRKf8WExeFQU/7xXgwYH+2kAebfiHyxZmO4tVSM8AUt+pCPQQ8z3qG+GAzVZFVhRpYAKHionKLO/49yQkCzVMSjlYTyQRQBuT5FH3VGj9qjfdOvuW++kOoemaBNz/sY+qkiKUnFpJiCCeKYD64KdMbegRD4s5Hd15URXg/Rhc6ecdVTwEXZDetOsEjRoFyamycHRwXxTdc9b4Pkcou1FuJwVkQ/plRHy6yJ44ez/YWu4rSQW2LW57t67dyCXvsbK3p3o+tuH0Qw1Ug4bC2/FoOl5kgGAF3XVXWpQlL1TwA3KttyiwxEZ0esz89pfolrXnM9Sgf3tG2YYH3VRR9ceEynpP8sB
x-ms-exchange-antispam-messagedata: 
 qqoAcrALt12RCq2BCeRSwrt8S1gYGxXXxDSA8Mx5oOoc3U2xZGhm0W2oUtNToIhaWd9h5GJ/ZTSaXsUkIG+XoTv9bqETP/mVXGWZDQsQJwIPeXbxO3Cd442n6rXVybBUZyOHyQdoKHdB8Rbl+9Hp0A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34aedfc-ac98-4ebb-5313-08d7e4acc936
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2020 21:58:25.6503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ksV9vMCf/lgdL//WDKX091FKHGU17/bzw/1kHZnittpqeSiDkEeNl9tEq07iETONLqSb1gzF8tqeEchtSfM8vfLqRDoW88C1BWNa9jjS4Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1404
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2471B5B5A25824BCF32B57DA8BD70DM5PR12MB2471namp_"

--_000_DM5PR12MB2471B5B5A25824BCF32B57DA8BD70DM5PR12MB2471namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T25lIHBvc3NpYmxlIHdvcmsgYXJvdW5kIHdoaWNoIEknbSB1c2luZyBmb3Igc29tZSBwcmVidWls
dCBuYXRpdmUgYmluYXJpZXMgaXMgdG8gY2FsbCB0aGVtIHdpdGggaG9zdHMgbG9hZGVyIChlLmcu
IC9saWIzMi9sZC1saW51eC5zby4yICR7U1RBR0lOR19CSU5ESVJfTkFUSVZFfS9teS10b29sIHBh
cmFtcykNCg0KT29oLCBuaWNlLiBUaGFua3MgZm9yIHRoZSB0aXAhIERlZmluaXRlbHkgY3VyaW91
cyBhYm91dCBhIGxvbmdlci10ZXJtIHdvcmthcm91bmQgYnV0IHRoaXMgaXMgZ29vZCBmb3IgdGhl
IHNob3J0IHRlcm0uDQoNClRoYW5rcyBhZ2FpbiwNCkNocmlzDQo=

--_000_DM5PR12MB2471B5B5A25824BCF32B57DA8BD70DM5PR12MB2471namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OiJZdSBHb3RoaWMiOw0KCXBhbm9zZS0xOjIgMTEgNCAwIDAgMCAw
IDAgMCAwO30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQFl1IEdv
dGhpYyI7DQoJcGFub3NlLTE6MiAxMSA0IDAgMCAwIDAgMCAwIDA7fQ0KLyogU3R5bGUgRGVmaW5p
dGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFy
Z2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjExLjBwdDsNCglm
b250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJs
aW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpibHVlOw0KCXRleHQtZGVjb3Jh
dGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFuLk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJ
e21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpwdXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9u
OnVuZGVybGluZTt9DQpwLm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWww
DQoJe21zby1zdHlsZS1uYW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsN
CgltYXJnaW4tcmlnaHQ6MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdp
bi1sZWZ0OjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixz
YW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFs
LXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRv
d3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7fQ0K
QHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAx
LjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24x
O30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRz
IHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtp
ZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1h
cCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRp
Zl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVy
cGxlIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9u
ZTtib3JkZXItbGVmdDpzb2xpZCBibHVlIDEuNXB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNC4wcHQi
Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uZSBwb3NzaWJsZSB3b3JrIGFyb3VuZCB3
aGljaCBJJ20gdXNpbmcgZm9yIHNvbWUgcHJlYnVpbHQgbmF0aXZlIGJpbmFyaWVzIGlzIHRvIGNh
bGwgdGhlbSB3aXRoIGhvc3RzIGxvYWRlciAoZS5nLiAvbGliMzIvbGQtbGludXguc28uMiAke1NU
QUdJTkdfQklORElSX05BVElWRX0vbXktdG9vbCBwYXJhbXMpPG86cD48L286cD48L3A+DQo8L2Rp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+T29oLCBuaWNlLiBUaGFua3MgZm9yIHRoZSB0aXAhIERlZmluaXRlbHkgY3Vy
aW91cyBhYm91dCBhIGxvbmdlci10ZXJtIHdvcmthcm91bmQgYnV0IHRoaXMgaXMgZ29vZCBmb3Ig
dGhlIHNob3J0IHRlcm0uICZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3MgYWdh
aW4sPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5DaHJpcyA8bzpwPjwvbzpw
PjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_DM5PR12MB2471B5B5A25824BCF32B57DA8BD70DM5PR12MB2471namp_--
