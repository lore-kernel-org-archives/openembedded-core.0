Return-Path: <chris.laplante@agilent.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
	by mail.openembedded.org (Postfix) with ESMTP id E5C54608DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 16:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=cLRYl/nmZDiAxgZMX73TkEgk8RBfsuBJG3vhUfHIIzRrTd4O2Fe3rRUVchYjZKXsx0L1eQBHQLAl42axcMfjxpckTiKb38zGucE9lBj10QJzSji/sX8bpG4HVuKaedEdtkBMo+2UY8dTAhk1Sb23FAPvCxvoptsERsG5C4MsS06FZPM6temUKh0orvjfNe0prT6OW+qctvPBTCdN0lYk06F1WWT9o1pwqt/UC8hbtr3tk1WXhlqYzgS5eSAl7cAT5TPdykrK2xHojgAnc/5XUZDfSZ9pJo/9KsgQT0COrauh8W/0rlMncjo59lRS7OnIrAK4k5CQmJExCeoL5SVWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/PbbLWHvV6djtNcJWJ4oirR/18VV86I9uL0YyWgYcYo=;
	b=U3TiEMIQK+q65YCb8+HvpuJGbUzJ6A137/lJzs4XYp0uNTchYdGts54K7OyvSJI9ISQTjiB6owvx+HapAUWic8nbqd5Ll3I1FNkbRU8PTxw7GTCcqvuOIhrWKy9XygxdimsW+uNClOrkPfGomXuG7knPJBn+B/SgUXPEAkWV3L+hDGAh3a2TPFA0DuCRL+dJb0HhOu/uEIRBlD6Cw4FJ72NO+EhYk5PKDSvkFxDXHvoKIsWknFoXb0nr2e3oDO6ZO+V/Wa/YdKguvoJtF257Q6rrVkuPCBNg4eqjojcWPD5ntMtEiaYzNgq1CyldPOJOGiW95ScQmaMdo6v/rvtR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/PbbLWHvV6djtNcJWJ4oirR/18VV86I9uL0YyWgYcYo=;
	b=Q3zlRSl9uZQl6TN3Fd78V9kWUo9i2grofEiRgGV6Mbph0bxnL2WEYYFsGrf2PoEkCnQ+R0NK4TpYOi4jl5sokph74LFAkoRsD5p6TRSIo5T4tEzFd5r14aiOHFwbWg5IofP8GTUfU8Ng2huQDJ5kC0RBdMKY7TtDBWJ6lEFbvqs=
