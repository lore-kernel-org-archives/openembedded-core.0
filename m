Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.49])
 by mx.groups.io with SMTP id smtpd.web11.4181.1587395722407370350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 08:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=Xza13D9+;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.49, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ4TupmlTNOhVLbD2KzOvIm4LQtkhL34zXIv4+kwuVodKSs5UTDMuyn1XR5hTWW4jfCs3l8rGhr8wiT6VeUJGtnqcbDkTcMIIX71JE5q1C7i3O8fSdR3hlcQI/VT4emgBgwuwDfEFfe6XdJTYxvzi4b7hjwrK4eX0vtGngHwT4zEUBT+M4GKXGrMNIgRxFYm0UGJANcFt7J8YAkdNfOkfE6JcJP8L3EhmeQVO0vbhxgEAfwpIqd+Lb2mPptS5NCKOikD+gi2aq6IhjcbZt8EkvOn+XqNrZKHRlkclInv1wNZeBR1HVjxIhq0t85RJjHRtGunw/zDgGkQZxkuaiNRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AhTpXSEt1xxliai9mw6fb0Xo0Ta+i4RDjYX+3G/PX4=;
 b=nCB5vjZkG7C1uoGRyytPhqIPkAw1MRseL9+vj/KcIniAYlvOBtYZ3KZh0aSlV6mMO251l13FQaISyQXOe8/ze8tXztltgr7UPE+/Xv2bgk5TJ3dpO7/f2AYdNW90Kbn6u8jX/8HGTR/RlJuLdAYGKbwjyUaIWnTY0JUgJwK3BsuwSLoc7UtLX93HiC6hnrC/QPOBSYvZ4hdLX6e/xRcVwqP57Q45rT/8F1+EIS6rNpPq3C+AHKXNKU6DPS5Berluh1ERgKt76PBsvmH1xthdJ0UiuftNSS/vA+GphRAAxEMMbYGGmxUexj+e64p6rwU+nlnIhOAGstdf30ZlCHtMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AhTpXSEt1xxliai9mw6fb0Xo0Ta+i4RDjYX+3G/PX4=;
 b=Xza13D9+dnlKl7AJY6LymWbCWI3XMwYs5YhP5i2oobC7X4cExqZQeA9PskP1voM3KftXHKHlL/krIjYQgtrr7SW6Uys1zfths9GHbHkQFpzREISTNJTz5p5vfWQJFxFE2H/YoZ/SWdEuuUIsAaYjYZaiJTQVBCpKQKR6D9pWSAg=
Received: from DM5PR12MB2471.namprd12.prod.outlook.com (2603:10b6:4:b5::10) by
 DM5PR12MB1178.namprd12.prod.outlook.com (2603:10b6:3:6c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25; Mon, 20 Apr 2020 15:15:21 +0000
Received: from DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab]) by DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab%5]) with mapi id 15.20.2921.030; Mon, 20 Apr 2020
 15:15:21 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Uninative for i386 native tool?
Thread-Topic: [OE-core] Uninative for i386 native tool?
Thread-Index: 
 AdYWkVM2trCb21KjTGaQ4NZX8woV6AAAwS0AAAATDeAAAN0CgAAgydzwAABMtAAAAnWX8A==
Date: Mon, 20 Apr 2020 15:15:20 +0000
Message-ID: 
 <DM5PR12MB2471393B012A652B914918A58BD40@DM5PR12MB2471.namprd12.prod.outlook.com>
References: 
 <DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
	 <DM5PR12MB2471B5B5A25824BCF32B57DA8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <207860401ddfafd8de45143986549873935deff7.camel@linuxfoundation.org>
	 <DM5PR12MB2471EFA4F9009E30FF859FC28BD40@DM5PR12MB2471.namprd12.prod.outlook.com>
 <867b96d7dbaa0d7605aa9328b6fc9f88ec613d22.camel@linuxfoundation.org>
In-Reply-To: 
 <867b96d7dbaa0d7605aa9328b6fc9f88ec613d22.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a95f239-6ab5-4871-7a8d-08d7e53da470
