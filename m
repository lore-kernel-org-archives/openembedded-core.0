Return-Path: <chris.laplante@agilent.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	by mail.openembedded.org (Postfix) with ESMTP id 23B047F6DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 17:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=GsZyePubYRB+Yi4ruEf3e6bJLeZTqo1WQFdg1QKX9QMhx7K6KstlmY8AANynfFOsQdxwgQgS6UL/sSCBD+l6nUgNJ2l3nB2RxlePKzlyr8Yr7gA8vhFhOOHkSh08+7HsiFb14oDmEgGrFHCTCT50zhMxDwlSIOIpv2x5B5nI33PmBdvbQxIhWwQZBUrMJMA+KVJJkUhw6KrTArwIIfzL2z/NCkHGnTO0UZp6nxzGaUOlmtdCKOSt/R9CknveumXk/KXUjmInSgAK2xuXSrcOm0czC9W/5EaQHyqUG2WggWVFLIQVRO/0gYCmPQ7seLRJS+r5yWZL89mBa2/7/O7B1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2eJU6Yj8+vvkC8giOLkqhmw8IBtTmLumpW6WxBEKXmg=;
	b=PPaOX9nF+nfBwjDjSayxbH3X7dMV0zYgaRSPDOLXEKVX7xIEhoJiRnxRik3KjPFbaEX9QuHgTRxmgZtrvYkr+mSe8iCIuNt7uKTAGB/uAQ4hBgzslepOy2P9Etu31mjwUoSGsXiErA/1Jlduh45UYMFke2HbNAuVrnCaIjv/I7yijke/xCf4KZMeABclplkRANemN8M9Lr7ZRjp8lJrxFLBYFZ4s1Cqs1a0stvILzi2nT32LJL6O8ujYqZdsZp24a9Cy5lLmKE5e6GeglR0pzxyiVKcN8caXK7kO/r/oNDoakeuFC2Vn2WjRSLVSXgpGzaac8RN6QicgQDB2e/cCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2eJU6Yj8+vvkC8giOLkqhmw8IBtTmLumpW6WxBEKXmg=;
	b=J+gEUEaDsVGNSlONPKo1LUSEqp6DGDEGl84lVL+cpOOhHVkjPa/J9Pt3aYwJ/aux89wB/0q+lhfalZ/UlKrYiJJsYoXu6NNo1rghERYCO7PzPLnj6TbTYWZbksu3XIXiF1+bK6gSugRGW2qxxH7xEtuPctBQw091vaOuQjlAvcs=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1910.namprd12.prod.outlook.com (10.175.82.11) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2623.9; Thu, 16 Jan 2020 17:42:13 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2623.018;
	Thu, 16 Jan 2020 17:42:13 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Pascal Huerst <pascal.huerst@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Looking for a way to build latest tagged releases in
	recipes
Thread-Index: AQHVxtrVLP5ZK3dnBEaFuu03GmqUsqfiOsqAgAACogCAADZ9MIAJtE3AgADWm4CAAJUykA==
Date: Thu, 16 Jan 2020 17:42:13 +0000
Message-ID: <CY4PR12MB1653056C46459CD414FA9C578B360@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
	<d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
	<a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
	<CY4PR12MB1653B76238099F8FD42B7F228B350@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB16537AE4F18230211893EAFB8B370@CY4PR12MB1653.namprd12.prod.outlook.com>
	<5635f310-c6a0-1f4a-9fb9-05ac4813fdc1@gmail.com>
