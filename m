Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDAB7DE36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 05:10:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2019 22:10:25 -0700
X-ExtLoop1: 1
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
	by orsmga004.jf.intel.com with ESMTP; 09 Jun 2019 22:10:23 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.239]) by
	KMSMSX156.gar.corp.intel.com ([169.254.1.5]) with mapi id
	14.03.0415.000; Mon, 10 Jun 2019 13:10:22 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"timothy.t.orling@linux.intel.com" <timothy.t.orling@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/4] serf: switch to python3-scons-native
Thread-Index: AQHVHYviP9rtN2fDDEOwIJgYFxB2uKaT1GUA
Date: Mon, 10 Jun 2019 05:10:22 +0000
Message-ID: <566287162a0ddfec6fa1935244b9fff9d530039a.camel@intel.com>
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<7c1f46d8510f95fe7a35127196bd496935efe384.1559950879.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <7c1f46d8510f95fe7a35127196bd496935efe384.1559950879.git.timothy.t.orling@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.66.233]
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] serf: switch to python3-scons-native
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
X-List-Received-Date: Mon, 10 Jun 2019 05:10:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <87FA55483B1D8841AB68EB834C5F287C@intel.com>
Content-Transfer-Encoding: base64

VGhpcyBpcyBjYXVzaW5nIG9uIENlbnRPUyA3Og0KDQp8IERFQlVHOiBFeGVjdXRpbmcgc2hlbGwg
ZnVuY3Rpb24gZG9fY29tcGlsZQ0KfCBzY29uczogKioqIFNDb25zIHZlcnNpb24gMy4wLjUgZG9l
cyBub3QgcnVuIHVuZGVyIFB5dGhvbiB2ZXJzaW9uDQozLjQuOC4NCnwgUHl0aG9uIDIuNyBvciA+
PSAzLjUgaXMgcmVxdWlyZWQuDQoNCkxvb2tzIGxpa2UgaXQncyB1c2luZyBob3N0IHB5dGhvbiB3
aGljaCBpcyBhdCAzLjQuOCBpbiB0aGlzIGNhc2UuDQoNClRoYW5rcywNCg0KQW51ag0KDQpPbiBG
cmksIDIwMTktMDYtMDcgYXQgMTY6NDcgLTA3MDAsIFRpbSBPcmxpbmcgd3JvdGU6DQo+IFNDb25z
IGhhcyBzdXBwb3J0ZWQgcHl0aG9uMyBzaW5jZSB2My4wLjAsIHVzZSBpdC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFRpbSBPcmxpbmcgPHRpbW90aHkudC5vcmxpbmdAbGludXguaW50ZWwuY29tPg0K
PiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2VyZl8xLjMuOS5iYiB8IDIgKy0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2VyZl8xLjMuOS5iYiBiL21l
dGEvcmVjaXBlcy0NCj4gc3VwcG9ydC9zZXJmL3NlcmZfMS4zLjkuYmINCj4gaW5kZXggNjVhODEx
NGJiNC4uNzA2Yzg2YmU0NyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2Vy
Zi9zZXJmXzEuMy45LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2VyZl8x
LjMuOS5iYg0KPiBAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiNTQ5
YzJkMjFjNTc3YThhOWMwNDUwZmFjYjVjY2E4MDlmMjY1OTFmMDQ4ZTQ2NjU1MjI0MDk0N2JkZg0K
PiAgTElDRU5TRSA9ICJBcGFjaGUtMi4wIg0KPiAgTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxl
Oi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciDQo+ICANCj4g
LURFUEVORFMgPSAicHl0aG9uLXNjb25zLW5hdGl2ZSBvcGVuc3NsIGFwciBhcHItdXRpbCB1dGls
LWxpbnV4DQo+IGV4cGF0Ig0KPiArREVQRU5EUyA9ICJweXRob24zLXNjb25zLW5hdGl2ZSBvcGVu
c3NsIGFwciBhcHItdXRpbCB1dGlsLWxpbnV4DQo+IGV4cGF0Ig0KPiAgDQo+ICBkb19jb21waWxl
KCkgew0KPiAgCSR7U1RBR0lOR19CSU5ESVJfTkFUSVZFfS9zY29ucyAke1BBUkFMTEVMX01BS0V9
DQo+IFBSRUZJWD0ke3ByZWZpeH0gXA0KPiAtLSANCj4gMi4yMC4xDQo+IA0KDQo=

