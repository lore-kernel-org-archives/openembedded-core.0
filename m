Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A0087EC5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 01:52:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6C1pbP4017781
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Jul 2019 18:51:47 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.194]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0468.000;
	Thu, 11 Jul 2019 18:51:26 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>, Adrian Bunk <bunk@stusta.de>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] libtool: allow for use of
	reproducible_build bbclass
Thread-Index: AQHVOCcV/Sn4DphVFkagP/5yHdtAIKbGV+MAgAAT/AD//8teQA==
Date: Fri, 12 Jul 2019 01:51:26 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84FA81B717@ALA-MBD.corp.ad.wrs.com>
References: <20190711202739.131168-1-joe.slater@windriver.com>
	<20190711204424.GA2092@localhost>
	<CAJTo0LYnXYrkfa_HrU=QPxxngpP0qHsAUMkFENYGU=MCFGDZyA@mail.gmail.com>
In-Reply-To: <CAJTo0LYnXYrkfa_HrU=QPxxngpP0qHsAUMkFENYGU=MCFGDZyA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.118.90]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libtool: allow for use of reproducible_build bbclass
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
X-List-Received-Date: Fri, 12 Jul 2019 01:52:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhdCdzIGEgcXVlc3Rpb24gSSBoYXZlIGFib3V0IHRoaW5ncyBsaWtlIHRoaXMsIHdoZXJlIHNv
bWUgaW5mb3JtYXRpb24gc2VlbXMgb2YgbWluaW1hbCB1c2UsIGJ1dCBpcyB0aGVyZSBhbmQgaXMg
bm93IG1hbGlnbmFudC4gIENodWNrIGl0IG9yIG1vZGlmeSBpdCB0byBiZSBiZW5pZ24uDQoNCkpv
ZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnVydG9uLCBSb3NzIDxyb3Nz
LmJ1cnRvbkBpbnRlbC5jb20+IA0KU2VudDogVGh1cnNkYXksIEp1bHkgMTEsIDIwMTkgMjo1NiBQ
TQ0KVG86IEFkcmlhbiBCdW5rIDxidW5rQHN0dXN0YS5kZT4NCkNjOiBTbGF0ZXIsIEpvc2VwaCA8
am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPjsgT0UtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW29lLWNvcmVdW1BB
VENIIDEvMV0gbGlidG9vbDogYWxsb3cgZm9yIHVzZSBvZiByZXByb2R1Y2libGVfYnVpbGQgYmJj
bGFzcw0KDQpPbiBUaHUsIDExIEp1bCAyMDE5IGF0IDIxOjQ1LCBBZHJpYW4gQnVuayA8YnVua0Bz
dHVzdGEuZGU+IHdyb3RlOg0KPiBUaGUgRGViaWFuIHBhdGNoIGZvciB0aGUgc2FtZSBwdXJwb3Nl
IHNpbXBseSByZW1vdmVzIHRoZSBwcm9ibGVtYXRpYyANCj4gbGluZSAtIGEgY29tbWVudCB3aXRo
IHRoZSBidWlsZCBob3N0IHdhcyBhbnl3YXlzIG5vdCBpbXBvcnRhbnQgaW5mb3JtYXRpb24uDQoN
CkFncmVlZCwgaXQncyBqdXN0IGEgY29tbWVudCwgYW5kIHJlcGxhY2luZyBpdCB3aXRoIGxvZ2lj
IGp1c3QgbWVhbnMgbW9yZSBlZmZvcnQgd2hlbiB3ZSBuZWVkIHRvIHJlYmFzZS4gIElkZWFsbHks
IHVwc3RyZWFtIHJlbW92ZSB0aGF0IGNvbW1lbnQgdG9vLCBhcyBpdCBkb2Vzbid0IGhhdmUgbXVj
aCB2YWx1ZSBhdCBhbGwuDQoNClJvc3MNCg==

