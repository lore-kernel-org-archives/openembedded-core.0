Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A71EFCBCF
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28800.1773582115411178817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yrQ/GTUd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1CMTVgnY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019cf1bb5f25-c43e42bb-4e43-4fde-b40b-fd445126742e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qnAq3ad3Td5mPO+ylaBWTfVmOZfnGJnWd+yHeOU8Elc=;
	b=yrQ/GTUd6OSC1yv2YcbhwYHeAlnlVmCdRcUwsNtIa1UbROQGd6sU7azpvsgMuhNv
	wu7OZMJ+Y80ZZtA0wx4+71yegCqoUwyu5dojjumpz25OnukYWmCWJZYHi+UUoSgtK36
	B+aqzN0FDQhwu8KsiX1TNxe52Q//B4Bqk1QDW6r8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qnAq3ad3Td5mPO+ylaBWTfVmOZfnGJnWd+yHeOU8Elc=;
	b=1CMTVgnY2A55mGfvYyTXXGARLbm0c5OqYA6Ej0BOJp3gY8ynfxlkM23bfr0bw7+P
	3068bPIJiy4wPmgK6G428Awj4MVnT+8ppo/t3O1/aVk3i3U22hE9FyOqZZBp3LIihUn
	E3qeZKfgpXwLemRhS1IFqHlqejWIKEuz5NiXHCTg=
Content-Type: multipart/mixed; boundary="===============6624084818619932975=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.23.7 SUCCEEDED
Message-ID: <0101019cf1bb5f25-c43e42bb-4e43-4fde-b40b-fd445126742e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233136

