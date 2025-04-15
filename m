Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154FBC369DE
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20155.1744723976793127524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KMEjADN/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CX7zlr3Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019639a73252-b7d8eb2c-737d-4ee6-b09d-2e7194d45e14-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X9ejVKI4SfoyB16ow3/852K7Du8iOdzFcdYK1ZgijDk=;
	b=KMEjADN/sjrTcgxLi33777dbAc0xFXyKkbk3waYdD+fWuQ7uTD0vwqLOxFjNExQl
	44BTK2U4wHbyeoIH+i34sEyYZbYH1HM72GpYbEt0q7svhA/0wbv0CkoIvdZbUKojbiv
	3Iuvj2MXygn17rAadpfohz3aJ3oyRe2lsHADSKTQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X9ejVKI4SfoyB16ow3/852K7Du8iOdzFcdYK1ZgijDk=;
	b=CX7zlr3Zn2vavP4OFhNbOFwpRYW4XfxPfiPW3cEo67LVg8xXkVgQ3SJfHT6Ns8+i
	CHG3tpa8tj4Jh5PMXNdvtTKIXJN4cLlGNv1oUOcCNNGCrTgn66hpSqIGGdUAAKa/tW6
	MAFdE7OR3cA6+6hocwGq+0DPn7f8gA7Hr5obtmDM=
Content-Type: multipart/mixed; boundary="===============5111337627481278442=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.4.3 SUCCEEDED
Message-ID: <0101019639a73252-b7d8eb2c-737d-4ee6-b09d-2e7194d45e14-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214894

