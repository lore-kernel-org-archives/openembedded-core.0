Return-Path: <frieder.schrempf@kontron.de>
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
	by mail.openembedded.org (Postfix) with ESMTP id C56286010E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:27:01 +0000 (UTC)
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by skedge04.snt-world.com (Postfix) with ESMTPS id 2FC1467A906;
	Wed, 29 Jan 2020 09:20:32 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
	(10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5;
	Wed, 29 Jan 2020 09:20:31 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
	sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
	15.01.1913.005; Wed, 29 Jan 2020 09:20:31 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Tom Hochstein <tom.hochstein@nxp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "anuj.mittal@intel.com" <anuj.mittal@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to
	disable menuconfig logic
Thread-Index: AQHVn9hOKHV1irVtG0aDGZ7QPWajF6eqM5oAgA4tZMCAKEq+AIAg/bSA
Date: Wed, 29 Jan 2020 08:20:31 +0000
Message-ID: <da035af4-d1e8-efd9-30fc-19a4f875948b@kontron.de>
References: <20191120192419.7352-1-tom.hochstein@nxp.com>
	<d25ed9e2-6ff8-355a-1de0-8b51aef9e2c8@kontron.de>
	<VE1PR04MB6621F85F190F08F43967C895E2540@VE1PR04MB6621.eurprd04.prod.outlook.com>
	<2f61a2ea-456e-0cf0-7ddf-03a0d9adf72e@kontron.de>
In-Reply-To: <2f61a2ea-456e-0cf0-7ddf-03a0d9adf72e@kontron.de>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 2FC1467A906.ABB3A
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
X-List-Received-Date: Thu, 30 Jan 2020 12:28:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CF4523E0BD35F48A58FFF52DCCC668C@snt-world.com>
Content-Transfer-Encoding: base64

T24gMDguMDEuMjAgMDk6MzIsIFNjaHJlbXBmIEZyaWVkZXIgd3JvdGU6DQo+IE9uIDEzLjEyLjE5
IDE3OjE0LCBUb20gSG9jaHN0ZWluIHdyb3RlOg0KPj4gSSBtYWRlIGEgUFIgYXMgd2VsbDoNCj4+
DQo+PiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL29wZW5lbWJlZGRlZC1jb3JlL3B1
bGwvNTcNCj4+DQo+PiBUb20NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgUFJzIGFyZSBhY2NlcHRlZCBm
b3Igb2UtY29yZS4gWW91ciBwYXRjaGVzIHNob3VsZCBiZSBvaywNCj4gaWYgc29tZW9uZSByZXZp
ZXdzIGFuZCBhcHBsaWVzIHRoZW0uDQo+IA0KPiBEZWFyIG1haW50YWluZXJzLCBjb3VsZCB5b3Ug
Y29uc2lkZXIgdG8gcmV2aWV3L2FwcGx5IHRoaXMgZml4IGZvcg0KPiBtYXN0ZXIvemV1cz8gSXQg
Zml4ZXMgYW4gYW5ub3lpbmcgaXNzdWUgd2hlbiB3b3JraW5nIHdpdGggZGV2dG9vbCBhbmQNCj4g
dS1ib290Lg0KDQpQaW5nIGFnYWluLg0KDQpDYW4gc29tZW9uZSBwbGVhc2UgYXQgbGVhc3QgbG9v
ayBhdCB0aGVzZSBwYXRjaGVzIG9yIGdpdmUgYW55IHJlYXNvbiB3aHkgDQpubyBvbmUgY2FyZXMg
YWJvdXQgdGhlbT8NCg0KVGhhbmtzIQ0KDQo+IA0KPj4NCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPj4+IEZyb206IFNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29u
dHJvbi5kZT4NCj4+PiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDQsIDIwMTkgMTA6NDQgQU0N
Cj4+PiBUbzogVG9tIEhvY2hzdGVpbiA8dG9tLmhvY2hzdGVpbkBueHAuY29tPjsgb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPj4+IFN1YmplY3Q6IFJlOiBbT0UtY29y
ZV0gW1BBVENIIDEvMl0gZGV2dG9vbC9zdGFuZGFyZC5weTogQWxsb3cgcmVjaXBlIHRvIGRpc2Fi
bGUgbWVudWNvbmZpZyBsb2dpYw0KPj4+DQo+Pj4gSGksDQo+Pj4NCj4+PiBPbiAyMC4xMS4xOSAy
MDoyNSwgVG9tIEhvY2hzdGVpbiB3cm90ZToNCj4+Pj4gdS1ib290LmluYyBzdXBwb3J0cyB1LWJv
b3QgcmVjaXBlcyB3aXRoIG9yIHdpdGhvdXQgbWVudWNvbmZpZyBbMV0uDQo+Pj4+IEhvd2V2ZXIs
IHJ1bm5pbmcgZGV2dG9vbCBvbiBhIHUtYm9vdCByZWNpcGUgdGhhdCBkb2VzIG5vdCBzdXBwb3J0
IG1lbnVjb25maWcNCj4+Pj4gcmVzdWx0cyBpbiBhbiBlcnJvcjoNCj4+Pj4NCj4+Pj4gY3A6IGNh
bm5vdCBzdGF0ICcvaG9tZS9yNjA4NzQvdXBzdHJlYW0vZnNsLXh3YXlsYW5kL3RtcC93b3JrL2lt
eDhtbWV2ay1mc2wtbGludXgvdS1ib290LWlteC8yMDE4LjAzLXIwL3UtYm9vdC1pbXgtDQo+Pj4g
MjAxOC4wMy8vLmNvbmZpZyc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4+Pj4NCj4+Pj4g
VGhlIHByb2JsZW0gaXMgdGhlIGRldnRvb2wgbG9naWMgYXNzdW1lcyB0aGF0IGFueSByZWNpcGUg
d2l0aCBhIGRvX21lbnVjb25maWcgdGFzaw0KPj4+PiB3aWxsIGdlbmVyYXRlIGEgLmNvbmZpZyBp
biBkb19jb25maWd1cmUoKS4NCj4+Pj4NCj4+Pj4gRml4IHRoZSBwcm9ibGVtIGJ5IHJlbW92aW5n
IHRoZSBhc3N1bXB0aW9uIHdpdGggYSBmbGFnIHRoYXQgdGhlIHJlY2lwZSBjYW4gY29udHJvbCwN
Cj4+Pj4gbGlrZSB0aGlzOg0KPj4+Pg0KPj4+PiBkb19jb25maWd1cmUoKSB7DQo+Pj4+ICAgICAg
ICBpZiBbIG1lbnVjb25maWctc3VwcG9ydGVkIF07IHRoZW4NCj4+Pj4gICAgICAgICAgICAuLi4N
Cj4+Pj4gICAgICAgIGVsc2UNCj4+Pj4gICAgICAgICAgICBERVZUT09MX0RJU0FCTEVfTUVOVUNP
TkZJRz10cnVlDQo+Pj4+ICAgICAgICBmaQ0KPj4+PiB9DQo+Pj4+DQo+Pj4+IFsxXSBodHRwczov
L2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZnaXRodWIuY29tJTJGb3BlbmVtYmVkZGVkJTJGb3BlbmVtYmVkZGVkLQ0KPj4+IGNvcmUlMkZj
b21taXQlMkYxMTI3OGUzYjJjNzViZTgwNjQ1Yjk4NDE3NjNhOTdkYmIzNWRhYWRjJmFtcDtkYXRh
PTAyJTdDMDElN0N0b20uaG9jaHN0ZWluJTQwbnhwLmNvbSU3QzVkNjY4ZjY0DQo+Pj4gZDNhMDQ0
YWJiMTFlMDhkNzc4ZDkyYmVmJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0Mw
JTdDMCU3QzYzNzExMDc0NjQ1MjQwNzc1NiZhbXA7c2RhdGE9QUhqdnc5MUc4TjcNCj4+PiBXdWYl
MkJPUkIlMkI1RTdjeEU1Y2NpQ3BuRWt0SXFrb0ZLTVklM0QmYW1wO3Jlc2VydmVkPTANCj4+Pj4N
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogVG9tIEhvY2hzdGVpbiA8dG9tLmhvY2hzdGVpbkBueHAuY29t
Pg0KPj4+DQo+Pj4gSSdtIGV4cGVyaWVuY2luZyB0aGlzIGlzc3VlIHNpbmNlIG1vdmluZyB0byB6
ZXVzLiBZb3VyIGZpeCBpbiB0aGlzDQo+Pj4gc2VyaWVzIHdvcmtzIGZpbmUgZm9yIG1lIGFuZCBJ
IHdvdWxkIHJlYWxseSBsaWtlIHRvIHNlZSB0aGlzIG1lcmdlZCBpbiB6ZXVzLg0KPj4+DQo+Pj4g
VGhhbmtzLA0KPj4+IEZyaWVkZXINCj4+Pg0KPj4+PiAtLS0NCj4+Pj4gICAgIHNjcmlwdHMvbGli
L2RldnRvb2wvc3RhbmRhcmQucHkgfCA2ICsrKystLQ0KPj4+PiAgICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBh
L3NjcmlwdHMvbGliL2RldnRvb2wvc3RhbmRhcmQucHkgYi9zY3JpcHRzL2xpYi9kZXZ0b29sL3N0
YW5kYXJkLnB5DQo+Pj4+IGluZGV4IDhkOWMxYTMwMjIuLjY2YmQxNDE1YzMgMTAwNjQ0DQo+Pj4+
IC0tLSBhL3NjcmlwdHMvbGliL2RldnRvb2wvc3RhbmRhcmQucHkNCj4+Pj4gKysrIGIvc2NyaXB0
cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5weQ0KPj4+PiBAQCAtOTQwLDggKzk0MCwxMCBAQCBkZWYg
bW9kaWZ5KGFyZ3MsIGNvbmZpZywgYmFzZXBhdGgsIHdvcmtzcGFjZSk6DQo+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAnfVxuJykNCj4+Pj4gICAgICAgICAgICAgICAgIGlmIHJkLmdl
dFZhckZsYWcoJ2RvX21lbnVjb25maWcnLCd0YXNrJyk6DQo+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgZi53cml0ZSgnXG5kb19jb25maWd1cmVfYXBwZW5kKCkge1xuJw0KPj4+PiAtICAgICAgICAg
ICAgICAgICcgICAgY3AgJHtCfS8uY29uZmlnICR7U30vLmNvbmZpZy5iYXNlbGluZVxuJw0KPj4+
PiAtICAgICAgICAgICAgICAgICcgICAgbG4gLXNmVCAke0J9Ly5jb25maWcgJHtTfS8uY29uZmln
Lm5ld1xuJw0KPj4+PiArICAgICAgICAgICAgICAgICcgICAgaWYgWyAhICR7REVWVE9PTF9ESVNB
QkxFX01FTlVDT05GSUd9IF07IHRoZW5cbicNCj4+Pj4gKyAgICAgICAgICAgICAgICAnICAgICAg
ICBjcCAke0J9Ly5jb25maWcgJHtTfS8uY29uZmlnLmJhc2VsaW5lXG4nDQo+Pj4+ICsgICAgICAg
ICAgICAgICAgJyAgICAgICAgbG4gLXNmVCAke0J9Ly5jb25maWcgJHtTfS8uY29uZmlnLm5ld1xu
Jw0KPj4+PiArICAgICAgICAgICAgICAgICcgICAgZmlcbicNCj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAnfVxuJykNCj4+Pj4gICAgICAgICAgICAgICAgIGlmIGluaXRpYWxfcmV2Og0KPj4+PiAg
ICAgICAgICAgICAgICAgICAgIGYud3JpdGUoJ1xuIyBpbml0aWFsX3JldjogJXNcbicgJSBpbml0
aWFsX3JldikNCj4+Pj4=

