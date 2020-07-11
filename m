Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web10.1625.1594431084121324976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 18:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=HlQZjZqv;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1700; q=dns/txt; s=iport;
  t=1594431084; x=1595640684;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+VYkFUGlSOUbXNBMhMl1c50NQk+tkKPlIqWXA21eQVw=;
  b=HlQZjZqvvY4ADd5j59nH83OXDQbmvs5jnteDXvvqhY/6nvIS7NKfEeik
   4UP17rG6qKyeCG8NwO87l3LD8UuQTbblMp1qj3nF6FgSWTJk1IRP7woid
   GN7RgkTPutlfbBcn6sRIkX3qmDGYMSjNLOJqyM3TwQYi3rZKttinrYxjy
   I=;
IronPort-PHdr: =?us-ascii?q?9a23=3A+FYboBZSQv6/tdee03wZTNn/LSx94ef9IxIV55?=
 =?us-ascii?q?w7irlHbqWk+dH4MVfC4el21QSXD4Ha7e9Uhe3LtazpRW0H59CGqn9ROJBPVh?=
 =?us-ascii?q?pQj8IQkkRgBcOeEkT0IbbsaDByB8VNUlJpvhTZeUhYEcrzfRve93u16zNBHh?=
 =?us-ascii?q?T5KBp7IfnzFofOjsOxkeeo9M6bbwBBnjHoZ7R0IV2/phnQsc9Dh4xkJ8NTgh?=
 =?us-ascii?q?vEq3dFYaJY32RtcFmShB37oMy3+c1u?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ApAAAlFglf/5RdJa1gGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIE5AgEBAQELAYFRUQdvWC8shDODRgONUJR?=
 =?us-ascii?q?eg3+CUwNVCwEBAQwBARgLCgIEAQGETQIXgX8CJDcGDgIDAQELAQEFAQEBAgE?=
 =?us-ascii?q?GBG2FWwyFcAEBBAEREREMAQE3AQ8CAQgYAgImAgICJgoVEAIEAQ0ngwWCSwM?=
 =?us-ascii?q?uAQ6eJgKBOYhhdoEygwEBAQWBMgGEDBiCDgMGFHoqAYJpg1SGMxqBQT+DbDU?=
 =?us-ascii?q?+glwBAwGBXBeCf4JgkgM9olsKgl2IT4pQhjYgnyYtjxWCIooflFACBAIEBQI?=
 =?us-ascii?q?OAQEFgWkkgVdwFYMkUBcCDY4eN4M6hRSFQnQ3AgYIAQEDCXyOewEB?=
X-IronPort-AV: E=Sophos;i="5.75,337,1589241600"; 
   d="scan'208";a="510954226"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Jul 2020 01:31:19 +0000
