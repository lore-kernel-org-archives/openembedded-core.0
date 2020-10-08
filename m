Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.70])
 by mx.groups.io with SMTP id smtpd.web10.3181.1602178439267722992
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 10:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=soARLb9v;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.100.70, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3MCLZezeYfNWEfATZt867Ea+TNrAn+wD9nR0GIeYIhBwrD9+EEseIud3Z5/KqWRDU+J/R4+toiGduS4vyo3mjmzIhefR7EE+Cq0jKyfF13RMJ7DsJfaivI01AfqmOufgMOefBov7K8oTmevX4SQ0unU6sXrjk5aPB/1xX2qlv6ixqElLoVhVWobGgzTHdrb57YzgPJgSIvM4v/WkNMnrKPHgULTR4P3/S46a1ZBinTEpMJUmAOj1/BLXCDGGyuCPV+2cQGooq+rTTouMF6y/VhMUkdy1JynkvdsApUGTg4+vkA9HiRtdGNyIZXX9fUZG4+b8m20hOMNVVgMMJ83zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0N+zV1O3Y3+E+Y+NkNoqUydpKCngKkdAsUw7Qllnqw=;
 b=ZAbjHDNWYXzUbQQq/zbp6CPdyWUyY3kFTsd4jZ+5/1py0ubtkyykcQohsGvXj4ykfYPMAQyjfTCSXN9FMSJ/LtB39LKxgIGfLx+rtephD352XCUa0arwsx8bCsyjIwH9C+Xugx4QRLGnzIJeyiJATca0UX2oTJ2Ch4ZnRbIyPXrn2JWoV9lOIigks2SoC7xzEWNQURYuZMa1LyXD49mtvV9Ja1XMAID9g3spOhD7pEp7VlFS73uK9gokNDUNCmzPF7oHr5Zq41509id44N0iTuIGJFfnobY4WN5XdYMm7v/BmTMWKRliTcsL5Bvni39inaWdRJVHhLVKEm33QqnpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0N+zV1O3Y3+E+Y+NkNoqUydpKCngKkdAsUw7Qllnqw=;
 b=soARLb9vAuyAMHH0So3dUyadBM3n8g3TIkS/5ktTFmygx3qfm1LOLpPYL9cvILUxdiNRUK+ZCWoSaVb4a6cRo0Nq7i6C9BRSF5RoZCVq/ErVQOox+tjRecb/uXMd+IqMGs2Jj1gmfJ6mfW3Xs4hKPZFaQa6Xvadl+jYxcGZtnzntAkpkZYEOqVOpOJ6fV69bPZ60ujSJneC6zQClRsadhZKfIHQvXs/ootxETwAk/7Gwwdln7GebGjqG1IrxtkmWEOffzOaDI7la1w4Qvd9PiBJHHtyIM4gYk9Myo1pI+h4j+SAd65IBy3McZzMYJwMQe+LxRtyIO0JGfnm8ZGxweQ==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Thu, 8 Oct
 2020 17:33:57 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d%7]) with mapi id 15.20.3433.046; Thu, 8 Oct 2020
 17:33:57 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Joshua Watt <jpewhacker@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson: ensure out-of-tree build when under externalsrc/devtool
Thread-Topic: [OE-core] [PATCH] meson: ensure out-of-tree build when under
 externalsrc/devtool
Thread-Index: AQHWnMlMgJs8aNiUwUauCVp48BLudamMihCAgAFqNoCAAAMhgIAAAJlg
Date: Thu, 8 Oct 2020 17:33:57 +0000
Message-ID: 
 <SN1PR12MB2480AD9F30904A09A615B80F8B0B0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20201007164534.123373-1-chris.laplante@agilent.com>
 <15be7caa-aa27-1776-6f41-6ef0bd64a9fb@gmail.com>
 <SN1PR12MB2480E9CCDB9E862AA6A3700E8B0B0@SN1PR12MB2480.namprd12.prod.outlook.com>
 <CAJdd5GZ1q4RaoJeU=omX5kJ2f5OTgJZ3D6Y24aGY+94XMt-8-w@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GZ1q4RaoJeU=omX5kJ2f5OTgJZ3D6Y24aGY+94XMt-8-w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91aae6f6-c720-401a-147c-08d86bb05632
