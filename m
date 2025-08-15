Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687B9CA0FEE
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11409.1755263221155361270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XV7XNguK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MeqIbmv3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010198add7623c-ad85af1f-73a2-4b56-983c-cc79e0925efd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B1LAiOWN7XenmHg81F7Nj7k6OJ9D8iWTmoQ40kr1evQ=;
	b=XV7XNguKPX+yP683GxfdKox1gqDcRZ1HaBu+YxMK5mjsTmpLPPozpfX31aaO1DuA
	4UsjHw7Hg0PMfIAIXtOJki+8mSJHmDIoHFxlLDPvRXw61Vcb9Qn70XMdf70OGe2sl8h
	loAm79Mfy6jHAO7pct3MlSKrITeuEmGrg3+d8twA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B1LAiOWN7XenmHg81F7Nj7k6OJ9D8iWTmoQ40kr1evQ=;
	b=MeqIbmv36DZdBVAIxud/N8mAZ8XbltjoekKEUcEtUFXl2zNPG99lf+UopgXD5g0D
	zMewimBj67+MHxszVgQIoyd3KQ4+9eze83gYBNsoVU45hhvhhS0wOFCBQ09VJ0Eq+aG
	5HvsKaJHoD8GC2IOxzLx2HK/Th8JLAcQgB3jZcS4=
Content-Type: multipart/mixed; boundary="===============4415376445692975955=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.4.5 SUCCEEDED
Message-ID: <01010198add7623c-ad85af1f-73a2-4b56-983c-cc79e0925efd-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221929

