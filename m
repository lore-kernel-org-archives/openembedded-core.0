Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 396 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Oct 2014 14:41:03 UTC
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.105])
	by mail.openembedded.org (Postfix) with ESMTP id BD5077175F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:41:03 +0000 (UTC)
Received: from [216.82.254.195:44812] by server-9.bemta-7.messagelabs.com id
	C2/79-03013-4726D245; Thu, 02 Oct 2014 14:34:28 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-200.messagelabs.com!1412260467!21460854!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26394 invoked from network); 2 Oct 2014 14:34:27 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-6.tower-200.messagelabs.com with RC4-SHA encrypted SMTP;
	2 Oct 2014 14:34:27 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 2 Oct 2014 09:34:48 -0500
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 2 Oct 2014 09:34:26 -0500
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0174.001;
	Thu, 2 Oct 2014 16:34:24 +0200
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: "'Burton, Ross'" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] nativesdk-packagegroup-sdk-host: add
	nativesdk-u-boot-mkimage
Thread-Index: AQHP3i6WmWziuc+n7UmUEozGCezjBJwc2K1Q
Date: Thu, 2 Oct 2014 14:34:24 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB03D9B8@dor-sms-xch01.digi.com>
References: <1412237161-48093-1-git-send-email-javier.viguera@digi.com>
	<CAJTo0Lazv8xfBPA51UF_NDz0MJm7tCgjEP9Ya404x0V54q7dAA@mail.gmail.com>
In-Reply-To: <CAJTo0Lazv8xfBPA51UF_NDz0MJm7tCgjEP9Ya404x0V54q7dAA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.189]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-packagegroup-sdk-host: add nativesdk-u-boot-mkimage
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
X-List-Received-Date: Thu, 02 Oct 2014 14:41:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0
bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IA0KPiBPbiAyIE9jdG9iZXIgMjAxNCAwOTowNiwg
SmF2aWVyIFZpZ3VlcmEgPGphdmllci52aWd1ZXJhQGRpZ2kuY29tPg0KPiB3cm90ZToNCj4gPiBB
ZGQgdGhlICdta2ltYWdlJyBob3N0IHRvb2wgdG8gdGhlIHRvb2xjaGFpbnMgZ2VuZXJhdGVkIHdp
dGggJ2JpdGJha2UNCj4gPiBtZXRhLXRvb2xjaGFpbicgb3Igd2l0aCAnYml0YmFrZSAtYyBwb3B1
bGF0ZV9zZGsgPGltYWdlPicuDQo+IA0KPiBCdXQgbm90IGFsbCBCU1BzIHVzZXMgdS1ib290LiAg
SGF2aW5nIHRoZSBib290bG9hZGVyIHRvb2xpbmcgbWFrZXMNCj4gc2Vuc2UsIGJ1dCBpdCBuZWVk
cyB0byBiZSB0aGUgcmlnaHQgdG9vbGluZy4NCg0KDQpIaSBSb3NzLA0KDQpJIHdhcyBub3QgdGFy
Z2V0aW5nIGFueSBzcGVjaWZpYyBCU1AuIEkgd2FzIGp1c3QgdXNpbmcgYSBnZW5lcmljIHRvb2xj
aGFpbiBjcmVhdGVkIHdpdGggcG9reS4gTXkgc3RlcHM6DQoNCjEuIENsb25lIFBva3kgKG9yIG9l
LWNvcmUpDQoyLiBDcmVhdGVkIGEgZ2VuZXJpYyBwcm9qZWN0IGFuZCBjb25maWd1cmUgZm9yICdx
ZW11YXJtJyAoTUFDSElORT1xZW11YXJtIGNoYW5nZWQgaW4gbG9jYWwuY29uZikNCjMuIGJpdGJh
a2UgbWV0YS10b29sY2hhaW4NCg0KV2l0aCB0aGlzIHRvb2xjaGFpbiB5b3UgY2FuIGJ1aWxkIHpJ
bWFnZSBrZXJuZWwgaW1hZ2VzIGJ1dCBub3QgdUltYWdlLiBTdXJlIHRoZSB1SW1hZ2UgaXMgdG8g
YmUgdXNlZCB3aXRoIHUtYm9vdCwgYnV0IEkgc2VlIHRoZSB2YWx1ZSBvZiBoYXZpbmcgYSBnZW5l
cmljIEFSTSB0b29sY2hhaW4gYW5kIHRoYXQgc3RpbGwgYWxsb3dzIG1lIHRvIGNyZWF0ZSB1SW1h
Z2UgZmlsZXMuIFRoZSBta2ltYWdlIGJpbmFyeSBhZGRzIGFib3V0IDgwIEtCIGluIGEgMjczIE1C
IHRvb2xjaGFpbiAoZG9lc24ndCBzZWVtIHRvbyBtdWNoKS4NCg0KLS0ganZpZ3VlcmENCg0KDQoN
Cg==

