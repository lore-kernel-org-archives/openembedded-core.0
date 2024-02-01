Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EC9C48295
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:08:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2548.1706810901238113032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PyaAY8I1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HBxTPb4x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d65db802f-df68176f-f0d2-40cc-9357-a254b8e4d852-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810900;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IsGYy3PWsRqUWGkYvmbeM6pWYcE37F8jJ/c6xOPCiH4=;
	b=PyaAY8I1q46362jeepxOjXeIx6KX5nwgC4Pl7elJpNJ2Gs/dXUR/0tL1pkzDFej+
	6qSC6o8AUbe+OPdbXw9EHvNFoG7ldOwi3LFwwSmYz/SafiwvR9lOBP94XlPve3djXjn
	aMHYs5+nc18p4PwpqTlsUJNCIXYjX8MR7ZUyJCgo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810900;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IsGYy3PWsRqUWGkYvmbeM6pWYcE37F8jJ/c6xOPCiH4=;
	b=HBxTPb4x7e7Sr8gdnedJmRGg8K0bpkTkkAOOZO73ewxrGm669R8z0w5sxiVMnFhz
	dmZC3gUlWZm6aJR9rdPcg3hXpB2hDap/uni0h0ABvLpLNlJLk1x4qscTo5X9e2niNVm
	bRZ1nsVavQ19cZ0GbEnU8TRCOvNatYGG/7xB3zzQ=
Content-Type: multipart/mixed; boundary="===============5114257674460445501=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.59.0 SUCCEEDED
Message-ID: <0101018d65db802f-df68176f-f0d2-40cc-9357-a254b8e4d852-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:08:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194726

--===============5114257674460445501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpuZ2h0dHAyKiB0byAqMS41OS4wKiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBzdGVwczoKICAgIC0g
YXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1uZ2h0dHAyLXVwZ3JhZGUtMS41OC4wLTEuNTku
MC5wYXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBz
dW1tYXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1h
Z2UgdGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2Fu
aXR5IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21t
aXQgLXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3By
aWF0ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNp
cGUgc2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJ
UEVfTk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0
b21hdGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2
aWV3IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQv
dXBkYXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczov
L2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRl
ZCUyMFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjgg
LS0KRnJvbSAzM2EzOWZmMGNmZWY5MzdmYTc3OGQyMmExMDBhZDY0N2UyYzJmMmI1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5v
cmc+CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNzo0Nzo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hd
IG5naHR0cDI6IHVwZ3JhZGUgMS41OC4wIC0+IDEuNTkuMAoKLS0tCiAuLi4vbmdodHRwMi8wMDAx
LWZldGNoLW9jc3AtcmVzcG9uc2UtdXNlLXB5dGhvbjMucGF0Y2ggICAgfCA4ICsrKy0tLS0tCiAu
Li4vbmdodHRwMi97bmdodHRwMl8xLjU4LjAuYmIgPT4gbmdodHRwMl8xLjU5LjAuYmJ9ICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNTguMC5iYiA9
PiBuZ2h0dHAyXzEuNTkuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDIvMDAwMS1mZXRjaC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24z
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyLzAwMDEtZmV0Y2gt
b2NzcC1yZXNwb25zZS11c2UtcHl0aG9uMy5wYXRjaAppbmRleCBlNGRiMDk2MzhmLi5lNTM4MWU2
MmRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDIvMDAw
MS1mZXRjaC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L25naHR0cDIvbmdodHRwMi8wMDAxLWZldGNoLW9jc3AtcmVzcG9uc2UtdXNlLXB5
dGhvbjMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDczZWM3OTQzMmZjNTU3YThiZTRmMTUw
MDk4MmIxYzBmNWZkZjEyYTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJmNDI5NTY3
MWRjMjM1NjVkMTE1YjM2NTQzOGRhMzZmNDUwYjJiNzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiA9P1VURi04P3E/QW5kcj1DMz1BOT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0Bq
Y2kuY29tPgogRGF0ZTogVGh1LCA3IE5vdiAyMDE5IDA5OjU4OjUyICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGZldGNoLW9jc3AtcmVzcG9uc2U6IHVzZSBweXRob24zCkBAIC04LDEyICs4LDEzIEBA
IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFw
cHJvcHJpYXRlIFtvZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxn
aXRAYW5kcmVkLm5ldD4KKwogLS0tCiAgc2NyaXB0L2ZldGNoLW9jc3AtcmVzcG9uc2UgfCAyICst
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9zY3JpcHQvZmV0Y2gtb2NzcC1yZXNwb25zZSBiL3NjcmlwdC9mZXRjaC1vY3NwLXJl
c3BvbnNlCi1pbmRleCAwZmY3NDYxLi4xODUxMTZiIDEwMDc1NQoraW5kZXggN2M0Nzg1Yi4uZjlj
MjEwMCAxMDA3NTUKIC0tLSBhL3NjcmlwdC9mZXRjaC1vY3NwLXJlc3BvbnNlCiArKysgYi9zY3Jp
cHQvZmV0Y2gtb2NzcC1yZXNwb25zZQogQEAgLTEsNCArMSw0IEBACkBAIC0yMiw2ICsyMywzIEBA
IGluZGV4IDBmZjc0NjEuLjE4NTExNmIgMTAwNzU1CiAgIyAtKi0gY29kaW5nOiB1dGYtOCAtKi0K
ICAKICAjIG5naHR0cDIgLSBIVFRQLzIgQyBMaWJyYXJ5Ci0tLSAKLTIuMjMuMC5yYzEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTguMC5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjU5LjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0
dHAyXzEuNTguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0
dHAyXzEuNTkuMC5iYgppbmRleCA3YjJmZjRiNzc4Li5mYTAwMTNjYTljIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS41OC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjU5LjAuYmIKQEAgLTgsNyArOCw3IEBA
IFNSQ19VUkkgPSAiXAogICAgICR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vbmdo
dHRwMi0ke1BWfS50YXIueHogXAogICAgIGZpbGU6Ly8wMDAxLWZldGNoLW9jc3AtcmVzcG9uc2Ut
dXNlLXB5dGhvbjMucGF0Y2ggXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRhNjhhMzA0MGRh
OTJmZDk4NzJjMDU2ZDBmNmIwY2Q2MGRlODQxMGRlMTBiNTc4ZjhhZGU5ZWNjMTRkMjk3ZTAiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmRjOWJkNzFmNWNmOGQzZmRmYjYzMDY2Yjg5MzY0YzEwZWIy
ZmRlYWI1NWYzYzY3NTVjZDc5MTdiMmVjNGZmYiIKIAogaW5oZXJpdCBjbWFrZSBtYW5wYWdlcyBw
eXRob24zbmF0aXZlIGdpdGh1Yi1yZWxlYXNlcwogUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10gPSAi
IgotLSAKMi40Mi4wCgo=

