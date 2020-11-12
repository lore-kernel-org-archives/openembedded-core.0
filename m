Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.131])
 by mx.groups.io with SMTP id smtpd.web09.8256.1605203600453176517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=UTtyXRwv;
 spf=pass (domain: microsoft.com, ip: 40.107.20.131, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2Ehe6w9Ap9cP0KTE+Z1xL6gRz0M5AdahfYiCuiIW1BUkUO0+LPH0TtVtQAvvKbEgsVqFczXTH+nRVdyWp3wMGccog6NlsTvSnmQevsxu+18Ev6olCAADkqfxonSOY6LIvLCk14udBFA8gTNiAHvellJ3x2kINC+whIaZjUHOE3Z21m5zmOGJ37R0zYRmBdBMtPjcRqBREtZQqCOyHGo/nvbr+sIXxqbmDlpydxxDa8vsg/8jmFdh/WUOc4Omnpq6LPufWXHHodPLZZC/FTfHjHiqMPqLH4HX9mBijqNOd95999xB3UMDaOeR2TYjeUqT/mG66v4OF38iR0Y8cLG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sYEYeGKBRIiy3nJQdCZce+tDNgdwfKaIpO1i68ySqA=;
 b=SRcc/QIEAyNexVVGZRfz1ORydCmbrFgbac64akEzTTsgNgRh0NFqti/wm5udzw/waQEu1vDb9czNeie/4+AuTRdESmfSJpwmR3UJv9WM7/urNlwz7DureXCcOqWcDzHJC3VKAYhWj6qieZfJdO2CNpw/lFUbObH3ietntz62OMXCtIOSCRGbwcntbaUmxXmO228r8AtPBDwDgrWPTQJltVuPqss01M5D4DI4z7M6aHPHK6Y4itUyDJQUI8j6hoIaZvUamTDtXyk8XhnxznXK51fuBvWf2ur7NhszQ6LWqCqx2lYNDafibMOfsgsxt2zgfflo3TsaM6MkqZjV87G4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sYEYeGKBRIiy3nJQdCZce+tDNgdwfKaIpO1i68ySqA=;
 b=UTtyXRwvGNh3IfzhXWbv9HM28n6Z1wpxdRRbRio1rb4lcAlKltCnkdtZX0zotBptj2sWX/9fZXA9p0ZNat1q9kdAimaRk7jK2GZ6z+qIdi8vcN14zCSe5SBQ+Y6h4AaBhGNDj9ysR2ddI3dtz/oB6RXim5X2V6uABElyW9fCM90=
Received: from AM5PR83MB0178.EURPRD83.prod.outlook.com (2603:10a6:206:25::31)
 by AM6PR83MB0277.EURPRD83.prod.outlook.com (2603:10a6:209:6a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.11; Thu, 12 Nov
 2020 17:53:18 +0000
Received: from AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::3983:12a4:4f34:39d]) by AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::3983:12a4:4f34:39d%4]) with mapi id 15.20.3589.012; Thu, 12 Nov 2020
 17:53:18 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH v2] dbus: split -common and -tools out of main package
Thread-Topic: [OE-core] [PATCH v2] dbus: split -common and -tools out of main
 package
Thread-Index: AQHWuRyzWv+V4VvgpkijYkJ/q1qxVQ==
Date: Thu, 12 Nov 2020 17:53:17 +0000
Message-ID: <434b42dd8366ea2d24c4bf8332c09f5e7cda45b7.camel@microsoft.com>
References: <20201102180559.1177417-1-luca.boccassi@gmail.com>
	 <20201102191848.1799747-1-luca.boccassi@gmail.com>
	 <6af65017cec256407db0319271c648275a18ff5d.camel@linuxfoundation.org>
In-Reply-To: 
 <6af65017cec256407db0319271c648275a18ff5d.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 03af8603-42e4-441d-6cf9-08d88733d641