Received: from BN6PR1201MB2482.namprd12.prod.outlook.com (10.172.108.140) by
	BN6PR1201MB0113.namprd12.prod.outlook.com (10.174.114.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.24; Wed, 12 Feb 2020 16:51:18 +0000
Received: from BN6PR1201MB2482.namprd12.prod.outlook.com
	([fe80::b9c1:6c94:2b61:5290]) by
	BN6PR1201MB2482.namprd12.prod.outlook.com
	([fe80::b9c1:6c94:2b61:5290%11]) with mapi id 15.20.2707.030;
	Wed, 12 Feb 2020 16:51:17 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Joshua Watt <jpewhacker@gmail.com>
Thread-Topic: [OE-core] Cache unihash ... doesn't match BB_UNIHASH ...
Thread-Index: AQHV3Y7yppMxqsfL50SQ0gLLoMQb+qgPZvSAgABkhGCAAAmeAIAACsOAgAISmdCAASDJAIAEuq2g
Date: Wed, 12 Feb 2020 16:51:17 +0000
Message-ID: <BN6PR1201MB2482BB5FBC50F4233211BDFB8B1B0@BN6PR1201MB2482.namprd12.prod.outlook.com>
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
	<BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
	<6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
	<CAO5Uq5T1k-ZMZwpsDOeE+aQOJMBZ0PQSzC1jeS+iw=20bxyogA@mail.gmail.com>
	<BN6PR1201MB248219E5E090A8B5691CCB098B1E0@BN6PR1201MB2482.namprd12.prod.outlook.com>
	<CAJdd5GZ7De+yGrCitp4rcPQs+suZdHS+7N4c9N1gdG-6V-deZA@mail.gmail.com>
In-Reply-To: <CAJdd5GZ7De+yGrCitp4rcPQs+suZdHS+7N4c9N1gdG-6V-deZA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 562dc588-e6ea-4edd-a6ed-08d7afdbc7b2
x-ms-traffictypediagnostic: BN6PR1201MB0113:
x-microsoft-antispam-prvs: <BN6PR1201MB0113B0A20A84EC0CA063504F8B1B0@BN6PR1201MB0113.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(39860400002)(376002)(346002)(136003)(189003)(29502001)(199004)(71200400001)(9686003)(86362001)(54906003)(2906002)(33656002)(66946007)(55016002)(52536014)(316002)(26005)(64756008)(4326008)(66446008)(7696005)(478600001)(6916009)(8936002)(5660300002)(186003)(66556008)(66476007)(81166006)(81156014)(6506007)(8676002)(76116006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0113;
	H:BN6PR1201MB2482.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IDtoHdNRMtenWm9gSdzn3X3v7XsEUwvoaht9Mo2tuwDM2bMXOx3e1riagdKn7Q9KWlo+Ra+bUGfQqSMPdlU3v+CZCrnD1tFo5nKGsRTiwXvmHCA5uSOZXiAy6RC5D6qYXeoacu9qe1t49pWIFmBhxgg//cWJeM22Znw+tjhnA5Xufj1Q43XmWLNWFXnkkieF/EY7HwqSWqkIZauepWRq+ckekWPRpDErFg3gKzKVchnaHzzs2tkN5+vrVP/Bs9vN2GgHI9Oe3M1hb9/ZaUdM9UDHZjrGs5D3+rnKRevUK21P2IBt5TlVaOW5IyeVIaJUGiQJOzP+ZLANhMz+3PUDLYuRtuojbZk7+u2ZYAjThPPvEPWt0EMlShY5M1xKtL3CVKDddiS+WTljqWA2bzOSGy827yFrQA1GPxKbjsw1hGSiADHneqXTMLkIWQu86HfX9iSTaxtL9ZZe/uwntJxVPBvt5aEzs231lpDb/YqBqpWrdrj/Dfktvf7XAOv4MyDV
x-ms-exchange-antispam-messagedata: XGQiduLPwHqt19BZmZvmTjY3cUCzHUU5Paw50kdZcxwgvyiMyeihgL++X9XHofS/7mQL6JHEJNA90pwC3tfGTCGYGC2CkY3uN9aJLfWo6BLxACbk9YbuhJI26MG636t5+4NyisU7+EbFvPxNix1URw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562dc588-e6ea-4edd-a6ed-08d7afdbc7b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 16:51:17.7218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2G+hq83gIdUt+huBwzA36jU0A/sG1mAR83OdVCyDly3GvwLsknxX0W/9uDxC6zI04XtdMVkjKvnc+wKMuj6HTljEawcQ/tksnFkJ2XFMDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0113
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 12 Feb 2020 16:51:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBPbmUgaXMgb2NjYXNpb25hbGx5IEkgZ2V0IGEgbG90IG9mIHVuZGV0ZXJtaW5pc3RpYyBtZXRh
ZGF0YSBlcnJvcnMgd2hlbiBCQl9DQUNIRV9QT0xJQ1kgPSAiY2FjaGUiLCBtdWx0aWNvbmZpZywg
YW5kIGhhc2ggZXF1aXYgYXJlDQo+IGVuYWJsZWQuIFRoZSBlcnJvcnMgYXJlIGFsbCBvbiByZWNp
cGVzIGZvciB3aGljaCBTUkNSRVYgPSAiJHtBVVRPUkVWfSIuIEl0IGRvZXNuJ3QgYWx3YXlzIGhh
cHBlbi4gQnV0IGl0IGRpZCBqdXN0IG5vdyB3aGVuIEkgcmViYXNlZA0KPiBvdXIgInpldXMtbW9k
aWZpZWQiIGJyYW5jaCBvbnRvIHRoZSB1cHN0cmVhbSAiemV1cyIgYnJhbmNoLCB0byBnZXQgdGhl
IGNoYW5nZXMgc3RhcnRpbmcgd2l0aA0KPiA3ZGM3MmZkZTZlZGViNWQ2YWM2YjM4MzI1MzA5OThh
ZmVlYTY3Y2JjLg0KPiANCj4gVHdvIGlzIHRoYXQsIHNvbWV0aW1lcyAiSW5pdGlhbGl6aW5nIHRh
c2tzIiBzdGFnZSBhcHBlYXJzIHN0dWNrIGF0IDQ0JSBmb3IgYSBjb3VwbGUgbWludXRlcy4gSSB0
cmFjZWQgaXQgZG93biB0byB0aGlzIGNvZGUgaW4NCj4gcnVucXVldWUucHkgKGxpbmUgMTE2OCBv
biB6ZXVzKToNCj4gDQo+IMKgIMKgIMKgIMKgICMgSXRlcmF0ZSBvdmVyIHRoZSB0YXNrIGxpc3Qg
YW5kIGNhbGwgaW50byB0aGUgc2lnZ2VuIGNvZGUNCj4gwqAgwqAgwqAgwqAgZGVhbHR3aXRoID0g
c2V0KCkNCj4gwqAgwqAgwqAgwqAgdG9kZWFsID0gc2V0KHNlbGYucnVudGFza2VudHJpZXMpDQo+
IMKgIMKgIMKgIMKgIHdoaWxlIGxlbih0b2RlYWwpID4gMDoNCj4gwqAgwqAgwqAgwqAgwqAgwqAg
Zm9yIHRpZCBpbiB0b2RlYWwuY29weSgpOg0KPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiBs
ZW4oc2VsZi5ydW50YXNrZW50cmllc1t0aWRdLmRlcGVuZHMgLSBkZWFsdHdpdGgpID09IDA6DQo+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRlYWx0d2l0aC5hZGQodGlkKQ0KPiDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0b2RlYWwucmVtb3ZlKHRpZCkNCj4gwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgc2VsZi5wcmVwYXJlX3Rhc2tfaGFzaCh0aWQpDQo+IA0KPiBX
aGVuIEkgaW5zdHJ1bWVudCB0aGUgbG9vcCB0byBwcmludCBvdXQgdGhlIHNpemUgb2YgInRvZGVh
bCIsIEkgc2VlIGl0IGRlY3JlYXNlIHZlcnkgc2xvd2x5LCBzb21ldGltZXMgb25seSBhIGNvdXBs
ZSBhdCBhIHRpbWUuIEknbQ0KPiBndWVzc2luZyB0aGlzIGlzIGJlY2F1c2UgcHJlcGFyZV90YXNr
X2hhc2ggaXMgY29udGFjdGluZyB0aGUgaGFzaCBlcXVpdiBzZXJ2ZXIsIGluIGEgc2VyaWFsIG1h
bm5lciBoZXJlLiBJJ20gb3ZlciBteSB3b3JrIFZQTiB3aGljaA0KPiBtYWtlcyB0aGluZ3MgZXh0
cmEgc2xvdy4gSXMgdGhlcmUgYW4gb3Bwb3J0dW5pdHkgZm9yIGJhdGNoaW5nIGhlcmU/DQo+IA0K
PiBCYXRjaGluZyBpcyBoYXJkIGJlY2F1c2UgdGhlIGhhc2hlcyB5b3UgcmVxdWVzdCBtaWdodCBk
ZXBlbmQgb24gaGFzaGVzIHByZXZpb3VzIHJlY2VpdmVkIGZyb20gdGhlIHNlcnZlci4gSXQgbWln
aHQgYmUgcG9zc2libGUgdG8NCj4gZmlndXJlIG91dCB0aGVzZSBkZXBlbmRlbmNpZXMgYW5kIHN1
Ym1pdCBtdWx0aXBsZSBiYXRjaCByZXF1ZXN0cywgYnV0IHRoaXMgd291bGQgcmVxdWlyZSBzb21l
IHdvcmsgaW4gdGhlIGNvZGUuIEFub3RoZXIgb3B0aW9uDQo+IHdvdWxkIGJlIHRvIGhhdmUgc29t
ZSBtdWx0aS1sZXZlbCBjYWNoaW5nIHNjaGVtZSB3aGVyZSB5b3UgY2FuIGhhdmUgYSBsb2NhbCBk
YXRhYmFzZSB0aGF0IG1pcnJvcnMgeW91ciBjZW50cmFsaXplZCBzZXJ2ZXIuDQo+IA0KPiBJZiB5
b3UgaGF2ZSBhbnkgaWRlYXMgb24gaG93IHRvIG1ha2UgaXQgZmFzdGVyLCB3ZSB3b3VsZCBsb3Zl
IHRvIGhlYXIgeW91ciBvcGluaW9uIDopDQoNCg0KR290Y2hhLCB1bmZvcnR1bmF0ZWx5IEkgZG9u
J3QgaGF2ZSBhbnkgaWRlYXMgcmlnaHQgbm93IDovLiBSZWdhcmRpbmcgdGhlIGZpcnN0IGlzc3Vl
LCBhbnkgaWRlYXMgdGhlcmU/DQoNClRoYW5rcywNCkNocmlzDQoNCg==

