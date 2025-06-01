Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB972C61CE8
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:44 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.27775.1748786129144655672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Xg5toCP1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AVgNNCPt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101972bc6da76-8cd24852-e5cc-4f41-a527-199b5d366ab6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786142;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mFZFm87MSjSGtazSy3y53CSXOQcOMcVxBVhCgDrkRIM=;
	b=Xg5toCP1Uw9UXSupq7ZoSIv4jfGfUFHloAyvFCaXuDfy9wTdj0yCoXtO5nVmC96h
	JvvHCCc2IRGdX8pAykNpgRFOVmhhy2+i6eHh+S3Tq1fGjSoOUvld7mhxz9x0cNZvb9q
	r2LTRJoSbmghOZec9WbmnSSQYiJL0ihjTo5u5sOU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786142;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mFZFm87MSjSGtazSy3y53CSXOQcOMcVxBVhCgDrkRIM=;
	b=AVgNNCPt+rzi7hkBLxZLz0UUtMwmT1IPlyOKw0Ozoy3OvsTTimuFNqOckT25b9GW
	a30vcGXf9PUxBE5SZQa7ZWLw8SXQYgM9kFShosOpxC9sujDJpspcDOLrdi1WNLzPrWU
	FUnFOiifaKuyftBvqRUubkn161UBDbMzbvuzmpkg=
Content-Type: multipart/mixed; boundary="===============2506162417419915123=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.4.4 SUCCEEDED
Message-ID: <010101972bc6da76-8cd24852-e5cc-4f41-a527-199b5d366ab6-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217626

