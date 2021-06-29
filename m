Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web12.4647.1624949234045669183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 23:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=fcVo9ePQ;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: ito-yuichi@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1624949235; x=1656485235;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J2EWZoRCf9z5114RcadTXu2Sa2nqo54jNwOsgQEguVQ=;
  b=fcVo9ePQKUESs5kOA040fGrTTcBsQuzbpaHkXMNBikpvRLijSEbR2yLS
   BALJh9hBdBSt1ZgoKSS1awDyCdNgRsB3+5v4nuf8Xxw0vVeDw00QpQVxB
   KPkyS9sbAenpG93XspTf58AAp46vWPl13paYTN5rgB7Moxkq7tlDl9hmK
   gRbMTEI2JsU4+f91hYLX9Kzgsx79IMO3nqTESTwQhUx4azTzx1JpbAMB0
   vhkkYNd7b2r2bn6ZPnwgbTC+3h2ebARFwSzVfgOXha+w7eVNNrLiAL4Ie
   w10c62Bkk96M5FVO1302uK3YIRCasMsHM7bdKW318c/oYTrTPMIfrMypa
   Q==;
IronPort-SDR: Ag3RC+nFK3n4IfgI1Cr1BfAqDdwQJ5SLN/toHqNspAK6i3sV6rZ+L937qbbaJ3nc6PTpJuJ5GJ
 4C7McSLRQ+gEVJ/Qv9S3IM5GICIAHlZvHevpjHmLR+lVzRbL4bq76/JPF05NB4FCBaAs/uEnab
 qlAtgVf5A2X+u+0VA3qVwlAmV09i5KOoeewupfHewSlNWnCYpXuQac4JWgWXT43OuUa546av9c
 PEvBzhZxSf5g+5F/X16gPSfdnUmvmhC+5UTP6iE1iSex1hkLveG9GmjntNaJ3f8TDAKey72pVc
 mJA=
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="33836538"
X-IronPort-AV: E=Sophos;i="5.83,308,1616425200"; 
   d="scan'208";a="33836538"
Received: from mail-hk2apc01lp2056.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.56])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2021 15:47:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDyJZxWGiY4+IkNKWN4osQTCsTQZk1qAcby+0OY925bBg4AnrXOnyb/ZkLJYsLXoH0l3OtWwlZTdloMtNjBKvNTqC+wbkS6Glr5x2KIo6rJ2l/udmqH7R3PhQ/9ecAYtttTsiyAanC4FEl5xF7Xp/Lp1szmNF1PdxDfx57x9k2I4HAdI/M3sC33ggU0sVGSafgu68Dg9NIhKwEar6y/VQUDnKy3Vjp/wltV1G1BV96TXdR5eg6uwxYYH/5AoUCAEdWiTgIm1AqCn+4nn6p7ePA7CH9WnoypUbKujL/yNZCFDQ1V/QQzYIiDGWhKgVF2i89rgw2WKNzbR1ELfslrAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2EWZoRCf9z5114RcadTXu2Sa2nqo54jNwOsgQEguVQ=;
 b=AbDdLRlD5JIVrpLNypNoy9NP7y9sP7G/+gq0nlQ992m2y+jAXSyWbX8UdqTAlf5V9C52ZOt2u/hnaoRdNsfq0C8bU+lV169WI8d0YO2nWTLlbWn151en5sXlMs8Pf5l6Wq6U3HUF0pfajzDu0cwHqVlYrbkAcXI7O9SHlax4UEXF8fpHiiuVWaVU1dVVKzdbcjainM7gRjR0Cn1yywgqY6aML7PWipVTch2fupbnGpwJb7eSZaDflhhqxW3bi4V6CGeeFS3Y/2GUO6rJEMjIKUls5YeA7j/a3UknptZQuXNp4Exps3fm7FNVDILOlEf2cNseLWoEd5EQA1SZDADhxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2EWZoRCf9z5114RcadTXu2Sa2nqo54jNwOsgQEguVQ=;
 b=AdEyGf3Mw12wqjD8pS4T1dnkYJkHv1quI3JUhuMSM5GE6WPyxUm48PNQSOiPkf6N6cuS4kUZQ2pZ67OfOIH+IhvIXG+Mhx07ldRxTTlcZBbQUnnH6MxcJZ3yAZTrpjnYcfOiThRpOJ6oQ43gYKF9Fg5+3kT4s85iFU48q6mW4SY=
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com (2603:1096:400:41::9)
 by TY2PR01MB5066.jpnprd01.prod.outlook.com (2603:1096:404:113::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 06:47:08 +0000
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::446a:7e01:7ec1:953b]) by TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::446a:7e01:7ec1:953b%4]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 06:47:08 +0000
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cve-check: Add allowlist that is same function of whitelist.
Thread-Topic: [OE-core] [PATCH] cve-check: Add allowlist that is same function
 of whitelist.
