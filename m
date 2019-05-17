Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 1266F7E0CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 07:07:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2019 00:07:08 -0700
X-ExtLoop1: 1
Received: from kmsmsx155.gar.corp.intel.com ([172.21.73.106])
	by orsmga006.jf.intel.com with ESMTP; 17 May 2019 00:07:09 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.94]) by
	KMSMSX155.gar.corp.intel.com ([169.254.15.97]) with mapi id
	14.03.0415.000; Fri, 17 May 2019 15:07:08 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2 v3] oeqa/runtime/cases/rpm.py: Enable rpm
	install dependency testing
Thread-Index: AQHVDHYLG0snnnaEPk+goMfWaVU+IqZu5IUg
Date: Fri, 17 May 2019 07:07:07 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D043481D364D@PGSMSX109.gar.corp.intel.com>
References: <1558058834-5442-1-git-send-email-ee.peng.yeoh@intel.com>
	<fe1b8cfea44ceae5c688b4603f4b72ed3aa64c8c.camel@linuxfoundation.org>
In-Reply-To: <fe1b8cfea44ceae5c688b4603f4b72ed3aa64c8c.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDY5YzYxMjItYzE5NS00MTAyLTlmYmMtNGZiMDBkNThjOWI5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiU1hSOER4RmxVb0VDU0VnK0JWUUk2V3JxenRBaDNQcStPbU1HWk1MenFqSEVPWXVrcUJUNU9XMXBtUHA1dEN0NiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2 v3] oeqa/runtime/cases/rpm.py: Enable rpm install dependency testing
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
X-List-Received-Date: Fri, 17 May 2019 07:07:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KWWVzLCB5b3UgYXJlIHJpZ2h0LCB3ZSBhcmUgY2hlY2tpbmcgZGlyZWN0
b3J5IGFuZCBwYWNrYWdlIG9uIHRoZSBob3N0IHNlcnZlci9tYWNoaW5lLiANCkFjdHVhbGx5LCB0
aGlzIG1lc3NhZ2Ugd2FzIGluaGVyaXRlZCBmcm9tIHdpdGhpbiB0aGUgcnBtLCBJIGhhZCBtYWRl
IHRoZSBjb3JyZWN0aW9uIG9uIHRoaXMgbmV3IHBhdGNoLiBJIHNoYWxsIHN1Ym1pdCBhbm90aGVy
IHBhdGNoIHRvIGNvcnJlY3Rpb24gZm9yIHRoZSBtZXNzYWdlIGluc2lkZSBleGlzdGluZyBycG0g
dGVzdCBiYXNlIGNvZGUuIA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGlucHV0cy4g
DQoNClRoYW5rcywNClllb2ggRWUgUGVuZyANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IFJpY2hhcmQgUHVyZGllIFttYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0
aW9uLm9yZ10gDQpTZW50OiBGcmlkYXksIE1heSAxNywgMjAxOSAyOjAyIFBNDQpUbzogWWVvaCwg
RWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMiB2M10g
b2VxYS9ydW50aW1lL2Nhc2VzL3JwbS5weTogRW5hYmxlIHJwbSBpbnN0YWxsIGRlcGVuZGVuY3kg
dGVzdGluZw0KDQpIaSBFZSBQZW5nLA0KDQpPbiBGcmksIDIwMTktMDUtMTcgYXQgMTA6MDcgKzA4
MDAsIFllb2ggRWUgUGVuZyB3cm90ZToNCj4gQ29udmVydCBtYW51YWwgdGVzdGNhc2UgYnNwcy1o
dy5ic3BzLWh3LnJwbV8tIA0KPiBfX2luc3RhbGxfZGVwZW5kZW5jeV9wYWNrYWdlIGZyb20gb2Vx
YS9tYW51YWwvYnNwLWh3Lmpzb24gdG8gcnVudGltZSANCj4gYXV0b21hdGVkIHRlc3QuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBZZW9oIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL3JwbS5weSB8IDM0DQo+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2Vz
L3JwbS5weQ0KPiBiL21ldGEvbGliL29lcWEvcnVudGltZS9jYXNlcy9ycG0ucHkNCj4gaW5kZXgg
ZDhjYWJkMy4uY2UzZmNlMSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nh
c2VzL3JwbS5weQ0KPiArKysgYi9tZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvcnBtLnB5DQo+
IEBAIC0xMzUsMyArMTM1LDM3IEBAIGNsYXNzIFJwbUluc3RhbGxSZW1vdmVUZXN0KE9FUnVudGlt
ZVRlc3RDYXNlKToNCj4gICAgICAgICAgIyBDaGVjayB0aGF0IHRoZXJlJ3MgZW5vdWdoIG9mIHRo
ZW0NCj4gICAgICAgICAgc2VsZi5hc3NlcnRHcmVhdGVyRXF1YWwoaW50KG91dHB1dCksIDgwLA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnQ291bmQgbm90IGZpbmQgc3Vm
ZmljaWVudCBhbW91bnQgDQo+IG9mIHJwbSBlbnRyaWVzIGluIC92YXIvbG9nL21lc3NhZ2VzLCBm
b3VuZCB7fQ0KPiBlbnRyaWVzJy5mb3JtYXQob3V0cHV0KSkNCj4gKw0KPiArICAgIEBPRVRlc3RE
ZXBlbmRzKFsncnBtLlJwbUJhc2ljVGVzdC50ZXN0X3JwbV9xdWVyeSddKQ0KPiArICAgIGRlZiB0
ZXN0X3JwbV9pbnN0YWxsX2RlcGVuZGVuY3koc2VsZik6DQo+ICsgICAgICAgIHJwbWRpciA9IG9z
LnBhdGguam9pbihzZWxmLnRjLnRkWydERVBMT1lfRElSJ10sICdycG0nLA0KPiAnbm9hcmNoJykN
Cj4gKyAgICAgICAgaWYgbm90IG9zLnBhdGguZXhpc3RzKHJwbWRpcik6DQo+ICsgICAgICAgICAg
ICBzZWxmLnNraXBUZXN0KCdObyAlcyBvbiB0YXJnZXQnICUgcnBtZGlyKQ0KDQpUaGlzIG1lc3Nh
Z2UgZG9lc24ndCBzb3VuZCBxdWl0ZSByaWdodCBhcyB5b3UncmUgY2hlY2tpbmcgZm9yIHJwbWRp
ciBsb2NhbGx5IG9uIHRoZSBidWlsZCBzZXJ2ZXIsIG5vdCBvbiB0YXJnZXQ/IENvdWxkIHlvdSBj
bGFyaWZ5IHRoYXQgcGxlYXNlPw0KDQorICAgICAgICAgICAgaWYgbm90IHJwbV90ZXN0c1tycG1d
Og0KKyAgICAgICAgICAgICAgICBzZWxmLnNraXBUZXN0KCdObyAlcyBvbiB0YXJnZXQnICUgb3Mu
cGF0aC5qb2luKHJwbWRpciwgDQorIHJwbSkpDQoNClRoZSBzYW1lIGlzc3VlIGhlcmUsIHRoZXNl
IGZpbGVzIGFyZSBub3QgYmVpbmcgc2VhcmNoZWQgZm9yICJvbiB0YXJnZXQiLg0KDQpDaGVlcnMs
DQoNClJpY2hhcmQNCg0KDQoNCg==

