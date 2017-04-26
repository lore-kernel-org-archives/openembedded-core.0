Return-Path: <prvs=82899d44bb=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 728DC77D24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 19:43:57 +0000 (UTC)
X-AuditID: 0a000213-a3dff70000000e18-1d-5900f87a1ed2
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	6B.5D.03608.A78F0095; Wed, 26 Apr 2017 14:43:57 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 26 Apr 2017 14:43:53 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Trevor Woerner <twoerner@gmail.com>
Thread-Topic: [OE-core] Broken NPM builds
Thread-Index: AdK+plfbZy9DvttbRuelzkiHuV3MxwARtEOAAApK2hA=
Date: Wed, 26 Apr 2017 19:43:53 +0000
Message-ID: <655290B7709079438B7932553958E60D16D23E17@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60D16D23684@ESS-EX01.essvote.corp.local>
	<20170426192815.GA2366@linux-uys3>
In-Reply-To: <20170426192815.GA2366@linux-uys3>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpikeLIzCtJLcpLzFFi42JZI5CnoVv7gyHS4OxmVYv7sx8wWdz5+Y7d
	4s6LT0wOzB47Z91l9zi3cQWjx44bu1gCmKO4bZISS8qCM9Pz9O0SuDPWr7vDXLBLomLu+VbW
	BsYX4l2MnBwSAiYS8xbcYAexhQROMEr0ncjuYuQCsmcxSvzZdI0VJMEmYCRx7vomRhBbREBd
	ounWDWaQImaBGYwSb1ZtZAJJCAtoSPz+1sQCUaQp0TZ3K1SDlcShxhNgcRYBVYl96xeB2bwC
	QRK7fvWwQGwul+jYvQGsnlNAX+Jix1o2EJtRQEzi+6k1YPOZBcQlbj2ZzwRxtYDEkj3nmSFs
	UYmXj/+xQthyEu+a2oBsDqB6TYn1u/QhWhUlpnQ/ZIdYKyhxcuYTlgmMorOQTJ2F0DELSccs
	JB0LGFlWMQrmJmbmGOqlFheX5Zek6iXn525iBMYMFwOT8A7GOVNsDzEKcDAq8fAGePyPEGJN
	LCuuzD3EKM3BoiTOe5YjOEJIID2xJDU7NbUgtSi+qDQntfgQIxMH5yFGCQ4uKZHi1LyU1KLE
	0pKMeFDExRcDY06qgdF94gfT1+WtK+JkHVY9N+C+/3FO+0Gu36eYk2wkPrbH6GX92NZ7ybk5
	d/6d8rdOBYf/q5xpnrNPocJB6O7vZduO+nkITqkqO3hYeaWuTd2026vv5ouI7dg+81b7zy4z
	mUOHqo64fD6adVwoOXb+nC1sc12m+GrfEF8urtFyqk/N5J+skZajtqsSS3FGoqEWc1FxIgDU
	EQbelQIAAA==
