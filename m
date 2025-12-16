Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CC6D5CCAC
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17178.1765872128910473755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IWNKNQz8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YI3SMAdU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262eb038-863cff0f-0a6d-4846-878c-bdf31b702b30-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XLA9//sIlt5ks6riuF7ENuP3/WL+eGJOhv/Zio2AMHg=;
	b=IWNKNQz8j8Pl5TC2/Jgl5b3IbsaMHMbYn5SJbvWFnmDKzENaGDCRe/g4YLerKZNv
	1dBUChcig+sjLUuWG+/CC0ZR/1BGq/LyYN9AWhlte9J7a9q4RFNq2pBrl/g+0n86Hw+
	H9sbJEiVcDGX/16vAsvzvTe88TW1/s1tJMaBgRNI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XLA9//sIlt5ks6riuF7ENuP3/WL+eGJOhv/Zio2AMHg=;
	b=YI3SMAdUXd759Na8EDore9fjQrxbTcFuSCXsn7xikb1KoySq3nVIK4EgRj/GdWt2
	TCgRxeQo7exkocnEJTXFOZSK9dWroDqMN03RdJZswxYrB188bIV9uOPgGYZDgA118Kc
	lI4Z6v1igPuCPvfZk64Q/Omz/ErolmKivGzf4J34=
Content-Type: multipart/mixed; boundary="===============1508597782014271058=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.4.7 SUCCEEDED
Message-ID: <0101019b262eb038-863cff0f-0a6d-4846-878c-bdf31b702b30-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227840

