Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.64])
 by mx.groups.io with SMTP id smtpd.web10.367.1595964294167901363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 12:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=trMMLHDa;
 spf=pass (domain: agilent.com, ip: 40.107.223.64, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ojsi25bHaM/04tz7Eex6wdiOhAZ1ek0zQQzyVegdi+DlzMINRrygTBi/qWz1jo8lKYKRA9HBdJH04jGt3iTEOIHpRkZOw5XCGCOb5AZLMcbnAQYXQ64+fjJF92sWY5dC9lleUXLcc9UirXmLej6Xs+jnj0eCHBL9u8EnTLWrSYoBgELE5Tx9ggJ51m+FExDE1b5S2kfV08UcbfmI+FRUCc1C0/8j84sfNUwM9T8AoB0j4BA55qI1QiDgiNZZLCg6m3IFsJAM15EvnaG2QmilO9o4ztopVehOSuU54HmwM39ZklPY0d/IFK30GQOhkUpcqhn1x5BzqQOiWOWgEFw2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ebBHN7N74f2PnTKAd5JPwEfDh2JmbtHUtRGn2nVIbU=;
 b=lw9DiHp/lkkMwZN3zIhL3x6Fwpd9Tk5SZ91nYTK975tEmn4oAtiTvrEEQYQ4wPTFs5eWYqQ0ECiPChJyGdCLujk8KUIkZ41fI57Rl+QYJDMFAP8Ev/21LPpvbEAACPJBFIqqYePn4GKjzA8E1YUlrqGlD6lnwv2Df1mhUQgWTAOksU1H+DIVCnGwoQ1ZlMPCG0NzRvHSCZDajt4QlcUqra/RzGLBoaYAltLnRN1eCfmreckhXbsj/xJk7say3DJ6iIp3JZxRErDXt7bKiVAPhwYEanYjJZta59v3IoD1HBSlK8PxM5GedjQSP4xV5bmyYb/8DHrh4wBo9nVmmNgyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ebBHN7N74f2PnTKAd5JPwEfDh2JmbtHUtRGn2nVIbU=;
 b=trMMLHDampwbtCQOxfJOAWNWijNgRuCBg2nXmEKtCtbu6TE1XHkqISG12EBSMBSM6Uiz9saQCor02rv7tx3KIOLVS6N49f4oXJvaI+ZlyxNqQfnkQVVTKSZJozal/L1TzJ1KDr6onR1jO4Utep0tKDF4rYFfd1LY5tQbChZj4xXmCHiyfQ8NPKjzBuRX3MP5HpJ++Xz/HAbBJnr5AhYbpFC74jYQfuYUNGqTMKgRM81I+t+YStpJ5kDrbR7170Zab7ziDUsSV534bhYlWihq88X114xszNzPBtR/MIoABZXlKsG9dhQ0yy4/gGC+vrnhAzeuuhPRs5d1xGCjn8Np7w==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SA0PR12MB4542.namprd12.prod.outlook.com (2603:10b6:806:73::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Tue, 28 Jul
 2020 19:24:53 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::4c4f:2633:b1bc:c164]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::4c4f:2633:b1bc:c164%6]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 19:24:53 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/3] Log colorizer
Thread-Topic: [OE-core] [meta-oe][PATCH 0/3] Log colorizer
Thread-Index: AQHWZH+X/5T0YEzquE+9VTefFwGSvakdJImAgAA7qCA=
Date: Tue, 28 Jul 2020 19:24:53 +0000
Message-ID: 
 <SN1PR12MB24806B088EFA95A921F22C368B730@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200728013557.111830-1-chris.laplante@agilent.com>
 <edc83a1a101292425dce9dd1c9df51d6b8db8e7a.camel@linuxfoundation.org>
In-Reply-To: 
 <edc83a1a101292425dce9dd1c9df51d6b8db8e7a.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa9bfebc-e150-45b0-725f-08d8332be76a
