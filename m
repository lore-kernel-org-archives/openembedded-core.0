Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E0DC83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 06:37:30 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.132])
 by mx.groups.io with SMTP id smtpd.web10.8370.1693377449614453177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 23:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=ZPesTV7z;
 spf=pass (domain: prevas.dk, ip: 40.107.15.132, mailfrom: emkan@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ49Fqv8aL9q7AHIvvxGJVDdRzh/wjqKGGqKPs1hegUz7lbo0MwToorOL6aP/18fsODqehxPeMDnDLbUZ5AJp7raT59WFjoUERYmSvl/RVd261QLQMty5miw0MYw33HTTc2x1NOLC2eZTdwpGB8aJgZS6mveJXixTa15DQ7xAOLlnXDQHI0eYfKcQZc725OZbf+x86TUt8w1+JSBbO13O8U0Vbf4PGEttmDmtU/FWmjP064QI2f+Oweltn4f8u5o5tN+ejyR6A01vTpiS3v8AnA8rJLi8kBmlXxFk94QaKguI7cZVZGXqmINo4y/XcdB08OzKftu/tnZSCZ4BA2Y7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/MSQJjC+tEuiMTyJG2f8jQ76KJEqx9L+Z4MP2jAr80=;
 b=l/t8TRWwp0rhfExElUgdt8S3K1z9FLuoV9vIKeDLXquI9aRN7X8ntw8kcqthRAChZiY5Y2L09SRwMhBGeRUDBtR9mzirU05M6aR8azZIiui2iyDvgThyHrb0zyvqXus4qlErkkakVH6WfK158NdubtRXZEx4yiOBl7QcZJozTxgKAPShmd0J2hDNCJAgTQdUH8mV6cEaPBDpfHtAvV4otz7C6V4bVSISLSXcLrOua8lcEf9Wte0j8iUFqRNMvTUTUXh/+4u4OVQYcJXwc/coazzGunvTyOt+Aj1I32MMAwM2g7HQh2y6mmHY4QuU6jgpXThhuYwDKoVQVUQL0+HAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/MSQJjC+tEuiMTyJG2f8jQ76KJEqx9L+Z4MP2jAr80=;
 b=ZPesTV7zjLTgqy3XCKdoXDEKLqTvk0JVzb/RsHEOo7GGvHWnIkHeqNNNr+CzN+4sdc12xhbAtiXVvHGJsvEq+yRKYEwotbybFvRx3sPKvFBC7MLP/0TtYxK4F1OKevXu429PpO4JtKbs1jycqg9wdnI+9e1MeKv0+sHY+yBKqwE=
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10a::24)
 by GVXPR10MB5983.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:17::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 06:37:23 +0000
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126]) by PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126%7]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 06:37:23 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Index: AQHZ1pCnD8HIvlN4GE2Gd3/khZMp+q/7ISmAgAQw64KAAbvKAIABXWQq
Date: Wed, 30 Aug 2023 06:37:23 +0000
Message-ID: 
 <PA4PR10MB45762B6CDBDBB062BE4C5326FFE6A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
References: <20230824134101.41906-1-emkan@prevas.dk>
 <20230824134101.41906-4-emkan@prevas.dk>
 <7263B0AD-E44B-4E8E-A7E5-567E67DEEC10@arm.com>
 <PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
 <DD619F8E-B1D5-462B-A4E7-008A6F8E181E@arm.com>