--===============1508597782014271058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpydWJ5KiB0byAqMy40LjcqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXJ1YnktdXBncmFkZS0zLjQuNS0zLjQuNy5wYXRj
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
bSA1ZjQ3MmZhMjQzZDUzOGY3Zjc4NDYwZmQyN2M0NWYzMTQwZjU4Yzk5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRh
dGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDI6MTE6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBydWJ5
OiB1cGdyYWRlIDMuNC41IC0+IDMuNC43CgotLS0KIC4uLjAwMS1leHRtay1maXgtY3Jvc3MtY29t
cGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCB8IDQgKystLQogLi4ubV9kdW1wLmMtRGVm
aW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIHwgNCArKy0tCiAuLi4v
cnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCAgfCA0
ICsrLS0KIC4uLi9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlv
bi5wYXRjaCB8IDggKysrKy0tLS0KIC4uLm1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxl
cy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCB8IDQgKystLQogLi4ucmstR2Vtc3BlYy1yZXByb2R1Y2li
bGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIHwgMiArLQogLi4uL3J1YnkvcnVieS8w
MDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoICAgICAgIHwgNCArKy0tCiAuLi4w
Ny1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2ggfCA1
ICstLS0tCiAuLi4vcnVieS97cnVieV8zLjQuNS5iYiA9PiBydWJ5XzMuNC43LmJifSAgICAgICAg
ICAgICAgICAgfCAyICstCiA5IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIwIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzMuNC41
LmJiID0+IHJ1YnlfMy40LjcuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRl
cm5hbC1nZW1zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4
dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCmluZGV4IGYx
Nzk3MGU5YzkuLmRjMzNmYTlkODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vt
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWst
Zml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDAzNzAwZWMyNTY3ODllMDJkZTIwYjU4YmNhMDgwYzZmZWY1OTIzMzYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJkMTk4MDZlMWQyMjFkZjk0MDBiMjViZDY3ZjNlMGI3
YTIxYmI3MDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW5kcj1D
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
c2N2LnBhdGNoCmluZGV4IDc5OTMyNGNhZWEuLjRmODFkMGExOWQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1h
bmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1t
dXNsLXJpc2N2LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOTkyZDc4MWUwNWI2MTQ4OWJk
ZjVhMmE5YWVlNmNjNjE2ZjE3NDJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhNWMy
NzgyNmU3NTYxZWFmY2I4ZGFiMDYxZTA3MzQ5MjMyNDU3ZjEwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
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
cGF0Y2gKaW5kZXggODRmZTlhZWUzZC4uOGVmMGM5MDNlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2Yt
bGlicnVieS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDIt
T2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAyNjI1ZjZjMTU1MTA1ZDM1MmQ2YTFmZjNhNzIyZTc4OTY0MzFmZjkxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzOTQ5YjNmZjAxYzY0MmI2YjlhZGE5YjEyZGQzMDgzY2M5
MzA1NDRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0b3BoZXIgTGFyc29u
IDxjaHJpc19sYXJzb25AbWVudG9yLmNvbT4KIERhdGU6IFRodSwgNSBNYXkgMjAxNiAxMDo1OTow
NyAtMDcwMAogU3ViamVjdDogW1BBVENIXSBPYmV5IExERkxBR1MgZm9yIHRoZSBsaW5rIG9mIGxp
YnJ1YnkKQEAgLTEwLDcgKzEwLDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90
ZW1wbGF0ZS9NYWtlZmlsZS5pbiBiL3RlbXBsYXRlL01ha2VmaWxlLmluCi1pbmRleCA4Zjk5NmI4
Li5jNzA4YjY0IDEwMDY0NAoraW5kZXggNmI5NzI3OS4uYTQ5YjUzZCAxMDA2NDQKIC0tLSBhL3Rl
bXBsYXRlL01ha2VmaWxlLmluCiArKysgYi90ZW1wbGF0ZS9NYWtlZmlsZS5pbgogQEAgLTEyMCw3
ICsxMjAsNyBAQCBFTkFCTEVfU0hBUkVEID0gQEVOQUJMRV9TSEFSRURACmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2li
bGUtZG9jdW1lbnRhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCmluZGV4IDg3
YTFlODI1MTYuLjkwYjJhZWU3ZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJl
cHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ODA3
MWMwYjI4YTQ1Y2QyMWEyY2JlNjc0NmNlMzkwNjc5MzJiNjJmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAyZTE0MGZlYTZjMjc1ZjMyNTg4OTNkMmRhMjQ4MDAyN2IxNmVmYjkyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0aWFuIEhvZnN0YWVkdGxlciA8emVoYUBk
ZWJpYW4ub3JnPgogRGF0ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTowNDozNCAtMDMwMAogU3ViamVj
dDogW1BBVENIXSByZG9jOiBidWlsZCByZXByb2R1Y2libGUgZG9jdW1lbnRhdGlvbgpAQCAtMTQs
MTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFA
ZGViaWFuLm9yZz4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvbGliL3Jkb2MvZ2VuZXJhdG9yL2pzb25faW5kZXgucmIgYi9s
aWIvcmRvYy9nZW5lcmF0b3IvanNvbl9pbmRleC5yYgotaW5kZXggYzQ1NDkxMC4uMjRmZWFiMCAx
MDA2NDQKK2luZGV4IDA2NWNhYTQuLmNmYTFmMzMgMTAwNjQ0CiAtLS0gYS9saWIvcmRvYy9nZW5l
cmF0b3IvanNvbl9pbmRleC5yYgogKysrIGIvbGliL3Jkb2MvZ2VuZXJhdG9yL2pzb25faW5kZXgu
cmIKLUBAIC0xNzgsNyArMTc4LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgK
K0BAIC0xNzYsNyArMTc2LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgKICAg
ICAgZGVidWdfbXNnICJXcml0aW5nIGd6aXBwZWQgc2VhcmNoIGluZGV4IHRvICVzIiAlIG91dGZp
bGUKICAKICAgICAgWmxpYjo6R3ppcFdyaXRlci5vcGVuKG91dGZpbGUpIGRvIHxnenwKQEAgLTI2
LDcgKzI2LDcgQEAgaW5kZXggYzQ1NDkxMC4uMjRmZWFiMCAxMDA2NDQKICAgICAgICBnei5vcmln
X25hbWUgPSBzZWFyY2hfaW5kZXhfZmlsZS5iYXNlbmFtZS50b19zCiAgICAgICAgZ3oud3JpdGUg
c2VhcmNoX2luZGV4CiAgICAgICAgZ3ouY2xvc2UKLUBAIC0xOTYsNyArMTk2LDcgQEAgY2xhc3Mg
UkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgKK0BAIC0xOTQsNyArMTk0LDcgQEAgY2xhc3MgUkRv
Yzo6R2VuZXJhdG9yOjpKc29uSW5kZXgKICAgICAgICAgIGRlYnVnX21zZyAiV3JpdGluZyBnemlw
cGVkIGZpbGUgdG8gJXMiICUgb3V0ZmlsZQogIAogICAgICAgICAgWmxpYjo6R3ppcFdyaXRlci5v
cGVuKG91dGZpbGUpIGRvIHxnenwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdl
bmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxp
Yi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gK
aW5kZXggNGI2NzcxZmQyNi4uNWNhMTgyMzEzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmls
ZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJh
dGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4ODdmYWNjNGNhNWJjYjAyODBiMDI1
YjM1YmJjMTg1MjhlNTI5MTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkzMjQ4OWI2
N2NlOWNkZjU1OTBhMTc5MjdlYTQwZDllYTY2MjM2NjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
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
bXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAppbmRleCAx
OTBlYjdkNzI4Li5mZDdkMzM0MGYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4
NDIyNS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1
LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NzA1MWJlOWNiOTMxN2QyYzRkNjFhODJkNmQ5NTM4MDll
OTYyZjEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0MTAzMzE1Nzc0ODFmMzMxMDc0
NDA1ZTk2MjljYThkYjUzMDNhYWE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVj
YXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAx
OSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVj
aWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1h
a2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCmluZGV4IDEyMWJk
Y2YzYWIuLmUyYzgwZTJmNmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1OGJkYWNhM2Q1Mzc5YWZjYjk1NGJiNTdjNjkw
Yzc3MzY4MDdlYzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJmM2Q4MzU5ZmZkMWFi
MDdkNTc4YzFlOTkxMTgwYmMzMWRjN2QxNDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5v
diAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVw
cm9kdWNpYmxlCkBAIC02NCw3ICs2NCw3IEBAIGluZGV4IDU3MTlmODMuLmZlNzYyNjAgMTAwNjQ0
CiAgICBzcGVjLmVtYWlsICAgICAgICAgPSBbImtudUBpZGFlbW9ucy5vcmciLCAidW1lQG1haG9y
b2JhLm9yZyJdCiAgCiBkaWZmIC0tZ2l0IGEvbGliL3Jkb2MvcmRvYy5nZW1zcGVjIGIvbGliL3Jk
b2MvcmRvYy5nZW1zcGVjCi1pbmRleCAzMTQ0ZGY1Li42NWMzMTNmIDEwMDY0NAoraW5kZXggNDdm
NDgwMi4uY2YwYjVmNyAxMDA2NDQKIC0tLSBhL2xpYi9yZG9jL3Jkb2MuZ2Vtc3BlYwogKysrIGIv
bGliL3Jkb2MvcmRvYy5nZW1zcGVjCiBAQCAtNyw2ICs3LDcgQEAgZW5kCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVy
bWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9v
dC5wYXRjaAppbmRleCBlMzU3NGYxYTgxLi43ODBiNTkwOTJmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lv
bnMtdGVzdC11bmRlci1yb290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3Qu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDljNDc0OGFhZTRmNjkzOTBhMzY4NzVhYTI3ZDcw
YzNjNjMyYWU5NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGViNWE1ZGI3NGQyOWZk
NjM2OWU5ODcxYmExYmIyNTRhYTBmMjJmNDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9u
LCA3IEp1bCAyMDI1IDE1OjA1OjU3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNraXAgdGVzdF9y
bV9yX25vX3Blcm1pc3Npb25zIHRlc3QgdW5kZXIgcm9vdApAQCAtMjcsNiArMjcsMyBAQCBpbmRl
eCBkMjA5NmEwLi44MGUzMzY4IDEwMDY0NAogIAogICAgICBta2RpciAndG1wZGF0YWRpcicKICAg
ICAgdG91Y2ggJ3RtcGRhdGFkaXIvdG1wZGF0YScKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjUuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjUuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjcuYmIKaW5kZXggYjc3ZDc2NTc4ZS4u
MmZiY2ZkMWYxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8z
LjQuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC43LmJiCkBA
IC00OSw3ICs0OSw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgewogCiBERVBFTkRTOmFwcGVu
ZDpsaWJjLW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWQ4
OGQ4YTI3YjQ0MmZkZGU0YWEwNmRjOTllODZiMGJiZjBiMjg4OTYzZDg0MzMxMTJkZDVmYWM3OThm
ZDVlZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMzgxNWE2ZDA5NTY5NmY3OTE5MDkwZmRjM2Uy
Zjk0NTliMmM4M2Q1NzIyNGIyZTQ0NmNlMWY1ZjczMzNlZjM2IgogCiBQQUNLQUdFQ09ORklHID8/
PSAiIgogUEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVS
RVMnLCAnaXB2NicsIGQpfSIKLS0gCjIuNDcuMQoK