--===============4415376445692975955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpydWJ5KiB0byAqMy40LjUqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXJ1YnktdXBncmFkZS0zLjQuNC0zLjQuNS5wYXRj
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
bSA4YzNjZmJhODgyOTM5MzE0NTMxMGVlMWY1NzA5Mzc0Mjk0Mjg2ODkxIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRh
dGU6IEZyaSwgMTUgQXVnIDIwMjUgMTA6MTI6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBydWJ5
OiB1cGdyYWRlIDMuNC40IC0+IDMuNC41CgotLS0KIC4uLjAwMS1leHRtay1maXgtY3Jvc3MtY29t
cGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCB8IDQgKystLQogLi4ubV9kdW1wLmMtRGVm
aW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIHwgNCArKy0tCiAuLi4v
cnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCAgfCAy
ICstCiAuLi4vcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24u
cGF0Y2ggfCA4ICsrKystLS0tCiAuLi5ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMt
aW4tZ2VuZXJhdGVkLU0ucGF0Y2ggfCA0ICsrLS0KIC4uLnJrLUdlbXNwZWMtcmVwcm9kdWNpYmxl
LWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCB8IDIgKy0KIC4uLi9ydWJ5L3J1YnkvMDAw
Ni1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCAgICAgICB8IDQgKystLQogLi4uMDct
U2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIHwgNSAr
LS0tLQogLi4uL3J1Ynkve3J1YnlfMy40LjQuYmIgPT4gcnVieV8zLjQuNS5iYn0gICAgICAgICAg
ICAgICAgIHwgMiArLQogOSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxOSBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8zLjQuNC5i
YiA9PiBydWJ5XzMuNC41LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJu
YWwtZ2Vtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRt
ay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaAppbmRleCBmMTc5
NzBlOWM5Li5jNWFlMjZmYTZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZp
eC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAwMzcwMGVjMjU2Nzg5ZTAyZGUyMGI1OGJjYTA4MGM2ZmVmNTkyMzM2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMmE4NzU4ZTg4NzkwZGUyMjdmNmUwNWRiYTY4MWEyZjIw
ZjA1MDgyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9xP0FuZHI9QzM9
QTk9MjBEcmFzemlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KIERhdGU6IE1vbiwgMzAgU2Vw
IDIwMTkgMTY6NTc6MDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXh0bWs6IGZpeCBjcm9zcy1j
b21waWxhdGlvbiBvZiBleHRlcm5hbCBnZW1zCkBAIC0xNiw3ICsxNiw3IEBAIFNpZ25lZC1vZmYt
Ynk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9leHQvZXh0
bWsucmIgYi9leHQvZXh0bWsucmIKLWluZGV4IDhiNmIzNjUuLjMwNDhmNzUgMTAwNzU1CitpbmRl
eCAxZDE2NTQ1Li5hZDk3MWVhIDEwMDc1NQogLS0tIGEvZXh0L2V4dG1rLnJiCiArKysgYi9leHQv
ZXh0bWsucmIKIEBAIC00MzQsOCArNDM0LDggQEAgZWxzZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1S
RUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNj
di5wYXRjaAppbmRleCA3OTkzMjRjYWVhLi5jOWFlZTFjZGY1IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5k
LVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVz
bC1yaXNjdi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjk5MmQ3ODFlMDViNjE0ODliZGY1
YTJhOWFlZTZjYzYxNmYxNzQyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2IyNTA1
Y2FiMTkxNjA4YjRmZjY5YzNhMjJkN2RjZDM3YzA2M2I1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI1IEph
biAyMDIyIDIwOjI5OjE0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZtX2R1bXAuYzogRGVmaW5l
IFJFR19TMSBhbmQgUkVHX1MyIGZvciBtdXNsL3Jpc2N2CkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvdm1fZHVtcC5jIGIvdm1fZHVtcC5jCi1p
bmRleCA1ODczZTUyLi45ZWI0ZGIxIDEwMDY0NAoraW5kZXggOTkzMzlmZC4uOGM1YmIwMyAxMDA2
NDQKIC0tLSBhL3ZtX2R1bXAuYwogKysrIGIvdm1fZHVtcC5jCiBAQCAtNDAsNiArNDAsMTEgQEAK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxE
RkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBh
dGNoCmluZGV4IDg0ZmU5YWVlM2QuLjViMGY0Y2EyODQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxp
YnJ1YnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9i
ZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMjYyNWY2YzE1NTEwNWQzNTJkNmExZmYzYTcyMmU3ODk2NDMxZmY5MSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGUyMzExMWI0NmZkMGEwMjNhMWQzMzRmYzNhZTk4NzNhM2Y5
OTAwNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdG9waGVyIExhcnNvbiA8
Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+CiBEYXRlOiBUaHUsIDUgTWF5IDIwMTYgMTA6NTk6MDcg
LTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gT2JleSBMREZMQUdTIGZvciB0aGUgbGluayBvZiBsaWJy
dWJ5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRv
Yy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0
aW9uLnBhdGNoCmluZGV4IDg3YTFlODI1MTYuLmQzOWUyMjc5ODcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1k
b2N1bWVudGF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA5ODA3MWMwYjI4YTQ1Y2QyMWEyY2JlNjc0NmNlMzkwNjc5MzJiNjJmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZjVkNDc4MDJiNGU1ZGUyNTI4Y2FiY2ZhMmZi
Y2JhYmU2MzFjYTBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0aWFuIEhv
ZnN0YWVkdGxlciA8emVoYUBkZWJpYW4ub3JnPgogRGF0ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTow
NDozNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSByZG9jOiBidWlsZCByZXByb2R1Y2libGUgZG9j
dW1lbnRhdGlvbgpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBI
b2ZzdGFlZHRsZXIgPHplaGFAZGViaWFuLm9yZz4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGliL3Jkb2MvZ2VuZXJhdG9y
L2pzb25faW5kZXgucmIgYi9saWIvcmRvYy9nZW5lcmF0b3IvanNvbl9pbmRleC5yYgotaW5kZXgg
YzQ1NDkxMC4uMjRmZWFiMCAxMDA2NDQKK2luZGV4IDA2NWNhYTQuLmNmYTFmMzMgMTAwNjQ0CiAt
LS0gYS9saWIvcmRvYy9nZW5lcmF0b3IvanNvbl9pbmRleC5yYgogKysrIGIvbGliL3Jkb2MvZ2Vu
ZXJhdG9yL2pzb25faW5kZXgucmIKLUBAIC0xNzgsNyArMTc4LDcgQEAgY2xhc3MgUkRvYzo6R2Vu
ZXJhdG9yOjpKc29uSW5kZXgKK0BAIC0xNzYsNyArMTc2LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJh
dG9yOjpKc29uSW5kZXgKICAgICAgZGVidWdfbXNnICJXcml0aW5nIGd6aXBwZWQgc2VhcmNoIGlu
ZGV4IHRvICVzIiAlIG91dGZpbGUKICAKICAgICAgWmxpYjo6R3ppcFdyaXRlci5vcGVuKG91dGZp
bGUpIGRvIHxnenwKQEAgLTI2LDcgKzI2LDcgQEAgaW5kZXggYzQ1NDkxMC4uMjRmZWFiMCAxMDA2
NDQKICAgICAgICBnei5vcmlnX25hbWUgPSBzZWFyY2hfaW5kZXhfZmlsZS5iYXNlbmFtZS50b19z
CiAgICAgICAgZ3oud3JpdGUgc2VhcmNoX2luZGV4CiAgICAgICAgZ3ouY2xvc2UKLUBAIC0xOTYs
NyArMTk2LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgKK0BAIC0xOTQsNyAr
MTk0LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgKICAgICAgICAgIGRlYnVn
X21zZyAiV3JpdGluZyBnemlwcGVkIGZpbGUgdG8gJXMiICUgb3V0ZmlsZQogIAogICAgICAgICAg
WmxpYjo6R3ppcFdyaXRlci5vcGVuKG91dGZpbGUpIGRvIHxnenwKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Yt
b2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4t
Z2VuZXJhdGVkLU0ucGF0Y2gKaW5kZXggNGI2NzcxZmQyNi4uY2RmNDljNjljYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQt
bGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmpl
Y3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4ODdm
YWNjNGNhNWJjYjAyODBiMDI1YjM1YmJjMTg1MjhlNTI5MTQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDVhYzhiOGExMDlmOWNiN2VkMjFlMDk3NjdmMWM1NTI1OWU3MjcxNjYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXIt
aC5kZT4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gbGliL21rbWYucmI6IHNvcnQgbGlzdCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVk
IE1ha2VmaWxlCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJlaW5lciBIZXJybWFu
biA8cmVpbmVyQHJlaW5lci1oLmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGliL21rbWYucmIgYi9saWIvbWttZi5yYgot
aW5kZXggNzY4YTE1Mi4uZjE2Y2RkOCAxMDA2NDQKK2luZGV4IDk5ZjM3NjQuLjYyMzc3YjYgMTAw
NjQ0CiAtLS0gYS9saWIvbWttZi5yYgogKysrIGIvbGliL21rbWYucmIKIEBAIC0yNDgwLDcgKzI0
ODAsNyBAQCBMT0NBTF9MSUJTID0gI3skTE9DQUxfTElCU30KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNo
YW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1
LXRvby5wYXRjaAppbmRleCAxOTBlYjdkNzI4Li43ZWIwOTdkMWQyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJs
ZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGlu
Zy03ODQyMjUtdG9vLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NzA1MWJlOWNiOTMxN2Qy
YzRkNjFhODJkNmQ5NTM4MDllOTYyZjEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAw
ZDE2OWI2ZDEyYTg1MmMyY2RlNzA4NjI1OTU4M2Y4ODUwYjFmNjEzIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERh
dGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtl
IGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxl
LnBhdGNoCmluZGV4IDEyMWJkY2YzYWIuLmI2OWJjZjdjMjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1z
cGVjcy1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1OGJkYWNhM2Q1
Mzc5YWZjYjk1NGJiNTdjNjkwYzc3MzY4MDdlYzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDc5ZjZiNTZkYzMwYmMwZTU5Y2I3ZDljYTI5ODQwMDBjNjAyOWU5YTcgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJpYW4ub3Jn
PgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hd
IE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCkBAIC02NCw3ICs2NCw3IEBAIGluZGV4IDU3MTlm
ODMuLmZlNzYyNjAgMTAwNjQ0CiAgICBzcGVjLmVtYWlsICAgICAgICAgPSBbImtudUBpZGFlbW9u
cy5vcmciLCAidW1lQG1haG9yb2JhLm9yZyJdCiAgCiBkaWZmIC0tZ2l0IGEvbGliL3Jkb2MvcmRv
Yy5nZW1zcGVjIGIvbGliL3Jkb2MvcmRvYy5nZW1zcGVjCi1pbmRleCAzMTQ0ZGY1Li42NWMzMTNm
IDEwMDY0NAoraW5kZXggNDdmNDgwMi4uY2YwYjVmNyAxMDA2NDQKIC0tLSBhL2xpYi9yZG9jL3Jk
b2MuZ2Vtc3BlYwogKysrIGIvbGliL3Jkb2MvcmRvYy5nZW1zcGVjCiBAQCAtNyw2ICs3LDcgQEAg
ZW5kCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tp
cC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Np
b25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaAppbmRleCBlMzU3NGYxYTgxLi5hOTI2NGE3YzU0IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0
X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9u
cy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDljNDc0OGFhZTRm
NjkzOTBhMzY4NzVhYTI3ZDcwYzNjNjMyYWU5NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDllYWU3YWQ4NGU5NjlmOWQ3YzA2NTIxNDMwZWU5OTEzYzIyMzE4ODIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2
ZXIuY29tPgogRGF0ZTogTW9uLCA3IEp1bCAyMDI1IDE1OjA1OjU3ICswODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIFNraXAgdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zIHRlc3QgdW5kZXIgcm9vdApAQCAt
MjcsNiArMjcsMyBAQCBpbmRleCBkMjA5NmEwLi44MGUzMzY4IDEwMDY0NAogIAogICAgICBta2Rp
ciAndG1wZGF0YWRpcicKICAgICAgdG91Y2ggJ3RtcGRhdGFkaXIvdG1wZGF0YScKLS0tIAotMi4z
NC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC41LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40
LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjUuYmIK
aW5kZXggYzUzMjQwMzMzOS4uYjc3ZDc2NTc4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieV8zLjQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5XzMuNC41LmJiCkBAIC00OSw3ICs0OSw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkg
ewogCiBERVBFTkRTOmFwcGVuZDpsaWJjLW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYTA1OTdiZmRmMzEyZTAxMGVmZDFlZmZhYThkN2YxZDc4MzMxNDZmZGMx
Nzk1MGNhYTgxNThmZmEzZGNiZmE4NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxZDg4ZDhhMjdi
NDQyZmRkZTRhYTA2ZGM5OWU4NmIwYmJmMGIyODg5NjNkODQzMzExMmRkNWZhYzc5OGZkNWVlIgog
CiBQQUNLQUdFQ09ORklHID8/PSAiIgogUEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMuZmls
dGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsIGQpfSIKLS0gCjIuNDcuMQoK