--===============2506162417419915123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpydWJ5KiB0byAqMy40LjQqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXJ1YnktdXBncmFkZS0zLjQuMy0zLjQuNC5wYXRj
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
bSAyNzNlYjNlZGMwNzU5YTI1NGI2ZmU2ZWZlMmE4YTdiZDJhOTY0YzA0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRh
dGU6IFN1biwgMSBKdW4gMjAyNSAxMDoyOTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1Ynk6
IHVwZ3JhZGUgMy40LjMgLT4gMy40LjQKCi0tLQogLi4uLzAwMDEtZXh0bWstZml4LWNyb3NzLWNv
bXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2ggfCA0ICsrLS0KIC4uLi12bV9kdW1wLmMt
RGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIHwgNCArKy0tCiAu
Li4vcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCAg
ICB8IDYgKysrLS0tCiAuLi4vcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3Vt
ZW50YXRpb24ucGF0Y2ggICB8IDIgKy0KIC4uLmItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0
LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIHwgNCArKy0tCiAuLi5NYXJrLUdlbXNwZWMtcmVw
cm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCB8IDYgKysrLS0tCiAuLi4v
cnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2ggICAgICAgICB8
IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzMuNC4zLmJiID0+IHJ1Ynlf
My40LjQuYmJ9IHwgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8zLjQu
My5iYiA9PiBydWJ5XzMuNC40LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0
ZXJuYWwtZ2Vtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1l
eHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaAppbmRleCBm
MTc5NzBlOWM5Li5mYjljZjBjY2I2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdl
bXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1r
LWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAwMzcwMGVjMjU2Nzg5ZTAyZGUyMGI1OGJjYTA4MGM2ZmVmNTkyMzM2IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlMGE1YjQ5ZGQ3NzBkZTBkOTcxMWE5MjVjMDZlZTAw
N2Y2ODdlOGEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9xP0FuZHI9
QzM9QTk9MjBEcmFzemlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KIERhdGU6IE1vbiwgMzAg
U2VwIDIwMTkgMTY6NTc6MDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXh0bWs6IGZpeCBjcm9z
cy1jb21waWxhdGlvbiBvZiBleHRlcm5hbCBnZW1zCkBAIC0xNiw3ICsxNiw3IEBAIFNpZ25lZC1v
ZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9leHQv
ZXh0bWsucmIgYi9leHQvZXh0bWsucmIKLWluZGV4IDhiNmIzNjUuLjMwNDhmNzUgMTAwNzU1Citp
bmRleCAxZDE2NTQ1Li5hZDk3MWVhIDEwMDc1NQogLS0tIGEvZXh0L2V4dG1rLnJiCiArKysgYi9l
eHQvZXh0bWsucmIKIEBAIC00MzQsOCArNDM0LDggQEAgZWxzZQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFu
ZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1y
aXNjdi5wYXRjaAppbmRleCA3OTkzMjRjYWVhLi40M2I3NDJiYTEwIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEt
YW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3It
bXVzbC1yaXNjdi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjk5MmQ3ODFlMDViNjE0ODli
ZGY1YTJhOWFlZTZjYzYxNmYxNzQyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzBl
NzE3ZDk3ODE5Y2M2ODIzZWIzYTVkZDk1NTc4MzMzYzgyOTYwYSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI1
IEphbiAyMDIyIDIwOjI5OjE0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZtX2R1bXAuYzogRGVm
aW5lIFJFR19TMSBhbmQgUkVHX1MyIGZvciBtdXNsL3Jpc2N2CkBAIC0xNCw3ICsxNCw3IEBAIFNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvdm1fZHVtcC5jIGIvdm1fZHVtcC5j
Ci1pbmRleCA1ODczZTUyLi45ZWI0ZGIxIDEwMDY0NAoraW5kZXggOTkzMzlmZC4uOGM1YmIwMyAx
MDA2NDQKIC0tLSBhL3ZtX2R1bXAuYwogKysrIGIvdm1fZHVtcC5jCiBAQCAtNDAsNiArNDAsMTEg
QEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5
LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5
LnBhdGNoCmluZGV4IGJiNjdkZjBmNDAuLjhjNWIzZGY3MGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9m
LWxpYnJ1YnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAy
LU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gN2UyMzM3ZDhiMGRhZjI2NDc4NWNiMDZkMWQ2YzdkNjFlNDI4YTExYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODAxNDZjOWNlYjFmZWY0MmQwYzhkOGY1NTg3NzUwYjE4
ZjhlMWJlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdG9waGVyIExhcnNv
biA8Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+CiBEYXRlOiBUaHUsIDUgTWF5IDIwMTYgMTA6NTk6
MDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gT2JleSBMREZMQUdTIGZvciB0aGUgbGluayBvZiBs
aWJydWJ5CkBAIC0xMCwxMCArMTAsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS90ZW1wbGF0ZS9NYWtlZmlsZS5pbiBiL3RlbXBsYXRlL01ha2VmaWxlLmluCi1pbmRleCAwNTQz
MmNkLi40MWEwNWJiIDEwMDY0NAoraW5kZXggOGY5OTZiOC4uYzcwOGI2NCAxMDA2NDQKIC0tLSBh
L3RlbXBsYXRlL01ha2VmaWxlLmluCiArKysgYi90ZW1wbGF0ZS9NYWtlZmlsZS5pbgotQEAgLTEx
OSw3ICsxMTksNyBAQCBFTkFCTEVfU0hBUkVEID0gQEVOQUJMRV9TSEFSRURACitAQCAtMTIwLDcg
KzEyMCw3IEBAIEVOQUJMRV9TSEFSRUQgPSBARU5BQkxFX1NIQVJFREAKICBMRFNIQVJFRCA9IEBM
SUJSVUJZX0xEU0hBUkVEQAogIERMRFNIQVJFRCA9IEBETERTSEFSRURACiAgWERMREZMQUdTID0g
QERMREZMQUdTQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8w
MDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9j
dW1lbnRhdGlvbi5wYXRjaAppbmRleCA4N2ExZTgyNTE2Li5lOTYxYTlmNTc1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1
Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gOTgwNzFjMGIyOGE0NWNkMjFhMmNiZTY3NDZjZTM5MDY3OTMy
YjYyZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTBiMGVjYjhlN2FlOGJlMzJmZDMz
Y2I5MGNjODgxMzZjMWMxZDk4OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlz
dGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFAZGViaWFuLm9yZz4KIERhdGU6IFR1ZSwgMTAgT2N0IDIw
MTcgMTU6MDQ6MzQgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmRvYzogYnVpbGQgcmVwcm9kdWNp
YmxlIGRvY3VtZW50YXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVy
YXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1t
a21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKaW5k
ZXggNGI2NzcxZmQyNi4uOGIwNThhZWQ4YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMt
aW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVk
LU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4ODdmYWNjNGNhNWJjYjAyODBiMDI1YjM1
YmJjMTg1MjhlNTI5MTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU5ZmYzMWUyMDI2
NWEyZjY1MGRlMThhY2UzNTI3OGIzZTFlNGFlNjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5kZT4KIERhdGU6IFR1ZSwgMTAg
T2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliL21rbWYucmI6IHNv
cnQgbGlzdCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVkIE1ha2VmaWxlCkBAIC0xNyw3ICsx
Nyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJlaW5lciBIZXJybWFubiA8cmVpbmVyQHJlaW5lci1oLmRl
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvbGliL21rbWYucmIgYi9saWIvbWttZi5yYgotaW5kZXggNzY4YTE1Mi4uZjE2Y2Rk
OCAxMDA2NDQKK2luZGV4IDk5ZjM3NjQuLjYyMzc3YjYgMTAwNjQ0CiAtLS0gYS9saWIvbWttZi5y
YgogKysrIGIvbGliL21rbWYucmIKIEBAIC0yNDgwLDcgKzI0ODAsNyBAQCBMT0NBTF9MSUJTID0g
I3skTE9DQUxfTElCU30KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRv
by5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNw
ZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAppbmRleCBlZGE0
NWRkODYyLi5lYjg1YmE1MzExIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIy
NS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1h
cmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBmZjI1ZjZkZGRjZmJiYjdiMDQ2NDQ4NWJiNTEzMjQ1ODg2NmFi
NTFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkMWZkYTM2OWYxYjIwMjk5ZmUyMWQ3
MmZhZjM2YWFjNmQzZGQ2ZDI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMg
S2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAx
NToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJs
ZQpAQCAtMTIsMTAgKzEyLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2RlYmlhbl0K
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYiBiL2xpYi9ydWJ5Z2Vtcy9zcGVj
aWZpY2F0aW9uLnJiCi1pbmRleCA4ZjM1M2FlLi4wOTUxMjVmIDEwMDY0NAoraW5kZXggMGI5MDVh
Ny4uYTEwMmUzYyAxMDA2NDQKIC0tLSBhL2xpYi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJiCiAr
KysgYi9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgotQEAgLTE3MTEsNyArMTcxMSw5IEBA
IGNsYXNzIEdlbTo6U3BlY2lmaWNhdGlvbiA8IEdlbTo6QmFzaWNTcGVjaWZpY2F0aW9uCitAQCAt
MTcwOSw3ICsxNzA5LDkgQEAgY2xhc3MgR2VtOjpTcGVjaWZpY2F0aW9uIDwgR2VtOjpCYXNpY1Nw
ZWNpZmljYXRpb24KICAgICAgICAgICAgICAgICAgcmFpc2UoR2VtOjpJbnZhbGlkU3BlY2lmaWNh
dGlvbkV4Y2VwdGlvbiwKICAgICAgICAgICAgICAgICAgICAgICAgImludmFsaWQgZGF0ZSBmb3Jt
YXQgaW4gc3BlY2lmaWNhdGlvbjogI3tkYXRlLmluc3BlY3R9IikKICAgICAgICAgICAgICAgIGVu
ZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2Ut
Z2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCmluZGV4IDEyMWJkY2Yz
YWIuLmZjYzdlN2FhZTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1OGJkYWNhM2Q1Mzc5YWZjYjk1NGJiNTdjNjkwYzc3
MzY4MDdlYzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZhMTRhMDY3NWI1ZjI4NGY4
MGI1ZWQ2MThiZTkzMmYzNjlhYmE2OTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBM
dWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAy
MDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9k
dWNpYmxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC4z
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQuNC5iYgpzaW1pbGFyaXR5
IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMu
NC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC40LmJi
CmluZGV4IDQ1MDQ3Yjg4NTkuLjM5ZTg2ZmRkMjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnlfMy40LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieV8zLjQuNC5iYgpAQCAtNDgsNyArNDgsNyBAQCBkb19jb25maWd1cmU6cHJlcGVuZCgp
IHsKIAogREVQRU5EUzphcHBlbmQ6bGliYy1tdXNsID0gIiBsaWJ1Y29udGV4dCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjU1YTRjZDFkY2JlNWNhMjdjZjY1ZTg5YTkzNWE0ODJjMmJiMjI4NDgz
MjkzOTI2NjU1MWMwZWM2OGI0MzdmNDYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTA1OTdiZmRm
MzEyZTAxMGVmZDFlZmZhYThkN2YxZDc4MzMxNDZmZGMxNzk1MGNhYTgxNThmZmEzZGNiZmE4NSIK
IAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUcgKz0gIiR7QGJiLnV0aWxzLmZp
bHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCi0tIAoyLjQ3LjEKCg==

