Return-Path: <chris.laplante@agilent.com>
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700057.outbound.protection.outlook.com [40.107.70.57])
	by mail.openembedded.org (Postfix) with ESMTP id D8A3960EBF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 15:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=O0za2ZHazawGYf2F5BPFApWOcZEro0tMRU0sTC/IUQQfMNe38fp+28LCyvWJ2kWip8HOWRvTrtXifIWYfP/cI+Fl2S8+YIrwbdKMfB6JbFfsQe5B+O75+eDzx1EYR5C8PASPd2EXRaKE7ERW67/XdAlxMJr6femGAXPJYtHm1/QNdyT8OBZ3h5NXhocmbW2pR2xMXAXLCzoWIsZL+MM4HjxtG5S9Klm1N2cVuOC7Svy5SuZBoO1eDvE0hVwzM9Ye/8d1FtZujn/RHp11XVEVylrM9ridZntfe5De4s0LKDPd1RtP3APMY96yK+0PXVywvCuVFoebZefavoks7lhsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/rzcN+/3HiaLpznmKBx/ICoW7jmGSuOf5VzmIM9j/H0=;
	b=oPSKnM1b6RT/B7Lk0Ev7Ggn97wez1Ib15sWF+LOX7XZ9cxQV7ByqqLenvryybh12nVUfyCqg6ofenTqOZAnGQkpeIWtRJb68QAg1I3jb3wYVlGoukqX5aN843/aZIzQY0UMpvpS6+m8G+Z1ILartPikLclmxEY6rBgiyYbbr8r0996vp9kioc7BWIFoIklWRk9BsqYs0hHEB0YM+IQEje0eNB0/xx+wywt6SpLMKut9Hs7foZBOrf98Se0bWJ8CCQ9z2VgFsyFNy5uKb7mh34tDwG7dLVnPSWZWZKjHSpZXg4LgVs+L4cX2O1Ic1s+li4PvLBQBlI7XLSvSWR7ZSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/rzcN+/3HiaLpznmKBx/ICoW7jmGSuOf5VzmIM9j/H0=;
	b=Ij/ybK8fcDqXf9Mk+Mt1ImGaUGbrgitGhTs0ZCUHDp2cdg2s7lUsXqcd1expaDP3nOk/UfIR9X4yvztnKQR4UbLQRKS5bI6ZatW0HfUE8aUDnZGHAwT9krPoVFDaM/N51AEGd182MY+i62HGGqhXiRVX5zQPPDRi6WnQYIiqV3g=
Received: from BN6PR1201MB2482.namprd12.prod.outlook.com (10.172.108.140) by
	BN6PR1201MB0017.namprd12.prod.outlook.com (10.174.113.148) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2686.29; Fri, 7 Feb 2020 15:08:52 +0000
Received: from BN6PR1201MB2482.namprd12.prod.outlook.com
	([fe80::b9c1:6c94:2b61:5290]) by
	BN6PR1201MB2482.namprd12.prod.outlook.com
	([fe80::b9c1:6c94:2b61:5290%11]) with mapi id 15.20.2707.024;
	Fri, 7 Feb 2020 15:08:52 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Cache unihash ... doesn't match BB_UNIHASH ...
Thread-Index: AQHV3Y7yppMxqsfL50SQ0gLLoMQb+qgPZvSAgABkhGCAAAmeAIAAACpg
Date: Fri, 7 Feb 2020 15:08:52 +0000
Message-ID: <BN6PR1201MB2482E2CC1B03F12D77E33B538B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
	<BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
	<6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
