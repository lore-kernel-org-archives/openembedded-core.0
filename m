Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.4722.1598318128154106087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 18:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=j2U4/DGZ;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: UQa07Q5BiPBeooVPus+87P4nAK4zFso+UiSwlmayed2leFvwYpZ7ukTDa7aZsgdbWtdbM4KdDt
 HSxoEvRcKJKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="135568486"
X-IronPort-AV: E=Sophos;i="5.76,350,1592895600"; 
   d="scan'208";a="135568486"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 18:15:18 -0700
IronPort-SDR: tW7IvfosO13K5E/DJYYTOnPUmjJ/a2xtC3qQ4vpd1Mo3hrZzpAra2nGpBSMSmcCai54bEaiWlE
 ViSX84M+nGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,350,1592895600"; 
   d="scan'208";a="443442890"
Received: from orsmsx601-2.jf.intel.com (HELO ORSMSX601.amr.corp.intel.com) ([10.22.229.81])
  by orsmga004.jf.intel.com with ESMTP; 24 Aug 2020 18:15:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 24 Aug 2020 18:15:17 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 24 Aug 2020 18:15:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 24 Aug 2020 18:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMy+Fst3zpPO+wF35EnJMJSq2rjL2BwRUMJROG/0u1aaAlIpQLJWErJGu37YA0eDZ114s52c1LY5REbJfhTVFOArjRjkrizcLUoxTipjSPmS9bcG9NH5xU3nJmIO80aMkFV7bp+l9YPcUaRA/FcAx/SqpovTyrOrgTngQK6mDKr6g+WPJEPVu2qFXcc/wNz5/Xv0lipytlu0tbFJJRiPlz0QkRPy/6THoWi58FkXF3XSOtjcG4dRXAZt7TXnxSdiS5FVq3Q+mO7n4mJ4ZRQmCAb4GB7r/SAbd6AJ1xdjINlYYWGN4PEPwglEw4o29DfwGEGpGnlFpPYweCYIz3OTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcGJNsxrJGypBTsrHOGCrnsspKUgTjOCXjJrhifoFZk=;
 b=RC6/RQ65K9Mp9w+rQ0j2oX/qgY7D6tUIkPPeZrECV1n3YhxLst9YUsjjBxkR2QI85i0mNFkQ82DCSGAwvHYOIXrVDbTr86DOISOIMHbZ+aBFreBZju2yOgo5Uhm8X6WswaEEpPdSbFmbUXlLq6qPdgalMhr+EVX438H3ebwSRsUSLBqiTlDQQRvILtTY3Tx4D/g3PlSXCIAsC2HjnYVBDDTN5BaABwFfn5WjXNnCT4HhhZ/Hdcs6UOvNQ2oG067WrL5VXj+/PLVf5SWd7eXZvet3XjsRrzIuHUNjkOauWIkgR9MAf2aPlGWMB6AZMM8au1KQP+hVNZtrD9QwcKZGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcGJNsxrJGypBTsrHOGCrnsspKUgTjOCXjJrhifoFZk=;
 b=j2U4/DGZfjIOF/h5m6f5CmFgt2Mi9gE22xU8XGEFUQu8UQxSUsYmKFm6oljk/wyvGYb4VZNiI5bcwb9rbRzloJkrQ7CL1x11zDu8o7fi20RjC8uh8k2bTDs7xWaKrCf9RJYDrTVcU3bYiuzJA/dCurX3HMorndBkIUZecP57S7A=
Received: from DM5PR11MB1993.namprd11.prod.outlook.com (2603:10b6:3:12::18) by
 DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.26; Tue, 25 Aug 2020 01:15:15 +0000
Received: from DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::2095:c2b4:79a7:f0d6]) by DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::2095:c2b4:79a7:f0d6%4]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 01:15:14 +0000
From: khairul.rohaizzat.jamaluddin@intel.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] wic/bootimg-efi: Added feature to exclude IMAGE_BOOT_FILES
Thread-Topic: [OE-core] [PATCH] wic/bootimg-efi: Added feature to exclude
 IMAGE_BOOT_FILES
Thread-Index: AQHWemWZW8unr+2ZvkiXohNsd062valIBCYw
Date: Tue, 25 Aug 2020 01:15:14 +0000
Message-ID: <DM5PR11MB1993D79AF7B255CDA55D145BDE570@DM5PR11MB1993.namprd11.prod.outlook.com>
References: <1598251182-58358-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
 <18639869486242f56549d4cdf82f1b1439c6cc1f.camel@linuxfoundation.org>
