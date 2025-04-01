Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC13C3601E
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.18041.1743511391305582741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RlksXm9j;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FSLDsbZY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010195f160896c-2158127d-1e7b-4c8f-9aa6-1c4cf55c1dde-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xXlZRXCguEs6PerG7uDpcGW9d7HFsqp9ow4do7bjwrI=;
	b=RlksXm9jSmWNHjIC6M8aL2UXR5Ss8dMk4ehonz6nUo2Icm+uvlLbiU5dbtu1X1wv
	Wp5aK5NAiWcue/9GXj9zhKzKENiDEXRnq56avtOdSd1oKd3ugHfoRvUU5nyuqBiyQXK
	uf0SLiEJkkOY/kI2CwApgrItO25/SoXhpofHO6vs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xXlZRXCguEs6PerG7uDpcGW9d7HFsqp9ow4do7bjwrI=;
	b=FSLDsbZYtuZeQklNgcP3fzU6SB8gttJpy92AffTkj9wiaRtvJOgXo9ri9to/NSCx
	kxdlhhzjdDwSE1dFRu+RaUhXpXtUIGTshTv1s2mvxsC2vjwLo311kBODewL8NYZ9Yb6
	Cu6GUITqs7H6O5QmSbX6bFsJ7LU0J2BGelUZ/9BY=
Content-Type: multipart/mixed; boundary="===============0786803920376776470=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.80 FAILED
Message-ID: <01010195f160896c-2158127d-1e7b-4c8f-9aa6-1c4cf55c1dde-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214037

