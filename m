Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC8610FCAF1
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14661.1775054167823860954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1xgY7diE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PBTqwFXY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d49791d0d-35d31dfb-3ff5-46f5-9c0b-9423346fb58c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F4q1zlb84fK+QAzbIpUBBaEn8qBpa8qRD+0lR85Mmkw=;
	b=1xgY7diE8N+8WmJNe0QI+zwnd2jND315qBn1Nb02pJbWoN7PM/s91V6Y1rmA/Xhs
	IxU8mP0XpX+oLvZ+tpEhbyk6fZoCfz6v/exvnt/2zr+yaBKgTeoQgDHEcxVAIsNM8j6
	FoGuZwJHoKaTGB/uDoMhMSFDF63nCQJm8s68Kb04=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F4q1zlb84fK+QAzbIpUBBaEn8qBpa8qRD+0lR85Mmkw=;
	b=PBTqwFXYd41rhg1UojfejsrYyFgASXD/wQpTi7Q0TE4IDnvyxhfR33oP+773IRPm
	WWQc/zSpG2jsuI5CMG0wVES+PYOdMxrJjfHMv3YKIKQEqFDaenEvNtDPhAIIGri5R/q
	nuJyA76gfZOJUsb1QeP52W3dRXJWyD3bQ4UGOBxk=
Content-Type: multipart/mixed; boundary="===============6977039201982848132=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 4.0.2 SUCCEEDED
Message-ID: <0101019d49791d0d-35d31dfb-3ff5-46f5-9c0b-9423346fb58c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234398

