Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.300.1594832963155865790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 10:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=Mw6JsEYK;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1996; q=dns/txt; s=iport;
  t=1594832963; x=1596042563;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZrEBmMBJghYBXA8Rot4d8xFGD92SHHxWkOxSRz1RUOc=;
  b=Mw6JsEYKJVSevBz7g/BHXiJRsTkCoQkzYk3+YI0MZPhqoL9/ivsCVcpz
   7vCPObzUM6HxpXreEbhj0tJYZWEzcT5J/KMhViRJFZZ6qT6Q2Ojyd0yRv
   xgULPrb8oyI5vMeSWvrLce4IfJFvEtlcmxsdg+GPQHI91zmm3d4bG1n1T
   k=;
IronPort-PHdr: =?us-ascii?q?9a23=3AggZJKhIHaciJykuvi9mcpTVXNCE6p7X5OBIU4Z?=
 =?us-ascii?q?M7irVIN76u5InmIFeGvKk/g1rAXIGd4PVB2KLasKHlDGoH55vJ8HUPa4dFWB?=
 =?us-ascii?q?JNj8IK1xchD8iIBQyeTrbqYiU2Ed4EWApj+He2YkdQEcf6IVbVpy764TsbAB?=
 =?us-ascii?q?6qMw1zK6z8EZLTiMLi0ee09tXTbgxEiSD7b6l1KUC9rB7asY8dho4xJw=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C2AACzNw9f/5xdJa1gGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIFKgVJRB29YLyyEM4NGA41ImF6CUwNVCwE?=
 =?us-ascii?q?BAQwBARgHDgIEAQGETAIXgXICJDgTAgMBAQsBAQUBAQECAQYEbYVbAQuFcAE?=
 =?us-ascii?q?BAQMBERERDAEBNwEPAgEIGAICJgICAiYKFRACBA4FIoMFgksDLgGfFAKBOYh?=
 =?us-ascii?q?hdoEygwEBAQWFLRiCDgkUeioBgmmDVYYzGoFBP4QhPoJcBAGBXIMWgmCSS6F?=
 =?us-ascii?q?kgQQKgl2IU4pShjYhgniBHogdhSWNYpF2nnoCBAIEBQIOAQEFgWojgVdwFYM?=
 =?us-ascii?q?kCUcXAg2OHoNxhRSFQnQCNQIGCAEBAwl8jy0BAQ?=
X-IronPort-AV: E=Sophos;i="5.75,355,1589241600"; 
   d="scan'208";a="524331670"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jul 2020 17:09:22 +0000
