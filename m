Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.68])
 by mx.groups.io with SMTP id smtpd.web11.432.1630523057254598041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 12:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=gtAp3vNr;
 spf=pass (domain: siemens.com, ip: 40.107.4.68, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQGMhJhlOlJIbQehFMUCfu4Ike2V5iz3NVX6M0GCYIHY9wp2oBjIv/YVM0+CpagU5QCzcg/SDQ2334XJconqQqkTtPSI1921q3YzJFNsx+tncO8GpoWmvMvFRkZkJAfKLag3Yy2Bhf0WPO+1CXNNBEk5W4KRjl3YRND+d8wULddcDkfbBvEoGU5vLj8NG2v+U53AGYi7gKIlE+mkdEp3/QVxanPjFAyYj7qTn3xZDQp96P4yTDKBmYIU6hPOAgx+/bCAvHMvQrOv7zC7yXLERYb3H2wM/LxlgID2ak3yDSfv9jZQgvrIDZq2Hu4ZDOdnI/yeWg5YMTvn65DJrMJIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDN2ThJDLiwy+1TOglp2VbQWr/2WSLIGkB4w0IEJ3uw=;
 b=U3Ns9H5wmCzKPgwEx0xqXZRgAqMZrXgWCBSYmgdzVtE4GjpsABQV07b/pdkqw5AVZt6WIQOmuX84kixNSSnuz3LUwlaW+IUUl/Z7RsVeMFN7XSXFcjA3i1DwAz6EtX3j8c20HKnG/m3zSKGCbRekhRgt23ZQaYydJJbfL5fnStFaklLkfzLvrwTPosHrAdh5QgTVqN2uiI1ScPTbZB/cQxfDQNhx49dfoWX43g6V6rD3m/4ozbAW9pBJq72Ohtd55XVJc+1CCfnlhx7FNi5iApWd7qs/sR+pnG6KJuor83RhyrkW1iLQY04WRIAIitqsxvlri8q6x05IbWyLdF/AdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDN2ThJDLiwy+1TOglp2VbQWr/2WSLIGkB4w0IEJ3uw=;
 b=gtAp3vNrpw9Sh6Y+79kmqqlFY4dlkdZjDpBzZN3bqClaSFLm2kpLcTAZVtDcLA4GUBc5y74hJx3wTUYmK4pEknauZO+XtcuMSsd/11Wjplhsj8fFLmxzLrqToHZX0IfH0VuXn0+RmmsZVMjQpJ5TtQ9p3HQYWTTOxGiCuxGlX18=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB7PR10MB2153.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Wed, 1 Sep
 2021 19:04:15 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 19:04:15 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] vim: add option to disable NLS support
Thread-Topic: [OE-core][PATCH v2] vim: add option to disable NLS support
Thread-Index: AQHXmnyJE/lubZVXjUOOdINcrbAjhKuPk1SA
Date: Wed, 1 Sep 2021 19:04:15 +0000
Message-ID: <3f9e5142ddd2b90cc3e150287d0f88456188d56b.camel@siemens.com>
References: <20210823101205.29267-1-andrej.valek@siemens.com>
	 <20210826131549.2349482-1-andrej.valek@siemens.com>
