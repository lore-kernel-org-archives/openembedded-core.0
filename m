Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AB7C3A5A7
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.478.1664643226300245194
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nPx569qk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101839477d6b4-cf15e492-01eb-4ec5-87f7-973c0d393c4e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1t2V/g50zrLaYlaEeiWA7FarRgx5bz4V8XAD/1TJC1g=;
	b=nPx569qkslZJtGw7D+L0kLVoLiMXMQcumKESYjnFPKojmX9mOlaFShmY+wU4+/z8
	PScIipJqkWxXe+OAk7QnkpTSS34Ts4VcDmicXD4k4R0Ep6xLSYmTR25FwmtTLZpKsM5
	olMs6JH9yyLsqscIcNGVfGXwFFFBB9LugrW1iFFg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1t2V/g50zrLaYlaEeiWA7FarRgx5bz4V8XAD/1TJC1g=;
	b=KEjDX4bRlD/lydq6dd+3ieUrVTgjPnrBQip+XdUvS50Px95pgoz0V6Kz4IJdI2fI
	oaVAdvLah3tgpgBQd/cjEAMyWcH1L7E1cl5ArSsovrvbO2Lp38j/LMb+xYqRgrb98dw
	rkEKjK74Fmj8C3wptwfKoFNw6BHxrgLuNcpw1XqE=
Content-Type: multipart/mixed; boundary="===============0344884448901228816=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202208 FAILED
Message-ID: 
 <010101839477d6b4-cf15e492-01eb-4ec5-87f7-973c0d393c4e-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171256

--===============0344884448901228816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202208* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ovmf-upgrade-edk2-stable202205-edk2-stable202208.patch
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
--===============0344884448901228816==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ovmf-upgrade-edk2-stable202205-edk2-stable202208.patch"