In-Reply-To: <5635f310-c6a0-1f4a-9fb9-05ac4813fdc1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11ce7030-7677-4d44-e906-08d79aab6bec
x-ms-traffictypediagnostic: CY4PR12MB1910:
x-microsoft-antispam-prvs: <CY4PR12MB19104BD43DDC16E90334293A8B360@CY4PR12MB1910.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(29502001)(189003)(5660300002)(33656002)(8936002)(81156014)(52536014)(316002)(110136005)(81166006)(8676002)(86362001)(2906002)(9686003)(55016002)(26005)(478600001)(186003)(66446008)(64756008)(66556008)(66476007)(966005)(66946007)(71200400001)(4326008)(6506007)(76116006)(7696005)(43043002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1910;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9OXZ3HKsrNyyTRY0gsGdBJRa/hKAaUna0wyxSr+7IB1PLkX3cZugOqj5r7Y786GUx/0559LpyN4tLtr4ttR71CWnUDIlUalprp70ANr52PZ4s1YnKzkfqAbswISXGAujHfLyRtxDCq+/mZPuHrj2ZrOyBjYFaaPlE+EBgPV6BXV8VmFvCIXclLohucQuS6B307a+u96Hs6tD6i7UgbryAf5DxUvDvz8ktaWyMUDoSlmry6R0vugdRNRPD/+Lt2NKHeGO0UnwNUAzoNyWBjNp7r4O/ZU4Ym275KH7pGlomU39JvhXhUg6K0kJcvXz829Xvncx73JmC5xn86stQLzRTa9yHR/rt3yhPDQAN9qsrc2+yjIyDIdz8tjThl2DxB9fDzXmGAv61cnW3DYIziagsMyLGhFFqrUK6Kx3ImoNz2iBkqilFIzdSQEl7Ioi7UQ4QgO30jFhazNIc8R4acaTa/2yfF2sFIqZgDUrv0bRcz/vVbUb/eazxYg3LH4sRAJi7H1wuZ/1hT3G6RXysvyCUHg8yHHg8UzowtsoP4BgE5Qq3pAAXLYPobiHY2nZwCDjIyK6A1vHlGrNh2JII6pj8kx9A9KeVDe3icflmMcqT74=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ce7030-7677-4d44-e906-08d79aab6bec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 17:42:13.5718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0SuWNESALlHGLhN5OmfQ65r5RWfS3gq2VNl5Q7YHkAZdmlCiq72i2aj0nkerLSXLJZ9AKjJ///t2MZ8eR7mJ5XVoUETxObxqjqteC10srTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1910
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
X-List-Received-Date: Thu, 16 Jan 2020 17:42:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IEFzIG1lbnRpb25lZCBpbiBJUkMsIGFzIEkgZ2V0IGRlZXBlciBpbnRvIGl0LCBJJ2xsIGJl
IGdvaW5nIHdpdGggYXBwcm9hY2ggIzMgYWZ0ZXIgYWxsIDovLiBIb3BlIHRvIHBvc3QgYSB0aW5m
b2lsIHNjcmlwdCBzb29uLg0KPiANCj4gVGhhdCB3b3VsZCBiZSB2ZXJ5IG11Y2ggYXBwcmVjaWF0
ZWQhDQoNCkhlcmUncyBhIHByb3RvdHlwZSBiYmNsYXNzOiBodHRwczovL2dpc3QuZ2l0aHViLmNv
bS9tb3N0dGhpbmdzd2ViLzM5ZTI0YjMyOWRlNzBjMDIxMmU1YmYyMWE0MzFlMTQzLiBQbGVhc2Ug
Z2l2ZSBpdCBhIHRyeS4NCg0KQWxsIHlvdSBuZWVkIHRvIGRvIGlzIElOSEVSSVQgaXQgaW4gbG9j
YWwuY29uZjoNCglJTkhFUklUICs9ICJyZXZyZWNvcmQiDQoNClRoZW4geW91IGNhbiBqdXN0IGRv
ICJiaXRiYWtlIC0tcGFyc2Utb25seSIgYW5kIGR1cmluZyBwYXJzaW5nIGl0IHdpbGwgY3JlYXRl
IGEgZGlyZWN0b3J5IHN0cnVjdHVyZSBpbiAke1RPUERJUn0vcmV2cyB0aGF0IGxvb2tzIHNvbWV0
aGluZyBsaWtlIHRoaXM6DQoNCnJldnMNCuKUnOKUgOKUgCAyMDIwMDExNjE3MDc1MA0K4pSCwqDC
oCDilJzilIDilIAgcmVjaXBlMQ0K4pSCwqDCoCDilILCoMKgIOKUlOKUgOKUgCByZXZzLmluYw0K
4pSCwqDCoCDilJzilIDilIAgcmVjaXBlMg0K4pSCwqDCoCDilILCoMKgIOKUlOKUgOKUgCByZXZz
LmluYw0K4pSCwqDCoCDilJzilIDilIAgcmVjaXBlMw0K4pSCwqDCoCDilILCoMKgIOKUlOKUgOKU
gCByZXZzLmluYw0K4pSCwqDCoCDilJTilIDilIAgcmV2cy5pbmMNCuKUlOKUgOKUgCBsYXRlc3Qg
LT4gMjAyMDAxMTYxNzA3NTANCg0KSXQgYWxzbyBzdXBwb3J0cyBtdWx0aWNvbmZpZy4gV2hlbiBt
dWx0aWNvbmZpZyBpcyBlbmFibGVkLCB0aGVyZSB3aWxsIGJlIGFuIGFkZGl0aW9uYWwgbGF5ZXIg
b2YgZGlyZWN0b3JpZXMgaW4gdGhlICdyZXZzJyBkaXJlY3RvcnksIG9uZSBwZXIgbXVsdGljb25m
aWcgKHBsdXMgImRlZmF1bHQiKToNCg0KcmV2cw0K4pSc4pSA4pSAIDIwMjAwMTE2MTcwNzUwDQri
lILCoMKgIOKUnOKUgOKUgCBkZWZhdWx0DQrilILCoMKgIOKUgsKgwqAg4pSc4pSA4pSAIHJlY2lw
ZTENCuKUgsKgwqAg4pSCwqDCoCDilILCoMKgIOKUlOKUgOKUgCByZXZzLmluYw0K4pSCwqDCoCDi
lILCoMKgIOKUnOKUgOKUgCByZWNpcGUyDQrilILCoMKgIOKUgsKgwqAg4pSCwqDCoCDilJTilIDi
lIAgcmV2cy5pbmMNCuKUgsKgwqAg4pSCwqDCoCDilJTilIDilIAgcmV2cy5pbmMNCuKUgsKgwqAg
4pSU4pSA4pSAIG1jMQ0K4pSCwqDCoCAgICAg4pSc4pSA4pSAIHJlY2lwZTENCuKUgsKgwqAgICAg
IOKUgsKgwqAg4pSU4pSA4pSAIHJldnMuaW5jDQrilILCoMKgICAgICDilJzilIDilIAgcmVjaXBl
Mg0K4pSCwqDCoCAgICAg4pSCwqDCoCDilJTilIDilIAgcmV2cy5pbmMNCuKUgsKgwqAgICAgIOKU
lOKUgOKUgCByZXZzLmluYw0K4pSU4pSA4pSAIGxhdGVzdCAtPiAyMDIwMDExNjE3MDc1MA0KDQoN
ClRPRE86DQoNCiogUmlnaHQgbm93LCB0aGUgY2xhc3MgdHJpZ2dlcnMgYSBiYXNlIGVudmlyb25t
ZW50IGNoYW5nZSBldmVyeSB0aW1lLCB3aGljaCBtZWFucyBCaXRCYWtlIGFsd2F5cyByZXBhcnNl
cyBldmVyeSByZWNpcGUuIEkgZ3Vlc3MgdGhpcyBpcyBiZWNhdXNlIEknbSBtb2RpZnlpbmcgdGhl
IGRhdGFzdG9yZSB3aGVuIEkgZ2V0IGJiLmV2ZW50LkNvbmZpZ1BhcnNlZCBhbmQgYmIuZXZlbnQu
TXVsdGlDb25maWdQYXJzZWQsIGluIG9yZGVyIHRvIGVuc3VyZSBSRVZSRUNPUkRfREFURVRJTUUg
aXMgdGhlIHNhbWUgYWNyb3NzIGFsbCBjb25maWd1cmF0aW9ucyB3aGVuIG11bHRpY29uZmlnIGlz
IGFjdGl2ZS4gUGVyaGFwcyB0aGVyZSBpcyBhIG1vcmUgZWxlZ2FudCB3YXkgdG8gZG8gdGhpcyB0
aGF0IHdvbid0IHRyaWdnZXIgdGhlIGVudmlyb25tZW50IGNoYW5nZT8gVG8gYmUgZmFpciBJIHRo
aW5rIGluIG1vc3QgY2FzZXMgeW91IHdvbid0IGNhcmUsIHNpbmNlIEkgZXhwZWN0IHRoaXMgY2xh
c3MgdG8gbWFpbmx5IGJlIHVzZWQgaW4gYSBjb250aW51b3VzIGludGVncmF0aW9uIGVudmlyb25t
ZW50IHdoZXJlIHlvdSdsbCBiZSBkb2luZyBhIGNsZWFuIGJ1aWxkIGFuZCBoYXZpbmcgdG8gcmVw
YXJzZSBldmVyeXRoaW5nIGFueXdheS4gQnV0IEkgY291bGQgYWxzbyBzZWUgdGhpcyBjbGFzcyBh
IHVzZWZ1bCB0byB0aGluZyB0byBhbHdheXMgaGF2ZSBlbmFibGVkLCBldmVuIGZvciBwZXJzb25h
bCBidWlsZHMsIGFuZCBpbiB0aGF0IGNhc2Ugb2J2aW91c2x5IEknZCB3YW50IHRvIGZpeCB0aGlz
IGlzc3VlLg0KKiBXaGVuIG11bHRpY29uZmlnIGlzIGFjdGl2ZSwgSSB3b3VsZCBhbHNvIGxpa2Ug
YSAiZ2xvYmFsIiByZXZzLmluYyB0byBiZSBnZW5lcmF0ZWQsIHdoaWNoIGlzIHRoZSBwcm9kdWN0
IG9mIGFnZ3JlZ2F0ZWQgdGhlICJyZXZzLmluYyIgZm9yIGFsbCB0aGUgbXVsdGljb25maWdzLiBT
dGlsbCBuZWVkIHRvIHRoaW5rIGFib3V0IGhvdyBleGFjdGx5IHRoaXMgd2lsbCB3b3JrIGluIHRo
ZSBmYWNlIG9mIGNvbmZsaWN0aW5nIFNSQ1JFVnMuIA0KKiBXZSBoYXZlIGEgdXNlIGNhc2UgZm9y
IEpTT04gZm9ybWF0IGRhdGEgYXMgd2VsbCAoInJldnMuanNvbiIpIC0gSSdsbCBhZGQgdGhhdCB0
b28uDQoqIFBvc3NpYmx5IGEgc21hbGwgdGluZm9pbCBzY3JpcHQgdGhhdCBzaW1wbHkgYXV0b21h
dGVzIHRoZSB0YXNrIG9mIElOSEVSSVQnaW5nIHRoaXMgY2xhc3MsIHBhcnNpbmcgYWxsIHRoZSBy
ZWNpcGVzLCBhbmQgdGhlbiBkdW1waW5nIHJldnMuaW5jLg0KDQoNClRoYW5rcywNCkNocmlzIA0K
DQo=

