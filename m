Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 70F9575084
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 00:46:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 17:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,413,1517904000"; d="scan'208";a="31114079"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by orsmga007.jf.intel.com with ESMTP; 05 Apr 2018 17:46:36 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	PGSMSX101.gar.corp.intel.com ([169.254.1.119]) with mapi id
	14.03.0319.002; Fri, 6 Apr 2018 08:46:35 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: qemutest: add tests for qemu
	boot and shutdown
Thread-Index: AQHTzMUkroD4iNTmykCfeY84TZVEVKPy58xw
Date: Fri, 6 Apr 2018 00:46:36 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335E0049B@PGSMSX109.gar.corp.intel.com>
References: <1522888530-82278-1-git-send-email-ee.peng.yeoh@intel.com>
	<9DDD2658D1FE414E99172D2DB1E4D04335E0006E@PGSMSX109.gar.corp.intel.com>
	<c10d7df8-2f5e-b288-afc8-499f47f76724@linux.intel.com>
In-Reply-To: <c10d7df8-2f5e-b288-afc8-499f47f76724@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTc0ZWI4NmItZDdjYS00Mzg2LWI3YTctMmNjZjVmM2UxMzVjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ik5ydHMxZ2JrY1Y4YUJWQ0phZEc4NVwvbmtKM3kwZzhOb2p4dWJ2R3U5RlQ0PSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH] oe-selftest: qemutest: add tests for qemu boot and shutdown
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
X-List-Received-Date: Fri, 06 Apr 2018 00:46:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm90ZWQsIGxldCBtZSByZXdvcmsgb24gdGhpcy4gVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNr
ISANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmlu
IFttYWlsdG86YWxleGFuZGVyLmthbmF2aW5AbGludXguaW50ZWwuY29tXSANClNlbnQ6IFRodXJz
ZGF5LCBBcHJpbCA1LCAyMDE4IDU6NTYgUE0NClRvOiBZZW9oLCBFZSBQZW5nIDxlZS5wZW5nLnll
b2hAaW50ZWwuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
Q2M6IEVnZ2xldG9uLCBQYXVsIDxwYXVsLmVnZ2xldG9uQGludGVsLmNvbT4NClN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIXSBvZS1zZWxmdGVzdDogcWVtdXRlc3Q6IGFkZCB0ZXN0cyBmb3Ig
cWVtdSBib290IGFuZCBzaHV0ZG93bg0KDQpPbiAwNC8wNS8yMDE4IDExOjA5IEFNLCBZZW9oLCBF
ZSBQZW5nIHdyb3RlOg0KPiBJIGhhZCBkZXZlbG9wZWQgdGhpcyBzZWxmdGVzdCB0ZXN0Y2FzZSB0
byB0ZXN0IHFlbXUgY2FuIGJvb3QgbmZzICYNCj4gZXh0NCBhbmQgZmluYWxseSBzaHV0ZG93biBm
b3IgdmFyaW91cyBxZW11IGFyY2hpdGVjdHVyZS4NCj4gDQo+IEluaXRpYWxseSwgSSB3YXMgdGhp
bmtpbmcgdG8gZGV2ZWxvcCB0aGlzIGF1dG9tYXRlZCB0ZXN0IGFzIHBhcnQgb2YgDQo+IHRlc3Rp
bWFnZSBidXQgYXMgdGhpcyB0ZXN0IGludm9sdmUgc2h1dHRpbmcgZG93biBxZW11LCB0ZXN0aW1h
Z2UgDQo+IHRlc3RjYXNlcyBleGVjdXRlZCBhZnRlciB0aGlzIHdpbGwgZmFjZSBsb3N0IGNvbm5l
Y3Rpb24gdG8gcWVtdS4NCj4gRnVydGhlcm1vcmUsIHdoZW4gSSB0cmllZCB0byBhZGQgdGhpcyB0
ZXN0IHRvIHNlbGZ0ZXN0IHJ1bnFlbXUucHksIEkgDQo+IHJlYWxpemVkIHJ1bnFlbXUgd2FzIGRl
ZGljYXRlZCBmb3IgTUFDSElORT1xZW11eDg2LTY0IGFuZCBpdCB3YXMgDQo+IHRlc3RpbmcgdmFy
aW91cyBsaXZlIGltYWdlIChpc28gYW5kIGhkZGltZykgYnV0IGxpdmUgaW1hZ2Ugd2FzIG5vdCAN
Cj4gc3VwcG9ydGVkIGJ5IG90aGVyIHFlbXUgYXJjaGl0ZWN0dXJlLiBUaGVyZWZvcmUsIHRoaXMg
dGVzdCB3YXMgDQo+IGRldmVsb3BlZCBhcyBpbmRlcGVuZGVudCBzZWxmdGVzdCB0ZXN0Y2FzZS4N
Cj4gDQo+IFBsZWFzZSBsZXQgbWUga25vdyB5b3VyIGlucHV0cyBhbmQgZmVlZGJhY2suDQpJdCdz
IHRvdGFsbHkgb2theSB0byBoYXZlIHNldmVyYWwgdGVzdCBjbGFzc2VzIGluIGEgc2luZ2xlIC5w
eSBmaWxlIChzZWUgZm9yIGV4YW1wbGUgc2lnbmluZy5weSkuIEkgdGhpbmsgdGhpcyBzaG91bGQg
Z28gdG8gcnVucWVtdS5weSwgYXMgb3RoZXJ3aXNlIHRoZXJlIHdvdWxkIGJlIHR3byBkaWZmZXJl
bnQgZmlsZXMgZG9pbmcgcm91Z2hseSBzYW1lIHRoaW5nIGFuZCBuYW1lZCB2ZXJ5IHNpbWlsYXJs
eSAocnVucWVtdSBhbmQgcWVtdXRlc3Q/KSwgd2hpY2ggaXMgY29uZnVzaW5nLg0KDQpZb3UgY2Fu
IGFkZCBjb21tZW50cyB0byBib3RoIGNsYXNzZXMgdG8gZXhwbGFpbiB3aGF0IHRoZXkgZG8gYW5k
IHdoeSwgYW5kIGhvdyB0aGV5IGFyZSBkaWZmZXJlbnQuIChnZW5lcmFsbHksIGJlIGdlbmVyb3Vz
IHdpdGggY29tbWVudHMgZXZlcnkgdGltZSB0aGVyZSBpcyBwb3NzaWJpbGl0eSBmb3IgY29uZnVz
aW9uLCBvciB0aGUgY29kZSBkb2VzIHVudXN1YWwgdGhpbmdzDQpldGMuKQ0KDQpBbGV4DQo=

