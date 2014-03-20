Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4C46F8C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 16:24:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2014 09:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,695,1389772800"; d="scan'208";a="495936611"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2014 09:22:54 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 20 Mar 2014 16:22:53 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.87]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.144]) with mapi id
	14.03.0123.003; Thu, 20 Mar 2014 16:22:52 +0000
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Thread-Topic: [poky] [RFC PATCH v2 0/3] Master image generation and testing
Thread-Index: AQHPQfvOYq2tocOB60eGO+928Sq9OJroyIkAgAFk1IA=
Date: Thu, 20 Mar 2014 16:22:52 +0000
Message-ID: <1395332583.15042.2.camel@firebird.rb.intel.com>
References: <cover.1395069742.git.stefanx.stanacar@intel.com>
	<10573578.XnzgTfVZqB@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <10573578.XnzgTfVZqB@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.160]
MIME-Version: 1.0
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [RFC PATCH v2 0/3] Master image generation and testing
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
X-List-Received-Date: Thu, 20 Mar 2014 16:24:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2694ABC9D2D5DB47B1B8CD431757D7A4@intel.com>
Content-Transfer-Encoding: base64

SGkgUGF1bCwNCg0KDQpPbiBXZWQsIDIwMTQtMDMtMTkgYXQgMTk6MDUgKzAwMDAsIFBhdWwgRWdn
bGV0b24gd3JvdGU6DQo+IEhpIFN0ZWZhbiwNCj4gDQo+IE9uIE1vbmRheSAxNyBNYXJjaCAyMDE0
IDE3OjQyOjEzIFN0ZWZhbiBTdGFuYWNhciB3cm90ZToNCj4gPiBUaGlzIGlzIHdoYXQgSSBjdXJy
ZW50bHkgdXNlIGZvciBkb2luZyBhdXRvbWF0ZWQgZGVwbG95bWVudA0KPiA+IGZvciBhIGdlbmVy
aWN4ODYtNjQgaW1hZ2UuIE1vcmUgZGV0YWlscyBvbiB0aGUgY29tbWl0DQo+ID4gbWVzc2FnZXMu
IFRoZXJlIGlzIG5vdGhpbmcgcGFydGljdWxhciB0byBnZW5lcmljeDg2LTY0LA0KPiA+IGl0IHNo
b3VsZCB3b3JrIG9uIGFueSBFRkktZW5hYmxlZCBkZXZpY2Ugd2l0aCBndW1taWJvb3QgYXMgYm9v
dGxvYWRlci4NCj4gPiANCj4gPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiA+ICAgLSBkcm9wZWQgdGhl
IGtlcm5lbCBvcHRpb25zIHBhdGNoLCB0aGUgcmVxdWlyZWQgb3B0aW9ucyBhcmUgbm93IGluIHRo
ZQ0KPiA+IGRlZmF1bHQgY29uZmlnIGZyYWdtZW50cy4gWW91IHN0aWxsIG5lZWVkIHRvIGJ1aWxk
IHdpdGggYW4gdXBkYXRlZCBTUkNSRVYNCj4gPiB0aG91Z2gsIGFzIHRoZSBrZXJuZWwgcmVjaXBl
cyBoYXZlbid0IHBpY2tlZCB1cCB0aGUgY2hhbmdlcyB5ZXQuDQo+ID4gKFNSQ1JFVl9tZXRhX3Bu
LWxpbnV4LXlvY3RvID0gIiR7QVVUT1JFVn0iIGluIGxvY2FsLmNvbmYpDQo+ID4gICAtIGltcG92
ZSBhIGJpdCB0aGUgbWFzdGVyIGltYWdlIHJlY2lwZSAoaW5oZXJpdCBjb3JlLWltYWdlIGFuZCBh
ZGQgdG8NCj4gPiBJTUFHRV9JTlNUQUxMIGluc3RlYWQgb2Ygb3ZlcndyaXRpbmcgSU1BR0VfSU5T
VEFMTCwgdGhhdCBlbnN1cmVzIHdlIHBpY2sgdXANCj4gPiB0aGUgY29ycmVjdCBtb2R1bGVzLCBh
cyBjb3JlLWltYWdlIGJyaW5ncyBpbiBwYWNrYWdlZ3JvdXAtYmFzZS1leHRlbmRlZCkNCj4gPiAg
IC0gdHdlYWtzIGFuZCBmaXhlcyBmb3IgR2VuZXJpY0VmaSAtIEkgZGlkIGEgY29tcGxldGUgdGVz
dCBydW4gZm9yIGEgTlVDDQo+ID4gZGV2aWNlIGNvbm5lY3RlZCB0byBhIHdlYiBwb3dlciBzdHJp
cC4gVGhlIHBvd2VyY29udHJvbCBjb21tYW5kIGlzIGFuDQo+ID4gZXhwZWN0IHNjcmlwdCB0aGF0
IGRvZXMgc3NoIG9uIGEgZGV2aWNlIHdoaWNoIGNvbnRyb2xzIHRoZSBwb3dlciBzdHJpcA0KPiA+
ICh0aGlzIGlzIHBhcnRpY3VsYXIgdG8gYSBuZXR3b3JrIHNldHVwIHRoYXQgSSBjYW4ndCBjb250
cm9sKS4gSXQgc3RpbGwNCj4gPiB3b3JrcyBmb3IgdGhlIG5vIHBvd2VyIGNvbW1hbmQgYXZhaWxh
YmxlIGNhc2UuDQo+ID4gDQo+ID4gQWxzbyBzZWUgWUIjMTU5NiBhbmQgaXQncyBzdWItYnVnICM1
NjE0IGZvciBhIGJpdCBvZiBiYWNrZ3JvdW5kLg0KPiA+IEFueSBjb21tZW50cywgcXVlc3Rpb25z
LCBtb3N0IHdlbGNvbWUuDQo+ID4gDQo+ID4gQ2hlZXJzLA0KPiA+IFN0ZWZhbg0KPiA+IA0KPiA+
IA0KPiA+IFBsZWFzZSByZXZpZXcgdGhlIGZvbGxvd2luZyBjaGFuZ2VzIGZvciBzdWl0YWJpbGl0
eSBmb3IgaW5jbHVzaW9uLiBJZiB5b3UNCj4gPiBoYXZlIGFueSBvYmplY3Rpb25zIG9yIHN1Z2dl
c3Rpb25zIGZvciBpbXByb3ZlbWVudCwgcGxlYXNlIHJlc3BvbmQgdG8gdGhlDQo+ID4gcGF0Y2hl
cy4gSWYgeW91IGFncmVlIHdpdGggdGhlIGNoYW5nZXMsIHBsZWFzZSBwcm92aWRlIHlvdXIgQWNr
ZWQtYnkuDQo+ID4gDQo+ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA5MjE1
NWZkZTIwNzkyNTE3MzlmNDU1YmNhNTk5YTUyY2QyMWVmMTJiOg0KPiA+IA0KPiA+ICAgYml0YmFr
ZTogcnVucXVldWU6IERvbid0IGVycm9yIGlmIHdlIG5ldmVyIHNldHVwIHdvcmtlcnMgKDIwMTQt
MDMtMTcNCj4gPiAxNTowNDo0NiArMDAwMCkNCj4gPiANCj4gPiBhcmUgYXZhaWxhYmxlIGluIHRo
ZSBnaXQgcmVwb3NpdG9yeSBhdDoNCj4gPiANCj4gPiAgIGdpdDovL2dpdC55b2N0b3Byb2plY3Qu
b3JnL3Bva3ktY29udHJpYiBzdGVmYW5zL21hc3RlcmltYWdlDQo+ID4gIA0KPiA+IGh0dHA6Ly9n
aXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0LmNnaS9wb2t5LWNvbnRyaWIvbG9nLz9oPXN0ZWZhbnMv
bWFzdGVyaW1hZw0KPiA+IGUNCj4gDQo+IExvb2tzIGdvb2QuIFNvbWUgcmV2aWV3IGNvbW1lbnRz
Og0KPiANCj4gKiBJcyBhbGwgb2YgcGFja2FnZWdyb3VwLWNvcmUtZnVsbC1jbWRsaW5lIHJlYWxs
eSBuZWVkZWQgZm9yIHRoZSBtYXN0ZXIgaW1hZ2UgDQo+IG9yIGp1c3Qgc29tZSBzcGVjaWZpYyB1
dGlsaXRpZXMgdGhhdCBpdCBwdWxscyBpbj8NCj4gDQoNCk5vLCBqdXN0IHNvbWUgc3BlY2lmaWMg
dXRpbGl0aWVzLiBJJ20gZ29ubmEgY2hhbmdlIHRoYXQgdG8gb25seSB0aG9zZS4NCg0KPiAqIENv
dWxkIHdlIGhhdmUgVEVTVF9QT1dFUkNPTlRST0xfRVhUUkFfQVJHUyBzbyB0aGF0IFRFU1RfUE9X
RVJDT05UUk9MX0NNRCBjYW4gDQo+IGJlIHNldCBnZW5lcmljYWxseSBmb3IgdGhlIHVzZXIncyBz
ZXR1cCBhbmQgZXh0cmEgbWFjaGluZS1zcGVjaWZpYyBhcmd1bWVudHMgDQo+IChzdWNoIGFzIHNl
cmlhbCBwb3J0IG51bWJlcnMgb3Igb3RoZXIgaWRlbnRpZmllcnMpIGNhbiBiZSBzZXQgZWFzaWx5
IG9uIGEgcGVyLQ0KPiBtYWNoaW5lIGJhc2lzIGlmIG5lZWRlZD8NCg0KT2theSwgd2lsbCBjaGFu
Z2UgdGhhdC4NCg0KPiANCj4gKiBJIHdvbmRlciBpZiBURVNUX0RFUExPWV9DTURTIHNob3VsZCBi
ZSBsb3dlci1jYXNlIHNpbmNlIGl0IHdvdWxkIGJlIG1vc3QgDQo+IGVhc2lseSBkZWZpbmVkIGFz
IGEgZnVuY3Rpb24gaS5lLiB0ZXN0aW1hZ2VfZGVwbG95X2NtZHMoKSB7IC4uLiB9IHRoYW4gYSAN
Cj4gdHJhZGl0aW9uYWwgdmFyaWFibGUuIChSZWFkaW5nIGl0IGlzIGV4YWN0bHkgdGhlIHNhbWUg
aS5lLiBkLmdldFZhcigpLikNCj4gDQoNCkknZCBsaWtlIHRvIGtlZXAgdGhhdCBjb25maWd1cmFi
bGUgZnJvbSAuY29uZiBmaWxlcy4gSSBkaWQgY2hhbmdlZCBpdCBiZQ0Kc3BsaXR0ZWQgYnkgXG4u
DQoNCj4gQWxsIG9mIHRoaXMgc2VlbXMgZ2VuZXJpYyBlbm91Z2ggdGhhdCBJIHRoaW5rIHRoZSBi
ZXR0ZXIgcGxhY2UgZm9yIGl0IHdvdWxkIGJlIA0KPiBPRS1Db3JlIHJhdGhlciB0aGFuIG1ldGEt
eW9jdG8tYnNwLiBJZiB5b3UgY291bGQgYXBwbHkgdGhlc2UgY2hhbmdlcyBvbiB0b3Agb2YgDQo+
IE9FLUNvcmUgYW5kIHNlbmQgdjMgdG8gdGhlIE9FLUNvcmUgbWFpbGluZyBsaXN0IHRoYXQgd291
bGQgYmUgZ3JlYXQuDQo+IA0KDQpPa2F5LCBncmVhdC4gSSdsbCBtb3ZlIGV2ZXJ5dGhpbmcgZnJv
bSBtZXRhLXlvY3RvLWJzcCB0byBtZXRhIGFuZA0KcmUtc2VuZC4NCg0KQ2hlZXJzLA0KU3RlZmFu
DQoNCj4gVGhhbmtzLA0KPiBQYXVsDQo+IA0KDQo=

