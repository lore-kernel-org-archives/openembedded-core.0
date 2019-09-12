Return-Path: <prvs=15194f099=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6827D537
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568296771; x=1599832771;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=YTmEkuVNFBfGJR+GHEfFkvim5pfbWN4fO+zYvmEwZG8=;
	b=Giv8zzb9SRw3hZ2fl6dB/uTiEiYMo9w8y03QaXgPRGyds96St4fK2n1j
	br/024gsv/yyTUOmbz4E3TDJqHwNCn12YOAbjkKzElz2b90WM1za60o/R
	A33dlRFJGSzWX4PyxtuJc1Y4/6gzKFxmdRhvvEUwtAHmc6V0nItVEoweP
	aeLmQxo7MMYHMovZOJkrakFoMwyjZFvKCubgyX4FdimJ8SQ0lH8eKj7De
	HPb0tJ/m0IUJ33EB3kKqOuATPVA3MQEBRv0PeefucP05b7Izx4Sej3Me3
	fhyoMTuBKRS/wQ+4rS9UNVMXY8RF/ZsPx+0njAmH17Kq2TCOBGSG1xZ/4 Q==;
IronPort-SDR: /ENacnzalzLu3gZzkoQHXOUDojqWnByWpU7pUg2YLCLfoCpuJyysdHyCXxsaw0rdW1fTXi70/q
	g4nk4BX6sZp46SCfkTwhD/rm4Ey+UTyFsivvS6LiptGmYMfA117EIzPdS2I9Oe5M/wcRrIQbfp
	Mzgd1tmtXsJsINjav3mn8pNQEgUsQiH0EEl6/EegczuPzIXZy8RbBijMhXVdY422TtfTEccEec
	V65M9zGTYaxi+mpHaUn40fK5GmoQL9O2D3UcgF+bgDJJnLITqle/0ANABhMCeXv2/dugx+xCkY
	oA0=
X-IronPort-AV: E=Sophos;i="5.64,497,1559491200"; d="scan'208";a="118086797"
Received: from mail-by2nam03lp2056.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.56])
	by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2019 21:59:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Vf2ndw4XsDKOBPnap3dIgpGOT2H1n51mtKthQNhGWlbb7mtzgtGMUf99sxAn5WW8VB56aIwtbNDfcTD4Xo6Gzcxco0qgIrqty0ohoa0emcfgUMBkaospWHj6SeHRkCN1wue0AyNVzEraMAlyNBoFkSD0C39UGnZXmzB/dqGPRPTwHQOEy07xYwbcAXdm3o/LnKGKLj+jYVGRKYaA64nCHCau1HQZLoziy0SE1BrpRvBKJkBvEsMmIaKZRq0xkZ1V2YLobF2pLZakje4LDuCppcQ32wmZ5MUpNVRfQ4usx0cUfjA+DTpogwfFQQqYQ8JXYu7LMIjST1aDXXxDPMgiwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YTmEkuVNFBfGJR+GHEfFkvim5pfbWN4fO+zYvmEwZG8=;
	b=Tc/SXbYapzt4iQNDtsXuTXax/AOErmVVNQZqA3ROLV43+I3RNEic0GxeJMkBuhq6UYXG8M7qQzoRWXr2mBdeWNd7fd84oGmav7PPeED3jSFONKkZPI4DHMM71IHuCmLpCPpMc6XQhbz7tZN+Khe1c3M2rw+IAYMy4UhKb0+HbBCxnTRQE3qR3IPHBEiwKd+R6nZKDCHiw/IuD1HLc6Z/eNbeGqYzBDXVdsGiC7iPeRHzC3n9rhvJUzdhzR33SOm8MHPraEvFVUWz+oQEGZ3nTP23RsBXDt22Uq9ehTeR4Ak0gJ7MV9toLU86kHnPFcsMzYdmriG4pvoXRAbXWIgoag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YTmEkuVNFBfGJR+GHEfFkvim5pfbWN4fO+zYvmEwZG8=;
	b=EOg2PuOs13WDZLo0T0O6rxgYu/2r/BV5naEAp6GgLIRMafKsjKtcIJl+JKZFlPx6GhCz90+/Jiq1d+FP1skomEWDj1VuuE2Fg3EBPaojQswUFEZNXIkmEHpP5+wG8QvEk/mF22wm+AZpK/nh5W9Pl4X3FlqGCW7I9LKj+IVjYoM=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4856.namprd04.prod.outlook.com (52.135.232.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.17; Thu, 12 Sep 2019 13:59:29 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::702b:2326:3cee:c07a]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::702b:2326:3cee:c07a%2]) with mapi id 15.20.2241.014;
	Thu, 12 Sep 2019 13:59:28 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@intel.com"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] gdb: Mark gdbserver as ALLOW_EMPTY for riscv32
Thread-Index: AQHVaMYgB2BeksJnHUGFULkNz0Zvd6cn4oCAgAAwfwA=
Date: Thu, 12 Sep 2019 13:59:28 +0000
Message-ID: <1cf41e10cff23bb61db70b66adaad6f0a94b55b7.camel@wdc.com>
References: <20190911172256.11378-1-alistair.francis@wdc.com>
	<19564aa8-9c3d-ca10-82e0-843b397db2cd@intel.com>
