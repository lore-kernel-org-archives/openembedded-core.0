Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76D0077FEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 09:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1BD7E18462;
	Wed, 30 Aug 2017 11:55:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id NSEfZxguT8hr; Wed, 30 Aug 2017 11:55:31 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 73F3B1845F;
	Wed, 30 Aug 2017 11:55:31 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C3E51A06F;
	Wed, 30 Aug 2017 11:55:31 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 415FD1A05F;
	Wed, 30 Aug 2017 11:55:31 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 30 Aug 2017 11:55:31 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 35ACF20E1;
	Wed, 30 Aug 2017 11:55:31 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 30 Aug 2017 11:55:31 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 30 Aug 2017 11:55:31 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/2] Avoid build failures due to setscene errors
Thread-Index: AQHTIQGO5Mo3T+wusUele0wVsAiFUaKbqeAAgAAhuLD///YqgIAAw6Kw
Date: Wed, 30 Aug 2017 09:55:31 +0000
Message-ID: <8d81573f5883446b979e09c679de9684@XBOX02.axis.com>
References: <cover.1504036763.git.pkj@axis.com>
	<CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
	<70b15633357a418095d460b943d3e994@XBOX02.axis.com>
	<CAJ86T=UBJz2HVnevLKc7CBiG1x6JAdezdq3jC19+5aWno5Lj2g@mail.gmail.com>
In-Reply-To: <CAJ86T=UBJz2HVnevLKc7CBiG1x6JAdezdq3jC19+5aWno5Lj2g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Avoid build failures due to setscene errors
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
X-List-Received-Date: Wed, 30 Aug 2017 09:55:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZSBNY0N1cmR5IFttYWls
dG86YXJtY2N1cmR5QGdtYWlsLmNvbV0NCj4gU2VudDogZGVuIDMwIGF1Z3VzdGkgMjAxNyAwMDow
NA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+IENjOiBPRSBDb3JlIG1haWxpbmcgbGlzdCA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMC8yXSBBdm9p
ZCBidWlsZCBmYWlsdXJlcyBkdWUgdG8gc2V0c2NlbmUNCj4gZXJyb3JzDQo+IA0KPiBPbiBUdWUs
IEF1ZyAyOSwgMjAxNyBhdCAxOjU5IFBNLCBQZXRlciBLamVsbGVyc3RlZHQNCj4gPHBldGVyLmtq
ZWxsZXJzdGVkdEBheGlzLmNvbT4gd3JvdGU6DQo+ID4gV2UgZG8gaGF2ZSBhIGRhaWx5IGpvYiB0
aGF0IGNsZWFucyB1cCB0aGUgZ2xvYmFsIHNzdGF0ZSBjYWNoZSBhbmQNCj4gPiByZW1vdmVzIGZp
bGVzIHRoYXQgaGF2ZSBub3QgYmVlbiBhY2Nlc3NlZCBpbiB0aGUgbGFzdCB0ZW4gZGF5cywgYnV0
DQo+ID4gaXQgc2VlbXMgdW5saWtlbHkgdGhhdCBpdCBzaG91bGQgcmVtb3ZlIGEgZmlsZSB0aGF0
IGp1c3QgaGFwcGVucyB0bw0KPiA+IGJlIHJlcXVpcmVkIGFnYWluLCBhbmQgZG8gaXQgYXQgZXhh
Y3RseSB0aGUgdGltZSB3aGVuIHRoYXQgdGFzayBpcw0KPiA+IGJ1aWxkaW5nLg0KPiANCj4gSSBn
dWVzcyB5b3UndmUgYWxyZWFkeSBjb25maXJtZWQgdGhhdCBhY2Nlc3NpbmcgdGhlIHNzdGF0ZSBm
aWxlcyBvdmVyDQo+IE5GUyBkb2VzIGFjdHVhbGx5IG1vZGlmeSBhdGltZSBvbiB0aGUgc2VydmVy
IChhbmQgdGhhdCB0aGUgZmlsZXN5c3RlbQ0KPiBvbiB0aGUgc2VydmVyIHJlYWxseSBkb2VzIGhh
dmUgYXRpbWUgc3VwcG9ydCBlbmFibGVkLCBlLmcuIG1vdW50ZWQNCj4gd2l0aCBzdHJpY3RhdGlt
ZSByYXRoZXIgdGhhbiByZWxhdGltZSBldGMpPw0KDQpXZWxsLCBpdCBpcyBtb3VudGVkIHdpdGgg
cmVsYXRpbWUuIEhvd2V2ZXIsIG9ubHkgdXBkYXRpbmcgdGhlIGFjY2VzcyANCnRpbWUgb25jZSBh
IGRheSBzaG91bGQgYmUgb2sgc2luY2Ugd2UgYXJlIG9ubHkgY29uY2VybmVkIHdpdGggY2hhbmdl
cyANCnRoYXQgaGF2ZSBub3QgYmVlbiBhY2Nlc3NlZCBpbiB0aGUgbGFzdCB0ZW4gZGF5cy4NCg0K
PiBJZiBhY2Nlc3MgdGltZSBpc24ndCBiZWluZyBkZXRlcm1pbmVkIHJlbGlhYmx5IGFuZCBzc3Rh
dGUgZmlsZXMgYXJlDQo+IGJlaW5nIHJlbW92ZWQgMTAgZGF5cyBhZnRlciBiZWluZyBjcmVhdGVk
IHRoZW4gdGhhdCBtaWdodCBtYWtlIHRoZQ0KPiByYWNlIGEgbGl0dGxlIG1vcmUgbGlrZWx5IHRv
IHRyaWdnZXIuDQoNClRoZSB0aGluZyBpcyB0aGF0IHRoZSBjbGVhbmluZyBzY3JpcHQgcnVucyBh
dCAzIGFtIChhbmQgdGFrZXMgYWJvdXQgDQoxNSBtaW51dGVzIHRvIGNvbXBsZXRlKSwgYnV0IHdl
IGhhdmUgc2VlbiB0aGUgYnVpbGQgcHJvYmxlbSBhdCB0aW1lcyANCndoZW4gbm8gY2xlYW5pbmcg
aXMgdGFraW5nIHBsYWNlLiBJIGFtIGN1cnJlbnRseSBsZWFuaW5nIG1vcmUgdG93YXJkcyANCm5l
dHdvcmsgZ2xpdGNoZXMgYXMgdGhlIHNvdXJjZSBvZiB0aGUgcHJvYmxlbSwgYnV0IHRoYXQgaXMg
aGFyZCB0byANCnZlcmlmeS4NCg0KLy9QZXRlcg0KDQo=

