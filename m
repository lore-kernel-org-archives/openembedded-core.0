Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.73])
 by mx.groups.io with SMTP id smtpd.web10.12226.1607011474900870625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 08:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=f7QXnugj;
 spf=pass (domain: xilinx.com, ip: 40.107.75.73, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhx6/D0W8HO0HxhWrdYM1QOsTiosu8oFZolBSa0GhXX95le8irNuA4jAwVszL3iZAnEfnTJQ/yfyAcHcy4qdy9fcApKV5bzWRYWH9eu0zsonMn0G5Jw18gREPUiSnp+jfv6JWhEd39YZCQfuhZfdRgkkdEI02i+WS0Z4tDqi9fYTJ5T97nW6faa3Dggp1OxFpmrp23OiRBd86FJmWuMR7iVRy1fWNhVmY9oOxeZ0r1+RJmZ6t8iK1sDq1/RH8jqdEYvgz/9tsUzUSz+eem9hovjKLTutArnlzPJaMa2VBGzwTbAlMt4IyFAcjvlHvvtk+sDS724s7oCNc/VwHNRB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kngILdmGLNANSx/dPA842ZGclTDWq3HyUdkgnV29KS8=;
 b=jZ6OMakpz6RF7u7L4MhilbtYxeghf2pTPtp1tEhZjQnWXnEyFc8v0qRE+cGgn1FgvUm+DTFX4v/p4wKTfW6uZEArkBlsOnOXkFssL2bhonFUQqT3/PJbADJIzlpebxsci/V5NhZOx8XFmiT45hnTvkZ0NamxVpySoXZH0TKnVwbhgLrLpeCNRVSKncHFBAM6qcEaBc++Apw91ZDMDjWw/agc1OAzgi3OIPhjewRAlQypTYwv79w2VWO996QzP5On9RPE6ScukD6AjqAGWww4qOy0S+1bEHU/JNTpKkO7rotL9ApVKpUbXBUz1uNJlXdPLiNHEyCqw0U667gYOacZWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kngILdmGLNANSx/dPA842ZGclTDWq3HyUdkgnV29KS8=;
 b=f7QXnugjII81aEeF9UnHejwOZZ/eZzNgToa8c90ao8Wjo/bc1wgz7/TnU+TNoh0UhWGYsZAY0NxcARFwIamAC65Fy7UUoXkh5/gdiIh3djecEJn/nOifqzwMb42x/ozNRXhnJa59ACKQwUaYuK8C9nX3LhGWgqYcLIopHDnQsa8=
Received: from BYAPR02MB5926.namprd02.prod.outlook.com (2603:10b6:a03:11e::19)
 by SJ0PR02MB7262.namprd02.prod.outlook.com (2603:10b6:a03:29b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 16:04:33 +0000
Received: from BYAPR02MB5926.namprd02.prod.outlook.com
 ([fe80::dc48:9657:fae0:3411]) by BYAPR02MB5926.namprd02.prod.outlook.com
 ([fe80::dc48:9657:fae0:3411%3]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 16:04:33 +0000
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][master][gatesgarth][PATCH] populate_sdk_ext: use CUSTOM_TEPLATECONF variable to enable custom templateconf.cfg
Thread-Topic: [OE-Core][master][gatesgarth][PATCH] populate_sdk_ext: use
 CUSTOM_TEPLATECONF variable to enable custom templateconf.cfg
Thread-Index: AQHWx2U6C4sQ/+oEP0ugcG+Od3FbVqnlBxIA
Date: Thu, 3 Dec 2020 16:04:32 +0000
Message-ID: <F9F5F1D9-8221-4285-ADA5-676EE71CC824@xilinx.com>
References: <164C687CDA5B4DDD.5074@lists.openembedded.org>
In-Reply-To: <164C687CDA5B4DDD.5074@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.40.20081000
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 544e8f2c-73fb-44d2-68f8-08d897a51fc8
x-ms-traffictypediagnostic: SJ0PR02MB7262:
x-microsoft-antispam-prvs: 
 <SJ0PR02MB7262C342F92D5DB7045C8A6FB0F20@SJ0PR02MB7262.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kQXyszXPRDUt0nZVBgKIXeaPGSZ4iJUPytvFnx/fVMZAWnBZNaXsgpP1ZJV4bExeTowka/q7ujtI/kEn2vz/U8ik0U2UwfqOtJR9ss3n3QT4k0yVCLk6OwGzzYVQAVx5zjgZVMGxbqCHTRGMSjxTjfVnzIV8aENQuCWbR6gdnQFsQKqrXirDvTI1Arg7izi9i/MlCknWP2MM/BmP+2KPvrcMft+dR/9zVI3YnzRIb5MySme/o2r6r1A3NrXUnh+j/1e7Wsyx1OFeUUNwSDIkh7+rU5SOBalyhEmbIn290h2NSaQrS/C/6snql1S1m1TYcWbij9WZKqHcRcdzdrtkatSn+eKNV+4msHsK0J+AiuNDvQplIo/0WqPo9y+ZXoyd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB5926.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(83380400001)(6512007)(8676002)(6486002)(36756003)(5660300002)(2906002)(66556008)(66476007)(64756008)(8936002)(76116006)(66446008)(66946007)(71200400001)(2616005)(86362001)(186003)(6916009)(316002)(26005)(33656002)(6506007)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?dk5RZ25Vd3hEKy9JL0c2RmFVSGY0UEViZWZLTHFtb25OMFhjQzZUcEZVTGVv?=
 =?utf-8?B?QTRyZGphUis3VG5tVWRqUm5jQ3g1aHBBU3F1dWcxd1FIcWRQeTNZNTVxVkNK?=
 =?utf-8?B?ZEcrTGw1ak51S0pNNzNlYjFWN2NXWUZ1WHFnWGRmb0RTVTFkU1NyWS8yRGox?=
 =?utf-8?B?TFFtVmVZbFhOK21OSDBsb1pha0ZEWlQ5bU80bllSblEwbjU5N3ZOT0dVRFAy?=
 =?utf-8?B?SHFuQWRDVG5jclFpaFNxamV2a1ExU0NyQVFDRXhaOHdyNHJOWkM0U3pHM2Z6?=
 =?utf-8?B?VzFEZ2F3OGcwMW0rdUk1OVJUQkZOMHhNbmM0ZGVuT3IwY21XV1FsY3NGV2dt?=
 =?utf-8?B?ZCt6Y2cxZlJFYmFZZGF4RjRKaEp4LzRUaEcvQlpJZTRCRkk2emhRVm5hL09D?=
 =?utf-8?B?SmZieGgzNWgzUjBBQU9XWjJSSTJHWFd1eE5NY2VpL3dsQU1NSDVjbTJZVGd1?=
 =?utf-8?B?L1JIcXVWNWIwREk3R1ZLUm5VKzMyZjRjOG5COFZaZ2lWUTVZUEdNTUZUVVd0?=
 =?utf-8?B?TXFvTDFMUDRHRUJPSHo2bC9XbzAwNDBEYkdac2JuYm5JZENqdXZyT0oxSUZU?=
 =?utf-8?B?YTZpWnpnaEpqekJsU3ZuMm5UZXljM09EREFHN1Jhc1ROT09zZzhEdjd0Tjla?=
 =?utf-8?B?bXVtKzZLd3dZdUcvYnVkRllZQjRsN1pVcHF5SFBFYWR5OWoxTVBRZHZuTkxE?=
 =?utf-8?B?Rkt5cU0wT0I0Q2U4UER1a3kvcjJsWmQ2cnR1ay9mTzlSOHg4andyckRoTGp5?=
 =?utf-8?B?TzNWQmtiamJTeVJBTVlEWWtrbHAwTGpUeWR2OXJjMlNCVjZOOEoxVGtUYUV0?=
 =?utf-8?B?UzcwNkdRRGVHUTlDb244bUZvNzJtdnVBNUpkelRKaDJNTzhja3Z0UWoyRTA4?=
 =?utf-8?B?clljVFZqc1RMeE80eXpNSGEwYTJhSmQ5aENDeDZ3ZlZWUUI4TVg3ajNIaXkr?=
 =?utf-8?B?Vzl2Q1NLV0xRRm13TmNzc3BuWTNtYWIvSDdNbFkxMnZzd3VPQlVXSUlFd0sx?=
 =?utf-8?B?RG1nYnNSTFU3cSsyWjVSUG8zZHJpS01oVkE0VXdVTTNIcjZQN0RneWQ3Mzc2?=
 =?utf-8?B?aUU4NDZWZldzaEcrRzVKWUtXajZIOHJQc3hwaWt0b0JDZnZQVHgyTnUvWFVW?=
 =?utf-8?B?dVBPTk5VL0xMRU5LRFdWbzFPN0hzL3lVOWpRYTZ3QXliNW1aK0wzdWxqbklD?=
 =?utf-8?B?UXVJUmJKYWpiYnJDWnFVSTlGemNNSW5JSVhSWXdpbEtxaURKZm9HTHozVXMw?=
 =?utf-8?B?TWlQU3F5cGxRaTRDOHN1RkVvTHphSnY0VVhnTGpMMFNZR1Y1ZmxuSGhlT0Yz?=
 =?utf-8?Q?7o5DZdrbAfA/yV55G8xK67vMIDhcG7Uk+h?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5926.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544e8f2c-73fb-44d2-68f8-08d897a51fc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 16:04:33.0361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dhxE+2DaJSZT9PCSBPENKRD3b/DE56Itzjvrw26tHzQBCrEJMLyvUgGicy6tzcHGJ506bieyk26WKkT9qrlk8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7262
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AC1D10452AFE64F858736698E04841A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

UGluZw0KDQrvu79PbiAxMS8zMC8yMCwgMjowNyBQTSwgIm9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgb24gYmVoYWxmIG9mIENoYW5kYW5hIGthbGx1cmkgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmciIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIG9uIGJlaGFsZiBvZiBja2FsbHVyaT14aWxpbnguY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KDQogICAgVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gd2lsbCBhbHdheXMg
cGljayBhbiBleGlzdGluZyB0ZW1wbGF0ZWNvbmYuY2ZnIGlmDQogICAgcHJlc2VudCBlbHNlIGl0
IHdpbGwgdXNlIHRoZSBvbmUgZnJvbSBPRS4gIEEgdXNlciBtaWdodCBub3QgYWx3YXlzIHdhbnQg
dG8gcGljaw0KICAgIGFuIGV4aXN0aW5nIHRlbXBhbHRlY29uZi5jZmcgZXZlbiBpZiBpdHMgcHJl
c2VudC4gIEludHJvZHVjZQ0KICAgIENVU1RPTV9URU1QTEFURUNPTkYgdmFyaWFibGUgdG8gcHJv
dmlkZSBhbiBvcHRpb24gZm9yIHRoZSB1c2VyIHRvIHNwZWNpZnkgaWYgaGUNCiAgICB3YW50cyB0
byB1c2UgYW4gZXhpc3RpbmcgY3VzdG9tIHRlbXBsYXRlY29uZi5jZmcgb3Igbm90DQoNCiAgICBJ
ZiBDVVNUT01fVEVNUExBVEVDT05GPT0nMScgdGhlbiBlbmFibGUgY3VzdG9tIHRlbXBsYXRlY29u
Zi5jZmcuIEJ5IGRlZmF1bHQNCiAgICBDVVNUT01fVEVNUExBVEVDT05GIGlzIHNldCB0byAnMCcN
Cg0KICAgIFNpZ25lZC1vZmYtYnk6IFNhaSBIYXJpIENoYW5kYW5hIEthbGx1cmkgPGNoYW5kYW5h
LmthbGx1cmlAeGlsaW54LmNvbT4NCiAgICAtLS0NCiAgICAgbWV0YS9jbGFzc2VzL3BvcHVsYXRl
X3Nka19leHQuYmJjbGFzcyB8IDYgKysrKystDQogICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KICAgIGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMv
cG9wdWxhdGVfc2RrX2V4dC5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3BvcHVsYXRlX3Nka19leHQu
YmJjbGFzcw0KICAgIGluZGV4IDZmMzViNjEuLmQxZjYxZDUgMTAwNjQ0DQogICAgLS0tIGEvbWV0
YS9jbGFzc2VzL3BvcHVsYXRlX3Nka19leHQuYmJjbGFzcw0KICAgICsrKyBiL21ldGEvY2xhc3Nl
cy9wb3B1bGF0ZV9zZGtfZXh0LmJiY2xhc3MNCiAgICBAQCAtMjQsNiArMjQsNyBAQCBTREtfSU5D
TFVERV9OQVRJVkVTREsgPz0gIjAiDQogICAgIFNES19JTkNMVURFX0JVSUxEVE9PTFMgPz0gJzEn
DQoNCiAgICAgU0RLX1JFQ1JERVBfVEFTS1MgPz0gIiINCiAgICArQ1VTVE9NX1RFTVBMQVRFQ09O
RiA/PSAiMCINCg0KICAgICBTREtfTE9DQUxfQ09ORl9XSElURUxJU1QgPz0gIiINCiAgICAgU0RL
X0xPQ0FMX0NPTkZfQkxBQ0tMSVNUID89ICJDT05GX1ZFUlNJT04gXA0KICAgIEBAIC0xOTksNiAr
MjAwLDkgQEAgcHl0aG9uIGNvcHlfYnVpbGRzeXN0ZW0gKCkgew0KICAgICAgICAgYnVpbGRzeXN0
ZW0gPSBvZS5jb3B5X2J1aWxkc3lzdGVtLkJ1aWxkU3lzdGVtKCdleHRlbnNpYmxlIFNESycsIGQp
DQogICAgICAgICBiYXNlb3V0cGF0aCA9IGQuZ2V0VmFyKCdTREtfT1VUUFVUJykgKyAnLycgKyBk
LmdldFZhcignU0RLUEFUSCcpDQoNCiAgICArICAgICNjaGVjayBpZiBjdXN0b21lIHRlbXBsYXRl
Y29uZiBwYXRoIGlzIHNldA0KICAgICsgICAgdXNlX2N1c3RvbV90ZW1wbGF0ZWNvbmYgPSBkLmdl
dFZhcignQ1VTVE9NX1RFTVBMQVRFQ09ORicpDQogICAgKw0KICAgICAgICAgIyBEZXRlcm1pbmUg
aWYgd2UncmUgYnVpbGRpbmcgYSBkZXJpdmF0aXZlIGV4dGVuc2libGUgU0RLIChmcm9tIGRldnRv
b2wgYnVpbGQtc2RrKQ0KICAgICAgICAgZGVyaXZhdGl2ZSA9IChkLmdldFZhcignU0RLX0RFUklW
QVRJVkUnKSBvciAnJykgPT0gJzEnDQogICAgICAgICBpZiBkZXJpdmF0aXZlOg0KICAgIEBAIC0z
OTAsNyArMzk0LDcgQEAgcHl0aG9uIGNvcHlfYnVpbGRzeXN0ZW0gKCkgew0KICAgICAgICAgICAg
IHNodXRpbC5jb3B5ZmlsZShidWlsZGRpciArICcvY2FjaGUvYmJfdW5paGFzaGVzLmRhdCcsIGJh
c2VvdXRwYXRoICsgJy9jYWNoZS9iYl91bmloYXNoZXMuZGF0JykNCg0KICAgICAgICAgIyBVc2Ug
dGVtcGxhdGVjb25mLmNmZyBmaWxlIGZyb20gYnVpbGRkaXIgaWYgZXhpc3RzDQogICAgLSAgICBp
ZiBvcy5wYXRoLmV4aXN0cyhidWlsZGRpciArICcvY29uZi90ZW1wbGF0ZWNvbmYuY2ZnJyk6DQog
ICAgKyAgICBpZiBvcy5wYXRoLmV4aXN0cyhidWlsZGRpciArICcvY29uZi90ZW1wbGF0ZWNvbmYu
Y2ZnJykgYW5kIHVzZV9jdXN0b21fdGVtcGxhdGVjb25mID09ICcxJzoNCiAgICAgICAgICAgICBz
aHV0aWwuY29weWZpbGUoYnVpbGRkaXIgKyAnL2NvbmYvdGVtcGxhdGVjb25mLmNmZycsIGJhc2Vv
dXRwYXRoICsgJy9jb25mL3RlbXBsYXRlY29uZi5jZmcnKQ0KICAgICAgICAgZWxzZToNCiAgICAg
ICAgICAgICAjIFdyaXRlIGEgdGVtcGxhdGVjb25mLmNmZw0KICAgIC0tIA0KICAgIDIuNy40DQoN
Cg0K