In-Reply-To: <19564aa8-9c3d-ca10-82e0-843b397db2cd@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b02eb9b4-459d-4bf0-2774-08d737896dd2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4856; 
x-ms-traffictypediagnostic: BYAPR04MB4856:
x-microsoft-antispam-prvs: <BYAPR04MB48567F0D8D2F0586C4BD220990B00@BYAPR04MB4856.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(189003)(199004)(118296001)(86362001)(81156014)(6486002)(7736002)(8676002)(446003)(478600001)(5660300002)(3846002)(81166006)(53936002)(256004)(6512007)(102836004)(25786009)(6506007)(2501003)(53546011)(76176011)(8936002)(6436002)(26005)(229853002)(6246003)(36756003)(6116002)(186003)(2906002)(76116006)(4744005)(99286004)(66556008)(66066001)(305945005)(64756008)(71190400001)(316002)(71200400001)(2616005)(66476007)(11346002)(14454004)(476003)(486006)(66946007)(66446008)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4856;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aHjzI+9E6/WmVKZFE5o8uKSforzKVjcXhyUMiH9/1jFqn+CRDSjjRctI/5tvtIBMNXusc6l1sPcuw++T+RboeIk5mDKDgiNJ/DlxLFyFvUEBUnBh/2InNAFIzVhWSEOQSYKN1FK1tK4FiSPeFhM2JCUaUlBSw3rBxgTEgfAjaD8gcr0nK6INfGLzZT9FGAzCIZou2xDa5vopynsa4HaP17WacBamL7GLM/K/k7ldaPB6bf1i7ALZs6GYSgFtKA0S5N0gmq2WwIMrGahHcPzpOYSAVk251id0z4L04vhN9EXTMgWVEPsaK6GA1Uo1qdx14dV+zmqNzNjECaNSw1pKOaMc7GyruGSc1upuhxuSeXHD0YOpmRZLhl9eOEuJ8+GpNdvE/Q39eBKXBJ8Ixc6WwlGNW86Vrycu+wc1cxcfgiI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02eb9b4-459d-4bf0-2774-08d737896dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 13:59:28.6802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jc7vhrRf/aTvyBBXbOmbnZ1WiINYRIUsu+zoGFya+Eu5ZxHwrkJaV6M8WyhrDe+e0qlADlaWZ1ayBNNAbMPex2ps1zKFJcX9eddyuiw4h1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4856
Subject: Re: [PATCH] gdb: Mark gdbserver as ALLOW_EMPTY for riscv32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Sep 2019 13:59:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CCA26F025C06645BE1BC96CAD966C7B@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE5LTA5LTEyIGF0IDEyOjA1ICswMTAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gMTEvMDkvMjAxOSAxODoyMiwgQWxpc3RhaXIgRnJhbmNpcyB3cm90ZToNCj4gPiByaXNjdjY0
IGFscmVhZHkgaGFzIGdkYnNlcnZlciBzZXQgYXMgQUxMT1dfRU1QVFksIHNvIGxldCdzIHNldCBp
dA0KPiA+IGZvcg0KPiA+IHJpc2N2MzIgYXMgd2VsbC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+DQo+ID4gLS0tDQo+
ID4gICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi5pbmMgfCAxICsNCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+ID4gZGV2dG9vbHMv
Z2RiL2dkYi5pbmMNCj4gPiBpbmRleCAwZjEwYjQxNzM0Li4yNDllMjRkYzUyIDEwMDY0NA0KPiA+
IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLmluYw0KPiA+ICsrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLmluYw0KPiA+IEBAIC0xMCw0ICsxMCw1IEBAIFBBQ0tB
R0VTID0rICJnZGJzZXJ2ZXIiDQo+ID4gICBGSUxFU19nZGJzZXJ2ZXIgPSAiJHtiaW5kaXJ9L2dk
YnNlcnZlciINCj4gPiAgIA0KPiA+ICAgQUxMT1dfRU1QVFlfZ2Ric2VydmVyX3Jpc2N2NjQgPSAi
MSINCj4gPiArQUxMT1dfRU1QVFlfZ2Ric2VydmVyX3Jpc2N2MzIgPSAiMSINCj4gDQo+IElzIHRo
aXMgYmVjYXVzZSBnZGJzZXJ2ZXIgZG9lc24ndCBidWlsZCBmb3IgUklTQ1Y/ICBUaGUgcmVjaXBl
DQo+IGRvZXNuJ3QgDQo+IGFwcGVhciB0byBtYWtlIHRoYXQgZXhwbGljdCBhbnl3aGVyZS4NCg0K
WWVzLCBnZGJzZXJ2ZXIgZG9lc24ndCBzdXBwb3J0IFJJU0MtVi4NCg0KQWxpc3RhaXINCg0KPiAN
Cj4gUm9zcw0K

