Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.66])
 by mx.groups.io with SMTP id smtpd.web11.9429.1604036672658071308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O0P6zRb2;
 spf=pass (domain: windriver.com, ip: 40.107.243.66, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egHckya5mNE3Pj9kyfJgaZyg7wmL5ziFvPcBwx90RmW1G7wDPSpirlNgx2sKTYnUPL/pXcj+OEGtJAa3MIA8Fbq+NJy9dSkv1P8BxTHLZvtIBqssya2XdVistPWyNUkfyeIa4PG6Ycb4r7YUzbeGQl4wVhBEJIDotqkqD0tBJkV0MJQ2UGcqlfQD5TMlrYOycZKuF8NAp4dF7scU+M2R1aHv7ja24Fc/fwdFwQS/kUFAdWihs6w726HPdgU7r9DSjhqipXaLQOOwJYT0udYbp7vr3UxEBVXFRlTFmjyLDiVs68LgX7tM0wJnNOsxnvkrYQSGuWE2UBiesSF6KCk4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzEgIvBAu8LuvRNxFxWd3M4LZtvul7ujBPOKLqJULIs=;
 b=bWO+oYThkNrlXzBKA5IJMLNk/dWdwljUAu2AHumMhARH2vX/FliZuWDxDJHSKFETRUUe/QgKHik34itlR8UJ5Hujy0UnUOEG7D4vs6h4jvUasnaE2br3vfStqrrvwvWKSl1r5iLWq8TPpkC5PJOO9xLAuUJgU0iF13Lx6nERg4CDP5o8JOU5ge36cZHO8SFcwOCfJRj5OjbF3I+u9JiM1OjCbuO4mJ8u1tll9KhfxpyqyEzfFOfhOEzoQEMR5VtwhlXecG8Ynx6qBWZC2p/VxaNRiQ4TOqrCPz2JA9asVItA1lT+W4xx88OoeyvE6SXd5UTVovRZs7Fbs1wwnYmuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzEgIvBAu8LuvRNxFxWd3M4LZtvul7ujBPOKLqJULIs=;
 b=O0P6zRb2c8rDvtX1EOrnixBwk9xTwrrKFCvoBaU+sozXkftUznogAN40HZG/6fI+7Y7PxIgd70RWNAmpXEIm4R9TvUJhTulChlNsZJykxnENp4jLkw5VN8pQaJIL+4aIR8mOaVqCt1CzXF72hFVQBnPtceBl+I+CwijE69YuuwI=
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 05:44:30 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::34d3:7c3f:9259:d3c5]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::34d3:7c3f:9259:d3c5%7]) with mapi id 15.20.3477.028; Fri, 30 Oct 2020
 05:44:30 +0000
From: "kai" <kai.kang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "obi@opendreambox.org"
	<obi@opendreambox.org>
Subject: =?UTF-8?B?5Zue5aSNOiBbUEFUQ0ggMS8xXSBzeXN0ZW1kLmJiY2xhc3M6IGNoZWNrIHdoZXRoZXIgc3lzdGVtY3RsIHdvcmtzIGluIHBvc3Qgc2NyaXB0cw==?=
Thread-Topic: [PATCH 1/1] systemd.bbclass: check whether systemctl works in
 post scripts
Thread-Index: AQHWrdWw6Y/QH7OD/0i2LN6quXbSo6mvotwu
Date: Fri, 30 Oct 2020 05:44:30 +0000
Message-ID: 
 <SN6PR11MB32949BC7A32C382634D011B295150@SN6PR11MB3294.namprd11.prod.outlook.com>
References: 
 <20201029092650.34868-1-kai.kang@windriver.com>,<20201029092650.34868-2-kai.kang@windriver.com>
