Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C64C5B554
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11252.1747312304866832164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1vI2siVQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UvBmAZtc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010196d3ee1d1c-22ed7ec4-62db-48a1-b3d8-9f52d0f8354a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312319;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oyVENHAbrmy375sRjd6mzKURE1oQ2TCLg4rJxL0jyhU=;
	b=1vI2siVQtuQFc1di6Rj2HeVyeiMI3toW91wDRYho14oDPLO7XIUC7G2DaIbqHuQh
	57aL/cTLhhW8IbW95k5kOUPk5viWDfUiGyyUn557l5UlXqvH8OWfHN+/xDRpZFCKO0+
	zr5TCTUxafUwwspxody0+6oNihLeN+lgf9riTbmI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312319;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oyVENHAbrmy375sRjd6mzKURE1oQ2TCLg4rJxL0jyhU=;
	b=UvBmAZtcidDF2TCCeKUjw4oLYaVAfnmm9niO7oMPJVU1AJW3yZH+hfAY244DDkaG
	IsWNDxpIKds4A4EvccAy41Xo3/IgYm0W604GMC1BfbUUVTft7Lu/8QexZ+zmG901CfQ
	Xa8p7XZ+Bbzdp7FERovclHDqrecJMavEt0zd92Is=
Content-Type: multipart/mixed; boundary="===============8621662418263208970=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.4.4 SUCCEEDED
Message-ID: <01010196d3ee1d1c-22ed7ec4-62db-48a1-b3d8-9f52d0f8354a-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216628

