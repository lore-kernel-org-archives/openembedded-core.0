Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A4EC678D6
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.145430.1671136350557849656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Pl20QaMP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185177d179b-dbd84d68-e410-43bb-a5d2-0f02a59e9867-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c61xZWTLcHDKJP6wYpszODSExrLZzP5/t6W/P+DkF5c=;
	b=Pl20QaMPTrrDoVdrlQNt4Q0teN+Nd1uynXnj/zQlsdXcYDgMR6nyKhDtwpV1XWId
	PeS2J46jK03lw8F0mHP1g/3MJYW3sDdyVdJKSOqIbpvbc4kTtZWT6LwfaKgiR2e7lCW
	ftCNV5BFEX0aD19SjPBaP5FDfR8+Dq9Mam1g13iQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c61xZWTLcHDKJP6wYpszODSExrLZzP5/t6W/P+DkF5c=;
	b=Tlqu7M0LNyxJY0MmuyZngB1S1qlr8VuUNdidXeodoAVos1xX4lRLyTXg/rdO15DB
	8BH8XBM8Em4nVxJeqDMazDdYMgQ2o/UdHGnPf6No8qAVjbRVuoQBytQOH3pXjQi0J0x
	9g82d4h7ka52W3yrveN/KGeUTm1qAxGU9JDqe/Ns=
Content-Type: multipart/mixed; boundary="===============3940732717221806044=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libarchive: upgrading to 3.6.2 FAILED
Message-ID: <01010185177d179b-dbd84d68-e410-43bb-a5d2-0f02a59e9867-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174668

--===============3940732717221806044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libarchive* to *3.6.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libarchive-upgrade-3.6.1-3.6.2.patch
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
--===============3940732717221806044==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libarchive-upgrade-3.6.1-3.6.2.patch"