--===============0786803920376776470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpibHVlejUqIHRvICo1LjgwKiBoYXMgRmFpbGVkKGRvX2NvbXBpbGUpLgoKRGV0YWlsZWQg
ZXJyb3IgaW5mb3JtYXRpb246Cgpkb19jb21waWxlIGZhaWxlZAoKCgpOZXh0IHN0ZXBzOgogICAg
LSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLWJsdWV6NS11cGdyYWRlLTUuNzktNS44MC5w
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
RnJvbSBiODY5NjA1YTgyMWE2MmUxN2M4MjEwYjgxYmI2OWQxOGY0NmY3MGJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNjo1MzoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJs
dWV6NTogdXBncmFkZSA1Ljc5IC0+IDUuODAKCi0tLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9ibHVlejUvYmx1ZXo1LmluYyAgIHwgIDQgLS0KIC4uLjAwMDEtZ2RidXMtZGVmaW5lLU1BWF9J
TlBVVC1mb3ItbXVzbC5wYXRjaCB8IDM0IC0tLS0tLS0tLS0tCiAuLi4tc2hhcmVkLWFkLWZpeC1z
dGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLQogLi4uLzAwMDEtdGVz
dC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoICAgICAgIHwgIDIgKy0KIC4uLmV0LWZvci1idWls
ZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRjaCB8ICA2ICstCiAuLi5hcmVkLXNoZWxsLWZp
eC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLQogLi4udHQtaGVs
cGVycy1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJlLnBhdGNoIHwgNTggLS0tLS0tLS0tLS0tLS0t
LS0tLQogLi4uL2JsdWV6NS97Ymx1ZXo1XzUuNzkuYmIgPT4gYmx1ZXo1XzUuODAuYmJ9IHwgIDIg
Ky0KIDggZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxNjkgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1
LzAwMDEtZ2RidXMtZGVmaW5lLU1BWF9JTlBVVC1mb3ItbXVzbC5wYXRjaAogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXNoYXJl
ZC1hZC1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJlLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQg
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDItc2hhcmVkLXNoZWxs
LWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMy1zaGFyZWQtZ2F0dC1oZWxw
ZXJzLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JsdWV6NS97Ymx1ZXo1XzUuNzkuYmIgPT4gYmx1ZXo1XzUuODAuYmJ9ICg5
NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1
LmluYyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS5pbmMKaW5kZXgg
ZDYyNjg3MjEwMy4uN2I4MWYzYjZmYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9ibHVlejUvYmx1ZXo1LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Js
dWV6NS9ibHVlejUuaW5jCkBAIC02OSwxMCArNjksNiBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JH
X01JUlJPUn0vbGludXgvYmx1ZXRvb3RoL2JsdWV6LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAg
IGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy1hZGQtYS10
YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtdGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoIFwKLSAgICAgICAg
ICAgZmlsZTovLzAwMDEtZ2RidXMtZGVmaW5lLU1BWF9JTlBVVC1mb3ItbXVzbC5wYXRjaCBcCi0g
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXNoYXJlZC1hZC1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJl
LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItc2hhcmVkLXNoZWxsLWZpeC1zdGQtYzIz
LWJ1aWxkLWZhaWx1cmUucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMy1zaGFyZWQtZ2F0
dC1oZWxwZXJzLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2ggXAogICAgICAgICAgICAi
CiBTID0gIiR7V09SS0RJUn0vYmx1ZXotJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLWdkYnVzLWRlZmluZS1NQVhfSU5QVVQt
Zm9yLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUv
MDAwMS1nZGJ1cy1kZWZpbmUtTUFYX0lOUFVULWZvci1tdXNsLnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBkZTAxZGM4NjRlLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLWdkYnVzLWRlZmluZS1NQVhfSU5QVVQt
Zm9yLW11c2wucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNCArMCwwIEBACi1Gcm9tIDZmNDBk
NDRhY2JmYjAwMjFmMjFiZDYzZTZjMDcwM2JhNzAxZDE5YzQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiA9P1VURi04P3E/R3U9QzM9QjBuaT0yME09QzM9QTFyPTIwR2lsYmVydD89IDxn
dWRuaS5tLmdAZ21haWwuY29tPgotRGF0ZTogU2F0LCAyIE5vdiAyMDI0IDE2OjAzOjM0ICswMDAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIGdkYnVzOiBkZWZpbmUgTUFYX0lOUFVUIGZvciBtdXNsCi0KLVRo
aXMgaXMgdGhlIHNhbWUgc29sdXRpb24gYXMgd2FzIGRvbmUgaW4gc3JjL3NoYXJlZC91dGlsLmMK
LQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4
LWJsdWV0b290aCZtPTE3MzA1NjM2ODQyODk4OCZ3PTJdCi0KLVNpZ25lZC1vZmYtYnk6IEd1w7Bu
aSBNw6FyIEdpbGJlcnQgIDxndWRuaS5tLmdAZ21haWwuY29tLmNvbT4KLS0tLQotIGdkYnVzL29i
amVjdC5jIHwgNiArKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCi0KLWRp
ZmYgLS1naXQgYS9nZGJ1cy9vYmplY3QuYyBiL2dkYnVzL29iamVjdC5jCi1pbmRleCA4NGYxMTZi
ZjEuLjdiMDQ3NmYxYSAxMDA2NDQKLS0tLSBhL2dkYnVzL29iamVjdC5jCi0rKysgYi9nZGJ1cy9v
YmplY3QuYwotQEAgLTIwLDYgKzIwLDEyIEBACi0gI2luY2x1ZGUgPGRidXMvZGJ1cy5oPgotIAot
ICNpbmNsdWRlICJnZGJ1cy5oIgotKwotKy8qIGRlZmluZSBNQVhfSU5QVVQgZm9yIG11c2wgKi8K
LSsjaWZuZGVmIE1BWF9JTlBVVAotKyNkZWZpbmUgTUFYX0lOUFVUIF9QT1NJWF9NQVhfSU5QVVQK
LSsjZW5kaWYKLSsKLSAjaW5jbHVkZSAic3JjL3NoYXJlZC91dGlsLmgiCi0gCi0gI2RlZmluZSBp
bmZvKGZtdC4uLikKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXNoYXJlZC1hZC1maXgtc3RkLWMyMy1idWlsZC1m
YWlsdXJlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAw
MDEtc2hhcmVkLWFkLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDgyZWFlZDc5MjkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtc2hhcmVkLWFkLWZpeC1zdGQtYzIz
LWJ1aWxkLWZhaWx1cmUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNCArMCwwIEBACi1Gcm9t
IDVjNGNiZjVjYjk1ZTRmYzFhNTM1NDVhZjUyYjQyMGE4MDA4YjNmZmEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBSdWRpIEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KLURhdGU6
IFdlZCwgMjAgTm92IDIwMjQgMTM6MDI6NTYgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAxLzNdIHNo
YXJlZC9hZDogZml4IC1zdGQ9YzIzIGJ1aWxkIGZhaWx1cmUKLQotZ2NjLTE1IHN3aXRjaGVkIHRv
IC1zdGQ9YzIzIGJ5IGRlZmF1bHQ6Ci0KLSAgICBodHRwczovL2djYy5nbnUub3JnL2dpdC8/cD1n
Y2MuZ2l0O2E9Y29tbWl0ZGlmZjtoPTU1ZTNiZDM3NmIyMjE0ZTIwMGZhNzZkMTJiNjdmZjI1OWIw
NmMyMTIKLQotQXMgYSByZXN1bHQgYGJsdWV6YCBmYWlscyB0aGUgYnVpbGQgYXM6Ci0KLSAgICBz
cmMvc2hhcmVkL2FkLmM6MTA5MDoyNDogZXJyb3I6IGluY29tcGF0aWJsZSB0eXBlcyB3aGVuIHJl
dHVybmluZyB0eXBlICdfQm9vbCcgYnV0ICdjb25zdCBjaGFyIConIHdhcyBleHBlY3RlZAotICAg
ICAxMDkwIHwgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKLSAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0
cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9ibHVldG9vdGgvYmx1ZXouZ2l0L2NvbW1p
dC8/aWQ9ZGE1YjViMGVjYjFlYWQzODY3Njc2OGVmNzhkNDY0NDlkNDA0YmRjMF0KLVNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBzcmMvc2hhcmVkL2Fk
LmMgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Ci0KLWRpZmYgLS1naXQgYS9zcmMvc2hhcmVkL2FkLmMgYi9zcmMvc2hhcmVkL2FkLmMKLWluZGV4
IGQwOGNlN2EuLmRhYzM4MWIgMTAwNjQ0Ci0tLS0gYS9zcmMvc2hhcmVkL2FkLmMKLSsrKyBiL3Ny
Yy9zaGFyZWQvYWQuYwotQEAgLTEwODcsNyArMTA4Nyw3IEBAIGJvb2wgYnRfYWRfYWRkX25hbWUo
c3RydWN0IGJ0X2FkICphZCwgY29uc3QgY2hhciAqbmFtZSkKLSBjb25zdCBjaGFyICpidF9hZF9n
ZXRfbmFtZShzdHJ1Y3QgYnRfYWQgKmFkKQotIHsKLSAJaWYgKCFhZCkKLS0JCXJldHVybiBmYWxz
ZTsKLSsJCXJldHVybiBOVUxMOwotIAotIAlyZXR1cm4gYWQtPm5hbWU7Ci0gfQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtdGVzdC1nYXR0
LUZpeC1odW5nLWlzc3VlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUv
Ymx1ZXo1LzAwMDEtdGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoCmluZGV4IDU3MmY1YjBi
ZTMuLmM0Y2Y3ZTQ1ZGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1
ZXo1L2JsdWV6NS8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1pc3N1ZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0LWdhdHQtRml4LWh1
bmctaXNzdWUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgyNWUxNWRkZGE0YWE2ZDhlMzdj
MWM1MjE4MWY3MTc1ZDIyMzdmNjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU0YjEy
OWI2ZjgxMjNhYjQ3Yzc3ODhhZTJmMmI0OTllODMyZWRiZmYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBNaW5nbGkgWXUgPE1pbmdsaS5ZdUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJp
LCAyNCBBdWcgMjAxOCAxMjowNDowMyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0LWdhdHQ6
IEZpeCBodW5nIGlzc3VlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Js
dWV6NS9ibHVlejUvMDAwMS10ZXN0cy1hZGQtYS10YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdp
dGhvdXQtcnVubmluLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1
ZXo1LzAwMDEtdGVzdHMtYWRkLWEtdGFyZ2V0LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1
bm5pbi5wYXRjaAppbmRleCBmNTYxNDJlZTUwLi43ZTBkM2E1Y2Y2IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0cy1hZGQtYS10YXJn
ZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3RzLWFkZC1hLXRhcmdldC1m
b3ItYnVpbGRpbmctdGVzdHMtd2l0aG91dC1ydW5uaW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDljZTYzNjBkMTFmMGIxMjUyZjYxZmY3OGNlNmY4ZWYwM2IxNTBkZmQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGVjOTgxNjdkMDgzY2EwOWIyNmI2YTkyOTk1M2JjODdlZTY5YTUx
YTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMSBBcHIgMjAxNiAxNzowNzozNCArMDMw
MAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogYWRkIGEgdGFyZ2V0IGZvciBidWlsZGluZyB0ZXN0
cyB3aXRob3V0IHJ1bm5pbmcgdGhlbQpAQCAtMTAsMTAgKzEwLDEwIEBAIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZp
bGUuYW0KLWluZGV4IDY4YmYwNTguLmEzNzZkMTAgMTAwNjQ0CitpbmRleCAwODIxNTMwLi5lN2Nl
ZmI1IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCi1AQCAtNzEz
LDYgKzcxMyw5IEBAIGVuZGlmCitAQCAtNzIzLDYgKzcyMyw5IEBAIGVuZGlmCiAgVEVTVFMgPSAk
KHVuaXRfdGVzdHMpCiAgQU1fVEVTVFNfRU5WSVJPTk1FTlQgPSBNQUxMT0NfQ0hFQ0tfPTMgTUFM
TE9DX1BFUlRVUkJfPTY5CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JsdWV6NS9ibHVlejUvMDAwMi1zaGFyZWQtc2hlbGwtZml4LXN0ZC1jMjMtYnVpbGQtZmFpbHVy
ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAyLXNo
YXJlZC1zaGVsbC1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJlLnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCA5ZWE2MjI2MDFiLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAyLXNoYXJlZC1zaGVsbC1maXgtc3RkLWMy
My1idWlsZC1mYWlsdXJlLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzQgKzAsMCBAQAotRnJv
bSA0MDg1MTBkNzUxZTk0ODJmZTk2NWU1ZGQ5NmZiYWM3ZjllZTJlZjYyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQotRnJvbTogUnVkaSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+Ci1EYXRl
OiBXZWQsIDIwIE5vdiAyMDI0IDEzOjAzOjI5ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMi8zXSBz
aGFyZWQvc2hlbGw6IGZpeCAtc3RkPWMyMyBidWlsZCBmYWlsdXJlCi0KLWdjYy0xNSBzd2l0Y2hl
ZCB0byAtc3RkPWMyMyBieSBkZWZhdWx0OgotCi0gICAgaHR0cHM6Ly9nY2MuZ251Lm9yZy9naXQv
P3A9Z2NjLmdpdDthPWNvbW1pdGRpZmY7aD01NWUzYmQzNzZiMjIxNGUyMDBmYTc2ZDEyYjY3ZmYy
NTliMDZjMjEyCi0KLUFzIGEgcmVzdWx0IGBibHVlemAgZmFpbHMgdGhlIGJ1aWxkIGFzOgotCi0g
ICAgc3JjL3NoYXJlZC9zaGVsbC5jOjM2NToyNDogZXJyb3I6IGluY29tcGF0aWJsZSB0eXBlcyB3
aGVuIHJldHVybmluZyB0eXBlICdfQm9vbCcgYnV0ICdzdHJ1Y3QgaW5wdXQgKicgd2FzIGV4cGVj
dGVkCi0gICAgICAzNjUgfCAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwotICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0IFtodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2JsdWV0b290aC9ibHVlei5n
aXQvY29tbWl0Lz9pZD00ZDYwODI2ODY1Yzc2MGNjNGU1NzE4YjY0MTQ3NDZhMzk0NzY4MTEwXQot
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIHNyYy9z
aGFyZWQvc2hlbGwuYyB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9zaGFyZWQvc2hlbGwuYyBiL3NyYy9zaGFy
ZWQvc2hlbGwuYwotaW5kZXggYThmYTg3Ni4uYWE2YzE2YyAxMDA2NDQKLS0tLSBhL3NyYy9zaGFy
ZWQvc2hlbGwuYwotKysrIGIvc3JjL3NoYXJlZC9zaGVsbC5jCi1AQCAtMzYyLDcgKzM2Miw3IEBA
IHN0YXRpYyBzdHJ1Y3QgaW5wdXQgKmlucHV0X25ldyhpbnQgZmQpCi0gCi0gCWlvID0gaW9fbmV3
KGZkKTsKLSAJaWYgKCFpbykKLS0JCXJldHVybiBmYWxzZTsKLSsJCXJldHVybiBOVUxMOwotIAot
IAlpbnB1dCA9IG5ldzAoc3RydWN0IGlucHV0LCAxKTsKLSAJaW5wdXQtPmlvID0gaW87CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMy1zaGFy
ZWQtZ2F0dC1oZWxwZXJzLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMy1zaGFyZWQtZ2F0dC1oZWxwZXJz
LWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDk5NmJiMDQ4YWMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9ibHVlejUvYmx1ZXo1LzAwMDMtc2hhcmVkLWdhdHQtaGVscGVycy1maXgtc3RkLWMyMy1i
dWlsZC1mYWlsdXJlLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTggKzAsMCBAQAotRnJvbSA3
YzA3YmIxMGY1N2M4MDQ2N2JjMzA3OWQ0NWRhYzRkMzgzOTkyN2QwIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogUnVkaSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+Ci1EYXRlOiBX
ZWQsIDIwIE5vdiAyMDI0IDEzOjAzOjU1ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMy8zXSBzaGFy
ZWQvZ2F0dC1oZWxwZXJzOiBmaXggLXN0ZD1jMjMgYnVpbGQgZmFpbHVyZQotCi1nY2MtMTUgc3dp
dGNoZWQgdG8gLXN0ZD1jMjMgYnkgZGVmYXVsdDoKLQotICAgIGh0dHBzOi8vZ2NjLmdudS5vcmcv
Z2l0Lz9wPWdjYy5naXQ7YT1jb21taXRkaWZmO2g9NTVlM2JkMzc2YjIyMTRlMjAwZmE3NmQxMmI2
N2ZmMjU5YjA2YzIxMgotCi1BcyBhIHJlc3VsdCBgYmx1ZXpgIGZhaWxzIHRoZSBidWlsZCBhczoK
LQotICAgIHNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmM6MTEzNjoyNDogZXJyb3I6IGluY29tcGF0
aWJsZSB0eXBlcyB3aGVuIHJldHVybmluZyB0eXBlICdfQm9vbCcgYnV0ICdzdHJ1Y3QgYnRfZ2F0
dF9yZXF1ZXN0IConIHdhcyBleHBlY3RlZAotICAgICAxMTM2IHwgICAgICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsKLSAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn4KLSAg
ICBzcmMvc2hhcmVkL2dhdHQtaGVscGVycy5jOjEyNTA6MjQ6IGVycm9yOiBpbmNvbXBhdGlibGUg
dHlwZXMgd2hlbiByZXR1cm5pbmcgdHlwZSAnX0Jvb2wnIGJ1dCAnc3RydWN0IGJ0X2dhdHRfcmVx
dWVzdCAqJyB3YXMgZXhwZWN0ZWQKLSAgICAgMTI1MCB8ICAgICAgICAgICAgICAgICByZXR1cm4g
ZmFsc2U7Ci0gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+Ci0gICAgc3Jj
L3NoYXJlZC9nYXR0LWhlbHBlcnMuYzoxNDc4OjI0OiBlcnJvcjogaW5jb21wYXRpYmxlIHR5cGVz
IHdoZW4gcmV0dXJuaW5nIHR5cGUgJ19Cb29sJyBidXQgJ3N0cnVjdCBidF9nYXR0X3JlcXVlc3Qg
Kicgd2FzIGV4cGVjdGVkCi0gICAgIDE0NzggfCAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNl
OwotICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fgotCi1VcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0IFtodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2JsdWV0
b290aC9ibHVlei5naXQvY29tbWl0Lz9pZD02ZjMxMTFlYjY4MGRmOWMxMzUwMmFhY2Q2NTU1NDg0
NmE5ZTEzYTNmXQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
LS0tLQotIHNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmMgfCA2ICsrKy0tLQotIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMv
c2hhcmVkL2dhdHQtaGVscGVycy5jIGIvc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYwotaW5kZXgg
NTBmY2IyNi4uZjFmYTYzMCAxMDA2NDQKLS0tLSBhL3NyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmMK
LSsrKyBiL3NyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmMKLUBAIC0xMTMzLDcgKzExMzMsNyBAQCBz
dHJ1Y3QgYnRfZ2F0dF9yZXF1ZXN0ICpidF9nYXR0X2Rpc2NvdmVyX2luY2x1ZGVkX3NlcnZpY2Vz
KHN0cnVjdCBidF9hdHQgKmF0dCwKLSAJdWludDhfdCBwZHVbNl07Ci0gCi0gCWlmICghYXR0KQot
LQkJcmV0dXJuIGZhbHNlOwotKwkJcmV0dXJuIE5VTEw7Ci0gCi0gCW9wID0gbmV3MChzdHJ1Y3Qg
YnRfZ2F0dF9yZXF1ZXN0LCAxKTsKLSAJb3AtPmF0dCA9IGF0dDsKLUBAIC0xMjQ3LDcgKzEyNDcs
NyBAQCBzdHJ1Y3QgYnRfZ2F0dF9yZXF1ZXN0ICpidF9nYXR0X2Rpc2NvdmVyX2NoYXJhY3Rlcmlz
dGljcyhzdHJ1Y3QgYnRfYXR0ICphdHQsCi0gCXVpbnQ4X3QgcGR1WzZdOwotIAotIAlpZiAoIWF0
dCkKLS0JCXJldHVybiBmYWxzZTsKLSsJCXJldHVybiBOVUxMOwotIAotIAlvcCA9IG5ldzAoc3Ry
dWN0IGJ0X2dhdHRfcmVxdWVzdCwgMSk7Ci0gCW9wLT5hdHQgPSBhdHQ7Ci1AQCAtMTQ3NSw3ICsx
NDc1LDcgQEAgc3RydWN0IGJ0X2dhdHRfcmVxdWVzdCAqYnRfZ2F0dF9kaXNjb3Zlcl9kZXNjcmlw
dG9ycyhzdHJ1Y3QgYnRfYXR0ICphdHQsCi0gCXVpbnQ4X3QgcGR1WzRdOwotIAotIAlpZiAoIWF0
dCkKLS0JCXJldHVybiBmYWxzZTsKLSsJCXJldHVybiBOVUxMOwotIAotIAlvcCA9IG5ldzAoc3Ry
dWN0IGJ0X2dhdHRfcmVxdWVzdCwgMSk7Ci0gCW9wLT5hdHQgPSBhdHQ7CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43OS5iYiBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjgwLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81
Ljc5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVf
NS44MC5iYgppbmRleCAzMGVhNmQzMTdiLi4yYWIxZDhhNjcyIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43OS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS44MC5iYgpAQCAtMSw2ICsxLDYgQEAKIHJl
cXVpcmUgYmx1ZXo1LmluYwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDE2NGE1MzAzYTlmNzFj
NzBmNDhjMDNmZjYwYmUzNDIzMWI1NjhkOTNhOWFkNWU3OTkyOGQzNGU2YWEwZWE4YSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhNGQwYmNhMzI5OTY5MWYwNmQ1YmQ5NzczYjg1NDYzODIwNGE1MWE1
MDI2YzQyYjBhZDdmMWM2Y2YxNmI0NTlhIgogCiBDVkVfU1RBVFVTW0NWRS0yMDIwLTI0NDkwXSA9
ICJjcGUtaW5jb3JyZWN0OiBUaGlzIGlzc3VlIGhhcyBrZXJuZWwgZml4ZXMgcmF0aGVyIHRoYW4g
Ymx1ZXogZml4ZXMiCiAKLS0gCjIuNDcuMQoK