--===============8621662418263208970==
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
bSAyMmFhNzdiYjc1MDY3YmM2ZjBiMzZkMmY1ZDlkZTgxMDkxYTQ2NDkzIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRh
dGU6IFRodSwgMTUgTWF5IDIwMjUgMDk6MDQ6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBydWJ5
OiB1cGdyYWRlIDMuNC4zIC0+IDMuNC40CgotLS0KIC4uLi8wMDAxLWV4dG1rLWZpeC1jcm9zcy1j
b21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIHwgNCArKy0tCiAuLi4tdm1fZHVtcC5j
LURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCB8IDQgKystLQog
Li4uL3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gg
ICAgfCA2ICsrKy0tLQogLi4uL3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1
bWVudGF0aW9uLnBhdGNoICAgfCAyICstCiAuLi5iLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVj
dC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCB8IDQgKystLQogLi4uTWFyay1HZW1zcGVjLXJl
cHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoICAgICAgICAg
fCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8zLjQuMy5iYiA9PiBydWJ5
XzMuNC40LmJifSB8IDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkve3J1YnlfMy40
LjMuYmIgPT4gcnVieV8zLjQuNC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4
dGVybmFsLWdlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEt
ZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKaW5kZXgg
ZjE3OTcwZTljOS4uM2FhZjMwZTM3MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1n
ZW1zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRt
ay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gMDM3MDBlYzI1Njc4OWUwMmRlMjBiNThiY2EwODBjNmZlZjU5MjMzNiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWFjNGJiOGExZTk0ZTQyYzBlNTVhNDJlODM2Y2Nm
YjMxMWI5NTg2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9BbmRy
PUMzPUE5PTIwRHJhc3ppaz89IDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiBEYXRlOiBNb24sIDMw
IFNlcCAyMDE5IDE2OjU3OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV4dG1rOiBmaXggY3Jv
c3MtY29tcGlsYXRpb24gb2YgZXh0ZXJuYWwgZ2VtcwpAQCAtMTYsNyArMTYsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZXh0
L2V4dG1rLnJiIGIvZXh0L2V4dG1rLnJiCi1pbmRleCA4YjZiMzY1Li4zMDQ4Zjc1IDEwMDc1NQor
aW5kZXggMWQxNjU0NS4uYWQ5NzFlYSAxMDA3NTUKIC0tLSBhL2V4dC9leHRtay5yYgogKysrIGIv
ZXh0L2V4dG1rLnJiCiBAQCAtNDM0LDggKzQzNCw4IEBAIGVsc2UKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1h
bmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wt
cmlzY3YucGF0Y2gKaW5kZXggNzk5MzI0Y2FlYS4uNzdlNzcxYTYwMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1Mx
LWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9y
LW11c2wtcmlzY3YucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY5OTJkNzgxZTA1YjYxNDg5
YmRmNWEyYTlhZWU2Y2M2MTZmMTc0MmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVm
MjZiYTExMzdkZmUwZTQ0NjliNjAyMDhhNzllZmE5OWQ2NjY0YWEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVHVlLCAy
NSBKYW4gMjAyMiAyMDoyOToxNCAtMDgwMAogU3ViamVjdDogW1BBVENIXSB2bV9kdW1wLmM6IERl
ZmluZSBSRUdfUzEgYW5kIFJFR19TMiBmb3IgbXVzbC9yaXNjdgpAQCAtMTQsNyArMTQsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3ZtX2R1bXAuYyBiL3ZtX2R1bXAu
YwotaW5kZXggNTg3M2U1Mi4uOWViNGRiMSAxMDA2NDQKK2luZGV4IDk5MzM5ZmQuLjhjNWJiMDMg
MTAwNjQ0CiAtLS0gYS92bV9kdW1wLmMKICsrKyBiL3ZtX2R1bXAuYwogQEAgLTQwLDYgKzQwLDEx
IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2Jl
eS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVi
eS5wYXRjaAppbmRleCBiYjY3ZGYwZjQwLi5hMDNhNTBlZDVlIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1v
Zi1saWJydWJ5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
Mi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDdlMjMzN2Q4YjBkYWYyNjQ3ODVjYjA2ZDFkNmM3ZDYxZTQyOGExMWIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk4YTBlMmQwMWIwNDc2NDc0Zjc3OGYwY2FjZDMzYTM2
MWIwNTM3YjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaHJpc3RvcGhlciBMYXJz
b24gPGNocmlzX2xhcnNvbkBtZW50b3IuY29tPgogRGF0ZTogVGh1LCA1IE1heSAyMDE2IDEwOjU5
OjA3IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE9iZXkgTERGTEFHUyBmb3IgdGhlIGxpbmsgb2Yg
bGlicnVieQpAQCAtMTAsMTAgKzEwLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvdGVtcGxhdGUvTWFrZWZpbGUuaW4gYi90ZW1wbGF0ZS9NYWtlZmlsZS5pbgotaW5kZXggMDU0
MzJjZC4uNDFhMDViYiAxMDA2NDQKK2luZGV4IDhmOTk2YjguLmM3MDhiNjQgMTAwNjQ0CiAtLS0g
YS90ZW1wbGF0ZS9NYWtlZmlsZS5pbgogKysrIGIvdGVtcGxhdGUvTWFrZWZpbGUuaW4KLUBAIC0x
MTksNyArMTE5LDcgQEAgRU5BQkxFX1NIQVJFRCA9IEBFTkFCTEVfU0hBUkVEQAorQEAgLTEyMCw3
ICsxMjAsNyBAQCBFTkFCTEVfU0hBUkVEID0gQEVOQUJMRV9TSEFSRURACiAgTERTSEFSRUQgPSBA
TElCUlVCWV9MRFNIQVJFREAKICBETERTSEFSRUQgPSBARExEU0hBUkVEQAogIFhETERGTEFHUyA9
IEBETERGTEFHU0AKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRv
Y3VtZW50YXRpb24ucGF0Y2gKaW5kZXggODdhMWU4MjUxNi4uNDRkNWRkNGM0NiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9k
dWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDk4MDcxYzBiMjhhNDVjZDIxYTJjYmU2NzQ2Y2UzOTA2Nzkz
MmI2MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZkYmU3NGI2YTQ2ZWE5NjI2NWEw
OGUwMjBjNzdiZGExMzc1M2FlMTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaHJp
c3RpYW4gSG9mc3RhZWR0bGVyIDx6ZWhhQGRlYmlhbi5vcmc+CiBEYXRlOiBUdWUsIDEwIE9jdCAy
MDE3IDE1OjA0OjM0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJkb2M6IGJ1aWxkIHJlcHJvZHVj
aWJsZSBkb2N1bWVudGF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5l
cmF0ZWQtTS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWIt
bWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoCmlu
ZGV4IDRiNjc3MWZkMjYuLmQwZDE0MGIxMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVz
LWluLWdlbmVyYXRlZC1NLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRl
ZC1NLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwODg3ZmFjYzRjYTViY2IwMjgwYjAyNWIz
NWJiYzE4NTI4ZTUyOTE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZmMxMmEzNTEw
NmVkZGUxYjNjOThlOWUyZTRkMjUyOTFiNTAwMTY1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUmVpbmVyIEhlcnJtYW5uIDxyZWluZXJAcmVpbmVyLWguZGU+CiBEYXRlOiBUdWUsIDEw
IE9jdCAyMDE3IDE1OjA2OjEzIC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYi9ta21mLnJiOiBz
b3J0IGxpc3Qgb2Ygb2JqZWN0IGZpbGVzIGluIGdlbmVyYXRlZCBNYWtlZmlsZQpAQCAtMTcsNyAr
MTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5k
ZT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlm
ZiAtLWdpdCBhL2xpYi9ta21mLnJiIGIvbGliL21rbWYucmIKLWluZGV4IDc2OGExNTIuLmYxNmNk
ZDggMTAwNjQ0CitpbmRleCA5OWYzNzY0Li42MjM3N2I2IDEwMDY0NAogLS0tIGEvbGliL21rbWYu
cmIKICsrKyBiL2xpYi9ta21mLnJiCiBAQCAtMjQ4MCw3ICsyNDgwLDcgQEAgTE9DQUxfTElCUyA9
ICN7JExPQ0FMX0xJQlN9CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10
b28ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1z
cGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKaW5kZXggZWRh
NDVkZDg2Mi4uNDdiZGY0N2RiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQy
MjUtdG9vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1N
YXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZmYyNWY2ZGRkY2ZiYmI3YjA0NjQ0ODViYjUxMzI0NTg4NjZh
YjUxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWJkZTdiZTIyYmQxYTY0YzZjMzA3
ZDc3MzEwYzFkODhjNGZiODlkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEx1Y2Fz
IEthbmFzaGlybyA8a2FuYXNoaXJvQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDEgTm92IDIwMTkg
MTU6MjU6MTcgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBnZW1zcGVjcyByZXByb2R1Y2li
bGUKQEAgLTEyLDEwICsxMiwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtkZWJpYW5d
CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRpb24ucmIgYi9saWIvcnVieWdlbXMvc3Bl
Y2lmaWNhdGlvbi5yYgotaW5kZXggOGYzNTNhZS4uMDk1MTI1ZiAxMDA2NDQKK2luZGV4IDBiOTA1
YTcuLmExMDJlM2MgMTAwNjQ0CiAtLS0gYS9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgog
KysrIGIvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRpb24ucmIKLUBAIC0xNzExLDcgKzE3MTEsOSBA
QCBjbGFzcyBHZW06OlNwZWNpZmljYXRpb24gPCBHZW06OkJhc2ljU3BlY2lmaWNhdGlvbgorQEAg
LTE3MDksNyArMTcwOSw5IEBAIGNsYXNzIEdlbTo6U3BlY2lmaWNhdGlvbiA8IEdlbTo6QmFzaWNT
cGVjaWZpY2F0aW9uCiAgICAgICAgICAgICAgICAgIHJhaXNlKEdlbTo6SW52YWxpZFNwZWNpZmlj
YXRpb25FeGNlcHRpb24sCiAgICAgICAgICAgICAgICAgICAgICAgICJpbnZhbGlkIGRhdGUgZm9y
bWF0IGluIHNwZWNpZmljYXRpb246ICN7ZGF0ZS5pbnNwZWN0fSIpCiAgICAgICAgICAgICAgICBl
bmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtl
LWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAppbmRleCAxMjFiZGNm
M2FiLi4zYjFkNjE3YTNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNThiZGFjYTNkNTM3OWFmY2I5NTRiYjU3YzY5MGM3
NzM2ODA3ZWM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NGNlMzcyOWE5YjIzOWVj
MmMwYWQ5ZmEyYjQxYmU2NzhkNzFmNGVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
THVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBOb3Yg
MjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJlcHJv
ZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQu
My5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjQuYmIKc2ltaWxhcml0
eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8z
LjQuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQuNC5i
YgppbmRleCA0NTA0N2I4ODU5Li4zOWU4NmZkZDI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnlfMy40LjQuYmIKQEAgLTQ4LDcgKzQ4LDcgQEAgZG9fY29uZmlndXJlOnByZXBlbmQo
KSB7CiAKIERFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIgbGlidWNvbnRleHQiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1NWE0Y2QxZGNiZTVjYTI3Y2Y2NWU4OWE5MzVhNDgyYzJiYjIyODQ4
MzI5MzkyNjY1NTFjMGVjNjhiNDM3ZjQ2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwNTk3YmZk
ZjMxMmUwMTBlZmQxZWZmYWE4ZDdmMWQ3ODMzMTQ2ZmRjMTc5NTBjYWE4MTU4ZmZhM2RjYmZhODUi
CiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHICs9ICIke0BiYi51dGlscy5m
aWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9IgotLSAKMi40Ny4xCgo=

