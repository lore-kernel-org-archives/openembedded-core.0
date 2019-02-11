Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 05B286D4AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 14:41:36 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x1BEfUOb017322
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 11 Feb 2019 15:41:30 +0100
Received: from ATNETS99131MSX.ww300.siemens.net
	(atnets99131msx.ww300.siemens.net [158.226.163.54])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTPS id x1BEfT9X020037
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 11 Feb 2019 15:41:29 +0100
Received: from ATNETS9912WMSX.ww300.siemens.net ([169.254.10.222]) by
	ATNETS99131MSX.ww300.siemens.net ([158.226.163.54]) with mapi id
	14.03.0435.000; Mon, 11 Feb 2019 15:41:29 +0100
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: Khem Raj <raj.khem@gmail.com>, Phil Reid <preid@electromag.com.au>
Thread-Topic: [OE-core] [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to
	allow correct operation with opkg
Thread-Index: AQHUwhcYp3Bxhk9nkUGKdt6t5au1faXaqtUQ
Date: Mon, 11 Feb 2019 14:41:29 +0000
Message-ID: <D55698ECEC159B488D62A508E18D7FEC016D2D46@ATNETS9912WMSX.ww300.siemens.net>
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
	<20181207120605.11344-2-richard.purdie@linuxfoundation.org>
	<fae0fb29acedc0c26cf9d5860e053d1427316cb8.camel@linuxfoundation.org>
	<857809ce-49de-16c2-f26d-805acc3601c2@siemens.com>
	<31abffa69bca5ee313a7d6c30dd7fc06011a14e5.camel@linuxfoundation.org>
	<8ac88775-35f9-e3f6-a0c6-f218aa697e70@siemens.com>
	<81618ab958486def551d22764d960944fb09b73d.camel@linuxfoundation.org>
	<b269e78b-ebc9-751a-1253-dacf881f0a36@electromag.com.au>
	<CAMKF1srR3zd+-wC3npBO+ULJxjEzYRMVejw+vNHcQ8p=n9KGRQ@mail.gmail.com>
In-Reply-To: <CAMKF1srR3zd+-wC3npBO+ULJxjEzYRMVejw+vNHcQ8p=n9KGRQ@mail.gmail.com>
Accept-Language: en-US, de-AT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.13]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Mon, 11 Feb 2019 14:41:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2VlbXMgdG8gYmUsIHRoYXQgaXMgbm90IHRoZSByaWdodCBzb2x1dGlvbiwgZXZlbiBpZiAtZGV2
IHBhY2thZ2UgaXMgbm90IGV4aXN0aW5nLiBPbiB0aGUgb3RoZXIgaGFuZCwgd2h5IGJ1c3lib3gg
cGFja2FnZSBuZWVkcyAtZGV2IHBhY2thZ2UgaXRzZWxmPw0KDQpXZSBjYW4gY3JlYXRlIGFuIGVt
cHR5IHBhY2thZ2UsIHdpdGhvdXQgYW55IHJlcXVpcmVtZW50cyBpZiBpdCdzIHJlYWxseSByZXF1
aXJlZC4NCg0KUmVnYXJkcywNCkFuZHJlag0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gDQpTZW50OiAxMS4gZmVicnXDoXJh
IDIwMTkgMTU6MzUNClRvOiBQaGlsIFJlaWQgPHByZWlkQGVsZWN0cm9tYWcuY29tLmF1Pg0KQ2M6
IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgVmFs
ZWssIEFuZHJlaiAoQ1QgUkRBIERTIEVVIFNLIEJUMSkgPGFuZHJlai52YWxla0BzaWVtZW5zLmNv
bT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIIDIvMl0gbmF0aXZlc2RrLSotcHJvdmlkZXMtZHVtbXk6IEZpeGVz
IHRvIGFsbG93IGNvcnJlY3Qgb3BlcmF0aW9uIHdpdGggb3BrZw0KDQpPbiBXZWQsIEZlYiA2LCAy
MDE5IGF0IDY6MzkgUE0gUGhpbCBSZWlkIDxwcmVpZEBlbGVjdHJvbWFnLmNvbS5hdT4gd3JvdGU6
DQo+DQo+IE9uIDMvMDEvMjAxOSA5OjU5IHBtLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gPiBP
biBNb24sIDIwMTgtMTItMzEgYXQgMjA6NTYgKzAxMDAsIEFuZHJlaiBWYWxlayB3cm90ZToNCj4g
Pj4gWW91ciBwcmV2aW91cyBzb2x1dGlvbiBpcyB3b3JraW5nIGZvciBtZSwgc28gSSB3YXMgbm90
IHdvcmtpbmcgb24gDQo+ID4+IGZpeGluZyB0aGlzLiBJIHRob3VnaHQsIHRoYXQgWW91IHdpbGwg
anVzdCBhZGQgbWlzc2luZyBwYWNrYWdlcywgDQo+ID4+IGFuZCB0aGF0IGlzLg0KPiA+PiBJIGRv
bid0IGhhdmUgc2V0dXAgZm9yIGZhaWxpbmcgbWFjaGluZS4NCj4gPj4NCj4gPj4gSXMgdGhlcmUg
YW55IHNpbXBsZSB3YXkgdG8gZ2V0IGFsbCBtaXNzaW5nIHBlcmwgcGFja2FnZXM/DQo+ID4NCj4g
PiBJIHJld29ya2VkIHRoZSBwYXRjaCBhIGJpdCwgdGVzdGVkIGFuZCBqdXN0IG1lcmdlZCBhIHdv
cmtpbmcgdmVyc2lvbiANCj4gPiBvZg0KPiA+IGl0Og0KPiA+DQo+ID4gaHR0cDovL2dpdC55b2N0
b3Byb2plY3Qub3JnL2NnaXQuY2dpL3Bva3kvY29tbWl0Lz9pZD1kNGUyNzg2M2YzODc0ZmINCj4g
PiA3ZGM1NDNlZWQ4ZGNmNmE4YzRkMTQ2ZmI1DQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4NCj4gPiBS
aWNoYXJkDQo+ID4NCj4NCj4gVGhpcyBwYXRjaCBzZWVtcyB0byB0cmlnZ2VyIHRoZSBmb2xsb3dp
bmcgbmV3IHdhcm5pbmcgZm9yIG1lIGR1cmluZyANCj4gcG9wdWxhdGVfc2RrDQo+DQo+IENvbGxl
Y3RlZCBlcnJvcnM6DQo+ICAgKiBTb2x2ZXIgZW5jb3VudGVyZWQgMSBwcm9ibGVtKHMpOg0KPiAg
ICogUHJvYmxlbSAxLzE6DQo+ICAgKiAgIC0gcGFja2FnZSBidXN5Ym94LWRldi0xLjI5LjItcjAu
NC5jb3J0ZXhhOXQyaGYtbmVvbiByZXF1aXJlcyBidXN5Ym94ID0gMS4yOS4yLXIwLjQsIGJ1dCBu
b25lIG9mIHRoZSBwcm92aWRlcnMgY2FuIGJlIGluc3RhbGxlZA0KPiAgICoNCj4gICAqIFNvbHV0
aW9uIDE6DQo+ICAgKiAgIC0gYWxsb3cgZGVpbnN0YWxsYXRpb24gb2YgdGFyZ2V0LXNkay1wcm92
aWRlcy1kdW1teS0xLjAtcjAuOS5zZGstcHJvdmlkZXMtZHVtbXktdGFyZ2V0DQo+DQo+ICAgKiAg
IC0gZG8gbm90IGFzayB0byBpbnN0YWxsIGEgcGFja2FnZSBwcm92aWRpbmcgdGFyZ2V0LXNkay1w
cm92aWRlcy1kdW1teS1kZXYNCj4NCj4gICAqIFNvbHV0aW9uIDI6DQo+ICAgKiAgIC0gZG8gbm90
IGFzayB0byBpbnN0YWxsIGEgcGFja2FnZSBwcm92aWRpbmcgYnVzeWJveC1kZXYNCj4NCj4NCj4g
Tm90IHN1cmUgd2hhdCBpcyByZXF1ZXN0IGJ1c3lib3gtZGV2IHRvIGJlIGlzdGFsbGVkIGluIHRo
ZSBzZGsuDQo+IEFueSB0aG91Z2h0cz8NCj4NCg0KUmljaGFyZA0KDQpJIGFtIHNlZWluZyBzYW1l
IGZhaWx1cmUgYXMgd2VsbC4gSSBzb2x2ZWQgaXQgYnkgYWRkaW5nDQoNClJERVBFTkRTXyR7UE59
LWRldiA9ICIiIGluIGJ1c3lib3ggcmVjaXBlLg0KDQpJIGFtIG5vdCBzdXJlIGlmIHRoYXRzIHJp
Z2h0IHNvbHV0aW9uLCBidXN5Ym94LWRldiBzZWVtcyB0byBiZSBlbXB0eSBwYWNrYWdlLg0KDQoN
Cj4NCj4NCj4gLS0NCj4gUmVnYXJkcw0KPiBQaGlsIFJlaWQNCj4gLS0NCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUg
bWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1i
ZWRkZWQtY29yZQ0K

