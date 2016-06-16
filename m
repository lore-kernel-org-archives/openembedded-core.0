Return-Path: <zhenhua.luo@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0095.outbound.protection.outlook.com [157.56.112.95])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5B665CC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 06:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=sSMhgm9m+wpZ7GYYZVY1Ge6nnPQiMPpgo5STbkV6iIE=;
	b=jiitPmYgM+FpwcI0oe+eS7AWB7RB8oIZqvXPQH8TsouX2mjfn7UrDQVvXM+7TH4QAEDSwgJ6HzHIy62lBBd6Gm98Pw+hCGzeAg2a2TqdKwz/GOhznr1dSTDMb3Ow2LMEsavSCc9uzTw6yS6st2yKLYXluIzq2l1eNINpi8ce5fg=
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::14) by DB3PR04MB0682.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::12) with Microsoft SMTP Server (TLS) id 15.1.506.9;
	Thu, 16 Jun 2016 06:04:21 +0000
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::cc2b:ef35:1b5f:50ca]) by
	DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::cc2b:ef35:1b5f:50ca%18]) with mapi id 15.01.0501.018;
	Thu, 16 Jun 2016 06:04:21 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH] binutils: fix the incorrect
	assembling for ppc wait instruction
Thread-Index: AQHRxIpwtt+jElxKhkO9vymkJLrFJ5/rDGQAgACT3WA=
Date: Thu, 16 Jun 2016 06:04:21 +0000
Message-ID: <DB3PR04MB0684D92F7FBFB9CFEA594120EE560@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <1465722154-29644-1-git-send-email-zhenhua.luo@nxp.com>
	<CAMKF1sqwzZTrW=4t-Qw=hYzES8zJsLKXua9cV=Cd8-KPetxUkQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqwzZTrW=4t-Qw=hYzES8zJsLKXua9cV=Cd8-KPetxUkQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=zhenhua.luo@nxp.com; 
x-originating-ip: [199.59.226.141]
x-ms-office365-filtering-correlation-id: 64b01c7e-e51e-4198-657e-08d395ac0f87
x-microsoft-exchange-diagnostics: 1; DB3PR04MB0682;
	5:FUAKbzdY8OXVackd/f8XfqT/HikuWV4S6nPZDwldeE137J/kdZMtMXmVdJ6tXb9aLuWI9VfhT1VE8/EmJE5JErJs/m0hJdC1Qyyjn9WB/MqbWuzE7MRMR2jEvpxIvU5I6Po9KjDWyk8pNw/AM1gxUA==;
	24:C7et6JmaJ7La6pJc+PRQVTnxHBvJb7gjVemLF0xJDWeELn/vxVqPgMu0gyMlJxfaPjFR07wATzkBWfr91FRjl2ufvU04+lS9uPbICYuYiMQ=;
	7:RMZDQaRSGbzLUimzAZ2FIG2rSUig2Gfkhgd2ArLz8yWV2Jo5qcMJ+NPUdsnisJGKJH6XeuuV7vSqYhyQsYFjatlG/kPqjqYXEroxLo6B0Hl2ZTYb0onkksbJMJwsS5wcZ8OtTe1yZUFgpUM5e4vw5TEs/0hq/s4LOtn5ckI/QLHrv31XP0wPAqmiQ3vjqhHzojwnPjnbsD6msk35OziUQg==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB0682;
