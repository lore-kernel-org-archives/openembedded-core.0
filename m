Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9082.1795068810571512130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 22:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Kzlwv2Uv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gaqD7HiF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1f270517c-1e3774a7-f914-47dc-959e-e7330dbe1b6b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795068809;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9p60PsYITfU2GYo6Sb3d679CR9vhC9ju3CjjPT6DjUs=;
	b=Kzlwv2Uv/npwJsW3WOq1ydQhtLgAoRKd/Z9vBCkVtIc5GpSuXN2DqldjKNxRt6Ge
	nXCf7MtS8kZIeJAQy5yYk/KeNKYrUpYgSkjbrQIfTgxnR3asTxc9vGt0305nvcVENUH
	xCDaifketlaCXAIsMiflSbHsI2eLn9J9hIqEKRhw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795068809;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9p60PsYITfU2GYo6Sb3d679CR9vhC9ju3CjjPT6DjUs=;
	b=gaqD7HiFzW+mpeCVecm/cqKGWjnTTjU1NzkQISysGXgx0NRrvltCBCVpBGsqJq8B
	iTQgAlij5J4H7Lo8HcH9KlLqyi2sQR0oVKaTJr0ia2Elg/y7VHvWhlRxl+E3IY1RYyO
	Q1FoOVbCEtuo4PH2EqWVUyt2rB8ltgT9wfGernkI=
Content-Type: multipart/mixed; boundary="===============6819186743319716884=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fontconfig: upgrading to 2.18.4 SUCCEEDED
Message-ID: <010101a1f270517c-1e3774a7-f914-47dc-959e-e7330dbe1b6b-000000@us-west-2.amazonses.com>
Date: Thu, 19 Nov 2026 06:13:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.19-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250648