RnJvbSAyMDBjNzIxZjIxMDM5OWYzM2MxYzJlZjFkOTAxYTYyN2Y2NzMxMjZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwNjo0NjozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG92
bWY6IHVwZ3JhZGUgZWRrMi1zdGFibGUyMDIyMDUgLT4gZWRrMi1zdGFibGUyMDIyMDgKCi0tLQog
Li4uMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIHwgNjQgKysrKysr
KysrKysrKysrKysrKwogbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYiAgICAgICAg
ICAgIHwgIDUgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAw
NS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaAoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRv
X3BhdGNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDUtQ29tbWl0dGlu
Zy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uNjFlMGM4NzljNwotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL292bWYvb3ZtZi8wMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNo
CkBAIC0wLDAgKzEsNjQgQEAKK0Zyb20gZjEwNzg1ZjljNTBmNzk4MjQzNzFhYjhmM2EwNTdhMzc4
Nzg5MWUxZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IE9wZW5FbWJlZGRlZCA8b2Uu
cGF0Y2hAb2U+CitEYXRlOiBTYXQsIDEgT2N0IDIwMjIgMDY6NDY6MDAgKzAwMDAKK1N1YmplY3Q6
IFtQQVRDSF0gQ29tbWl0dGluZyBjaGFuZ2VzIGZyb20gZG9fcGF0Y2gKKworLS0tCisgQmFzZVRv
b2xzL1NvdXJjZS9DL01ha2VmaWxlcy9hcHAubWFrZWZpbGUgfCAgNiArKysrKysKKyBCYXNlVG9v
bHMvU291cmNlL0MvVmZyQ29tcGlsZS9HTlVtYWtlZmlsZSB8IDEwICsrKysrKysrKysKKyBPdm1m
UGtnL2J1aWxkLnNoICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCisgMyBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9C
YXNlVG9vbHMvU291cmNlL0MvTWFrZWZpbGVzL2FwcC5tYWtlZmlsZSBiL0Jhc2VUb29scy9Tb3Vy
Y2UvQy9NYWtlZmlsZXMvYXBwLm1ha2VmaWxlCitpbmRleCA2YTJhOGY1ZThhLi43ZDU1MzU0Yzk1
IDEwMDY0NAorLS0tIGEvQmFzZVRvb2xzL1NvdXJjZS9DL01ha2VmaWxlcy9hcHAubWFrZWZpbGUK
KysrKyBiL0Jhc2VUb29scy9Tb3VyY2UvQy9NYWtlZmlsZXMvYXBwLm1ha2VmaWxlCitAQCAtMTAs
NiArMTAsMTIgQEAgTUFLRVJPT1QgPz0gLi4vLi4KKyBpbmNsdWRlICQoTUFLRVJPT1QpL01ha2Vm
aWxlcy9oZWFkZXIubWFrZWZpbGUKKyAKKyBBUFBMSUNBVElPTiA9ICQoTUFLRVJPT1QpL2Jpbi8k
KEFQUE5BTUUpCisrQ0MgPSB4ODZfNjQtcG9reS1saW51eC1nY2MgIC1tNjQgLW1hcmNoPWNvcmUy
IC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9u
ZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdl
cnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3Jr
ZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3Zt
Zi9lZGsyLXN0YWJsZTIwMjIwNS1yMC9kZXZ0b29sdG1wLWFkZ2x0Mzl2L3dvcmtkaXIvcmVjaXBl
LXN5c3Jvb3QKKytDWFggPSB4ODZfNjQtcG9reS1saW51eC1nKysgIC1tNjQgLW1hcmNoPWNvcmUy
IC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9u
ZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdl
cnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3Jr
ZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3Zt
Zi9lZGsyLXN0YWJsZTIwMjIwNS1yMC9kZXZ0b29sdG1wLWFkZ2x0Mzl2L3dvcmtkaXIvcmVjaXBl
LXN5c3Jvb3QKKytBUyA9IHg4Nl82NC1wb2t5LWxpbnV4LWFzICAKKytBUiA9IHg4Nl82NC1wb2t5
LWxpbnV4LWdjYy1hcgorK0xEID0geDg2XzY0LXBva3ktbGludXgtbGQgLS1zeXNyb290PS9ob21l
L3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL2Nv
cmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjIwNS1yMC9kZXZ0b29sdG1wLWFk
Z2x0Mzl2L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QgIAorK0xJTktFUiA9ICQoQ0MpCisgCisgLlBI
T05ZOmFsbAorIGFsbDogJChNQUtFUk9PVCkvYmluICQoQVBQTElDQVRJT04pCitkaWZmIC0tZ2l0
IGEvQmFzZVRvb2xzL1NvdXJjZS9DL1ZmckNvbXBpbGUvR05VbWFrZWZpbGUgYi9CYXNlVG9vbHMv
U291cmNlL0MvVmZyQ29tcGlsZS9HTlVtYWtlZmlsZQoraW5kZXggZmMzMjk5NDRiOS4uODI2Yzkw
NmY3NCAxMDA2NDQKKy0tLSBhL0Jhc2VUb29scy9Tb3VyY2UvQy9WZnJDb21waWxlL0dOVW1ha2Vm
aWxlCisrKysgYi9CYXNlVG9vbHMvU291cmNlL0MvVmZyQ29tcGlsZS9HTlVtYWtlZmlsZQorQEAg
LTE4LDggKzE4LDE4IEBAIE9CSkVDVFMgPSBBUGFyc2VyLm8gRExleGVyQmFzZS5vIEFUb2tlbkJ1
ZmZlci5vIEVmaVZmclBhcnNlci5vIFZmckxleGVyLm8gVmZyU3luCisgICAgICAgICAgIFZmckZv
cm1Qa2cubyBWZnJFcnJvci5vIFZmclV0aWxpdHlMaWIubyBWZnJDb21waWxlci5vCisgaWZlcSAo
JChDWFgpLCBsbHZtKQorIFZGUl9DUFBGTEFHUyA9IC1Xbm8tZGVwcmVjYXRlZC1yZWdpc3RlciAt
RFBDQ1RTX1VTRV9OQU1FU1BBQ0VfU1REICQoQlVJTERfQ1BQRkxBR1MpCisrQ0MgPSB4ODZfNjQt
cG9reS1saW51eC1nY2MgIC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1m
cG1hdGg9c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNF
PTIgLVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1z
eXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxk
L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjIwNS1yMC9k
ZXZ0b29sdG1wLWFkZ2x0Mzl2L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QKKytDWFggPSB4ODZfNjQt
cG9reS1saW51eC1nKysgIC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1m
cG1hdGg9c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNF
PTIgLVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1z
eXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxk
L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjIwNS1yMC9k
ZXZ0b29sdG1wLWFkZ2x0Mzl2L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QKKytBUyA9IHg4Nl82NC1w
b2t5LWxpbnV4LWFzICAKKytBUiA9IHg4Nl82NC1wb2t5LWxpbnV4LWdjYy1hcgorK0xEID0geDg2
XzY0LXBva3ktbGludXgtbGQgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIv
YXVoL2J1aWxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9l
ZGsyLXN0YWJsZTIwMjIwNS1yMC9kZXZ0b29sdG1wLWFkZ2x0Mzl2L3dvcmtkaXIvcmVjaXBlLXN5
c3Jvb3QgIAorIGVsc2UKKyBWRlJfQ1BQRkxBR1MgPSAtRFBDQ1RTX1VTRV9OQU1FU1BBQ0VfU1RE
ICQoQlVJTERfQ1BQRkxBR1MpCisrQ0MgPSB4ODZfNjQtcG9reS1saW51eC1nY2MgIC1tNjQgLW1h
cmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlIC1mc3RhY2stcHJvdGVj
dG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQgLVdmb3JtYXQtc2Vj
dXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95
b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjIwNS1yMC9kZXZ0b29sdG1wLWFkZ2x0Mzl2L3dvcmtk
aXIvcmVjaXBlLXN5c3Jvb3QKKytDWFggPSB4ODZfNjQtcG9reS1saW51eC1nKysgIC1tNjQgLW1h
cmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlIC1mc3RhY2stcHJvdGVj
dG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQgLVdmb3JtYXQtc2Vj
dXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95
b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjIwNS1yMC9kZXZ0b29sdG1wLWFkZ2x0Mzl2L3dvcmtk
aXIvcmVjaXBlLXN5c3Jvb3QKKytBUyA9IHg4Nl82NC1wb2t5LWxpbnV4LWFzICAKKytBUiA9IHg4
Nl82NC1wb2t5LWxpbnV4LWdjYy1hcgorK0xEID0geDg2XzY0LXBva3ktbGludXgtbGQgLS1zeXNy
b290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxkL3Rt
cC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjIwNS1yMC9kZXZ0
b29sdG1wLWFkZ2x0Mzl2L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QgIAorIGVuZGlmCisgIyBrZWVw
IEJVSUxEX09QVEZMQUdTIGxhc3QKKyBWRlJfQ1hYRkxBR1MgPSAkKEJVSUxEX09QVEZMQUdTKQor
ZGlmZiAtLWdpdCBhL092bWZQa2cvYnVpbGQuc2ggYi9Pdm1mUGtnL2J1aWxkLnNoCitpbmRleCAx
ODU4ZGFlMzFhLi40ZmU1YjNhZGY5IDEwMDc1NQorLS0tIGEvT3ZtZlBrZy9idWlsZC5zaAorKysr
IGIvT3ZtZlBrZy9idWlsZC5zaAorQEAgLTI0LDcgKzI0LDcgQEAgdGhlbgorICMgdGhpcyBhc3N1
bWVzIHN2biBwdWxscyBoYXZlIHRoZSBzYW1lIHJvb3QgZGlyCisgIyAgZXhwb3J0IEVES19UT09M
U19QQVRIPWBwd2RgLy4uL0Jhc2VUb29scworICMgVGhpcyB2ZXJzaW9uIGlzIGZvciB0aGUgdG9v
bHMgc291cmNlIGluIGVkazIKKy0gIGV4cG9ydCBFREtfVE9PTFNfUEFUSD1CQkFLRV9FREtfVE9P
TFNfUEFUSC9CYXNlVG9vbHMKKysgIGV4cG9ydCBFREtfVE9PTFNfUEFUSD0vaG9tZS9wb2t5YnVp
bGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9idWlsZC90bXAvd29yay9jb3JlMi02NC1w
b2t5LWxpbnV4L292bWYvZWRrMi1zdGFibGUyMDIyMDUtcjAvZGV2dG9vbHRtcC1hZGdsdDM5di93
b3JrZGlyL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2VkazJfYmFzZXRvb2xzL0Jhc2VU
b29scworICAgZWNobyAkRURLX1RPT0xTX1BBVEgKKyAgIHNvdXJjZSBlZGtzZXR1cC5zaCBCYXNl
VG9vbHMKKyBlbHNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYgppbmRleCA0MDU0MjIzOWUy
Li44OWQ3YmYzODMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9naXQuYmIKQEAgLTI0LDEwICsy
NCwxMSBAQCBTUkNfVVJJID0gImdpdHNtOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi5naXQ7
YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLUJh
c2VUb29scy1tYWtlZmlsZS1hZGp1c3QtdG8tYnVpbGQtaW4tdW5kZXItYml0YmFrZS5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDA1LWRlYnVnLXByZWZpeC1tYXAucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwNi1yZXByb2R1Y2libGUucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8v
MDAwNS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotUFYgPSAiZWRrMi1zdGFibGUyMDIyMDUiCi1TUkNSRVYgPSAiMTY3NzllZGUyZDM2NmJm
YzZiNzAyZTgxNzM1NmNjZjQzNDI1YmNjOCIKK1BWID0gImVkazItc3RhYmxlMjAyMjA4IgorU1JD
UkVWID0gImJhMGUwZTRjNmExNzRiNzFiMThjY2Q2ZTQ3MzE5Y2M0NTg3ODg5M2MiCiBVUFNUUkVB
TV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj5lZGsyLXN0YWJsZS4qKSIKIAogaW5oZXJp
dCBkZXBsb3kKLS0gCjIuMzEuMQoK