--===============6977039201982848132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpydWJ5KiB0byAqNC4wLjIqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXJ1YnktdXBncmFkZS00LjAuMS00LjAuMi5wYXRj
aAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1tYXJp
emUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhh
dCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5IHRl
c3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQgLXMg
LS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBt
YWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hv
dWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVfTk9f
VVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21hdGlj
IHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3IHRo
ZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBkYXRl
IGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1Z3pp
bGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUyMFVw
ZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJv
bSBkYWY3NmFlNjAxMjdiNGI4NTBiZGJmNTQ3Y2QwNmZjOTk0MWFmNjFhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRh
dGU6IFdlZCwgMSBBcHIgMjAyNiAxMTowMDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1Ynk6
IHVwZ3JhZGUgNC4wLjEgLT4gNC4wLjIKCi0tLQogLi4uLzAwMDEtRG9uLXQtc2F2ZS10aGUtb3Jp
Z2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoICAgfCA1ICstLS0tCiAuLi4vMDAwMS1leHRt
ay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCB8IDYgKysrLS0t
CiAuLi4tdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5w
YXRjaCB8IDQgKystLQogLi4uL3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9m
LWxpYnJ1YnkucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4uL3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJl
cHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoICAgfCA1ICstLS0tCiAuLi5iLW1rbWYucmIt
c29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCB8IDYgKysrLS0t
CiAuLi5NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5w
YXRjaCB8IDYgKysrLS0tCiAuLi4vcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1
Y2libGUucGF0Y2ggICAgICAgICB8IDUgKy0tLS0KIC4uLjAwMDctU2tpcC10ZXN0X3JtX3Jfbm9f
cGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS97cnVieV80LjAuMS5iYiA9PiBydWJ5XzQuMC4yLmJifSB8IDIgKy0KIDEw
IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzQuMC4xLmJiID0+IHJ1YnlfNC4wLjIu
YmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8w
MDAxLURvbi10LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1Eb24tdC1zYXZlLXRoZS1vcmlnaW5h
bC1uYW1lLWFuZC10aW1lc3RhbXAucGF0Y2gKaW5kZXggMGYyNGQyZWEwYi4uMjVlMWZlMDc3MiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURvbi10LXNh
dmUtdGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1h
bmQtdGltZXN0YW1wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyY2VkYWQ2YjJiZWI5MDhh
OGZiODBkYTBlNDVlNTA1NWRjYTY1ZTk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBl
MTc0NDJhYTZjNTBmMmFiY2Q1OWNkNjYyNDhlNjVkYTkzMTgxMzNmIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4K
IERhdGU6IEZyaSwgMjcgRmViIDIwMjYgMTY6NTk6MjQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
RG9uJ3Qgc2F2ZSB0aGUgb3JpZ2luYWwgbmFtZSBhbmQgdGltZXN0YW1wCkBAIC0yOCw2ICsyOCwz
IEBAIGluZGV4IDg3NGMzZWYuLmViOTlhNzAgMTAwNzU1CiAgZGVmIENvbXByZXNzb3JzLmZvcih0
eXBlKQogICAgZXh0ID0gRmlsZS5leHRuYW1lKHR5cGUpCiAgICBpZiBjb21wcmVzcyA9IGZldGNo
KGV4dCwgbmlsKQotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5h
bC1nZW1zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1r
LWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCmluZGV4IGRjMzNm
YTlkODAuLjM2N2I5ZWIwMzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4
LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDJkMTk4MDZlMWQyMjFkZjk0MDBiMjViZDY3ZjNlMGI3YTIxYmI3MDIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGQxMWIxNWJlMDY3NzlmMDRlYjQ4NjBkN2Q4MjM0ZDRkMTBj
OTc3MjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW5kcj1DMz1B
OT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogRGF0ZTogTW9uLCAzMCBTZXAg
MjAxOSAxNjo1NzowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBleHRtazogZml4IGNyb3NzLWNv
bXBpbGF0aW9uIG9mIGV4dGVybmFsIGdlbXMKQEAgLTE2LDEwICsxNiwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZXh0L2V4
dG1rLnJiIGIvZXh0L2V4dG1rLnJiCi1pbmRleCAxZDE2NTQ1Li5hZDk3MWVhIDEwMDc1NQoraW5k
ZXggOGY4NDdmNC4uYzhhOGQ5ZiAxMDA3NTUKIC0tLSBhL2V4dC9leHRtay5yYgogKysrIGIvZXh0
L2V4dG1rLnJiCi1AQCAtNDM0LDggKzQzNCw4IEBAIGVsc2UKK0BAIC00MjcsOCArNDI3LDggQEAg
ZWxzZQogIGVuZAogICRydWJ5ID0gWyRydWJ5XQogICRydWJ5IDw8ICItSSckKHRvcGRpciknIgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAu
Yy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5k
LVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAppbmRleCA0ZjgxZDBhMTlkLi45YWM0ZTkxYWZm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVt
cC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdf
UzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
YTVjMjc4MjZlNzU2MWVhZmNiOGRhYjA2MWUwNzM0OTIzMjQ1N2YxMCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYjVmMzRlZTRmZTNmNGU2ZmIyYzk0YzAzYzU0YjY2Y2FiODBiYjc3MSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiBEYXRlOiBUdWUsIDI1IEphbiAyMDIyIDIwOjI5OjE0IC0wODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHZtX2R1bXAuYzogRGVmaW5lIFJFR19TMSBhbmQgUkVHX1MyIGZvciBtdXNsL3Jpc2N2CkBA
IC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvdm1f
ZHVtcC5jIGIvdm1fZHVtcC5jCi1pbmRleCA5OTMzOWZkLi44YzViYjAzIDEwMDY0NAoraW5kZXgg
ZTJiNDgwNC4uMGI3ZDg2OCAxMDA2NDQKIC0tLSBhL3ZtX2R1bXAuYwogKysrIGIvdm1fZHVtcC5j
CiBAQCAtNDAsNiArNDAsMTEgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10
aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCmluZGV4IDhlZjBjOTAzZTguLjM2YjBlYTY1YWMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxB
R1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzk0OWIzZmYwMWM2NDJiNmI5YWRhOWIxMmRkMzA4
M2NjOTMwNTQ0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTRhNWIxYTkwY2ZiMDcy
ZTExNTVhNGU0NTA0OWY1MjI5YzU0ZDM1NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IENocmlzdG9waGVyIExhcnNvbiA8Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+CiBEYXRlOiBUaHUs
IDUgTWF5IDIwMTYgMTA6NTk6MDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gT2JleSBMREZMQUdT
IGZvciB0aGUgbGluayBvZiBsaWJydWJ5CkBAIC0xMCwxMCArMTAsMTAgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBQZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS90ZW1wbGF0ZS9NYWtlZmlsZS5pbiBiL3RlbXBsYXRlL01ha2Vm
aWxlLmluCi1pbmRleCA2Yjk3Mjc5Li5hNDliNTNkIDEwMDY0NAoraW5kZXggNDQzYzM5NC4uNWY3
MDZkYiAxMDA2NDQKIC0tLSBhL3RlbXBsYXRlL01ha2VmaWxlLmluCiArKysgYi90ZW1wbGF0ZS9N
YWtlZmlsZS5pbgotQEAgLTEyMCw3ICsxMjAsNyBAQCBFTkFCTEVfU0hBUkVEID0gQEVOQUJMRV9T
SEFSRURACitAQCAtMTI5LDcgKzEyOSw3IEBAIEVOQUJMRV9TSEFSRUQgPSBARU5BQkxFX1NIQVJF
REAKICBMRFNIQVJFRCA9IEBMSUJSVUJZX0xEU0hBUkVEQAogIERMRFNIQVJFRCA9IEBETERTSEFS
RURACiAgWERMREZMQUdTID0gQERMREZMQUdTQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRp
b24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWls
ZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAppbmRleCBiZjU3Zjk3ZDdlLi44OWI1
OWJmYzc4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMt
cmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9j
dW1lbnRhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDJjZDIwNDcwNDQ4Njc2ZDk3
ZDc3YzJlNjc4OWVjY2U0M2YwZTIxYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDVj
YjVmZDBmMTk1OTA4NzkwMTQyMzVlMjdlZDNiNjE0MjQxYTkxZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IENocmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFAZGViaWFuLm9yZz4KIERh
dGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDQ6MzQgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmRv
YzogYnVpbGQgcmVwcm9kdWNpYmxlIGRvY3VtZW50YXRpb24KQEAgLTM4LDYgKzM4LDMgQEAgaW5k
ZXggMDY1Y2FhNC4uY2ZhMWYzMyAxMDA2NDQKICAgICAgICAgICAgZ3oub3JpZ19uYW1lID0gZGVz
dC5iYXNlbmFtZS50b19zCiAgICAgICAgICAgIGd6LndyaXRlIGRhdGEKICAgICAgICAgICAgZ3ou
Y2xvc2UKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdl
bmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxp
Yi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gK
aW5kZXggNWNhMTgyMzEzYi4uNDkzZTBiNTZkZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmls
ZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJh
dGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkzMjQ4OWI2N2NlOWNkZjU1OTBhMTc5
MjdlYTQwZDllYTY2MjM2NjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDgyOGEwZDVk
OWU5NTljMTgwYTk0MTUyMzI3ODBkOTljZjRhMGYxZWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5kZT4KIERhdGU6IFR1ZSwg
MTAgT2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliL21rbWYucmI6
IHNvcnQgbGlzdCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVkIE1ha2VmaWxlCkBAIC0xNywx
MCArMTcsMTAgQEAgU2lnbmVkLW9mZi1ieTogUmVpbmVyIEhlcnJtYW5uIDxyZWluZXJAcmVpbmVy
LWguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9saWIvbWttZi5yYiBiL2xpYi9ta21mLnJiCi1pbmRleCA5OWYzNzY0Li42
MjM3N2I2IDEwMDY0NAoraW5kZXggMzhhNWExNS4uZWFkN2YwYyAxMDA2NDQKIC0tLSBhL2xpYi9t
a21mLnJiCiArKysgYi9saWIvbWttZi5yYgotQEAgLTI0ODAsNyArMjQ4MCw3IEBAIExPQ0FMX0xJ
QlMgPSAjeyRMT0NBTF9MSUJTfQorQEAgLTI0OTMsNyArMjQ5Myw3IEBAIExPQ0FMX0xJQlMgPSAj
eyRMT0NBTF9MSUJTfQogIExJQlMgPSAjeyRMSUJSVUJZQVJHfSAjeyRsaWJzfSAjeyRMSUJTfQog
IE9SSUdfU1JDUyA9ICN7b3JpZ19zcmNzLmNvbGxlY3QoJkZpbGUubWV0aG9kKDpiYXNlbmFtZSkp
LmpvaW4oJyAnKX0KICBTUkNTID0gJChPUklHX1NSQ1MpICN7KHNyY3MgLSBvcmlnX3NyY3MpLmNv
bGxlY3QoJkZpbGUubWV0aG9kKDpiYXNlbmFtZSkpLmpvaW4oJyAnKX0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNp
YmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmct
Nzg0MjI1LXRvby5wYXRjaAppbmRleCBmZDdkMzM0MGYzLi40OGYwYzhmYjk2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJv
ZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdl
LWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MTAzMzE1Nzc0
ODFmMzMxMDc0NDA1ZTk2MjljYThkYjUzMDNhYWE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBhZGNlYjRlMmFkZTE0ZTc0NzBiOGI1ZGFkNjAyNTg3ZDQyMWU5ZTBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9y
Zz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENI
XSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpAQCAtMTIsMTAgKzEyLDEwIEBAIFVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2RlYmlhbl0KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvcnVieWdlbXMvc3BlY2lmaWNh
dGlvbi5yYiBiL2xpYi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJiCi1pbmRleCAwYjkwNWE3Li5h
MTAyZTNjIDEwMDY0NAoraW5kZXggNTAzZjBhNC4uNWQzM2IwOSAxMDA2NDQKIC0tLSBhL2xpYi9y
dWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJiCiArKysgYi9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlv
bi5yYgotQEAgLTE3MDksNyArMTcwOSw5IEBAIGNsYXNzIEdlbTo6U3BlY2lmaWNhdGlvbiA8IEdl
bTo6QmFzaWNTcGVjaWZpY2F0aW9uCitAQCAtMTcwNSw3ICsxNzA1LDkgQEAgY2xhc3MgR2VtOjpT
cGVjaWZpY2F0aW9uIDwgR2VtOjpCYXNpY1NwZWNpZmljYXRpb24KICAgICAgICAgICAgICAgICAg
cmFpc2UoR2VtOjpJbnZhbGlkU3BlY2lmaWNhdGlvbkV4Y2VwdGlvbiwKICAgICAgICAgICAgICAg
ICAgICAgICAgImludmFsaWQgZGF0ZSBmb3JtYXQgaW4gc3BlY2lmaWNhdGlvbjogI3tkYXRlLmlu
c3BlY3R9IikKICAgICAgICAgICAgICAgIGVuZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9k
dWNpYmxlLnBhdGNoCmluZGV4IGFhYzJiYzE1MDIuLmVmMDdiYWVkNGMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVj
aWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFr
ZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDRkMjVl
OWNlMGIyNzk1MDA5ZGQwNjZkNzk1OWNmNTFjNDI5MmEzNDMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDAxZjQ2YTg3ZDk5ODAyOWRiYjg0Y2IzOGNiYzA5ZTliZWM0N2QyZjYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJp
YW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCkBAIC03OCw2ICs3OCwzIEBAIGluZGV4
IGNhYmM5MTYuLmY5NTgxYjggMTAwNjQ0CiAgICBzcGVjLmF1dGhvcnMgICAgICAgPSBbIkFraW5v
cmkgTVVTSEEiLCAiSGFqaW11IFVNRU1PVE8iXQogICAgc3BlYy5lbWFpbCAgICAgICAgID0gWyJr
bnVAaWRhZW1vbnMub3JnIiwgInVtZUBtYWhvcm9iYS5vcmciXQogIAotLS0gCi0yLjM0LjEKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVz
dF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10
ZXN0LXVuZGVyLXJvb3QucGF0Y2gKaW5kZXggNzgwYjU5MDkyZi4uNDNhNWJhNmUzYyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9y
X25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVz
dC11bmRlci1yb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlYjVhNWRiNzRkMjlmZDYz
NjllOTg3MWJhMWJiMjU0YWEwZjIyZjQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBh
ZmVhOGQwNjAwMTY2ZWU4NTMyNGUwZTNmNTc2YjcyNWExNWNmZDg5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVyLmNv
bT4KIERhdGU6IE1vbiwgNyBKdWwgMjAyNSAxNTowNTo1NyArMDgwMAogU3ViamVjdDogW1BBVENI
XSBTa2lwIHRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucyB0ZXN0IHVuZGVyIHJvb3QKQEAgLTEzLDcg
KzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2lu
ZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdC9maWxldXRpbHMvdGVzdF9maWxldXRpbHMucmIgYi90
ZXN0L2ZpbGV1dGlscy90ZXN0X2ZpbGV1dGlscy5yYgotaW5kZXggZDIwOTZhMC4uODBlMzM2OCAx
MDA2NDQKK2luZGV4IDkyMzA4ZDkuLjVkYjc0ZjQgMTAwNjQ0CiAtLS0gYS90ZXN0L2ZpbGV1dGls
cy90ZXN0X2ZpbGV1dGlscy5yYgogKysrIGIvdGVzdC9maWxldXRpbHMvdGVzdF9maWxldXRpbHMu
cmIKIEBAIC03NjgsOCArNzY4LDggQEAgY2xhc3MgVGVzdEZpbGVVdGlscyA8IFRlc3Q6OlVuaXQ6
OlRlc3RDYXNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQu
MC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV80LjAuMi5iYgpzaW1pbGFy
aXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
XzQuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC4y
LmJiCmluZGV4IGU1MWQwZDNlOWMuLjUyNDBiYmU3NDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieV80LjAuMi5iYgpAQCAtNTAsNyArNTAsNyBAQCBkb19jb25maWd1cmU6cHJlcGVu
ZCgpIHsKIAogREVQRU5EUzphcHBlbmQ6bGliYy1tdXNsID0gIiBsaWJ1Y29udGV4dCIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjM5MjRiZTJkMDVkYjMwZjRlMzVmODU5YmYwMjhiZTg1ZjRiN2Rk
MDE3MTQxNDJmZDgyM2U0YWY1ZGUyZmFmOWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTE1MDJi
MjZiNTBiNjhkZjQ5NjMzMzZjYTQxZTM2OGNkZTkyYzkyOGZhZjkxNjU0ZGU0YzRjMTc5MWY4MmFh
YyIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUcgKz0gIiR7QGJiLnV0aWxz
LmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCi0tIAoyLjQ3LjEKCg==