x-ms-traffictypediagnostic: DM5PR12MB1178:
x-microsoft-antispam-prvs: 
 <DM5PR12MB11788E0D28BFFE80FB6033638BD40@DM5PR12MB1178.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2471.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(39860400002)(376002)(346002)(136003)(366004)(29502001)(2906002)(6506007)(8936002)(4326008)(26005)(316002)(110136005)(66446008)(81156014)(66476007)(66946007)(64756008)(66556008)(71200400001)(8676002)(7696005)(186003)(55016002)(9686003)(86362001)(5660300002)(33656002)(52536014)(478600001)(76116006)(4744005);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: agilent.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6xFttGzSCvOaGMME84aAhf43oIc9UthJcNRIqYnh2dzqlcVYmHbGpNfmbIGghtGjOwpKkpkkPZx/wxopXZUl6uHjEHdfGvlLjz5rOkhJfKgBSmsudZ1w2OF+Yi68fAYofc2dTCJLXAK93G8BA7BGdPS1pt3OeGDTq5PBQAGuc6TG7vcrU9JhwRJC+2pX19eIdEolFnXu20dmKffKFk9YWAkC7iExk/qoBlNaA6KG3MDqnMwF2mvKjh97Tz5Z4IOwtOGy0rQY/8f78LO9p8v0V3rz7YSzQcJp055XP/+hJYJzdOzLXBaJIRAYNV60s7c73RQ4GPTCvbAV5LugASCmIvXai8ZruS0d+vYIUOPKbRJWtHBiBK0PNT/cvOdShCDDnfrEgNpbhIQ/gyOE+LnKnDMLIG52rh0R87aUpGKEm7gUIBGbZ+UYxis6y0NFukQmqsTeJgyXStw6p1bWCokRuC9HeRyz3R82/eYygdw64CvxPuFcZT0xXij0uqC5zJ9B
x-ms-exchange-antispam-messagedata: 
 xyEMtCZ1/X0tJBbfoPUnCyUOUtiz/gypBOMYYcMNt5WEAHamumvszMzIWIvy4yFew35hh7Pj2YsKzhDIvKJa0k1o4bZf3tTlzOMcyKmkRhkNj7CWoKaD4VHJiNPffuyRHrAiEoagGX6ih7XUK/P57g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a95f239-6ab5-4871-7a8d-08d7e53da470
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 15:15:20.9505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhzAftIIKdSFllM4IfYBO7VFoBE/G1y51c94m+plVYm8/SRSHcYJ/1DK43i/4fZtk8gn1X0bP8SXwG/mPkGJmSI1P/jrjKmCuvkL/Cjva2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1178
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBUaGVyZSBpcyBhIG5vbi1oeXBvdGhldGljYWwgaTM4NiBsb2FkZXIsIGl0IGFscmVhZHkgZXhp
c3RzLg0KPiBVbmZvcnR1bmF0ZWx5IHRoZSBsb2FkZXIgaGFzIHRvIGJlIGRvd25sb2FkZWQgYW5k
IGV4dHJhY3RlZCBpbiBwbGFjZQ0KPiBiZWZvcmUgYW55dGhpbmcgZ2V0cyBydW4gc28gaXQgYWxs
IGhhcHBlbnMgdmVyeSBlYXJseS4gSXRzIGRvbmUgY2VudHJhbGx5IHdpdGgNCj4gb25lIHVuaW5h
dGl2ZSwgbm90IHR3byBvciBwZXIgcmVjaXBlLg0KPiANCj4gSSB0aGluayB5b3UgbWlnaHQgYmUg
YWJsZSB0byBkbyBzb21ldGhpbmcgbGlrZToNCj4gDQo+IFNTVEFURVBPU1RVTlBBQ0tGVU5DU19y
ZW1vdmVfcG4tbXl0b29sID0gInVuaW5hdGl2ZV9jaGFuZ2VpbnRlcnAiDQo+IA0KPiBhbmQgaXQg
bWF5IGF0IGxlYXN0IHN0b3AgYnJlYWtpbmcgaXQuLi4NCg0KV2hhdCBpZiB3ZSB0YXVnaHQgdW5p
bmF0aXZlIGhvdyB0byBpZGVudGlmeSB3aGV0aGVyIGl0IGlzIGFwcHJvcHJpYXRlIHRvIGNoYW5n
ZSB0aGUgbG9hZGVyIGZvciB0aGUgZXhlY3V0YWJsZT8gSWYgbm90LCBpdCBjb3VsZCAobWF5YmUg
Y29uZmlndXJhYmx5KSBhdm9pZCBkb2luZyBzbyBhbmQvb3IgZ2l2ZSBhIHdhcm5pbmcuICANCg0K
Q2hyaXMgDQo=