--===============5111337627481278442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpydWJ5KiB0byAqMy40LjMqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXJ1YnktdXBncmFkZS0zLjQuMi0zLjQuMy5wYXRj
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
bSAxMDhmMzMzYjNmNjBjNzBjMzg1M2FjOWFmYjI0ZjExYWNkZmM3OTc3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRh
dGU6IFR1ZSwgMTUgQXByIDIwMjUgMDg6MzA6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBydWJ5
OiB1cGdyYWRlIDMuNC4yIC0+IDMuNC4zCgotLS0KIC4uLi8wMDAxLWV4dG1rLWZpeC1jcm9zcy1j
b21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIHwgNCArKy0tCiAuLi4tdm1fZHVtcC5j
LURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCB8IDQgKystLQog
Li4uL3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gg
ICAgfCAyICstCiAuLi4vcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50
YXRpb24ucGF0Y2ggICB8IDIgKy0KIC4uLmItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZp
bGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIHwgMiArLQogLi4uTWFyay1HZW1zcGVjLXJlcHJvZHVj
aWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2ggfCA2ICsrKy0tLQogLi4uL3J1Ynkv
cnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoICAgICAgICAgfCAyICst
CiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8zLjQuMi5iYiA9PiBydWJ5XzMuNC4z
LmJifSB8IDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkve3J1YnlfMy40LjIuYmIg
PT4gcnVieV8zLjQuMy5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFs
LWdlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWst
Zml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKaW5kZXggZjE3OTcw
ZTljOS4uMjExNTFlNjY5YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgt
Y3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMDM3MDBlYzI1Njc4OWUwMmRlMjBiNThiY2EwODBjNmZlZjU5MjMzNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWU4MzQ3ZmE0NjU2Mjk4NjMxMzNiOTNkNjZkYzdmZDlhNWY2
NTdlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9BbmRyPUMzPUE5
PTIwRHJhc3ppaz89IDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiBEYXRlOiBNb24sIDMwIFNlcCAy
MDE5IDE2OjU3OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV4dG1rOiBmaXggY3Jvc3MtY29t
cGlsYXRpb24gb2YgZXh0ZXJuYWwgZ2VtcwpAQCAtMTYsNyArMTYsNyBAQCBTaWduZWQtb2ZmLWJ5
OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZXh0L2V4dG1r
LnJiIGIvZXh0L2V4dG1rLnJiCi1pbmRleCA4YjZiMzY1Li4zMDQ4Zjc1IDEwMDc1NQoraW5kZXgg
MWQxNjU0NS4uYWQ5NzFlYSAxMDA3NTUKIC0tLSBhL2V4dC9leHRtay5yYgogKysrIGIvZXh0L2V4
dG1rLnJiCiBAQCAtNDM0LDggKzQzNCw4IEBAIGVsc2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVH
X1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3Yu
cGF0Y2gKaW5kZXggNzk5MzI0Y2FlYS4uNzU0NzNkMDQ4ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1S
RUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wt
cmlzY3YucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY5OTJkNzgxZTA1YjYxNDg5YmRmNWEy
YTlhZWU2Y2M2MTZmMTc0MmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ3MDEzYjMw
YWJjNjgxYTJkZjdiNTQ0Mzk5YWFmMGY1NmNkMzcxMDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyNSBKYW4g
MjAyMiAyMDoyOToxNCAtMDgwMAogU3ViamVjdDogW1BBVENIXSB2bV9kdW1wLmM6IERlZmluZSBS
RUdfUzEgYW5kIFJFR19TMiBmb3IgbXVzbC9yaXNjdgpAQCAtMTQsNyArMTQsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3ZtX2R1bXAuYyBiL3ZtX2R1bXAuYwotaW5k
ZXggNTg3M2U1Mi4uOWViNGRiMSAxMDA2NDQKK2luZGV4IDk5MzM5ZmQuLjhjNWJiMDMgMTAwNjQ0
CiAtLS0gYS92bV9kdW1wLmMKICsrKyBiL3ZtX2R1bXAuYwogQEAgLTQwLDYgKzQwLDExIEBACmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZM
QUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRj
aAppbmRleCBiYjY3ZGYwZjQwLi44YWI0Zjk1NDhkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJy
dWJ5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5
LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDdlMjMzN2Q4YjBkYWYyNjQ3ODVjYjA2ZDFkNmM3ZDYxZTQyOGExMWIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDczYmNkM2VlYWQyOTQ1NTQzZDM3Y2QxMDYwYjQ0YTE1NjFlZTk3
ZTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaHJpc3RvcGhlciBMYXJzb24gPGNo
cmlzX2xhcnNvbkBtZW50b3IuY29tPgogRGF0ZTogVGh1LCA1IE1heSAyMDE2IDEwOjU5OjA3IC0w
NzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE9iZXkgTERGTEFHUyBmb3IgdGhlIGxpbmsgb2YgbGlicnVi
eQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2Mt
YnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlv
bi5wYXRjaAppbmRleCA4N2ExZTgyNTE2Li42OWIxOGU5MTVhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9j
dW1lbnRhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOTgwNzFjMGIyOGE0NWNkMjFhMmNiZTY3NDZjZTM5MDY3OTMyYjYyZiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjViMzA0MTIzOGE0MTRkN2MwZTZhMzg3M2ZlMjQy
YTgzZDhhZTc1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdGlhbiBIb2Zz
dGFlZHRsZXIgPHplaGFAZGViaWFuLm9yZz4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDQ6
MzQgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmRvYzogYnVpbGQgcmVwcm9kdWNpYmxlIGRvY3Vt
ZW50YXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
NC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNv
cnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKaW5kZXggNGI2Nzcx
ZmQyNi4uYmUxMDMyMDJiYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJh
dGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxp
Yi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4ODdmYWNjNGNhNWJjYjAyODBiMDI1YjM1YmJjMTg1Mjhl
NTI5MTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdkYjMxODZkNzU0NzgyYjAyMjgx
NmE4ZmZlMDdkYzQzMTJiMmQzM2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSZWlu
ZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5kZT4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcg
MTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliL21rbWYucmI6IHNvcnQgbGlzdCBv
ZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVkIE1ha2VmaWxlCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1j
aGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIy
NS10b28ucGF0Y2gKaW5kZXggZWRhNDVkZDg2Mi4uNmUyODllYTliNiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2li
bGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhp
bmctNzg0MjI1LXRvby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmYyNWY2ZGRkY2ZiYmI3
YjA0NjQ0ODViYjUxMzI0NTg4NjZhYjUxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZDA3ZmY3MjBmMTcwYTBjZjgwYzRmMDJhM2UwYzcxMWZmNTU3NTgyNCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEx1Y2FzIEthbmFzaGlybyA8a2FuYXNoaXJvQGRlYmlhbi5vcmc+CiBE
YXRlOiBGcmksIDEgTm92IDIwMTkgMTU6MjU6MTcgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFr
ZSBnZW1zcGVjcyByZXByb2R1Y2libGUKQEAgLTEyLDEwICsxMiwxMCBAQCBVcHN0cmVhbS1TdGF0
dXM6IEJhY2twb3J0IFtkZWJpYW5dCiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRpb24u
cmIgYi9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgotaW5kZXggOGYzNTNhZS4uMDk1MTI1
ZiAxMDA2NDQKK2luZGV4IDBiOTA1YTcuLmExMDJlM2MgMTAwNjQ0CiAtLS0gYS9saWIvcnVieWdl
bXMvc3BlY2lmaWNhdGlvbi5yYgogKysrIGIvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRpb24ucmIK
LUBAIC0xNzExLDcgKzE3MTEsOSBAQCBjbGFzcyBHZW06OlNwZWNpZmljYXRpb24gPCBHZW06OkJh
c2ljU3BlY2lmaWNhdGlvbgorQEAgLTE3MDksNyArMTcwOSw5IEBAIGNsYXNzIEdlbTo6U3BlY2lm
aWNhdGlvbiA8IEdlbTo6QmFzaWNTcGVjaWZpY2F0aW9uCiAgICAgICAgICAgICAgICAgIHJhaXNl
KEdlbTo6SW52YWxpZFNwZWNpZmljYXRpb25FeGNlcHRpb24sCiAgICAgICAgICAgICAgICAgICAg
ICAgICJpbnZhbGlkIGRhdGUgZm9ybWF0IGluIHNwZWNpZmljYXRpb246ICN7ZGF0ZS5pbnNwZWN0
fSIpCiAgICAgICAgICAgICAgICBlbmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJs
ZS5wYXRjaAppbmRleCAxMjFiZGNmM2FiLi42NDZhNGZkYTZhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vt
c3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNThiZGFjYTNk
NTM3OWFmY2I5NTRiYjU3YzY5MGM3NzM2ODA3ZWM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA5NzdlNjJmMWU0ZDI1OGViZWM1NGMyYzNiMzFkOTRjYmFmMDk3YWU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9y
Zz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENI
XSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieV8zLjQuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnlfMy40LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieV8zLjQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieV8zLjQuMy5iYgppbmRleCBhYTIyZWYzOTkyLi40NTA0N2I4ODU5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC4yLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjMuYmIKQEAgLTQ4LDcgKzQ4LDcgQEAg
ZG9fY29uZmlndXJlOnByZXBlbmQoKSB7CiAKIERFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIg
bGlidWNvbnRleHQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0MTMyOGFjMjFmMmJmZGQ3ZGU2
YjM1NjVlZjRmMGRkNzU0MzM1NGQzN2U5NmYxNTdhMTU1MmE2YmQwZWIzNjRiIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjU1YTRjZDFkY2JlNWNhMjdjZjY1ZTg5YTkzNWE0ODJjMmJiMjI4NDgzMjkz
OTI2NjU1MWMwZWM2OGI0MzdmNDYiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09O
RklHICs9ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9
IgotLSAKMi40Ny4xCgo=

