Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49A6C44506
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:30 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39122.1782887652168572971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lwDySz95;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=itQ89rle;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f1c6297e3-2d9fbcec-4a14-41b0-a84b-d7c58d22b3e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782887651;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=dI4DlQlc2+cR2EGiDvxL95glsiT/4U3t5aSbJRpAhEA=;
	b=lwDySz95G0KjDlcW+XKPZuKjfHRHb5F2311c6yqqtZxF4xSP7ufuD3b3gHs1BADp
	6KKrV5nfl0ZtEBhzNLSWudlzmt4w9q+NUHSg1CdVTX4cD2Un6L3qIdoLLDf9sKk8key
	Jb5faiuMIoCHzt8/s9MO8TW2/JP11S5Mkt9TYbrE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782887651;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=dI4DlQlc2+cR2EGiDvxL95glsiT/4U3t5aSbJRpAhEA=;
	b=itQ89rlenYhOSnCiWT+XHc1FqiMxh8HSqG+ejv6nXXj7GaT4WdRIPyCI5HYhIDb3
	q0SuqgHXSegpxYJ0cD/D/b3JwurSHciAmcPq/VYUiA/pKNdcy0QJeuElmpP8J9ECRB8
	V0SryWaTx2Nv3u/b5o1RZwWNC4dUXY9rFy+cLRmQ=
Content-Type: multipart/mixed; boundary="===============2499124784929619864=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libjpeg-turbo: upgrading to 3.2.0 SUCCEEDED
Message-ID: <0101019f1c6297e3-2d9fbcec-4a14-41b0-a84b-d7c58d22b3e4-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jul 2026 06:34:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239937

