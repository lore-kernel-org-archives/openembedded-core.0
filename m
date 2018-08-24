Return-Path: <prvs=767f4520c=Mikko.Rapeli@bmw.de>
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id AB41479639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1535127450; x=1566663450;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=HESGs+CvAMokPc0OyS95/ouJrW/vPDVNi7k52WUG3Yc=;
	b=QFVhu5anpmW/TIbUaxBLUo1ERMZroHmypgaY/b/iwJ2DMIE51LtEn9O3
	KPYNUWHDDtJPTPLUrdCfcM7fVTQboQ6vTBR1bFV+ug2Gw1hVxd7rtqf0k
	wOmH5S4o7shDmLHhRxNUiqTFsixZaRjrqVRnzUw2zECqy5vf6DnbqoQiw 8=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Aug 2018 18:17:28 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw5.muc with ESMTP/TLS;
	24 Aug 2018 18:17:28 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb5.muc with ESMTP/TLS; 24 Aug 2018 18:17:28 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Fri, 24 Aug 2018 18:17:28 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Fri, 24 Aug 2018 18:17:28 +0200
From: <Mikko.Rapeli@bmw.de>
To: <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] cmake: add CMAKE_SYSROOT to generated
	toolchain file
Thread-Index: AQHUO7TfP39PtwdlbkOrx+nUTU/G7KTO2KyAgAAHkQCAAAqXAIAAAO8AgAAHMYA=
Date: Fri, 24 Aug 2018 16:17:28 +0000
Message-ID: <20180824161727.GL20864@hiutale>
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<20180824141512.GG20864@hiutale> <20180824144323.GJ20864@hiutale>
	<355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
	<20180824154822.GK20864@hiutale>
	<CAMKF1sqc6fQhZfSKZ80D2dyHL_D=2hRAS1zMFKScP8MpXgQRbA@mail.gmail.com>
In-Reply-To: <CAMKF1sqc6fQhZfSKZ80D2dyHL_D=2hRAS1zMFKScP8MpXgQRbA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.44]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake: add CMAKE_SYSROOT to generated toolchain file
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
X-List-Received-Date: Fri, 24 Aug 2018 16:17:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B78050A21BA4134DAC55503B406AB3F3@bmwmail.corp>
Content-Transfer-Encoding: base64

T24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDg6NTE6NDJBTSAtMDcwMCwgS2hlbSBSYWogd3JvdGU6
DQo+IE9uIEZyaSwgQXVnIDI0LCAyMDE4IGF0IDg6NDggQU0gPE1pa2tvLlJhcGVsaUBibXcuZGU+
IHdyb3RlOg0KPiA+IFNvIHRvIG1lIGl0IGxvb2tzIGxpa2UgdXNpbmcgU1lTVEVNIHdpdGggdGFy
Z2V0X2luY2x1ZGVfZGlyZWN0b3JpZXMoKQ0KPiA+IGlzIG5vIGxvbmdlciBwb3NzaWJsZSB3aXRo
IENNYWtlIGFuZCBnY2MgPiA2Og0KPiA+DQo+ID4NCj4gPiBodHRwczovL2NtYWtlLm9yZy9jbWFr
ZS9oZWxwL3YzLjEwL2NvbW1hbmQvdGFyZ2V0X2luY2x1ZGVfZGlyZWN0b3JpZXMuaHRtbD9oaWdo
bGlnaHQ9dGFyZ2V0X2luY2x1ZGVfZGlyZWN0b3JpZXMNCj4gPg0KPiANCj4gVGhhdOKAmXMgcmln
aHQgdGhlcmUgaXMgYSBwYXRjaCBJIGRpZCAgaW4gV2ViS2l0Z3RrIHJlY2lwZSBpbiBPZSBDb3Jl
IHlvdQ0KPiBtaWdodCB3YW50IHRvIGluY2x1ZGUgc2ltaWxhciBmaXhlcyBmb3IgdGhpcyBwYWNr
YWdlIHRoZSBwYXRjaCBhY3R1YWxseSBpdA0KPiBhIHdvcmthcm91bmQgYnV0IHRoZW4gSSBhbHNv
IHRoaW5rIHVzaW5nIGlzeXN0ZW0gaW4gYXBwcyBpcyBhIGJhZCBpZGVhDQoNClllcywgSSB0ZW5k
IHRvIGFncmVlLCBidXQgZGV2ZWxvcGVycyBoYXZlIHVzZWQgdGhpcyB0byBzaWxlbmNlIGNvbXBp
bGVyDQp3YXJuaW5ncyBmcm9tIHN5c3RlbSBoZWFkZXIgZmlsZXMuDQoNCkluIGEgZmV3IGNhc2Vz
IEkgc2F3IHRoYXQgdGhlcmUgd2VyZSBubyBsb25nZXIgYW55IHdhcm5pbmdzIGNvbWluZyBmcm9t
IHRoZQ0KaGVhZGVycyBidXQgaW4gc29tZSBvdGhlcnMgdGhlcmUgd2VyZS4NCg0KQW55IG90aGVy
IGlkZWFzIGhvdyB0byBzdXBwcmVzcyBjb21waWxlciB3YW5pbmdzIGZyb20gc3lzdGVtIGhlYWRl
cnM/DQoNCi1NaWtrbw==

