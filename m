Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2330E610F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 12:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 2851E34963F;
	Wed, 11 Sep 2013 14:30:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id poGYTF3LnT8H; Wed, 11 Sep 2013 14:30:52 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 53507349640;
	Wed, 11 Sep 2013 14:30:47 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 11ABF7BB;
	Wed, 11 Sep 2013 14:30:47 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 06080627;
	Wed, 11 Sep 2013 14:30:47 +0200 (CEST)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by seth.se.axis.com (Postfix) with ESMTP id 041303E06F;
	Wed, 11 Sep 2013 14:30:47 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Wed, 11 Sep 2013 14:30:47 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Darren Hart <dvhart@linux.intel.com>
Date: Wed, 11 Sep 2013 14:30:44 +0200
Thread-Topic: [OE-core] [PATCH 1/1] bb-matrix-plot: Use interpolation for
	sparse data
Thread-Index: Ac6uO7rRfpq+5LQORau/MbA9V9d9PQArFyqQ
Message-ID: <A612847CFE53224C91B23E3A5B48BAC798CD24DE06@xmail3.se.axis.com>
References: <cover.1378815538.git.pkj@axis.com>
	<38fc73dd9c6027282c5528cf9d18ad68ae7a3e43.1378815538.git.pkj@axis.com>
	<1378827464.19978.109.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1378827464.19978.109.camel@dvhart-mobl4.amr.corp.intel.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bb-matrix-plot: Use interpolation for sparse data
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
X-List-Received-Date: Wed, 11 Sep 2013 12:30:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXJyZW4gSGFydCBbbWFpbHRv
OmR2aGFydEBsaW51eC5pbnRlbC5jb21dDQo+IFNlbnQ6IGRlbiAxMCBzZXB0ZW1iZXIgMjAxMyAx
NzozOA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEv
MV0gYmItbWF0cml4LXBsb3Q6IFVzZSBpbnRlcnBvbGF0aW9uDQo+IGZvciBzcGFyc2UgZGF0YQ0K
PiANCj4gT24gVHVlLCAyMDEzLTA5LTEwIGF0IDE0OjIwICswMjAwLCBQZXRlciBLamVsbGVyc3Rl
ZHQgd3JvdGU6DQo+ID4gSWYgbm90IGV2ZXJ5IGNvbWJpbmF0aW9uIG9mIEJCX05VTUJFUl9USFJF
QURTIGFuZCBQQVJBTExFTF9NQUtFIGhhdmUNCj4gPiBiZWVuIHRlc3RlZCBieSBiYi1tYXRyaXgu
c2gsIGUuZy4sIGJ5IHVzaW5nIEJCX1JBTkdFPSIwNCAwOCAxMCAxMiAxNiINCj4gPiBhbmQgUE1f
UkFOR0U9IjA0IDA4IDEwIDEyIDE2IiwgdGhlbiB0aGUgZ3JhcGggdGhhdCBnbnVwbG90IGdlbmVy
YXRlcyBieQ0KPiA+IGRlZmF1bHQgbG9va3MgdmVyeSBqYWdnZWQgZHVlIHRvIHRoZSBtaXNzaW5n
IGRhdGEgcG9pbnRzLiBCeSB1c2luZw0KPiA+IHNwbGluZXMgdG8gaW50ZXJwb2xhdGUgdGhlIG1p
c3NpbmcgZGF0YSB0aGUgZ3JhcGggbG9va3MgYSBsb3QgYmV0dGVyLg0KPiA+DQo+ID4gVGhpcyBz
aG91bGQgbm90IGNoYW5nZSBncmFwaHMgd2hlcmUgYWxsIGRhdGEgcG9pbnRzIGFyZSBhdmFpbGFi
bGUgaW4gYW55DQo+ID4gd2F5LCBvbmx5IGltcHJvdmUgc3BhcnNlIGdyYXBocy4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4
aXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBzY3JpcHRzL2NvbnRyaWIvYmItcGVyZi9iYi1tYXRyaXgt
cGxvdC5zaCB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jb250cmliL2JiLXBlcmYv
YmItbWF0cml4LXBsb3Quc2ggYi9zY3JpcHRzL2NvbnRyaWIvYmItcGVyZi9iYi1tYXRyaXgtcGxv
dC5zaA0KPiA+IGluZGV4IDg3ZThjYjEuLjEzNmEyNTUgMTAwNzU1DQo+ID4gLS0tIGEvc2NyaXB0
cy9jb250cmliL2JiLXBlcmYvYmItbWF0cml4LXBsb3Quc2gNCj4gPiArKysgYi9zY3JpcHRzL2Nv
bnRyaWIvYmItcGVyZi9iYi1tYXRyaXgtcGxvdC5zaA0KPiA+IEBAIC0xMTUsNyArMTE1LDcgQEAg
c2V0IHhsYWJlbCAiJFhMQUJFTCINCj4gPiAgc2V0IHlsYWJlbCAiJFlMQUJFTCINCj4gPiAgc2V0
IHN0eWxlIGxpbmUgMTAwIGx0IDUgbHcgMS41DQo+ID4gICRQTTNEX0ZSQUdNRU5UDQo+ID4gLXNl
dCBkZ3JpZDNkICRQTV9DTlQsJEJCX0NOVA0KPiA+ICtzZXQgZGdyaWQzZCAkUE1fQ05ULCRCQl9D
TlQgc3BsaW5lcw0KPiANCj4gDQo+IFNhd2VldCEgSSBqdXN0IGNvdWxkbid0IGZpZ3VyZSB0aGF0
IG9uZSBvdXQgZm9yIHNvbWUgcmVhc29uLiBUaGFuayB5b3UsDQo+IHRoYW5rIHlvdSwgdGhhbmsg
eW91IQ0KPiANCj4gUGxlYXNlIG5vdGUgdGhlIGdudXBsb3QgNC40IGRlcGVuZGVuY3kgaW4gdGhl
IHBhdGNoIGNvbW1pdCBtZXNzYWdlDQo+IHRob3VnaC4gQWxzbywgd2hhdCBoYXBwZW5zIGlmIGFu
IG9sZGVyIGdudXBsb3QgaXMgdXNlZD8gRG9lcyBpdCBmYWlsIG9yDQo+IHJldmVydCB0byB0aGUg
b2xkIGJlaGF2aW9yPyBJZiBpdCBmYWlscywgY2FuIHdlIGNoZWNrIGZvciA0LjQgYW5kIHVzZQ0K
PiBzcGxpbmVzIGlmIGF2YWlsYWJsZT8NCg0KSSBhY3R1YWxseSB0cmllZCBpdCBub3cgdXNpbmcg
Z251cGxvdCA0LjIuMiwgYW5kIHRoZSBzY3JpcHQgDQphbHJlYWR5IHVzZXMgYSBjb3VwbGUgb2Yg
ZmVhdHVyZXMgdGhhdCByZXF1aXJlIGdudXBsb3QgNC40Lg0KVGhlIHNjcmlwdCBjYW4gYmUgZml4
ZWQgdG8gc3VwcG9ydCBnbnVwbG90IDQuMiAoYnkgYWRkaW5nIGEgDQp0ZXN0IGZvciB0aGUgZ251
cGxvdCB2ZXJzaW9uIGFuZCB0aGVuIG1vZGlmeWluZyB0aGUgaW5wdXQgdG8gDQpnbnVwbG90IGFj
Y29yZGluZ2x5KSwgYnV0IHNpbmNlIG5vYm9keSBoYXMgY29tcGxhaW5lZCBzbyBmYXIsIA0KSSB3
b3VsZCBzdWdnZXN0IGp1c3QgbGVhdmluZyBpdCBhcyBpcy4uLg0KDQo+IC0tDQo+IERhcnJlbiBI
YXJ0DQo+IEludGVsIE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyDQo+IFlvY3RvIFByb2pl
Y3QgLSBMaW51eCBLZXJuZWwNCg0KLy9QZXRlcg0KDQo=

