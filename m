Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.8704.1615558400934391728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 06:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Mz4TxINC;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615558401;
  x=1647094401;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1gpTyRUdMUQFey/tnIMgKCFJZ+whMp2BKDFNJGCcl3g=;
  b=Mz4TxINCVPxo+g93v/qZRR0pEDnDNkbiTCn7CLIaBKQ9AfwhegFYYRKd
   4p3i8IFTeF5oQ4SBD4rzAmB7xndn+SgmNzYrB3CvID8LliLn6CPJ26j8z
   bXYGbAIN6eBkoCwSLvW+XRE69K+2Esop5sVSp0JI/cSlEW7R8SRBLIiGs
   tNuD/kGhhCcWIqEP1C9eaa3XMmvGJn4xacW3h75BkXUCX9aYwzE0wvyV3
   QuxwZJ4VuIS0up6mdCCGdyD1x/3gJj1nlnqzFgUHeeWI2mQRrMY1aPYNZ
   C2KxyyV5ALZLF1etw07lTs8PrE8eqcYkMvnFEqAe39OjtxYSVjw5BQi2U
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a warning when login with root is disabled
Thread-Topic: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a
 warning when login with root is disabled
Thread-Index: AQHXEaJAFlaSBNRe3Umg6Mc/Bc9OP6p1KqKwgAYergCABSXggA==
Date: Fri, 12 Mar 2021 14:13:17 +0000
Message-ID: <e67217d10fc244b58cb3ef73815cf37f@XBOX03.axis.com>
References: <cover.1614916931.git.liezhi.yang@windriver.com>
 <870b35befc0b8fa9cd1c3a03fcfd2395440c2f41.1614916931.git.liezhi.yang@windriver.com>
 <f23d196c13f24731a5a7e00ff139aa42@XBOX03.axis.com>
 <975479fc-e8f4-dccd-56c9-3d830cc5dc54@windriver.com>