--===============2499124784929619864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpsaWJqcGVnLXR1cmJvKiB0byAqMy4yLjAqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBz
OgogICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLWxpYmpwZWctdHVyYm8tdXBncmFk
ZS0zLjEuNC4xLTMuMi4wLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFt
IHBhdGNoZXMgYW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAgIC0g
Y29tcGlsZSBhbiBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZvcm0g
c29tZSBiYXNpYyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWduIGl0
IG9mZjogZ2l0IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQgaXQg
dG8gdGhlIGFwcHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91IGJl
bGlldmUgdGhlIHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwKeW91
IGNhbiBmaWxsIFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZp
bGUgc28gdGhhdAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVtcHRl
ZC4KClBsZWFzZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0
aW9uIGFuZCBidWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxlIGEg
YnVnIGF0IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3By
b2R1Y3Q9QXV0b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUg
SGVscGVyCgotLSA+OCAtLQpGcm9tIGEyMGI1NzYyOGExMDIyNTgwZTViOTA1MDJhYzQyOThmMmFk
NzM5MTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhA
eW9jdG9wcm9qZWN0Lm9yZz4KRGF0ZTogV2VkLCAxIEp1bCAyMDI2IDA2OjE4OjM1ICswMDAwClN1
YmplY3Q6IFtQQVRDSF0gbGlianBlZy10dXJibzogdXBncmFkZSAzLjEuNC4xIC0+IDMuMi4wCgot
LS0KIC4uLnVyYm9fMy4xLjQuMS5iYiA9PiBsaWJqcGVnLXR1cmJvXzMuMi4wLmJifSB8IDE0NiAr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNDQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy97bGlianBlZy10
dXJib18zLjEuNC4xLmJiID0+IGxpYmpwZWctdHVyYm9fMy4yLjAuYmJ9ICgzMSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuNC4xLmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjIuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDMxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9s
aWJqcGVnLXR1cmJvXzMuMS40LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9q
cGVnL2xpYmpwZWctdHVyYm9fMy4yLjAuYmIKaW5kZXggYmI4ZDEyMDdmMi4uMWFlYTdjYTIxMyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEu
NC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4y
LjAuYmIKQEAgLTEsMTUgKzEsMTU3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5t
ZAorIyArKysgTElDRU5TRS5tZAorIyBAQCAtOCwxOCArOCw0NiBAQAorIyAgCisjICAgIFRoaXMg
bGljZW5zZSBhcHBsaWVzIHRvIHRoZSBsaWJqcGVnIEFQSSBsaWJyYXJ5IGFuZCBhc3NvY2lhdGVk
IHByb2dyYW1zLAorIyAgICBpbmNsdWRpbmcgYW55IGNvZGUgaW5oZXJpdGVkIGZyb20gbGlianBl
ZyBhbmQgYW55IG1vZGlmaWNhdGlvbnMgdG8gdGhhdAorIyAtICBjb2RlLiAgTm90ZSB0aGF0IHRo
ZSBsaWJqcGVnLXR1cmJvIFNJTUQgc291cmNlIGNvZGUgYmVhcnMgdGhlCisjIC0gIFt6bGliIExp
Y2Vuc2VdKGh0dHBzOi8vb3BlbnNvdXJjZS5vcmcvbGljZW5zZXMvWmxpYiksIGJ1dCBpbiB0aGUg
Y29udGV4dCBvZgorIyAtICB0aGUgb3ZlcmFsbCBsaWJqcGVnIEFQSSBsaWJyYXJ5LCB0aGUgdGVy
bXMgb2YgdGhlIHpsaWIgTGljZW5zZSBhcmUgc3Vic3VtZWQKKyMgLSAgYnkgdGhlIHRlcm1zIG9m
IHRoZSBJSkcgTGljZW5zZS4KKyMgKyAgY29kZS4KKyMgIAorIyAgLSBUaGUgTW9kaWZpZWQgKDMt
Y2xhdXNlKSBCU0QgTGljZW5zZSwgd2hpY2ggaXMgbGlzdGVkIGJlbG93CisjICAKKyMgLSAgVGhp
cyBsaWNlbnNlIGFwcGxpZXMgdG8gdGhlIFR1cmJvSlBFRyBBUEkgbGlicmFyeSBhbmQgYXNzb2Np
YXRlZCBwcm9ncmFtcywgYXMKKyMgLSAgd2VsbCBhcyB0aGUgYnVpbGQgc3lzdGVtLiAgTm90ZSB0
aGF0IHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgd3JhcHMgdGhlCisjIC0gIGxpYmpwZWcgQVBJ
IGxpYnJhcnksIHNvIGluIHRoZSBjb250ZXh0IG9mIHRoZSBvdmVyYWxsIFR1cmJvSlBFRyBBUEkg
bGlicmFyeSwKKyMgLSAgYm90aCB0aGUgdGVybXMgb2YgdGhlIElKRyBMaWNlbnNlIGFuZCB0aGUg
dGVybXMgb2YgdGhlIE1vZGlmaWVkICgzLWNsYXVzZSkKKyMgLSAgQlNEIExpY2Vuc2UgYXBwbHku
CisjICsgIFRoaXMgbGljZW5zZSBhcHBsaWVzIHRvIHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkg
YW5kIGFzc29jaWF0ZWQgcHJvZ3JhbXMsCisjICsgIFtsaWJzcG5nXShodHRwczovL2xpYnNwbmcu
b3JnKSAod2hpY2ggaXMgdXNlZCBieSBjanBlZyBhbmQgZGpwZWcpLCBhbmQgdGhlCisjICsgIGJ1
aWxkL3Rlc3Qgc3lzdGVtLgorIyArCisjICsgICogVGhlIFR1cmJvSlBFRyBBUEkgbGlicmFyeSB3
cmFwcyB0aGUgbGlianBlZyBBUEkgbGlicmFyeSwgc28gaW4gdGhlIGNvbnRleHQKKyMgKyAgICBv
ZiB0aGUgb3ZlcmFsbCBUdXJib0pQRUcgQVBJIGxpYnJhcnksIGJvdGggdGhlIHRlcm1zIG9mIHRo
ZSBJSkcgTGljZW5zZSBhbmQKKyMgKyAgICB0aGUgdGVybXMgb2YgdGhlIE1vZGlmaWVkICgzLWNs
YXVzZSkgQlNEIExpY2Vuc2UgYXBwbHkuCisjICsgICogY2pwZWcgYW5kIGRqcGVnIHVzZSBsaWJz
cG5nLCBzbyBpbiB0aGUgY29udGV4dCBvZiB0aG9zZSBwcm9ncmFtcywgYm90aCB0aGUKKyMgKyAg
ICB0ZXJtcyBvZiB0aGUgSUpHIExpY2Vuc2UgYW5kIHRoZSB0ZXJtcyBvZiB0aGUgTW9kaWZpZWQg
KDMtY2xhdXNlKSBCU0QKKyMgKyAgICBMaWNlbnNlIGFwcGx5LgorIyArCisjICsKKyMgK0NvbXBv
bmVudCBMaWNlbnNlcworIyArPT09PT09PT09PT09PT09PT09CisjICsKKyMgK1NvbWUgb2YgbGli
anBlZy10dXJibydzIG1vZHVsZXMgYW5kIGludGVybmFsIGRlcGVuZGVuY2llcyBhcmUgY292ZXJl
ZCBieSBsZXNzCisjICtyZXN0cmljdGl2ZSBsaWNlbnNlcywgYnV0IGluIHRoZSBjb250ZXh0IG9m
IGxpYmpwZWctdHVyYm8gYXMgYSB3aG9sZSwgdGhlIHRlcm1zCisjICtvZiB0aGUgbGVzcyByZXN0
cmljdGl2ZSBsaWNlbnNlcyBhcmUgc3Vic3VtZWQgYnkgZWl0aGVyIHRoZSBJSkcgTGljZW5zZSBv
ciB0aGUKKyMgK01vZGlmaWVkIEJTRCBMaWNlbnNlLiAgKEluIG90aGVyIHdvcmRzLCB0aGUgdGVy
bXMgb2YgdGhlIGxlc3MgcmVzdHJpY3RpdmUKKyMgK2xpY2Vuc2VzIGFyZSBzYXRpc2ZpZWQgaWYg
dGhlIHRlcm1zIG9mIHRoZSBJSkcgYW5kIE1vZGlmaWVkIEJTRCBMaWNlbnNlcyBhcmUKKyMgK3Nh
dGlzZmllZC4pCisjICsKKyMgKy0gVGhlIGxpYmpwZWctdHVyYm8gU0lNRCBzb3VyY2UgY29kZSBh
bmQgemxpYiBhcmUgY292ZXJlZCBieSB0aGUKKyMgKyAgW3psaWIgTGljZW5zZV0oaHR0cHM6Ly9z
cGR4Lm9yZy9saWNlbnNlcy9abGliLmh0bWwpLCB3aGljaCBpcyBzdWJzdW1lZCBieSB0aGUKKyMg
KyAgSUpHIExpY2Vuc2UgaW4gdGhlIGNvbnRleHQgb2YgdGhlIGNqcGVnIGFuZCBkanBlZyBwcm9n
cmFtcyBhbmQgdGhlIGxpYmpwZWcKKyMgKyAgQVBJIGxpYnJhcnkuCisjICsKKyMgKy0gU29tZSBv
ZiB0aGUgbGlic3BuZyBzb3VyY2UgY29kZSBpcyBjb3ZlcmVkIGJ5IHRoZQorIyArICBbUE5HIFJl
ZmVyZW5jZSBMaWJyYXJ5IExpY2Vuc2UgdjJdKGh0dHBzOi8vc3BkeC5vcmcvbGljZW5zZXMvbGli
cG5nLTIuMC5odG1sKSwKKyMgKyAgd2hpY2ggaXMgc3Vic3VtZWQgYnkgdGhlIElKRyBMaWNlbnNl
IGluIHRoZSBjb250ZXh0IG9mIHRoZSBjanBlZyBhbmQgZGpwZWcKKyMgKyAgcHJvZ3JhbXMgYW5k
IHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkuCisjICsKKyMgKy0gTW9zdCBvZiB0aGUgbGlic3Bu
ZyBzb3VyY2UgY29kZSBpcyBjb3ZlcmVkIGJ5IHRoZQorIyArICBbU2ltcGxpZmllZCAoMi1jbGF1
c2UpIEJTRCBMaWNlbnNlXShodHRwczovL3NwZHgub3JnL2xpY2Vuc2VzL0JTRC0yLUNsYXVzZS5o
dG1sKSwKKyMgKyAgd2hpY2ggaXMgc3Vic3VtZWQgYnkgdGhlIE1vZGlmaWVkIEJTRCBMaWNlbnNl
IGluIHRoZSBjb250ZXh0IG9mIHRoZSBjanBlZyBhbmQKKyMgKyAgZGpwZWcgcHJvZ3JhbXMgYW5k
IHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkuCisjICAKKyMgIAorIyAgQ29tcGx5aW5nIHdpdGgg
dGhlIGxpYmpwZWctdHVyYm8gTGljZW5zZXMKKyMgQEAgLTM4LDcgKzY2LDYgQEAKKyMgICAgICAg
ICAgKipPcmlnaW4qKgorIyAgICAgICAgICAtIENsYXVzZSAxIG9mIHRoZSBJSkcgTGljZW5zZQor
IyAgICAgICAgICAtIENsYXVzZSAxIG9mIHRoZSBNb2RpZmllZCBCU0QgTGljZW5zZQorIyAtICAg
ICAgICAtIENsYXVzZXMgMSBhbmQgMyBvZiB0aGUgemxpYiBMaWNlbnNlCisjICAKKyMgICAgICAy
LiAgWW91IG11c3QgYWRkIHlvdXIgb3duIGNvcHlyaWdodCBub3RpY2UgdG8gdGhlIGhlYWRlciBv
ZiBlYWNoIHNvdXJjZQorIyAgICAgICAgICBmaWxlIHlvdSBtb2RpZmllZCwgc28gb3RoZXJzIGNh
biB0ZWxsIHRoYXQgeW91IG1vZGlmaWVkIHRoYXQgZmlsZS4gIChJZgorIyBAQCAtNDcsNyArNzQs
NiBAQAorIyAgCisjICAgICAgICAgICoqT3JpZ2luKioKKyMgICAgICAgICAgLSBDbGF1c2UgMSBv
ZiB0aGUgSUpHIExpY2Vuc2UKKyMgLSAgICAgICAgLSBDbGF1c2UgMiBvZiB0aGUgemxpYiBMaWNl
bnNlCisjICAKKyMgICAgICAzLiAgWW91IG11c3QgaW5jbHVkZSB0aGUgSUpHIFJFQURNRSBmaWxl
LCBhbmQgeW91IG11c3Qgbm90IGFsdGVyIGFueSBvZiB0aGUKKyMgICAgICAgICAgY29weXJpZ2h0
IG9yIGxpY2Vuc2UgdGV4dCBpbiB0aGF0IGZpbGUuCisjIEBAIC02Nyw5ICs5Myw5IEBACisjICAg
ICAgICAgICoqT3JpZ2luKioKKyMgICAgICAgICAgLSBDbGF1c2UgMiBvZiB0aGUgSUpHIGxpY2Vu
c2UKKyMgIAorIyAtICAgIDIuICBJZiB5b3VyIGJpbmFyeSBkaXN0cmlidXRpb24gaW5jbHVkZXMg
b3IgdXNlcyB0aGUgVHVyYm9KUEVHIEFQSSwgdGhlbgorIyAtICAgICAgICB5b3VyIHByb2R1Y3Qg
ZG9jdW1lbnRhdGlvbiBtdXN0IGluY2x1ZGUgdGhlIHRleHQgb2YgdGhlIE1vZGlmaWVkIEJTRAor
IyAtICAgICAgICBMaWNlbnNlIChzZWUgYmVsb3cuKQorIyArICAgIDIuICBJZiB5b3VyIGJpbmFy
eSBkaXN0cmlidXRpb24gaW5jbHVkZXMgb3IgdXNlcyB0aGUgVHVyYm9KUEVHIEFQSSBvcgorIyAr
ICAgICAgICBhc3NvY2lhdGVkIHByb2dyYW1zLCBjanBlZywgb3IgZGpwZWcsIHRoZW4geW91ciBw
cm9kdWN0IGRvY3VtZW50YXRpb24KKyMgKyAgICAgICAgbXVzdCBpbmNsdWRlIHRoZSB0ZXh0IG9m
IHRoZSBNb2RpZmllZCBCU0QgTGljZW5zZSAoc2VlIGJlbG93LikKKyMgIAorIyAgICAgICAgICAq
Kk9yaWdpbioqCisjICAgICAgICAgIC0gQ2xhdXNlIDIgb2YgdGhlIE1vZGlmaWVkIEJTRCBMaWNl
bnNlCisjIEBAIC04MSwyMSArMTA3LDIwIEBACisjICAgICAgLSBJSkcgTGljZW5zZQorIyAgICAg
IC0gQ2xhdXNlIDMgb2YgdGhlIE1vZGlmaWVkIEJTRCBMaWNlbnNlCisjICAKKyMgLTQuICBUaGUg
SUpHIGFuZCBUaGUgbGlianBlZy10dXJibyBQcm9qZWN0IGRvIG5vdCB3YXJyYW50IGxpYmpwZWct
dHVyYm8gdG8gYmUKKyMgLSAgICBmcmVlIG9mIGRlZmVjdHMsIG5vciBkbyB3ZSBhY2NlcHQgYW55
IGxpYWJpbGl0eSBmb3IgdW5kZXNpcmFibGUKKyMgLSAgICBjb25zZXF1ZW5jZXMgcmVzdWx0aW5n
IGZyb20geW91ciB1c2Ugb2YgdGhlIHNvZnR3YXJlLgorIyArNC4gIFRoZSBhdXRob3JzIGFuZCBk
aXN0cmlidXRvcnMgZG8gbm90IHdhcnJhbnQgbGlianBlZy10dXJibyB0byBiZSBmcmVlIG9mCisj
ICsgICAgZGVmZWN0cywgbm9yIGRvIHdlIGFjY2VwdCBhbnkgbGlhYmlsaXR5IGZvciB1bmRlc2ly
YWJsZSBjb25zZXF1ZW5jZXMKKyMgKyAgICByZXN1bHRpbmcgZnJvbSB5b3VyIHVzZSBvZiB0aGUg
c29mdHdhcmUuCisjICAKKyMgICAgICAqKk9yaWdpbioqCisjICAgICAgLSBJSkcgTGljZW5zZQor
IyAgICAgIC0gTW9kaWZpZWQgQlNEIExpY2Vuc2UKKyMgLSAgICAtIHpsaWIgTGljZW5zZQorIyAg
CisjICAKKyMgIFRoZSBNb2RpZmllZCAoMy1jbGF1c2UpIEJTRCBMaWNlbnNlCisjICA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorIyAgCisjIC1Db3B5cmlnaHQgKEMpIDIwMDkt
MjAyNiBELiBSLiBDb21tYW5kZXIuICBBbGwgUmlnaHRzIFJlc2VydmVkLjxicj4KKyMgLUNvcHly
aWdodCAoQykgMjAxNSBWaWt0b3IgU3phdGhtw6FyeS4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisj
ICtDb3B5cmlnaHQgKEMpIDIwMDktMjAyNiBELiBSLiBDb21tYW5kZXI8YnI+CisjICtDb3B5cmln
aHQgKEMpIDIwMTgtMjAyMyBSYW5keSA8cmFuZHk0MDhAcHJvdG9ubWFpbC5jb20+CisjICAKKyMg
IFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGgg
b3Igd2l0aG91dAorIyAgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQg
dGhlIGZvbGxvd2luZyBjb25kaXRpb25zIGFyZSBtZXQ6CisjIEBAIC0xMjAsMTYgKzE0NSwzIEBA
CisjICBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwgT1IgVE9SVCAoSU5DTFVESU5HIE5FR0xJ
R0VOQ0UgT1IgT1RIRVJXSVNFKQorIyAgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBUSEUgVVNF
IE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUKKyMgIFBPU1NJQklMSVRZ
IE9GIFNVQ0ggREFNQUdFLgorIyAtCisjIC0KKyMgLVdoeSBUd28gTGljZW5zZXM/CisjIC09PT09
PT09PT09PT09PT09PQorIyAtCisjIC1UaGUgemxpYiBMaWNlbnNlIGNvdWxkIGhhdmUgYmVlbiB1
c2VkIGluc3RlYWQgb2YgdGhlIE1vZGlmaWVkICgzLWNsYXVzZSkgQlNECisjIC1MaWNlbnNlLCBh
bmQgc2luY2UgdGhlIElKRyBMaWNlbnNlIGVmZmVjdGl2ZWx5IHN1YnN1bWVzIHRoZSBkaXN0cmli
dXRpb24KKyMgLWNvbmRpdGlvbnMgb2YgdGhlIHpsaWIgTGljZW5zZSwgdGhpcyB3b3VsZCBoYXZl
IGVmZmVjdGl2ZWx5IHBsYWNlZAorIyAtbGlianBlZy10dXJibyBiaW5hcnkgZGlzdHJpYnV0aW9u
cyB1bmRlciB0aGUgSUpHIExpY2Vuc2UuICBIb3dldmVyLCB0aGUgSUpHCisjIC1MaWNlbnNlIHNw
ZWNpZmljYWxseSByZWZlcnMgdG8gdGhlIEluZGVwZW5kZW50IEpQRUcgR3JvdXAgYW5kIGRvZXMg
bm90IGV4dGVuZAorIyAtYXR0cmlidXRpb24gYW5kIGVuZG9yc2VtZW50IHByb3RlY3Rpb25zIHRv
IG90aGVyIGVudGl0aWVzLiAgVGh1cywgaXQgd2FzCisjIC1kZXNpcmFibGUgdG8gY2hvb3NlIGEg
bGljZW5zZSB0aGF0IGdyYW50ZWQgdXMgdGhlIHNhbWUgcHJvdGVjdGlvbnMgZm9yIG5ldyBjb2Rl
CisjIC10aGF0IHdlcmUgZ3JhbnRlZCB0byB0aGUgSUpHIGZvciBjb2RlIGRlcml2ZWQgZnJvbSB0
aGVpciBzb2Z0d2FyZS4KKyMgCisjCisKIFNVTU1BUlkgPSAiSGFyZHdhcmUgYWNjZWxlcmF0ZWQg
SlBFRyBjb21wcmVzc2lvbi9kZWNvbXByZXNzaW9uIGxpYnJhcnkiCiBERVNDUklQVElPTiA9ICJs
aWJqcGVnLXR1cmJvIGlzIGEgZGVyaXZhdGl2ZSBvZiBsaWJqcGVnIHRoYXQgdXNlcyBTSU1EIGlu
c3RydWN0aW9ucyAoTU1YLCBTU0UyLCBORU9OKSB0byBhY2NlbGVyYXRlIGJhc2VsaW5lIEpQRUcg
Y29tcHJlc3Npb24gYW5kIGRlY29tcHJlc3Npb24iCiBIT01FUEFHRSA9ICJodHRwOi8vbGlianBl
Zy10dXJiby5vcmcvIgogCiBMSUNFTlNFID0gIklKRyAmIEJTRC0zLUNsYXVzZSAmIFpsaWIiCi1M
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT01ZTIyMjIwOTk0ODMxZDdm
MGI5MWQwOWQ5NGM4OWE2MyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7
bWQ1PWQyMWRhZWYzYjRiMzE4Zjc3MDYyMDU1MDU5YzcyOTM0IgogCiBERVBFTkRTOmFwcGVuZDp4
ODYtNjQ6Y2xhc3MtdGFyZ2V0ID0gIiBuYXNtLW5hdGl2ZSIKIERFUEVORFM6YXBwZW5kOng4Njpj
bGFzcy10YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0Vf
VVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZWNhZTgwMDhlMmNjOWFkZTJmMmMxYmI5ZDVlNmQ0ZmI3M2U3YzQzMzg2NmEwNTZiZDgyOTgwNzQx
NTcxYTAyMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZjMwMDkyY2VmOWZiODM5Nzc5NjQ2NjA4
ZjRlZTE0YWUzY2JhYzk4OWM0N2ZhMDVlODQxYjA4NDFmMDk4NzhlIgogVVBTVFJFQU1fQ0hFQ0tf
UkVHRVggPSAicmVsZWFzZXMvdGFnLyg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxkKyhcLlxk
KykqKSIKIAogUEUgPSAiMSIKLS0gCjIuNDcuMQoK

