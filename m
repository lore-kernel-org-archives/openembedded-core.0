Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.3811.1631581753895873644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 18:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=Zq/aiAlH;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="202011821"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; 
   d="scan'208";a="202011821"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 18:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; 
   d="scan'208";a="451808759"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga002.jf.intel.com with ESMTP; 13 Sep 2021 18:09:12 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 18:09:12 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 18:09:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 13 Sep 2021 18:09:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 13 Sep 2021 18:09:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1K1FlpRtoaahldla1wKqVsW6FI7uS7bYEML3x2DzAgvjxB7msTS/So74IZW4B/HtUwglSWfdL+F/CrJ9anq4Thtqt/Gk3AIr7hJW1qnkknJGOEAiorBAujfVFBZBv7ybbRl77ElTpRgTp0GJg1shtTDSMzAa2Ti2Mrdl/ZZzvetxr2Z83s8qhhMUKTBqjKDCUasGAX9dfcalpsfQfGLo7zv49MGqHYH5GipNuaVIXXWPeM7LjaWXGpsxkRgkeU9qI9HqC6A8QXiKZbRN+zqmFxpGtIdbjuqRFWTUKHB8fyJtALSCXJp61SVj5/n7FgaVP+9LlzBnm0cFrY0WgZw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lmhxlGeEdA97Qky9FIu6eeXYqvsllxtWO8/xnmULZeA=;
 b=iaTftp34ESE6pT3jSpzFddkS5lUgChCg3N2yQzNU/rvlQyJyhQahP7RI76bOJ6GYMgyExb/c0Lu3z1WXma3Nr6Y8F8kC18U6hwjba8VeP1vGTzNlHSynnT1I+nxrqeX5/sgTvvrifq2lwix0P4MmD3nKFJysV/TSOGzONZrv1/YFRxf9X9MXOC6JmxMZFmgxqf6qr5Es583To7Ot9ap41V0ctpPinv2xBT1evFi5uWW9HVWULqzM16TIdmeQs/ZCdN9Fa/GplEtiMG97TnzM3Og7DhJBOIQDpELUsQmo/6493m8BjK9cSwO8V5a+zmHY+yYU5/WWiFUMKzg6spKMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmhxlGeEdA97Qky9FIu6eeXYqvsllxtWO8/xnmULZeA=;
 b=Zq/aiAlH77HOGlxSkQ8IGk5c0hyMvD1d8SoexhH7r3c3yh6FhN3Z/Ag7PLoPUu4snFqmSJ2nnInud7IB264WkaY9cRVwRFsuZ3zKiG4+Q4aGG1QKQPcoyM+INrYpuXXqsxHow37M71BDFkfP4Sy2fNBpOtvJ1LRoj/YhtrZ1od0=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3031.namprd11.prod.outlook.com (2603:10b6:a03:8d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 01:09:05 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 01:09:05 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][hardknott][PATCH] cpio: fix CVE-2021-38185
Thread-Topic: [OE-core][hardknott][PATCH] cpio: fix CVE-2021-38185
Thread-Index: AQHXqFrSIp3X4jf4oEKbbogaom8uL6uhjH2AgAAWxwCAACeeAIAA7p+A
Date: Tue, 14 Sep 2021 01:09:05 +0000
Message-ID: <3a8a9439889effaba6ebf18d9a07ff9d06d38b48.camel@intel.com>
References: <20210913044935.30958-1-Qi.Chen@windriver.com>
	 <24d8ba47f26a0d99ac4f0f158283d68c3f13ecae.camel@intel.com>
	 <5389a90e-bd2e-3950-e4fc-4d1154bd8073@windriver.com>
	 <1adc6851d1f27a41acd90c4c7ba755126743f3ac.camel@linuxfoundation.org>
