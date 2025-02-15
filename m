Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A780C19F2E
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8104.1739623340447587950
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=i/KD5DCL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JXIHfYap;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019509a196fe-8d6d0f73-947b-4851-8644-c532a77a35a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lzMtXvtlqtn7biVG1H2l1hedFejPjaH6+tvoqM/r55Q=;
	b=i/KD5DCLb3lm7lYiZH6Azwf9WshYr/1G026qPkhCNnpgVk9yGGxJDg1nifUtwiA/
	4urWDfE94QvduIiZNfi6addrZ4SALtN+WE/YuSsuK0lhM2fnCRHiKoLXkkhd9fVSzwR
	LfczFdU1Zy0R3eSywg+DoARouc0+E/cznv6JoKLc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lzMtXvtlqtn7biVG1H2l1hedFejPjaH6+tvoqM/r55Q=;
	b=JXIHfYapykSdLOpldP4H/WYT2XKjvF3jq019a6Di8jPzkHRRMP+c7UIqkxuK4FUB
	zb8O2Aig+EquC6q6gzu1W3s9B28h3NvLvYzoeCuQ3eM+9ESNkeGKk8okcvNSicMz0J2
	OL+OWYW2+Ht0tY8aBDbHshSZUgqyBA9e2nq2MJQ8=
Content-Type: multipart/mixed; boundary="===============3414898729486641825=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.4.2 SUCCEEDED
Message-ID: <0101019509a196fe-8d6d0f73-947b-4851-8644-c532a77a35a0-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211434

