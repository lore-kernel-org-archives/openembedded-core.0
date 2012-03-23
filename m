Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SB7ce-00085i-Tm
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:45:53 +0100
Received: by yenm3 with SMTP id m3so2894300yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:subject:message-id:from:to:cc:mime-version:content-type
	:content-transfer-encoding;
	bh=y0k8XXyFAjMZ09XdFMZKU+WpOlVBfNoEYmZKJktfY5s=;
	b=JcEIBll5baxIpCYE3PrRK25d6HE564YjdTXttrbwkDW83Fr7WYNO+BvO3CU14+leR2
	trNAayUN+HtEROMwm4TqwOWSX1SwS04vAbiNPGsp9qSIGyIZ5ObVkG3smxhhUaMzSIv+
	tmAYFPtPty9ssZI01S0swCrChL8jlJx2VZgiX/dFui8bn+hy3BmJKU6SX+F4poHREOsz
	AFBMJt3gjS3wiKLqZlu1r32/8ZXYq2sZ9HtBmwqvG/jN1Zgm0N8pIXvr+jNERTtiEmTI
	o6wr0SAxNS/5JkpOyr+IMBPLJRgkGs5lluXwAixSJj8zT0iTj3DHHL/RTctnisKtr0cc
	F4PQ==
Received: by 10.68.131.1 with SMTP id oi1mr30394890pbb.102.1332520615812;
	Fri, 23 Mar 2012 09:36:55 -0700 (PDT)
Received: from [22.167.165.37] (mf10536d0.tmodns.net. [208.54.5.241])
	by mx.google.com with ESMTPS id g4sm6133998pbt.58.2012.03.23.09.36.53
	(version=SSLv3 cipher=OTHER); Fri, 23 Mar 2012 09:36:54 -0700 (PDT)
Date: Fri, 23 Mar 2012 09:36:46 -0700
Message-ID: <xna3ujdvoyvh9m51g7hfhmvu.1332520606617@email.android.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 16:45:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

