Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.5725.1604014013413157938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 16:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=afC8E1bk;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: NXCkv1SE6z3n/C7bU6dZ0T+pI4zabxsVXHT9FMvObfgWsvDgjAcwfF2m9Rwppwi5JdG0RXW//g
 A22LFh6BVUjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="232709770"
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="232709770"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 16:26:52 -0700
IronPort-SDR: xYDwHZFUixsyVrZkQRFRqEEkyXWPeMal6pzEXTDHZkFhQ/I2p1XGmGHraN7PslGo4A+vZuRroF
 M6oVX7cHZkaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="351659100"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP; 29 Oct 2020 16:26:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Oct 2020 16:26:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 29 Oct 2020 16:26:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 29 Oct 2020 16:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/gKvBYmhMENZ/Txvnpf+e8mkrG+oYKY7dNJkYPF3gvMhHgx8q70ldpXhHom+KYQ11nADu4vNbQGr0zknJuJRke8LKX2XP9v8fcMKHUhYGkIBcBkiG7+SSb/2qSgNYWk1Hbwk1J+LiuG8SZzV9YYIi7Dj+OUHNwq17n/wpaMMadlJRva5T0aoLxnjD9O992mCYH5wIOW6VRHtaudlwe6plM8iPmLbEirgBDUnxu7l4z8DpMkr3Ek407scnOEtD8FsMnfhHGm/+AYj37z2MnK8guDil5PFd31mslBhMrGGvs4LSunDZ9aAG+KkBVTX070wm13cJaTbFnIhsA3dREgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJAkxrtTMEn3sw5Rz9uUhySYeDEh3SojcoIkxozZegU=;
 b=UllONZKJs1Tch9c4T0tEAHJZcj2EDTSsXiKx5u1y7f+SuZd2yh0FQ5tFeSbly5d5/2sZ0YRnMLmODANIRsd5Jq3r3G8JmjIOQn2CrmTLbt0ZM6IogbysisNyBosDRREUy0QxEnVZ5LBfkaQToAvwR5gZM+Lyzqij1E1fwqodiw68IyTrXqLO0eRuzRRt9myF7hbWIsbxS0tzHqSqGxxLGP8VwARSXDZ8rfGMVGZXsaNRN8j8OksmvIHJiwTEXFc/x15LrIDd2O7Z+PnQVmVxF/URRjir47vjVXNRoqJAD4BpFLRZBl6y2O4oU9GIi4/2/FoT8K8850Wn8VRVc2oBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJAkxrtTMEn3sw5Rz9uUhySYeDEh3SojcoIkxozZegU=;
 b=afC8E1bkUq/rEwlhKRzWzzoTzpMsO3BtOgbyKWV0FsWDyH4SwzW7gNApm1UYtdpRx6oW1CvmXHUcxTRlXdgBGtXDJMnTVQK71b4VrBoF6Nuz81A4uSRewfCrvYTRUlM7AvPcvEY8pTNUCFgzvzgAKugE9K7ay9CaEx7uetIuVEA=
