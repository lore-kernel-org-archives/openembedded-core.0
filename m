Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.50])
 by mx.groups.io with SMTP id smtpd.web10.27933.1592253208394781607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 13:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=f9iO4LYN;
 spf=pass (domain: xevo.com, ip: 40.107.236.50, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9wd5QMvTLDqs9o75ZprQYq/v5Mg/au9oEY7Mymjl+M7BD7sc2TMvAfS0WF64k1ikA2fwsg7OaSwa+wPy1S8Nx4LnnqeBeL/IIBK45m1Q07EVMtxJhfi53591B9RwgoAZD0RmBN0DC2FublURjj4ZTxSOh+unw+4355KOeWHSHNDNuMXQ+kMvtEgU54t8xJeQRR56me6qWJ+1Ucjh/vE7211V+k50bYidZ+EELAhCUR8b6N8IyLjpO5UCYdzju25Z5YK+hwje3YUgTeHvhZzRcAuu2S+gUS+H70i0J6Yzp80HaDfXs5sKRnbE8lWEmIshJ+c2e8rJtlEth6K7BzYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caNTr9V7wuJExBAvxoZ0l2I9S5Xmo9GEftcFTj05hxg=;
 b=D9vGGbPPnrZh1ovl/Ow649L3862rSAp/ZqkMOA1gwsnJJM44S4JgTScniCNUu+bJZv4OMb8ltBZKlBYI8lcdZz/++zGzak/fk+q+qo6aoNHwFWnkXUuVvm0c6Skh2csiJY2E31ufSbEEIQSX4ouIryrB4idVNFPN10WVJCEQS8eM1Gxg6Prc3ZR4bxzly+jqxBuh6cq25rI1CD1Jh+JgOxgWDlm7uIvOxRAnjWO4zhqCrW8a0zMu4qVfl0nbogWZe3lOobh0oYvtPsm0pEd6e8iN9iVrBtzW780BCHDRSNP1J2hRV6sYtIet+K55JnE7dvdUAg500+QhX0IuPefCgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caNTr9V7wuJExBAvxoZ0l2I9S5Xmo9GEftcFTj05hxg=;
 b=f9iO4LYN+4AHYQC1Wrsrwwzpib8OJwz7M+OnUq8jlc+xMXvWstAwePV55NqvfQt3PFWzKOgoUO3l4Wx5GfCRs4d04DEfDbi29KQK2rYcQNHqfWtzsqXcs6dyhaoctKXR+3k3tFSRapnx6N6dNa8dlOrjRlO/hC4uU7gAMkRS7ec=
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MW3PR18MB3483.namprd18.prod.outlook.com (2603:10b6:303:54::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Mon, 15 Jun
 2020 20:33:26 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050%6]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 20:33:26 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Martin Kelly <mkelly@xevo.com>, Jim Broadus <jbroadus@xevo.com>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] python3 recipe PGO tests
Thread-Topic: [OE-core] python3 recipe PGO tests
Thread-Index: AQHWQQBr9DBCM++iU0S7IAPhJcbp6ajYWg4AgAFXCQA=
Date: Mon, 15 Jun 2020 20:33:26 +0000
Message-ID: <D171668B-2DD3-4650-B4F2-B17DA15F9271@xevo.com>
References: <D7692CC3-34E3-41FE-BBE5-4D5B09947C92@xevo.com>
 <bc728c163c639ffd5c0e6d8fb4c10b94417a2a8a.camel@intel.com>
