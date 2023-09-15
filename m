Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF720EED637
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.29669.1694804393370993105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MGEPjUsJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qSVy0fqg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a9a36ba6c-0011de93-db5d-4450-83e5-e212ef234f00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CahX1dqveptD40CFM2sIiJNKaEVAjxx0D87pfc9Tf8o=;
	b=MGEPjUsJWH/nHf+G6aVGHUCs2ONt48iBZKHzoKMd4QxStuq65gH2r12vQBf3a+Oh
	+/QJivwxTAS847RijRhpEqxfIT0f5Ef1gG36qjmLu1+7r7OKkfOIboQ3dtEVa/ZZ6gW
	7RO5HJDD29Eo2am/kZdA5J2B5dwVVCzfYj43lRbY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CahX1dqveptD40CFM2sIiJNKaEVAjxx0D87pfc9Tf8o=;
	b=qSVy0fqgLFzH/TBXdNNs70yVQ5gAEbYVjmN8SHhp5Z1SD9E4SQawx36zkk0Mpt0U
	f/0B4G7a09ppwwCiV2g9TedRn7MIvH9FsDAmMZ3zxMBYmaJdFaKeTNPUO0hPhw43fjQ
	ixwmhAeO0hFWl4Gnt580U9/FVzlJvRjFdtbMDV+A=
Content-Type: multipart/mixed; boundary="===============3424620902712446765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.0.0 SUCCEEDED
Message-ID: <0101018a9a36ba6c-0011de93-db5d-4450-83e5-e212ef234f00-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187691

