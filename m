Return-Path: <chris.laplante@agilent.com>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680086.outbound.protection.outlook.com [40.107.68.86])
	by mail.openembedded.org (Postfix) with ESMTP id A3F3E7D6B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KNE/RL9vz5M35hcCcRs8eqJF0bJnYJUswQuJGQUlqTAtDNELGS6zsXZYByRtHH05VFRiLP58YCUo0yMU4TSAZnLciHO7sRChgYUeY5/gedrOs834s+/aKRGB6ZnIToqy2zckn+zTQD3C0yagFASby/zl5CybPlVIlLpcJRWke18twZAWmLmPIdT0pWVChD8iNKW2hCq+YYtRCO65r2C2QZ/Zcmc7wojWXqd9yLMX0Vsv7XkjZiC89m2BWFw8T18e3ctnEc6Yitk2af2DJ9SQ6RJ2p31pVyMLdJvXXvSXO00Ks9EsWyOCVKkih9p/X4pVs8+HNW3iWkihNaHoo4paUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hyr6xd7cSXIUTH5v4+bRRGZWAJvEBcmWakA7Zt5ki08=;
	b=CHz6rxAr4nn1uhE/8wGOy0a6djoeRtNLlAGwrck97ftHvc78xoEnjzcy/Oj6FWGVaFEIIFA7DvUJErvzDTGC3r+icZ0NDB+B9ygINUJ9z2XFDdQwLvqUQECu3rX3+Ba6xFfGyL+9FdJeE/yQXnugY3Q4mue07Zn69bP3T3Md+en3VPYJ1UTu5uYtZd9WvSUzJsi7s2W8HHHkFr64ru+KXrUbyyYSaw/Mk/T3toNfJ2V7VzufD5KLjhrXiOPVnUT70FmeLBIpysXj51yG04eBtATAiTjxcKvkadPRsadzgQpIq8IUjFgAR47KubaZlzchOM4gLScgYsi8LZKI670xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hyr6xd7cSXIUTH5v4+bRRGZWAJvEBcmWakA7Zt5ki08=;
	b=Y+tJCtWi0rKdpHggDV16PlqLgXIPYJMTT01hjZYnhgpAeD2GiJLj4IDEq5Trj+dVpReINa4e99krHGS/6spO8wLPQDTD5CpmIGgOUFgqy54hJq/4JN8iIdoKuYIhOGWHDxPcYLy7cKLpoWKfErVAmmJQ6b9YZ8bU2ZeIMQTJm0g=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1733.namprd12.prod.outlook.com (10.175.60.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.24; Fri, 24 Jan 2020 15:44:35 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2644.028;
	Fri, 24 Jan 2020 15:44:35 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Pascal Huerst <pascal.huerst@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Looking for a way to build latest tagged releases in
	recipes
Thread-Index: AQHVxtrVLP5ZK3dnBEaFuu03GmqUsqfiOsqAgAACogCAADZ9MIAJtE3AgADWm4CAAJUykIAAMtbwgAxFRYA=
Date: Fri, 24 Jan 2020 15:44:35 +0000
Message-ID: <CY4PR12MB1653F780C4593C2489E775128B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
	<d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
	<a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
	<CY4PR12MB1653B76238099F8FD42B7F228B350@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB16537AE4F18230211893EAFB8B370@CY4PR12MB1653.namprd12.prod.outlook.com>
	<5635f310-c6a0-1f4a-9fb9-05ac4813fdc1@gmail.com>
	<CY4PR12MB1653056C46459CD414FA9C578B360@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB165360D26B46F6A7220313238B360@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB165360D26B46F6A7220313238B360@CY4PR12MB1653.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c708c7b6-dd5e-4edd-66a8-08d7a0e4506c
x-ms-traffictypediagnostic: CY4PR12MB1733:
x-microsoft-antispam-prvs: <CY4PR12MB17339618BF8CF0E8D86ABDB48B0E0@CY4PR12MB1733.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(346002)(39860400002)(136003)(376002)(189003)(29502001)(199004)(4326008)(5660300002)(33656002)(71200400001)(52536014)(86362001)(7696005)(76116006)(66946007)(2906002)(66476007)(66556008)(66446008)(186003)(64756008)(6506007)(8936002)(316002)(26005)(110136005)(53546011)(9686003)(81156014)(55016002)(478600001)(8676002)(81166006)(43043002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1733;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K65AxIIwcHroxHp77NNjpsJ4uYJQqH/Yyd2myQ2S1UjLX4Xg3tWfa/ShKEZqDSJGGcPEnsrjjJKFyTC+usfNjJXHUH0bH/hycM/togSV48sNo46ZNQrrXxV809bjpB0MQcK7Q9qTlXLOKDi0L5Jyhm0Y1e/5A2dkZf65lnD7UjJqnVfSeky74/tpL8N+jIUpsSKnQSgPRmQJsPK2S+I69K80/OrGyJsT6LEx4JDUOl3m5H0lTdMaz8JQiC5GN3U6ACLu1IqDy+pcqHGg1SdDoRSFkdXwhn2LEq/gtQmveK2kTNaeXcLcYloLoW8NeqRhN7ajjMGZv55N/aXLbIHYGlPn/XXU9OFZ7qL3A21oKhq4UjmDtRNAQ5aetr1BOEiomZZewRsSj6icerhV1vRq/qBUZT7cBrpM8z3GA8fnatt2oOTBZg/s3n8y3MZKTKGxGyANi4S3IJ/nsJJC3QntTXhoxyyzRR07aW3Xiae6KKoF87Me0XrVTYpxt6KcEc4q86Sty0/cUR4YkYnUlgS0tA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c708c7b6-dd5e-4edd-66a8-08d7a0e4506c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 15:44:35.7344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHRzPnyZTYyfLMx3NjBNYULQgy30O8abZjiU5H/pJc0Aq927rL1FCSK0ZrAEBqlqnEyHAbrIuXp+JxADrugvk9IEzvE4EuMK6K6+oqN5J4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1733
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Fri, 24 Jan 2020 15:44:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBGcm9tOiBMQVBMQU5URSxDSFJJUyAoQWdpbGVudCBVU0EpDQo+IFNlbnQ6IFRodXJzZGF5LCBK
YW51YXJ5IDE2LCAyMDIwIDM6MjEgUE0NCj4gVG86IFBhc2NhbCBIdWVyc3QgPHBhc2NhbC5odWVy
c3RAZ21haWwuY29tPjsgUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBDYzogUmljaCBQZXJzYXVkIDxwZXJzYXVyQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtP
RS1jb3JlXSBMb29raW5nIGZvciBhIHdheSB0byBidWlsZCBsYXRlc3QgdGFnZ2VkIHJlbGVhc2Vz
IGluIHJlY2lwZXMNCj4gDQo+ID4gVE9ETzoNCj4gPg0KPiA+ICogUmlnaHQgbm93LCB0aGUgY2xh
c3MgdHJpZ2dlcnMgYSBiYXNlIGVudmlyb25tZW50IGNoYW5nZSBldmVyeSB0aW1lLCB3aGljaCBt
ZWFucyBCaXRCYWtlIGFsd2F5cyByZXBhcnNlcyBldmVyeSByZWNpcGUuIEkgZ3Vlc3MNCj4gdGhp
cw0KPiA+IGlzIGJlY2F1c2UgSSdtIG1vZGlmeWluZyB0aGUgZGF0YXN0b3JlIHdoZW4gSSBnZXQg
YmIuZXZlbnQuQ29uZmlnUGFyc2VkIGFuZCBiYi5ldmVudC5NdWx0aUNvbmZpZ1BhcnNlZCwgaW4g
b3JkZXIgdG8gZW5zdXJlDQo+ID4gUkVWUkVDT1JEX0RBVEVUSU1FIGlzIHRoZSBzYW1lIGFjcm9z
cyBhbGwgY29uZmlndXJhdGlvbnMgd2hlbiBtdWx0aWNvbmZpZyBpcyBhY3RpdmUuIFBlcmhhcHMg
dGhlcmUgaXMgYSBtb3JlIGVsZWdhbnQgd2F5IHRvIGRvDQo+ID4gdGhpcyB0aGF0IHdvbid0IHRy
aWdnZXIgdGhlIGVudmlyb25tZW50IGNoYW5nZT8gVG8gYmUgZmFpciBJIHRoaW5rIGluIG1vc3Qg
Y2FzZXMgeW91IHdvbid0IGNhcmUsIHNpbmNlIEkgZXhwZWN0IHRoaXMgY2xhc3MgdG8gbWFpbmx5
IGJlDQo+ID4gdXNlZCBpbiBhIGNvbnRpbnVvdXMgaW50ZWdyYXRpb24gZW52aXJvbm1lbnQgd2hl
cmUgeW91J2xsIGJlIGRvaW5nIGEgY2xlYW4gYnVpbGQgYW5kIGhhdmluZyB0byByZXBhcnNlIGV2
ZXJ5dGhpbmcgYW55d2F5LiBCdXQgSQ0KPiA+IGNvdWxkIGFsc28gc2VlIHRoaXMgY2xhc3MgYSB1
c2VmdWwgdG8gdGhpbmcgdG8gYWx3YXlzIGhhdmUgZW5hYmxlZCwgZXZlbiBmb3IgcGVyc29uYWwg
YnVpbGRzLCBhbmQgaW4gdGhhdCBjYXNlIG9idmlvdXNseSBJJ2Qgd2FudCB0byBmaXgNCj4gPiB0
aGlzIGlzc3VlLg0KPiA+ICogV2hlbiBtdWx0aWNvbmZpZyBpcyBhY3RpdmUsIEkgd291bGQgYWxz
byBsaWtlIGEgImdsb2JhbCIgcmV2cy5pbmMgdG8gYmUgZ2VuZXJhdGVkLCB3aGljaCBpcyB0aGUg
cHJvZHVjdCBvZiBhZ2dyZWdhdGVkIHRoZSAicmV2cy5pbmMiDQo+IGZvcg0KPiA+IGFsbCB0aGUg
bXVsdGljb25maWdzLiBTdGlsbCBuZWVkIHRvIHRoaW5rIGFib3V0IGhvdyBleGFjdGx5IHRoaXMg
d2lsbCB3b3JrIGluIHRoZSBmYWNlIG9mIGNvbmZsaWN0aW5nIFNSQ1JFVnMuDQo+ID4gKiBXZSBo
YXZlIGEgdXNlIGNhc2UgZm9yIEpTT04gZm9ybWF0IGRhdGEgYXMgd2VsbCAoInJldnMuanNvbiIp
IC0gSSdsbCBhZGQgdGhhdCB0b28uDQo+ID4gKiBQb3NzaWJseSBhIHNtYWxsIHRpbmZvaWwgc2Ny
aXB0IHRoYXQgc2ltcGx5IGF1dG9tYXRlcyB0aGUgdGFzayBvZiBJTkhFUklUJ2luZyB0aGlzIGNs
YXNzLCBwYXJzaW5nIGFsbCB0aGUgcmVjaXBlcywgYW5kIHRoZW4gZHVtcGluZw0KPiA+IHJldnMu
aW5jLg0KPiANCg0KSSBkaWQgc29tZSB0aGlua2luZyBhYm91dCB0aGUgc2Vjb25kIFRPRE8gaXRl
bSBJIGhhZCBhbmQgSSd2ZSBkZWNpZGUgdGhhdCBpdCBpcyB1bm5lY2Vzc2FyeS4gT25lIHJldnMu
aW5jIGZvciBlYWNoIG11bHRpY29uZmlnIGlzIGZpbmUuIFRvIHVzZSB0aGVtIHRvIHJlcHJvZHVj
ZSBhIGJ1aWxkLCB5b3Ugc2ltcGx5IGR1bXAgdGhlIGNvbnRlbnRzIG9mIGVhY2ggcmV2cy5pbmMg
aW50byB0aGUgY29ycmVzcG9uZGluZyBtdWx0aWNvbmZpZyBjb25mIChvciBsb2NhbC5jb25mIGZv
ciAiZGVmYXVsdCIpLiBBbnkgYWxnb3JpdGhtIEkgdHJ5IHRvIGNvbWUgdXAgd2l0aCB0byBjb21i
aW5lIHRoZW0gYWxsIGludG8gYSBzaW5nbGUgZmlsZSAoZm9yIGxvY2FsLmNvbmYpIGlzIGJvdW5k
IHRvIGJlIHdyb25nIGluIHNvbWUgd2F5Lg0KDQpUaGUgdGhpcmQgVE9ETyBpcyBhbHNvIGRvbmUu
IFRoZSBvbmx5IFRPRE8gcmVtYWluaW5nIGlzICM0LCBhIHRpbmZvaWwgd3JhcHBlciwgYnV0IHNv
IGZhciBJIGRvbid0IHNlZSBhIG5lZWQuIA0KDQpDaHJpcw0K