--===============3414898729486641825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpydWJ5KiB0byAqMy40LjIqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXJ1YnktdXBncmFkZS0zLjQuMS0zLjQuMi5wYXRj
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
bSA0OGE1ZGVkNjg1Zjc2OTZlNWU2ZDYzYzYyZjJmMjNkNzA5MGRlZDhjIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRh
dGU6IFNhdCwgMTUgRmViIDIwMjUgMDg6MjY6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBydWJ5
OiB1cGdyYWRlIDMuNC4xIC0+IDMuNC4yCgotLS0KIC4uLngtY3Jvc3MtY29tcGlsYXRpb24tb2Yt
ZXh0ZXJuYWwtZ2Vtcy5wYXRjaCB8ICA0ICstCiAuLi5pbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9y
LW11c2wtcmlzY3YucGF0Y2ggfCAgNCArLQogLi4uT2JleS1MREZMQUdTLWZvci10aGUtbGluay1v
Zi1saWJydWJ5LnBhdGNoIHwgIDIgKy0KIC4uLmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1l
bnRhdGlvbi5wYXRjaCB8ICAyICstCiAuLi4tbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJh
dGVkLU0ucGF0Y2ggfCAgMiArLQogLi4uZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUt
dG9vLnBhdGNoIHwgIDIgKy0KIC4uLi8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBh
dGNoICAgICB8ICAyICstCiAuLi4vcnVieS97cnVieV8zLjQuMS5iYiA9PiBydWJ5XzMuNC4yLmJi
fSAgICAgfCA1MSArKysrKysrKysrKysrKysrKystCiA4IGZpbGVzIGNoYW5nZWQsIDU4IGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3tydWJ5XzMuNC4xLmJiID0+IHJ1YnlfMy40LjIuYmJ9ICg3MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21w
aWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1z
LnBhdGNoCmluZGV4IGYxNzk3MGU5YzkuLjRhMTI3MzY3NzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24t
b2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAzNzAwZWMyNTY3ODllMDJkZTIwYjU4YmNhMDgwYzZm
ZWY1OTIzMzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBmYjYxOGQwNDU4ZGJhOWI5
ZTJhMzY5ZjBlMzQyNmZkMzVlNjM3MDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9
P1VURi04P3E/QW5kcj1DMz1BOT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgog
RGF0ZTogTW9uLCAzMCBTZXAgMjAxOSAxNjo1NzowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBl
eHRtazogZml4IGNyb3NzLWNvbXBpbGF0aW9uIG9mIGV4dGVybmFsIGdlbXMKQEAgLTE2LDcgKzE2
LDcgQEAgU2lnbmVkLW9mZi1ieTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAamNpLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlm
ZiAtLWdpdCBhL2V4dC9leHRtay5yYiBiL2V4dC9leHRtay5yYgotaW5kZXggOGI2YjM2NS4uMzA0
OGY3NSAxMDA3NTUKK2luZGV4IDFkMTY1NDUuLmFkOTcxZWEgMTAwNzU1CiAtLS0gYS9leHQvZXh0
bWsucmIKICsrKyBiL2V4dC9leHRtay5yYgogQEAgLTQzNCw4ICs0MzQsOCBAQCBlbHNlCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURl
ZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVH
X1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCmluZGV4IDc5OTMyNGNhZWEuLmQ1ZGY3YmIwN2MgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMt
RGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1h
bmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOTky
ZDc4MWUwNWI2MTQ4OWJkZjVhMmE5YWVlNmNjNjE2ZjE3NDJhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA1MzY4NGFiM2VmMGVhZTI4MGQ4MGY0MmMzODlkMTMyODNkOTU0OGI0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
IERhdGU6IFR1ZSwgMjUgSmFuIDIwMjIgMjA6Mjk6MTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
dm1fZHVtcC5jOiBEZWZpbmUgUkVHX1MxIGFuZCBSRUdfUzIgZm9yIG11c2wvcmlzY3YKQEAgLTE0
LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS92bV9kdW1w
LmMgYi92bV9kdW1wLmMKLWluZGV4IDU4NzNlNTIuLjllYjRkYjEgMTAwNjQ0CitpbmRleCA5OTMz
OWZkLi44YzViYjAzIDEwMDY0NAogLS0tIGEvdm1fZHVtcC5jCiArKysgYi92bV9kdW1wLmMKIEBA
IC00MCw2ICs0MCwxMSBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1s
aW5rLW9mLWxpYnJ1YnkucGF0Y2gKaW5kZXggYmI2N2RmMGY0MC4uNTA0NTNlOTM3NCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1m
b3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZTIzMzdkOGIwZGFmMjY0Nzg1Y2IwNmQxZDZjN2Q2MWU0
MjhhMTFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhNjM0OTNhODEzYTQ4MjkwZTI5
YzkzMTVhMTVhODc4Y2Q4NjM5Nzk1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hy
aXN0b3BoZXIgTGFyc29uIDxjaHJpc19sYXJzb25AbWVudG9yLmNvbT4KIERhdGU6IFRodSwgNSBN
YXkgMjAxNiAxMDo1OTowNyAtMDcwMAogU3ViamVjdDogW1BBVENIXSBPYmV5IExERkxBR1MgZm9y
IHRoZSBsaW5rIG9mIGxpYnJ1YnkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9k
dWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gKaW5kZXggODdhMWU4MjUxNi4uZmNhMWQ1ZGFjNiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVp
bGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRp
b24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk4MDcxYzBiMjhhNDVjZDIxYTJjYmU2NzQ2
Y2UzOTA2NzkzMmI2MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDIzYmI3NDU2ZmMy
NmVmMGZmMTMwM2Q5ZTliNDc5OWEwZGRmNzZlZjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBDaHJpc3RpYW4gSG9mc3RhZWR0bGVyIDx6ZWhhQGRlYmlhbi5vcmc+CiBEYXRlOiBUdWUs
IDEwIE9jdCAyMDE3IDE1OjA0OjM0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJkb2M6IGJ1aWxk
IHJlcHJvZHVjaWJsZSBkb2N1bWVudGF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxl
cy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1N
LnBhdGNoCmluZGV4IDRiNjc3MWZkMjYuLjAwYTZjNjY1ZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2Jq
ZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWlu
LWdlbmVyYXRlZC1NLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwODg3ZmFjYzRjYTViY2Iw
MjgwYjAyNWIzNWJiYzE4NTI4ZTUyOTE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBk
MTRmYmYxMGJkODRjMzkzOTZjOTIwMzM4N2I0ZmI1OGNiZTFmNGI5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogUmVpbmVyIEhlcnJtYW5uIDxyZWluZXJAcmVpbmVyLWguZGU+CiBEYXRl
OiBUdWUsIDEwIE9jdCAyMDE3IDE1OjA2OjEzIC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYi9t
a21mLnJiOiBzb3J0IGxpc3Qgb2Ygb2JqZWN0IGZpbGVzIGluIGdlbmVyYXRlZCBNYWtlZmlsZQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vt
c3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUt
Y2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCmluZGV4IGVkYTQ1ZGQ4NjIuLjUxZDk4Yzhk
NzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJr
LUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJv
ZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGZmMjVmNmRkZGNmYmJiN2IwNDY0NDg1YmI1MTMyNDU4ODY2YWI1MWEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGQyYzBkMjZmNmMxMzQ1ZWVjNWEzMTc3NDM3N2RhMjRlYjIxYzA1
NTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFz
aGlyb0BkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1
Y2libGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1n
ZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKaW5kZXggMTIxYmRjZjNhYi4uMGQ2NjdkOTBkNyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vt
c3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZDU4YmRhY2EzZDUzNzlhZmNiOTU0YmI1N2M2OTBjNzczNjgwN2VjNSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWVmNjQ3ODM2ZDYzYjdiMDM3NDE5ZGIzZDBmYTE2ZmZl
YmJiYzE3MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEx1Y2FzIEthbmFzaGlybyA8
a2FuYXNoaXJvQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDEgTm92IDIwMTkgMTU6MjU6MTcgLTAz
MDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBnZW1zcGVjcyByZXByb2R1Y2libGUKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjEuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggNzMlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjIuYmIKaW5kZXggMDk0MTVhMzEz
Mi4uYWZhOTA3MTBjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eV8zLjQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC4yLmJi
CkBAIC0xLDMgKzEsNTAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBo
YXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBp
cyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0
LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1h
cml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVw
ZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJz
IHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMRUdBTAorIyArKysgTEVH
QUwKKyMgQEAgLTM3MSw2ICszNzEsMzMgQEAKKyMgICAgICBUT1JUIE9SIE9USEVSV0lTRSwgQVJJ
U0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRQorIyAgICAgIFNPRlRX
QVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorIyAgCisj
ICtbc3BlYy9saWIvdHVyYm9fdGVzdHMvKl0KKyMgK1tzcGVjL2xpYi90dXJib190ZXN0cy5yYl0K
KyMgK1tzcGVjL2xpYi91dGlscy8qXQorIyArCisjICsgIFRoZXNlIGZpbGVzIGFyZSB1bmRlciB0
aGUgTUlUIExpY2Vuc2UuCisjICsKKyMgKyAgPj4+CisjICsgICAgQ29weXJpZ2h0IChjKSAyMDIw
IElseWEgWnViCisjICsKKyMgKyAgICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVl
IG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjICsgICAgb2YgdGhp
cyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3
YXJlIiksIHRvIGRlYWwKKyMgKyAgICBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlv
biwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzCisjICsgICAgdG8gdXNl
LCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBh
bmQvb3Igc2VsbAorIyArICAgIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQg
cGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcworIyArICAgIGZ1cm5pc2hlZCB0byBkbyBz
bywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjICsKKyMgKyAgICBUaGUg
YWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBi
ZSBpbmNsdWRlZCBpbgorIyArICAgIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMg
b2YgdGhlIFNvZnR3YXJlLgorIyArCisjICsgICAgVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJB
UyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgKyAgICBJ
TVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1F
UkNIQU5UQUJJTElUWSwKKyMgKyAgICBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBB
TkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUKKyMgKyAgICBBVVRIT1JT
IE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9S
IE9USEVSCisjICsgICAgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFD
VCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMgKyAgICBPVVQgT0YgT1IgSU4g
Q09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdT
IElOCisjICsgICAgVEhFIFNPRlRXQVJFLgorIyArCisjICBbcGFyc2UuY10KKyMgIFtwYXJzZS5o
XQorIyAgCisjIAorIworCiBTVU1NQVJZID0gIkFuIGludGVycHJldGVyIG9mIG9iamVjdC1vcmll
bnRlZCBzY3JpcHRpbmcgbGFuZ3VhZ2UiCiBERVNDUklQVElPTiA9ICJSdWJ5IGlzIGFuIGludGVy
cHJldGVkIHNjcmlwdGluZyBsYW5ndWFnZSBmb3IgcXVpY2sgXAogYW5kIGVhc3kgb2JqZWN0LW9y
aWVudGVkIHByb2dyYW1taW5nLiBJdCBoYXMgbWFueSBmZWF0dXJlcyB0byBwcm9jZXNzIFwKQEAg
LTEwLDcgKzU3LDcgQEAgTElDRU5TRSA9ICJSdWJ5IHwgQlNELTItQ2xhdXNlIHwgQlNELTMtQ2xh
dXNlIHwgR1BMLTIuMC1vbmx5IHwgSVNDIHwgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vQ09QWUlORzttZDU9NWI4Yzg3NTU5ODY4Nzk2OTc5ODA2MTAwZGIzZjM4MDUgXAogICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vQlNETDttZDU9OGI1MGJjNmRlOGY1ODZkYzY2NzkwYmExMWQw
NjRkNzUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vR1BMO21kNT1iMjM0ZWU0ZDY5ZjVm
Y2U0NDg2YTgwZmRhZjRhNDI2MyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MRUdBTDtt
ZDU9ZWZmM2JiMTM4MmI1OTBjYzU4MTRmMWYzZGU2ZWI0ZTUgXAorICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vTEVHQUw7bWQ1PWNiMTQzNThiNzgyMWMwNTRhZTE0MTI4ODg1MTcwMjA0IFwKICAg
ICAgICAgICAgICAgICAgICAgIgogCiBERVBFTkRTID0gInpsaWIgb3BlbnNzbCBsaWJ5YW1sIGxp
YmZmaSIKQEAgLTQ4LDcgKzk1LDcgQEAgZG9fY29uZmlndXJlOnByZXBlbmQoKSB7CiAKIERFUEVO
RFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIgbGlidWNvbnRleHQiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIzZDM4NWU1ZDIyZDM2OGIwNjRjODE3YTEzZWQ4ZTNjYzNmNzFhNzcwNWQ3ZWQxYmFlNzgw
MTNjMzNhYTdjODdmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQxMzI4YWMyMWYyYmZkZDdkZTZi
MzU2NWVmNGYwZGQ3NTQzMzU0ZDM3ZTk2ZjE1N2ExNTUyYTZiZDBlYjM2NGIiCiAKIFBBQ0tBR0VD
T05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHICs9ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RS
T19GRUFUVVJFUycsICdpcHY2JywgZCl9IgotLSAKMi40NC4xCgo=