In-Reply-To: <bc728c163c639ffd5c0e6d8fb4c10b94417a2a8a.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=xevo.com;
x-originating-ip: [73.83.210.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3aaebb48-5115-49bb-b8a8-08d8116b5b5f
x-ms-traffictypediagnostic: MW3PR18MB3483:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <MW3PR18MB34835430E0ACBC4EE214BB35CC9C0@MW3PR18MB3483.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qEiJCWkh4ANYI6h3ZeJ5wuAMG3/n8ZE8dA4O9R+Mb9dbwUDYi6+euTG6Hep/usjpWcasbZ8mmbADmMStCtO+aWksXG1wp60bb9OgmoU7M9dF41O0A2FSjC82M7A360CdvdVe8dB41yAGQ5W/ssgPpqSkaAq7tkwNlrF1t7OWtI60vaigt92znxmCH5V/cfK02lRTUlOgplCHru/Lio7+usVDcjtP372mBGcGxh2oz4UOL+ick/tux6ufhpLzZz1R6j2qYG1Gphm77fiwvZ0cFd9SU8RRQi32JRqHTXsRfU2RYrRGUjcNzirUKNX9xm3rYqX/TCJIJt/LM0hk/zdIYEWK1PJWA1jddwk4TUZ/wqQLmE8QlIpk5/bLc8dBr0LRCcmSs7mbmh5wbPWoaZ6xqg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39840400004)(136003)(346002)(366004)(376002)(110136005)(5660300002)(33656002)(6506007)(54906003)(53546011)(2906002)(4326008)(86362001)(8936002)(8676002)(2616005)(6512007)(83380400001)(478600001)(71200400001)(316002)(186003)(966005)(26005)(6486002)(66446008)(66476007)(36756003)(66556008)(64756008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Lf0avjLXaIBrbw0RWIorUgv/Qd070tDMCRPEXA3IJOOdHoYMMeNiz8eApvm/ZfvRsGVT8PNkoDmqSBm1cHO9nTFpya4vztmgMmRhAGM3cuoSbLf2lnxBs5wdgxEGDCnw9o0JpBuw2+2cD9m0Jzvzu7iWTmBluakw8FBhN/BmToNgooEgPPJ//PsWOCK5C16UIJyx4bv1uPszNwkLSXAwQ5uJBz8DU9mtxikvUAqMnSIDJfqrHENA4QAPb+Fhu6K+atPSWtKg99AgVs681Y46Zxx/ZY3Rz+V1Kx9xjUV6IEGqjfANwiAH6QSfS2r/N4CTfLKkVW2PZtzqKGkilDaxxQJNpAUonZWJHmCKtUTJidVLPyXY6dekP+8ptlx5Tt7vWkPwoVIaXQpl/VS/BT2s6LrRyXZ8Fm2ZbRo3hEnoRYoAokoSJJebswvX5MKqCVE3z4A6TyLsN40t/pBoatENWMUt5MAnMbn/koMVeMl+Fq8=
MIME-Version: 1.0
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aaebb48-5115-49bb-b8a8-08d8116b5b5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 20:33:26.3216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 715Zir+Uo8kf1iWOLT3KCPvubp0D2zwYDGOqbLzl66XCaGpt1iciqUKgsSqwC7uo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR18MB3483
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <762394F58B65CC4B8AFAF0398EACE810@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMTQvNi8yMCwgMTg6MDUsICJNaXR0YWwsIEFudWoiIDxhbnVqLm1pdHRhbEBpbnRlbC5jb20+
IHdyb3RlOg0KPiBPbiBGcmksIDIwMjAtMDYtMTIgYXQgMjE6MjggKzAwMDAsIFJ5YW4gUm93ZSB3
cm90ZToNCj4gPiBIZWxsbyBBbGV4LA0KPiA+DQo+ID4gSeKAmW0gaW52ZXN0aWdhdGluZyBQeXRo
b24gMyBwZXJmb3JtYW5jZSBpc3N1ZXMgb24gYSBSYXNwYmVycnkgUGkgWW9jdG8NCj4gPiBidWls
ZDsgSSBhcHByZWNpYXRlIGFueSBpbnNpZ2h0cyB5b3UgY2FuIHByb3ZpZGUgaW50byB0aGUgcHJv
YmxlbS4NCj4gPg0KPiA+IEluIG15IGludmVzdGlnYXRpb24sIEkgbm90aWNlZCB0aGF0IFBHTyB3
YXMgZGlzYWJsZWQgaW4gYWxsIGNhc2VzIGR1ZQ0KPiA+IHRvIGEgc21hbGwgYnVnLiBJIGZpeGVk
IGl0IGluIGEgcGF0Y2ggc3VibWl0dGVkIHRvIE9FLUNvcmUgKCMxMzk0NTkpLg0KPiA+IEV2ZW4g
d2hlbiBQR08gaXMgaW5kZWVkIGVuYWJsZWQsIFB5dGhvbiAzIHJ1bnMgc2lnbmlmaWNhbnRseSBz
bG93ZXINCj4gPiBvbiBZb2N0by1jb21waWxlZCBQeXRob24gMy44LjMgdGhhbiB0aGUgc2FtZSB2
ZXJzaW9uIGNvbXBpbGVkIG9uDQo+ID4gUmFzcGJpYW4uDQo+ID4NCj4gPiBJbiB5b3VyIHBhdGNo
LCAwMDAxLU1ha2VmaWxlLnByZS11c2UtcWVtdS13cmFwcGVyLXdoZW4tZ2F0aGVyaW5nLQ0KPiA+
IHByb2ZpbGUucGF0Y2gsIEkgc2VlIHRoYXQgeW91IG92ZXJyaWRlIHRoZSBkZWZhdWx0IFBST0ZJ
TEVfVEFTSywNCj4gPiB3aGljaCBkaWQgbm90IGV4cGxpY2l0bHkgc3BlY2lmeSB0ZXN0IHN1aXRl
cywgdG8gYSBjb21tYW5kIHRoYXQNCj4gPiBleHBsaWNpdGx5IHByb3ZpZGVzIHRlc3Qgc3VpdGVz
LiBIb3cgZGlkIHlvdSBkZWNpZGUgb24gdGhlc2UgdGVzdHM/DQo+ID4gVGhlIHN0YW5kYXJkIFBH
TyBjb21tYW5kIHJ1bnMgNDMgdGVzdHMsIHdoaWxlIHlvdSBzcGVjaWZ5IDcuIFdoZW4gSQ0KPiA+
IGNvbXBpbGUgUHl0aG9uIDMuOC4zIG9uIFJhc3BiaWFuLCBJIHNlZSBubyBpbnRlcnNlY3Rpb24g
YmV0d2VlbiB0aGUNCj4gPiA0MyB0ZXN0cyBydW4gYnkgZGVmYXVsdCBhbmQgdGhlIDcgeW91IHNw
ZWNpZnkuIEFkZGl0aW9uYWxseSwgdGhlDQo+ID4gZGVmYXVsdCBtb2R1bGUgZm9yIFBST0ZJTEUg
aXMgdGVzdCB3aGlsZSB5b3UgdXNlIHRlc3QucmVncnRlc3QuDQo+DQo+IFdlIHVzZWQgdG8gcnVu
IHB5YmVuY2ggYW5kIHRoZW4gc3dpdGNoZWQgdG8gcmVncnRlc3Q6DQo+DQo+IGh0dHBzOi8vZ2l0
LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5L2NvbW1pdC8/aWQ9ZDlmN2I5ZDNh
ZDQ0MTk1ZTY4YjJjMWIwOWUzZWI0MmU2MjNjOWEyMA0KPg0KPiBUaGUgUFJPRklMRV9UQVNLIHZh
bHVlIGl0IGxvb2tzIGxpa2Ugd2FzIGNoYW5nZWQgcmVjZW50bHk6DQo+DQo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9weXRob24vY3B5dGhvbi9jb21taXQvMjQwNjY3Mjk4NGU0YzFiMTg2MjllNjE1ZWRh
ZDUyOTI4YTcyZmZjYyNkaWZmLTQ1ZThiOTEwNTdmMGM1YjYwZWZjYjU5NDQxMjViNTg1DQo+DQo+
IElmIHRoZSBwZXJmb3JtYW5jZSBpcyBhY3R1YWxseSBkZWdyYWRpbmcsIG1heSBiZSB3ZSBzaG91
bGQgY2hhbmdlIGl0IHRvDQo+IHNvbWV0aGluZyBtb3JlIHVzZWZ1bC4gRG8geW91IGtub3cgbXVj
aCB0aW1lIGRvZXMgdGhlIGRlZmF1bHQgc2V0IG9mDQo+IHRhc2tzIHRha2UgdG8gcnVuIGluIHFl
bXU/DQo+DQo+IFRoYW5rcywNCj4NCj4gQW51ag0KDQpUaGFua3MgZm9yIGxvb2tpbmcgaW50byB0
aGlzLiBJdCB0b29rIG1lIGFib3V0IDIwIG1pbnV0ZXMgdG8gcnVuIHRoZSBQR08NCnRlc3RzIGFu
ZCBJIGRpZCBub3RpY2UgYSBzaWduaWZpY2FudCBpbXByb3ZlbWVudCBpbiBQeXRob24gcnVudGlt
ZS4NCkhvd2V2ZXIsIHRoYXQgaXMgY29tcGFyZWQgYWdhaW5zdCBhIG5vbi1QR08gYnVpbGQuIEkg
aGF2ZSBub3QgY29tcGFyZWQNCnRoZSBleGlzdGluZyBQR08gYXJndW1lbnRzIGFnYWluc3QgdGhl
IG5ldyB1cHN0cmVhbSBhcmd1bWVudHMuDQoNCldlJ3ZlIGNvbWUgdG8gcmVhbGl6ZSB0aGF0IG91
ciBwZXJmb3JtYW5jZSBpc3N1ZXMgYXJlIG5vdCBkdWUgdG8gUHl0aG9uLA0KYnV0IGluIGZhY3Qg
YSBtdWNoIGRlZXBlciByb290ZWQgaXNzdWUuIFNpbXBsZSBDIGNvZGUgdGFrZXMgMi0zIHRpbWVz
DQpsb25nZXIgdG8gcnVuIG9uIG91ciBpbWFnZSBiYXNlZCBvbiBtZXRhLXJhc3BiZXJyeXBpJ3Mg
cmFzcGJlcnJ5cGk0DQptYWNoaW5lIHRoYW4gc3RvY2sgUmFzcGJpYW4uDQoNCk9uIGEgc2lkZSBu
b2RlLCBpdCBzZWVtcyB0aGF0IGNQeXRob24gbm93IGV4cG9zZXMgUFJPRklMRV9UQVNLIGFzIGEN
CmNvbmZpZ3VyYXRpb24gb3B0aW9uLCBzbyB3ZSBjYW4gb3ZlcnJpZGUgdGhhdCB2YXJpYWJsZSB3
aXRoIG91cg0KZGVzaXJlZCBwcm9maWxpbmcgYXJndW1lbnRzIHJhdGhlciB0aGFuIG1vZGlmeWlu
ZyB0aGUgTWFrZWZpbGUNCmRpcmVjdGx5IHdpdGggYSBwYXRjaC4NCg0KVGhhbmtzLA0KUnlhbg0K
DQo+ID4NCj4gPiBGb3IgcmVmZXJlbmNlLCBoZXJl4oCZcyB0aGUgcmVzdWx0cyBvZiBhIHNpbXBs
ZSBDUFUtYm91bmQgdGVzdC4gVGhlc2UNCj4gPiB0ZXN0cyB3ZXJlIHJ1biBvbiB0aGUgc2FtZSBS
YXNwYmVycnkgUGkgNCB3aXRoIHNhbWUgU0QgY2FyZC4NCj4gPg0KPiA+IHB5dGhvbjMgLW0gdGlt
ZWl0IC1yIDEwIC0tc2V0dXAgJw0KPiA+IGRlZiBmaWIobik6DQo+ID4gIGlmIG4gPCAyOg0KPiA+
ICAgIHJldHVybiBuDQo+ID4gIGlmIG4gPT0gMjoNCj4gPiAgICByZXR1cm4gMQ0KPiA+ICByZXR1
cm4gZmliKG4gLSAxKSArIGZpYihuIC0gMikNCj4gPiAnICdbZmliKG4pIGZvciBuIGluIHJhbmdl
KDIwKV0nDQo+ID4NCj4gPiAjIFlvY3RvIFB5dGhvbiAzLjguMw0KPiA+ICMgMTAgbG9vcHMsIGJl
c3Qgb2YgMTA6IDI4LjkgbXNlYyBwZXIgbG9vcA0KPiA+ICMgMTAgbG9vcHMsIGJlc3Qgb2YgMTA6
IDI5LjMgbXNlYyBwZXIgbG9vcA0KPiA+ICMgMTAgbG9vcHMsIGJlc3Qgb2YgMTA6IDI3LjkgbXNl
YyBwZXIgbG9vcA0KPiA+ICMgMTAgbG9vcHMsIGJlc3Qgb2YgMTA6IDMwLjQgbXNlYyBwZXIgbG9v
cA0KPiA+ICMgQXZlcmFnZSByZXN1bHQ6IDMxLjYyNSBtc2VjIHBlciBsb29wDQo+ID4NCj4gPiAj
IFJhc3BiaWFuIFB5dGhvbiAzLjguMw0KPiA+ICMgNTAgbG9vcHMsIGJlc3Qgb2YgMTA6IDcuNzMg
bXNlYyBwZXIgbG9vcA0KPiA+ICMgNTAgbG9vcHMsIGJlc3Qgb2YgMTA6IDcuNzIgbXNlYyBwZXIg
bG9vcA0KPiA+ICMgNTAgbG9vcHMsIGJlc3Qgb2YgMTA6IDcuNjcgbXNlYyBwZXIgbG9vcA0KPiA+
ICMgNTAgbG9vcHMsIGJlc3Qgb2YgMTA6IDcuNzQgbXNlYyBwZXIgbG9vcA0KPiA+ICMgQXZlcmFn
ZSByZXN1bHQ6IDcuNzE1IG1zZWMgcGVyIGxvb3ANCj4gPg0KPiA+ICMgUmFzcGJpYW4gc3BlZWR1
cDogNC4wOXgNCj4gPg0KPiA+IEJlc3QsDQo+ID4gUnlhbiBSb3dlDQo+ID4gDQoNCg==