x-ms-traffictypediagnostic: SA0PR12MB4447:
x-microsoft-antispam-prvs: 
 <SA0PR12MB44474E875BE7F2DE8E902B8B8B0B0@SA0PR12MB4447.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oLoRQGKzGyLDqIwYKry8rp6d5n+rtFvFgopxdpyq0/2FPL8zxvZCU8gXNW86T3NuqvwVpnINOzZcm98/ykG5NkUYmqIF9MISTWcldou933Ancv5f3UAT13U56xq3fTJcAvQFOGR7SMZNzvMFVBxZxLmzoNp0pcVXMcbrFN7g5L1HcHrE7eaA+9emmAMbSurz5IaLs4NWEVb9aKYQ5hhkkDchY/GmSBayf7LmFgdYfbdtXjx6CkN9LC80WSq2Lrg6bKriAoB6n5QKNEeSkX+rmxmGd5qQ0sn4y5FCfa65qkGLmCjecV9CT8VGX7c/fV6HQjz2unaMoVhWqmD4DDAfqTJJAep+Uk8a2ErzZr1iBHu9wduUe9aHR70gaUKQDTjj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(29502001)(52536014)(2906002)(9686003)(86362001)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(71200400001)(33656002)(55016002)(8676002)(186003)(8936002)(26005)(7696005)(316002)(6506007)(478600001)(4326008)(110136005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 WU0CiY+ll+YuthCruyJge8mFwGB9qUY5EGLDfsXelh6SDbL4FnhJ4Yd8t0Z8+OPXEFGHeCr+zZZqAu7ICc+MuXEdXo5mj2/QDAM2Y06sw7Lku1Bxg4r/rv4seaGgXe/NZtweeVwlu30Ne8erGpxUVKrU+S2sXqWOm9DKTBGC+EjSWmRbsS8Xgcx39Judg1u49v2UTmDoiHT4TNlNmVXD0Zuu0hmuY4zjPBLr0CkHvdM20vaDT3DkdnPARJnh0+skoWe9IZGXONtEnApgVt3uqWy7lAaazHm5pYmN2ncpPfaW5QAx1xWA1HRQz2Ez/qDS4qevBzAG4amtsvm5Pd3t/1aejrnPwY5j9AlRG66Fgx8YTCHMdfQBoZrfFJwQg/GG+kCi/fiQYDeRGEGUIBHd0XFhv8fPdRm80ywh8rs1xmGB+hVCCmay77wPaF4JTiHe2mCe5fF+PLIA3XOO71m+IhWGyxeOkDJ8k0G0kjtbnc7R9I+Q2rwJO1CYCunZ49vDv0HSFs31sOiZep3XSG5HW4A/JJG5fc6YnIGCUbvPKBqOZu5Wr4AIAYKef3jzOrcZrdLvAmRur1qockOm9mAraPV57oLeRjwdpuOE2Uuy/t9KPrENGy/gmv8f+W+EFvtoifA4U4hH4q6QznchPXIdNQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91aae6f6-c720-401a-147c-08d86bb05632
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 17:33:57.6424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJEP9HFko16ucU51sIKJ0yEG6WBo0Vs13LhtCPsHDFT2q4glByIFxxAKDo2j88NxrXDa1AHIyy9HBmSb+r+FWDDMclcmkrpMjmDZwF7zImQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IEkgaGF2ZSBubyBpZGVhIHdoeSBkZXZ0b29sIGRvZXMgaXQgKGluIGdlbmVyYWwpLCBidXQg
aXQgZG9lcyAoc2VlDQo+IHBva3kvc2NyaXB0cy9saWIvZGV2dG9vbC9fX2luaXRfXy5weSwgdGhl
ICJ1c2VfZXh0ZXJuYWxfYnVpbGQiIG1ldGhvZCkuDQo+IEdyYW50ZWQgSSdtIHVzaW5nIHpldXMs
IGJ1dCBteSBleHBlcmllbmNlIGlzIG5vdCB0aGUgc2FtZSBhcyB5b3VycyBzbyBmYXIgLQ0KPiBt
eSBtZXNvbiByZWNpcGUgdHJpZXMgdG8gYnVpbGQgaW4gdGhlIHNvdXJjZSBkaXJlY3RvcnkuDQo+
IA0KPiBBaCwgc29ycnkuIEkgd2Fzbid0IHF1aXRlIGNsZWFyIGluIHdoYXQgSSB3YXMgYXNraW5n
IDopIFllcywgd2hhdCB5b3UgYXJlIHNlZWluZw0KPiBpcyB0aGUgZXhwZWN0ZWQgYmVoYXZpb3Ig
YmVjYXVzZSBkZXZvdG9sIGlzIHNldHRpbmcgRVhURVJOQUxTUkNfQlVJTEQgZm9yDQo+IHRoZSBy
ZWNpcGUuIE15IHF1ZXN0aW9uIGlzIHdoeSBkZXZ0b29sIGlzIGRvaW5nIHRoYXQgYXQgYWxsPyBU
aGUgZGVmYXVsdA0KPiBiZWhhdmlvciBpbiBleHRlcm5hbHNyYy5iYmNsYXNzIChhbmQgdGh1cywg
d2hhdCB5b3Ugd291bGQgZ2V0IGlmIGRldnRvb2wNCj4gKmRpZG4ndCogc2V0IEVYVEVSTkFMU1JD
X0JVSUxEKSwgaXMgdG8gZm9yY2UgYW4gb3V0IG9mIHRyZWUgYnVpbGQgYnkgc2V0dGluZw0KPiBC
IHRvIGEgc3ViZGlyZWN0b3J5IG9mICR7V09SS0RJUn0uIEl0IHNlZW1zIG1vcmUgYW5kIG1vcmUg
bGlrZSBvdXQtb2YtdHJlZQ0KPiBidWlsZHMgYXJlIHRoZSBub3JtLCBzbyBpbnN0ZWFkIG9mIGNo
YW5naW5nIGV2ZXJ5d2hlcmUgKHdhZiwgbWVzb24sIGV0IGFsLikNCj4gdG8gd29yayBhcm91bmQg
ZGV2dG9vbCBkb2luZyBhbiBpbi10cmVlIGJ1aWxkLCBjYW4gd2UgcmVtb3ZlIGRldnRvb2wNCj4g
c2V0dGluZyBFWFRFUk5BTFNSQ19CVUlMRCBzbyB0aGF0IGl0IGRlZmF1bHRzIHRvIGFuIG91dC1v
Zi10cmVlIGJ1aWxkPw0KDQpObyBwcm9ibGVtLCBJIHVuZGVyc3RhbmQgbm93IDopLiBZZXMsIEkn
ZCBjZXJ0YWlubHkgYmUgaW4gZmF2b3Igb2YgZGVmYXVsdGluZyB0byBvdXQtb2YtdHJlZSBidWls
ZHMuIEknbGwgcHVsbCBQYXVsIGluIGhlcmUgdG8gc2VlIGlmIGhlIGhhcyBhbnkgb2JqZWN0aW9u
cy4gDQoNCkNocmlzDQoNCg0K