--===============5111337627481278442==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.4.2-3.4.3.patch"

RnJvbSAxMDhmMzMzYjNmNjBjNzBjMzg1M2FjOWFmYjI0ZjExYWNkZmM3OTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDg6MzA6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDMuNC4yIC0+IDMuNC4zCgotLS0KIC4uLi8wMDAxLWV4dG1rLWZpeC1jcm9z
cy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIHwgNCArKy0tCiAuLi4tdm1fZHVt
cC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCB8IDQgKyst
LQogLi4uL3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0
Y2ggICAgfCAyICstCiAuLi4vcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3Vt
ZW50YXRpb24ucGF0Y2ggICB8IDIgKy0KIC4uLmItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0
LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIHwgMiArLQogLi4uTWFyay1HZW1zcGVjLXJlcHJv
ZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2ggfCA2ICsrKy0tLQogLi4uL3J1
YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoICAgICAgICAgfCAy
ICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8zLjQuMi5iYiA9PiBydWJ5XzMu
NC4zLmJifSB8IDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkve3J1YnlfMy40LjIu
YmIgPT4gcnVieV8zLjQuMy5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVy
bmFsLWdlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0
bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKaW5kZXggZjE3
OTcwZTljOS4uMjExNTFlNjY5YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1z
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1m
aXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMDM3MDBlYzI1Njc4OWUwMmRlMjBiNThiY2EwODBjNmZlZjU5MjMzNiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWU4MzQ3ZmE0NjU2Mjk4NjMxMzNiOTNkNjZkYzdmZDlh
NWY2NTdlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9BbmRyPUMz
PUE5PTIwRHJhc3ppaz89IDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiBEYXRlOiBNb24sIDMwIFNl
cCAyMDE5IDE2OjU3OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV4dG1rOiBmaXggY3Jvc3Mt
Y29tcGlsYXRpb24gb2YgZXh0ZXJuYWwgZ2VtcwpAQCAtMTYsNyArMTYsNyBAQCBTaWduZWQtb2Zm
LWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZXh0L2V4
dG1rLnJiIGIvZXh0L2V4dG1rLnJiCi1pbmRleCA4YjZiMzY1Li4zMDQ4Zjc1IDEwMDc1NQoraW5k
ZXggMWQxNjU0NS4uYWQ5NzFlYSAxMDA3NTUKIC0tLSBhL2V4dC9leHRtay5yYgogKysrIGIvZXh0
L2V4dG1rLnJiCiBAQCAtNDM0LDggKzQzNCw4IEBAIGVsc2UKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQt
UkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlz
Y3YucGF0Y2gKaW5kZXggNzk5MzI0Y2FlYS4uNzU0NzNkMDQ4ZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFu
ZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11
c2wtcmlzY3YucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY5OTJkNzgxZTA1YjYxNDg5YmRm
NWEyYTlhZWU2Y2M2MTZmMTc0MmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ3MDEz
YjMwYWJjNjgxYTJkZjdiNTQ0Mzk5YWFmMGY1NmNkMzcxMDIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyNSBK
YW4gMjAyMiAyMDoyOToxNCAtMDgwMAogU3ViamVjdDogW1BBVENIXSB2bV9kdW1wLmM6IERlZmlu
ZSBSRUdfUzEgYW5kIFJFR19TMiBmb3IgbXVzbC9yaXNjdgpAQCAtMTQsNyArMTQsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3ZtX2R1bXAuYyBiL3ZtX2R1bXAuYwot
aW5kZXggNTg3M2U1Mi4uOWViNGRiMSAxMDA2NDQKK2luZGV4IDk5MzM5ZmQuLjhjNWJiMDMgMTAw
NjQ0CiAtLS0gYS92bV9kdW1wLmMKICsrKyBiL3ZtX2R1bXAuYwogQEAgLTQwLDYgKzQwLDExIEBA
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1M
REZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5w
YXRjaAppbmRleCBiYjY3ZGYwZjQwLi44YWI0Zjk1NDhkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1s
aWJydWJ5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1P
YmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDdlMjMzN2Q4YjBkYWYyNjQ3ODVjYjA2ZDFkNmM3ZDYxZTQyOGExMWIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDczYmNkM2VlYWQyOTQ1NTQzZDM3Y2QxMDYwYjQ0YTE1NjFl
ZTk3ZTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaHJpc3RvcGhlciBMYXJzb24g
PGNocmlzX2xhcnNvbkBtZW50b3IuY29tPgogRGF0ZTogVGh1LCA1IE1heSAyMDE2IDEwOjU5OjA3
IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE9iZXkgTERGTEFHUyBmb3IgdGhlIGxpbmsgb2YgbGli
cnVieQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJk
b2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRh
dGlvbi5wYXRjaAppbmRleCA4N2ExZTgyNTE2Li42OWIxOGU5MTVhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUt
ZG9jdW1lbnRhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gOTgwNzFjMGIyOGE0NWNkMjFhMmNiZTY3NDZjZTM5MDY3OTMyYjYyZiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjViMzA0MTIzOGE0MTRkN2MwZTZhMzg3M2Zl
MjQyYTgzZDhhZTc1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdGlhbiBI
b2ZzdGFlZHRsZXIgPHplaGFAZGViaWFuLm9yZz4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6
MDQ6MzQgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmRvYzogYnVpbGQgcmVwcm9kdWNpYmxlIGRv
Y3VtZW50YXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1N
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJi
LXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKaW5kZXggNGI2
NzcxZmQyNi4uYmUxMDMyMDJiYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2Vu
ZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0
LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4ODdmYWNjNGNhNWJjYjAyODBiMDI1YjM1YmJjMTg1
MjhlNTI5MTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdkYjMxODZkNzU0NzgyYjAy
MjgxNmE4ZmZlMDdkYzQzMTJiMmQzM2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBS
ZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5kZT4KIERhdGU6IFR1ZSwgMTAgT2N0IDIw
MTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliL21rbWYucmI6IHNvcnQgbGlz
dCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVkIE1ha2VmaWxlCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJs
ZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4
NDIyNS10b28ucGF0Y2gKaW5kZXggZWRhNDVkZDg2Mi4uNmUyODllYTliNiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1
Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1m
aXhpbmctNzg0MjI1LXRvby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmYyNWY2ZGRkY2Zi
YmI3YjA0NjQ0ODViYjUxMzI0NTg4NjZhYjUxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZDA3ZmY3MjBmMTcwYTBjZjgwYzRmMDJhM2UwYzcxMWZmNTU3NTgyNCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEx1Y2FzIEthbmFzaGlybyA8a2FuYXNoaXJvQGRlYmlhbi5vcmc+
CiBEYXRlOiBGcmksIDEgTm92IDIwMTkgMTU6MjU6MTcgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0g
TWFrZSBnZW1zcGVjcyByZXByb2R1Y2libGUKQEAgLTEyLDEwICsxMiwxMCBAQCBVcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0IFtkZWJpYW5dCiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRp
b24ucmIgYi9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgotaW5kZXggOGYzNTNhZS4uMDk1
MTI1ZiAxMDA2NDQKK2luZGV4IDBiOTA1YTcuLmExMDJlM2MgMTAwNjQ0CiAtLS0gYS9saWIvcnVi
eWdlbXMvc3BlY2lmaWNhdGlvbi5yYgogKysrIGIvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRpb24u
cmIKLUBAIC0xNzExLDcgKzE3MTEsOSBAQCBjbGFzcyBHZW06OlNwZWNpZmljYXRpb24gPCBHZW06
OkJhc2ljU3BlY2lmaWNhdGlvbgorQEAgLTE3MDksNyArMTcwOSw5IEBAIGNsYXNzIEdlbTo6U3Bl
Y2lmaWNhdGlvbiA8IEdlbTo6QmFzaWNTcGVjaWZpY2F0aW9uCiAgICAgICAgICAgICAgICAgIHJh
aXNlKEdlbTo6SW52YWxpZFNwZWNpZmljYXRpb25FeGNlcHRpb24sCiAgICAgICAgICAgICAgICAg
ICAgICAgICJpbnZhbGlkIGRhdGUgZm9ybWF0IGluIHNwZWNpZmljYXRpb246ICN7ZGF0ZS5pbnNw
ZWN0fSIpCiAgICAgICAgICAgICAgICBlbmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVj
aWJsZS5wYXRjaAppbmRleCAxMjFiZGNmM2FiLi42NDZhNGZkYTZhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2li
bGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2Ut
Z2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNThiZGFj
YTNkNTM3OWFmY2I5NTRiYjU3YzY5MGM3NzM2ODA3ZWM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA5NzdlNjJmMWU0ZDI1OGViZWM1NGMyYzNiMzFkOTRjYmFmMDk3YWU5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFu
Lm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BB
VENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieV8zLjQuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnlfMy40LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieV8zLjQuMy5iYgppbmRleCBhYTIyZWYzOTkyLi40NTA0N2I4ODU5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC4yLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjMuYmIKQEAgLTQ4LDcgKzQ4LDcg
QEAgZG9fY29uZmlndXJlOnByZXBlbmQoKSB7CiAKIERFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9
ICIgbGlidWNvbnRleHQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0MTMyOGFjMjFmMmJmZGQ3
ZGU2YjM1NjVlZjRmMGRkNzU0MzM1NGQzN2U5NmYxNTdhMTU1MmE2YmQwZWIzNjRiIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjU1YTRjZDFkY2JlNWNhMjdjZjY1ZTg5YTkzNWE0ODJjMmJiMjI4NDgz
MjkzOTI2NjU1MWMwZWM2OGI0MzdmNDYiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdF
Q09ORklHICs9ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2Jywg
ZCl9IgotLSAKMi40Ny4xCgo=

