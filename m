Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web11.5.1594418593178400597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=KDdyrSAm;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3564; q=dns/txt; s=iport;
  t=1594418593; x=1595628193;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PjCyYTOBoe0IyJx9NKiKQierJDUM1aQ6fLZfBxhLK2Q=;
  b=KDdyrSAmN/vBQciEbEfFZPUI9+HEP2WxiWIojDVYw70DRf9UOQ8EbOZA
   jNkrcbP4em6GLzw7Fd8ZZy72ZPVUZWAgC3YVuQNN+fatWyU78MPMC8ezV
   uiJ2Fdm2hbUDQJ8x9rfiQgW6T61VrwHmz43bMfjkkdAoNn84ZrysqwVfu
   A=;
IronPort-PHdr: =?us-ascii?q?9a23=3AxRaCkhOSyeKSjNE10lUl6mtXPHoupqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOG58o//OFDEvKwx3lDMVITfrflDjrmev6PhXDkG5pCM+DAHfYdXXh?=
 =?us-ascii?q?AIwcMRg0Q7AcGDBEG6SZyibyEzEMlYElMw+Xa9PBtaHc//YxvZpXjhpTIXEw?=
 =?us-ascii?q?/0YAxyIOm9E4XOjsOxgua1/ZCbYwhBiDenJ71oKxDjpgTKvc5Qioxneas=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D/BQA95Qhf/5JdJa1gHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgUqBUlEHb1gvLIQzg0YDjU6UXoN/glMDVQsBAQEMAQEjCgI?=
 =?us-ascii?q?EAQGECEUCF4F/AiQ4EwIDAQELAQEFAQEBAgEGBG2FWwELhW8BAQEBAgESERE?=
 =?us-ascii?q?MAQE3AQQLAgEIGAICJgICAjAVEAIEDieDBYJLAw4gAQ6eZgKBOYhhdoEygwE?=
 =?us-ascii?q?BAQWBMgGECBiCDgkUeiqCaoNUhjMagUE/g2w1PoJcAoFHGBeCf4JgkgM9ols?=
 =?us-ascii?q?Kgl2IT5EGIJ8mLY8VgiKKH5RQAgQCBAUCDgEBBYFqI4FXcBWDJAlHFwINjh4?=
 =?us-ascii?q?3gzqFZYRxdDcCBggBAQMJfI56AQE?=
X-IronPort-AV: E=Sophos;i="5.75,336,1589241600"; 
   d="scan'208";a="786917999"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Jul 2020 22:02:58 +0000
