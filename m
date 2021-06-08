Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web11.8052.1623123896870055301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 20:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=F+nUrnjK;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.76, mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1623123898; x=1654659898;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cKrJTACiOfYMMrCrpqO7O4i/6OMLQqX6vjjZHz0T0hg=;
  b=F+nUrnjKUVH5EwimEQSYSudGhZ7eZoXQ3udy0+48wN57wj76di/xM6Rz
   Mr1kZAxw36JT69IB4OcMBM6o+Y7DKVksakCUWatnvi3YAI8ihl4B6L8EZ
   b71+dieUc10yNH5KV1VMNEzRtmZjPKZEQQVaojeYydFfSr2LFVA2TDCPT
   8vls0ZGqHB/nceM1aii/U/BH+RFJXJQ5Sl0ivXWKuh1CoXZfaZixtWn5W
   D9y8/EhDP5VXdsVEiSU0GP5gywMH9igGh32fjV9rAPFo3SLtds7BZdklX
   rJDaef+Z3O5sMNU3dpB1G6hbXLHLBeS6ZX+Qrj2rWAw6AY6+mDu57ITgA
   w==;
IronPort-SDR: T104/5p+UN+NZI4WFmebzMFdFMUsJAn/m43+Dixn8T9biubdW5ekBQZ9lrysAWFufEv9e3o+Ns
 rer/LalvN2d4qBdDF4MAZnKTCP7JR7yJitfIg/ICQGjqsvLFfdDgiJzpV/1QP2M67RgoLI0iWy
 e8gAba2r3GP7/KnvO7XcyYVjpe8+FuaO7wm8hkhj9xCXAOLY/2Of8NEzHpWuRHZWik+NsLzk3p
 CAyp6w5LMYWkbiURtaDM7EGFeuCEbLahdgdTZMQLK+lI01Dy3tulaF78l7GjFSxIFT/DCMjQNL
 mAQ=
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="32681467"
X-IronPort-AV: E=Sophos;i="5.83,256,1616425200"; 
   d="scan'208";a="32681467"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 12:44:55 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2/pxHB87E05wjO91T34hUhZto1e6mFXRW2tx/f+LLjprU9CSHjtTeZU3VpLmilG7ze3Sy5o8jcJKENRRMpYJZqrapxgnGdATm9d1gvj9qKScCTL4p0VTG7PHAzs5sJfw6jaKsv/XxytbRBp37o8KH473eRJUFhcJEe+g6E0SUQRylfbEIHx/ChAqgJ1G+4CmGiek7a8pnHLHCsSTgzSlNfwu7SDh86dih6E4b/ERol/nUFnRG8LA365CE8skBDgJD8d1pMGdrly2gq6nwC72OH+3Ig7tq22k4GqLaj/kUxmhW70WP6BL4aFDYJG+mEffP0byW2X6ZhNZQF05QguFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKrJTACiOfYMMrCrpqO7O4i/6OMLQqX6vjjZHz0T0hg=;
 b=bTbYQthv4/JtsVgX9MOxFXFM59OBpbCebaZBxpo33ZhYtoh3kWCYMo/O03Wme/Dv78kwB5nc2t4+j8YeiNN2Ma1XOjSbKKaBg6kYLptsmgpnRKqITo56h/KZx7zAjj/QUdZ0ZVWOpwDJJMwBhBNB/UhuZdaDoBtp+eJ9WtewJ2vI7zS3IcTRPdO8Rh0rsYx9IRyc5BgT75lPVdiW41LDvGHuoJiRqzEJRNc9cy6gKDPWKnDPZKB0emvePkGQYMr6E5hTpsqfB11M8uQy6gRd5LUa3ChUfNGaxhqF1WjWlpWc53BryRpLEVbRyUYXQfxq4IwPc8zYo4bDyP9pe0/DZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKrJTACiOfYMMrCrpqO7O4i/6OMLQqX6vjjZHz0T0hg=;
 b=A1bUuwbgM/tPlMAHhzihwwjm/LA6+7V0dB5/rcI/xh+cqkP6fuwfjea/BIiu+KS3Vw9zlfEGEJWWbGdaKjHJM/BrzQSGnC4AmIbuaSPcpM5g1X+Fzc7kr6wRSsQUhbfKLjGWCDZN1rEefQxybB9DfmVrR6MLoKFGe3KF6Hej2go=
