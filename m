Return-Path: <chris.laplante@agilent.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	by mail.openembedded.org (Postfix) with ESMTP id A7D807F879
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=l+4VY1RryZwhS6OK480SE3VzgdR5Kc8XsjyOh2B7x/qv38UEaRpXTnLjQih7OiCk+V/aokAidRkL8TFZHH/QCjmN4CnSWQJOWwysrHT36WnJ+AXnA5lCTlReC4CnXTe7K5jVcEmf+zxTj0JKv/2N7DLpzPnJo0ThphMoNP+9fHJhDq3/cYKNDx4W+wk/Q5b1bQNX/axucd2S2rnQuMQ0XYzRvGfN5EmJaMn5frAeX2UCZnrKFZ030FsseW4gCG3omSSOIfNiIqGAC9ENL9RGreubfsQbJJzrbI+bI5f4sItnhqI3IXznP7Yfy29jzy2Vt1jSzaAvbsWE3z0fBrbTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yNo37DrEQZRpO4f79QWI94yrn91i+r6mb7M5wSxXpHc=;
	b=CFbmFIrEfucJyXe/ZiuDHhCVgL0o0cGlNXHXKwo77SII9FmzVGzmUuq6Nx6p382A4vGAjML57b8M6FUauuL/wZU4KLycwm+oouiEiEuheKzlFea5bJykh9SWdAz3gq0N1Q+DmgGcm8sM8ozGoM+q7Us5nAKKA0NhFzsqOf/HoP3UH+d0eibpGy8/gl53ZQx3kvDe/70KFX9MdHD607JtrU0nIdOthuwVd5BcY7p8dX2JhmuNzer45EYThjEMqfBZyKgmixOratHgfUtN1Z+yo4NLidhL1M4BSJ9WJEVmHa85hcizYVdHvWPijfpUb7i8cR6i4sQCpa7dP7G83nThyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yNo37DrEQZRpO4f79QWI94yrn91i+r6mb7M5wSxXpHc=;
	b=VqDtGTjfAVU94/jcmSshetA9nMGpZPw7iBlk7QRVb3TlPoS/4tzF5uixNJ3bMAysRg+RxIU60rV/dehIOaNLWgc4GyXj1oBZoffoRMF5dMS/H64ZU068GRbkwxbYtT85FAdROQIo528qZouodT6lowI6LXL0KqOcrSbD07raHDg=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1269.namprd12.prod.outlook.com (10.168.168.137) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.24; Fri, 24 Jan 2020 15:26:48 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2644.028;
	Fri, 24 Jan 2020 15:26:48 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Custom CLASSOVERRIDE and a "sub-sysroot" for JavaScript
