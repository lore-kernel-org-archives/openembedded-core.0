Return-Path: <zhangzl2013@126.com>
Received: from m15-6.126.com (m15-6.126.com [220.181.15.6])
	by mail.openembedded.org (Postfix) with ESMTP id 93BA97D38A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=p9m+B
	8Lqo4Mit7Lwrfj1cPK6HuzR83tGBn9vbt94OoI=; b=LmxOsVXKiaMdSH612dDS5
	U/zhQhn8PyQBLFwPrX7VwUC7BCwK6GzXRvCimI4hZYk3AOa1hvM84v26Q5dOxXR/
	wtunTjLBVh4zUCiHjqjjo2BGPbHlkDRJzbir4Gtsy6NUDhS9qZciq79JjIviLt10
	i+h7Uo7YExofvVPsky1C8E=
Received: from zhangzl2013$126.com ( [60.247.85.92] ) by ajax-webmail-wmsvr6
	(Coremail) ; Fri, 5 Jul 2019 15:49:06 +0800 (CST)
X-Originating-IP: [60.247.85.92]
Date: Fri, 5 Jul 2019 15:49:06 +0800 (CST)
From: "Zhaolong Zhang" <zhangzl2013@126.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20190614(cb3344cf) Copyright (c) 2002-2019 www.mailtech.cn 126com
In-Reply-To: <CADkTA4PbeVuGHVc2oofZeavPvMsQ7DPT4dWm0RRKK2U-8OfxWg@mail.gmail.com>
References: <1562236183-6069-1-git-send-email-zhangzl2013@126.com>
	<CADkTA4P-jyrFNf+vKQwDuyxD8sW=20MO+2Tus3AvaoKPjbJFvQ@mail.gmail.com>
	<7c29c0bde1bae4de4cac852d98571dd28070f4c5.camel@linuxfoundation.org>
	<CADkTA4NQr2LkB3k32Djxn-zX0m2jSCLz_yEjN7pPPzdNoJMaYA@mail.gmail.com>
	<64ce05dd1d970dc5b0390d57b4c9b75c44f405f4.camel@linuxfoundation.org>
	<CADkTA4PbeVuGHVc2oofZeavPvMsQ7DPT4dWm0RRKK2U-8OfxWg@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <46a84a00.47e5.16bc11bb51c.Coremail.zhangzl2013@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: BsqowAAHEZr0AB9d8S1BAA--.58470W
X-CM-SenderInfo: x2kd0wt2osiiat6rjloofrz/1tbiFgjoz1pD99L4lAABso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: checksum indirect cfg and scc files
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
X-List-Received-Date: Fri, 05 Jul 2019 07:50:05 -0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK

QXQgMjAxOS0wNy0wNSAwMDo0Mjo1MywgIkJydWNlIEFzaGZpZWxkIiA8YnJ1Y2UuYXNoZmllbGRA
Z21haWwuY29tPiB3cm90ZToKPk9uIFRodSwgSnVsIDQsIDIwMTkgYXQgMTI6MzYgUE0gPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBUaHUsIDIwMTkt
MDctMDQgYXQgMTI6MjkgLTA0MDAsIEJydWNlIEFzaGZpZWxkIHdyb3RlOgo+PiA+IE9uIFRodSwg
SnVsIDQsIDIwMTkgYXQgMTE6MTggQU0gUmljaGFyZCBQdXJkaWUKPj4gPiA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4+ID4gPiBPbiBUaHUsIDIwMTktMDctMDQg
YXQgMDg6NDggLTA0MDAsIEJydWNlIEFzaGZpZWxkIHdyb3RlOgo+PiA+ID4gPiBPbiBUaHUsIEp1
bCA0LCAyMDE5IGF0IDc6MDIgQU0gWmhhb2xvbmcgWmhhbmcgPAo+PiA+ID4gPiB6aGFuZ3psMjAx
M0AxMjYuY29tPgo+PiA+ID4gPiB3cm90ZToKPj4gPiA+ID4gPiBDdXJyZW50bHksIFlvY3RvIGNh
biBub3QgcmVhbGl6ZSB0aGUgbW9kaWZpY2F0aW9uIG9mIHRoZQo+PiA+ID4gPiA+IGNmZy9zY2MK
Pj4gPiA+ID4gPiBmaWxlcyBpbmRpcmVjdGx5Cj4+ID4gPiA+ID4gaW50cm9kdWNlZCBieSBzY2Mg
ZmlsZXMgaW4gY3VzdG9tIGxheWVycy4KPj4gPiA+ID4gPgo+PiA+ID4gPiA+IEluc3RlYWQgb2Yg
aW50cm9kdWNpbmcgY29tcGxpY2F0ZWQgc2NjIHBhcnNlciBjb2RlLCB0aGlzIHBhdGNoCj4+ID4g
PiA+ID4gd2Fsa3MgdGhvdWdoCj4+ID4gPiA+ID4gRklMRVNFWFRSQVBBVEhTIGFuZCB0YWtlcyBh
bGwgdGhlIGNmZy9zY2MgZmlsZXMgaW50byBhY2NvdW50Cj4+ID4gPiA+ID4gd2hlbgo+PiA+ID4g
PiA+IGNhbGN1bGF0aW5nCj4+ID4gPiA+ID4gY2hlY2tzdW1zLgo+PiA+ID4gPgo+PiA+ID4gPiBU
aGVyZSB1c2VkIHRvIGJlIGEgYnVnemlsbGEgYXJvdW5kIGZvciB0aGlzIC4uIGJ1dCBJIGNhbid0
IGZpbmQKPj4gPiA+ID4gaXQKPj4gPiA+ID4gbm93Lgo+PiA+ID4gPgo+PiA+ID4gPiBXaGlsZSB0
aGUgYXBwcm9hY2ggaXNuJ3Qgd3JvbmcsIEkgdGhpbmsgaXQgaXMgdG9vIGhlYXZ5LCBzaW5jZSBp
dAo+PiA+ID4gPiBpcwo+PiA+ID4gPiBsb29raW5nIGF0ICphbGwqIHRoZSAuc2NjIGFuZCAuY2Zn
IGZpbGVzIHRoYXQgY2FuIGJlIGxvY2F0ZWQgaW4KPj4gPiA+ID4gdGhlCj4+ID4gPiA+IHNlYXJj
aCBwYXRocywgbm90IGp1c3QgdGhlIG9uZXMgdGhhdCBhcmUgYWN0dWFsbHkgdXNlZC4KPj4gPiA+
Cj4+ID4gPiBUaGF0IGlzbid0IHF1aXRlIHJpZ2h0LiBXaXRoIHRoZSBjaGVja3N1bXMgaXRzIGlt
cG9ydGFudCB0byBrbm93IGlmCj4+ID4gPiBhCj4+ID4gPiBuZXcgZmlsZSBhcHBlYXJzIGF0IGxv
Y2F0aW9uIFgsIHdlIHNob3VsZCByZXBhcnNlIGFzIGl0IGNvdWxkCj4+ID4gPiBjaGFuZ2UKPj4g
PiA+IHRoZSBvdXRjb21lLgo+PiA+ID4KPj4gPiA+IFdlIHRoZXJlZm9yZSBoYXZlIHRvIGFjY291
bnQgZm9yIGZpbGVzIHdoaWNoIGRvZXNuJ3QgZXhpc3QgYXMgbXVjaAo+PiA+ID4gYXMKPj4gPiA+
IHRoZSBvbmVzIHRoYXQgZG8uCj4+ID4KPj4gPiBNYXliZSBJJ20gbWlzdW5kZXJzdGFuZGluZyB3
aGF0IHlvdSBhcmUgc2F5aW5nIGhlcmUsIGJ1dCB0aGVzZSBhcmUKPj4gPiBqdXN0IHNpdHRpbmcg
YXJvdW5kIChsaWtlIHVudXNlZCBwYXRjaCBmaWxlcykuIFRoZXkgYXJlIG5vdCBvbiB0aGUKPj4g
PiBTUkNfVVJJIGFuZCB0aGV5IGFyZSBub3QgbmVjZXNzYXJpbHkgdXNlZCBhdCBhbGwuIEp1c3Qg
YmVjYXVzZQo+PiA+IHNvbWVvbmUKPj4gPiBkcm9wcyBhIG5ldyBmaWxlIGluIHRob3NlIGxvY2F0
aW9ucywgd2Ugc2hvdWxkIG5vdCBiZSByZS1ydW5uaW5nIHRoZQo+PiA+IG1ldGEgZGF0YSB0YXNr
Lgo+PiA+Cj4+ID4gV2hhdCB0aGF0IHJvdXRpbmUgaXMgY3VycmVudGx5IGRvaW5nIGlzIGp1c3Qg
d3JvbmcuCj4+Cj4+IEFncmVlZCwgaXQgaXMuCj4+Cj4+IEknbSBqdXN0IHNheWluZyB0aGF0IHRo
aXMgc2l0dWF0aW9uIGlzbid0IGFzIHNpbXBsZSBhcyBmaWxlcyBleGlzdCwgd2UKPj4gYWxzbyBu
ZWVkIHRvIGxvb2sgYXQgd2hpY2ggZmlsZXMgZG9uJ3QgZXhpc3QsIGJ1dCB0aGF0IHdvdWxkIGlu
Zmx1ZW5jZQo+PiB0aGUgYnVpbGQgaWYgdGhleSBkaWQuCj4KPkFoYS4KPgo+Pgo+PiBUaGUgcGF0
Y2ggZG9lc24ndCBkbyB0aGF0IGVpdGhlciEKPj4KPj4KPj4gPiA+IFRoaXMgZG9lc24ndCB3b3Jr
IHNpbmNlIHdlIG5lZWQgdG8gYmUgYWJsZSB0byBwcmVkaWN0IHRoZSB0YXNrIGhhc2gKPj4gPiA+
IGNoZWNrc3VtIGF0IHBhcnNlIHRpbWUuIFdlIGRvbid0IGhhdmUgdGhlIGtlcm4tdG9vbHMgYXZh
aWxhYmxlIHRoZW4KPj4gPiA+IHRvCj4+ID4gPiBiZSBhYmxlIHRvIGtub3cgd2hpY2ggb25lcyBp
dCB3b3VsZCBhY3R1YWxseSB1c2UuLi4KPj4gPgo+PiA+IFNvIHRoZXJlJ3Mgb25seSBweXRob24g
Y29kZSBhbGxvd2VkIGluIHRob3NlIGhhc2ggcm91dGluZXMgPyBJZiBzbywKPj4gPiB3aGF0IGlz
IHRoZXJlIGlzIHN0aWxsIHdyb25nLCBhbmQgbmVlZHMgdG8gYmUgcmV3b3JrZWQuCj4+Cj4+IEl0
IGhhcyB0byBiZSBhYmxlIHRvIHdvcmsgb24gdGhlIGluZm9ybWF0aW9uIGF2YWlsYWJsZSB0byBp
dCBhdCBwYXJzZQo+PiB0aW1lLiBJbiByZWFsaXR5IHRoYXQgZG9lcyBtZWFuIHB5dGhvbiBjb2Rl
LiBUaGVyZSBhcmUgcGVyZm9ybWFuY2UKPj4gaW1wbGljYXRpb25zIHRvIGFueXRoaW5nIHRvbyBj
b21wbGV4Lgo+Cj5VbmRlcnN0b29kLgo+Cj5JJ2xsIHRoaW5rIG9uIHRoaXMgZm9yIGEgYml0LiBU
aGlzIGhhcyBiZWVuIHNvbWV0aGluZyB0aGF0IEkgbG9va2VkCj5pbnRvIHNldmVyYWwgdGltZXMs
IGFuZCBkaWRuJ3QgY29tZSB1cCB3aXRoIGFueXRoaW5nIEkgcmVhbGx5IGxpa2VkLgo+TWF5YmUg
bm93IGlzIHRoZSB0aW1lIHRvIHNvbHZlIHRoZSBpc3N1ZSA6KQoKVGhhbmsgeW91IEJydWNlLCBJ
IHdpbGwgYmUgd2FpdGluZyBmb3IgeW91ciBzb2x1dGlvbi4KClJlZ2FyZHMsClpoYW9sb25nCgo+
Cj5CcnVjZQo+Cj4+Cj4+IENoZWVycywKPj4KPj4gUmljaGFyZAo+Pgo+Cj4KPi0tIAo+LSBUaG91
IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNz
IGF3YWl0Cj50aGVlIGF0IGl0cyBlbmQKPi0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFs
ZiwgU3RhciBUcmVrIElJCg==

