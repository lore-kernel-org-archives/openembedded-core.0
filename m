Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5032DCA1010
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.89803.1756850190808987158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0IQjd11u;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZDw+RWi4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101990c6e852f-3757da53-2f26-469f-a136-7028da19ffcb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850193;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xLW7zBUNMypdO65ZC9ur8atWWXw0Ma5eVjKXmp6EQ28=;
	b=0IQjd11uuIJOay6Wujiji/AUu20Jtw9at7vURhYKt8wE6tEQl9FrIv1pkEE2Oxu4
	4RIAHEWB548Ro4a6l4Uigj7JSDWhCMRTS1NUUZ+pEzJ15AGiXYauwwKTZEFqFr85Wqo
	Og2u5qpKB0zVnmVlKTey1QqLp7OPIqqsnJWtZ+Wg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850193;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xLW7zBUNMypdO65ZC9ur8atWWXw0Ma5eVjKXmp6EQ28=;
	b=ZDw+RWi4ovRrL0sdgKi31yTGU9GuidGMPR6anYn4mEswkq/Y9IGzVz158jze4yr+
	JOpBSju8nQmhITWa5fiN8ndVymg3YJKhKJ3xUyORgm+51R9aLykrqSIou/U/+PxAN3P
	CCvf/J6kzT1ZOvRUOyMYH8Dud7lV+h9VioUMm6b8=
Content-Type: multipart/mixed; boundary="===============5600452457109151469=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.4.5 SUCCEEDED
Message-ID: <010101990c6e852f-3757da53-2f26-469f-a136-7028da19ffcb-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222792