--===============6819186743319716884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpmb250Y29uZmlnKiB0byAqMi4xOC40KiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBzdGVwczoK
ICAgIC0gYXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1mb250Y29uZmlnLXVwZ3JhZGUtMi4x
OC4zLTIuMTguNC5wYXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRj
aGVzIGFuZCBzdW1tYXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBp
bGUgYW4gaW1hZ2UgdGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUg
YmFzaWMgc2FuaXR5IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6
IGdpdCBjb21taXQgLXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRo
ZSBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZl
IHRoZSByZWNpcGUgc2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4g
ZmlsbCBSRUNJUEVfTk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNv
IHRoYXQKYXV0b21hdGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQ
bGVhc2UgcmV2aWV3IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBh
bmQgYnVpbGQvdXBkYXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBh
dCBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0
PUF1dG9tYXRlZCUyMFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBl
cgoKLS0gPjggLS0KRnJvbSA3YTFmNDZlYjcxNTM3ODhlYjRjNmMwMzg3NjZhZWI5Nzg4MGEzNDBk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3Rv
cHJvamVjdC5vcmc+CkRhdGU6IFRodSwgMTkgTm92IDIwMjYgMDU6MzU6MjIgKzAwMDAKU3ViamVj
dDogW1BBVENIXSBmb250Y29uZmlnOiB1cGdyYWRlIDIuMTguMyAtPiAyLjE4LjQKTUlNRS1WZXJz
aW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQt
VHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKClZlcnNpb24gMi4xOC40CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDIwMjYtMTEtMTgKMi4xOC40CgpBa2lyYSBUQUdPSCAoNSk6CiAgICAgIEd1
YXJkIGFnYWluc3QgbWl4aW5nIHBsYWluIHN0cmluZ3MgYW5kIHRyaXBsZXMgaW4gYW4gRmNTdHJT
ZXQKICAgICAgRml4IHVuaW5pdGlhbGl6ZWQgcmVhZCBmcm9tIEdOVSBzdGRlcnJvcl9yIHZhcmlh
bnQKICAgICAgSGFyZGVuIGFsbG9jYXRpb24tZmFpbHVyZSBoYW5kbGluZyBmbGFnZ2VkIGJ5IGFu
IE9wZW5TY2FuSHViIGF1ZGl0CiAgICAgIEZpeCBjcmFzaCBvbiBvZGQtYWRkcmVlc3NlZCBwYXR0
ZXJuIHN0cmluZ3MKICAgICAgRml4IG91dC1vZi1ib3VuZHMgYWNjZXNzIGluIEZjQ2hhclNldE1l
cmdlIHdoZW4gbWVyZ2luZyBwYWdlIDB4ZmZmZgoKRG9taW5payBSw7Z0dHNjaGVzICgzKToKICAg
ICAgRml4IGFyYml0cmFyeSBmcmVlIGluIGNhY2hlIHZhbGlkYXRpb24KICAgICAgQWRkIHJlZ3Jl
c3Npb24gdGVzdHMgZm9yIGNhY2hlIHZhbHVlIHR5cGUgdmFsaWRhdGlvbgogICAgICBWYWxpZGF0
ZSBjYWNoZSB2YWx1ZSB0eXBlcyBhZ2FpbnN0IHRoZWlyIG9iamVjdAoKSmVyZW15IEh1ZGRsZXN0
b24gU2VxdW9pYSAoMik6CiAgICAgIERvIG5vdCBkZXJlZmVyZW5jZSBhIE5VTEwgZ2xvYiBzdHJp
bmcKICAgICAgRG8gbm90IHN0cmlwIGEgY3VycmVudCBkaXJlY3RvcnkgcHJlZml4IG9mZiBhbiBh
YnNvbHV0ZSBnbG9iCgpUaG9tYXMgQW5kZXJzb24gKDEpOgogICAgICBWYWxpZGF0ZSB1bnNlcmlh
bGl6YWJsZSB0eXBlcyBhbmQgdmFsdWUgYm91bmRzIGluIEZjQ2FjaGVPZmZzZXRzVmFsaWQKClRv
bSBBbmRlcnNvbiAoMik6CiAgICAgIEZpeCByYWNlIGR1cmluZyBGY0NvbmZpZyBpbml0aWFsaXph
dGlvbgogICAgICBEb24ndCB1c2UgdGhlIGZhbWlseSB0YWJsZSBmb3Igbm9uLXN0cmluZyB0ZXN0
IHZhbHVlcwotLS0KIC4uLi9mb250Y29uZmlnL2ZvbnRjb25maWcvcmV2ZXJ0LXN0YXRpYy1wa2dj
b25maWcucGF0Y2ggICAgICAgICB8IDIgKy0KIC4uLi9mb250Y29uZmlnL3tmb250Y29uZmlnXzIu
MTguMy5iYiA9PiBmb250Y29uZmlnXzIuMTguNC5iYn0gICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy9mb250Y29uZmlnL3tmb250Y29uZmlnXzIuMTguMy5iYiA9PiBmb250Y29uZmlnXzIu
MTguNC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNv
bmZpZy9mb250Y29uZmlnL3JldmVydC1zdGF0aWMtcGtnY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZy9yZXZlcnQtc3RhdGljLXBrZ2NvbmZp
Zy5wYXRjaAppbmRleCA0MzM3ZGE3MjRmLi45MWUwOTA5NTM0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnL3JldmVydC1zdGF0aWMtcGtnY29u
ZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25m
aWcvcmV2ZXJ0LXN0YXRpYy1wa2djb25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFk
ZTc3NTE4MDIxOWE1N2M4NWEwY2RjYzYyZmM2NDgyZWY4ZTU4MWUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDZiZjQzYmFjZDUyM2VmNWI1NTJiNGNkZmY3Y2ZkOWUwOWYyNzY5MjMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogVGh1LCAyMyBBcHIgMjAxNSAyMDozNTozMiAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBmb250Y29uZmlnOiBGaXggcGtnY29uZmlnIGZpbGUgZ2VuZXJhdGlvbiB0byBub3QgaGF2ZQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18y
LjE4LjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnXzIu
MTguNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnXzIuMTguMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE4LjQuYmIKaW5kZXggMTYwMzdh
ZWFhMy4uOTYwZWRiZWNjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRj
b25maWcvZm9udGNvbmZpZ18yLjE4LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2Zv
bnRjb25maWcvZm9udGNvbmZpZ18yLjE4LjQuYmIKQEAgLTIzLDcgKzIzLDcgQEAgREVQRU5EUyA9
ICJleHBhdCBmcmVldHlwZSB6bGliIGdwZXJmLW5hdGl2ZSB1dGlsLWxpbnV4IgogU1JDX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvYXBpL3Y0L3Byb2plY3RzLzg5MC9wYWNr
YWdlcy9nZW5lcmljL2ZvbnRjb25maWcvJHtQVn0vZm9udGNvbmZpZy0ke1BWfS50YXIueHogXAog
ICAgICAgICAgICBmaWxlOi8vcmV2ZXJ0LXN0YXRpYy1wa2djb25maWcucGF0Y2ggXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGY3YjU1NGEzOGNkZjc4YzAzM2Y2NjZjODg3
MWYzNzQ5ZTE0YTA5NGY2NWEwN2Y2MzBjOTFlZDBiNDNkMzVlMyIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI5NTAxMzYzN2VmZjVmODFkNDg3MWRkMTZjZDA5OGMyNzMyNjRjMTZkMGY5ZjBiMjdjYzQz
YjgxYjI3OTRiZWUzIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2ZvbnRjb25maWcvZm9udGNvbmZpZy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVD
S19SRUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZlcj4uKykiCi0tIAoyLjQ3LjEKCg==