--===============4415376445692975955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ruby/ruby-dev: FILELIST: added "/usr/include/ruby-3.4.0/ruby/internal/attr/nonstring.h"
packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: removed "/usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_json_index.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_ri.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_comment.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_context.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_hard_break.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_heading.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_table_of_contents.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_changelog.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_markup.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot_po.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_text.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_any_method.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_i18n_text.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_include.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_normal_module.rb /usr/lib/ruby/
 ptest/test/rdoc/test_rdoc_single_class.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_darkfish.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_attr.rb /usr/lib/ruby/ptest/lib/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_formatter.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_inline_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_context_section.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_servlet.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rdoc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_raw.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_prism_ruby.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_encoding.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_ruby.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_store.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup
 _attribute_manager.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html_crossref.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_indented_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_tt_only.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_rd.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_joined_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_stats.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot_po_entry.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_include.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_token_stream.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_ri_paths.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_verbatim.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_require.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_tom_doc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rubygems_hook.rb 
 /usr/lib/ruby/ptest/test/rdoc/test_rdoc_cross_reference.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_class_module.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_i18n_locale.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_code_object.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_document.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_label.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_ansi.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_rdoc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_attributes.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_inline.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_normal_class.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_method_attr.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_extend.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_top_level.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_p
 arser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_ri_driver.rb /usr/lib/ruby/ptest/lib/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_pre_process.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_task.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html_snippet.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_constant.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_alias.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_c.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_bs.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_block_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_options.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_simple.rb", added "/usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_po_entry_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_simple_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_alias_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_stats_test.rb /usr/lib/ruby/p
 test/test/rdoc/rdoc_store_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_ri_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_c_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_ri_paths_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_method_attr_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_tt_only_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_attr_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rdoc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_task_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_hard_break_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_attributes_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_text_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_table_of_contents_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_context_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_ansi_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_formatter_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_ruby_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_darkfish_test.rb /usr/lib/ruby/pt
 est/test/rdoc/rdoc_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_any_method_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_include_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markdown_test_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_changelog_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_po_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_context_section_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_rdoc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_tom_doc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_normal_module_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_json_index_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_options_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_indented_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_joined_paragraph_test.rb /usr/lib/ruby/ptest/tes
 t/rdoc/rdoc_markup_raw_test.rb /usr/lib/ruby/ptest/test/prism/errors/defined_empty.txt /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_crossref_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_pre_process_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_rd_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_class_module_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_token_stream_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_inline_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_constant_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_code_object_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_include_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_ri_driver_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_attribute_manager_test.rb /usr/lib/ruby/include/ruby/internal/attr/nonstring.h /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_markup_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_bs_test.r
 b /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_verbatim_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_block_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_single_class_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_servlet_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_snippet_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_encoding_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_i18n_locale_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_document_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_cross_reference_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_inline_parser_test.rb /usr/lib/ruby/ptest/lib/rdoc/markdown/.document /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_heading_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_extend_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_top_level_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_i18n_text_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_label_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_tes
 t.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_comment_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_prism_ruby_test.rb /usr/lib/ruby/ptest/lib/rdoc/rd/.document /usr/lib/ruby/ptest/test/rdoc/rdoc_require_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rubygems_hook_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_normal_class_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markdown_test.rb"
