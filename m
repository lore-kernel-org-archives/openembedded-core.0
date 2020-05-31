Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.42])
 by mx.groups.io with SMTP id smtpd.web11.20455.1590949265263256572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 11:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Vqz7BNgV;
 spf=pass (domain: windriver.com, ip: 40.107.223.42, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Isg01GcC5sHD5JxIoPtMih5wF9jdXHH4LQPygG12n0rlK+oB4CzeR5QnLtefD4ZpJMcCOEyfxY7+LQo0dCe9LUs+vWkSQzjikGnw1fNSCmRd0hryl6g6SFTW+qHW7HZ1YbdJLRnxKxc4teepJr5RwXCq6C4eDCz9a8m9w/p9hw0hPeh3677nnNrUqbA5fj0F3xF+eNaKdaiFjqACiN0nF8acjyL7q93N+FOhOY1lDL3NZzZfBbbB0AjaO8ANydMlToc/iyH0zuyCr1DBZkG5r94RUcm29MdQdA675WdvPK2oFIsa/7J9uULvm0GzyAVwBZ1Jl3q5SanE83GBJFuelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEnH65jclqWfLhT7gZs/MnXEVp+zwfl7izdIhSM1JNM=;
 b=iAWEPFNfxExUXTUEiHRGWhwEX2zQUbMQy1iiaScMs+9CWeXeB7xxGp53SYZ0+xex7BJ5CytIZJhN81a8bR1PYa3NspOY5+eEiJgoYIlQ10I5+PuQbjrKEdPn2XqFju3Cdq86ZQa3kRrlRp043MOenOJ0WMbT4aAX43SqZvN5plx5KSesoyqrGm2PIXGCVlgVlu7UK5NYsDK9QnmWWeM3nxweIZ66jyRc+xrat+dEPGUcx+FVzp+/WQSX+Emd581xSLktd4x8Q/4t/IHfTb5YEUgFVsRZs/EbNNmOYHd3mQVIEZqChU8tSOB5y+URnEuUneyR8Lt26fx+BVJsrZX+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEnH65jclqWfLhT7gZs/MnXEVp+zwfl7izdIhSM1JNM=;
 b=Vqz7BNgVyMXV9ddK9I88pTBhRsHXZy7TDImD40Z7UJsHylA9IX88SY1I86TY2K7kXI3RIRCO3rC/mfjxr7DPOz3R16+4lyPk/7dvS2QiSgrg8ACYBn00kiWi+G8/emUMEGwUIySXHS7J+/hEhejPlHLRVxzrWQCoLcLayeHbYIo=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB3880.namprd11.prod.outlook.com (2603:10b6:a03:184::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Sun, 31 May
 2020 18:21:03 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::2c89:3733:2dbb:3a8d]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::2c89:3733:2dbb:3a8d%4]) with mapi id 15.20.3045.024; Sun, 31 May 2020
 18:21:02 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [oe-core][PATCH 1/1] qemu: force target build type to production
Thread-Topic: [oe-core][PATCH 1/1] qemu: force target build type to production
Thread-Index: AQHWNf+LMIGGFsr+/k2HCThgObF0EajB8qwAgACRc9A=
Date: Sun, 31 May 2020 18:21:01 +0000
Message-ID: 
 <BY5PR11MB399216FB780D0B2A3448DFD7888D0@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20200529212429.145132-1-joe.slater@windriver.com>
 <b2c5a45e2ce62526052b472c80867500d4840a4e.camel@linuxfoundation.org>
In-Reply-To: 
 <b2c5a45e2ce62526052b472c80867500d4840a4e.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 752feab7-5713-4455-96b4-08d8058f6053