--===============6624084818619932975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpkcGtnKiB0byAqMS4yMy43KiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBzdGVwczoKICAgIC0g
YXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1kcGtnLXVwZ3JhZGUtMS4yMy41LTEuMjMuNy5w
YXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1t
YXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2Ug
dGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5
IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQg
LXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0
ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUg
c2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVf
Tk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21h
dGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3
IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBk
YXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1
Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUy
MFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0K
RnJvbSA4ZGRkNDZlYjQ5MmUzNzNjZTViNzgzMzBlZGNkNTIzZjlhZDMxZjhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDc6MTI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cGtnOiB1cGdyYWRlIDEuMjMuNSAtPiAxLjIzLjcKCi0tLQogLi4uL2Rwa2cvZHBrZy8wMDAxLUFk
ZC1zdXBwb3J0LWZvci1yaXNjdjMyLUNQVS5wYXRjaCAgICAgfCA2ICsrKy0tLQogLi4uLzAwMDEt
YnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2ggICAgfCA1ICstLS0t
CiAuLi4vZHBrZy9kcGtnLzAwMDEtZHBrZy1TdXBwb3J0LW11c2x4MzItYnVpbGQucGF0Y2ggICAg
ICB8IDYgKysrLS0tCiAuLi5wa2ctb3B0aW9ucy1kaXJzLmMtc2V0X3Jvb3Rmcy13YXMtbm90LWNo
ZWNraW5nLS5wYXRjaCB8IDUgKy0tLS0KIC4uLi9kcGtnL2Rwa2cvMDAwMS1zY3JpcHQuYy1hdm9p
ZC11c2Utb2YtY2hyb290LnBhdGNoICAgIHwgNSArLS0tLQogLi4uLXRvLWxpbnV4LXdycy1rZXJu
ZWwtdmVyc2lvbi13aGljaC1oYXMtY2hhcmFjdGUucGF0Y2ggfCA1ICstLS0tCiAuLi51dGltZXMt
ZnVuY3Rpb24tZG9lc24tdC13b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaCB8IDUgKy0tLS0K
IC4uLi9kcGtnLzAwMDYtYWRkLW11c2xlYWJpLXRvLWtub3duLXRhcmdldC10cmlwZXRzLnBhdGNo
IHwgNiArKystLS0KIC4uLi1kZWItYnVpbGQuYy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUt
aW4tdGFyLnBhdGNoIHwgNSArLS0tLQogLi4uL2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxldF9l
bnRyeS5wYXRjaCAgICAgICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2cvYXJjaF9wbS5wYXRjaCAgICAgICAgICAgIHwgNSArLS0tLQogbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2Rwa2cvZHBrZy9ub21hbi5wYXRjaCAgICAgICAgICAgICAgfCA0ICsrLS0KIC4u
Li9kcGtnL2Rwa2cvcmVtb3ZlLXRhci1uby10aW1lc3RhbXAucGF0Y2ggICAgICAgICAgICAgIHwg
OSArKystLS0tLS0KIC4uLi9kcGtnL3tkcGtnXzEuMjMuNS5iYiA9PiBkcGtnXzEuMjMuNy5iYn0g
ICAgICAgICAgICAgIHwgMiArLQogMTQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwg
NDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cve2Rwa2df
MS4yMy41LmJiID0+IGRwa2dfMS4yMy43LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1BZGQtc3VwcG9ydC1mb3ItcmlzY3YzMi1DUFUu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtQWRkLXN1cHBvcnQt
Zm9yLXJpc2N2MzItQ1BVLnBhdGNoCmluZGV4IDg5NDNmNmMyZjAuLjc1YmM3OWFhZjggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1BZGQtc3VwcG9ydC1m
b3ItcmlzY3YzMi1DUFUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBr
Zy8wMDAxLUFkZC1zdXBwb3J0LWZvci1yaXNjdjMyLUNQVS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNWMzMzJjMmE0NjI1NTE5YTJiNjA2NWI5ZDlmYzcyNGU4NGM5YjZkNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gYThmMDExZDM3NDgxNzg2YjE1NGY4Yzg1M2ViZGFhOWM3YmM5
YzkyNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBXZWQsIDI5IEFwciAyMDIwIDIyOjAyOjIzIC0wNzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEFkZCBzdXBwb3J0IGZvciByaXNjdjMyIENQVQpAQCAtMTEsNyArMTEsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9kYXRhL2NwdXRhYmxlIGIvZGF0
YS9jcHV0YWJsZQotaW5kZXggNTc1YzAwOGUzLi43YTgwMWEwM2EgMTAwNjQ0CitpbmRleCAwZGEw
MjgxYzMuLjE0Y2I0MmYyZSAxMDA2NDQKIC0tLSBhL2RhdGEvY3B1dGFibGUKICsrKyBiL2RhdGEv
Y3B1dGFibGUKIEBAIC00Myw2ICs0Myw3IEBAIHBvd2VycGMJCXBvd2VycGMJCShwb3dlcnBjfHBw
YykJCTMyCWJpZwpAQCAtMjMsNyArMjMsNyBAQCBpbmRleCA1NzVjMDA4ZTMuLjdhODAxYTAzYSAx
MDA2NDQKICBzMzkwCQlzMzkwCQlzMzkwCQkJMzIJYmlnCiAgczM5MHgJCXMzOTB4CQlzMzkweAkJ
CTY0CWJpZwogZGlmZiAtLWdpdCBhL3NjcmlwdHMvRHBrZy9WZW5kb3IvRGViaWFuLnBtIGIvc2Ny
aXB0cy9EcGtnL1ZlbmRvci9EZWJpYW4ucG0KLWluZGV4IGVkZjk0YmMxOS4uZDc2Zjk3NDk0IDEw
MDY0NAoraW5kZXggMTVmMDg0MGY4Li41ZDQ2MmNhYWQgMTAwNjQ0CiAtLS0gYS9zY3JpcHRzL0Rw
a2cvVmVuZG9yL0RlYmlhbi5wbQogKysrIGIvc2NyaXB0cy9EcGtnL1ZlbmRvci9EZWJpYW4ucG0K
IEBAIC0yMTYsNiArMjE2LDcgQEAgc3ViIHNldF9idWlsZF9mZWF0dXJlcyB7CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0
dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9k
cGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gKaW5k
ZXggMTY2MDU5NzQyMi4uZDA4MzJjNjVhMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Rwa2cvZHBrZy8wMDAxLWJ1aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFyLWNm
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5j
LWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNTAxNDcyODY5NTYzOWYzMzg5NWZlZmY5Y2FiYWQxOTliMDYxMmM0NSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZmQzYzU0MjNiNjM3ZTUzNGExMTg0NWFmYjVlNzc2ZjFhYTUxZGI3
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhdWwgRWdnbGV0b24gPHBhdWwuZWdn
bGV0b25AbWljcm9zb2Z0LmNvbT4KIERhdGU6IFN1biwgOCBGZWIgMjAyNiAyMTozNDo1NCAtMDgw
MAogU3ViamVjdDogW1BBVENIXSBidWlsZC5jOiBpZ25vcmUgcmV0dXJuIG9mIDEgZnJvbSB0YXIg
LWNmCkBAIC01Myw2ICs1MywzIEBAIGluZGV4IGY3YTAxNTZmMS4uNjdlNzU4MTg1IDEwMDY0NAog
IH0KICAKICBzdGF0aWMgaW50bWF4X3QKLS0tIAotMi40OS4wCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1kcGtnLVN1cHBvcnQtbXVzbHgzMi1idWls
ZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1kcGtnLVN1cHBv
cnQtbXVzbHgzMi1idWlsZC5wYXRjaAppbmRleCA2N2ZjZTg5ZDgwLi40MDc4NmExZDZhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtZHBrZy1TdXBwb3J0
LW11c2x4MzItYnVpbGQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBr
Zy8wMDAxLWRwa2ctU3VwcG9ydC1tdXNseDMyLWJ1aWxkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBkZjZjNjQxZTNmYzI0OGQwYzg2NGU0ZTc1MmM0NjA5NDEyMDY3ZGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBmMTI0NTA5ODU2ZGNhMjUyNmQ1ZjMxMTI0OTBmOTcxYjU0OWZk
YmY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogc3dlZWF1biA8c3dlZS5hdW4ua2hv
ckBpbnRlbC5jb20+CiBEYXRlOiBTdW4sIDEwIFNlcCAyMDE3IDAwOjE0OjE1IC0wNzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGRwa2c6IFN1cHBvcnQgbXVzbHgzMiBidWlsZApAQCAtMTMsNyArMTMsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBzd2VlYXVuIDxzd2VlLmF1bi5raG9yQGludGVsLmNvbT4KICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvZGF0YS9vc3RhYmxl
IGIvZGF0YS9vc3RhYmxlCi1pbmRleCA4NjAzNTU3NzQuLjI4Nzc5YmVjYSAxMDA2NDQKK2luZGV4
IGVkZmEyZTBiMi4uYTQwZjdjN2ZhIDEwMDY0NAogLS0tIGEvZGF0YS9vc3RhYmxlCiArKysgYi9k
YXRhL29zdGFibGUKIEBAIC0yMSw2ICsyMSw3IEBAIGJhc2UtdWNsaWJjLWxpbnV4CWxpbnV4LXVj
bGliYwkJbGludXhbXi1dKi11Y2xpYmMKQEAgLTI1LDcgKzI1LDcgQEAgaW5kZXggODYwMzU1Nzc0
Li4yODc3OWJlY2EgMTAwNjQ0CiAgZWFiaS1nbnUtbGludXgJCWxpbnV4LWdudWVhYmkJCWxpbnV4
W14tXSotZ251ZWFiaQogIGFiaW4zMi1nbnUtbGludXgJbGludXgtZ251YWJpbjMyCQlsaW51eFte
LV0qLWdudWFiaW4zMgogZGlmZiAtLWdpdCBhL2RhdGEvdHVwbGV0YWJsZSBiL2RhdGEvdHVwbGV0
YWJsZQotaW5kZXggODJhZTM2MDRlLi43MDdkODViZGIgMTAwNjQ0CitpbmRleCA2MTY4MDI3ZGMu
LjQyMTYyYmM5MyAxMDA2NDQKIC0tLSBhL2RhdGEvdHVwbGV0YWJsZQogKysrIGIvZGF0YS90dXBs
ZXRhYmxlCiBAQCAtMjYsNiArMjYsNyBAQCBiYXNlLXVjbGliYy1saW51eC08Y3B1PgkJdWNsaWJj
LWxpbnV4LTxjcHU+CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtn
LzAwMDEtbGliLWRwa2ctb3B0aW9ucy1kaXJzLmMtc2V0X3Jvb3Rmcy13YXMtbm90LWNoZWNraW5n
LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1saWItZHBrZy1v
cHRpb25zLWRpcnMuYy1zZXRfcm9vdGZzLXdhcy1ub3QtY2hlY2tpbmctLnBhdGNoCmluZGV4IDM0
MDYwYzc0NjMuLjE2NzZjOTRlMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2cvMDAwMS1saWItZHBrZy1vcHRpb25zLWRpcnMuYy1zZXRfcm9vdGZzLXdhcy1ub3Qt
Y2hlY2tpbmctLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAw
MS1saWItZHBrZy1vcHRpb25zLWRpcnMuYy1zZXRfcm9vdGZzLXdhcy1ub3QtY2hlY2tpbmctLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMDM2Y2ZhMWVlNTNhOTAwYjRlZDQ1YmM5MWU0NWEw
NzkyNTQ3ZWVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMzc2MzFhMzU3MGU5MTg4
NTg5ODA3MTkwMjE4Zjk3OWFlMTEwMmEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
TWFyayBIYXRsZSA8bWFyay5oYXRsZUBrZXJuZWwuY3Jhc2hpbmcub3JnPgogRGF0ZTogU2F0LCAx
NyBKYW4gMjAyNiAyMDoyMDoyMyArMDAwMAogU3ViamVjdDogW1BBVENIXSBsaWIvZHBrZy9vcHRp
b25zLWRpcnMuYzogc2V0X3Jvb3RmcyB3YXMgbm90IGNoZWNraW5nCkBAIC00MSw2ICs0MSwzIEBA
IGluZGV4IDliN2ExMjJmZS4uMzQ4NjlkNzkyIDEwMDY0NAogIAlkcGtnX2RiX3NldF9kaXIoZGJf
ZGlyKTsKICAJZnJlZShkYl9kaXIpOwogIH0KLS0tIAotMi4zMC4yCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1zY3JpcHQuYy1hdm9pZC11c2Utb2Yt
Y2hyb290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLXNjcmlw
dC5jLWF2b2lkLXVzZS1vZi1jaHJvb3QucGF0Y2gKaW5kZXggZmZhMTAxNDJkZC4uOTI3Mjk1M2Iz
YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLXNjcmlw
dC5jLWF2b2lkLXVzZS1vZi1jaHJvb3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy8wMDAxLXNjcmlwdC5jLWF2b2lkLXVzZS1vZi1jaHJvb3QucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDc1NjUxM2IwMWJhMmQ0ZjBlY2ZjOTU5NTVkYmU1OTg1OTFhZDJkOWUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNlYzllNWRmM2VhYmZlNzJlYzQwMjU4Y2Y5
MmE1NWU5NzFjNzVlYmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgOCBGZWIgMjAyNiAy
MToxNzo0MyAtMDgwMAogU3ViamVjdDogW1BBVENIXSBzY3JpcHQuYzogYXZvaWQgdXNlIG9mIGNo
cm9vdApAQCAtOTIsNiArOTIsMyBAQCBpbmRleCBkZDNmM2E0YmIuLjk3ODJkMDE0MCAxMDA2NDQK
ICB9CiAgCiAgLyoqCi0tLSAKLTIuNDkuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnLzAwMDItQWRhcHQtdG8tbGludXgtd3JzLWtlcm5lbC12ZXJzaW9uLXdo
aWNoLWhhcy1jaGFyYWN0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cv
MDAwMi1BZGFwdC10by1saW51eC13cnMta2VybmVsLXZlcnNpb24td2hpY2gtaGFzLWNoYXJhY3Rl
LnBhdGNoCmluZGV4IGE0ZjBlYjdkODIuLmViMjY2ZjEwMDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMi1BZGFwdC10by1saW51eC13cnMta2VybmVsLXZl
cnNpb24td2hpY2gtaGFzLWNoYXJhY3RlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kcGtnL2Rwa2cvMDAwMi1BZGFwdC10by1saW51eC13cnMta2VybmVsLXZlcnNpb24td2hpY2gt
aGFzLWNoYXJhY3RlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzZDI3Y2NiYzM0MDljNDcz
YTRhY2JhNTZkZjE1ZTZiN2U3MWY4M2ZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
YWYzOTBhNzE5MzkxYTk3YmYzODliODkwNzNmYmQyMmM4ZDg5MGNjIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiBEYXRlOiBTdW4sIDggRmViIDIwMjYgMjE6MTE6NTYgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
QWRhcHQgdG8gbGludXgtd3JzIGtlcm5lbCB2ZXJzaW9uLCB3aGljaCBoYXMgY2hhcmFjdGVyICdf
JwpAQCAtNDAsNiArNDAsMyBAQCBpbmRleCAzMDdiNzcwNWEuLjgyNzEzYzAwOCAxMDA2NDQKICAJ
CQlyZXR1cm4gZHBrZ19wdXRfd2FybihlcnIsIF8oImludmFsaWQgY2hhcmFjdGVyIGluIHJldmlz
aW9uIG51bWJlciIpKTsKICAJfQogIAotLS0gCi0yLjQ5LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDA0LVRoZS1sdXRpbWVzLWZ1bmN0aW9uLWRvZXNu
LXQtd29yay1wcm9wZXJseS1mb3ItYWxsLXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rpb24tZG9lc24tdC13b3JrLXByb3Blcmx5
LWZvci1hbGwtcy5wYXRjaAppbmRleCA5ZTA2M2ZhOTYxLi43NzQ3ZGM4NGRhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rp
b24tZG9lc24tdC13b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rpb24tZG9lc24tdC13
b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTQxMjYw
ZDJkOTU0ZDUzYjJmZGRkMjA4NjNjZjQ3M2Q1MzAxN2RlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMmQyOWZjZTlmMDk0ZDhkOTUxM2RlNDIyNDg5NWFiZTU0NDc1ODFkNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogU3VuLCA4IEZlYiAyMDI2IDIxOjIxOjQzIC0wODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIFRoZSBsdXRpbWVzIGZ1bmN0aW9uIGRvZXNuJ3Qgd29yayBwcm9wZXJseSBmb3Ig
YWxsIHN5c3RlbXMuCkBAIC0yOSw2ICsyOSwzIEBAIGluZGV4IGI1YzZmMDM1Ni4uNmRiMmM3MTJj
IDEwMDY0NAogICNlbmRpZgogIAl9IGVsc2UgewogIAkJaWYgKHV0aW1lcyhwYXRoLCB0dikpCi0t
LSAKLTIuNDkuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtn
LzAwMDYtYWRkLW11c2xlYWJpLXRvLWtub3duLXRhcmdldC10cmlwZXRzLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDA2LWFkZC1tdXNsZWFiaS10by1rbm93bi10YXJn
ZXQtdHJpcGV0cy5wYXRjaAppbmRleCA0ZjYwYTg5YTU2Li5lODAxOTUxYTVkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDYtYWRkLW11c2xlYWJpLXRvLWtu
b3duLXRhcmdldC10cmlwZXRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtn
L2Rwa2cvMDAwNi1hZGQtbXVzbGVhYmktdG8ta25vd24tdGFyZ2V0LXRyaXBldHMucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGUzZGM2OWFhOTg3YjM3OWUyNDdkZGUzZmNlNDc5ZTQzYmU2Yzgx
YWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFhZDU2NTVjZWUyM2U2NTFkNzQ5ZDJl
YmNmZWI4OTNjZDFjYmUwMjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAzMCBEZWMgMjAxNSAyMzowNTo0MSAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBhZGQgbXVzbGVhYmkgdG8ga25vd24gdGFyZ2V0IHRyaXBl
dHMKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTogQW7DrWJhbCBMaW3Ds24gPGFuaWJh
bC5saW1vbkBsaW51eC5pbnRlbC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKIAogZGlmZiAtLWdpdCBhL2RhdGEvb3N0YWJsZSBiL2RhdGEvb3N0YWJsZQotaW5kZXggNjRm
NDI0NDkwLi44NjAzNTU3NzQgMTAwNjQ0CitpbmRleCA1ZTc0OTBmYjQuLmVkZmEyZTBiMiAxMDA2
NDQKIC0tLSBhL2RhdGEvb3N0YWJsZQogKysrIGIvZGF0YS9vc3RhYmxlCiBAQCAtMTksNiArMTks
NyBAQApAQCAtMjksNyArMjksNyBAQCBpbmRleCA2NGY0MjQ0OTAuLjg2MDM1NTc3NCAxMDA2NDQK
ICBlYWJpaGYtZ251LWxpbnV4CWxpbnV4LWdudWVhYmloZgkJbGludXhbXi1dKi1nbnVlYWJpaGYK
ICBlYWJpLWdudS1saW51eAkJbGludXgtZ251ZWFiaQkJbGludXhbXi1dKi1nbnVlYWJpCiBkaWZm
IC0tZ2l0IGEvZGF0YS90dXBsZXRhYmxlIGIvZGF0YS90dXBsZXRhYmxlCi1pbmRleCA3NDM2Zjgw
NTYuLjgyYWUzNjA0ZSAxMDA2NDQKK2luZGV4IGJjMWZjYzVhYi4uNjE2ODAyN2RjIDEwMDY0NAog
LS0tIGEvZGF0YS90dXBsZXRhYmxlCiArKysgYi9kYXRhL3R1cGxldGFibGUKIEBAIC0yNCw2ICsy
NCw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDct
ZHBrZy1kZWItYnVpbGQuYy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUtaW4tdGFyLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDA3LWRwa2ctZGViLWJ1aWxkLmMt
UmVtb3ZlLXVzYWdlLW9mLWNsYW1wLW10aW1lLWluLXRhci5wYXRjaAppbmRleCA2ZDM5ZTQzYzVm
Li5mMjNhNDkzNDU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtn
LzAwMDctZHBrZy1kZWItYnVpbGQuYy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUtaW4tdGFy
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwNy1kcGtnLWRl
Yi1idWlsZC5jLVJlbW92ZS11c2FnZS1vZi1jbGFtcC1tdGltZS1pbi10YXIucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDVjOWM0NDI3NGVjZjBlNzA0ZTFhYWRiMTAwMWQ2ZGY5ZjNjZTQwM2Eg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDliMWYwNzcxNDA2ZjY4YjdlNmM5Mjk5NTE2
OGQ2OTY0ZjliNjRiMDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlh
IDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBTdW4sIDggRmViIDIwMjYgMjE6MjU6
MDYgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZHBrZy1kZWIvYnVpbGQuYzogUmVtb3ZlIHVzYWdl
IG9mIC0tY2xhbXAtbXRpbWUgaW4gdGFyCkBAIC00Myw2ICs0MywzIEBAIGluZGV4IDI1OWM2MjUx
Yy4uZjdhMDE1NmYxIDEwMDY0NAogIAkJICAgICAgICAgICAgICAgICBOVUxMKTsKICAJCS8qIE1v
ZGUgbWlnaHQgYmVjb21lIGEgcG9zaXRpb25hbCBhcmd1bWVudCwgcGFzcyBpdAogIAkJICogYmVm
b3JlIC1ULiAqLwotLS0gCi0yLjQ5LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxldF9lbnRyeS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2cvYWRkX2FybWViX3RyaXBsZXRfZW50cnkucGF0Y2gKaW5kZXgg
ZDFmYWMyMTY4YS4uZGIxY2EwNGM5OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxldF9lbnRyeS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2FkZF9hcm1lYl90cmlwbGV0X2VudHJ5LnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA4ZGVkMzJhMzUyODdhODQwZGU3ZTUwNWM2NmU3NmNjY2Q5ZWRiYWM2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMzJlM2FhZTRiNDljZjllN2VlNDQxNmJk
ZGVhMWYxZTFmOGUzZDAxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogIktyaXNobmFu
amFuYXBwYSwgSmFnYWRlZXNoIgogIDxqYWdhZGVlc2gua3Jpc2huYW5qYW5hcHBhQGNhdml1bW5l
dHdvcmtzLmNvbT4KIERhdGU6IFdlZCwgOCBBcHIgMjAxNSAxODowODoxNCArMDUzMApAQCAtMzQs
NyArMzQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbsOtYmFsIExpbcOzbiA8YW5pYmFsLmxpbW9uQGxp
bnV4LmludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAt
LWdpdCBhL2RhdGEvdHVwbGV0YWJsZSBiL2RhdGEvdHVwbGV0YWJsZQotaW5kZXggYWU5ZjJkZGI0
Li43NDM2ZjgwNTYgMTAwNjQ0CitpbmRleCA3YzMwNmQ0OTcuLmJjMWZjYzVhYiAxMDA2NDQKIC0t
LSBhL2RhdGEvdHVwbGV0YWJsZQogKysrIGIvZGF0YS90dXBsZXRhYmxlCiBAQCAtMjcsNiArMjcs
NyBAQCBlYWJpaGYtbXVzbC1saW51eC1hcm0JCW11c2wtbGludXgtYXJtaGYKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYXJjaF9wbS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYXJjaF9wbS5wYXRjaAppbmRleCA2NzZlMDk1NmNjLi4x
ZThkYTZlODk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2Fy
Y2hfcG0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9hcmNoX3Bt
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NjE0ODJlZWY3OWU5MGY5YmU2ZjYwZjQ4YTA2
M2I2NjIyMWE4ZWExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkNWVmZTkxZjRkNDdi
MmZiM2JiMmMwOTVlYWE5ZjRkMTk3NTE2ZjAzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSm9lIFNsYXRlciA8anNsYXRlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogU3VuLCA4IEZlYiAy
MDI2IDIxOjA2OjQ0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRwa2c6IGZpeCBjb25maWd1cmF0
aW9uIGlzc3VlIGZvciBtaXBzNjQKQEAgLTMyLDYgKzMyLDMgQEAgaW5kZXggM2Q5ZTNlOTc1Li4w
NWM2ZGViYzMgMTAwNjQ0CiAgICAgICAgICAgICAgICAgICAgICAkZGViYXJjaF90b19kZWJ0dXBs
ZXskZGF9ID0gJGR0OwogICAgICAgICAgICAgICAgICAgICAgJGRlYnR1cGxlX3RvX2RlYmFyY2h7
JGR0fSA9ICRkYTsKICAgICAgICAgICAgICAgICAgfQotLS0gCi0yLjQ5LjAKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9ub21hbi5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvbm9tYW4ucGF0Y2gKaW5kZXggM2YzZTA4MzUxYy4uZWY1
ODEyZGM0MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9ub21h
bi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL25vbWFuLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlNjcxYjQzYTUyYmY1Nzg1ZmU0YWFkODQ3MTJkYmFiYzZj
ODZiMzllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmYzc1NTBlODdlM2Y1YTllNGZl
MTk0YjE1MzliZThhMjExYTE2OGM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hy
aXMgTGFyc29uIDxrZXJnb3RoQG9wZW5lZGhhbmQuY29tPgogRGF0ZTogVHVlLCA1IFNlcCAyMDA2
IDA3OjI0OjU4ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBkcGtnLCBtb2RpZmllZCBmcm9t
IHVwc3RyZWFtIG9lLgpAQCAtOSw3ICs5LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJp
YXRlIFtkaXNhYmxlIGZlYXR1cmVdCiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4IDc0ZjhkZjE5Ny4u
MzVlNWVlZTM5IDEwMDY0NAoraW5kZXggZGI0ODA3OTVmLi43MzdkOGZlOTggMTAwNjQ0CiAtLS0g
YS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KIEBAIC0xMSw3ICsxMSw2IEBAIFNVQkRJ
UlMgPSBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL3JlbW92
ZS10YXItbm8tdGltZXN0YW1wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBr
Zy9yZW1vdmUtdGFyLW5vLXRpbWVzdGFtcC5wYXRjaAppbmRleCA3NTRiNGZlZjE3Li42MjVmNGNl
M2E2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL3JlbW92ZS10
YXItbm8tdGltZXN0YW1wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rw
a2cvcmVtb3ZlLXRhci1uby10aW1lc3RhbXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE1
NTkyNDdiNzFjZTQ0OTc4YjdkYzQ5YTZmZGI1MTE2N2UyMmMwYmYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGY3MTI3ZmJiNWY4MDdlNzZlNWM5YWYxMGVhZjNkYmE0MDY1MTdhOWQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDb25zdGFudGluIE11c2NhIDxjb25zdGFudGlu
eC5tdXNjYUBpbnRlbC5jb20+CiBEYXRlOiBTdW4sIDggRmViIDIwMjYgMjE6MDM6MzAgLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gYnVzeWJveC0xLjE5LjQgdGFyIHV0aWxpdHkgZG9lc24ndCBzdXBw
b3J0CkBAIC0xNSwxMCArMTUsMTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9zcmMvZGViL2V4dHJhY3QuYyBiL3NyYy9kZWIvZXh0cmFjdC5jCi1pbmRleCBl
MDIzNDcyNmEuLmUxNTNmNzJhYiAxMDA2NDQKK2luZGV4IDE2ZDU1OWY4My4uMGNjMzkwY2U5IDEw
MDY0NAogLS0tIGEvc3JjL2RlYi9leHRyYWN0LmMKICsrKyBiL3NyYy9kZWIvZXh0cmFjdC5jCi1A
QCAtMzUzLDcgKzM1Myw2IEBAIGV4dHJhY3RoYWxmKGNvbnN0IGNoYXIgKmRlYmFyLCBjb25zdCBj
aGFyICpkaXIsCitAQCAtMzcxLDcgKzM3MSw2IEBAIGV4dHJhY3RoYWxmKGNvbnN0IGNoYXIgKmRl
YmFyLCBjb25zdCBjaGFyICpkaXIsCiAgCiAgCQkJY29tbWFuZF9hZGRfYXJnKCZjbWQsICItZiIp
OwogIAkJCWNvbW1hbmRfYWRkX2FyZygmY21kLCAiLSIpOwpAQCAtMjYsNiArMjYsMyBAQCBpbmRl
eCBlMDIzNDcyNmEuLmUxNTNmNzJhYiAxMDA2NDQKICAKICAJCQltX2R1cDIocDJbMF0sIDApOwog
IAkJCWNsb3NlKHAyWzBdKTsKLS0tIAotMi40OS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMy41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rw
a2cvZHBrZ18xLjIzLjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIzLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMy43LmJiCmluZGV4IDFkOGRkNjZlZmEuLjhlODM4YjJk
MDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMy41LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMy43LmJiCkBAIC0xOSw0
ICsxOSw0IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2EuZGViaWFuLm9yZy9kcGtnLXRlYW0vZHBr
Zy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47CiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNz
LW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10
YXItY2YucGF0Y2giCiAKLVNSQ1JFViA9ICI4OWYyNjYzMjVjYzhiNWI3ZmQxZWU0MTdiNzhkNDk4
ZWUxODk1NjViIgorU1JDUkVWID0gImVmNGQ1OWY1OTI1NjYxODE4NDg0YWM2NjYwMTRlZTNlNjY1
YWFkY2YiCi0tIAoyLjQ3LjEKCg==

