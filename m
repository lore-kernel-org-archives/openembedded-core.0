Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.80])
 by mx.groups.io with SMTP id smtpd.web12.6188.1587736792336457467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 06:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=VbHp0gAN;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.77.80, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn46llaCeI/WvB40xt4V6REELUtxOLreYyho+QsfvMeAZY1QOu3sfb0tCy3tjLB6yJqLoDGjU6b4UkUncSHsdO9onU6nn0kSWIvxDtf5RsOUPPEBSGTZDv0n9nPsgvPtDwudcjnQ+yJcUwkQgHDJLB1qlxAhbosOGLKyzgu+BQpVTe1kyEj3YCmOYfZcLj3CJlDCWX5XMOOpiboU65IXnu11H/91QIjXbdh32mzBolcOeFgrRbARihwdC72wAmOj6y/m6qyYELVdMxkh4ba4I5d5MgNNYSzy5ocwWjCf4oPZAXc0NyMxVr5cw/6TL8g3SchcGNn9+5lyQD1j27rQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/e/bilDMSS12oKXT7wUvoj8087DgizV43e/x7XaEP4=;
 b=KKjtGzFQtejqzLzCvUlncMgKRb6ZQO/gawW9McRjfnqtmWqSQvKo9ETwiZG09C7QPwHkOGEYlFksxLZUfbRwkIsuo64569L6UUJIjm6vsR9uiN7Gu3+23P0X3HGUc7nk0LJB5sQfKs3fBG098oL7DAwpx9adnbg3VdnnAttlG21nL9wUvYLohbzZUhMNv6s3kcsOrKi0awKYCrRagb5sicX3rxiTKMD6jUo3R5F9AnQrmV6fPvbKkMiYCYih9mAe8VDHGsUDrWl1xHqOdCEal658/WZfzj1b5wXdLAPknMlX2MoM47Dl4ufbX8uIEZUvGKno0mxNVO28k8iRk060Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/e/bilDMSS12oKXT7wUvoj8087DgizV43e/x7XaEP4=;
 b=VbHp0gANog2q9nkJFodQfNAavAJ2URFhrUx9toc/YdkrHOhHF+v1uxcCkc3WgMHlRg/AeP2WDxg1qhfYZvbPsILBwp0YQELehk+d+LP+p7yv8LZYrbeLc5v4zWCGu139anrtgDymQFhUEAzJKrCp358WSU/38q/qPzY/QF3pTE0=
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SN1PR12MB2350.namprd12.prod.outlook.com (2603:10b6:802:24::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 13:59:51 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::b1d0:1320:b3eb:183c]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::b1d0:1320:b3eb:183c%2]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 13:59:51 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Changing DISTRO_FEATURES / build directory
Thread-Topic: [OE-core] Changing DISTRO_FEATURES / build directory
Thread-Index: AdYZoreS4f0qd/lxRTy9wl3fvQ25kwAJjeOAAB1wovA=
Date: Fri, 24 Apr 2020 13:59:50 +0000
Message-ID: 
 <SN1PR12MB248000E2856984F4FEAB95708BD00@SN1PR12MB2480.namprd12.prod.outlook.com>
References: 
 <SN1PR12MB2480D4132DF632E5161532E38BD30@SN1PR12MB2480.namprd12.prod.outlook.com>
 <f73b90e0d744276d6929bb39518a962dc07e3e4b.camel@linuxfoundation.org>
In-Reply-To: 
 <f73b90e0d744276d6929bb39518a962dc07e3e4b.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 278df138-90d0-43f4-abf7-08d7e857c1fc
