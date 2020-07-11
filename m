Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web12.3273.1594439565076437468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=S7nE0DU+;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2000; q=dns/txt; s=iport;
  t=1594439565; x=1595649165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nd5sGo1KqjD+u5ja2vH0Ty+nTRXrPYjSBkmDgXEx++k=;
  b=S7nE0DU+1/Sl8P5ukrVilMbTusGAA0vvbUugvxAddGcUwQoINCivt7Y6
   hjACPXKDDsxWl2XwuzRx2C4PjSMthQPcmRcghzYSnNAoOp+7LU9lGCcdd
   Zs9oqt1UBmV34HWwnVVZVSaxMGvs6AmTp1AJxZyAQbEwOLXcsUvwDzVan
   4=;
IronPort-PHdr: =?us-ascii?q?9a23=3AWCjSxBVmm8eQwYokuHSKV0LI2tDV8LGuZFwc94?=
 =?us-ascii?q?YnhrRSc6+q45XlOgnF6O5wiEPSBN6FufZFjffGvaf9X2AJ/ZeGtjYFapMfHx?=
 =?us-ascii?q?MGiMBDmQsmDYbFDEDgN/flYmQ8G9gKT15q+Xy3cC03UMbzblHfuDu+uDgVHB?=
 =?us-ascii?q?isMQtzO/T7HZPUg82r1ue0vZrJbFYAiD+0e7gnKhKwoE3YvdUXho03LKE3x3?=
 =?us-ascii?q?6r6ntFcuhb3yVmP1WWyh39/cy3upVk9ndd?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AUAABmNglf/5NdJa1gGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIE4AwEBAQELAYFRUQdvWC8shDODRgONTph?=
 =?us-ascii?q?dgS6BJQNVCwEBAQwBAScGAgQBAYRNAheBfwIkNgcOAgMBAQsBAQUBAQECAQY?=
 =?us-ascii?q?EbYVbAQuFcAEBBBIREQwBATcBDwIBCBgCAiYCAgIwFRACBA4ngwWCSwMuAQ6?=
 =?us-ascii?q?dcAKBOYhhdoEygwEBAQWFKRiCDgMGFHoqAYJpg1SGMxqBQT+BEYMQPoJcBBe?=
 =?us-ascii?q?BRoMWgmCSQKJbCoJdiE+RBiCfJpFkih+UUAIEAgQFAg4BAQWBWgYtgVdwFYM?=
 =?us-ascii?q?kUBcCDY4eg3GFFIVCdAIBATMCBggBAQMJfI57AQE?=
X-IronPort-AV: E=Sophos;i="5.75,338,1589241600"; 
   d="scan'208";a="528331988"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Jul 2020 03:52:44 +0000
