Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759F2C6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 06:01:06 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.72662.1682402458825131813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 23:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=h2C8Eb5V;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: 88b0f43ae32e11eda9a90f0bb45854f4-20230425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SdSpZ4yK4eSjwsipFmMH85G7gKIhVhQTabquTknqnZo=;
	b=h2C8Eb5VeK6ELI9l1Kq08Ow7Vmeqw6peeayySGVU3BnmQWUoxSmJxP1/d1LUnQMB4TyBlhJYogibKQs+KnwLGCX+HgbODUNk8v1Ok4WUPF089lxeYLaOyJz0yVjmV/Gyzt4Y3rkkLFs7fT+9kBe/cqsDbyMyj8Jq7xm9mc4Bj1s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:6deaa6cc-c532-4980-9065-c314e9d61c90,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-4
X-CID-INFO: VERSION:1.1.22,REQID:6deaa6cc-c532-4980-9065-c314e9d61c90,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:-4
X-CID-META: VersionHash:120426c,CLOUDID:fbcb6aa2-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:2304251400532VRX4J2O,BulkQuantity:0,Recheck:0,SF:38|17|19|102,TC:nil
	,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 88b0f43ae32e11eda9a90f0bb45854f4-20230425
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 748703393; Tue, 25 Apr 2023 14:00:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 25 Apr 2023 14:00:50 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Apr 2023 14:00:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNTIEFqANJoHzkx6SL4g1YF7RrlZZygzGsyE3chVkmILPfnVxXIHeuOfy6LV/w1Lh1KlZmgJq0AXUcJMpxTEcFFRMdQKnolaEHeGpTRn8kxzLJxY8ugpVE4+3rTS63gSaS4K+67OMzGWic2HFTxCir/Y/kfJEPQTKYbCNR7B78HE8LC2sVk/e8WdNFS3goILbGsJEKuci0lxQ5WjS+VYlzgjqni4qY2mzuc6HKYvkxE//+6vXaAwCvc+LYsNLsudcT282KfE/zeDgPxB+G0HK0i5WXBFH+722IukoQsU5hp293exl1HSpYStLIdXFEVTN9kwTfTMI8IRmaYs/jxXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdSpZ4yK4eSjwsipFmMH85G7gKIhVhQTabquTknqnZo=;
 b=l/+SBP/LGaDh23l8VQ8bDkNR9UPGa4yDSMDuD0XSUFuKnggjLUOHUxrizzheEt6DQRAXk2Z7ZXQckTfMAIg8Se+MVB9DBqUHJVieQIdWtayWQbNn4j3bYFN3hfeBw4Li402OdmdGvbzZy4irw4XMClmJD0/bllsQozZSihxcvL5Rj3Of/8g4HHLocdroB/BzYkvSPxkbJ6i8XajkKg6r0s+SHI/MKts68+yYeklnFSR9ohsLdu7eHB/9UWNQCsLftd9G4LxSXV1PziDXDKJ3CVH3clPQ3kw7PINBYuo/7l6ZsVMDXen/9qZ3aZVA2E2dEdC/0uzfZ9WD1+rAREkx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdSpZ4yK4eSjwsipFmMH85G7gKIhVhQTabquTknqnZo=;
 b=SIK1K+4z7qcGNSAxNz3466f1Ywl1AYu6YwYr9DQVjtiNl06d+H9VwLvM0vK40/L0V0RFKoT8ug6DE2QYXsvrkAloryGuKhM93930TXTvtu1G/yqPxu0wGSTOFmFU6GTL0+WzoS7up2sGBcRjhPwsZTwhtI2lRTwizCBMUn8YPBM=