--===============5114257674460445501==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.58.0-1.59.0.patch"

RnJvbSAzM2EzOWZmMGNmZWY5MzdmYTc3OGQyMmExMDBhZDY0N2UyYzJmMmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNzo0Nzo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aHR0cDI6IHVwZ3JhZGUgMS41OC4wIC0+IDEuNTkuMAoKLS0tCiAuLi4vbmdodHRwMi8wMDAxLWZl
dGNoLW9jc3AtcmVzcG9uc2UtdXNlLXB5dGhvbjMucGF0Y2ggICAgfCA4ICsrKy0tLS0tCiAuLi4v
bmdodHRwMi97bmdodHRwMl8xLjU4LjAuYmIgPT4gbmdodHRwMl8xLjU5LjAuYmJ9ICAgICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNTguMC5iYiA9PiBu
Z2h0dHAyXzEuNTkuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9uZ2h0dHAyL25naHR0cDIvMDAwMS1mZXRjaC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24zLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyLzAwMDEtZmV0Y2gtb2Nz
cC1yZXNwb25zZS11c2UtcHl0aG9uMy5wYXRjaAppbmRleCBlNGRiMDk2MzhmLi5lNTM4MWU2MmRj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDIvMDAwMS1m
ZXRjaC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L25naHR0cDIvbmdodHRwMi8wMDAxLWZldGNoLW9jc3AtcmVzcG9uc2UtdXNlLXB5dGhv
bjMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDczZWM3OTQzMmZjNTU3YThiZTRmMTUwMDk4
MmIxYzBmNWZkZjEyYTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJmNDI5NTY3MWRj
MjM1NjVkMTE1YjM2NTQzOGRhMzZmNDUwYjJiNzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiA9P1VURi04P3E/QW5kcj1DMz1BOT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2ku
Y29tPgogRGF0ZTogVGh1LCA3IE5vdiAyMDE5IDA5OjU4OjUyICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGZldGNoLW9jc3AtcmVzcG9uc2U6IHVzZSBweXRob24zCkBAIC04LDEyICs4LDEzIEBAIENv
bnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJv
cHJpYXRlIFtvZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxnaXRA
YW5kcmVkLm5ldD4KKwogLS0tCiAgc2NyaXB0L2ZldGNoLW9jc3AtcmVzcG9uc2UgfCAyICstCiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9zY3JpcHQvZmV0Y2gtb2NzcC1yZXNwb25zZSBiL3NjcmlwdC9mZXRjaC1vY3NwLXJlc3Bv
bnNlCi1pbmRleCAwZmY3NDYxLi4xODUxMTZiIDEwMDc1NQoraW5kZXggN2M0Nzg1Yi4uZjljMjEw
MCAxMDA3NTUKIC0tLSBhL3NjcmlwdC9mZXRjaC1vY3NwLXJlc3BvbnNlCiArKysgYi9zY3JpcHQv
ZmV0Y2gtb2NzcC1yZXNwb25zZQogQEAgLTEsNCArMSw0IEBACkBAIC0yMiw2ICsyMywzIEBAIGlu
ZGV4IDBmZjc0NjEuLjE4NTExNmIgMTAwNzU1CiAgIyAtKi0gY29kaW5nOiB1dGYtOCAtKi0KICAK
ICAjIG5naHR0cDIgLSBIVFRQLzIgQyBMaWJyYXJ5Ci0tLSAKLTIuMjMuMC5yYzEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTguMC5iYiBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjU5LjAuYmIKc2ltaWxhcml0eSBp
bmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAy
XzEuNTguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAy
XzEuNTkuMC5iYgppbmRleCA3YjJmZjRiNzc4Li5mYTAwMTNjYTljIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS41OC4wLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjU5LjAuYmIKQEAgLTgsNyArOCw3IEBAIFNS
Q19VUkkgPSAiXAogICAgICR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vbmdodHRw
Mi0ke1BWfS50YXIueHogXAogICAgIGZpbGU6Ly8wMDAxLWZldGNoLW9jc3AtcmVzcG9uc2UtdXNl
LXB5dGhvbjMucGF0Y2ggXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRhNjhhMzA0MGRhOTJm
ZDk4NzJjMDU2ZDBmNmIwY2Q2MGRlODQxMGRlMTBiNTc4ZjhhZGU5ZWNjMTRkMjk3ZTAiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZmRjOWJkNzFmNWNmOGQzZmRmYjYzMDY2Yjg5MzY0YzEwZWIyZmRl
YWI1NWYzYzY3NTVjZDc5MTdiMmVjNGZmYiIKIAogaW5oZXJpdCBjbWFrZSBtYW5wYWdlcyBweXRo
b24zbmF0aXZlIGdpdGh1Yi1yZWxlYXNlcwogUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10gPSAiIgot
LSAKMi40Mi4wCgo=