--===============6819186743319716884==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fontconfig-upgrade-2.18.3-2.18.4.patch"

RnJvbSA3YTFmNDZlYjcxNTM3ODhlYjRjNmMwMzg3NjZhZWI5Nzg4MGEzNDBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTkgTm92IDIwMjYgMDU6MzU6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
b250Y29uZmlnOiB1cGdyYWRlIDIuMTguMyAtPiAyLjE4LjQKTUlNRS1WZXJzaW9uOiAxLjAKQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5j
b2Rpbmc6IDhiaXQKClZlcnNpb24gMi4xOC40CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDIwMjYtMTEtMTgKMi4xOC40CgpBa2lyYSBUQUdPSCAoNSk6CiAgICAgIEd1YXJkIGFnYWluc3Qg
bWl4aW5nIHBsYWluIHN0cmluZ3MgYW5kIHRyaXBsZXMgaW4gYW4gRmNTdHJTZXQKICAgICAgRml4
IHVuaW5pdGlhbGl6ZWQgcmVhZCBmcm9tIEdOVSBzdGRlcnJvcl9yIHZhcmlhbnQKICAgICAgSGFy
ZGVuIGFsbG9jYXRpb24tZmFpbHVyZSBoYW5kbGluZyBmbGFnZ2VkIGJ5IGFuIE9wZW5TY2FuSHVi
IGF1ZGl0CiAgICAgIEZpeCBjcmFzaCBvbiBvZGQtYWRkcmVlc3NlZCBwYXR0ZXJuIHN0cmluZ3MK
ICAgICAgRml4IG91dC1vZi1ib3VuZHMgYWNjZXNzIGluIEZjQ2hhclNldE1lcmdlIHdoZW4gbWVy
Z2luZyBwYWdlIDB4ZmZmZgoKRG9taW5payBSw7Z0dHNjaGVzICgzKToKICAgICAgRml4IGFyYml0
cmFyeSBmcmVlIGluIGNhY2hlIHZhbGlkYXRpb24KICAgICAgQWRkIHJlZ3Jlc3Npb24gdGVzdHMg
Zm9yIGNhY2hlIHZhbHVlIHR5cGUgdmFsaWRhdGlvbgogICAgICBWYWxpZGF0ZSBjYWNoZSB2YWx1
ZSB0eXBlcyBhZ2FpbnN0IHRoZWlyIG9iamVjdAoKSmVyZW15IEh1ZGRsZXN0b24gU2VxdW9pYSAo
Mik6CiAgICAgIERvIG5vdCBkZXJlZmVyZW5jZSBhIE5VTEwgZ2xvYiBzdHJpbmcKICAgICAgRG8g
bm90IHN0cmlwIGEgY3VycmVudCBkaXJlY3RvcnkgcHJlZml4IG9mZiBhbiBhYnNvbHV0ZSBnbG9i
CgpUaG9tYXMgQW5kZXJzb24gKDEpOgogICAgICBWYWxpZGF0ZSB1bnNlcmlhbGl6YWJsZSB0eXBl
cyBhbmQgdmFsdWUgYm91bmRzIGluIEZjQ2FjaGVPZmZzZXRzVmFsaWQKClRvbSBBbmRlcnNvbiAo
Mik6CiAgICAgIEZpeCByYWNlIGR1cmluZyBGY0NvbmZpZyBpbml0aWFsaXphdGlvbgogICAgICBE
b24ndCB1c2UgdGhlIGZhbWlseSB0YWJsZSBmb3Igbm9uLXN0cmluZyB0ZXN0IHZhbHVlcwotLS0K
IC4uLi9mb250Y29uZmlnL2ZvbnRjb25maWcvcmV2ZXJ0LXN0YXRpYy1wa2djb25maWcucGF0Y2gg
ICAgICAgICB8IDIgKy0KIC4uLi9mb250Y29uZmlnL3tmb250Y29uZmlnXzIuMTguMy5iYiA9PiBm
b250Y29uZmlnXzIuMTguNC5iYn0gICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250
Y29uZmlnL3tmb250Y29uZmlnXzIuMTguMy5iYiA9PiBmb250Y29uZmlnXzIuMTguNC5iYn0gKDk2
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29u
ZmlnL3JldmVydC1zdGF0aWMtcGtnY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2ZvbnRjb25maWcvZm9udGNvbmZpZy9yZXZlcnQtc3RhdGljLXBrZ2NvbmZpZy5wYXRjaAppbmRl
eCA0MzM3ZGE3MjRmLi45MWUwOTA5NTM0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvZm9udGNvbmZpZy9mb250Y29uZmlnL3JldmVydC1zdGF0aWMtcGtnY29uZmlnLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWcvcmV2ZXJ0LXN0
YXRpYy1wa2djb25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFkZTc3NTE4MDIxOWE1
N2M4NWEwY2RjYzYyZmM2NDgyZWY4ZTU4MWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDZiZjQzYmFjZDUyM2VmNWI1NTJiNGNkZmY3Y2ZkOWUwOWYyNzY5MjMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1
LCAyMyBBcHIgMjAxNSAyMDozNTozMiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBmb250Y29uZmln
OiBGaXggcGtnY29uZmlnIGZpbGUgZ2VuZXJhdGlvbiB0byBub3QgaGF2ZQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE4LjMuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnXzIuMTguNC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNv
bmZpZy9mb250Y29uZmlnXzIuMTguMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE4LjQuYmIKaW5kZXggMTYwMzdhZWFhMy4uOTYwZWRi
ZWNjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNv
bmZpZ18yLjE4LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9u
dGNvbmZpZ18yLjE4LjQuYmIKQEAgLTIzLDcgKzIzLDcgQEAgREVQRU5EUyA9ICJleHBhdCBmcmVl
dHlwZSB6bGliIGdwZXJmLW5hdGl2ZSB1dGlsLWxpbnV4IgogU1JDX1VSSSA9ICJodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvYXBpL3Y0L3Byb2plY3RzLzg5MC9wYWNrYWdlcy9nZW5lcmlj
L2ZvbnRjb25maWcvJHtQVn0vZm9udGNvbmZpZy0ke1BWfS50YXIueHogXAogICAgICAgICAgICBm
aWxlOi8vcmV2ZXJ0LXN0YXRpYy1wa2djb25maWcucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNGY3YjU1NGEzOGNkZjc4YzAzM2Y2NjZjODg3MWYzNzQ5ZTE0YTA5
NGY2NWEwN2Y2MzBjOTFlZDBiNDNkMzVlMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NTAxMzYz
N2VmZjVmODFkNDg3MWRkMTZjZDA5OGMyNzMyNjRjMTZkMGY5ZjBiMjdjYzQzYjgxYjI3OTRiZWUz
IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2ZvbnRjb25maWcvZm9udGNvbmZpZy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJy
ZWxlYXNlcy8oP1A8cHZlcj4uKykiCi0tIAoyLjQ3LjEKCg==