--===============5600452457109151469==
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
bSAzNTMyYWYyMmQzYTg3MDk5ZTFhOTdjYTQ2NmRjOGEyMDMyMGNkZTAwIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRh
dGU6IFR1ZSwgMiBTZXAgMjAyNSAxOTowMDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1Ynk6
IHVwZ3JhZGUgMy40LjQgLT4gMy40LjUKCi0tLQogLi4uMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21w
aWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIHwgNCArKy0tCiAuLi5tX2R1bXAuYy1EZWZp
bmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggfCA0ICsrLS0KIC4uLi9y
dWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoICB8IDIg
Ky0KIC4uLi9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5w
YXRjaCB8IDggKysrKy0tLS0KIC4uLm1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1p
bi1nZW5lcmF0ZWQtTS5wYXRjaCB8IDQgKystLQogLi4ucmstR2Vtc3BlYy1yZXByb2R1Y2libGUt
Y2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIHwgMiArLQogLi4uL3J1YnkvcnVieS8wMDA2
LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoICAgICAgIHwgNCArKy0tCiAuLi4wNy1T
a2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2ggfCA1ICst
LS0tCiAuLi4vcnVieS97cnVieV8zLjQuNC5iYiA9PiBydWJ5XzMuNC41LmJifSAgICAgICAgICAg
ICAgICAgfCAyICstCiA5IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE5IGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzMuNC40LmJi
ID0+IHJ1YnlfMy40LjUuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5h
bC1nZW1zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1r
LWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCmluZGV4IGYxNzk3
MGU5YzkuLmNkZDdlOGY4OGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4
LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDAzNzAwZWMyNTY3ODllMDJkZTIwYjU4YmNhMDgwYzZmZWY1OTIzMzYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGEwNWQ1MTYzMDY2YmNkNDY2ZjgzZTM5ZmM5NDZlZTYwOWFj
NzUyNGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW5kcj1DMz1B
OT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogRGF0ZTogTW9uLCAzMCBTZXAg
MjAxOSAxNjo1NzowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBleHRtazogZml4IGNyb3NzLWNv
bXBpbGF0aW9uIG9mIGV4dGVybmFsIGdlbXMKQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVkLW9mZi1i
eTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2V4dC9leHRt
ay5yYiBiL2V4dC9leHRtay5yYgotaW5kZXggOGI2YjM2NS4uMzA0OGY3NSAxMDA3NTUKK2luZGV4
IDFkMTY1NDUuLmFkOTcxZWEgMTAwNzU1CiAtLS0gYS9leHQvZXh0bWsucmIKICsrKyBiL2V4dC9l
eHRtay5yYgogQEAgLTQzNCw4ICs0MzQsOCBAQCBlbHNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJF
R19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2
LnBhdGNoCmluZGV4IDc5OTMyNGNhZWEuLjYwNDZjZDliNjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQt
UkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNs
LXJpc2N2LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOTkyZDc4MWUwNWI2MTQ4OWJkZjVh
MmE5YWVlNmNjNjE2ZjE3NDJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NTY5NWJk
MjA1YjFiZWQwMDdjOTFkNGM1MzQxZWJkOTViMDgyZGVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjUgSmFu
IDIwMjIgMjA6Mjk6MTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdm1fZHVtcC5jOiBEZWZpbmUg
UkVHX1MxIGFuZCBSRUdfUzIgZm9yIG11c2wvcmlzY3YKQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS92bV9kdW1wLmMgYi92bV9kdW1wLmMKLWlu
ZGV4IDU4NzNlNTIuLjllYjRkYjEgMTAwNjQ0CitpbmRleCA5OTMzOWZkLi44YzViYjAzIDEwMDY0
NAogLS0tIGEvdm1fZHVtcC5jCiArKysgYi92bV9kdW1wLmMKIEBAIC00MCw2ICs0MCwxMSBAQApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERG
TEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0
Y2gKaW5kZXggODRmZTlhZWUzZC4uM2NjNzUzNzIyYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGli
cnVieS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2Jl
eS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAyNjI1ZjZjMTU1MTA1ZDM1MmQ2YTFmZjNhNzIyZTc4OTY0MzFmZjkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAxNDZkNjM5NGIxZTYyNDNhYjI4MDQ4ZDEyMTM1OTJjYzE4MWNl
Y2E1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0b3BoZXIgTGFyc29uIDxj
aHJpc19sYXJzb25AbWVudG9yLmNvbT4KIERhdGU6IFRodSwgNSBNYXkgMjAxNiAxMDo1OTowNyAt
MDcwMAogU3ViamVjdDogW1BBVENIXSBPYmV5IExERkxBR1MgZm9yIHRoZSBsaW5rIG9mIGxpYnJ1
YnkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9j
LWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRp
b24ucGF0Y2gKaW5kZXggODdhMWU4MjUxNi4uYjc5YWQxMjMwZSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRv
Y3VtZW50YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8w
MDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDk4MDcxYzBiMjhhNDVjZDIxYTJjYmU2NzQ2Y2UzOTA2NzkzMmI2MmYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY2ZWEzNzAyNzc4ZGEzMjBlYTdiYmQ2MGZiZGEz
OTM2OTBlZDBmODUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaHJpc3RpYW4gSG9m
c3RhZWR0bGVyIDx6ZWhhQGRlYmlhbi5vcmc+CiBEYXRlOiBUdWUsIDEwIE9jdCAyMDE3IDE1OjA0
OjM0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJkb2M6IGJ1aWxkIHJlcHJvZHVjaWJsZSBkb2N1
bWVudGF0aW9uCkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhv
ZnN0YWVkdGxlciA8emVoYUBkZWJpYW4ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvcmRvYy9nZW5lcmF0b3Iv
anNvbl9pbmRleC5yYiBiL2xpYi9yZG9jL2dlbmVyYXRvci9qc29uX2luZGV4LnJiCi1pbmRleCBj
NDU0OTEwLi4yNGZlYWIwIDEwMDY0NAoraW5kZXggMDY1Y2FhNC4uY2ZhMWYzMyAxMDA2NDQKIC0t
LSBhL2xpYi9yZG9jL2dlbmVyYXRvci9qc29uX2luZGV4LnJiCiArKysgYi9saWIvcmRvYy9nZW5l
cmF0b3IvanNvbl9pbmRleC5yYgotQEAgLTE3OCw3ICsxNzgsNyBAQCBjbGFzcyBSRG9jOjpHZW5l
cmF0b3I6Okpzb25JbmRleAorQEAgLTE3Niw3ICsxNzYsNyBAQCBjbGFzcyBSRG9jOjpHZW5lcmF0
b3I6Okpzb25JbmRleAogICAgICBkZWJ1Z19tc2cgIldyaXRpbmcgZ3ppcHBlZCBzZWFyY2ggaW5k
ZXggdG8gJXMiICUgb3V0ZmlsZQogIAogICAgICBabGliOjpHemlwV3JpdGVyLm9wZW4ob3V0Zmls
ZSkgZG8gfGd6fApAQCAtMjYsNyArMjYsNyBAQCBpbmRleCBjNDU0OTEwLi4yNGZlYWIwIDEwMDY0
NAogICAgICAgIGd6Lm9yaWdfbmFtZSA9IHNlYXJjaF9pbmRleF9maWxlLmJhc2VuYW1lLnRvX3MK
ICAgICAgICBnei53cml0ZSBzZWFyY2hfaW5kZXgKICAgICAgICBnei5jbG9zZQotQEAgLTE5Niw3
ICsxOTYsNyBAQCBjbGFzcyBSRG9jOjpHZW5lcmF0b3I6Okpzb25JbmRleAorQEAgLTE5NCw3ICsx
OTQsNyBAQCBjbGFzcyBSRG9jOjpHZW5lcmF0b3I6Okpzb25JbmRleAogICAgICAgICAgZGVidWdf
bXNnICJXcml0aW5nIGd6aXBwZWQgZmlsZSB0byAlcyIgJSBvdXRmaWxlCiAgCiAgICAgICAgICBa
bGliOjpHemlwV3JpdGVyLm9wZW4ob3V0ZmlsZSkgZG8gfGd6fApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1v
YmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1n
ZW5lcmF0ZWQtTS5wYXRjaAppbmRleCA0YjY3NzFmZDI2Li5kODk3ZjY0ZDk2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1s
aXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVj
dC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDg4N2Zh
Y2M0Y2E1YmNiMDI4MGIwMjViMzViYmMxODUyOGU1MjkxNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZDI1YzI0MWNmOTIyYTYxNDliMDk2ZTA4ZTIwZjM5YzY0NmExNzNhZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJlaW5lciBIZXJybWFubiA8cmVpbmVyQHJlaW5lci1o
LmRlPgogRGF0ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTowNjoxMyAtMDMwMAogU3ViamVjdDogW1BB
VENIXSBsaWIvbWttZi5yYjogc29ydCBsaXN0IG9mIG9iamVjdCBmaWxlcyBpbiBnZW5lcmF0ZWQg
TWFrZWZpbGUKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTogUmVpbmVyIEhlcnJtYW5u
IDxyZWluZXJAcmVpbmVyLWguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvbWttZi5yYiBiL2xpYi9ta21mLnJiCi1p
bmRleCA3NjhhMTUyLi5mMTZjZGQ4IDEwMDY0NAoraW5kZXggOTlmMzc2NC4uNjIzNzdiNiAxMDA2
NDQKIC0tLSBhL2xpYi9ta21mLnJiCiArKysgYi9saWIvbWttZi5yYgogQEAgLTI0ODAsNyArMjQ4
MCw3IEBAIExPQ0FMX0xJQlMgPSAjeyRMT0NBTF9MSUJTfQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hh
bmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUt
dG9vLnBhdGNoCmluZGV4IDE5MGViN2Q3MjguLjIwNjFmYjhkYzEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxl
LWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5n
LTc4NDIyNS10b28ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk3MDUxYmU5Y2I5MzE3ZDJj
NGQ2MWE4MmQ2ZDk1MzgwOWU5NjJmMTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVh
NDU5M2FiYWM0NmRmOGM5ODkyMjFhMDk3M2FlMGFkM2JmN2NiNGIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJpYW4ub3JnPgogRGF0
ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2Ug
Z2Vtc3BlY3MgcmVwcm9kdWNpYmxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUu
cGF0Y2gKaW5kZXggMTIxYmRjZjNhYi4uYmU3MzcyYTk1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNw
ZWNzLXJlcHJvZHVjaWJsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDU4YmRhY2EzZDUz
NzlhZmNiOTU0YmI1N2M2OTBjNzczNjgwN2VjNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMDIzZTA2ZDNkZjQ0MjU5ODNmYjdlMTFhODQyYTcwNjI3MDU2OTlmNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEx1Y2FzIEthbmFzaGlybyA8a2FuYXNoaXJvQGRlYmlhbi5vcmc+
CiBEYXRlOiBGcmksIDEgTm92IDIwMTkgMTU6MjU6MTcgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0g
TWFrZSBnZW1zcGVjcyByZXByb2R1Y2libGUKQEAgLTY0LDcgKzY0LDcgQEAgaW5kZXggNTcxOWY4
My4uZmU3NjI2MCAxMDA2NDQKICAgIHNwZWMuZW1haWwgICAgICAgICA9IFsia251QGlkYWVtb25z
Lm9yZyIsICJ1bWVAbWFob3JvYmEub3JnIl0KICAKIGRpZmYgLS1naXQgYS9saWIvcmRvYy9yZG9j
LmdlbXNwZWMgYi9saWIvcmRvYy9yZG9jLmdlbXNwZWMKLWluZGV4IDMxNDRkZjUuLjY1YzMxM2Yg
MTAwNjQ0CitpbmRleCA0N2Y0ODAyLi5jZjBiNWY3IDEwMDY0NAogLS0tIGEvbGliL3Jkb2MvcmRv
Yy5nZW1zcGVjCiArKysgYi9saWIvcmRvYy9yZG9jLmdlbXNwZWMKIEBAIC03LDYgKzcsNyBAQCBl
bmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lw
LXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lv
bnMtdGVzdC11bmRlci1yb290LnBhdGNoCmluZGV4IGUzNTc0ZjFhODEuLjU0MTJiMmY4YmUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rf
cm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25z
LXRlc3QtdW5kZXItcm9vdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWM0NzQ4YWFlNGY2
OTM5MGEzNjg3NWFhMjdkNzBjM2M2MzJhZTk0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gYmViOTIzZmE4ZDdhN2MwYTQyM2U3NTIzZTkyYzA2YzFkNWEwODVjYSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBNb24sIDcgSnVsIDIwMjUgMTU6MDU6NTcgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gU2tpcCB0ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMgdGVzdCB1bmRlciByb290CkBAIC0y
Nyw2ICsyNywzIEBAIGluZGV4IGQyMDk2YTAuLjgwZTMzNjggMTAwNjQ0CiAgCiAgICAgIG1rZGly
ICd0bXBkYXRhZGlyJwogICAgICB0b3VjaCAndG1wZGF0YWRpci90bXBkYXRhJwotLS0gCi0yLjM0
LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQuNC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjUuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQu
NC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQuNS5iYgpp
bmRleCBjNTMyNDAzMzM5Li5iNzdkNzY1NzhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5XzMuNC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnlfMy40LjUuYmIKQEAgLTQ5LDcgKzQ5LDcgQEAgZG9fY29uZmlndXJlOnByZXBlbmQoKSB7
CiAKIERFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIgbGlidWNvbnRleHQiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJhMDU5N2JmZGYzMTJlMDEwZWZkMWVmZmFhOGQ3ZjFkNzgzMzE0NmZkYzE3
OTUwY2FhODE1OGZmYTNkY2JmYTg1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFkODhkOGEyN2I0
NDJmZGRlNGFhMDZkYzk5ZTg2YjBiYmYwYjI4ODk2M2Q4NDMzMTEyZGQ1ZmFjNzk4ZmQ1ZWUiCiAK
IFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHICs9ICIke0BiYi51dGlscy5maWx0
ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9IgotLSAKMi40Ny4xCgo=