In-Reply-To: <20210826131549.2349482-1-andrej.valek@siemens.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f6e084b-13d9-43d8-eea3-08d96d7b4ada
x-ms-traffictypediagnostic: DB7PR10MB2153:
x-microsoft-antispam-prvs: 
 <DB7PR10MB21531217EB48C34612BEC7A092CD9@DB7PR10MB2153.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dycRRNYwDH/slZwyLX16GksOVeOrjJiBS30ladwdjQjWXkOD3UBwxWWYCO3Bl5M1lj2b6k1i3AFV47YDIBkZIYX9SP85a5IEg04MrP9KgN6EIcj3C2hl74btrmQ1t4XU33hJJLa5ixO74HlBBE4KDhra6m7yD6yG7hUHstm4vyKT2Rgk2jdSm4nr9nQqScabc5RH+bqYOxuA51vKwG2MtBDCbWr4uEyDYc+7kSRareDKaImu+h/jnZuNbj28NMQOLTwV0011JRLhfOL+QzX9fiN81QcyBHbMdcq6uCvOejDMVDQE1862tF82MFRf030/0f6qcU3Nil3hxFNPp/QB5xpC8gVcRY0Zd1VrHGWi/lNoT+Cm6iKZfWQqztJWAjttW0Z+rt8fHtVwpYSqj1/s0B+fBNwEeR1OqJtIKj0ZaQ0P+C0Gmh+uwV0VQYbYOiC+10/liaTSTR0sl2GfkEri45pUIcIgawnfHehnFzC/uf4bdl9tRZMLxfRkBDdMYajLA4UlAJsHvbExXZ58DTy54VDesCK0RQ6bOIp59XD6EoaQStWAuspw56a6ruhxPmKPScax8sYXw9lh5swAZI3BilnlVqL18f5KS5HJL0hHFMw3GZtgnktAH3Hd56o0LzwK3WAE+py64q36Kp/P8kKJFmaYsAB5sAYeLc7PM8Atk6CtEeqLwd9nMQ74Op6C0h/tWSb8nNTnd6m4f+irlEhz3A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(6506007)(66476007)(66556008)(76116006)(66946007)(6916009)(6486002)(2616005)(86362001)(38070700005)(186003)(316002)(8676002)(54906003)(91956017)(64756008)(8936002)(66446008)(6512007)(38100700002)(36756003)(4326008)(122000001)(83380400001)(26005)(2906002)(5660300002)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ay9qclJOZzM2WDE0OE1SaHM0ZjJRazZibXBpZFZHR2hwWVQ2dzhmRFZ5bXdt?=
 =?utf-8?B?WTF4d0tCL0Nqd0FlYkF2L0RicC9wczFMSUJkUHJsaHdrb1F4TWg1ZWJVYTda?=
 =?utf-8?B?RlRKaWl4cmt2K053aVd6dVJWYkRYRWVZL0VIVTNwdTFtZVY1UGdSY2Y0QVVL?=
 =?utf-8?B?dVZQdWhXM0xZRzgwZmNiMG04RzBMMk9WaTJ6MUlZNi80ZStvWWNaWkdzTm93?=
 =?utf-8?B?cEQxb2dYbWpwYlBIWGdtTCt2TTNsNU1tbnhwUjNETXFOSjZTbFlTVUVFb3Vm?=
 =?utf-8?B?R0tiUUExdTNVNUdPcXhYWENFZm5DdGRCemJpa0Y2NzRUYlpCZjlJYzA5NXZN?=
 =?utf-8?B?aGdmZEVyd2U0VXZla3I5QkNEeVBKWWJOTWpnWjV6L015dTMrVWxHYVRncnAv?=
 =?utf-8?B?SlFQci9CU0lUV05JcHRNUk1VTEFPZ08rN0twTDI1eUlubTVHYUtiUkNpWGZY?=
 =?utf-8?B?WDJtVm5OVGl3b0QwMWNhbUlPS0JhZERtbkxLeFJIM3dMVSs5b2ptbGp2NjJI?=
 =?utf-8?B?MzhOMk54VVd0ZG1DYXZnSGJ0a0ZtMGxTYU1UYXM0VjN3dTFCMFMrOGExZkJY?=
 =?utf-8?B?ZmY3eUh5ZklGYzFPS3lhQ05SUGFpcUxWODNxN0RWd2lvU0N1UHVHM2w5Wksv?=
 =?utf-8?B?L08rZ1lLWXNBdEFHdXEwcjNQM1FKMDlwZVArRDVoWkcrUXhxWWVnb1l3RWpq?=
 =?utf-8?B?WjFZNzgzMkx5U2FSSTZMamRZUHNZbU1jTUdjaHlWa0J2Zy8rOG1YLy96Q0Qx?=
 =?utf-8?B?ZnBtcjM1QndQZ1lTY05OY2UyNWdqQTNCSjBFcUJKcVNWM29lbDB5ck1xWEFa?=
 =?utf-8?B?RGkzN1ZQMHNGeFFXd0hWU0JwZkJvM1Erd2JmZEZ6a2dzUnl0OEwvd241VXBt?=
 =?utf-8?B?anV1aFNMRkZQcEVDRmlQNHFLRWc3SVFGbjEwdUR5U21kK0h5alQvMUF3UW8r?=
 =?utf-8?B?ZDkrYm1rM2s1VklnY2RKL2RjQ1lXT2QrRnExRDVyQ2t2ejJXZmhFRDVJT2F2?=
 =?utf-8?B?Zm5FUWZtZGJDdmVGVkNDNzROUmprczBneUIrZVpHazV0UUNXMmJ2ckpxZk1x?=
 =?utf-8?B?VFhTT2JjbU5hZVp5WGMxUEEvM0gvWE42RkN5RDZvYWc1SVMwdS9wd0VFZ09M?=
 =?utf-8?B?aE0wOWhxcExHdG1XaC84TXE0YWtpV2E5U1JlZHRQMXZ3T01heUdRY3VLVXR5?=
 =?utf-8?B?SzhJNFg3M2xIOHNKYXhsZ3Y4bDZ6QUVDYi95RnI0R2dzK1RaakFhQjR4Um91?=
 =?utf-8?B?Um1lb3Z1VmNyeUV0VzlVMjhrSm81cW80UDk0VGNtZytYS1VkR2lCKzVRcXVH?=
 =?utf-8?B?MmFROTNONGxXOERhNCtadHV2cEszZFFKK1htZEZyVm40VnFKZWlzSFhHZk93?=
 =?utf-8?B?MloyN2oyUDhKVmxmbDVkQjE3YUJTTVJ3MjRLSE5MMEJsVk9rQkhXVXQ3WFVN?=
 =?utf-8?B?ZG1XWW1vaGh2QlRKY3BaOUl0WCt3cFRwcWEwKzg3TEFZSUFocDQrTjFvVUlX?=
 =?utf-8?B?YUZrZFE0OUZnWHR0NmY5eGplUXZ0Q2xiWm9EeWpkYTN5NUdFVy9ZTXpzSks0?=
 =?utf-8?B?b0VMVTdlejhaSTFBOHhUQXNNUk5hQmlYWUo5OGNSUlp5aTc4bEdkZ3B4OGpN?=
 =?utf-8?B?U1BrOTkycjBzRjZacTUxODJWTEZEVHNXZ2ZUY05oZUlYN3MyQlY0UjJsam1Q?=
 =?utf-8?B?T1F4S1UvVEJqQTBCNTFWQVUyaEQvbmowblBFdnpyYWgrRHR6aEQzQ2g0QzVF?=
 =?utf-8?B?ZUpxZG1lNTBMU0lobzF0QjZLWUNaTUxrdXpPaG1oc0E3clEwdWtON0RublNw?=
 =?utf-8?B?MDRBSjBGQW1PNDdtQzhlQT09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6e084b-13d9-43d8-eea3-08d96d7b4ada
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 19:04:15.2518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SdjSZ4yy8h/HHgBrBUioDF+hqnT246Asmi2eIqPxGdABEFh2DKC00V8toHpyQFjBFTJebfZFI2SmM4kAePdWv8umfLZ+NfJcWhEYIWGo0ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2153
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ABE535D62859A46B4DFC9670CD47C90@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SGVsbG8gU3RldmUsDQoNCkNvdWxkIHlvdSBwbGVhc2UgY2hlcnJ5LXBpY2sgdGhpcyBwYXRjaCBp
bnRvIGR1bmZlbGwgYnJhbmNoIHRvbz8NCg0KVGhhbmsgeW91LA0KQW5kcmVqDQoNCk9uIFRodSwg
MjAyMS0wOC0yNiBhdCAxNToxNSArMDIwMCwgQW5kcmVqIFZhbGVrIHdyb3RlOg0KPiAtIFNvbWUg
ZGlzdHJpYnV0aW9ucyB3aXRoIFVURi04IGxvY2FsZSBoYXZlIHByb2JsZW0gd2hlbiBOYXRpb25h
bA0KPiBMYW5ndWFnZQ0KPiBTdXBwb3J0IGlzIGVuYWJsZWQuIEFkZCB0aGVyZSBhbiBvcHRpb24g
dG8gZGlzYWJsZSBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlaiBWYWxlayA8YW5kcmVq
LnZhbGVrQHNpZW1lbnMuY29tPg0KPiAtLS0NCj4gwqBtZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0v
dmltLmluYyB8IDQgKysrLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0v
dmltLmluYyBiL21ldGEvcmVjaXBlcy0NCj4gc3VwcG9ydC92aW0vdmltLmluYw0KPiBpbmRleCAx
N2QxYzI0YTdjLi44NjBmZDI0ODYzIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC92aW0vdmltLmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLmluYw0K
PiBAQCAtNTQsMTEgKzU0LDEyIEBAIGRvX2NvbXBpbGUoKSB7DQo+IMKgwqDCoMKgIGF1dG90b29s
c19kb19jb21waWxlDQo+IMKgfQ0KPiDCoA0KPiAtI0F2YWlsYWJsZSBQQUNLQUdFQ09ORklHIG9w
dGlvbnMgYXJlIGd0a2d1aSwgYWNsLCB4MTEsIHRpbnkNCj4gKyNBdmFpbGFibGUgUEFDS0FHRUNP
TkZJRyBvcHRpb25zIGFyZSBndGtndWksIGFjbCwgeDExLCB0aW55IHNlbGludXgsDQo+IGVsZnV0
aWxzLCBubHMNCj4gwqBQQUNLQUdFQ09ORklHID8/PSAiIg0KPiDCoFBBQ0tBR0VDT05GSUcgKz0g
IiBcDQo+IMKgwqDCoMKgICR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2Fj
bCBzZWxpbnV4JywgZCl9IFwNCj4gwqDCoMKgwqAgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RS
T19GRUFUVVJFUycsICd4MTEnLCAneDExIGd0a2d1aScsICcnLA0KPiBkKX0gXA0KPiArwqDCoMKg
IG5scyBcDQo+IMKgIg0KPiDCoA0KPiDCoFBBQ0tBR0VDT05GSUdbZ3RrZ3VpXSA9ICItLWVuYWJs
ZS1ndWk9Z3RrMywtLWVuYWJsZS1ndWk9bm8sZ3RrKzMiDQo+IEBAIC02Nyw2ICs2OCw3IEBAIFBB
Q0tBR0VDT05GSUdbeDExXSA9ICItLXdpdGgteCwtLXdpdGhvdXQteCx4dCwiDQo+IMKgUEFDS0FH
RUNPTkZJR1t0aW55XSA9ICItLXdpdGgtZmVhdHVyZXM9dGlueSwtLXdpdGgtZmVhdHVyZXM9Ymln
LCwiDQo+IMKgUEFDS0FHRUNPTkZJR1tzZWxpbnV4XSA9ICItLWVuYWJsZS1zZWxpbnV4LC0tZGlz
YWJsZS0NCj4gc2VsaW51eCxsaWJzZWxpbnV4LCINCj4gwqBQQUNLQUdFQ09ORklHW2VsZnV0aWxz
XSA9ICItLWVuYWJsZS1lbGYtY2hlY2ssLGVsZnV0aWxzLCINCj4gK1BBQ0tBR0VDT05GSUdbbmxz
XSA9ICItLWVuYWJsZS1ubHMsLS1kaXNhYmxlLW5scywsIg0KPiDCoA0KPiDCoEVYVFJBX09FQ09O
RiA9ICIgXA0KPiDCoMKgwqDCoCAtLWRpc2FibGUtZ3BtIFwNCg0K
