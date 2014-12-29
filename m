Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC8F72580
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 13:40:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBTDeAra022392
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 29 Dec 2014 05:40:10 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.42]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Mon, 29 Dec 2014 05:40:09 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] glib-2.0: filter out -fvisibility=default
	option
Thread-Index: AQHQIRSE186xnmkW3EOe56MkqieGP5yml51g
Date: Mon, 29 Dec 2014 13:40:08 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAD2A60519@ALA-MBB.corp.ad.wrs.com>
References: <1419478883-14044-1-git-send-email-jackie.huang@windriver.com>
	<CAP9ODKp-Gvo0hed3iww8uji90x5yVHJ_kKd6sE_bMnFO3KTurQ@mail.gmail.com>
In-Reply-To: <CAP9ODKp-Gvo0hed3iww8uji90x5yVHJ_kKd6sE_bMnFO3KTurQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.203]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: filter out -fvisibility=default option
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
X-List-Received-Date: Mon, 29 Dec 2014 13:40:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3RhdmlvLnNhbHZhZG9y
QGdtYWlsLmNvbSBbbWFpbHRvOm90YXZpby5zYWx2YWRvckBnbWFpbC5jb21dIE9uIEJlaGFsZiBP
ZiBPdGF2aW8gU2FsdmFkb3INCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAyNiwgMjAxNCAxMDow
MiBQTQ0KPiBUbzogSHVhbmcsIEppZSAoSmFja2llKQ0KPiBDYzogUGF0Y2hlcyBhbmQgZGlzY3Vz
c2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0hdIGdsaWItMi4wOiBmaWx0ZXIgb3V0IC1mdmlzaWJpbGl0eT1kZWZhdWx0IG9wdGlvbg0K
PiANCj4gT24gVGh1LCBEZWMgMjUsIDIwMTQgYXQgMTo0MSBBTSwgIDxqYWNraWUuaHVhbmdAd2lu
ZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogSmFja2llIEh1YW5nIDxqYWNraWUuaHVhbmdA
d2luZHJpdmVyLmNvbT4NCj4gPg0KPiA+IE9uY2UgLWZ2aXNpYmlsaXR5PWRlZmF1bHQgb3B0aW9u
IGlzIGFkZGVkLCBtYXRjaGJveC1kZXNrdG9wIHdpbGwgcnVuDQo+ID4gaW50byBzZWdmYXVsdCwg
c28gZmlsdGVyIGl0IG91dCBhcyBhIHdvcmthcm91bmQgZm9yIG5vdy4NCj4gPg0KPiA+IFtZT0NU
TyAjNzA5OV0NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphY2tpZSBIdWFuZyA8amFja2llLmh1
YW5nQHdpbmRyaXZlci5jb20+DQo+IA0KPiBTb3JyeSBidXQgSSB0aGluayB0aGlzIG5lZWRzIGZp
eGluZyBpbiBtYXRjaGJveC1kZXNrdG9wIGFuZCBub3QgYSB3b3JrYXJvdW5kIGhlcmUgaW4gYSBs
aWJyYXJ5IHdoaWNoDQoNCk9rLCBJIHdpbGwgdHJ5IHRvIGZpeCBpdCBpbiBtYXRjaGJveC1kZXNr
dG9wLg0KDQpUaGFua3MsDQpKYWNraWUNCg0KPiBpcyB1c2VkIGluIHNldmVyYWwgcHJvamVjdHMu
DQo+IA0KPiAtLQ0KPiBPdGF2aW8gU2FsdmFkb3IgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE8uUy4gU3lzdGVtcw0KPiBodHRwOi8vd3d3Lm9zc3lzdGVtcy5jb20uYnIgICAgICAgIGh0dHA6
Ly9jb2RlLm9zc3lzdGVtcy5jb20uYnINCj4gTW9iaWxlOiArNTUgKDUzKSA5OTgxLTc4NTQgICAg
ICAgICAgICBNb2JpbGU6ICsxICgzNDcpIDkwMy05NzUwDQo=

