Return-Path: <wei.tee.ng@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA79600EB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 07:17:16 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 04 Aug 2017 00:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,319,1498546800"; d="scan'208";a="133473483"
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
	by orsmga005.jf.intel.com with ESMTP; 04 Aug 2017 00:17:15 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.27]) by
	PGSMSX104.gar.corp.intel.com ([169.254.3.149]) with mapi id
	14.03.0319.002; Fri, 4 Aug 2017 15:17:14 +0800
From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] core-image-minimal-initramfs: use
	initramfs-framework by default
Thread-Index: AQHTBEEEHf58c1aqIkC4kkZQt3ybbaJrgauAgAhWmQA=
Date: Fri, 4 Aug 2017 07:17:14 +0000
Message-ID: <CBAEED2EB06BF94889E80B47A33FE329EE25D6@PGSMSX105.gar.corp.intel.com>
References: <cover.1500848692.git.wei.tee.ng@intel.com>
	<7845bc41803435479389182bed1dfb5d410df24a.1500848692.git.wei.tee.ng@intel.com>
	<1501400871.22282.210.camel@linuxfoundation.org>
In-Reply-To: <1501400871.22282.210.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 3/3] core-image-minimal-initramfs: use initramfs-framework by default
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
X-List-Received-Date: Fri, 04 Aug 2017 07:17:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KTm90ZWQgd2l0aCB0aGUgY2hhbmdlcy4gSSBoYWQgdHJ5IHRvIHJlcHJv
ZHVjZSB0aGUgc2FtZSBmYWlsdXJlIGxvZyB0aGF0IHlvdSBzZW5kIHRvIG1lLiBIb3dldmVyLCB0
aGUgcmVzdWx0IGlzIGRpZmZlcmVudC4gDQoNCkhvdyBjYW4gSSBydW4gdGhlIG9lLXNlbGZ0ZXN0
IHRvIHRlc3Qgb3V0IHRoZSBwYXRjaCBvbiBteSBtYWNoaW5lIGNvcnJlY3RseT8gQ2FuIHlvdSB2
ZXJpZnkgd2l0aCBtZSB3aGV0aGVyIHRoZSBzdGVwcyBiZWxvdyBhcmUgdGhlIGNvcnJlY3Qgc3Rl
cHM/DQpGaXJzdGx5IGdpdCBjbG9uZSBhIHBva3kgYW5kIG1ldGEtaW50ZWwgbGF5ZXIsIHRoZW4g
c291cmNlIGEgYnVpbGQuIEkgYWxzbyBlbmFibGUgdGhlIG9lLXNlbGZ0ZXN0IGNvbmZpZ3VyYXRp
b24gb24gbXkgbG9jYWwuY29uZiBhbmQgcnVuIHRoZSBjb21tYW5kICJvZS1zZWxmdGVzdCAtciBy
dW5xZW11LlJ1bnFlbXVUZXN0cy50ZXN0X2Jvb3RfZGVwbG95X2hkZGltZyI/DQoNCkkgdHJ5IHRv
IHRlc3QgdGhlIGxhdGVzdCBwb2t5IG1hc3RlciBicmFuY2ggd2l0aG91dCBteSAidXNlIGluaXRy
YW1mcy1mcmFtZXdvcmsgYnkgZGVmYXVsdCIgY29tbWl0LCB0aGUgb2Utc2VsZnRlc3QgZm9yIHRo
b3NlIHR3byB0ZXN0Y2FzZXMgYXJlIGZhaWxlZCB0b28pDQpIZXJlIGlzIHRoZSBmYWlsdXJlIGxv
ZyB0aGF0IEkgY2FwdHVyZWQ6IGh0dHA6Ly9wYXN0ZWJpbi5pbnRlbC5jb20vaGVmaXplbGl4by52
aGRsIA0KDQpSZWdhcmRzLA0KV2VpIFRlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnXSANClNlbnQ6IFN1bmRheSwgSnVseSAzMCwgMjAxNyAzOjQ4IFBNDQpUbzogTmcsIFdl
aSBUZWUgPHdlaS50ZWUubmdAaW50ZWwuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KQ2M6IFdvbGQsIFNhdWwgPHNhdWwud29sZEBpbnRlbC5jb20+DQpTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAzLzNdIGNvcmUtaW1hZ2UtbWluaW1hbC1pbml0cmFt
ZnM6IHVzZSBpbml0cmFtZnMtZnJhbWV3b3JrIGJ5IGRlZmF1bHQNCg0KT24gU3VuLCAyMDE3LTA3
LTIzIGF0IDE2OjUxIC0wNzAwLCB3ZWkudGVlLm5nQGludGVsLmNvbSB3cm90ZToNCj4gRnJvbTog
Ik5nLCBXZWkgVGVlIiA8d2VpLnRlZS5uZ0BpbnRlbC5jb20+DQo+IA0KPiBVc2UgdGhlIGluaXRy
YW1mcy1mcmFtZXdvcmsgZm9yIGluaXRpYWxpemF0aW9uIGJ5IGRlZmF1bHQgZHVlIHRvIHRoZSAN
Cj4gbW9kdWxhcml0eSBhbmQgZXhwYW5zaWJpbGl0eS4NCj4gDQo+IFtZT0NUTyAjMTA5ODddDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBOZywgV2VpIFRlZSA8d2VpLnRlZS5uZ0BpbnRlbC5jb20+DQo+
IC0tLQ0KPiDCoG1ldGEvcmVjaXBlcy1jb3JlL2ltYWdlcy9jb3JlLWltYWdlLW1pbmltYWwtaW5p
dHJhbWZzLmJiIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KDQpJJ20gYWZyYWlkIEkgaGFkIHRvIHJldmVydCB0aGlzIGNoYW5nZToNCg0K
aHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQuY2dpL3Bva3kvY29tbWl0Lz9pZD1mYWIy
MjE5YWY0YTY1NjYxMjQNCmNmOTVkMWQyNjQ4ZDQ3MjkzOTFiYWYNCg0KYmVjYXVzZSBpdCB3YXMg
Y2F1c2luZyBvZS1zZWxmdGVzdCBmYWlsdXJlcyBhcyBzaG93biBoZXJlOg0KDQpodHRwczovL2F1
dG9idWlsZGVyLnlvY3RvLmlvL2J1aWxkZXJzL25pZ2h0bHktb2Utc2VsZnRlc3QvYnVpbGRzLzQx
NS9zdA0KZXBzL1J1bm5pbmclMjBvZS1zZWxmdGVzdC9sb2dzL3N0ZGlvDQoNCkNoZWVycywNCg0K
UmljaGFyZA0K