In-Reply-To: <975479fc-e8f4-dccd-56c9-3d830cc5dc54@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhp
LnlhbmdAd2luZHJpdmVyLmNvbT4NCj4gU2VudDogZGVuIDkgbWFycyAyMDIxIDA5OjMyDQo+IFRv
OiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IG9wZW5l
bWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDEvMV0gcm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzOiBQcmludCBh
DQo+IHdhcm5pbmcgd2hlbiBsb2dpbiB3aXRoIHJvb3QgaXMgZGlzYWJsZWQNCj4gDQo+IEhpIFBl
dGVyLA0KPiANCj4gT24gMy81LzIxIDY6MTggUE0sIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToN
Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiA+PiBjb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSb2JlcnQgWWFuZw0KPiA+PiBTZW50
OiBkZW4gNSBtYXJzIDIwMjEgMDk6NDkNCj4gPj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gU3ViamVjdDogW09FLWNvcmVdIFtQQVRDSCAxLzFdIHJv
b3Rmcy1wb3N0Y29tbWFuZHMuYmJjbGFzczogUHJpbnQgYQ0KPiB3YXJuaW5nIHdoZW4gbG9naW4g
d2l0aCByb290IGlzIGRpc2FibGVkDQo+ID4+DQo+ID4+IEZpeGVkOg0KPiA+PiBFWFRSQV9JTUFH
RV9GRUFUVVJFU19yZW1vdmUgPSAiZGVidWctdHdlYWtzIg0KPiA+PiAkIGJpdGJha2UgY29yZS1p
bWFnZS1taW5pbWFsDQo+ID4+DQo+ID4+IFRoZW4gd2UgY2FuJ3QgbG9naW4gdG8gdGhlIHN5c3Rl
bSB3aXRoIHJvb3Qgd2l0aG91dCBhbnkgbWVzc2FnZXMuIEFkZCBhDQo+IHdhcm5pbmcNCj4gPj4g
bWFrZXMgaXQgZWFzeSB0byBkZWJ1Zy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0
IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIG1ldGEv
Y2xhc3Nlcy9yb290ZnMtcG9zdGNvbW1hbmRzLmJiY2xhc3MgfCA2ICsrKysrLQ0KPiA+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4NCj4gPj4g
ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9yb290ZnMtcG9zdGNvbW1hbmRzLmJiY2xhc3MNCj4g
Yi9tZXRhL2NsYXNzZXMvcm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzDQo+ID4+IGluZGV4IDFm
MjdhM2QwN2EuLmU0ZmU0MTZhYzkgMTAwNjQ0DQo+ID4+IC0tLSBhL21ldGEvY2xhc3Nlcy9yb290
ZnMtcG9zdGNvbW1hbmRzLmJiY2xhc3MNCj4gPj4gKysrIGIvbWV0YS9jbGFzc2VzL3Jvb3Rmcy1w
b3N0Y29tbWFuZHMuYmJjbGFzcw0KPiA+PiBAQCAtMTQ3LDcgKzE0NywxMSBAQCByZWFkX29ubHlf
cm9vdGZzX2hvb2sgKCkgew0KPiA+PiAgIHphcF9lbXB0eV9yb290X3Bhc3N3b3JkICgpIHsNCj4g
Pj4gICAJaWYgWyAtZSAke0lNQUdFX1JPT1RGU30vZXRjL3NoYWRvdyBdOyB0aGVuDQo+ID4+ICAg
CQlzZWQgLWkgJ3MlXnJvb3Q6OiVyb290Oio6JScNCj4gJHtJTUFHRV9ST09URlN9L2V0Yy9zaGFk
b3cNCj4gPj4gLSAgICAgICAgZmkNCj4gPj4gKwkJZ3JlcCAtcSAnXnJvb3Q6KjonICR7SU1BR0Vf
Uk9PVEZTfS9ldGMvc2hhZG93DQo+ID4NCj4gPiBUaGF0IHdpbGwgbWF0Y2ggYW55IC9ldGMvc2hh
ZG93IGZpbGUgd2l0aCAicm9vdDoiIGluIGl0LiBDaGFuZ2UgaXQgdG86DQo+ID4NCj4gPiAJCWdy
ZXAgLXEgJ15yb290OlwqOicgJHtJTUFHRV9ST09URlN9L2V0Yy9zaGFkb3cNCj4gDQo+IFRoYW5r
cywgSSB3aWxsIHVwZGF0ZSBpdC4NCj4gDQo+ID4NCj4gPiBBbmQgbWFrZSB0aGlzIG9wdGlvbmFs
LiBXZSBpbnRlbnRpb25hbGx5IGRvIG5vdCBoYXZlIGEgcm9vdCBwYXNzd29yZCBzZXQNCj4gaW4g
b3VyDQo+IA0KPiBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgYWJvdXQgIm9wdGlvbmFsIiwgd2hl
biB0aGUgY29tbWFuZCBpczoNCj4gDQo+IGdyZXAgLXEgJ15yb290OlwqOicgJHtJTUFHRV9ST09U
RlN9L2V0Yy9zaGFkb3cNCj4gDQo+IFRoZW4gZW1wdHkgcm9vdCBwYXNzd29yZCBpbiBzaGFkb3cg
aXM6DQo+IHJvb3Q6Og0KPiANCj4gc28gZW1wdHkgcm9vdCBwYXNzd29yZCB3b24ndCBiZSBtYXRj
aGVkPw0KDQpTb3JyeSwgSSB3YXMgdW5jbGVhci4gV2UgZG8gbm90IGhhdmUgYW4gZW1wdHkgcGFz
c3dvcmQsIHdlIGhhdmUgDQoicm9vdDoqOi4uLiIgaW4gL2V0Yy9zaGFkb3csIGFuZCB3ZSBvYnZp
b3VzbHkgZG8gbm90IHdhbnQgdGhpcyB3YXJuaW5nLg0KDQo+IC8vIFJvYmVydA0KDQovL1BldGVy
DQoNCj4gPiBwcm9kdWN0cyB3aGVuIHRoZXkgYXJlIGRlbGl2ZXJlZCBkdWUgdG8gdGhlIHN0YXRl
IGxhdyAoU0ItMzI3KSB0aGF0IHdlbnQNCj4gaW50bw0KPiA+IGVmZmVjdCBvbiBKYW51YXJ5IDEs
IDIwMjAgaW4gQ2FsaWZvcm5pYSwgd2hpY2ggcHJvaGliaXRzIGRlZmF1bHQNCj4gcGFzc3dvcmRz
IHRvDQo+ID4gYmUgdXNlZCBpbiBJb1QgcHJvZHVjdHMuDQo+ID4NCj4gPj4gKwkJaWYgWyAkPyAt
ZXEgMCBdOyB0aGVuDQo+ID4+ICsJCQliYndhcm4gIkxvZ2luIHdpdGggcm9vdCB1c2VyIGlzIGRp
c2FibGVkDQo+IHNpbmNlIHphcF9lbXB0eV9yb290X3Bhc3N3b3JkIGlzIGVuYWJsZWQiDQo+ID4+
ICsJCWZpDQo+ID4+ICsJZmkNCj4gPj4gICAJaWYgWyAtZSAke0lNQUdFX1JPT1RGU30vZXRjL3Bh
c3N3ZCBdOyB0aGVuDQo+ID4+ICAgCQlzZWQgLWkgJ3MlXnJvb3Q6OiVyb290Oio6JScNCj4gJHtJ
TUFHRV9ST09URlN9L2V0Yy9wYXNzd2QNCj4gPj4gICAJZmkNCj4gPj4gLS0NCj4gPj4gMi4xNy4x
DQo+ID4NCj4gPiAvL1BldGVyDQo+ID4NCg==
