Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.1597.1631150091425727603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 18:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=ZuPTDHwy;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220695658"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="220695658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2021 18:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="431572902"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga003.jf.intel.com with ESMTP; 08 Sep 2021 18:14:50 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 18:14:49 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 18:14:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 8 Sep 2021 18:14:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 8 Sep 2021 18:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1tKKa2iRJPZQ6QE4L0byBjFhpIOsOydqmbhDkpqx/m2pQ6NcBuSQ9FyEkL8tAuxgViah2z+sR7F3ZCHCgpzFzMaIVktgyf5qk24umlfWVTZGeWgZTlzhQCl6ETewlVyVMZknl/xaB9pjfAjmxtvWuuD+0v3BZMpa0cHyRR/18I9qfRG8fj+4gGzbDbT1OiEun3TNKxxfwZXEZAqKPEjIg/OLTsR5V/UAhVLkfM1HfaH+a1hjmOLOYx3nqLN+kvppILYeWqp+euoU5bpUAaS5xpb/i/6nM5H6+BAMrhf14qfyk1HjXEvWRA2Fy8PBPoni7Wes/+zv2lzJY7CCX4VTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NLtS8TjhcSB2tzK5mIIo7mORYGE2YO5nTCrqGLSh9s0=;
 b=jY30bYXhkHcQEZ+Y6hjK+Zm4XwRiJ2idTXRvkwaf0cDeZ8WKwyZ7omOCEzPKa2mSCyS/jJ6yiI7tgppghIDLaS9++QDRxOgQ3JpqjTbVN7SEZnsdd11sCVnWRu+fiw3eZ6Yon2sJXhKJMHtQLSIwboBCZdhCYaXx6/6aVL+QCij/zT7XV7xI15g3+Rqf9lCimikBHFI6qxaTivekUaWicxeGgHSCHju5jG6lJ+nVgJjobHGbQXmXwv4eHOZ5C3SP80EYrvqAN7EiT2Q+RCdobbGRQD0J3xyV5eqU8wudKF0BMewVQuCIR7WrljKq+fatupB4P/sFS1TdJT02vj8uhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLtS8TjhcSB2tzK5mIIo7mORYGE2YO5nTCrqGLSh9s0=;
 b=ZuPTDHwyiUGgkz64wxt/7zwuHka59TKgVgRmtvW65sQaF7epqPSDvuddBF3xaP3AQG72MjKUZoZPjlTSVeBTwf+nmb3CjSTwZ7gzdSwN3IQ3vVgeoBn+1mBZLRNg8qf2TiqTWCKe2LqxFxLCMiJaiBY4QRLClMdFsDC+UvMQzX4=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Thu, 9 Sep
 2021 01:14:47 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4478.027; Thu, 9 Sep 2021
 01:14:47 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "trevor.gamblin@windriver.com"
	<trevor.gamblin@windriver.com>
Subject: Re: [OE-core][hardknott][PATCH] bluez5: fix CVE-2021-3658
Thread-Topic: [OE-core][hardknott][PATCH] bluez5: fix CVE-2021-3658
Thread-Index: AQHXpL/15BLVH1p1t02JsQJ6fWL8NKua5qcA
Date: Thu, 9 Sep 2021 01:14:47 +0000
Message-ID: <510d434d25a52a47100843cf9aac85478f1588c9.camel@intel.com>
References: <16A0C74572815139.29772@lists.openembedded.org>
	 <01abbd21-3985-2014-7799-8b538bafc376@windriver.com>