--===============3424620902712446765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpjcmVhdGVyZXBvLWMqIHRvICoxLjAuMCogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAg
ICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtY3JlYXRlcmVwby1jLXVwZ3JhZGUtMC4y
MS4xLTEuMC4wLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFtIHBhdGNo
ZXMgYW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAgIC0gY29tcGls
ZSBhbiBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZvcm0gc29tZSBi
YXNpYyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWduIGl0IG9mZjog
Z2l0IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQgaXQgdG8gdGhl
IGFwcHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91IGJlbGlldmUg
dGhlIHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwKeW91IGNhbiBm
aWxsIFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZpbGUgc28g
dGhhdAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVtcHRlZC4KClBs
ZWFzZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIGFu
ZCBidWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxlIGEgYnVnIGF0
IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9
QXV0b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUgSGVscGVy
CgotLSA+OCAtLQpGcm9tIDlmMDJjMzMwZGFiMDQ2NzJmNDY0ZmI2OGZmOTA2OTY0MzU2ZjViZmYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9w
cm9qZWN0Lm9yZz4KRGF0ZTogRnJpLCAxNSBTZXAgMjAyMyAwODoyODoyMyArMDAwMApTdWJqZWN0
OiBbUEFUQ0hdIGNyZWF0ZXJlcG8tYzogdXBncmFkZSAwLjIxLjEgLT4gMS4wLjAKCi0tLQogLi4u
YXJzZXIuYy1hZGQtYS1taXNzaW5nLXBhcmFtZXRlci1uYW1lLnBhdGNoIHwgMzkgLS0tLS0tLS0t
LS0tLS0tLS0tLQogLi4ucmVwby1jXzAuMjEuMS5iYiA9PiBjcmVhdGVyZXBvLWNfMS4wLjAuYmJ9
IHwgIDMgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQxIGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMv
Y3JlYXRlcmVwby1jLzAwMDEtc3JjLWNtZF9wYXJzZXIuYy1hZGQtYS1taXNzaW5nLXBhcmFtZXRl
ci1uYW1lLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy97
Y3JlYXRlcmVwby1jXzAuMjEuMS5iYiA9PiBjcmVhdGVyZXBvLWNfMS4wLjAuYmJ9ICg5MiUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBv
LWMvMDAwMS1zcmMtY21kX3BhcnNlci5jLWFkZC1hLW1pc3NpbmctcGFyYW1ldGVyLW5hbWUucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAx
LXNyYy1jbWRfcGFyc2VyLmMtYWRkLWEtbWlzc2luZy1wYXJhbWV0ZXItbmFtZS5wYXRjaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMGQxYzZiMDhmYi4uMDAwMDAwMDAwMAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLXNyYy1j
bWRfcGFyc2VyLmMtYWRkLWEtbWlzc2luZy1wYXJhbWV0ZXItbmFtZS5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDM5ICswLDAgQEAKLUZyb20gOTcwYjkwMWUxOTk5ZjQxNWRhOGJhYzIwNWY1MjZj
ODA4ZGRhZDBiYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBNb24sIDggTWF5IDIwMjMgMTA6NDA6NDMg
KzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gc3JjL2NtZF9wYXJzZXIuYzogYWRkIGEgbWlzc2luZyBw
YXJhbWV0ZXIgbmFtZQotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1UaGlz
IHJlc29sdmVzIHRoZSBmb2xsb3dpbmcgZXJyb3Igd2l0aCBvbGRlciB2ZXJzaW9ucyBvZiBnY2M6
Ci18IC9zcnYvc3RvcmFnZS9hbGV4L3lvY3RvL2J1aWxkLTMyL3RtcC93b3JrL3g4Nl82NC1saW51
eC9jcmVhdGVyZXBvLWMtbmF0aXZlLzAuMjEuMS1yMC9naXQvc3JjL2NtZF9wYXJzZXIuYzogSW4g
ZnVuY3Rpb24g4oCYZHVwbGljYXRlZF9uZXZyYV9vcHRpb25fcGFyc2Vy4oCZOgotfCAvc3J2L3N0
b3JhZ2UvYWxleC95b2N0by9idWlsZC0zMi90bXAvd29yay94ODZfNjQtbGludXgvY3JlYXRlcmVw
by1jLW5hdGl2ZS8wLjIxLjEtcjAvZ2l0L3NyYy9jbWRfcGFyc2VyLmM6NzY6MzI6IGVycm9yOiBw
YXJhbWV0ZXIgbmFtZSBvbWl0dGVkCi18ICAgIDc2IHwgZHVwbGljYXRlZF9uZXZyYV9vcHRpb25f
cGFyc2VyKGNvbnN0IGdjaGFyICosCi18ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn4KLXwgL3Nydi9zdG9yYWdlL2FsZXgveW9jdG8vYnVpbGQtMzIv
dG1wL3dvcmsveDg2XzY0LWxpbnV4L2NyZWF0ZXJlcG8tYy1uYXRpdmUvMC4yMS4xLXIwL2dpdC9z
cmMvY21kX3BhcnNlci5jOjc4OjMyOiBlcnJvcjogcGFyYW1ldGVyIG5hbWUgb21pdHRlZAotfCAg
ICA3OCB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncG9pbnRlciwKLXwgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KLQotVXBzdHJlYW0tU3Rh
dHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVu
dC9jcmVhdGVyZXBvX2MvcHVsbC8zNjZdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPgotLS0tCi0gc3JjL2NtZF9wYXJzZXIuYyB8IDQgKystLQot
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRpZmYg
LS1naXQgYS9zcmMvY21kX3BhcnNlci5jIGIvc3JjL2NtZF9wYXJzZXIuYwotaW5kZXggOTdjOWVh
Ny4uNjNhZjdlYSAxMDA2NDQKLS0tLSBhL3NyYy9jbWRfcGFyc2VyLmMKLSsrKyBiL3NyYy9jbWRf
cGFyc2VyLmMKLUBAIC03Myw5ICs3Myw5IEBAIHN0cnVjdCBDbWRPcHRpb25zIF9jbWRfb3B0aW9u
cyA9IHsKLSAKLSAKLSBnYm9vbGVhbgotLWR1cGxpY2F0ZWRfbmV2cmFfb3B0aW9uX3BhcnNlcihj
b25zdCBnY2hhciAqLAotK2R1cGxpY2F0ZWRfbmV2cmFfb3B0aW9uX3BhcnNlcihjb25zdCBnY2hh
ciAqb3B0aW9uX25hbWUsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGdj
aGFyICp2YWx1ZSwKLS0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3BvaW50ZXIsCi0r
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwb2ludGVyIGRhdGEsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEdFcnJvciAqKmVycm9yKQotIHsKLSAgICAgaWYgKCFnX3N0
cmNtcDAodmFsdWUsICJrZWVwIikpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18wLjIxLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18xLjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDky
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJl
cG8tY18wLjIxLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBv
LWMvY3JlYXRlcmVwby1jXzEuMC4wLmJiCmluZGV4IDU3ZjIzYjhkZmQuLjliMTA5MzI3YzggMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1j
XzAuMjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0
ZXJlcG8tY18xLjAuMC5iYgpAQCAtNywxMSArNywxMCBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9jcmVhdGVyZXBv
X2M7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2ggXAot
ICAgICAgICAgICBmaWxlOi8vMDAwMS1zcmMtY21kX3BhcnNlci5jLWFkZC1hLW1pc3NpbmctcGFy
YW1ldGVyLW5hbWUucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vdGltZTY0Zml4LnBhdGNoIFwK
ICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiMDY1MmQ3MzAzY2UyMzZlNTk2YzgzYzI5Y2NjOWJl
ZTc4NjhmY2U2ZSIKK1NSQ1JFViA9ICIwY2MxMzkyMDk5MWIyZmI4Zjg3ZmI5ZDM1MmJkMzM5NGMy
OTgzMjg5IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============3424620902712446765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.21.1-1.0.0.patch"