x-microsoft-antispam-prvs: <DB3PR04MB068276CFA9DDC9E2EC7AD6A9EE560@DB3PR04MB0682.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DB3PR04MB0682; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB0682; 
x-forefront-prvs: 09752BC779
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(189002)(199003)(13464003)(24454002)(377454003)(19580405001)(87936001)(76576001)(189998001)(33656002)(2950100001)(15975445007)(5002640100001)(1720100001)(5004730100002)(81156014)(68736007)(19580395003)(50986999)(3660700001)(76176999)(54356999)(97736004)(2900100001)(110136002)(3280700002)(101416001)(5003600100002)(5008740100001)(74316001)(81166006)(92566002)(86362001)(106116001)(2906002)(4326007)(8676002)(5250100002)(105586002)(6116002)(8936002)(586003)(102836003)(3846002)(11100500001)(66066001)(9686002)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB0682;
	H:DB3PR04MB0684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2016 06:04:21.5879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB0682
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: fix the incorrect assembling for ppc wait instruction
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
X-List-Received-Date: Thu, 16 Jun 2016 06:20:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB3aWxsIHNlbmQgdGhlIHBhdGNoIHRvIGJpbnV0aWxzIHVwc3RyZWFtLiANCg0KDQpCZXN0IFJl
Z2FyZHMsDQoNClpoZW5odWENCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBLaGVtIFJhaiBbbWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbV0NCj4gU2VudDogVGh1cnNkYXks
IEp1bmUgMTYsIDIwMTYgNToxMyBBTQ0KPiBUbzogWmhlbmh1YSBMdW8gPHpoZW5odWEubHVvQG54
cC5jb20+DQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBs
YXllciA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW29lLWNvcmVdW1BBVENIXSBiaW51dGlsczogZml4IHRoZSBp
bmNvcnJlY3QgYXNzZW1ibGluZw0KPiBmb3IgcHBjIHdhaXQgaW5zdHJ1Y3Rpb24NCj4gDQo+IE9u
IFN1biwgSnVuIDEyLCAyMDE2IGF0IDI6MDIgQU0sIFpoZW5odWEgTHVvIDx6aGVuaHVhLmx1b0Bu
eHAuY29tPiB3cm90ZToNCj4gPiBUaGUgd2FpdCBtbmVtb25pYyBmb3IgcHBjIHRhcmdldHMgaXMg
aW5jb3JyZWN0bHkgYXNzZW1ibGVkIGludG8NCj4gPiAweDdjMDAwMDNjIGR1ZSB0byBkdXBsaWNh
dGVkIGFkZHJlc3MgZGVmaW5pdGlvbiB3aXRoIHdhaXRhc2VjDQo+ID4gaW5zdHJ1Y3Rpb24uIFRo
ZSBpc3N1ZSBjYXVzZXMga2VybmVsIGJvb3QgY2FsbHRyYWNlIGZvciBwcGMgdGFyZ2V0cyB3aGVu
IHdhaXQNCj4gaW5zdHJ1Y3Rpb24gaXMgZXhlY3V0ZWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBaaGVuaHVhIEx1byA8emhlbmh1YS5sdW9AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLTIuMjYuaW5jICAgfCAgMSArDQo+ID4g
IC4uLm5jb3JyZWN0LWFzc2VtYmxpbmctZm9yLXBwYy13YWl0LW1uZW1vbmljLnBhdGNoIHwgMzYN
Cj4gPiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxNS1maXgtdGhlLWluY29ycmVjdC1hc3NlbWJsDQo+
ID4gaW5nLWZvci1wcGMtd2FpdC1tbmVtb25pYy5wYXRjaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy0yLjI2LmluYw0KPiA+IGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLTIuMjYuaW5jDQo+ID4gaW5k
ZXggNmQ1MzVmYy4uNmQ3NzQ1MiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYmludXRpbHMvYmludXRpbHMtMi4yNi5pbmMNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYmludXRpbHMvYmludXRpbHMtMi4yNi5pbmMNCj4gPiBAQCAtMzQsNiArMzQsNyBAQCBT
UkNfVVJJID0gIlwNCj4gPiAgICAgICBmaWxlOi8vMDAxMi1BZGQtc3VwcG9ydC1mb3ItTmV0bG9n
aWMtWExQLnBhdGNoIFwNCj4gPiAgICAgICBmaWxlOi8vMDAxMy1GaXgtR09ULWFkZHJlc3MtY29t
cHV0YXRpb25zLWluLWluaXRpYWwtUExULWVudHJpZXMtLnBhdGNoIFwNCj4gPiAgICAgICBmaWxl
Oi8vMDAxNC1Db3JyZWN0LW5pb3MyLV9ncC1hZGRyZXNzLWNvbXB1dGF0aW9uLnBhdGNoIFwNCj4g
PiArDQo+ID4gKyBmaWxlOi8vMDAxNS1maXgtdGhlLWluY29ycmVjdC1hc3NlbWJsaW5nLWZvci1w
cGMtd2FpdC1tbmVtb25pYy5wYXRjaA0KPiA+ICsgXA0KPiA+ICAiDQo+ID4gIFMgID0gIiR7V09S
S0RJUn0vZ2l0Ig0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTUtZml4LXRoZS1pbmNvcnJlY3QtYXNzZW0NCj4gPiBi
bGluZy1mb3ItcHBjLXdhaXQtbW5lbW9uaWMucGF0Y2gNCj4gPiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9iaW51dGlscy9iaW51dGlscy8wMDE1LWZpeC10aGUtaW5jb3JyZWN0LWFzc2VtDQo+ID4g
YmxpbmctZm9yLXBwYy13YWl0LW1uZW1vbmljLnBhdGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPiBpbmRleCAwMDAwMDAwLi41YWE1ZTMxDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDE1LWZpeC10aGUt
aW5jb3JyZWN0LWENCj4gPiArKysgc3NlbWJsaW5nLWZvci1wcGMtd2FpdC1tbmVtb25pYy5wYXRj
aA0KPiA+IEBAIC0wLDAgKzEsMzYgQEANCj4gPiArRnJvbSA3OGRlY2JlYjg0ZmI2MGRiNGU1NDlh
ZDNlOGViMzRlMDMwZTk2ZDM5IE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gPiArMjAwMQ0KPiA+ICtG
cm9tOiBaaGVuaHVhIEx1byA8emhlbmh1YS5sdW9AbnhwLmNvbT4NCj4gPiArRGF0ZTogU2F0LCAx
MSBKdW4gMjAxNiAyMjowODoyOSAtMDUwMA0KPiA+ICtTdWJqZWN0OiBbUEFUQ0hdIGZpeCB0aGUg
aW5jb3JyZWN0IGFzc2VtYmxpbmcgZm9yIHBwYyB3YWl0IG1uZW1vbmljDQo+ID4gKw0KPiA+ICtT
aWduZWQtb2ZmLWJ5OiBaaGVuaHVhIEx1byA8emhlbmh1YS5sdW9AbnhwLmNvbT4NCj4gPiArDQo+
ID4gK1Vwc3RyZWFtLVN0YXR1czogUGVuZGluZw0KPiA+ICstLS0NCj4gPiArIG9wY29kZXMvcHBj
LW9wYy5jIHwgMyArLS0NCj4gPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gPiArDQo+ID4gK2RpZmYgLS1naXQgYS9vcGNvZGVzL3BwYy1vcGMuYyBi
L29wY29kZXMvcHBjLW9wYy5jIGluZGV4DQo+ID4gK2U4YzkyZjYuLmE5ZGU0NzQgMTAwNjQ0DQo+
ID4gKy0tLSBhL29wY29kZXMvcHBjLW9wYy5jDQo+ID4gKysrKyBiL29wY29kZXMvcHBjLW9wYy5j
DQo+ID4gK0BAIC00Nzc3LDcgKzQ3NzcsNiBAQCBjb25zdCBzdHJ1Y3QgcG93ZXJwY19vcGNvZGUg
cG93ZXJwY19vcGNvZGVzW10NCj4gPSB7DQo+ID4gKyB7ImxkZXB4IiwgICAgIFgoMzEsMjkpLCAg
ICAgICBYX01BU0ssICAgICAgRTUwME1DfFBQQ0EyfFBQQ1ZMRSwgUFBDTk9ORSwNCj4ge1JULCBS
QTAsIFJCfX0sDQo+ID4gKw0KPiA+ICsgeyJ3YWl0YXNlYyIsICBYKDMxLDMwKSwgICAgICAgWFJU
UkFSQl9NQVNLLFBPV0VSOCwgICAgUE9XRVI5LCAgICAgICAgIHswfX0sDQo+ID4gKy17IndhaXQi
LCAgICAgIFgoMzEsMzApLCAgICAgICBYV0NfTUFTSywgICAgUE9XRVI5LCAgICBQUENOT05FLCAg
ICAgICAge1dDfX0sDQo+ID4gKw0KPiA+ICsgeyJsd2VweCIsICAgICBYKDMxLDMxKSwgICAgICAg
WF9NQVNLLCAgICAgIEU1MDBNQ3xQUENBMnxQUENWTEUsIFBQQ05PTkUsDQo+IHtSVCwgUkEwLCBS
Qn19LA0KPiA+ICsNCj4gPiArQEAgLTQ4MzEsNyArNDgzMCw3IEBAIGNvbnN0IHN0cnVjdCBwb3dl
cnBjX29wY29kZSBwb3dlcnBjX29wY29kZXNbXQ0KPiA9DQo+ID4gK3sNCj4gPiArDQo+ID4gKyB7
IndhaXRyc3YiLCAgIFgoMzEsNjIpfCgxPDwyMSksIDB4ZmZmZmZmZmYsIEU1MDBNQ3xQUENBMiwg
UFBDTk9ORSwgICAgezB9fSwNCj4gPiArIHsid2FpdGltcGwiLCAgWCgzMSw2Mil8KDI8PDIxKSwg
MHhmZmZmZmZmZiwgRTUwME1DfFBQQ0EyLCBQUENOT05FLCAgICB7MH19LA0KPiA+ICsteyJ3YWl0
IiwgICAgICBYKDMxLDYyKSwgICAgICAgWFdDX01BU0ssICAgIEU1MDBNQ3xQUENBMnxQUENWTEUs
IFBQQ05PTkUsDQo+IHtXQ319LA0KPiA+ICsreyJ3YWl0IiwgICAgICBYKDMxLDYyKSwgICAgICAg
WFdDX01BU0ssICAgIEU1MDBNQ3xQUENBMnxQUENWTEV8UE9XRVI5LA0KPiBQUENOT05FLCB7V0N9
fSwNCj4gDQo+IHBsZWFzZSBzdWJtaXQgaXQgdG8gYmludXRpbHMgdXBzdHJlYW0gdG9vLg0KPiAN
Cj4gPiArDQo+ID4gKyB7ImRjYnN0ZXAiLCAgIFhSVCgzMSw2MywwKSwgICBYUlRfTUFTSywgICAg
RTUwME1DfFBQQ0EyfFBQQ1ZMRSwNCj4gUFBDTk9ORSwge1JBMCwgUkJ9fSwNCj4gPiArDQo+ID4g
Ky0tDQo+ID4gKzIuNS4wDQo+ID4gKw0KPiA+IC0tDQo+ID4gMi40LjExDQo+ID4NCj4gPiAtLQ0K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4g
T3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==