packages/core2-64-poky-linux/ruby/ruby-rdoc: FILELIST: removed "/usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml"
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0 -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0 -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0, directory renamed /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7/exe -> /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.9/exe, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/exe -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/exe, directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0/debug -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.10.0/exe -> /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.14.0/exe, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib, directory renamed /usr/lib/ruby/
 gems/3.4.0/gems/debug-1.10.0/lib/debug -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib/debug/dap_custom -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib/debug/dap_custom, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/misc -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/misc, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/ext/debug -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/ext/debug, removed "/usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.1.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.5.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec /usr/lib/ruby/gems/3.4.0/specifications/debug-1.10.0.gemspec /usr/lib/libruby.so.3.4.4 /usr/lib/ruby/3.4.0/rubygems/shellwords.rb /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.0.gemspec /usr/lib/ruby/gems
 /3.4.0/specifications/default/io-nonblock-0.3.1.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.10.0.gemspec /usr/lib/ruby/gems/3.4.0/cache/debug-1.10.0.gem", added "/usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.2.gemspec /usr/lib/ruby/3.4.0/bundler/cli/doctor/ssl.rb /usr/lib/ruby/gems/3.4.0/cache/debug-1.11.0.gem /usr/lib/ruby/3.4.0/bundler/cli/doctor/diagnose.rb /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.14.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.9.gemspec /usr/lib/ruby/gems/3.4.0/specifications/debug-1.11.0.gemspec /usr/lib/libruby.so.3.4.5 /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.1.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.6.gemspec"
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.4 to libruby.so.3.4.5
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.4 to libruby.so.3.4.5
  /usr/lib/libruby.so.3.4.4 moved to /usr/lib/libruby.so.3.4.5
  /usr/lib/ruby/gems/3.4.0/cache/debug-1.10.0.gem moved to /usr/lib/ruby/gems/3.4.0/cache/debug-1.11.0.gem
  /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0 moved to /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0
  /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7 moved to /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.9
  /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0 moved to /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0
  /usr/lib/ruby/gems/3.4.0/gems/etc-1.4.5 moved to /usr/lib/ruby/gems/3.4.0/gems/etc-1.4.6
  /usr/lib/ruby/gems/3.4.0/gems/io-console-0.8.0 moved to /usr/lib/ruby/gems/3.4.0/gems/io-console-0.8.1
  /usr/lib/ruby/gems/3.4.0/gems/io-nonblock-0.3.1 moved to /usr/lib/ruby/gems/3.4.0/gems/io-nonblock-0.3.2
  /usr/lib/ruby/gems/3.4.0/gems/io-wait-0.3.1 moved to /usr/lib/ruby/gems/3.4.0/gems/io-wait-0.3.2
  /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.10.0 moved to /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.14.0
  /usr/lib/ruby/gems/3.4.0/gems/resolv-0.6.0 moved to /usr/lib/ruby/gems/3.4.0/gems/resolv-0.6.2
  /usr/lib/ruby/gems/3.4.0/specifications/debug-1.10.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/debug-1.11.0.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.9.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.5.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.6.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.1.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.10.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.14.0.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.2.gemspec
  /usr/include/ruby-3.4.0/ruby/internal/attr/nonstring.h was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor/diagnose.rb was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor/ssl.rb was added
  /usr/lib/ruby/include/ruby/internal/attr/nonstring.h was added
  /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml was removed
  /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml was removed
  /usr/lib/ruby/3.4.0/rubygems/shellwords.rb was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.4 to libruby.so.3.4.5
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.4 to libruby.so.3.4.5
  /usr/lib/libruby.so.3.4.4 moved to /usr/lib/libruby.so.3.4.5
  /usr/lib/ruby/gems/3.4.0/cache/debug-1.10.0.gem moved to /usr/lib/ruby/gems/3.4.0/cache/debug-1.11.0.gem
  /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0 moved to /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0
  /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7 moved to /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.9
  /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0 moved to /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0
  /usr/lib/ruby/gems/3.4.0/gems/etc-1.4.5 moved to /usr/lib/ruby/gems/3.4.0/gems/etc-1.4.6
  /usr/lib/ruby/gems/3.4.0/gems/io-console-0.8.0 moved to /usr/lib/ruby/gems/3.4.0/gems/io-console-0.8.1
  /usr/lib/ruby/gems/3.4.0/gems/io-nonblock-0.3.1 moved to /usr/lib/ruby/gems/3.4.0/gems/io-nonblock-0.3.2
  /usr/lib/ruby/gems/3.4.0/gems/io-wait-0.3.1 moved to /usr/lib/ruby/gems/3.4.0/gems/io-wait-0.3.2
  /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.10.0 moved to /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.14.0
  /usr/lib/ruby/gems/3.4.0/gems/resolv-0.6.0 moved to /usr/lib/ruby/gems/3.4.0/gems/resolv-0.6.2
  /usr/lib/ruby/gems/3.4.0/specifications/debug-1.10.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/debug-1.11.0.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.9.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.5.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.6.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.1.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.10.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.14.0.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.2.gemspec
  /usr/include/ruby-3.4.0/ruby/internal/attr/nonstring.h was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor/diagnose.rb was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor/ssl.rb was added
  /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml was removed
  /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml was removed
  /usr/lib/ruby/3.4.0/rubygems/shellwords.rb was removed

