Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B404F72A49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 14:32:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 06 Apr 2015 07:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,532,1422950400"; d="scan'208";a="704073096"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2015 07:32:14 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.2]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.136]) with mapi id
	14.03.0224.002; Mon, 6 Apr 2015 15:32:13 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>, "Peter A. Bigot"
	<pab@pabigot.com>
Thread-Topic: [OE-core] [PATCH 5/5] bluetooth.bbclass: set bluez5 as the
	default BT stack
Thread-Index: AQHQb+lAzXM3Q39V6Ei+R9OGX9SXGp0/llfAgABLsICAAAWrAIAAIl6A
Date: Mon, 6 Apr 2015 14:32:13 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
	<552282D7.6040108@pabigot.com>
	<CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
In-Reply-To: <CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Mon, 06 Apr 2015 14:32:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2VsbCwNCg0KMS4gUGV0ZXIsIE90YXZpbzogVGhlcmUgaXMgbm90IGEgc2luZ2xlIGRvdWJ0IGFi
b3V0IG1vdmluZyB0byBCbHVlWiA1IGFzIGRlZmF1bHQgaW4gMS45Ow0KMi4gVGhlIHJlcXVlc3Rl
ZCBmZWVkYmFjayB3YXMgYWJvdXQgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbjsNCjMuIFBldGVy
OiAiIEkgZG8gdGhpbmsgaXQncyBhIGJpdCBhYnJ1cHQgdG8gbWFrZSBpdCB0aGUgZGVmYXVsdCBp
biB0aGUgZmlyc3Qgc3RhYmxlIHJlbGVhc2UgdGhhdCBwcm92aWRlcyBhIHVzYWJsZSBibHVlejUu
IjsgVGhlIGNoYW5nZSBpcyBpbnRlbmRlZCBmb3IgMS45LHRoZSByZWxlYXNlIHRoYXQgd2lsbCBj
b21lIGluIE9jdG9iZXIgMjAxNS4gRG8geW91IHRoaW5rIHRoYXQgaXQgaXMgc3RpbGwgYWJydXB0
PyBCbHVlWjUgaXMgcHJlc2VudCBpbiBZUCBhcyBhbiBhbHRlcm5hdGl2ZSBCVCBzdGFjayBmcm9t
IDEuNywgaXQgd2lsbCBzdGlsbCBiZSBhIGZ1bGx5IHN1cHBvcnRlZCBhbHRlcm5hdGl2ZSBpbiB0
aGUgKHVucmVsZWFzZWQpIDEuOCAoYXMgZmFyIGFzIHVwc3RyZWFtIGdvZXMgYXMgImZ1bGx5IHN1
cHBvcnRlZCIsIG9mIGNvdXJzZSksIGl0IHdpbGwgdGhlIGRlZmF1bHQgQlQgc3RhY2sgaW4gMS45
IChjb21pbmcgT2N0b2JlciAyMDE1KSwgd2hpbGUgQmx1ZVogNCB3aWxsIHN0aWxsIGJlIHN1cHBv
cnRlZCBhcyBhbiBvYnNvbGV0ZSwgYnV0IHN0aWxsIGZ1bmN0aW9uYWwgYWx0ZXJuYXRpdmU7IGZv
ciAyLjAgKHdoeSAxLjEwPz8pLCBpZiB0aGF0IHdpbGwgYmUgdGhlIG5hbWUsIGFsbCBtZWNoYW5p
c21zIGZvciBoYXZpbmcgQmx1ZVogYWx0ZXJuYXRpdmVzIHdpbGwgYmUgcmVtb3ZlZCwgYW5kIEJs
dWVaIDUgd2lsbCBiZSB0aGUgb25seSBvZmZpY2lhbCBzdXBwb3J0ZWQgQlQgc3RhY2suIFRoYXQn
cyBtb3JlIHRoYW4gdHdvIHllYXJzIGZvciBhIHRyYW5zaXRpb24sIGlzIHRoYXQgdG9vIHNvb24/
Pw0KDQovQ3Jpc3RpYW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5l
bWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBbbWFpbHRvOm9wZW5l
bWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9m
IE90YXZpbyBTYWx2YWRvcg0KU2VudDogTW9uZGF5LCBBcHJpbCA2LCAyMDE1IDQ6MTggUE0NClRv
OiBQZXRlciBBLiBCaWdvdA0KQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBv
ZS1jb3JlIGxheWVyDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCA1LzVdIGJsdWV0b290
aC5iYmNsYXNzOiBzZXQgYmx1ZXo1IGFzIHRoZSBkZWZhdWx0IEJUIHN0YWNrDQoNCk9uIE1vbiwg
QXByIDYsIDIwMTUgYXQgOTo1NyBBTSwgUGV0ZXIgQS4gQmlnb3QgPHBhYkBwYWJpZ290LmNvbT4g
d3JvdGU6DQo+IE9uIDA0LzA2LzIwMTUgMDI6MzEgQU0sIElvcmdhLCBDcmlzdGlhbiB3cm90ZToN
Cj4NCj4gSSB0aG91Z2h0IG9mIDEuOSBhcyB0aGUgcHJlcGFyYXRvcnkgc3RhZ2UgZm9yIGNvbXBs
ZXRlIHJlbW92YWwgb2YgDQo+IGJsdWV6NCwgc28gdGhhdCBpbiAyLjAgaXQgd291bGQgYmUgdmVy
eSBlYXN5IHRvIHJlbW92ZSB0aGUgc3VwcG9ydCBmb3IgYmx1ZXo0Lg0KPiBDb250aW51aW5nIHRv
IGhhdmUgYmx1ZXo1IGFkZGVkIHRvIERJU1RST19GRUFUVVJFUyBjcmVhdGUgdGhlIA0KPiBpbXBy
ZXNzaW9uIHRoYXQgQmx1ZVo1IGlzIHN0aWxsIGEgc2Vjb25kIGNsYXNzIGNpdGl6ZW4gY29tcGFy
ZWQgdG8gDQo+IEJsdWVaNCwgYW5kIGl0IGlzIG5vdCBteSBpbnRlbnRpb24gdG8gc3VzdGFpbiB0
aGlzIG9waW5pb24gdmlhIGNvZGUuDQo+DQo+IEkgaGVyZWJ5IHN0YW5kdXAgZm9yIG15IHNvbHV0
aW9uLiBBdCB0aGUgbW9tZW50LCB3ZSBhcmUgMXRvMS4g4oCcV2UgDQo+IHRoaW5r4oCdIOKAkyBX
aG8gYXJlIHRoZSBvdGhlcnMgcGVyc29ucywgUm9zcz8NCj4NCj4gL0NyaXN0aWFuDQo+DQo+DQo+
IFdoaWxlIEkgZnVsbHkgc3VwcG9ydCBtb3ZpbmcgdG8gYmx1ZXo1IGFuZCB1c2UgaXQgaW4gYWxs
IG15IGltYWdlcywgSSANCj4gZG8gdGhpbmsgaXQncyBhIGJpdCBhYnJ1cHQgdG8gbWFrZSBpdCB0
aGUgZGVmYXVsdCBpbiB0aGUgZmlyc3Qgc3RhYmxlIA0KPiByZWxlYXNlIHRoYXQgcHJvdmlkZXMg
YSB1c2FibGUgYmx1ZXo1LiAgT24gdGhlIG90aGVyIGhhbmQsIFlvY3RvJ3MgDQo+IGxhdGUgdG8g
dGhlDQo+IGJsdWV6NSBwYXJ0eSBhbmQgaXQncyBnb2luZyB0byBiZSBoYXJkZXIgdG8gc3VwcG9y
dCBibHVlejQgbm93Lg0KPg0KPiBTaXggb2Ygb25lOyBzaWduIG1lIHVwIGFzIHdlYWsgc3VwcG9y
dCBmb3IgZGVsYXlpbmcgdGhlIG1vdmUgdG8gDQo+IGRlZmF1bHQNCj4gYmx1ZXo1IHVudGlsIDEu
MTAuDQo+DQo+IEp1c3QgYW4gb3Bpbmlvbi4NCg0KSSBwcmVmZXIgYmx1ZXo1IGRlZmF1bHQgaW4g
MS45IGFuZCByZW1vdmFsIGluIDIuMCAob3IgMS4xMCkuIFdlIHNob3VsZG4ndCBiZSBzdXBwb3J0
IGxlZ2FjeSB3aXRob3V0IGEgdmVyeSBzdHJvbmcgcmVhc29uIGFuZCBpZiBhbnkgbWVtYmVyIHNo
b3dzIHVwIHRvIG9mZmljaWFsbHkgc3VwcG9ydCBibHVlejQgZm9yIGxvbmdlciB3ZSBtYXkgZHJv
cCBpdHMgcmVtb3ZhbCBidXQgYmx1ZXo1IGRlZmF1bHQgc2hvdWxkIGJlIGRvbmUgYXMgc29vbiBh
cyBwb3NzaWJsZSBzbyB3ZSBpcm9uIG91dCByZWdyZXNzaW9ucy4NCg0KLS0gDQpPdGF2aW8gU2Fs
dmFkb3IgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE8uUy4gU3lzdGVtcw0KaHR0cDovL3d3
dy5vc3N5c3RlbXMuY29tLmJyICAgICAgICBodHRwOi8vY29kZS5vc3N5c3RlbXMuY29tLmJyDQpN
b2JpbGU6ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAgICAgIE1vYmlsZTogKzEgKDM0NykgOTAz
LTk3NTANCi0tDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=