Received: from XCH-ALN-001.cisco.com (xch-aln-001.cisco.com [173.36.7.11])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 06FH9MqP025019
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 15 Jul 2020 17:09:22 GMT
Received: from xhs-aln-002.cisco.com (173.37.135.119) by XCH-ALN-001.cisco.com
 (173.36.7.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 15 Jul
 2020 12:09:21 -0500
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by xhs-aln-002.cisco.com
 (173.37.135.119) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 15 Jul
 2020 12:09:21 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-002.cisco.com (64.101.210.229) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 15 Jul 2020 13:09:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8ybQaVNcsbvbwGr8igoJUdAa9Uz/Be+STs5UnC1zdEL+e0Eb84ocItp6/bmlrG6pGoH/+r7Ttfg6aRi1W/l6vOH1Ju0o2wfjdBjHBEKoLrfVBesWJkq+IqakJ9WcFu0+BQJNR4a4OBIFgT0M5bfIEt5Ejd44cKz+H7DkaD26YwhPNbZR1hc3f6IoVBvgpTL4qLK8560l2+vOXehEaqVe8h08thNB/3/eNMWWtZFPWt3Cyke//4KsCEGEIIPwln5G3EiOHjFiA1pt/BqpoFkx7mOx6Kav4qHA+gm6+R6mh+hgFb0X5e/9rVM0lKO7/14lPpMiYIdhOfhx2nfhm93pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrEBmMBJghYBXA8Rot4d8xFGD92SHHxWkOxSRz1RUOc=;
 b=Xal6sklb48iMgnZrEMkre7HOovR91tSVarWfdnhPcuB6R84FPpvwRblJ5TT4A2ZsscrTf1Kzkro0HHZ9tkYFHFMnKRmf6PJUcwIsZxM6ifzDha6jo4cZDLoIHedCkR6cge1TlaN0fppwBxRbu+X0dwMk46dL9/W3RXONw3PRxHtDL0vpKBBxn99wKBZ53udECyz4OwQuAV8beep74CSKdgHev18Khd+k3PkAzhXPFavXDBqyrtBAc5CEC3NAUet8PIosjmgM2VY2A1jYxTxc7xq21PB7gJoXLs9o4ESSPmU2XMZzd6I9wyLYwM8RkoeeNoPGkNmDeR5hoPCh38KYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrEBmMBJghYBXA8Rot4d8xFGD92SHHxWkOxSRz1RUOc=;
 b=yKAxeamucu4cykCAfrqmd6lusMcaSLwM+8uEMGKCHGyw5+gq+tJ1KAYoxN5HkmQClX+Vx6p/pxsgysjrh71uo2L2C0aNRK6xGaRYcFlQg7XlqzoF/tnfTClUU8DilpkAS46bDU0MqOdw1SNrdHRPK4NP3flLcKSGDcXJbtWyzR0=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BYAPR11MB2613.namprd11.prod.outlook.com (2603:10b6:a02:cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 15 Jul
 2020 17:09:19 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 17:09:19 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [PATCH] qemu: use host pkg-config only when host provides sdl
Thread-Topic: [OE-core] [PATCH] qemu: use host pkg-config only when host
 provides sdl
Thread-Index: AQHWWJRxH/6t7cQ1402drhAd4BrpmakIX86AgACEY4A=
Date: Wed, 15 Jul 2020 17:09:19 +0000
Message-ID: <0cef3914ade47872815423de749d0885759d24e8.camel@cisco.com>
References: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com>
	 <20200712213551.2206605-1-takondra@cisco.com>
	 <CANNYZj8QBo7X5qoq3yse8rO3qh47_zTWkm6hkRUng2hHmj+c_w@mail.gmail.com>
In-Reply-To: <CANNYZj8QBo7X5qoq3yse8rO3qh47_zTWkm6hkRUng2hHmj+c_w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8efc874c-6190-4eeb-ec1b-08d828e1d03c
x-ms-traffictypediagnostic: BYAPR11MB2613:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2613C27DC3D9E416F3AA44B8C87E0@BYAPR11MB2613.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: amgwijqCyVGN/IAHmiy6ig2G7mTlCRnZ6zNlWrIbBAdxIQ9Nu0pYBqiMb39Bayk0HPYJ/2nLA5QiI2DwhvUAuFCUe4R6EWpDkYPO7+wZPxMW8HwlgdVF8J2aYOsscgMf4zccE91x6oJpcL+gV2bg33NNCAM0HQajNUF/fKftItyiapAt7kCdciz3ilvVUCwbhDedCBclrMLrlpGU7rR4zk87uw9AK2iwMSfXO+sWyaG8uDux9MoDqwuks1TImVZLVHstxjGkmGSokgYQYUE6wDpnIgqQQG0FT8fhwrzDzKFRQk5Z4GA1E1iZOFYL319gnscgKlFHdXq9n49N+QqmPA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(316002)(6512007)(83380400001)(54906003)(66476007)(6486002)(64756008)(478600001)(66446008)(66946007)(2906002)(66556008)(36756003)(76116006)(5660300002)(2616005)(186003)(4326008)(8676002)(86362001)(8936002)(6916009)(71200400001)(107886003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Go6KD1M2JxbFcweB6b78aF+VCJXia0tt76ak50bPjxRIqt7SNuAj44i5U4WxJyFym5s0v6p4n5U+yzbV3EdD79bjFFZ0Uu26QkDE+7sJBZiLrD+f7SxzVk+q63fDyGz/8ESbro/X3JcRZuEGhGEbdEskR7ruWaMJ0fqv2oVuRqCFLZ9lemFr70SDxfhcJY/G7KuMu9uBd3xl6TY3BHjIrk3o8NycyMzpqVQNhIfzzvFS0OKR8i4up9H/FjyStuKijWLmb89nBVCTBraBeiTMsELd1LQqsUtRnb+bZCrLd7nBCHFnk+gZkMslNIUU3S3OzSlgu3dtE51467OovfPFoOjEQmCJprNwukzvtx/ICCFKD2+2B8UvvA3ZooqgchJFx0NvWzfjvqcL/hMmSlZ4NloIKDV3ijQKHxWCTu9P3hqSp0zvrSGv/NqrVr9fucYRtpTzHcy+9uJ+vARHQJ5ormgmszHs9XisHSqAc624zcjisFzb27KIRwhzc1PVOEvVk3wQQju0I2LvsnnnEX9v7Q==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8efc874c-6190-4eeb-ec1b-08d828e1d03c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 17:09:19.8451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRiPPo/SqJIr1Ced4rc/71KmBCj5VDu3gaOkEjj5QOrYVfDQmHyr1Dfh8k5RkANNJWdnbDeNcMjvkp6BdnEFRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2613
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.11, xch-aln-001.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <277A61B2E78DBD44B5D01DEFD5C2841B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA3LTE1IGF0IDExOjE1ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gU3VuLCAxMiBKdWwgMjAyMCBhdCAyMzozNSwgVGFyYXMgS29uZHJhdGl1ayB2aWEN
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8dGFrb25kcmE9Y2lzY28uY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0KPiA+IEZvciBleGFtcGxlIGlmIHhrYmNvbW1vbiBpcyBw
cmVzZW50IG9uIGhvc3QsIGJ1dCBub3QgaW4NCj4gPiBidWlsZHRvb2xzLXRhcmJhbGw6DQo+ID4g
fCBidWlsZC90bXAvd29yay94ODZfNjQtbGludXgvcWVtdS1zeXN0ZW0tbmF0aXZlLzQuMS4wLXIw
L3FlbXUtDQo+ID4gNC4xLjAvcWVtdS1rZXltYXAuYzoxNjoxMDogZmF0YWwgZXJyb3I6IHhrYmNv
bW1vbi94a2Jjb21tb24uaDogTm8NCj4gPiBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+ID4gfCAg
ICAxNiB8ICNpbmNsdWRlIDx4a2Jjb21tb24veGtiY29tbW9uLmg+DQo+ID4gfCAgICAgICB8ICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gfCBjb21waWxhdGlvbiB0ZXJtaW5h
dGVkLg0KPiA+IHwgbWFrZTogKioqIFtidWlsZC90bXAvd29yay94ODZfNjQtbGludXgvcWVtdS1z
eXN0ZW0tbmF0aXZlLzQuMS4wLQ0KPiA+IHIwL3FlbXUtNC4xLjAvcnVsZXMubWFrOjY5OiBxZW11
LWtleW1hcC5vXSBFcnJvciAxDQo+IA0KPiBRZW11J3MgeGtiY29tbW9uIHN1cHBvcnQgaXMgZGlz
YWJsZWQgYnkgZGVmYXVsdCB2aWEgUEFDS0FHRUNPTkZJRzoNCj4gUEFDS0FHRUNPTkZJR1t4a2Jj
b21tb25dID0gIi0tZW5hYmxlLXhrYmNvbW1vbiwtLWRpc2FibGUtDQo+IHhrYmNvbW1vbixsaWJ4
a2Jjb21tb24iDQo+IA0KPiBTbyB3aHkgaXMgaXQgdGhlbiByZS1lbmFibGVkPyBDYW4geW91IHRh
a2UgYSBjbG9zZXIgbG9vayBhdCB3aGF0DQo+IGhhcHBlbnMgYXQgY29uZmlndXJlIHN0ZXA/IFRo
ZSB3YXkgSSByZWFkIGl0LCBpdCBzaG91bGQgc2tpcCB0aGUNCj4gd2hvbGUgcGtnLWNvbmZpZyB0
aGluZy4NCj4gKHBsZWFzZSBjaGVjayBvbiBsYXRlc3QgbWFzdGVyIHBva3kpDQoNClRoaXMgc3Bl
Y2lmaWMgeGtiY29tbW9uIGlzc3VlIHdhcyBoaXQgb24gWmV1cyBicmFuY2guIFlvdSBhcmUgcmln
aHQsIG9uDQpEdW5mZWxsIGFuZCBtYXN0ZXIgdGhlIGNvbW1pdCAzZjFmZDE1Y2YwZGYgKCJxZW11
LXN5c3RlbS1uYXRpdmU6DQpkaXNhYmxlIG9wdGlvbnMgbm90IGluY2x1ZGVkIGluIGV4dGVuZGVk
IHRhcmJhbGwiKSB3aWxsIGhpZGUgdGhpcw0KaXNzdWUuIEJ1dCB0aGUgaXNzdWUgaXMgc3RpbGwg
dGhlcmUuIE9uZSB3aWxsIGhhdmUgdG8ga2VlcCBhZGRpbmcNClBBQ0tBR0VDT05GSUcgb3B0aW9u
cyBmb3IgZWFjaCBjb25maWd1cmF0aW9uIHRoYXQgY2FuIGJlIG91dCBvZiBzeW5jDQpiZXR3ZWVu
IGhvc3QgYW5kIGJ1aWxkdG9vbHMgdGFyYmFsbC4NCg==