Thread-Index: AQHXanKtSp8zYPvAjEKvHUlVZf/v6qsqifXQ
Date: Tue, 29 Jun 2021 06:47:07 +0000
Message-ID: 
 <TYCPR01MB5599A75F5F67F435FE719C8D8F029@TYCPR01MB5599.jpnprd01.prod.outlook.com>
References: <20210623085633.3186982-1-ito-yuichi@fujitsu.com>
 <b7b05b428677e6d8f39c700ff4ce212a9baa8918.camel@linuxfoundation.org>
In-Reply-To: 
 <b7b05b428677e6d8f39c700ff4ce212a9baa8918.camel@linuxfoundation.org>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfRW5hYmxlZD10cnVlOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJh?=
 =?utf-8?B?Yy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRlPTIwMjEtMDYtMjlUMDY6MjQ6?=
 =?utf-8?B?NDBaOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0?=
 =?utf-8?B?ZmVjZTA1MF9NZXRob2Q9U3RhbmRhcmQ7IE1TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?utf-8?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX05hbWU9RlVKSVRTVS1SRVNU?=
 =?utf-8?B?UklDVEVE4oCLOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9TaXRlSWQ9YTE5ZjEyMWQtODFlMS00ODU4LWE5ZDgt?=
 =?utf-8?B?NzM2ZTI2N2ZkNGM3OyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1h?=
 =?utf-8?B?YjRkLTNiMGY0ZmVjZTA1MF9BY3Rpb25JZD02NmVjNzY1Ni0wMDhjLTRiZWUt?=
 =?utf-8?B?OGNmZC01YmZkNWYwMzg0Yzg7IE1TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00?=
 =?utf-8?B?MmFjLWFiNGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA=?=
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [210.162.30.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66ed044a-69ff-40b1-f189-08d93ac9b6eb
x-ms-traffictypediagnostic: TY2PR01MB5066:
x-microsoft-antispam-prvs: 
 <TY2PR01MB50666FCED60F4301DC0E8F8C8F029@TY2PR01MB5066.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jIHtk1ETa8maT0d7ev13WD4Hh/Kxp4C7rkeleriPapLc3pgSSrZNe53za9iLxF9Zo7HtcjLh8ZMvFbwNeDMOl6Xn/eyZ+acOQ12Hbh8TIuPn6XlR/zSaoT2f/06K751ziD0t/xSBekZusqxFhRg5cUEhCumCbkA5gLOoObjkNH8NjDz+L0sdU9bfjFKW3waJ4v/o5kYWmT+aTI0Pf58ZSCjUCec/T0MpE3d3ZhAswELrhu70GN8FoTeMT69YfzjiV70aLCFhS6MD+3ZbEY9/mZ1INE6OnwmibUy8OC5warbSTBxqilO7LpKPWFQEFVCSTQOUWTjTIcthegkqMezFbbzvi10FHC2YrJb9fd4PY8ESvvHZoLE5b7OixmTdmbnv8qOJXMP5XYT6Vyz2Uzw4eFgoy6TYgluDR90qPZVPu3uOc8pX3VfF8M2Pwd5K8juQXo7DQCrQPBVHgLz+RqO2nyLkDJBlHk1s8ABzjU8Pxi6e4flUahhnAb1VmnU2xrqcu1umg+IZuASWg83ll7dvJfknFJVy1y4K2NUsMhUBk5jYvHcKdM8ic6H1H50IqAJSapBMSySQUZAuNL3KFVHn8CBgf6mBfdJZ9RuFWQf7bbQzka2v/3RqWOATKN8eJNDwU8pGJNyZDtth69ycbyxcNAYxDxIaOtTAnTsK6xfo5vnXYkOj2JnNuB7B7rFhAur/v2dLaFqhi7lRrkw3dsLHhkSJ4BwSu3a/tE9OGetEFZ8opfGPr0yvW/DB1/YXnF6m4D19nx5gySYUYmhsVNRIGA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5599.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(83380400001)(38100700002)(4326008)(5660300002)(7696005)(86362001)(122000001)(26005)(6506007)(186003)(53546011)(71200400001)(966005)(66946007)(316002)(55016002)(33656002)(76116006)(9686003)(66476007)(85182001)(8936002)(478600001)(52536014)(6916009)(66556008)(8676002)(2906002)(64756008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZGUxVnFxeW53alQrYnZrdXFPRUpYRUlpTHdxK0owdWpxMytJWHR4emw5VHRn?=
 =?utf-8?B?UHBKREVONStNY25vQ3IxUjQvUHF1bUlvc2V5MjRqL2tJR2xGaWdURzdMbWZS?=
 =?utf-8?B?V1F6Qjh6RG5aMlkvSVFxYUU4Zm9vVkJ1M1FKMnpjOVBGOGgwb1BmakhGYnZh?=
 =?utf-8?B?NjNlUmd6ODJLT3gvdEErQzBoRmIvSVE2OUZSNmFVSWplNmlwUXVmaU1YVjA1?=
 =?utf-8?B?WXFFT2xpbjRSMldZSWdjQTRsT1dwb3VSbUVxWmlvdS9ZTG9paGo3ZEhYNlV3?=
 =?utf-8?B?QWRIQzZ4M3BlU290c0RwdHZLbkQrWUdkelVzb3huNkJJRHlFNGJYSlR6UWx2?=
 =?utf-8?B?cDA3TUhzUjZsSzhnMm15eXdKdzliYW5mTHk5N2NIZDRpdlFJNzArMFZ3Tm5z?=
 =?utf-8?B?THkxRlR6T1VvWXBYbGJPeVpXWUx2UC82R2ovZ1pIazd6SHgwMzBKWityc1Vv?=
 =?utf-8?B?WTUwV2s0VkhuQWlWWHFQQi9peG1zWitFN2tLWDRqRks0TktQSlJrNEVJWGhu?=
 =?utf-8?B?d2tqdnNlSW5TSzBsb0FFSllVNHNjTW1kR0JDemd6L01WbldxaDhTSnVUZk40?=
 =?utf-8?B?SWVDU0NtWXQzZEwyRUpuRjVDdmt0OUl0NE9kMTZTUmRWdDVyb25FMGtnT21Z?=
 =?utf-8?B?NE1kRC8zdmlJNkRMZ1gvT0lycy9TcVdCSnpTS3pDZXFXWURWVVRVVzRSU2pS?=
 =?utf-8?B?djI1VlYreFlKMTQzck5kaThVVkZ2ajRXbHZWbmQxNk02ZXBCblNqRld1MnF5?=
 =?utf-8?B?N21vRDRxcTNJa1ptRU40d2tXelp3UGJIN0RsVkdmSHBuVHVpbVd6ZHF1VmhT?=
 =?utf-8?B?Qm01U0RBc0ttTjZzQ2FoMU1ucTVtcHN6dDBpajR3WVV5cDZSWXMrQzN3OUZ5?=
 =?utf-8?B?bFJvUG5lS0ZzZG9PL1FXWGczVFcxZmJpL01IMzBYNkg2RENPOGxoSkgzNXBu?=
 =?utf-8?B?M0xzbStKeUpEd051M0tXenJickczYWhUdWF5U0NXTGRMSmhjM3c3K05wV3Rp?=
 =?utf-8?B?VE85RE9KRTlOeURlazBwaGI3YUMyY1VYejh2UUVoV0V2cWZvMGpxZm1uR0hk?=
 =?utf-8?B?bEdNc0t4WWxBOUFiM1YxVVJ2aFR5azVFMVhhSFVmN0hhTG9MWCtDNUpNcnBB?=
 =?utf-8?B?N3d0YW0rYmZlQmdwaStvaUJHS3FZekVXNnRKREV2WWt5aEhRakhRMUxCbXRo?=
 =?utf-8?B?MmZXRGIrWWhUamFBM0tyQXpKOVc4WE5VM01sVUJBWWd2dklLbkdWYTJoaWJo?=
 =?utf-8?B?WExLUkJjMVh1OWpFczYzYWxUVFZIODNoNVhYQ3lzNmczTmVYb3dhRjQvdm5Z?=
 =?utf-8?B?dU56TXZxaGZWNDc1SXZUQ21Ea1o1SkNkOWZrY0VRWHYxMW1VS1l0K1VTYWhC?=
 =?utf-8?B?VGl6blhtNUl6dm53eU5NKzFpS3VXTXg5Q3B6eTV6aTVQOGc4L1FGMGZHTW1z?=
 =?utf-8?B?czJXRTRlaGNwWWZ5bDI1VEVyK0I4U0lpbGdDd3owdUFNSERUeUtjVE5qOGls?=
 =?utf-8?B?VzdEU3g1NzQyL3JLWldtdmVBTDhoVXpWVmcxeEx3ZlVLVFFPL0R0NUpWZ3Fx?=
 =?utf-8?B?NjRUSDdXSXkwdHdBSUZTWWNHVElUVnpKRnhBOFZvbWNOMGdPKzZBSVZYdmRB?=
 =?utf-8?B?QlhMMDV6RG11dmlXNU4ydDQyU3QwMUZSM3RMNWRzb3g2dTJPTllXeDg2SXVL?=
 =?utf-8?B?azlHQ0R1ZlBQV2lvWmRZWHlwUlg5NjlxUll3Szhpa3ZoWWg4RlJyUXlQdUJF?=
 =?utf-8?Q?vKEzDKB06hE/LX1Jyw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5599.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ed044a-69ff-40b1-f189-08d93ac9b6eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 06:47:08.0314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vS1MzvvmLz8n/Ap8rgvXs2kPDNi1YibUTo3/Eu6CZkKkSFSrLlkawSGLAUci2p1OFUHM0ypLYAt4VMqNIELWFOlWdJ9GXa0sKTuiUd+9KXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5066
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KVGhhbmsgeW91IGZvciByZXBseWluZy4NCg0KPiBJIGFwcHJlY2lhdGUg
dGhpcyBwYXRjaCBoYXMgZ29vZCBpbnRlbnQgYnV0IEkgd291bGQgcmVhbGx5IGxpa2UgdG8gc2Vl
IGEgd2lkZXINCj4gcGxhbiBvbiBob3cgd2UgYWRkcmVzcyB0aGlzIHJhdGhlciB0aGFuIGNoYW5n
aW5nIHNpbmdsZSB2YXJpYWJsZXMgcGllY2VtZWFsLg0KDQpTaG91ZCBJIG5lZWQgdG8gcmVwbGFj
ZSBub3Qgb25seSBDVkUgY2hlY2sgYnV0IGFsc28gb3RoZXIgY2xhc3M/DQpJIHBsYW4gdG8gcmVw
bGFjZSBpbmNsdXNpdmUgbGFuZ3VhZ2VzIG9ubHkgaW4gQ1ZFIGNoZWNrIHRvb2wuDQpJIHdpbGwg
cmVwbGFjZSB3b3JkcyBleGNlcHQgZm9yIENWRV9DSEVDS19XSElURUxJU1QgaW4gdGhlIGNsYXNz
KGV4LiBjdmVfd2hpdGVsaXN0LCB3aGl0ZWxpc3RlZCkgd2l0aCBhbm90aGVyIHBhdGNoLg0KDQpU
aGFua3MsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQ
dXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFNhdHVy
ZGF5LCBKdW5lIDI2LCAyMDIxIDc6MDQgUE0NCj4gVG86IEl0bywgWXVpY2hpIDxpdG8teXVpY2hp
QGZ1aml0c3UuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY3ZlLWNoZWNrOiBBZGQgYWxsb3ds
aXN0IHRoYXQgaXMgc2FtZQ0KPiBmdW5jdGlvbiBvZiB3aGl0ZWxpc3QuDQo+IA0KPiBPbiBXZWQs
IDIwMjEtMDYtMjMgYXQgMTc6NTYgKzA5MDAsIGl0by15dWljaGlAZnVqaXRzdS5jb20gd3JvdGU6
DQo+ID4gVGhlIExpbnV4IHRlYW0gcGxhbiB0byByZW1vdmVkIHJlZmVyZW5jZXMgdG8gcmFjaWFs
bHktY2hhcmdlZCBqYXJnb24NCj4gPiBmcm9tIHRoZWlyIGNvZGUgZm9yIG1vcmUgbmV1dHJhbCBh
bmQgaW5jbHVzaXZlIGxhbmd1YWdlLg0KPiA+IFNvIHJlcGxhY2UgdXNlIG9mICJ3aGl0ZWxpc3Qi
IHdpdGggImFsbG93bGlzdCIgaW4gY3ZlLWNoZWNrLg0KPiA+DQo+ID4gRmlyc3QsIHdlIGFkZCBD
VkVfQ0hFQ0tfQUxMT1dMSVNUIGFuZCBpdCBpcyBjb25zaWRlcmVkIHBhdGNoZWQgYXMNCj4gd2Vs
bA0KPiA+IGFzIENWRV9DSEVDS19XSElURUxJU1QuDQo+ID4gV2UgcGxhbiB0byByZXBsYWNlIGFi
b3V0IG90aGVyIHdvcmQgbGF0ZXIgYW5kIGV2ZW50dWFseSwgcmVwbGFjZSBhbGwNCj4gPiAid2hp
dGVsaXN0IiB0byAiYWxsb3dsaXN0Ii4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1aWNoaSBJ
dG8gPGl0by15dWljaGlAZnVqaXRzdS5jb20+DQo+IA0KPiBUaGUgVFNDIGRpZCBkaXNjdXNzIHRo
aXMgYW5kIHByb3Bvc2VkIGEgcGxhbiBvbiBob3cgd2Ugc2hvdWxkIGdvIGFib3V0DQo+IGFkZHJl
c3NpbmcgdGhlc2UgaXNzdWVzOg0KPiANCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWFyY2hpdGVjdHVyZS90b3BpYy9pbmNsdXMNCj4gaXZlX2xhbmd1YWdl
X3N1bW1hcnkvNzU4MjE4MTkNCj4gDQo+IEkgYXBwcmVjaWF0ZSB0aGlzIHBhdGNoIGhhcyBnb29k
IGludGVudCBidXQgSSB3b3VsZCByZWFsbHkgbGlrZSB0byBzZWUgYSB3aWRlcg0KPiBwbGFuIG9u
IGhvdyB3ZSBhZGRyZXNzIHRoaXMgcmF0aGVyIHRoYW4gY2hhbmdpbmcgc2luZ2xlIHZhcmlhYmxl
cyBwaWVjZW1lYWwuDQo+IA0KPiBGb3IgZXhhbXBsZSB3ZSBtYXkgd2FudCB0byBzdGFuZGFyZGlz
ZSBvbiB0aGUgdGVybSAiSUdOT1JFIiByYXRoZXIgdGhhbg0KPiAiQUxMT1ciIG9yIGV2ZW4gIkZJ
TFRFUiIgb3IgIlZFUklGSUVEIiBvciBzb21ldGhpbmcgbW9yZSBzcGVjaWZpYyB0byB0aGUNCj4g
bWVhbmluZyBvZiBDVkVzIGFuZCBDVkUgY2hlY2tpbmcuDQo+IA0KPiBUaGVyZSBpcyBhbiBvcHBv
cnR1bml0eSB0byB0cnkgYW5kIG1ha2UgdGhlIG1ldGFkYXRhIGFuZCB2YXJpYWJsZSBuYW1lcw0K
PiBtb3JlIGNvbnNpc3RlbnQgYW5kIHVuZGVyc3RhbmRhYmxlIGJ1dCBpZiB3ZSBqdXN0IGNoYW5n
ZSBzaW5nbGUgdGhpbmdzIGF0IGENCj4gdGltZSB0aGlzIG9wcG9ydHVuaXR5IHdvdWxkIGJlIG1p
c3NlZC4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0K