--===============6624084818619932975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dpkg/dpkg-bash-completion: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-bash-completion: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-dbg: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-dbg: PKGSIZE changed from 4281288 to 4282376 (+0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-dbg: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-dev: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-dev: PKGSIZE changed from 185884 to 186054 (+0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-dev: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-doc: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-doc: PKGSIZE changed from 442470 to 441942 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-doc: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ast: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ast: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-bs: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-bs: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ca: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ca: PKGSIZE changed from 292554 to 291105 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ca: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-cs: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-cs: PKGSIZE changed from 151163 to 151079 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-cs: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-da: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-da: PKGSIZE changed from 101324 to 101247 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-da: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-de: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-de: PKGSIZE changed from 284493 to 283048 (-1%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-de: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-dz: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-dz: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-el: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-el: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-en: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-en: PKGSIZE changed from 263719 to 262377 (-1%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-en: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-eo: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-eo: PKGSIZE changed from 101661 to 101584 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-eo: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-es: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-es: PKGSIZE changed from 171466 to 171368 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-es: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-et: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-et: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-eu: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-eu: PKGSIZE changed from 105471 to 105384 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-eu: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-fr: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-fr: PKGSIZE changed from 266072 to 264553 (-1%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-fr: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-gl: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-gl: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-hu: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-hu: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-id: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-id: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-it: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-it: PKGSIZE changed from 121186 to 121110 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-it: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ja: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ja: PKGSIZE changed from 124935 to 124842 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ja: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-km: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-km: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ko: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ko: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ku: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ku: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-lt: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-lt: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-mr: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-mr: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-nb: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-nb: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ne: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ne: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-nl: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-nl: PKGSIZE changed from 271340 to 270111 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-nl: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-nn: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-nn: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-oc: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-oc: PKGSIZE changed from 62587 to 62500 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-oc: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pa: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pa: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pl: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pl: PKGSIZE changed from 189338 to 189251 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pl: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pt-br: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pt-br: PKGSIZE changed from 158558 to 158480 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pt-br: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pt: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pt: PKGSIZE changed from 296720 to 295314 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-pt: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ro: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ro: PKGSIZE changed from 166575 to 166494 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ro: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ru: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ru: PKGSIZE changed from 266239 to 266104 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-ru: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-sk: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-sk: PKGSIZE changed from 99452 to 99369 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-sk: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-sv: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-sv: PKGSIZE changed from 266587 to 287792 (+8%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-sv: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-th: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-th: PKGSIZE changed from 224557 to 224421 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-th: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-tl: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-tl: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-tr: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-tr: PKGSIZE changed from 117971 to 117884 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-tr: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-vi: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-vi: PKGSIZE changed from 120644 to 120544 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-vi: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-zh-cn: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-zh-cn: PKGSIZE changed from 139622 to 139534 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-zh-cn: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-zh-tw: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-zh-tw: PKGSIZE changed from 97678 to 97605 (-0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-locale-zh-tw: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-perl: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-perl: PKGSIZE changed from 757042 to 759732 (+0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-perl: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-ptest: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-ptest: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-src: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-src: PKGSIZE changed from 1206774 to 1207298 (+0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-src: FILELIST: directory renamed /usr/src/debug/dpkg/1.23.5/src/split -> /usr/src/debug/dpkg/1.23.7/src/split, directory renamed /usr/src/debug/dpkg/1.23.5/src/query -> /usr/src/debug/dpkg/1.23.7/src/query, directory renamed /usr/src/debug/dpkg/1.23.5/src/realpath -> /usr/src/debug/dpkg/1.23.7/src/realpath, directory renamed /usr/src/debug/dpkg/1.23.5/src/divert -> /usr/src/debug/dpkg/1.23.7/src/divert, directory renamed /usr/src/debug/dpkg/1.23.5/lib/dpkg -> /usr/src/debug/dpkg/1.23.7/lib/dpkg, directory renamed /usr/src/debug/dpkg/1.23.5/src/deb -> /usr/src/debug/dpkg/1.23.7/src/deb, directory renamed /usr/src/debug/dpkg/1.23.5/src/statoverride -> /usr/src/debug/dpkg/1.23.7/src/statoverride, directory renamed /usr/src/debug/dpkg/1.23.5/src/trigger -> /usr/src/debug/dpkg/1.23.7/src/trigger, directory renamed /usr/src/debug/dpkg/1.23.5/utils -> /usr/src/debug/dpkg/1.23.7/utils, directory renamed /usr/src/debug/dpkg/1.23.5/src/main -> /usr/src/d
 ebug/dpkg/1.23.7/src/main, directory renamed /usr/src/debug/dpkg/1.23.5/lib/compat -> /usr/src/debug/dpkg/1.23.7/lib/compat, directory renamed /usr/src/debug/dpkg/1.23.5/src/common -> /usr/src/debug/dpkg/1.23.7/src/common
packages/x86-64-v3-poky-linux/dpkg/dpkg-src: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-start-stop: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-start-stop: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg-staticdev: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg-staticdev: PKGSIZE changed from 1615574 to 1616332 (+0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg-staticdev: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/dpkg: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/dpkg: PKGSIZE changed from 1538137 to 1539111 (+0%)
packages/x86-64-v3-poky-linux/dpkg/dpkg: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg: SRC_URI changed from "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main;tag=1.23.5 file://noman.patch file://remove-tar-no-timestamp.patch file://arch_pm.patch file://add_armeb_triplet_entry.patch file://run-ptest file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch file://0001-script.c-avoid-use-of-chroot.patch file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch file://0006-add-musleabi-to-known-target-tripets.patch file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch file://0001-dpkg-Support-muslx32-build.patch file://0001-Add-support-for-riscv32-CPU.patch file://0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch" to "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main;tag=1.23.7 file://noman.patch file://remove-tar-no-timestamp.patch file://arch_pm.patch file://add_armeb_triplet_entry.patch file://run-ptest file://0002-Adapt-to-linux-wrs-kernel
 -version-which-has-characte.patch file://0001-script.c-avoid-use-of-chroot.patch file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch file://0006-add-musleabi-to-known-target-tripets.patch file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch file://0001-dpkg-Support-muslx32-build.patch file://0001-Add-support-for-riscv32-CPU.patch file://0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch"
packages/x86-64-v3-poky-linux/dpkg: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg: PV changed from "1.23.5" to "1.23.7"
packages/x86-64-v3-poky-linux/dpkg/update-alternatives-dpkg: PKGV changed from 1.23.5 [default] to 1.23.7 [default]
packages/x86-64-v3-poky-linux/dpkg/update-alternatives-dpkg: PV changed from "1.23.5" to "1.23.7"

--===============6624084818619932975==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.23.5-1.23.7.patch"

RnJvbSA4ZGRkNDZlYjQ5MmUzNzNjZTViNzgzMzBlZGNkNTIzZjlhZDMxZjhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDc6MTI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cGtnOiB1cGdyYWRlIDEuMjMuNSAtPiAxLjIzLjcKCi0tLQogLi4uL2Rwa2cvZHBrZy8wMDAxLUFk
ZC1zdXBwb3J0LWZvci1yaXNjdjMyLUNQVS5wYXRjaCAgICAgfCA2ICsrKy0tLQogLi4uLzAwMDEt
YnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2ggICAgfCA1ICstLS0t
CiAuLi4vZHBrZy9kcGtnLzAwMDEtZHBrZy1TdXBwb3J0LW11c2x4MzItYnVpbGQucGF0Y2ggICAg
ICB8IDYgKysrLS0tCiAuLi5wa2ctb3B0aW9ucy1kaXJzLmMtc2V0X3Jvb3Rmcy13YXMtbm90LWNo
ZWNraW5nLS5wYXRjaCB8IDUgKy0tLS0KIC4uLi9kcGtnL2Rwa2cvMDAwMS1zY3JpcHQuYy1hdm9p
ZC11c2Utb2YtY2hyb290LnBhdGNoICAgIHwgNSArLS0tLQogLi4uLXRvLWxpbnV4LXdycy1rZXJu
ZWwtdmVyc2lvbi13aGljaC1oYXMtY2hhcmFjdGUucGF0Y2ggfCA1ICstLS0tCiAuLi51dGltZXMt
ZnVuY3Rpb24tZG9lc24tdC13b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaCB8IDUgKy0tLS0K
IC4uLi9kcGtnLzAwMDYtYWRkLW11c2xlYWJpLXRvLWtub3duLXRhcmdldC10cmlwZXRzLnBhdGNo
IHwgNiArKystLS0KIC4uLi1kZWItYnVpbGQuYy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUt
aW4tdGFyLnBhdGNoIHwgNSArLS0tLQogLi4uL2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxldF9l
bnRyeS5wYXRjaCAgICAgICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2cvYXJjaF9wbS5wYXRjaCAgICAgICAgICAgIHwgNSArLS0tLQogbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2Rwa2cvZHBrZy9ub21hbi5wYXRjaCAgICAgICAgICAgICAgfCA0ICsrLS0KIC4u
Li9kcGtnL2Rwa2cvcmVtb3ZlLXRhci1uby10aW1lc3RhbXAucGF0Y2ggICAgICAgICAgICAgIHwg
OSArKystLS0tLS0KIC4uLi9kcGtnL3tkcGtnXzEuMjMuNS5iYiA9PiBkcGtnXzEuMjMuNy5iYn0g
ICAgICAgICAgICAgIHwgMiArLQogMTQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwg
NDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cve2Rwa2df
MS4yMy41LmJiID0+IGRwa2dfMS4yMy43LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1BZGQtc3VwcG9ydC1mb3ItcmlzY3YzMi1DUFUu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtQWRkLXN1cHBvcnQt
Zm9yLXJpc2N2MzItQ1BVLnBhdGNoCmluZGV4IDg5NDNmNmMyZjAuLjc1YmM3OWFhZjggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1BZGQtc3VwcG9ydC1m
b3ItcmlzY3YzMi1DUFUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBr
Zy8wMDAxLUFkZC1zdXBwb3J0LWZvci1yaXNjdjMyLUNQVS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNWMzMzJjMmE0NjI1NTE5YTJiNjA2NWI5ZDlmYzcyNGU4NGM5YjZkNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gYThmMDExZDM3NDgxNzg2YjE1NGY4Yzg1M2ViZGFhOWM3YmM5
YzkyNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBXZWQsIDI5IEFwciAyMDIwIDIyOjAyOjIzIC0wNzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEFkZCBzdXBwb3J0IGZvciByaXNjdjMyIENQVQpAQCAtMTEsNyArMTEsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9kYXRhL2NwdXRhYmxlIGIvZGF0
YS9jcHV0YWJsZQotaW5kZXggNTc1YzAwOGUzLi43YTgwMWEwM2EgMTAwNjQ0CitpbmRleCAwZGEw
MjgxYzMuLjE0Y2I0MmYyZSAxMDA2NDQKIC0tLSBhL2RhdGEvY3B1dGFibGUKICsrKyBiL2RhdGEv
Y3B1dGFibGUKIEBAIC00Myw2ICs0Myw3IEBAIHBvd2VycGMJCXBvd2VycGMJCShwb3dlcnBjfHBw
YykJCTMyCWJpZwpAQCAtMjMsNyArMjMsNyBAQCBpbmRleCA1NzVjMDA4ZTMuLjdhODAxYTAzYSAx
MDA2NDQKICBzMzkwCQlzMzkwCQlzMzkwCQkJMzIJYmlnCiAgczM5MHgJCXMzOTB4CQlzMzkweAkJ
CTY0CWJpZwogZGlmZiAtLWdpdCBhL3NjcmlwdHMvRHBrZy9WZW5kb3IvRGViaWFuLnBtIGIvc2Ny
aXB0cy9EcGtnL1ZlbmRvci9EZWJpYW4ucG0KLWluZGV4IGVkZjk0YmMxOS4uZDc2Zjk3NDk0IDEw
MDY0NAoraW5kZXggMTVmMDg0MGY4Li41ZDQ2MmNhYWQgMTAwNjQ0CiAtLS0gYS9zY3JpcHRzL0Rw
a2cvVmVuZG9yL0RlYmlhbi5wbQogKysrIGIvc2NyaXB0cy9EcGtnL1ZlbmRvci9EZWJpYW4ucG0K
IEBAIC0yMTYsNiArMjE2LDcgQEAgc3ViIHNldF9idWlsZF9mZWF0dXJlcyB7CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0
dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9k
cGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gKaW5k
ZXggMTY2MDU5NzQyMi4uZDA4MzJjNjVhMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Rwa2cvZHBrZy8wMDAxLWJ1aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFyLWNm
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5j
LWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNTAxNDcyODY5NTYzOWYzMzg5NWZlZmY5Y2FiYWQxOTliMDYxMmM0NSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZmQzYzU0MjNiNjM3ZTUzNGExMTg0NWFmYjVlNzc2ZjFhYTUxZGI3
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhdWwgRWdnbGV0b24gPHBhdWwuZWdn
bGV0b25AbWljcm9zb2Z0LmNvbT4KIERhdGU6IFN1biwgOCBGZWIgMjAyNiAyMTozNDo1NCAtMDgw
MAogU3ViamVjdDogW1BBVENIXSBidWlsZC5jOiBpZ25vcmUgcmV0dXJuIG9mIDEgZnJvbSB0YXIg
LWNmCkBAIC01Myw2ICs1MywzIEBAIGluZGV4IGY3YTAxNTZmMS4uNjdlNzU4MTg1IDEwMDY0NAog
IH0KICAKICBzdGF0aWMgaW50bWF4X3QKLS0tIAotMi40OS4wCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1kcGtnLVN1cHBvcnQtbXVzbHgzMi1idWls
ZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1kcGtnLVN1cHBv
cnQtbXVzbHgzMi1idWlsZC5wYXRjaAppbmRleCA2N2ZjZTg5ZDgwLi40MDc4NmExZDZhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtZHBrZy1TdXBwb3J0
LW11c2x4MzItYnVpbGQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBr
Zy8wMDAxLWRwa2ctU3VwcG9ydC1tdXNseDMyLWJ1aWxkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBkZjZjNjQxZTNmYzI0OGQwYzg2NGU0ZTc1MmM0NjA5NDEyMDY3ZGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBmMTI0NTA5ODU2ZGNhMjUyNmQ1ZjMxMTI0OTBmOTcxYjU0OWZk
YmY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogc3dlZWF1biA8c3dlZS5hdW4ua2hv
ckBpbnRlbC5jb20+CiBEYXRlOiBTdW4sIDEwIFNlcCAyMDE3IDAwOjE0OjE1IC0wNzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGRwa2c6IFN1cHBvcnQgbXVzbHgzMiBidWlsZApAQCAtMTMsNyArMTMsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBzd2VlYXVuIDxzd2VlLmF1bi5raG9yQGludGVsLmNvbT4KICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvZGF0YS9vc3RhYmxl
IGIvZGF0YS9vc3RhYmxlCi1pbmRleCA4NjAzNTU3NzQuLjI4Nzc5YmVjYSAxMDA2NDQKK2luZGV4
IGVkZmEyZTBiMi4uYTQwZjdjN2ZhIDEwMDY0NAogLS0tIGEvZGF0YS9vc3RhYmxlCiArKysgYi9k
YXRhL29zdGFibGUKIEBAIC0yMSw2ICsyMSw3IEBAIGJhc2UtdWNsaWJjLWxpbnV4CWxpbnV4LXVj
bGliYwkJbGludXhbXi1dKi11Y2xpYmMKQEAgLTI1LDcgKzI1LDcgQEAgaW5kZXggODYwMzU1Nzc0
Li4yODc3OWJlY2EgMTAwNjQ0CiAgZWFiaS1nbnUtbGludXgJCWxpbnV4LWdudWVhYmkJCWxpbnV4
W14tXSotZ251ZWFiaQogIGFiaW4zMi1nbnUtbGludXgJbGludXgtZ251YWJpbjMyCQlsaW51eFte
LV0qLWdudWFiaW4zMgogZGlmZiAtLWdpdCBhL2RhdGEvdHVwbGV0YWJsZSBiL2RhdGEvdHVwbGV0
YWJsZQotaW5kZXggODJhZTM2MDRlLi43MDdkODViZGIgMTAwNjQ0CitpbmRleCA2MTY4MDI3ZGMu
LjQyMTYyYmM5MyAxMDA2NDQKIC0tLSBhL2RhdGEvdHVwbGV0YWJsZQogKysrIGIvZGF0YS90dXBs
ZXRhYmxlCiBAQCAtMjYsNiArMjYsNyBAQCBiYXNlLXVjbGliYy1saW51eC08Y3B1PgkJdWNsaWJj
LWxpbnV4LTxjcHU+CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtn
LzAwMDEtbGliLWRwa2ctb3B0aW9ucy1kaXJzLmMtc2V0X3Jvb3Rmcy13YXMtbm90LWNoZWNraW5n
LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1saWItZHBrZy1v
cHRpb25zLWRpcnMuYy1zZXRfcm9vdGZzLXdhcy1ub3QtY2hlY2tpbmctLnBhdGNoCmluZGV4IDM0
MDYwYzc0NjMuLjE2NzZjOTRlMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2cvMDAwMS1saWItZHBrZy1vcHRpb25zLWRpcnMuYy1zZXRfcm9vdGZzLXdhcy1ub3Qt
Y2hlY2tpbmctLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAw
MS1saWItZHBrZy1vcHRpb25zLWRpcnMuYy1zZXRfcm9vdGZzLXdhcy1ub3QtY2hlY2tpbmctLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMDM2Y2ZhMWVlNTNhOTAwYjRlZDQ1YmM5MWU0NWEw
NzkyNTQ3ZWVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMzc2MzFhMzU3MGU5MTg4
NTg5ODA3MTkwMjE4Zjk3OWFlMTEwMmEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
TWFyayBIYXRsZSA8bWFyay5oYXRsZUBrZXJuZWwuY3Jhc2hpbmcub3JnPgogRGF0ZTogU2F0LCAx
NyBKYW4gMjAyNiAyMDoyMDoyMyArMDAwMAogU3ViamVjdDogW1BBVENIXSBsaWIvZHBrZy9vcHRp
b25zLWRpcnMuYzogc2V0X3Jvb3RmcyB3YXMgbm90IGNoZWNraW5nCkBAIC00MSw2ICs0MSwzIEBA
IGluZGV4IDliN2ExMjJmZS4uMzQ4NjlkNzkyIDEwMDY0NAogIAlkcGtnX2RiX3NldF9kaXIoZGJf
ZGlyKTsKICAJZnJlZShkYl9kaXIpOwogIH0KLS0tIAotMi4zMC4yCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1zY3JpcHQuYy1hdm9pZC11c2Utb2Yt
Y2hyb290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLXNjcmlw
dC5jLWF2b2lkLXVzZS1vZi1jaHJvb3QucGF0Y2gKaW5kZXggZmZhMTAxNDJkZC4uOTI3Mjk1M2Iz
YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLXNjcmlw
dC5jLWF2b2lkLXVzZS1vZi1jaHJvb3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy8wMDAxLXNjcmlwdC5jLWF2b2lkLXVzZS1vZi1jaHJvb3QucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDc1NjUxM2IwMWJhMmQ0ZjBlY2ZjOTU5NTVkYmU1OTg1OTFhZDJkOWUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNlYzllNWRmM2VhYmZlNzJlYzQwMjU4Y2Y5
MmE1NWU5NzFjNzVlYmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgOCBGZWIgMjAyNiAy
MToxNzo0MyAtMDgwMAogU3ViamVjdDogW1BBVENIXSBzY3JpcHQuYzogYXZvaWQgdXNlIG9mIGNo
cm9vdApAQCAtOTIsNiArOTIsMyBAQCBpbmRleCBkZDNmM2E0YmIuLjk3ODJkMDE0MCAxMDA2NDQK
ICB9CiAgCiAgLyoqCi0tLSAKLTIuNDkuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnLzAwMDItQWRhcHQtdG8tbGludXgtd3JzLWtlcm5lbC12ZXJzaW9uLXdo
aWNoLWhhcy1jaGFyYWN0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cv
MDAwMi1BZGFwdC10by1saW51eC13cnMta2VybmVsLXZlcnNpb24td2hpY2gtaGFzLWNoYXJhY3Rl
LnBhdGNoCmluZGV4IGE0ZjBlYjdkODIuLmViMjY2ZjEwMDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMi1BZGFwdC10by1saW51eC13cnMta2VybmVsLXZl
cnNpb24td2hpY2gtaGFzLWNoYXJhY3RlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kcGtnL2Rwa2cvMDAwMi1BZGFwdC10by1saW51eC13cnMta2VybmVsLXZlcnNpb24td2hpY2gt
aGFzLWNoYXJhY3RlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzZDI3Y2NiYzM0MDljNDcz
YTRhY2JhNTZkZjE1ZTZiN2U3MWY4M2ZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
YWYzOTBhNzE5MzkxYTk3YmYzODliODkwNzNmYmQyMmM4ZDg5MGNjIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiBEYXRlOiBTdW4sIDggRmViIDIwMjYgMjE6MTE6NTYgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
QWRhcHQgdG8gbGludXgtd3JzIGtlcm5lbCB2ZXJzaW9uLCB3aGljaCBoYXMgY2hhcmFjdGVyICdf
JwpAQCAtNDAsNiArNDAsMyBAQCBpbmRleCAzMDdiNzcwNWEuLjgyNzEzYzAwOCAxMDA2NDQKICAJ
CQlyZXR1cm4gZHBrZ19wdXRfd2FybihlcnIsIF8oImludmFsaWQgY2hhcmFjdGVyIGluIHJldmlz
aW9uIG51bWJlciIpKTsKICAJfQogIAotLS0gCi0yLjQ5LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDA0LVRoZS1sdXRpbWVzLWZ1bmN0aW9uLWRvZXNu
LXQtd29yay1wcm9wZXJseS1mb3ItYWxsLXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rpb24tZG9lc24tdC13b3JrLXByb3Blcmx5
LWZvci1hbGwtcy5wYXRjaAppbmRleCA5ZTA2M2ZhOTYxLi43NzQ3ZGM4NGRhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rp
b24tZG9lc24tdC13b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDQtVGhlLWx1dGltZXMtZnVuY3Rpb24tZG9lc24tdC13
b3JrLXByb3Blcmx5LWZvci1hbGwtcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTQxMjYw
ZDJkOTU0ZDUzYjJmZGRkMjA4NjNjZjQ3M2Q1MzAxN2RlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMmQyOWZjZTlmMDk0ZDhkOTUxM2RlNDIyNDg5NWFiZTU0NDc1ODFkNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogU3VuLCA4IEZlYiAyMDI2IDIxOjIxOjQzIC0wODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIFRoZSBsdXRpbWVzIGZ1bmN0aW9uIGRvZXNuJ3Qgd29yayBwcm9wZXJseSBmb3Ig
YWxsIHN5c3RlbXMuCkBAIC0yOSw2ICsyOSwzIEBAIGluZGV4IGI1YzZmMDM1Ni4uNmRiMmM3MTJj
IDEwMDY0NAogICNlbmRpZgogIAl9IGVsc2UgewogIAkJaWYgKHV0aW1lcyhwYXRoLCB0dikpCi0t
LSAKLTIuNDkuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtn
LzAwMDYtYWRkLW11c2xlYWJpLXRvLWtub3duLXRhcmdldC10cmlwZXRzLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDA2LWFkZC1tdXNsZWFiaS10by1rbm93bi10YXJn
ZXQtdHJpcGV0cy5wYXRjaAppbmRleCA0ZjYwYTg5YTU2Li5lODAxOTUxYTVkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDYtYWRkLW11c2xlYWJpLXRvLWtu
b3duLXRhcmdldC10cmlwZXRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtn
L2Rwa2cvMDAwNi1hZGQtbXVzbGVhYmktdG8ta25vd24tdGFyZ2V0LXRyaXBldHMucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGUzZGM2OWFhOTg3YjM3OWUyNDdkZGUzZmNlNDc5ZTQzYmU2Yzgx
YWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFhZDU2NTVjZWUyM2U2NTFkNzQ5ZDJl
YmNmZWI4OTNjZDFjYmUwMjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAzMCBEZWMgMjAxNSAyMzowNTo0MSAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBhZGQgbXVzbGVhYmkgdG8ga25vd24gdGFyZ2V0IHRyaXBl
dHMKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTogQW7DrWJhbCBMaW3Ds24gPGFuaWJh
bC5saW1vbkBsaW51eC5pbnRlbC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKIAogZGlmZiAtLWdpdCBhL2RhdGEvb3N0YWJsZSBiL2RhdGEvb3N0YWJsZQotaW5kZXggNjRm
NDI0NDkwLi44NjAzNTU3NzQgMTAwNjQ0CitpbmRleCA1ZTc0OTBmYjQuLmVkZmEyZTBiMiAxMDA2
NDQKIC0tLSBhL2RhdGEvb3N0YWJsZQogKysrIGIvZGF0YS9vc3RhYmxlCiBAQCAtMTksNiArMTks
NyBAQApAQCAtMjksNyArMjksNyBAQCBpbmRleCA2NGY0MjQ0OTAuLjg2MDM1NTc3NCAxMDA2NDQK
ICBlYWJpaGYtZ251LWxpbnV4CWxpbnV4LWdudWVhYmloZgkJbGludXhbXi1dKi1nbnVlYWJpaGYK
ICBlYWJpLWdudS1saW51eAkJbGludXgtZ251ZWFiaQkJbGludXhbXi1dKi1nbnVlYWJpCiBkaWZm
IC0tZ2l0IGEvZGF0YS90dXBsZXRhYmxlIGIvZGF0YS90dXBsZXRhYmxlCi1pbmRleCA3NDM2Zjgw
NTYuLjgyYWUzNjA0ZSAxMDA2NDQKK2luZGV4IGJjMWZjYzVhYi4uNjE2ODAyN2RjIDEwMDY0NAog
LS0tIGEvZGF0YS90dXBsZXRhYmxlCiArKysgYi9kYXRhL3R1cGxldGFibGUKIEBAIC0yNCw2ICsy
NCw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDct
ZHBrZy1kZWItYnVpbGQuYy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUtaW4tdGFyLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDA3LWRwa2ctZGViLWJ1aWxkLmMt
UmVtb3ZlLXVzYWdlLW9mLWNsYW1wLW10aW1lLWluLXRhci5wYXRjaAppbmRleCA2ZDM5ZTQzYzVm
Li5mMjNhNDkzNDU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtn
LzAwMDctZHBrZy1kZWItYnVpbGQuYy1SZW1vdmUtdXNhZ2Utb2YtY2xhbXAtbXRpbWUtaW4tdGFy
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwNy1kcGtnLWRl
Yi1idWlsZC5jLVJlbW92ZS11c2FnZS1vZi1jbGFtcC1tdGltZS1pbi10YXIucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDVjOWM0NDI3NGVjZjBlNzA0ZTFhYWRiMTAwMWQ2ZGY5ZjNjZTQwM2Eg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDliMWYwNzcxNDA2ZjY4YjdlNmM5Mjk5NTE2
OGQ2OTY0ZjliNjRiMDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlh
IDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBTdW4sIDggRmViIDIwMjYgMjE6MjU6
MDYgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZHBrZy1kZWIvYnVpbGQuYzogUmVtb3ZlIHVzYWdl
IG9mIC0tY2xhbXAtbXRpbWUgaW4gdGFyCkBAIC00Myw2ICs0MywzIEBAIGluZGV4IDI1OWM2MjUx
Yy4uZjdhMDE1NmYxIDEwMDY0NAogIAkJICAgICAgICAgICAgICAgICBOVUxMKTsKICAJCS8qIE1v
ZGUgbWlnaHQgYmVjb21lIGEgcG9zaXRpb25hbCBhcmd1bWVudCwgcGFzcyBpdAogIAkJICogYmVm
b3JlIC1ULiAqLwotLS0gCi0yLjQ5LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxldF9lbnRyeS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2cvYWRkX2FybWViX3RyaXBsZXRfZW50cnkucGF0Y2gKaW5kZXgg
ZDFmYWMyMTY4YS4uZGIxY2EwNGM5OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rwa2cvZHBrZy9hZGRfYXJtZWJfdHJpcGxldF9lbnRyeS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2FkZF9hcm1lYl90cmlwbGV0X2VudHJ5LnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA4ZGVkMzJhMzUyODdhODQwZGU3ZTUwNWM2NmU3NmNjY2Q5ZWRiYWM2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMzJlM2FhZTRiNDljZjllN2VlNDQxNmJk
ZGVhMWYxZTFmOGUzZDAxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogIktyaXNobmFu
amFuYXBwYSwgSmFnYWRlZXNoIgogIDxqYWdhZGVlc2gua3Jpc2huYW5qYW5hcHBhQGNhdml1bW5l
dHdvcmtzLmNvbT4KIERhdGU6IFdlZCwgOCBBcHIgMjAxNSAxODowODoxNCArMDUzMApAQCAtMzQs
NyArMzQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbsOtYmFsIExpbcOzbiA8YW5pYmFsLmxpbW9uQGxp
bnV4LmludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAt
LWdpdCBhL2RhdGEvdHVwbGV0YWJsZSBiL2RhdGEvdHVwbGV0YWJsZQotaW5kZXggYWU5ZjJkZGI0
Li43NDM2ZjgwNTYgMTAwNjQ0CitpbmRleCA3YzMwNmQ0OTcuLmJjMWZjYzVhYiAxMDA2NDQKIC0t
LSBhL2RhdGEvdHVwbGV0YWJsZQogKysrIGIvZGF0YS90dXBsZXRhYmxlCiBAQCAtMjcsNiArMjcs
NyBAQCBlYWJpaGYtbXVzbC1saW51eC1hcm0JCW11c2wtbGludXgtYXJtaGYKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYXJjaF9wbS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvYXJjaF9wbS5wYXRjaAppbmRleCA2NzZlMDk1NmNjLi4x
ZThkYTZlODk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL2Fy
Y2hfcG0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9hcmNoX3Bt
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NjE0ODJlZWY3OWU5MGY5YmU2ZjYwZjQ4YTA2
M2I2NjIyMWE4ZWExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkNWVmZTkxZjRkNDdi
MmZiM2JiMmMwOTVlYWE5ZjRkMTk3NTE2ZjAzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSm9lIFNsYXRlciA8anNsYXRlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogU3VuLCA4IEZlYiAy
MDI2IDIxOjA2OjQ0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRwa2c6IGZpeCBjb25maWd1cmF0
aW9uIGlzc3VlIGZvciBtaXBzNjQKQEAgLTMyLDYgKzMyLDMgQEAgaW5kZXggM2Q5ZTNlOTc1Li4w
NWM2ZGViYzMgMTAwNjQ0CiAgICAgICAgICAgICAgICAgICAgICAkZGViYXJjaF90b19kZWJ0dXBs
ZXskZGF9ID0gJGR0OwogICAgICAgICAgICAgICAgICAgICAgJGRlYnR1cGxlX3RvX2RlYmFyY2h7
JGR0fSA9ICRkYTsKICAgICAgICAgICAgICAgICAgfQotLS0gCi0yLjQ5LjAKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9ub21hbi5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvbm9tYW4ucGF0Y2gKaW5kZXggM2YzZTA4MzUxYy4uZWY1
ODEyZGM0MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy9ub21h
bi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL25vbWFuLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlNjcxYjQzYTUyYmY1Nzg1ZmU0YWFkODQ3MTJkYmFiYzZj
ODZiMzllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmYzc1NTBlODdlM2Y1YTllNGZl
MTk0YjE1MzliZThhMjExYTE2OGM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hy
aXMgTGFyc29uIDxrZXJnb3RoQG9wZW5lZGhhbmQuY29tPgogRGF0ZTogVHVlLCA1IFNlcCAyMDA2
IDA3OjI0OjU4ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBkcGtnLCBtb2RpZmllZCBmcm9t
IHVwc3RyZWFtIG9lLgpAQCAtOSw3ICs5LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJp
YXRlIFtkaXNhYmxlIGZlYXR1cmVdCiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4IDc0ZjhkZjE5Ny4u
MzVlNWVlZTM5IDEwMDY0NAoraW5kZXggZGI0ODA3OTVmLi43MzdkOGZlOTggMTAwNjQ0CiAtLS0g
YS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KIEBAIC0xMSw3ICsxMSw2IEBAIFNVQkRJ
UlMgPSBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL3JlbW92
ZS10YXItbm8tdGltZXN0YW1wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBr
Zy9yZW1vdmUtdGFyLW5vLXRpbWVzdGFtcC5wYXRjaAppbmRleCA3NTRiNGZlZjE3Li42MjVmNGNl
M2E2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnL3JlbW92ZS10
YXItbm8tdGltZXN0YW1wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rw
a2cvcmVtb3ZlLXRhci1uby10aW1lc3RhbXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE1
NTkyNDdiNzFjZTQ0OTc4YjdkYzQ5YTZmZGI1MTE2N2UyMmMwYmYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGY3MTI3ZmJiNWY4MDdlNzZlNWM5YWYxMGVhZjNkYmE0MDY1MTdhOWQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDb25zdGFudGluIE11c2NhIDxjb25zdGFudGlu
eC5tdXNjYUBpbnRlbC5jb20+CiBEYXRlOiBTdW4sIDggRmViIDIwMjYgMjE6MDM6MzAgLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gYnVzeWJveC0xLjE5LjQgdGFyIHV0aWxpdHkgZG9lc24ndCBzdXBw
b3J0CkBAIC0xNSwxMCArMTUsMTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9zcmMvZGViL2V4dHJhY3QuYyBiL3NyYy9kZWIvZXh0cmFjdC5jCi1pbmRleCBl
MDIzNDcyNmEuLmUxNTNmNzJhYiAxMDA2NDQKK2luZGV4IDE2ZDU1OWY4My4uMGNjMzkwY2U5IDEw
MDY0NAogLS0tIGEvc3JjL2RlYi9leHRyYWN0LmMKICsrKyBiL3NyYy9kZWIvZXh0cmFjdC5jCi1A
QCAtMzUzLDcgKzM1Myw2IEBAIGV4dHJhY3RoYWxmKGNvbnN0IGNoYXIgKmRlYmFyLCBjb25zdCBj
aGFyICpkaXIsCitAQCAtMzcxLDcgKzM3MSw2IEBAIGV4dHJhY3RoYWxmKGNvbnN0IGNoYXIgKmRl
YmFyLCBjb25zdCBjaGFyICpkaXIsCiAgCiAgCQkJY29tbWFuZF9hZGRfYXJnKCZjbWQsICItZiIp
OwogIAkJCWNvbW1hbmRfYWRkX2FyZygmY21kLCAiLSIpOwpAQCAtMjYsNiArMjYsMyBAQCBpbmRl
eCBlMDIzNDcyNmEuLmUxNTNmNzJhYiAxMDA2NDQKICAKICAJCQltX2R1cDIocDJbMF0sIDApOwog
IAkJCWNsb3NlKHAyWzBdKTsKLS0tIAotMi40OS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMy41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rw
a2cvZHBrZ18xLjIzLjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIzLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMy43LmJiCmluZGV4IDFkOGRkNjZlZmEuLjhlODM4YjJk
MDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMy41LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMy43LmJiCkBAIC0xOSw0
ICsxOSw0IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2EuZGViaWFuLm9yZy9kcGtnLXRlYW0vZHBr
Zy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47CiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNz
LW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10
YXItY2YucGF0Y2giCiAKLVNSQ1JFViA9ICI4OWYyNjYzMjVjYzhiNWI3ZmQxZWU0MTdiNzhkNDk4
ZWUxODk1NjViIgorU1JDUkVWID0gImVmNGQ1OWY1OTI1NjYxODE4NDg0YWM2NjYwMTRlZTNlNjY1
YWFkY2YiCi0tIAoyLjQ3LjEKCg==

--===============6624084818619932975==--