--===============5600452457109151469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.4.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch" to "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.5.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixi
 ng-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0/debug/.debug -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0/debug/.debug, removed "/usr/lib/.debug/libruby.so.3.4.4", added "/usr/lib/.debug/libruby.so.3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 12008656 to 12019752 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: FILELIST: added "/usr/include/ruby-3.4.0/ruby/internal/attr/nonstring.h"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1588846 to 1590267 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: removed "/usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_document.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_label.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_markup.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot_po.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_context_section.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_hard_break.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_block_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_extend.rb /usr/lib/ruby/ptest/lib/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml /usr/lib/ruby/ptest/test/rdoc/test_rdoc_store.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_encoding.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_indented_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_marku
 p_to_rdoc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_ansi.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_method_attr.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_comment.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_context.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_joined_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_cross_reference.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_table_of_contents.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_require.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_heading.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_stats.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_include.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_prism_ruby.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_normal_module.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_rd.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_ri.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_simple.rb /usr/lib/ru
 by/ptest/test/rdoc/test_rdoc_rd_inline_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_tom_doc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot_po_entry.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_bs.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rdoc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_text.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_top_level.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_attr.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_pre_process.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_normal_class.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_any_method.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rubygems_hook.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_i18n_text.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_c.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_task.rb /usr/lib/ruby/ptest/test/rdoc/test_rdo
 c_token_stream.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_tt_only.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_attribute_manager.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_raw.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_formatter.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_constant.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_code_object.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_verbatim.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_i18n_locale.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_options.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_include.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html_crossref.rb /usr/lib/ruby/ptest/lib/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml /usr/lib/ruby/ptest/test/rdoc/test_rdoc_ge
 nerator_json_index.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html_snippet.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_darkfish.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_ri_driver.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_inline.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_attributes.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_changelog.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_alias.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_ri_paths.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_servlet.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_single_class.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_ruby.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_class_module.rb", added "/usr/lib/ruby/ptest/test/rdoc/rdoc_markdown_test_test.rb /usr/lib/ruby/ptest/lib/rdoc/markdown/.document /usr/lib/ruby/ptest/test/rdoc/rdoc_normal_class_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_hard_break_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_parser_test.rb /usr/lib/ruby
 /ptest/test/rdoc/rdoc_markup_attribute_manager_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_code_object_test.rb /usr/lib/ruby/include/ruby/internal/attr/nonstring.h /usr/lib/ruby/ptest/test/rdoc/rdoc_i18n_locale_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_top_level_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_inline_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_context_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_rdoc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_indented_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_rd_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_label_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_attributes_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_comment_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_prism_ruby_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_json_index_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_
 block_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_tom_doc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_po_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_ruby_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_simple_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_document_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_method_attr_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_alias_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_stats_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_store_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_c_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_context_section_test.rb /usr/lib/ruby/ptest/lib/rdoc/rd/.document /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_crossref_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_include_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_test.rb
  /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_joined_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_attr_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rdoc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_task_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_text_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_single_class_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_table_of_contents_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_extend_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_require_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_normal_module_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_any_method_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_snippet_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_pre_process_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_ri_driver_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_constant_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markdown_test.rb /usr/lib/ruby/ptest/test/prism/errors/defined_empty.t
 xt /usr/lib/ruby/ptest/test/rdoc/rdoc_encoding_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_inline_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_raw_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_changelog_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_servlet_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_heading_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_i18n_text_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_tt_only_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_markup_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_options_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_ansi_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_bs_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_cross_reference_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_verbatim_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_formatter_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_include_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_darkfish_test.rb /usr/lib/ruby/ptest/test/rdoc
 /rdoc_rubygems_hook_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_ri_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_class_module_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_token_stream_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_po_entry_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_ri_paths_test.rb"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 13654579 to 13682044 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: FILELIST: removed "/usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGSIZE changed from 1931342 to 1934879 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 4256123 to 4263485 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "3.4.4" to "3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0/debug -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/exe -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/exe, directory renamed /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.10.0/exe -> /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.14.0/exe, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/misc -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/misc, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib/debug/dap_custom -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib/debug/dap_custom, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib, directory renamed /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.7/exe -> /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.9/exe, directory renamed /usr/lib/ruby/gems/
 3.4.0/gems/debug-1.10.0 -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib/debug -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/ext/debug -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/ext/debug, directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0 -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0, removed "/usr/lib/ruby/3.4.0/rubygems/shellwords.rb /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.0.gemspec /usr/lib/ruby/gems/3.4.0/cache/debug-1.10.0.gem /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/debug-1.10.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.1.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.10.0.g
 emspec /usr/lib/libruby.so.3.4.4 /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.5.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.1.gemspec", added "/usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.2.gemspec /usr/lib/ruby/gems/3.4.0/cache/debug-1.11.0.gem /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.14.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.9.gemspec /usr/lib/ruby/3.4.0/bundler/cli/doctor/diagnose.rb /usr/lib/ruby/3.4.0/bundler/cli/doctor/ssl.rb /usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.1.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/debug-1.11.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.6.gemspec /usr/lib/libruby.so.3.4.5"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 3.4.4 [default] to 3.4.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 30779998 to 30800372 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "3.4.4" to "3.4.5"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
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