Received: from BN6PR11MB1474.namprd11.prod.outlook.com (2603:10b6:405:c::17)
 by BN6PR1101MB2164.namprd11.prod.outlook.com (2603:10b6:405:51::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 23:26:49 +0000
Received: from BN6PR11MB1474.namprd11.prod.outlook.com
 ([fe80::25da:aa60:5875:71fe]) by BN6PR11MB1474.namprd11.prod.outlook.com
 ([fe80::25da:aa60:5875:71fe%12]) with mapi id 15.20.3477.028; Thu, 29 Oct
 2020 23:26:49 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Ross Burton <ross@burtonini.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: add test for matchbox-terminal
Thread-Topic: [OE-core] [PATCH] oeqa/runtime: add test for matchbox-terminal
Thread-Index: AQHWrSeScwW1WPeAKkiVj/YQRICKeKmvO2cQ
Date: Thu, 29 Oct 2020 23:26:48 +0000
Message-ID: <BN6PR11MB1474633ED672AC8EAD86A74ABB140@BN6PR11MB1474.namprd11.prod.outlook.com>
References: <1600057661-71125-1-git-send-email-jay.shen.teoh@intel.com>
 <CAAnfSTumTDg-itUN0n2msZUE3bfsjT8hkgrrUKHkJj0cNiZkNg@mail.gmail.com>
In-Reply-To: <CAAnfSTumTDg-itUN0n2msZUE3bfsjT8hkgrrUKHkJj0cNiZkNg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [115.132.139.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6baaf05b-90ee-48bf-2f92-08d87c621bef
x-ms-traffictypediagnostic: BN6PR1101MB2164:
x-microsoft-antispam-prvs: <BN6PR1101MB216453F634C5E6501FE679C6BB140@BN6PR1101MB2164.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m8U+xkIzYQ6hqd9ja9nkYc7Ywhno80MdHN/v4sRYRS2d91rQmQNdSX7B2mqPyAefrR0dYk8oLC/cXd01TR4DrWAyX2/iXPZyUElud9e8A6JjTWpVTk8/yiGIi8MWqjal8aGVdbeH5glHSYP7akwJP1LS6fCTw+hYNRJ+/U8Dhj2RpvdwKNNAufOQWIZDNH4FlWL/hnZlisToTF/8uttCbPLE0miXfdorEygSp874sROvxh7QGXDVLgZRfCfoDqw1A4Y2XaR9hprBaEe5I+uL4dORpg0yGTiM/eF9nOPtXyRFeERWdaaa3kJhsPn3LZaHuP6IBVGW1Mau/5I/nmRD2g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(9686003)(64756008)(186003)(7696005)(53546011)(8676002)(83380400001)(4744005)(66946007)(2906002)(52536014)(8936002)(26005)(478600001)(6916009)(5660300002)(6506007)(33656002)(66556008)(66446008)(66476007)(316002)(55016002)(4326008)(86362001)(76116006)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: +VawicR3cyg8oNSFAQl7Joj2HsZqTqnLgjZQuUgDwxFQLsS37kYKW+d/UkO+PjZtxPpaIxMaAviXtfE6sSjgUR2qsMxTZ2a5Tm6g5M+525BZmB3jV5DU/VyMVB/HxmekIb1ezJvUBXAiC4139lvKsIRqBjQ1ziyHeN9t4k/e45GINZfhPC95b7QTJYsLYMzgsl5VUMK5SoQKYf0ibqbu3fo4AFQm18IOzqjegInEPxxYTRxIfy44vORB/DFtBc5Dh0qkCZTgBoJ+ywcZJL1a4mDdM7g3FfMM29FmawBHOrILZWcw4dHgtVQnH3jjq5kywNbKFf793KG1+ct4rnxbjixqZmqz+0a4kCnt4xxNBXmY1AzUekszT91Yy8ws1eY3M1U7TR86hHrmZYE5v4j0ba+8V4T6fYVpjoIYyVY2/fjKCZ6qYgtLtIP/9Lgx3OPVp+0R2GifMsuZYh6DU0uYkCf1Z5HSIHKPjR9V0g+THxZNAPD0v5wtZ3EYiiSTUSnn9fvGbHllu+bm+xqVglOzzpLamjb8dBMgBbKD1MHkiVtKiXwf/dS02u3KsvdG+VkYzSWivyzv5Jdva2fLVLryi48N1DCJdu5CffUlwFRkD+Umvf7q0C6LlPSITvlPgS091EhkaVyyRSGZSO+gM3PVHQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baaf05b-90ee-48bf-2f92-08d87c621bef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 23:26:48.8665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLVzQFEcScaEUZC0lHU1O05TGV4oZKDsWCMm54QqF7Cr3XI56AcPieYgrwgOUtaAShQpuZ5ZyKib5NxVdyduXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2164
Return-Path: jay.shen.teoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KVGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gSSB3aWxsIHJld29y
ayBvbiB0aGUgdGVybWluYWwucHkgdGVzdCBjYXNlLg0KDQpUaGFua3MsDQpKYXkNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJvc3MgQnVydG9uIDxyb3NzQGJ1cnRvbmluaS5j
b20+IA0KU2VudDogV2VkbmVzZGF5LCAyOCBPY3RvYmVyLCAyMDIwIDg6NDAgUE0NClRvOiBUZW9o
LCBKYXkgU2hlbiA8amF5LnNoZW4udGVvaEBpbnRlbC5jb20+DQpDYzogT0UtY29yZSA8b3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29y
ZV0gW1BBVENIXSBvZXFhL3J1bnRpbWU6IGFkZCB0ZXN0IGZvciBtYXRjaGJveC10ZXJtaW5hbA0K
DQpPbiBNb24sIDE0IFNlcCAyMDIwIGF0IDA1OjI3LCA8amF5LnNoZW4udGVvaEBpbnRlbC5jb20+
IHdyb3RlOg0KPiBUaGlzIHRlc3QgaXMgY2hlY2tpbmcgdGhhdCB0aGUgdGVybWluYWwgYXBwbGlj
YXRpb24gaXMgYWJsZSB0byBydW4uIFRoZSBjbGlja190ZXJtaW5hbF9pY29uX29uX1hfZGVza3Rv
cCBtYW51YWwgdGVzdCBjYXNlIGZyb20gb2VxYS9tYW51YWwvYnNwLWh3IGNhbiBiZSByZXBsYWNl
IGJ5IHRoaXMgcnVudGltZSB0ZXN0Lg0KDQpUaGlzIGRvZXMgbm90IHRlc3QgdGhhdCB0aGUgdGVy
bWluYWwgYWN0dWFsbHkgc3RhcnRlZC4gIElmIGl0IGh1bmcsIHRoaXMgdGVzdCB3b3VsZCBwYXNz
LiAgVGhlIG1hbnVhbCB0ZXN0IGNhc2UgaXMgImRvZXMgdGhlIHRlcm1pbmFsIHdvcmsiLCB3aGlj
aCB0aGlzIHRlc3QgZG9lcyBub3QgcmVwbGljYXRlLg0KDQpSb3NzDQo=