Thread-Index: AdXSu2r5qh8vRNvQSy2wYaWkj47c6wADCyQAAAB32eA=
Date: Fri, 24 Jan 2020 15:26:47 +0000
Message-ID: <CY4PR12MB1653D3CA9B953DF531F2FD7B8B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CY4PR12MB165355D4A69E257FD4AB30298B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<e2eb64a553a0b7bf89a942cdf9a1c177c5145aaf.camel@linuxfoundation.org>
In-Reply-To: <e2eb64a553a0b7bf89a942cdf9a1c177c5145aaf.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 151ab52e-6971-4078-abb6-08d7a0e1d40e
x-ms-traffictypediagnostic: CY4PR12MB1269:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1269FF12600268B91FBA9F5A8B0E0@CY4PR12MB1269.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(396003)(346002)(39860400002)(376002)(366004)(189003)(199004)(29502001)(7696005)(86362001)(4326008)(76116006)(81156014)(81166006)(52536014)(66946007)(6506007)(66446008)(64756008)(66556008)(66476007)(8676002)(107886003)(71200400001)(110136005)(316002)(478600001)(33656002)(9686003)(2906002)(8936002)(5660300002)(54906003)(186003)(26005)(55016002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1269;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N0doENe1JPU11ai4L38mx9kk1x+DXmCdqBe6ZrH4ZpmEoN8Ue2zjpp6ArcrdgaPZBi6/V5hfdqgCA+cRYZFizOOlUEu/eLjwCeVhO8dFctseF9jIYnptxlnyHrMSZp/A39mZBKoXdinioPVeXFWypoB7XoVzcQWPqMzfOVimJG2afNxGTtZ83NyEHhVG6JFRYg298s9NELL1AgoVxuLBwClP80msRWahAAOOlOl9T3XkcWYDh553Xp1uq7v48vqUosv9ZxYY/KGxQEyjKMYwZtRsGdgEFho0RQhaG3w/e4O0YiUdYdP6U+HlnOk+6Cp8EGgL/Rtjedi6pOQLxvZHaJm6UWsZnpNok6jI99/J1yrh8jKoFQCivc6mf3OsY4VT2SLdy3P2yCMe37/kYxtLEoDQ/tqKOrwj6KrNU+hhln/SZ9NFFKcIy5kqbCFXKIwJYQMU4UslR1fGdYzxVNT0gQe1Y6tqie+wBrO/yTywFyW8rEhskq5ylWAp2R0EuA/Q
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151ab52e-6971-4078-abb6-08d7a0e1d40e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 15:26:48.0202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cJ2NSAk7NePsZ6Jo+ml0Gf7+Ta8yOiwUbIaDURhJw5k2aCzKz6cS1R/4hqvmHFrBiueEPwi7svpgp/qcA1m6Pz8C0q3BI/Xhn5mi1Pi1Pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1269
Cc: "dave_clouser@agilent.com" <dave_clouser@agilent.com>
Subject: Re: Custom CLASSOVERRIDE and a "sub-sysroot" for JavaScript
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
X-List-Received-Date: Fri, 24 Jan 2020 15:26:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiA+IEkgaGF2ZSBhIGZldyBjb25jZXJucy9xdWVzdGlvbnM6DQo+ID4g
W2FdIElzIHRoZSBiYXNpYyBwcmVtaXNlIG9mIGEgY3VzdG9tIENMQVNTT1ZFUlJJREUgc3VwcG9y
dGVkIGJ5DQo+ID4gWW9jdG8/IE91ciBzaXR1YXRpb24gc2VlbXMgYSBiaXQgd2VpcmQsIGJlY2F1
c2Ugb3VyIGVtc2NyaXB0ZW4NCj4gPiByZWNpcGVzIGFyZSBzdGlsbCBzb3J0IG9mIOKAnHRhcmdl
dOKAnSByZWNpcGVzLCBzbyBJIGZlZWwgYSBiaXQgZnVubnkNCj4gPiBjb21wbGV0ZWx5IHdpcGlu
ZyBDTEFTU09WRVJSSURFLg0KPiANCj4gSSBhc3N1bWUgdGhpcyBjbGFzcyBleHRlbnNpb24gb25s
eSBhcHBsaWVzIGZvciB0YXJnZXQgcmVjaXBlcz8NCj4gDQo+IElmIHNvLCB3aHkgbm90IGFwcGVu
ZCAiOmNsYXNzLWVtc2NyaXB0ZW4iIHRvIENMQVNTT1ZFUlJJREUgcmF0aGVyIHRoYW4NCj4gb3Zl
cndyaXRlIGl0PyBXZSBzdXBwb3J0IG11bHRpcGxlIG92ZXJyaWRlcy4NCg0KTWFrZXMgc2Vuc2Us
IEknbGwgZ2l2ZSBpdCBhIHRyeS4gDQoNCj4gPiBbYl0gQXQgdGhlIHZlcnkgbGVhc3QsIEkga25v
dyBJIGRpZCBzb21ldGhpbmcgd3JvbmcsIGJlY2F1c2UNCj4gPiBzb21ldGltZXMgd2UgZ2V0IHdl
aXJkIHdhcm5pbmdzIGxpa2U6DQo+ID4NCj4gPiBXQVJOSU5HOiBhcHAtZW1zY3JpcHRlbi0xLjAr
Z2l0QVVUT0lOQysxZDEwNzNlN2M0LXIwIGRvX2NvbXBpbGU6DQo+ID4gTWFuaWZlc3QgL2hvbWUv
dXNlci95b2N0by9idWlsZC90bXAvc3N0YXRlLWNvbnRyb2wvbWFuaWZlc3QtDQo+ID4geDg2XzY0
X3g4Nl82NC1uYXRpdmVzZGstbGlicmFyeS1lbXNjcmlwdGVuLnBvcHVsYXRlX3N5c3Jvb3Qgbm90
IGZvdW5kDQo+ID4gaW4gbXlfbWFjaCBjb3J0ZXhhOXQyaGYtbmVvbiBjb3J0ZXhhOXQyaGYtdmZw
IGNvcnRleGE5aGYtbmVvbg0KPiA+IGNvcnRleGE5aGYtdmZwIGFybXY3YXQyaGYtbmVvbiBhcm12
N2FoZi1uZW9uIGFybXY3YXQyaGYtdmZwIGFybXY3YWhmLQ0KPiA+IHZmcCBhcm12NnRoZi12ZnAg
YXJtdjZoZi12ZnAgYXJtdjV0ZWhmLXZmcCBhcm12NWVoZi12ZnAgYXJtdjV0aGYtdmZwDQo+ID4g
YXJtdjVoZi12ZnAgYWxsYXJjaCB4ODZfNjRfeDg2XzY0LW5hdGl2ZXNkayAodmFyaWFudCAnJyk/
DQo+ID4NCj4gPiAuLi4gdXN1YWxseSBmb2xsb3dlZCBieSBhIGJ1aWxkIGZhaWx1cmUgaW4g4oCc
YXBwLWVtc2NyaXB0ZW7igJ0gYmVjYXVzZQ0KPiA+IOKAnGxpYnJhcnktZW1zY3JpcHRlbjpkb19w
b3B1bGF0ZV9zeXNyb2904oCdIGluZGVlZCBkaWRu4oCZdCBydW4uIFJlbGF0ZWQNCj4gPiB0byBb
YV0gb3IgcGVyaGFwcyB0aGUgc3RhbXAtZXh0cmEtaW5mbyBsaW5lcz8NCj4gDQo+IEknZCBzYXkg
dGhlIHN0YW1wLWV4dHJhLWluZm8gbGluZXMuIFdoeSBkbyB5b3UgdGhpbmsgeW91IHdhbnQgdGhv
c2U/DQoNClRvIGJlIGhvbmVzdCwgSSdtIG5vdCBjb21wbGV0ZWx5IHN1cmUuIEkgYmFzZWQgdGhp
cyBjbGFzcyBvZmYgb2YgbmF0aXZlLmJiY2xhc3MgYW5kIG5hdGl2ZXNkay5iYmNsYXNzIGFuZCB0
aGV5IGJvdGggZG8gaXQuIEkgaGF2ZSBsaXR0bGUgaWRlYSB3aGF0IHN0YW1wLWV4dHJhLWluZm8g
YWN0dWFsbHkgZG9lcy4gIA0KDQoNCj4gPiBbY10gSXMgdGhlcmUgYSBiZXR0ZXIgd2F5IHRvIGRv
IHRoZSDigJxzdWItc3lzcm9vdOKAnSAoL3Vzci9qcyk/IFdvdWxkDQo+ID4gbXVsdGlsaWIgY292
ZXIgdGhpcyB3aG9sZSB1c2UgY2FzZT8gICgyKQ0KPiANCj4gTm8sIGl0IHdvdWxkbid0IHNpbmNl
IG11bHRpbGliIGFzc3VtZXMgdGhlIGhlYWRlcnMgYXJlIG9uZSBzZXQgd2l0aCB0d28NCj4gc2V0
cyBvZiBiaW5hcmllcy9saWJzLiBZb3UgYXJlIGRvaW5nIHNvbWV0aGluZyBxdWl0ZSBzaW1pbGFy
IHRvIHRoZQ0KPiBtdWx0aWxpYiBjbGFzcyBleHRlbnNpb24gdGhvdWdoLg0KDQpPSywgc28gdGhl
IGJhc2ljIHN0cmF0ZWd5IHNlZW1zIE9LIHRoZW4/IA0KDQpUaGFua3MgYWdhaW4gZm9yIHlvdXIg
ZXhwZXJ0aXNlLA0KQ2hyaXMNCg==

