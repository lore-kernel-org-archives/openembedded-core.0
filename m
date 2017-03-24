Return-Path: <tristan.vanberkom@codethink.co.uk>
X-Greylist: delayed 1487 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Mar 2017 18:09:13 UTC
Received: from imap0.codethink.co.uk (imap0.codethink.co.uk [185.43.218.159])
	by mail.openembedded.org (Postfix) with ESMTP id 908B777BC5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 18:09:13 +0000 (UTC)
Received: from imap1.codethink.co.uk ([176.9.8.82])
	by imap0.codethink.co.uk with esmtps (Exim 4.84_2 #1 (Debian))
	id 1crTGF-0004WP-8P for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 17:44:27 +0000
Received: from 82-70-136-246.dsl.in-addr.zen.co.uk ([82.70.136.246] helo=think)
	by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
	id 1crTGD-0006ud-P0 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 17:44:26 +0000
Message-ID: <1490377463.18519.4.camel@codethink.co.uk>
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 17:44:23 +0000
Organization: Codethink
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: [PATCH] libjpeg-turbo fails to build for aarch64/arm targets on aarch64 host
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
X-List-Received-Date: Fri, 24 Mar 2017 18:09:15 -0000
X-Groupsio-MsgNum: 95217
Content-Type: multipart/mixed; boundary="=-E7Yw3Akv+41p+cZM7Seg"

--=-E7Yw3Akv+41p+cZM7Seg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is already filed in the appropriate bugzilla:
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=11240

Just notifying the list as the custom goes...

libjpeg-turbo in recipes-graphics has an unconditional dependency on
nasm-native, which is intel specific and wont be provided on non intel
arches.

Attaching a patch which fixes this by only requiring nasm-native when
targeting intel architectures.

Cheers,
    -Tristan

--=-E7Yw3Akv+41p+cZM7Seg
Content-Disposition: attachment;
	filename*0=0001-libjpeg-turbo-Support-building-on-non-intel-targets.patc;
	filename*1=h
Content-Type: text/x-patch;
	name="0001-libjpeg-turbo-Support-building-on-non-intel-targets.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAyOWE4MmJhMjVhOWMzOTVmNTIxNDY5OWNhMGFmYjViZDQ2NWViZGYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUcmlzdGFuIFZhbiBCZXJrb20gPHRyaXN0YW4udmFuYmVya29t
QGNvZGV0aGluay5jby51az4KRGF0ZTogRnJpLCAyNCBNYXIgMjAxNyAxNTozNzozNiArMDAwMApT
dWJqZWN0OiBbUEFUQ0hdIGxpYmpwZWctdHVyYm86IFN1cHBvcnQgYnVpbGRpbmcgb24gbm9uIGlu
dGVsIHRhcmdldHMuCgpuYXNtIGlzIGludGVsIHNwZWNpZmljLCBob3dldmVyIGxpYmpwZWctdHVy
Ym8gaXMgc3RpbGwgZGVzaXJhYmxlCm9uIG90aGVyIGFyY2hpdGVjdHVyZXMuCgpXaXRob3V0IHRo
aXMgcGF0Y2gsIGl0IHdvdWxkIHNlZW0gdGhhdCBuYXNtIGlzIGJ1aWx0IG9uIGFuIGludGVsCmhv
c3QgYW5kIHRoZW4gaWdub3JlZCB3aGVuIGNvbXBpbGluZyBsaWJqcGVnLXR1cmJvIGZvciBhbiBh
cm0gdGFyZ2V0LApob3dldmVyIGl0IGhhcyBsaWJqcGVnLXR1cmJvIHJlcXVpcmluZyBuYXNtIGJl
IGJ1aWx0IHdoZW4gYnVpbGRpbmcKb24gYW4gYXJtL2FhcmNoNjQgaG9zdC4KClRoaXMgZml4ZXMg
dGhlIGlzc3VlIHNvIHRoYXQgbmFzbS1uYXRpdmUgaXMgbm90IHJlcXVpcmVkIG9uIHRoZSBob3N0
CndoZW4gYnVpbGRpbmcgZm9yIGFuIGFhcmNoNjQgdGFyZ2V0LgotLS0KIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMS41LjAuYmIgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMS41LjAuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzEuNS4wLmJiCmluZGV4IGM5ZTcwZDczZDIuLmEw
MjQwNmVhYTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWct
dHVyYm9fMS41LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10
dXJib18xLjUuMC5iYgpAQCAtNyw3ICs3LDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Y2RqcGVnLmg7ZW5kbGluZT0xMzttZDU9MDViYWI3YzdhZDg5OWQ4NWJmYmE2MGRhMWExMjcKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL2pwZWdsaWIuaDtlbmRsaW5lPTE2O21kNT1mNjdkNzBl
NTQ3YTI2NjJjMDc5NzgxYzcyZjg3N2Y3MiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9k
anBlZy5jO2VuZGxpbmU9MTE7bWQ1PWI5MGI2ZDJiNDExOWY5ZTU4MDdjZDI3M2Y1MjVkMmFmIFwK
ICIKLURFUEVORFMgPSAibmFzbS1uYXRpdmUiCitERVBFTkRTX2FwcGVuZF94ODYtNjQgPSAiIG5h
c20tbmF0aXZlIgorREVQRU5EU19hcHBlbmRfeDg2ICAgID0gIiBuYXNtLW5hdGl2ZSIKIAogU1JD
X1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuZ3oi
CiBTUkNfVVJJW21kNXN1bV0gPSAiM2ZjNWQ5YjZhOGJjZTk2MTYxNjU5YWU3YTk5MzkyNTciCi0t
IAoyLjExLjAKCg==

--=-E7Yw3Akv+41p+cZM7Seg--
