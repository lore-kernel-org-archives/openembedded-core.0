Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.16143.1605240144350551330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 20:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=XZATq9fH;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: lili.li@intel.com)
IronPort-SDR: 45L++o6bNr2CE8haAJY1dbfRb0wNktzXqvDF2UU1gOeECBcafs0myUloEboP2FE4iujegAsRo2
 kaVE0gndWrRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="232040787"
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; 
   d="scan'208";a="232040787"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 20:02:17 -0800
IronPort-SDR: wAvPSkGkxyMjULrewJgvoN03Eaot9zyCXGw5Osur6yq6AEXkmKARf1sILBmPvo+VLUBixznxJ8
 W3RiEWepl7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; 
   d="scan'208";a="542512356"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga005.jf.intel.com with ESMTP; 12 Nov 2020 20:02:16 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 20:02:15 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 20:02:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 12 Nov 2020 20:02:15 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 12 Nov 2020 20:02:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/vecnjdTJ4HiIR5yQsZGMD3t8rEZwDlvgTATz17sIBG1Hms5qS8tBizPRQMabIN+m00gKXek1gwt9kzWvSbcKtMqagDBggaBaUfn3xDpiToDXT4IFEnU2d8wfrEaV9IN7l0wdq/B1gKr9r58dy1GHvroLk/VHZYQ8k4hhQ0Rw33uHaimSoUjvIsOcCRRyGcpiHZKc9ueA4jAfy3vHzL48L8C+0cCXGVupM5Nx0aJXMrOJ7Q0wg/NdEtdRkGJly3GqI/lLm/cq49bgrTv/tUG90QQeuzPwOfKDRUcNB9OSXC7fg+SFTRUIIyejJvEUXzI5/TVpdqfuFPwTwnHQaDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L8BSBgCVfpzZvDnUij5YjBeytzaiGOm4KIXNwPCRnU=;
 b=RIYdY7e+0yzr8JkRxhAz+DjAHD4obD5KsiC1sRdI5zqsFkJ87k6PcauKTx41ArNG9iXoagivN5GsnLudKyxKG3gb6tgUS2xYH4QIMAG/A3bP2I+Qy+lhi9IA9UDng57A3V/3CBJiF3BnmqH8NJDV+V6b4K7IFJwqWbGSjHz4MUv9mYYhZ44f1dAU7tuhhS2G8MxbJqiVreDNepSIZja8MjgbMoQsucJpKkRTwRBwLrOUpu7pWNNioHrHUr4L2ncgjTJviLy5TUdF1UFf3xCzC6aoXqN4SjigdApqfoy4v67lkx3/v5eI/z3xf3nLXIiAMRHMu9vOzqZCWpCP9P07JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L8BSBgCVfpzZvDnUij5YjBeytzaiGOm4KIXNwPCRnU=;
 b=XZATq9fHAhqnXj2tSwYcGXimo45TNEnrvKIZ7cI+V4QnGj3HsLoFvAhBbo7BQIWE8/5uieiekE0zmItlHQE5qkYHxKYW50bR20O7qwv08BGXDTrX5SOc/5QLewn4ceDse8RuYUKdP2HtkauSfzd4JA6Bcy94CoRvD3HsJ5mxGkA=