Received: from SG2PR03MB3081.apcprd03.prod.outlook.com (2603:1096:4:11::13) by
 KL1PR03MB6924.apcprd03.prod.outlook.com (2603:1096:820:b1::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Tue, 25 Apr 2023 06:00:48 +0000
Received: from SG2PR03MB3081.apcprd03.prod.outlook.com
 ([fe80::489:7f0a:661b:c8f1]) by SG2PR03MB3081.apcprd03.prod.outlook.com
 ([fe80::489:7f0a:661b:c8f1%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 06:00:47 +0000
From: =?utf-8?B?WWFuZyBYdSAo5b6Q5omsKQ==?= <Yang.Xu@mediatek.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssl: set package level PERL5LIB
Thread-Topic: [OE-core] [PATCH] openssl: set package level PERL5LIB
Thread-Index: AQHZc0k0GhZIJXudM0Gglx/kEVr8Ba8z7JEAgABIpwCAAD0ggIAAL7KAgAbt8QA=
Date: Tue, 25 Apr 2023 06:00:47 +0000
Message-ID: <2a1a3752a13396f7a0bc78cb1321913a4f16b1f9.camel@mediatek.com>
References: <20230420052442.16443-1-yang.xu@mediatek.com>
	 <CANNYZj-C8ujMnqkZqyU8rgAF+rJ9Bwqc2bOLkuGu0d0cJpXfpg@mail.gmail.com>
	 <90b1e25cde406898154a05d03babc739120e643c.camel@mediatek.com>
	 <CANNYZj-0u9XVkCVHT+WjtFkQ_nYg9i4OUj311wK5GgRhp7ZZfA@mail.gmail.com>
	 <db555f3f6c09c4576358846cba9e64d055422e59.camel@linuxfoundation.org>
In-Reply-To: <db555f3f6c09c4576358846cba9e64d055422e59.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB3081:EE_|KL1PR03MB6924:EE_
x-ms-office365-filtering-correlation-id: a3cddd37-6699-4e51-9a23-08db45526a22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HqC6Kp0WDZKAcDqtl45wfw9Z0gF4ztPTFAlm+NkscYo/9NH2KfJtYlXNxW/24HwBfWNi/LfPd7QtLV9AOue6zEWDIwcGEtCdO5K0mfUmaTo+2o4pX5Xm89sV5BBgT80nkp9OvD3Wd+QmOd3goLOtptQIyJa0XDFO71zql8RGKIbBx/0A1cp6pNIIm/2nXCIcOnRC44P0gfINQP9gNsEYZDaMJ+oL5AflEVvJ6NCyzFL8DoOnFEPRGp2gRQTsyrsVEvgRNqlO1pwnKCFGqBDCjl7GAjGv90QTmj0MQLnH6gW03a+bGV3r9G9MSFVK/FAXkYsPZLBdvRklBBjDQZUEfUui9ebrrNDcfDcLN1/F1TcqJLcDInrTVUPc+iZXCUNJynuihBiUeS12TxJGVazHeiz79TzCZYXB5TfEi53HNQLdIvB7Tj62xQkbDgyEF8TyOhH324kqM/wuHjMuLiSpKub3eYT+zec8a7ZDRNwp4KPpzxqM97S87TYBgcPqApyO7mGukU1763/7aP8HTbRxVN605AeUTSpBLsQS47uUUHihbid3+xEIIA7d0r/zTWKQKj2aCAgXd2O4z4SG47JownMwWlYHpg53T4NoavDjU+QFqkSmftLrRvWdecDBe9RdsAyzqOB6aK4mfJ72FIM7Ew94F1VvchZFtOjhvoXQFPru5Bn6f5mfjuTHxvwnfmR3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB3081.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199021)(38100700002)(122000001)(6506007)(6512007)(26005)(186003)(8936002)(2616005)(83380400001)(4744005)(2906002)(8676002)(5660300002)(36756003)(85182001)(478600001)(6486002)(71200400001)(38070700005)(110136005)(316002)(4326008)(66556008)(76116006)(64756008)(41300700001)(66446008)(66946007)(86362001)(66476007)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3RtSkM3aUxlYTdPVzY5UlBXSlBPSVhzTVNhM3J3c1k0cWdrNXh3VXNiZW5s?=
 =?utf-8?B?YmQxdmZiRnhQS1U3dHpBMGh6V0hUUG9HSVRMa1piNFVsc3ZTMHlBUjJ3NE5D?=
 =?utf-8?B?MWdnSW1rRjVhTjVQOHRTeUVueTlaRVNMRDBFOEYza0w1Yk1Ielh3M05acnBi?=
 =?utf-8?B?WHB2QkgvR1Y1bjQ0RDl3S3VLajFFbERla2p1VDFFNHV3UWtsRjkzUk9wdkVz?=
 =?utf-8?B?VEI1TVVhVjg1NTAyeEJGeVpnWjVyNlJLUTRkQ3ZNb2hmNmV4SFBDcm5xYXc2?=
 =?utf-8?B?cmkwQUFTVVFmRUJFNVJ1d2EvSE1Wd1ZhNXBva0hxNy9sUXUyYmRvcTZsUDJ6?=
 =?utf-8?B?Nzk4amtIcVAvK0czcXZXNnZRZlhSaUdnRHo0aXRKK1ZqRytLUVhVRGRZZFpK?=
 =?utf-8?B?ZG1Yamp0cDRzM253Q3BkM1lnVTdqalB2NkhkMGRtUTZNbHJHckxVMXRBeW5z?=
 =?utf-8?B?RlgxdmlJSkM0dFJ3QnhSSlVCMTFCK2ZNVk9RZlAzV1Jkb0EzSnp0UGJFU25O?=
 =?utf-8?B?RzNQNjhLV3d2QmhmTzFkL0Y5VDdGTlVzNkJ1TkpqUXFiWXZGSjBkQmxidGRt?=
 =?utf-8?B?REE2dCtZMW1zc2lLNWlqNW90M3dZUzk1b2MxZ3hUa25ZczlEYmY3dzVQdUxF?=
 =?utf-8?B?Y1pGVWlheXN3c2FRUDV4YjdUbFdHT3NBSGhyTEltKysrb1hjL0d6UlZCUFNk?=
 =?utf-8?B?NW1oTVN2R0VVYmQ5R1EwMXVsUlRCMGtpNlFVbnZ4WmZxR0JZZGtiM2xrajlv?=
 =?utf-8?B?alNjTE5lUFEwbnMvVDBpVm5XV0pVZjN0czdhb29RMmMyYmNwRnU2OENDcGVs?=
 =?utf-8?B?QXlaNGFRSDVUeGVoQzB1c2ludG1uaVg4ek1iYnBSMlg1QmQ4T01rZUl4REZh?=
 =?utf-8?B?Sm9kZWRqWXpJMXJ1dnRwWEF6R01MZWVPT3BiTlBRT3J5YmNBNS9lYU5hLzJQ?=
 =?utf-8?B?NU5leUp0Ny92WjVsT09mSWNNTnRNYzFBdWx5ZTVIK3NPR0YvWjFEWWpqTXVz?=
 =?utf-8?B?amIwdTJCRS9YNE42Lzk1cjFOWGZSaW5TRGU3UXFzSXNGRFVhWHlJRUNvTEE0?=
 =?utf-8?B?UVZsblh6QTZ0QThDZWZxaHgyT3BoMnhkZ2dBL2NZU3pEYXR6YzZLZE94RTNK?=
 =?utf-8?B?enFyRFowdkdSWmtBaE16MVUvZnZOLzlQSURZZGppZjkyQ2pCeDRKdlNnUW8y?=
 =?utf-8?B?SDNTOW5vSHpnQUIzZDl6MFBCZCtyWk9FVGVabURiRkgzSlZUQ2RsUTJUWHVK?=
 =?utf-8?B?UkkyNUpRR1RodDAxRFdveVdwUmFheGlLTzFEUlhmeFV2bVRLdThyMzBWY1Jn?=
 =?utf-8?B?NW4zVm84NDlCaHZhNjFLUzBwb3AyUHZPODc1ckZjczBkNlNTMkdjWlZ5OE5q?=
 =?utf-8?B?VFNWZm5UZmRYRkZOR2RDSE9XN2phQjdBdmJlOWZsaFpFOFdVZkNVaGJwK3FK?=
 =?utf-8?B?QmpEekZIOWZaYjNwN1VlNm1sTG90WTlKYVNCd3ovYmQrWUxLaWRCekYveE5M?=
 =?utf-8?B?MG5UYzRrNkd3U3dXTlFtellhU3lXRGRhdlRHWTFDcXRmL2p3WDhwT0RzYzA0?=
 =?utf-8?B?SFN2dmdVYXhVRFVCTFdtVloyWEE3MXQ5MkVnZVN6Y3hNQ0xoUHVUZjd5NGlk?=
 =?utf-8?B?LzUyRkhpU296eG04K0ZWc0t0eDNERVMrREhJZnBxekNOY1dCbThmS1B2emVU?=
 =?utf-8?B?NkhSalVhZDYwZEFGR2lIcHR4M0ZMdzlyOWV0U2VXRi9FOE5EajJBdWZ6NmNG?=
 =?utf-8?B?N0Z5SmNKR3lTKzFvRzBSM0NwTUp6V1VwNlhmaW9MWHY4T3hnS2QrYkcrVWxj?=
 =?utf-8?B?V0t6QVBpWmg0K2R3Vzk1VUFHenM5azZBeFhjVUI4S1R3aGF2UVk5WlZ4SVZh?=
 =?utf-8?B?L1k2SkFTZlRjSk05NVdCeUkrY2NLK3paZE1KcWdkOW94OTE4NzJCUjA3S0cw?=
 =?utf-8?B?aU1Ib1JudldKZ1d6K3J5ZzFjNGJudDBnV0Y2R3NpMGpITHdIMGJybzRtdjFC?=
 =?utf-8?B?R1Brb2tFL09ST1VsaU9rMkFzOUZ0VXl3NTcxdGVYWDdVVWhQL3diNlZvWnFW?=
 =?utf-8?B?RGpvazdxTWE1RmxiWEI3eUx4T0lQcHovQmNJMjZFV2s1SU5zcG5qSnF5aTQx?=
 =?utf-8?B?ZFdsY2xsQng1SFZKZ0wzMjA4b0M4UldXWWZyZG9mSFRkeDd1RFhqalA1U3k1?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77B1827CC851904194723EE9722A02EF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB3081.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cddd37-6699-4e51-9a23-08db45526a22
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 06:00:47.3130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gIgaoi5S1/sOeRzfn3o0YXOrZEsSQJELniLJRjICb/huTT1Fm/yHgjArbjUwAOcbtRvo6ZkQgIGXD6setCO5mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6924
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180372

RGVhciBTaXJzLA0KDQpTb3JyeSwgcGxlYXNlIE5PVCBhY2NlcHQgdGhpcyBwYXRjaCBiZWNhdXNl
IEkgZm91bmQgaXQgd2lsbCBicmVhayBpdHMNCm93biBzc3RhdGUgY2FjaGUuDQoNCkkgd2lsbCBm
b3VuZCBvdGhlciBzb2x1dGlvbiBmb3IgdGhpcyBvcGVuc3NsL3BlcmwgY28td29yayBpc3N1ZS4N
Cg0KT24gVGh1LCAyMDIzLTA0LTIwIGF0IDIxOjExICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90
ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiBUaHUsIDIwMjMtMDQtMjAgYXQgMTk6MjAgKzAyMDAsIEFs
ZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiA+IFRoYW5rIHlvdSwgSSB1bmRlcnN0YW5kIHRoaXMg
bm93LiBJJ20gZmluZSB3aXRoIHRoZSBmaXgsIGJ1dCBjYW4NCj4gPiB5b3UNCj4gPiBhZGQgdGhp
cyBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIHRvIHRoZSBjb21taXQgbWVzc2FnZT8gU28gdGhhdCBp
dCdzDQo+ID4gYXZhaWxhYmxlIGluIGdpdCBoaXN0b3J5IGlmIGFueW9uZSBuZWVkcyB0byB1bmRl
cnN0YW5kIGl0Lg0KPiANCj4gSSB0aGluayB0aGVyZSBpcyBzb21ldGhpbmcgYWRkaXRpb25hbCB3
ZSBuZWVkIHRvIGRvLiBJZiB0aGUgcGF0aA0KPiBjb21waWxlZCBpbnRvIHBlcmwgYnJlYWtzIHdo
ZW4gaXQgaXMgaW5zdGFsbGVkIGZyb20gc3N0YXRlLCB3ZSBzaG91bGQNCj4gbWFrZSBzdXJlIHRo
aXMgcGF0aCBpcyAqYWx3YXlzKiBpbmNvcnJlY3QuIFRoYXQgd2F5IHRoaW5ncyB3aWxsIHdvcmsN
Cj4gb3INCj4gZmFpbCBkZXRlcm1pbmlzdGljbHkuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNo
YXJkDQo=

