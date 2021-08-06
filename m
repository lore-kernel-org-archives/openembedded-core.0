Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web12.2344.1628239101604660039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 01:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=UOBiUAtM;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.246, mailfrom: ito-yuichi@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1628239102; x=1659775102;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w/pJBowJVjWa4hWv/6Q47U2/MVTSX0e/ovdPPf/TTRg=;
  b=UOBiUAtM7w8BtqRvEFClSP6/HlCjAZMAb2doIOoErXZLpPx2pN7Yif9i
   ZRUWRFw85qiVZ30yl86Bs6qOSaHl0uME/5JZm2pVEWvU4dsoUnn2m8O+4
   2N4u24rsMvaZmApFtgUfRdKWsjVdYAED/LfsT5OCAdXJiUZVdh3s9AjFX
   z+nVQ8Dd0j9XhDVs8nEh1vd8pN+/mWE/DIVAapIaTdor34TU8Z9MVAOpw
   OKtcMZ34HEXFeX+UepVCNA+MWRlbV/duic4gNHjF4cxDjypf+6n38pyZV
   y+aHyUDC5pBzuasTmd7YDbv8ot1feGa0cm6/j2am+qlDdSd69GTWtk1Kz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="44429968"
X-IronPort-AV: E=Sophos;i="5.84,300,1620658800"; 
   d="scan'208";a="44429968"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 17:38:18 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eG74NmojV6+pBQpiEyCbCvWK0YYhHW2c/+boVGdOEdwT8wwiNY6AISK2JL4qC0JrlrnRiLhHODVoSG4KpJpbs6CCi1zGYG/OxQ/gnpDzd6Xpp+psePleJG1TiLsN7ZdTCMe5AfU2MAhJMIVR3hHSDIZ+qlmO6B0Pjiz09sqDYc5ff8IJUyg3TCUvz+Y9FaYNnPBIqh1DxYTs9ixsnaer3gsDgq4g56lKh6J78eGvdh94UyTpR6IESBsvl/flRf5pQRVMtvERrkkO9dIZ/4u0ejpJJacU0/X6Iscl3GRNkBsSY+AdtAvu3NgFOuvmlS32xX6y6jwSojo+m5uStmGe2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/pJBowJVjWa4hWv/6Q47U2/MVTSX0e/ovdPPf/TTRg=;
 b=mM6cwZPT/jxc5rZBbHLNygm7dwNLXBda+uR3Jx3mUGODHNxUKiu8+ZLfsuwDHBY7PPNfen+tybLTmdRWVvtzuKFiY70Y/SKv/M7yB0omKJbioleTmMQliDfTNQoOLo4fWqLfyzNs3dWo06NNZ+/MCm7JV1IkAxtOU6sIRVcYZ0Nl0lBRMEimIK3/IPSm3nbeSz3qE5iZ64tm2dHspw5Qmc59xawxIfXWuVtM3I+O5LROo8IfFD2Vnhwy8KfKT8rQSzcMsILTJDnxa7gTzCVng1mRWic2pV3Tin2+buFkpZpbXbC0il8O9Pnzgl3Yx1wjIwhj7f2T94HE/4HJxIU1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/pJBowJVjWa4hWv/6Q47U2/MVTSX0e/ovdPPf/TTRg=;
 b=adeLxsvp+Xy/3ae0zb7Opk8aQVSvE9Ol6o+yZ7dOHYwF7MKfcNNa4E8oi7yqqmDdKyoIHzfqqgegpS5SAkGtoTxJFdm1mrNiSWqXixMin1V7m2//8o+zj6WQfKGYQW4XGoSsDAW8E1lWQoNMGHXIr4eAoUbisTnjAQiKfXI9Ifc=
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com (2603:1096:400:41::9)
 by TYAPR01MB2191.jpnprd01.prod.outlook.com (2603:1096:404:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Fri, 6 Aug
 2021 08:38:15 +0000
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::856a:af45:6e9b:36f2]) by TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::856a:af45:6e9b:36f2%3]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 08:38:15 +0000
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: 'akuster808' <akuster808@gmail.com>
CC: 'Richard Purdie' <richard.purdie@linuxfoundation.org>,
	"'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cve-check: Add allowlist that is same function of whitelist.