--===============5114257674460445501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.25.1", added "/usr/lib/libnghttp2.so.14.26.0"
Changes to packages/core2-64-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.25.1 to libnghttp2.so.14.26.0
  /usr/lib/libnghttp2.so.14.25.1 moved to /usr/lib/libnghttp2.so.14.26.0

--===============5114257674460445501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1850 targets, 46 skipped, 0 masked, 0 errors.
Removing 50 recipes from the core2-64 sysroot...done.
Removing 73 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-c84001decf4b57fe7faba294ffbb8db3075d9bc8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c84001decf4b57fe7faba294ffbb8db3075d9bc8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 419 Local 404 Mirrors 0 Missed 15 Current 201 (96% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 202 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 203 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 204 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 208 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 209 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
NOTE: Running task 673 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_recipe_qa)
NOTE: recipe openssl-3.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_recipe_qa: Started
NOTE: recipe openssl-3.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 283 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx_setscene)
NOTE: Running task 765 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_fetch)
NOTE: recipe nghttp2-1.59.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_unpack)
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 298 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.59.0-r0: task do_unpack: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 299 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 308 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 767 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_patch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 316 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_patch: Succeeded
NOTE: Running task 800 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 801 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_generate_toolchain_file)
NOTE: Running task 802 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_populate_lic)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_populate_lic: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.59.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_populate_lic unihash changed to 51f6ad5526aa0d66dad67875512a3940251aeb8bddec146f77cf32a3c8d833a6
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.59.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 377 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/curl/8.5.0/temp/log.do_packagedata_setscene.876469
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 452 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_package_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 484 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 491 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 521 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1071 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1082 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1083 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1099 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1106 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1112 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1113 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1124 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1140 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Running setscene task 583 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 609 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 620 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1572 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1606 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata)
NOTE: Running task 1701 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_collect_spdx_deps)
NOTE: recipe nghttp2-1.59.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1727 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_configure)
NOTE: recipe nghttp2-1.59.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_configure: Succeeded
NOTE: Running task 1737 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_compile)
NOTE: recipe nghttp2-1.59.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_compile: Succeeded
NOTE: Running task 1738 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_install)
NOTE: recipe nghttp2-1.59.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_install: Succeeded
NOTE: Running task 1739 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_package)
NOTE: Running task 1740 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.59.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_package: Succeeded
NOTE: Running task 1741 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.59.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1742 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_create_spdx)
NOTE: Running task 1743 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_package_write_ipk)
NOTE: Running task 1744 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_package_write_deb)
NOTE: Running task 1745 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_package_write_rpm)
NOTE: Running task 1746 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_package_qa)
NOTE: recipe nghttp2-1.59.0-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_package_write_ipk: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_package_write_deb: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_package_write_rpm: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_package_qa: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1747 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_create_runtime_spdx)
NOTE: recipe nghttp2-1.59.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_package_qa: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1748 of 1748 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1748 tasks of which 1716 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:8.6.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: curl-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:8.6.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: curl-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:8.6.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: curl-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:8.6.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: curl-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:8.6.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: curl-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:8.6.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: curl-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:8.6.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: curl-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:8.6.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: curl-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:8.6.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: curl-8.5.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5114257674460445501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.58.0/nghttp2-1.58.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch" to "https://github.com/nghttp2/nghttp2/releases//download/v1.59.0/nghttp2-1.59.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch"
packages/core2-64-poky-linux/nghttp2: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2: PV changed from "1.58.0" to "1.59.0"
packages/core2-64-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.25.1", added "/usr/lib/libnghttp2.so.14.26.0"
packages/core2-64-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2/libnghttp2: PV changed from "1.58.0" to "1.59.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.25.1", added "/usr/lib/.debug/libnghttp2.so.14.26.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PKGSIZE changed from 542720 to 544096 (+0%)
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.58.0" to "1.59.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGSIZE changed from 208025 to 211952 (+2%)
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.58.0" to "1.59.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGSIZE changed from 174307 to 174189 (-0%)
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.58.0" to "1.59.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.58.0" to "1.59.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PKGSIZE changed from 8988 to 8987 (-0%)
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.58.0" to "1.59.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-src: FILELIST: directory renamed /usr/src/debug/nghttp2/1.58.0/lib/includes/nghttp2 -> /usr/src/debug/nghttp2/1.59.0/lib/includes/nghttp2, removed "/usr/src/debug/nghttp2/1.58.0/lib/nghttp2_ratelim.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_buf.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_ratelim.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_buf.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_http.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_http.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_int.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_hd.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_pq.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_outbound_item.h /usr/src/debug/nghttp2/1.58.0/lib/sfparse.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_pq.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_hd.c /usr/src/debug/nghttp2/1.58.0/lib/sfparse.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_rcbuf.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_frame.h /usr/src/debug/nghttp2/1.
 58.0/lib/nghttp2_hd_huffman.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_queue.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_extpri.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_helper.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_frame.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_debug.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_option.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_queue.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_rcbuf.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_helper.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_extpri.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_hd_huffman.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_npn.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_option.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_stream.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_callbacks.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_submit.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_callbacks.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_hd_huffman_data.c /usr/src/debug/nghttp2/1.58.0/lib/nght
 tp2_priority_spec.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_stream.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_priority_spec.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_mem.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_time.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_map.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_outbound_item.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_session.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_time.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_version.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_mem.c /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_session.h /usr/src/debug/nghttp2/1.58.0/lib/nghttp2_map.c", added "/usr/src/debug/nghttp2/1.59.0/lib/nghttp2_ratelim.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_buf.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_ratelim.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_buf.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_http.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_http.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_int.h /usr/src/
 debug/nghttp2/1.59.0/lib/nghttp2_alpn.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_pq.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_outbound_item.h /usr/src/debug/nghttp2/1.59.0/lib/sfparse.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_pq.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd.c /usr/src/debug/nghttp2/1.59.0/lib/sfparse.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_rcbuf.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_frame.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd_huffman.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_queue.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_extpri.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_helper.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_frame.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_debug.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_option.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_queue.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_rcbuf.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_helper.c /usr/src/debug
 /nghttp2/1.59.0/lib/nghttp2_extpri.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd_huffman.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_option.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_stream.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_submit.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_callbacks.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_callbacks.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd_huffman_data.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_priority_spec.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_stream.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_priority_spec.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_mem.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_time.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_map.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_outbound_item.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_session.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_time.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_version.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_mem.c /usr/src/debu
 g/nghttp2/1.59.0/lib/nghttp2_session.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_map.c"
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1029569 to 1034913 (+1%)
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PV changed from "1.58.0" to "1.59.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.58.0" to "1.59.0"
packages/core2-64-poky-linux/nghttp2/nghttp2: PKGV changed from 1.58.0 [default] to 1.59.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2: PV changed from "1.58.0" to "1.59.0"
Changes to packages/core2-64-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.25.1 to libnghttp2.so.14.26.0
  /usr/lib/libnghttp2.so.14.25.1 moved to /usr/lib/libnghttp2.so.14.26.0

--===============5114257674460445501==--

