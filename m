Return-Path: <chris.laplante@agilent.com>
X-Greylist: delayed 3587 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Jul 2019 23:02:03 UTC
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
	by mail.openembedded.org (Postfix) with ESMTP id AD7FE7C427
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 23:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1HwRt5PfuitkNJuir4dnPSWfDFzrvHUdAZY/7KvVPQQ=;
	b=TCLJbNBi1foJl/yylgjcoDBYgQWaZWmtXgj0u+iPmM98Sx5LzXrqIWZkFATed4sBQ/5yO+DK6aF+w6m0aOh99G3EK5eFvoxzacM0mbjz79J8WxBa7SSPIfEJPoRc41adXaGIXmD1jT0PnSErOzCuY1195vcfjO9p3xmUX9EDnF8=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1621.namprd12.prod.outlook.com (10.172.72.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.19; Tue, 9 Jul 2019 14:28:43 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::dc8a:93b0:9b11:a2b8]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::dc8a:93b0:9b11:a2b8%9]) with mapi id 15.20.2052.019;
	Tue, 9 Jul 2019 14:28:43 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Thread-Topic: [OE-core] Problems with sstate-cache in Artifactory
Thread-Index: AQHVMYdPAQLTs6gDcU+p6FUk8g+bzKa4y8IAgAD0v4CAByAHQIAAYUGAgABslYCAALN8EA==
Date: Tue, 9 Jul 2019 14:28:43 +0000
Message-ID: <CY4PR12MB1653A8BABBBED9BEDD00DAC38BF10@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CADySD0HgOebmE=uUJ718CBhsXv3bW7WoeXa4dp06LL=vcLd_qg@mail.gmail.com>
	<CAJTo0Lbm1DVcwKFjYBaXWsgzTGLbRRH2aFEzgTi0MAGQXQ4T_w@mail.gmail.com>
	<CADySD0E7mwou1DeeTWfjdXh3QjqM9oMDvLsVbkXMrFZCfcgdug@mail.gmail.com>
	<CY4PR12MB165398EE661D4CA2995CD0558BF60@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CADySD0HHhJHacwP0HXR52dpw1SEjg60y9-RRvuNgDHJFTw46Aw@mail.gmail.com>
	<CADySD0Hz1mmT29kZF6=0=kw3Af+8+OAaKMxUvfXXPpcM+2LASw@mail.gmail.com>