--===============3414898729486641825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ruby: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.1.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch" to "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.2.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch 
 file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch"
packages/core2-64-poky-linux/ruby: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby-dbg: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.3.4.1", added "/usr/lib/.debug/libruby.so.3.4.2"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 12087616 to 12091304 (+0%)
packages/core2-64-poky-linux/ruby/ruby-dev: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby-dev: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1587314 to 1587225 (-0%)
packages/core2-64-poky-linux/ruby/ruby-doc: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby-doc: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby-locale: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby-locale: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby-ptest: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/prism/fixtures/rescue_modifier.txt /usr/lib/ruby/ptest/test/prism/snapshots/rescue_modifier.txt /usr/lib/ruby/ptest/test/prism/errors/numbered_operator_write.txt /usr/lib/ruby/ptest/test/prism/errors/numbered_or_write.txt /usr/lib/ruby/ptest/test/prism/errors/numbered_and_write.txt /usr/lib/ruby/ptest/test/prism/fixtures/it_indirect_writes.txt /usr/lib/ruby/ptest/test/prism/errors/defs_endless_method.txt"
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 13610258 to 13631301 (+0%)
packages/core2-64-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby-rdoc: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby-src: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby-src: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby-src: PKGSIZE changed from 39616907 to 39641500 (+0%)
packages/core2-64-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby-staticdev: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/ruby/ruby: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/stringprep -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/response_parser -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/rakelib -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/rakelib, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/sample -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/sample, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/docs -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/docs, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/sasl -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0/lib/net/smtp -> /usr/lib/ruby/g
 ems/3.4.0/gems/net-smtp-0.5.1/lib/net/smtp, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0/lib/net -> /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.1/lib/net, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/config -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0 -> /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.1, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4 -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6, removed "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.4.gemspec /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.0.gemspec /usr/lib/ruby/gems/3.4.0
 /gems/net-imap-0.5.4/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/sasl.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/fetch_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/authenticators.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.4.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/config.rb /usr/lib/libruby.so.3.4.1 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/sequence_set.rb /usr/lib/
 ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.0.gem", added "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.1.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/uidplus_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/fetch_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl_adapter.rb 
 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/authenticators.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sequence_set.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/search_result.rb /usr/lib/libruby.so.3.4.2 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.1.gem"
