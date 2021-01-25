Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.31271.1611542357839354512
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 18:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=nNlUf1BT;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: JpUJ7pCf5b+9+49lzj8rtBjTNXuLZxLpjP63xMX/6keF73Q0/exbraSnm1B6sXei6A1nkBHiK2
 M5fEvkm5IVQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="264475921"
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="264475921"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2021 18:39:16 -0800
IronPort-SDR: WeWCi0MrciY1ERmjxEAuzk/32H/4yx3Cjc34eH5UIWfx0yS4mspYszj4+G9pAy8n10KadYpLj5
 ipcNs2Hs7VYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="393083913"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 24 Jan 2021 18:39:16 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 24 Jan 2021 18:39:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 24 Jan 2021 18:39:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 24 Jan 2021 18:39:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ex4iIc0gqp8MMmQfyFOScmZWAsFuZO4FkfF0djEsgt2Mdyz/fJiSyzFKkJ7h8S72O6IfbuYvUeX+OvncjWNfy5Np2GoVwikMwCyN7b2k6Ubtz94ZsOZ+HajKo+/FTjFprqBgS9NDi+ViwZcAuxCbu5HIll9gq91ML8FE8FWmBHyMT/1L63syJGn8CGCoOmmjE+g3G/CBhJoUzOhjSaAu5lSHsSDVK3aBLf5qwzgBBzpyyqThQ7LBdI1gq+lV/tyMhyRx4X1N+uyrrbm6uTrhAysNCY/BGcF8tsLJEh3pqR2SvdCOf+zZuH9ciVNY3xrTUM8zvgQVk2zjXraLdIAYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYCp4LMkNraTs5r+gloZBfBN+UDlDCyUBFQZ2GpH6Xk=;
 b=Jglz0zJKUUsGKXXaV/Vc6bb8P5aKMwQEGIRnJVUQJTqODXfqcKxmlZHGSAaCATSP+I/4d0mtTTpc2BfHdywfV5ASq56XnnRWu4Y/CqEwxZI0FWJ8tvf3T2AXfanjCEE8VC07B0p2Ce8iUSq0GMt5oc+y4cfhZ23jNlkax7rMrHnAO3lgITTqLevGRi7r0tp5tccdcJgN6y/RhXsFy2FnuUbsF6B+4K1aMEjz2lMj/GQ7n/06ASOWiv20tpaOapwy4pvoH9YpDT8C2NxGagEOXu/6BpXgHyHsfA1yALCm6IgMBF1nCZ7oMGsyFHL3ZA/qGaNUxsQGjHGAZH5pMpehPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYCp4LMkNraTs5r+gloZBfBN+UDlDCyUBFQZ2GpH6Xk=;
 b=nNlUf1BTXTCU9BcftS+s1u1VcuvBNiOqWNuePLqJ7Tg//Zl4LlLwmWZ5PJ3z3eu7v/RPQhIL4V+lV22vV2VrDu+jWJE48B6oWICmjllOIADpSY1vlBxMVz+2VibI/v9deZax7n4WUWKTAQgcZuWLaWKLBxlEeZLYIGNl1Ux3jkE=