x-ms-traffictypediagnostic: BY5PR11MB3880:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BY5PR11MB3880CF527E87CA52ACF5B68C888D0@BY5PR11MB3880.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0420213CCD
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yO3MuMO+9nB9NqfSpsyQ/3AwPwM+yN2b1XD9oYV7pOHwYYVhuHhSfRosyUKBOkZysDMitiKkMBRpIlgahJ7RM/MGn6BOlhRUatEIY1H5zFFV1jGOlPq7AxkD6D+KrBptmTPvlNABfurmkULf0Z16p1/UTYtSNok+k9eSU2I9TSwRmSP0qw33D2belrgEPeU8WcGTsN31dvtVPSDtKGwFEW+9S1WIH6/Ckr6fm/XOnzg8XcdZUNbDbiptiLIweAKnHK9B5amKc17qmZ+2+7yjVs5ch3pdVM+fBZYUlrW4uZ42f6VaV8equvjJJPsKIenjZB6rJHIJCsZeDjuOLNgO0A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(39830400003)(366004)(136003)(396003)(8676002)(5660300002)(186003)(4326008)(66946007)(66476007)(64756008)(66446008)(66556008)(8936002)(316002)(76116006)(71200400001)(7696005)(110136005)(83380400001)(107886003)(55016002)(9686003)(2906002)(26005)(52536014)(478600001)(86362001)(33656002)(53546011)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 he+Lea2EVAPVePd1iB7VbRXlVjciM6LyJj7hU0ElUgETZ4FlVQb+O22tmcGujJUeridnwk0cB64l5l/rT7gvmDVeSgT6MBLCCT0uf3c/Wo/vc5cB7tzsrnkY5ntWiMibaqH6dLzHKqE/5zKsXJwcgkaG2g+sek3lVZYFS0A39ogSyt3i6Foq3/I6cgdWdK8jKMNCLAGU53NYZjq6nVKEFsrpbJ1FDLnHuewEFRx5V7/7ON5vWT1kf+PQAclLZh0zx/AbzzIsHxPv31KZu/xh3e/Hh9zjHwoTpcO78+KRRCwgBFsGjS9dfMjxtu/vMAzzW5EloodGqAnIKhDj7Hg1QPT4zh3m7218nDwx0sBjGBf1lt4p/CRMaIuOBr1pRU1vY3LDCgJYt5lgS1YDSlD0izSRYL3D+MKlP+6RfVm0/3cY5IHA4xSeIbH+L9+8U94MuE/OPDY9mVzSW9PmTK1ye58vImY855c/SkkKnRHPUKQ=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752feab7-5713-4455-96b4-08d8058f6053
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2020 18:21:02.2700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TnMHDVtR829qYd5MdIW9nouwCAkiyW8rHgZe5f4NOTZE76mgBzxFEZrSWXYfUM1QfUdqkGGQeUBQN3zq/FTbVqJxmeOuMq+Xdm2WE4ifU80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3880
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UWVtdS1uYXRpdmUsIG5vLCBidXQgbmF0aXZlc2RrLXFlbXUsIHllcy4gICBKb2UNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPiANClNlbnQ6IFN1bmRheSwgTWF5IDMxLCAyMDIwIDI6Mzkg
QU0NClRvOiBTbGF0ZXIsIEpvc2VwaCA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPjsgb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KQ2M6IE1hY0xlb2QsIFJhbmR5IDxS
YW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+DQpTdWJqZWN0OiBSZTogW29lLWNvcmVdW1BBVENI
IDEvMV0gcWVtdTogZm9yY2UgdGFyZ2V0IGJ1aWxkIHR5cGUgdG8gcHJvZHVjdGlvbg0KDQpPbiBG
cmksIDIwMjAtMDUtMjkgYXQgMTQ6MjQgLTA3MDAsIEpvZSBTbGF0ZXIgd3JvdGU6DQo+IHFlbXUg
d2lsbCBub3QgYnVpbGQgZm9yIC1PZyBvcHRpbWl6YXRpb24gYmVjYXVzZSBtYWNyb3MgaW4gbG9j
a2FibGUuaCANCj4gZG8gbm90IHdvcmsgYXMgZXhwZWN0ZWQuICBPdmVycmlkZSBERUJVR19CVUlM
RC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVy
LmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzQuMi4wLmJi
IHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV80LjIuMC5iYiANCj4gYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzQuMi4wLmJiDQo+IGluZGV4IGE0MDE4Y2M0
NDguLjkwYjIzMGQ2MmYgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXVfNC4yLjAuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV80
LjIuMC5iYg0KPiBAQCAtMTAsNiArMTAsMTAgQEAgREVQRU5EUyA9ICJnbGliLTIuMCB6bGliIHBp
eG1hbiBiaXNvbi1uYXRpdmUiDQo+ICANCj4gIFJERVBFTkRTXyR7UE59X2NsYXNzLXRhcmdldCAr
PSAiYmFzaCINCj4gIA0KPiArIyBEb2VzIG5vdCBjb21waWxlIGZvciAtT2cNCj4gKyMNCj4gK0RF
QlVHX0JVSUxEX2NsYXNzLXRhcmdldCA9ICIwIg0KDQpXb3VsZCBuYXRpdmUgYW5kIG5hdGl2ZXNk
ayBidWlsZHMgbm90IGhhdmUgdGhlIHNhbWUgaXNzdWU/DQoNCkNoZWVycywNCg0KUmljaGFyZA0K
DQo=