In-Reply-To: <20201029092650.34868-2-kai.kang@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f81c077-5bdd-435e-f347-08d87c96df39
x-ms-traffictypediagnostic: SA2PR11MB5210:
x-microsoft-antispam-prvs: 
 <SA2PR11MB5210B1AF82E01B3A7FE4DF0595150@SA2PR11MB5210.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ycM8zu+COGLoy0M5TyuPtm6HROxjuFBAL91RdH5CrfLK60S6c8Stg0FW9xAylVdmin1kRz/LZQDwigZizAJkO8MLUz2lJmEdHemjabGhkef3PsOt1yEIsRsL4Wbzcl66z1E6+d9GggmkXY1cZknTbCWQ6am4Pvj+v+EcnZNrnbT0GceEQPzwrfN5wZzPZrHoxNHU+37eVliEloasbwAYPLF+pzLicJ6fL3P7CbiUfwW2fIyywXP1L+a7MYqdpUtBc2RZ1xSVgxnzf6ZwITHXPK5tduBHKSnopEdSCcIEQNpojGDxBMDzlxWmUV8zAqP4mBKg/wfl7it0GL3m7lyRcA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39850400004)(346002)(136003)(7696005)(316002)(86362001)(55016002)(19627405001)(224303003)(6506007)(33656002)(110136005)(8936002)(478600001)(83380400001)(26005)(91956017)(66946007)(76116006)(186003)(71200400001)(9686003)(2906002)(52536014)(5660300002)(64756008)(66476007)(66556008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 jP6axK+93RJ3YGOk89ZRxuKjT0FA/YbqHkR9xjvmLDtLl6L8MNkg9hrXmuW6+5ervx6LaXlk1zrIAt79yTQlg/EMbvl+9z3rmjzVhajQU8SW5dBABvaqAfx/jmkVMNp4i0lHdFuPr68nMb+AMwDebyhhcfDX+Y3wRq4OsmkGkmJw1bj9VcHQ6XYA3iPksGliPhIZI0mGCi9xk2vgKBe1ug4pGf/sPrfpTAMw3A4Ya6o99EQOXvmBtq6HohUSs/FuGztaxWeWxIx+Rq0208OywlFcu63Ci6q8jV1vQza+kEKesFJvNk1LnhX8KHaL1Ix8L60yJnKNVeqn6uAalpt33NYjsH+tyc1AK+IPc1r4cmFGj0w5Iz7yy2ZTkymlXzWWInWdiBpQDyTAlpdDpcYnH8mipdljJOmz9ACAUaGpbMcIC1RiICUQkg1ah/Qv28BHBU9gReqp6fefy9Gk5ovJFfcVPqaQroKWm6VK5WYOryOI3z7/76HkGbkP57Epezk8YnKVUNRF526XwpDB2DxVm2C6uxmgutLUtLMqDCaUYKeilaFRPqV/pDYyBGlQ21Tg+FMFvGyHTJwTXh0WKrLl078Ko96rdsKL779uv+++2gAjw8pV4cf24r9qsUu41bsNKHFkEqMZqePElZAVC+vr8Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f81c077-5bdd-435e-f347-08d87c96df39
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 05:44:30.3851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dU3qYfwDtaaoUBZqpISKOU0KPfXnzsMfEAh1C4wRryqyXQl4XDV9QIB4dqzTPOU0H1/W++QB1A1xAZEzjhaChQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB32949BC7A32C382634D011B295150SN6PR11MB3294namp_"

--_000_SN6PR11MB32949BC7A32C382634D011B295150SN6PR11MB3294namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQW5kcmVhcywNCg0KSSBhbSBzb3JyeSB0aGF0IG15IGVtYWlsIGNsaWVudCBnb2VzIHdyb25n
LiBTbyBJIGhhdmUgdG8gcmVwbHkgdGhpcyB3YXkuDQoNCj4+ICBzeXN0ZW1kX3Bvc3RpbnN0KCkg
ew0KPj4gLWlmIHR5cGUgc3lzdGVtY3RsID4vZGV2L251bGwgMj4vZGV2L251bGw7IHRoZW4NCj4+
ICtpZiBzeXN0ZW1jdGwgbGlzdC1tYWNoaW5lcyA+L2Rldi9udWxsIDI+L2Rldi9udWxsOyB0aGVu
DQo+PiAgICAgIE9QVFM9IiINCj4+DQo+PiAgICAgIGlmIFsgLW4gIiREIiBdOyB0aGVuDQo+DQo+
IFNob3VsZG4ndCB0aGlzIGFscmVhZHkgaGF2ZSBiZWVuIHJ1biBkdXJpbmcgaW1hZ2UgY29uc3Ry
dWN0aW9uPw0KPg0KPiBEb2Vzbid0IHRoaXMgYnJlYWsgb3VyIHN5c3RlbWN0bCBlbXVsYXRpb24g
KG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1zeXN0ZW1jdGwvc3lzdGVtY3RsKT8N
Cg0KVGhlIHVzZSBjYXNlIGlzIHNpbWlsYXIgd2l0aCBGZWRvcmEgb3IgRGViaWFuIHRoYXQgbW9k
aWZ5IGltYWdlIHdpdGgNCmNvbW1hbmQgZG5mLCBib3RoIG9uIHRoZSByZWFsIGJzcCBvciBjb250
YWluZXIuDQoNCkl0IGJyZWFrcyB0aGUgc3lzdGVtZC1zeXN0ZW1jdGwtbmF0aXZlIGluZGVlZC4g
VGhlIHJlYXNvbiB0byBydW4NCnN5c3RlbWN0bCB0byBjaGVjayB3aGV0aGVyIGl0IHJlYWxseSB3
b3JrcyBiZWNhdXNlIGl0IGZhaWxzIGluIGNvbnRhaW5lci4NCkFuZCBJIHN1cHBvc2UgJ3N5c3Rl
bWN0bCBsaXN0LW1hY2hpbmVzJyBpcyB0aGUgbW9zdCBxdWljayBzdWJjb21tYW5kIG9mDQpzeXN0
ZW1jdGwuIEhvdyBhYm91dCBhZGQgYSBzdHViIGZ1bmN0aW9uIHRvIHByb3ZpZGUgc3ViLWNvbW1v
bg0KbGlzdC1tYWNoaW5lcyBmb3Igc3lzdGVtZC1zeXN0ZW1jdGwtbmF0aXZlPw0KDQo+DQo+DQo+
PiBAQCAtNDgsNyArNDgsNyBAQCBmaQ0KPj4gIH0NCj4+DQo+PiAgc3lzdGVtZF9wcmVybSgpIHsN
Cj4+IC1pZiB0eXBlIHN5c3RlbWN0bCA+L2Rldi9udWxsIDI+L2Rldi9udWxsOyB0aGVuDQo+PiAr
aWYgc3lzdGVtY3RsIGxpc3QtbWFjaGluZXMgPi9kZXYvbnVsbCAyPi9kZXYvbnVsbDsgdGhlbg0K
Pj4gICAgICBpZiBbIC16ICIkRCIgXTsgdGhlbg0KPj4gICAgICAgICAgc3lzdGVtY3RsIHN0b3Ag
JHtTWVNURU1EX1NFUlZJQ0VfRVNDQVBFRH0NCj4+DQo+DQo+IFlvdSdyZSBydW5uaW5nIHRoZSBw
cmVybSBob29rIGluc2lkZSBhIGRvY2tlciBjb250YWluZXI/DQo+DQo+IFdvdWxkbid0IGl0IGJl
IG1vcmUgYXBwcm9wcmlhdGUgdG8gcmVtb3ZlIHRoZSBzeXN0ZW1kIERJU1RST19GRUFUVVJFIGZv
ciBhIHVzZS1jYXNlIGxpa2UgdGhpcz8NCg0KVGhlcmUgd2lsbCAgYWx3YXlzIGhhcyBhbiBpbml0
IG1hbmFnZXIgdGhlcmUgZm9yIG9lLWNvcmUuIEl0IHNob3VsZCB3b3JrDQpmb3IgYm90aCBzeXN2
aW5pdCBhbmQgc3lzdGVtZCB3aXRob3V0IGV4dHJhIGNvbmZpZ3VyZSB0byB1c2UgYXMgYSBkb2Nr
ZXINCmltYWdlLg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4NCg0KS2FpDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IEthbmcsIEthaSA8a2FpLmthbmdAd2lu
ZHJpdmVyLmNvbT4NCreiy83KsbzkOiAyMDIwxOoxMNTCMjnI1SAxNzoyNw0KytW8/sjLOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K1vfM4jogW1BBVENIIDEvMV0gc3lzdGVtZC5iYmNsYXNz
OiBjaGVjayB3aGV0aGVyIHN5c3RlbWN0bCB3b3JrcyBpbiBwb3N0IHNjcmlwdHMNCg0KRnJvbTog
S2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+DQoNCldoZW4gdXNlIGEgY29yZSBpbWFn
ZSB0YXJiYWxsIGFzIGEgZG9ja2VyIGltYWdlIHdpdGggJ2RvY2tlciBpbXBvcnQnLCBpdA0KZmFp
bHMgdG8gaW5zdGFsbC9yZW1vdmUgcGFja2FnZSB3aGljaCBjYWxscyBzeXN0ZW1jdGwgaW4gcG9z
dCBzY3JpcHRzLg0KQmVjYXVzZSBpdCBmYWlzIHRvIHJ1biBzeXN0ZW1jdGwgaW4gYSBjb250YWlu
ZXI6DQoNCmJhc2gtNS4wIyBzeXN0ZW1jdGwNClN5c3RlbSBoYXMgbm90IGJlZW4gYm9vdGVkIHdp
dGggc3lzdGVtZCBhcyBpbml0IHN5c3RlbSAoUElEIDEpLiBDYW4ndCBvcGVyYXRlLg0KRmFpbGVk
IHRvIGNvbm5lY3QgdG8gYnVzOiBIb3N0IGlzIGRvd24NCg0KUmVwbGFjZSAndHlwZSBzeXN0ZW1j
dGwnIHdpdGggJ3N5c3RlbWN0bCBsaXN0LW1hY2hpbmVzJyBpbiBwYWNrYWdlIHBvc3QNCnNjcmlw
dHMgdG8gY2hlY2sgd2hldGhlciBzeXN0ZW1jdGwgd29yayByYXRoZXIgdGhhbiBleGlzdGVuY2Uu
DQoNClNpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPg0KLS0t
DQogbWV0YS9jbGFzc2VzL3N5c3RlbWQuYmJjbGFzcyB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhL2Ns
YXNzZXMvc3lzdGVtZC5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3N5c3RlbWQuYmJjbGFzcw0KaW5k
ZXggOWU4YTgyYzlmMS4uOTkzODQyNWUyZCAxMDA2NDQNCi0tLSBhL21ldGEvY2xhc3Nlcy9zeXN0
ZW1kLmJiY2xhc3MNCisrKyBiL21ldGEvY2xhc3Nlcy9zeXN0ZW1kLmJiY2xhc3MNCkBAIC0yMyw3
ICsyMyw3IEBAIHB5dGhvbiBfX2Fub255bW91cygpIHsNCiB9DQoNCiBzeXN0ZW1kX3Bvc3RpbnN0
KCkgew0KLWlmIHR5cGUgc3lzdGVtY3RsID4vZGV2L251bGwgMj4vZGV2L251bGw7IHRoZW4NCitp
ZiBzeXN0ZW1jdGwgbGlzdC1tYWNoaW5lcyA+L2Rldi9udWxsIDI+L2Rldi9udWxsOyB0aGVuDQog
ICAgICAgICBPUFRTPSIiDQoNCiAgICAgICAgIGlmIFsgLW4gIiREIiBdOyB0aGVuDQpAQCAtNDgs
NyArNDgsNyBAQCBmaQ0KIH0NCg0KIHN5c3RlbWRfcHJlcm0oKSB7DQotaWYgdHlwZSBzeXN0ZW1j
dGwgPi9kZXYvbnVsbCAyPi9kZXYvbnVsbDsgdGhlbg0KK2lmIHN5c3RlbWN0bCBsaXN0LW1hY2hp
bmVzID4vZGV2L251bGwgMj4vZGV2L251bGw7IHRoZW4NCiAgICAgICAgIGlmIFsgLXogIiREIiBd
OyB0aGVuDQogICAgICAgICAgICAgICAgIHN5c3RlbWN0bCBzdG9wICR7U1lTVEVNRF9TRVJWSUNF
X0VTQ0FQRUR9DQoNCi0tDQoyLjE3LjENCg0K

--_000_SN6PR11MB32949BC7A32C382634D011B295150SN6PR11MB3294namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Andreas,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am sorry that my email client goes wrong. So I have to reply this way.</d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;systemd_postinst() {
<div>&gt;&gt; -if type systemctl &gt;/dev/null 2&gt;/dev/null; then </div>
<div>&gt;&gt; +if systemctl list-machines &gt;/dev/null 2&gt;/dev/null; the=
n </div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp;OPTS=3D&quot;&quot;</div>
<div>&gt;&gt; &nbsp;</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp;if [ -n &quot;$D&quot; ]; then </div>
<div>&gt;</div>
<div>&gt; Shouldn't this already have been run during image construction?</=
div>
<div>&gt;</div>
<div>&gt; Doesn't this break our systemctl emulation (meta/recipes-core/sys=
temd/systemd-systemctl/systemctl)?</div>
<div><br>
</div>
<div></div>
<div>The use case is similar with Fedora or Debian that modify image with<b=
r>
</div>
<div>command dnf, both on the real bsp or container.</div>
<div><br>
</div>
<div>It breaks the systemd-systemctl-native indeed. The reason to run</div>
<div>systemctl to check whether it really works because it fails in contain=
er.</div>
<div>And I suppose 'systemctl list-machines' is the most quick subcommand o=
f</div>
<div>systemctl. How about add a stub function to provide sub-common</div>
<div>list-machines for systemd-systemctl-native?</div>
<br>
&gt;
<div>&gt;</div>
<div>&gt;&gt; @@ -48,7 +48,7 @@ fi</div>
<div>&gt;&gt; &nbsp;}</div>
<div>&gt;&gt; &nbsp;</div>
<div>&gt;&gt; &nbsp;systemd_prerm() {</div>
<div>&gt;&gt; -if type systemctl &gt;/dev/null 2&gt;/dev/null; then</div>
<div>&gt;&gt; +if systemctl list-machines &gt;/dev/null 2&gt;/dev/null; the=
n</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp;if [ -z &quot;$D&quot; ]; then</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;systemctl stop ${SYSTEMD_SE=
RVICE_ESCAPED}</div>
<div>&gt;&gt; &nbsp;</div>
<div>&gt;</div>
<div>&gt; You're running the prerm hook inside a docker container?</div>
<div>&gt;</div>
<div>&gt; Wouldn't it be more appropriate to remove the systemd DISTRO_FEAT=
URE for a use-case like this?</div>
<div><br>
</div>
<div>There will &nbsp;always has an init manager there for oe-core. It shou=
ld work</div>
<div>for both sysvinit and systemd without extra configure to use as a dock=
er</div>
<div>image.</div>
<div><br>
</div>
<div>Thanks for your comment.</div>
<div><br>
</div>
Kai<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Kang, K=
ai &lt;kai.kang@windriver.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA10=D4=C229=C8=D5 17:27<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-core@lists.openembedded.org &lt;ope=
nembedded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [PATCH 1/1] systemd.bbclass: check whether systemctl w=
orks in post scripts</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">From: Kai Kang &lt;kai.kang@windriver.com&gt;<br>
<br>
When use a core image tarball as a docker image with 'docker import', it<br=
>
fails to install/remove package which calls systemctl in post scripts.<br>
Because it fais to run systemctl in a container:<br>
<br>
bash-5.0# systemctl<br>
System has not been booted with systemd as init system (PID 1). Can't opera=
te.<br>
Failed to connect to bus: Host is down<br>
<br>
Replace 'type systemctl' with 'systemctl list-machines' in package post<br>
scripts to check whether systemctl work rather than existence.<br>
<br>
Signed-off-by: Kai Kang &lt;kai.kang@windriver.com&gt;<br>
---<br>
&nbsp;meta/classes/systemd.bbclass | 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass<br=
>
index 9e8a82c9f1..9938425e2d 100644<br>
--- a/meta/classes/systemd.bbclass<br>
+++ b/meta/classes/systemd.bbclass<br>
@@ -23,7 +23,7 @@ python __anonymous() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;systemd_postinst() {<br>
-if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
+if systemctl list-machines &gt;/dev/null 2&gt;/dev/null; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTS=3D&quot;&quot;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -n &quot;$D&quot; ]; =
then<br>
@@ -48,7 +48,7 @@ fi<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;systemd_prerm() {<br>
-if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
+if systemctl list-machines &gt;/dev/null 2&gt;/dev/null; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -z &quot;$D&quot; ]; =
then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; systemctl stop ${SYSTEMD_SERVICE_ESCAPED}<br>
&nbsp;<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR11MB32949BC7A32C382634D011B295150SN6PR11MB3294namp_--