--===============6819186743319716884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="fontconfig-changelog.txt"

VmVyc2lvbiAyLjE4LjQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjAyNi0xMS0xOAoy
LjE4LjQKCkFraXJhIFRBR09IICg1KToKICAgICAgR3VhcmQgYWdhaW5zdCBtaXhpbmcgcGxhaW4g
c3RyaW5ncyBhbmQgdHJpcGxlcyBpbiBhbiBGY1N0clNldAogICAgICBGaXggdW5pbml0aWFsaXpl
ZCByZWFkIGZyb20gR05VIHN0ZGVycm9yX3IgdmFyaWFudAogICAgICBIYXJkZW4gYWxsb2NhdGlv
bi1mYWlsdXJlIGhhbmRsaW5nIGZsYWdnZWQgYnkgYW4gT3BlblNjYW5IdWIgYXVkaXQKICAgICAg
Rml4IGNyYXNoIG9uIG9kZC1hZGRyZWVzc2VkIHBhdHRlcm4gc3RyaW5ncwogICAgICBGaXggb3V0
LW9mLWJvdW5kcyBhY2Nlc3MgaW4gRmNDaGFyU2V0TWVyZ2Ugd2hlbiBtZXJnaW5nIHBhZ2UgMHhm
ZmZmCgpEb21pbmlrIFLDtnR0c2NoZXMgKDMpOgogICAgICBGaXggYXJiaXRyYXJ5IGZyZWUgaW4g
Y2FjaGUgdmFsaWRhdGlvbgogICAgICBBZGQgcmVncmVzc2lvbiB0ZXN0cyBmb3IgY2FjaGUgdmFs
dWUgdHlwZSB2YWxpZGF0aW9uCiAgICAgIFZhbGlkYXRlIGNhY2hlIHZhbHVlIHR5cGVzIGFnYWlu
c3QgdGhlaXIgb2JqZWN0CgpKZXJlbXkgSHVkZGxlc3RvbiBTZXF1b2lhICgyKToKICAgICAgRG8g
bm90IGRlcmVmZXJlbmNlIGEgTlVMTCBnbG9iIHN0cmluZwogICAgICBEbyBub3Qgc3RyaXAgYSBj
dXJyZW50IGRpcmVjdG9yeSBwcmVmaXggb2ZmIGFuIGFic29sdXRlIGdsb2IKClRob21hcyBBbmRl
cnNvbiAoMSk6CiAgICAgIFZhbGlkYXRlIHVuc2VyaWFsaXphYmxlIHR5cGVzIGFuZCB2YWx1ZSBi
b3VuZHMgaW4gRmNDYWNoZU9mZnNldHNWYWxpZAoKVG9tIEFuZGVyc29uICgyKToKICAgICAgRml4
IHJhY2UgZHVyaW5nIEZjQ29uZmlnIGluaXRpYWxpemF0aW9uCiAgICAgIERvbid0IHVzZSB0aGUg
ZmFtaWx5IHRhYmxlIGZvciBub24tc3RyaW5nIHRlc3QgdmFsdWVzCg==

