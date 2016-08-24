Return-Path: <clemens.lang@bmw-carit.de>
Received: from cit-hm8-gw01.bmw-carit.de (cit-hm8-mail01.bmw-carit.de
	[212.118.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 44575731D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 10:59:50 +0000 (UTC)
Received: from [172.20.0.50] (port=35873 helo=cit-hm8-mail01.bmw-carit.de)
	by cit-hm8-gw01.bmw-carit.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1bcVuO-0008FH-0Q; Wed, 24 Aug 2016 12:59:48 +0200
Received: from ULM-DC01.bmw-carit.intra ([fe80::41cf:62be:aacc:1aad]) by
	ULM-DC01.bmw-carit.intra ([fe80::41cf:62be:aacc:1aad%11]) with mapi id
	14.03.0123.003; Wed, 24 Aug 2016 12:59:47 +0200
X-CTCH-RefID: str=0001.0A0C0207.57BD7E24.005D, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <Clemens.Lang@bmw-carit.de>
To: OE-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gitpkgv: Fix $GITPKV for a single named git
	source
Thread-Index: AQHR87fSPG0v/SVK+km4Sp05/KsMuqBEsX4AgBMyywA=
Date: Wed, 24 Aug 2016 10:59:47 +0000
Message-ID: <27C6E91D-E9A6-404D-AEE4-C41018631C33@bmw-carit.de>
References: <1470909853-22262-1-git-send-email-clemens.lang@bmw-carit.de>
	<1470909853-22262-2-git-send-email-clemens.lang@bmw-carit.de>
	<C48DE607-9EB8-48E1-9421-EBB46F94AFAA@gmail.com>
In-Reply-To: <C48DE607-9EB8-48E1-9421-EBB46F94AFAA@gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.20.86]
MIME-Version: 1.0
Subject: Re: [PATCH] gitpkgv: Fix $GITPKV for a single named git source
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
X-List-Received-Date: Wed, 24 Aug 2016 10:59:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE45125ABB830944BAA7D48D0B8CBC20@bmw-carit.de>
Content-Transfer-Encoding: base64

SGkgZXZlcnlib2R5LA0KDQpLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3cm90ZToNCg0K
Pj4gT24gQXVnIDExLCAyMDE2LCBhdCAzOjA0IEFNLCBDbGVtZW5zIExhbmcgPENsZW1lbnMuTGFu
Z0BibXctY2FyaXQuZGU+ICANCj4+IHdyb3RlOg0KPj4NCj4+IFJlY2lwZXMgdGhhdCBmZXRjaCBm
cm9tIGEgc2luZ2xlIGdpdCBzb3VyY2UsIGFzc2lnbiBhIG5hbWUgdG8gdGhpcw0KPj4gc291cmNl
IGFuZCBkbyBub3Qgc2V0IFNSQ1JFVl9GT1JNQVQgdG8gdGhpcyBuYW1lIHdpbGwgYWx3YXlzIGdl
dA0KPj4gYSBHSVRQS0dWIHZhbHVlIG9mICJkZWZhdWx0Iiwgd2hpY2ggY2F1c2VzIHZlcnNpb24t
Z29pbmctYmFja3dhcmRzIFFBDQo+PiBlcnJvcnMuDQo+Pg0KPj4gRml4IHRoaXMgYnkgYXV0b21h
dGljYWxseSBkZXRlcm1pbmluZyBhIHN1aXRhYmxlIFNSQ1JFVl9GT1JNQVQgZnJvbSB0aGUNCj4+
IFNSQ19VUkkgaWYgbm9uZSBpcyBzZXQgZXhwbGljaXRseS4gVGhpcyBjb2RlIGRvZXMgbm90IHJ1
biBmb3IgbXVsdGlwbGUNCj4+IGdpdCBzb3VyY2VzLCBiZWNhdXNlIGJpdGJha2UncyBmZXRjaGVy
IGVuZm9yY2VzIHNldHRpbmcgU1JDUkVWX0ZPUk1BVA0KPj4gd2hlbiBtdWx0aXBsZSB2ZXJzaW9u
LWNvbnRyb2xsZWQgc291cmNlcyBhcmUgdXNlZC4NCj4NCj4gbG9va3MgZ29vZC4NCj4NCj4+IFNp
Z25lZC1vZmYtYnk6IENsZW1lbnMgTGFuZyA8Y2xlbWVucy5sYW5nQGJtdy1jYXJpdC5kZT4NCj4+
IC0tLQ0KPj4gbWV0YS1vZS9jbGFzc2VzL2dpdHBrZ3YuYmJjbGFzcyB8IDkgKysrKysrKystDQo+
PiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL21ldGEtb2UvY2xhc3Nlcy9naXRwa2d2LmJiY2xhc3MgIA0KPj4gYi9tZXRh
LW9lL2NsYXNzZXMvZ2l0cGtndi5iYmNsYXNzDQo+PiBpbmRleCAxY2JhMDBjLi5mNzMzMDRhIDEw
MDY0NA0KPj4gLS0tIGEvbWV0YS1vZS9jbGFzc2VzL2dpdHBrZ3YuYmJjbGFzcw0KPj4gKysrIGIv
bWV0YS1vZS9jbGFzc2VzL2dpdHBrZ3YuYmJjbGFzcw0KPj4gQEAgLTYxLDcgKzYxLDE0IEBAIGRl
ZiBnZXRfZ2l0X3BrZ3YoZCwgdXNlX3RhZ3MpOg0KPj4gICAgICMNCj4+ICAgICBmb3JtYXQgPSBk
LmdldFZhcignU1JDUkVWX0ZPUk1BVCcsIFRydWUpDQo+PiAgICAgaWYgbm90IGZvcm1hdDoNCj4+
IC0gICAgICAgIGZvcm1hdCA9ICdkZWZhdWx0Jw0KPj4gKyAgICAgICAgbmFtZXMgPSBbXQ0KPj4g
KyAgICAgICAgZm9yIHVybCBpbiB1ZC52YWx1ZXMoKToNCj4+ICsgICAgICAgICAgICBpZiB1cmwu
dHlwZSA9PSAnZ2l0JyBvciB1cmwudHlwZSA9PSAnZ2l0c20nOg0KPj4gKyAgICAgICAgICAgICAg
ICBuYW1lcy5leHRlbmQodXJsLnJldmlzaW9ucy5rZXlzKCkpDQo+PiArICAgICAgICBpZiBsZW4o
bmFtZXMpID4gMDoNCj4+ICsgICAgICAgICAgICBmb3JtYXQgPSAnXycuam9pbihuYW1lcykNCj4+
ICsgICAgICAgIGVsc2U6DQo+PiArICAgICAgICAgICAgZm9ybWF0ID0gJ2RlZmF1bHQnDQo+Pg0K
Pj4gICAgIGZvdW5kID0gRmFsc2UNCj4+ICAgICBmb3IgdXJsIGluIHVkLnZhbHVlcygpOg0KPj4g
4oCUDQo+PiAyLjguMQ0KDQpTaGFtZWxlc3MgYnVtcC4gSSBoYXZlbuKAmXQgaGVhcmQgYW55IGZl
ZWRiYWNrIG9uIHRoaXMgb3RoZXIgdGhhbiB0aGlzIOKAnGxvb2tzICANCmdvb2TigJ0gY29tbWVu
dCwgYnV0IGl0IGlzbuKAmXQgbWVyZ2VkLiBJcyB0aGVyZSBhIHByb2JsZW0gd2l0aCB0aGUgcGF0
Y2g/DQoNCi0tIA0KQ2xlbWVucyBMYW5nIOKAoiBEZXZlbG9wbWVudCBTcGVjaWFsaXN0DQpCTVcg
Q2FyIElUIEdtYkgg4oCiIExpc2UtTWVpdG5lci1TdHIuIDE0IOKAoiA4OTA4MSBVbG0g4oCiIGh0
dHA6Ly9ibXctY2FyaXQuY29tDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpCTVcgQ2FyIElUIEdtYkgNCkdl
c2Now6RmdHNmw7xocmVyOiBNaWNoYWVsIFfDvHJ0ZW5iZXJnZXIgdW5kIEFsZXhpcyBUcm9saW4N
ClNpdHogdW5kIFJlZ2lzdGVyZ2VyaWNodDogTcO8bmNoZW4gSFJCIDEzNDgxMA0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0K

