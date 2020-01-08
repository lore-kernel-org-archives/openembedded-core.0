Return-Path: <frieder.schrempf@kontron.de>
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
	by mail.openembedded.org (Postfix) with ESMTP id 532517F937
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 08:32:02 +0000 (UTC)
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by skedge03.snt-world.com (Postfix) with ESMTPS id CB949459ED58;
	Wed,  8 Jan 2020 09:32:01 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
	(10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5;
	Wed, 8 Jan 2020 09:32:01 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
	sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
	15.01.1913.005; Wed, 8 Jan 2020 09:32:01 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Tom Hochstein <tom.hochstein@nxp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "anuj.mittal@intel.com" <anuj.mittal@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to
	disable menuconfig logic
Thread-Index: AQHVn9hOKHV1irVtG0aDGZ7QPWajF6eqM5oAgA4tZMCAKEq+AA==
Date: Wed, 8 Jan 2020 08:32:01 +0000
Message-ID: <2f61a2ea-456e-0cf0-7ddf-03a0d9adf72e@kontron.de>
References: <20191120192419.7352-1-tom.hochstein@nxp.com>
	<d25ed9e2-6ff8-355a-1de0-8b51aef9e2c8@kontron.de>
	<VE1PR04MB6621F85F190F08F43967C895E2540@VE1PR04MB6621.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6621F85F190F08F43967C895E2540@VE1PR04MB6621.eurprd04.prod.outlook.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: CB949459ED58.AC8A9
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
	Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: akuster808@gmail.com, anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, tom.hochstein@nxp.com
X-Spam-Status: No
Subject: Re: [PATCH 1/2] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Wed, 08 Jan 2020 08:32:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2702161A835B9942A24DA309EAD04F51@snt-world.com>
Content-Transfer-Encoding: base64

T24gMTMuMTIuMTkgMTc6MTQsIFRvbSBIb2Noc3RlaW4gd3JvdGU6DQo+IEkgbWFkZSBhIFBSIGFz
IHdlbGw6DQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL29wZW5lbWJlZGRl
ZC1jb3JlL3B1bGwvNTcNCj4gDQo+IFRvbQ0KDQpJIGRvbid0IHRoaW5rIFBScyBhcmUgYWNjZXB0
ZWQgZm9yIG9lLWNvcmUuIFlvdXIgcGF0Y2hlcyBzaG91bGQgYmUgb2ssIA0KaWYgc29tZW9uZSBy
ZXZpZXdzIGFuZCBhcHBsaWVzIHRoZW0uDQoNCkRlYXIgbWFpbnRhaW5lcnMsIGNvdWxkIHlvdSBj
b25zaWRlciB0byByZXZpZXcvYXBwbHkgdGhpcyBmaXggZm9yIA0KbWFzdGVyL3pldXM/IEl0IGZp
eGVzIGFuIGFubm95aW5nIGlzc3VlIHdoZW4gd29ya2luZyB3aXRoIGRldnRvb2wgYW5kIA0KdS1i
b290Lg0KDQo+IA0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IFNjaHJl
bXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4NCj4+IFNlbnQ6IFdlZG5l
c2RheSwgRGVjZW1iZXIgNCwgMjAxOSAxMDo0NCBBTQ0KPj4gVG86IFRvbSBIb2Noc3RlaW4gPHRv
bS5ob2Noc3RlaW5AbnhwLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMl0gZGV2dG9vbC9zdGFu
ZGFyZC5weTogQWxsb3cgcmVjaXBlIHRvIGRpc2FibGUgbWVudWNvbmZpZyBsb2dpYw0KPj4NCj4+
IEhpLA0KPj4NCj4+IE9uIDIwLjExLjE5IDIwOjI1LCBUb20gSG9jaHN0ZWluIHdyb3RlOg0KPj4+
IHUtYm9vdC5pbmMgc3VwcG9ydHMgdS1ib290IHJlY2lwZXMgd2l0aCBvciB3aXRob3V0IG1lbnVj
b25maWcgWzFdLg0KPj4+IEhvd2V2ZXIsIHJ1bm5pbmcgZGV2dG9vbCBvbiBhIHUtYm9vdCByZWNp
cGUgdGhhdCBkb2VzIG5vdCBzdXBwb3J0IG1lbnVjb25maWcNCj4+PiByZXN1bHRzIGluIGFuIGVy
cm9yOg0KPj4+DQo+Pj4gY3A6IGNhbm5vdCBzdGF0ICcvaG9tZS9yNjA4NzQvdXBzdHJlYW0vZnNs
LXh3YXlsYW5kL3RtcC93b3JrL2lteDhtbWV2ay1mc2wtbGludXgvdS1ib290LWlteC8yMDE4LjAz
LXIwL3UtYm9vdC1pbXgtDQo+PiAyMDE4LjAzLy8uY29uZmlnJzogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQ0KPj4+DQo+Pj4gVGhlIHByb2JsZW0gaXMgdGhlIGRldnRvb2wgbG9naWMgYXNzdW1l
cyB0aGF0IGFueSByZWNpcGUgd2l0aCBhIGRvX21lbnVjb25maWcgdGFzaw0KPj4+IHdpbGwgZ2Vu
ZXJhdGUgYSAuY29uZmlnIGluIGRvX2NvbmZpZ3VyZSgpLg0KPj4+DQo+Pj4gRml4IHRoZSBwcm9i
bGVtIGJ5IHJlbW92aW5nIHRoZSBhc3N1bXB0aW9uIHdpdGggYSBmbGFnIHRoYXQgdGhlIHJlY2lw
ZSBjYW4gY29udHJvbCwNCj4+PiBsaWtlIHRoaXM6DQo+Pj4NCj4+PiBkb19jb25maWd1cmUoKSB7
DQo+Pj4gICAgICAgaWYgWyBtZW51Y29uZmlnLXN1cHBvcnRlZCBdOyB0aGVuDQo+Pj4gICAgICAg
ICAgIC4uLg0KPj4+ICAgICAgIGVsc2UNCj4+PiAgICAgICAgICAgREVWVE9PTF9ESVNBQkxFX01F
TlVDT05GSUc9dHJ1ZQ0KPj4+ICAgICAgIGZpDQo+Pj4gfQ0KPj4+DQo+Pj4gWzFdIGh0dHBzOi8v
ZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUy
RmdpdGh1Yi5jb20lMkZvcGVuZW1iZWRkZWQlMkZvcGVuZW1iZWRkZWQtDQo+PiBjb3JlJTJGY29t
bWl0JTJGMTEyNzhlM2IyYzc1YmU4MDY0NWI5ODQxNzYzYTk3ZGJiMzVkYWFkYyZhbXA7ZGF0YT0w
MiU3QzAxJTdDdG9tLmhvY2hzdGVpbiU0MG54cC5jb20lN0M1ZDY2OGY2NA0KPj4gZDNhMDQ0YWJi
MTFlMDhkNzc4ZDkyYmVmJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdD
MCU3QzYzNzExMDc0NjQ1MjQwNzc1NiZhbXA7c2RhdGE9QUhqdnc5MUc4TjcNCj4+IFd1ZiUyQk9S
QiUyQjVFN2N4RTVjY2lDcG5Fa3RJcWtvRktNWSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPj4+DQo+Pj4g
U2lnbmVkLW9mZi1ieTogVG9tIEhvY2hzdGVpbiA8dG9tLmhvY2hzdGVpbkBueHAuY29tPg0KPj4N
Cj4+IEknbSBleHBlcmllbmNpbmcgdGhpcyBpc3N1ZSBzaW5jZSBtb3ZpbmcgdG8gemV1cy4gWW91
ciBmaXggaW4gdGhpcw0KPj4gc2VyaWVzIHdvcmtzIGZpbmUgZm9yIG1lIGFuZCBJIHdvdWxkIHJl
YWxseSBsaWtlIHRvIHNlZSB0aGlzIG1lcmdlZCBpbiB6ZXVzLg0KPj4NCj4+IFRoYW5rcywNCj4+
IEZyaWVkZXINCj4+DQo+Pj4gLS0tDQo+Pj4gICAgc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFuZGFy
ZC5weSB8IDYgKysrKy0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2xpYi9kZXZ0b29s
L3N0YW5kYXJkLnB5IGIvc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5weQ0KPj4+IGluZGV4
IDhkOWMxYTMwMjIuLjY2YmQxNDE1YzMgMTAwNjQ0DQo+Pj4gLS0tIGEvc2NyaXB0cy9saWIvZGV2
dG9vbC9zdGFuZGFyZC5weQ0KPj4+ICsrKyBiL3NjcmlwdHMvbGliL2RldnRvb2wvc3RhbmRhcmQu
cHkNCj4+PiBAQCAtOTQwLDggKzk0MCwxMCBAQCBkZWYgbW9kaWZ5KGFyZ3MsIGNvbmZpZywgYmFz
ZXBhdGgsIHdvcmtzcGFjZSk6DQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgJ31cbicp
DQo+Pj4gICAgICAgICAgICAgICAgaWYgcmQuZ2V0VmFyRmxhZygnZG9fbWVudWNvbmZpZycsJ3Rh
c2snKToNCj4+PiAgICAgICAgICAgICAgICAgICAgZi53cml0ZSgnXG5kb19jb25maWd1cmVfYXBw
ZW5kKCkge1xuJw0KPj4+IC0gICAgICAgICAgICAgICAgJyAgICBjcCAke0J9Ly5jb25maWcgJHtT
fS8uY29uZmlnLmJhc2VsaW5lXG4nDQo+Pj4gLSAgICAgICAgICAgICAgICAnICAgIGxuIC1zZlQg
JHtCfS8uY29uZmlnICR7U30vLmNvbmZpZy5uZXdcbicNCj4+PiArICAgICAgICAgICAgICAgICcg
ICAgaWYgWyAhICR7REVWVE9PTF9ESVNBQkxFX01FTlVDT05GSUd9IF07IHRoZW5cbicNCj4+PiAr
ICAgICAgICAgICAgICAgICcgICAgICAgIGNwICR7Qn0vLmNvbmZpZyAke1N9Ly5jb25maWcuYmFz
ZWxpbmVcbicNCj4+PiArICAgICAgICAgICAgICAgICcgICAgICAgIGxuIC1zZlQgJHtCfS8uY29u
ZmlnICR7U30vLmNvbmZpZy5uZXdcbicNCj4+PiArICAgICAgICAgICAgICAgICcgICAgZmlcbicN
Cj4+PiAgICAgICAgICAgICAgICAgICAgJ31cbicpDQo+Pj4gICAgICAgICAgICAgICAgaWYgaW5p
dGlhbF9yZXY6DQo+Pj4gICAgICAgICAgICAgICAgICAgIGYud3JpdGUoJ1xuIyBpbml0aWFsX3Jl
djogJXNcbicgJSBpbml0aWFsX3JldikNCj4+Pg==

