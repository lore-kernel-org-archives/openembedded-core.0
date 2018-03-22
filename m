Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DB39A7896D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 00:50:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2018 17:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,342,1517904000"; d="scan'208";a="25964467"
Received: from kmsmsx153.gar.corp.intel.com ([172.21.73.88])
	by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2018 17:50:51 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	KMSMSX153.gar.corp.intel.com ([169.254.5.187]) with mapi id
	14.03.0319.002; Thu, 22 Mar 2018 08:50:50 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: crosstap: add tests for
	crosstap script
Thread-Index: AQHTwRrO2Mt90x9reE+mAYyxOj0KDqPba7yA
Date: Thu, 22 Mar 2018 00:50:50 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335DFA1B9@PGSMSX109.gar.corp.intel.com>
References: <1521503987-70014-1-git-send-email-ee.peng.yeoh@intel.com>
	<cec1c204-c8c1-74da-d89d-bba2ed0d369c@linux.intel.com>
In-Reply-To: <cec1c204-c8c1-74da-d89d-bba2ed0d369c@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDAwMzhlOTUtNzM2Yy00MGUzLWJmMWQtNGU4MDQ5Y2FmYWViIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Im9oK1wvR25UQVlJRTE0SWsxeWRnelRHU0hwYWZcL24zVW1YMUZoVzNEeEhYQT0ifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
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
X-List-Received-Date: Thu, 22 Mar 2018 00:50:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleCwNCg0KRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBvZXFhLnV0aWxzLmNvbW1hbmRzLnJ1
bnFlbXUgd2lsbCBzdGFydCBhbmQgc3RvcCBxZW11IGluIGEgc2luZ2xlIGNhbGwuIA0KRm9yIGNy
b3NzdGFwIHRlc3RjYXNlLCBpdCByZXF1aXJlIHRoZSBzdGVwcyBiZWxvdzoNCgktIHN0YXJ0IHFl
bXUNCgktIGNhbGwgdG8gY3Jvc3N0YXAgdG8gc3NoIGludG8gcWVtdSB0byB1c2Ugc3lzdGVtdGFw
DQoJLSBzdG9wIHFlbXUNCg0KVGhlcmVmb3JlLCBjcm9zc3RhcCB0ZXN0Y2FzZSB1c2UgdGhlIG9l
cWEudGFyZ2V0Y29udHJvbC5RZW11VGFyZ2V0ICh1c2VkIGJ5IHJ1bnFlbXUpIHRvIGZpcnN0IHN0
YXJ0IHFlbXUsIHBlcmZvcm0gY2FsbCB0byBjcm9zc3RhcCwgdGhlbiBzdG9wIHFlbXUuIA0KDQpQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgd2FzIGFueSBhbHRlcm5hdGl2ZSB3YXkuIA0KDQpU
aGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGlucHV0cyBhbmQgaGVscCENCg0KVGhhbmtzLA0K
RWUgUGVuZyANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBL
YW5hdmluIFttYWlsdG86YWxleGFuZGVyLmthbmF2aW5AbGludXguaW50ZWwuY29tXSANClNlbnQ6
IFdlZG5lc2RheSwgTWFyY2ggMjEsIDIwMTggOTo0NSBQTQ0KVG86IFllb2gsIEVlIFBlbmcgPGVl
LnBlbmcueWVvaEBpbnRlbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gb2Utc2VsZnRlc3Q6IGNyb3Nz
dGFwOiBhZGQgdGVzdHMgZm9yIGNyb3NzdGFwIHNjcmlwdA0KDQpPbiAwMy8yMC8yMDE4IDAxOjU5
IEFNLCBZZW9oIEVlIFBlbmcgd3JvdGU6DQo+ICsgICAgZGVmIHN0YXJ0X3FlbXVfd2l0aF9pbWFn
ZShzZWxmLCByZWNpcGUsIGZzdHlwZXMsIGNtZCwgdGFyZ2V0bG9nZ2VyKToNCj4gKyAgICAgICAg
dGluZm9pbCA9IGJiLnRpbmZvaWwuVGluZm9pbCgpDQo+ICsgICAgICAgIHRpbmZvaWwucHJlcGFy
ZShjb25maWdfb25seT1GYWxzZSwgcXVpZXQ9VHJ1ZSkNCj4gKyAgICAgICAgdHJ5Og0KPiArICAg
ICAgICAgICAgdGluZm9pbC5sb2dnZXIuc2V0TGV2ZWwobG9nZ2luZy5XQVJOSU5HKQ0KPiArICAg
ICAgICAgICAgdGluZm9pbC5jb25maWdfZGF0YS5zZXRWYXIoIlRFU1RfTE9HX0RJUiIsICIke1dP
UktESVJ9L3Rlc3RpbWFnZSIpDQo+ICsgICAgICAgICAgICB0aW5mb2lsLmNvbmZpZ19kYXRhLnNl
dFZhcigiVEVTVF9RRU1VQk9PVF9USU1FT1VUIiwgIjEwMDAiKQ0KPiArICAgICAgICAgICAgIyBU
ZWxsIFFlbXVUYXJnZXQoKSB3aGV0aGVyIG5lZWQgZmluZCByb290ZnMva2VybmVsIG9yIG5vdA0K
PiArICAgICAgICAgICAgI3RpbmZvaWwuY29uZmlnX2RhdGEuc2V0VmFyKCJGSU5EX1JPT1RGUyIs
ICcwJykNCj4gKyAgICAgICAgICAgIHJlY2lwZWRhdGEgPSB0aW5mb2lsLnBhcnNlX3JlY2lwZShy
ZWNpcGUpDQo+ICsgICAgICAgICAgICBsb2dkaXIgPSByZWNpcGVkYXRhLmdldFZhcigiVEVTVF9M
T0dfRElSIikNCj4gKyAgICAgICAgICAgIHFlbXUgPSBvZXFhLnRhcmdldGNvbnRyb2wuUWVtdVRh
cmdldChyZWNpcGVkYXRhLCB0YXJnZXRsb2dnZXIsIGZzdHlwZXMpDQo+ICsgICAgICAgIGZpbmFs
bHk6DQo+ICsgICAgICAgICAgICAjIFdlIG5lZWQgdG8gc2h1dCBkb3duIHRpbmZvaWwgZWFybHkg
aGVyZSBpbiBjYXNlIHdlIGFjdHVhbGx5IHdhbnQNCj4gKyAgICAgICAgICAgICMgdG8gcnVuIHRp
bmZvaWwtdXNpbmcgdXRpbGl0aWVzIHdpdGggdGhlIHJ1bm5pbmcgUUVNVSBpbnN0YW5jZS4NCj4g
KyAgICAgICAgICAgICMgTHVja2lseSBRZW11VGFyZ2V0IGRvZXNuJ3QgbmVlZCBpdCBhZnRlciB0
aGUgY29uc3RydWN0b3IuDQo+ICsgICAgICAgICAgICB0aW5mb2lsLnNodXRkb3duKCkNCj4gKyAg
ICAgICAgcHJpbnQoJ0RFQlVHOiBxZW11LmRlcGxveScpDQo+ICsgICAgICAgIHFlbXUuZGVwbG95
KCkNCj4gKyAgICAgICAgdHJ5Og0KPiArICAgICAgICAgICAgcHJpbnQoJ0RFQlVHOiBxZW11LnN0
YXJ0JykNCj4gKyAgICAgICAgICAgIHFlbXUuc3RhcnQoc3NoPVRydWUsIGxhdW5jaF9jbWQ9Y21k
LCBkaXNjYXJkX3dyaXRlcz1UcnVlKQ0KPiArICAgICAgICBleGNlcHQgYmIuYnVpbGQuRnVuY0Zh
aWxlZDoNCj4gKyAgICAgICAgICAgIHJhaXNlIEV4Y2VwdGlvbignRmFpbGVkIHRvIHN0YXJ0IFFF
TVUgLSBzZWUgdGhlIGxvZ3MgaW4gDQo+ICsgJXMnICUgbG9nZGlyKQ0KPiArDQo+ICsgICAgICAg
IHJldHVybiBxZW11DQoNCkNhbiB5b3UgdXNlIHJ1bnFlbXUgZnJvbSBvZXFhLnV0aWxzLmNvbW1h
bmRzLCBpbnN0ZWFkIG9mIHRoaXMgY3VzdG9tIGhhbmQtd3JpdHRlbiBpbnZvY2F0aW9uPyBUaGVy
ZSBhcmUgcGxlbnR5IG9mIGV4YW1wbGVzIGluIG9lLXNlbGZ0ZXN0cywgZS5nLjoNCg0KICAgICAg
ICAgICAgICAgICAgICAgd2l0aCBydW5xZW11KCdjb3JlLWltYWdlLW1pbmltYWwnKSBhcyBxZW11
Og0KICAgICAgICAgICAgICAgICAgICAgICAgICMgTWFrZSB0aGUgdGVzdCBlY2hvIGEgc3RyaW5n
IGFuZCBzZWFyY2ggZm9yIHRoYXQgYXMNCiAgICAgICAgICAgICAgICAgICAgICAgICAjIHJ1bl9z
ZXJpYWwoKSdzIHN0YXR1cyBjb2RlIGlzIHVzZWxlc3MuJw0KICAgICAgICAgICAgICAgICAgICAg
ICAgIGZvciBmaWxlbmFtZSBpbiAoInJvb3RmcyIsICJkZWxheWVkLWEiLA0KImRlbGF5ZWQtYiIp
Og0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMsIG91dHB1dCA9IHFlbXUucnVu
X3NlcmlhbCgidGVzdCAtZiAlcyAmJiBlY2hvIGZvdW5kIiAlIG9zLnBhdGguam9pbih0YXJnZXR0
ZXN0ZGlyLCBmaWxlbmFtZSkpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlbGYuYXNz
ZXJ0RXF1YWwob3V0cHV0LCAiZm91bmQiLCAiJXMgd2FzIG5vdCBwcmVzZW50IG9uIGJvb3QiICUg
ZmlsZW5hbWUpDQoNCg0KQWxleA0K

