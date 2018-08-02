Return-Path: <omar.ocampo.coronado@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1052574FCB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 16:54:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Aug 2018 09:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,436,1526367600"; d="scan'208";a="61874371"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by orsmga008.jf.intel.com with ESMTP; 02 Aug 2018 09:54:11 -0700
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 2 Aug 2018 09:54:10 -0700
Received: from FMSMSX109.amr.corp.intel.com ([169.254.15.66]) by
	fmsmsx158.amr.corp.intel.com ([169.254.15.57]) with mapi id
	14.03.0319.002; Thu, 2 Aug 2018 09:54:11 -0700
From: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Strip kernel modules and signatures
Thread-Index: AdQp6AYNoEgkmdwwQ7movNFM8K8/OgAlHzIAAADtQ/A=
Date: Thu, 2 Aug 2018 16:54:09 +0000
Message-ID: <0D62475714C01347BCA118AE7A61400376B2C8A3@FMSMSX109.amr.corp.intel.com>
References: <0D62475714C01347BCA118AE7A61400376B2C64D@FMSMSX109.amr.corp.intel.com>
	<5e8c54728e6990907fa60f2454ab7961c7561a93.camel@linuxfoundation.org>
In-Reply-To: <5e8c54728e6990907fa60f2454ab7961c7561a93.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2NjODliMmYtMTlhMC00ZDRmLThhOTQtN2ViYjgwNWY2OTk2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZ1JzemR0VWR3S3VscFwvekREaVJYRU5zYnh2dlwvYkttMFVNazVPQitRTkY2d1E3Q3NlaUZPcVp6RFM2SG9tb01GIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
Subject: Re: Strip kernel modules and signatures
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
X-List-Received-Date: Thu, 02 Aug 2018 16:54:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TmVpdGhlciAnbm0nIG9yICdyZWFkZWxmJyBwcm92aWRlIGEgc3ltYm9sIHRoYXQgd2UgY2FuIHVz
ZSB0byBzdHJpcC4gDQpJJ20gaGF2aW5nIGEgaGFyZCB0aW1lIHJlYWRpbmcga2VybmVsLXNvdXJj
ZS9zY3JpcHRzL3NpZ24tZmlsZS5jIGFuZCBob3cgZXhhY3RseSBob3cgdGhlIHNpZ24gd29ya3Mg
YW5kIHdoYXQgYnl0ZXMgYXJlIGJlaW5nIGFkZGVkLCBzbyB3ZSBjYW4gYXZvaWQgc3RyaXBwaW5n
IHRoZW0uDQoNCkxvb2tpbmcgaW50byBkcmFjdXQsIHRoZXkgc2ltcGxlIGF2b2lkIHN0cmlwIHNp
Z25lZCBtb2R1bGVzOg0KCUZyb20gZHJhY3V0LnNoOjE2NzEgIyBzdHJpcCBrZXJuZWwgbW9kdWxl
cywgYnV0IGRvIG5vdCB0b3VjaCBzaWduZWQgbW9kdWxlcw0KDQpQZXJoYXBzIHdlIGNhbiBkbyB0
aGUgc2FtZSBhcyBkcmFjdXQgd2l0aGluIG1ldGEvbGliL29lL3BhY2thZ2UucHkuDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnIFttYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10gDQpTZW50
OiBUaHVyc2RheSwgQXVndXN0IDIsIDIwMTggNDoxOSBBTQ0KVG86IE9jYW1wbyBDb3JvbmFkbywg
T21hciA8b21hci5vY2FtcG8uY29yb25hZG9AaW50ZWwuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBTdHJpcCBrZXJu
ZWwgbW9kdWxlcyBhbmQgc2lnbmF0dXJlcw0KDQpPbiBXZWQsIDIwMTgtMDgtMDEgYXQgMjI6NDYg
KzAwMDAsIE9jYW1wbyBDb3JvbmFkbywgT21hciB3cm90ZToNCj4gSGVsbG8gT0UsDQo+IA0KPiBX
aGlsZSBhdHRlbXB0aW5nIHRvIHNpZ24gb3VyIGtlcm5lbCBtb2R1bGVzICh1c2luZyB0aGUga2Vy
bmVsIA0KPiBjb25maWd1cmF0aW9uICBDT05GSUdfTU9EVUxFX1NJRykgdGhlIGRyaXZlcnMgaW4g
b3VyIGltYWdlIGRpZCBub3QgDQo+IGhhdmUgdGhlIHNpZ25hdHVyZSwgZXZlbiB0aGUgY2VydGlm
aWNhdGUgd2FzIGJlaW5nIGxvYWRlZCBieSB0aGUgDQo+IGtlcm5lbCBvciB0aGUgZHJpdmVyIGJl
aW5nIHNpZ25lZCBkdXJpbmcgZG9faW5zdGFsbCgpLg0KPiANCj4gVHVybnMgb3V0IHBhY2thZ2Uu
YmJjbGFzcywgd2hpbGUgaXQgaWdub3JlcyB0byBjcmVhdGUgZGVidWcgaW5mbyBmaWxlcyANCj4g
aXQgZG9lcyBzdHJpcHMgdGhlIGtlcm5lbCBtb2R1bGVzIGZpbGVzOg0KPiANCj4gcHl0aG9uIHNw
bGl0X2FuZF9zdHJpcF9maWxlcyAoKSB7DQo+IAkuLi4NCj4gCS4uLg0KPiAJICAgICAgICBmb3Ig
ZiBpbiBrZXJubW9kczoNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzZmlsZXMuYXBwZW5k
KChmLCAxNiwgc3RyaXApKQ0KPiANCj4gICAgICAgICBvZS51dGlscy5tdWx0aXByb2Nlc3NfZXhl
YyhzZmlsZXMsIG9lLnBhY2thZ2UucnVuc3RyaXApDQo+ICAgICAjDQo+ICAgICAjIEVuZCBvZiBz
dHJpcA0KPiAgICAgIw0KPiAgICAgb3MuY2hkaXIob2xkY3dkKQ0KPiB9DQo+IA0KPiBUaGUgc3Ry
aXAgaXMgcmVxdWlyZWQgZm9yIG1hbnkgcmVhc29ucyB5ZXQgaXQgcmVtb3ZlcyB0aGUgc2lnbmF0
dXJlIA0KPiB3aGljaCB3ZSB3YW50IHRvIHByZXNlcnZlIGluIHRoaXMgc2NlbmFyaW8uDQo+IFRv
IHdvcmsgYXJvdW5kIHRoaXMgaXNzdWUgYWRkDQo+ICAgICAgSU5ISUJJVF9QQUNLQUdFX1NUUklQ
ID0gIjEiDQo+ICAgICAgZWl0aGVyIG9uIHlvdXIgdmlydHVhbC9rZXJuZWwgYmIgZmlsZSBvciBk
cml2ZXIgYmIgZmlsZS4NCj4gDQo+IEhvcGUgdGhpcyBoZWxwcyBzb21lb25lIGluIHRoZSBmdXR1
cmUgd2hlbiBhZGRpbmcgc2lnbmF0dXJlIHRvIGZpbGVzLCANCj4gcGVyaGFwcyBpbmNsdWRpbmcg
dGhpcyBpbnRvIHRoZSBZb2N0byBrZXJuZWwgZGV2ZWxvcG1lbnQgbWFudWFsLg0KDQpUaGUgY29k
ZSB3aGljaCBoYW5kbGVzIGtlcm5lbCBtb2R1bGUgc3RyaXBwaW5nIGlzIGluDQptZXRhL2xpYi9v
ZS9wYWNrYWdlLnB5Og0KDQpzdHJpcGNtZC5leHRlbmQoWyItLXN0cmlwLWRlYnVnIiwgIi0tcmVt
b3ZlLXNlY3Rpb249LmNvbW1lbnQiLA0KICAgICAgICAgICAgIi0tcmVtb3ZlLXNlY3Rpb249Lm5v
dGUiLCAiLS1wcmVzZXJ2ZS1kYXRlcyJdKQ0KDQpJdCB3b3VsZCBiZSBnb29kIHRvIHNlZSB3aGF0
IHdlJ2QgaGF2ZSB0byBkbyB0byB0d2VhayB0aGF0IHRvIHdvcmsgZm9yIHNpZ25lZCBtb2R1bGVz
Lg0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg==