Cc: "ilkka.myller@nodefield.com" <ilkka.myller@nodefield.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Broken NPM builds
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
X-List-Received-Date: Wed, 26 Apr 2017 19:43:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TXkgcmVjaXBlIHdhcyBqdXN0IGFuIGF1dG9nZW5lcmF0ZWQgcmVjaXBlIGZyb20gZGV2dG9vbC4g
IA0KSSBwdWxsIHRoaXMgZ3J1bnQgcmVjaXBlIG91dCBvZiB0aGUgbWFpbGluZyBsaXN0IGFzIG9u
ZSB0aGF0IHdvcmtlZCBwcmV2aW91c2x5IGFuZCBpdCBoYXMgdGhlIHNhbWUgaXNzdWUuDQoNClNV
TU1BUlkgPSAiR3J1bnQuanMgY29tbWFuZCBsaW5lIHdyYXBwZXIiDQpIT01FUEFHRSA9ICJodHRw
Oi8vZ3J1bnRqcy5jb20vIg0KU0VDVElPTiA9ICJqcy9kZXZlbCINCkxJQ0VOU0UgPSAiTUlUIg0K
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLm1kO21kNT1hMjRjYzc4OGFiNzI2ZTYx
NWFhNWJmMDE2OGM1ZDc3ZCINClNSQ19VUkkgPSAibnBtOi8vcmVnaXN0cnkubnBtanMub3JnO25h
bWU9JHtQTn07dmVyc2lvbj0ke1BWfSIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCmluaGVyaXQgbnBtDQoNClRoZSA2JSByZWNpcGUgaGFz
IHRoZSBzYW1lIHByb2JsZW0gb24gbWFzdGVyLCBidXQgd29ya3MgZmluZSBpbiBtb3J0eS4gIEkg
Y2FuIHBvc3QgaXQgYXMgYSBwYXRjaCBhZnRlciBJIGNhbiBmdWxseSB0ZXN0IGl0IGFnYWluLg0K
DQpUaGUgZXh0ZXJuYWwgbWV0YS1ub2RlanMgbGF5ZXIgaXMgbm90IGNvbXBhdGlibGUgd2l0aCB0
aGUgbnBtLmJiY2xhc3MgZmV0Y2hlci4gIEkgaGF2ZSBhIHBhdGNoIGluIHRvIGZpeCB0aGF0LCBi
dXQgSSBhbSB3YWl0aW5nIGZvciBpdCB0byBiZSBpbnRlZ3JhdGVkLg0KDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUcmV2b3IgV29lcm5lciBbbWFpbHRvOnR3b2VybmVyQGdt
YWlsLmNvbV0gDQpTZW50OiBXZWRuZXNkYXksIEFwcmlsIDI2LCAyMDE3IDI6MjggUE0NClRvOiBE
YXZpcywgTWljaGFlbA0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc7IGlsa2thLm15bGxlckBub2RlZmllbGQuY29tDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIEJy
b2tlbiBOUE0gYnVpbGRzDQoNCk9uIFdlZCAyMDE3LTA0LTI2IEAgMDQ6MDE6MjAgUE0sIERhdmlz
LCBNaWNoYWVsIHdyb3RlOg0KPiBJIGhhdmUgYSBzaW1wbGUgZ3J1bnQtY2xpIHJlY2lwZSB1c2lu
ZyBpbmhlcml0IG5wbS4NCj4gT24gbWFzdGVyIGJyYW5jaCBpdCBhcHBlYXJzIHRvIGJlIGJyb2tl
biBhbmQgdW5hYmxlIHRvIGZpbmQgdGhlIHJlZ2lzdHJ5LiAgU2FtZSByZWNpcGUgb24gTW9ydHkg
YnJhbmNoIHdvcmtzIGZpbmUuDQo+IEkgbG9va2VkIHRocm91Z2ggdGhlIG1haWxpbmcgbGlzdCBh
bmQgZGlkbid0IHNlZSBhbnlvbmUgZWxzZSBzZWVpbmcgdGhpcyBpc3N1ZS4NCg0KVGhlcmUncyBi
ZWVuIHF1aXRlIGEgYml0IG9mIGNodXJuIG9uIG1hc3RlciB0aGlzIGN5Y2xlLCBpdCdzIG5vdCB0
b28NCnN1cnByaXNpbmcgbWFzdGVyIGlzIHN0cnVnZ2xpbmcuIEFueSBjaGFuY2UgeW91IGNhbiBz
aGFyZSB5b3VyIHJlY2lwZTsgb3IgYQ0Kc3RyaXBwZWQtZG93biwgImV4YW1wbGUuY29tIiB2ZXJz
aW9uIG9mIHlvdXIgcmVjaXBlIHNvIG90aGVycyBjYW4gdGFrZSBhIGxvb2s/DQoNCj4gT24gYSBy
ZWxhdGVkIHNpZGUgbm90ZSBJIGhhdmUgcmVjaXBlcyB3b3JraW5nIGZvciBub2RlIDYuMTAuMi4N
Cg0KWW91IGhhdmUgYSBncnVudC1jbGkgcmVjaXBlIHdvcmtpbmcgb24gbWFzdGVyIHdpdGggbm9k
ZSA2JT8NCg0KPiBJcyB0aGVyZSBhIHJlYXNvbiB3ZSBhcmUgc3RheWluZyBvbiB0aGUgNC54IHNl
cmllcyBub3cgdGhhdCA2IGlzIExUUz8NCg0KSSdtIGd1ZXNzaW5nIG5vYm9keSBnb3QgYXJvdW5k
IHRvIG5vdGljaW5nIHRoZSBzd2l0Y2guIEkgZ3Vlc3Mgd2UgY291bGQNCmNoZXJyeS1waWNrIG5v
ZGUtNiUgZnJvbQ0KaHR0cHM6Ly9sYXllcnMub3BlbmVtYmVkZGVkLm9yZy9sYXllcmluZGV4L2Jy
YW5jaC9tYXN0ZXIvbGF5ZXIvbWV0YS1ub2RlanMvDQoNCklkZWFsbHkgd2UnZCBlaXRoZXIgbWVy
Z2UgYWxsL21vc3Qgb2YNCmh0dHBzOi8vbGF5ZXJzLm9wZW5lbWJlZGRlZC5vcmcvbGF5ZXJpbmRl
eC9icmFuY2gvbWFzdGVyL2xheWVyL21ldGEtbm9kZWpzLw0KaW50byBvZWNvcmUsIG9yIHJlbW92
ZSB3aGF0J3MgaW4gb2Vjb3JlIGFuZCB0ZWxsIHBlb3BsZSB0byB1c2UgdGhlIGV4dGVybmFsDQps
YXllci4gV2h5IGRvZXMgb2UtY29yZSBoYXZlIHNvbWUsIGJ1dCBub3QgYWxsLCBub2RlIHN1cHBv
cnQ/DQo=