--===============6819186743319716884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGSIZE changed from 3022048 to 3029024 (+0%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGV changed from 2.18.3 [default] to 2.18.4 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PKGV changed from 2.18.3 [default] to 2.18.4 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PKGV changed from 2.18.3 [default] to 2.18.4 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PKGV changed from 2.18.3 [default] to 2.18.4 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PKGV changed from 2.18.3 [default] to 2.18.4 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: FILELIST: directory renamed /usr/src/debug/fontconfig/2.18.3/fc-const -> /usr/src/debug/fontconfig/2.18.4/fc-const, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-pattern -> /usr/src/debug/fontconfig/2.18.4/fc-pattern, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-scan -> /usr/src/debug/fontconfig/2.18.4/fc-scan, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-list -> /usr/src/debug/fontconfig/2.18.4/fc-list, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-case -> /usr/src/debug/fontconfig/2.18.4/fc-case, directory renamed /usr/src/debug/fontconfig/2.18.3 -> /usr/src/debug/fontconfig/2.18.4, directory renamed /usr/src/debug/fontconfig/2.18.3/fontconfig -> /usr/src/debug/fontconfig/2.18.4/fontconfig, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-lang -> /usr/src/debug/fontconfig/2.18.4/fc-lang, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-genericfamily -> /usr/src/debug/fontconfig/2.18
 .4/fc-genericfamily, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-query -> /usr/src/debug/fontconfig/2.18.4/fc-query, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-conflist -> /usr/src/debug/fontconfig/2.18.4/fc-conflist, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-cat -> /usr/src/debug/fontconfig/2.18.4/fc-cat, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-cache -> /usr/src/debug/fontconfig/2.18.4/fc-cache, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-validate -> /usr/src/debug/fontconfig/2.18.4/fc-validate, directory renamed /usr/src/debug/fontconfig/2.18.3/src -> /usr/src/debug/fontconfig/2.18.4/src, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-genconf -> /usr/src/debug/fontconfig/2.18.4/fc-genconf, directory renamed /usr/src/debug/fontconfig/2.18.3/fc-match -> /usr/src/debug/fontconfig/2.18.4/fc-match
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGSIZE changed from 1129859 to 1136556 (+1%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGV changed from 2.18.3 [default] to 2.18.4 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PKGV changed from 2.18.3 [default] to 2.18.4 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PKGV changed from 2.18.3 [default] to 2.18.4 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGSIZE changed from 662895 to 666991 (+1%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGV changed from 2.18.3 [default] to 2.18.4 [default]
packages/x86-64-v3-poky-linux/fontconfig: PV changed from "2.18.3" to "2.18.4"
packages/x86-64-v3-poky-linux/fontconfig: SRC_URI changed from "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.3/fontconfig-2.18.3.tar.xz file://revert-static-pkgconfig.patch" to "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.4/fontconfig-2.18.4.tar.xz file://revert-static-pkgconfig.patch"
packages/x86-64-v3-poky-linux/fontconfig: PKGV changed from 2.18.3 [default] to 2.18.4 [default]

--===============6819186743319716884==--