In-Reply-To: <01abbd21-3985-2014-7799-8b538bafc376@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 901116f9-d45d-442a-9fe7-08d9732f375d
x-ms-traffictypediagnostic: BY5PR11MB4183:
x-microsoft-antispam-prvs: <BY5PR11MB418368C907D8C35F977EA472F8D59@BY5PR11MB4183.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 59bvCeOzfRcSGAsoo83yCcrF6Ip82v6nI0KiVWOCVpf51fnK6Kl6tX8b41Tu5WRPCFmo1mlXH1tlWgLG/1YceB4a6BniXkWEa2+mU88w+VN8vF8hZlsLM0YTxHlAyEdixFP7qPTzOUiZ4PRkGTf2o8GchRD7UhjIhKCc42/7P0LgW7cSFXrG3sNwsEE8A9CD/VJKFomES2qZ4g7zeXVikLy9+fgw3PMi7JnBuewkfHmIaAgURz86dEJ5TmXK0clusbzZsa37dupzVApyO2th/zwDsMpa3qr/UgMYCJ9d35IdmvIakj4ZZQRqNBWzIyUYf+l0WAHvJdUGAMS770rI3hJ79qTrUKdhrvgv8q2X9KnSv8EFhKv0vUMHI6kwhx/GrLI9lXDKzu1nHUCfD4otw3GVSu4ykQtWUr61y78XPJ6mF0yMbXpgoizKxDajuTE1H7qztRbdtyAyxzW8U0YeUyU5WocL9VqTaRd1aEgB+hYYOwb27MydMuMF8tVEMVFd+2WA6kA0SpnJI3aH9UZzeDhoPRp5hH4GtzavDb9RCoaFp1VjxEcm5dg4XWfz1R1SfYdVzRR9noXdmv8uQ0qCMKYL2TUfS1SulyNv1kvaPITgKsW8o0Mb15ghGi0+AR4K3wszP9cDPjwk3jarSzDkYUNmp4sE0MtvvPoQWlF8+ZBX55ojH5cM4XnJ7VYP1pAeJI+qw6/kGjCj8pYgtZTFAsG/EZigzlgcrpDGu09z5TSWKecn86DlzNI1KYRYWE9dbcEyQ+qhDq8B2H3VuBD14Y0eiPdcvMLfEI9xMYPgy7WkXUx11ZajtETDgSQki+KtnjXzxKtZkwyiS7G/anwrug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(83380400001)(38070700005)(5660300002)(478600001)(86362001)(8936002)(186003)(26005)(2906002)(6486002)(316002)(53546011)(6506007)(66446008)(66946007)(91956017)(66476007)(110136005)(66556008)(64756008)(966005)(71200400001)(36756003)(6512007)(76116006)(8676002)(122000001)(38100700002)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGp5Y3lrVnJMbGEwRTg1REZpUVZFYWdxcmNMUVVDbzhVa0k3TlJ2YWNMc1pU?=
 =?utf-8?B?N3VXNnl6K09obEZOT25uTWloYWRmaVlRV2M1SVdPalZHNW5kOFJtR2ppUHVO?=
 =?utf-8?B?eGlHaFc4SWNaRTA5VExmTDlNVmpWVzZlYjl2UnRjaHBUSzhpWk5UbWxpeTJG?=
 =?utf-8?B?NHF5WEZvYnBJK25lUDhRTHNvbmNaNjZONE1pUzJ3cXZjRm5ub0FOOVFZY29j?=
 =?utf-8?B?VmFXTlhwVXh0bFVMYkhXY1crQ1dZc1dnZjdDNTNPcGdLajJnV05Ydk5TM3dk?=
 =?utf-8?B?SzBub0d5WjBPVkpyd1FQU1hzbDVEOUF0TnRxRnJoVCs0T084bWg2bUpQanNK?=
 =?utf-8?B?RUFPb2xqSy9yKzBqT1F6Z0thUmRmQmhLRkdaY0paVDRidlpaK1R5Vi90eExl?=
 =?utf-8?B?V0pqZzhmTWc3c2hhUnFXUmIvVk9SL05GOXJtdXVRZWZJZzB4NTdIQzBoVTJB?=
 =?utf-8?B?RnF0Z1U1TkVsaDZuWnljN2RvSkR3M25xNm5rSVVoL245SjBtbnc1UmdpNTBG?=
 =?utf-8?B?bVhJODJZUy9yV0x1YkUrSCtQM0xSYVBHSlJpUkVXRUd1Z3lsazc0MWlxUEs3?=
 =?utf-8?B?WHU3dkVZQWZhVHBpOW1SNGNxUFY0YkIvUXFCMGxhKzdTMWZVSmJEVWtJZmth?=
 =?utf-8?B?WTdlOGh5bmV2eFAvNTdOalhDS3BDMllGMmVQZFBZWDFQclhNS0g5M1o1NWhU?=
 =?utf-8?B?ZnFULzZqUi9pTmRyR0hXR0Q1cFpoUVkySm03K2w2R0g5eVZsbGFBTk42U3Zi?=
 =?utf-8?B?SElKK2RocFlnSzZpdEM1NmI2c1MxQldNZ2NFR0FYVEwyblBuNFRmNnZYQWpE?=
 =?utf-8?B?NEl2OVc2aDcrMXVYbTlqYndnM25VSHFpQXdTNHpPZGN3OE9vYmtTUHFFTklu?=
 =?utf-8?B?djJxQ2w1UDF5M2N4bmZNcGJ3UWE1ZTRxSm52MUVTVW1Kb3lzMWQvdUlFT3lR?=
 =?utf-8?B?R3dzZGY1b1k0MVkzTkdlRE0yN1FSUGNreGpjUTFSR0NOUng0b3FwblgxaEFu?=
 =?utf-8?B?WEphcmlUMTdURWhHQWFoSFJoUE1tTWtpbWNXVmFsZnZWMHBPc0t4MlhlNStj?=
 =?utf-8?B?MmRGZkFQdnlXZXRXS3pyeUJQZENSNmpkdGFITDVDNkZCZE9lbmgwS3lsbkM5?=
 =?utf-8?B?N00xT1dtT1lmSUM1bGREVFkrTndLeFk1eEozYms2L0VjTXhQSVdVeVNjTTJX?=
 =?utf-8?B?dGZVbC84aFU2VGU3S0szUUhBbnFwbWdMNmZLVGdTQ1BlU0RBRjN4WTNBZldE?=
 =?utf-8?B?R1hUQnMvdUViV3RyKytENFVSNXdZOWIyTEV5azdTWlZkWWJnVVBpMGh2Wkhz?=
 =?utf-8?B?S2VxVGQxVVl1S2kxY0lNOEJtMVAzaktEbEcxUGJlZ0RFY1VSR2w0NjdMbkIw?=
 =?utf-8?B?eTRSZitjT1FWSm1VNmR6OXZPa3poOFNFdmR3RnpJR3ltdHNyV09EWXZ1Uk1I?=
 =?utf-8?B?dmZpZnZSKzFjMkliZnAybXpEWTIyaVBndjZSb3ZPSnZHSTJxeDRoSjREdTVJ?=
 =?utf-8?B?NzhrTWJEQytlcWRCc3VkZEw2R2F3cGU3TUFoUGJyRW84TDQ0bVRzK3NqclRx?=
 =?utf-8?B?Yi9mNEtCOThDWDF2ajJNaFIvcXNCdS9BVHd2VHN5NVBVSlE2aHZYdFo4Zndm?=
 =?utf-8?B?NHp1cndRdkRpOG5oV3pvN0t2emZ6WFpVTW0wSG16TU5qZk5iVVFHeE9nYUJU?=
 =?utf-8?B?RlNxZlFnenpOWitQV0J3T1JETnJ1T1psS01ZWXd2SU4rNUFVcGo3Uk5za0lE?=
 =?utf-8?B?cGdUQmpiaWNkcnlrUFA4S1hrN0FhamVFc1NjZFlVVHhRa3hycUo5UHNJTGFP?=
 =?utf-8?B?S3JCRHp5dEdRbi9sbEo1dz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901116f9-d45d-442a-9fe7-08d9732f375d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 01:14:47.7841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6kpOHEXs2ECXd6m94/IzvcU3wenJCsGQC7ZdqU+ef7hh2MK83ON00q5u84jI2l418gr4KJ4tsITGHeA0GT7Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFFC8FC7087E0F4FB4C2A34DAEFF7DFB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIxLTA5LTA4IGF0IDEwOjQzIC0wNDAwLCBUcmV2b3IgR2FtYmxpbiB3cm90ZToN
