Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UKY4l-00019B-53
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:54:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2QHbK3G009573
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Mar 2013 10:37:21 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.233]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0342.003;
	Tue, 26 Mar 2013 10:37:19 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Chris Larson <clarson@kergoth.com>
Thread-Topic: [OE-core] [PATCH 1/1] dosfstools: really compile supporting
	large files [ Fix: 409915 ]
Thread-Index: AQHOKZot/FP4i5UQpECH9gjnyyI2t5i3XfiAgADfolA=
Date: Tue, 26 Mar 2013 17:37:19 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8436F7E69C@ALA-MBB.corp.ad.wrs.com>
References: <1364244540-29538-1-git-send-email-jslater@windriver.com>
	<CABcZANkaW4BKpqovTC9py1LiRT-d3=n83QoewVKM0PNLsbcC=w@mail.gmail.com>
In-Reply-To: <CABcZANkaW4BKpqovTC9py1LiRT-d3=n83QoewVKM0PNLsbcC=w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dosfstools: really compile supporting large files [ Fix: 409915 ]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:54:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbToga2VyZ290aEBnbWFpbC5j
b20gW21haWx0bzprZXJnb3RoQGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIENocmlzIExhcnNvbg0K
PiBTZW50OiBNb25kYXksIE1hcmNoIDI1LCAyMDEzIDI6MTYgUE0NCj4gVG86IFNsYXRlciwgSm9z
ZXBoDQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXll
cg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzFdIGRvc2ZzdG9vbHM6IHJlYWxs
eSBjb21waWxlIHN1cHBvcnRpbmcgbGFyZ2UgZmlsZXMgWw0KPiBGaXg6IDQwOTkxNSBdDQo+IA0K
PiANCj4gT24gTW9uLCBNYXIgMjUsIDIwMTMgYXQgMTo0OSBQTSwgSm9lIFNsYXRlciA8anNsYXRl
ckB3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gDQo+IA0KPiAJQ1FJRDogNDA5OTE1DQo+IA0KPiAJ
TWFrZWZpbGUgaW4gdGhlIHBhY2thZ2UgdHJpZXMgdG8gc2V0IF9GSUxFX09GRlNFVF9CSVRTPTY0
LA0KPiAJYnV0IHdlIGNsb2JiZXIgdGhhdCB3aXRoIG91ciBDRkxBR1MsIHNvIHdlIGFkZCBpdCBp
bg0KPiAJdGhlIHJlY2lwZS4NCj4gDQo+IAlTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqc2xh
dGVyQHdpbmRyaXZlci5jb20+DQo+IA0KPiANCj4gQWZhaWsgdGhlcmUgaXMgYSBsYXJnZWZpbGUg
ZGlzdHJvIGZlYXR1cmUsIHNob3VsZCB0aGlzIHVzZSB0aGF0LCB0aHJvdWdoIHBhY2thZ2Vjb25m
aWc/DQoNClRoaXMgaXMgcmVhbGx5IGFpbWVkIGF0IGRvc2ZzdG9vbHMtbmF0aXZlLCBidXQgSSBu
b3RpY2VkLCBqdXN0IGJ5IGNoYW5jZSwgdGhhdCBiemlwMg0KdW5jb25kaXRpb25hbGx5IHNldHMg
dGhpcywgYXBwYXJlbnRseSB3aXRob3V0IGlsbCBlZmZlY3QuDQoNCkpvZQ0KDQoNCj4gLS0NCj4g
Q2hyaXN0b3BoZXIgTGFyc29uDQo=