--===============8621662418263208970==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.4.3-3.4.4.patch"

RnJvbSAyMmFhNzdiYjc1MDY3YmM2ZjBiMzZkMmY1ZDlkZTgxMDkxYTQ2NDkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDk6MDQ6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDMuNC4zIC0+IDMuNC40CgotLS0KIC4uLi8wMDAxLWV4dG1rLWZpeC1jcm9z
cy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIHwgNCArKy0tCiAuLi4tdm1fZHVt
cC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCB8IDQgKyst
LQogLi4uL3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0
Y2ggICAgfCA2ICsrKy0tLQogLi4uL3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1k
b2N1bWVudGF0aW9uLnBhdGNoICAgfCAyICstCiAuLi5iLW1rbWYucmItc29ydC1saXN0LW9mLW9i
amVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCB8IDQgKystLQogLi4uTWFyay1HZW1zcGVj
LXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2ggfCA2ICsrKy0tLQog
Li4uL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoICAgICAg
ICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8zLjQuMy5iYiA9PiBy
dWJ5XzMuNC40LmJifSB8IDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MTUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkve3J1Ynlf
My40LjMuYmIgPT4gcnVieV8zLjQuNC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9m
LWV4dGVybmFsLWdlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKaW5k
ZXggZjE3OTcwZTljOS4uM2FhZjMwZTM3MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5h
bC1nZW1zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1l
eHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMDM3MDBlYzI1Njc4OWUwMmRlMjBiNThiY2EwODBjNmZlZjU5MjMzNiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWFjNGJiOGExZTk0ZTQyYzBlNTVhNDJlODM2
Y2NmYjMxMWI5NTg2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9B
bmRyPUMzPUE5PTIwRHJhc3ppaz89IDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiBEYXRlOiBNb24s
IDMwIFNlcCAyMDE5IDE2OjU3OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV4dG1rOiBmaXgg
Y3Jvc3MtY29tcGlsYXRpb24gb2YgZXh0ZXJuYWwgZ2VtcwpAQCAtMTYsNyArMTYsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
ZXh0L2V4dG1rLnJiIGIvZXh0L2V4dG1rLnJiCi1pbmRleCA4YjZiMzY1Li4zMDQ4Zjc1IDEwMDc1
NQoraW5kZXggMWQxNjU0NS4uYWQ5NzFlYSAxMDA3NTUKIC0tLSBhL2V4dC9leHRtay5yYgogKysr
IGIvZXh0L2V4dG1rLnJiCiBAQCAtNDM0LDggKzQzNCw4IEBAIGVsc2UKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19T
MS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11
c2wtcmlzY3YucGF0Y2gKaW5kZXggNzk5MzI0Y2FlYS4uNzdlNzcxYTYwMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVH
X1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzIt
Zm9yLW11c2wtcmlzY3YucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY5OTJkNzgxZTA1YjYx
NDg5YmRmNWEyYTlhZWU2Y2M2MTZmMTc0MmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGVmMjZiYTExMzdkZmUwZTQ0NjliNjAyMDhhNzllZmE5OWQ2NjY0YWEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVHVl
LCAyNSBKYW4gMjAyMiAyMDoyOToxNCAtMDgwMAogU3ViamVjdDogW1BBVENIXSB2bV9kdW1wLmM6
IERlZmluZSBSRUdfUzEgYW5kIFJFR19TMiBmb3IgbXVzbC9yaXNjdgpAQCAtMTQsNyArMTQsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3ZtX2R1bXAuYyBiL3ZtX2R1
bXAuYwotaW5kZXggNTg3M2U1Mi4uOWViNGRiMSAxMDA2NDQKK2luZGV4IDk5MzM5ZmQuLjhjNWJi
MDMgMTAwNjQ0CiAtLS0gYS92bV9kdW1wLmMKICsrKyBiL3ZtX2R1bXAuYwogQEAgLTQwLDYgKzQw
LDExIEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDIt
T2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGli
cnVieS5wYXRjaAppbmRleCBiYjY3ZGYwZjQwLi5hMDNhNTBlZDVlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGlu
ay1vZi1saWJydWJ5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDdlMjMzN2Q4YjBkYWYyNjQ3ODVjYjA2ZDFkNmM3ZDYxZTQyOGExMWIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk4YTBlMmQwMWIwNDc2NDc0Zjc3OGYwY2FjZDMz
YTM2MWIwNTM3YjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaHJpc3RvcGhlciBM
YXJzb24gPGNocmlzX2xhcnNvbkBtZW50b3IuY29tPgogRGF0ZTogVGh1LCA1IE1heSAyMDE2IDEw
OjU5OjA3IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE9iZXkgTERGTEFHUyBmb3IgdGhlIGxpbmsg
b2YgbGlicnVieQpAQCAtMTAsMTAgKzEwLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvdGVtcGxhdGUvTWFrZWZpbGUuaW4gYi90ZW1wbGF0ZS9NYWtlZmlsZS5pbgotaW5kZXgg
MDU0MzJjZC4uNDFhMDViYiAxMDA2NDQKK2luZGV4IDhmOTk2YjguLmM3MDhiNjQgMTAwNjQ0CiAt
LS0gYS90ZW1wbGF0ZS9NYWtlZmlsZS5pbgogKysrIGIvdGVtcGxhdGUvTWFrZWZpbGUuaW4KLUBA
IC0xMTksNyArMTE5LDcgQEAgRU5BQkxFX1NIQVJFRCA9IEBFTkFCTEVfU0hBUkVEQAorQEAgLTEy
MCw3ICsxMjAsNyBAQCBFTkFCTEVfU0hBUkVEID0gQEVOQUJMRV9TSEFSRURACiAgTERTSEFSRUQg
PSBATElCUlVCWV9MRFNIQVJFREAKICBETERTSEFSRUQgPSBARExEU0hBUkVEQAogIFhETERGTEFH
UyA9IEBETERGTEFHU0AKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxl
LWRvY3VtZW50YXRpb24ucGF0Y2gKaW5kZXggODdhMWU4MjUxNi4uNDRkNWRkNGM0NiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVw
cm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk4MDcxYzBiMjhhNDVjZDIxYTJjYmU2NzQ2Y2UzOTA2
NzkzMmI2MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZkYmU3NGI2YTQ2ZWE5NjI2
NWEwOGUwMjBjNzdiZGExMzc1M2FlMTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBD
aHJpc3RpYW4gSG9mc3RhZWR0bGVyIDx6ZWhhQGRlYmlhbi5vcmc+CiBEYXRlOiBUdWUsIDEwIE9j
dCAyMDE3IDE1OjA0OjM0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJkb2M6IGJ1aWxkIHJlcHJv
ZHVjaWJsZSBkb2N1bWVudGF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1n
ZW5lcmF0ZWQtTS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1s
aWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNo
CmluZGV4IDRiNjc3MWZkMjYuLmQwZDE0MGIxMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZp
bGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVy
YXRlZC1NLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwODg3ZmFjYzRjYTViY2IwMjgwYjAy
NWIzNWJiYzE4NTI4ZTUyOTE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZmMxMmEz
NTEwNmVkZGUxYjNjOThlOWUyZTRkMjUyOTFiNTAwMTY1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUmVpbmVyIEhlcnJtYW5uIDxyZWluZXJAcmVpbmVyLWguZGU+CiBEYXRlOiBUdWUs
IDEwIE9jdCAyMDE3IDE1OjA2OjEzIC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYi9ta21mLnJi
OiBzb3J0IGxpc3Qgb2Ygb2JqZWN0IGZpbGVzIGluIGdlbmVyYXRlZCBNYWtlZmlsZQpAQCAtMTcs
NyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXIt
aC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL2xpYi9ta21mLnJiIGIvbGliL21rbWYucmIKLWluZGV4IDc2OGExNTIuLmYx
NmNkZDggMTAwNjQ0CitpbmRleCA5OWYzNzY0Li42MjM3N2I2IDEwMDY0NAogLS0tIGEvbGliL21r
bWYucmIKICsrKyBiL2xpYi9ta21mLnJiCiBAQCAtMjQ4MCw3ICsyNDgwLDcgQEAgTE9DQUxfTElC
UyA9ICN7JExPQ0FMX0xJQlN9CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIy
NS10b28ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1H
ZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKaW5kZXgg
ZWRhNDVkZDg2Mi4uNDdiZGY0N2RiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03
ODQyMjUtdG9vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
NS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmYyNWY2ZGRkY2ZiYmI3YjA0NjQ0ODViYjUxMzI0NTg4
NjZhYjUxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWJkZTdiZTIyYmQxYTY0YzZj
MzA3ZDc3MzEwYzFkODhjNGZiODlkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEx1
Y2FzIEthbmFzaGlybyA8a2FuYXNoaXJvQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDEgTm92IDIw
MTkgMTU6MjU6MTcgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBnZW1zcGVjcyByZXByb2R1
Y2libGUKQEAgLTEyLDEwICsxMiwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtkZWJp
YW5dCiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRpb24ucmIgYi9saWIvcnVieWdlbXMv
c3BlY2lmaWNhdGlvbi5yYgotaW5kZXggOGYzNTNhZS4uMDk1MTI1ZiAxMDA2NDQKK2luZGV4IDBi
OTA1YTcuLmExMDJlM2MgMTAwNjQ0CiAtLS0gYS9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5y
YgogKysrIGIvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRpb24ucmIKLUBAIC0xNzExLDcgKzE3MTEs
OSBAQCBjbGFzcyBHZW06OlNwZWNpZmljYXRpb24gPCBHZW06OkJhc2ljU3BlY2lmaWNhdGlvbgor
QEAgLTE3MDksNyArMTcwOSw5IEBAIGNsYXNzIEdlbTo6U3BlY2lmaWNhdGlvbiA8IEdlbTo6QmFz
aWNTcGVjaWZpY2F0aW9uCiAgICAgICAgICAgICAgICAgIHJhaXNlKEdlbTo6SW52YWxpZFNwZWNp
ZmljYXRpb25FeGNlcHRpb24sCiAgICAgICAgICAgICAgICAgICAgICAgICJpbnZhbGlkIGRhdGUg
Zm9ybWF0IGluIHNwZWNpZmljYXRpb246ICN7ZGF0ZS5pbnNwZWN0fSIpCiAgICAgICAgICAgICAg
ICBlbmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1N
YWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAppbmRleCAxMjFi
ZGNmM2FiLi4zYjFkNjE3YTNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxl
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNThiZGFjYTNkNTM3OWFmY2I5NTRiYjU3YzY5
MGM3NzM2ODA3ZWM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NGNlMzcyOWE5YjIz
OWVjMmMwYWQ5ZmEyYjQxYmU2NzhkNzFmNGVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBO
b3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJl
cHJvZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8z
LjQuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjQuYmIKc2ltaWxh
cml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eV8zLjQuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQu
NC5iYgppbmRleCA0NTA0N2I4ODU5Li4zOWU4NmZkZDI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnlfMy40LjQuYmIKQEAgLTQ4LDcgKzQ4LDcgQEAgZG9fY29uZmlndXJlOnByZXBl
bmQoKSB7CiAKIERFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIgbGlidWNvbnRleHQiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI1NWE0Y2QxZGNiZTVjYTI3Y2Y2NWU4OWE5MzVhNDgyYzJiYjIy
ODQ4MzI5MzkyNjY1NTFjMGVjNjhiNDM3ZjQ2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwNTk3
YmZkZjMxMmUwMTBlZmQxZWZmYWE4ZDdmMWQ3ODMzMTQ2ZmRjMTc5NTBjYWE4MTU4ZmZhM2RjYmZh
ODUiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHICs9ICIke0BiYi51dGls
cy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9IgotLSAKMi40Ny4xCgo=