Received: from TYCPR01MB5792.jpnprd01.prod.outlook.com (2603:1096:400:45::9)
 by TYCPR01MB6819.jpnprd01.prod.outlook.com (2603:1096:400:b6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 03:44:51 +0000
Received: from TYCPR01MB5792.jpnprd01.prod.outlook.com
 ([fe80::a110:5992:dc59:eeaa]) by TYCPR01MB5792.jpnprd01.prod.outlook.com
 ([fe80::a110:5992:dc59:eeaa%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 03:44:51 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcc: Update to latest on release/gcc-11 branch
Thread-Topic: [OE-core] [PATCH] gcc: Update to latest on release/gcc-11 branch
Thread-Index: AQHXUArhba4ePWTR+kCBT1LV2aNJG6sJjxpw
Date: Tue, 8 Jun 2021 03:44:51 +0000
Message-ID: 
 <TYCPR01MB5792D40E53FB3A81A9880E13F5379@TYCPR01MB5792.jpnprd01.prod.outlook.com>
References: <20210523193555.480529-1-raj.khem@gmail.com>
In-Reply-To: <20210523193555.480529-1-raj.khem@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74fcc143-1d18-40a0-822f-08d92a2fc569
x-ms-traffictypediagnostic: TYCPR01MB6819:
x-microsoft-antispam-prvs: 
 <TYCPR01MB6819E28CC743EC77E349E311F5379@TYCPR01MB6819.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:551;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dQTVZS536h2vM49ZYIiXXl+yGgWeBJZ0Jg5GYtsY8vmXtlsGYnDvLXd6VqUqTsTna5x8BTGcCajJ831Bip3Wfv/0oozKDQzl0ynsWBMEBSPZ+1M1PH1fOglJJrf/juoy+83yx0EjmJe5WPoTCNNb8eHE/1Qp5FlV+Wi1eJPff772k66hCNwLNCY3GcGrLhCj0xqBLFeuSDRcBgQlJNlNR7xVWj2++ShadOc3mqjFx/Or5C3xhDoM+b9FZN7S7/p8UmiEKojBc0FI3RwOjjfEieWAQunIWQ9gqi+ywcwEb7gIf3PGOm9/YJZ4vrpapxaZ/h82W7f8zVuiUMFDaOf0u/e4BStLUHPr1kktsMqaQgH0KgvV+KmM7m7NRziseyhr8KHkeakkMYXidiZ9hI1OU3Oadu8Fw3TK5FhZICT0pGwCo6AZ/ygFVH4jK+ntjnOmnyMjl7jFI6Xtehg2tL9FP3V2Hg1gKXFHT/nam1yh/g9ofsRYjQvwtgmonNA8Mm4yiwqhuUski9vlbIY0bTv+U2VhqoBaraDAaooqqvSMAOBHK2hQJkiLvvQsNTMZD3l3nmupFB9DESNdzhes+ZWIRum/V+uguDrtn0Ak55rlyVDovcMGvjwlnChXECaHti5/+5zV3yJ5qA0zq7Xlje4nfffHtvTaZQ9w5YqF6F5ZvW1yQERzgJx4SkHbm1vFyhFL1eOeJC/eIfu/R7gLkvg8AoG5pqj0VepIxg3fQ1gUvNaI9T/LfkU40msmu5NIigqj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5792.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(86362001)(66946007)(110136005)(9686003)(66556008)(85182001)(316002)(66476007)(15650500001)(5660300002)(26005)(6506007)(55016002)(71200400001)(64756008)(33656002)(8676002)(76116006)(8936002)(2906002)(38100700002)(122000001)(7696005)(186003)(53546011)(478600001)(52536014)(83380400001)(966005)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?gb2312?B?ZVpDRklKQmF5VmRBTGQ0VTRaUzRpWXNCb0VKNU9tci9WMnUyRWFMa2J2L2lz?=
 =?gb2312?B?NGlLN2ZLOUQ2eENyaU5ENERYcWFpR2VIWXd2THlpUWpKQ1J4TVZ4MGVaT05u?=
 =?gb2312?B?MW1PM1ZGY2M2YUZHVFRDUjJWMzhuNDRzdHpPTE9VQXdTTDBBeUpvWDY2U1Ry?=
 =?gb2312?B?c2VJMmg0TmpYdmtiTlpUdHVOQkVLemxYV0lSQ2JucWNUVkFDTVRCNW5KMjJQ?=
 =?gb2312?B?QVdmRklDMmxqSERzSXZNa29KWDhJM1NzWFVYQytiTi9WcnUwTjkvdFlJY0gy?=
 =?gb2312?B?LzdFQnV0SGNyTUVMUk9DYmJDVHRDKzJ4U29FeklrWkYwTWg2QXZWczR2Q3d4?=
 =?gb2312?B?TlRSUURJZlZZQ3JNRGtuSnZqOWZBSzl0NnpaUUJaVnR0RFZseXp1TDRoTlBx?=
 =?gb2312?B?T0xncWcwL1p1OEJnU2hsVWpVMWN0Z1RWYmRtakthU25JcEplQzFIaGtHaWkw?=
 =?gb2312?B?RExHWDJNUEN5MTJ3MDdWa1R1NzBzenRIZDR2RCs5RWN4eWc3V0RXSFR1clJG?=
 =?gb2312?B?VHpOaDFTM2hPYnREWmlVdkxISkFHcVg0TTZ6RXFFL1daM3RtWXY0NVBrQVdT?=
 =?gb2312?B?RnhqTkZtR05nZUcxSHRkeTZwNmpnbGVGMmlEUGtKWU1icm5WRFY5L01qbWZV?=
 =?gb2312?B?NitLdXlWWUJzc3hlUjZhUXNiOFVNRkQybS9MT0JvcUhweGdNQ2ZqQlZsYVRS?=
 =?gb2312?B?TWNWUHBKN2hUTEYwcXlweUNFSElLa1lpZjR2K0hCUWQ1Y056NmZabG9EOXRF?=
 =?gb2312?B?ZE4wRndMdmJ0c3N2Uit4c1hRdUlubkhSV1o1SzZWVmpvd1pueXRPbGlXMUlC?=
 =?gb2312?B?ZElISG1LU1R3Q0ltMFE0amUxa0J3RUYvV0ZacEplektybUhaM0lWdDhEaVND?=
 =?gb2312?B?eFFBVnlKR1A5bmJ6LzRqSm1TR0xkdW00cUlheFlBanc0REN2d1hadlNLUHVG?=
 =?gb2312?B?NlpHWC82NU96dFJtUFh5NzlheEVlWGNWbXFXQUowQ1VWWjZ2UGRwRnlNaUJQ?=
 =?gb2312?B?REpoZURJRlkydTlSWGRrM3RsbnZtV09zRjIxMURXTFRSU3p3bUx0REREYUlo?=
 =?gb2312?B?RWM3Y0luMlJyUk9HVGFLY3NtbXBYUmxIZGJlTWNGM3FyeFVFZTRIdngranB5?=
 =?gb2312?B?YVYyL1FROEpsNUt4em9kSy9TOGZzcHhQclpRM04ybndDVDQ4aXQrNVM2ZTFt?=
 =?gb2312?B?UENGN003amhDZUM4RWgvMFhMYjZTbUJVVUR0Ym1iMDJRcmFyNlVrMVNSWGlF?=
 =?gb2312?B?MVFUemhycDRJRDV0Tk14WGtLTEtaRjJxd0I0MGJ5Zzlra3dPN2xwWmJDTUxj?=
 =?gb2312?B?TEhMaGNYVXo4WWcyZVN3Ky94ZUZYOFRnV3ZtdkZqVlNjQnh1STh3ZVRicC9s?=
 =?gb2312?B?dlhDckZnUGUrUW5WVWxUOHNwL0E1aG0ycGtucXoyM1NZZ0xwY21lanloMjVQ?=
 =?gb2312?B?MHRwcUdud1RrVEpZNVUzNVJnRWdxbW9pN2RvTnpsSGtUbVIyMnMrenBZb2sw?=
 =?gb2312?B?OGt2V3VvZzhMTnovK214NkVrUCtlM3QvVVdPSDFHTG1xRm1Ob0lnZlVTQml2?=
 =?gb2312?B?eDlGemw2MUJzakJDMk5ZZnlVdEkwVmtOK3JWaHJIcFh3VXVmNWZlNjVIai8y?=
 =?gb2312?B?WUZRTmtOM0xxcE5FcVVuNWNpcE95QlJwNTY1bTlFWjh1aXVJcnNxaVB4ejV6?=
 =?gb2312?B?WlRnUHlzZHlRbExHN1RUK3ljWXV0b1R1cmp5cGVCMmRieVhSVE1xU09JRjVT?=
 =?gb2312?Q?T4yr65JEbykHzKzaMo3btJcDPBz6uJxLtYp33LZ?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5792.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fcc143-1d18-40a0-822f-08d92a2fc569
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 03:44:51.3143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BXCu6vh2E6gZaW/t75rbLWJBO+HqeFAAqdFF8JjDrsCemz2lH/ciM3O2tAG/qzeUsXKiNRWlsa4ljvcmH42SWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6819
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8sDQpnY2MtMTEuMS4wLTllZTYxZDJiNTFkZjAxMmM2NTkzNTk4NzM2MzdjYzIxNjJlY2Nj
ZjMucGF0Y2gNCldoZW4gdXNpbmcgcGF0Y2ggYXMgUEFUQ0hUT09MLCB0aGlzIHBhdGNoIHdpbGwg
ZG9fcGF0Y2ggZmFpbC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2Vu
dDogTW9uZGF5LCBNYXkgMjQsIDIwMjEgMzozNiBBTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4NCj4gU3ViamVjdDogW09FLWNvcmVdIFtQQVRDSF0gZ2NjOiBVcGRhdGUgdG8gbGF0ZXN0IG9u
IHJlbGVhc2UvZ2NjLTExIGJyYW5jaA0KPiANCj4gVGhlcmUgaGFzIGJlZW4gMTUwKyBmaXhlcyBt
YWRlIGF2YWlsYWJsZSBhZnRlciBnY2MgMTEuMS4wIHdhcyByZWxlYXNlZCwgZGV0YWlscw0KPiBv
ZiB0aGVzZSBmaXhlcyBpcyBoZXJlDQo+IA0KPiBodHRwczovL2djYy5nbnUub3JnL2dpdC8/cD1n
Y2MuZ2l0O2E9Y29tbWl0ZGlmZl9wbGFpbjtocD1yZWxlYXNlcy9nY2MtMTEuMS4wOw0KPiBoPTll
ZTYxZDJiNTFkDQo+IA0KPiBJbnN0ZWFkIG9mIHN3aXRjaGluZyB0byB1c2UgZ2l0IGZldGNoZXIg
Zm9yIHdob2xlIHJlcG8sIGp1c3QgZmV0Y2ggdGhlIGRlbHRhIGFzIGENCj4gcGF0Y2gsIHNpbmNl
IGl0IHdpbGwgYmUgY2hlY2tzdW1tZWQgc28gaXQgd2lsbCBlbnN1cmUgdGhhdCBwYXRjaCBpcyBu
b3QgY2hhbmdpbmcNCj4gb24gdGhlIGZseQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy0xMS4xLmluYyB8IDExICsrKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9nY2MvZ2NjLTExLjEuaW5jDQo+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dj
Yy9nY2MtMTEuMS5pbmMNCj4gaW5kZXggNzEzMDAyMjY2YS4uOTJkM2E1M2ZhNiAxMDA2NDQNCj4g
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTEuMS5pbmMNCj4gKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTEuMS5pbmMNCj4gQEAgLTYsNyArNiw3IEBAIFBW
ID0gIjExLjEuMCINCj4gDQo+ICAjIEJJTlYgc2hvdWxkIGJlIGluY3JlbWVudGVkIHRvIGEgcmV2
aXNpb24gYWZ0ZXIgYSBtaW5vciBnY2MgcmVsZWFzZQ0KPiANCj4gLUJJTlYgPSAiMTEuMS4wIg0K
PiArQklOViA9ICIxMS4xLjEiDQo+IA0KPiAgRklMRVNFWFRSQVBBVEhTID0uDQo+ICIke0ZJTEVf
RElSTkFNRX0vZ2NjOiR7RklMRV9ESVJOQU1FfS9nY2MvYmFja3BvcnQ6Ig0KPiANCj4gQEAgLTI1
LDcgKzI1LDEzIEBAIExJQ19GSUxFU19DSEtTVU0gPSAiXA0KPiANCj4gICNSRUxFQVNFID89ICI1
YjJhYzliNDBjMzI1ZTkyMDljMGJkNTU5NTVkYjg0YWFkNGEwY2M1Ig0KPiAgI0JBU0VVUkkgPz0N
Cj4gImh0dHBzOi8vZ2l0aHViLmNvbS9nY2MtbWlycm9yL2djYy9hcmNoaXZlLyR7UkVMRUFTRX0u
emlwO2Rvd25sb2FkZmlsZW5hbWUNCj4gPWdjYy0ke1BWfS0ke1JFTEVBU0V9LnppcCINCj4gLUJB
U0VVUkkgPz0gIiR7R05VX01JUlJPUn0vZ2NjL2djYy0ke1BWfS9nY2MtJHtQVn0udGFyLnh6Ig0K
PiArDQo+ICsjIFRoaXMgaXMgbGF0ZXN0IGNvbW1pdCBvbiB0aGUgcmVsZWFzZS9nY2MtMTEgYnJh
bmNoICMgdXNlZCB0byBnZW5lcmF0ZQ0KPiArdGhlIGJhY2twb3J0IHBhdGNoIHcuci50LiBsYXRl
c3QgbWlub3IgcmVsZWFzZSBMQVRFU1RSRVYgPQ0KPiArIjllZTYxZDJiNTFkZjAxMmM2NTkzNTk4
NzM2MzdjYzIxNjJlY2NjZjMiDQo+ICtCQVNFVVJJID89ICIke0dOVV9NSVJST1J9L2djYy9nY2Mt
JHtQVn0vZ2NjLSR7UFZ9LnRhci54eiBcDQo+ICsNCj4gaHR0cHM6Ly9naXRodWIuY29tL2djYy1t
aXJyb3IvZ2NjL2NvbXBhcmUvcmVsZWFzZXMvZ2NjLSR7UFZ9Li4uJHtMQVRFU1RSRVZ9DQo+IC5w
YXRjaDtkb3dubG9hZGZpbGVuYW1lPWdjYy0ke1BWfS0ke0xBVEVTVFJFVn0ucGF0Y2g7YXBwbHk9
eWVzO25hbWU9YmFjDQo+IGtwb3J0cyBcDQo+ICsgICAgICAgICAgICINCj4gIFNSQ19VUkkgPSAi
XA0KPiAgICAgICAgICAgICAke0JBU0VVUkl9IFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDEt
Z2NjLTQuMy4xLUFSQ0hfRkxBR1NfRk9SX1RBUkdFVC5wYXRjaCBcIEBADQo+IC02Nyw2ICs3Myw3
IEBAIFNSQ19VUkkgPSAiXA0KPiAgICAgICAgICAgICBmaWxlOi8vMDAzNy1saWJhdG9taWMtRG8t
bm90LWVuZm9yY2UtbWFyY2gtb24tYWFyY2g2NC5wYXRjaCBcDQo+ICINCj4gIFNSQ19VUklbc2hh
MjU2c3VtXSA9DQo+ICI0YzRhNmZiOGE4Mzk2MDU5MjQxYzJlNjc0Yjg1YjM1MWMyNmE1ZDY3ODI3
NDAwN2YwNzY5NTdhZmExY2M5ZGRmIg0KPiArU1JDX1VSSVtiYWNrcG9ydHMuc2hhMjU2c3VtXSA9
DQo+ICI2OTI3NGJlYmQ2YzA2OWExMzQ0M2Q0YWY2MTA3MGU4NTQ3NDBhNjM5ZWM0ZDY2ZWVkZjNl
ODAwNzAzNjM1ODdiDQo+ICINCj4gDQo+ICBTID0gIiR7VE1QRElSfS93b3JrLXNoYXJlZC9nY2Mt
JHtQVn0tJHtQUn0vZ2NjLSR7UFZ9Ig0KPiANCj4gLS0NCj4gMi4zMS4xDQoNCg==