In-Reply-To: <1adc6851d1f27a41acd90c4c7ba755126743f3ac.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a48ae636-3b72-43f3-1bf0-08d9771c3f2e
x-ms-traffictypediagnostic: BYAPR11MB3031:
x-microsoft-antispam-prvs: <BYAPR11MB30310F510054164A6AD5BE5BF8DA9@BYAPR11MB3031.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: edO0iky1H0TeOYBoX973Y6ds4m0HzwIXhvzz4s3XwmUs5Su9ZUcTk0ZOIiNXyDsBfJgkw7lOrNiJwkzIJ+1ctAxjV/jyhCdh8+TaTk/GL0im+KIc5+JOgOPSEA7En7TC2UhvtYJgx0a5gXlnJtc+DmDo3oZHNtWJBvuovfcuhzMt6O3c4lgMC2+6DopqIB0lK8LCyBFozAaCUfvds1c8YRcpvBXFmPXuuS+HV/BRg0UbBuXPbQTZDWpss675E7fM9VnFvInBuvIWTyFfuIeCoSAC0U7AVmVpoKSovPyxeXbe2OS7BhXvN9UuaFEJUGgoWJkSHe0YfW/f37WVCBOPTDiY8n1xsLZkHHPMkazMdYXnzbPlWfJdsWHsostzOTSFH+/EJ44k4OVE+7/zg8n0otWqDoORJXcuyILLAKbLTK+pwHmufFyH2NAJxxV2nOFns+awj7qWt5cG86D7V401zL+CTilAcFgnLM2W08FGpKwFs2mCrxR709HuzN+Qxv0JFyJQ8ID1UbskHjRpOaSqQj0h2U0+URO7d3spnlCBcazMfh8R6mMYf50dQO+62or/ni7F+mTuUeKNfFRODW1rvtXxGeKVv563G8GuHQIYbbfVxOERPAEPCFcWS/qxJYDF1tBPo//FaO0LN3YboZaNUB7cUoyv7IUj5KXCVlq33AicYFOCLsSJ6qDzERhgQu6UHRTR8+N0uuf8RuSME6oucIFOP+yyeWFKRdZ3kQy5rRyTopDwcO7pRgNq7P7PXk8tf3NQ84GimaIYvRD73z1kIaSv10esLskKbszdJVKim64=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(66946007)(66476007)(66556008)(36756003)(122000001)(66446008)(64756008)(5660300002)(86362001)(38100700002)(2906002)(8676002)(71200400001)(76116006)(8936002)(26005)(110136005)(508600001)(966005)(6506007)(6486002)(38070700005)(186003)(316002)(2616005)(83380400001)(91956017)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWxSb3ZxeEJaNk4yWndFMjVoVTBZZGdCalB2UWl6aHJiYXlhaWF6Wks0Mktt?=
 =?utf-8?B?ZHRRWlZnQXd1djFnOVZUcnRnYTB4VkQ3TDNIQ1U3aks5OUx4UW1nL2JIMkMv?=
 =?utf-8?B?TWxhUVNOemdSRG1wbjNrY2JsRFRiRmlSNHM1NFNjYTFzUy9pdC9DQkFQOFdo?=
 =?utf-8?B?ZlZJL2IydnFvaE9OczFYeS9PSUhGSGNiMStRZjJPbko3cEN6SEZSQ1BhaEN5?=
 =?utf-8?B?N2Z2NlA5YkZsK2F2YXdwRGVsdzRNRWIwNytqbDMyMms1RXlLWllRWDIvRm4w?=
 =?utf-8?B?YytHTDhZc2hXSVovOXE0d3lMYkMrV1FZWk9BZWh2QmNaQUhLY05IRXBiVktz?=
 =?utf-8?B?RjFIMWtSdkljOElzd3phYXQ3NXRBWi8xdjlJTTB0cEx4M0prQXVoUGxzL1NC?=
 =?utf-8?B?MUlWOCtrN2RlVUZsRnNrREJ2MDhENzVvdjh6N0w4R0ZtYXBSN2IwbjJ3T0M2?=
 =?utf-8?B?YzlPYmxlVTVQLzdlWXR3Z1hoMnBENVgyZlJFbHdpbHgvZUsxNm5BZ2czakh1?=
 =?utf-8?B?VVNxVlR5cmV5c1Y4cnJXWDZ5am1FZ01PZEh4NE5KUllRR2NYQStXeU1wOHIz?=
 =?utf-8?B?Mi9INkh2WWlTaUlrUEpjTjVrQjFnOWRiOEhWK0dyMTlYVHZ3VVB6VmdxTTQ3?=
 =?utf-8?B?UE9PazdUVmlGSHd4cEI2ZEpxRGJrY0QrS0xUcDZOeFRCTFltTUFPWE43UE1W?=
 =?utf-8?B?MDhQbXVwSUFnbjcwRHpPZlhSLzJnRSt5RTZjVkptM2xDaElRaVIzeVhVajVn?=
 =?utf-8?B?VnR6aVNsMlBGbWp2QXg4dDFWdnYwdHNuTUpBUGl1bDlSSWZGSjgxeGkrV3RR?=
 =?utf-8?B?MWl0M3haZ2VCUWhDSkQvbW81ZXRhdFRDUHRWNFdNVVNUUzRlT0E3UkdYQzdV?=
 =?utf-8?B?dDFQRlphZVpndnRYVzZwblRZbFV2K2s2cnY4Q1NDSlUyRkRYY0pKT3ZRRkNX?=
 =?utf-8?B?b0RNU0tiZVdBaHZ4TERCZGJnQlRvQU1FMTRMcEtJbUtDWXZVcGw2Yithenpo?=
 =?utf-8?B?c3hoWWc2YW1aK3A5Ry83UmRCWGcwNDFkVzhjSDNIc1U0R3MzdEpHcGprRWpI?=
 =?utf-8?B?Y3A4cGY2eDFsRUhydjRySmlEOEE5MEhqNk1ZNFNWSTE0L1MxVU9aWW1rL2dX?=
 =?utf-8?B?dXIyanJYaFBta3JzOHlIZnUyc2lBWi8rd3NBUjhYU3VGYTJlRG9vRm94Mjl6?=
 =?utf-8?B?bHR1cU56ZXZGQjE0SWo0QWlFcy9rWnBGcVdFdGUybWg5YXJuWTFMSlBXbVlQ?=
 =?utf-8?B?Tm9KY0FreUI2VVRXeUh5ZXcxM3JWUC9kY3JvbDR6Z0xaeG1XTjlXTWdYbmNJ?=
 =?utf-8?B?SVNwWW15QmpMOTFJcjBZcDVBNnA5RkpJVms1czJwWEtLZ0ZzaXlqQjNNY25O?=
 =?utf-8?B?d0dCakRoc3Uwa2tkM2JmbXhQWmhrYzZZNEZqVExBQXFzL2lPT1JGS0dWTGov?=
 =?utf-8?B?NjNxY050clFQNTQ1ZjVtaHBZcG1ObXpQOTJialg0Q2tlUVFQbjV5ek8rYTBl?=
 =?utf-8?B?T3dyRlVIbzRkc2hZeW54aEhKeDdVY0gvcTFSVEh6dlBnRzR1SHgxN0FqVzl6?=
 =?utf-8?B?aFh0Y2gyQ3Q0OWthejJPalpCL0xIRkdSTmxLUElBOTMxSUI2TnZWRzgra1RZ?=
 =?utf-8?B?WlhsSXhRY2dyaFMrQ1NMcit5ZlRiQ05ZS3V5ZGVxV1g0cUtWNS9xZ0VmOHlV?=
 =?utf-8?B?UjFVR0pzckFRckdTcXZ3MmE4TGtCWjIzeTYvSUY4UXBmQVBBVnIvZ0U5L2w5?=
 =?utf-8?B?b1RPUlNoTjNDaGx0YUlTWml3ekZRd2Y0WjVFdndpbEtlZTFxWXRKNFFpNFkx?=
 =?utf-8?B?eVlyRzlmNUtLMzFzZlJrZz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48ae636-3b72-43f3-1bf0-08d9771c3f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 01:09:05.1107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TOozPwfNz4/9qFa3PZbkc7d5ClOKjeiklpB8iYOvr6joAJ3PS0q1U90HSTzkicsWSFiyTvsstNEX8oxd+Q35DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3031
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6CFB46620B22747B9E6203F6E459D8D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIxLTA5LTEzIGF0IDExOjU1ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gTW9uLCAyMDIxLTA5LTEzIGF0IDE2OjMzICswODAwLCBDaGVuIFFpIHdyb3RlOg0KPiA+
IEp1c3QgZm91bmQgdGhhdCBSb3NzIGhhcyBzZW50IG91dCBhIHBhdGNoIGZvciBDVkUtMjAyMS0z
ODE4NSBhbmQgaXQNCj4gPiBoYXMgDQo+ID4gYmVlbiBtZXJnZWQgaW4gaGFyZGtub3R0Lg0KPiA+
IFNvIHBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaC4NCj4gPiANCj4gPiBJJ20gYWxzbyBjdXJpb3Vz
IGFib3V0IGhvdyB5b3Ugc3BvdCBzdWNoIGlzc3VlLiBCeSBkb3VibGUgY2hlY2tpbmcNCj4gPiB0
aGUgDQo+ID4gY29tbWl0IGxvZ3MgaW4gY3BpbyByZXBvPw0KPiANCj4gSSBoYWQgbG9va2VkIGF0
IHRoaXMgb25lIGEgbGl0dGxlIGFzIHdlbGwuIEknZCBsb29rZWQgYXQgc29tZSBvZiB0aGUNCj4g
ZGlzY3Vzc2lvbg0KPiBmcm9tIHRoZSBkZWJpYW4gY29tbXVuaXR5IG9uIHRoZSBDVkUgYW5kIG5v
dGljZWQgdGhleSB0YWxrZWQgYWJvdXQNCj4gcmVncmVzc2lvbnMsDQo+IHdoaWNoIHByb21wdHMg
eW91IHRvIGxvb2sgZnVydGhlciBpbnRvIHRoZSBpc3N1ZS4NCj4gDQoNClllYWgsIHRoYXQncyB3
aGF0IEkgaGFkIGRvbmUgdG9vLiBEZWJpYW4gdHJhY2tlciBoYXMgYSBuaWNlIHN1bW1hcnk6DQoN
Cmh0dHBzOi8vc2VjdXJpdHktdHJhY2tlci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZFLTIwMjEtMzgx
ODUNCg0KVGhhbmtzLA0KDQpBbnVqDQoNCg==