Received: from MN2PR11MB3808.namprd11.prod.outlook.com (2603:10b6:208:f8::27)
 by MN2PR11MB3661.namprd11.prod.outlook.com (2603:10b6:208:f0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 04:02:12 +0000
Received: from MN2PR11MB3808.namprd11.prod.outlook.com
 ([fe80::4d51:6d57:50b2:ae82]) by MN2PR11MB3808.namprd11.prod.outlook.com
 ([fe80::4d51:6d57:50b2:ae82%7]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 04:02:12 +0000
From: "Lili Li" <lili.li@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Mittal, Anuj"
	<anuj.mittal@intel.com>, "Pan, Kris" <kris.pan@intel.com>
Subject: Re: [OE-core][gatesgarth][dunfell][master][PATCH] kernel.bbclass: fix module.lds missing issue since kernel v5.10
Thread-Topic: [OE-core][gatesgarth][dunfell][master][PATCH] kernel.bbclass:
 fix module.lds missing issue since kernel v5.10
Thread-Index: AQHWuWat+veX8ZsLc06iYmRrqmROXKnFY9lAgAAJmICAAAKdIA==
Date: Fri, 13 Nov 2020 04:02:12 +0000
Message-ID: <MN2PR11MB3808E79041D65E9540AB124CE4E60@MN2PR11MB3808.namprd11.prod.outlook.com>
References: <20201113021002.30015-1-lili.li@intel.com>
 <CADkTA4Po=it-hvSFG2KZXpKXWUxsPs-jLcnaWGTpwdUdc7RzgQ@mail.gmail.com>
 <MN2PR11MB3808A2C2E6AE7D1751C55C3BE4E60@MN2PR11MB3808.namprd11.prod.outlook.com>
 <CADkTA4PA9QjPROHtKoohsq_wmyAdgQqur4g9e=hvUNCsMGCD2g@mail.gmail.com>
In-Reply-To: <CADkTA4PA9QjPROHtKoohsq_wmyAdgQqur4g9e=hvUNCsMGCD2g@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: ae683ccb-df68-4c64-79ab-08d88788e6af
x-ms-traffictypediagnostic: MN2PR11MB3661:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3661C788FC507A91371D6E5DE4E60@MN2PR11MB3661.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CTIrSwA8ZDrxWAq4iKUhw3sqczZoYyx9dbyT4Gojn7tN0J36f/PE4VPNc0Bqx/SWUerqnR84bXCCv5sUVUhqR1HUkwtKUsvU+AicFnINJJNSStMlEUjFfniLE/TkN4qc+bUNeFWjyvnGutVnRxJBtqTRqSD9v0efN/o5CsUd3xT8idE6wsaaoJ2O4ZugxPGu/99N2S3oZ5ab5Rx0QbXDJdZ7kME9EFDGGwLA4szEba5i5giLg9o0IRBhf7/w6ukE4RDZ1xa68LCHIUQ7sqrBdGwQDq93hxrzejwtoO7ZsOpXmev2Rgz6K9DCNgYxD6jnwNS+NGx47JkeC1zIt/2Y7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(52536014)(64756008)(7696005)(66476007)(107886003)(66446008)(86362001)(6916009)(8936002)(55016002)(33656002)(9686003)(316002)(8676002)(478600001)(2906002)(71200400001)(4326008)(5660300002)(26005)(76116006)(6506007)(66946007)(54906003)(53546011)(83380400001)(66556008)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: rabbILVw7qYY8670m3Z905E591L1Gq/vIh6RPTu+ma0DB7z3Qb4AHF/VwiJhbnB/DHwz8j7SBneWCYxW7BgBSXxkmT1B3z/wH8odIHusfz4KR+YOstORduvkICOjoAMAc3QBhcMnueCXkDlyhrueKuFclHRZ5nqxcQgAo4ejEBzrEkIs/e/VxyRU+I2zu2suWGdoW/ohShGHqSaBvfQ698MZ8IcpNR5aYe3IgXtkvaxtZP3D0oLq+PKpbcWmFBhXbFDA2OS9mshIk0seU+rL/zNnTRi1hn30Q42gho79RYxB4+oItxDfqF1zrRRLPaYhM7cl6DZXiUXlbRvyCMzUMG7ZZZdRwQamswSqFqh03tYO2zpYliZNwwQYZPXROfSjSXOByzyqkomvNIGMc0G55VKoUgU0eLog7f+WiWLhwYulVpLCkHEhKBNpiA0v9k5iV4PQ/J/hbZIhzKVc1L4UyawxbI3/4KSqgUuRd1/h9mbyjEX/VMzxpfaklE2ZwatXaIFLqUBTOOknlSbXeK3Urrr7gx/nBwZan7V3Ea2PaMVoWvHQzPFOZZ/R2xk9TOKDNYzS77WISR8wgIRgNwUUes/FYyzgQkz/Ymfu7EBbrtT13vvlRUH3vdNRMF3Ea3TlRC66EWcyeKuWkNmDKkUZ5q3QAFFs4RNW8bU16rb3JOk7dodZv6w64uoOThv8f3euZ8mGsDzXh7fxQW9FEYcpwjj83/vRnLrPtsg+wJizr/5Q76p2F9k0bNyjHPDQIUUo8X1LCF5v2GDe/rSnr5fl5IlKQ0+gDDJ84RCM9PDbGTpvVpi1JxiGzjGkwrkfWaHUMlzpIqxQ9uDv/8qFU6b1AiuRYc24mB5788vCXz1XnYv9fVP2QdqPPiqIZfwvG09hZe16Xsb4eGT2ia5cYbadgg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae683ccb-df68-4c64-79ab-08d88788e6af
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 04:02:12.8037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tF9ulTJ0RP38uqhUSNTfAATGshzgHy0kewEBRaL0J/+K/5ePsA0zKaqGmAQ//LanNPlWxC2efUfAE6JGIyHJTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3661
Return-Path: lili.li@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBCcnVjZSBBc2hmaWVsZA0KPiBTZW50OiBGcmlk
YXksIE5vdmVtYmVyIDEzLCAyMDIwIDExOjUwIEFNDQo+IFRvOiBMaSwgTGlsaSA8bGlsaS5saUBp
bnRlbC5jb20+DQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29y
ZSBsYXllciA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBN
aXR0YWwsIEFudWogPGFudWoubWl0dGFsQGludGVsLmNvbT47IFBhbiwNCj4gS3JpcyA8a3Jpcy5w
YW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW2dhdGVzZ2FydGhdW2R1bmZl
bGxdW21hc3Rlcl1bUEFUQ0hdIGtlcm5lbC5iYmNsYXNzOiBmaXgNCj4gbW9kdWxlLmxkcyBtaXNz
aW5nIGlzc3VlIHNpbmNlIGtlcm5lbCB2NS4xMA0KPiANCj4gT24gVGh1LCBOb3YgMTIsIDIwMjAg
YXQgMTA6MjIgUE0gTGksIExpbGkgPGxpbGkubGlAaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+
DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+ID4g
PiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBCcnVjZSBBc2hmaWVs
ZA0KPiA+ID4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxMywgMjAyMCAxMDo0MiBBTQ0KPiA+ID4g
VG86IExpLCBMaWxpIDxsaWxpLmxpQGludGVsLmNvbT4NCj4gPiA+IENjOiBQYXRjaGVzIGFuZCBk
aXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8b3BlbmVtYmVkZGVkLQ0KPiA+ID4g
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPjsgTWl0dGFsLCBBbnVqIDxhbnVqLm1pdHRhbEBp
bnRlbC5jb20+Ow0KPiA+ID4gUGFuLCBLcmlzIDxrcmlzLnBhbkBpbnRlbC5jb20+DQo+ID4gPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdW2dhdGVzZ2FydGhdW2R1bmZlbGxdW21hc3Rlcl1bUEFUQ0hd
DQo+ID4gPiBrZXJuZWwuYmJjbGFzczogZml4IG1vZHVsZS5sZHMgbWlzc2luZyBpc3N1ZSBzaW5j
ZSBrZXJuZWwgdjUuMTANCj4gPiA+DQo+ID4gPiBPbiBUaHUsIE5vdiAxMiwgMjAyMCBhdCA5OjEx
IFBNIExpbGkgTGkgPGxpbGkubGlAaW50ZWwuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4g
V2l0aCB2NS4xMC1yYzEga2VybmVsIGNvbW1pdCA1OTZiMDQ3NGQzZDkgKGtidWlsZDogcHJlcHJv
Y2Vzcw0KPiA+ID4gPiBtb2R1bGUgbGlua2VyIHNjcmlwdCksIGV4dGVybmFsIGtlcm5lbCBtb2R1
bGUgbmVlZA0KPiA+ID4gPiBzY3JpcHRzL21vZHVsZS5sZHMgZm9yIGNvbXBpbGluZy4NCj4gPiA+
ID4NCj4gPiA+ID4gRXJyb3IgTG9nOg0KPiA+ID4gPiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdl
dCAnc2NyaXB0cy9tb2R1bGUubGRzJywgbmVlZGVkIGJ5IC4uLi4NCj4gPiA+DQo+ID4gPiBJIGhh
dmUgYSBzaW1pbGFyIGNoYW5nZSBsb2NhbGx5LCBidXQgSSBkbyBoYXZlIGEgcXVlc3Rpb24uDQo+
ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYW4sIEtyaXMgPGtyaXMucGFu
QGludGVsLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGlsaSBMaSA8bGlsaS5saUBpbnRl
bC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgbWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNz
IHwgOSArKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykN
Cj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFz
cw0KPiA+ID4gPiBiL21ldGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcyBpbmRleCA5ZTNjMzRhZDQ4
Li41YzI2MmYzNDBlIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9tZXRhL2NsYXNzZXMva2VybmVsLmJi
Y2xhc3MNCj4gPiA+ID4gKysrIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzDQo+ID4gPiA+
IEBAIC0zNTgsNiArMzU4LDEwIEBAIGRvX2NvbXBpbGVfa2VybmVsbW9kdWxlcygpIHsNCj4gPiA+
ID4gICAgICAgICAgICAgICAgICMgb3RoZXIga2VybmVsIG1vZHVsZXMgYW5kIHdpbGwgbG9vayBh
dCB0aGlzDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAjIGZpbGUgdG8gZG8gc3ltYm9sIGxvb2t1
cHMNCj4gPiA+ID4gICAgICAgICAgICAgICAgIGNwICR7Qn0vTW9kdWxlLnN5bXZlcnMgJHtTVEFH
SU5HX0tFUk5FTF9CVUlMRERJUn0vDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiBbIC1lICR7
Qn0vc2NyaXB0cy9tb2R1bGUubGRzIF07IHRoZW4NCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgbWtkaXIgLXAgJHtTVEFHSU5HX0tFUk5FTF9CVUlMRERJUn0vc2NyaXB0cw0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICBjcCAke0J9L3NjcmlwdHMvbW9kdWxlLmxkcw0KPiA+
ID4gJHtTVEFHSU5HX0tFUk5FTF9CVUlMRERJUn0vc2NyaXB0cy8NCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgIGZpDQo+ID4gPg0KPiA+ID4gWW91IHJlYWxseSBzaG91bGRuJ3QgbmVlZCB0aGlzIGhl
cmUuDQo+ID4gPg0KPiA+ID4gVGhlIG9ubHkgcmVhc29uIHdlIGNvcHkgTW9kdWxlLnN5bXZlcnMg
aXMgdGhhdCB0aGUga2VybmVsIG1vZHVsZQ0KPiA+ID4gYnVpbGQgdXBkYXRlcyBpdC4NCj4gPiA+
DQo+ID4gPiBJIG9ubHkgaGF2ZSB0aGUgc2luZ2xlIGNvcHkgaW4gbXkgbG9jYWwgY2hhbmdlIChz
aW5jZSBpdCBpcyBjcmVhdGVkDQo+ID4gPiBieSBtb2R1bGVzX3ByZXBhcmUpLCBhbmQgSSdtIG5v
dCBzZWVpbmcgYW55IGJyZWFrYWdlLg0KPiA+ID4NCj4gPiA+IFdlcmUgeW91IHNlZWluZyBzb21l
d2hlcmUgdGhhdCBpdCB3YXMgdXBkYXRlZCwgb3Igc29tZXRoaW5nIHRoYXQgd2FzDQo+ID4gPiBi
cmVha2luZyA/DQo+ID4gPg0KPiA+ID4gQnJ1Y2UNCj4gPg0KPiA+IFRoYW5rcyBCcnVjZSBmb3Ig
Y2F0Y2hpbmcgdGhpcyEgSSBhZGQgdGhpcyBoZXJlIGp1c3QgaW4gY2FzZSBhbnkgZnVydGhlciBj
aGFuZ2VzLA0KPiB3ZSBjYW4gcmVtb3ZlIGl0IGFzIG9mIGN1cnJlbnQgcHJvY2Vzcy4NCj4gPiBX
aWxsIHlvdSBwb3N0IHlvdXIgbG9jYWwgcGF0Y2ggb3IgZG8geW91IHdhbnQgbWUgdG8gc3VibWl0
IHYyIHZlcnNpb24/DQo+IA0KPiBJIGhhdmUgYSBjb21taXQgd2l0aCBhIGZldyBleHRyYSBkZXRh
aWxzIGluIGl0IGhlcmUsIEkgY2FuIHNlbmQgaXQgb24NCj4gKG15KSBGcmlkYXksIGFuZCBhZGQg
eW91ciBTaWduZWQtb2ZmLWJ5IG9uIGl0IGFzIHdlbGwuDQo+IA0KPiBJZiB0aGF0J3Mgb2sgd2l0
aCB5b3UgPw0KU3VyZSwgdGhhdCdzIGdyZWF0ISBUaGFua3MhDQoNCkxpbGkNCg0KPiAganVzdCB3
YW50ZWQgdG8gcnVuIG9uZSBtb3JlIHJvdW5kIG9mIHRlc3Rpbmcgd2l0aCBteSBxdWV1ZWQgY2hh
bmdlcywgYW5kIHdpbGwNCj4gc2VuZCB0aGVtIGFsbCB0b2dldGhlci4NCj4gDQo+IEJydWNlDQo+
IA0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gPg0KPiA+ID4gPiAgICAgICAgIGVsc2UNCj4gPiA+ID4g
ICAgICAgICAgICAgICAgIGJibm90ZSAibm8gbW9kdWxlcyB0byBjb21waWxlIg0KPiA+ID4gPiAg
ICAgICAgIGZpDQo+ID4gPiA+IEBAIC00NjUsNiArNDY5LDExIEBAIGRvX3NoYXJlZF93b3JrZGly
ICgpIHsNCj4gPiA+ID4gICAgICAgICAjIENvcHkgZmlsZXMgcmVxdWlyZWQgZm9yIG1vZHVsZSBi
dWlsZHMNCj4gPiA+ID4gICAgICAgICBjcCBTeXN0ZW0ubWFwICRrZXJuZWxkaXIvU3lzdGVtLm1h
cC0ke0tFUk5FTF9WRVJTSU9OfQ0KPiA+ID4gPiAgICAgICAgIFsgLWUgTW9kdWxlLnN5bXZlcnMg
XSAmJiBjcCBNb2R1bGUuc3ltdmVycyAka2VybmVsZGlyLw0KPiA+ID4gPiArICAgICAgIGlmIFsg
LWUgLi9zY3JpcHRzL21vZHVsZS5sZHMgXTsgdGhlbg0KPiA+ID4gPiArICAgICAgICAgICAgICAg
bWtkaXIgLXAgJGtlcm5lbGRpci9zY3JpcHRzDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBjcCAu
L3NjcmlwdHMvbW9kdWxlLmxkcyAka2VybmVsZGlyL3NjcmlwdHMvDQo+ID4gPiA+ICsgICAgICAg
ZmkNCj4gPiA+ID4gKw0KPiA+ID4gPiAgICAgICAgIGNwIC5jb25maWcgJGtlcm5lbGRpci8NCj4g
PiA+ID4gICAgICAgICBta2RpciAtcCAka2VybmVsZGlyL2luY2x1ZGUvY29uZmlnDQo+ID4gPiA+
ICAgICAgICAgY3AgaW5jbHVkZS9jb25maWcva2VybmVsLnJlbGVhc2UNCj4gPiA+ID4gJGtlcm5l
bGRpci9pbmNsdWRlL2NvbmZpZy9rZXJuZWwucmVsZWFzZQ0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAy
LjE3LjENCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPg0K
PiA+ID4gLS0NCj4gPiA+IC0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIs
IGZvciBjaGFvcyBhbmQgbWFkbmVzcw0KPiA+ID4gYXdhaXQgdGhlZSBhdCBpdHMgZW5kDQo+ID4g
PiAtICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0KPiANCj4g
DQo+IA0KPiAtLQ0KPiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBm
b3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBhdCBpdHMNCj4gZW5kDQo+IC0gIlVzZSB0
aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJDQo=
