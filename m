Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id C77F278501
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 13:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 6EE3C2F275;
	Thu, 17 Aug 2017 15:01:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id sATL3aoLcaWd; Thu, 17 Aug 2017 15:01:29 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 69C612F1B2;
	Thu, 17 Aug 2017 15:01:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50B9D1A082;
	Thu, 17 Aug 2017 15:01:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4552F1A081;
	Thu, 17 Aug 2017 15:01:29 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 17 Aug 2017 15:01:29 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 38508F5E;
	Thu, 17 Aug 2017 15:01:29 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 17 Aug 2017 15:01:29 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 17 Aug 2017 15:01:29 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Mark Hatle
	<mark.hatle@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
Thread-Index: AQHTFg+QOKQVwGn4wkKD2SyipOoWWKKG2xWAgAAifACAAULFgIAAPgyg
Date: Thu, 17 Aug 2017 13:01:28 +0000
Message-ID: <3d6ca1eb131841adac87ed6bbbe1b769@XBOX02.axis.com>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
	<1502890461.13978.127.camel@linuxfoundation.org>
	<e285fe7c-320d-db44-98fd-ff1d06df5706@windriver.com>
	<d01a078c-ad1a-2979-3fc2-fc5d4052ae02@linux.intel.com>
In-Reply-To: <d01a078c-ad1a-2979-3fc2-fc5d4052ae02@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Thu, 17 Aug 2017 13:01:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiBb
bWFpbHRvOmFsZXhhbmRlci5rYW5hdmluQGxpbnV4LmludGVsLmNvbV0NCj4gU2VudDogZGVuIDE3
IGF1Z3VzdGkgMjAxNyAxMjo1Mw0KPiBUbzogTWFyayBIYXRsZSA8bWFyay5oYXRsZUB3aW5kcml2
ZXIuY29tPjsgUmljaGFyZCBQdXJkaWUNCj4gPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBD
YzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDAvNiB2Ml0gRml4IFJQTTQgcmVncmVzc2lvbnMg
YmFzZWQgb24NCj4gUHlybw0KPiANCj4gT24gMDgvMTYvMjAxNyAwNjozNyBQTSwgTWFyayBIYXRs
ZSB3cm90ZToNCj4gPiBBcmUgdGhlcmUgYW55IGV4YW1wbGVzPyAgSSB3YXMgbG9va2luZyB0aGVy
ZSBhbmQgc2ltcGx5IGRpZG4ndCBzZWUNCj4gPiBhbnkuICBJIHNhdyB0aGUgcGFja2FnaW5nIGZv
ciBpbnN0YW5jZSBleGVyY2lzZWQgcHl0aG9uIGludGVyZmFjZXMsIA0KPiA+IHZlcnNpb24gY29t
cGFyaXNvbiB0b29scywgZXRjLi4gYnV0IG5vdGhpbmcgdGhhdCBidWlsdCBhIA0KPiA+IHJlY2lw
ZS9wYWNrYWdlIGFuZCB0aGVuIHZlcmlmaWVkIHRoZSBjb250ZW50cyB3ZXJlICdjb3JyZWN0Jy4N
Cj4gPg0KPiA+IElkZWFsbHkgdGhlIHRlc3Qgd291bGQgYmUgdG8gZmFicmljYXRlIHNvbWV0aGlu
ZyB3aXRoIGEga25vd24gc2V0IA0KPiA+IG9mIGZpbGUgZGVwZW5kZW5jaWVzLCBwcm9kdWNlIGEg
cGFja2FnZSBmcm9tIGl0IGFuZCB0aGVuIHZlcmlmeSANCj4gPiB0aGF0IHRoZSBwYWNrYWdlIHBy
b3Blcmx5IGluY2x1ZGVkIHRob3NlIGRlcGVuZGVuY2llcy4NCj4gPg0KPiA+IEkgaGFkIGxvb2tl
ZCBhdCBqdXN0IHBpY2tpbmcgc29tZSByYW5kb20gbGlicmFyeSBvdXQgb2YgdGhlIGRlcGxveQ0K
PiA+IGRpcmVjdG9yeSwgYW5kIGRvaW5nIGEgcGF0dGVybiBzZWFyY2ggb24gaXQncyBwcm92aWRl
cy4uIGJ1dCBJJ20gDQo+ID4gbm90IHN1cmUgdGhhdCB0eXBlIG9mIHRlc3Qgd291bGQgYmUgdmVy
eSByb2J1c3QuDQo+IA0KPiBIb3cgd2FzIHRoaXMgcmVncmVzc2lvbiBkaXNjb3ZlcmVkIGluIHRo
ZSBmaXJzdCBwbGFjZT8gSSBndWVzcyB0aGF0DQo+IHNvbWUgcmVjaXBlIHVzZWQgdG8gYnVpbGQg
d2l0aG91dCBlcnJvciB3aXRoIHJwbTUsIGFuZCBzdG9wcGVkIA0KPiBidWlsZGluZyB3aXRoIHJw
bTQuIFRoaXMgaXMgd2hhdCB5b3UgY291bGQgdGVzdCBmb3I6IGlzb2xhdGUgdGhlIA0KPiBwcm9i
bGVtYXRpYyBiaXQsIHJlbW92ZSBldmVyeXRoaW5nIGVsc2UsIGFuZCB3cml0ZSBhIHNpbXBsZSBy
ZWNpcGUocykgDQo+IHRoYXQgY2FuIGJlIHBsYWNlZCBpbnRvIG1ldGEtc2VsZnRlc3QuIFRoZW4g
c2ltcGx5IGJ1aWxkIHRob3NlIGZyb20gDQo+IHRoZSBzZWxmdGVzdDsgaWYgdGhleSBidWlsZCB3
aXRob3V0IGVycm9yLCB5b3UgZG9uJ3QgbmVlZCB0byBkbyBtb3JlIA0KPiBzb3BoaXN0aWNhdGVk
IGNoZWNrcy4NCj4gDQo+IEFsZXgNCg0KVGhlIHByb2JsZW0gd2UgaGF2ZSwgd2hpY2ggY2F1c2Vk
IG1lIHRvIGxvb2sgaW50byB0aGlzLCBpczoNCg0KV2UgdW5mb3J0dW5hdGVseSBoYXZlIGEgbG90
IG9mIHVudmVyc2lvbmVkIGxpYnJhcmllcywgZS5nLiwgDQoibGliZm9vLnNvIiBpbnN0ZWFkIG9m
ICJsaWJmb28uc28uMS4yLjMiLiBUaGVyZSBpcyBubyBwcm9ibGVtIA0KYnVpbGRpbmcgdGhlc2Ug
KGV4Y2VwdCB3ZSBuZWVkIHRvIHdvcmsgYXJvdW5kIE9FJ3MgZGVmYXVsdCBvZiANCnB1dHRpbmcg
Ki5zbyBpbiAke1BOfS1kZXYgcmF0aGVyIHRoYW4gJHtQTn0pLiBIb3dldmVyLCB3aGVuIHJwbSAN
CmNyZWF0ZXMgdGhlIHBhY2thZ2VzIGZvciB0aGUgYXBwbGljYXRpb25zIGxpbmtlZCB3aXRoIHRo
ZXNlIA0KbGlicmFyaWVzLCBpdCBmYWlscyB0byBhdXRvbWF0aWNhbGx5IGRldGVybWluZSB0aGVz
ZSBydW50aW1lDQpkZXBlbmRlbmNpZXMuIEhvd2V2ZXIsIHNpbmNlIHRoZXJlIGFyZSBubyBlcnJv
cnMsIHdoYXQgdGhlbiANCmhhcHBlbnMgaXMgdGhhdCB0aGUgaW1hZ2UgaXMgY3JlYXRlZCwgbGFj
a2luZyBtb3N0IG9mIG91ciANCmxpYnJhcmllcywgd2hpY2ggb2YgY291cnNlIGxlYWRzIHRvIHRo
ZSBpbWFnZSBmYWlsaW5nIHRvIGJvb3QgDQp3aGVuIGFwcGxpY2F0aW9ucyBjYW5ub3QgZmluZCB0
aGUgbGlicmFyaWVzIHRoZXkgbmVlZC4uLg0KDQpUaGUgcmVhc29uIHRoaXMgaXMgbm90IGEgcHJv
YmxlbSB3aXRoIHZlcnNpb25lZCBsaWJyYXJpZXMgaXMgDQp0aGF0IHRoZSBjb2RlIGluIE9FIGhh
cyBzdXBwb3J0IGZvciBkZXRlcm1pbmluZyB0aGVzZSBhbmQgd2lsbCANCmZlZWQgdGhhdCBpbmZv
cm1hdGlvbiB0byBycG0uIEluIGhpbmRzaWdodCwgaXQgd291bGQgcHJvYmFibHkgDQpoYXZlIGJl
ZW4gYmV0dGVyIGlmIEkgbG9va2VkIGF0IGZpeGluZyB0aGF0IGNvZGUgdG8gc3VwcG9ydCANCnVu
dmVyc2lvbmVkIGxpYnJhcmllcywgYnV0IHNpbmNlIHJwbSdzIGF1dG9tYXRpYyBkaXNjb3Zlcnkg
b2YgDQpydW50aW1lIGRlcGVuZGVuY2llcyB3b3JrZWQgaW4gTW9ydHksIEkgdGhvdWdodCBpdCB3
b3VsZCBiZSANCmVhc2llc3QgdG8gZ2V0IHRoZSBuZWVkZWQgZnVuY3Rpb25hbGl0eSBiYWNrIHRo
YXQgd2FzIGxvc3QgaW4gDQp0aGUgdHJhbnNpdGlvbiB0byBkbmYgYnkgZml4aW5nIHJwbS4uLg0K
DQovL1BldGVyDQoNCg==