In-Reply-To: <18639869486242f56549d4cdf82f1b1439c6cc1f.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [113.210.112.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60985f33-b6ee-4841-6e74-08d848945281
x-ms-traffictypediagnostic: DM6PR11MB4202:
x-microsoft-antispam-prvs: <DM6PR11MB42026932F49B56AE0DA62027DE570@DM6PR11MB4202.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /B62zvEwsUi3WTC8wt0JaH4TpUYD/rhVJpQGaQlhGr/w33LXhTap5QtQPTsKI1ZnCJuKsVGxiqFGC9tMOW7csPqdN/IYgfoiE+z0Dh20mAwMit6ulYUP3o/RYSCOT9ASuGTNACP0c7D7uyu1tqrHiizH9kQQ/HSG3nnoXA3n9r4z/S62XkEhlE6IriVpoYcbC8olOMvVV6OAkqXgGdzvsRjetPAmVQT/sn9pFXN1kfRXuGaPD7ryxFrGG5aC/OR3vsZVwUNPCpE51GcKJEJSoE+Nb4n5LmOf6asMy/sgyXN1rrB/vQmogwQgSAsB0RpK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(86362001)(9686003)(2906002)(66556008)(64756008)(71200400001)(7696005)(76116006)(66946007)(52536014)(478600001)(186003)(33656002)(26005)(66476007)(66446008)(83380400001)(110136005)(5660300002)(8936002)(55016002)(8676002)(6506007)(53546011)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: hMItVTLfORvbHusYG0mplWq3J0rfvYMTh0EV2duY1jLKV2stBd87ROHcQnDCCrokalX8T1eaennymJ9F+kAI0t6/TNKNTehLloY8URwZ3P0xZm9bM+irE/hSxyU29IAtK+DGZobgPqTqPBSS3l/ndLnj/Z2bT4ZWdhEQXuTwJw9iJIePDzLFhuLC+3uGNFHlviscpka8aMGez65Zp8t8mgO8GuHbUZV5TWsC+VFXYRZzE7oG7/ppdYPFPtjbVGsZXsC7qnMI4IUBytspDWhZygTeKBjq8iuE39lcGwTNYqrQssBNtgjThOe9NX6Yr+zeR8hzkCi2YvBkdE3hQZ33oSjoDLRS+xM4mfDawKSZCBUri5ykuctBB0XNDdnEJEbgv3nxQBVaimkaZoISRXw/hGAvYWSH15m7ZvNgjRRxP6KPtDqqKyM65WapWw6OiGNOL9p4SRmQ7BpipF8EFYDrbwvYAr0L2UtDSnQfELbfiZz82IvQSnQ/kT3+y2/YY24jrM7zPKt8uUhVd/fw1CyAAQsC/Wmt4JqWNTsF7oWxbpmELQcsSXDh8j21dftrZjix3H69zGi14frFB8h9S5dyPK1BKz441m3BI7eB62HNCFcmZjXdzLjZ37fMtnIaBsvC7Dt5l/jQoWPjbO4joPLbIQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60985f33-b6ee-4841-6e74-08d848945281
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 01:15:14.8209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2f/Vh1p0E8eru28RFumNCVG++Ly9beBlWLXrpqV6f4Ghkx92+9wTYtcES/sI06Q0i6DvKdIOPseXKyv9y0N3qBeSUI9/CHyj0eqDDZblF8p8V1X3FKsFi2ny+PApor9e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4202
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBzdXBwb3NlIGVpdGhlciB3YXkgaXMgZmluZSwgYXMgbG9uZyBhcyB0aGUgaXNzdWUgY291bGQg
YmUgcmVzb2x2ZWQuDQoNCkFuZCBJIGFncmVlLCBhZGRpbmcgYSBuZXcgdmFyaWFibGUgaW4gdGhl
IGxvY2FsLmNvbmYgd291bGQgZ2l2ZSBtb3JlIGZsZXhpYmlsaXR5IGluIHRoZSBidWlsdCBpbWFn
ZSB0aGFuIHRoZSBtZXRob2QgSSBhcHBsaWVkLg0KSXTigJlzIGEgYmV0dGVyIHNvbHV0aW9uLg0K
DQoNClRoYW5rIHlvdSAmIEtpbmQgcmVnYXJkcywNCktoYWlydWwNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPiANClNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyNSwgMjAyMCA2OjI2IEFNDQpU
bzogSmFtYWx1ZGRpbiwgS2hhaXJ1bCBSb2hhaXp6YXQgPGtoYWlydWwucm9oYWl6emF0LmphbWFs
dWRkaW5AaW50ZWwuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHdpYy9ib290aW1nLWVmaTogQWRkZWQg
ZmVhdHVyZSB0byBleGNsdWRlIElNQUdFX0JPT1RfRklMRVMNCg0KT24gTW9uLCAyMDIwLTA4LTI0
IGF0IDE0OjM5ICswODAwLCBraGFpcnVsLnJvaGFpenphdC5qYW1hbHVkZGluQGludGVsLmNvbSB3
cm90ZToNCj4gRnJvbTogS2hhaXJ1bCBSb2hhaXp6YXQgSmFtYWx1ZGRpbiANCj4gPGtoYWlydWwu
cm9oYWl6emF0LmphbWFsdWRkaW5AaW50ZWwuY29tPg0KPiANCj4gRHVlIHRvIHJlY2VudCBjaGFu
Z2VzIGluIGJvb3RpbWctZWZpIHRvIGluY2x1ZGUgSU1BR0VfQk9PVF9GSUxFUywgd2hlbiANCj4g
Ym90aCBib290aW1nLXBhcnRpdGlvbiBhbmQgYm9vdGltZy1lZmkgb2NjdXIgaW4gYSBzaW5nbGUg
LndrcyBhbmQgDQo+IElNQUdFX0JPT1RfRklMRVMgYXJlIGRlZmluZWQsIGZpbGVzIGxpc3RlZCBp
biBJTUFHRV9CT09UX0ZJTEVTIHdpbGwgYmUgDQo+IGR1cGxpY2F0ZWQgaW4gYm90aCBwYXJ0aXRp
b24uDQo+IFNpbmNlIElNQUdFX0JPT1RfRklMRVMgYXJlIGNydWNpYWwgZm9yIGJvb3RpbWctcGFy
dGl0aW9uLCBidXQgb3B0aW9uYWwgDQo+IGZvciBib290aW1nLWVmaSwgaGVuY2UgYWxsb3cgYm9v
dGltZy1lZmkgdG8gaGF2ZSB0aGUgb3B0aW9uIHRvIGlnbm9yZSANCj4gaXQuDQo+IA0KPiBUaGUg
bmV3IHZhcmlhYmxlLCBleGNsdWRlaWJmLCBpbiBib290aW1nLWVmaS5weSBuZWVkIHRvIGJlIHNl
dCBpbiB0aGUgDQo+IC53a3MgZmlsZSB0byBtYWtlIHVzZSBvZiB0aGlzIGZlYXR1cmUuIFNpbXBs
eSByZW1vdmUgdGhlIHZhcmlhYmxlIGZyb20gDQo+IHRoZSB0aGUgLndrcyBmaWxlIGlmIG5vdCBu
ZWVkZWQuDQo+IEV4YW1wbGU6DQo+ICAgICBwYXJ0IC9ib290IC0tc291cmNlIGJvb3RpbWctZWZp
IC0tc291cmNlcGFyYW1zPSJsb2FkZXI9c3lzdGVtZC1ib290LA0KPiAgICAgZXhjbHVkZWliZj15
IiAtLW9uZGlzayBzZGEgLS1sYWJlbCBtc2RvcyAtLWFjdGl2ZSAtLWFsaWduIDEwMjQgDQo+IC0t
dXNlLXV1aWQNCj4gDQo+IFtZT0NUTyAjMTQwMTFdDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLaGFp
cnVsIFJvaGFpenphdCBKYW1hbHVkZGluIA0KPiA8a2hhaXJ1bC5yb2hhaXp6YXQuamFtYWx1ZGRp
bkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgc2NyaXB0cy9saWIvd2ljL3BsdWdpbnMvc291cmNlL2Jv
b3RpbWctZWZpLnB5IHwgNiArKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCg0KSSdtIHRvcm4gYmV0d2VlbiB0aGlzIGFuZCBpbnN0ZWFkIGNo
YW5naW5nIGVmaSB0byB1c2UgSU1BR0VfRUZJX0JPT1RfRklMRVMgaW5zdGVhZC4gQ2hhbmdpbmcg
dGhlIHZhcmlhYmxlIHdvdWxkIG1lYW4gbW9yZSBmbGV4aWJpbGl0eSBpbiBob3cgdGhlIGltYWdl
IGlzIGNvbnN0cnVjdGVkLi4uDQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQo=
