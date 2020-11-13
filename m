Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.15637.1605237746164651738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 19:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=m5Sfze94;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: lili.li@intel.com)
IronPort-SDR: 6VWN2FfZ4qQmimWQhvC7RBmscq5ZYevsuomMMOs+FkWeAynuPkLUCXguy1+3Ie0sNGmJvuIFQR
 blgrPZiR9WJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="188431756"
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; 
   d="scan'208";a="188431756"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 19:22:25 -0800
IronPort-SDR: RLOAe4I+pLDKV3vGLC39PY7wZy8aEtLeUxVmYFeYxnqX7fIyoxexZC/YgQliSd4pN2tcTBzbWk
 R6HxbcZlld6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; 
   d="scan'208";a="542501752"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by orsmga005.jf.intel.com with ESMTP; 12 Nov 2020 19:22:25 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 19:22:24 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 12 Nov 2020 19:22:24 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 12 Nov 2020 19:22:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mynv6USnYvNVkirU+nPAgBq8Ml+H5HYb0BYE23OqugKnhNsXGznlCyS8ni/fE63iDPGUBenkDdF/2tK3a6tqJ9WeXlp7afIWgIZfsMB0T+EAX8sQizKcZAPTC5FRsq1mZE3hbXx90Bj75wmI3HisZWeV6OnXCZ7/bEGBTwToA7qH5/C6tB1WDu+pxMVDHbf5oE2YH7b/oidnN5AOR0UnTw5wLWQccfD3XmfEE7UiI0gSX/H2lufXttVmImnBpyPxLW3/LKObdDx66vwXPOjSDi9gHOw0dCD+5NvWF1akDpBZsikmQVlPaB552odXPpnJh11tGwlYs40xx5s2PG3m6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81t8Gmx5boUeF674XVGNao3FV+wsEClCt8zn1mjwC+A=;
 b=AfVRftCM51EIYY+kkaW/F2zL5DLp5XqKMU49aBDzpiqIstS/S9e4JFclqFHnajGQeaOWKXpOobZyRjeZVHV0jk41uTChoqLEkVONfdP3cMfkRhw/XuHzqPqGJSGFaKcQsBF7csDe2y53rGsetKCGorNO8y5qo3nK0Ugnk/Uoy+lvRABKZF6Bike8pA0IBzCaQ3Q/ty3dfdbcIe7D2DkWGpR6Gz0Ot0sI3rX2VeGHVdiMsRfZFO2OJffdYOdYcbb3pY8vkcLaZteZ+RHeSv6SI5zSJi2bfwXGPjY8AC3vLxn52jsTuEHq2eNZsnkkG25RMgBEVOa5ByB6rxOmqDqjgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81t8Gmx5boUeF674XVGNao3FV+wsEClCt8zn1mjwC+A=;
 b=m5Sfze94RCzM/mYnh18wS5M4VIyFcqpw3JXFfkGQKntE9gwxjYoi+6fZPhZ8LYYLuMo0TD1sGiNiQd4sxD2K/Cn/vt46bW2X/dJHePaGD0yEkd75qYfHry8P6fB0z9qkzlmrnXKY+Udwt5Nw7uCWlkKex2m1LdHryyy5hy98ee4=