--===============0786803920376776470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (923 cached, 1 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:129bb3524ac73b6789189c02a8f15c23429d8377"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 420 Local 409 Mirrors 0 Missed 11 Current 602 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 817 of 1022 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 826 of 1022 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 858 of 1022 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_create_spdx_setscene)
NOTE: Running setscene task 896 of 1022 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.80-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_257.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.80-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_257.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 914 of 1022 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 923 of 1022 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1015 of 1022 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2037 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_fetch)
NOTE: recipe bluez5-5.80-r0: task do_fetch: Started
NOTE: recipe bluez5-5.80-r0: task do_fetch: Succeeded
NOTE: Running task 2236 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_unpack)
NOTE: Running task 2237 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.80-r0: task do_unpack: Started
NOTE: recipe bluez5-5.80-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.80-r0: task do_unpack: Succeeded
NOTE: Running task 2758 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_patch)
NOTE: Running task 2759 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.80-r0: task do_patch: Started
NOTE: recipe bluez5-5.80-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.80-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.80-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.80-r0: task do_patch: Succeeded
NOTE: Running task 2760 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_deploy_source_date_epoch)
NOTE: Running task 2761 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_populate_lic)
NOTE: recipe bluez5-5.80-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.80-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.80-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.80-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_deploy_source_date_epoch unihash changed to 50b382c4017a8b13e4151e3485e2afb39aae18f3a8c5241ec16cae77014d5dc2
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_populate_lic unihash changed to 9590bc16708533ed46465c9dd16f7722a4ce8238632c8ddaeb222853cb04d1f1
NOTE: Setscene tasks completed
NOTE: Running task 2762 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_configure)
NOTE: recipe bluez5-5.80-r0: task do_configure: Started
NOTE: recipe bluez5-5.80-r0: task do_configure: Succeeded
NOTE: Running task 2763 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.80-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.80-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2764 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_compile)
NOTE: recipe bluez5-5.80-r0: task do_compile: Started
NOTE: recipe bluez5-5.80-r0: task do_compile: Succeeded
NOTE: Running task 2765 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.80-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.80-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2766 of 2777 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_install)
NOTE: recipe bluez5-5.80-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/s
 rv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pk
 gconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'quilt-native', 'vala', 'bzip2', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'wayland-protocols', 'wayland', 'libice', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxkbcommon', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'acl', 'attr', 'bash-completion', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libffi', 'libical', 'libpcre2', 'l
 ibseccomp', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-jinja2-native', 'python3-markupsafe-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libcap-ng-native', 'libcap-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 DESTDIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image install