RnJvbSA2M2MxNjE2ZDMxYTY2ZTdiYmMyMzJkNmI5MjhkMDU1MDYyNTNiODIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTI6NTQ6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhcmNoaXZlOiB1cGdyYWRlIDMuNi4xIC0+IDMuNi4yCgotLS0KIC4uLnQtaW5jbHVkZS1zeXMt
bW91bnQuaC13aGVuLWxpbnV4LWZzLi5wYXRjaCB8IDQ3IC0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
L2xpYmFyY2hpdmUvY3ZlLTIwMjItMzYyMjcucGF0Y2ggICAgICAgICAgIHwgNDggLS0tLS0tLS0t
LS0tLS0tLS0tLQogLi4uaWJhcmNoaXZlXzMuNi4xLmJiID0+IGxpYmFyY2hpdmVfMy42LjIuYmJ9
IHwgIDcgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTAwIGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZl
L2xpYmFyY2hpdmUvMDAwMS1saWJhcmNoaXZlLURvLW5vdC1pbmNsdWRlLXN5cy1tb3VudC5oLXdo
ZW4tbGludXgtZnMuLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9jdmUtMjAyMi0zNjIyNy5wYXRjaAogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL3tsaWJhcmNoaXZlXzMuNi4xLmJiID0+IGxp
YmFyY2hpdmVfMy42LjIuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS8wMDAxLWxpYmFyY2hpdmUtRG8tbm90LWluY2x1ZGUt
c3lzLW1vdW50Lmgtd2hlbi1saW51eC1mcy4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGliYXJjaGl2ZS9saWJhcmNoaXZlLzAwMDEtbGliYXJjaGl2ZS1Eby1ub3QtaW5jbHVkZS1zeXMt
bW91bnQuaC13aGVuLWxpbnV4LWZzLi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMGQyMTc5OTY4Mi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGli
YXJjaGl2ZS9saWJhcmNoaXZlLzAwMDEtbGliYXJjaGl2ZS1Eby1ub3QtaW5jbHVkZS1zeXMtbW91
bnQuaC13aGVuLWxpbnV4LWZzLi5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ3ICswLDAgQEAK
LUZyb20gYTJmNjgyNjNhMWRhNWFkMjI3YmNiOWNkOGZhOTFiOTNjOGI2Yzk5ZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRl
OiBNb24sIDI1IEp1bCAyMDIyIDEwOjU2OjUzIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxpYmFy
Y2hpdmU6IERvIG5vdCBpbmNsdWRlIHN5cy9tb3VudC5oIHdoZW4gbGludXgvZnMuaCBpcwotIHBy
ZXNlbnQKLQotVGhlc2UgaGVhZGVycyBhcmUgaW4gY29uZmxpY3QgYW5kIG9ubHkgb25lIGlzIG5l
ZWRlZCBieQotYXJjaGl2ZV9yZWFkX2Rpc2tfcG9zaXguYyB0aGVyZWZvcmUgaW5jbHVkZSBsaW51
eC9mcy5oIGlmIGl0IGV4aXN0cwotb3RoZXJ3aXNlIGluY2x1ZGUgc3lzL21vdW50LmgKLQotSXQg
YWxzbyBoZWxwcyBjb21waWxpbmcgd2l0aCBnbGliYyAyLjM2Ci13aGVyZSBzeXMvbW91bnQuaCBj
b25mbGljdHMgd2l0aCBsaW51eC9tb3VudC5oIHNlZSBbMV0KLQotWzFdIGh0dHBzOi8vc291cmNl
d2FyZS5vcmcvZ2xpYmMvd2lraS9SZWxlYXNlLzIuMzYKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJt
aXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9saWJhcmNoaXZlL2xpYmFyY2hpdmUvcHVsbC8xNzYx
XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIGxp
YmFyY2hpdmUvYXJjaGl2ZV9yZWFkX2Rpc2tfcG9zaXguYyB8IDUgKystLS0KLSAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvbGli
YXJjaGl2ZS9hcmNoaXZlX3JlYWRfZGlza19wb3NpeC5jIGIvbGliYXJjaGl2ZS9hcmNoaXZlX3Jl
YWRfZGlza19wb3NpeC5jCi1pbmRleCAyYjM5ZTY3Mi4uYTk2MDA4ZGIgMTAwNjQ0Ci0tLS0gYS9s
aWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9kaXNrX3Bvc2l4LmMKLSsrKyBiL2xpYmFyY2hpdmUvYXJj
aGl2ZV9yZWFkX2Rpc2tfcG9zaXguYwotQEAgLTM0LDkgKzM0LDYgQEAgX19GQlNESUQoIiRGcmVl
QlNEJCIpOwotICNpZmRlZiBIQVZFX1NZU19QQVJBTV9ICi0gI2luY2x1ZGUgPHN5cy9wYXJhbS5o
PgotICNlbmRpZgotLSNpZmRlZiBIQVZFX1NZU19NT1VOVF9ICi0tI2luY2x1ZGUgPHN5cy9tb3Vu
dC5oPgotLSNlbmRpZgotICNpZmRlZiBIQVZFX1NZU19TVEFUX0gKLSAjaW5jbHVkZSA8c3lzL3N0
YXQuaD4KLSAjZW5kaWYKLUBAIC01NCw2ICs1MSw4IEBAIF9fRkJTRElEKCIkRnJlZUJTRCQiKTsK
LSAjZW5kaWYKLSAjaWZkZWYgSEFWRV9MSU5VWF9GU19ICi0gI2luY2x1ZGUgPGxpbnV4L2ZzLmg+
Ci0rI2VsaWYgSEFWRV9TWVNfTU9VTlRfSAotKyNpbmNsdWRlIDxzeXMvbW91bnQuaD4KLSAjZW5k
aWYKLSAvKgotICAqIFNvbWUgTGludXggZGlzdHJpYnV0aW9ucyBoYXZlIGJvdGggbGludXgvZXh0
Ml9mcy5oIGFuZCBleHQyZnMvZXh0Ml9mcy5oLgotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9jdmUtMjAyMi0zNjIy
Ny5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvY3Zl
LTIwMjItMzYyMjcucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDRkMTNiZjY0
OTIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGli
YXJjaGl2ZS9jdmUtMjAyMi0zNjIyNy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ4ICswLDAg
QEAKLUZyb20gYmZmMzhlZmU4YzExMDQ2OWM1MDgwZDM4N2JlYzYyYTZjYTE1YjFhNSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IG9iaXdhYyA8b2Jpd2FjQGdtYWlsLmNvbT4KLURhdGU6
IEZyaSwgMjIgSnVsIDIwMjIgMjI6NDE6MTAgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gbGliYXJj
aGl2ZTogSGFuZGxlIGEgYGNhbGxvY2AgcmV0dXJuaW5nIE5VTEwgKGZpeGVzICMxNzU0KQotCi0t
LS0KLSBsaWJhcmNoaXZlL2FyY2hpdmVfd3JpdGUuYyB8IDggKysrKysrKysKLSAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspCi0KLS0tLQotQ1ZFOiBDVkUtMjAyMi0zNjIyNwotCi1Tb3Vy
Y2UtUmVwbzogaHR0cHM6Ly9naXRodWIuY29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS5naXQKLQot
VXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbYmZmMzhlZmU4Yy4uLiB1bm1vZGlmaWVkXQotCi1T
aWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+Ci0KLS0t
LQotZGlmZiAtLWdpdCBhL2xpYmFyY2hpdmUvYXJjaGl2ZV93cml0ZS5jIGIvbGliYXJjaGl2ZS9h
cmNoaXZlX3dyaXRlLmMKLWluZGV4IDY2NTkyZTgyLi4yNzYyNmI1NCAxMDA2NDQKLS0tLSBhL2xp
YmFyY2hpdmUvYXJjaGl2ZV93cml0ZS5jCi0rKysgYi9saWJhcmNoaXZlL2FyY2hpdmVfd3JpdGUu
YwotQEAgLTIwMSw2ICsyMDEsMTAgQEAgX19hcmNoaXZlX3dyaXRlX2FsbG9jYXRlX2ZpbHRlcihz
dHJ1Y3QgYXJjaGl2ZSAqX2EpCi0gCXN0cnVjdCBhcmNoaXZlX3dyaXRlX2ZpbHRlciAqZjsKLSAK
LSAJZiA9IGNhbGxvYygxLCBzaXplb2YoKmYpKTsKLSsKLSsJaWYgKGYgPT0gTlVMTCkKLSsJCXJl
dHVybiAoTlVMTCk7Ci0rCi0gCWYtPmFyY2hpdmUgPSBfYTsKLSAJZi0+c3RhdGUgPSBBUkNISVZF
X1dSSVRFX0ZJTFRFUl9TVEFURV9ORVc7Ci0gCWlmIChhLT5maWx0ZXJfZmlyc3QgPT0gTlVMTCkK
LUBAIC01NDgsNiArNTUyLDEwIEBAIGFyY2hpdmVfd3JpdGVfb3BlbjIoc3RydWN0IGFyY2hpdmUg
Kl9hLCB2b2lkICpjbGllbnRfZGF0YSwKLSAJYS0+Y2xpZW50X2RhdGEgPSBjbGllbnRfZGF0YTsK
LSAKLSAJY2xpZW50X2ZpbHRlciA9IF9fYXJjaGl2ZV93cml0ZV9hbGxvY2F0ZV9maWx0ZXIoX2Ep
OwotKwotKwlpZiAoY2xpZW50X2ZpbHRlciA9PSBOVUxMKQotKwkJcmV0dXJuIChBUkNISVZFX0ZB
VEFMKTsKLSsKLSAJY2xpZW50X2ZpbHRlci0+b3BlbiA9IGFyY2hpdmVfd3JpdGVfY2xpZW50X29w
ZW47Ci0gCWNsaWVudF9maWx0ZXItPndyaXRlID0gYXJjaGl2ZV93cml0ZV9jbGllbnRfd3JpdGU7
Ci0gCWNsaWVudF9maWx0ZXItPmNsb3NlID0gYXJjaGl2ZV93cml0ZV9jbGllbnRfY2xvc2U7Ci0t
LSAKLTIuMzguMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2
ZS9saWJhcmNoaXZlXzMuNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUv
bGliYXJjaGl2ZV8zLjYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNi4xLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNi4yLmJiCmlu
ZGV4IGM4MTIwMzgzNTIuLmJhMGU2N2NhMTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy42LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjYuMi5iYgpAQCAtMzIsMTMgKzMyLDEwIEBA
IFBBQ0tBR0VDT05GSUdbenN0ZF0gPSAiLS13aXRoLXpzdGQsLS13aXRob3V0LXpzdGQsenN0ZCwi
CiAKIEVYVFJBX09FQ09ORiArPSAiLS1lbmFibGUtbGFyZ2VmaWxlIgogCi1TUkNfVVJJID0gImh0
dHA6Ly9saWJhcmNoaXZlLm9yZy9kb3dubG9hZHMvbGliYXJjaGl2ZS0ke1BWfS50YXIuZ3ogXAot
ICAgICAgICAgICBmaWxlOi8vMDAwMS1saWJhcmNoaXZlLURvLW5vdC1pbmNsdWRlLXN5cy1tb3Vu
dC5oLXdoZW4tbGludXgtZnMuLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL2N2ZS0yMDIyLTM2
MjI3LnBhdGNoIFwKLSAgICAgICAgICAgIgorU1JDX1VSSSA9ICJodHRwOi8vbGliYXJjaGl2ZS5v
cmcvZG93bmxvYWRzL2xpYmFyY2hpdmUtJHtQVn0udGFyLmd6IgogVVBTVFJFQU1fQ0hFQ0tfVVJJ
ID0gImh0dHA6Ly9saWJhcmNoaXZlLm9yZy8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNjc2
MTQ2NTc3ZDk4OTE4OTk0MGYxOTU5ZDllMzk4MGQyODUxM2Q3NGVlZGZiYzZiN2YxNWVhNDVmZTU0
ZWUyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJhNmQwMmYxNWJhMDRhYmE5YzIzZmQ1ZjIzNmJi
MjM0ZWFiOWQ1MjA5ZTk1ZDFjNGRmODVjNDRkNWYxOWI5YjMiCiAKIGluaGVyaXQgYXV0b3Rvb2xz
IHVwZGF0ZS1hbHRlcm5hdGl2ZXMgcGtnY29uZmlnCiAKLS0gCjIuMzcuMwoK

