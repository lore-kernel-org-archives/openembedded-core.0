Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 406 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Jun 2014 09:50:24 UTC
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.98])
	by mail.openembedded.org (Postfix) with ESMTP id 841496FF2A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 09:50:24 +0000 (UTC)
Received: from [216.82.254.211:43450] by server-2.bemta-7.messagelabs.com id
	69/84-17838-8CD00A35; Tue, 17 Jun 2014 09:43:36 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-9.tower-201.messagelabs.com!1402998216!13989945!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9430 invoked from network); 17 Jun 2014 09:43:36 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-9.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	17 Jun 2014 09:43:36 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 17 Jun 2014 04:43:25 -0500
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by mcl-sms-exch01.digi.com
	(10.5.8.50) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 17 Jun 2014 04:43:35 -0500
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0174.001;
	Tue, 17 Jun 2014 04:43:34 -0500
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>, "'Burton, Ross'"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [backport to Daisy] dbus: fix a hard dependency
	about dbus-ptest
Thread-Index: AQHPiXUQRjt6WUzRlk6lUSopOHrzG5t0QxWAgAD/8QD//8o6QA==
Date: Tue, 17 Jun 2014 09:43:32 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0207E3@dor-sms-xch01.digi.com>
References: <cover.1396927648.git.Chong.Lu@windriver.com>
	<539EDD51.9060508@digi.com>
	<CAJTo0LbcPqL+E78x1jUX6JH_BBc-uuEV8KDjELap9OJidPtYqA@mail.gmail.com>
	<539F08D0.7060602@digi.com>
	<CAJTo0LZXUh1giimTFpdQYBpVJ640wCgr6j6vELaa9h3L+_huyw@mail.gmail.com>
	<1402991538.562.84.camel@ted>
In-Reply-To: <1402991538.562.84.camel@ted>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.163]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Cc: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [backport to Daisy] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Tue, 17 Jun 2014 09:50:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNo
YXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+
IA0KPiBGb3Igd2hhdCBpdHMgd29ydGggSSd2ZSBwdWxsZWQgdGhlIHR3byBwYXRjaGVzIHdlIG5l
ZWQgaW50byB0aGUgZGFpc3kNCj4gYnJhbmNoIGZvciB0aGlzLiBJJ2QgYXBwcmVjaWF0ZSBzb21l
b25lIGNvbmZpcm1pbmcgaXQgZG9lcyB0aGUgcmlnaHQNCj4gdGhpbmcgdGhvdWdoLg0KDQpJJ3Zl
IGp1c3QgbWFkZSBhIGJhc2ljIHRlc3QgYW5kIGF0IGxlYXN0IHRoZSBkYnVzLXB0ZXN0IGlzc3Vl
IGlzIHNvbHZlZCBmb3IgbWUuIFRoZSBwYWNrYWdlIHdhcyByZW1vdmVkIGZyb20gdGhlIHJvb3Rm
cyBpbWFnZSBhbmQgdGhlIG92ZXJhbGwgc2l6ZSB3ZW50IGRvd24gaW4gYWJvdXQgfjM4TUIsIHNv
IHllYWggSSdtIGhhcHB5IHdpdGggdGhhdC4NCg0KVGhhbmtzLA0KDQpKYXZpZXIgVmlndWVyYQ0K
DQo=

