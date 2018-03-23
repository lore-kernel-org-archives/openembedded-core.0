Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 12FAA6025E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 01:32:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 18:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,347,1517904000"; d="scan'208";a="210602726"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
	by orsmga005.jf.intel.com with ESMTP; 22 Mar 2018 18:32:58 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	KMSMSX154.gar.corp.intel.com ([169.254.12.61]) with mapi id
	14.03.0319.002; Fri, 23 Mar 2018 09:32:57 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: crosstap: add tests for
	crosstap script
Thread-Index: AQHTwRrO2Mt90x9reE+mAYyxOj0KDqPcJEV6gADnDPA=
Date: Fri, 23 Mar 2018 01:32:56 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335DFAAE2@PGSMSX109.gar.corp.intel.com>
References: <1521503987-70014-1-git-send-email-ee.peng.yeoh@intel.com>
	<cec1c204-c8c1-74da-d89d-bba2ed0d369c@linux.intel.com>
	<9DDD2658D1FE414E99172D2DB1E4D04335DFA1B9@PGSMSX109.gar.corp.intel.com>
	<a60cf40f-d4f3-c8a1-fa2b-42e31cc91518@linux.intel.com>
In-Reply-To: <a60cf40f-d4f3-c8a1-fa2b-42e31cc91518@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2I0ZDU4M2UtNDRhZC00OTBlLWI4N2EtZTExNjc3NTliM2ZmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlZGQytlcVQ1NUViNDVUc2J2Z1FrVHZQQ0dwMDcxUHczOWVNN2d3VUhkN2s9In0=
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] oe-selftest: crosstap: add tests for crosstap script
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
X-List-Received-Date: Fri, 23 Mar 2018 01:32:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleCwNCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBncmVhdCBzaGFyaW5nIQ0K
WWVzLCB1bmRlcnN0b29kIG5vdywgbGV0IG1lIHJlZmFjdG9yIHRoaXMgdGVzdGNhc2UgdG8gdXNl
IHJ1bnFlbXUgaW5zdGVhZC4gDQoNClRoYW5rcywNCkVlIFBlbmcgDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiBbbWFpbHRvOmFsZXhhbmRlci5r
YW5hdmluQGxpbnV4LmludGVsLmNvbV0gDQpTZW50OiBUaHVyc2RheSwgTWFyY2ggMjIsIDIwMTgg
NzozOCBQTQ0KVG86IFllb2gsIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+OyBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogUGF1bCBFZ2dsZXRvbiA8
cGF1bC5lZ2dsZXRvbkBsaW51eC5pbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSF0gb2Utc2VsZnRlc3Q6IGNyb3NzdGFwOiBhZGQgdGVzdHMgZm9yIGNyb3NzdGFwIHNjcmlw
dA0KDQpPbiAwMy8yMi8yMDE4IDAyOjUwIEFNLCBZZW9oLCBFZSBQZW5nIHdyb3RlOg0KPiAgRnJv
bSBteSB1bmRlcnN0YW5kaW5nLCBvZXFhLnV0aWxzLmNvbW1hbmRzLnJ1bnFlbXUgd2lsbCBzdGFy
dCBhbmQgc3RvcCBxZW11IGluIGEgc2luZ2xlIGNhbGwuDQoNClRoYXQncyBub3QgdGhlIGNhc2Ug
YXQgYWxsLiBQbGVhc2UgbG9vayBhdCB0aGUgZXhhbXBsZSBiZWxvdyBhZ2FpbjoNCg0KICAgICAg
ICAgICAgICAgICAgICAgd2l0aCBydW5xZW11KCdjb3JlLWltYWdlLW1pbmltYWwnKSBhcyBxZW11
Og0KICAgICAgICAgICAgICAgICAgICAgICAgICAjIE1ha2UgdGhlIHRlc3QgZWNobyBhIHN0cmlu
ZyBhbmQgc2VhcmNoIGZvciB0aGF0IGFzDQogICAgICAgICAgICAgICAgICAgICAgICAgICMgcnVu
X3NlcmlhbCgpJ3Mgc3RhdHVzIGNvZGUgaXMgdXNlbGVzcy4nDQogICAgICAgICAgICAgICAgICAg
ICAgICAgIGZvciBmaWxlbmFtZSBpbiAoInJvb3RmcyIsICJkZWxheWVkLWEiLA0KImRlbGF5ZWQt
YiIpOg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzLCBvdXRwdXQgPSBxZW11
LnJ1bl9zZXJpYWwoInRlc3QgLWYgJXMgJiYgZWNobyBmb3VuZCIgJSBvcy5wYXRoLmpvaW4odGFy
Z2V0dGVzdGRpciwgZmlsZW5hbWUpKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2Vs
Zi5hc3NlcnRFcXVhbChvdXRwdXQsICJmb3VuZCIsICIlcyB3YXMgbm90IHByZXNlbnQgb24gYm9v
dCIgJSBmaWxlbmFtZSkNCg0KSXQgc3RhcnRzIHFlbXUsIHRoZW4gZG9lcyB0aGluZ3MgKHFlbXUu
cnVuX3NlcmlhbCgpICkgd2l0aCB0aGF0IHJ1bm5pbmcgcWVtdSBpbnN0YW5jZS4gSG93IGFuZCB3
aGVyZSBxZW11IGdldHMgc3RvcHBlZCBpcyB0aGUgJ21hZ2ljJyBvZiAnd2l0aCcgDQpzdGF0ZW1l
bnQuDQoNClRoZSBrZXkgcGFydCBpcyB0aGF0IHJ1bnFlbXUoKSBoYXMgYSBAY29udGV4dG1hbmFn
ZXIgZGVjb3JhdG9yIGFuZCBjb250YWlucyB0aGlzIHN0YXRlbWVudCBpbnNpZGU6DQoNCgl5aWVs
ZCBxZW11DQoNCndoaWNoICdzdXNwZW5kcycgdGhlIHJ1bnFlbXUoKSBleGVjdXRpb24gYW5kIHJl
c3VtZXMgdGhlIGNhbGxlciBmdW5jdGlvbiwgcGFzc2luZyBpdCB0aGUgcWVtdSBvYmplY3QuIE9u
Y2UgdGhlICd3aXRoJyBibG9jayBjb21wbGV0ZXMgaW4gdGhlIGNhbGxlciwgdGhlIHJ1bnFlbXUo
KSBmdW5jdGlvbiBpcyBhbGxvd2VkIHRvIHJlc3VtZSBhbmQgY2xlYW4gdXAgdGhlIHJ1bm5pbmcg
cWVtdSBpbnN0YW5jZS4gSXQncyBkZWZpbml0ZWx5IG5vdCBhIHN5bmNocm9ub3VzIGNhbGwvcmV0
dXJuIHRoaW5nLiBZb3UgY2FuIHJlYWQgYWxsIGFib3V0IGl0IGhlcmU6DQoNCmh0dHBzOi8vZG9j
cy5weXRob24ub3JnLzMvbGlicmFyeS9jb250ZXh0bGliLmh0bWwNCg0KDQo+IEZvciBjcm9zc3Rh
cCB0ZXN0Y2FzZSwgaXQgcmVxdWlyZSB0aGUgc3RlcHMgYmVsb3c6DQo+IAktIHN0YXJ0IHFlbXUN
Cj4gCS0gY2FsbCB0byBjcm9zc3RhcCB0byBzc2ggaW50byBxZW11IHRvIHVzZSBzeXN0ZW10YXAN
Cj4gCS0gc3RvcCBxZW11DQo+IA0KPiBUaGVyZWZvcmUsIGNyb3NzdGFwIHRlc3RjYXNlIHVzZSB0
aGUgb2VxYS50YXJnZXRjb250cm9sLlFlbXVUYXJnZXQgKHVzZWQgYnkgcnVucWVtdSkgdG8gZmly
c3Qgc3RhcnQgcWVtdSwgcGVyZm9ybSBjYWxsIHRvIGNyb3NzdGFwLCB0aGVuIHN0b3AgcWVtdS4N
Cg0KcnVucWVtdSgpIHdhcyB3cml0dGVuIGZvciBwcmVjaXNlbHkgdGhpcyB1c2UgY2FzZS4NCg0K
DQpBbGV4DQo=