RnJvbSA5ZjAyYzMzMGRhYjA0NjcyZjQ2NGZiNjhmZjkwNjk2NDM1NmY1YmZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDg6Mjg6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmVhdGVyZXBvLWM6IHVwZ3JhZGUgMC4yMS4xIC0+IDEuMC4wCgotLS0KIC4uLmFyc2VyLmMtYWRk
LWEtbWlzc2luZy1wYXJhbWV0ZXItbmFtZS5wYXRjaCB8IDM5IC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLnJlcG8tY18wLjIxLjEuYmIgPT4gY3JlYXRlcmVwby1jXzEuMC4wLmJifSB8ICAzICstCiAy
IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8t
Yy8wMDAxLXNyYy1jbWRfcGFyc2VyLmMtYWRkLWEtbWlzc2luZy1wYXJhbWV0ZXItbmFtZS5wYXRj
aAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMve2NyZWF0ZXJlcG8t
Y18wLjIxLjEuYmIgPT4gY3JlYXRlcmVwby1jXzEuMC4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtc3Jj
LWNtZF9wYXJzZXIuYy1hZGQtYS1taXNzaW5nLXBhcmFtZXRlci1uYW1lLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1zcmMtY21kX3Bh
cnNlci5jLWFkZC1hLW1pc3NpbmctcGFyYW1ldGVyLW5hbWUucGF0Y2gKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDBkMWM2YjA4ZmIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1zcmMtY21kX3BhcnNlci5j
LWFkZC1hLW1pc3NpbmctcGFyYW1ldGVyLW5hbWUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwz
OSArMCwwIEBACi1Gcm9tIDk3MGI5MDFlMTk5OWY0MTVkYThiYWMyMDVmNTI2YzgwOGRkYWQwYmEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBs
aW51dHJvbml4LmRlPgotRGF0ZTogTW9uLCA4IE1heSAyMDIzIDEwOjQwOjQzICswMjAwCi1TdWJq
ZWN0OiBbUEFUQ0hdIHNyYy9jbWRfcGFyc2VyLmM6IGFkZCBhIG1pc3NpbmcgcGFyYW1ldGVyIG5h
bWUKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9
VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotVGhpcyByZXNvbHZlcyB0
aGUgZm9sbG93aW5nIGVycm9yIHdpdGggb2xkZXIgdmVyc2lvbnMgb2YgZ2NjOgotfCAvc3J2L3N0
b3JhZ2UvYWxleC95b2N0by9idWlsZC0zMi90bXAvd29yay94ODZfNjQtbGludXgvY3JlYXRlcmVw
by1jLW5hdGl2ZS8wLjIxLjEtcjAvZ2l0L3NyYy9jbWRfcGFyc2VyLmM6IEluIGZ1bmN0aW9uIOKA
mGR1cGxpY2F0ZWRfbmV2cmFfb3B0aW9uX3BhcnNlcuKAmToKLXwgL3Nydi9zdG9yYWdlL2FsZXgv
eW9jdG8vYnVpbGQtMzIvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2NyZWF0ZXJlcG8tYy1uYXRpdmUv
MC4yMS4xLXIwL2dpdC9zcmMvY21kX3BhcnNlci5jOjc2OjMyOiBlcnJvcjogcGFyYW1ldGVyIG5h
bWUgb21pdHRlZAotfCAgICA3NiB8IGR1cGxpY2F0ZWRfbmV2cmFfb3B0aW9uX3BhcnNlcihjb25z
dCBnY2hhciAqLAotfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+Ci18IC9zcnYvc3RvcmFnZS9hbGV4L3lvY3RvL2J1aWxkLTMyL3RtcC93b3JrL3g4
Nl82NC1saW51eC9jcmVhdGVyZXBvLWMtbmF0aXZlLzAuMjEuMS1yMC9naXQvc3JjL2NtZF9wYXJz
ZXIuYzo3ODozMjogZXJyb3I6IHBhcmFtZXRlciBuYW1lIG9taXR0ZWQKLXwgICAgNzggfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3BvaW50ZXIsCi18ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0
dGVkIFtodHRwczovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3JlYXRlcmVw
b19jL3B1bGwvMzY2XQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGlu
dXRyb25peC5kZT4KLS0tLQotIHNyYy9jbWRfcGFyc2VyLmMgfCA0ICsrLS0KLSAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc3Jj
L2NtZF9wYXJzZXIuYyBiL3NyYy9jbWRfcGFyc2VyLmMKLWluZGV4IDk3YzllYTcuLjYzYWY3ZWEg
MTAwNjQ0Ci0tLS0gYS9zcmMvY21kX3BhcnNlci5jCi0rKysgYi9zcmMvY21kX3BhcnNlci5jCi1A
QCAtNzMsOSArNzMsOSBAQCBzdHJ1Y3QgQ21kT3B0aW9ucyBfY21kX29wdGlvbnMgPSB7Ci0gCi0g
Ci0gZ2Jvb2xlYW4KLS1kdXBsaWNhdGVkX25ldnJhX29wdGlvbl9wYXJzZXIoY29uc3QgZ2NoYXIg
KiwKLStkdXBsaWNhdGVkX25ldnJhX29wdGlvbl9wYXJzZXIoY29uc3QgZ2NoYXIgKm9wdGlvbl9u
YW1lLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBnY2hhciAqdmFsdWUs
Ci0tICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwb2ludGVyLAotKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBncG9pbnRlciBkYXRhLAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBHRXJyb3IgKiplcnJvcikKLSB7Ci0gICAgIGlmICghZ19zdHJjbXAwKHZhbHVl
LCAia2VlcCIpKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8t
Yy9jcmVhdGVyZXBvLWNfMC4yMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJl
cG8tYy9jcmVhdGVyZXBvLWNfMS4wLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMC4yMS4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJl
cG8tY18xLjAuMC5iYgppbmRleCA1N2YyM2I4ZGZkLi45YjEwOTMyN2M4IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18wLjIxLjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4w
LjAuYmIKQEAgLTcsMTEgKzcsMTAgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
RzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jO2JyYW5jaD1t
YXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3Qtc2V0
LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoIFwKLSAgICAgICAgICAg
ZmlsZTovLzAwMDEtc3JjLWNtZF9wYXJzZXIuYy1hZGQtYS1taXNzaW5nLXBhcmFtZXRlci1uYW1l
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3RpbWU2NGZpeC5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotU1JDUkVWID0gIjA2NTJkNzMwM2NlMjM2ZTU5NmM4M2MyOWNjYzliZWU3ODY4ZmNlNmUi
CitTUkNSRVYgPSAiMGNjMTM5MjA5OTFiMmZiOGY4N2ZiOWQzNTJiZDMzOTRjMjk4MzI4OSIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============3424620902712446765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.21.1", added "/usr/lib/.debug/libcreaterepo_c.so.1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: RRECOMMENDS: added "libzstd-dbg"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1272700 to 1277560 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: RRECOMMENDS: added "libzstd-dev"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 146318 to 146430 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGSIZE changed from 16137 to 16193 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1271497 to 1277285 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0 /usr/lib/libcreaterepo_c.so.0.21.1", added "/usr/lib/libcreaterepo_c.so.1 /usr/lib/libcreaterepo_c.so.1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: RDEPENDS: added "libzstd (['>= 1.5.5'])"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 538980 to 547349 (+2%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c: SRC_URI changed from "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://0001-src-cmd_parser.c-add-a-missing-parameter-name.patch file://time64fix.patch" to "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://time64fix.patch"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so changed symlink target from libcreaterepo_c.so.0 to libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.0 moved to /usr/lib/libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.1.0.0 was added
  /usr/lib/libcreaterepo_c.so.0.21.1 was removed

--===============3424620902712446765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: RRECOMMENDS: added "libzstd-dbg"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: RRECOMMENDS: added "libzstd-dev"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.21.1 /usr/lib/libcreaterepo_c.so.0", added "/usr/lib/libcreaterepo_c.so.1.0.0 /usr/lib/libcreaterepo_c.so.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: RDEPENDS: added "libzstd (['>= 1.5.5'])"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so changed symlink target from libcreaterepo_c.so.0 to libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.0 moved to /usr/lib/libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.1.0.0 was added
  /usr/lib/libcreaterepo_c.so.0.21.1 was removed

--===============3424620902712446765==--