--===============6977039201982848132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/prism/fixtures/and_or_with_suffix.txt /usr/lib/ruby/ptest/test/prism/fixtures/case_in_in.txt"
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.3/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.0/bin -> /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.1/bin, directory renamed /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.0 -> /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.1, directory renamed /usr/lib/ruby/gems/4.0.0/gems/syntax_suggest-2.0.2/exe -> /usr/lib/ruby/gems/4.0.0/gems/syntax_suggest-2.0.3/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.0/lib -> /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.1/lib, removed "/usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.0.gemspec /usr/lib/ruby/gems/4.0.0/specifications/pstore-0.2.0.gemspec /usr/lib/libruby.so.4.0.1 /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.3.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/zlib-3.2.2.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/syntax_s
 uggest-2.0.2.gemspec /usr/lib/ruby/gems/4.0.0/cache/pstore-0.2.0.gem", added "/usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.1.gemspec /usr/lib/ruby/gems/4.0.0/specifications/pstore-0.2.1.gemspec /usr/lib/ruby/gems/4.0.0/cache/pstore-0.2.1.gem /usr/lib/ruby/gems/4.0.0/specifications/default/syntax_suggest-2.0.3.gemspec /usr/lib/libruby.so.4.0.2 /usr/lib/ruby/gems/4.0.0/specifications/default/zlib-3.2.3.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.1 to libruby.so.4.0.2
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.1 to libruby.so.4.0.2
  /usr/lib/libruby.so.4.0.1 moved to /usr/lib/libruby.so.4.0.2
  /usr/lib/ruby/gems/4.0.0/cache/pstore-0.2.0.gem moved to /usr/lib/ruby/gems/4.0.0/cache/pstore-0.2.1.gem
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.3 moved to /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6
  /usr/lib/ruby/gems/4.0.0/gems/prism-1.8.0 moved to /usr/lib/ruby/gems/4.0.0/gems/prism-1.8.1
  /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.0 moved to /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.1
  /usr/lib/ruby/gems/4.0.0/gems/syntax_suggest-2.0.2 moved to /usr/lib/ruby/gems/4.0.0/gems/syntax_suggest-2.0.3
  /usr/lib/ruby/gems/4.0.0/gems/zlib-3.2.2 moved to /usr/lib/ruby/gems/4.0.0/gems/zlib-3.2.3
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.3.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.1.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/syntax_suggest-2.0.2.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/syntax_suggest-2.0.3.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/zlib-3.2.2.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/zlib-3.2.3.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/pstore-0.2.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/pstore-0.2.1.gemspec

