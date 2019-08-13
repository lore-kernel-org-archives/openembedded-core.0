Return-Path: <aaron.chun.yew.chan@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Aug 2019 05:09:17 UTC
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 92D2F7D084
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 05:09:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Aug 2019 22:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,380,1559545200"; d="scan'208";a="200365738"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
	by fmsmga004.fm.intel.com with ESMTP; 12 Aug 2019 22:02:11 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.25]) by
	KMSMSX156.gar.corp.intel.com ([169.254.1.101]) with mapi id
	14.03.0439.000; Tue, 13 Aug 2019 13:02:10 +0800
From: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core][PATCH] python3-dbus: Add native and native-sdk support
Thread-Index: AdVB7li+r4S6JJISS6OWSejy4Yn+5AOLzbOAAF2ji4A=
Date: Tue, 13 Aug 2019 05:02:10 +0000
Message-ID: <AA9B40170ABA1047B45E714CB2B866B706BE12DF@PGSMSX103.gar.corp.intel.com>
References: <AA9B40170ABA1047B45E714CB2B866B706BC13BE@PGSMSX103.gar.corp.intel.com>
	<CAMKF1so90EMEMM6qk91mZVRXhRxbDo=N=xmDig8+J1MaVx-NaA@mail.gmail.com>
In-Reply-To: <CAMKF1so90EMEMM6qk91mZVRXhRxbDo=N=xmDig8+J1MaVx-NaA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjNmYTY2MTEtYWUyZC00MTRkLTg5ODItMWFiNDAwOTk4NDBhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicWoxc2pkZjdmWkVsXC9FMUV6QW1LRVBPeGR3TytMYzI2akJ1QUdIVXZjRzFUT09KTFBiNU9mZ3l4RVpIOU4xVmkifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-dbus: Add native and native-sdk support
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
X-List-Received-Date: Tue, 13 Aug 2019 05:09:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KSSd2ZSBhbHNvIHNlbmQgdGhlIHNhbWUgcGF0Y2ggaW50byBPRS1jb3JlIA0K
DQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwvb3BlbmVtYmVkZGVkLWNv
cmUvMjAxOS1KdWx5LzI4NDk3MS5odG1sDQoNClRoYW5rcw0KQWFyb24NCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwuY29t
XSANClNlbnQ6IE1vbmRheSwgQXVndXN0IDEyLCAyMDE5IDEyOjIwIEFNDQpUbzogQ2hhbiwgQWFy
b24gQ2h1biBZZXcgPGFhcm9uLmNodW4ueWV3LmNoYW5AaW50ZWwuY29tPjsgUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQpDYzogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRD
SF0gcHl0aG9uMy1kYnVzOiBBZGQgbmF0aXZlIGFuZCBuYXRpdmUtc2RrIHN1cHBvcnQNCg0KSGkg
UmljaGFyZA0KDQpDYW4gdGhpcyBwYXRjaCBiZSBhcHBsaWVkID8gdGhlcmUgYXJlIHJlY2lwZXMg
aW4gbWV0YS1vZSB3aGljaCBhcmUgd2FpdGluZyBmb3IgdGhpcyBmaXguDQoNCk9uIFdlZCwgSnVs
IDI0LCAyMDE5IGF0IDEyOjA2IEFNIENoYW4sIEFhcm9uIENodW4gWWV3IDxhYXJvbi5jaHVuLnll
dy5jaGFuQGludGVsLmNvbT4gd3JvdGU6DQo+DQo+IEZyb206IENoYW4sIEFhcm9uIENodW4gWWV3
DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyNCwgMjAxOSAzOjAyIFBNDQo+IFRvOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBDaGFuLCBBYXJvbiBDaHVu
IFlldyA8YWFyb24uY2h1bi55ZXcuY2hhbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFttZXRhLW9l
XVtQQVRDSF0gcHl0aG9uMy1kYnVzOiBBZGQgbmF0aXZlIGFuZCBuYXRpdmUtc2RrIA0KPiBzdXBw
b3J0DQo+DQo+IEZyb206IEFhcm9uIENoYW4gPGFhcm9uLmNodW4ueWV3LmNoYW5AaW50ZWwuY29t
Pg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBYXJvbiBDaGFuIDxhYXJvbi5jaHVuLnlldy5jaGFuQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
ZGJ1c18xLjIuOC5iYiB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykN
Cj4NCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1k
YnVzXzEuMi44LmJiIA0KPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1k
YnVzXzEuMi44LmJiDQo+IGluZGV4IDkyM2RhM2MuLjJmYjFlYWUgMTAwNjQ0DQo+IC0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kYnVzXzEuMi44LmJiDQo+ICsrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kYnVzXzEuMi44LmJiDQo+IEBA
IC0yMiwzICsyMiw1IEBAIEVYVFJBX09FQ09ORiArPSAiLS1kaXNhYmxlLWRvY3VtZW50YXRpb24i
DQo+ICBSREVQRU5EU18ke1BOfSA9ICJweXRob24zLWlvIHB5dGhvbjMtbG9nZ2luZyBweXRob24z
LXN0cmluZ29sZCBweXRob24zLXRocmVhZGluZyBweXRob24zLXhtbCINCj4NCj4gIEZJTEVTXyR7
UE59LWRldiArPSAiJHtsaWJkaXJ9L3BrZ2NvbmZpZyINCj4gKw0KPiArQkJDTEFTU0VYVEVORCA9
ICJuYXRpdmUgbmF0aXZlc2RrIg0KPiAtLQ0KPiAyLjcuNA0KPg0K

