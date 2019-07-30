Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C25037E265
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 13:06:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jul 2019 06:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; d="scan'208";a="371532644"
Received: from jaisharm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.36.125])
	by fmsmga006.fm.intel.com with ESMTP; 30 Jul 2019 06:06:35 -0700
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
References: <20190730110035.4806-1-mac@mcrowe.com>
	<ea261419-94c4-7dc1-92d0-c38ef6228bd6@intel.com>
	<20190730130316.GA17561@mcrowe.com>
From: Ross Burton <ross.burton@intel.com>
Message-ID: <52bc0a3d-9ce4-9125-78a8-df93927d7d53@intel.com>
Date: Tue, 30 Jul 2019 14:06:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730130316.GA17561@mcrowe.com>
Subject: Re: [PATCH] glib-networking: Support building with USE_NLS=no
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
X-List-Received-Date: Tue, 30 Jul 2019 13:06:36 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMzAvMDcvMjAxOSAxNDowMywgTWlrZSBDcm93ZSB3cm90ZToKPiBPbiBUdWVzZGF5IDMwIEp1
bHkgMjAxOSBhdCAxMjoxNTozNiArMDEwMCwgUm9zcyBCdXJ0b24gd3JvdGU6Cj4+IE9uIDMwLzA3
LzIwMTkgMTI6MDAsIE1pa2UgQ3Jvd2Ugd3JvdGU6Cj4+PiBBcyByZXBvcnRlZCBpbgo+Pj4gaHR0
cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRlZC1jb3JlLzIw
MTktRmVicnVhcnkvMjc5MzQ0Lmh0bWwKPj4+ICwgZ2xpYi1uZXR3b3JraW5nIG5vIGxvbmdlciBj
b25maWd1cmVzIHN1Y2Nlc3NmdWxseSBpZiBVU0VfTkxTPSJubyI6Cj4+Pgo+Pj4gfCBwby9tZXNv
bi5idWlsZDoxOjU6IEVSUk9SOiAgQ2FuIG5vdCBkbyBnZXR0ZXh0IGJlY2F1c2UgeGdldHRleHQg
aXMgbm90IGluc3RhbGxlZC4KPj4+Cj4+PiBJbiB0aGUgY3VycmVudCBhYnNlbmNlIG9mIGFueXRo
aW5nIGJldHRlciwgaXQgc2VlbXMgdGhhdCB0aGlzIGNhbiBiZQo+Pj4gb3ZlcmNvbWUgYnkgdGVs
bGluZyBNZXNvbiBub3QgdG8gbG9vayBpbiB0aGUgcG8vIGRpcmVjdG9yeS4KPj4KPj4gRG9lcyB0
aGlzIGFjdHVhbGx5IHdvcms/ICBnbGliIGhhcyB0aGUgc2FtZSBpc3N1ZSAoYWxvbmcgd2l0aCBt
b3N0IG9mIHRoZQo+PiByZXN0IG9mIHRoZSBHVEsrIHN0YWNrIHRoYXQgaGFzIG1vdmVkIHRvIE1l
c29uKSBhbmQgdGhlIHNvbHV0aW9uIHRoZXJlIHdhcwo+PiB0byBqdXN0IGFkZCBnZXR0ZXh0IGFz
IGEgZGVwZW5kZW5jeS4KPiAKPiBJdCBzZWVtcyB0byBmb3IgbWUuIEkgZGlkIHRoaXMgaW4gb3Vy
IHRyZWUsIGJ1dCBJJ3ZlIGp1c3QgdHJpZWQgdGhpcyBjaGFuZ2UKPiBhbmQgZm9yY2luZyBVU0Vf
TkxTID0gIm5vIiBpbiB0aGUgY3VycmVudCBzdGF0ZSBvZiBtYXN0ZXIgYW5kIHRoZSBidWlsZAo+
IHN1Y2NlZWRlZC4KPiAKPj4gV2UncmUgZ29pbmcgdG8gYmUgcGxheWluZyB3aGFjay1hLW1vbGUg
d2l0aCB0aGlzLCBtYXliZSB3ZSBzaG91bGQganVzdCBmaXgKPj4gdGhpcyB1cHN0cmVhbT8KPiAK
PiBGaXhpbmcgaXQgdXBzdHJlYW0gaW4gbWVzb24gd291bGQgY2xlYXJseSBiZSBwcmVmZXJhYmxl
LCBidXQgaXQgc2VlbWVkIHRoYXQKPiB0aGlzIGhhcyBhbHJlYWR5IGJlZW4gdHJpZWQuIEZpeGlu
ZyBpdCBpbiBlYWNoIG1lc29uLXVzaW5nIHBhY2thZ2UgaXMKPiBhbm90aGVyIGFsdGVybmF0aXZl
LCBidXQgaXQgd291bGQgYmUgZ29vZCBmb3IgaXQgdG8gYmUgZG9uZSBpbiB0aGUgc2FtZQo+IHdh
eS4gSSBrbm93IGxpdHRsZSBhYm91dCBtZXNvbi4gOigKPiAKPiBBcyBzdWNoIGhhY2tzIGdvLCB0
aGlzIGlzIGF0IHRoZSBsZXNzIG5hc3R5IGVuZC4gUGVyaGFwcyBpdCBjb3VsZCBldmVuCj4gcGVy
aGFwcyBiZSBpbmNvcnBvcmF0ZWQgaW50byB0aGUgbWVzb24gY2xhc3M/Cj4gCj4gSSd2ZSBhZGRl
ZCBhIGNvbW1lbnQgdG8gaHR0cHM6Ly9naXRodWIuY29tL21lc29uYnVpbGQvbWVzb24vaXNzdWVz
LzgyMSAuCj4gCj4gTWlrZS4KPiAKPiAoSSdtIG5vdCBzdXJlIGlmIHlvdSBpbnRlbnRpb25hbGx5
IHNlbnQgdGhpcyBvZmYtbGlzdC4gSSBkb24ndCBtaW5kIHNlbmRpbmcKPiB0aGlzIHJlcGx5IGFn
YWluIHRvIHRoZSBsaXN0IGlmIGl0IHdhcyBhIG1pc3Rha2UuKQo+IAoKTm8sIEkgZGlkbid0IHNl
bmQgaXQgb2ZmLWxpc3QgaW50ZW50aW9uYWxseS4gIE5ldyBtYWlsZXIgOiggIENDaW5nIHRoZSAK
bGlzdCBhZ2FpbiBub3cuCgpJIHdvbmRlciBpZiBwYXRjaGluZyBpbiBhIGRpc2FibGUtbmxzIG9w
dGlvbiB0aGF0IGd1YXJkcyB0aGUgc3ViZGlyKHBvKSAKd291bGQgYmUgc3VmZmljaWVudGx5IHVu
aW52YXNpdmUgYW5kIHVwc3RyZWFtYWJsZSB0byBlYWNoIHByb2plY3Q/CgpSb3NzCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpJbnRlbCBDb3Jwb3JhdGlvbiAoVUspIExpbWl0ZWQKUmVnaXN0ZXJlZCBOby4gMTEzNDk0
NSAoRW5nbGFuZCkKUmVnaXN0ZXJlZCBPZmZpY2U6IFBpcGVycyBXYXksIFN3aW5kb24gU04zIDFS
SgpWQVQgTm86IDg2MCAyMTczIDQ3CgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1h
eSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBp
bnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVy
cyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVj
aXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4K