In-Reply-To: <6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78eca917-14bc-4b66-8de0-08d7abdfa4a0
x-ms-traffictypediagnostic: BN6PR1201MB0017:
x-microsoft-antispam-prvs: <BN6PR1201MB0017DA1425B4FA459F28D2978B1C0@BN6PR1201MB0017.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(39860400002)(136003)(376002)(346002)(199004)(189003)(29502001)(316002)(5660300002)(7696005)(110136005)(64756008)(66446008)(4326008)(66556008)(81156014)(8676002)(81166006)(66476007)(66946007)(55016002)(9686003)(76116006)(478600001)(2906002)(186003)(6506007)(8936002)(26005)(86362001)(52536014)(71200400001)(4744005)(33656002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0017;
	H:BN6PR1201MB2482.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c74x4PVBuDTlqa6lCKPQPAVQz+f9Hroq98pow8TBh1SjqTxrQZAELD8NnYoPXKYDRSxszIQLSCZNxpEa4gfBXc+ZTdznmBR4HTn3ZCj3JUdE3FrwRJOAF3MadoRCfSIdS7fybz5Stkgi1Y/kHlEMevas6Ee9fhdxxDx+XGUpfcN/4COheHVpdhRXlr43dNlBPARmmz1Uoj0yZpb6J8snosZpc3TAhmDE4c3jxWVHvnLbEk2Vy2yGgHqQNrQg/iPshIdgqU4wlga1a32Fgj3drGdT+2OsYjWPlwy7p1iPb/s1FKkUqCYl2I5jlzSevWiuhGOL69+hLYO6fBeLX/Y/a2J4KxePg8ctJ3xm0c8/nT05gsjrtI+PWMVMeZYP2otVNz3PiK7QvoWflRALLV95k42sp4Tod/kODbRLT/MlyhivLF6MYarAQSzCcjLpFT2bUKjqlvgrP7s3Ms8kEBe0e7ywWLFELKcd3xw6WoGAY1pFGA5NntDq7HBlYtKvuPXq
x-ms-exchange-antispam-messagedata: mz2txBMcuqH0Qy0Rvjsbrx/Z6Qh+KxAWrgj7knElj2ECQ0xrS0Bv1drg4m87+bKLk2d8YzJll2tljj6dMwvDun91GS2Pdd7G+eJYUPHAWMq1KkJqMYEXbQ7oRz2c0fgXp1fh/Yjs/KG/iulgzTZGpA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78eca917-14bc-4b66-8de0-08d7abdfa4a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 15:08:52.2897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igQoq/6JRiWUkEoINglor20/cy+/rRz5yZH6DGI2vyLwnEwVwIRYeVztlq92TcjjQLacnHZF8hxTrDcvaENosNKR2WjHv1LtLnD0b1E/fcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0017
Subject: Re: Cache unihash ... doesn't match BB_UNIHASH ...
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
X-List-Received-Date: Fri, 07 Feb 2020 15:08:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IEFuZWNkb3RhbGx5LCB3ZSBhcmUgcnVubmluZyBaZXVzIGZvciBuaWdodGx5IGJ1aWxkcyB3
aXRoIHRocmVlDQo+ID4gbXVsdGljb25maWdzLiBJIGNoZXJyeS1waWNrZWQgeW91ciAiYml0YmFr
ZTogZml4MiIgYW5kICJiaXRiYWtlOg0KPiA+IGZpeHVwIiBwYXRjaGVzIGFuZCBoYXZlbid0IHNl
ZW4gYW55IG9mIHRoZSBCQl9VTklIQVNIIGVycm9ycyBzaW5jZS4NCj4gPiBHcmFudGVkIGl0J3Mg
b25seSBiZWVuIGEgd2Vlay4gQnV0IGJlZm9yZSB0aGF0LCBoYXNoIGVxdWl2ICsNCj4gPiBtdWx0
aWNvbmZpZyB3YXMgdW51c2FibGUgZHVlIHRvIHRoZSBCQl9VTklIQVNIIGVycm9ycy4NCj4gDQo+
IFRoYXQgaXMgYSByZWFsbHkgaGVscGZ1bCBkYXRhIHBvaW50LCB0aGFua3MuIEkgc2hvdWxkIHBy
b2JhYmx5IGNsZWFuIHVwDQo+IHRob3NlIGJpdGJha2UgcGF0Y2hlcyBhbmQgZ2V0IHRoZW0gbWVy
Z2VkIHRoZW4sIEkgY291bGRuJ3QgZGVjaWRlIGlmDQo+IHRoZXkgd2VyZSByaWdodCBvciBub3Qu
Li4NCg0KU3VyZSB0aGluZyEgSSBzaG91bGQgbm90ZSwgSSBkaWQgZGVsZXRlIG15IGhhc2hzZXJ2
LmRiIChvbiB0aGUgaGFzaCBlcXVpdiBzZXJ2ZXIpIG91dCBvZiBjYXV0aW9uIGFmdGVyIGFwcGx5
aW5nIHRob3NlIHBhdGNoZXMuIA0KDQpDaHJpcyANCg==

