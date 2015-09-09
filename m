Return-Path: <umut.tezduyar@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8E96763CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 07:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2A30518210;
	Wed,  9 Sep 2015 09:33:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id YXRTNQEvwMLp; Wed,  9 Sep 2015 09:33:45 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 5AC54181FF;
	Wed,  9 Sep 2015 09:33:45 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 148C11224;
	Wed,  9 Sep 2015 09:33:45 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 0810B633;
	Wed,  9 Sep 2015 09:33:45 +0200 (CEST)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by seth.se.axis.com (Postfix) with ESMTP id 061D13E049;
	Wed,  9 Sep 2015 09:33:45 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Wed, 9 Sep 2015 09:33:44 +0200
From: Umut Tezduyar Lindskog <umut.tezduyar@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Sep 2015 09:33:43 +0200
Thread-Topic: [OE-core] 32 bit time_t in openembedded
Thread-Index: AdDq0dsrRyVy6cNYT/+OeO/9DFCwhg==
Message-ID: <F59199FE-4303-4C23-9749-A0567223EE55@axis.com>
References: <D2E79685-E16A-4941-BB7B-E7F21E250DD2@axis.com>
	<CAJTo0LaAUgn5i==+JcS5Xd3sFP8jCMWG2M-9ptnhh3j-hsipEw@mail.gmail.com>
In-Reply-To: <CAJTo0LaAUgn5i==+JcS5Xd3sFP8jCMWG2M-9ptnhh3j-hsipEw@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: 32 bit time_t in openembedded
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
X-List-Received-Date: Wed, 09 Sep 2015 07:33:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KV2hhdCBJIGFtIG1vcmUgYWZ0ZXIgaXMgdHJ5aW5nIHRvIGNvbnZpbmNlIHVw
c3RyZWFtIHN5c3RlbWQgdGhhdCB0aGlzIG1pZ2h0IGJlIGEgcG90ZW50aWFsIHByb2JsZW0gd2l0
aGluIHRoZSBlbWJlZGRlZCB3b3JsZC4NCg0KQ29uc2lkZXJpbmcgdGhhdCBkYXRlIG1pZ2h0IGdl
dCBzZXQgYnkgYSBtYWxpY2lvdXMgbnRwIHNlcnZlci4gSW4gdGhhdCBjYXNlIHVzZXIgc3BhY2Ug
c3RvcHMgYm9vdGluZyBmb3IgdXMgYW5kIEkgZ3Vlc3MgbXkgdW5kZXJzdGFuZGluZyBpcyBzYW1l
IHRoaW5nIHdpbGwgaGFwcGVuIGZvciBvcGVuZW1iZWRkZWQgc3RhY2sgdG9vLiBJc27igJl0IHRo
aXMgYSBjb25jZXJuIHRvIGFueW9uZT8NCg0KVW11dA0KDQoNCj4gT24gU2VwIDgsIDIwMTUsIGF0
IDI6MDQgUE0sIEJ1cnRvbiwgUm9zcyA8cm9zcy5idXJ0b25AaW50ZWwuY29tPiB3cm90ZToNCj4g
DQo+IA0KPiBPbiA4IFNlcHRlbWJlciAyMDE1IGF0IDEyOjQ0LCBVbXV0IFRlemR1eWFyIExpbmRz
a29nIDx1bXV0LnRlemR1eWFyQGF4aXMuY29tPiB3cm90ZToNCj4gVXBzdHJlYW0gc3lzdGVtZOKA
mXMgYW5zd2VyIGlzIHByZXR0eSBtdWNoIHVzaW5nIDY0IGJpdHMgdGltZV90IHN0cnVjdHVyZSBi
dXQgdGhpcyBpcyByZWxhdGl2ZWx5IGV4cGVuc2l2ZSBvbiAzMiBiaXRzIElTQS4NCj4gDQo+IFdo
YXQgcHJvYmxlbSBhcmUgeW91IHRyeWluZyB0byBzb2x2ZSBoZXJlIC0gdGhlIGdlbmVyYWwgcHJv
YmxlbSBvZiAiSSB3YW50IG15IGhhcmR3YXJlIHRvIHdvcmsgYWZ0ZXIgMjAzOCIgb3IgIm15IFJU
QyBpcyBzdHVwaWQiPyAgRm9yIHRoZSBmb3JtZXIgeW91J2xsIHBvdGVudGlhbGx5IGJlIHdyaXRp
bmcgYSBuZXcgQUJJIHRvIGludHJvZHVjZSBhIDY0LWJpdCB0aW1lX3QgKHRoZW4gdXBkYXRpbmcg
dGhlIGtlcm5lbCwgbGliYywgdG9vbGNoYWluLi4uKSwgZm9yIHRoZSBsYXR0ZXIgY2FuJ3QgeW91
IGhhdmUgc29tZSBrZXJuZWwgY29kZSB0aGF0IGNsYW1wcyB0aGUgcmFuZG9tIHRpbWVzIG9uIGlu
aXRpYWxpc2F0aW9uIHRvIGJlIDwyMDM4Pw0KPiANCj4gUm9zcw0KDQo=

