Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B6EAD71A0F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 00:41:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2018 17:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,368,1517904000"; d="scan'208";a="38685375"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by orsmga003.jf.intel.com with ESMTP; 27 Mar 2018 17:41:14 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	PGSMSX111.gar.corp.intel.com ([169.254.2.233]) with mapi id
	14.03.0319.002; Wed, 28 Mar 2018 08:41:13 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: crosstap: add tests for
	crosstap script
Thread-Index: AQHTxbbF2Mt90x9reE+mAYyxOj0KDqPkzuZA
Date: Wed, 28 Mar 2018 00:41:12 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335DFC870@PGSMSX109.gar.corp.intel.com>
References: <1522114620-28569-1-git-send-email-ee.peng.yeoh@intel.com>
	<2840c7d5-baaf-5519-bf29-bf6048c8578d@linux.intel.com>
In-Reply-To: <2840c7d5-baaf-5519-bf29-bf6048c8578d@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzE5NWQ3NWMtZTZmMy00ZWRiLWFhYTUtYTAyNjA4YjFhN2Q2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImZTZjNkOU1Gd0FjVndWSk83cnErbVJTYk1ValpkVG9MdWNIeXpUWU1YMnc9In0=
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 28 Mar 2018 00:41:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleCwNCg0KWWVzLCByZXVzaW5nIGV4aXN0aW5nIHJ1bnFlbXUgbWFkZSB0aGlzIHRlc3Rj
YXNlIG1vcmUgY29uY2lzZSBhbmQgZWFzaWVyIHRvIG1haW50YWluLiBUaGFuayB5b3UgdmVyeSBt
dWNoIGZvciB5b3VyIGlucHV0cyBhbmQgc2hhcmluZyEgDQoNClRoYW5rcywNCkVlIFBlbmcgDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxleGFuZGVyIEthbmF2aW4gW21haWx0
bzphbGV4YW5kZXIua2FuYXZpbkBsaW51eC5pbnRlbC5jb21dIA0KU2VudDogVHVlc2RheSwgTWFy
Y2ggMjcsIDIwMTggNjozMiBQTQ0KVG86IFllb2gsIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRl
bC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gb2Utc2VsZnRlc3Q6IGNyb3NzdGFwOiBhZGQgdGVzdHMg
Zm9yIGNyb3NzdGFwIHNjcmlwdA0KDQpPbiAwMy8yNy8yMDE4IDA0OjM3IEFNLCBZZW9oIEVlIFBl
bmcgd3JvdGU6DQo+IFFBIHRlYW0gd2VyZSB0ZXN0aW5nIGNyb3NzdGFwIHNjcmlwdCBtYW51YWxs
eS4gQWRkIGF1dG9tYXRlZCB0ZXN0cyBhbmQgDQo+IHN5c3RlbXRhcCBmaWxlIHRvIHRlc3QgdGhh
dCBjcm9zc3RhcCBzY3JpcHQgd2lsbCBpbnN0cnVjdHMgU3lzdGVtVGFwIA0KPiB0byBwcmludCBo
ZWxsbyB3b3JsZCBpbiBxZW11LiBUaGlzIHRlc3Qgd2lsbCBmaXJzdCBidWlsdCANCj4gY29yZS1p
bWFnZS1taW5pbWFsIGltYWdlIHdpdGggdG9vbHMtcHJvZmlsZSAmIHNzaC1zZXJ2ZXItb3BlbnNz
aCANCj4gZmVhdHVyZXMgYW5kIGJ1aWxkIHN5c3RlbXRhcC1uYXRpdmUgb24gdGhlIGhvc3QgbWFj
aGluZS4gRmluYWxseSB0aGlzIA0KPiB0ZXN0IHdpbGwgYm9vdCB0aGUgaW1hZ2Ugd2l0aCBxZW11
IGFuZCB0aGVuIGV4ZWN1dGUgY3Jvc3N0YXAgc2NyaXB0IHRvIA0KPiBwcmludCBoZWxsbyB3b3Js
ZCBvbiBxZW11Lg0KDQpUaGFua3MsIHRoaXMgbG9va3MgbXVjaCBuaWNlciBub3csIGRvZXNuJ3Qg
aXQ/IDopIEkgaGF2ZSBubyBmdXJ0aGVyIGNvbW1lbnRzLCB0aGlzIGlzIGZpbmUuDQoNCkFsZXgN
Cg==