--===============5111337627481278442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.2.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch" to "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.3.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch 
 file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch"
packages/core2-64-poky-linux/ruby: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 12091232 to 12095832 (+0%)
packages/core2-64-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.3.4.2", added "/usr/lib/.debug/libruby.so.3.4.3"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby-dbg: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby-dev: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby-dev: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby-doc: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby-doc: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby-locale: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby-locale: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 13631301 to 13639919 (+0%)
packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/prism/errors/escape_unicode_curly_whitespace.txt"
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby-ptest: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby-rdoc: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby-src: PKGSIZE changed from 39641500 to 39664107 (+0%)
packages/core2-64-poky-linux/ruby/ruby-src: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby-src: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby-staticdev: PV changed from "3.4.2" to "3.4.3"
packages/core2-64-poky-linux/ruby/ruby: PKGSIZE changed from 30695295 to 30714940 (+0%)
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.2/exe -> /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7/exe, removed "/usr/lib/libruby.so.3.4.2 /usr/lib/ruby/3.4.0/bundler/compact_index_client/gem_parser.rb /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.1.gemspec", added "/usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.2.gemspec /usr/lib/libruby.so.3.4.3 /usr/lib/ruby/3.4.0/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec /usr/lib/ruby/3.4.0/bundler/resolver/strategy.rb /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec"
packages/core2-64-poky-linux/ruby/ruby: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-64-poky-linux/ruby/ruby: PV changed from "3.4.2" to "3.4.3"
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.2 to libruby.so.3.4.3
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.2 to libruby.so.3.4.3
  /usr/lib/libruby.so.3.4.2 moved to /usr/lib/libruby.so.3.4.3
  /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.2 moved to /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7
  /usr/lib/ruby/gems/3.4.0/gems/cgi-0.4.1 moved to /usr/lib/ruby/gems/3.4.0/gems/cgi-0.4.2
  /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.2 moved to /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.3
  /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.2.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.2.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec
  /usr/lib/ruby/3.4.0/bundler/resolver/strategy.rb was added
  /usr/lib/ruby/3.4.0/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb was added
  /usr/lib/ruby/3.4.0/bundler/compact_index_client/gem_parser.rb was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.2 to libruby.so.3.4.3
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.2 to libruby.so.3.4.3
  /usr/lib/libruby.so.3.4.2 moved to /usr/lib/libruby.so.3.4.3
  /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.2 moved to /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7
  /usr/lib/ruby/gems/3.4.0/gems/cgi-0.4.1 moved to /usr/lib/ruby/gems/3.4.0/gems/cgi-0.4.2
  /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.2 moved to /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.3
  /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.2.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.2.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec
  /usr/lib/ruby/3.4.0/bundler/resolver/strategy.rb was added
  /usr/lib/ruby/3.4.0/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb was added
  /usr/lib/ruby/3.4.0/bundler/compact_index_client/gem_parser.rb was removed