--===============5600452457109151469==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.4.4-3.4.5.patch"

RnJvbSAzNTMyYWYyMmQzYTg3MDk5ZTFhOTdjYTQ2NmRjOGEyMDMyMGNkZTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxOTowMDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1
Ynk6IHVwZ3JhZGUgMy40LjQgLT4gMy40LjUKCi0tLQogLi4uMDAxLWV4dG1rLWZpeC1jcm9zcy1j
b21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIHwgNCArKy0tCiAuLi5tX2R1bXAuYy1E
ZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggfCA0ICsrLS0KIC4u
Li9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoICB8
IDIgKy0KIC4uLi9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlv
bi5wYXRjaCB8IDggKysrKy0tLS0KIC4uLm1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxl
cy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCB8IDQgKystLQogLi4ucmstR2Vtc3BlYy1yZXByb2R1Y2li
bGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIHwgMiArLQogLi4uL3J1YnkvcnVieS8w
MDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoICAgICAgIHwgNCArKy0tCiAuLi4w
Ny1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2ggfCA1
ICstLS0tCiAuLi4vcnVieS97cnVieV8zLjQuNC5iYiA9PiBydWJ5XzMuNC41LmJifSAgICAgICAg
ICAgICAgICAgfCAyICstCiA5IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzMuNC40
LmJiID0+IHJ1YnlfMy40LjUuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRl
cm5hbC1nZW1zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4
dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCmluZGV4IGYx
Nzk3MGU5YzkuLmNkZDdlOGY4OGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vt
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWst
Zml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDAzNzAwZWMyNTY3ODllMDJkZTIwYjU4YmNhMDgwYzZmZWY1OTIzMzYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEwNWQ1MTYzMDY2YmNkNDY2ZjgzZTM5ZmM5NDZlZTYw
OWFjNzUyNGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW5kcj1D
Mz1BOT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogRGF0ZTogTW9uLCAzMCBT
ZXAgMjAxOSAxNjo1NzowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBleHRtazogZml4IGNyb3Nz
LWNvbXBpbGF0aW9uIG9mIGV4dGVybmFsIGdlbXMKQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVkLW9m
Zi1ieTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2V4dC9l
eHRtay5yYiBiL2V4dC9leHRtay5yYgotaW5kZXggOGI2YjM2NS4uMzA0OGY3NSAxMDA3NTUKK2lu
ZGV4IDFkMTY1NDUuLmFkOTcxZWEgMTAwNzU1CiAtLS0gYS9leHQvZXh0bWsucmIKICsrKyBiL2V4
dC9leHRtay5yYgogQEAgLTQzNCw4ICs0MzQsOCBAQCBlbHNlCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5k
LVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJp
c2N2LnBhdGNoCmluZGV4IDc5OTMyNGNhZWEuLjYwNDZjZDliNjMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1h
bmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1t
dXNsLXJpc2N2LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOTkyZDc4MWUwNWI2MTQ4OWJk
ZjVhMmE5YWVlNmNjNjE2ZjE3NDJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NTY5
NWJkMjA1YjFiZWQwMDdjOTFkNGM1MzQxZWJkOTViMDgyZGVlIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjUg
SmFuIDIwMjIgMjA6Mjk6MTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdm1fZHVtcC5jOiBEZWZp
bmUgUkVHX1MxIGFuZCBSRUdfUzIgZm9yIG11c2wvcmlzY3YKQEAgLTE0LDcgKzE0LDcgQEAgU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS92bV9kdW1wLmMgYi92bV9kdW1wLmMK
LWluZGV4IDU4NzNlNTIuLjllYjRkYjEgMTAwNjQ0CitpbmRleCA5OTMzOWZkLi44YzViYjAzIDEw
MDY0NAogLS0tIGEvdm1fZHVtcC5jCiArKysgYi92bV9kdW1wLmMKIEBAIC00MCw2ICs0MCwxMSBA
QApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXkt
TERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1Ynku
cGF0Y2gKaW5kZXggODRmZTlhZWUzZC4uM2NjNzUzNzIyYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2Yt
bGlicnVieS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDIt
T2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAyNjI1ZjZjMTU1MTA1ZDM1MmQ2YTFmZjNhNzIyZTc4OTY0MzFmZjkxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxNDZkNjM5NGIxZTYyNDNhYjI4MDQ4ZDEyMTM1OTJjYzE4
MWNlY2E1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0b3BoZXIgTGFyc29u
IDxjaHJpc19sYXJzb25AbWVudG9yLmNvbT4KIERhdGU6IFRodSwgNSBNYXkgMjAxNiAxMDo1OTow
NyAtMDcwMAogU3ViamVjdDogW1BBVENIXSBPYmV5IExERkxBR1MgZm9yIHRoZSBsaW5rIG9mIGxp
YnJ1YnkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1y
ZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50
YXRpb24ucGF0Y2gKaW5kZXggODdhMWU4MjUxNi4uYjc5YWQxMjMwZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxl
LWRvY3VtZW50YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDk4MDcxYzBiMjhhNDVjZDIxYTJjYmU2NzQ2Y2UzOTA2NzkzMmI2MmYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY2ZWEzNzAyNzc4ZGEzMjBlYTdiYmQ2MGZi
ZGEzOTM2OTBlZDBmODUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaHJpc3RpYW4g
SG9mc3RhZWR0bGVyIDx6ZWhhQGRlYmlhbi5vcmc+CiBEYXRlOiBUdWUsIDEwIE9jdCAyMDE3IDE1
OjA0OjM0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJkb2M6IGJ1aWxkIHJlcHJvZHVjaWJsZSBk
b2N1bWVudGF0aW9uCkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEhvZnN0YWVkdGxlciA8emVoYUBkZWJpYW4ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvcmRvYy9nZW5lcmF0
b3IvanNvbl9pbmRleC5yYiBiL2xpYi9yZG9jL2dlbmVyYXRvci9qc29uX2luZGV4LnJiCi1pbmRl
eCBjNDU0OTEwLi4yNGZlYWIwIDEwMDY0NAoraW5kZXggMDY1Y2FhNC4uY2ZhMWYzMyAxMDA2NDQK
IC0tLSBhL2xpYi9yZG9jL2dlbmVyYXRvci9qc29uX2luZGV4LnJiCiArKysgYi9saWIvcmRvYy9n
ZW5lcmF0b3IvanNvbl9pbmRleC5yYgotQEAgLTE3OCw3ICsxNzgsNyBAQCBjbGFzcyBSRG9jOjpH
ZW5lcmF0b3I6Okpzb25JbmRleAorQEAgLTE3Niw3ICsxNzYsNyBAQCBjbGFzcyBSRG9jOjpHZW5l
cmF0b3I6Okpzb25JbmRleAogICAgICBkZWJ1Z19tc2cgIldyaXRpbmcgZ3ppcHBlZCBzZWFyY2gg
aW5kZXggdG8gJXMiICUgb3V0ZmlsZQogIAogICAgICBabGliOjpHemlwV3JpdGVyLm9wZW4ob3V0
ZmlsZSkgZG8gfGd6fApAQCAtMjYsNyArMjYsNyBAQCBpbmRleCBjNDU0OTEwLi4yNGZlYWIwIDEw
MDY0NAogICAgICAgIGd6Lm9yaWdfbmFtZSA9IHNlYXJjaF9pbmRleF9maWxlLmJhc2VuYW1lLnRv
X3MKICAgICAgICBnei53cml0ZSBzZWFyY2hfaW5kZXgKICAgICAgICBnei5jbG9zZQotQEAgLTE5
Niw3ICsxOTYsNyBAQCBjbGFzcyBSRG9jOjpHZW5lcmF0b3I6Okpzb25JbmRleAorQEAgLTE5NCw3
ICsxOTQsNyBAQCBjbGFzcyBSRG9jOjpHZW5lcmF0b3I6Okpzb25JbmRleAogICAgICAgICAgZGVi
dWdfbXNnICJXcml0aW5nIGd6aXBwZWQgZmlsZSB0byAlcyIgJSBvdXRmaWxlCiAgCiAgICAgICAg
ICBabGliOjpHemlwV3JpdGVyLm9wZW4ob3V0ZmlsZSkgZG8gfGd6fApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1v
Zi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1p
bi1nZW5lcmF0ZWQtTS5wYXRjaAppbmRleCA0YjY3NzFmZDI2Li5kODk3ZjY0ZDk2IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29y
dC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9i
amVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDg4
N2ZhY2M0Y2E1YmNiMDI4MGIwMjViMzViYmMxODUyOGU1MjkxNCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZDI1YzI0MWNmOTIyYTYxNDliMDk2ZTA4ZTIwZjM5YzY0NmExNzNhZCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJlaW5lciBIZXJybWFubiA8cmVpbmVyQHJlaW5l
ci1oLmRlPgogRGF0ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTowNjoxMyAtMDMwMAogU3ViamVjdDog
W1BBVENIXSBsaWIvbWttZi5yYjogc29ydCBsaXN0IG9mIG9iamVjdCBmaWxlcyBpbiBnZW5lcmF0
ZWQgTWFrZWZpbGUKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTogUmVpbmVyIEhlcnJt
YW5uIDxyZWluZXJAcmVpbmVyLWguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvbWttZi5yYiBiL2xpYi9ta21mLnJi
Ci1pbmRleCA3NjhhMTUyLi5mMTZjZGQ4IDEwMDY0NAoraW5kZXggOTlmMzc2NC4uNjIzNzdiNiAx
MDA2NDQKIC0tLSBhL2xpYi9ta21mLnJiCiArKysgYi9saWIvbWttZi5yYgogQEAgLTI0ODAsNyAr
MjQ4MCw3IEBAIExPQ0FMX0xJQlMgPSAjeyRMT0NBTF9MSUJTfQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUt
Y2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQy
MjUtdG9vLnBhdGNoCmluZGV4IDE5MGViN2Q3MjguLjIwNjFmYjhkYzEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNp
YmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4
aW5nLTc4NDIyNS10b28ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk3MDUxYmU5Y2I5MzE3
ZDJjNGQ2MWE4MmQ2ZDk1MzgwOWU5NjJmMTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGVhNDU5M2FiYWM0NmRmOGM5ODkyMjFhMDk3M2FlMGFkM2JmN2NiNGIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJpYW4ub3JnPgog
RGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1h
a2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2li
bGUucGF0Y2gKaW5kZXggMTIxYmRjZjNhYi4uYmU3MzcyYTk1NCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxl
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdl
bXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDU4YmRhY2Ez
ZDUzNzlhZmNiOTU0YmI1N2M2OTBjNzczNjgwN2VjNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMDIzZTA2ZDNkZjQ0MjU5ODNmYjdlMTFhODQyYTcwNjI3MDU2OTlmNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEx1Y2FzIEthbmFzaGlybyA8a2FuYXNoaXJvQGRlYmlhbi5v
cmc+CiBEYXRlOiBGcmksIDEgTm92IDIwMTkgMTU6MjU6MTcgLTAzMDAKIFN1YmplY3Q6IFtQQVRD
SF0gTWFrZSBnZW1zcGVjcyByZXByb2R1Y2libGUKQEAgLTY0LDcgKzY0LDcgQEAgaW5kZXggNTcx
OWY4My4uZmU3NjI2MCAxMDA2NDQKICAgIHNwZWMuZW1haWwgICAgICAgICA9IFsia251QGlkYWVt
b25zLm9yZyIsICJ1bWVAbWFob3JvYmEub3JnIl0KICAKIGRpZmYgLS1naXQgYS9saWIvcmRvYy9y
ZG9jLmdlbXNwZWMgYi9saWIvcmRvYy9yZG9jLmdlbXNwZWMKLWluZGV4IDMxNDRkZjUuLjY1YzMx
M2YgMTAwNjQ0CitpbmRleCA0N2Y0ODAyLi5jZjBiNWY3IDEwMDY0NAogLS0tIGEvbGliL3Jkb2Mv
cmRvYy5nZW1zcGVjCiArKysgYi9saWIvcmRvYy9yZG9jLmdlbXNwZWMKIEBAIC03LDYgKzcsNyBA
QCBlbmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1T
a2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlz
c2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoCmluZGV4IGUzNTc0ZjFhODEuLjU0MTJiMmY4YmUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRl
c3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Np
b25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWM0NzQ4YWFl
NGY2OTM5MGEzNjg3NWFhMjdkNzBjM2M2MzJhZTk0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gYmViOTIzZmE4ZDdhN2MwYTQyM2U3NTIzZTkyYzA2YzFkNWEwODVjYSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRy
aXZlci5jb20+CiBEYXRlOiBNb24sIDcgSnVsIDIwMjUgMTU6MDU6NTcgKzA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gU2tpcCB0ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMgdGVzdCB1bmRlciByb290CkBA
IC0yNyw2ICsyNywzIEBAIGluZGV4IGQyMDk2YTAuLjgwZTMzNjggMTAwNjQ0CiAgCiAgICAgIG1r
ZGlyICd0bXBkYXRhZGlyJwogICAgICB0b3VjaCAndG1wZGF0YWRpci90bXBkYXRhJwotLS0gCi0y
LjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQu
NC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjUuYmIKc2ltaWxhcml0
eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8z
LjQuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjQuNS5i
YgppbmRleCBjNTMyNDAzMzM5Li5iNzdkNzY1NzhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnlfMy40LjUuYmIKQEAgLTQ5LDcgKzQ5LDcgQEAgZG9fY29uZmlndXJlOnByZXBlbmQo
KSB7CiAKIERFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIgbGlidWNvbnRleHQiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhMDU5N2JmZGYzMTJlMDEwZWZkMWVmZmFhOGQ3ZjFkNzgzMzE0NmZk
YzE3OTUwY2FhODE1OGZmYTNkY2JmYTg1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFkODhkOGEy
N2I0NDJmZGRlNGFhMDZkYzk5ZTg2YjBiYmYwYjI4ODk2M2Q4NDMzMTEyZGQ1ZmFjNzk4ZmQ1ZWUi
CiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHICs9ICIke0BiYi51dGlscy5m
aWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9IgotLSAKMi40Ny4xCgo=