| make --no-print-directory install-am
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib'
|  /bin/bash ./libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c   lib/libbluetooth.la '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/etc/bluetooth'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/share/dbus-1/system.d'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/share/dbus-1/services'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/share/dbus-1/system-services'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/pkgconfig'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/include/bluetooth'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/systemd/system'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/systemd/user'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../bluez-5.80/src/main.conf ../bluez-5.80/profiles/input/input.conf ../bluez-5.80/profiles/network/network.conf '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/etc/bluetooth'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../bluez-5.80/src/bluetooth.conf ../bluez-5.80/obexd/src/obex.conf '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/share/dbus-1/system.d'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 obexd/src/org.bluez.obex.service '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/share/dbus-1/services'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../bluez-5.80/src/org.bluez.service '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/share/dbus-1/system-services'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/bluez/test'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 lib/bluez.pc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/pkgconfig'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../bluez-5.80/lib/bluetooth.h ../bluez-5.80/lib/hci.h ../bluez-5.80/lib/hci_lib.h ../bluez-5.80/lib/sco.h ../bluez-5.80/lib/l2cap.h ../bluez-5.80/lib/sdp.h ../bluez-5.80/lib/sdp_lib.h ../bluez-5.80/lib/rfcomm.h ../bluez-5.80/lib/bnep.h ../bluez-5.80/lib/cmtp.h ../bluez-5.80/lib/hidp.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/include/bluetooth'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 src/bluetooth.service '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/systemd/system'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 tools/mpris-proxy.service obexd/src/obex.service '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/systemd/user'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c ../bluez-5.80/test/sap_client.py ../bluez-5.80/test/bluezutils.py ../bluez-5.80/test/dbusdef.py ../bluez-5.80/test/monitor-bluetooth ../bluez-5.80/test/list-devices ../bluez-5.80/test/test-discovery ../bluez-5.80/test/test-manager ../bluez-5.80/test/test-adapter ../bluez-5.80/test/test-device ../bluez-5.80/test/simple-agent ../bluez-5.80/test/simple-endpoint ../bluez-5.80/test/test-sap-server ../bluez-5.80/test/test-network ../bluez-5.80/test/test-profile ../bluez-5.80/test/test-health ../bluez-5.80/test/test-health-sink ../bluez-5.80/test/service-record.dtd ../bluez-5.80/test/service-did.xml ../bluez-5.80/test/service-spp.xml ../bluez-5.80/test/service-opp.xml ../bluez-5.80/test/service-ftp.xml ../bluez-5.80/test/simple-player ../bluez-5.80/test/test-nap ../bluez-5.80/test/test-hfp ../bluez-5.80/test/opp-client ../bluez-5.80/test/ftp-client ../bluez-5.80/test/pbap-client ../bluez-5.80/test/map-client ../bluez-5.
 80/test/example-advertisement ../bluez-5.80/test/example-gatt-server ../bluez-5.80/test/example-gatt-client ../bluez-5.80/test/test-gatt-profile ../bluez-5.80/test/test-mesh ../bluez-5.80/test/agent.py '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/bluez/test'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c lib/.libs/libbluetooth.so.3.19.15 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/libbluetooth.so.3.19.15