--===============4415376445692975955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.4.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch" to "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.5.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixin
 g-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch"
packages/core2-64-poky-linux/ruby: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby-dbg: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0/debug/.debug -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0/debug/.debug, removed "/usr/lib/.debug/libruby.so.3.4.4", added "/usr/lib/.debug/libruby.so.3.4.5"
packages/core2-64-poky-linux/ruby/ruby-dbg: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 11983712 to 11991736 (+0%)
packages/core2-64-poky-linux/ruby/ruby-dev: FILELIST: added "/usr/include/ruby-3.4.0/ruby/internal/attr/nonstring.h"
packages/core2-64-poky-linux/ruby/ruby-dev: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby-dev: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1588846 to 1590267 (+0%)
packages/core2-64-poky-linux/ruby/ruby-doc: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby-doc: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby-locale: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby-locale: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: removed "/usr/lib/ruby/ptest/test/rdoc/test_rdoc_cross_reference.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_include.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_inline_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_verbatim.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rubygems_hook.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_attribute_manager.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_raw.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html_crossref.rb /usr/lib/ruby/ptest/lib/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml /usr/lib/ruby/ptest/test/rdoc/test_rdoc_method_attr.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_indented_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_options.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_darkfish.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_simple.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_context_section.rb /usr/lib/ruby/ptest/test
 /rdoc/test_rdoc_parser_ruby.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_block_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_any_method.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_json_index.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_alias.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_bs.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_servlet.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_require.rb /usr/lib/ruby/ptest/lib/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_attributes.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_task.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_ri.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_ri_paths.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_constant.rb /usr
 /lib/ruby/ptest/test/rdoc/test_rdoc_single_class.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rdoc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_encoding.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_joined_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_ri_driver.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_formatter.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_inline.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_class_module.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_prism_ruby.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_text.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_comment.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_context.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_heading.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_code_object.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_store.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_label.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_document.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html_snippet
 .rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_rd.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_include.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_normal_class.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_c.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_pre_process.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_extend.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_tt_only.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_ansi.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_attr.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_rdoc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_hard_break.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot_po_entry.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_i18n_text.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_norm
 al_module.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_token_stream.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_tom_doc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_i18n_locale.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_top_level.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_changelog.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_markup.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot_po.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_stats.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_table_of_contents.rb", added "/usr/lib/ruby/ptest/test/rdoc/rdoc_cross_reference_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_ri_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_hard_break_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_include_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_extend_test.rb /usr/lib/
 ruby/ptest/test/rdoc/rdoc_markup_to_tt_only_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_pre_process_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_context_section_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_method_attr_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_i18n_locale_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_encoding_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rubygems_hook_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_markup_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_include_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_bs_test.rb /usr/lib/ruby/ptest/lib/rdoc/markdown/.document /usr/lib/ruby/ptest/test/rdoc/rdoc_code_object_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_context_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_rdoc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_po_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_test.rb 
 /usr/lib/ruby/ptest/lib/rdoc/rd/.document /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_ruby_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_block_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_options_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_inline_test.rb /usr/lib/ruby/include/ruby/internal/attr/nonstring.h /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_document_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_joined_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_changelog_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_tom_doc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_prism_ruby_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_ri_paths_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_formatter_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_alias_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_stats_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_store_test.rb /usr/lib
 /ruby/ptest/test/rdoc/rdoc_comment_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_json_index_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_verbatim_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_snippet_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_ansi_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_normal_class_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_i18n_text_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_indented_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_raw_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_ri_driver_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_c_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_servlet_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_crossref_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_rd_test.rb /usr/lib/ruby/ptest/test/rdoc/
 rdoc_markup_test.rb /usr/lib/ruby/ptest/test/prism/errors/defined_empty.txt /usr/lib/ruby/ptest/test/rdoc/rdoc_markdown_test_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_heading_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_single_class_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_table_of_contents_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_attr_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rdoc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_task_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_text_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_any_method_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_normal_module_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_inline_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_constant_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_require_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_top_level_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_attributes_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_dark
 fish_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_simple_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_label_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_po_entry_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_token_stream_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_class_module_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_attribute_manager_test.rb"