Received: from XCH-ALN-002.cisco.com (xch-aln-002.cisco.com [173.36.7.12])
	by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 06AM2wQA007190
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 10 Jul 2020 22:02:58 GMT
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by XCH-ALN-002.cisco.com
 (173.36.7.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 17:02:58 -0500
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by xhs-rtp-002.cisco.com
 (64.101.210.229) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 18:02:57 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-003.cisco.com (64.101.210.230) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 10 Jul 2020 18:02:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZ0dr26r420vE23ENO7hhRsnuPXnyi+wLWUMytGHsoli05chsfhbYBe9+2k2sBoWUCwRH4mTdlnJOwmMuPUt8Qz2T2G10U20shjG7c4uPV3BPMRyx1yAVl56Hug5zp2CbMnTxtsDxDywvz/Bwyy9JRU/WM6XzRDQEGop2hfZeKmQWp2PArYsZVw8ab+Bf3MoPh+PoAVU2P03ljDbU6/9ygOMdcXtT8eyON58Hq/y0VHrxo+iv+WQxbVzj5vwJhNeODllbyOCr2E9eN9+U0U490u0A/QVx0eRQr7ZK4ZUIZu4ucKHF9sOnKoKMGRziuClblMkDqS+DyCg7Cy2JdpYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjCyYTOBoe0IyJx9NKiKQierJDUM1aQ6fLZfBxhLK2Q=;
 b=kdAOt0EimXFWBqQ2havzegvVj5wunXpuignoMSviuV55FNVaGcpV10U3HbsVfcBwF9DI6uVIpxlh56FOtSGsV1/68IMaGnxDzQM11UGCep4CvXIRSWtz7Qcc43R3e+s8Ad7eOclnB1iTBnTf3MDsMGM9YA8Lk63A3cQ/S+dgPrp+A3dsMwu9jmG3ofZOsWXnTaOh1h1md9XbafGMsY2KdlGuOLDXZhcHr4lSb3xDrHqgKU+LbygtX0KHjZJXkk0/kyeivadDCFFFs21b6BgmALjh0MN6sR3uDlWpeYk8KsqVqASMzRHpz7pX+6qwQrsv2GeUoCndHcETlFkvJjEYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjCyYTOBoe0IyJx9NKiKQierJDUM1aQ6fLZfBxhLK2Q=;
 b=Y3nxlYdl1bowps/pU2BqIMwHevi9TkcjIJ+hkGXNbz64tsoipi46WLsewvvsQwc8p63zeyrDvzHE4aUmcmBfbqskjCGkaEPxNqwNHT8Fc8yXOONV6j7WXB3YS+9QGCximy1Ot2qu0ucRO+thJpmEWL0kfS6LnSponD1tvC4eOrs=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BYAPR11MB2888.namprd11.prod.outlook.com (2603:10b6:a03:8c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 10 Jul
 2020 22:02:54 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.021; Fri, 10 Jul 2020
 22:02:54 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Martin.Jansa@gmail.com"
	<Martin.Jansa@gmail.com>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
Thread-Topic: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME
 to fix do_unpack
Thread-Index: AQHWVu13NisF4l9iV0Wj84HWd9Lzk6kBRyiAgAAWtIA=
Date: Fri, 10 Jul 2020 22:02:54 +0000
Message-ID: <328b3757b8071e7c08776c0d6dd3a6ef8d52b089.camel@cisco.com>
References: <20200710190810.1967868-1-takondra@cisco.com>
	 <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
In-Reply-To: <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18c70ff8-3546-448d-cf88-08d8251cff51
x-ms-traffictypediagnostic: BYAPR11MB2888:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2888EF620C9E266C374A9645C8650@BYAPR11MB2888.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DbAA7Pjx5mL/CeLiUrjtUC5e7/gTnpNhA7Midp6iUEVg8/ou5u57Rkw0ugHGgtqjL/jDzLJVJ3xlWQMFwhZ913Rt5jJ6mhWPRT2wUWqDhBhKHDw20kQhyvB466DIkQLgH4T8dYdXjL39hnMNqYKOEO0QeKyzsHSGyhMh1e+8JMa38uEuFuGpy9ipzj3tLNkyIraJMtFfGMkdfQAg9UnsLDT9wULYRXge0dKpb5eHl6nxHG5GmLn57isdyHhdarIGCHUwZGWcW/aNr84cxOX93nJX5jZQ49TC0hg1bZBNxDmv7f4R3D4qa10Bh3GRb+1WE8O5Pv7fEnoxQS0ep+gvxp4rXaWkIAxCm/Aun79zU8V/6hNyizTWUYo+RfrH6bwm4v65dstP1XlTU8TPKYvfaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(6512007)(66556008)(86362001)(83380400001)(2906002)(76116006)(66446008)(64756008)(2616005)(66476007)(6916009)(66946007)(71200400001)(8676002)(4326008)(478600001)(36756003)(107886003)(6486002)(5660300002)(966005)(316002)(6506007)(186003)(54906003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Y/ZJ6y7/XpX4/NkrdFF6LyErtXP7GDt14qKZPw2ppVjJ79cyyJ2QxHTyXen55W/5BV4KrBX9Bj16bKiHf9hhna8iu5XZ41eqg0ehHr44hB5VngHGgmwUAqmuv59M4sPgJ6kqz+RWKJ+O0AbvFJZq0j2dfMXblaBlPZo4/zrBHZUXI5hKpXSrhsG1FbZ9VuErEN6QXbEGKX394TIzoO3fcKaYYSfq1i2Tyb/exXGlChGYKBzpIQ3O8OqtWnCN/9AblKVW+I2+T0Vfw0ZgQeqaPf+u2SBuIMPAZPAz996vvmaA0MV2so+ICCEPq9g/G5m/Fy6IfX6Cx11m7mNY18eiV4kCpHdgG40q5QhdGSOM7OyVJPWmXpmIcYlqwZ88gfhQxzcmR7J11FSK66rTeDvNznnTloOmp2t662GdyZ2KPuvf0gMgH9/0IxeWgDaN9guqiDRR0Syv8MM6uqTj0agHTxzMJvEP67UozONA8eFXGaICSi6SvwGq0r3W+UAvk5BmmDvdvcXC6xEZBjBOMscKnA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c70ff8-3546-448d-cf88-08d8251cff51
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 22:02:54.3989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /v64LCwdnvcAsrgAsuWNEUCMLQTsBozhUpkZX7Ey+52X2Pfj6CKrLiG7yw4eOMfvHuIFcO2Qu+kCTGATrLRAJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2888
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.12, xch-aln-002.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B495C226D615914F9AF01CECCDAAE984@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDIyOjQxICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gSSBhbSBhYmxlIHRvIGRvICdkZXZ0b29sIG1vZGlmeSBncGdtZScgd2l0aG91dCBhbnkg
ZXJyb3JzLiBJbiB3aGF0DQo+IHNldHRpbmcgZG9lcyBpdCBmYWlsIGZvciB5b3U/DQoNCkZvcmdv
dCB0byBtZW50aW9uOiBpdCBpcyByZXByb2R1Y2libGUgd2l0aCBob3N0IFB5dGhvbiAzLjYrLiBU
aGUgUHl0aG9uDQpzaG91bGQgaGF2ZSB0aGUgcGF0Y2ggdGhhdCBoYW5kbGVzIF9QWVRIT05fU1lT
Q09ORklHREFUQV9OQU1FOg0KaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2NvbW1p
dC85MmRlYzU0OGZmMTQNCg0KSSdtIGN1cnJlbnRseSByZXByb2R1Y2luZyB0aGlzIG9uIHRoZSBs
YXRlc3QgUG9reSBvbiBVYnVudHUgMjAuMDQgKGhhcw0KUHl0aG9uIDMuOC4yKS4gVGhpcyBpcyBh
bHNvIHJlcHJvZHVjaWJsZSBvbiBwcmV2aW91cyBicmFuY2hlcywgbGlrZQ0KWmV1cy4NCg0KPiBU
aGUgcHVycG9zZSBvZiBfc3lzY29uZmlnZGF0YSBpcyB0byBzdWJzdGl0dXRlIGNvbmZpZ3VyYXRp
b24gdmFsdWVzDQo+IHRoYXQgYXJlIHNwZWNpZmljIGZvciB0YXJnZXQgcHl0aG9uIHdoZW4gcnVu
bmluZyBuYXRpdmUgcHl0aG9uIGluDQo+IGNyb3NzIGJ1aWxkcyB3aXRoIHJlcXVlc3RzIGZyb20g
dGFyZ2V0IGNvbXBvbmVudCBidWlsZCBzeXN0ZW1zIHRvDQo+IHN1cHBseSB0aG9zZSB2YWx1ZXMu
IEZvciB0aGF0IHRvIHdvcmssIHRoZSByZWNpcGUgYWxzbyBuZWVkcyB0byBoYXZlDQo+IHRhcmdl
dCBweXRob24zIGluIGl0cyBERVBFTkRTLiBJdCANCg0KV2hhdCBjb25maWd1cmF0aW9uIGRvZXMg
aXQgYWltIHRvIHJlcGxhY2U/IFdoZW4gSSBjb21wYXJlIGRlZmF1bHQNCl9zeXNjb25maWdkYXRh
X19saW51eF94ODZfNjQtbGludXgtZ251LnB5IHdpdGggX3N5c2NvbmZpZ2RhdGEucHksIHRoZW4N
Ckkgc2VlIHRoaXM6DQoNCiUgZGlmZiAtdSAuL3Vzci9saWIvcHl0aG9uMy44L19zeXNjb25maWdk
YXRhX19saW51eF94ODZfNjQtbGludXgtZ251LnB5IC4vdXNyL2xpYi9weXRob24tc3lzY29uZmln
ZGF0YS9fc3lzY29uZmlnZGF0YS5weQ0KLS0tIC4vdXNyL2xpYi9weXRob24zLjgvX3N5c2NvbmZp
Z2RhdGFfX2xpbnV4X3g4Nl82NC1saW51eC1nbnUucHkgICAgICAgMjAyMC0wNy0xMCAwMTozMzo0
Ny4xOTM1NzQzNDQgLTA3MDANCisrKyAuL3Vzci9saWIvcHl0aG9uLXN5c2NvbmZpZ2RhdGEvX3N5
c2NvbmZpZ2RhdGEucHkgICAgMjAyMC0wNy0xMCAwMTozMzo0Ny4xOTc1NzQzODQgLTA3MDANCkBA
IC01NzcsMTIgKzU3NywxMiBAQA0KICAnSEFWRV9aTElCX0NPUFknOiAxLA0KICAnSEFWRV9fR0VU
UFRZJzogMCwNCiAgJ0hPU1RfR05VX1RZUEUnOiAneDg2XzY0LXBjLWxpbnV4LWdudScsDQotICdJ
TkNMRElSU1RPTUFLRSc6ICdGSVhNRVNUQUdJTkdESVJIT1NUL3Vzci9pbmNsdWRlICcNCi0gICAg
ICAgICAgICAgICAgICAgJ0ZJWE1FU1RBR0lOR0RJUkhPU1QvdXNyL2luY2x1ZGUgJw0KKyAnSU5D
TERJUlNUT01BS0UnOiAnRklYTUVTVEFHSU5HRElSSE9TVEZJWE1FU1RBR0lOR0RJUkhPU1QvdXNy
L2luY2x1ZGUgJw0KKyAgICAgICAgICAgICAgICAgICAnRklYTUVTVEFHSU5HRElSSE9TVEZJWE1F
U1RBR0lOR0RJUkhPU1QvdXNyL2luY2x1ZGUgJw0KICAgICAgICAgICAgICAgICAgICAnRklYTUVT
VEFHSU5HRElSSE9TVC91c3IvaW5jbHVkZS9weXRob24zLjggJw0KICAgICAgICAgICAgICAgICAg
ICAnRklYTUVTVEFHSU5HRElSSE9TVC91c3IvaW5jbHVkZS9weXRob24zLjgnLA0KICAnSU5DTFVE
RURJUic6ICdGSVhNRVNUQUdJTkdESVJIT1NUL3Vzci9pbmNsdWRlJywNCi0gJ0lOQ0xVREVQWSc6
ICdGSVhNRVNUQUdJTkdESVJIT1NUL3Vzci9pbmNsdWRlL3B5dGhvbjMuOCcsDQorICdJTkNMVURF
UFknOiAnRklYTUVTVEFHSU5HRElSSE9TVEZJWE1FU1RBR0lOR0RJUkhPU1QvdXNyL2luY2x1ZGUv
cHl0aG9uMy44JywNCiAgJ0lOU1RBTEwnOiAnRklYTUVfSE9TVFRPT0xTX0RJUi9pbnN0YWxsIC1j
JywNCiAgJ0lOU1RBTExfREFUQSc6ICdGSVhNRV9IT1NUVE9PTFNfRElSL2luc3RhbGwgLWMgLW0g
Jw0KICAgICAgICAgICAgICAgICAgJzY0NCcsDQoNClRoZSBvbmx5IHJlcGxhY2VkIHBhcmFtZXRl
cnMgc2VlbXMgdG8gYmUgcmVwbGFjZWQgd2l0aCB3cm9uZyB2YWx1ZXMuIEFsc28NCkZJWE1FU1RB
R0lOR0RJUkhPU1Qgd2lsbCBwb2ludCB0byByZWNpcGUtc3lzcm9vdC1uYXRpdmUgd2hpY2ggaXMg
bm90DQp0YXJnZXQtc3BlY2lmaWMuIFdoYXQgYW0gSSBtaXNzaW5nPw0KDQo+IEkgZmVlbCB0aGUg
cGF0Y2ggaXMgZml4aW5nIHRoZSBzeW1wdG9tIHJhdGhlciB0aGFuIHRoZSBpc3N1ZSBzb21laG93
DQoNCkFncmVlLCBpdCBpcyBhIHdvcmthcm91bmQsIGhlbmNlIEkndmUgcG9zdGVkIGl0IGFzIFJG
Qy4gTm90ZSwgdGhlcmUgaXMNCnNpbWlsYXIgd29ya2Fyb3VuZCBhbHJlYWR5IG1lcmdlZCBmb3Ig
UFIgc2VydmVyIDRiMjZlYWY3MTUyZg0KKCJwcnNlcnZpY2UucHk6IGZpeCBkb19wYWNrYWdlIHdp
dGggbmV3ZXIgUHl0aG9uIGluIFVidW50dSAyMC4wNCIpLg0KDQo=
