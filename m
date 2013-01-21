Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Tx5S9-0008Lz-TI
	for Openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 01:41:45 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Jan 2013 16:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,501,1355126400"; d="scan'208";a="193252340"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Jan 2013 16:25:46 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.5]) by
	ORSMSX103.amr.corp.intel.com ([169.254.2.214]) with mapi id
	14.01.0355.002; Sun, 20 Jan 2013 16:25:46 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/1] linux-yocto_3.4: use
	${KSRC_linux_yocto_3_4_repo} based SRC_URI
Thread-Index: AQHN9CJIK2y0V8nG90isWTBaahiWJJhP3ZqA//96GMCAAIscgP//ehXAgANpkACAACuR4A==
Date: Mon, 21 Jan 2013 00:25:45 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C3F0BE5D1@ORSMSX106.amr.corp.intel.com>
References: <cover.1358365495.git.nitin.a.kamble@intel.com>
	<9ab00cdffdd81cbdcd68ac03aafd925372f25ad7.1358365495.git.nitin.a.kamble@intel.com>
	<50F983F9.4020708@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C3F0BCF8A@ORSMSX106.amr.corp.intel.com>
	<50F98857.809@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C3F0BCFC9@ORSMSX106.amr.corp.intel.com>
	<1358689484.14265.40.camel@ted>
In-Reply-To: <1358689484.14265.40.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto_3.4: use ${KSRC_linux_yocto_3_4_repo} based SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 00:41:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBFbWJyYWNlIHRoZSBwb3dlciBvZiB0aGUgc2NyaXB0aW5nIHdlIGhhdmUsIHRoZXJlIGFyZSBt
dWNoIG1vcmUNCj4gaW50ZXJlc3Rpbmcgd2F5cyB0byBzb2x2ZSB0aGlzIHByb2JsZW0gZ2VuZXJp
Y2FsbHkuIEZvciBleGFtcGxlLCBJIHdyb3RlIHRoaXMNCj4gcGllY2Ugb2YgY29kZSBpbiBhIGZl
dyBtaW51dGVzIChhZG1pdHRlZGx5IHVudGVzdGVkKToNCj4gDQo+IA0KPiB1cmxyZW1hcHBlci5i
YmNsYXNzOg0KPiANCj4gcHl0aG9uICgpIHsNCj4gICAgIG1vZCA9IEZhbHNlDQo+ICAgICBuZXdz
cmN1cmkgPSBbXQ0KPiAgICAgc3JjdXJpID0gKGQuZ2V0VmFyKCJTUkNfVVJJIiwgVHJ1ZSkgb3Ig
IiIpLnNwbGl0KCkNCj4gICAgIG1hcHMgPSBkLmdldFZhckZsYWdzKCJVUkxSRU1BUCIpDQo+ICAg
ICBmb3IgdXJpIGluIHNyY3VyaToNCj4gICAgICAgICBmb3IgdSBpbiBtYXBzOg0KPiAgICAgICAg
IGlmIHVyaS5zdGFydHN3aXRoKHUpOg0KPiAgICAgICAgICAgICB1cmkucmVwbGFjZSh1LCBtYXBz
W3VdKQ0KPiAgICAgICAgICAgICBtb2QgPSBUcnVlDQo+ICAgICAgICAgbmV3c3JjdXJpLmFwcGVu
ZCh1cmkpDQo+ICAgICBpZiBtb2Q6DQo+ICAgICAgICAgZC5zZXRWYXIoIlNSQ19VUkkiLCAiICIu
am9pbihuZXdzcmN1cmkpKSB9DQo+IA0KPiANCj4gVVJMUkVNQVBbZ2l0Oi8vZ2l0LnlvY3RvcHJv
amVjdC5vcmcvbGludXgteW9jdG8tMy40LmdpdF0gPQ0KPiAiZ2l0Oi8vL2hvbWUvbml0aW4vbGlu
dXgteW9jdG8tMy40LmdpdC87cHJvdG9jb2w9ZmlsZSINCj4gDQo+IHdoaWNoIHNob3VsZCBkbyB3
aGF0IHlvdSB3YW50IGJ1dCBpbiBhIGdlbmVyaWMgd2F5IHdoaWNoIGRvZXNuJ3QgcmVxdWlyZSB1
cw0KPiB0byBoYWNrIGVhY2ggcmVjaXBlLiBZb3UgY2FuIGRvIGl0IGNvbXBsZXRlbHkgbG9jYWxs
eSBpZiB5b3UgY3JlYXRlIGEgY2xhc3Nlcw0KPiBkaXJlY3RvcnkgYWxvbmdzaWRlIHlvdXIgY29u
ZiBkaXJlY3RvcnkgYW5kIHBsYWNlIHRoZSAuYmJjbGFzcyB0aGVyZSwgdGhlbiBhZGQNCj4gSU5I
RVJJVCArPSAidXJscmVtYXBwZXIiIGluIGxvY2FsLmNvbmYuDQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiBSaWNoYXJkDQo+IA0KUmljaGFyZCwNCiAgSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQuIEFuZCB0
aGlzIG5ld2VyIHNvbHV0aW9uIHNob3VsZCB3b3JrLiBJZiBwb3NzaWJsZSBJIHdvdWxkIGxpa2Ug
dG8gcHVzaCB0aGlzIGNsYXNzIGluIHRoZSBvZWNvcmUgbGF5ZXIgc28gdGhhdCBJIGRvbid0IGhh
dmUgdG8gbWFpbnRhaW4gaXQgbXlzZWxmLiBBbHNvIGNhbiB0aGlzIGJlIGRvbmUgc2VsZWN0aXZl
bHkgZm9yIGEgQlNQIGJ5IHVzaW5nIHRoZSBic3BuYW1lIG92ZXJyaWRlPw0KDQpUaGFua3MsDQpO
aXRpbg0KIA0K


