Return-Path: <sdliyong@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 34837762A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 01:32:33 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so37142474qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 18:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:to:cc:subject:date:importance:in-reply-to
	:references:content-type:content-transfer-encoding:mime-version;
	bh=NS/gcqvHKAqY2Dd6qTb5etS2V+rkcjJNvZJ+YldHEB4=;
	b=SPKdheAPz7TG+eTnehkLtZqkzSh5Kfia4+x8Rj+g0twO+jK6Fh/Og7zLJazf8oe9DJ
	nBZDqXreo7NBzei5EyE+xYYf2Nkun4rQSf0GmrfjTqzYWPDMzg3/jZTus8whgTgfQ6fl
	EBAQExZe6wpPW0WJdAADWcDFeutGDqniPLXH5JG5aPmab2sEKdRbU1Ldv1TM7m/lu0KT
	ZKrXDhUweRhrREkscvi3Uti/Og2Un/5gtJJLfBkwaFnedRal5P0Ztel4/0ndbc4We0eZ
	b2Sup3I2K+CV+D98F9i28AmwYqenKd7Y7Hss7iQHE5jdehb/OEMerOxSR3ZdtHtKsIoU
	oglQ==
X-Received: by 10.55.192.145 with SMTP id v17mr3226693qkv.80.1443144753454;
	Thu, 24 Sep 2015 18:32:33 -0700 (PDT)