| libtool: install: (cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib && { ln -s -f libbluetooth.so.3.19.15 libbluetooth.so.3 || { rm -f libbluetooth.so.3 && ln -s libbluetooth.so.3.19.15 libbluetooth.so.3; }; })
| libtool: install: (cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib && { ln -s -f libbluetooth.so.3.19.15 libbluetooth.so || { rm -f libbluetooth.so && ln -s libbluetooth.so.3.19.15 libbluetooth.so; }; })
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c lib/.libs/libbluetooth.lai /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/libbluetooth.la
| libtool: warning: remember to run 'libtool --finish /usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/libexec/bluetooth'
| make --no-print-directory install-data-hook
|   /bin/bash ./libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c client/bluetoothctl monitor/btmon tools/rctest tools/l2test tools/l2ping tools/bluemoon tools/hex2hcd tools/mpris-proxy tools/btattach tools/isotest tools/hciattach tools/hciconfig tools/hcitool tools/hcidump tools/rfcomm tools/sdptool tools/ciptool '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin'
|   /bin/bash ./libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c src/bluetoothd obexd/src/obexd '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/libexec/bluetooth'
| ln -s -f obex.service /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/lib/systemd/user/dbus-org.bluez.obex.service
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c src/bluetoothd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/libexec/bluetooth/bluetoothd
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c client/bluetoothctl /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/bluetoothctl
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c monitor/btmon /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/btmon
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c obexd/src/obexd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/libexec/bluetooth/obexd
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/rctest /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/rctest
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/l2test /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/l2test
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/l2ping /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/l2ping
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/bluemoon /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/bluemoon
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/hex2hcd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/hex2hcd
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/mpris-proxy /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/mpris-proxy
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/btattach /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/btattach
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/isotest /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/isotest
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/hciattach /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/hciattach
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/hciconfig /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/hciconfig
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/hcitool /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/hcitool
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/hcidump /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/hcidump
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/rfcomm /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/rfcomm
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/sdptool /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/sdptool
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/ciptool /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin/ciptool
| install: cannot stat '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/build/tools/amptest': No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/temp/run.do_install.1589895:164 exit 1 from 'install -m 755 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/build/$f /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/image/usr/bin'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/temp/run.do_install.1589895, line 164
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/temp/run.do_install.1589895, line 218
NOTE: recipe bluez5-5.80-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 2766 tasks of which 2754 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401065213.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401065213.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/temp/log.do_install.1589895
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: bluez5-5.80-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/temp/run.do_install.1589895' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.80/temp/log.do_install.1589895
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.80.bb:do_install) failed with exit code '1'

--===============0786803920376776470==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.79-5.80.patch"