Received: from XCH-ALN-005.cisco.com (xch-aln-005.cisco.com [173.36.7.15])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 06B1VJW3027921
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 11 Jul 2020 01:31:19 GMT
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by XCH-ALN-005.cisco.com
 (173.36.7.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 20:31:19 -0500
Received: from xhs-aln-001.cisco.com (173.37.135.118) by xhs-rtp-003.cisco.com
 (64.101.210.230) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 21:31:18 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-001.cisco.com (173.37.135.118) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 10 Jul 2020 20:31:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1vz00Wz1vLPGJ/ilolLK+d/qWoa6sRdAuCSR+HYYoB6+3afPxO2OhfBdAdjxA93M50xDwX3PdHEnA5fTZddxvK0esUwzMUgLo7pLcq8LXm+OZDcZJ3UM9fBSbFGnRtGW2Oo5luW9nWIsZKSUSVuTi5OkntyKGdjvvLd9rjCx8DejJvN22PKnmng4tzZNff26Q4LfpCCjXJFp++LAyo6/JNMZadQdtMkoy8hy9eWyS+TGjusFxW1QGOGt5ndg10t1QF6kxwxikMDFuokFPs4Kny0lWXO6ZhKOUyZ6x4qenfaZ5R44sUxdTNO8rO7fSIvKy8HoJqY3X2oJMKrkqUq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VYkFUGlSOUbXNBMhMl1c50NQk+tkKPlIqWXA21eQVw=;
 b=Ndoa8FPiHf/vqEVWsbHdc+L2eXIFhQDSyTQz5s9Zyt5nBnH5uH4V+PAQje9jkUXe2ip+dP7Axubuew1wR9V3VwGdRlNmJZ1dvL4ouqmnigueo8dmAvi48PI65IQuV9RY64lAD5toUVm4TYow42ZaRImgoLpe4ROvp3AZyWnrlteBX7EYs2JSDs8moaQDrEFTTwtRIZWIqtEQM25T7TSxA/mO23Fa5GRUZvLDBHyWaaDgS2Sr4yWiBDfCKTQpFRFQ+UlQN5NpRYG8cjAQhPUkdHGLvQhVJHhxoN5p+wJpEM0SdtNFB1SD+b+dNrtpZgWJJDKuQXMLf5ucvkmKssHOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VYkFUGlSOUbXNBMhMl1c50NQk+tkKPlIqWXA21eQVw=;
 b=KElrq09LatwpU4wjcOUTLuNPWftCJePMwJpqkF2C3jBi6uGkiwAVkChFu3kCS3MiaaeCsBNs8VNwnYOWFqtxrbbZjABWc+hxlwPXufz1UZnU3/fqe25sK+mKgWR1fL2l+WOwYszsvyY8w0+sFPWNG356turwveB6Q1FRZelo8MM=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BY5PR11MB4055.namprd11.prod.outlook.com (2603:10b6:a03:18b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Sat, 11 Jul
 2020 01:31:16 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.021; Sat, 11 Jul 2020
 01:31:16 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "chris_larson@mentor.com"
	<chris_larson@mentor.com>,
        "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>,
        "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
Thread-Topic: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME
 to fix do_unpack
Thread-Index: AQHWVu13NisF4l9iV0Wj84HWd9Lzk6kBRyiAgAAJxgCAAEcmgA==
Date: Sat, 11 Jul 2020 01:31:16 +0000
Message-ID: <2dc5247eb81f3ebeebbbff923c7e381d2bae21cf.camel@cisco.com>
References: <20200710190810.1967868-1-takondra@cisco.com>
	 <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
	 <231f7c8e83cea1ef2d99bc6c40fb7b089192180b.camel@linuxfoundation.org>
In-Reply-To: <231f7c8e83cea1ef2d99bc6c40fb7b089192180b.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: 29860421-6ced-4e1f-2af6-08d8253a1b13
x-ms-traffictypediagnostic: BY5PR11MB4055:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB405573540DFD1CC0A8414C08C8620@BY5PR11MB4055.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: icrWU3hkoVyftgWuL/0yT1+hY15/XS/fqbY/DMu73bQ32jtxbd4vY7BDiKW6XOEpNFiFTMapVfV6wqmGt1U4Mh30oFEfivmxKzzczirV8CUVo0Fyb46zloPhfm5VOgB4Seq6Fey/CS3obAfjlCHbxR94UbcQwmW8bmGTluw4B8i62BrP4FFHZNUDJxvKpGVUZ9rcT6eWJxSczKozDnhwf8tO2mMEjBKye+EW+fWMqRh0WHNq925KJ+xKcLkZSNJaUcxcHx2s3ozoXgEoHFxg/ytvjztr0Aaq4Y6ngYeD6B2BBTrc7/rO49zC09k1VP44Jdoqq3W9Fo4NtakYKGJULQKpnUwIFJ9812v41sHSHDTvpHUCZf/sUsTbQJQO4TX7IPZEq3SLXm2MZuZ9n2dS8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(76116006)(5660300002)(2616005)(66946007)(86362001)(110136005)(6506007)(966005)(316002)(66446008)(66476007)(8936002)(71200400001)(64756008)(66556008)(83380400001)(478600001)(36756003)(54906003)(6512007)(186003)(107886003)(6486002)(4326008)(8676002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: V/qBMNS+7QloKz9vbTymvIaYiqvi9Oc81D9qNo5FHkryeS4cVCffBf9e0GY52fbPYIoWa+1iURRxBGvUI4sSRV7sjQzhrU8kYGXFJ/Xrs4NsmySDXZlhl5LYKkU4tRSDqCtJplKs7M6KqDKYF32Mu+eFOj65hgrvLE95PIQJRrtVwkmzWI0JR10NFlzpXWg8ym49ki+gxX0bUgvd0RFhiN1ZLPEasSaEbCMMCpkcTrRzWmFE52KQWZKEKMFqHjcdeY2C0xzOn5q9ypFoOGZn0UTX07DEAMKAHzVS9qOhmvJbcCRaUB8lKqQ00fEt+0hJoNLOCq02aYxjNanXxrlgSQ8EOdGcNScYU5Mv92paxsNlLqULWlg2k9UG4B4I168VZuf/FcvJXs6+eRlqoZDsjlCD9rJ/8qvy4hGbxo4mCSogKfak5kmCauUE5XMuOs9W4bLHR7fwuFjt8698hIYS3u/NIjFJ8ie+Xqd8mIco/hKkIVrWzwz3GIz4O822YQQA/z4FG/7GHZUIXA1Y/PoZzQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29860421-6ced-4e1f-2af6-08d8253a1b13
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2020 01:31:16.4207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QHwpV07xTpbW7b5Mb+Or8diozJq3ajFiM+a9tiWz/WWJjf+r4HAHBPFMR2xo8E8wkB7RbyhJG7q9doiohpST3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4055
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.15, xch-aln-005.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B881B4B235FA249984C12E6524D215E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDIyOjE2ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gRnJpLCAyMDIwLTA3LTEwIGF0IDIyOjQxICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3
cm90ZToNCj4gPiBJIGFtIGFibGUgdG8gZG8gJ2RldnRvb2wgbW9kaWZ5IGdwZ21lJyB3aXRob3V0
IGFueSBlcnJvcnMuIEluIHdoYXQNCj4gPiBzZXR0aW5nIGRvZXMgaXQgZmFpbCBmb3IgeW91Pw0K
PiA+IA0KPiA+IFRoZSBwdXJwb3NlIG9mIF9zeXNjb25maWdkYXRhIGlzIHRvIHN1YnN0aXR1dGUg
Y29uZmlndXJhdGlvbiB2YWx1ZXMNCj4gPiB0aGF0IGFyZSBzcGVjaWZpYyBmb3IgdGFyZ2V0IHB5
dGhvbiB3aGVuIHJ1bm5pbmcgbmF0aXZlIHB5dGhvbiBpbg0KPiA+IGNyb3NzIGJ1aWxkcyB3aXRo
IHJlcXVlc3RzIGZyb20gdGFyZ2V0IGNvbXBvbmVudCBidWlsZCBzeXN0ZW1zIHRvDQo+ID4gc3Vw
cGx5IHRob3NlIHZhbHVlcy4gRm9yIHRoYXQgdG8gd29yaywgdGhlIHJlY2lwZSBhbHNvIG5lZWRz
IHRvDQo+ID4gaGF2ZQ0KPiA+IHRhcmdldCBweXRob24zIGluIGl0cyBERVBFTkRTLiBJdCANCj4g
PiANCj4gPiBJIGZlZWwgdGhlIHBhdGNoIGlzIGZpeGluZyB0aGUgc3ltcHRvbSByYXRoZXIgdGhh
biB0aGUgaXNzdWUNCj4gPiBzb21laG93Pw0KPiANCj4gV2UndmUgaGFkIG90aGVyIHBhdGNoZXMg
bGlrZSB0aGlzIGFuZCB3ZXJlIHBsYXlpbmcgIndoYWNrLWEtbW9sZSINCj4gc2luY2UNCj4gYXMg
c29vbiBhcyBvbmUgbWVyZ2VkLCBhbiBpc3N1ZSBhcHBlYXJlZCBzb21ld2hlcmUgZWxzZS4gSW4g
dGhlIGVuZCBJDQo+IHN0b3BwZWQgdGFraW5nIHRoZW0gYW5kIGFza2VkIHRoZSBpc3N1ZSBiZSBk
ZWJ1Z2dlZCBhbmQgZml4ZWQNCj4gcHJvcGVybHkuDQo+IFRoZXJlIHNob3VsZCBiZSBtb3JlIGlu
Zm8gaW4gdGhlIGFyY2hpdmVzIGFib3V0IHdoYXQgSQ0KPiBzdWdnZXN0ZWQvYXNrZWQNCj4gZm9y
IHRvIG1vdmUgZm9yd2FyZCB3aXRoIHRoaXMuLi4NCg0KSXMgdGhpcyB0aGUgb25lIHlvdSBhcmUg
cmVmZXJyaW5nIHRvPw0KaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cveW9jdG8vdG9w
aWMvNzQ2Mzc3MzMjNDk1NzENCg0KSSBsaWtlIENocmlzJyBhcHByb2FjaC4gSSdsbCB0cnkgdG8g
bG9vayBob3cgdG8gbWFrZSBpdCB3b3JrIHdpdGggZ2xpYg0KYW5kIGEgZmV3IG90aGVyIHBhY2th
Z2VzIHRoYXQgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUUuDQo=
