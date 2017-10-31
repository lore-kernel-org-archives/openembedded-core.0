Return-Path: <saul.wold@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 13EC46AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 23:19:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 31 Oct 2017 16:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,326,1505804400"; d="scan'208";a="1212586461"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2017 16:19:47 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Tue, 31 Oct 2017 16:19:47 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.80]) by
	ORSMSX112.amr.corp.intel.com ([169.254.3.153]) with mapi id
	14.03.0319.002; Tue, 31 Oct 2017 16:19:46 -0700
From: "Wold, Saul" <saul.wold@intel.com>
To: "armccurdy@gmail.com" <armccurdy@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] linux-firmware fetcher warnings
Thread-Index: AQHTUp69l/HBM6NHbUO2V1NFbhtS2g==
Date: Tue, 31 Oct 2017 23:19:45 +0000
Message-ID: <1509491984.11491.36.camel@intel.com>
References: <CAJ86T=WwqN3H-KR5TYnvjG37XNvRVqdWug2o6dR5wiKEzygQ2Q@mail.gmail.com>
In-Reply-To: <CAJ86T=WwqN3H-KR5TYnvjG37XNvRVqdWug2o6dR5wiKEzygQ2Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.8.62]
MIME-Version: 1.0
Subject: Re: linux-firmware fetcher warnings
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
X-List-Received-Date: Tue, 31 Oct 2017 23:19:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7073A6BCC9B7AB4096438B5D80AF31E9@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE3LTEwLTMxIGF0IDE0OjM1IC0wNzAwLCBBbmRyZSBNY0N1cmR5IHdyb3RlOg0K
PiBUaGUgbGludXgtZmlybXdhcmUgcmVjaXBlIGlzIGN1cnJlbnRseSB0cnlpbmcgdG8gZmV0Y2gN
Cj4gaXdsd2lmaS04MDAwQy0xOS51Y29kZSB3aGljaCBhY2NvcmRpbmcgdG86DQo+IA0KPiAgIGh0
dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L3VidW50dS8rc291cmNlL2xpbnV4LWZpcm13YXJlLyti
dWcvMTU3OTINCj4gODENCj4gDQo+IGlzIGFuIHVucmVsZWFzZWQgZmlybXdhcmUgaW1hZ2UgZnJv
bSBhIHVub2ZmaWNpYWwgZm9yayBvZiB0aGUgbWFpbg0KPiBsaW51eC1maXJtd2FyZSByZXBvLiBU
aGUgIml3bHdpZmktODAwMEMtMTkudWNvZGUiIGZpbGUgaXNuJ3QgZm91bmQgaW4NCj4gdGhlIGN1
cnJlbnQgbWFzdGVyIGJyYW5jaCBvZiB0aGUgaXdsd2lmaSBsaW51eC1maXJtd2FyZSByZXBvIChh
bmQNCj4gZG9lc24ndCBzZWVtIHRvIGJlIHRoZXJlIGluIHRoZSBoaXN0b3J5IGVpdGhlci4uLiku
DQo+IA0KWWVhaCBzZWVtcyBsaWtlIGl0IGdvdCByZWJhc2VkIGF3YXkgOi0oIQ0KDQo+IFRoZSBt
eXN0ZXJ5IGZpcm13YXJlIGltYWdlIHdhcyBhZGRlZCB0byB0aGUgbGludXgtZmlybXdhcmUgcmVj
aXBlIGJ5Og0KPiANCj4gICBodHRwOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVk
LWNvcmUvY29tbWl0Lz9pZD04YjNkM2FjODRmDQo+IDc4N2JmNGVjY2NkY2JjYjk3ZjJkYWM1NmFj
ZDQ1Yw0KPiANCj4gSXMgdGhpcyBmaXJtd2FyZSBzdGlsbCByZXF1aXJlZD8gSWYgc28sIHNob3Vs
ZCBTUkNfVVJJIGJlIHVwZGF0ZWQgdG8NCj4gZmV0Y2ggaXQgZGlyZWN0bHkgZnJvbSBkb3dubG9h
ZHMueW9jdG9wcm9qZWN0Lm9yZz8NCg0KSSB3aWxsIGRvIHNvbWUgcmVzZWFyY2gsIGl0IHdhcyBu
ZWVkZWQgZm9yIHNvbWUgaGFyZHdhcmUgd2hlbiBpdCB3YXMNCnB1dCBpbnRvIHRoZSBtZXRhLWlu
dGVsIGFuZCB0aGVuIGxhdGVyIHdlIG1vdmVkIGl0IGludG8gT0UtQ29yZS4NCg0KU2F1IQ0K

