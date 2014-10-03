Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.106])
	by mail.openembedded.org (Postfix) with ESMTP id 4835B708B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 06:59:23 +0000 (UTC)
Received: from [216.82.254.211:59762] by server-10.bemta-7.messagelabs.com id
	42/2C-15477-C494E245; Fri, 03 Oct 2014 06:59:24 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-10.tower-201.messagelabs.com!1412319563!16441624!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17177 invoked from network); 3 Oct 2014 06:59:24 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-10.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	3 Oct 2014 06:59:24 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Fri, 3 Oct 2014 01:59:08 -0500
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 3 Oct 2014 01:59:22 -0500
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0174.001;
	Fri, 3 Oct 2014 08:59:21 +0200
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: 'Otavio Salvador' <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] nativesdk-packagegroup-sdk-host: add
	nativesdk-u-boot-mkimage
Thread-Index: AQHP3nNzmWziuc+n7UmUEozGCezjBJwd8ATA
Date: Fri, 3 Oct 2014 06:59:20 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB03DB34@dor-sms-xch01.digi.com>
References: <1412237161-48093-1-git-send-email-javier.viguera@digi.com>
	<CAJTo0Lazv8xfBPA51UF_NDz0MJm7tCgjEP9Ya404x0V54q7dAA@mail.gmail.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB03D9B8@dor-sms-xch01.digi.com>
	<CAJTo0LYOkeLawn2TW=8+E=GwsBLEoYJdTM8LQ6LZfu3RpcAzLg@mail.gmail.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB03DAAE@dor-sms-xch01.digi.com>
	<CAP9ODKp9EmiTgaLptOQ5qKYjadJ0zBB00_Gjs1whd-i4PB+bJQ@mail.gmail.com>
In-Reply-To: <CAP9ODKp9EmiTgaLptOQ5qKYjadJ0zBB00_Gjs1whd-i4PB+bJQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 Oct 2014 06:59:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvdGF2aW8uc2FsdmFkb3JAZ21h
aWwuY29tIFttYWlsdG86b3RhdmlvLnNhbHZhZG9yQGdtYWlsLmNvbV0gT24NCj4gUm9zcyBjb25j
ZXJuIGlzIGJlY2F1c2Ugd2Ugc2hvdWxkbid0IGZvcmNlIG1raW1hZ2UgaW4gZXZlcnkgU0RLLiBJ
Zg0KPiBzb21lb25lIGlzIHVzaW5nIGJhcmVib3gsIG9yIGdydWIsIGl0IHNob3VsZG4ndCBiZSBh
ZGRlZC4NCg0KSGkgT3RhdmlvLA0KDQpJIHVuZGVyc3RhbmQgd2hhdCB0aGUgY29uY2VybiBpcywg
d2hhdCBJIGRvbid0IHNlZSB5ZXQgaXMgaG93IHRvIGFkZHJlc3MgdGhpcyAqcHJhY3RpY2FsbHkq
LiBJIHB1dCBzb21lIHF1ZXN0aW9ucyBpbiBteSBwcmV2aW91cyBlLW1haWwsIGRvIHlvdSBoYXZl
IGFueSBoaW50cz8NCg0KSSBzZWUgdGhlcmUgaXMgYSBuYXRpdmVzZGstcGFja2FnZWdyb3VwLXNk
ay1ob3N0LmJiYXBwZW5kIGluICptZXRhLWZzbC1hcm0qIHRoYXQgdW5jb25kaXRpb25hbGx5IGFk
ZHMgc29tZSB0b29scyB0byB0aGUgdG9vbGNoYWluIChlbGZ0b3NiLCBteHNsZHIpLiBJZiBteSBw
cmV2aW91cyBwYXRjaCBpcyBub3QgYWNjZXB0ZWQgaW4gb2UtY29yZSwgYXJlIHlvdSB3aWxsaW5n
IHRvIGFjY2VwdCB0aGUgc2FtZSBwYXRjaCBpbiB0aGlzIGJiYXBwZW5kIGluIG1ldGEtZnNsLWFy
bT8NCg0KLS0gDQpKYXZpZXIgVmlndWVyYQ0KU29mdHdhcmUgRW5naW5lZXINCkRpZ2kgSW50ZXJu
YXRpb25hbMKuIFNwYWluIFMuQS5VLg0K