--===============8621662418263208970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ruby: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.3.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch" to "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.4.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch 
 file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch"
packages/core2-64-poky-linux/ruby/ruby-dbg: PV changed from "3.4.3" to "3.4.4"
packages/core2-64-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.3.4.3", added "/usr/lib/.debug/libruby.so.3.4.4"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
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
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_parser, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6 -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/rakelib -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/rakelib, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/docs -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/docs, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/stringprep, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/sample -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/sample, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/l
 ib/net/imap/sasl, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/config, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net, removed "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sequence_set.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/authenticators.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap
 -0.5.6/lib/net/imap/uidplus_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/errors.rb /usr/lib/libruby.so.3.4.3 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/fetch_data.rb", added "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sequence_set.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/data_encodi
 ng.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.8.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/authenticators.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/uidplus_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_parser.rb /usr/lib/libruby.so.3.4.4 /usr/lib/ruby/gems/3.4.0/ge
 ms/net-imap-0.5.8/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/connection_state.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.8.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_reader.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/fetch_data.rb"
packages/core2-64-poky-linux/ruby/ruby: PKGV changed from 3.4.3 [default] to 3.4.4 [default]
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

--===============8621662418263208970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/config, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/stringprep, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/rakelib -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/rakelib, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6 -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/sample -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/sample, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser -> /usr/lib/ruby/gems/3.4.0/ge
 ms/net-imap-0.5.8/lib/net/imap/response_parser, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/docs -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/docs, removed "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/uidplus_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/flags.rb /usr/
 lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sequence_set.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/fetch_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl.rb /usr/lib/libruby.so.3.4.3 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/authenticators.rb", added "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/errors.rb /usr/li
 b/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/uidplus_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.8.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.8.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sequence_set.
 rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/fetch_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/sasl.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/connection_state.rb /usr/lib/libruby.so.3.4.4 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/response_reader.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.8/lib/net/imap/authenticators.rb"
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

--===============8621662418263208970==--