Received: from mail.hotmail.com (blu004-wss1s6.hotmail.com. [134.170.2.221])
	by smtp.gmail.com with ESMTPSA id 38sm509798qgh.11.2015.09.24.18.32.32
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 18:32:32 -0700 (PDT)
Received: from BLU168-W88 ([134.170.2.215]) by BLU004-WSS1S6.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Thu, 24 Sep 2015 18:32:31 -0700
X-TMN: [9bOMoAckj9sy/WEYEyqXfGOrlqbXE+IN]
Message-ID: <BLU168-W88803295F1BF9D34F8FCCDD6420@phx.gbl>
From: LIYONG <sdliyong@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Sep 2015 09:32:31 +0800
Importance: Normal
In-Reply-To: <CADkTA4Ni2T3wgrd8cBkd81qp-vYpOyScbgXSSLmT_6aLWQu9Tw@mail.gmail.com>
References: <BLU168-W92359AA4E562353441C3D7D6430@phx.gbl>,
	<CADkTA4OVo--4nCsx6-n54AYKFq9FzT0D162fqgMTqSVwGE8CQw@mail.gmail.com>,
	<CADkTA4Ni2T3wgrd8cBkd81qp-vYpOyScbgXSSLmT_6aLWQu9Tw@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Sep 2015 01:32:31.0718 (UTC)
	FILETIME=[0C19B060:01D0F732]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cannot apply patches out of meta bsp after applied a kern-tool patch
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
X-List-Received-Date: Fri, 25 Sep 2015 01:32:37 -0000
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmtzIEJydWNlISBJIGhhdmUgY3JlYXRlZCBhIGJ1ZyBhbmQgYWRkZWQgdGhlIC5wYXRjaCBm
aWxlIGFuZCB0aGUgZXJyb3IgbWVzc2FnZSBJIHJlY2VpdmVkLCBCVUcgSUQgaXMgODM5NS4KPGEg
aHJlZj0iaHR0cHMmIzU4OyYjNDc7JiM0NztidWd6aWxsYS55b2N0b3Byb2plY3Qub3JnJiM0Nztz
aG93X2J1Zy5jZ2kmIzYzO2lkJiM2MTs4Mzk1IiB0YXJnZXQ9Il9ibGFuayIgY2xhc3M9Im5ld2x5
aW5zZXJ0ZWRsaW5rIj5odHRwcyYjNTg7JiM0NzsmIzQ3O2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5v
cmcmIzQ3O3Nob3dfYnVnLmNnaSYjNjM7aWQmIzYxOzgzOTU8L2E+CgpUaGFua3MsCllvbmcKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IERhdGU6IFRodSwgMjQgU2Vw
IDIwMTUgMTA6MDE6MzEgLTA0MDAKPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIENhbm5vdCBhcHBs
eSBwYXRjaGVzIG91dCBvZiBtZXRhIGJzcCBhZnRlciBhcHBsaWVkIGEga2Vybi10b29sIHBhdGNo
Cj4gRnJvbTogYnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tCj4gVG86IHNkbGl5b25nQGdtYWlsLmNv
bQo+IENDOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCj4KPiBPbiBU
aHUsIFNlcCAyNCwgMjAxNSBhdCA5OjQ3IEFNLCBCcnVjZSBBc2hmaWVsZAo+IDxicnVjZS5hc2hm
aWVsZEBnbWFpbC5jb20+IHdyb3RlOgo+PiBPbiBUaHUsIFNlcCAyNCwgMjAxNSBhdCA0OjI0IEFN
LCBMSVlPTkcgPHNkbGl5b25nQGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBIaSBhbGwsCj4+Pgo+Pj4g
QWZ0ZXIgYXBwbGllZCB0aGUgYmVsb3cgcGF0Y2gsIGJpdGJha2UgY2Fubm90IGFwcGx5IHRoZXNl
IHBhdGNoZXMgaW4gbXkgYXBwIGxheWVyLiBGb3IgZXhhbXBsZSwgdGhlcmUgaXMgYSBrZXJuZWwg
cGF0Y2ggaW4gbWV0YS1hcHAvcmVjaXBlcy1rZXJuZWwvbGludXgteW9jdG8vbGludXgteW9jdG8s
IEkgYWRkIHRoZSBmaWxlIGluIGxpbnV4LXlvY3RvXyUuYmJhcHBlbmQgZmlsZS4gYml0YmFrZSB5
b2N0by1saW51eCB3aWxsIGZhaWwgd2l0aCAiZG8gcGF0Y2ggZXJyb3IiLiBJZiBJIHJldmVydCB0
aGUgcGF0Y2gsIHRoZSBidWlsZCBpcyBva2F5Lgo+Pj4KPj4+IEFueSBzdWdnZXN0aW9ucy9jb21t
ZW50cz8KPj4KPj4gUmFpc2UgYSBidWcsIGFuZCBhc3NpZ24gaXQgdG8gbWUuIEkgY2FuIGhhdmUg
YSBsb29rIGF0IGl0LiBUaGVyZSBtdXN0Cj4+IGJlIHNvbWUgaW50ZXJhY3Rpb24gaW4gdGhpcyBj
b25maWd1cmF0aW9uIHRoYXQgSSBkaWRuJ3QgdGVzdCAuLi4gYmVjYXVzZSBJCj4+IGRlZmluaWVs
eSBkaWQgdGVzdCB0aGUgYXBwbGNhdGlvbiBvZiBwYXRjaGVzIDopCj4+Cj4+IE1ha2Ugc3VyZSB0
byBhZGQgZXZlcnl0aGluZyB0byB0aGUgYnVnLCB0aGUgYmJhcHBlbmQsIHRoZSBwYXRjaCwgZXRj
LAo+PiBzbyBJIGNhbiByZS1jcmVhdGUgdGhlIGZhaWx1cmUgb24gbXkgbWFjaGluZXMuCj4+Cj4+
IFdlIGNhbid0IHJldmVydCB0aGF0IHBhdGNoLCBzaW5jZSBpdCBhY3R1YWxseSBpcyByZXF1aXJl
ZCB0byBwcmV2ZW50IHBhdGNoZXMKPj4gZnJvbSBiZWluZyBhcHBsaWVkIG11bHRpcGxlIHRpbWVz
IC4uIHNvIEknbGwgbmVlZCB0byBpbmNyZW1lbnRhbGx5IGZpeCB0aGUKPj4gaXNzdWUuCj4KPiBJ
IGp1c3QgcmUtcmFuIG15IHRlc3Qgc3VpdGUgbG9jYWxseSwgYW5kIEknbSBhYmxlIHRvIGFwcGx5
IHBhdGNoZXMKPiBmcm9tIG15IGxheWVycywKPiB2aWEgYmJhcHBlbmRzLgo+Cj4gU28gSSdsbCBu
ZWVkIHlvdXIgZGV0YWlscywgYW5kIHRoZW4gSSBjYW4gZGVidWcgZnVydGhlci4KPgo+IEJydWNl
Cj4KPj4KPj4gQnJ1Y2UKPj4KPj4KPj4+Cj4+PiBjb21taXQgYTAzYzEwMGU4MTNiMWI1MDQxYmZj
MTdjOTdmNWJkNGU3MmI3OTVhZAo+Pj4gQXV0aG9yOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNo
ZmllbGRAd2luZHJpdmVyLmNvbT4KPj4+IERhdGU6IE1vbiBBdWcgMzEgMTU6NTU6MzMgMjAxNSAt
MDQwMAo+Pj4KPj4+IHBhdGNoaW5nOiBvbmx5IHZhbGlkYXRlIHVzZXIgc3VwcGxpZWQgcGF0Y2hl
cyBieSBkZWZhdWx0Cj4+Pgo+Pj4gUHJldmlvdXNseSB0aGUgcGF0Y2hpbmcgdG9vbHMgd291bGQg
Y29uc2lkZXIgYm90aCBzeXN0ZW0gYW5kIHVzZXIKPj4+IHN1cHBsaWVkIHBhdGNoZXMgaW4gdGhl
IHNhbWUgbWFubmVyIC4uIHRoZXkgYXJlIHNpbXBseSBhIHNlcmllcyBvZgo+Pj4gcGF0Y2hlcyB0
byBiZSBhcHBsaWVkIHRvIGEgYnJhbmNoLCBhbmQgdGhhdCB0aGUgc2NyaXB0cyBzaG91bGQgZGV0
ZXJtaW5lCj4+PiB3aGVyZSBpbiB0aGUgc2VyaWVzIHRvIHN0YXJ0IChiYXNlZCBvbiB3aGF0IGlz
IGFscmVhZHkgb24gdGhlIGJyYW5jaCkuCj4+Pgo+Pj4gVGhpcyBkZXRlY3Rpb24gd2FzIGNhdXNp
bmcgYSBmZXcgcHJvYmxlbXM6Cj4+Pgo+Pj4gLSB0aW1lIGNvbnN1bWluZwo+Pj4gLSBzdGFydGlu
ZyBpbiB0aGUgbWlkZGxlIG9mIGEgc2VyaWVzIHdoZW4gaW50ZXJtZWRpYXRlIHBhdGNoZXMgd2Vy
ZQo+Pj4gbWVyZ2VkIHRvIGEgYnJhbmNoLgo+Pj4KPj4+IFRvIHNvbHZlIGJvdGggdGhlIHBlcmZv
cm1hbmNlIGFuZCBzdGFydCBkZXRlY3Rpb24sIHdlIGluc3RlYWQgc2ltcGx5Cj4+PiBub3RlIHRo
ZSB0cmFuc2l0aW9uIGZyb20gc3lzdGVtIChpLmUuIGFscmVhZHkgZGVmaW5lZCBmZWF0dXJlcyBh
bmQKPj4+IHNlcmllcykgYW5kIHVzZXIvcmVjaXBlIHN1cHBsaWVkIHBhdGNoZXMuIFdoZW4gdGhl
IHRyYW5zaXRpb24gaXMgbm90ZWQsCj4+PiB0aGUgc3lzdGVtIHdpbGwgc3RhcnQgcHVzaGluZyBB
TEwgcGF0Y2hlcyB3aXRob3V0IGRvaW5nIGF1dG9yZXN1bWUKPj4+IGRldGVjdGlvbi4KPj4+Cj4+
PiBDb250cm9sIGluIGtlZXBpbmcgdGhlIHNlcmllcyB1cCB0byBkYXRlIGlzIHBhc3NlZCB0byB0
aGUgdXNlciwgYW5kCj4+PiBjb25zaXN0ZW50IGJlaGF2aW91ci9wZXJmb3JtYW5jZSBpcyBhY2hp
ZXZlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBCcnVjZSBBc2hmaWVsZCBicnVjZS5hc2hmaWVs
ZEB3aW5kcml2ZXIuY29tCj4+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+IFlvbmcKPj4+IC0tCj4+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gT3BlbmVt
YmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0Cj4+PiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnCj4+PiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlCj4+Cj4+Cj4+Cj4+IC0tCj4+ICJUaG91IHNoYWx0IG5v
dCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0Cj4+
IHRoZWUgYXQgaXRzIGVuZCIKPgo+Cj4KPiAtLQo+ICJUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhl
IE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0Cj4gdGhlZSBhdCBpdHMg
ZW5kIgogCQkgCSAgIAkJICA=