In-Reply-To: <CADySD0Hz1mmT29kZF6=0=kw3Af+8+OAaKMxUvfXXPpcM+2LASw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10a3f72a-667c-4f05-1017-08d70479bef7
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CY4PR12MB1621; 
x-ms-traffictypediagnostic: CY4PR12MB1621:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR12MB16213BD6E41C6440209B8D7A8BF10@CY4PR12MB1621.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:418;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(136003)(346002)(396003)(39860400002)(366004)(189003)(199004)(29502001)(52536014)(8676002)(7696005)(6436002)(76176011)(99286004)(66946007)(73956011)(76116006)(6306002)(55016002)(74316002)(66446008)(966005)(64756008)(66556008)(66476007)(6916009)(229853002)(305945005)(81156014)(66066001)(478600001)(33656002)(53936002)(2906002)(14454004)(256004)(6506007)(71200400001)(4326008)(186003)(9686003)(11346002)(25786009)(486006)(476003)(7736002)(316002)(5660300002)(68736007)(86362001)(8936002)(81166006)(6246003)(26005)(6116002)(446003)(71190400001)(102836004)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1621;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8ofplhzYIfb5ZAmi3cgMu0J6253jwaJjGy1CnOtkhwyMrmsPeuQgl6zQpBU7hyNY4G0ncX60RmXJ54KoN7QDySxiwdgHi/gcYVR1/gFnuxm7aOWONLCuV9qZYdSNPjDZhZ8klm2/QeJ/j0/V0xK9o+Te5l64aDM1KBzHpL7qkAOSm5ZFnyjTh2rxKrNV20vjg02cjpf3uVjvZGq8het23nAaz80i4FqNCzSe5ngVvwsd7d1oG5a+WpMdVtFgguV5EFRAoN/S2/biloetMyxNrZXQUy5IHnV2807ZUPINl9Kr/Wup93FD402/4kb5dvLwNvwZoNCZnv5ZOGzou8swol7DgxbBWG7zRHDor4TFcmMOdpwVcENBH5/P68i4nu3uZB4HB8mkczWh9FRpbX+HAL8JkEEb9F2D8xRgGQ+qQXA=
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a3f72a-667c-4f05-1017-08d70479bef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 14:28:43.6770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chris.laplante@agilent.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1621
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problems with sstate-cache in Artifactory
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
X-List-Received-Date: Tue, 09 Jul 2019 23:02:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBERUJVRzogRm9yIHVybCBmaWxlOi8vNWMvc3N0YXRlOnUtYm9vdC10aS1zdGFnaW5nOndzbC1s
aW51eC0NCj4gZ251ZWFiaToyMDE5LjAxK2dpdEFVVE9JTkMrMDZlMGI1YmFiZTpyMTc6d3NsOjM6
NWNkZjkzODBiOWIzZjhjOTRhNzA2MzQ0Y2YxOTU1NGFfcGFja2FnZWRhdGEudGd6DQo+IHJldHVy
bmluZyBodHRwczovL2FydGlmYWN0b3J5LmxvY2FsLmdhbGxhZ2hlci5pby9hcnRpZmFjdG9yeS9y
bmQteW9jdG8tcGFja2FnZXMvc3N0YXRlLWNhY2hlL3dzbC10aHVkLzVjL3NzdGF0ZSUzQXUtYm9v
dC10aS0NCj4gc3RhZ2luZyUzQXdzbC1saW51eC0NCj4gZ251ZWFiaSUzQTIwMTkuMDElMkJnaXRB
VVRPSU5DJTJCMDZlMGI1YmFiZSUzQXIxNyUzQXdzbCUzQTMlM0E1Y2RmOTM4MGI5YjNmOGM5NGE3
MDYzNDRjZjE5NTU0YV9wYWNrYWdlZGF0YS50Z3o7DQo+IGRvd25sb2FkZmlsZW5hbWU9NWMvc3N0
YXRlOnUtYm9vdC10aS1zdGFnaW5nOndzbC1saW51eC0NCj4gZ251ZWFiaToyMDE5LjAxK2dpdEFV
VE9JTkMrMDZlMGI1YmFiZTpyMTc6d3NsOjM6NWNkZjkzODBiOWIzZjhjOTRhNzA2MzQ0Y2YxOTU1
NGFfcGFja2FnZWRhdGEudGd6DQo+IERFQlVHOiBjaGVja3N0YXR1czogdHJ5aW5nIGFnYWluDQo+
IERFQlVHOiBjaGVja3N0YXR1czogdHJ5aW5nIGFnYWluDQo+IERFQlVHOiBjaGVja3N0YXR1czog
dHJ5aW5nIGFnYWluDQo+IERFQlVHOiBjaGVja3N0YXR1czogdHJ5aW5nIGFnYWluDQo+IERFQlVH
OiBjaGVja3N0YXR1cygpIHVybG9wZW4gZmFpbGVkOiBIVFRQIEVycm9yIDQwNDogTm90IEZvdW5k
DQoNCklzIHRoaXMgbWFwcGluZyBjb3JyZWN0PyBEb2VzIHVzaW5nIGN1cmwgdG8gZG93bmxvYWQg
aHR0cHM6Ly9hcnRpZmFjdG9yeS5sb2NhbC5nYWxsYWdoZXIuaW8vYXJ0aWZhY3Rvcnkvcm5kLXlv
Y3RvLXBhY2thZ2VzL3NzdGF0ZS1jYWNoZS93c2wtdGh1ZC81Yy9zc3RhdGUlM0F1LWJvb3QtdGkt
c3RhZ2luZyUzQXdzbC1saW51eC1nbnVlYWJpJTNBMjAxOS4wMSUyQmdpdEFVVE9JTkMlMkIwNmUw
YjViYWJlJTNBcjE3JTNBd3NsJTNBMyUzQTVjZGY5MzgwYjliM2Y4Yzk0YTcwNjM0NGNmMTk1NTRh
X3BhY2thZ2VkYXRhLnRnejtkb3dubG9hZGZpbGVuYW1lPTVjL3NzdGF0ZTp1LWJvb3QtdGktc3Rh
Z2luZzp3c2wtbGludXgtZ251ZWFiaToyMDE5LjAxK2dpdEFVVE9JTkMrMDZlMGI1YmFiZTpyMTc6
d3NsOjM6NWNkZjkzODBiOWIzZjhjOTRhNzA2MzQ0Y2YxOTU1NGFfcGFja2FnZWRhdGEudGd6IHdv
cms/DQoNCkNocmlzDQo=