--===============6977039201982848132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.1.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch" to "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.2.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-genera
 ted-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch"
packages/x86-64-v3-poky-linux/ruby: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 17949280 to 17952568 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.4.0.1", added "/usr/lib/.debug/libruby.so.4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1614682 to 1614853 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 10238626 to 10251813 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/prism/fixtures/case_in_in.txt /usr/lib/ruby/ptest/test/prism/fixtures/and_or_with_suffix.txt"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 40704685 to 40710188 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/src/debug/ruby/4.0.1/include/ruby/internal/intern -> /usr/src/debug/ruby/4.0.2/include/ruby/internal/intern, directory renamed /usr/src/debug/ruby/4.0.1/ext/etc -> /usr/src/debug/ruby/4.0.2/ext/etc, directory renamed /usr/src/debug/ruby/4.0.1/prism/templates/ext/prism -> /usr/src/debug/ruby/4.0.2/prism/templates/ext/prism, directory renamed /usr/src/debug/ruby/4.0.1/ext/json/fbuffer -> /usr/src/debug/ruby/4.0.2/ext/json/fbuffer, directory renamed /usr/src/debug/ruby/4.0.1/missing -> /usr/src/debug/ruby/4.0.2/missing, directory renamed /usr/src/debug/ruby/4.0.1/ext/strscan -> /usr/src/debug/ruby/4.0.2/ext/strscan, directory renamed /usr/src/debug/ruby/4.0.1/include/ruby/io -> /usr/src/debug/ruby/4.0.2/include/ruby/io, directory renamed /usr/src/debug/ruby/4.0.1/ccan/list -> /usr/src/debug/ruby/4.0.2/ccan/list, directory renamed /usr/src/debug/ruby/4.0.1/internal -> /usr/src/debug/ruby/4.0.2/internal, directo
 ry renamed /usr/src/debug/ruby/4.0.1/enc/jis -> /usr/src/debug/ruby/4.0.2/enc/jis, directory renamed /usr/src/debug/ruby/4.0.1/ext/coverage -> /usr/src/debug/ruby/4.0.2/ext/coverage, directory renamed /usr/src/debug/ruby/4.0.1/ext/digest/bubblebabble -> /usr/src/debug/ruby/4.0.2/ext/digest/bubblebabble, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/rbs-3.10.0/include/rbs/util -> /usr/src/debug/ruby/4.0.2/.bundle/gems/rbs-3.10.0/include/rbs/util, directory renamed /usr/src/debug/ruby/4.0.1/ext/json/simd -> /usr/src/debug/ruby/4.0.2/ext/json/simd, directory renamed /usr/src/debug/ruby/4.0.1/gc/default -> /usr/src/debug/ruby/4.0.2/gc/default, directory renamed /usr/src/debug/ruby/4.0.1/ext/pty -> /usr/src/debug/ruby/4.0.2/ext/pty, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/nkf-0.2.0/ext/nkf -> /usr/src/debug/ruby/4.0.2/.bundle/gems/nkf-0.2.0/ext/nkf, directory renamed /usr/src/debug/ruby/4.0.1/ext/monitor -> /usr/src/debug/ruby/4.0.2/ext/monitor, directory rena
 med /usr/src/debug/ruby/4.0.1/ext/cgi/escape -> /usr/src/debug/ruby/4.0.2/ext/erb/escape, directory renamed /usr/src/debug/ruby/4.0.1/enc -> /usr/src/debug/ruby/4.0.2/enc, directory renamed /usr/src/debug/ruby/4.0.1/ext/digest/md5 -> /usr/src/debug/ruby/4.0.2/ext/digest/md5, directory renamed /usr/src/debug/ruby/4.0.1/include/ruby/internal -> /usr/src/debug/ruby/4.0.2/include/ruby/internal, directory renamed /usr/src/debug/ruby/4.0.1/ext/rbconfig/sizeof -> /usr/src/debug/ruby/4.0.2/ext/rbconfig/sizeof, directory renamed /usr/src/debug/ruby/4.0.1/include/ruby/fiber -> /usr/src/debug/ruby/4.0.2/include/ruby/fiber, directory renamed /usr/src/debug/ruby/4.0.1/coroutine/amd64 -> /usr/src/debug/ruby/4.0.2/coroutine/amd64, directory renamed /usr/src/debug/ruby/4.0.1/ext/continuation -> /usr/src/debug/ruby/4.0.2/ext/continuation, directory renamed /usr/src/debug/ruby/4.0.1/ext/date -> /usr/src/debug/ruby/4.0.2/ext/date, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/rbs-3.10.0/src
  -> /usr/src/debug/ruby/4.0.2/.bundle/gems/rbs-3.10.0/src, directory renamed /usr/src/debug/ruby/4.0.1/ext -> /usr/src/debug/ruby/4.0.2/ext, directory renamed /usr/src/debug/ruby/4.0.1/ext/io/nonblock -> /usr/src/debug/ruby/4.0.2/ext/io/nonblock, directory renamed /usr/src/debug/ruby/4.0.1/ext/digest/sha2 -> /usr/src/debug/ruby/4.0.2/ext/digest/sha2, directory renamed /usr/src/debug/ruby/4.0.1/ext/digest/sha1 -> /usr/src/debug/ruby/4.0.2/ext/digest/sha1, directory renamed /usr/src/debug/ruby/4.0.1/ext/erb/escape -> /usr/src/debug/ruby/4.0.2/ext/cgi/escape, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/rbs-3.10.0/include/rbs -> /usr/src/debug/ruby/4.0.2/.bundle/gems/rbs-3.10.0/include/rbs, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/racc-1.8.1/ext/racc/cparse -> /usr/src/debug/ruby/4.0.2/.bundle/gems/racc-1.8.1/ext/racc/cparse, directory renamed /usr/src/debug/ruby/4.0.1/include/ruby/internal/core -> /usr/src/debug/ruby/4.0.2/include/ruby/internal/core, direct
 ory renamed /usr/src/debug/ruby/4.0.1/prism/util -> /usr/src/debug/ruby/4.0.2/prism/util, directory renamed /usr/src/debug/ruby/4.0.1/include/ruby/internal/intern/select -> /usr/src/debug/ruby/4.0.2/include/ruby/internal/intern/select, directory renamed /usr/src/debug/ruby/4.0.1/include/ruby/internal/arithmetic -> /usr/src/debug/ruby/4.0.2/include/ruby/internal/arithmetic, directory renamed /usr/src/debug/ruby/4.0.1/defs -> /usr/src/debug/ruby/4.0.2/defs, directory renamed /usr/src/debug/ruby/4.0.1/ext/ripper -> /usr/src/debug/ruby/4.0.2/ext/ripper, directory renamed /usr/src/debug/ruby/4.0.1/tool/ruby_vm/views -> /usr/src/debug/ruby/4.0.2/tool/ruby_vm/views, directory renamed /usr/src/debug/ruby/4.0.1/ext/io/wait -> /usr/src/debug/ruby/4.0.2/ext/io/wait, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/rbs-3.10.0/ext/rbs_extension -> /usr/src/debug/ruby/4.0.2/.bundle/gems/rbs-3.10.0/ext/rbs_extension, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/nkf-0.2.0/ext/nk
 f/nkf-utf8 -> /usr/src/debug/ruby/4.0.2/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8, directory renamed /usr/src/debug/ruby/4.0.1/prism/templates/src -> /usr/src/debug/ruby/4.0.2/prism/templates/src, directory renamed /usr/src/debug/ruby/4.0.1/ext/objspace -> /usr/src/debug/ruby/4.0.2/ext/objspace, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/debug-1.11.1/ext/debug -> /usr/src/debug/ruby/4.0.2/.bundle/gems/debug-1.11.1/ext/debug, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/fiddle-1.1.8/ext/fiddle -> /usr/src/debug/ruby/4.0.2/.bundle/gems/fiddle-1.1.8/ext/fiddle, directory renamed /usr/src/debug/ruby/4.0.1/ext/psych -> /usr/src/debug/ruby/4.0.2/ext/psych, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal -> /usr/src/debug/ruby/4.0.2/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/syslog-0.3.0/ext/syslog -> /usr/src/debug/ruby/4.0.2/.bundle/gems/syslog-0.3.0/ext/syslog, di
 rectory renamed /usr/src/debug/ruby/4.0.1/ext/digest/rmd160 -> /usr/src/debug/ruby/4.0.2/ext/digest/rmd160, directory renamed /usr/src/debug/ruby/4.0.1/ext/digest -> /usr/src/debug/ruby/4.0.2/ext/digest, directory renamed /usr/src/debug/ruby/4.0.1/ext/socket -> /usr/src/debug/ruby/4.0.2/ext/socket, directory renamed /usr/src/debug/ruby/4.0.1/ext/io/console -> /usr/src/debug/ruby/4.0.2/ext/io/console, directory renamed /usr/src/debug/ruby/4.0.1/include/ruby -> /usr/src/debug/ruby/4.0.2/include/ruby, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing -> /usr/src/debug/ruby/4.0.2/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing, directory renamed /usr/src/debug/ruby/4.0.1/ext/json/generator -> /usr/src/debug/ruby/4.0.2/ext/json/generator, directory renamed /usr/src/debug/ruby/4.0.1/gc -> /usr/src/debug/ruby/4.0.2/gc, directory renamed /usr/src/debug/ruby/4.0.1/ext/openssl -> /usr/src/debug/ruby/4.0.2/ext/openssl, directory renamed /usr/
 src/debug/ruby/4.0.1/include/ruby/internal/encoding -> /usr/src/debug/ruby/4.0.2/include/ruby/internal/encoding, directory renamed /usr/src/debug/ruby/4.0.1/.bundle/gems/rbs-3.10.0/src/util -> /usr/src/debug/ruby/4.0.2/.bundle/gems/rbs-3.10.0/src/util, directory renamed /usr/src/debug/ruby/4.0.1/prism -> /usr/src/debug/ruby/4.0.2/prism, directory renamed /usr/src/debug/ruby/4.0.1/ext/stringio -> /usr/src/debug/ruby/4.0.2/ext/stringio, directory renamed /usr/src/debug/ruby/4.0.1/enc/trans -> /usr/src/debug/ruby/4.0.2/enc/trans, directory renamed /usr/src/debug/ruby/4.0.1/ext/json/parser -> /usr/src/debug/ruby/4.0.2/ext/json/parser, directory renamed /usr/src/debug/ruby/4.0.1/enc/unicode/17.0.0 -> /usr/src/debug/ruby/4.0.2/enc/unicode/17.0.0, directory renamed /usr/src/debug/ruby/4.0.1/ext/fcntl -> /usr/src/debug/ruby/4.0.2/ext/fcntl, directory renamed /usr/src/debug/ruby/4.0.1/ext/zlib -> /usr/src/debug/ruby/4.0.2/ext/zlib, directory renamed /usr/src/debug/ruby/4.0.1/ext/json/vendor 
 -> /usr/src/debug/ruby/4.0.2/ext/json/vendor, directory renamed /usr/src/debug/ruby/4.0.1 -> /usr/src/debug/ruby/4.0.2
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "4.0.1" to "4.0.2"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 35486237 to 35496038 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/syntax_suggest-2.0.2/exe -> /usr/lib/ruby/gems/4.0.0/gems/syntax_suggest-2.0.3/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.0 -> /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.1, directory renamed /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.0/bin -> /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.1/bin, directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.3/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.0/lib -> /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.1/lib, removed "/usr/lib/ruby/gems/4.0.0/specifications/default/syntax_suggest-2.0.2.gemspec /usr/lib/libruby.so.4.0.1 /usr/lib/ruby/gems/4.0.0/cache/pstore-0.2.0.gem /usr/lib/ruby/gems/4.0.0/specifications/pstore-0.2.0.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/zlib-3.2.2.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.3.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.0.gemspec", added "/usr/lib/libruby.so.4.0.2 /usr/lib/ruby/gems/4.0.0/specifications/default/syntax_suggest-2.0.3.gemspec /usr/lib/ruby/gems/4.0.0/cache/pstore-0.2.1.gem /usr/lib/ruby/gems/4.0.0/specifications/default/zlib-3.2.3.gemspec /usr/lib/ruby/gems/4.0.0/specifications/pstore-0.2.1.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.1.gemspec"
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "4.0.1" to "4.0.2"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.1 to libruby.so.4.0.2
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.1 to libruby.so.4.0.2
  /usr/lib/libruby.so.4.0.1 moved to /usr/lib/libruby.so.4.0.2
  /usr/lib/ruby/gems/4.0.0/cache/pstore-0.2.0.gem moved to /usr/lib/ruby/gems/4.0.0/cache/pstore-0.2.1.gem
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.3 moved to /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6
  /usr/lib/ruby/gems/4.0.0/gems/prism-1.8.0 moved to /usr/lib/ruby/gems/4.0.0/gems/prism-1.8.1
  /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.0 moved to /usr/lib/ruby/gems/4.0.0/gems/pstore-0.2.1
  /usr/lib/ruby/gems/4.0.0/gems/syntax_suggest-2.0.2 moved to /usr/lib/ruby/gems/4.0.0/gems/syntax_suggest-2.0.3
  /usr/lib/ruby/gems/4.0.0/gems/zlib-3.2.2 moved to /usr/lib/ruby/gems/4.0.0/gems/zlib-3.2.3
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.3.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.1.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/syntax_suggest-2.0.2.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/syntax_suggest-2.0.3.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/zlib-3.2.2.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/zlib-3.2.3.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/pstore-0.2.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/pstore-0.2.1.gemspec