packages/core2-64-poky-linux/ruby/ruby-ptest: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 13654579 to 13682044 (+0%)
packages/core2-64-poky-linux/ruby/ruby-rdoc: FILELIST: removed "/usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml"
packages/core2-64-poky-linux/ruby/ruby-rdoc: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby-rdoc: PKGSIZE changed from 1931342 to 1934879 (+0%)
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby-src: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby-src: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby-src: PKGSIZE changed from 4256123 to 4263485 (+0%)
packages/core2-64-poky-linux/ruby/ruby-staticdev: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib/debug -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/ext/debug -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/ext/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/misc -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/misc, directory renamed /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.10.0/exe -> /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.14.0/exe, directory renamed /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7/exe -> /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.9/exe, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/exe -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/exe, directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0/debug -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/
 debug-1.10.0 -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib/debug/dap_custom -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib/debug/dap_custom, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib, directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0 -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0, removed "/usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.5.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.10.0.gemspec /usr/lib/ruby/3.4.0/rubygems/shellwords.rb /usr/lib/libruby.so.3.4.4 /usr/lib/ruby/gems/3.4.0/cache/debug-1.10.0.gem /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.1.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.1.gemspec /usr/lib/ruby/gems/3.4.0/specifi
 cations/default/io-console-0.8.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/debug-1.10.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec", added "/usr/lib/ruby/3.4.0/bundler/cli/doctor/diagnose.rb /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.2.gemspec /usr/lib/ruby/3.4.0/bundler/cli/doctor/ssl.rb /usr/lib/libruby.so.3.4.5 /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.6.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.2.gemspec /usr/lib/ruby/gems/3.4.0/cache/debug-1.11.0.gem /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.1.gemspec /usr/lib/ruby/gems/3.4.0/specifications/debug-1.11.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.9.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.14.0.gemspec"
packages/core2-64-poky-linux/ruby/ruby: PV changed from "3.4.4" to "3.4.5"
packages/core2-64-poky-linux/ruby/ruby: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/core2-64-poky-linux/ruby/ruby: PKGSIZE changed from 30767884 to 30788258 (+0%)
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.4 to libruby.so.3.4.5
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.4 to libruby.so.3.4.5
  /usr/lib/libruby.so.3.4.4 moved to /usr/lib/libruby.so.3.4.5
  /usr/lib/ruby/gems/3.4.0/cache/debug-1.10.0.gem moved to /usr/lib/ruby/gems/3.4.0/cache/debug-1.11.0.gem
  /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0 moved to /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0
  /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7 moved to /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.9
  /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0 moved to /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0
  /usr/lib/ruby/gems/3.4.0/gems/etc-1.4.5 moved to /usr/lib/ruby/gems/3.4.0/gems/etc-1.4.6
  /usr/lib/ruby/gems/3.4.0/gems/io-console-0.8.0 moved to /usr/lib/ruby/gems/3.4.0/gems/io-console-0.8.1
  /usr/lib/ruby/gems/3.4.0/gems/io-nonblock-0.3.1 moved to /usr/lib/ruby/gems/3.4.0/gems/io-nonblock-0.3.2
  /usr/lib/ruby/gems/3.4.0/gems/io-wait-0.3.1 moved to /usr/lib/ruby/gems/3.4.0/gems/io-wait-0.3.2
  /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.10.0 moved to /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.14.0
  /usr/lib/ruby/gems/3.4.0/gems/resolv-0.6.0 moved to /usr/lib/ruby/gems/3.4.0/gems/resolv-0.6.2
  /usr/lib/ruby/gems/3.4.0/specifications/debug-1.10.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/debug-1.11.0.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.9.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.5.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.6.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.1.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.10.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.14.0.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.2.gemspec
  /usr/include/ruby-3.4.0/ruby/internal/attr/nonstring.h was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor/diagnose.rb was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor/ssl.rb was added
  /usr/lib/ruby/include/ruby/internal/attr/nonstring.h was added
  /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml was removed
  /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml was removed
  /usr/lib/ruby/3.4.0/rubygems/shellwords.rb was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.4 to libruby.so.3.4.5
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.4 to libruby.so.3.4.5
  /usr/lib/libruby.so.3.4.4 moved to /usr/lib/libruby.so.3.4.5
  /usr/lib/ruby/gems/3.4.0/cache/debug-1.10.0.gem moved to /usr/lib/ruby/gems/3.4.0/cache/debug-1.11.0.gem
  /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0 moved to /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0
  /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7 moved to /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.9
  /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0 moved to /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0
  /usr/lib/ruby/gems/3.4.0/gems/etc-1.4.5 moved to /usr/lib/ruby/gems/3.4.0/gems/etc-1.4.6
  /usr/lib/ruby/gems/3.4.0/gems/io-console-0.8.0 moved to /usr/lib/ruby/gems/3.4.0/gems/io-console-0.8.1
  /usr/lib/ruby/gems/3.4.0/gems/io-nonblock-0.3.1 moved to /usr/lib/ruby/gems/3.4.0/gems/io-nonblock-0.3.2
  /usr/lib/ruby/gems/3.4.0/gems/io-wait-0.3.1 moved to /usr/lib/ruby/gems/3.4.0/gems/io-wait-0.3.2
  /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.10.0 moved to /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.14.0
  /usr/lib/ruby/gems/3.4.0/gems/resolv-0.6.0 moved to /usr/lib/ruby/gems/3.4.0/gems/resolv-0.6.2
  /usr/lib/ruby/gems/3.4.0/specifications/debug-1.10.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/debug-1.11.0.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.9.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.5.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.6.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.1.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.10.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.14.0.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.2.gemspec
  /usr/include/ruby-3.4.0/ruby/internal/attr/nonstring.h was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor/diagnose.rb was added
  /usr/lib/ruby/3.4.0/bundler/cli/doctor/ssl.rb was added
  /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml was removed
  /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml was removed
  /usr/lib/ruby/3.4.0/rubygems/shellwords.rb was removed

--===============4415376445692975955==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.4.4-3.4.5.patch"