Received: from XCH-RCD-001.cisco.com (xch-rcd-001.cisco.com [173.37.102.11])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 06B3qhNo011881
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 11 Jul 2020 03:52:44 GMT
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by XCH-RCD-001.cisco.com
 (173.37.102.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 22:52:43 -0500
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by xhs-rcd-003.cisco.com
 (173.37.227.248) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 22:52:43 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-003.cisco.com (64.101.210.230) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 10 Jul 2020 23:52:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlLxjWJhmJEZ1/iiVxuO6dYXbut9IU9Z81UVTVuyJsxSmJxQ1Zvx1pLPu3PYAGxp/TyCIx+HsMaC5DQomQEN8Evy5Fcq2LusFBGi97Qg68OnTAcfLLpIRbf+pEYQRpfCkD2Trv71He5yBrTgIlSnUe2CqhHghWuWgCpTr0v15+IW2EzCGxa0+YW5Tq2VOrvQoUyFIOoWQulZ/KwyQQQ83XjtBTEzDCGQet9Ve96QGobajnjnXDazciw4jQgf4A7ZLDBJfFGAo90NSeE4EspyGO0FOqoXUBUjMrW6VwjCRS2HWfazplHcSKed6TisYJf6zrltseSxIfp8HHmwONjZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd5sGo1KqjD+u5ja2vH0Ty+nTRXrPYjSBkmDgXEx++k=;
 b=TbQaxDwW6MIw2Pgj0Xn3MMDhI2CXLBY7mWqS03fqGggTLn/+iSO+ZRvj2XDgbR2GGVnK/ry06hjFGaHcoavTaAiFwKp+NhWutl69+mt34xECVrABE0jajDDmdtI+3SBMfCqD0/Mz/Bi/PiVdxjLDs0ukU2ayyQ/SyQE1jtj1iwWwfcCK+xyzyaekaOGhXm/CdJuHAjB7QPFJnoEakCnVus5KKBXztLGfAjeuK9GDiYsbZorIZ6fpR4rEVje6xDAWEG8C7wKzaYK3e66wp6lJH3tSUr9LUyIQ5VHzCC6iLaBmZEoPC556P/9l6mTeCPo9jEBjFy1kyRmhW+1PrB+xrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd5sGo1KqjD+u5ja2vH0Ty+nTRXrPYjSBkmDgXEx++k=;
 b=Psp13FTCuz/0hV8WNEl3d6GfZR4bj0jdIED7iv+OIOdYk5DiRX0dGt7+CaG4GzOl4I4Nj7hsQE2S752q8SZWgrQQDIFsT4EmDMuorOv/DSUGLb5SfrgivrxPgyZ5RKLhCXumRpUq6nz9OpYfIlhDipmW5voULg5GyZ6bJjugNiE=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BYAPR11MB2869.namprd11.prod.outlook.com (2603:10b6:a02:c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Sat, 11 Jul
 2020 03:52:41 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.021; Sat, 11 Jul 2020
 03:52:41 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [PATCH] qemu: access host pkg-config via HOSTTOOLS
Thread-Topic: [PATCH] qemu: access host pkg-config via HOSTTOOLS
Thread-Index: AQHWVuJTcuEb609AQkWJjvvWSwAdyKkBGSYAgAAGOYCAAA6igIAAkawA
Date: Sat, 11 Jul 2020 03:52:41 +0000
Message-ID: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com>
References: <20200710174813.1963559-1-takondra@cisco.com>
	 <39c5bc9fcf056d93a42833d113521f524f063d33.camel@linuxfoundation.org>
	 <3a687673e39fd52a6314e5e0036b0f55a3498c39.camel@cisco.com>
	 <95953e8828dc1c46448d6c880228cf0b3b91c5e8.camel@linuxfoundation.org>
In-Reply-To: <95953e8828dc1c46448d6c880228cf0b3b91c5e8.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54926aac-9631-4095-cb22-08d8254ddc9a
x-ms-traffictypediagnostic: BYAPR11MB2869:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB286960B75F547220EC08711FC8620@BYAPR11MB2869.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lxth7xTsaCM5JuVdYJFM08XL4ZgapWmgg4lxUhAL+95UwwMHBpptZ4Oy0PJqBZ/mrzRvE+DeADSXV/oK0L1tTShg0oQcJ/vkqc//qzyt7vLiVnM36Yk1Ad7AHNPJOdUOXU3wd10vLAs9Y7VgI6e3EU24tKg/Sa2rUaIBYSl/9aJF1Td2vv2POa7tcRyLwWb/jUa/SHgB+5TdUkUQprt1JC2gPmUkTSouLq5WJwAnURWsXnmXROulXx+iVmdg0SnmMcDfhgnYdToGQZT7k51S/bBEsh/L2lr76sfCmnT8c4NZBIgdU1u8eaQvg3xJ6cjPfSIGpQlQmtdqB8KqFuzT6KlTtHbYEiZIQqYgZcXTy0AVj3Sak0AIVTqAH6VfESBnOR9hVFliE19akRsKSYYhuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(8936002)(966005)(478600001)(6486002)(8676002)(316002)(2616005)(86362001)(2906002)(66446008)(64756008)(66946007)(66476007)(76116006)(66556008)(54906003)(71200400001)(186003)(107886003)(5660300002)(6916009)(36756003)(6512007)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +/5iPmIWoGatLAf2FsZ/G1hrJbGeIPg+Etix44eVwyF6cm1jiTZ3AvtAxoHg8NNZFHhGCYj+vf0fkYUMRV5DZTd0Ohjvnw4f8+uvVIFKL1cEczJwEY6TjKO7IbvyTrNtKensgwFJjoOPI469a5l761hbJ9grphHRlyHdXXZD3m95MId2giNCJPotOs5MpSl/xKZ1vc5pPvLCccs4GbWSvJvmSmm23DRD10GJA74sotlqEruuLYfj3SJd4L7tNMcDTPARygJ9eM8nEag+F3oPTYjfiRQ39hRx8MAJz2b5vzdEyItzkmyr22xRc9yBBbR48bxgP5FiTVugE4Ip7JMxltGhF8IBMab9YnrPmjG4TOLcrkC7O0oeCY1vOPtLIxAuryWJw4bsbc6BOG31PLi/Pp7jXr2lyj+F3QMOaVRbqdvIDqD9pwd7/l90oOIyR0+F4DwZwMKvM6ZrFWF7XP41iWlcktuWCsLCWdJS2kk0T0nFXgPlfF5Zp6mBiaKi4xviEZ5/WelRNgiCRIGiqHthZQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54926aac-9631-4095-cb22-08d8254ddc9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2020 03:52:41.5397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RO6IJoSF2COz4LgPvqQphosoEsecfyaDojPBze72SsVnIOwvDzgdlN0+kV9PMY791IGuoZlITPy5HKUMoeMttA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2869
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.11, xch-rcd-001.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D5717CA42D1EA43A336471E7DB0AD5E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDIwOjExICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gRnJpLCAyMDIwLTA3LTEwIGF0IDE4OjE4ICswMDAwLCBUYXJhcyBLb25kcmF0aXVrICh0
YWtvbmRyYSkgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDIwLTA3LTEwIGF0IDE4OjU2ICswMTAwLCBS
aWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gPiA+IHFlbXUgaXMgYSBsaXR0bGUgc3BlY2lhbCwgaXRz
IGFib3V0IHRoZSBvbmx5IHRoaW5nIHdlIGxldCBsb29rDQo+ID4gPiBpbnRvDQo+ID4gPiB0aGUN
Cj4gPiA+IHN5c3RlbSBmb3IgdGhpbmdzIGxpa2UgdGhpcy4gV2UgcmVhbGx5IGRvbid0IHdhbnQg
cGtnLWNvbmZpZw0KPiA+ID4gYXZhaWxhYmxlDQo+ID4gPiBnZW5lcmFsbHkgaW4gSE9TVFRPT0xT
Lg0KPiA+ID4gDQo+ID4gPiBJJ20gbm90IDEwMCUgc3VyZSBJIHVuZGVyc3RhbmQgaG93IHRoaXMg
aXMgZml4aW5nIHRoaW5ncyBlaXRoZXIuDQo+ID4gPiBJcw0KPiA+ID4gdGhpcyB1c2luZyB0aGUg
cGtnLWNvbmZpZyBmcm9tIHlvdXIgYnVpbGR0b29scyB0YXJiYWxsIGluc3RlYWQ/DQo+ID4gPiAN
Cj4gPiANCj4gPiBZZXMsIGl0IGlzIHVzaW5nIHBrZy1jb25maWcgZnJvbSBidWlsZHRvb2xzIHRh
cmJhbGwuDQo+ID4gDQo+ID4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcgb3RoZXIgcGFydHMgb2Yg
dGhlIGJ1aWxkIHdpbGwgc3RpbGwgdXNlDQo+ID4gcGtnY29uZmlnLW5hdGl2ZSBhbmQgc2hvdWxk
IG5vdCBiZSBhZmZlY3RlZC4gT3IgdGhlIGNvbmNlcm4gaXMgdGhhdA0KPiA+IHBhY2thZ2VzIHdp
dGhvdXQgcHJvcGVyIHBrZ2NvbmZpZy1uYXRpdmUgZGVwZW5kZW5jeSB3aWxsIGZpbmQgdGhpcw0K
PiA+IHBrZy1jb25maWcgaW4gSE9TVFRPT0xTPw0KPiANCj4gWWVzLCB0aGF0IGlzIG9uZSBjb25j
ZXJuLg0KPiANCj4gQW5vdGhlciBpcyB0aGF0IGlmIGl0cyB1c2luZyBuYXRpdmVzZGstcGtnY29u
ZmlnIGZyb20gYnVpbGR0b29scywNCj4gZG9lcw0KPiB0aGlzIGJyZWFrIHRoZSByZWFzb24gd2Ug
aGF2ZSB0aGlzIGNvZGUgaW4gdGhlIGZpcnN0IHBsYWNlICh0byBhbGxvdw0KPiBxZW11IHRvIHVz
ZSB0aGUgaG9zdCBHTCBmb3IgdmlydGdsKT8gUHJlc3VtYWJseSB0aGF0IGlzIG5vdCBpbg0KPiBi
dWlsZHRvb2xzLi4uDQoNCkkgc2VlLiBJSVVDIHRoaXMgaG9zdCBwa2ctY29uZmlnIHBhcnQgc2hv
dWxkIGJlIHVzZWQgb25seQ0KaWYgQVNTVU1FX1BST1ZJREVEIGhhcyBsaWJzZGwyLW5hdGl2ZQ0K
aHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS90cmVlL21ldGEv
Y29uZi9sb2NhbC5jb25mLnNhbXBsZT9oPTIwMjAtMDQuMS1kdW5mZWxsI24yMTMNCg0KRG9lcyBp
dCBtYWtlIHNlbnNlIHRvIG1ha2UgdGhpcyBwYXJ0IGNvbmRpdGlvbmFsIG9uIEFTU1VNRV9QUk9W
SURFRA0KY29udGFpbmluZyBsaWJzZGwyLW5hdGl2ZT8NCg==