Received: from MN2PR11MB3808.namprd11.prod.outlook.com (2603:10b6:208:f8::27)
 by MN2PR11MB3967.namprd11.prod.outlook.com (2603:10b6:208:13d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 03:22:19 +0000
Received: from MN2PR11MB3808.namprd11.prod.outlook.com
 ([fe80::4d51:6d57:50b2:ae82]) by MN2PR11MB3808.namprd11.prod.outlook.com
 ([fe80::4d51:6d57:50b2:ae82%7]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 03:22:19 +0000
From: "Lili Li" <lili.li@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Mittal, Anuj"
	<anuj.mittal@intel.com>, "Pan, Kris" <kris.pan@intel.com>
Subject: Re: [OE-core][gatesgarth][dunfell][master][PATCH] kernel.bbclass: fix module.lds missing issue since kernel v5.10
Thread-Topic: [OE-core][gatesgarth][dunfell][master][PATCH] kernel.bbclass:
 fix module.lds missing issue since kernel v5.10
Thread-Index: AQHWuWat+veX8ZsLc06iYmRrqmROXKnFY9lA
Date: Fri, 13 Nov 2020 03:22:18 +0000
Message-ID: <MN2PR11MB3808A2C2E6AE7D1751C55C3BE4E60@MN2PR11MB3808.namprd11.prod.outlook.com>
References: <20201113021002.30015-1-lili.li@intel.com>
 <CADkTA4Po=it-hvSFG2KZXpKXWUxsPs-jLcnaWGTpwdUdc7RzgQ@mail.gmail.com>
In-Reply-To: <CADkTA4Po=it-hvSFG2KZXpKXWUxsPs-jLcnaWGTpwdUdc7RzgQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfdf2063-ad20-4bbb-13da-08d8878353db
x-ms-traffictypediagnostic: MN2PR11MB3967:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB396714FEFE8836BB3FCA870DE4E60@MN2PR11MB3967.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FdL0rWG6OM0iBqClkBldqE6R8omElRfZi3UH1RksemMhpqW5rEnk3zXwXpVNdR5/TTUkBPYKsqk9+pJF86hKmwcCJUNwtiQCJRre021WvyhKr9fV0m5rc//5Fc8VS+grUIhUJZcg1LyY5f2IqSiTnYAwFnGtv/WeAG8LnaBysEjtnRsRZ3LEsQBjLr9N8ydaO9Kw2COnNNhlCRBws/l/KFssMMMMIgVQM1W9xgj3XKKaFZLwD/B57MOEn5CRBTN8XZM/kip6qIWAyqnaOt4LFt8k18RsQPUZ1/nqPIna0l3qXsRjkj9qpXbMIfiKhHo7MReN/nAA2d3FX0xBLSZIVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(4326008)(107886003)(33656002)(66446008)(66946007)(6916009)(8676002)(2906002)(316002)(83380400001)(186003)(66476007)(9686003)(478600001)(66556008)(55016002)(8936002)(26005)(5660300002)(71200400001)(76116006)(64756008)(54906003)(86362001)(6506007)(7696005)(53546011)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 1RlZsniue7Av2wTp0lZ62Gb6QqdGM4aZkAxzyj3nl4Wuex5me70RuuoLn8zKmvtrUoqr3oQcASrC8RdYeEysM50mpv2YRVkxNJh0Np/OYPRiObHYNF8y3BwwlT6rNvz6hxvcgFF9momOyTvdsUoIRwSji0tcvjlguOFiMeasc6QLalVF5rUh+qa/6ByEJzAnO092dxVJLnusDEJEr6/PMpmTfmiutlFMHuSDfzQAqq70tnIOIbQP9/P5S1I7TrrPWPVJZSU5T+k5GvLqNWlhabnqRkVi5KemlFecacroGSS7y/zZqmkQlbeLPbYZjSHJTMxZMd7UaSwXxZKY4S6WZm2vmwrNTOuu3LY3idIumN3a6R9cQDP55BErtjkJRHdxtFyf8VnNSHpOoDnonetTHQg565mbXhRmBbDZBtNXypZpMe+nEDoIShTjBwzmXimmEGb24rUAltoeABYXqjcabf/NaNJ/flT4FOve+ju/6ca959sVG+LJzfEE08mEgzBCZrhwUPMM5yd2RQ9q0ZhvzZjtaDnnvoz7jqqSOTOM5cLvWP3eM1rOMzNrDWLfGikawWBXRvcWD2pd/ocyc1DPw+CcqvzadmD8zzjL3Dze9vbv9X8yIXGvygkA/JCPu8L/1xzURUyMcXYT627idcNoCQ2eNRQE4HARZJBMOQqUYYQVJAAnvE0QvXZONwWBsqMf9yeKkctmn9AWySIgFWA34yyM5IHDSeebuVN19kTgdvpyc/qYcG8jFrQzodjurKWTzi9Tyx+9GGZXEYcLJP9ufvKRt46ikpKB6RW/LJHA9xsJWF27S7LMwQjKDwIqLD2TClYwWHhje6Dbdv7P2EV56ihB62uIYz5KZnIWWVK3evAl+iKG0ZIoFDSPkTKDiiYoZnfyWq+r/271b8hiZKtOLQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdf2063-ad20-4bbb-13da-08d8878353db
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 03:22:18.9147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GdQLpYXVJer0ifPQYen7gaAKCW71RG5mTWdmjoK/8SgECulxTE2931jYJp4BV9zpcoSPGvEEdIv6fog9IqwaFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3967
Return-Path: lili.li@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBCcnVjZSBBc2hmaWVsZA0KPiBTZW50OiBGcmlk
YXksIE5vdmVtYmVyIDEzLCAyMDIwIDEwOjQyIEFNDQo+IFRvOiBMaSwgTGlsaSA8bGlsaS5saUBp
bnRlbC5jb20+DQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29y
ZSBsYXllciA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBN
aXR0YWwsIEFudWogPGFudWoubWl0dGFsQGludGVsLmNvbT47IFBhbiwNCj4gS3JpcyA8a3Jpcy5w
YW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW2dhdGVzZ2FydGhdW2R1bmZl
bGxdW21hc3Rlcl1bUEFUQ0hdIGtlcm5lbC5iYmNsYXNzOiBmaXgNCj4gbW9kdWxlLmxkcyBtaXNz
aW5nIGlzc3VlIHNpbmNlIGtlcm5lbCB2NS4xMA0KPiANCj4gT24gVGh1LCBOb3YgMTIsIDIwMjAg
YXQgOToxMSBQTSBMaWxpIExpIDxsaWxpLmxpQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBX
aXRoIHY1LjEwLXJjMSBrZXJuZWwgY29tbWl0IDU5NmIwNDc0ZDNkOSAoa2J1aWxkOiBwcmVwcm9j
ZXNzIG1vZHVsZQ0KPiA+IGxpbmtlciBzY3JpcHQpLCBleHRlcm5hbCBrZXJuZWwgbW9kdWxlIG5l
ZWQgc2NyaXB0cy9tb2R1bGUubGRzIGZvcg0KPiA+IGNvbXBpbGluZy4NCj4gPg0KPiA+IEVycm9y
IExvZzoNCj4gPiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnc2NyaXB0cy9tb2R1bGUubGRz
JywgbmVlZGVkIGJ5IC4uLi4NCj4gDQo+IEkgaGF2ZSBhIHNpbWlsYXIgY2hhbmdlIGxvY2FsbHks
IGJ1dCBJIGRvIGhhdmUgYSBxdWVzdGlvbi4NCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YW4sIEtyaXMgPGtyaXMucGFuQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaWxpIExp
IDxsaWxpLmxpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jbGFzc2VzL2tlcm5lbC5i
YmNsYXNzIHwgOSArKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcyBiL21l
dGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcw0KPiA+IGluZGV4IDllM2MzNGFkNDguLjVjMjYyZjM0
MGUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzDQo+ID4gKysr
IGIvbWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzDQo+ID4gQEAgLTM1OCw2ICszNTgsMTAgQEAg
ZG9fY29tcGlsZV9rZXJuZWxtb2R1bGVzKCkgew0KPiA+ICAgICAgICAgICAgICAgICAjIG90aGVy
IGtlcm5lbCBtb2R1bGVzIGFuZCB3aWxsIGxvb2sgYXQgdGhpcw0KPiA+ICAgICAgICAgICAgICAg
ICAjIGZpbGUgdG8gZG8gc3ltYm9sIGxvb2t1cHMNCj4gPiAgICAgICAgICAgICAgICAgY3AgJHtC
fS9Nb2R1bGUuc3ltdmVycyAke1NUQUdJTkdfS0VSTkVMX0JVSUxERElSfS8NCj4gPiArICAgICAg
ICAgICAgICAgaWYgWyAtZSAke0J9L3NjcmlwdHMvbW9kdWxlLmxkcyBdOyB0aGVuDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgbWtkaXIgLXAgJHtTVEFHSU5HX0tFUk5FTF9CVUlMRERJUn0v
c2NyaXB0cw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNwICR7Qn0vc2NyaXB0cy9tb2R1
bGUubGRzDQo+ICR7U1RBR0lOR19LRVJORUxfQlVJTERESVJ9L3NjcmlwdHMvDQo+ID4gKyAgICAg
ICAgICAgICAgIGZpDQo+IA0KPiBZb3UgcmVhbGx5IHNob3VsZG4ndCBuZWVkIHRoaXMgaGVyZS4N
Cj4gDQo+IFRoZSBvbmx5IHJlYXNvbiB3ZSBjb3B5IE1vZHVsZS5zeW12ZXJzIGlzIHRoYXQgdGhl
IGtlcm5lbCBtb2R1bGUgYnVpbGQNCj4gdXBkYXRlcyBpdC4NCj4gDQo+IEkgb25seSBoYXZlIHRo
ZSBzaW5nbGUgY29weSBpbiBteSBsb2NhbCBjaGFuZ2UgKHNpbmNlIGl0IGlzIGNyZWF0ZWQgYnkN
Cj4gbW9kdWxlc19wcmVwYXJlKSwgYW5kIEknbSBub3Qgc2VlaW5nIGFueSBicmVha2FnZS4NCj4g
DQo+IFdlcmUgeW91IHNlZWluZyBzb21ld2hlcmUgdGhhdCBpdCB3YXMgdXBkYXRlZCwgb3Igc29t
ZXRoaW5nIHRoYXQgd2FzDQo+IGJyZWFraW5nID8NCj4gDQo+IEJydWNlDQoNClRoYW5rcyBCcnVj
ZSBmb3IgY2F0Y2hpbmcgdGhpcyEgSSBhZGQgdGhpcyBoZXJlIGp1c3QgaW4gY2FzZSBhbnkgZnVy
dGhlciBjaGFuZ2VzLCB3ZSBjYW4gcmVtb3ZlIGl0IGFzIG9mIGN1cnJlbnQgcHJvY2Vzcy4NCldp
bGwgeW91IHBvc3QgeW91ciBsb2NhbCBwYXRjaCBvciBkbyB5b3Ugd2FudCBtZSB0byBzdWJtaXQg
djIgdmVyc2lvbj8NCg0KVGhhbmtzDQo+IA0KPiA+ICAgICAgICAgZWxzZQ0KPiA+ICAgICAgICAg
ICAgICAgICBiYm5vdGUgIm5vIG1vZHVsZXMgdG8gY29tcGlsZSINCj4gPiAgICAgICAgIGZpDQo+
ID4gQEAgLTQ2NSw2ICs0NjksMTEgQEAgZG9fc2hhcmVkX3dvcmtkaXIgKCkgew0KPiA+ICAgICAg
ICAgIyBDb3B5IGZpbGVzIHJlcXVpcmVkIGZvciBtb2R1bGUgYnVpbGRzDQo+ID4gICAgICAgICBj
cCBTeXN0ZW0ubWFwICRrZXJuZWxkaXIvU3lzdGVtLm1hcC0ke0tFUk5FTF9WRVJTSU9OfQ0KPiA+
ICAgICAgICAgWyAtZSBNb2R1bGUuc3ltdmVycyBdICYmIGNwIE1vZHVsZS5zeW12ZXJzICRrZXJu
ZWxkaXIvDQo+ID4gKyAgICAgICBpZiBbIC1lIC4vc2NyaXB0cy9tb2R1bGUubGRzIF07IHRoZW4N
Cj4gPiArICAgICAgICAgICAgICAgbWtkaXIgLXAgJGtlcm5lbGRpci9zY3JpcHRzDQo+ID4gKyAg
ICAgICAgICAgICAgIGNwIC4vc2NyaXB0cy9tb2R1bGUubGRzICRrZXJuZWxkaXIvc2NyaXB0cy8N
Cj4gPiArICAgICAgIGZpDQo+ID4gKw0KPiA+ICAgICAgICAgY3AgLmNvbmZpZyAka2VybmVsZGly
Lw0KPiA+ICAgICAgICAgbWtkaXIgLXAgJGtlcm5lbGRpci9pbmNsdWRlL2NvbmZpZw0KPiA+ICAg
ICAgICAgY3AgaW5jbHVkZS9jb25maWcva2VybmVsLnJlbGVhc2UNCj4gPiAka2VybmVsZGlyL2lu
Y2x1ZGUvY29uZmlnL2tlcm5lbC5yZWxlYXNlDQo+ID4gLS0NCj4gPiAyLjE3LjENCj4gPg0KPiA+
DQo+ID4NCj4gPg0KPiANCj4gDQo+IC0tDQo+IC0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBO
VUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0IGl0cw0KPiBl
bmQNCj4gLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg==