--===============2506162417419915123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.3.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch" to "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.4.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch 
 file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch"
packages/core2-64-poky-linux/ruby: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby-dbg: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.3.4.3", added "/usr/lib/.debug/libruby.so.3.4.4"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 11977344 to 11977240 (-0%)
packages/core2-64-poky-linux/ruby/ruby-dev: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-dev: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1587225 to 1588846 (+0%)
packages/core2-64-poky-linux/ruby/ruby-doc: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-doc: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby-locale: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-locale: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby-ptest: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 13639919 to 13643355 (+0%)
packages/core2-64-poky-linux/ruby/ruby-rdoc: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby-src: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-src: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby-staticdev: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/docs -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/docs, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/stringprep, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/config, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_parser, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6 -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/rakelib -> /usr/lib/ruby/gems/3.4.0/gems/
 net-imap-0.5.8/rakelib, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/sample -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/sample, removed "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sequence_set.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/authenticators.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib
 /net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/deprecated_client_options.rb /usr/lib/libruby.so.3.4.3 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/uidplus_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/fetch_data.rb", added "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sequence_set.rb /u
 sr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/authenticators.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.8.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/connection_state.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/uidplus_data.rb /usr/lib/libruby.so.3.4.4 /usr/lib/ruby/gems/3.4.0/gems/net-i
 map-0.5.8/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_reader.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.8.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/fetch_data.rb"
