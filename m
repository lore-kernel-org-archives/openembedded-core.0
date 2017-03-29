Return-Path: <tristan.vanberkom@codethink.co.uk>
Received: from imap0.codethink.co.uk (imap0.codethink.co.uk [185.43.218.159])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE7B77CA8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 12:11:39 +0000 (UTC)
Received: from imap1.codethink.co.uk ([176.9.8.82])
	by imap0.codethink.co.uk with esmtps (Exim 4.84_2 #1 (Debian))
	id 1ctCRu-0003aN-W5 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:11:39 +0100
Received: from [114.207.54.40] (helo=think)
	by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
	id 1ctCRu-0002Ie-0z for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:11:38 +0100
Message-ID: <1490789493.18519.18.camel@codethink.co.uk>
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 21:11:33 +0900
Organization: Codethink
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: [PATCH] libjpeg-turbo: fix build on aarch64 or non-intel build hosts
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
X-List-Received-Date: Wed, 29 Mar 2017 12:11:40 -0000
X-Groupsio-MsgNum: 95452
Content-Type: multipart/mixed; boundary="=-XyuYD0+eU8B0h0QoyvVA"

--=-XyuYD0+eU8B0h0QoyvVA
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

--=-XyuYD0+eU8B0h0QoyvVA
Content-Disposition: attachment;
	filename*0=0001-libjpeg-turbo-Support-building-on-non-intel-targets.patc;
	filename*1=h
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-libjpeg-turbo-Support-building-on-non-intel-targets.patch";
	charset="UTF-8"

RnJvbSBkNzZkNTdhMTQ4ZGQzNzJmZjI2YjliOTAyYjdiNzlhNGRkYjVlN2EyIE1vbiBTZXAgMTcg
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
cmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMS41LjEuYmIgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMS41LjEuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzEuNS4xLmJiCmluZGV4IDcwZDM4ZjRhMWEuLmE2
NTBkNmFmMmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWct
dHVyYm9fMS41LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10
dXJib18xLjUuMS5iYgpAQCAtNyw3ICs3LDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Y2RqcGVnLmg7ZW5kbGluZT0xMzttZDU9MDViYWI3YzdhZDg5OWQ4NWJmYmE2MGRhMWExMjcKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL2pwZWdsaWIuaDtlbmRsaW5lPTE2O21kNT1mNjdkNzBl
NTQ3YTI2NjJjMDc5NzgxYzcyZjg3N2Y3MiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9k
anBlZy5jO2VuZGxpbmU9MTE7bWQ1PWI5MGI2ZDJiNDExOWY5ZTU4MDdjZDI3M2Y1MjVkMmFmIFwK
ICIKLURFUEVORFMgPSAibmFzbS1uYXRpdmUiCitERVBFTkRTX2FwcGVuZF94ODYtNjQgPSAiIG5h
c20tbmF0aXZlIgorREVQRU5EU19hcHBlbmRfeDg2ICAgID0gIiBuYXNtLW5hdGl2ZSIKIAogU1JD
X1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuZ3og
XAogICAgICAgICAgICBmaWxlOi8vZml4LW1pcHMucGF0Y2giCi0tIAoyLjExLjAKCg==

--=-XyuYD0+eU8B0h0QoyvVA--