--===============3940732717221806044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:fa9ce52566c038989bc671bbeb7b55f64cd697e6"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 19 Mirrors 0 Missed 34 Current 135 (35% match, 81% complete)
Removing 11 stale sstate objects for arch qemux86...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 144 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 147 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 153 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 156 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 159 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 166 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 171 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_stash_locale_setscene)
NOTE: Running setscene task 172 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 173 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 176 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 177 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running noexec task 288 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_fetch)
NOTE: Running task 388 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running noexec task 390 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 551 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_stash_locale_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 561 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: Running task 562 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 563 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_fetch)
NOTE: Running task 564 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 565 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: Running task 566 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 567 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.6.2-r0: task do_fetch: Started
NOTE: Running task 568 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 569 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 570 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 571 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 572 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: recipe xz-5.2.9-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: Running task 573 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_unpack)
NOTE: recipe linux-libc-headers-5.19-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: Running task 574 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_unpack)
NOTE: Running task 575 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 576 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 577 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 578 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 579 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe libarchive-native-3.6.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.36-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 184 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: Running setscene task 185 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 580 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe xz-5.2.9-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 581 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: recipe libgcc-initial-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 582 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 583 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe linux-libc-headers-5.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 584 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 585 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe libarchive-native-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 586 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_fetch)
NOTE: recipe xz-5.2.9-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe libgcc-initial-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: Running setscene task 186 of 188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libarchive-native-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 588 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe xz-5.2.9-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_fetch: Started
NOTE: Running task 591 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 592 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_lic)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libarchive-native-3.6.2-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_lic: Started
NOTE: recipe libarchive-native-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 595 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 596 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 597 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libarchive-native-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 598 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_fetch: Succeeded
NOTE: Running task 599 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_unpack: Started
NOTE: Running task 602 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libarchive-native-3.6.2-r0: task do_configure: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.36-r0: task do_unpack: Succeeded
NOTE: Running task 614 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_patch)
NOTE: recipe glibc-2.36-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_unpack: Succeeded
NOTE: Running task 616 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_patch)
NOTE: recipe linux-libc-headers-5.19-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_patch: Succeeded
NOTE: Running noexec task 618 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_configure)
NOTE: Running noexec task 619 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_compile)
NOTE: Running task 620 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_install)
NOTE: recipe linux-libc-headers-5.19-r0: task do_install: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_install: Succeeded
NOTE: Running task 635 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 636 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_configure)
NOTE: recipe glibc-2.36-r0: task do_configure: Started
NOTE: recipe glibc-2.36-r0: task do_configure: Succeeded
NOTE: Running task 637 of 754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_compile)
NOTE: recipe glibc-2.36-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 638 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-native-3.6.2-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 639 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-native-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-native-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 640 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: recipe libarchive-native-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-native-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 641 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 642 of 754 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-native-0.188-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/au
 h/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'quilt-native', 'zlib-native', 'autoconf-native', 'automake-native', 'pkgconfig-native', 'libarchive-native', 'curl-native', 'libmicrohttpd-native', 'sqlite3-native', 'libgcrypt-native', 'gnutls-native', 'texinfo-dummy-native', 'm4-native', 'gnu-config-native', 'zstd-native', 'bzip2-native', 'xz-native', 'openssl-native', 'libcap-native', 'libgpg-error-native', 'libunistring-native', 'libidn2-native', 'nettle-native', 'python3-native', 'gmp-native', 'perl-native', 'ncurses-native', 'util-linux-libuuid-native', 'libtirpc-native', 'libffi-native', 'gdbm-native', 'libnsl2-native', 'readline-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| Previously configured separate build directory detected, cleaning /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/build
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/elfutils-0.188/m4/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/elfutils-0.188/m4/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/elfutils-0.188/m4/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/elfutils-0.188/m4/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| autoreconf: 'config/config.sub' is updated
| autoreconf: 'config/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../elfutils-0.188/configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr 		  --exec_prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr 		  --bindir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/bin 		  --sbindir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/sbin 		  --libexecdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/libexec 		  --datadir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/share 		  --sysconfdir=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/etc 		  --sharedstatedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/com 		  --localstatedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/var 		  --libdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/lib 		  --includedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/include 		  --oldincludedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/include 		  --infodir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/share/info 		
   --mandir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		   --program-prefix=eu- --disable-static  --without-bzlib --enable-debuginfod --enable-libdebuginfod --without-lzma --without-zstd --disable-nls