packages/core2-64-poky-linux/ruby/ruby: PKGSIZE changed from 30667142 to 30695295 (+0%)
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.1 to libruby.so.3.4.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.1 to libruby.so.3.4.2
  /usr/lib/libruby.so.3.4.1 moved to /usr/lib/libruby.so.3.4.2
  /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.4.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem
  /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.0.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.1.gem
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4 moved to /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6
  /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0 moved to /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.1
  /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.4.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.1.gemspec
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/uidplus_data.rb was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.1 to libruby.so.3.4.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.1 to libruby.so.3.4.2
  /usr/lib/libruby.so.3.4.1 moved to /usr/lib/libruby.so.3.4.2
  /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.4.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem
  /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.0.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.1.gem
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4 moved to /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6
  /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0 moved to /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.1
  /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.4.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.1.gemspec
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/uidplus_data.rb was added

--===============3414898729486641825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/prism/errors/defs_endless_method.txt /usr/lib/ruby/ptest/test/prism/snapshots/rescue_modifier.txt /usr/lib/ruby/ptest/test/prism/errors/numbered_or_write.txt /usr/lib/ruby/ptest/test/prism/errors/numbered_and_write.txt /usr/lib/ruby/ptest/test/prism/errors/numbered_operator_write.txt /usr/lib/ruby/ptest/test/prism/fixtures/it_indirect_writes.txt /usr/lib/ruby/ptest/test/prism/fixtures/rescue_modifier.txt"
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/response_parser -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/rakelib -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/rakelib, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/sasl -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0/lib/net/smtp -> /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.1/lib/net/smtp, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0/lib/net -> /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.1/lib/net, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/config -> /usr/lib/ruby/gems/3.4
 .0/gems/net-imap-0.5.6/lib/net/imap/config, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4 -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/stringprep -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/stringprep, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0 -> /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.1, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/docs -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/docs, directory renamed /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/sample -> /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/sample, removed "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/authenticators.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/sasl.rb /usr/lib/ruby/gems
 /3.4.0/gems/net-imap-0.5.4/lib/net/imap/sequence_set.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/vanished_data.rb /usr/lib/libruby.so.3.4.1 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.4.gem /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.0.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.4.gemspec /usr/lib/ruby/gems
 /3.4.0/specifications/net-smtp-0.5.0.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4/lib/net/imap/fetch_data.rb", added "/usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_encoding.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_parser.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/authenticators.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sequence_set.rb /usr/lib/libruby.so.3.4.2 /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/vanished_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/flags.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/data_lite.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/search_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.
 5.6/lib/net/imap/stringprep.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/esearch_result.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/config.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/errors.rb /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.1.gem /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/response_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/deprecated_client_options.rb /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.1.gemspec /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/uidplus_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/command_data.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/sasl_adapter.rb /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/fetch_data.rb"
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.1 to libruby.so.3.4.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.1 to libruby.so.3.4.2
  /usr/lib/libruby.so.3.4.1 moved to /usr/lib/libruby.so.3.4.2
  /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.4.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem
  /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.0.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.1.gem
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4 moved to /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6
  /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0 moved to /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.1
  /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.4.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.1.gemspec
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/uidplus_data.rb was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.1 to libruby.so.3.4.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.1 to libruby.so.3.4.2
  /usr/lib/libruby.so.3.4.1 moved to /usr/lib/libruby.so.3.4.2
  /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.4.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-imap-0.5.6.gem
  /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.0.gem moved to /usr/lib/ruby/gems/3.4.0/cache/net-smtp-0.5.1.gem
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.4 moved to /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6
  /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.0 moved to /usr/lib/ruby/gems/3.4.0/gems/net-smtp-0.5.1
  /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.4.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-imap-0.5.6.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/net-smtp-0.5.1.gemspec
  /usr/lib/ruby/gems/3.4.0/gems/net-imap-0.5.6/lib/net/imap/uidplus_data.rb was added

