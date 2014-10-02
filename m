Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 417 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Oct 2014 16:58:02 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.206])
	by mail.openembedded.org (Postfix) with ESMTP id 65A237029A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 16:58:02 +0000 (UTC)
Received: from [216.82.241.132:57379] by server-14.bemta-8.messagelabs.com id
	93/7A-01453-A728D245; Thu, 02 Oct 2014 16:51:06 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-7.tower-45.messagelabs.com!1412268665!37814017!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30071 invoked from network); 2 Oct 2014 16:51:06 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-7.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	2 Oct 2014 16:51:06 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 2 Oct 2014 11:51:26 -0500
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 2 Oct 2014 11:51:05 -0500
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0174.001;
	Thu, 2 Oct 2014 18:51:02 +0200
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: "'Burton, Ross'" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] nativesdk-packagegroup-sdk-host: add
	nativesdk-u-boot-mkimage
Thread-Index: AQHP3i6WmWziuc+n7UmUEozGCezjBJwc4WDbgAAhTiA=
Date: Thu, 2 Oct 2014 16:51:01 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB03DAAE@dor-sms-xch01.digi.com>
References: <1412237161-48093-1-git-send-email-javier.viguera@digi.com>
	<CAJTo0Lazv8xfBPA51UF_NDz0MJm7tCgjEP9Ya404x0V54q7dAA@mail.gmail.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB03D9B8@dor-sms-xch01.digi.com>
	<CAJTo0LYOkeLawn2TW=8+E=GwsBLEoYJdTM8LQ6LZfu3RpcAzLg@mail.gmail.com>
In-Reply-To: <CAJTo0LYOkeLawn2TW=8+E=GwsBLEoYJdTM8LQ6LZfu3RpcAzLg@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Oct 2014 16:58:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiANCj4gSWYgd2UncmUgYWRkaW5nIHUtYm9v
dCB0byB0aGUgU0RLIHRoZW4gd2Ugc2hvdWxkIGFkZCBldmVyeSBib290bG9hZGVyLg0KPiBCdXQg
d2h5IGluc3RhbGwgZ3J1YiBmb3IgYSBQUEMgU0RLPyAgVGhpcyBpcyB3aHkgSSBzdWdnZXN0ZWQg
YWRkaW5nDQo+IHRoZSByaWdodCBib290bG9hZGVyIGZvciBlYWNoIG1hY2hpbmUuDQoNCkhpIFJv
c3MsDQoNCk5vdCBzdXJlIGlmIEkgZm9sbG93IHlvdS4gQXJlIHlvdSBzdWdnZXN0aW5nIGFkZGlu
ZyB0aGlzIGluIGEgYmJhcHBlbmQgaW5zaWRlIGEgQlNQIGxheWVyIGluc3RlYWQgb2Ygb2UtY29y
ZT8NCg0KT3Igc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyB3b3VsZCBiZSBzdWl0YWJsZSBm
b3Igb2UtY29yZT86DQoNClJERVBFTkRTXyR7UE59X2FwcGVuZF9hcm0gPSAiIG5hdGl2ZXNkay11
LWJvb3QtbWtpbWFnZSINCg0KVGhpcyBzZWVtcyBzdHJhbmdlIHRvIG1lIGFzIEkgZG9uJ3Qga25v
dyBpZiBhbGwgQVJNIG1hY2hpbmVzIHVzZSB1LWJvb3QgYXMgYm9vdGxvYWRlci4gSG93IGRvIEkg
cmVzdHJpY3QgdGhpcyBwZXItbWFjaGluZT8NCg0KTm90aWNlIHRoYXQgc3RyaWN0bHkgc3BlYWtp
bmcgdGhpcyBpcyBub3QgImFkZGluZyB1LWJvb3QgdG8gdGhlIFNESyIuIEl0J3MgYSBob3N0IHRv
b2wgdGhhdCBhbGxvd3MgdG8gY3JlYXRlIGtlcm5lbCBpbWFnZXMgc3VpdGFibGUgZm9yIHUtYm9v
dC4gQnV0IG5vdCBvbmx5IHRoYXQsIGl0IGFsc28gYWxsb3dzIGZvciBleGFtcGxlIHRvIGNyZWF0
ZSBGSVQgKEZsYXR0ZW5lZCBJbWFnZSBUcmVlKSBpbWFnZXMuIEkgc2VlbSB0byByZW1lbWJlciB0
aGVyZSB3YXMgYSBwYXRjaCBsYXRlbHkgdG8gYWRkIHN1cHBvcnQgZm9yIEZJVCBpbWFnZXMgdG8g
b2UtY29yZS4NCg0KLS0ganZpZ3VlcmENCg==