--===============1508597782014271058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: removed "/usr/lib/ruby/ptest/test/prism/snapshots/rescue_modifier.txt", added "/usr/lib/ruby/ptest/test/prism/fixtures/it.txt /usr/lib/ruby/ptest/test/prism/result/named_capture_test.rb /usr/lib/ruby/ptest/test/prism/fixtures/heredocs_with_fake_newlines.txt /usr/lib/ruby/ptest/test/prism/errors/pattern_arithmetic_expressions.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_single_match.txt /usr/lib/ruby/ptest/test/prism/errors/command_calls_32.txt /usr/lib/ruby/ptest/test/prism/errors/command_calls_31.txt /usr/lib/ruby/ptest/test/prism/result/string_test.rb /usr/lib/ruby/ptest/test/prism/fixtures/encoding_euc_jp.txt /usr/lib/ruby/ptest/test/prism/fixtures/encoding_binary.txt /usr/lib/ruby/ptest/test/prism/fixtures/it_read_and_assignment.txt /usr/lib/ruby/ptest/test/prism/fixtures/it_assignment.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_nil_pattern.txt /usr/lib/ruby/ptest/test/
 prism/fixtures/leading_logical.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_match_alt.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/kwarg_no_paren.txt /usr/lib/ruby/ptest/test/prism/errors/xstring_concat.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_lambda.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pin_expr.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/procarg0_legacy.txt /usr/lib/ruby/ptest/test/prism/ractor_test.rb /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_explicit_array_match.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_implicit_array_match.txt /usr/lib/ruby/ptest/test/prism/errors/pattern_match_implicit_rest.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_ranges.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_const_pattern.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/block_kwarg_combinati
 ons.txt /usr/lib/ruby/ptest/test/prism/fixtures/case_in_hash_key.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/block_kwarg.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_if_unless_modifiers.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/multiple_args_with_trailing_comma.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/arg_combinations.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/find_pattern.txt /usr/lib/ruby/ptest/test/prism/api/freeze_test.rb /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/emit_arg_inside_procarg0_legacy.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/ruby_bug_19539.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_match_as.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/kwarg_combinations.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_hash.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/ruby_bug_19281.txt /usr/lib/ruby/ptest/test/prism/
 fixtures/regex_with_fake_newlines.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_keyword_variable.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_no_body.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_constants.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_expr_in_paren.txt /usr/lib/ruby/ptest/test/prism/fixtures/comment_single.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/ruby_bug_18878.txt /usr/lib/ruby/ptest/test/prism/errors/endless_method_command_call.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/block_arg_combinations.txt /usr/lib/ruby/ptest/test/prism/fixtures/endless_methods_command_call.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/marg_combinations.txt"
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: removed "/usr/lib/libruby.so.3.4.5 /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.2.0.gemspec", added "/usr/lib/ruby/3.4.0/prism/translation/parser35.rb /usr/lib/ruby/3.4.0/prism/polyfill/scan_byte.rb /usr/lib/ruby/3.4.0/prism/polyfill/warn.rb /usr/lib/libruby.so.3.4.7 /usr/lib/ruby/3.4.0/prism/polyfill/append_as_bytes.rb /usr/lib/ruby/3.4.0/prism/translation/parser_current.rb /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.4.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.5.1.gemspec /usr/lib/ruby/3.4.0/prism/translation/parser/builder.rb"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.5 to libruby.so.3.4.7
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.5 to libruby.so.3.4.7
  /usr/lib/libruby.so.3.4.5 moved to /usr/lib/libruby.so.3.4.7
  /usr/lib/ruby/gems/3.4.0/gems/prism-1.2.0 moved to /usr/lib/ruby/gems/3.4.0/gems/prism-1.5.1
  /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.3 moved to /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.4
  /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.2.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.5.1.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.4.gemspec
  /usr/lib/ruby/3.4.0/prism/polyfill/append_as_bytes.rb was added
  /usr/lib/ruby/3.4.0/prism/polyfill/scan_byte.rb was added
  /usr/lib/ruby/3.4.0/prism/polyfill/warn.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser35.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser/builder.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser_current.rb was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.5 to libruby.so.3.4.7
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.5 to libruby.so.3.4.7
  /usr/lib/libruby.so.3.4.5 moved to /usr/lib/libruby.so.3.4.7
  /usr/lib/ruby/gems/3.4.0/gems/prism-1.2.0 moved to /usr/lib/ruby/gems/3.4.0/gems/prism-1.5.1
  /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.3 moved to /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.4
  /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.2.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.5.1.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.4.gemspec
  /usr/lib/ruby/3.4.0/prism/polyfill/append_as_bytes.rb was added
  /usr/lib/ruby/3.4.0/prism/polyfill/scan_byte.rb was added
  /usr/lib/ruby/3.4.0/prism/polyfill/warn.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser35.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser/builder.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser_current.rb was added

--===============1508597782014271058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.5.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch" to "http://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.7.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixi
 ng-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch"