x-ms-traffictypediagnostic: AM6PR83MB0277:
x-microsoft-antispam-prvs: 
 <AM6PR83MB027783F048FEBA2BA80528A6F1E70@AM6PR83MB0277.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CQ3RWpAx/o4PZgWR6MDJwJAXOQKogo5w/s3fIhAjhDGbyAyv7fbHOfi78WVXH2ofgxvFIaQb0oQb9ORZOaV1ljHVCDCaVW1013Ak1UavMZn84o/opy3FNCK0kEiMTnvibzvdBH6F7f5ET76Si9/e8dkCjdpMBo2kOcMV/OMwyyjZyd2pGffPhJ7C7x8oQdzLThbYflSlioV3bL2ahHqKT7eujXV5LD/BS0BJf6v6hZCKm/bB25/S3j2DEykv7OKL3QAkOdUJFts5I8YpX5LGxoqQjdIym26TIFaTO0FDGTg2Qvd9UqqzQPIPRy52uaIeV5YxBjq6kC6g+Keu0aFxwdIcmqpmwuH1JxN7lqmF5J8wsfOZGTFAlCpz52URUIJpdbmVJWfav3ShP6KFBTvTuw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR83MB0178.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(36756003)(82950400001)(6512007)(966005)(82960400001)(478600001)(8676002)(64756008)(110136005)(26005)(86362001)(4001150100001)(316002)(71200400001)(10290500003)(2616005)(76116006)(66946007)(6486002)(4326008)(5660300002)(6506007)(2906002)(66446008)(66476007)(66556008)(8936002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 47+Qw2iGgsdJkJD0mIyKphRSbLx/3iiUCXVca6yP9p2G9SqFyPf8tMOurYBqvGPFWZZWW8tUKiSTyz67uBYWeJIyc9fEQ95aod4kSvYFykrjo1LlkApDE269M4y6sFAgaNK3q7kcIlH7wrVF1zdCJqAJubc7uMRI7tqgv+/ACl7Q/rGTW3mKxQzS4DuGFFbQDPqaDYVo1XM+gWKNff0xBBVJQ8laO+wBF+aUsEsYwiiL0aomdM+3fUBw7V6NDWWlbsrxLGuOWCY2gK/6lH9MiiUWMo2k1xWyxtSTugSZXBYCaNo3ZyZmEWGgVBX62+5Afz6SEaA2q4c4ZDzuPYNG1qh/08dgv8FeYhfJfYId6H7AjGKwiQMkjrOMKNcITTCECydV9VFnD/qXSigR656aPSC9KoVbiicDhLT5xosqssmpagJuC80yOOz8DXXF/EQI8UfHKvteTkyQefLB6RaA6TStk0dm1T/58xPyOe1oQMGNqw0MFNZ/DUGEM8J01TkRTRTmssGkLYmUhuurri1FD0VR36Oty0FOqsgwvrTypFtKoMUQRoLY3vlzr8dxGAVPQaO2e7TZ+q403TFPpSjXRMlVfFF3cQ4T1HzY+AQpDYWkXKmBGZ+z+NuhEUm+rykd+Eez9QJDJEAXY+8dcK1YhK1jYz6nLnZ2zTiTj3ymzwXCV7esfGiw4BisjdBK30q5IJ9PhvK0mOitPfgkPMfg/Ne77lmdbSzOTa6iAJIJqJ/a1LtFc2s+qU3DeOmUo5+7BmzcyP5JUGTdgzYnKC3PKqFyuh61hIkGgg1PpnYnBx5g6bcovzIZKYVDRggrvFETWTCAlAXfadauaD1AwIg6bw4f5Sv/dAQ9YocmJDwgpzadO/JeDIUU6bYug4VxHi7quufkNWpw4AE+PqhynFVfzA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR83MB0178.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03af8603-42e4-441d-6cf9-08d88733d641
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 17:53:17.9036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ekYxdMqHcoNoQ6ZVA2q61mPhYQBbwsX3e7I4Tti6p2J5typPEMCk2C332E1daX7GmHw9FKQHUucE6GwMJozoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR83MB0277
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E30CC8D55C54C54583CE3A0D7D752769@EURPRD83.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTExLTEyIGF0IDE3OjI5ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gTW9uLCAyMDIwLTExLTAyIGF0IDE5OjE4ICswMDAwLCBMdWNhIEJvY2Fzc2kgd3JvdGU6
DQo+ID4gRnJvbTogTHVjYSBCb2NjYXNzaSA8bHVjYS5ib2NjYXNzaUBtaWNyb3NvZnQuY29tPg0K
PiA+IA0KPiA+IENlcnRhaW4gY29uZmlnIGZpbGVzIGFuZCB1bml0cyBhcmUgc2hhcmVkIGJldHdl
ZW4gZGJ1cy1kYWVtb24gYW5kDQo+ID4gZGJ1cy1icm9rZXIgKGF2YWlsYWJsZSBpbiBtZXRhLW9w
ZW5lbWJlZGRlZCksIHNvIHNwbGl0IHRoZW0gb3V0IHRvDQo+ID4gYWxsb3cgaW5zdGFsbGluZyBk
YnVzLWJyb2tlciB3aXRob3V0IHB1bGxpbmcgaW4gZGJ1cy1kYWVtb24gYW5kIGl0cw0KPiA+IGRl
cGVuZGVuY2llcy4NCj4gPiBTdGFuZC1hbG9uZSBjb21tYW5kIGxpbmUgdG9vbHMgY2FuIGFsc28g
YmUgdXNlZCByZWdhcmRsZXNzIG9mIHdoZXRoZXINCj4gPiB0aGUgYnVzZXMgYXJlIHByb3ZpZGVk
IGJ5IGRidXMtZGFlbW9uIG9yIGRidXMtYnJva2VyLCBzbyBzcGxpdCB0aGVtDQo+ID4gb3V0IGlu
dG8gZGJ1cy10b29scy4NCj4gPiBGaW5hbGx5LCBtb3ZlIHRoZSBYTUwgc2NoZW1hIGZpbGVzIG91
dCBvZiB0aGUgbWFpbiBwYWNrYWdlIGFuZCBpbnRvDQo+ID4gdGhlIGRldmVsb3BtZW50IHBhY2th
Z2UuDQo+ID4gDQo+ID4gQWxsIHRoZXNlIGNoYW5nZXMgZm9sbG93IHRoZSBzYW1lIHBhdHRlcm4g
dXNlZCBieSBGZWRvcmEsIHdoaWNoIHdhcw0KPiA+IG9uZSBvZiB0aGUgZmlyc3QgZGlzdHJvIHRv
IHN3aXRjaCB0byBkYnVzLWJyb2tlciBieSBkZWZhdWx0Og0KPiA+IA0KPiA+IGh0dHBzOi8vc3Jj
LmZlZG9yYXByb2plY3Qub3JnL3JwbXMvZGJ1cy9ibG9iL21hc3Rlci9mL2RidXMuc3BlYw0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQm9jY2Fzc2kgPGx1Y2EuYm9jY2Fzc2lAbWljcm9z
b2Z0LmNvbT4NCj4gPiAtLS0NCj4gPiB2MjogZml4IEZJTEVTXyByZWdleCB0byBjb3JyZWN0bHkg
aW5jbHVkZSBhbGwgdW5pdHMgYnV0IHRoZSBzb2NrZXRzDQo+ID4gICAgIGluIHRoZSBtYWluIHBh
Y2thZ2UNCj4gDQo+IEkgdHJpZWQgcHV0dGluZyB0aGlzIHRocm91Z2ggdGVzdGluZyBvbiB0aGUg
YXV0b2J1aWxkZXIgYnV0IGl0IGZhaWxzIGluDQo+IHdvcmxkIGJ1aWxkczoNCj4gDQo+IGh0dHBz
Oi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvODMvYnVp
bGRzLzE1ODkvc3RlcHMvMTMvbG9ncy9zdGRpbw0KPiANCj4gKGRidXMtbmF0aXZlIHNlZW1zIHRv
IGRlcGVuZCB1cG9uIGRidXMtbmF0aXZlLXRvb2xzLW5hdGl2ZSkNCj4gDQo+IHNvIEkndmUgaGFk
IHRvIGRyb3AgdGhlIHBhdGNoLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQpIaSwN
Cg0KVGhhdCdzIGEgd2VpcmQgZXJyb3I/IEJ1aWxkaW5nIHRoZSBiYXNpYyBwb2t5IHJlZmVyZW5j
ZSBkaWRuJ3Qgc2hvdyBpdC4NCg0KQW55IHN1Z2dlc3Rpb24gb24gaG93IHRvIGZpeCBpdD8gRG8g
eW91IHNlZSBhbnl0aGluZyBvYnZpb3VzbHkgd3JvbmcNCndpdGggdGhlIHBhdGNoPyBJcyB0aGlz
IHRoZSBjb3JyZWN0IHdheSB0byBhZGQgYSBydW50aW1lIGRlcGVuZGVuY3kgaW4NCllvY3RvOg0K
DQpSREVQRU5EU18ke1BOfSArPSAiJHtQTn0tY29tbW9uICR7UE59LXRvb2xzIg0KDQpTaG91bGQg
aXQgaGFyZC1jb2RlIHRoZSBuYW1lIGFuZCBkcm9wIHRoZSAke1BOfSBwZXJoYXBzPw0KDQotLSAN
CktpbmQgcmVnYXJkcywNCkx1Y2EgQm9jY2Fzc2kNCg==