Cj4gDQo+IE9uIDIwMjEtMDktMDEgMjo0NSBwLm0uLCBUcmV2b3IgR2FtYmxpbiB3cm90ZToNCj4g
wqANCj4gPiBCYWNrcG9ydGluZyB1cHN0cmVhbSBmaXggc2luY2UgdGhlIHVwcmV2IGZyb20gNS42
MCAtPiA1LjYxIGRvZXMNCj4gPiBpbmNsdWRlDQo+ID4gc29tZSBtaW5vciBmdW5jdGlvbmFsaXR5
IGNoYW5nZXMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRyZXZv
ci5nYW1ibGluQHdpbmRyaXZlci5jb20+DQo+IMKgUGluZy4gSnVzdCB3YW5uYSBtYWtlIHN1cmUg
dGhpcyBpcyBwaWNrZWQgdXAuDQoNClllcywgdGhpcyBpcyBpbiB0aGUgcXVldWUgSSBzZW50IGZv
ciByZXZpZXcuDQoNCmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL21lc3NhZ2UvMTU1NzMxDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IMKgDQo+ID4gLS0t
DQo+ID4gwqBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUuaW5jICAgfCAg
IDEgKw0KPiA+IMKgLi4udGVyLUZpeC1zdG9yaW5nLWRpc2NvdmVyYWJsZS1zZXR0aW5nLnBhdGNo
IHwgMTAwDQo+ID4gKysrKysrKysrKysrKysrKysrDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDEw
MSBpbnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtDQo+ID4gYWRhcHRlci1GaXgtc3RvcmluZy1k
aXNjb3ZlcmFibGUtc2V0dGluZy5wYXRjaA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUuaW5jDQo+ID4gYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUuaW5jDQo+ID4gaW5kZXggYTdiNjI4Y2UxYi4uMGQz
MGIxYTNmNSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6
NS9ibHVlejUuaW5jDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUv
Ymx1ZXo1LmluYw0KPiA+IEBAIC01Miw2ICs1Miw3IEBAIFNSQ19VUkkgPQ0KPiA+ICIke0tFUk5F
TE9SR19NSVJST1J9L2xpbnV4L2JsdWV0b290aC9ibHVlei0ke1BWfS50YXIueHogXA0KPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVS
RVMnLCAnc3lzdGVtZCcsICcnLA0KPiA+ICdmaWxlOi8vMDAwMS1BbGxvdy11c2luZy1vYmV4ZC13
aXRob3V0LXN5c3RlbWQtaW4tdGhlLXVzZXItc2Vzc2lvLnBhdGNoJw0KPiA+ICwgZCl9IFwNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiBmaWxlOi8vMDAwMS10ZXN0cy1hZGQtYS10
YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoDQo+ID4gXA0KPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZpbGU6Ly8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1p
c3N1ZS5wYXRjaCBcDQo+ID4gKyAgICAgICAgICANCj4gPiBmaWxlOi8vMDAwMS1hZGFwdGVyLUZp
eC1zdG9yaW5nLWRpc2NvdmVyYWJsZS1zZXR0aW5nLnBhdGNoIFwNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAiDQo+ID4gwqBTID0gIiR7V09SS0RJUn0vYmx1ZXotJHtQVn0iDQo+ID4gwqAN
Cj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1
LzAwMDEtYWRhcHRlci0NCj4gPiBGaXgtc3RvcmluZy1kaXNjb3ZlcmFibGUtc2V0dGluZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy0NCj4gPiBjb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLWFk
YXB0ZXItRml4LXN0b3JpbmctZGlzY292ZXJhYmxlLQ0KPiA+IHNldHRpbmcucGF0Y2gNCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLmMyYTVlZGQyMjYNCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVl
ejUvYmx1ZXo1LzAwMDEtYWRhcHRlci1GaXgtDQo+ID4gc3RvcmluZy1kaXNjb3ZlcmFibGUtc2V0
dGluZy5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsMTAwIEBADQo+ID4gK0Zyb20gYjQ5N2I1OTQyYThi
ZWI4Zjg5Y2ExYzM1OWM1NGFkNjdlYzg0MzA1NSBNb24gU2VwIDE3IDAwOjAwOjAwDQo+ID4gMjAw
MQ0KPiA+ICtGcm9tOiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IDxsdWl6LnZvbi5kZW50ekBpbnRl
bC5jb20+DQo+ID4gK0RhdGU6IFRodSwgMjQgSnVuIDIwMjEgMTY6MzI6MDQgLTA3MDANCj4gPiAr
U3ViamVjdDogW1BBVENIXSBhZGFwdGVyOiBGaXggc3RvcmluZyBkaXNjb3ZlcmFibGUgc2V0dGlu
Zw0KPiA+ICsNCj4gPiArZGlzY292ZXJhYmxlIHNldHRpbmcgc2hhbGwgb25seSBiZSBzdG9yZSB3
aGVuIGNoYW5nZWQgdmlhDQo+ID4gRGlzY292ZXJhYmxlDQo+ID4gK3Byb3BlcnR5IGFuZCBub3Qg
d2hlbiBkaXNjb3ZlcnkgY2xpZW50IHNldCBpdCBhcyB0aGF0IGJlIGNvbnNpZGVyZWQNCj4gPiAr
dGVtcG9yYXJ5IGp1c3QgZm9yIHRoZSBsaWZldGltZSBvZiB0aGUgZGlzY292ZXJ5Lg0KPiA+ICsN
Cj4gPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiA+ICsoDQo+ID4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2JsdWV0b290aC9ibHVlei5naXQvY29tbWl0Lz9pZD1iNDk3YjU5
NDJhOGJlYjhmODljYTFjMzU5YzU0YWQ2N2VjODQzMDU1DQo+ID4gKQ0KPiA+ICsNCj4gPiArQ1ZF
OiBDVkUtMjAyMS0zNjU4DQo+ID4gKw0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxp
biA8dHJldm9yLmdhbWJsaW5Ad2luZHJpdmVyLmNvbT4NCj4gPiArDQo+ID4gKy0tLQ0KPiA+ICsg
c3JjL2FkYXB0ZXIuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+
ID4gKyAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+
ID4gKw0KPiA+ICtkaWZmIC0tZ2l0IGEvc3JjL2FkYXB0ZXIuYyBiL3NyYy9hZGFwdGVyLmMNCj4g
PiAraW5kZXggMTJlNGZmNWMwLi42NjNiNzc4ZTQgMTAwNjQ0DQo+ID4gKy0tLSBhL3NyYy9hZGFw
dGVyLmMNCj4gPiArKysrIGIvc3JjL2FkYXB0ZXIuYw0KPiA+ICtAQCAtNTYwLDcgKzU2MCwxMSBA
QCBzdGF0aWMgdm9pZCBzZXR0aW5nc19jaGFuZ2VkKHN0cnVjdCBidGRfYWRhcHRlcg0KPiA+ICph
ZGFwdGVyLCB1aW50MzJfdCBzZXR0aW5ncykNCj4gPiArIAlpZiAoY2hhbmdlZF9tYXNrICYgTUdN
VF9TRVRUSU5HX0RJU0NPVkVSQUJMRSkgew0KPiA+ICsgCQlnX2RidXNfZW1pdF9wcm9wZXJ0eV9j
aGFuZ2VkKGRidXNfY29ubiwgYWRhcHRlci0NCj4gPiA+cGF0aCwNCj4gPiArIAkJCQkJQURBUFRF
Ul9JTlRFUkZBQ0UsDQo+ID4gIkRpc2NvdmVyYWJsZSIpOw0KPiA+ICstCQlzdG9yZV9hZGFwdGVy
X2luZm8oYWRhcHRlcik7DQo+ID4gKysJCS8qIE9ubHkgcGVyc2lzdCBkaXNjb3ZlcmFibGUgc2V0
dGluZyBpZiBpdCB3YXMgbm90DQo+ID4gc2V0DQo+ID4gKysJCSAqIHRlbXBvcmFyaWx5IGJ5IGRp
c2NvdmVyeS4NCj4gPiArKwkJICovDQo+ID4gKysJCWlmICghYWRhcHRlci0+ZGlzY292ZXJ5X2Rp
c2NvdmVyYWJsZSkNCj4gPiArKwkJCXN0b3JlX2FkYXB0ZXJfaW5mbyhhZGFwdGVyKTsNCj4gPiAr
IAkJYnRkX2Fkdl9tYW5hZ2VyX3JlZnJlc2goYWRhcHRlci0+YWR2X21hbmFnZXIpOw0KPiA+ICsg
CX0NCj4gPiArIA0KPiA+ICtAQCAtMjE2Miw4ICsyMTY2LDYgQEAgc3RhdGljIGJvb2wgZmlsdGVy
c19lcXVhbChzdHJ1Y3QNCj4gPiBtZ210X2NwX3N0YXJ0X3NlcnZpY2VfZGlzY292ZXJ5ICphLA0K
PiA+ICsgc3RhdGljIGludCB1cGRhdGVfZGlzY292ZXJ5X2ZpbHRlcihzdHJ1Y3QgYnRkX2FkYXB0
ZXIgKmFkYXB0ZXIpDQo+ID4gKyB7DQo+ID4gKyAJc3RydWN0IG1nbXRfY3Bfc3RhcnRfc2Vydmlj
ZV9kaXNjb3ZlcnkgKnNkX2NwOw0KPiA+ICstCUdTTGlzdCAqbDsNCj4gPiArLQ0KPiA+ICsgDQo+
ID4gKyAJREJHKCIiKTsNCj4gPiArIA0KPiA+ICtAQCAtMjE3MywxNyArMjE3NSwyNCBAQCBzdGF0
aWMgaW50IHVwZGF0ZV9kaXNjb3ZlcnlfZmlsdGVyKHN0cnVjdA0KPiA+IGJ0ZF9hZGFwdGVyICph
ZGFwdGVyKQ0KPiA+ICsgCQlyZXR1cm4gLUVOT01FTTsNCj4gPiArIAl9DQo+ID4gKyANCj4gPiAr
LQlmb3IgKGwgPSBhZGFwdGVyLT5kaXNjb3ZlcnlfbGlzdDsgbDsgbCA9IGdfc2xpc3RfbmV4dChs
KSkgew0KPiA+ICstCQlzdHJ1Y3QgZGlzY292ZXJ5X2NsaWVudCAqY2xpZW50ID0gbC0+ZGF0YTsN
Cj4gPiArKwkvKiBPbmx5IGF0dGVtcHQgdG8gb3ZlcndyaXRlIGN1cnJlbnQgZGlzY292ZXJhYmxl
IHNldHRpbmcNCj4gPiB3aGVuIG5vdA0KPiA+ICsrCSAqIGRpc2NvdmVyYWJsZS4NCj4gPiArKwkg
Ki8NCj4gPiArKwlpZiAoIShhZGFwdGVyLT5jdXJyZW50X3NldHRpbmdzICYgTUdNVF9PUF9TRVRf
RElTQ09WRVJBQkxFKSkNCj4gPiB7DQo+ID4gKysJCUdTTGlzdCAqbDsNCj4gPiArIA0KPiA+ICst
CQlpZiAoIWNsaWVudC0+ZGlzY292ZXJ5X2ZpbHRlcikNCj4gPiArLQkJCWNvbnRpbnVlOw0KPiA+
ICsrCQlmb3IgKGwgPSBhZGFwdGVyLT5kaXNjb3ZlcnlfbGlzdDsgbDsgbCA9DQo+ID4gZ19zbGlz
dF9uZXh0KGwpKSB7DQo+ID4gKysJCQlzdHJ1Y3QgZGlzY292ZXJ5X2NsaWVudCAqY2xpZW50ID0g
bC0+ZGF0YTsNCj4gPiArIA0KPiA+ICstCQlpZiAoY2xpZW50LT5kaXNjb3ZlcnlfZmlsdGVyLT5k
aXNjb3ZlcmFibGUpDQo+ID4gKy0JCQlicmVhazsNCj4gPiArLQl9DQo+ID4gKysJCQlpZiAoIWNs
aWVudC0+ZGlzY292ZXJ5X2ZpbHRlcikNCj4gPiArKwkJCQljb250aW51ZTsNCj4gPiArIA0KPiA+
ICstCXNldF9kaXNjb3ZlcnlfZGlzY292ZXJhYmxlKGFkYXB0ZXIsIGwgPyB0cnVlIDogZmFsc2Up
Ow0KPiA+ICsrCQkJaWYgKGNsaWVudC0+ZGlzY292ZXJ5X2ZpbHRlci0+ZGlzY292ZXJhYmxlKQ0K
PiA+IHsNCj4gPiArKwkJCQlzZXRfZGlzY292ZXJ5X2Rpc2NvdmVyYWJsZShhZGFwdGVyLA0KPiA+
IHRydWUpOw0KPiA+ICsrCQkJCWJyZWFrOw0KPiA+ICsrCQkJfQ0KPiA+ICsrCQl9DQo+ID4gKysJ
fQ0KPiA+ICsgDQo+ID4gKyAJLyoNCj4gPiArIAkgKiBJZiBmaWx0ZXJzIGFyZSBlcXVhbCwgdGhl
biBkb24ndCB1cGRhdGUgc2NhbiwgZXhjZXB0IGZvcg0KPiA+IHdoZW4NCj4gPiArQEAgLTIyMTYs
OCArMjIyNSw3IEBAIHN0YXRpYyBpbnQgZGlzY292ZXJ5X3N0b3Aoc3RydWN0DQo+ID4gZGlzY292
ZXJ5X2NsaWVudCAqY2xpZW50KQ0KPiA+ICsgCQlyZXR1cm4gMDsNCj4gPiArIAl9DQo+ID4gKyAN
Cj4gPiArLQlpZiAoYWRhcHRlci0+ZGlzY292ZXJ5X2Rpc2NvdmVyYWJsZSkNCj4gPiArLQkJc2V0
X2Rpc2NvdmVyeV9kaXNjb3ZlcmFibGUoYWRhcHRlciwgZmFsc2UpOw0KPiA+ICsrCXNldF9kaXNj
b3ZlcnlfZGlzY292ZXJhYmxlKGFkYXB0ZXIsIGZhbHNlKTsNCj4gPiArIA0KPiA+ICsgCS8qDQo+
ID4gKyAJICogSW4gdGhlIGlkbGUgcGhhc2Ugb2YgYSBkaXNjb3ZlcnksIHRoZXJlIGlzIG5vIG5l
ZWQgdG8NCj4gPiBzdG9wIGl0DQo+ID4gK0BAIC02OTEzLDYgKzY5MjEsNyBAQCBzdGF0aWMgdm9p
ZCBhZGFwdGVyX3N0b3Aoc3RydWN0IGJ0ZF9hZGFwdGVyDQo+ID4gKmFkYXB0ZXIpDQo+ID4gKyAJ
Z19mcmVlKGFkYXB0ZXItPmN1cnJlbnRfZGlzY292ZXJ5X2ZpbHRlcik7DQo+ID4gKyAJYWRhcHRl
ci0+Y3VycmVudF9kaXNjb3ZlcnlfZmlsdGVyID0gTlVMTDsNCj4gPiArIA0KPiA+ICsrCXNldF9k
aXNjb3ZlcnlfZGlzY292ZXJhYmxlKGFkYXB0ZXIsIGZhbHNlKTsNCj4gPiArIAlhZGFwdGVyLT5k
aXNjb3ZlcmluZyA9IGZhbHNlOw0KPiA+ICsgDQo+ID4gKyAJd2hpbGUgKGFkYXB0ZXItPmNvbm5l
Y3Rpb25zKSB7DQo+ID4gKy0tIA0KPiA+ICsyLjMzLjANCj4gPiArDQo+ID4gwqANCj4gPiDCoA0K
PiA+IA0KPiA+IA0KPiANCj4gDQo+IA0KDQo=
