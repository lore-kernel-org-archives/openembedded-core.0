Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 12A786C4CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 06:54:57 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 3935B10C0E37;
	Mon, 26 Nov 2018 22:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1543301698; bh=k4f+yVly3eusexAxtu123uTE5cqc4gPTzi2iXgowt/M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UOnbRYdF//AyxnUaaAmKd9wEYCx3Rz8xzRMMeuwOFeJ4QXFhyugBeEWiGd5h4Mw3v
	zydkV/keRu0PwvvD4K2R6viwEX/ANf1kqaoZS+LMS9CGlUitbuNXY21KoHE8Cd3GkG
	6y5Ngf4fOsj3jElfJevbK22Q4TYm0wMuf9zrDC7WNst1ceWt8ZO8cLIZX9ttCJIw86
	kKGyTDs9rtbD/+HWYjYOeL7auOAo4li5Pc671erpO7Ft5OHfypKI4x6URIqqYFwPXJ
	FMsubL6sPTkEWXMgbkimz6cNQQVcRRI/OC0NXEKxKoXv6iiEgT+0eGYdRP3dlcDQT4
	sU9QvxvSpE9Qg==
Received: from us01wehtc1.internal.synopsys.com
	(us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
	by mailhost.synopsys.com (Postfix) with ESMTP id 46CBA40BB;
	Mon, 26 Nov 2018 22:54:57 -0800 (PST)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Mon, 26 Nov 2018 22:54:57 -0800
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0415.000; Tue, 27 Nov 2018 07:54:55 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "trini@konsulko.com" <trini@konsulko.com>
Thread-Topic: [OE-core] [PATCH v7] u-boot: Add mkenvimage tool
Thread-Index: AQHUgrbjLyqv9A0wCU69BCrmiPWOHKVe9ciAgAOSeACAABszgIAAHR+AgABlbQA=
Date: Tue, 27 Nov 2018 06:54:54 +0000
Message-ID: <17248895eec3e078e9aa6e31b20b598abbccaa08.camel@synopsys.com>
References: <20181122225820.2553-1-abrodkin@synopsys.com>
	<CAMKF1sqbHtV1UYiXre_1sNEzyFWJw3mRs_hcuVzu+us_r0OWVg@mail.gmail.com>
	<8950e9f58055a8667d20ff83de1f8acd14b7f303.camel@synopsys.com>
	<CAP9ODKrJ0Yshn29tSt-Aj1Gr01+XrZ7C_K4Yn4r6yA4CdkiCnQ@mail.gmail.com>
	<20181127005151.GG11247@bill-the-cat>
In-Reply-To: <20181127005151.GG11247@bill-the-cat>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.2 (3.30.2-2.fc29) 
x-originating-ip: [10.225.15.87]
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>,
	"otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"alexey.brodkin@synopsys.com" <alexey.brodkin@synopsys.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v7] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 27 Nov 2018 06:54:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <434B63AE1AC91942B1DAECAE6D88C0A1@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgVG9tLA0KDQpPbiBNb24sIDIwMTgtMTEtMjYgYXQgMTk6NTEgLTA1MDAsIFRvbSBSaW5pIHdy
b3RlOg0KPiBPbiBNb24sIE5vdiAyNiwgMjAxOCBhdCAwOTowNzozN1BNIC0wMjAwLCBPdGF2aW8g
U2FsdmFkb3Igd3JvdGU6DQo+ID4gSGVsbG8gQWxleGV5LA0KPiA+IA0KPiA+IE9uIE1vbiwgTm92
IDI2LCAyMDE4IGF0IDc6MzAgUE0gQWxleGV5IEJyb2RraW4NCj4gPiA8YWxleGV5LmJyb2RraW5A
c3lub3BzeXMuY29tPiB3cm90ZToNCj4gPiA+IE9uIFNhdCwgMjAxOC0xMS0yNCBhdCAwNjo1NyAt
MDgwMCwgS2hlbSBSYWogd3JvdGU6DQo+ID4gPiA+IGh0dHA6Ly9lcnJvcnMueW9jdG9wcm9qZWN0
Lm9yZy9FcnJvcnMvRGV0YWlscy8yMDIxODUvDQo+ID4gPiANCj4gPiA+IExvb2tpbmcgYXQgdGhl
IHRhcmdldCBuYW1lICJ1LWJvb3QtdG9vbHMtMV8yMDE4LjExLXIwIGRvX2NvbXBpbGUiDQo+ID4g
PiBJIHRoaW5rIGl0IG1pZ2h0IGhhdmUgc29tZXRoaW5nIHRvIGRvIHdpdGggYnVtcCBvZiBVLUJv
b3QgdG8gdjIwMTguMTENCj4gPiA+IGFuZCB0aGUgZXJyb3IgbWVzc2FnZSBpbiBxdWVzdGlvbiB3
YXMgYWRkZWQgaW4gdjIwMTguMTEtcmMxLA0KPiA+ID4gc2VlIGh0dHA6Ly9naXQuZGVueC5kZS8/
cD11LWJvb3QuZ2l0O2E9Y29tbWl0ZGlmZjtoPWE0OTU4YTcxMDE3ZmIxNDI1NDJmOTc3Yzg0M2M1
ZmNlNzY5ZmM2ZWENCj4gPiA+IA0KPiA+ID4gVGhlIHByb2JsZW0gaXMgd2UgdXNlICJzYW5kYm94
X2RlZmNvbmZpZyIgYXMgYSBkdW1teSBkZWZjb25maWcNCj4gPiA+IGJlY2F1c2Ugb3RoZXJ3aXNl
IChub3QgY29uZmlndXJlZCkgVS1Cb290J3MgYnVpbGQtc3lzdGVtIHdvbid0DQo+ID4gPiBhbGxv
dyB1cyB0byBwcm9jZWVkIGFuZCBpbiBpdHMgdHVybiBtZW50aW9uZWQgcGF0Y2ggYWRkcyBhIGNo
ZWNrDQo+ID4gPiBmb3IgYSB0YXJnZXQgcGxhdGZvcm0gbGlrZSAiaWYgZGVmaW5lZChfX3g4Nl82
NF9fKSIgd2hpY2gNCj4gPiA+IHdlIGVzc2VudGlhbGx5IGRvbid0IHNhdGlzZnkgYW5kIHNvIHdl
IGZhaWwuDQo+ID4gPiANCj4gPiA+IFRoZXJlJ3JlIHRoZSBmb2xsb3dpbmcgc29sdXRpb25zOg0K
PiA+ID4gIDEuIFJldmVydCBtZW50aW9uZWQgcGF0Y2gNCj4gPiA+ICAyLiBEaXNhYmxlICJDT05G
SUdfRUZJX0xPQURFUiINCj4gPiA+IA0KPiA+ID4gUmV2ZXJ0aW5nIGlzIG5vdCBuaWNlIGFuZCBu
b3QgZnV0dXJlLXByb29mLg0KPiA+ID4gRGlzYWJsaW5nIG9mICJDT05GSUdfRUZJX0xPQURFUiIg
bWlnaHQgYmUgZG9uZSBpbiBhIGNvdXBsZSBvZiB3YXlzDQo+ID4gPiBsaWtlOg0KPiA+ID4gIDEu
IFBhdGNoaW5nIHNhbmRib3hfZGVmY29uZmlnDQo+ID4gPiAgMi4gRmlsdGVyaW5nICJDT05GSUdf
RUZJX0xPQURFUiIgZnJvbSAic2FuZGJveF9kZWZjb25maWciIHJpZ2h0IGJlZm9yZQ0KPiA+ID4g
ICAgIGV4ZWN1dGlvbiBvZiAibWFrZSBzYW5kYm94X2RlZmNvbmZpZyINCj4gPiA+IA0KPiA+ID4g
SSB0aGluayBsYXR0ZXIgb3B0aW9uIGlzIHRoZSBzaW1wbGVzdCBhbmQgY2xlYW5lc3QuDQo+ID4g
PiANCj4gPiA+IFNob3VsZCBJIHNlbmQgYSBwYXRjaCBmb3IgdGhhdD8NCj4gPiANCj4gPiBMZXQn
cyBhZGQgVG9tIChVLUJvb3QgdXBzdHJlYW0gbWFpbiBtYWludGFpbmVyKSB0byB0aGlzIHNvIGhl
IGNhbiBjb21tZW50Lg0KPiANCj4gSGV5LCBzbyB5b3UndmUgaGl0IHRoZSBwcm9ibGVtIEZlZG9y
YSBhbHNvIGhpdCwgYnV0IHdlIGhhdmVuJ3QgZ290dGVuIGENCj4gcmVhbCBzb2x1dGlvbiB0by4g
IFllcywgdGhlIGJlc3QgImZpeCIgaGVyZSBmb3IganVzdCBidWlsZGluZyB0b29scw0KPiB3b3Vs
ZCBiZSB0byB0dXJuIG9mZiBFRklfTE9BREVSIGluIHNhbmRib3gsIG9uIGFsbCBhcmNoZXMuDQoN
CkJ1dCB3aHkgZG9uJ3Qgd2Ugc2ltcGx5IHVzZSBvdXIgb3duIHJlYWxseSBkdW1teSBkZWZjb25m
aWcgbGlrZSB0aGF0Pw0KLS0tLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0N
CmVjaG8gIkNPTkZJR19TWVNfVEVYVF9CQVNFPTAiID4gLmNvbmZpZw0KbWFrZSBvbGRkZWZjb25m
aWcNCm1ha2UgdG9vbHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0+OC0tLS0tLS0tLS0tLS0tLS0tLS0t
DQoNClRoaXMgaXMgbXVjaCBjbGVhbmVyIGFwcHJvYWNoIGFuZCBtdWNoIHNpbXBsZXIgdG8gaW1w
bGVtZW50Lg0KDQotQWxleGV5DQo=