| configure: WARNING: unrecognized options: --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/share/x86_64-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether make supports nested variables... (cached) yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-pc-linux-gnu
| checking for x86_64-linux-gcc... gcc
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... no
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether gcc  accepts -g... yes
| checking for gcc  option to enable C11 features... none needed
| checking whether gcc  understands -c and -o together... yes
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of gcc ... none
| checking whether the compiler supports GNU C++... yes
| checking whether g++  accepts -g... yes
| checking for g++  option to enable C++11 features... none needed
| checking dependency style of g++ ... none
| checking for x86_64-linux-ranlib... ranlib -D
| checking for bison... no
| checking for byacc... no
| checking for flex... no
| checking for lex... no
| checking for x86_64-linux-ar... ar
| checking the archiver (ar) interface... ar
| checking for x86_64-linux-readelf... readelf
| checking for x86_64-linux-nm... nm
| checking whether gcc supports __attribute__((visibility()))... yes
| checking whether gcc supports __attribute__((gcc_struct))... yes
| checking whether gcc supports -fPIC... yes
| checking whether gcc supports -fPIE... yes
| checking whether gcc supports -Wl,-z,defs... yes
| checking whether the compiler generates build-ids... yes
| checking whether gcc supports -Wl,-z,relro... yes
| checking for __thread support... yes
| checking whether gcc provides stdatomic.h... yes
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... no
| checking whether fts.h is bad when included (with LFS)... no
| checking whether to add -D_FORTIFY_SOURCE=2 or =3 to CFLAGS... yes -D_FORTIFY_SOURCE=3
| checking for library containing gzdirect... -lz
| checking for gcc  options needed to detect all undeclared functions... none needed
| checking whether memrchr is declared... yes
| checking whether rawmemchr is declared... yes
| checking whether powerof2 is declared... yes
| checking whether mempcpy is declared... yes
| checking whether reallocarray is declared... yes
| checking for process_vm_readv... yes
| checking for mremap... yes
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for error.h... yes
| checking for err.h... yes
| checking whether strerror_r is declared... yes
| checking whether strerror_r returns char *... yes
| checking for __cxa_demangle in -lstdc++... yes
| checking whether symbol versioning is supported... yes
| checking whether gcc accepts -Wstack-usage... yes
| checking whether gcc has a sane -Wlogical-op... yes
| checking whether gcc accepts -Wduplicated-cond... yes
| checking whether gcc accepts -Wnull-dereference... yes
| checking whether gcc accepts -Wimplicit-fallthrough... yes
| checking whether the compiler accepts -Wimplicit-fallthrough=5... yes
| checking whether the compiler accepts -Wtrampolines... yes
| checking whether the compiler accepts -Wno-packed-not-aligned... yes
| checking for library containing argp_parse... none required
| checking for library containing fts_close... none required
| checking for library containing _obstack_free... none required
| checking for a sed that does not truncate output... (cached) sed
| checking whether NLS is requested... no
| checking for msgfmt... no
| checking for gmsgfmt... :
| checking for xgettext... no
| checking for msgmerge... no
| checking for ld... ld
| checking if the linker (ld ) is GNU ld... yes
| checking for shared library run path origin... done
| checking 32-bit host C ABI... no
| checking how to run the C preprocessor... gcc  -E
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for ELF binary format... yes
| checking for the common suffixes of directories in the library search path... lib,lib,lib64
| checking for CFPreferencesCopyAppValue... no
| checking for CFLocaleCopyPreferredLanguages... no
| checking whether to use NLS... no
| checking size of long... (cached) 8
| checking for struct user_regs_struct... yes
| checking gcc  option for 32-bit word size... -m32
| checking for 64-bit host... yes
| checking whether gcc  -m32 makes executables we can run... no
| configure: WARNING: not running biarch tests, gcc  -m32 does not work
| checking for bunzip2... no
| configure: WARNING: No bunzip2, needed to run make check
| checking for zstd... yes
| configure: checking libdebuginfod dependencies, --disable-libdebuginfod or --enable-libdebuginfo=dummy to skip
| checking for x86_64-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for libcurl >= 7.29.0... yes
| checking for pthread_setname_np in -lpthread... yes
| configure: checking debuginfod C++11 support, --disable-debuginfod to skip
| checking whether g++  supports C++11 features by default... yes
| configure: checking debuginfod dependencies, --disable-debuginfod to skip
| checking for x86_64-linux-pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for libmicrohttpd >= 0.9.33... yes
| checking for libmicrohttpd < 0.9.51... no
| checking for sqlite3 >= 3.7.17... yes
| checking for libarchive >= 3.1.2... no
| configure: error: dependencies not found, use --disable-debuginfod to disable.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/temp/run.do_configure.2872929:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/temp/run.do_configure.2872929, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/temp/run.do_configure.2872929, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/temp/run.do_configure.2872929, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/temp/run.do_configure.2872929, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/temp/run.do_configure.2872929, line 289
NOTE: recipe elfutils-native-0.188-r0: task do_configure: Failed
NOTE: recipe glibc-2.36-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 642 tasks of which 590 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: elfutils-native-0.188-r0 do_configure: configure failed
ERROR: elfutils-native-0.188-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/temp/run.do_configure.2872929', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.188-r0/temp/log.do_configure.2872929
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure) failed with exit code '1'

--===============3940732717221806044==--

