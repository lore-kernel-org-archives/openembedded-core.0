Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6D16080F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 07:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 070A12E2BA;
	Tue, 11 Oct 2016 09:27:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id orhJ3ODRExTv; Tue, 11 Oct 2016 09:27:06 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id B5A502E2BD;
	Tue, 11 Oct 2016 09:27:06 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98DEF1E081;
	Tue, 11 Oct 2016 09:27:06 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D4441E076;
	Tue, 11 Oct 2016 09:27:06 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 11 Oct 2016 09:27:06 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 80C4A31D;
	Tue, 11 Oct 2016 09:27:06 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 11 Oct 2016 09:27:06 +0200
Received: from XBOX04.axis.com (10.0.5.18) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 11 Oct 2016 09:27:06 +0200
Received: from XBOX04.axis.com ([fe80::6c88:230d:cafd:2f2a]) by
	XBOX04.axis.com ([fe80::6c88:230d:cafd:2f2a%22]) with mapi id
	15.00.1210.000; Tue, 11 Oct 2016 09:27:06 +0200
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Christopher Larson <clarson@kergoth.com>
Thread-Topic: [OE-core] [PATCH] devtool: Only register each plugin once
Thread-Index: AQHSIwM00hUy2QvNM0uCMfNC/jCjXaCh7PAAgADkxOA=
Date: Tue, 11 Oct 2016 07:27:06 +0000
Message-ID: <528e281aa9df4a5887a52315944cf1f3@XBOX04.axis.com>
References: <1476109151-10857-1-git-send-email-ola.x.nilsson@axis.com>
	<CABcZAN=gFYQEGVY024Az-bGhPWMpNkct6uCzPMe3v9r9L8qPbQ@mail.gmail.com>
