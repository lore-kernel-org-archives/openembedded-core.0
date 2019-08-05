Return-Path: <chee.yang.lee@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 374427F2D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 08:40:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 01:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="178789405"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by orsmga006.jf.intel.com with ESMTP; 05 Aug 2019 01:40:41 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.4]) by
	PGSMSX111.gar.corp.intel.com ([169.254.2.22]) with mapi id
	14.03.0439.000; Mon, 5 Aug 2019 16:40:40 +0800
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] systemd-boot:grub-efi:wic: add variable
	APPENDS for multiple boot configuration
Thread-Index: AQHVSUlnan4s2UPNu0OTbKzknFRylabsQFkA
Date: Mon, 5 Aug 2019 08:40:40 +0000
Message-ID: <D88A5CDD-118A-48EE-99D0-EF6CC362A1ED@intel.com>
References: <1564749183-3162-1-git-send-email-chee.yang.lee@intel.com>
	<e46e1d0f5ff44a4fe3ddbbfd301c72061962cdb7.camel@linuxfoundation.org>
In-Reply-To: <e46e1d0f5ff44a4fe3ddbbfd301c72061962cdb7.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-originating-ip: [10.221.217.60]
MIME-Version: 1.0
Subject: Re: [PATCH v2] systemd-boot:grub-efi:wic: add variable APPENDS for multiple boot configuration
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
X-List-Received-Date: Mon, 05 Aug 2019 08:40:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C51DB3355108E7459DEE269B7A8E70A2@intel.com>
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0Kd291bGQgS0VSTkVMX0NNRF9MSU5FUyBhIGJldHRlciB2YXJpYWJsZSBu
YW1lIGZvciB0aGlzIGNhc2U/DQoNCg0K77u/T24gOC8yLzE5LCAxMTo0NiBQTSwgIlJpY2hhcmQg
UHVyZGllIiA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQoNCiAg
ICBPbiBGcmksIDIwMTktMDgtMDIgYXQgMjA6MzMgKzA4MDAsIGNoZWUueWFuZy5sZWVAaW50ZWwu
Y29tIHdyb3RlOg0KICAgID4gRnJvbTogQ2hlZSBZYW5nIExlZSA8Y2hlZS55YW5nLmxlZUBpbnRl
bC5jb20+DQogICAgPiANCiAgICA+IGludHJvZHVjZSBuZXcgdmFyaWFibGUgQVBQRU5EUyB0byBk
ZWZpbmUgbXVsdGlwbGUNCiAgICA+IGJvb3QgY29uZmlndXJhdGlvbiBmb3Igc3lzdGVtZC1ib290
IGFuZCBncnViLWVmaS4NCiAgICA+IA0KICAgID4gQVBQRU5EUyBzZXQgdGhlIGRpZmZlcmVudCBp
biBrZXJuZWwgb3B0aW9uIGZvciBlYWNoIC5jb25mDQogICAgPiBmaWxlKGZvciBzeXN0ZW1kLWJv
b3QpIG9yIG1lbnVlbnRyeShmb3IgZ3J1Yi1lZmkpLg0KICAgID4gSW5jbHVkZSB0aGUgZGlmZmVy
ZW5jZXMgaW4gdGhlIHRpdGxlLg0KICAgID4gU2VwYXJhdGUgZWFjaCBjb25maWd1cmF0aW9uIHdp
dGggIjsiLg0KICAgID4gDQogICAgPiBlLmcuOg0KICAgID4gQVBQRU5EID0gImNvbnNvbGU9dHR5
MCByb290d2FpdCINCiAgICA+IEFQUEVORFMgPSAiIGk5MTUuZW5hYmxlX2d1Yz0wOyBpOTE1LmVu
YWJsZV9ndWM9MiINCiAgICA+IA0KICAgID4gZm9yIHN5c3RlbWQtYm9vdCwgYWJvdmUgc2V0dGlu
ZyB3aWxsIHByb2R1Y2UgMiAuY29uZiwNCiAgICA+IGJvb3QtMS5jb25mIGFuZCBib290LTIuY29u
ZiB3aGljaCBzZXQgd2l0aCBiZWxvdyB0aXRsZSBhbmQgb3B0aW9uOg0KICAgID4gDQogICAgPiBi
b290LTEuY29uZiAtDQogICAgPiAJdGl0bGUgYm9vdC0xIGk5MTUuZW5hYmxlX2d1Yz0wDQogICAg
PiAJb3B0aW9uIGNvbnNvbGU9dHR5MCByb290d2FpdCBpOTE1LmVuYWJsZV9ndWM9MA0KICAgID4g
DQogICAgPiBib290LTIuY29uZiAtDQogICAgPiAJdGl0bGUgYm9vdC0yIGk5MTUuZW5hYmxlX2d1
Yz0yDQogICAgPiAJb3B0aW9uIGNvbnNvbGU9dHR5MCByb290d2FpdCBpOTE1LmVuYWJsZV9ndWM9
Mg0KICAgID4gDQogICAgPiANCiAgICA+IGFsc28gdXBkYXRlIG9lcWEvc2VsZnRlc3Qvd2ljIHRl
c3RjYXNlIHRvIGZpdCB0aGUgbmV3IHZhcmlhYmxlLg0KICAgIA0KICAgIEFQUEVORCB3YXMgYSBo
b3JyaWJsZSBjaG9pY2Ugb2YgdmFyaWFibGUgbmFtZS4gTGV0cyBub3QgY29tcG91bmQgdGhlDQog
ICAgcHJvYmxlbSBieSBhZGRpbmcgbmV3IHZlcnNpb25zIG9mIGl0IQ0KICAgIA0KICAgIENoZWVy
cywNCiAgICANCiAgICBSaWNoYXJkDQogICAgDQogICAgDQoNCg==