--===============3414898729486641825==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.4.1-3.4.2.patch"

RnJvbSA0OGE1ZGVkNjg1Zjc2OTZlNWU2ZDYzYzYyZjJmMjNkNzA5MGRlZDhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDg6MjY6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDMuNC4xIC0+IDMuNC4yCgotLS0KIC4uLngtY3Jvc3MtY29tcGlsYXRpb24t
b2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCB8ICA0ICstCiAuLi5pbmUtUkVHX1MxLWFuZC1SRUdfUzIt
Zm9yLW11c2wtcmlzY3YucGF0Y2ggfCAgNCArLQogLi4uT2JleS1MREZMQUdTLWZvci10aGUtbGlu
ay1vZi1saWJydWJ5LnBhdGNoIHwgIDIgKy0KIC4uLmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9j
dW1lbnRhdGlvbi5wYXRjaCB8ICAyICstCiAuLi4tbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2Vu
ZXJhdGVkLU0ucGF0Y2ggfCAgMiArLQogLi4uZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQy
MjUtdG9vLnBhdGNoIHwgIDIgKy0KIC4uLi8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxl
LnBhdGNoICAgICB8ICAyICstCiAuLi4vcnVieS97cnVieV8zLjQuMS5iYiA9PiBydWJ5XzMuNC4y
LmJifSAgICAgfCA1MSArKysrKysrKysrKysrKysrKystCiA4IGZpbGVzIGNoYW5nZWQsIDU4IGlu
c2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3tydWJ5XzMuNC4xLmJiID0+IHJ1YnlfMy40LjIuYmJ9ICg3MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1j
b21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1n
ZW1zLnBhdGNoCmluZGV4IGYxNzk3MGU5YzkuLjRhMTI3MzY3NzcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRp
b24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAzNzAwZWMyNTY3ODllMDJkZTIwYjU4YmNhMDgw
YzZmZWY1OTIzMzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBmYjYxOGQwNDU4ZGJh
OWI5ZTJhMzY5ZjBlMzQyNmZkMzVlNjM3MDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiA9P1VURi04P3E/QW5kcj1DMz1BOT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29t
PgogRGF0ZTogTW9uLCAzMCBTZXAgMjAxOSAxNjo1NzowMSArMDEwMAogU3ViamVjdDogW1BBVENI
XSBleHRtazogZml4IGNyb3NzLWNvbXBpbGF0aW9uIG9mIGV4dGVybmFsIGdlbXMKQEAgLTE2LDcg
KzE2LDcgQEAgU2lnbmVkLW9mZi1ieTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAamNp
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL2V4dC9leHRtay5yYiBiL2V4dC9leHRtay5yYgotaW5kZXggOGI2YjM2NS4u
MzA0OGY3NSAxMDA3NTUKK2luZGV4IDFkMTY1NDUuLmFkOTcxZWEgMTAwNzU1CiAtLS0gYS9leHQv
ZXh0bWsucmIKICsrKyBiL2V4dC9leHRtay5yYgogQEAgLTQzNCw4ICs0MzQsOCBAQCBlbHNlCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5j
LURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQt
UkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCmluZGV4IDc5OTMyNGNhZWEuLmQ1ZGY3YmIwN2Mg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1w
LmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19T
MS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBm
OTkyZDc4MWUwNWI2MTQ4OWJkZjVhMmE5YWVlNmNjNjE2ZjE3NDJhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA1MzY4NGFiM2VmMGVhZTI4MGQ4MGY0MmMzODlkMTMyODNkOTU0OGI0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IFR1ZSwgMjUgSmFuIDIwMjIgMjA6Mjk6MTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gdm1fZHVtcC5jOiBEZWZpbmUgUkVHX1MxIGFuZCBSRUdfUzIgZm9yIG11c2wvcmlzY3YKQEAg
LTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS92bV9k
dW1wLmMgYi92bV9kdW1wLmMKLWluZGV4IDU4NzNlNTIuLjllYjRkYjEgMTAwNjQ0CitpbmRleCA5
OTMzOWZkLi44YzViYjAzIDEwMDY0NAogLS0tIGEvdm1fZHVtcC5jCiArKysgYi92bV9kdW1wLmMK
IEBAIC00MCw2ICs0MCwxMSBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRo
ZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKaW5kZXggYmI2N2RmMGY0MC4uNTA0NTNlOTM3NCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFH
Uy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZTIzMzdkOGIwZGFmMjY0Nzg1Y2IwNmQxZDZjN2Q2
MWU0MjhhMTFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhNjM0OTNhODEzYTQ4Mjkw
ZTI5YzkzMTVhMTVhODc4Y2Q4NjM5Nzk1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Q2hyaXN0b3BoZXIgTGFyc29uIDxjaHJpc19sYXJzb25AbWVudG9yLmNvbT4KIERhdGU6IFRodSwg
NSBNYXkgMjAxNiAxMDo1OTowNyAtMDcwMAogU3ViamVjdDogW1BBVENIXSBPYmV5IExERkxBR1Mg
Zm9yIHRoZSBsaW5rIG9mIGxpYnJ1YnkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVw
cm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gKaW5kZXggODdhMWU4MjUxNi4uZmNhMWQ1ZGFj
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2Mt
YnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50
YXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk4MDcxYzBiMjhhNDVjZDIxYTJjYmU2
NzQ2Y2UzOTA2NzkzMmI2MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDIzYmI3NDU2
ZmMyNmVmMGZmMTMwM2Q5ZTliNDc5OWEwZGRmNzZlZjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBDaHJpc3RpYW4gSG9mc3RhZWR0bGVyIDx6ZWhhQGRlYmlhbi5vcmc+CiBEYXRlOiBU
dWUsIDEwIE9jdCAyMDE3IDE1OjA0OjM0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJkb2M6IGJ1
aWxkIHJlcHJvZHVjaWJsZSBkb2N1bWVudGF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1m
aWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRl
ZC1NLnBhdGNoCmluZGV4IDRiNjc3MWZkMjYuLjAwYTZjNjY1ZDggMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Yt
b2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVz
LWluLWdlbmVyYXRlZC1NLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwODg3ZmFjYzRjYTVi
Y2IwMjgwYjAyNWIzNWJiYzE4NTI4ZTUyOTE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBkMTRmYmYxMGJkODRjMzkzOTZjOTIwMzM4N2I0ZmI1OGNiZTFmNGI5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUmVpbmVyIEhlcnJtYW5uIDxyZWluZXJAcmVpbmVyLWguZGU+CiBE
YXRlOiBUdWUsIDEwIE9jdCAyMDE3IDE1OjA2OjEzIC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxp
Yi9ta21mLnJiOiBzb3J0IGxpc3Qgb2Ygb2JqZWN0IGZpbGVzIGluIGdlbmVyYXRlZCBNYWtlZmls
ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmst
R2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2li
bGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCmluZGV4IGVkYTQ1ZGQ4NjIuLjUxZDk4
YzhkNzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1N
YXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJl
cHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGZmMjVmNmRkZGNmYmJiN2IwNDY0NDg1YmI1MTMyNDU4ODY2YWI1MWEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGQyYzBkMjZmNmMxMzQ1ZWVjNWEzMTc3NDM3N2RhMjRlYjIx
YzA1NTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGth
bmFzaGlyb0BkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXBy
b2R1Y2libGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFr
ZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKaW5kZXggMTIxYmRjZjNhYi4uMGQ2NjdkOTBk
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2Ut
Z2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gZDU4YmRhY2EzZDUzNzlhZmNiOTU0YmI1N2M2OTBjNzczNjgwN2VjNSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWVmNjQ3ODM2ZDYzYjdiMDM3NDE5ZGIzZDBmYTE2
ZmZlYmJiYzE3MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEx1Y2FzIEthbmFzaGly
byA8a2FuYXNoaXJvQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDEgTm92IDIwMTkgMTU6MjU6MTcg
LTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBnZW1zcGVjcyByZXByb2R1Y2libGUKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjEuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggNzMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjIuYmIKaW5kZXggMDk0MTVh
MzEzMi4uYWZhOTA3MTBjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieV8zLjQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC4y
LmJiCkBAIC0xLDMgKzEsNTAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVl
cyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2lu
ZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0
ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1
bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNl
LVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHll
YXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMRUdBTAorIyArKysg
TEVHQUwKKyMgQEAgLTM3MSw2ICszNzEsMzMgQEAKKyMgICAgICBUT1JUIE9SIE9USEVSV0lTRSwg
QVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRQorIyAgICAgIFNP
RlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorIyAg
CisjICtbc3BlYy9saWIvdHVyYm9fdGVzdHMvKl0KKyMgK1tzcGVjL2xpYi90dXJib190ZXN0cy5y
Yl0KKyMgK1tzcGVjL2xpYi91dGlscy8qXQorIyArCisjICsgIFRoZXNlIGZpbGVzIGFyZSB1bmRl
ciB0aGUgTUlUIExpY2Vuc2UuCisjICsKKyMgKyAgPj4+CisjICsgICAgQ29weXJpZ2h0IChjKSAy
MDIwIElseWEgWnViCisjICsKKyMgKyAgICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBm
cmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjICsgICAgb2Yg
dGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNv
ZnR3YXJlIiksIHRvIGRlYWwKKyMgKyAgICBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmlj
dGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzCisjICsgICAgdG8g
dXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNl
LCBhbmQvb3Igc2VsbAorIyArICAgIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJt
aXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcworIyArICAgIGZ1cm5pc2hlZCB0byBk
byBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjICsKKyMgKyAgICBU
aGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFs
bCBiZSBpbmNsdWRlZCBpbgorIyArICAgIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlv
bnMgb2YgdGhlIFNvZnR3YXJlLgorIyArCisjICsgICAgVEhFIFNPRlRXQVJFIElTIFBST1ZJREVE
ICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgKyAg
ICBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9G
IE1FUkNIQU5UQUJJTElUWSwKKyMgKyAgICBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUKKyMgKyAgICBBVVRI
T1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VT
IE9SIE9USEVSCisjICsgICAgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05U
UkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMgKyAgICBPVVQgT0YgT1Ig
SU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJ
TkdTIElOCisjICsgICAgVEhFIFNPRlRXQVJFLgorIyArCisjICBbcGFyc2UuY10KKyMgIFtwYXJz
ZS5oXQorIyAgCisjIAorIworCiBTVU1NQVJZID0gIkFuIGludGVycHJldGVyIG9mIG9iamVjdC1v
cmllbnRlZCBzY3JpcHRpbmcgbGFuZ3VhZ2UiCiBERVNDUklQVElPTiA9ICJSdWJ5IGlzIGFuIGlu
dGVycHJldGVkIHNjcmlwdGluZyBsYW5ndWFnZSBmb3IgcXVpY2sgXAogYW5kIGVhc3kgb2JqZWN0
LW9yaWVudGVkIHByb2dyYW1taW5nLiBJdCBoYXMgbWFueSBmZWF0dXJlcyB0byBwcm9jZXNzIFwK
QEAgLTEwLDcgKzU3LDcgQEAgTElDRU5TRSA9ICJSdWJ5IHwgQlNELTItQ2xhdXNlIHwgQlNELTMt
Q2xhdXNlIHwgR1BMLTIuMC1vbmx5IHwgSVNDIHwgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NWI4Yzg3NTU5ODY4Nzk2OTc5ODA2MTAwZGIzZjM4MDUgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vQlNETDttZDU9OGI1MGJjNmRlOGY1ODZkYzY2NzkwYmEx
MWQwNjRkNzUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vR1BMO21kNT1iMjM0ZWU0ZDY5
ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MRUdB
TDttZDU9ZWZmM2JiMTM4MmI1OTBjYzU4MTRmMWYzZGU2ZWI0ZTUgXAorICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vTEVHQUw7bWQ1PWNiMTQzNThiNzgyMWMwNTRhZTE0MTI4ODg1MTcwMjA0IFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBERVBFTkRTID0gInpsaWIgb3BlbnNzbCBsaWJ5YW1s
IGxpYmZmaSIKQEAgLTQ4LDcgKzk1LDcgQEAgZG9fY29uZmlndXJlOnByZXBlbmQoKSB7CiAKIERF
UEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIgbGlidWNvbnRleHQiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICIzZDM4NWU1ZDIyZDM2OGIwNjRjODE3YTEzZWQ4ZTNjYzNmNzFhNzcwNWQ3ZWQxYmFl
NzgwMTNjMzNhYTdjODdmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQxMzI4YWMyMWYyYmZkZDdk
ZTZiMzU2NWVmNGYwZGQ3NTQzMzU0ZDM3ZTk2ZjE1N2ExNTUyYTZiZDBlYjM2NGIiCiAKIFBBQ0tB
R0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHICs9ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJ
U1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9IgotLSAKMi40NC4xCgo=

--===============3414898729486641825==--