In-Reply-To: <DD619F8E-B1D5-462B-A4E7-008A6F8E181E@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB4576:EE_|GVXPR10MB5983:EE_
x-ms-office365-filtering-correlation-id: 1cc39417-2cfb-4cfa-9046-08dba92391b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +gWZKO5qUvBaCp1ivXO0phVFF2Na8RkDlMSyYgdApl30eDs7KltcGStoWl4q+/5/qMp/i7JjE64HqWQkgexwtM3DnPX29r+jTEtRcmydAXL+hbgyUcgDgt3DWq72AVcIaUZKG/ziz2mLd21Nh6p6W5t69FzHCnSp3HuX33ep8/dNh3z+ZTxt/smSqJ8dnX1gRQhSeVZPO7Bi09rzUi79olMO2JAPZllYNuWPWZqU6+vapfhBIykbTJm+EtHRjd+JOxfJegvaCbp9PRcj/feuYPlqaDBRw5WIqutHje+m+JfPdprTG8b2DdNRYKdip9YnoaE4by79IpIBOS9TWk4AB2DlDcq+TYenAKNPpjWofahIG23qffhob3HU5Y1eSSZigBrRKRzlNz9AVxUIbNjPyTW+b1UUb0u14fKk7hEl7vkSWouNno8KNd9tPwomr3hIYZU2nT4pPVaxCZD9gJ9oFhBAQ51EUcP7H7s7fepWBZCknpVZVEM716hUjWj17AIAN3t3ajFsN0Z25sd0G46G5vTa5lXgbQAGRiRiVn/UxTao/h+C/WEGH1SMkXcy18qTeqmRFmoTiVorrNBLmqaXLa4zEN3oBmlWBFq8UzYSkRqsJPCIwdlmuu+Z+T7uXn49
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39850400004)(1800799009)(186009)(451199024)(41300700001)(66556008)(8936002)(55016003)(4326008)(8676002)(66476007)(478600001)(71200400001)(76116006)(91956017)(66946007)(64756008)(26005)(316002)(66446008)(6506007)(7696005)(53546011)(6916009)(9686003)(4744005)(2906002)(38100700002)(38070700005)(122000001)(52536014)(33656002)(5660300002)(86362001)(19627405001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bC9TSmc3c3h0b2p4SjhFNzlwY1ZSZVhhNlhiZVNCYmNZQUZSMFpLam44ZmpH?=
 =?utf-8?B?UzNtQWwwaTgvdEtkY2pVWm5ZMmVVMmhTUVBvdzUvMFhuaGlPQ21QTm05QWdv?=
 =?utf-8?B?TVo3OCtQRGJCcXUyRmNpdFNyU1BHVm1WQlVROGMyZ0tmOFI5MCtNVEFaUEs4?=
 =?utf-8?B?NXlKcTg1ZlpDVnRjSUIyWUdKS25Ic2ozUWZEMmRSRG41NEVaNHFvRGZLcTFB?=
 =?utf-8?B?UWp6WnJMZFczQWR0L1VGZ0xwNXE5MStyZGhZa1o0VTlpMTFEdVVEMHNGWHpB?=
 =?utf-8?B?Q09vQ3J0bXZmNllONnVLenNLd0YrMmsyWlRLeU83dTBYa2JJZlgrQXNWbWxS?=
 =?utf-8?B?TFcvNXNvN2VTN3dOV1Y0UVJhcm5KckFCK1k2ZFN1MG5NNjVjQU5EckdtZXhq?=
 =?utf-8?B?VU1Bb0daaGFtUXpjcXJkYWIvNjVXcWpIOFZOd1B5b3Nmb3N2emVJMkNFbDBy?=
 =?utf-8?B?NEZsUEUzdUZaTTMvR0hLYzZSQm12cHptNDBtSXptekF4eFQzQ0MrT3lVc09Q?=
 =?utf-8?B?RWc3dFB1c1FDNkkwWDJpVEdnbWo1cUVLV1FUbWdOVDQvanZtbW5hVmpkRDFY?=
 =?utf-8?B?QUpxenE4MzB4R04xd1NpYUJtbE16OXRBS040aVNuZ1BtRDByQ3M2SVNJTFd2?=
 =?utf-8?B?Y2VJQWxVQWlCanlNM1NqWHhmNnR5L1ZYNDhJOStCR3k0ZVJ0WHY2ZTMydVk0?=
 =?utf-8?B?RDA3TlJ4NDR0SFJmbHNWOEdvNG9YUEJON2R2ZEY3MnJRSW1MYlFaN3JqRGJi?=
 =?utf-8?B?YXQ3OFIyY0NmNGxnWkpIMmw5RXFpVlEvZ3diUG9pTk1ydW9Zd2tJTmQ2TXlL?=
 =?utf-8?B?UDNIOENQQ25HOGdQeEFnYXZ5eGFiVHBTNWZNbTc4cUMvSUdOOEt2TG5sWDdp?=
 =?utf-8?B?Y3lkcVJ0OGNsZWdaSEpGc0V5RmEzOUhvTXd5alVlSGpTOGw2ekdZTWZoRlYw?=
 =?utf-8?B?SWdVaENsNWE3SjdVcHNmRTVOQmJIL1YyK09PeUl4bk5VeXRkYUpIa0NVNDVF?=
 =?utf-8?B?MjVvNFE1MTV0aTNiNW42WmJPU0o1MnU3bkQzQ2tGZHhRYnBpUlBPRmRHd3lG?=
 =?utf-8?B?S01XVlB1WFJFZ3E5elk1YXBZN1c3M2VJM01oWWJEQ1d4OVVqYlQ3WDlkMCtw?=
 =?utf-8?B?L1BGZ3d6ZWdjbDZkUWhBOXFYYTh0NFB1SWk2bklnWFVwWWhCajZoelpsRXNS?=
 =?utf-8?B?d3IrM1R0djc1T0RTdWg1QjVZaHBPbXJVVzdUMElQUXFHei9xWU05aFkzOVZM?=
 =?utf-8?B?b2tGL2R1OHhuNnlzYk5CSW1DRFZaaDJHTlhVNEdYbTFNV05sVFJDVUpxTTM3?=
 =?utf-8?B?U3FVRlpPWnIrYitmNkcveEhoSlBXb3k2UVJKeURKNktZaysvdTBHcCtwUyts?=
 =?utf-8?B?UFI2b01ydVVNY3FtTzgvVzBqa29yWjBwSTgzRCtIcEhUWXh5NVc3LzZ3WCtG?=
 =?utf-8?B?c3d4QXM2b0RvME9BVCtWOTUveUZaSmNrc25XR0tLd25Ob2ZsempDN2F1aDRS?=
 =?utf-8?B?SVZBN0FmWTM0Ryt4K3UydWxxWnJPcEt5TU5tQTFkTnNKaFdTNTBOTldLb1RX?=
 =?utf-8?B?emRMQmQ0Nk9GUkp6dXY1NERiWFExOU1mdVRxRjVXNWpiOWQ3c2RrcXF1UE0v?=
 =?utf-8?B?SVJyWWQ4OE9xeWp4Y21KeWh3VzA5M2krWEFXWHp1bHl1Z24yR0ZrOUdWNEVQ?=
 =?utf-8?B?QmlZeDhVMWZhWkMrUnFNQmREU1dCUm1sbEM2R0lzcU5wZ0cwbkhtL2JPVmx0?=
 =?utf-8?B?OEp6L3dzeFBRR2xYVmFTdlNMU240Mm52YmpGYXBEZDJRbVhCdXc5MEQrOWts?=
 =?utf-8?B?ZmErTldoaUVQMWJabTR3aUwzSVhXN3pXL3lLKzZhOHpYaVdBRG9nandzUVZG?=
 =?utf-8?B?ckZSK2xrbmNOTUN5VXRYZmJIb3cvR085MnFlZUdCYk5sbWJCZTRyVlg4Q1Jz?=
 =?utf-8?B?N0NneHZkVDIzY3NMMnJtaUgyZXJsZ1RteFNJa2wwOVNjT01aeDhJUFRnZkhY?=
 =?utf-8?B?SHV3VzZtREtTMHZ5eUhIYWZ1VXA2Z0VqZ1JPeDBYMkk1dnhyVWxUZHB0aDlW?=
 =?utf-8?B?V3c0aGdjWWZ6Zmx6d0IzQUJLRmFDNWVOOFFndHM1V1BURmZrSHJsR0dYUDlm?=
 =?utf-8?Q?Cm8SbUVKwF4EV29wtE7U//qC1?=
Content-Type: multipart/alternative;
	boundary="_000_PA4PR10MB45762B6CDBDBB062BE4C5326FFE6APA4PR10MB4576EURP_"
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc39417-2cfb-4cfa-9046-08dba92391b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 06:37:23.6455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4kBd2JjEVvi40oMrOT04PB8nR5T9smTVI18YdpPQKSUm8TdQtprE4IxzHLz8CPbvJTMx/Ox9Z5hoChv02TZAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 06:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186870

--_000_PA4PR10MB45762B6CDBDBB062BE4C5326FFE6APA4PR10MB4576EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhdCBpcyB3aHkgSSB3YW50IHRvIGluY2x1ZGUgaXQgaW4gdGhhdCBmaWxlLiBEb2Vzbid0IGl0
IG1ha2Ugc2Vuc2UgdG8gY2FwdHVyZSBDVkVzIGZvciB4Lm9yZzpsaWJ4MTHigIsgaWYgeW91IHVz
ZSBhbnkgb2YgdGhlIGxpYnJhcmllcz8NCg0KRW1pbA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCkZyb206IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPg0KU2VudDog
VHVlc2RheSwgQXVndXN0IDI5LCAyMDIzIDExOjQ1DQpUbzogRW1pbCBLcm9uYm9yZyBBbmRlcnNl
biA8ZW1rYW5AcHJldmFzLmRrPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAzLzNdIGxpYngxMS1jb21wb3NlLWRhdGE6IGFkZCBD
VkVfUFJPRFVDVA0KDQpPbiAyOCBBdWcgMjAyMywgYXQgMDg6MTgsIEVtaWwgS3JvbmJvcmcgQW5k
ZXJzZW4gPGVta2FuQHByZXZhcy5kaz4gd3JvdGU6DQo+IE5vLCB5b3UgYXJlIHJpZ2h0LiBIb3dl
dmVyLCBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gaW5jbHVkZSBDVkVfUFJPRFVDVOKA
iyBpbiB4b3JnLWxpYi1jb21tb24uaW5j4oCLIGluc3RlYWQuIFdoYXQgZG8geW91IHRoaW5rPw0K
DQpUaGF04oCZcyBkZWZpbml0ZWx5IHdyb25nLCBhcyBtb3N0IG9mIHRoZSBYMTEgbGlicmFyaWVz
IHVzZSB0aGF0IGZpbGUuDQoNClJvc3MNCg==

--_000_PA4PR10MB45762B6CDBDBB062BE4C5326FFE6APA4PR10MB4576EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YgQ29udGVudFBhc3RlZDAi
Pg0KVGhhdCBpcyB3aHkgSSB3YW50IHRvIGluY2x1ZGUgaXQgaW4gdGhhdCBmaWxlLiBEb2Vzbid0
IGl0IG1ha2Ugc2Vuc2UgdG8gY2FwdHVyZSBDVkVzIGZvcg0KPGNvZGU+eC5vcmc6bGlieDExPC9j
b2RlPuKAiyBpZiB5b3UgdXNlIGFueSBvZiB0aGUgbGlicmFyaWVzPzwvZGl2Pg0KPGRpdiBpZD0i
YXBwZW5kb25zZW5kIj48L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBB
cmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KPGJyPg0KRW1pbDwvZGl2Pg0KPGhy
IHRhYmluZGV4PSItMSIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrOyB3aWR0aDo5OCUiPg0K
PGRpdiBpZD0iZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9IkNhbGlicmksIHNh
bnMtc2VyaWYiIHN0eWxlPSJmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij48
Yj5Gcm9tOjwvYj4gUm9zcyBCdXJ0b24gJmx0O1Jvc3MuQnVydG9uQGFybS5jb20mZ3Q7PGJyPg0K
PGI+U2VudDo8L2I+IFR1ZXNkYXksIEF1Z3VzdCAyOSwgMjAyMyAxMTo0NTxicj4NCjxiPlRvOjwv
Yj4gRW1pbCBLcm9uYm9yZyBBbmRlcnNlbiAmbHQ7ZW1rYW5AcHJldmFzLmRrJmd0Ozxicj4NCjxi
PkNjOjwvYj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyAmbHQ7b3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0
OjwvYj4gUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMy8zXSBsaWJ4MTEtY29tcG9zZS1kYXRhOiBhZGQg
Q1ZFX1BST0RVQ1Q8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNz
PSJCb2R5RnJhZ21lbnQiPjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFw
dCI+DQo8ZGl2IGNsYXNzPSJQbGFpblRleHQiPk9uIDI4IEF1ZyAyMDIzLCBhdCAwODoxOCwgRW1p
bCBLcm9uYm9yZyBBbmRlcnNlbiAmbHQ7ZW1rYW5AcHJldmFzLmRrJmd0OyB3cm90ZTo8YnI+DQom
Z3Q7IE5vLCB5b3UgYXJlIHJpZ2h0LiBIb3dldmVyLCBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vu
c2UgdG8gaW5jbHVkZSBDVkVfUFJPRFVDVOKAiyBpbiB4b3JnLWxpYi1jb21tb24uaW5j4oCLIGlu
c3RlYWQuIFdoYXQgZG8geW91IHRoaW5rPzxicj4NCjxicj4NClRoYXTigJlzIGRlZmluaXRlbHkg
d3JvbmcsIGFzIG1vc3Qgb2YgdGhlIFgxMSBsaWJyYXJpZXMgdXNlIHRoYXQgZmlsZS48YnI+DQo8
YnI+DQpSb3NzPC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_PA4PR10MB45762B6CDBDBB062BE4C5326FFE6APA4PR10MB4576EURP_--

