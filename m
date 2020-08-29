Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16606.1598724122757411172
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A8EBE020D8; Sat, 29 Aug 2020 11:02:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C35A2E020DA
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:56 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt: upgrading to 4.4.17 FAILED
Message-Id: <20200829180202.9A8EBE020D8@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:02 -0700 (PDT)
X-Groupsio-MsgNum: 141947
Content-Type: multipart/mixed; boundary="===============2638821005403845989=="

--===============2638821005403845989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt* to *4.4.17* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxcrypt-upgrade-4.4.16-4.4.17.patch
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

--===============2638821005403845989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 779 .bb files complete (0 cached, 779 parsed). 1341 targets, 46 skipped, 0 masked, 0 errors.
Removing 6 recipes from the core2-32 sysroot...done.
Removing 6 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'libxcrypt'
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2638821005403845989==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-upgrade-4.4.16-4.4.17.patch"

RnJvbSBiYWYwZmYxMGVhMDA4NTBjYWUxNDhjNTZmZDE1Nzg4MDZjYTQ0ODgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQGF1aC55b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBTYXQsIDI5IEF1ZyAyMDIwIDEyOjEyOjA4ICswMDAwClN1YmplY3Q6IFtQQVRD
SF0gbGlieGNyeXB0OiB1cGdyYWRlIDQuNC4xNiAtPiA0LjQuMTcKCi0tLQogbWV0YS9yZWNpcGVz
LWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgICAgIHwgIDYgKysrKy0KIC4uLi9saWJ4Y3J5
cHQvbGlieGNyeXB0XzQuNC4xNi5iYiAgICAgICAgICAgICB8ICAyIC0tCiAuLi4vbGlieGNyeXB0
L2xpYnhjcnlwdF80LjQuMTcuYmIgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysr
CiAzIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdF80LjQu
MTYuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGli
eGNyeXB0XzQuNC4xNy5iYgoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlw
dC9saWJ4Y3J5cHQuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5p
bmMKaW5kZXggZGE3NjA3YWVmMy4uMDM4OGY1YWM2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGli
eGNyeXB0L2xpYnhjcnlwdC5pbmMKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA/
PSAiZmlsZTovL0xJQ0VOU0lORzttZDU9M2JiNjYxNGNmNTg4MGNiZjFiOWRiZDllM2QxNDVlMmMg
XAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9iZXNzZXI4Mi9saWJ4Y3J5cHQuZ2l0O2JyYW5jaD0ke1NSQ0JSQU5DSH0iCi1TUkNSRVYg
PSAiNGZmYTRkMzgzOTZjMzM0YTFlMDAyNDI3YzIyMjgxYjA0N2EzZDZhNiIKK1NSQ1JFViA9ICI2
YjExMGJjZDRmNGNhYTYxZmMzOWM3MzM5ZDMwYWRjMjBhN2RkMTc3IgogU1JDQlJBTkNIID89ICJk
ZXZlbG9wIgogCiBQUk9WSURFUyA9ICJ2aXJ0dWFsL2NyeXB0IgpAQCAtMzEsMyArMzEsNyBAQCBB
UEkgPSAiLS1kaXNhYmxlLW9ic29sZXRlLWFwaSIKIEVYVFJBX09FQ09ORiArPSAiJHtBUEl9Igog
CiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCisKK0xJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0lORzttZDU9MTAyOTIzYjZlMWIwMmE4NWM1YTEyMDNmYTg3ZDE1MWQg
XAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5MSUI7bWQ1PTRmYmQ2NTM4MGNk
ZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKKyAgICAgICAgICAgICAgICAgICAgIgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdF80LjQuMTYuYmIgYi9tZXRh
L3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0XzQuNC4xNi5iYgpkZWxldGVkIGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggNzlkYmEyZjZkYy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0XzQuNC4xNi5iYgorKysgL2Rldi9udWxsCkBAIC0x
LDIgKzAsMCBAQAotcmVxdWlyZSBsaWJ4Y3J5cHQuaW5jCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHRfNC40LjE3LmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvbGlieGNyeXB0L2xpYnhjcnlwdF80LjQuMTcuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uZTBlMTM5NzIwNgotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHRfNC40LjE3LmJiCkBAIC0wLDAgKzEsMjQgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNJTkcKKyMgKysrIExJQ0VOU0lORworIyBAQCAtNTUs
NyArNTUsNyBAQAorIyAgCisjICAgKiBDb3B5cmlnaHQgQmrDtnJuIEVzc2VyOyAwLWNsYXVzZSBC
U0Q6CisjICAgICBjcnlwdC1jb21tb24uYywgdGVzdC1jaGVja3NhbHQuYywgdGVzdC1jb21waWxl
LXN0cm9uZy1hbGlhcy5jLAorIyAtICAgdGVzdC1nZW5zYWx0LW50aGFzaC5jLCB0ZXN0LXNob3J0
LW91dGJ1Zi5jCisjICsgICB0ZXN0LWdlbnNhbHQtbnRoYXNoLmMsIHRlc3Qtc2hvcnQtb3V0YnVm
LmMsIHRlc3Qtc3BlY2lhbC1jaGFyLXNhbHQuYworIyAgCisjICAgKiBDb3B5cmlnaHQgTWljaGFl
bCBCcmV0dGVya2xpZWJlciwgQmrDtnJuIEVzc2VyIGV0IGFsLjsgMi1jbGF1c2UgQlNEOgorIyAg
ICAgY3J5cHQtbnRoYXNoLmMKKyMgCisjCisKK3JlcXVpcmUgbGlieGNyeXB0LmluYworCi0tIAoy
LjE3LjEKCg==

--===============2638821005403845989==--
