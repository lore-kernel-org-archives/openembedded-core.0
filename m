Return-Path: <chris.laplante@agilent.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3280D7F8D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 20:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Bsn4iAzvHBTl/OBuXRRanx55YMjiJV8UhCvO7mDEMH3xgHSS1vi1aroL1JnQSrw2w77hXJ3rUEZRAqToGlpCG9IK9kOryZR8vWuIzeYvdvb9zTW3ZDsFe1lXn56lF2n/48P55hlbEkCKx5PjHQrXUw4WrNnira87OiuVe3/mReXMx/COXH7M+tUjek4lnrhqEGZqqTBW6z/9KJYpxTOgMgYlVff/C28mMPT6jfSBKpDRfzQwFYPB0qqr/E7xxWF4ppsjaGOZ3/pGJtMKPuCgDHF2ayBPNEMVQiNmOdPno0n0+JqcuEOVDoXOeCr86ptxEWjO0zn8YuLh6jkYJnmktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=e1dnXTSKK/8+UKCiP1nXrJg5+YBXg5ZJp581X440Ra4=;
	b=CyTrAFvKeXrJR6HpdH7ewggC+0di47jycYgbrM6uyWvivd60GMKhi1xKyjkiLCpSRiK+ncmze56aFVDsDBx0J0Ere8l/OzAqjKPFAAh/ZITf7VXhV9NWeLYsv946SoVqbTBQSSvXrvusbHMBYqqgTerJwXI0ec4Od3DDsdi+8eeSMntqgqw6G+M4nFk57M2FPwoTOF42YglSELVda+eRqHD11q3GwYxucRb5g9Jo5MqZ7mf+ImCqVWMadlq8Xkb2bJnlcqSqnxVpj7EhGfL5lDxILGPFKgKoPzfJFpJK3H6WzPy01+IL6cb2AYcwxULiCivelJPCTLYw5F8+095lsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=e1dnXTSKK/8+UKCiP1nXrJg5+YBXg5ZJp581X440Ra4=;
	b=D+O5SoTM55s4KnV5kzYZp/fogZG/rEwGea3tlWj4YuVmvsGc+AA2dVP7mG1Kh8amQzD/8s+M7jbwdQX0c3zdOtZ8FURjCvMNhb5eb+Nh9XerhMzqg/jIF2WNbL7c88+qalG5bqWkgkGA2cLaLrexJkK1zOIXBpqmmP4tplnHb3g=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1784.namprd12.prod.outlook.com (10.175.61.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.20; Thu, 16 Jan 2020 20:21:16 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2623.018;
	Thu, 16 Jan 2020 20:21:16 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Pascal Huerst <pascal.huerst@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Looking for a way to build latest tagged releases in
	recipes
Thread-Index: AQHVxtrVLP5ZK3dnBEaFuu03GmqUsqfiOsqAgAACogCAADZ9MIAJtE3AgADWm4CAAJUykIAAMtbw
Date: Thu, 16 Jan 2020 20:21:16 +0000
Message-ID: <CY4PR12MB165360D26B46F6A7220313238B360@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
	<d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
	<a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
	<CY4PR12MB1653B76238099F8FD42B7F228B350@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB16537AE4F18230211893EAFB8B370@CY4PR12MB1653.namprd12.prod.outlook.com>
	<5635f310-c6a0-1f4a-9fb9-05ac4813fdc1@gmail.com>
	<CY4PR12MB1653056C46459CD414FA9C578B360@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB1653056C46459CD414FA9C578B360@CY4PR12MB1653.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ff0e54e-df32-48b3-5a6d-08d79ac1a40c
x-ms-traffictypediagnostic: CY4PR12MB1784:
x-microsoft-antispam-prvs: <CY4PR12MB17840A3BFF4C427FD163F3168B360@CY4PR12MB1784.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39860400002)(396003)(136003)(376002)(346002)(29502001)(189003)(199004)(8676002)(2906002)(81156014)(52536014)(81166006)(9686003)(110136005)(55016002)(316002)(8936002)(26005)(186003)(2940100002)(7696005)(478600001)(86362001)(6506007)(66476007)(4326008)(66446008)(76116006)(66556008)(66946007)(33656002)(966005)(64756008)(71200400001)(5660300002)(43043002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1784;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h7vmNIvTOKLUUOk9vdS8YnmiRGEvBzNgbzzyEr+nB/DXj+wogJ9zIpleSb/0ERzuba3DqVJEvrWme1i8Qoa3I43htvJjEk9Phi+e2syKOruDZIlr24UjIGYEEs42cz4YE8hHBXBMUjyYLGi3AJU18EZS9npQc5CNzCh22qP9HlW3ctXfjlKpKQEJEQG0+3dJrHPhLBIMs9P0/Jw0RhBXEDH1y3W3Kz+DfGGohv4KeXQH83KcXToJrkKpeIrSFyRqzZHosmbLtnB+J+QLnY+gfbOl5XWgMHelJ217G4vhnrjiw0bZE1xO1JwbjanmZKsW8OHYHNnrMtHevE7McZ1C/jb9Hw0T35bCg5OYhUSchAhH3HfXqphiPYqfHrIgFWKLhkHGh8uUH2JjTHOQVHRpo4ab/YscHszH6OaF4Gt72p5fDUtWuMh5sqfs3+p7B+rMtOiJvnvvucBub3Wyn41hDKC39zHXXBjgQpfouLVvU0sxbQVcMXONwXsVfx1H7/9ARfmrQ3+SAznT7fJtQDwFaIs1sNMgpmR7cwX6Lx9LLS/uV3xpd+m6wOXl8lU5la9v
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff0e54e-df32-48b3-5a6d-08d79ac1a40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 20:21:16.6393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMohn+I88L4iuy5D84JshwnOPZtajTWBr5JpQeaZxu+ava/+8R30gdwAQxby+jtPOoGlmyjpBs153xS5VOhXuuP+FXvpdzYFmJNAPVvZtMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1784
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Thu, 16 Jan 2020 20:21:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBUT0RPOg0KPiANCj4gKiBSaWdodCBub3csIHRoZSBjbGFzcyB0cmlnZ2VycyBhIGJhc2UgZW52
aXJvbm1lbnQgY2hhbmdlIGV2ZXJ5IHRpbWUsIHdoaWNoIG1lYW5zIEJpdEJha2UgYWx3YXlzIHJl
cGFyc2VzIGV2ZXJ5IHJlY2lwZS4gSSBndWVzcyB0aGlzDQo+IGlzIGJlY2F1c2UgSSdtIG1vZGlm
eWluZyB0aGUgZGF0YXN0b3JlIHdoZW4gSSBnZXQgYmIuZXZlbnQuQ29uZmlnUGFyc2VkIGFuZCBi
Yi5ldmVudC5NdWx0aUNvbmZpZ1BhcnNlZCwgaW4gb3JkZXIgdG8gZW5zdXJlDQo+IFJFVlJFQ09S
RF9EQVRFVElNRSBpcyB0aGUgc2FtZSBhY3Jvc3MgYWxsIGNvbmZpZ3VyYXRpb25zIHdoZW4gbXVs
dGljb25maWcgaXMgYWN0aXZlLiBQZXJoYXBzIHRoZXJlIGlzIGEgbW9yZSBlbGVnYW50IHdheSB0
byBkbw0KPiB0aGlzIHRoYXQgd29uJ3QgdHJpZ2dlciB0aGUgZW52aXJvbm1lbnQgY2hhbmdlPyBU
byBiZSBmYWlyIEkgdGhpbmsgaW4gbW9zdCBjYXNlcyB5b3Ugd29uJ3QgY2FyZSwgc2luY2UgSSBl
eHBlY3QgdGhpcyBjbGFzcyB0byBtYWlubHkgYmUNCj4gdXNlZCBpbiBhIGNvbnRpbnVvdXMgaW50
ZWdyYXRpb24gZW52aXJvbm1lbnQgd2hlcmUgeW91J2xsIGJlIGRvaW5nIGEgY2xlYW4gYnVpbGQg
YW5kIGhhdmluZyB0byByZXBhcnNlIGV2ZXJ5dGhpbmcgYW55d2F5LiBCdXQgSQ0KPiBjb3VsZCBh
bHNvIHNlZSB0aGlzIGNsYXNzIGEgdXNlZnVsIHRvIHRoaW5nIHRvIGFsd2F5cyBoYXZlIGVuYWJs
ZWQsIGV2ZW4gZm9yIHBlcnNvbmFsIGJ1aWxkcywgYW5kIGluIHRoYXQgY2FzZSBvYnZpb3VzbHkg
SSdkIHdhbnQgdG8gZml4DQo+IHRoaXMgaXNzdWUuDQo+ICogV2hlbiBtdWx0aWNvbmZpZyBpcyBh
Y3RpdmUsIEkgd291bGQgYWxzbyBsaWtlIGEgImdsb2JhbCIgcmV2cy5pbmMgdG8gYmUgZ2VuZXJh
dGVkLCB3aGljaCBpcyB0aGUgcHJvZHVjdCBvZiBhZ2dyZWdhdGVkIHRoZSAicmV2cy5pbmMiIGZv
cg0KPiBhbGwgdGhlIG11bHRpY29uZmlncy4gU3RpbGwgbmVlZCB0byB0aGluayBhYm91dCBob3cg
ZXhhY3RseSB0aGlzIHdpbGwgd29yayBpbiB0aGUgZmFjZSBvZiBjb25mbGljdGluZyBTUkNSRVZz
Lg0KPiAqIFdlIGhhdmUgYSB1c2UgY2FzZSBmb3IgSlNPTiBmb3JtYXQgZGF0YSBhcyB3ZWxsICgi
cmV2cy5qc29uIikgLSBJJ2xsIGFkZCB0aGF0IHRvby4NCj4gKiBQb3NzaWJseSBhIHNtYWxsIHRp
bmZvaWwgc2NyaXB0IHRoYXQgc2ltcGx5IGF1dG9tYXRlcyB0aGUgdGFzayBvZiBJTkhFUklUJ2lu
ZyB0aGlzIGNsYXNzLCBwYXJzaW5nIGFsbCB0aGUgcmVjaXBlcywgYW5kIHRoZW4gZHVtcGluZw0K
PiByZXZzLmluYy4NCg0KQ3Jvc3MgdGhlIGZpcnN0IFRPRE8gb2ZmIHRoZSBsaXN0OiBodHRwczov
L2dpc3QuZ2l0aHViLmNvbS9tb3N0dGhpbmdzd2ViLzM5ZTI0YjMyOWRlNzBjMDIxMmU1YmYyMWE0
MzFlMTQzLzhkMWE1ZjUxYjNjMGJmMjYwYzczMGVkNTcxNmQ5ODA3Yzc4MzM1YjgNCg0KKEJUVyBl
dmVudHVhbGx5IEkgd2lsbCBtb3ZlIHRoaXMgdG8gcG9reS1jb250cmliOyBnaXN0IGlzIGp1c3Qg
bW9yZSBjb252ZW5pZW50IGZvciBtZSBmb3IgdGhlIHNob3J0IHRlcm0uIElmIHRoZXJlJ3MgYSBk
ZXNpcmUgZm9yIGl0IHRvIGhhcHBlbiBzb29uZXIgbGV0IG1lIGtub3cuKQ0KDQpDaHJpcw0K

