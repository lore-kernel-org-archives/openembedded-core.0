Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.93])
 by mx.groups.io with SMTP id smtpd.web11.58806.1594044865588956151
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 07:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@here.com header.s=selector2 header.b=czONRH5D;
 spf=pass (domain: here.com, ip: 40.107.22.93, mailfrom: patrick.vacek@here.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9NFafE5ZBi2B4g3ekYK5qZ3qc8rVpFg1u+6fRk72yK7zxKpuoFxzReTyLqXbJzNBrhPafZdlynTUCnpUpSe0aoisn2AJAog1OLDcVyFcqS4+YHj8A357XSg4NeulgDVB3s80PMzznGyMUy9z80BOiNYh+TV12BBbfxoO9SpHnPcRFZvIWu1ns3PfY69f0SNVxPwzEBRtOKOTIOwHX2V3xzIkHMpaG8cYuGDDhCAhmwesR4NbMNECieSBvQx0Smz28wO6x+6DyPaZU3/C8hc+5IhQxxQK2HZYJhuZv1IbfgG9QkNNekPQzq/c05uE9MMM49shsQZzyFuv3RianXn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NL3GeqWZwFupnlTFwC39k3cEVsTYUNcNvGJVoFIfZE=;
 b=XJ2H097KlfhH7OaYnRXEksxL+fHoAYakMqOruwcGIWIx4ptUQh1FRelcoNMh28z6BOM74kzx2RACsXKPJ1XCi5eZ1XsaPz+9gE6JvfN6g6OtzeMwkZib8DIDCOHzaOndJL+cmmjEOJacXPbGO7fsnVJqcjb5RdonzKQvyPNkIc1DepABbWfGZ3x6Q/fkamXJct5YABA9KOtrqEGgVm9REbFactnzBRAnUzk/ibPqy0S4QYzjpc5ujxSe6p2/x+TPQY5cj+Tkqh0di634MjeUQimnrqIUI0lVzF1uWbNjxrROHhm72wBDOyR1m4bLEuwKzNt6NhzpuaHSleqK218LbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=here.com; dmarc=pass action=none header.from=here.com;
 dkim=pass header.d=here.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=here.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NL3GeqWZwFupnlTFwC39k3cEVsTYUNcNvGJVoFIfZE=;
 b=czONRH5D7BFOsfjvC8VEYnEY5abzkA4ib3O3e1gRhGoLsaM0UA92qV7aAFNi1M4suLzDH5Wwp+j9SWMit9pPg8W9aC/zMCs5ElHFvPkLAEPfo5KkcX4K53QzoMMJY+ZCt8a4wmKLbG6ngZzrptYPm02+LryW0plnKciDgQb0C7w=
Received: from VE1PR04MB6431.eurprd04.prod.outlook.com (2603:10a6:803:12a::13)
 by VI1PR04MB5645.eurprd04.prod.outlook.com (2603:10a6:803:df::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.29; Mon, 6 Jul
 2020 14:14:22 +0000
Received: from VE1PR04MB6431.eurprd04.prod.outlook.com
 ([fe80::1427:13eb:c506:99dd]) by VE1PR04MB6431.eurprd04.prod.outlook.com
 ([fe80::1427:13eb:c506:99dd%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 14:14:22 +0000
From: "Vacek, Patrick" <patrick.vacek@here.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/core/loader: fix regex to include numbers
Thread-Topic: [OE-core] [PATCH] oeqa/core/loader: fix regex to include numbers
Thread-Index: AQHWU4ERSqwFNX2CJUaNOMuZkKitVaj6mHsA
Date: Mon, 6 Jul 2020 14:14:22 +0000
Message-ID: <a5e431f7887769d4bfa97b30193a78d9c7226e72.camel@here.com>
References: <161F23611A5F1482.17108@lists.openembedded.org>
In-Reply-To: <161F23611A5F1482.17108@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=here.com;
x-originating-ip: [2003:fc:d700:d000:40fb:1437:ccb1:8ab3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b55febe2-59c6-49d1-1ec9-08d821b6e1c1
x-ms-traffictypediagnostic: VI1PR04MB5645:
x-microsoft-antispam-prvs: 
 <VI1PR04MB56454C51974AE9627D3CD7D58D690@VI1PR04MB5645.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w3f3Ckm1Z7xxNYClCR/nDw/Q8Tgr9MhAclzoSQyv7B57Q1ahrc8m0SDILcKUnvBdvfGJ7eTPU8Nj8o9CMrqpeezV9OFsqmUgiSMmGjKb/NYQWm9H0zikQM1R/Ev+kOC4ePjcHz6PJMCplndxsf8R5Bo4YJUMmf2RsiI8SiFJ6qGNJKdf98mIdSDat8HHtWxqzuif3CwXCqz3p0qTGtRhfitW1U2t9HGn35qc/EJMJYf1mGr54MjLTlDIC1R9cbYSPCFo168gIsvfSO/XVKSZwhwcMayYic9NZGOgdemmi1ToM8gEzD7lzfrR/H74fqUf7VPeP3ea66wmYgZ17ZjBAg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6431.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(2906002)(186003)(71200400001)(83380400001)(36756003)(8936002)(6916009)(8676002)(66446008)(64756008)(66556008)(66946007)(66476007)(316002)(91956017)(76116006)(6506007)(86362001)(6486002)(5660300002)(478600001)(2616005)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 RerzzFNVGBtfjrO3hHwNYPNdvdh9MFnlCLbHGZgzGdAn9VQgn9KQ1CCuhzTAvRw3nKB3ZeP11NjFSGB9mS9QVfJXv/XRrx+nBf9WAMdMiSaqjqKdVWWirDZG/3cx7YepEbouy/7Dx93w4we0s+atd/cQDXsX5EuGNeGUj4ikL2sye5tFQWsFElFvGWb01MVd0xBVZsY5fUw4kVfkXoiENgN2PhVVNbQDCm9yjWRs9iVWgsGMDVIfr1mbD/Q4Leholgdw0mDEXyd5z+9D/U97riRmmatJpAKWPPx2PFKjrw6wp5IthQkeBctAvgQ1N24HbhiGXiKAi+P2qdlyvUtOPm3UuywY2yQ4nROdmVvMwNYYyBS+xmNnf5xTc0M+Zw7c9nA6YtrXA9hnu7mXvpNi9XTRuMJEAV/I7Ww/a6xDnWE/h+DJQGvgf6IoctZ47X/0e9GeVvejCf/elPjJJsT1Tctot5000QfvVy5MJ2hr5Hpj58rCc4Z78BCEagnDA7gPlB3m36BKi6pxtUbTSo1kvO7ogxm9t3sYPiUX/eCe6s8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: here.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6431.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55febe2-59c6-49d1-1ec9-08d821b6e1c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 14:14:22.6990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d4034cd-7225-4f72-b853-91feaea64919
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cLgkMP2SHgv13DIqTXD//EIMSeG4yl4T/yHHxDHR3KIDKch/XouASX7PBDjzb1fJeib+Zm2ozBo88bPMqZxxUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5645
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DA4DCE67E073F4B987FAE864AE8C485@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

SSB0aGluayBJIG5lZWQgc29tZSBoZWxwIGhlcmUuIEkgZ290IGFuIGF1dG9tYXRlZCBlbWFpbCB0
aGF0IG15IHBhdGNoIGZhaWxlZCB0bw0KYXBwbHksIHN1cHBvc2VkbHkgYmVjYXVzZSBJIG5lZWQg
dG8gcmViYXNlLiBJJ20gb24gdGhlIHNhbWUgY29tbWl0IHRoYXQgaXQgaXMNCnN1Z2dlc3RlZCB0
byByZWJhc2UgdG8sIHRob3VnaCwgYW5kIEkgY2FuIGRvd25sb2FkIHRoZSBwYXRjaCBhbmQgYXBw
bHkgaXQNCndpdGhvdXQgYW55IHByb2JsZW1zLiBXaGF0IGFtIEkgZG9pbmcgd3JvbmcgaGVyZT8N
Cg0KVGhhbmtzLA0KUGF0cmljaw0KDQpPbiBNb24sIDIwMjAtMDctMDYgYXQgMTA6MzQgKzAwMDAs
IFZhY2VrLCBQYXRyaWNrIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQp3cm90ZToNCj4gVGhl
IHByZXZpb3VzIHZlcnNpb24gb25seSBpbmNsdWRlZCB0aGUgbnVtYmVycyAxIGFuZCAyIGluIHRo
ZSBhbGxvd2VkDQo+IGNoYXJhY3RlcnMNCj4gZm9yIHRoZSBtb2R1bGUgbmFtZS4gSW4gdGhlIHBh
c3QsIHRoaXMgd2FzIChcdyspIHNvIGFsbCBudW1iZXJzIHdlcmUgYWxsb3dlZC4NCj4gTm93IGl0
IGV4cGxpY2l0bHkgaW5jbHVkZXMgYWxsIG51bWJlcnMgYWdhaW4uDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBQYXRyaWNrIFZhY2VrIDxwYXRyaWNrdmFjZWtAZ21haWwuY29tPg0KPiAtLS0NCj4gIG1l
dGEvbGliL29lcWEvY29yZS9sb2FkZXIucHkgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9v
ZXFhL2NvcmUvbG9hZGVyLnB5IGIvbWV0YS9saWIvb2VxYS9jb3JlL2xvYWRlci5weQ0KPiBpbmRl
eCA3M2M1Nzg4NTA4Li4xMTk3ODIxM2I4IDEwMDY0NA0KPiAtLS0gYS9tZXRhL2xpYi9vZXFhL2Nv
cmUvbG9hZGVyLnB5DQo+ICsrKyBiL21ldGEvbGliL29lcWEvY29yZS9sb2FkZXIucHkNCj4gQEAg
LTQ2LDcgKzQ2LDcgQEAgZGVmIF9idWlsdF9tb2R1bGVzX2RpY3QobW9kdWxlcyk6DQo+ICAgICAg
Zm9yIG1vZHVsZSBpbiBtb2R1bGVzOg0KPiAgICAgICAgICAjIEFzc3VtcHRpb246IHBhY2thZ2Ug
YW5kIG1vZHVsZSBuYW1lcyBkbyBub3QgY29udGFpbiB1cHBlciBjYXNlDQo+ICAgICAgICAgICMg
Y2hhcmFjdGVycywgd2hlcmVhcyBjbGFzcyBuYW1lcyBkbw0KPiAtICAgICAgICBtID0gcmUubWF0
Y2gocideKFsxLTJhLXpfLl0rKSg/OlwuKFx3W14uXSopKD86XC4oW14uXSspKT8pPyQnLA0KPiBt
b2R1bGUsIGZsYWdzPXJlLkFTQ0lJKQ0KPiArICAgICAgICBtID0gcmUubWF0Y2gocideKFswLTlh
LXpfLl0rKSg/OlwuKFx3W14uXSopKD86XC4oW14uXSspKT8pPyQnLA0KPiBtb2R1bGUsIGZsYWdz
PXJlLkFTQ0lJKQ0KPiAgICAgICAgICBpZiBub3QgbToNCj4gICAgICAgICAgICAgIGNvbnRpbnVl
DQo+IA0KPiAtLQ0KPiAyLjI3LjANCj4gDQo=
