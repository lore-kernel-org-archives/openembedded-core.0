Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FF7C3DA50
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.174023.1692224343091137432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G/EuSYVK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eD5sYaiH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a006e4ccc-1f426258-7a84-4ec9-927a-0e247080ab90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Co/nWy6uXxXQtOWeit2WNU/t8jKZCtqQo1YP/iUjU3w=;
	b=G/EuSYVKpkLFl56umDhftZHCTOv8BwDWm4RwgrlSgtfKrOn2Wn7uxUyEwxsrOvRm
	Itkbpb2CmLEzz/bIe3BpuJwmdGklvb5Mj7u4tnuu6Uk27GIhBxjYbrrOxrAPvHAJNqb
	3aVHJv//Thh10jb4Ow/+/+qWIXKy1jlRIb6b04js=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Co/nWy6uXxXQtOWeit2WNU/t8jKZCtqQo1YP/iUjU3w=;
	b=eD5sYaiHLTe1xyQw+Fc4w6qGW9h5yFD28bnpt4T6XUgFMsXyS9nUXqDt4UXGzewU
	exdQKSuhl51/AS6b4mMAE6UHr36MWA6Y8FxmSo/oS0I5r4b6x67hDl1tnc9gY+alQXh
	9hKQm3KrzwM8yizd33sGiVVlep1F5xsTlrekl1To=
Content-Type: multipart/mixed; boundary="===============2121354631401357836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.0.0 SUCCEEDED
Message-ID: <0101018a006e4ccc-1f426258-7a84-4ec9-927a-0e247080ab90-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186165

--===============2121354631401357836==
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
CgotLSA+OCAtLQpGcm9tIGZhNWNiNWU1MWExNDM4ZGRhOGI4OTEwMzllNDg5MTQwYzMxYjE2NmIg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9w
cm9qZWN0Lm9yZz4KRGF0ZTogV2VkLCAxNiBBdWcgMjAyMyAwMjo1MjoyNyArMDAwMApTdWJqZWN0
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

--===============2121354631401357836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.21.1-1.0.0.patch"

RnJvbSBmYTVjYjVlNTFhMTQzOGRkYThiODkxMDM5ZTQ4OTE0MGMzMWIxNjZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDI6NTI6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
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

