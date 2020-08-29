Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16605.1598724122127143584
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00BE4E02116; Sat, 29 Aug 2020 11:02:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.0 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AED8CE020D8
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:56 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat: upgrading to 4.4.17 SUCCEEDED
Message-Id: <20200829180202.00BE4E02116@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:02 -0700 (PDT)
X-Groupsio-MsgNum: 141946
Content-Type: multipart/mixed; boundary="===============3152252810803150571=="

--===============3152252810803150571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt-compat* to *4.4.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-upgrade-4.4.16-4.4.17.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============3152252810803150571==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-upgrade-4.4.16-4.4.17.patch"

RnJvbSAxMTQ0ZDY0MDkwNWEzZTM0YmZmZjhiYjk1YzhlMDg1MWFjNDI5NTBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQGF1aC55b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBTYXQsIDI5IEF1ZyAyMDIwIDEyOjA4OjE4ICswMDAwClN1YmplY3Q6IFtQQVRD
SF0gbGlieGNyeXB0LWNvbXBhdDogdXBncmFkZSA0LjQuMTYgLT4gNC40LjE3CgotLS0KIC4uLnRf
NC40LjE2LmJiID0+IGxpYnhjcnlwdC1jb21wYXRfNC40LjE3LmJifSB8IDIyICsrKysrKysrKysr
KysrKysrKysKIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jICAgICB8
ICA2ICsrKystCiAyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQve2xpYnhjcnlwdC1jb21wYXRf
NC40LjE2LmJiID0+IGxpYnhjcnlwdC1jb21wYXRfNC40LjE3LmJifSAoMzAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4xNi5i
YiBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4xNy5i
YgpzaW1pbGFyaXR5IGluZGV4IDMwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4
Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQuMTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1j
b3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4xNy5iYgppbmRleCBiYTc0ZWIxZjk0
Li5kMDY0NjMzNDFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGli
eGNyeXB0LWNvbXBhdF80LjQuMTYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0
L2xpYnhjcnlwdC1jb21wYXRfNC40LjE3LmJiCkBAIC0xLDMgKzEsMjUgQEAKKyMgRklYTUU6IHRo
ZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1
cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
bGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNF
IHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29t
bWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNl
bnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6
CisjCisjIC0tLSBMSUNFTlNJTkcKKyMgKysrIExJQ0VOU0lORworIyBAQCAtNTUsNyArNTUsNyBA
QAorIyAgCisjICAgKiBDb3B5cmlnaHQgQmrDtnJuIEVzc2VyOyAwLWNsYXVzZSBCU0Q6CisjICAg
ICBjcnlwdC1jb21tb24uYywgdGVzdC1jaGVja3NhbHQuYywgdGVzdC1jb21waWxlLXN0cm9uZy1h
bGlhcy5jLAorIyAtICAgdGVzdC1nZW5zYWx0LW50aGFzaC5jLCB0ZXN0LXNob3J0LW91dGJ1Zi5j
CisjICsgICB0ZXN0LWdlbnNhbHQtbnRoYXNoLmMsIHRlc3Qtc2hvcnQtb3V0YnVmLmMsIHRlc3Qt
c3BlY2lhbC1jaGFyLXNhbHQuYworIyAgCisjICAgKiBDb3B5cmlnaHQgTWljaGFlbCBCcmV0dGVy
a2xpZWJlciwgQmrDtnJuIEVzc2VyIGV0IGFsLjsgMi1jbGF1c2UgQlNEOgorIyAgICAgY3J5cHQt
bnRoYXNoLmMKKyMgCisjCisKICMKICMgVGhpcyBwcm92aWRlcyBsaWJjcnlwdG8uc28uMSB3aGlj
aCBjb250YWlucyBvYnNvbGV0ZSBBUElzLCBuZWVkZWQgZm9yIHVuaW5hdGl2ZSBpbiBwYXJ0aWN1
bGFyCiAjCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0
LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jCmluZGV4IGRh
NzYwN2FlZjMuLjAzODhmNWFjNmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhj
cnlwdC9saWJ4Y3J5cHQuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4
Y3J5cHQuaW5jCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPz0gImZpbGU6Ly9M
SUNFTlNJTkc7bWQ1PTNiYjY2MTRjZjU4ODBjYmYxYjlkYmQ5ZTNkMTQ1ZTJjIFwKIGluaGVyaXQg
YXV0b3Rvb2xzIHBrZ2NvbmZpZwogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vYmVzc2Vy
ODIvbGlieGNyeXB0LmdpdDticmFuY2g9JHtTUkNCUkFOQ0h9IgotU1JDUkVWID0gIjRmZmE0ZDM4
Mzk2YzMzNGExZTAwMjQyN2MyMjI4MWIwNDdhM2Q2YTYiCitTUkNSRVYgPSAiNmIxMTBiY2Q0ZjRj
YWE2MWZjMzljNzMzOWQzMGFkYzIwYTdkZDE3NyIKIFNSQ0JSQU5DSCA/PSAiZGV2ZWxvcCIKIAog
UFJPVklERVMgPSAidmlydHVhbC9jcnlwdCIKQEAgLTMxLDMgKzMxLDcgQEAgQVBJID0gIi0tZGlz
YWJsZS1vYnNvbGV0ZS1hcGkiCiBFWFRSQV9PRUNPTkYgKz0gIiR7QVBJfSIKIAogQkJDTEFTU0VY
VEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgorCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNJTkc7bWQ1PTEwMjkyM2I2ZTFiMDJhODVjNWExMjAzZmE4N2QxNTFkIFwKKyAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkw
MDhiMzY0NTE2YyBcCisgICAgICAgICAgICAgICAgICAgICIKLS0gCjIuMTcuMQoK

--===============3152252810803150571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxcrypt-compat: PKGV changed from 4.4.16 [default] to 4.4.17 [default]
packages/core2-32-poky-linux/libxcrypt-compat: PV changed from "4.4.16" to "4.4.17"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 626424 to 627276 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.16 [default] to 4.4.17 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.16" to "4.4.17"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.16 [default] to 4.4.17 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.16" to "4.4.17"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.16 [default] to 4.4.17 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.16" to "4.4.17"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.16 [default] to 4.4.17 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.16" to "4.4.17"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 747629 to 748810 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.16 [default] to 4.4.17 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.16" to "4.4.17"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.16 [default] to 4.4.17 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.16" to "4.4.17"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.16 [default] to 4.4.17 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.16" to "4.4.17"

--===============3152252810803150571==--