--===============0344884448901228816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 2 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cfd32438881533184b7d9cc48c4af95998f3e714"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 15 Mirrors 0 Missed 11 Current 237 (57% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 806 of 1137 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: Running task 820 of 1137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-edk2-stable202208-r0: task do_fetch: Started
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_fetch: Started
NOTE: recipe ovmf-edk2-stable202208-r0: task do_fetch: Succeeded
NOTE: Running task 1114 of 1137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: recipe ovmf-edk2-stable202208-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_fetch: Succeeded
NOTE: Running task 1115 of 1137 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: Running task 1116 of 1137 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ovmf-edk2-stable202208-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 1137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_patch)
NOTE: recipe ovmf-edk2-stable202208-r0: task do_patch: Started
NOTE: recipe ovmf-edk2-stable202208-r0: task do_patch: Failed
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1117 tasks of which 1111 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ovmf-edk2-stable202208-r0 do_patch: Applying patch '0005-Committing-changes-from-do_patch.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ovmf/edk2-stable202208-r0/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ovmf/edk2-stable202208-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0005-Committing-changes-from-do_patch.patch
patching file BaseTools/Source/C/Makefiles/app.makefile
Hunk #1 FAILED at 10 (different line endings).
1 out of 1 hunk FAILED -- rejects in file BaseTools/Source/C/Makefiles/app.makefile
patching file BaseTools/Source/C/VfrCompile/GNUmakefile
Hunk #1 FAILED at 18 (different line endings).
1 out of 1 hunk FAILED -- rejects in file BaseTools/Source/C/VfrCompile/GNUmakefile
patching file OvmfPkg/build.sh
Patch 0005-Committing-changes-from-do_patch.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ovmf/edk2-stable202208-r0/temp/log.do_patch.2812396
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_patch) failed with exit code '1'

--===============0344884448901228816==--