--===============2121354631401357836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 90 recipes from the core2-32 sysroot...done.
Removing 107 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:787dcafa6decbe3f1ca7898dc2451f45be665bd1"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 421 Local 352 Mirrors 0 Missed 69 Current 307 (83% match, 90% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 308 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 821 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: Running task 822 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 839 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa)
NOTE: Running task 842 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa)
NOTE: Running task 843 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa)
NOTE: Running setscene task 392 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 883 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_write_config)
NOTE: Running task 888 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: Running task 889 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_recipe_qa)
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 399 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 410 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 411 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_write_config: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 413 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_write_config: Succeeded
NOTE: Running task 957 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 958 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: Running task 959 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 960 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 961 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_fetch)
NOTE: Running task 962 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 423 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 424 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 963 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_fetch)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 425 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 964 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 965 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 966 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 432 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 997 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_unpack)
NOTE: recipe libxml2-2.11.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_fetch: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_fetch: Succeeded
NOTE: Running task 998 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_fetch: Succeeded
NOTE: Running task 1001 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: Running task 1002 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_unpack)
NOTE: Running setscene task 439 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Started
NOTE: Running task 1004 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: recipe libxml2-2.11.4-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1007 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: Running setscene task 460 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1039 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 466 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 1040 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 474 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: Running task 1041 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1043 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 491 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1058 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_patch)
NOTE: Running setscene task 492 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 497 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 503 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 509 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 510 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 518 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1064 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_patch)
NOTE: Running task 1066 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 1067 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_patch: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1074 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1075 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_generate_toolchain_file)
NOTE: Running task 1076 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_patch: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 531 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1108 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 533 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic unihash changed to 37f16816ed9b2211e15df525fb3177ba7f66a38698a8d61b88515d9615a695b9
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_patch: Succeeded
NOTE: Running task 1129 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 539 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1130 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 540 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 541 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 547 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1137 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_setscene)
NOTE: Running setscene task 558 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package_setscene)
NOTE: Running setscene task 559 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: Running task 1138 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_package_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_package_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 564 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 568 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 569 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 580 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1146 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 1147 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1149 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1151 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: Running setscene task 585 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package_setscene)
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: Running setscene task 586 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_package_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package_setscene)
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1153 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 588 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_package_setscene)
NOTE: Running task 1154 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: Running task 1155 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1156 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package_setscene)
NOTE: recipe curl-8.2.1-r0: task do_package_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_package_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package_setscene: Started
NOTE: recipe file-5.45-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 592 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_package_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 598 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 599 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 603 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: Running task 1170 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 606 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 611 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: Running task 1174 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1176 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 1177 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: Running setscene task 616 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1179 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1185 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: Running task 1186 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 622 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 623 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package_setscene)
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1192 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_package_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 625 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1224 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe curl-8.2.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 635 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 636 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1230 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1232 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1234 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package_setscene)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 654 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1235 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running setscene task 661 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package_setscene)
NOTE: recipe curl-8.2.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1238 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_package_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 669 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 671 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1260 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe curl-8.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: Running setscene task 673 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 674 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1263 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1265 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1267 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1270 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: recipe nettle-3.9.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 676 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1271 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_package_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1275 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1278 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_package_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 683 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 684 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1284 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1285 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1287 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: Running task 1288 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1669 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1677 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1683 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1689 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1788 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1819 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: Running task 1824 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_collect_spdx_deps)
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1829 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1834 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_collect_spdx_deps)
NOTE: Running task 1847 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe libxml2-2.11.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1848 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 1849 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_collect_spdx_deps)
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1852 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 1853 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_collect_spdx_deps)
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1854 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_collect_spdx_deps)
NOTE: recipe gmp-6.3.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1855 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_collect_spdx_deps)
NOTE: recipe zstd-1.5.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1863 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_collect_spdx_deps)
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1864 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1867 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_collect_spdx_deps)
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe acl-2.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe fts-1.2.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1895 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx)
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1915 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe acl-2.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1916 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Started
NOTE: Running task 1917 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 1918 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_configure)
NOTE: Running task 1919 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1920 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx)
NOTE: Running task 1921 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: Running task 1922 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx)
NOTE: Running task 1923 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: Running task 1924 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_create_spdx)
NOTE: Running task 1925 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx)
NOTE: Running task 1926 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx)
NOTE: recipe readline-8.2-r0: task do_configure: Started
NOTE: Running task 1927 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libpcre2-10.42-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1928 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx)
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.11.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1930 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_configure)
NOTE: recipe libxml2-2.11.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.11.4-r0: task do_configure: Started
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1931 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_collect_spdx_deps)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 1932 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_collect_spdx_deps)
NOTE: Running task 1933 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 1934 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_collect_spdx_deps)
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1935 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx)
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1936 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1937 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1938 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_create_spdx)
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1939 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_create_spdx: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1940 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1941 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_collect_spdx_deps)
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1942 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_create_spdx)
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe readline-8.2-r0: task do_configure: Succeeded
NOTE: Running task 1943 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_compile)
NOTE: recipe readline-8.2-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1944 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1945 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe readline-8.2-r0: task do_compile: Succeeded
NOTE: Running task 1946 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 1947 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe readline-8.2-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1948 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.42-r0: task do_configure: Succeeded
NOTE: Running task 1949 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_compile: Started
NOTE: Running task 1950 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe readline-8.2-r0: task do_install: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1952 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1953 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1954 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1955 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1956 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1957 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.4-r0: task do_configure: Succeeded
NOTE: Running task 1958 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.11.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.11.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1959 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1960 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.11.4-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1961 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to b8d4e14de5689437a569d5de13088a075db3647dff5723e14afb87a63b063894
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1962 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1965 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1966 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1967 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1968 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 1969 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe readline-8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1970 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1971 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 1972 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1973 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1974 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 1975 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 1976 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1977 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 1978 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.42-r0: task do_compile: Succeeded
NOTE: Running task 1979 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 1980 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_install: Succeeded
NOTE: Running task 1981 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot)
NOTE: Running task 1982 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_package)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1983 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1984 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_configure: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Succeeded
NOTE: Running task 1985 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Succeeded
NOTE: Running task 1986 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx)
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Succeeded
NOTE: Running task 1987 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_compile: Succeeded
NOTE: Running task 1988 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.11.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.11.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1989 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_install)
NOTE: recipe libxml2-2.11.4-r0: task do_install: Started
NOTE: recipe libxml2-2.11.4-r0: task do_install: Succeeded
NOTE: Running task 1990 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.11.4-r0: task do_install_ptest_base: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 1991 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_configure: Succeeded
NOTE: Running task 1992 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1993 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 1994 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 1996 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 1997 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1998 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1999 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package)
NOTE: Running task 2000 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.11.4-r0: task do_package: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_compile: Succeeded
NOTE: Running task 2001 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2002 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_install: Succeeded
NOTE: Running task 2003 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2004 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package)
NOTE: Running task 2005 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2006 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2007 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_configure)
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2008 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_compile)
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2009 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_install)
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 2010 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_package: Succeeded
NOTE: Running task 2011 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Failed
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2011 tasks of which 1818 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata
Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libxml2/2.11.4/temp/log.do_packagedata.57927
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata) failed with exit code '1'

--===============2121354631401357836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: RRECOMMENDS: added "libzstd-dbg"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1272996 to 1277868 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.21.1", added "/usr/lib/.debug/libcreaterepo_c.so.1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: RRECOMMENDS: added "libzstd-dev"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 146318 to 146430 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGSIZE changed from 16137 to 16193 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1271497 to 1277285 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 538980 to 547349 (+2%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0 /usr/lib/libcreaterepo_c.so.0.21.1", added "/usr/lib/libcreaterepo_c.so.1.0.0 /usr/lib/libcreaterepo_c.so.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: RDEPENDS: added "libzstd (['>= 1.5.5'])"
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c: SRC_URI changed from "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://0001-src-cmd_parser.c-add-a-missing-parameter-name.patch file://time64fix.patch" to "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://time64fix.patch"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so changed symlink target from libcreaterepo_c.so.0 to libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.0 moved to /usr/lib/libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.1.0.0 was added
  /usr/lib/libcreaterepo_c.so.0.21.1 was removed

--===============2121354631401357836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: RRECOMMENDS: added "libzstd-dbg"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: RRECOMMENDS: added "libzstd-dev"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0 /usr/lib/libcreaterepo_c.so.0.21.1", added "/usr/lib/libcreaterepo_c.so.1.0.0 /usr/lib/libcreaterepo_c.so.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: RDEPENDS: added "libzstd (['>= 1.5.5'])"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so changed symlink target from libcreaterepo_c.so.0 to libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.0 moved to /usr/lib/libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.1.0.0 was added
  /usr/lib/libcreaterepo_c.so.0.21.1 was removed

--===============2121354631401357836==--