Thread-Topic: [OE-core] [PATCH] cve-check: Add allowlist that is same function
 of whitelist.
Thread-Index: AQHXanKtSp8zYPvAjEKvHUlVZf/v6qs0zWoAgBa3EhCAGnUBoA==
Date: Fri, 6 Aug 2021 08:38:15 +0000
Message-ID: 
 <TYCPR01MB5599F425D47902067C50F66E8FF39@TYCPR01MB5599.jpnprd01.prod.outlook.com>
References: <20210623085633.3186982-1-ito-yuichi@fujitsu.com>
 <b7b05b428677e6d8f39c700ff4ce212a9baa8918.camel@linuxfoundation.org>
 <7ddffb54-dbc6-e221-fa69-5dff83ef5983@gmail.com>
 <TYCPR01MB559974130EF14CC85D5D621B8FE29@TYCPR01MB5599.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TYCPR01MB559974130EF14CC85D5D621B8FE29@TYCPR01MB5599.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfRW5hYmxlZD10cnVlOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJh?=
 =?utf-8?B?Yy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRlPTIwMjEtMDctMjBUMDY6MDE6?=
 =?utf-8?B?MzRaOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0?=
 =?utf-8?B?ZmVjZTA1MF9NZXRob2Q9U3RhbmRhcmQ7IE1TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?utf-8?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX05hbWU9RlVKSVRTVS1SRVNU?=
 =?utf-8?B?UklDVEVE4oCLOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9TaXRlSWQ9YTE5ZjEyMWQtODFlMS00ODU4LWE5ZDgt?=
 =?utf-8?B?NzM2ZTI2N2ZkNGM3OyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1h?=
 =?utf-8?B?YjRkLTNiMGY0ZmVjZTA1MF9BY3Rpb25JZD03ZTZkNDBjMS1mMmFkLTRjNTQt?=
 =?utf-8?B?ODA1NS00YTE5NGZiODRhOWQ7IE1TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00?=
 =?utf-8?B?MmFjLWFiNGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA=?=
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfe775e3-644c-4cb2-ded6-08d958b58895
x-ms-traffictypediagnostic: TYAPR01MB2191:
x-microsoft-antispam-prvs: 
 <TYAPR01MB2191AD1A2A67D255C65BEC918FF39@TYAPR01MB2191.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cfyFQYpiXOT7v+SgMvhqrCFeJJSBNYGKUZd1+YMeAXvAIrd11vmleRHsw6SE3fPaetLWkCt5gdU3sknxR2BBrLmBQdbpIxT/t5lSkt5rgbO7n5tUwxr134EK6doaEnhb/0sZA28IcJdJXy2BXNySoc8eX9xX54BuuEo4JmS8NjUIxVf7PdjEdnWMXaxoqJbxBcPSTjZrqD/O2yULguAOp7Jw5lDceU1NDkupa6L032bmXN1TBO3oiss4Nrn4y6Cc/6Vdxy6o5BrQYrTACX5lYYjOozeNUA9oaNjhNnSQ6d3H+JIEo/Nj9k56Igp53l6kwxXNXMdJQxEzahsPhLtBYkzuwWthnfdGzRjyqAmtJ+YcX+pyvx4oOlIApe3VSptiS/GPndcQvk2pjetxc7C2TKq+hHiLmJLdf9iEj7Cnf14HhtHaeX18dwrIBxJ30IC1oDFOd5nBmgMDYlERypEhcHGB8+SOCQnYJj67iyW5NXZGcM0Il/be0OpDevlg9St3LgvpkNf+vwNBM/4Gss2+d435J90pI2TpIQD4uROhAMRdNhW5dgtf7fcfYQR6YWap7bzXr1XsOq4HuG+I/c9kJKrvltopHHfS6Sh5hP4IwPKajCji28LiEzr1uSsvMOAwmJgjhQAkKoKKDw8Dml/wQFsM/ZYUWw6SjvX1YeshMiRihDltyYABTFMeSunSqQWIJ36u7rWtvvAYm+EuKBXhiikEYnz/vg6YfkDYN2lrEABMEy5PpAjYaq7MXNVrhJHCrsVKVN8RbZBr4XVU+4W5XNrFmnaioEW7G9ag5tpK0LiOW4z7g0Vygw0sd900/XdAoQW6sVFIlmn2guea8sB/ag==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5599.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(76116006)(64756008)(66476007)(66446008)(66556008)(122000001)(85182001)(7696005)(52536014)(55016002)(66946007)(6506007)(8936002)(6916009)(53546011)(33656002)(38100700002)(71200400001)(26005)(9686003)(8676002)(83380400001)(38070700005)(478600001)(316002)(4326008)(2906002)(54906003)(186003)(86362001)(966005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZUJqd3BEblVOenRNbkRjT3N1ZHhhNHB2RUltUjJteTBrelN3blgxdmNHWlZZ?=
 =?utf-8?B?a2ZxRDhVNThEeHQxTFBYejVzbnRKMHMyN0NhQ09iblBKZ3BKeVI0SjVJUkhl?=
 =?utf-8?B?UXAyZUlVMU50Mi9VemFHdmhUSHRnd1owWFB0QzhtV1RXcWQ4cHNmQ0Nqc3Y0?=
 =?utf-8?B?UEtMSk12aTlYeE8waDF4bEhzOWF4MlljWG5VZ2ZWU1VyMFhhWW5iZThuYktZ?=
 =?utf-8?B?SVR1Q3NrMzlYQWVjQ3pGUGpaYU0xUFVQSHB3MXphSldyOC9RZmo3aEJ3OFdK?=
 =?utf-8?B?Q1lQaHpCZ1k0Q0dvdnlHcS9XWlBpQUZDaHYyWXprdFQ0OGtHK2l5KzFMYzVU?=
 =?utf-8?B?bGhVcUJtdnlqSk9nNi94dUVkUGRrWWpGR2djazZrVzBzRUhhWGJ1UEdRZVA0?=
 =?utf-8?B?UEI5RjBnTmxuZ1kwOVdIdlRqNGp3cFQ3UktGclpxeGJodSs1UXZZdGdVQ1Zx?=
 =?utf-8?B?VnIzOFNZZXhuS2VxUHExVEZaUmdaYStXTSthWHJJdDhiWGcrOUV0d2VJWWlF?=
 =?utf-8?B?UjVNaUJkM245K1B3K2UyR3RySGNUaWN6Nmd0QWNPYmIzNDU4MDRLSWE0REU0?=
 =?utf-8?B?ZnFmSi8vcXpMNjExRXdETVA5QzJPcFRSMEpIZUdRd1kxQkdGdmVpZDl0Zk5Z?=
 =?utf-8?B?MUw1QzhNVkY2L28rdytXK2FpZjlYQmhPaytFQlRrdjVVSkpUeVpMaFJYNTJN?=
 =?utf-8?B?SThWYno0NzFYS0tvNjlpMEl4K3AySEJxai9lQ2xTeStOYm9nVTltNlk2Qmh4?=
 =?utf-8?B?Z0N5RHA3UFZTeGdndC9LTWo2SGwzU2xZWU1DVk1mcHdZc2QxSmtFYlRKc1NT?=
 =?utf-8?B?d2lVTklsWDJzbjNPTWMva2lNeU5Gb2dvQVBGZnNIa2tYbTRvV3FqN2o1cS9a?=
 =?utf-8?B?WkwrTzZVTE5qc0JmaUdXT0tid2dFZVE1aXZnTWdlTU15TmVLL2IxVGo1Z2ow?=
 =?utf-8?B?YjFMb3RKK1lyNTQyQXZJY204QzJBR1BKVzFZeUtudmZNZzZNbEgybnk4a2Iv?=
 =?utf-8?B?MWZBV3RHZVYrR0d6OVhWbzlWSVdzT0hyakt0M3hGK3lJenpzOUQ4N2NHV21W?=
 =?utf-8?B?UDRaeUVPUnZMd2VnSTdFMGVGTEVmWG9NUllCaUpPdFZVYXdOMVZWQVhrU3k0?=
 =?utf-8?B?dWRoRjJUa3lvNG1hbHZzMWNOTXN1elFwSWZ5UmlFZWVqdWhKNmwvOUZpUEUz?=
 =?utf-8?B?djIxWXlqQS9jdWx6U0VNaEIzS3FTZzhjTlpZVE9YbS82cTFxUjZvRDJLZEda?=
 =?utf-8?B?RFZ1NmNvdStFNmtXMVcwd21wY3ZkUFhoQXZ3RDRJcTFCMjd0YjluR1k5a1pF?=
 =?utf-8?B?R21mZE1vVFlESTVTdGxUcm45eUV1UndzNEhsYTBVbUZzYzdrTzBYZHJwdTl2?=
 =?utf-8?B?ZzF6NHo2Y1hsdWg0WjZoZWRBTk04ZVNIUTBTc0cwdERQcTN5UytpWktHVTNk?=
 =?utf-8?B?V1pLdjNCdU9ma2FvaXVaVnNjVEFTLytuNjZiL1krcTdpNFpUVzBoWWg4TS91?=
 =?utf-8?B?S25NSHNLdlQza2VvL2VvV1N6RE9lZmtaanRRL0lXNHpnRFNKUCtjMVIrY3FP?=
 =?utf-8?B?VEgrRWpxNVNYY2FsRit1QnN2bTR2UWR3MFRScmZxYjFzam0veU5IeDVkMmxx?=
 =?utf-8?B?c2NwTWNjN3FvclYySC95d0V3Y3MxK1ptK0lDeXprclVMb2hOMnpQd0U3aUZp?=
 =?utf-8?B?emNsakNidGdkU21RRkUyM3lMTmhwam5VM3lEMytBY01odGpSUlNiTHlLM2V6?=
 =?utf-8?Q?XhzV7W0gJBoAiBY5wg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5599.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe775e3-644c-4cb2-ded6-08d958b58895
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 08:38:15.2448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XIKvi69E0Q+zeYH4YnpmHTvUZ1Sx3InEpIPwa2TPdsVcK6/b2l/ckWUt5RPZhuVKAAC7leeE7soEBblUAa5udsYpjRwU4PKokY1q3V0bDXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2191
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SEksIEFybWluDQoNClNvcnJ5IHRvIGJvdGhlciB5b3UgYWdhaW4uDQpDb3VsZCB5b3UgcGxlYXNl
IHRlbGwgbWUgd2hhdCBzaG91bGQgSSBkbyBmb3IgdGhlIHZhcmlhYmxlcyB0byBiZSBhcHByb3Zl
ZCBpbiB3aWtpPw0KDQpUaGFua3MsDQoNCll1aWNoaSBJdG8NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBJdG8sIFl1aWNoaQ0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDIw
LCAyMDIxIDM6NDkgUE0NCj4gVG86ICdha3VzdGVyODA4JyA8YWt1c3RlcjgwOEBnbWFpbC5jb20+
DQo+IENjOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zz47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUkU6IFtPRS1jb3JlXSBbUEFUQ0hdIGN2ZS1jaGVjazogQWRkIGFsbG93bGlzdCB0aGF0IGlz
IHNhbWUNCj4gZnVuY3Rpb24gb2Ygd2hpdGVsaXN0Lg0KPiANCj4gSEksIEFybWluDQo+IA0KPiBU
aGFua3MgZm9yIGluZm9ybWF0aW9uIG9mIHdpa2kuDQo+IEkgY3JlYXRlZCBhY2NvdW50IGFuZCBh
ZGQgQ1ZFX0NIRUNLX1dISVRFTElTVCBpbiBWYXJpYWJsZXMuDQo+IA0KPiBBY2NvcmRpbmcgdG8g
dGhpcyBtZXNzYWdlLCBDVkVfQ0hFQ0tfUE5fV0hJVEVMSVNUIGlzIGRlcHJlY2F0ZSBhbmQNCj4g
c2hvdWxkIHJlbW92ZSBpdC4NCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNDI1MDUNCj4gDQo+IFRoYW5rcywNCj4gDQo+IFl1aWNo
aSBJdG8NCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBha3Vz
dGVyODA4IDxha3VzdGVyODA4QGdtYWlsLmNvbT4NCj4gPiBTZW50OiBUdWVzZGF5LCBKdWx5IDYs
IDIwMjEgNDowOSBBTQ0KPiA+IFRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz47IEl0bywNCj4gPiBZdWljaGkv5LyK6JekIOaciQ0KPiA+IOS4gCA8
aXRvLXl1aWNoaUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY3ZlLWNoZWNr
OiBBZGQgYWxsb3dsaXN0IHRoYXQgaXMgc2FtZQ0KPiA+IGZ1bmN0aW9uIG9mIHdoaXRlbGlzdC4N
Cj4gPg0KPiA+DQo+ID4NCj4gPiBPbiA2LzI2LzIxIDM6MDQgQU0sIFJpY2hhcmQgUHVyZGllIHdy
b3RlOg0KPiA+ID4gT24gV2VkLCAyMDIxLTA2LTIzIGF0IDE3OjU2ICswOTAwLCBpdG8teXVpY2hp
QGZ1aml0c3UuY29tIHdyb3RlOg0KPiA+ID4+IFRoZSBMaW51eCB0ZWFtIHBsYW4gdG8gcmVtb3Zl
ZCByZWZlcmVuY2VzIHRvIHJhY2lhbGx5LWNoYXJnZWQNCj4gPiA+PiBqYXJnb24gZnJvbSB0aGVp
ciBjb2RlIGZvciBtb3JlIG5ldXRyYWwgYW5kIGluY2x1c2l2ZSBsYW5ndWFnZS4NCj4gPiA+PiBT
byByZXBsYWNlIHVzZSBvZiAid2hpdGVsaXN0IiB3aXRoICJhbGxvd2xpc3QiIGluIGN2ZS1jaGVj
ay4NCj4gPiA+Pg0KPiA+ID4+IEZpcnN0LCB3ZSBhZGQgQ1ZFX0NIRUNLX0FMTE9XTElTVCBhbmQg
aXQgaXMgY29uc2lkZXJlZCBwYXRjaGVkIGFzDQo+ID4gPj4gd2VsbCBhcyBDVkVfQ0hFQ0tfV0hJ
VEVMSVNULg0KPiA+ID4+IFdlIHBsYW4gdG8gcmVwbGFjZSBhYm91dCBvdGhlciB3b3JkIGxhdGVy
IGFuZCBldmVudHVhbHksIHJlcGxhY2UNCj4gPiA+PiBhbGwgIndoaXRlbGlzdCIgdG8gImFsbG93
bGlzdCIuDQo+ID4gPj4NCj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBZdWljaGkgSXRvIDxpdG8teXVp
Y2hpQGZ1aml0c3UuY29tPg0KPiA+ID4gVGhlIFRTQyBkaWQgZGlzY3VzcyB0aGlzIGFuZCBwcm9w
b3NlZCBhIHBsYW4gb24gaG93IHdlIHNob3VsZCBnbw0KPiA+ID4gYWJvdXQgYWRkcmVzc2luZyB0
aGVzZSBpc3N1ZXM6DQo+ID4gPg0KPiA+ID4NCj4gPg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtYXJjaGl0ZWN0dXJlL3RvcGljL2luY2x1DQo+ID4gPiBz
aXZlX2xhbmd1YWdlX3N1bW1hcnkvNzU4MjE4MTkNCj4gPiA+DQo+ID4gPiBJIGFwcHJlY2lhdGUg
dGhpcyBwYXRjaCBoYXMgZ29vZCBpbnRlbnQgYnV0IEkgd291bGQgcmVhbGx5IGxpa2UgdG8NCj4g
PiA+IHNlZSBhIHdpZGVyIHBsYW4gb24gaG93IHdlIGFkZHJlc3MgdGhpcyByYXRoZXIgdGhhbiBj
aGFuZ2luZyBzaW5nbGUNCj4gPiA+IHZhcmlhYmxlcyBwaWVjZW1lYWwuDQo+ID4gPg0KPiA+ID4g
Rm9yIGV4YW1wbGUgd2UgbWF5IHdhbnQgdG8gc3RhbmRhcmRpc2Ugb24gdGhlIHRlcm0gIklHTk9S
RSIgcmF0aGVyDQo+ID4gPiB0aGFuICJBTExPVyIgb3IgZXZlbiAiRklMVEVSIiBvciAiVkVSSUZJ
RUQiIG9yIHNvbWV0aGluZyBtb3JlDQo+ID4gPiBzcGVjaWZpYyB0byB0aGUgbWVhbmluZyBvZiBD
VkVzIGFuZCBDVkUgY2hlY2tpbmcuDQo+ID4gPg0KPiA+ID4gVGhlcmUgaXMgYW4gb3Bwb3J0dW5p
dHkgdG8gdHJ5IGFuZCBtYWtlIHRoZSBtZXRhZGF0YSBhbmQgdmFyaWFibGUNCj4gPiA+IG5hbWVz
IG1vcmUgY29uc2lzdGVudCBhbmQgdW5kZXJzdGFuZGFibGUgYnV0IGlmIHdlIGp1c3QgY2hhbmdl
DQo+ID4gPiBzaW5nbGUgdGhpbmdzIGF0IGEgdGltZSB0aGlzIG9wcG9ydHVuaXR5IHdvdWxkIGJl
IG1pc3NlZC4NCj4gPg0KPiA+IEkgaGF2ZSBjcmVhdGVkIGEgd2lraSBwYWdlIHRvIGNvbGxhdGUg
b3VyIHRob3VnaHRzIGFuZCBhZ3JlZW1lbnRzIHRvDQo+ID4gaGVscCB1cyBtb3ZlIGZvcmV3b3Jk
IGluIGEgY29oZXJlbnQgbWFubmVyIHRvIGFkZHJlc3MgcmVuYW1pbmcgc29tZQ0KPiA+IHRyb3Vi
bGluZyB2YXJpYWJsZSBuYW1lcy4NCj4gPiBodHRwczovL3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93
aWtpL0luY2x1c2l2ZV9sYW5ndWFnZQ0KPiA+DQo+ID4gSSBsb2dnZWQgc29tZSB2YXJpYWJsZSBu
YW1lcyBhbG9uZyB3aXRoIGEgZmV3IHJlbmFtaW5nIGV4YW1wbGVzLiBNYXliZQ0KPiA+IHRoaXMg
Y2FuIHR1cm4gaW50byBhIHBsYW4/Pz8NCj4gPg0KPiA+IFNpbmNlIGl0J3MgYSB3aWtpLCBwbGVh
c2UgZWRpdCBhY2NvcmRpbmdseS4NCj4gPg0KPiA+IC0gYXJtaW4NCj4gPg0KPiA+DQo+ID4gQ2hl
ZXJzLA0KPiA+ID4gUmljaGFyZA0KPiA+ID4NCj4gPiA+DQo+ID4gPiANCj4gPiA+DQoNCg==