packages/core2-64-poky-linux/ruby/ruby: PKGSIZE changed from 30731324 to 30759692 (+0%)
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.3 to libruby.so.3.4.4
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.3 to libruby.so.3.4.4
  /usr/lib/libruby.so.3.4.3 moved to /usr/lib/libruby.so.3.4.4
  /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.8.gem
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6 moved to /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8
  /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.8.gemspec
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/connection_state.rb was added
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_reader.rb was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.3 to libruby.so.3.4.4
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.3 to libruby.so.3.4.4
  /usr/lib/libruby.so.3.4.3 moved to /usr/lib/libruby.so.3.4.4
  /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.8.gem
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6 moved to /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8
  /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.8.gemspec
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/connection_state.rb was added
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_reader.rb was added

--===============2506162417419915123==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.4.3-3.4.4.patch"

RnJvbSAyNzNlYjNlZGMwNzU5YTI1NGI2ZmU2ZWZlMmE4YTdiZDJhOTY0YzA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMDoyOTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1
Ynk6IHVwZ3JhZGUgMy40LjMgLT4gMy40LjQKCi0tLQogLi4uLzAwMDEtZXh0bWstZml4LWNyb3Nz
LWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2ggfCA0ICsrLS0KIC4uLi12bV9kdW1w
LmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIHwgNCArKy0t
CiAuLi4vcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRj
aCAgICB8IDYgKysrLS0tCiAuLi4vcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRv
Y3VtZW50YXRpb24ucGF0Y2ggICB8IDIgKy0KIC4uLmItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2Jq
ZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIHwgNCArKy0tCiAuLi5NYXJrLUdlbXNwZWMt
cmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCB8IDYgKysrLS0tCiAu
Li4vcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2ggICAgICAg
ICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzMuNC4zLmJiID0+IHJ1
YnlfMy40LjQuYmJ9IHwgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
NSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8z
LjQuMy5iYiA9PiBydWJ5XzMuNC40LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2Yt
ZXh0ZXJuYWwtZ2Vtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
MS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaAppbmRl
eCBmMTc5NzBlOWM5Li5mYjljZjBjY2I2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFs
LWdlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4
dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAwMzcwMGVjMjU2Nzg5ZTAyZGUyMGI1OGJjYTA4MGM2ZmVmNTkyMzM2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlMGE1YjQ5ZGQ3NzBkZTBkOTcxMWE5MjVjMDZl
ZTAwN2Y2ODdlOGEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9xP0Fu
ZHI9QzM9QTk9MjBEcmFzemlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KIERhdGU6IE1vbiwg
MzAgU2VwIDIwMTkgMTY6NTc6MDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXh0bWs6IGZpeCBj
cm9zcy1jb21waWxhdGlvbiBvZiBleHRlcm5hbCBnZW1zCkBAIC0xNiw3ICsxNiw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9l
eHQvZXh0bWsucmIgYi9leHQvZXh0bWsucmIKLWluZGV4IDhiNmIzNjUuLjMwNDhmNzUgMTAwNzU1
CitpbmRleCAxZDE2NTQ1Li5hZDk3MWVhIDEwMDc1NQogLS0tIGEvZXh0L2V4dG1rLnJiCiArKysg
Yi9leHQvZXh0bWsucmIKIEBAIC00MzQsOCArNDM0LDggQEAgZWxzZQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1Mx
LWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVz
bC1yaXNjdi5wYXRjaAppbmRleCA3OTkzMjRjYWVhLi40M2I3NDJiYTEwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdf
UzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1m
b3ItbXVzbC1yaXNjdi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjk5MmQ3ODFlMDViNjE0
ODliZGY1YTJhOWFlZTZjYzYxNmYxNzQyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NzBlNzE3ZDk3ODE5Y2M2ODIzZWIzYTVkZDk1NTc4MzMzYzgyOTYwYSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUs
IDI1IEphbiAyMDIyIDIwOjI5OjE0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZtX2R1bXAuYzog
RGVmaW5lIFJFR19TMSBhbmQgUkVHX1MyIGZvciBtdXNsL3Jpc2N2CkBAIC0xNCw3ICsxNCw3IEBA
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvdm1fZHVtcC5jIGIvdm1fZHVt
cC5jCi1pbmRleCA1ODczZTUyLi45ZWI0ZGIxIDEwMDY0NAoraW5kZXggOTkzMzlmZC4uOGM1YmIw
MyAxMDA2NDQKIC0tLSBhL3ZtX2R1bXAuYwogKysrIGIvdm1fZHVtcC5jCiBAQCAtNDAsNiArNDAs
MTEgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1P
YmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJy
dWJ5LnBhdGNoCmluZGV4IGJiNjdkZjBmNDAuLjhjNWIzZGY3MGEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5r
LW9mLWxpYnJ1YnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8w
MDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gN2UyMzM3ZDhiMGRhZjI2NDc4NWNiMDZkMWQ2YzdkNjFlNDI4YTExYiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODAxNDZjOWNlYjFmZWY0MmQwYzhkOGY1NTg3NzUw
YjE4ZjhlMWJlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdG9waGVyIExh
cnNvbiA8Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+CiBEYXRlOiBUaHUsIDUgTWF5IDIwMTYgMTA6
NTk6MDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gT2JleSBMREZMQUdTIGZvciB0aGUgbGluayBv
ZiBsaWJydWJ5CkBAIC0xMCwxMCArMTAsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS90ZW1wbGF0ZS9NYWtlZmlsZS5pbiBiL3RlbXBsYXRlL01ha2VmaWxlLmluCi1pbmRleCAw
NTQzMmNkLi40MWEwNWJiIDEwMDY0NAoraW5kZXggOGY5OTZiOC4uYzcwOGI2NCAxMDA2NDQKIC0t
LSBhL3RlbXBsYXRlL01ha2VmaWxlLmluCiArKysgYi90ZW1wbGF0ZS9NYWtlZmlsZS5pbgotQEAg
LTExOSw3ICsxMTksNyBAQCBFTkFCTEVfU0hBUkVEID0gQEVOQUJMRV9TSEFSRURACitAQCAtMTIw
LDcgKzEyMCw3IEBAIEVOQUJMRV9TSEFSRUQgPSBARU5BQkxFX1NIQVJFREAKICBMRFNIQVJFRCA9
IEBMSUJSVUJZX0xEU0hBUkVEQAogIERMRFNIQVJFRCA9IEBETERTSEFSRURACiAgWERMREZMQUdT
ID0gQERMREZMQUdTQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUt
ZG9jdW1lbnRhdGlvbi5wYXRjaAppbmRleCA4N2ExZTgyNTE2Li5lOTYxYTlmNTc1IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXBy
b2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTgwNzFjMGIyOGE0NWNkMjFhMmNiZTY3NDZjZTM5MDY3
OTMyYjYyZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTBiMGVjYjhlN2FlOGJlMzJm
ZDMzY2I5MGNjODgxMzZjMWMxZDk4OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENo
cmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFAZGViaWFuLm9yZz4KIERhdGU6IFR1ZSwgMTAgT2N0
IDIwMTcgMTU6MDQ6MzQgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmRvYzogYnVpbGQgcmVwcm9k
dWNpYmxlIGRvY3VtZW50YXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdl
bmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxp
Yi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gK
aW5kZXggNGI2NzcxZmQyNi4uOGIwNThhZWQ4YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmls
ZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJh
dGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4ODdmYWNjNGNhNWJjYjAyODBiMDI1
YjM1YmJjMTg1MjhlNTI5MTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU5ZmYzMWUy
MDI2NWEyZjY1MGRlMThhY2UzNTI3OGIzZTFlNGFlNjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5kZT4KIERhdGU6IFR1ZSwg
MTAgT2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliL21rbWYucmI6
IHNvcnQgbGlzdCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVkIE1ha2VmaWxlCkBAIC0xNyw3
ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJlaW5lciBIZXJybWFubiA8cmVpbmVyQHJlaW5lci1o
LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvbGliL21rbWYucmIgYi9saWIvbWttZi5yYgotaW5kZXggNzY4YTE1Mi4uZjE2
Y2RkOCAxMDA2NDQKK2luZGV4IDk5ZjM3NjQuLjYyMzc3YjYgMTAwNjQ0CiAtLS0gYS9saWIvbWtt
Zi5yYgogKysrIGIvbGliL21rbWYucmIKIEBAIC0yNDgwLDcgKzI0ODAsNyBAQCBMT0NBTF9MSUJT
ID0gI3skTE9DQUxfTElCU30KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1
LXRvby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdl
bXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAppbmRleCBl
ZGE0NWRkODYyLi5lYjg1YmE1MzExIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4
NDIyNS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1
LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmZjI1ZjZkZGRjZmJiYjdiMDQ2NDQ4NWJiNTEzMjQ1ODg2
NmFiNTFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkMWZkYTM2OWYxYjIwMjk5ZmUy
MWQ3MmZhZjM2YWFjNmQzZGQ2ZDI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVj
YXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAx
OSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVj
aWJsZQpAQCAtMTIsMTAgKzEyLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2RlYmlh
bl0KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYiBiL2xpYi9ydWJ5Z2Vtcy9z
cGVjaWZpY2F0aW9uLnJiCi1pbmRleCA4ZjM1M2FlLi4wOTUxMjVmIDEwMDY0NAoraW5kZXggMGI5
MDVhNy4uYTEwMmUzYyAxMDA2NDQKIC0tLSBhL2xpYi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJi
CiArKysgYi9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgotQEAgLTE3MTEsNyArMTcxMSw5
IEBAIGNsYXNzIEdlbTo6U3BlY2lmaWNhdGlvbiA8IEdlbTo6QmFzaWNTcGVjaWZpY2F0aW9uCitA
QCAtMTcwOSw3ICsxNzA5LDkgQEAgY2xhc3MgR2VtOjpTcGVjaWZpY2F0aW9uIDwgR2VtOjpCYXNp
Y1NwZWNpZmljYXRpb24KICAgICAgICAgICAgICAgICAgcmFpc2UoR2VtOjpJbnZhbGlkU3BlY2lm
aWNhdGlvbkV4Y2VwdGlvbiwKICAgICAgICAgICAgICAgICAgICAgICAgImludmFsaWQgZGF0ZSBm
b3JtYXQgaW4gc3BlY2lmaWNhdGlvbjogI3tkYXRlLmluc3BlY3R9IikKICAgICAgICAgICAgICAg
IGVuZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1h
a2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCmluZGV4IDEyMWJk
Y2YzYWIuLmZjYzdlN2FhZTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1OGJkYWNhM2Q1Mzc5YWZjYjk1NGJiNTdjNjkw
Yzc3MzY4MDdlYzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZhMTRhMDY3NWI1ZjI4
NGY4MGI1ZWQ2MThiZTkzMmYzNjlhYmE2OTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5v
diAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVw
cm9kdWNpYmxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMu
NC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQuNC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
XzMuNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC40
LmJiCmluZGV4IDQ1MDQ3Yjg4NTkuLjM5ZTg2ZmRkMjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieV8zLjQuNC5iYgpAQCAtNDgsNyArNDgsNyBAQCBkb19jb25maWd1cmU6cHJlcGVu
ZCgpIHsKIAogREVQRU5EUzphcHBlbmQ6bGliYy1tdXNsID0gIiBsaWJ1Y29udGV4dCIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjU1YTRjZDFkY2JlNWNhMjdjZjY1ZTg5YTkzNWE0ODJjMmJiMjI4
NDgzMjkzOTI2NjU1MWMwZWM2OGI0MzdmNDYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTA1OTdi
ZmRmMzEyZTAxMGVmZDFlZmZhYThkN2YxZDc4MzMxNDZmZGMxNzk1MGNhYTgxNThmZmEzZGNiZmE4
NSIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUcgKz0gIiR7QGJiLnV0aWxz
LmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCi0tIAoyLjQ3LjEKCg==

--===============2506162417419915123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6 -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/sample -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/sample, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/stringprep, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/docs -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/docs, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/rakelib -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/rakelib, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net, directory renamed /usr/l
 ib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_parser, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/config, removed "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/fetch_data.rb /usr/lib/libruby.so.3.4.3 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib
 /net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/uidplus_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sequence_set.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/authenticators.rb", added "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_p
 arser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_reader.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.8.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl.rb /usr/lib/libruby.so.3.4.4 /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.8.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/fetch_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/conn
 ection_state.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/uidplus_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sequence_set.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/authenticators.rb"
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.3 to libruby.so.3.4.4
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.3 to libruby.so.3.4.4
  /usr/lib/libruby.so.3.4.3 moved to /usr/lib/libruby.so.3.4.4
  /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.8.gem
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6 moved to /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8
  /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.8.gemspec
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/connection_state.rb was added
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_reader.rb was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.3 to libruby.so.3.4.4
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.3 to libruby.so.3.4.4
  /usr/lib/libruby.so.3.4.3 moved to /usr/lib/libruby.so.3.4.4
  /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.8.gem
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6 moved to /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8
  /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.8.gemspec
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/connection_state.rb was added
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_reader.rb was added

--===============2506162417419915123==--