RnJvbSA4YzNjZmJhODgyOTM5MzE0NTMxMGVlMWY1NzA5Mzc0Mjk0Mjg2ODkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTA6MTI6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDMuNC40IC0+IDMuNC41CgotLS0KIC4uLjAwMS1leHRtay1maXgtY3Jvc3Mt
Y29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCB8IDQgKystLQogLi4ubV9kdW1wLmMt
RGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIHwgNCArKy0tCiAu
Li4vcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCAg
fCAyICstCiAuLi4vcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRp
b24ucGF0Y2ggfCA4ICsrKystLS0tCiAuLi5ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmls
ZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2ggfCA0ICsrLS0KIC4uLnJrLUdlbXNwZWMtcmVwcm9kdWNp
YmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCB8IDIgKy0KIC4uLi9ydWJ5L3J1Ynkv
MDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCAgICAgICB8IDQgKystLQogLi4u
MDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIHwg
NSArLS0tLQogLi4uL3J1Ynkve3J1YnlfMy40LjQuYmIgPT4gcnVieV8zLjQuNS5iYn0gICAgICAg
ICAgICAgICAgIHwgMiArLQogOSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8zLjQu
NC5iYiA9PiBydWJ5XzMuNC41LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0
ZXJuYWwtZ2Vtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1l
eHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaAppbmRleCBm
MTc5NzBlOWM5Li5jNWFlMjZmYTZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdl
bXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1r
LWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAwMzcwMGVjMjU2Nzg5ZTAyZGUyMGI1OGJjYTA4MGM2ZmVmNTkyMzM2IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMmE4NzU4ZTg4NzkwZGUyMjdmNmUwNWRiYTY4MWEy
ZjIwZjA1MDgyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9xP0FuZHI9
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
aXNjdi5wYXRjaAppbmRleCA3OTkzMjRjYWVhLi5jOWFlZTFjZGY1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEt
YW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3It
bXVzbC1yaXNjdi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjk5MmQ3ODFlMDViNjE0ODli
ZGY1YTJhOWFlZTZjYzYxNmYxNzQyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2Iy
NTA1Y2FiMTkxNjA4YjRmZjY5YzNhMjJkN2RjZDM3YzA2M2I1YyBNb24gU2VwIDE3IDAwOjAwOjAw
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
LnBhdGNoCmluZGV4IDg0ZmU5YWVlM2QuLjViMGY0Y2EyODQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9m
LWxpYnJ1YnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAy
LU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMjYyNWY2YzE1NTEwNWQzNTJkNmExZmYzYTcyMmU3ODk2NDMxZmY5MSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGUyMzExMWI0NmZkMGEwMjNhMWQzMzRmYzNhZTk4NzNh
M2Y5OTAwNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdG9waGVyIExhcnNv
biA8Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+CiBEYXRlOiBUaHUsIDUgTWF5IDIwMTYgMTA6NTk6
MDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gT2JleSBMREZMQUdTIGZvciB0aGUgbGluayBvZiBs
aWJydWJ5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMt
cmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVu
dGF0aW9uLnBhdGNoCmluZGV4IDg3YTFlODI1MTYuLmQzOWUyMjc5ODcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJs
ZS1kb2N1bWVudGF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA5ODA3MWMwYjI4YTQ1Y2QyMWEyY2JlNjc0NmNlMzkwNjc5MzJiNjJm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZjVkNDc4MDJiNGU1ZGUyNTI4Y2FiY2Zh
MmZiY2JhYmU2MzFjYTBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0aWFu
IEhvZnN0YWVkdGxlciA8emVoYUBkZWJpYW4ub3JnPgogRGF0ZTogVHVlLCAxMCBPY3QgMjAxNyAx
NTowNDozNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSByZG9jOiBidWlsZCByZXByb2R1Y2libGUg
ZG9jdW1lbnRhdGlvbgpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBIb2ZzdGFlZHRsZXIgPHplaGFAZGViaWFuLm9yZz4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGliL3Jkb2MvZ2VuZXJh
dG9yL2pzb25faW5kZXgucmIgYi9saWIvcmRvYy9nZW5lcmF0b3IvanNvbl9pbmRleC5yYgotaW5k
ZXggYzQ1NDkxMC4uMjRmZWFiMCAxMDA2NDQKK2luZGV4IDA2NWNhYTQuLmNmYTFmMzMgMTAwNjQ0
CiAtLS0gYS9saWIvcmRvYy9nZW5lcmF0b3IvanNvbl9pbmRleC5yYgogKysrIGIvbGliL3Jkb2Mv
Z2VuZXJhdG9yL2pzb25faW5kZXgucmIKLUBAIC0xNzgsNyArMTc4LDcgQEAgY2xhc3MgUkRvYzo6
R2VuZXJhdG9yOjpKc29uSW5kZXgKK0BAIC0xNzYsNyArMTc2LDcgQEAgY2xhc3MgUkRvYzo6R2Vu
ZXJhdG9yOjpKc29uSW5kZXgKICAgICAgZGVidWdfbXNnICJXcml0aW5nIGd6aXBwZWQgc2VhcmNo
IGluZGV4IHRvICVzIiAlIG91dGZpbGUKICAKICAgICAgWmxpYjo6R3ppcFdyaXRlci5vcGVuKG91
dGZpbGUpIGRvIHxnenwKQEAgLTI2LDcgKzI2LDcgQEAgaW5kZXggYzQ1NDkxMC4uMjRmZWFiMCAx
MDA2NDQKICAgICAgICBnei5vcmlnX25hbWUgPSBzZWFyY2hfaW5kZXhfZmlsZS5iYXNlbmFtZS50
b19zCiAgICAgICAgZ3oud3JpdGUgc2VhcmNoX2luZGV4CiAgICAgICAgZ3ouY2xvc2UKLUBAIC0x
OTYsNyArMTk2LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgKK0BAIC0xOTQs
NyArMTk0LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgKICAgICAgICAgIGRl
YnVnX21zZyAiV3JpdGluZyBnemlwcGVkIGZpbGUgdG8gJXMiICUgb3V0ZmlsZQogIAogICAgICAg
ICAgWmxpYjo6R3ppcFdyaXRlci5vcGVuKG91dGZpbGUpIGRvIHxnenwKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qt
b2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMt
aW4tZ2VuZXJhdGVkLU0ucGF0Y2gKaW5kZXggNGI2NzcxZmQyNi4uY2RmNDljNjljYiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNv
cnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1v
YmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4
ODdmYWNjNGNhNWJjYjAyODBiMDI1YjM1YmJjMTg1MjhlNTI5MTQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDVhYzhiOGExMDlmOWNiN2VkMjFlMDk3NjdmMWM1NTI1OWU3MjcxNjYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWlu
ZXItaC5kZT4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6
IFtQQVRDSF0gbGliL21rbWYucmI6IHNvcnQgbGlzdCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJh
dGVkIE1ha2VmaWxlCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJlaW5lciBIZXJy
bWFubiA8cmVpbmVyQHJlaW5lci1oLmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGliL21rbWYucmIgYi9saWIvbWttZi5y
YgotaW5kZXggNzY4YTE1Mi4uZjE2Y2RkOCAxMDA2NDQKK2luZGV4IDk5ZjM3NjQuLjYyMzc3YjYg
MTAwNjQ0CiAtLS0gYS9saWIvbWttZi5yYgogKysrIGIvbGliL21rbWYucmIKIEBAIC0yNDgwLDcg
KzI0ODAsNyBAQCBMT0NBTF9MSUJTID0gI3skTE9DQUxfTElCU30KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxl
LWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0
MjI1LXRvby5wYXRjaAppbmRleCAxOTBlYjdkNzI4Li43ZWIwOTdkMWQyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVj
aWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZp
eGluZy03ODQyMjUtdG9vLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NzA1MWJlOWNiOTMx
N2QyYzRkNjFhODJkNmQ5NTM4MDllOTYyZjEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAwZDE2OWI2ZDEyYTg1MmMyY2RlNzA4NjI1OTU4M2Y4ODUwYjFmNjEzIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4K
IERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBN
YWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNp
YmxlLnBhdGNoCmluZGV4IDEyMWJkY2YzYWIuLmI2OWJjZjdjMjMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJs
ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1n
ZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1OGJkYWNh
M2Q1Mzc5YWZjYjk1NGJiNTdjNjkwYzc3MzY4MDdlYzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDc5ZjZiNTZkYzMwYmMwZTU5Y2I3ZDljYTI5ODQwMDBjNjAyOWU5YTcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJpYW4u
b3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCkBAIC02NCw3ICs2NCw3IEBAIGluZGV4IDU3
MTlmODMuLmZlNzYyNjAgMTAwNjQ0CiAgICBzcGVjLmVtYWlsICAgICAgICAgPSBbImtudUBpZGFl
bW9ucy5vcmciLCAidW1lQG1haG9yb2JhLm9yZyJdCiAgCiBkaWZmIC0tZ2l0IGEvbGliL3Jkb2Mv
cmRvYy5nZW1zcGVjIGIvbGliL3Jkb2MvcmRvYy5nZW1zcGVjCi1pbmRleCAzMTQ0ZGY1Li42NWMz
MTNmIDEwMDY0NAoraW5kZXggNDdmNDgwMi4uY2YwYjVmNyAxMDA2NDQKIC0tLSBhL2xpYi9yZG9j
L3Jkb2MuZ2Vtc3BlYwogKysrIGIvbGliL3Jkb2MvcmRvYy5nZW1zcGVjCiBAQCAtNyw2ICs3LDcg
QEAgZW5kCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDct
U2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1p
c3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaAppbmRleCBlMzU3NGYxYTgxLi5hOTI2NGE3YzU0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10
ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNz
aW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDljNDc0OGFh
ZTRmNjkzOTBhMzY4NzVhYTI3ZDcwYzNjNjMyYWU5NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDllYWU3YWQ4NGU5NjlmOWQ3YzA2NTIxNDMwZWU5OTEzYzIyMzE4ODIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5k
cml2ZXIuY29tPgogRGF0ZTogTW9uLCA3IEp1bCAyMDI1IDE1OjA1OjU3ICswODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIFNraXAgdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zIHRlc3QgdW5kZXIgcm9vdApA
QCAtMjcsNiArMjcsMyBAQCBpbmRleCBkMjA5NmEwLi44MGUzMzY4IDEwMDY0NAogIAogICAgICBt
a2RpciAndG1wZGF0YWRpcicKICAgICAgdG91Y2ggJ3RtcGRhdGFkaXIvdG1wZGF0YScKLS0tIAot
Mi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40
LjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC41LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynlf
My40LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjUu
YmIKaW5kZXggYzUzMjQwMzMzOS4uYjc3ZDc2NTc4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieV8zLjQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5XzMuNC41LmJiCkBAIC00OSw3ICs0OSw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5k
KCkgewogCiBERVBFTkRTOmFwcGVuZDpsaWJjLW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYTA1OTdiZmRmMzEyZTAxMGVmZDFlZmZhYThkN2YxZDc4MzMxNDZm
ZGMxNzk1MGNhYTgxNThmZmEzZGNiZmE4NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxZDg4ZDhh
MjdiNDQyZmRkZTRhYTA2ZGM5OWU4NmIwYmJmMGIyODg5NjNkODQzMzExMmRkNWZhYzc5OGZkNWVl
IgogCiBQQUNLQUdFQ09ORklHID8/PSAiIgogUEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMu
ZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsIGQpfSIKLS0gCjIuNDcuMQoK

--===============4415376445692975955==--