In-Reply-To: <CABcZAN=gFYQEGVY024Az-bGhPWMpNkct6uCzPMe3v9r9L8qPbQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: Only register each plugin once
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
X-List-Received-Date: Tue, 11 Oct 2016 07:27:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBGcm9tOiBrZXJnb3RoQGdtYWlsLmNvbSBbbWFpbHRvOmtlcmdvdGhAZ21haWwuY29tXSBPbiBC
ZWhhbGYgT2YgQ2hyaXN0b3BoZXIgTGFyc29uDQo+IFNlbnQ6IGRlbiAxMCBva3RvYmVyIDIwMTYg
MjE6MTMNCj4+IE9uIE1vbiwgT2N0IDEwLCAyMDE2IGF0IDc6MTkgQU0sIE9sYSB4IE5pbHNzb24g
PG9sYS54Lm5pbHNzb25AYXhpcy5jb20+IHdyb3RlOg0KPj4gV2hlbiBhIGRldnRvb2wgcGx1Z2lu
IGlzIHNoYWRvd2VkIGluIGEgaGlnaGVyLXByaW9ydHkgbGF5ZXIgdGhlDQo+PiByZWdpc3Rlcl9j
b21tYW5kcyBtZXRob2Qgd2FzIGNhbGxlZCBvbiB0aGUgc2hhZG93aW5nIHBsdWdpbiBvbmNlIGZv
cg0KPj4gZWFjaCBmb3VuZCBwbHVnaW4gd2l0aCB0aGF0IG5hbWUuwqAgQSBzaW1wbGUgdW5pcXVl
IG9wZXJhdGlvbiBvbiB0aGUgbGlzdA0KPj4gb2YgbG9hZGVkIHBsdWdpbnMgc29sdmVzIHRoYXQg
cHJvYmxlbS7CoCBJdCBtYXkgc3RpbGwgYmUgYSBwcm9ibGVtIHRoYXQNCj4+IGVhY2ggcGx1Z2lu
IC0gc2hhZG93ZWQgb3Igbm90IC0gaXMgbG9hZGVkIGFuZCBpbml0aWFsaXplZC4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBPbGEgeCBOaWxzc29uIDxvbGEueC5uaWxzc29uQGF4aXMuY29tPg0KPj4g
LS0tDQo+PsKgc2NyaXB0cy9kZXZ0b29sIHwgMiArLQ0KPj7CoDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2Rl
dnRvb2wgYi9zY3JpcHRzL2RldnRvb2wNCj4+IGluZGV4IDBjMzJjNTAuLjdiMTM0YTYgMTAwNzU1
DQo+PiAtLS0gYS9zY3JpcHRzL2RldnRvb2wNCj4+ICsrKyBiL3NjcmlwdHMvZGV2dG9vbA0KPj4g
QEAgLTMxNyw3ICszMTcsNyBAQCBkZWYgbWFpbigpOg0KPj7CoCDCoCDCoCDCoCDCoHBhcnNlcl9j
cmVhdGVfd29ya3NwYWNlLmFkZF9hcmd1bWVudCgnLS1jcmVhdGUtb25seScsIGFjdGlvbj0ic3Rv
cmVfdHJ1ZSIsIGhlbHA9J09ubHkgY3JlYXRlIHRoZSB3b3Jrc3BhY2UgbGF5ZXIsIGRvIG5vdCBh
bHRlciBjb25maWd1cmF0aW9uJykNCj4+wqAgwqAgwqAgwqAgwqBwYXJzZXJfY3JlYXRlX3dvcmtz
cGFjZS5zZXRfZGVmYXVsdHMoZnVuYz1jcmVhdGVfd29ya3NwYWNlLCBub193b3Jrc3BhY2U9VHJ1
ZSkNCj4+DQo+PiAtwqAgwqAgZm9yIHBsdWdpbiBpbiBwbHVnaW5zOg0KPj4gK8KgIMKgIGZvciBw
bHVnaW4gaW4gc2V0KHBsdWdpbnMpOg0KPj7CoCDCoCDCoCDCoCDCoGlmIGhhc2F0dHIocGx1Z2lu
LCAncmVnaXN0ZXJfY29tbWFuZHMnKToNCj4+wqAgwqAgwqAgwqAgwqAgwqAgwqBwbHVnaW4ucmVn
aXN0ZXJfY29tbWFuZHMoc3VicGFyc2VycywgY29udGV4dCkNCj4+DQo+PiBUaGlzIGlzIGRpcmVj
dGx5IGNvbXBhcmluZyB0aGUgcGx1Z2luIG1vZHVsZXMgb3IgY2xhc3Nlcywgd2hpY2gsIGlmIHRo
ZXJl4oCZcyBzaGFkb3dpbmcgZ29pbmcgb24sIA0KPj4gd2lsbCBhbG1vc3QgY2VydGFpbmx5IGJl
IGRpZmZlcmVudCwgYW5kIHdl4oCZbGwgc3RpbGwgZW5kIHVwIHdpdGggdGhlIHNhbWUgY29tbWFu
ZHMgcmVnaXN0ZXJlZCBtdWx0aXBsZSB0aW1lcy4gDQo+PiBBbmQgb2YgY291cnNlLCB1c2Ugb2Yg
c2V0IHdpbGwgYWxzbyBjaGFuZ2UgdGhlIHBsdWdpbiBjb21tYW5kIHJlZ2lzdHJhdGlvbiBvcmRl
ci4gSWYgd2XigJlyZSBnb2luZyB0byBpZ25vcmUgDQo+PiBjb21tYW5kcyBvbiBzb21lIG9mIHRo
ZSBwbHVnaW5zLCBpdCBzaG91bGQgaGF2ZSBhdm9pZGVkIGxvYWRpbmcgdGhlbSBlbnRpcmVseSwg
bm90IGxvYWQgdGhlbSBhbmQgdGhlbiANCj4+IHByZXZlbnQgcmVnaXN0cmF0aW9uLiBXZSBzaG91
bGQgY2hhbmdlIHRoZSBwbHVnaW4gKmxvYWRpbmcqIHRvIG9ubHkgbG9hZCB0aGUgaGlnaGVzdCBw
cmlvcml0eSANCj4+KGZpcnN0IHNlZW4gaW4gYmJwYXRoKSBmaWxlIGZvciBhIGdpdmVuIC5weSwg
YmFzZWQgb24gdGhlIGZpbGUgLyBtb2R1bGUgbmFtZSwgSU1PLg0KDQpBZ3JlZWQsIHRoaXMgZG9l
cyBub3Qgd29yayBhcyBpbnRlbmRlZC4gIFBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaCwgSSdsbCB0
cnkgdG8gcHJvZHVjZSBzb21ldGhpbmcgYmV0dGVyLg0KDQpUaGUgd2F5IHRoZSBwbHVnaW4gbG9h
ZGVyIHdvcmtzLCB0aGVyZSBjYW4gb25seSBiZSBhIHNpbmdsZSBwbHVnaW4gbG9hZGVkIHdpdGgg
YSBzcGVjaWZpYyBmaWxlIG5hbWUuIA0KU28gc2hhZG93aW5nIG9jY3VycywgYnV0IHByb2JhYmx5
IG5vdCB0aGUgd2F5IHdlIHdhbnQuIEkgdGhpbmsgdGhlIGxhc3QgZm91bmQgcGx1Z2luIHdpbGwg
d2luLCAgdGhhdCBpcyB0aGUgcGx1Z2luIGluIHRoZSBsb3dlc3QgcHJpb3JpdHkgbGF5ZXIuDQoN
CkRvIHdlIHdhbnQgc2hhZG93aW5nIHRvIHdvcmsgb24gcGx1Z2luIG9yIGNvbW1hbmQgbGV2ZWw/
DQoNCi0tIA0KT2xhIE5pbHNzb24NCg==