--===============2499124784929619864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGSIZE changed from 283192 to 578104 (+104%)
packages/x86-64-v3-poky-linux/libjpeg-turbo: SRC_URI changed from "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.4.1/libjpeg-turbo-3.1.4.1.tar.gz" to "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.2.0/libjpeg-turbo-3.2.0.tar.gz"
packages/x86-64-v3-poky-linux/libjpeg-turbo: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: FILELIST: removed "/usr/lib/.debug/libturbojpeg.so.0.4.0", added "/usr/lib/.debug/libturbojpeg.so.0.5.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5870648 to 7453032 (+27%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 218601 to 223401 (+2%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGSIZE changed from 436511 to 446017 (+2%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: FILELIST: removed "/usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdsample.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcsample.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jinclude.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdsample.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdmrg565.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdcol565.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdatasrc.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcdctmgr.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcmarker.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcmaster.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdmarker.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdmaster.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/wrppm.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/rdgif.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcicc.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/
 jcmaster.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdmaster.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdct.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/rdbmp.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/djpeg.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/cjpeg.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jclossls.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdlossls.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.1.4.1/simd/x86_64/jsimd.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/turbojpeg.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/cderror.h /usr/src/debug/libjpeg-turbo/3.1.4.1/simd/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/wrtarga.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/cdjpeg.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/cdjpeg.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/wrbmp.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdarith.c /usr/src/debu
 g/libjpeg-turbo/3.1.4.1/src/jdcolor.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/turbojpeg-mp.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdinput.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdlhuff.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdmerge.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdphuff.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdtrans.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdmainct.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdpostct.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jfdctflt.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jfdctint.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jccoefct.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jccolext.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jpeg_nbits.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/rdswitch.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/wrjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/rdcolmap.c /usr/src/debug/libjpeg
 -turbo/3.1.4.1/src/transupp.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/transupp.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcparam.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcphuff.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jctrans.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jccolor.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdcoefct.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdmainct.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jsimddct.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcmainct.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jidctflt.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jidctfst.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jidctint.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcprepct.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdatadst.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdcolext.c /usr/src/debug/libjpeg-turbo/3.1
 .4.1/src/jddiffct.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/cmyk.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdicc.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jstdhuff.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/wrgif.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcapistd.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdapistd.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jidctred.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/rdppm.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcapimin.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdapimin.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jpegtran.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdmerge.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jlossls.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jmemsys.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jpegint.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jpeglib.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jclhuff.c /usr/src/deb
 ug/libjpeg-turbo/3.1.4.1/src/jcomapi.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/rdtarga.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/tjbench.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jaricom.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jquant1.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jquant2.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcarith.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jutils.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/tjutil.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jchuff.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jcinit.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdhuff.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jerror.c /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jchuff.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jdhuff.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jerror.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/tjutil.h /usr/src/debug/libjpeg-turbo/3.1.4.1/src/jmorecfg.h", added "/usr/src/debug/libjpeg-turbo/3.2.0/src/jcprepct.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jc
 dctmgr.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jpegint.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jclossls.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcparam.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcphuff.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/zlib.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jquant2.c /usr/src/debug/libjpeg-turbo/3.2.0/src/cmyk.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdsample.c /usr/src/debug/libjpeg-turbo/3.2.0/src/tjutil.h /usr/src/debug/libjpeg-turbo/3.2.0/src/rdppm.c /usr/src/debug/libjpeg-turbo/3.2.0/src/wrppm.c /usr/src/debug/libjpeg-turbo/3.2.0/src/tjutil.c /usr/src/debug/libjpeg-turbo/3.2.0/src/cjpeg.c /usr/src/debug/libjpeg-turbo/3.2.0/src/djpeg.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jstdhuff.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdmerge.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdmerge.c /usr/src/debug/libjpeg-turbo/3.2.0/src/tjbench.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/spng.c /usr/src
 /debug/libjpeg-turbo/3.2.0/src/jclhuff.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/spng.h /usr/src/debug/libjpeg-turbo/3.2.0/src/rdbmp.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.2.0/src/wrjpgcom.c /usr/src/debug/libjpeg-turbo/3.2.0/src/wrgif.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jctrans.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jquant1.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/inffast.h /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/inflate.h /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/adler32.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/inffast.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/inflate.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jinclude.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jccolor.c /usr/src/debug/libjpeg-turbo/3.2.0/src/rdtarga.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jidctflt.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jidctfst.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jidctint.c /usr/src/debug/libjp
 eg-turbo/3.2.0/src/jidctred.c /usr/src/debug/libjpeg-turbo/3.2.0/simd/jsimd.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jmorecfg.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.2.0/simd/jsimd.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdcolor.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/zutil.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcinit.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/zutil.h /usr/src/debug/libjpeg-turbo/3.2.0/src/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jmemsys.h /usr/src/debug/libjpeg-turbo/3.2.0/src/turbojpeg.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jerror.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdcol565.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdlhuff.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdatadst.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdatasrc.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdsample.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdmainct.c /usr/src/
 debug/libjpeg-turbo/3.2.0/src/jdmarker.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdmaster.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdmrg565.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jerror.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdcoefct.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdmainct.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdhuff.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdmaster.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdtrans.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdhuff.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jutils.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcomapi.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/trees.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcapimin.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcapistd.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jccoefct.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jccolext.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcmainct.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcmarker.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcmaster.c /usr/src/
 debug/libjpeg-turbo/3.2.0/src/jcmaster.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdicc.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jcsample.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/trees.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jcicc.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jchuff.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdphuff.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jchuff.c /usr/src/debug/libjpeg-turbo/3.2.0/src/rdgif.c /usr/src/debug/libjpeg-turbo/3.2.0/src/cdjpeg.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdarith.c /usr/src/debug/libjpeg-turbo/3.2.0/src/cdjpeg.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jpeglib.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdapimin.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdapistd.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jaricom.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jfdctflt.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jfdctint.c /usr/src/debug/libjpeg-turbo/3.2.0/src/transupp.c /usr/src/debug/libjp
 eg-turbo/3.2.0/src/spng/zlib/inftrees.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdcolext.c /usr/src/debug/libjpeg-turbo/3.2.0/src/rdcolmap.c /usr/src/debug/libjpeg-turbo/3.2.0/src/transupp.h /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/compress.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/inftrees.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/deflate.h /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/deflate.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdct.h /usr/src/debug/libjpeg-turbo/3.2.0/simd/jsimddct.h /usr/src/debug/libjpeg-turbo/3.2.0/simd/jsimdint.h /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/crc32.c /usr/src/debug/libjpeg-turbo/3.2.0/src/wrpng.c /usr/src/debug/libjpeg-turbo/3.2.0/src/wrtarga.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jpeg_nbits.h /usr/src/debug/libjpeg-turbo/3.2.0/src/rdpng.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/crc32.h /usr/src/debug/libjpeg-turbo/3.2.0/src/turbojpeg-mp.c /usr/src
 /debug/libjpeg-turbo/3.2.0/src/cderror.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jlossls.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jdinput.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdlossls.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jddiffct.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jdpostct.c /usr/src/debug/libjpeg-turbo/3.2.0/src/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/inffixed.h /usr/src/debug/libjpeg-turbo/3.2.0/src/wrbmp.c /usr/src/debug/libjpeg-turbo/3.2.0/src/spng/zlib/zconf.h /usr/src/debug/libjpeg-turbo/3.2.0/src/jcarith.c /usr/src/debug/libjpeg-turbo/3.2.0/src/rdswitch.c /usr/src/debug/libjpeg-turbo/3.2.0/src/jpegtran.c"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2125782 to 3414643 (+61%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGSIZE changed from 755769 to 731121 (-3%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "3.1.4.1" to "3.2.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 3.1.4.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: FILELIST: removed "/usr/lib/libturbojpeg.so.0.4.0", added "/usr/lib/libturbojpeg.so.0.5.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 899549 to 1051157 (+17%)
