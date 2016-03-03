Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.1])
	by mail.openembedded.org (Postfix) with ESMTP id 91E316FFFE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 11:22:52 +0000 (UTC)
Received: from [216.82.251.37] by server-1.bemta-12.messagelabs.com id
	C9/49-03303-C8E18D65; Thu, 03 Mar 2016 11:22:52 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-2.tower-153.messagelabs.com!1457004171!11137991!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 75607 invoked from network); 3 Mar 2016 11:22:52 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-2.tower-153.messagelabs.com with SMTP;
	3 Mar 2016 11:22:52 -0000
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0266.001;
	Thu, 3 Mar 2016 12:22:46 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [jethro][PATCH] bluez5: allow D-Bus to spawn obexd
	in systems without systemd
Thread-Index: AQHRdTztcIWfS5aBRkmxISD9qb2Z4J9HkbFg
Date: Thu, 3 Mar 2016 11:22:45 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB790570@dor-sms-xch01.digi.com>
References: <1456337679-4602-1-git-send-email-javier.viguera@digi.com>
	<1457003268.3025.9.camel@linux.intel.com>
In-Reply-To: <1457003268.3025.9.camel@linux.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.55]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Subject: Re: [jethro][PATCH] bluez5: allow D-Bus to spawn obexd in systems without systemd
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
X-List-Received-Date: Thu, 03 Mar 2016 11:22:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9zaHVhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvc2h1
YSBHIExvY2sgW21haWx0bzpqb3NodWEuZy5sb2NrQGxpbnV4LmludGVsLmNvbV0gDQo+IFNlbnQ6
IFRodXJzZGF5LCBNYXJjaCAwMywgMjAxNiAxMjowOCBQTQ0KPiBUbzogVmlndWVyYSwgSmF2aWVy
OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW2pldGhyb11bUEFUQ0hdIGJsdWV6NTogYWxsb3cgRC1CdXMgdG8gc3Bhd24g
b2JleGQgaW4gc3lzdGVtcyB3aXRob3V0IHN5c3RlbWQNCj4gDQo+IFRoaXMgbG9va3MgbGlrZSBh
IHZhbGlkIHBhdGNoIGZvciB0aGUgbWFzdGVyIGJyYW5jaCB0b28/DQoNCkFic29sdXRlbHkuIFRo
YXQncyB3aHkgSSBzZW50IGJvdGggcGF0Y2hlcyB0b2dldGhlciwgb25lIGZvciBtYXN0ZXIgYW5k
IHRoaXMgb25lIGZvciBKZXRocm8uDQoNClNlZSB0aGUgb25lIGZvciBtYXN0ZXI6IA0KDQpodHRw
Oi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmcvcGF0Y2gvMTE2Mzg5Lw0KDQpCeSB0aGUgd2F5
LCBmb3IgSmV0aHJvIEkgc2VudCBhbHNvIGEgZGlmZmVyZW50IHBhdGNoIChtYXN0ZXIgYmFja3Bv
cnQpOg0KDQpodHRwOi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmcvcGF0Y2gvMTE2NjYxLw0K
DQpUaGlzIGxhc3Qgb25lIGlzIGFscmVhZHkgaW4gbWFzdGVyIGFuZCBpdCB3b3VsZCBiZSBncmVh
dCB0byBoYXZlIGl0IGluIEpldGhybyBhcyB3ZWxsLg0KDQotLQ0KSmF2aWVyIFZpZ3VlcmEgDQoN
Cg==