TXkgcGF0Y2ggdG9vayBjYXJlIG9mIGV2ZXJ5dGhpbmcgaW5jbHVkaW5nIHBhdGhzCi1raGVtCgoi
S2FtYmxlLCBOaXRpbiBBIiA8bml0aW4uYS5rYW1ibGVAaW50ZWwuY29tPiB3cm90ZToKCj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmto
ZW1AZ21haWwuY29tXQo+PiBTZW50OiBGcmlkYXksIE1hcmNoIDIzLCAyMDEyIDU6MDcgQU0KPj4g
VG86IEVyaWMgQsOpbmFyZAo+PiBDYzogS2FtYmxlLCBOaXRpbiBBOyBQYXRjaGVzIGFuZCBkaXNj
dXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcjsKPj4gTWFydGluIEphbnNhCj4+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gUmV2ZXJ0ICJnZGItY3Jvc3MtY2FuYWRpYW46
IGJ1aWxkCj4+IGdkYiB3aXRoIHB5dGhvbiBzdXBwb3J0Igo+PiAKPj4gT24gMDMvMjMvMjAxMiAw
MTozMSBBTSwgRXJpYyBCw6luYXJkIHdyb3RlOgo+PiA+IEhpIEtoZW0sCj4+ID4KPj4gPiBMZSBG
cmksIDIzIE1hciAyMDEyIDAwOjEyOjI1IC0wNzAwLAo+PiA+IEtoZW0gUmFqPHJhai5raGVtQGdt
YWlsLmNvbT4gIGEgw6ljcml0IDoKPj4gPj4gT0sgY2FuIHlvdSB0cnkgZm9sbG93aW5nIHBhdGNo
ID8gKHVudGVzdGVkKSBpdCBkb2VzIG5vdCBmaXggdGhlCj4+IHBhdGhzIHNvCj4+ID4+IG9uY2Ug
eW91IGluc3RhbGwgc2RrIGl0IHdpbGwgaGF2ZSB0byBiZSBmaXhlZCBhcyB5b3UgZGlkIHdpdGgK
Pj4gY2hycGF0aAo+PiA+PiBmb3IgdGVzdGluZwo+PiA+Pgo+PiA+PiBodHRwOi8vcGFzdGUudWJ1
bnR1LmNvbS84OTYwODIvCj4+ID4+Cj4+ID4+IEkgdGhpbmsgaXNzdWUgaXMgY3VycmVudGx5IHdl
IGFyZSBsaW5raW5nIHdpdGggc3RhdGljIHZlcnNpb24gb2YKPj4gPj4gbGlicHl0aG9uIGFuZCBh
bHNvIHRoZSBzZWFyY2ggcGF0aCB0byBmaW5kIHB5dGhvbiBleGVjdXRhYmxlIGZvciBnZGIKPj4g
Pj4gd2hlbiBydW5uaW5nIGlzIC91c3IvYmluIGFuZCBub3QgdGhlIHB5dGhvbiBmcm9tIFNESyBz
byB0aGlzIHBhdGNoCj4+ID4+IHRha2VzIGNhcmUgb2YgYm90aAo+PiA+Pgo+PiA+IHZlcnkgZ29v
ZCBjYXRjaCwgbm93IGdkYiBydW5zIGZpbmUgYW5kIHN0cmFjZSBzaG93cyB0aGF0IGl0IGxvYWRz
Cj4+ID4gdGhlIHJpZ2h0IGxpYnJhcnkgOgo+PiA+Cj4+ID4gb3BlbigiL3Vzci9sb2NhbC9vZWNv
cmUteDg2XzY0L3N5c3Jvb3RzL3g4Nl82NC1vZXNkay0KPj4gbGludXgvdXNyL2xpYi9weXRob24y
LjcvbGliLWR5bmxvYWQvcmVhZGxpbmUuc28iLAo+PiA+IE9fUkRPTkxZKSA9IDYgZnN0YXQoNiwg
e3N0X21vZGU9U19JRlJFR3wwNzU1LCBzdF9zaXplPTIzNTIwLCAuLi59KSA9Cj4+IDAKPj4gPiBm
dXRleCgweDdmM2FkYTQ4ZTBhOCwgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9IDAK
Pj4gPiBvcGVuKCIvdXNyL2xvY2FsL29lY29yZS14ODZfNjQvc3lzcm9vdHMveDg2XzY0LW9lc2Rr
LQo+PiBsaW51eC91c3IvbGliL3B5dGhvbjIuNy9saWItZHlubG9hZC9yZWFkbGluZS5zbyIsCj4+
ID4gT19SRE9OTFkpID0gNyByZWFkKDcsCj4+ID4gIlwxNzdFTEZcMlwxXDFcMFwwXDBcMFwwXDBc
MFwwXDBcM1wwPlwwXDFcMFwwXDBgJVwwXDBcMFwwXDBcMCIuLi4sCj4+IDgzMikKPj4gPiA9IDgz
MiBmc3RhdCg3LCB7c3RfbW9kZT1TX0lGUkVHfDA3NTUsIHN0X3NpemU9MjM1MjAsIC4uLn0pID0g
MAo+PiA+IG1tYXAoTlVMTCwgMjExODk1MiwgUFJPVF9SRUFEfFBST1RfRVhFQywgTUFQX1BSSVZB
VEV8TUFQX0RFTllXUklURSwKPj4gNywKPj4gPiAwKSA9IDB4N2YzYWQ4YTA1MDAwCj4+ID4KPj4g
PiBFcmljCj4+IAo+PiBnb29kLiBTbyB0aGlzIHBhdGNoIGRvZXMgdGhlIHRyaWNrLiBJIHdpbGwg
cG9zdCBwcm9wZXIgcGF0Y2ggc2hvcnRseQo+PiB3ZSBzdGlsbCBuZWVkIHRvIGZpeCB0aGUgcnBh
dGggcHJvYmxlbSB0aG91Z2gKPgo+S2hlbSwKPiAgIFRoYW5rcyBmb3IgZml4aW5nIHRoZSBnZGIg
aXNzdWUgYXQgdGhlIHJvb3QgY2F1c2UuIEFuZCBJIGhhdmUgYSBmaXggZm9yIHRoZSBycGF0aCBp
c3N1ZS4KPlRoYW5rcywKPk5pdGluCj4K