Received: from MWHPR11MB2000.namprd11.prod.outlook.com (2603:10b6:300:2b::23)
 by MWHPR1101MB2143.namprd11.prod.outlook.com (2603:10b6:301:4f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 02:39:13 +0000
Received: from MWHPR11MB2000.namprd11.prod.outlook.com
 ([fe80::68d5:9f61:8df6:9a36]) by MWHPR11MB2000.namprd11.prod.outlook.com
 ([fe80::68d5:9f61:8df6:9a36%5]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 02:39:13 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Jan 2021 07:15:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 24 Jan
 2021 07:15:01 AM HST
Thread-Index: AQHW8qeVVGI7k19FiUOLS537Ba5Krao3fTwA
Date: Mon, 25 Jan 2021 02:39:12 +0000
Message-ID: <MWHPR11MB20005F089BE21737CFA246E7B9BD9@MWHPR11MB2000.namprd11.prod.outlook.com>
References: <20210124171809.D838F960256@nuc.router0800d9.com>
 <cc80f8541aeef99a4625420fbf7d27dcc6abf341.camel@linuxfoundation.org>
In-Reply-To: <cc80f8541aeef99a4625420fbf7d27dcc6abf341.camel@linuxfoundation.org>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [115.133.6.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d80dc8d-b404-438c-e8e8-08d8c0da66a5
x-ms-traffictypediagnostic: MWHPR1101MB2143:
x-microsoft-antispam-prvs: <MWHPR1101MB21432620310B0E40072C753FB9BD9@MWHPR1101MB2143.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IFCtpGSmoYcZn74jR46IktRkg3i3Lk5buYqcSKnxtlCdrnuUqf6WSlfYN6SfsbBAj0e31q4SJM3kRK85g1mccm1LEzbd0tL3koXLTEG/kBPl5zfgS3v+Fx2Bq7Prwpdb0llksFW4X8k8JNx4eNG//TMs2nFvAzvmZEg5+j4sRSG8HCortvy6hWs3qCtZSnRIZWf+7Yzo9AjhmMCjl5fGP5q338HdcQMjdWAVwhzZmXR4rNaY4qDYzMjAZ8x0dvhSP99QyTH1YM0NACKH9nutqHY6sU/KXCRoVGbtSduyN4q/q+u0ALN8krveTGC1BUU3r+l1gbbEGX+ZVu0L4tfwgYa3Ky6sPSa2hVVQHLXDG9NaxyzYxhhNOI1yHtzzuQbsf5JLhBZvInj+bmiSxd14eQSNBN5x+RybplUmXqYIrZMWOpDnB8hsMz/Sq8en7dcI7DBXaK+FNl/hiLZG1Qb5B986MG1j8isk32ga7RtglN+xYIRn4HIuNO7PC+SLb5luBGzPvwXcCPbckJXyagSRLA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB2000.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(86362001)(15650500001)(7696005)(71200400001)(316002)(83080400002)(2906002)(5660300002)(26005)(8936002)(83380400001)(6506007)(52536014)(9686003)(186003)(33656002)(966005)(478600001)(55016002)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(8676002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NWwyNFJFcWsxNjVzTSs2NzFLdGRpNXd5aHRUL1krd3lrcExRZlRvV2dkM3BY?=
 =?utf-8?B?QmVHbXUrcXdpSkJycEIyd2NpQ29BK2Y5VzB5c2JBWDZtSldIeURVaUxZU2Jx?=
 =?utf-8?B?NzB5dDVESEMxdTJiRlI4YVBNSThSbE1peUUxbGtta05rZGtMalFEUk5aWTR6?=
 =?utf-8?B?WGs3R3FHUDBMVzR3UndBdThqOC92eWQ1VEszdzc5NndaaHY4SXNKVW5Jazdv?=
 =?utf-8?B?ajN4WEtqekg0S1dWRVV3dDJTY28ydllRbFlJMVB4QzB0YUxrc3R1UThSSVpR?=
 =?utf-8?B?NXpOV2ljZ0xjUU9uOG5uaEIxMHV6ZzUxaUgyczhhWnNtZENhOXo4ZmhPeVYz?=
 =?utf-8?B?RGRtd3VtZUxOZHFNQTFNTkFKcGtwMStoanh2a2RKcGsyUDZ6OWNzZlN2cHNk?=
 =?utf-8?B?Mkk4MjYxQ2cwaGJJSk5JK0VzeGJWcHVVNm16OTg0djBQeE5kRDB2aEhSVjhp?=
 =?utf-8?B?ZDc5MzI4dG5yanlFYmpFZUoxbk9kdVM0NlBLOWtZd3hZeVJkYmxmUHhmTk5s?=
 =?utf-8?B?aXFZdjZOSnpGS3I5L0tkelYwVTZRYmN1ZkhjMktJdDVKR05jK3l5cDQzYWla?=
 =?utf-8?B?V1Byd3FjUFY0VXZEaHlvWmF2V0hIbFFNV2lsNjJOc2pkeTZQQytvTW5kY1lT?=
 =?utf-8?B?eVBSem1aL1FUVzA5ZDR5MUhHb21YaExkV3JYMCtVQTJjVSs2OTB5TjUyVEQz?=
 =?utf-8?B?aXlPU01YOXBsSkxnSS9wTVZ5TThTY0p6RmMvbTVldm9Yb3RMUGpiOUtZejNt?=
 =?utf-8?B?RmdwYVZYUXlMbk5kaXAxUmZyN3hLTXI3MVU1RWF2c0hqNHhhWHNrNW9rMzhM?=
 =?utf-8?B?bnl6U01BVk9JbFdUdy9jYWxwQzlXUTUycGNTSkJEL2ZhUEFKWllQcHRkM2xL?=
 =?utf-8?B?cW9OWFlVMERpSUU1ekFIb3ZHM0Q2Z1ZrYjhFakFPTmNyQUwreVlwZFgyKzNs?=
 =?utf-8?B?K3p6RDUzSkpOdHkwa3NNRVMzWHBTeStkM0NBRzVmNXdlQ2JrKzM1U1Nia3p0?=
 =?utf-8?B?dmdWRnkvM1dOTmtSaWdsazkzZjgyam9MZzN4WDVYSzB6UEtjSjRZdndITy9j?=
 =?utf-8?B?Wnh3Ulo1U20yMkNYUnc4YXpua1FOM21PZVVJWlZMNi8vSDd2MnU1KzhtVkgv?=
 =?utf-8?B?SWZiMGp6U2R2aFVITHNlR3NZdTk5aFhhSjVqR2xJT2tXdGs2dnlXMlBXeXFN?=
 =?utf-8?B?MGNibXJzVlVPK1ROMHVTYUw1ZEtrdGRROHkwY2VjMTRYVlhmYjEyMkpaRzBQ?=
 =?utf-8?B?L0xvUXprNzZhWTBvUk5XUXh5RG5TQ1djdlFkaHBrYS9mdnlaS0FJY2dXRnZh?=
 =?utf-8?B?TlQwL284VkdHTUljbkRGRXV4a0R5K09RVC8wNlBrMXovTGRITGsyU3dvNCtE?=
 =?utf-8?B?SlNGdW5yUWdoMTl2aHZuZjdZLzVZSjZLdDJMdURkbUtFUEtGRG1GZWpzRDda?=
 =?utf-8?Q?2QXn15wa?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2000.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d80dc8d-b404-438c-e8e8-08d8c0da66a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 02:39:12.9148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCimUMcvgaI58+5ud1DVPNJ+axIdje9pwLhpZa0KkWd/FV0VI0cfWvENRReufM9wS6s781eeVlPnSHX2mIESUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2143
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGNoYW5nZXMgZXhwb3NlIHRoZXNlLCBpdCBpZ25vcmVkIHRyYWlsaW5nIGNoYXJhY3RlciBp
biB0aGlzIHZlcnNpb24gY29tcGFyZSAoICJpIiBpbiB0aGlzIGNhc2UgZm9yIG9wZW5zc2xfMS4x
LjFpICkNCihDVkUtMjAxOS0xNTQzLCBDVkUtMjAxOS0xNTQ3LCBDVkUtMjAxOS0xNTQ5LCBDVkUt
MjAxOS0xNTUxLCBDVkUtMjAxOS0xNTUyLCBDVkUtMjAxOS0xNTYzLCBDVkUtMjAyMC0xOTY3LCBD
VkUtMjAyMC0xOTcxKSAgDQpiZWhhdmUgdGhpcyB3YXkgYmVjYXVzZSBpdHMgZGlmZmljdWx0IHRv
IGRlZmluZSB0aGUgdHJhaWxpbmcgY2hhcmFjdGVycyAobGlrZSB2ZXJzaW9uIDEuMWIgY2FuIGJl
IDEuMSBiZXRhIG9yIHBhdGNoZWQgcmVsZWFzZSAxLjFiKSANCg0KDQpOVkQganVzdCB1cGRhdGVk
IHRoZXNlIHJlY2VudGx5IA0KQ1ZFLTIwMTMtMDgwMCwgQ1ZFLTIwMjAtMTQ0MDksIENWRS0yMDIw
LTE0NDEwDQoNCg0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj5TZW50OiBNb25k
YXksIDI1IEphbnVhcnksIDIwMjEgNzoyMSBBTQ0KPlRvOiBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBz
YWtvbWFuLmNvbT47IG9wZW5lbWJlZGRlZC0NCj5jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7
IHlvY3RvLXNlY3VyaXR5QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj5DYzogTGVlLCBDaGVlIFlh
bmcgPGNoZWUueWFuZy5sZWVAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFJlOiBbeW9jdG8tc2VjdXJp
dHldIE9FLWNvcmUgQ1ZFIG1ldHJpY3MgZm9yIG1hc3RlciBvbiBTdW4gMjQgSmFuIDIwMjENCj4w
NzoxNTowMSBBTSBIU1QNCj4NCj5PbiBTdW4sIDIwMjEtMDEtMjQgYXQgMDc6MTggLTEwMDAsIFN0
ZXZlIFNha29tYW4gd3JvdGU6DQo+PiBCcmFuY2g6IG1hc3Rlcg0KPj4NCj4+IE5ldyB0aGlzIHdl
ZWs6DQo+PiBDVkUtMjAxMy0wODAwOiBwaXhtYW4NCj4+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdv
di92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAxMy0wODAwICoNCj4+IENWRS0yMDE5LTE1
NDM6IG9wZW5zc2wNCj4+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWls
P3Z1bG5JZD1DVkUtMjAxOS0xNTQzICoNCj4+IENWRS0yMDE5LTE1NDc6IG9wZW5zc2wNCj4+IGh0
dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAxOS0x
NTQ3ICoNCj4+IENWRS0yMDE5LTE1NDk6IG9wZW5zc2wNCj4+IGh0dHBzOi8vd2ViLm52ZC5uaXN0
Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAxOS0xNTQ5ICoNCj4+IENWRS0yMDE5
LTE1NTE6IG9wZW5zc2wNCj4+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0
YWlsP3Z1bG5JZD1DVkUtMjAxOS0xNTUxICoNCj4+IENWRS0yMDE5LTE1NTI6IG9wZW5zc2wNCj4+
IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAx
OS0xNTUyICoNCj4+IENWRS0yMDE5LTE1NjM6IG9wZW5zc2wNCj4+IGh0dHBzOi8vd2ViLm52ZC5u
aXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAxOS0xNTYzICoNCj4+IENWRS0y
MDIwLTE0NDA5OiBsaWJzZGwyDQo+PiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxu
L2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjAtMTQ0MDkgKg0KPj4gQ1ZFLTIwMjAtMTQ0MTA6IGxpYnNk
bDINCj4+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1D
VkUtMjAyMC0xNDQxMCAqDQo+PiBDVkUtMjAyMC0xOTY3OiBvcGVuc3NsDQo+PiBodHRwczovL3dl
Yi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjAtMTk2NyAqDQo+
PiBDVkUtMjAyMC0xOTcxOiBvcGVuc3NsDQo+PiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmll
dy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjAtMTk3MSAqDQo+DQo+QWRkaW5nIENoZWUgWWFu
ZywgZGlkIHRoZSByZWNlbnQgY3ZlLWNoZWNrIGNoYW5nZSBtZWFuIHNvbWUgdmVyc2lvbg0KPmNv
bXBhcmlzb25zIHJlZ3Jlc3NlZCBhbmQgZXhwb3NlZCBDVkVzIHRoYXQgc2hvdWxkbid0IGJlIGlu
IHRoaXMgbGlzdCwgb3Igd2VyZSB3ZQ0KPm1ha2luZyBzb21lIHdlIG5lZWQgdG8gZml4PyBPciBk
aWQgc29tZSBvdGhlciBjaGFuZ2UgZXhwb3NlIHRoZXNlPw0KPg0KPkNoZWVycywNCj4NCj5SaWNo
YXJkDQo+DQo+DQoNCg==