x-ms-traffictypediagnostic: SN1PR12MB2350:
x-microsoft-antispam-prvs: 
 <SN1PR12MB2350CFA2355C3203B682E0178BD00@SN1PR12MB2350.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03838E948C
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(376002)(136003)(396003)(39860400002)(366004)(346002)(29502001)(66446008)(33656002)(81156014)(64756008)(2906002)(8676002)(9686003)(8936002)(86362001)(52536014)(6506007)(110136005)(7696005)(26005)(186003)(5660300002)(55016002)(478600001)(316002)(66476007)(66556008)(66946007)(71200400001)(76116006)(966005);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: agilent.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8Jpbq5vSHgvc3Vw0WMr4fRZgI8uk8sV2wRx8EBsahGMblt9ouhWVT/rgBeewOgtNRA14d3HgJ4tT6abvYI1yu8r8+dHxX5D2h0jPEWzNrAwS+/z8Qd4xyfyGEYgbiLrKoh93T3VCGnPNlc79TASxUauxuD/LiByzULPb+e1hIl5j+xxH8E6X65dn2D9WrfkalF+HjIlXBxI6Kgl3sqKbTarDYNdTYuW9qywrsJsSsCftrlJjiJrAtlpm3WaWwnPAC+MRvZ9U+8D9Eq0lh4q87y55COHe9tsM/sp65JC05QdlR7EPAP20wqZdHn0pphgZukgfS2xd7n1RIyB4EFL18A2kUwH2ZuwCPSOhxi1A1OidnkncMLOIRarRzgjQagXMVdt/xxy25ABSt64PgoTyO8RhfDC/45Hxgg6K5m/mWOa3SxXd7M8urCsUasrcjVUU3OT7/P5M+D6t2lqJaLCQIPvIecwmyig3llmVAD+OwtSRn9UFaH88Nh3XZ83v51aQcj8QDc+CPlBO618Yxzp+dYDnHXSc1Iw5CxsPljncdPm/fzIonrn5TfRTfLpIPTY8IuEiGLSi95rGIgBubqoDBg==
x-ms-exchange-antispam-messagedata: 
 T+7/f3D9SWolYH4NLBQeT5jdufAJt+Q36yaJTb/xK9EA4E6YzHx2o96DfqGS/gr+p4DFhBuqyfo/GGz8lN5w0fXMAnQeWWX/Yjhc2z5lRuVzfPS+0i6I7wZtng7PUBWTt/3vmyEYk3JOaiMmtIpp+g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278df138-90d0-43f4-abf7-08d7e857c1fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2020 13:59:50.9085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fj3BcXi00tITvezoGFR+SClpm3GAgj79EvCxA6l2n+Jm2ZTGjOQ5L3TNecTEkzTvplfy2qH//2z544GKA5vSPJjZa/8xqUu97pN/WDrhO4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2350
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IFNvLCBpcyBjaGFuZ2luZyBESVNUUk9fRkVBVFVSRVMgYnV0IG5vdCBjaGFuZ2luZyB0aGUg
YnVpbGQgZGlyZWN0b3J5DQo+ID4gZXhwZWN0ZWQgdG8gd29yaz8NCj4gDQo+IFNob3VsZCB3b3Jr
IGJ1dCBoYXMgYnVncy4NCj4gDQo+IFRoZXJlIHdlcmUgc29tZSBmaXhlZCBhcm91bmQgdGhlIHRo
dWQvemV1cyB0aW1lZnJhbWUuDQo+IA0KPiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5v
cmcvc2hvd19idWcuY2dpP2lkPTEzNzAyDQo+IA0KPiBpcyBhIHJlY2VudGx5IHJlcG9ydGVkIG9u
ZSB0aGF0IGhhcyBwYXRjaGVzIGluIG1hc3Rlci1uZXh0IChib3RoIHRvIGZpeCBhbmQNCj4gYWRk
IGEgdGVzdCBjYXNlKS4NCj4gDQo+IElzIHRoZXJlIGEgZmFpbHVyZSB3aXRoIHJlcHJvZHVjZXIg
eW91IGhhdmU/IFdoaWNoIHJlbGVhc2U/DQoNCkkgaGF2ZW4ndCBlbmNvdW50ZXJlZCBhbnkgYnVn
cyB5ZXQsIG5vLiBJIGFtIHdvcmtpbmcgb24gYWRkaW5nIHNvbWUgY3VzdG9tIERJU1RST19GRUFU
VVJFUyB0byBvdXIgZGlzdHJvLiBJIHdhcyB0cnlpbmcgdG8gY29udmluY2UgbXlzZWxmIHdoZXRo
ZXIgdmFyZGVwcyBhcmUgbmVjZXNzYXJ5IGZvciBESVNUUk9fRkVBVFVSRVMsIGFuZCBjb3VsZG4n
dCBkZWNpZGUuIEZvciBpbnN0YW5jZSwgaWYgSSBoYXZlOg0KDQogICAgZG9fdW5wYWNrX2FwcGVu
ZCgpIHsNCiAgICAgICAgZWNobyAiJHtAYmIudXRpbHMuY29udGFpbnMoIkRJU1RST19GRUFUVVJF
UyIsICJteS1mZWF0dXJlIiwgInRydWUiLCAiZmFsc2UiLCBkKX0iID4+ICR7U30vd2hhdGV2ZXIN
CiAgICB9DQoNCmJpdGJha2UtZHVtcHNpZ3Mgb24gdGhlIGRvX3VucGFjayBzaWdkYXRhIHJldmVh
bHMgdGhhdCBESVNUUk9fRkVBVFVSRVMgaXMgKm5vdCogcGFydCBvZiB0aGUgdGFzayBkZXBlbmRl
bmNpZXMuIFNvIEkgd2FzIHdvbmRlcmluZyBpZiBJIG5lZWRlZCB0byBkbzoNCg0KICAgIGRvX3Vu
cGFja1t2YXJkZXBzXSArPSAiRElTVFJPX0ZFQVRVUkVTIg0KDQpidXQgbG9va2luZyBhcm91bmQg
cG9reSBhbmQgbWV0YS1vcGVuZW1iZWRkZWQsIEkgZG9uJ3Qgc2VlIGFueW9uZSBlbHNlIGRvaW5n
IHRoYXQga2luZCBvZiB0aGluZy4gDQoNClRoZSBpbnRlcmVzdGluZyB0aGluZyBpcyB0aGF0IHRo
ZSBiaXRiYWtlLWR1bXBzaWcgZG9lcyBoYXZlIHNvbWUgc3BlY2lhbCBsb29raW5nIERJU1RST19G
RUFUVVJFUyBvdXRwdXQsIHN1Y2ggYXM6DQoNCiAgICBESVNUUk9fRkVBVFVSRVN7dXNybWVyZ2V9
ID0gVW5zZXQNCiAgICBESVNUUk9fRkVBVFVSRVN7bXktZmVhdHVyZX0gPSBTZXQNCg0KU28gaXQg
c2VlbXMgdGhlcmUgaXMgc29tZSBESVNUUk9fRkVBVFVSRVMgc3BlY2lmaWMgcHJvY2Vzc2luZz8N
Cg0KSXQncyBhbHNvIHVuY2xlYXIgdG8gbWUgd2hldGhlciB0aGUgc2lnbmF0dXJlIGNvZGUgaXMg
YWJsZSB0byB1bmRlcnN0YW5kIGJiLnV0aWxzLmNvbnRhaW5zIGFuZCBhdXRvbWF0aWNhbGx5IHBs
dWNrIG91dCB0aGUgZmFjdCB0aGF0IERJU1RST19GRUFUVVJFUyBzaG91bGQgYmUgYWNjb3VudGVk
IGZvci4gDQoNClRoYW5rcywNCkNocmlzDQo=