Changes to packages/x86-64-v3-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/libturbojpeg.so.0 changed symlink target from libturbojpeg.so.0.4.0 to libturbojpeg.so.0.5.0
  /usr/lib/libturbojpeg.so.0.4.0 moved to /usr/lib/libturbojpeg.so.0.5.0

--===============2499124784929619864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGSIZE changed from 283192 to 578104 (+104%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5870648 to 7453032 (+27%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2125782 to 3414643 (+61%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: FILELIST: removed "/usr/lib/libturbojpeg.so.0.4.0", added "/usr/lib/libturbojpeg.so.0.5.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 899549 to 1051157 (+17%)
Changes to packages/x86-64-v3-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/libturbojpeg.so.0 changed symlink target from libturbojpeg.so.0.4.0 to libturbojpeg.so.0.5.0
  /usr/lib/libturbojpeg.so.0.4.0 moved to /usr/lib/libturbojpeg.so.0.5.0

--===============2499124784929619864==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-3.1.4.1-3.2.0.patch"

RnJvbSBhMjBiNTc2MjhhMTAyMjU4MGU1YjkwNTAyYWM0Mjk4ZjJhZDczOTEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKdWwgMjAyNiAwNjoxODozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmpwZWctdHVyYm86IHVwZ3JhZGUgMy4xLjQuMSAtPiAzLjIuMAoKLS0tCiAuLi51cmJvXzMuMS40
LjEuYmIgPT4gbGlianBlZy10dXJib18zLjIuMC5iYn0gfCAxNDYgKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgMTQ0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcve2xpYmpwZWctdHVyYm9fMy4xLjQuMS5iYiA9
PiBsaWJqcGVnLXR1cmJvXzMuMi4wLmJifSAoMzElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjQuMS5iYiBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4yLjAuYmIKc2ltaWxhcml0eSBpbmRleCAzMSUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEu
NC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJv
XzMuMi4wLmJiCmluZGV4IGJiOGQxMjA3ZjIuLjFhZWE3Y2EyMTMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjQuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMi4wLmJiCkBAIC0xLDE1ICsx
LDE1NyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1
cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFz
ZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBj
aGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFn
LgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4n
KQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UubWQKKyMgKysrIExJQ0VOU0Uu
bWQKKyMgQEAgLTgsMTggKzgsNDYgQEAKKyMgIAorIyAgICBUaGlzIGxpY2Vuc2UgYXBwbGllcyB0
byB0aGUgbGlianBlZyBBUEkgbGlicmFyeSBhbmQgYXNzb2NpYXRlZCBwcm9ncmFtcywKKyMgICAg
aW5jbHVkaW5nIGFueSBjb2RlIGluaGVyaXRlZCBmcm9tIGxpYmpwZWcgYW5kIGFueSBtb2RpZmlj
YXRpb25zIHRvIHRoYXQKKyMgLSAgY29kZS4gIE5vdGUgdGhhdCB0aGUgbGlianBlZy10dXJibyBT
SU1EIHNvdXJjZSBjb2RlIGJlYXJzIHRoZQorIyAtICBbemxpYiBMaWNlbnNlXShodHRwczovL29w
ZW5zb3VyY2Uub3JnL2xpY2Vuc2VzL1psaWIpLCBidXQgaW4gdGhlIGNvbnRleHQgb2YKKyMgLSAg
dGhlIG92ZXJhbGwgbGlianBlZyBBUEkgbGlicmFyeSwgdGhlIHRlcm1zIG9mIHRoZSB6bGliIExp
Y2Vuc2UgYXJlIHN1YnN1bWVkCisjIC0gIGJ5IHRoZSB0ZXJtcyBvZiB0aGUgSUpHIExpY2Vuc2Uu
CisjICsgIGNvZGUuCisjICAKKyMgIC0gVGhlIE1vZGlmaWVkICgzLWNsYXVzZSkgQlNEIExpY2Vu
c2UsIHdoaWNoIGlzIGxpc3RlZCBiZWxvdworIyAgCisjIC0gIFRoaXMgbGljZW5zZSBhcHBsaWVz
IHRvIHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgYW5kIGFzc29jaWF0ZWQgcHJvZ3JhbXMsIGFz
CisjIC0gIHdlbGwgYXMgdGhlIGJ1aWxkIHN5c3RlbS4gIE5vdGUgdGhhdCB0aGUgVHVyYm9KUEVH
IEFQSSBsaWJyYXJ5IHdyYXBzIHRoZQorIyAtICBsaWJqcGVnIEFQSSBsaWJyYXJ5LCBzbyBpbiB0
aGUgY29udGV4dCBvZiB0aGUgb3ZlcmFsbCBUdXJib0pQRUcgQVBJIGxpYnJhcnksCisjIC0gIGJv
dGggdGhlIHRlcm1zIG9mIHRoZSBJSkcgTGljZW5zZSBhbmQgdGhlIHRlcm1zIG9mIHRoZSBNb2Rp
ZmllZCAoMy1jbGF1c2UpCisjIC0gIEJTRCBMaWNlbnNlIGFwcGx5LgorIyArICBUaGlzIGxpY2Vu
c2UgYXBwbGllcyB0byB0aGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IGFuZCBhc3NvY2lhdGVkIHBy
b2dyYW1zLAorIyArICBbbGlic3BuZ10oaHR0cHM6Ly9saWJzcG5nLm9yZykgKHdoaWNoIGlzIHVz
ZWQgYnkgY2pwZWcgYW5kIGRqcGVnKSwgYW5kIHRoZQorIyArICBidWlsZC90ZXN0IHN5c3RlbS4K
KyMgKworIyArICAqIFRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgd3JhcHMgdGhlIGxpYmpwZWcg
QVBJIGxpYnJhcnksIHNvIGluIHRoZSBjb250ZXh0CisjICsgICAgb2YgdGhlIG92ZXJhbGwgVHVy
Ym9KUEVHIEFQSSBsaWJyYXJ5LCBib3RoIHRoZSB0ZXJtcyBvZiB0aGUgSUpHIExpY2Vuc2UgYW5k
CisjICsgICAgdGhlIHRlcm1zIG9mIHRoZSBNb2RpZmllZCAoMy1jbGF1c2UpIEJTRCBMaWNlbnNl
IGFwcGx5LgorIyArICAqIGNqcGVnIGFuZCBkanBlZyB1c2UgbGlic3BuZywgc28gaW4gdGhlIGNv
bnRleHQgb2YgdGhvc2UgcHJvZ3JhbXMsIGJvdGggdGhlCisjICsgICAgdGVybXMgb2YgdGhlIElK
RyBMaWNlbnNlIGFuZCB0aGUgdGVybXMgb2YgdGhlIE1vZGlmaWVkICgzLWNsYXVzZSkgQlNECisj
ICsgICAgTGljZW5zZSBhcHBseS4KKyMgKworIyArCisjICtDb21wb25lbnQgTGljZW5zZXMKKyMg
Kz09PT09PT09PT09PT09PT09PQorIyArCisjICtTb21lIG9mIGxpYmpwZWctdHVyYm8ncyBtb2R1
bGVzIGFuZCBpbnRlcm5hbCBkZXBlbmRlbmNpZXMgYXJlIGNvdmVyZWQgYnkgbGVzcworIyArcmVz
dHJpY3RpdmUgbGljZW5zZXMsIGJ1dCBpbiB0aGUgY29udGV4dCBvZiBsaWJqcGVnLXR1cmJvIGFz
IGEgd2hvbGUsIHRoZSB0ZXJtcworIyArb2YgdGhlIGxlc3MgcmVzdHJpY3RpdmUgbGljZW5zZXMg
YXJlIHN1YnN1bWVkIGJ5IGVpdGhlciB0aGUgSUpHIExpY2Vuc2Ugb3IgdGhlCisjICtNb2RpZmll
ZCBCU0QgTGljZW5zZS4gIChJbiBvdGhlciB3b3JkcywgdGhlIHRlcm1zIG9mIHRoZSBsZXNzIHJl
c3RyaWN0aXZlCisjICtsaWNlbnNlcyBhcmUgc2F0aXNmaWVkIGlmIHRoZSB0ZXJtcyBvZiB0aGUg
SUpHIGFuZCBNb2RpZmllZCBCU0QgTGljZW5zZXMgYXJlCisjICtzYXRpc2ZpZWQuKQorIyArCisj
ICstIFRoZSBsaWJqcGVnLXR1cmJvIFNJTUQgc291cmNlIGNvZGUgYW5kIHpsaWIgYXJlIGNvdmVy
ZWQgYnkgdGhlCisjICsgIFt6bGliIExpY2Vuc2VdKGh0dHBzOi8vc3BkeC5vcmcvbGljZW5zZXMv
WmxpYi5odG1sKSwgd2hpY2ggaXMgc3Vic3VtZWQgYnkgdGhlCisjICsgIElKRyBMaWNlbnNlIGlu
IHRoZSBjb250ZXh0IG9mIHRoZSBjanBlZyBhbmQgZGpwZWcgcHJvZ3JhbXMgYW5kIHRoZSBsaWJq
cGVnCisjICsgIEFQSSBsaWJyYXJ5LgorIyArCisjICstIFNvbWUgb2YgdGhlIGxpYnNwbmcgc291
cmNlIGNvZGUgaXMgY292ZXJlZCBieSB0aGUKKyMgKyAgW1BORyBSZWZlcmVuY2UgTGlicmFyeSBM
aWNlbnNlIHYyXShodHRwczovL3NwZHgub3JnL2xpY2Vuc2VzL2xpYnBuZy0yLjAuaHRtbCksCisj
ICsgIHdoaWNoIGlzIHN1YnN1bWVkIGJ5IHRoZSBJSkcgTGljZW5zZSBpbiB0aGUgY29udGV4dCBv
ZiB0aGUgY2pwZWcgYW5kIGRqcGVnCisjICsgIHByb2dyYW1zIGFuZCB0aGUgVHVyYm9KUEVHIEFQ
SSBsaWJyYXJ5LgorIyArCisjICstIE1vc3Qgb2YgdGhlIGxpYnNwbmcgc291cmNlIGNvZGUgaXMg
Y292ZXJlZCBieSB0aGUKKyMgKyAgW1NpbXBsaWZpZWQgKDItY2xhdXNlKSBCU0QgTGljZW5zZV0o
aHR0cHM6Ly9zcGR4Lm9yZy9saWNlbnNlcy9CU0QtMi1DbGF1c2UuaHRtbCksCisjICsgIHdoaWNo
IGlzIHN1YnN1bWVkIGJ5IHRoZSBNb2RpZmllZCBCU0QgTGljZW5zZSBpbiB0aGUgY29udGV4dCBv
ZiB0aGUgY2pwZWcgYW5kCisjICsgIGRqcGVnIHByb2dyYW1zIGFuZCB0aGUgVHVyYm9KUEVHIEFQ
SSBsaWJyYXJ5LgorIyAgCisjICAKKyMgIENvbXBseWluZyB3aXRoIHRoZSBsaWJqcGVnLXR1cmJv
IExpY2Vuc2VzCisjIEBAIC0zOCw3ICs2Niw2IEBACisjICAgICAgICAgICoqT3JpZ2luKioKKyMg
ICAgICAgICAgLSBDbGF1c2UgMSBvZiB0aGUgSUpHIExpY2Vuc2UKKyMgICAgICAgICAgLSBDbGF1
c2UgMSBvZiB0aGUgTW9kaWZpZWQgQlNEIExpY2Vuc2UKKyMgLSAgICAgICAgLSBDbGF1c2VzIDEg
YW5kIDMgb2YgdGhlIHpsaWIgTGljZW5zZQorIyAgCisjICAgICAgMi4gIFlvdSBtdXN0IGFkZCB5
b3VyIG93biBjb3B5cmlnaHQgbm90aWNlIHRvIHRoZSBoZWFkZXIgb2YgZWFjaCBzb3VyY2UKKyMg
ICAgICAgICAgZmlsZSB5b3UgbW9kaWZpZWQsIHNvIG90aGVycyBjYW4gdGVsbCB0aGF0IHlvdSBt
b2RpZmllZCB0aGF0IGZpbGUuICAoSWYKKyMgQEAgLTQ3LDcgKzc0LDYgQEAKKyMgIAorIyAgICAg
ICAgICAqKk9yaWdpbioqCisjICAgICAgICAgIC0gQ2xhdXNlIDEgb2YgdGhlIElKRyBMaWNlbnNl
CisjIC0gICAgICAgIC0gQ2xhdXNlIDIgb2YgdGhlIHpsaWIgTGljZW5zZQorIyAgCisjICAgICAg
My4gIFlvdSBtdXN0IGluY2x1ZGUgdGhlIElKRyBSRUFETUUgZmlsZSwgYW5kIHlvdSBtdXN0IG5v
dCBhbHRlciBhbnkgb2YgdGhlCisjICAgICAgICAgIGNvcHlyaWdodCBvciBsaWNlbnNlIHRleHQg
aW4gdGhhdCBmaWxlLgorIyBAQCAtNjcsOSArOTMsOSBAQAorIyAgICAgICAgICAqKk9yaWdpbioq
CisjICAgICAgICAgIC0gQ2xhdXNlIDIgb2YgdGhlIElKRyBsaWNlbnNlCisjICAKKyMgLSAgICAy
LiAgSWYgeW91ciBiaW5hcnkgZGlzdHJpYnV0aW9uIGluY2x1ZGVzIG9yIHVzZXMgdGhlIFR1cmJv
SlBFRyBBUEksIHRoZW4KKyMgLSAgICAgICAgeW91ciBwcm9kdWN0IGRvY3VtZW50YXRpb24gbXVz
dCBpbmNsdWRlIHRoZSB0ZXh0IG9mIHRoZSBNb2RpZmllZCBCU0QKKyMgLSAgICAgICAgTGljZW5z
ZSAoc2VlIGJlbG93LikKKyMgKyAgICAyLiAgSWYgeW91ciBiaW5hcnkgZGlzdHJpYnV0aW9uIGlu
Y2x1ZGVzIG9yIHVzZXMgdGhlIFR1cmJvSlBFRyBBUEkgb3IKKyMgKyAgICAgICAgYXNzb2NpYXRl
ZCBwcm9ncmFtcywgY2pwZWcsIG9yIGRqcGVnLCB0aGVuIHlvdXIgcHJvZHVjdCBkb2N1bWVudGF0
aW9uCisjICsgICAgICAgIG11c3QgaW5jbHVkZSB0aGUgdGV4dCBvZiB0aGUgTW9kaWZpZWQgQlNE
IExpY2Vuc2UgKHNlZSBiZWxvdy4pCisjICAKKyMgICAgICAgICAgKipPcmlnaW4qKgorIyAgICAg
ICAgICAtIENsYXVzZSAyIG9mIHRoZSBNb2RpZmllZCBCU0QgTGljZW5zZQorIyBAQCAtODEsMjEg
KzEwNywyMCBAQAorIyAgICAgIC0gSUpHIExpY2Vuc2UKKyMgICAgICAtIENsYXVzZSAzIG9mIHRo
ZSBNb2RpZmllZCBCU0QgTGljZW5zZQorIyAgCisjIC00LiAgVGhlIElKRyBhbmQgVGhlIGxpYmpw
ZWctdHVyYm8gUHJvamVjdCBkbyBub3Qgd2FycmFudCBsaWJqcGVnLXR1cmJvIHRvIGJlCisjIC0g
ICAgZnJlZSBvZiBkZWZlY3RzLCBub3IgZG8gd2UgYWNjZXB0IGFueSBsaWFiaWxpdHkgZm9yIHVu
ZGVzaXJhYmxlCisjIC0gICAgY29uc2VxdWVuY2VzIHJlc3VsdGluZyBmcm9tIHlvdXIgdXNlIG9m
IHRoZSBzb2Z0d2FyZS4KKyMgKzQuICBUaGUgYXV0aG9ycyBhbmQgZGlzdHJpYnV0b3JzIGRvIG5v
dCB3YXJyYW50IGxpYmpwZWctdHVyYm8gdG8gYmUgZnJlZSBvZgorIyArICAgIGRlZmVjdHMsIG5v
ciBkbyB3ZSBhY2NlcHQgYW55IGxpYWJpbGl0eSBmb3IgdW5kZXNpcmFibGUgY29uc2VxdWVuY2Vz
CisjICsgICAgcmVzdWx0aW5nIGZyb20geW91ciB1c2Ugb2YgdGhlIHNvZnR3YXJlLgorIyAgCisj
ICAgICAgKipPcmlnaW4qKgorIyAgICAgIC0gSUpHIExpY2Vuc2UKKyMgICAgICAtIE1vZGlmaWVk
IEJTRCBMaWNlbnNlCisjIC0gICAgLSB6bGliIExpY2Vuc2UKKyMgIAorIyAgCisjICBUaGUgTW9k
aWZpZWQgKDMtY2xhdXNlKSBCU0QgTGljZW5zZQorIyAgPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KKyMgIAorIyAtQ29weXJpZ2h0IChDKSAyMDA5LTIwMjYgRC4gUi4gQ29tbWFu
ZGVyLiAgQWxsIFJpZ2h0cyBSZXNlcnZlZC48YnI+CisjIC1Db3B5cmlnaHQgKEMpIDIwMTUgVmlr
dG9yIFN6YXRobcOhcnkuICBBbGwgUmlnaHRzIFJlc2VydmVkLgorIyArQ29weXJpZ2h0IChDKSAy
MDA5LTIwMjYgRC4gUi4gQ29tbWFuZGVyPGJyPgorIyArQ29weXJpZ2h0IChDKSAyMDE4LTIwMjMg
UmFuZHkgPHJhbmR5NDA4QHByb3Rvbm1haWwuY29tPgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBh
bmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgIG1v
ZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29u
ZGl0aW9ucyBhcmUgbWV0OgorIyBAQCAtMTIwLDE2ICsxNDUsMyBAQAorIyAgQ09OVFJBQ1QsIFNU
UklDVCBMSUFCSUxJVFksIE9SIFRPUlQgKElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lT
RSkKKyMgIEFSSVNJTkcgSU4gQU5ZIFdBWSBPVVQgT0YgVEhFIFVTRSBPRiBUSElTIFNPRlRXQVJF
LCBFVkVOIElGIEFEVklTRUQgT0YgVEhFCisjICBQT1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRS4K
KyMgLQorIyAtCisjIC1XaHkgVHdvIExpY2Vuc2VzPworIyAtPT09PT09PT09PT09PT09PT0KKyMg
LQorIyAtVGhlIHpsaWIgTGljZW5zZSBjb3VsZCBoYXZlIGJlZW4gdXNlZCBpbnN0ZWFkIG9mIHRo
ZSBNb2RpZmllZCAoMy1jbGF1c2UpIEJTRAorIyAtTGljZW5zZSwgYW5kIHNpbmNlIHRoZSBJSkcg
TGljZW5zZSBlZmZlY3RpdmVseSBzdWJzdW1lcyB0aGUgZGlzdHJpYnV0aW9uCisjIC1jb25kaXRp
b25zIG9mIHRoZSB6bGliIExpY2Vuc2UsIHRoaXMgd291bGQgaGF2ZSBlZmZlY3RpdmVseSBwbGFj
ZWQKKyMgLWxpYmpwZWctdHVyYm8gYmluYXJ5IGRpc3RyaWJ1dGlvbnMgdW5kZXIgdGhlIElKRyBM
aWNlbnNlLiAgSG93ZXZlciwgdGhlIElKRworIyAtTGljZW5zZSBzcGVjaWZpY2FsbHkgcmVmZXJz
IHRvIHRoZSBJbmRlcGVuZGVudCBKUEVHIEdyb3VwIGFuZCBkb2VzIG5vdCBleHRlbmQKKyMgLWF0
dHJpYnV0aW9uIGFuZCBlbmRvcnNlbWVudCBwcm90ZWN0aW9ucyB0byBvdGhlciBlbnRpdGllcy4g
IFRodXMsIGl0IHdhcworIyAtZGVzaXJhYmxlIHRvIGNob29zZSBhIGxpY2Vuc2UgdGhhdCBncmFu
dGVkIHVzIHRoZSBzYW1lIHByb3RlY3Rpb25zIGZvciBuZXcgY29kZQorIyAtdGhhdCB3ZXJlIGdy
YW50ZWQgdG8gdGhlIElKRyBmb3IgY29kZSBkZXJpdmVkIGZyb20gdGhlaXIgc29mdHdhcmUuCisj
IAorIworCiBTVU1NQVJZID0gIkhhcmR3YXJlIGFjY2VsZXJhdGVkIEpQRUcgY29tcHJlc3Npb24v
ZGVjb21wcmVzc2lvbiBsaWJyYXJ5IgogREVTQ1JJUFRJT04gPSAibGlianBlZy10dXJibyBpcyBh
IGRlcml2YXRpdmUgb2YgbGlianBlZyB0aGF0IHVzZXMgU0lNRCBpbnN0cnVjdGlvbnMgKE1NWCwg
U1NFMiwgTkVPTikgdG8gYWNjZWxlcmF0ZSBiYXNlbGluZSBKUEVHIGNvbXByZXNzaW9uIGFuZCBk
ZWNvbXByZXNzaW9uIgogSE9NRVBBR0UgPSAiaHR0cDovL2xpYmpwZWctdHVyYm8ub3JnLyIKIAog
TElDRU5TRSA9ICJJSkcgJiBCU0QtMy1DbGF1c2UgJiBabGliIgotTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9NWUyMjIyMDk5NDgzMWQ3ZjBiOTFkMDlkOTRjODlhNjMi
CitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1kMjFkYWVmM2I0YjMx
OGY3NzA2MjA1NTA1OWM3MjkzNCIKIAogREVQRU5EUzphcHBlbmQ6eDg2LTY0OmNsYXNzLXRhcmdl
dCA9ICIgbmFzbS1uYXRpdmUiCiBERVBFTkRTOmFwcGVuZDp4ODY6Y2xhc3MtdGFyZ2V0ID0gIiBu
YXNtLW5hdGl2ZSIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQ
Vn0vJHtCUH0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImVjYWU4MDA4ZTJjYzlhZGUy
ZjJjMWJiOWQ1ZTZkNGZiNzNlN2M0MzM4NjZhMDU2YmQ4Mjk4MDc0MTU3MWEwMjIiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNmYzMDA5MmNlZjlmYjgzOTc3OTY0NjYwOGY0ZWUxNGFlM2NiYWM5ODlj
NDdmYTA1ZTg0MWIwODQxZjA5ODc4ZSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2Vz
L3RhZy8oP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylcZCsoXC5cZCspKikiCiAKIFBFID0gIjEi
Ci0tIAoyLjQ3LjEKCg==

--===============2499124784929619864==--