x-ms-traffictypediagnostic: SA0PR12MB4542:
x-microsoft-antispam-prvs: 
 <SA0PR12MB4542E8094D833296FF8B21118B730@SA0PR12MB4542.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Xdi3rSzyInKbnVbGsdaRt94dIXxet3ZY/DVL0iyEZVF4usuHk4BGEoPhfVgTk6x0yEDOhnuQv7/WCsNJk2Gw0eGN4liHejMaQHje1BxfzqgxEuiD+8bAN+HHzT0Caw6/SaG33PFprzoKI91kEnvEzulSIeDfbvyNzsM4EFOxakgM403VoUhYw+YfXh8DnqOimfREdYMia8VWC9YLIV3ZcsZlX6suhL28Y/uyW/3Xm2/AKcl8zN1Gn5OESU2jfkUZUkjHzBZa3Y+30Ir6C85Z1gdCd3SngwFvXGNveCcqHFnymE8a7At4PG8Y34HhNM4Y6xgKj/KqTE5N4uZ536ag7ta2A9EMT8Mi6eUq5Cq83BodYR+Xy1/ZF92zzJF0t7SlI8aOvOeBNQgbfbFYIkWxm4+yr+97nSrIha6wSP37eDPTQtUHUOoDPBKwjHC1NqkpQjHv1tn3s7Zkpn21jlII9Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(376002)(346002)(39860400002)(136003)(29502001)(8676002)(52536014)(33656002)(186003)(5660300002)(6506007)(26005)(71200400001)(66446008)(7696005)(86362001)(8936002)(66946007)(64756008)(966005)(66476007)(2906002)(316002)(478600001)(83380400001)(76116006)(110136005)(9686003)(55016002)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 xd4ugkl0POhBrEOJYf2wqFx71L8pqzP2vT025Mfy5ifuLwsM8O0aD6sc7yKZ4yfq0YObFoArtVlhq7gm4k8aVvZwJxiCC2qncp0fYHfgYzZjZVyWYVotZOBq4cvbHCwuE235mrTKhbGaCO2J0sAbVzQUkXFx4RZJLsvtP/hfQca/KD9kTegxdsoucrgvekDTbvV+8/3QKeBPggSOtzZKIxC08K62SVwmvTAwUvM0N0YZiSIwSD2cQNq3BUQ/dmNRiq4QeB3BdSyoDr+s40Bf1tr2jcspKfMoYzZu5INon4BLpkBcntPz8SCbkeNciNS43y3nbcuRtvkHhWSAiNrKRD1NPGmrgWCrKirEduwzKivKI8I7Z77AHlQsEDOakaKa3wR0kdHwtTOVV9tU76iRQ5kDyHZurHgkLlo7jR2ekz1W+Fd0sQ1WpHWvhNJwj5F0SEAINtIecQKoeBDREEqClFZKavIS50z1Pq01GhxXSJ8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9bfebc-e150-45b0-725f-08d8332be76a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 19:24:53.0389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jyRueeo8bI+5LqdW3LhpmmBZzr3sZF9s3EHFxY1vXP+fvunVfkULqUS2L5r+oiHiMDIRXxRPrG5xBrKWnoju/OVLeQkXBVKHCbY4xn8bXmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4542
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiBUaGlzIGxvb2tzIGludGVyZXN0aW5nLiBDb3VsZCB3ZSBhZGQgc29t
ZXRoaW5nIHRvIHRoZSBtYW51YWwgYWJvdXQgaG93IHRvDQo+IHVzZSBpdCBhbmQgbWF5YmUgYSB0
ZXN0IGZvciBpdCBhcyB3ZWxsIHBsZWFzZT8NCj4gDQo+IEkgZGlkIHdyaXRlIHNvbWV0aGluZyBz
aW1pbGFyIGluIGEgZGlmZmVyZW50IGNvbnRleHQgcmVjZW50bHkgd2hpY2ggYXBwbGllcw0KPiBo
ZXJlIG5lYXIgZW5vdWdoIGFzIHdlbGw6DQo+IA0KPiAiIiINCj4gQnkgZG9jdW1lbnRhdGlvbiwg
SSBtZWFuIHRoYXQga2VybmVsLWZpdGltYWdlLmJiY2xhc3MgaGFzIG5vIGluZm9ybWF0aW9uIGlu
DQo+IHRoZSByZWZlcmVuY2UgbWFudWFsOg0KPiANCj4gaHR0cHM6Ly93d3cueW9jdG9wcm9qZWN0
Lm9yZy9kb2NzL2xhdGVzdC9yZWYtbWFudWFsL3JlZi1tYW51YWwuaHRtbCNyZWYtDQo+IGNsYXNz
ZXMta2VybmVsLWZpdGltYWdlDQo+IA0KPiBnZW5lcmF0ZWQgZnJvbToNCj4gaHR0cDovL2dpdC55
b2N0b3Byb2plY3Qub3JnL2NnaXQuY2dpL3lvY3RvLWRvY3MvdHJlZS9kb2N1bWVudGF0aW9uL3Jl
Zi0NCj4gbWFudWFsL3JlZi1jbGFzc2VzLnhtbA0KPiANCj4gYW5kIGFsc28gdGhlcmUgaXMgYWxz
byBubyBoZWFkZXIgYXQgdGhlIHN0YXJ0IG9mIHRoZSBjbGFzcyBzYXlpbmcgd2hhdCBpdCBkb2Vz
DQo+IG9yIGhvdyB0byB1c2UgaXQuDQo+IA0KPiBDb3VsZCB3ZSBhZGQgc29tZXRoaW5nIHRvIHRo
ZXNlIGxvY2F0aW9ucyB0byBnaXZlIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQNCj4gdGhlIGNsYXNz
Pw0KPiANCj4gRm9yIHRlc3RpbmcsIGhhdmUgYSBsb29rIGF0DQo+IG1ldGEvbGliL29lcWEvc2Vs
ZnRlc3QvY2FzZXMvaW1hZ2VmZWF0dXJlcy5weS4gSXRzIHRlc3RpbmcgdGFyZ2V0IGltYWdlDQo+
IHJvb3RmcyBzZXR0aW5ncyBidXQgSSBiZWxpZXZlIHRoZSBjb25jZXB0IGlzIHNpbWlsYXIgdG8g
aG93IHlvdSdkIHRlc3QNCj4gc29tZXRoaW5nIGxpa2UgdGhlIGtlcm5lbC1maXRpbWFnZSBjbGFz
cy4NCj4gDQo+IFlvdSBjYW4gcnVuIHRoZXNlIHRlc3RzIGluZGl2aWR1YWxseSB3aXRoICJvZS1z
ZWxmdGVzdCAtciBpbWFnZWZlYXR1cmVzIiB0byBydW4NCj4gdGhhdCBmaWxlIG9yICJvZS1zZWxm
dGVzdCAtciBpbWFnZWZlYXR1cmVzLkltYWdlRmVhdHVyZXMudGVzdF9ibWFwIiBhcyBhbg0KPiBl
eGFtcGxlIG9mIGEgc3BlY2lmaWMgdGVzdC4NCj4gIiIiDQo+IA0KPiBhbHRob3VnaCB0aGVyZSBt
YXkgYmUgYSBkaWZmZXJlbnQgc2VsZnRlc3Qgd2hpY2ggd291bGQgYmUgYSBiZXR0ZXIgZXhhbXBs
ZQ0KPiB0byBiYXNlIGEgdGVzdCBvZmYgZm9yIHRoaXMgY29kZS4NCg0KWWVzIGNlcnRhaW5seSwg
SSdsbCB3b3JrIG9uIHRoZW0gYW5kIHN1Ym1pdCBhIHYyLiAgDQoNClRoYW5rcywNCkNocmlzDQo=