--===============5111337627481278442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/prism/errors/escape_unicode_curly_whitespace.txt"
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.2/exe -> /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7/exe, removed "/usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.1.gemspec /usr/lib/ruby/3.4.0/bundler/compact_index_client/gem_parser.rb /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.2.gemspec /usr/lib/libruby.so.3.4.2", added "/usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.2.gemspec /usr/lib/ruby/3.4.0/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb /usr/lib/ruby/3.4.0/bundler/resolver/strategy.rb /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec /usr/lib/libruby.so.3.4.3"
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.2 to libruby.so.3.4.3
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.2 to libruby.so.3.4.3
  /usr/lib/libruby.so.3.4.2 moved to /usr/lib/libruby.so.3.4.3
  /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.2 moved to /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7
  /usr/lib/ruby/gems/3.4.0/gems/cgi-0.4.1 moved to /usr/lib/ruby/gems/3.4.0/gems/cgi-0.4.2
  /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.2 moved to /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.3
  /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.2.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.2.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec
  /usr/lib/ruby/3.4.0/bundler/resolver/strategy.rb was added
  /usr/lib/ruby/3.4.0/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb was added
  /usr/lib/ruby/3.4.0/bundler/compact_index_client/gem_parser.rb was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.2 to libruby.so.3.4.3
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.2 to libruby.so.3.4.3
  /usr/lib/libruby.so.3.4.2 moved to /usr/lib/libruby.so.3.4.3
  /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.2 moved to /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7
  /usr/lib/ruby/gems/3.4.0/gems/cgi-0.4.1 moved to /usr/lib/ruby/gems/3.4.0/gems/cgi-0.4.2
  /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.2 moved to /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.3
  /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.2.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.1.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/cgi-0.4.2.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.2.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec
  /usr/lib/ruby/3.4.0/bundler/resolver/strategy.rb was added
  /usr/lib/ruby/3.4.0/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb was added
  /usr/lib/ruby/3.4.0/bundler/compact_index_client/gem_parser.rb was removed

--===============5111337627481278442==--