RnJvbSBiODY5NjA1YTgyMWE2MmUxN2M4MjEwYjgxYmI2OWQxOGY0NmY3MGJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNjo1MzoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJs
dWV6NTogdXBncmFkZSA1Ljc5IC0+IDUuODAKCi0tLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9ibHVlejUvYmx1ZXo1LmluYyAgIHwgIDQgLS0KIC4uLjAwMDEtZ2RidXMtZGVmaW5lLU1BWF9J
TlBVVC1mb3ItbXVzbC5wYXRjaCB8IDM0IC0tLS0tLS0tLS0tCiAuLi4tc2hhcmVkLWFkLWZpeC1z
dGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLQogLi4uLzAwMDEtdGVz
dC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoICAgICAgIHwgIDIgKy0KIC4uLmV0LWZvci1idWls
ZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRjaCB8ICA2ICstCiAuLi5hcmVkLXNoZWxsLWZp
eC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLQogLi4udHQtaGVs
cGVycy1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJlLnBhdGNoIHwgNTggLS0tLS0tLS0tLS0tLS0t
LS0tLQogLi4uL2JsdWV6NS97Ymx1ZXo1XzUuNzkuYmIgPT4gYmx1ZXo1XzUuODAuYmJ9IHwgIDIg
Ky0KIDggZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxNjkgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1
LzAwMDEtZ2RidXMtZGVmaW5lLU1BWF9JTlBVVC1mb3ItbXVzbC5wYXRjaAogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXNoYXJl
ZC1hZC1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJlLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQg
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDItc2hhcmVkLXNoZWxs
LWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMy1zaGFyZWQtZ2F0dC1oZWxw
ZXJzLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JsdWV6NS97Ymx1ZXo1XzUuNzkuYmIgPT4gYmx1ZXo1XzUuODAuYmJ9ICg5
NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1
LmluYyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS5pbmMKaW5kZXgg
ZDYyNjg3MjEwMy4uN2I4MWYzYjZmYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9ibHVlejUvYmx1ZXo1LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Js
dWV6NS9ibHVlejUuaW5jCkBAIC02OSwxMCArNjksNiBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JH
X01JUlJPUn0vbGludXgvYmx1ZXRvb3RoL2JsdWV6LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAg
IGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy1hZGQtYS10
YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtdGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoIFwKLSAgICAgICAg
ICAgZmlsZTovLzAwMDEtZ2RidXMtZGVmaW5lLU1BWF9JTlBVVC1mb3ItbXVzbC5wYXRjaCBcCi0g
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXNoYXJlZC1hZC1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJl
LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItc2hhcmVkLXNoZWxsLWZpeC1zdGQtYzIz
LWJ1aWxkLWZhaWx1cmUucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMy1zaGFyZWQtZ2F0
dC1oZWxwZXJzLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2ggXAogICAgICAgICAgICAi
CiBTID0gIiR7V09SS0RJUn0vYmx1ZXotJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLWdkYnVzLWRlZmluZS1NQVhfSU5QVVQt
Zm9yLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUv
MDAwMS1nZGJ1cy1kZWZpbmUtTUFYX0lOUFVULWZvci1tdXNsLnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBkZTAxZGM4NjRlLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLWdkYnVzLWRlZmluZS1NQVhfSU5QVVQt
Zm9yLW11c2wucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNCArMCwwIEBACi1Gcm9tIDZmNDBk
NDRhY2JmYjAwMjFmMjFiZDYzZTZjMDcwM2JhNzAxZDE5YzQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiA9P1VURi04P3E/R3U9QzM9QjBuaT0yME09QzM9QTFyPTIwR2lsYmVydD89IDxn
dWRuaS5tLmdAZ21haWwuY29tPgotRGF0ZTogU2F0LCAyIE5vdiAyMDI0IDE2OjAzOjM0ICswMDAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIGdkYnVzOiBkZWZpbmUgTUFYX0lOUFVUIGZvciBtdXNsCi0KLVRo
aXMgaXMgdGhlIHNhbWUgc29sdXRpb24gYXMgd2FzIGRvbmUgaW4gc3JjL3NoYXJlZC91dGlsLmMK
LQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4
LWJsdWV0b290aCZtPTE3MzA1NjM2ODQyODk4OCZ3PTJdCi0KLVNpZ25lZC1vZmYtYnk6IEd1w7Bu
aSBNw6FyIEdpbGJlcnQgIDxndWRuaS5tLmdAZ21haWwuY29tLmNvbT4KLS0tLQotIGdkYnVzL29i
amVjdC5jIHwgNiArKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCi0KLWRp
ZmYgLS1naXQgYS9nZGJ1cy9vYmplY3QuYyBiL2dkYnVzL29iamVjdC5jCi1pbmRleCA4NGYxMTZi
ZjEuLjdiMDQ3NmYxYSAxMDA2NDQKLS0tLSBhL2dkYnVzL29iamVjdC5jCi0rKysgYi9nZGJ1cy9v
YmplY3QuYwotQEAgLTIwLDYgKzIwLDEyIEBACi0gI2luY2x1ZGUgPGRidXMvZGJ1cy5oPgotIAot
ICNpbmNsdWRlICJnZGJ1cy5oIgotKwotKy8qIGRlZmluZSBNQVhfSU5QVVQgZm9yIG11c2wgKi8K
LSsjaWZuZGVmIE1BWF9JTlBVVAotKyNkZWZpbmUgTUFYX0lOUFVUIF9QT1NJWF9NQVhfSU5QVVQK
LSsjZW5kaWYKLSsKLSAjaW5jbHVkZSAic3JjL3NoYXJlZC91dGlsLmgiCi0gCi0gI2RlZmluZSBp
bmZvKGZtdC4uLikKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXNoYXJlZC1hZC1maXgtc3RkLWMyMy1idWlsZC1m
YWlsdXJlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAw
MDEtc2hhcmVkLWFkLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDgyZWFlZDc5MjkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtc2hhcmVkLWFkLWZpeC1zdGQtYzIz
LWJ1aWxkLWZhaWx1cmUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNCArMCwwIEBACi1Gcm9t
IDVjNGNiZjVjYjk1ZTRmYzFhNTM1NDVhZjUyYjQyMGE4MDA4YjNmZmEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBSdWRpIEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KLURhdGU6
IFdlZCwgMjAgTm92IDIwMjQgMTM6MDI6NTYgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAxLzNdIHNo
YXJlZC9hZDogZml4IC1zdGQ9YzIzIGJ1aWxkIGZhaWx1cmUKLQotZ2NjLTE1IHN3aXRjaGVkIHRv
IC1zdGQ9YzIzIGJ5IGRlZmF1bHQ6Ci0KLSAgICBodHRwczovL2djYy5nbnUub3JnL2dpdC8/cD1n
Y2MuZ2l0O2E9Y29tbWl0ZGlmZjtoPTU1ZTNiZDM3NmIyMjE0ZTIwMGZhNzZkMTJiNjdmZjI1OWIw
NmMyMTIKLQotQXMgYSByZXN1bHQgYGJsdWV6YCBmYWlscyB0aGUgYnVpbGQgYXM6Ci0KLSAgICBz
cmMvc2hhcmVkL2FkLmM6MTA5MDoyNDogZXJyb3I6IGluY29tcGF0aWJsZSB0eXBlcyB3aGVuIHJl
dHVybmluZyB0eXBlICdfQm9vbCcgYnV0ICdjb25zdCBjaGFyIConIHdhcyBleHBlY3RlZAotICAg
ICAxMDkwIHwgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKLSAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0
cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9ibHVldG9vdGgvYmx1ZXouZ2l0L2NvbW1p
dC8/aWQ9ZGE1YjViMGVjYjFlYWQzODY3Njc2OGVmNzhkNDY0NDlkNDA0YmRjMF0KLVNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBzcmMvc2hhcmVkL2Fk
LmMgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Ci0KLWRpZmYgLS1naXQgYS9zcmMvc2hhcmVkL2FkLmMgYi9zcmMvc2hhcmVkL2FkLmMKLWluZGV4
IGQwOGNlN2EuLmRhYzM4MWIgMTAwNjQ0Ci0tLS0gYS9zcmMvc2hhcmVkL2FkLmMKLSsrKyBiL3Ny
Yy9zaGFyZWQvYWQuYwotQEAgLTEwODcsNyArMTA4Nyw3IEBAIGJvb2wgYnRfYWRfYWRkX25hbWUo
c3RydWN0IGJ0X2FkICphZCwgY29uc3QgY2hhciAqbmFtZSkKLSBjb25zdCBjaGFyICpidF9hZF9n
ZXRfbmFtZShzdHJ1Y3QgYnRfYWQgKmFkKQotIHsKLSAJaWYgKCFhZCkKLS0JCXJldHVybiBmYWxz
ZTsKLSsJCXJldHVybiBOVUxMOwotIAotIAlyZXR1cm4gYWQtPm5hbWU7Ci0gfQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtdGVzdC1nYXR0
LUZpeC1odW5nLWlzc3VlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUv
Ymx1ZXo1LzAwMDEtdGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoCmluZGV4IDU3MmY1YjBi
ZTMuLmM0Y2Y3ZTQ1ZGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1
ZXo1L2JsdWV6NS8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1pc3N1ZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0LWdhdHQtRml4LWh1
bmctaXNzdWUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgyNWUxNWRkZGE0YWE2ZDhlMzdj
MWM1MjE4MWY3MTc1ZDIyMzdmNjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU0YjEy
OWI2ZjgxMjNhYjQ3Yzc3ODhhZTJmMmI0OTllODMyZWRiZmYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBNaW5nbGkgWXUgPE1pbmdsaS5ZdUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJp
LCAyNCBBdWcgMjAxOCAxMjowNDowMyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0LWdhdHQ6
IEZpeCBodW5nIGlzc3VlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Js
dWV6NS9ibHVlejUvMDAwMS10ZXN0cy1hZGQtYS10YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdp
dGhvdXQtcnVubmluLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1
ZXo1LzAwMDEtdGVzdHMtYWRkLWEtdGFyZ2V0LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1
bm5pbi5wYXRjaAppbmRleCBmNTYxNDJlZTUwLi43ZTBkM2E1Y2Y2IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0cy1hZGQtYS10YXJn
ZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3RzLWFkZC1hLXRhcmdldC1m
b3ItYnVpbGRpbmctdGVzdHMtd2l0aG91dC1ydW5uaW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDljZTYzNjBkMTFmMGIxMjUyZjYxZmY3OGNlNmY4ZWYwM2IxNTBkZmQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGVjOTgxNjdkMDgzY2EwOWIyNmI2YTkyOTk1M2JjODdlZTY5YTUx
YTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMSBBcHIgMjAxNiAxNzowNzozNCArMDMw
MAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogYWRkIGEgdGFyZ2V0IGZvciBidWlsZGluZyB0ZXN0
cyB3aXRob3V0IHJ1bm5pbmcgdGhlbQpAQCAtMTAsMTAgKzEwLDEwIEBAIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZp
bGUuYW0KLWluZGV4IDY4YmYwNTguLmEzNzZkMTAgMTAwNjQ0CitpbmRleCAwODIxNTMwLi5lN2Nl
ZmI1IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCi1AQCAtNzEz
LDYgKzcxMyw5IEBAIGVuZGlmCitAQCAtNzIzLDYgKzcyMyw5IEBAIGVuZGlmCiAgVEVTVFMgPSAk
KHVuaXRfdGVzdHMpCiAgQU1fVEVTVFNfRU5WSVJPTk1FTlQgPSBNQUxMT0NfQ0hFQ0tfPTMgTUFM
TE9DX1BFUlRVUkJfPTY5CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JsdWV6NS9ibHVlejUvMDAwMi1zaGFyZWQtc2hlbGwtZml4LXN0ZC1jMjMtYnVpbGQtZmFpbHVy
ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAyLXNo
YXJlZC1zaGVsbC1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJlLnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCA5ZWE2MjI2MDFiLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAyLXNoYXJlZC1zaGVsbC1maXgtc3RkLWMy
My1idWlsZC1mYWlsdXJlLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzQgKzAsMCBAQAotRnJv
bSA0MDg1MTBkNzUxZTk0ODJmZTk2NWU1ZGQ5NmZiYWM3ZjllZTJlZjYyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQotRnJvbTogUnVkaSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+Ci1EYXRl
OiBXZWQsIDIwIE5vdiAyMDI0IDEzOjAzOjI5ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMi8zXSBz
aGFyZWQvc2hlbGw6IGZpeCAtc3RkPWMyMyBidWlsZCBmYWlsdXJlCi0KLWdjYy0xNSBzd2l0Y2hl
ZCB0byAtc3RkPWMyMyBieSBkZWZhdWx0OgotCi0gICAgaHR0cHM6Ly9nY2MuZ251Lm9yZy9naXQv
P3A9Z2NjLmdpdDthPWNvbW1pdGRpZmY7aD01NWUzYmQzNzZiMjIxNGUyMDBmYTc2ZDEyYjY3ZmYy
NTliMDZjMjEyCi0KLUFzIGEgcmVzdWx0IGBibHVlemAgZmFpbHMgdGhlIGJ1aWxkIGFzOgotCi0g
ICAgc3JjL3NoYXJlZC9zaGVsbC5jOjM2NToyNDogZXJyb3I6IGluY29tcGF0aWJsZSB0eXBlcyB3
aGVuIHJldHVybmluZyB0eXBlICdfQm9vbCcgYnV0ICdzdHJ1Y3QgaW5wdXQgKicgd2FzIGV4cGVj
dGVkCi0gICAgICAzNjUgfCAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwotICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0IFtodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2JsdWV0b290aC9ibHVlei5n
aXQvY29tbWl0Lz9pZD00ZDYwODI2ODY1Yzc2MGNjNGU1NzE4YjY0MTQ3NDZhMzk0NzY4MTEwXQot
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIHNyYy9z
aGFyZWQvc2hlbGwuYyB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9zaGFyZWQvc2hlbGwuYyBiL3NyYy9zaGFy
ZWQvc2hlbGwuYwotaW5kZXggYThmYTg3Ni4uYWE2YzE2YyAxMDA2NDQKLS0tLSBhL3NyYy9zaGFy
ZWQvc2hlbGwuYwotKysrIGIvc3JjL3NoYXJlZC9zaGVsbC5jCi1AQCAtMzYyLDcgKzM2Miw3IEBA
IHN0YXRpYyBzdHJ1Y3QgaW5wdXQgKmlucHV0X25ldyhpbnQgZmQpCi0gCi0gCWlvID0gaW9fbmV3
KGZkKTsKLSAJaWYgKCFpbykKLS0JCXJldHVybiBmYWxzZTsKLSsJCXJldHVybiBOVUxMOwotIAot
IAlpbnB1dCA9IG5ldzAoc3RydWN0IGlucHV0LCAxKTsKLSAJaW5wdXQtPmlvID0gaW87CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMy1zaGFy
ZWQtZ2F0dC1oZWxwZXJzLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMy1zaGFyZWQtZ2F0dC1oZWxwZXJz
LWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDk5NmJiMDQ4YWMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9ibHVlejUvYmx1ZXo1LzAwMDMtc2hhcmVkLWdhdHQtaGVscGVycy1maXgtc3RkLWMyMy1i
dWlsZC1mYWlsdXJlLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTggKzAsMCBAQAotRnJvbSA3
YzA3YmIxMGY1N2M4MDQ2N2JjMzA3OWQ0NWRhYzRkMzgzOTkyN2QwIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogUnVkaSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+Ci1EYXRlOiBX
ZWQsIDIwIE5vdiAyMDI0IDEzOjAzOjU1ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMy8zXSBzaGFy
ZWQvZ2F0dC1oZWxwZXJzOiBmaXggLXN0ZD1jMjMgYnVpbGQgZmFpbHVyZQotCi1nY2MtMTUgc3dp
dGNoZWQgdG8gLXN0ZD1jMjMgYnkgZGVmYXVsdDoKLQotICAgIGh0dHBzOi8vZ2NjLmdudS5vcmcv
Z2l0Lz9wPWdjYy5naXQ7YT1jb21taXRkaWZmO2g9NTVlM2JkMzc2YjIyMTRlMjAwZmE3NmQxMmI2
N2ZmMjU5YjA2YzIxMgotCi1BcyBhIHJlc3VsdCBgYmx1ZXpgIGZhaWxzIHRoZSBidWlsZCBhczoK
LQotICAgIHNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmM6MTEzNjoyNDogZXJyb3I6IGluY29tcGF0
aWJsZSB0eXBlcyB3aGVuIHJldHVybmluZyB0eXBlICdfQm9vbCcgYnV0ICdzdHJ1Y3QgYnRfZ2F0
dF9yZXF1ZXN0IConIHdhcyBleHBlY3RlZAotICAgICAxMTM2IHwgICAgICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsKLSAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn4KLSAg
ICBzcmMvc2hhcmVkL2dhdHQtaGVscGVycy5jOjEyNTA6MjQ6IGVycm9yOiBpbmNvbXBhdGlibGUg
dHlwZXMgd2hlbiByZXR1cm5pbmcgdHlwZSAnX0Jvb2wnIGJ1dCAnc3RydWN0IGJ0X2dhdHRfcmVx
dWVzdCAqJyB3YXMgZXhwZWN0ZWQKLSAgICAgMTI1MCB8ICAgICAgICAgICAgICAgICByZXR1cm4g
ZmFsc2U7Ci0gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+Ci0gICAgc3Jj
L3NoYXJlZC9nYXR0LWhlbHBlcnMuYzoxNDc4OjI0OiBlcnJvcjogaW5jb21wYXRpYmxlIHR5cGVz
IHdoZW4gcmV0dXJuaW5nIHR5cGUgJ19Cb29sJyBidXQgJ3N0cnVjdCBidF9nYXR0X3JlcXVlc3Qg
Kicgd2FzIGV4cGVjdGVkCi0gICAgIDE0NzggfCAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNl
OwotICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fgotCi1VcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0IFtodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2JsdWV0
b290aC9ibHVlei5naXQvY29tbWl0Lz9pZD02ZjMxMTFlYjY4MGRmOWMxMzUwMmFhY2Q2NTU1NDg0
NmE5ZTEzYTNmXQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
LS0tLQotIHNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmMgfCA2ICsrKy0tLQotIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMv
c2hhcmVkL2dhdHQtaGVscGVycy5jIGIvc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYwotaW5kZXgg
NTBmY2IyNi4uZjFmYTYzMCAxMDA2NDQKLS0tLSBhL3NyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmMK
LSsrKyBiL3NyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmMKLUBAIC0xMTMzLDcgKzExMzMsNyBAQCBz
dHJ1Y3QgYnRfZ2F0dF9yZXF1ZXN0ICpidF9nYXR0X2Rpc2NvdmVyX2luY2x1ZGVkX3NlcnZpY2Vz
KHN0cnVjdCBidF9hdHQgKmF0dCwKLSAJdWludDhfdCBwZHVbNl07Ci0gCi0gCWlmICghYXR0KQot
LQkJcmV0dXJuIGZhbHNlOwotKwkJcmV0dXJuIE5VTEw7Ci0gCi0gCW9wID0gbmV3MChzdHJ1Y3Qg
YnRfZ2F0dF9yZXF1ZXN0LCAxKTsKLSAJb3AtPmF0dCA9IGF0dDsKLUBAIC0xMjQ3LDcgKzEyNDcs
NyBAQCBzdHJ1Y3QgYnRfZ2F0dF9yZXF1ZXN0ICpidF9nYXR0X2Rpc2NvdmVyX2NoYXJhY3Rlcmlz
dGljcyhzdHJ1Y3QgYnRfYXR0ICphdHQsCi0gCXVpbnQ4X3QgcGR1WzZdOwotIAotIAlpZiAoIWF0
dCkKLS0JCXJldHVybiBmYWxzZTsKLSsJCXJldHVybiBOVUxMOwotIAotIAlvcCA9IG5ldzAoc3Ry
dWN0IGJ0X2dhdHRfcmVxdWVzdCwgMSk7Ci0gCW9wLT5hdHQgPSBhdHQ7Ci1AQCAtMTQ3NSw3ICsx
NDc1LDcgQEAgc3RydWN0IGJ0X2dhdHRfcmVxdWVzdCAqYnRfZ2F0dF9kaXNjb3Zlcl9kZXNjcmlw
dG9ycyhzdHJ1Y3QgYnRfYXR0ICphdHQsCi0gCXVpbnQ4X3QgcGR1WzRdOwotIAotIAlpZiAoIWF0
dCkKLS0JCXJldHVybiBmYWxzZTsKLSsJCXJldHVybiBOVUxMOwotIAotIAlvcCA9IG5ldzAoc3Ry
dWN0IGJ0X2dhdHRfcmVxdWVzdCwgMSk7Ci0gCW9wLT5hdHQgPSBhdHQ7CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43OS5iYiBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjgwLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81
Ljc5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVf
NS44MC5iYgppbmRleCAzMGVhNmQzMTdiLi4yYWIxZDhhNjcyIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43OS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS44MC5iYgpAQCAtMSw2ICsxLDYgQEAKIHJl
cXVpcmUgYmx1ZXo1LmluYwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDE2NGE1MzAzYTlmNzFj
NzBmNDhjMDNmZjYwYmUzNDIzMWI1NjhkOTNhOWFkNWU3OTkyOGQzNGU2YWEwZWE4YSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhNGQwYmNhMzI5OTY5MWYwNmQ1YmQ5NzczYjg1NDYzODIwNGE1MWE1
MDI2YzQyYjBhZDdmMWM2Y2YxNmI0NTlhIgogCiBDVkVfU1RBVFVTW0NWRS0yMDIwLTI0NDkwXSA9
ICJjcGUtaW5jb3JyZWN0OiBUaGlzIGlzc3VlIGhhcyBrZXJuZWwgZml4ZXMgcmF0aGVyIHRoYW4g
Ymx1ZXogZml4ZXMiCiAKLS0gCjIuNDcuMQoK

--===============0786803920376776470==--