--===============5600452457109151469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby-dev: FILELIST: added "/usr/include/ruby-3.4.0/ruby/internal/attr/nonstring.h"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: removed "/usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_verbatim.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_context_section.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_options.rb /usr/lib/ruby/ptest/lib/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml /usr/lib/ruby/ptest/test/rdoc/test_rdoc_single_class.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_include.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_attr.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_class_module.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_c.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_prism_ruby.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html_crossref.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot_po_entry.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_normal_class.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_darkfish.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_stats.rb /
 usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_formatter.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_tt_only.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_extend.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_heading.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_block_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_normal_module.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_label.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_document.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_method_attr.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html_snippet.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_attributes.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_include.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_inline.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_servlet.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_token_stream.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_code_object.rb /usr/lib/ruby/ptest/tes
 t/rdoc/test_rdoc_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_ri_paths.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_raw.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_ruby.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_i18n_locale.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_top_level.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_pre_process.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_encoding.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rubygems_hook.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_simple.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_store.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_ansi.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_html.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_rdoc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_comment.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_context.rb /usr/lib/ruby/ptest/test/r
 doc/test_rdoc_markup_hard_break.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_json_index.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_bs.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rdoc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_cross_reference.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_ri.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_changelog.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_alias.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_constant.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_table_of_contents.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_markup.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot_po.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_to_joined_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_generator_pot.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_task.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup.rb /usr
 /lib/ruby/ptest/test/rdoc/test_rdoc_any_method.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_rd_inline_parser.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_rd.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_ri_driver.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_indented_paragraph.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_parser_markdown.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_text.rb /usr/lib/ruby/ptest/lib/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml /usr/lib/ruby/ptest/test/rdoc/test_rdoc_tom_doc.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_markup_attribute_manager.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_require.rb /usr/lib/ruby/ptest/test/rdoc/test_rdoc_i18n_text.rb", added "/usr/lib/ruby/ptest/test/rdoc/rdoc_options_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_normal_module_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_code_object_test.rb /usr/lib/ruby/ptest/test/r
 doc/rdoc_normal_class_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_alias_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_label_test.rb /usr/lib/ruby/ptest/lib/rdoc/rd/.document /usr/lib/ruby/ptest/test/rdoc/rdoc_stats_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_store_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_ri_driver_test.rb /usr/lib/ruby/include/ruby/internal/attr/nonstring.h /usr/lib/ruby/ptest/test/rdoc/rdoc_ri_paths_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_pre_process_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_markup_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_document_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_tom_doc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_include_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_context_section_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_crossref_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_
 generator_darkfish_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_context_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_i18n_text_test.rb /usr/lib/ruby/ptest/lib/rdoc/markdown/.document /usr/lib/ruby/ptest/test/rdoc/rdoc_constant_test.rb /usr/lib/ruby/ptest/test/prism/errors/defined_empty.txt /usr/lib/ruby/ptest/test/rdoc/rdoc_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_rdoc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_inline_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_formatter_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_rd_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_attribute_manager_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_bs_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_comment_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rubygems_hook_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_attr_test.rb /usr/lib/ruby/ptest/test/rd
 oc/rdoc_rdoc_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_task_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_text_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_tt_only_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_pot_po_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_hard_break_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_markdown_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_any_method_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_indented_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_verbatim_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_simple_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_inline_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_rd_block_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_ruby_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_class_module_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_token_stream_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_ri_test.rb /usr/lib/ruby/p
 test/test/rdoc/rdoc_generator_pot_po_entry_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_changelog_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_joined_paragraph_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_c_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_html_snippet_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_i18n_locale_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_servlet_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_include_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_ansi_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_generator_json_index_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_encoding_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_extend_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_cross_reference_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_top_level_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_parser_prism_ruby_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markdown_test_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_to_table_of_contents_test.rb /usr/lib/ruby/pt
 est/test/rdoc/rdoc_method_attr_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_raw_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_single_class_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_require_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_parser_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_attributes_test.rb /usr/lib/ruby/ptest/test/rdoc/rdoc_markup_heading_test.rb"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: FILELIST: removed "/usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_in_files.rhtml /usr/lib/ruby/3.4.0/rdoc/generator/template/darkfish/_sidebar_VCS_info.rhtml"
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/misc -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/misc, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/ext/debug -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/ext/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib/debug -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib/debug/dap_custom -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib/debug/dap_custom, directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0/debug -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0/debug, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0 -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/exe -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/exe, directory renamed /us
 r/lib/ruby/gems/3.4.0/gems/bundler-2.6.7/exe -> /usr/lib/ruby/gems/3.4.0/gems/bundler-2.6.9/exe, directory renamed /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.10.0 -> /usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-gnu/3.4.0/debug-1.11.0, directory renamed /usr/lib/ruby/gems/3.4.0/gems/debug-1.10.0/lib -> /usr/lib/ruby/gems/3.4.0/gems/debug-1.11.0/lib, directory renamed /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.10.0/exe -> /usr/lib/ruby/gems/3.4.0/gems/rdoc-6.14.0/exe, removed "/usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.0.gemspec /usr/lib/ruby/3.4.0/rubygems/shellwords.rb /usr/lib/ruby/gems/3.4.0/cache/debug-1.10.0.gem /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.7.gemspec /usr/lib/libruby.so.3.4.4 /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/debug-1.10.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.5.gemspec /usr/lib/ruby/gems/3.4.0/specifications
 /default/rdoc-6.10.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.1.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.1.gemspec", added "/usr/lib/ruby/gems/3.4.0/specifications/default/io-console-0.8.1.gemspec /usr/lib/ruby/3.4.0/bundler/cli/doctor/diagnose.rb /usr/lib/ruby/3.4.0/bundler/cli/doctor/ssl.rb /usr/lib/ruby/gems/3.4.0/cache/debug-1.11.0.gem /usr/lib/ruby/gems/3.4.0/specifications/default/rdoc-6.14.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-nonblock-0.3.2.gemspec /usr/lib/libruby.so.3.4.5 /usr/lib/ruby/gems/3.4.0/specifications/default/resolv-0.6.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/debug-1.11.0.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/bundler-2.6.9.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/io-wait-0.3.2.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/etc-1.4.6.gemspec"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
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

--===============5600452457109151469==--