--===============6977039201982848132==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-4.0.1-4.0.2.patch"

RnJvbSBkYWY3NmFlNjAxMjdiNGI4NTBiZGJmNTQ3Y2QwNmZjOTk0MWFmNjFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMTowMDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1
Ynk6IHVwZ3JhZGUgNC4wLjEgLT4gNC4wLjIKCi0tLQogLi4uLzAwMDEtRG9uLXQtc2F2ZS10aGUt
b3JpZ2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoICAgfCA1ICstLS0tCiAuLi4vMDAwMS1l
eHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCB8IDYgKysr
LS0tCiAuLi4tdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNj
di5wYXRjaCB8IDQgKystLQogLi4uL3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5r
LW9mLWxpYnJ1YnkucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4uL3J1YnkvMDAwMy1yZG9jLWJ1aWxk
LXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoICAgfCA1ICstLS0tCiAuLi5iLW1rbWYu
cmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCB8IDYgKysr
LS0tCiAuLi5NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRv
by5wYXRjaCB8IDYgKysrLS0tCiAuLi4vcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXBy
b2R1Y2libGUucGF0Y2ggICAgICAgICB8IDUgKy0tLS0KIC4uLjAwMDctU2tpcC10ZXN0X3JtX3Jf
bm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIHwgNCArKy0tCiBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS97cnVieV80LjAuMS5iYiA9PiBydWJ5XzQuMC4yLmJifSB8IDIgKy0K
IDEwIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzQuMC4xLmJiID0+IHJ1YnlfNC4w
LjIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eS8wMDAxLURvbi10LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1Eb24tdC1zYXZlLXRoZS1vcmln
aW5hbC1uYW1lLWFuZC10aW1lc3RhbXAucGF0Y2gKaW5kZXggMGYyNGQyZWEwYi4uMjVlMWZlMDc3
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURvbi10
LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFt
ZS1hbmQtdGltZXN0YW1wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyY2VkYWQ2YjJiZWI5
MDhhOGZiODBkYTBlNDVlNTA1NWRjYTY1ZTk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBlMTc0NDJhYTZjNTBmMmFiY2Q1OWNkNjYyNDhlNjVkYTkzMTgxMzNmIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNv
bT4KIERhdGU6IEZyaSwgMjcgRmViIDIwMjYgMTY6NTk6MjQgKzA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gRG9uJ3Qgc2F2ZSB0aGUgb3JpZ2luYWwgbmFtZSBhbmQgdGltZXN0YW1wCkBAIC0yOCw2ICsy
OCwzIEBAIGluZGV4IDg3NGMzZWYuLmViOTlhNzAgMTAwNzU1CiAgZGVmIENvbXByZXNzb3JzLmZv
cih0eXBlKQogICAgZXh0ID0gRmlsZS5leHRuYW1lKHR5cGUpCiAgICBpZiBjb21wcmVzcyA9IGZl
dGNoKGV4dCwgbmlsKQotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRl
cm5hbC1nZW1zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4
dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCmluZGV4IGRj
MzNmYTlkODAuLjM2N2I5ZWIwMzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vt
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWst
Zml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDJkMTk4MDZlMWQyMjFkZjk0MDBiMjViZDY3ZjNlMGI3YTIxYmI3MDIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQxMWIxNWJlMDY3NzlmMDRlYjQ4NjBkN2Q4MjM0ZDRk
MTBjOTc3MjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW5kcj1D
Mz1BOT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogRGF0ZTogTW9uLCAzMCBT
ZXAgMjAxOSAxNjo1NzowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBleHRtazogZml4IGNyb3Nz
LWNvbXBpbGF0aW9uIG9mIGV4dGVybmFsIGdlbXMKQEAgLTE2LDEwICsxNiwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZXh0
L2V4dG1rLnJiIGIvZXh0L2V4dG1rLnJiCi1pbmRleCAxZDE2NTQ1Li5hZDk3MWVhIDEwMDc1NQor
aW5kZXggOGY4NDdmNC4uYzhhOGQ5ZiAxMDA3NTUKIC0tLSBhL2V4dC9leHRtay5yYgogKysrIGIv
ZXh0L2V4dG1rLnJiCi1AQCAtNDM0LDggKzQzNCw4IEBAIGVsc2UKK0BAIC00MjcsOCArNDI3LDgg
QEAgZWxzZQogIGVuZAogICRydWJ5ID0gWyRydWJ5XQogICRydWJ5IDw8ICItSSckKHRvcGRpcikn
IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1
bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEt
YW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAppbmRleCA0ZjgxZDBhMTlkLi45YWM0ZTkx
YWZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1f
ZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1S
RUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYTVjMjc4MjZlNzU2MWVhZmNiOGRhYjA2MWUwNzM0OTIzMjQ1N2YxMCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYjVmMzRlZTRmZTNmNGU2ZmIyYzk0YzAzYzU0YjY2Y2FiODBiYjc3
MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiBEYXRlOiBUdWUsIDI1IEphbiAyMDIyIDIwOjI5OjE0IC0wODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHZtX2R1bXAuYzogRGVmaW5lIFJFR19TMSBhbmQgUkVHX1MyIGZvciBtdXNsL3Jpc2N2
CkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEv
dm1fZHVtcC5jIGIvdm1fZHVtcC5jCi1pbmRleCA5OTMzOWZkLi44YzViYjAzIDEwMDY0NAoraW5k
ZXggZTJiNDgwNC4uMGI3ZDg2OCAxMDA2NDQKIC0tLSBhL3ZtX2R1bXAuYwogKysrIGIvdm1fZHVt
cC5jCiBAQCAtNDAsNiArNDAsMTEgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZv
ci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCmluZGV4IDhlZjBjOTAzZTguLjM2YjBlYTY1YWMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxE
RkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVi
eS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzk0OWIzZmYwMWM2NDJiNmI5YWRhOWIxMmRk
MzA4M2NjOTMwNTQ0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTRhNWIxYTkwY2Zi
MDcyZTExNTVhNGU0NTA0OWY1MjI5YzU0ZDM1NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IENocmlzdG9waGVyIExhcnNvbiA8Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+CiBEYXRlOiBU
aHUsIDUgTWF5IDIwMTYgMTA6NTk6MDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gT2JleSBMREZM
QUdTIGZvciB0aGUgbGluayBvZiBsaWJydWJ5CkBAIC0xMCwxMCArMTAsMTAgQEAgVXBzdHJlYW0t
U3RhdHVzOiBQZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90ZW1wbGF0ZS9NYWtlZmlsZS5pbiBiL3RlbXBsYXRlL01h
a2VmaWxlLmluCi1pbmRleCA2Yjk3Mjc5Li5hNDliNTNkIDEwMDY0NAoraW5kZXggNDQzYzM5NC4u
NWY3MDZkYiAxMDA2NDQKIC0tLSBhL3RlbXBsYXRlL01ha2VmaWxlLmluCiArKysgYi90ZW1wbGF0
ZS9NYWtlZmlsZS5pbgotQEAgLTEyMCw3ICsxMjAsNyBAQCBFTkFCTEVfU0hBUkVEID0gQEVOQUJM
RV9TSEFSRURACitAQCAtMTI5LDcgKzEyOSw3IEBAIEVOQUJMRV9TSEFSRUQgPSBARU5BQkxFX1NI
QVJFREAKICBMRFNIQVJFRCA9IEBMSUJSVUJZX0xEU0hBUkVEQAogIERMRFNIQVJFRCA9IEBETERT
SEFSRURACiAgWERMREZMQUdTID0gQERMREZMQUdTQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50
YXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1i
dWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAppbmRleCBiZjU3Zjk3ZDdlLi44
OWI1OWJmYzc4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUt
ZG9jdW1lbnRhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDJjZDIwNDcwNDQ4Njc2
ZDk3ZDc3YzJlNjc4OWVjY2U0M2YwZTIxYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MDVjYjVmZDBmMTk1OTA4NzkwMTQyMzVlMjdlZDNiNjE0MjQxYTkxZiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IENocmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFAZGViaWFuLm9yZz4K
IERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDQ6MzQgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0g
cmRvYzogYnVpbGQgcmVwcm9kdWNpYmxlIGRvY3VtZW50YXRpb24KQEAgLTM4LDYgKzM4LDMgQEAg
aW5kZXggMDY1Y2FhNC4uY2ZhMWYzMyAxMDA2NDQKICAgICAgICAgICAgZ3oub3JpZ19uYW1lID0g
ZGVzdC5iYXNlbmFtZS50b19zCiAgICAgICAgICAgIGd6LndyaXRlIGRhdGEKICAgICAgICAgICAg
Z3ouY2xvc2UKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWlu
LWdlbmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0
LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0
Y2gKaW5kZXggNWNhMTgyMzEzYi4uNDkzZTBiNTZkZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3Qt
ZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2Vu
ZXJhdGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkzMjQ4OWI2N2NlOWNkZjU1OTBh
MTc5MjdlYTQwZDllYTY2MjM2NjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDgyOGEw
ZDVkOWU5NTljMTgwYTk0MTUyMzI3ODBkOTljZjRhMGYxZWQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5kZT4KIERhdGU6IFR1
ZSwgMTAgT2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliL21rbWYu
cmI6IHNvcnQgbGlzdCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVkIE1ha2VmaWxlCkBAIC0x
NywxMCArMTcsMTAgQEAgU2lnbmVkLW9mZi1ieTogUmVpbmVyIEhlcnJtYW5uIDxyZWluZXJAcmVp
bmVyLWguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9saWIvbWttZi5yYiBiL2xpYi9ta21mLnJiCi1pbmRleCA5OWYzNzY0
Li42MjM3N2I2IDEwMDY0NAoraW5kZXggMzhhNWExNS4uZWFkN2YwYyAxMDA2NDQKIC0tLSBhL2xp
Yi9ta21mLnJiCiArKysgYi9saWIvbWttZi5yYgotQEAgLTI0ODAsNyArMjQ4MCw3IEBAIExPQ0FM
X0xJQlMgPSAjeyRMT0NBTF9MSUJTfQorQEAgLTI0OTMsNyArMjQ5Myw3IEBAIExPQ0FMX0xJQlMg
PSAjeyRMT0NBTF9MSUJTfQogIExJQlMgPSAjeyRMSUJSVUJZQVJHfSAjeyRsaWJzfSAjeyRMSUJT
fQogIE9SSUdfU1JDUyA9ICN7b3JpZ19zcmNzLmNvbGxlY3QoJkZpbGUubWV0aG9kKDpiYXNlbmFt
ZSkpLmpvaW4oJyAnKX0KICBTUkNTID0gJChPUklHX1NSQ1MpICN7KHNyY3MgLSBvcmlnX3NyY3Mp
LmNvbGxlY3QoJkZpbGUubWV0aG9kKDpiYXNlbmFtZSkpLmpvaW4oJyAnKX0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9k
dWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhp
bmctNzg0MjI1LXRvby5wYXRjaAppbmRleCBmZDdkMzM0MGYzLi40OGYwYzhmYjk2IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJl
cHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hh
bmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MTAzMzE1
Nzc0ODFmMzMxMDc0NDA1ZTk2MjljYThkYjUzMDNhYWE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBhZGNlYjRlMmFkZTE0ZTc0NzBiOGI1ZGFkNjAyNTg3ZDQyMWU5ZTBhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFu
Lm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BB
VENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpAQCAtMTIsMTAgKzEyLDEwIEBAIFVwc3Ry
ZWFtLVN0YXR1czogQmFja3BvcnQgW2RlYmlhbl0KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvcnVieWdlbXMvc3BlY2lm
aWNhdGlvbi5yYiBiL2xpYi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJiCi1pbmRleCAwYjkwNWE3
Li5hMTAyZTNjIDEwMDY0NAoraW5kZXggNTAzZjBhNC4uNWQzM2IwOSAxMDA2NDQKIC0tLSBhL2xp
Yi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJiCiArKysgYi9saWIvcnVieWdlbXMvc3BlY2lmaWNh
dGlvbi5yYgotQEAgLTE3MDksNyArMTcwOSw5IEBAIGNsYXNzIEdlbTo6U3BlY2lmaWNhdGlvbiA8
IEdlbTo6QmFzaWNTcGVjaWZpY2F0aW9uCitAQCAtMTcwNSw3ICsxNzA1LDkgQEAgY2xhc3MgR2Vt
OjpTcGVjaWZpY2F0aW9uIDwgR2VtOjpCYXNpY1NwZWNpZmljYXRpb24KICAgICAgICAgICAgICAg
ICAgcmFpc2UoR2VtOjpJbnZhbGlkU3BlY2lmaWNhdGlvbkV4Y2VwdGlvbiwKICAgICAgICAgICAg
ICAgICAgICAgICAgImludmFsaWQgZGF0ZSBmb3JtYXQgaW4gc3BlY2lmaWNhdGlvbjogI3tkYXRl
Lmluc3BlY3R9IikKICAgICAgICAgICAgICAgIGVuZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVw
cm9kdWNpYmxlLnBhdGNoCmluZGV4IGFhYzJiYzE1MDIuLmVmMDdiYWVkNGMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJv
ZHVjaWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYt
TWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDRk
MjVlOWNlMGIyNzk1MDA5ZGQwNjZkNzk1OWNmNTFjNDI5MmEzNDMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDAxZjQ2YTg3ZDk5ODAyOWRiYjg0Y2IzOGNiYzA5ZTliZWM0N2QyZjYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0Bk
ZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCkBAIC03OCw2ICs3OCwzIEBAIGlu
ZGV4IGNhYmM5MTYuLmY5NTgxYjggMTAwNjQ0CiAgICBzcGVjLmF1dGhvcnMgICAgICAgPSBbIkFr
aW5vcmkgTVVTSEEiLCAiSGFqaW11IFVNRU1PVE8iXQogICAgc3BlYy5lbWFpbCAgICAgICAgID0g
WyJrbnVAaWRhZW1vbnMub3JnIiwgInVtZUBtYWhvcm9iYS5vcmciXQogIAotLS0gCi0yLjM0LjEK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAt
dGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9u
cy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gKaW5kZXggNzgwYjU5MDkyZi4uNDNhNWJhNmUzYyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9y
bV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMt
dGVzdC11bmRlci1yb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlYjVhNWRiNzRkMjlm
ZDYzNjllOTg3MWJhMWJiMjU0YWEwZjIyZjQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBhZmVhOGQwNjAwMTY2ZWU4NTMyNGUwZTNmNTc2YjcyNWExNWNmZDg5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVy
LmNvbT4KIERhdGU6IE1vbiwgNyBKdWwgMjAyNSAxNTowNTo1NyArMDgwMAogU3ViamVjdDogW1BB
VENIXSBTa2lwIHRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucyB0ZXN0IHVuZGVyIHJvb3QKQEAgLTEz
LDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25A
d2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdC9maWxldXRpbHMvdGVzdF9maWxldXRpbHMucmIg
Yi90ZXN0L2ZpbGV1dGlscy90ZXN0X2ZpbGV1dGlscy5yYgotaW5kZXggZDIwOTZhMC4uODBlMzM2
OCAxMDA2NDQKK2luZGV4IDkyMzA4ZDkuLjVkYjc0ZjQgMTAwNjQ0CiAtLS0gYS90ZXN0L2ZpbGV1
dGlscy90ZXN0X2ZpbGV1dGlscy5yYgogKysrIGIvdGVzdC9maWxldXRpbHMvdGVzdF9maWxldXRp
bHMucmIKIEBAIC03NjgsOCArNzY4LDggQEAgY2xhc3MgVGVzdEZpbGVVdGlscyA8IFRlc3Q6OlVu
aXQ6OlRlc3RDYXNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
XzQuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV80LjAuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5XzQuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQu
MC4yLmJiCmluZGV4IGU1MWQwZDNlOWMuLjUyNDBiYmU3NDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieV80LjAuMi5iYgpAQCAtNTAsNyArNTAsNyBAQCBkb19jb25maWd1cmU6cHJl
cGVuZCgpIHsKIAogREVQRU5EUzphcHBlbmQ6bGliYy1tdXNsID0gIiBsaWJ1Y29udGV4dCIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjM5MjRiZTJkMDVkYjMwZjRlMzVmODU5YmYwMjhiZTg1ZjRi
N2RkMDE3MTQxNDJmZDgyM2U0YWY1ZGUyZmFmOWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTE1
MDJiMjZiNTBiNjhkZjQ5NjMzMzZjYTQxZTM2OGNkZTkyYzkyOGZhZjkxNjU0ZGU0YzRjMTc5MWY4
MmFhYyIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUcgKz0gIiR7QGJiLnV0
aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCi0tIAoyLjQ3LjEKCg==

--===============6977039201982848132==--