packages/x86-64-v3-poky-linux/ruby: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 12019696 to 11994760 (-0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.3.4.5", added "/usr/lib/.debug/libruby.so.3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1590267 to 1590281 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 13682044 to 13690520 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: removed "/usr/lib/ruby/ptest/test/prism/snapshots/rescue_modifier.txt", added "/usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_hash.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/arg_combinations.txt /usr/lib/ruby/ptest/test/prism/fixtures/regex_with_fake_newlines.txt /usr/lib/ruby/ptest/test/prism/fixtures/it_read_and_assignment.txt /usr/lib/ruby/ptest/test/prism/errors/xstring_concat.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_no_body.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_if_unless_modifiers.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_explicit_array_match.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_implicit_array_match.txt /usr/lib/ruby/ptest/test/prism/fixtures/comment_single.txt /usr/lib/ruby/ptest/test/prism/fixtures/heredocs_with_fake_newlines.txt /usr/lib/ruby/ptest/test/prism/
 fixtures/whitequark/pattern_matching_match_alt.txt /usr/lib/ruby/ptest/test/prism/ractor_test.rb /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_ranges.txt /usr/lib/ruby/ptest/test/prism/result/string_test.rb /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_nil_pattern.txt /usr/lib/ruby/ptest/test/prism/fixtures/encoding_euc_jp.txt /usr/lib/ruby/ptest/test/prism/fixtures/case_in_hash_key.txt /usr/lib/ruby/ptest/test/prism/fixtures/encoding_binary.txt /usr/lib/ruby/ptest/test/prism/errors/command_calls_31.txt /usr/lib/ruby/ptest/test/prism/errors/command_calls_32.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pin_expr.txt /usr/lib/ruby/ptest/test/prism/fixtures/it_assignment.txt /usr/lib/ruby/ptest/test/prism/errors/pattern_match_implicit_rest.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_expr_in_paren.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/find_pattern.txt /usr/lib/ruby/ptest/test/prism/fixtures
 /whitequark/multiple_args_with_trailing_comma.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/block_kwarg.txt /usr/lib/ruby/ptest/test/prism/fixtures/leading_logical.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/ruby_bug_19281.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_constants.txt /usr/lib/ruby/ptest/test/prism/errors/endless_method_command_call.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/marg_combinations.txt /usr/lib/ruby/ptest/test/prism/errors/pattern_arithmetic_expressions.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/procarg0_legacy.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/emit_arg_inside_procarg0_legacy.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_keyword_variable.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/ruby_bug_18878.txt /usr/lib/ruby/ptest/test/prism/api/freeze_test.rb /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/block_kwarg_combinations.txt /usr/
 lib/ruby/ptest/test/prism/fixtures/it.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_const_pattern.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_lambda.txt /usr/lib/ruby/ptest/test/prism/result/named_capture_test.rb /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/kwarg_combinations.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/kwarg_no_paren.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/ruby_bug_19539.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_single_match.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/pattern_matching_match_as.txt /usr/lib/ruby/ptest/test/prism/fixtures/endless_methods_command_call.txt /usr/lib/ruby/ptest/test/prism/fixtures/whitequark/block_arg_combinations.txt"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 39677658 to 39720488 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/src/debug/ruby/3.4.5/ccan/list -> /usr/src/debug/ruby/3.4.7/ccan/list, directory renamed /usr/src/debug/ruby/3.4.5/ext/coverage -> /usr/src/debug/ruby/3.4.7/ext/coverage, directory renamed /usr/src/debug/ruby/3.4.5/ext/digest/sha1 -> /usr/src/debug/ruby/3.4.7/ext/digest/sha1, directory renamed /usr/src/debug/ruby/3.4.5/ext/io/nonblock -> /usr/src/debug/ruby/3.4.7/ext/io/nonblock, directory renamed /usr/src/debug/ruby/3.4.5/ext/digest/sha2 -> /usr/src/debug/ruby/3.4.7/ext/digest/sha2, directory renamed /usr/src/debug/ruby/3.4.5/include/ruby/internal/intern -> /usr/src/debug/ruby/3.4.7/include/ruby/internal/intern, directory renamed /usr/src/debug/ruby/3.4.5/ext/strscan -> /usr/src/debug/ruby/3.4.7/ext/strscan, directory renamed /usr/src/debug/ruby/3.4.5/defs -> /usr/src/debug/ruby/3.4.7/defs, directory renamed /usr/src/debug/ruby/3.4.5/ext/io/console -> /usr/src/debug/ruby/3.4.7/ext/io/console, directory ren
 amed /usr/src/debug/ruby/3.4.5/include/ruby/internal/core -> /usr/src/debug/ruby/3.4.7/include/ruby/internal/core, directory renamed /usr/src/debug/ruby/3.4.5/ext/digest -> /usr/src/debug/ruby/3.4.7/ext/digest, directory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/missing -> /usr/src/debug/ruby/3.4.7/.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/missing, directory renamed /usr/src/debug/ruby/3.4.5/prism/util -> /usr/src/debug/ruby/3.4.7/prism/util, directory renamed /usr/src/debug/ruby/3.4.5/ext/fiddle -> /usr/src/debug/ruby/3.4.7/ext/fiddle, directory renamed /usr/src/debug/ruby/3.4.5/include/ruby/internal -> /usr/src/debug/ruby/3.4.7/include/ruby/internal, directory renamed /usr/src/debug/ruby/3.4.5/tool/ruby_vm/views -> /usr/src/debug/ruby/3.4.7/tool/ruby_vm/views, directory renamed /usr/src/debug/ruby/3.4.5/ext/fcntl -> /usr/src/debug/ruby/3.4.7/ext/fcntl, directory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8 -> /us
 r/src/debug/ruby/3.4.7/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8, directory renamed /usr/src/debug/ruby/3.4.5/prism/templates/src -> /usr/src/debug/ruby/3.4.7/prism/templates/src, directory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/nkf-0.2.0/ext/nkf -> /usr/src/debug/ruby/3.4.7/.bundle/gems/nkf-0.2.0/ext/nkf, directory renamed /usr/src/debug/ruby/3.4.5/ext/digest/rmd160 -> /usr/src/debug/ruby/3.4.7/ext/digest/rmd160, directory renamed /usr/src/debug/ruby/3.4.5/ext/digest/md5 -> /usr/src/debug/ruby/3.4.7/ext/digest/md5, directory renamed /usr/src/debug/ruby/3.4.5/ext/digest/bubblebabble -> /usr/src/debug/ruby/3.4.7/ext/digest/bubblebabble, directory renamed /usr/src/debug/ruby/3.4.5/ext/json/fbuffer -> /usr/src/debug/ruby/3.4.7/ext/json/fbuffer, directory renamed /usr/src/debug/ruby/3.4.5/ext/cgi/escape -> /usr/src/debug/ruby/3.4.7/ext/erb/escape, directory renamed /usr/src/debug/ruby/3.4.5/ext/rbconfig/sizeof -> /usr/src/debug/ruby/3.4.7/ext/rbconfig/sizeof, directory renamed /us
 r/src/debug/ruby/3.4.5/ext/zlib -> /usr/src/debug/ruby/3.4.7/ext/zlib, directory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/rbs-3.8.0/ext/rbs_extension -> /usr/src/debug/ruby/3.4.7/.bundle/gems/rbs-3.8.0/ext/rbs_extension, directory renamed /usr/src/debug/ruby/3.4.5/include/ruby/fiber -> /usr/src/debug/ruby/3.4.7/include/ruby/fiber, directory renamed /usr/src/debug/ruby/3.4.5/ext/socket -> /usr/src/debug/ruby/3.4.7/ext/socket, directory renamed /usr/src/debug/ruby/3.4.5/internal -> /usr/src/debug/ruby/3.4.7/internal, directory renamed /usr/src/debug/ruby/3.4.5/prism/templates/ext/prism -> /usr/src/debug/ruby/3.4.7/prism/templates/ext/prism, directory renamed /usr/src/debug/ruby/3.4.5/ext/continuation -> /usr/src/debug/ruby/3.4.7/ext/continuation, directory renamed /usr/src/debug/ruby/3.4.5/ext/erb/escape -> /usr/src/debug/ruby/3.4.7/ext/cgi/escape, directory renamed /usr/src/debug/ruby/3.4.5/gc/default -> /usr/src/debug/ruby/3.4.7/gc/default, directory renamed /usr/src/debug/rub
 y/3.4.5 -> /usr/src/debug/ruby/3.4.7, directory renamed /usr/src/debug/ruby/3.4.5/ext/io/wait -> /usr/src/debug/ruby/3.4.7/ext/io/wait, directory renamed /usr/src/debug/ruby/3.4.5/enc/unicode/15.0.0 -> /usr/src/debug/ruby/3.4.7/enc/unicode/15.0.0, directory renamed /usr/src/debug/ruby/3.4.5/ext/monitor -> /usr/src/debug/ruby/3.4.7/ext/monitor, directory renamed /usr/src/debug/ruby/3.4.5/ext/json/generator -> /usr/src/debug/ruby/3.4.7/ext/json/generator, directory renamed /usr/src/debug/ruby/3.4.5/ext/stringio -> /usr/src/debug/ruby/3.4.7/ext/stringio, directory renamed /usr/src/debug/ruby/3.4.5/ext -> /usr/src/debug/ruby/3.4.7/ext, directory renamed /usr/src/debug/ruby/3.4.5/ext/objspace -> /usr/src/debug/ruby/3.4.7/ext/objspace, directory renamed /usr/src/debug/ruby/3.4.5/include/ruby/io -> /usr/src/debug/ruby/3.4.7/include/ruby/io, directory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/syslog-0.2.0/ext/syslog -> /usr/src/debug/ruby/3.4.7/.bundle/gems/syslog-0.2.0/ext/syslog, dir
 ectory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/rbs-3.8.0/src -> /usr/src/debug/ruby/3.4.7/.bundle/gems/rbs-3.8.0/src, directory renamed /usr/src/debug/ruby/3.4.5/ext/json/parser -> /usr/src/debug/ruby/3.4.7/ext/json/parser, directory renamed /usr/src/debug/ruby/3.4.5/gc -> /usr/src/debug/ruby/3.4.7/gc, directory renamed /usr/src/debug/ruby/3.4.5/ext/date -> /usr/src/debug/ruby/3.4.7/ext/date, directory renamed /usr/src/debug/ruby/3.4.5/ext/openssl -> /usr/src/debug/ruby/3.4.7/ext/openssl, directory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/debug-1.11.0/ext/debug -> /usr/src/debug/ruby/3.4.7/.bundle/gems/debug-1.11.0/ext/debug, directory renamed /usr/src/debug/ruby/3.4.5/ext/pty -> /usr/src/debug/ruby/3.4.7/ext/pty, directory renamed /usr/src/debug/ruby/3.4.5/ext/ripper -> /usr/src/debug/ruby/3.4.7/ext/ripper, directory renamed /usr/src/debug/ruby/3.4.5/include/ruby/internal/arithmetic -> /usr/src/debug/ruby/3.4.7/include/ruby/internal/arithmetic, directory renamed /usr/s
 rc/debug/ruby/3.4.5/include/ruby/internal/intern/select -> /usr/src/debug/ruby/3.4.7/include/ruby/internal/intern/select, directory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal -> /usr/src/debug/ruby/3.4.7/.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal, directory renamed /usr/src/debug/ruby/3.4.5/enc -> /usr/src/debug/ruby/3.4.7/enc, directory renamed /usr/src/debug/ruby/3.4.5/coroutine/amd64 -> /usr/src/debug/ruby/3.4.7/coroutine/amd64, directory renamed /usr/src/debug/ruby/3.4.5/enc/jis -> /usr/src/debug/ruby/3.4.7/enc/jis, directory renamed /usr/src/debug/ruby/3.4.5/prism -> /usr/src/debug/ruby/3.4.7/prism, directory renamed /usr/src/debug/ruby/3.4.5/ext/pathname -> /usr/src/debug/ruby/3.4.7/ext/pathname, directory renamed /usr/src/debug/ruby/3.4.5/include/ruby/internal/encoding -> /usr/src/debug/ruby/3.4.7/include/ruby/internal/encoding, directory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/racc-1.8.1/ext/racc/cparse -> /usr/src/debug/ruby/3.4.
 7/.bundle/gems/racc-1.8.1/ext/racc/cparse, directory renamed /usr/src/debug/ruby/3.4.5/.bundle/gems/rbs-3.8.0/include/rbs -> /usr/src/debug/ruby/3.4.7/.bundle/gems/rbs-3.8.0/include/rbs, directory renamed /usr/src/debug/ruby/3.4.5/enc/trans -> /usr/src/debug/ruby/3.4.7/enc/trans, directory renamed /usr/src/debug/ruby/3.4.5/ext/etc -> /usr/src/debug/ruby/3.4.7/ext/etc, directory renamed /usr/src/debug/ruby/3.4.5/include/ruby -> /usr/src/debug/ruby/3.4.7/include/ruby, directory renamed /usr/src/debug/ruby/3.4.5/ext/psych -> /usr/src/debug/ruby/3.4.7/ext/psych, directory renamed /usr/src/debug/ruby/3.4.5/missing -> /usr/src/debug/ruby/3.4.7/missing
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "3.4.5" to "3.4.7"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 30804468 to 30907213 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: removed "/usr/lib/libruby.so.3.4.5 /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.2.0.gemspec", added "/usr/lib/ruby/3.4.0/prism/polyfill/append_as_bytes.rb /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.5.1.gemspec /usr/lib/libruby.so.3.4.7 /usr/lib/ruby/3.4.0/prism/translation/parser_current.rb /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.4.gemspec /usr/lib/ruby/3.4.0/prism/polyfill/scan_byte.rb /usr/lib/ruby/3.4.0/prism/translation/parser/builder.rb /usr/lib/ruby/3.4.0/prism/polyfill/warn.rb /usr/lib/ruby/3.4.0/prism/translation/parser35.rb"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 3.4.5 [default] to 3.4.7 [default]
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.5 to libruby.so.3.4.7
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.5 to libruby.so.3.4.7
  /usr/lib/libruby.so.3.4.5 moved to /usr/lib/libruby.so.3.4.7
  /usr/lib/ruby/gems/3.4.0/gems/prism-1.2.0 moved to /usr/lib/ruby/gems/3.4.0/gems/prism-1.5.1
  /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.3 moved to /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.4
  /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.2.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.5.1.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.4.gemspec
  /usr/lib/ruby/3.4.0/prism/polyfill/append_as_bytes.rb was added
  /usr/lib/ruby/3.4.0/prism/polyfill/scan_byte.rb was added
  /usr/lib/ruby/3.4.0/prism/polyfill/warn.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser35.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser/builder.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser_current.rb was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.4 changed symlink target from libruby.so.3.4.5 to libruby.so.3.4.7
  /usr/lib/libruby.so changed symlink target from libruby.so.3.4.5 to libruby.so.3.4.7
  /usr/lib/libruby.so.3.4.5 moved to /usr/lib/libruby.so.3.4.7
  /usr/lib/ruby/gems/3.4.0/gems/prism-1.2.0 moved to /usr/lib/ruby/gems/3.4.0/gems/prism-1.5.1
  /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.3 moved to /usr/lib/ruby/gems/3.4.0/gems/uri-1.0.4
  /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.2.0.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/prism-1.5.1.gemspec
  /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.3.gemspec moved to /usr/lib/ruby/gems/3.4.0/specifications/default/uri-1.0.4.gemspec
  /usr/lib/ruby/3.4.0/prism/polyfill/append_as_bytes.rb was added
  /usr/lib/ruby/3.4.0/prism/polyfill/scan_byte.rb was added
  /usr/lib/ruby/3.4.0/prism/polyfill/warn.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser35.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser/builder.rb was added
  /usr/lib/ruby/3.4.0/prism/translation/parser_current.rb was added

--===============1508597782014271058==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.4.5-3.4.7.patch"

RnJvbSA1ZjQ3MmZhMjQzZDUzOGY3Zjc4NDYwZmQyN2M0NWYzMTQwZjU4Yzk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDI6MTE6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDMuNC41IC0+IDMuNC43CgotLS0KIC4uLjAwMS1leHRtay1maXgtY3Jvc3Mt
Y29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCB8IDQgKystLQogLi4ubV9kdW1wLmMt
RGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIHwgNCArKy0tCiAu
Li4vcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCAg
fCA0ICsrLS0KIC4uLi9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRh
dGlvbi5wYXRjaCB8IDggKysrKy0tLS0KIC4uLm1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1m
aWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCB8IDQgKystLQogLi4ucmstR2Vtc3BlYy1yZXByb2R1
Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIHwgMiArLQogLi4uL3J1YnkvcnVi
eS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoICAgICAgIHwgNCArKy0tCiAu
Li4wNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gg
fCA1ICstLS0tCiAuLi4vcnVieS97cnVieV8zLjQuNS5iYiA9PiBydWJ5XzMuNC43LmJifSAgICAg
ICAgICAgICAgICAgfCAyICstCiA5IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIw
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzMu
NC41LmJiID0+IHJ1YnlfMy40LjcuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1l
eHRlcm5hbC1nZW1zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAx
LWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCmluZGV4
IGYxNzk3MGU5YzkuLmRjMzNmYTlkODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwt
Z2Vtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0
bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDAzNzAwZWMyNTY3ODllMDJkZTIwYjU4YmNhMDgwYzZmZWY1OTIzMzYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJkMTk4MDZlMWQyMjFkZjk0MDBiMjViZDY3ZjNl
MGI3YTIxYmI3MDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW5k
cj1DMz1BOT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogRGF0ZTogTW9uLCAz
MCBTZXAgMjAxOSAxNjo1NzowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBleHRtazogZml4IGNy
b3NzLWNvbXBpbGF0aW9uIG9mIGV4dGVybmFsIGdlbXMKQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVk
LW9mZi1ieTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2V4
dC9leHRtay5yYiBiL2V4dC9leHRtay5yYgotaW5kZXggOGI2YjM2NS4uMzA0OGY3NSAxMDA3NTUK
K2luZGV4IDFkMTY1NDUuLmFkOTcxZWEgMTAwNzU1CiAtLS0gYS9leHQvZXh0bWsucmIKICsrKyBi
L2V4dC9leHRtay5yYgogQEAgLTQzNCw4ICs0MzQsOCBAQCBlbHNlCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEt
YW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNs
LXJpc2N2LnBhdGNoCmluZGV4IDc5OTMyNGNhZWEuLjRmODFkMGExOWQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19T
MS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZv
ci1tdXNsLXJpc2N2LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOTkyZDc4MWUwNWI2MTQ4
OWJkZjVhMmE5YWVlNmNjNjE2ZjE3NDJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBh
NWMyNzgyNmU3NTYxZWFmY2I4ZGFiMDYxZTA3MzQ5MjMyNDU3ZjEwIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwg
MjUgSmFuIDIwMjIgMjA6Mjk6MTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdm1fZHVtcC5jOiBE
ZWZpbmUgUkVHX1MxIGFuZCBSRUdfUzIgZm9yIG11c2wvcmlzY3YKQEAgLTE0LDcgKzE0LDcgQEAg
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS92bV9kdW1wLmMgYi92bV9kdW1w
LmMKLWluZGV4IDU4NzNlNTIuLjllYjRkYjEgMTAwNjQ0CitpbmRleCA5OTMzOWZkLi44YzViYjAz
IDEwMDY0NAogLS0tIGEvdm1fZHVtcC5jCiArKysgYi92bV9kdW1wLmMKIEBAIC00MCw2ICs0MCwx
MSBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9i
ZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1
YnkucGF0Y2gKaW5kZXggODRmZTlhZWUzZC4uOGVmMGM5MDNlOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmst
b2YtbGlicnVieS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAyNjI1ZjZjMTU1MTA1ZDM1MmQ2YTFmZjNhNzIyZTc4OTY0MzFmZjkxIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzOTQ5YjNmZjAxYzY0MmI2YjlhZGE5YjEyZGQzMDgz
Y2M5MzA1NDRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0b3BoZXIgTGFy
c29uIDxjaHJpc19sYXJzb25AbWVudG9yLmNvbT4KIERhdGU6IFRodSwgNSBNYXkgMjAxNiAxMDo1
OTowNyAtMDcwMAogU3ViamVjdDogW1BBVENIXSBPYmV5IExERkxBR1MgZm9yIHRoZSBsaW5rIG9m
IGxpYnJ1YnkKQEAgLTEwLDcgKzEwLDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS90ZW1wbGF0ZS9NYWtlZmlsZS5pbiBiL3RlbXBsYXRlL01ha2VmaWxlLmluCi1pbmRleCA4Zjk5
NmI4Li5jNzA4YjY0IDEwMDY0NAoraW5kZXggNmI5NzI3OS4uYTQ5YjUzZCAxMDA2NDQKIC0tLSBh
L3RlbXBsYXRlL01ha2VmaWxlLmluCiArKysgYi90ZW1wbGF0ZS9NYWtlZmlsZS5pbgogQEAgLTEy
MCw3ICsxMjAsNyBAQCBFTkFCTEVfU0hBUkVEID0gQEVOQUJMRV9TSEFSRURACmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1
Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCmluZGV4
IDg3YTFlODI1MTYuLjkwYjJhZWU3ZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxk
LXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5
ODA3MWMwYjI4YTQ1Y2QyMWEyY2JlNjc0NmNlMzkwNjc5MzJiNjJmIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAyZTE0MGZlYTZjMjc1ZjMyNTg4OTNkMmRhMjQ4MDAyN2IxNmVmYjkyIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0aWFuIEhvZnN0YWVkdGxlciA8emVo
YUBkZWJpYW4ub3JnPgogRGF0ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTowNDozNCAtMDMwMAogU3Vi
amVjdDogW1BBVENIXSByZG9jOiBidWlsZCByZXByb2R1Y2libGUgZG9jdW1lbnRhdGlvbgpAQCAt
MTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHpl
aGFAZGViaWFuLm9yZz4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGliL3Jkb2MvZ2VuZXJhdG9yL2pzb25faW5kZXgucmIg
Yi9saWIvcmRvYy9nZW5lcmF0b3IvanNvbl9pbmRleC5yYgotaW5kZXggYzQ1NDkxMC4uMjRmZWFi
MCAxMDA2NDQKK2luZGV4IDA2NWNhYTQuLmNmYTFmMzMgMTAwNjQ0CiAtLS0gYS9saWIvcmRvYy9n
ZW5lcmF0b3IvanNvbl9pbmRleC5yYgogKysrIGIvbGliL3Jkb2MvZ2VuZXJhdG9yL2pzb25faW5k
ZXgucmIKLUBAIC0xNzgsNyArMTc4LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJhdG9yOjpKc29uSW5k
ZXgKK0BAIC0xNzYsNyArMTc2LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgK
ICAgICAgZGVidWdfbXNnICJXcml0aW5nIGd6aXBwZWQgc2VhcmNoIGluZGV4IHRvICVzIiAlIG91
dGZpbGUKICAKICAgICAgWmxpYjo6R3ppcFdyaXRlci5vcGVuKG91dGZpbGUpIGRvIHxnenwKQEAg
LTI2LDcgKzI2LDcgQEAgaW5kZXggYzQ1NDkxMC4uMjRmZWFiMCAxMDA2NDQKICAgICAgICBnei5v
cmlnX25hbWUgPSBzZWFyY2hfaW5kZXhfZmlsZS5iYXNlbmFtZS50b19zCiAgICAgICAgZ3oud3Jp
dGUgc2VhcmNoX2luZGV4CiAgICAgICAgZ3ouY2xvc2UKLUBAIC0xOTYsNyArMTk2LDcgQEAgY2xh
c3MgUkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgKK0BAIC0xOTQsNyArMTk0LDcgQEAgY2xhc3Mg
UkRvYzo6R2VuZXJhdG9yOjpKc29uSW5kZXgKICAgICAgICAgIGRlYnVnX21zZyAiV3JpdGluZyBn
emlwcGVkIGZpbGUgdG8gJXMiICUgb3V0ZmlsZQogIAogICAgICAgICAgWmxpYjo6R3ppcFdyaXRl
ci5vcGVuKG91dGZpbGUpIGRvIHxnenwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWlu
LWdlbmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0
LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0
Y2gKaW5kZXggNGI2NzcxZmQyNi4uNWNhMTgyMzEzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3Qt
ZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2Vu
ZXJhdGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4ODdmYWNjNGNhNWJjYjAyODBi
MDI1YjM1YmJjMTg1MjhlNTI5MTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkzMjQ4
OWI2N2NlOWNkZjU1OTBhMTc5MjdlYTQwZDllYTY2MjM2NjggTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5kZT4KIERhdGU6IFR1
ZSwgMTAgT2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliL21rbWYu
cmI6IHNvcnQgbGlzdCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVkIE1ha2VmaWxlCkBAIC0x
Nyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJlaW5lciBIZXJybWFubiA8cmVpbmVyQHJlaW5l
ci1oLmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvbGliL21rbWYucmIgYi9saWIvbWttZi5yYgotaW5kZXggNzY4YTE1Mi4u
ZjE2Y2RkOCAxMDA2NDQKK2luZGV4IDk5ZjM3NjQuLjYyMzc3YjYgMTAwNjQ0CiAtLS0gYS9saWIv
bWttZi5yYgogKysrIGIvbGliL21rbWYucmIKIEBAIC0yNDgwLDcgKzI0ODAsNyBAQCBMT0NBTF9M
SUJTID0gI3skTE9DQUxfTElCU30KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0
MjI1LXRvby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJr
LUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAppbmRl
eCAxOTBlYjdkNzI4Li5mZDdkMzM0MGYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5n
LTc4NDIyNS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8w
MDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NzA1MWJlOWNiOTMxN2QyYzRkNjFhODJkNmQ5NTM4
MDllOTYyZjEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0MTAzMzE1Nzc0ODFmMzMx
MDc0NDA1ZTk2MjljYThkYjUzMDNhYWE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
THVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBOb3Yg
MjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJlcHJv
ZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2
LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCmluZGV4IDEy
MWJkY2YzYWIuLmUyYzgwZTJmNmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2li
bGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1OGJkYWNhM2Q1Mzc5YWZjYjk1NGJiNTdj
NjkwYzc3MzY4MDdlYzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJmM2Q4MzU5ZmZk
MWFiMDdkNTc4YzFlOTkxMTgwYmMzMWRjN2QxNDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAx
IE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3Mg
cmVwcm9kdWNpYmxlCkBAIC02NCw3ICs2NCw3IEBAIGluZGV4IDU3MTlmODMuLmZlNzYyNjAgMTAw
NjQ0CiAgICBzcGVjLmVtYWlsICAgICAgICAgPSBbImtudUBpZGFlbW9ucy5vcmciLCAidW1lQG1h
aG9yb2JhLm9yZyJdCiAgCiBkaWZmIC0tZ2l0IGEvbGliL3Jkb2MvcmRvYy5nZW1zcGVjIGIvbGli
L3Jkb2MvcmRvYy5nZW1zcGVjCi1pbmRleCAzMTQ0ZGY1Li42NWMzMTNmIDEwMDY0NAoraW5kZXgg
NDdmNDgwMi4uY2YwYjVmNyAxMDA2NDQKIC0tLSBhL2xpYi9yZG9jL3Jkb2MuZ2Vtc3BlYwogKysr
IGIvbGliL3Jkb2MvcmRvYy5nZW1zcGVjCiBAQCAtNyw2ICs3LDcgQEAgZW5kCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9f
cGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXIt
cm9vdC5wYXRjaAppbmRleCBlMzU3NGYxYTgxLi43ODBiNTkwOTJmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlz
c2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJv
b3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDljNDc0OGFhZTRmNjkzOTBhMzY4NzVhYTI3
ZDcwYzNjNjMyYWU5NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGViNWE1ZGI3NGQy
OWZkNjM2OWU5ODcxYmExYmIyNTRhYTBmMjJmNDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2ZXIuY29tPgogRGF0ZTog
TW9uLCA3IEp1bCAyMDI1IDE1OjA1OjU3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNraXAgdGVz
dF9ybV9yX25vX3Blcm1pc3Npb25zIHRlc3QgdW5kZXIgcm9vdApAQCAtMjcsNiArMjcsMyBAQCBp
bmRleCBkMjA5NmEwLi44MGUzMzY4IDEwMDY0NAogIAogICAgICBta2RpciAndG1wZGF0YWRpcicK
ICAgICAgdG91Y2ggJ3RtcGRhdGFkaXIvdG1wZGF0YScKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjUuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy40LjcuYmIKaW5kZXggYjc3ZDc2NTc4
ZS4uMmZiY2ZkMWYxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eV8zLjQuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuNC43LmJi
CkBAIC00OSw3ICs0OSw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgewogCiBERVBFTkRTOmFw
cGVuZDpsaWJjLW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MWQ4OGQ4YTI3YjQ0MmZkZGU0YWEwNmRjOTllODZiMGJiZjBiMjg4OTYzZDg0MzMxMTJkZDVmYWM3
OThmZDVlZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMzgxNWE2ZDA5NTY5NmY3OTE5MDkwZmRj
M2UyZjk0NTliMmM4M2Q1NzIyNGIyZTQ0NmNlMWY1ZjczMzNlZjM2IgogCiBQQUNLQUdFQ09ORklH
ID8/PSAiIgogUEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVB
VFVSRVMnLCAnaXB2NicsIGQpfSIKLS0gCjIuNDcuMQoK

--===============1508597782014271058==--

