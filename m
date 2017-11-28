Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D00096093F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 01:33:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAS1XPR8012996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 17:33:25 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.128]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Mon, 27 Nov 2017 17:33:25 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Hatle, Mark" <mark.hatle@windriver.com>, "Slater, Joseph"
	<joe.slater@windriver.com>
Thread-Topic: backfill mechanism
Thread-Index: AdNf+226ORa9l6NuR/SCoUcn6/NVXgH3mjiAAAOgW4A=
Date: Tue, 28 Nov 2017 01:33:23 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B923FF5@ALA-MBC.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84CF45536D@ALA-MBC.corp.ad.wrs.com>
	<59914a6c-c977-608e-b6eb-1f9167af3a59@windriver.com>
In-Reply-To: <59914a6c-c977-608e-b6eb-1f9167af3a59@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.140]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: backfill mechanism
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
X-List-Received-Date: Tue, 28 Nov 2017 01:33:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyayBIYXRsZSBbbWFp
bHRvOm1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbV0NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAy
NywgMjAxNyAyMzo0Ng0KPiBUbzogU2xhdGVyLCBKb3NlcGg7IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IE1hY0xlb2QsIFJhbmR5OyBIdWFuZywgSmllIChK
YWNraWUpDQo+IFN1YmplY3Q6IFJlOiBiYWNrZmlsbCBtZWNoYW5pc20NCj4gDQo+IE9uIDExLzE3
LzE3IDU6MzIgUE0sIFNsYXRlciwgSm9zZXBoIHdyb3RlOg0KPiA+IFRoZSBiYWNrZmlsbCBtZWNo
YW5pc20gaXMgbm90IGNvbXBhdGlibGUgd2l0aCBtdWx0aWxpYi7CoCBUaGlzIGNvdWxkIHBvc3Np
Ymx5IGJlDQo+ID4gZml4ZWQsIGJ1dCB0aGUgYmFja2ZpbGxfY29uc2lkZXJlZCBmdW5jdGlvbmFs
aXR5IGlzIGFsc28gb2JzY3VyZSwgc28gSSB0aGluayBpbg0KPiA+IGF0IGxlYXN0IHRoZSBtYWNo
aW5lIHJlbGF0ZWQgLmluYyBmaWxlcyB3ZSBzaG91bGQgcmVwbGFjZSBsaW5lcyBsaWtlDQo+ID4N
Cj4gPg0KPiA+DQo+ID4gTUFDSElORV9GRUFUVVJFU19CQUNLRklMTF9DT05TSURFUkVEX2FwcGVu
ZCA9ICINCj4gPiAke0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsICduMzInLCAn
cWVtdS11c2VybW9kZScsICcnLCBkKX0iDQo+ID4NCj4gDQo+IFRoaXMgbm90IHdvcmtpbmcgd2l0
aCBtdWx0aWxpYnMgaXMgZGVmaW5pdGVseSBhIGJ1ZyB0aGF0IHdlIG5lZWQgdG8gZmlsZSB3aXRo
DQo+IHRoZSBjb21tdW5pdHkuICBXZSBjYW4gdXNlIHRoZSBzdHVmZiBiZWxvdyBhcyBhIHdvcmth
cm91bmQuICBCdXQgYWxsIGZlYXR1cmVzDQo+IHNob3VsZCB3b3JrIHByb3Blcmx5IHdpdGggdGhl
IG11bHRpbGliIGNvbmZpZ3VyYXRpb25zLg0KPiANCj4gUGxlYXNlIG9wZW4gYSBidWcgaW4gdGhl
IFlvY3RvIFN5c3RlbSBhbmQgb3VyIG93biAocG9pbnRpbmcgdG8gdGhlIFlQIGJ1Z3ppbGxhKQ0K
DQpJIGFscmVhZHkgb3BlbmVkIGEgYnVnIGluIFlQIEJ1Z3ppbGxhOg0KaHR0cHM6Ly9idWd6aWxs
YS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xMjM3Mw0KDQpBbmQgd2UgaGF2ZSBh
bHNvIG9uZSBpbiBvdXIgb3duLg0KDQpUaGFua3MsDQpKYWNraWUNCg0KPiBzbyB3ZSBjYW4gYXQg
dGhlIG1pbmltdW0gdHJhY2sgdGhpcy4NCj4gDQo+IC0tTWFyaw0KPiANCj4gPg0KPiA+IHdpdGgg
bGluZXMgbGlrZQ0KPiA+DQo+ID4NCj4gPg0KPiA+IE1BQ0hJTkVfRkVBVFVSRVNfcmVtb3ZlX21p
cHNhcmNobjMyID0gIiBxZW11LXVzZXJtb2RlIg0KPiA+DQo+ID4NCj4gPg0KPiA+IFRoZXJlIGFy
ZSB0d28gYWR2YW50YWdlczrCoCB0aGUgc2Vjb25kIGxpbmUgd29ya3MgZm9yIG11bHRpbGliLCBh
bmQgaXQgaXMgZmFyDQo+ID4gbW9yZSByZWFkYWJsZS4NCj4gPg0KPiA+DQo+ID4NCj4gPiBKb2UN
Cj4gPg0KPiA+DQo+ID4NCg0K

