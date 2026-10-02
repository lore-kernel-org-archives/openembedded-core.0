Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40211CA5FE1
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 06:00:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5284.1790920842800360104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 23:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SGloE/2g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4ft5HbcW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0fb335a66-77c9b01f-b3f6-4d79-a402-cb6dcabc0669-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790920842;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=4wUxwavNSVKmiVNg/8gNGl4FtiQgj/LTNtO6LH8AgOQ=;
	b=SGloE/2gr4/j+goj6dG7WG7pDJiKhsOx/aTjjudrwZXXWf/r1GDLnpiMS0YTmhvF
	+mBgKHNOVAsGYMOhUnDvhbp7hLUfPoGsNTYM8ewou75P5Vr+ivQlLrT7/zIbUq8A0gM
	1+Tp3BZ0ql/vxDFbWET0Z9QS9zKOUN13Q4eFeOVQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790920842;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=4wUxwavNSVKmiVNg/8gNGl4FtiQgj/LTNtO6LH8AgOQ=;
	b=4ft5HbcWX6T2c+O3Y4LjdJip+pH4LeikWYsizRzDxn7TgOqiN2e4z++DpZngCRHD
	YjMVC5nHIu3tdnC0WAbOkO8DEFaiPjA5lSu5ZxookPr4HU/hFDQG+oQTaUsOqkHKY9z
	g0hihj74wOVt75kloXCFUKMKgTzCVqys0lk5kGbc=
Content-Type: multipart/mixed; boundary="===============0873413403893321578=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa,mesa-tools-native: upgrading to 26.2.4 SUCCEEDED
Message-ID: <010101a0fb335a66-77c9b01f-b3f6-4d79-a402-cb6dcabc0669-000000@us-west-2.amazonses.com>
Date: Fri, 2 Oct 2026 06:00:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 06:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247062

--===============0873413403893321578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICptZXNhLG1lc2EtdG9vbHMtbmF0aXZlKiB0byAqMjYuMi40KiBoYXMgU3VjY2VlZGVkLgoK
TmV4dCBzdGVwczoKICAgIC0gYXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1tZXNhLW1lc2Et
dG9vbHMtbmF0aXZlLXVwZ3JhZGUtMjYuMi4zLTI2LjIuNC5wYXRjaAogICAgLSBjaGVjayB0aGUg
Y2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1tYXJpemUgdGhlbSBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhhdCBjb250YWlucyB0aGUgcGFj
a2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5IHRlc3RzCiAgICAtIGFtZW5kIHRo
ZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQgLXMgLS1yZXNldC1hdXRob3IgLS1h
bWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QKCkFsdGVy
bmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hvdWxkIG5vdCBiZSB1cGdyYWRl
ZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVfTk9fVVBEQVRFX1JFQVNPTiBpbiBy
ZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21hdGljIHVwZ3JhZGVzIHdvdWxkIG5v
IGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3IHRoZSBhdHRhY2hlZCBmaWxlcyBm
b3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBkYXRlIGZhaWx1cmVzLgpBbnkgcHJv
YmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5v
cmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUyMFVwZGF0ZSUyMEhhbmRsZXIKClJl
Z2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJvbSBlMTVlOTdlNWNhYTVlZDdk
NWU3Y2NkMmE3ZWIwMWUwZmVkNTA1Njk0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBV
cGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRhdGU6IEZyaSwgMiBPY3QgMjAy
NiAwNTozMDoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1lc2EsbWVzYS10b29scy1uYXRpdmU6
IHVwZ3JhZGUgMjYuMi4zIC0+IDI2LjIuNApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dAoKTWVzYSAyNi4yLjMgUmVsZWFzZSBOb3RlcyAvIDIwMjYtMDktMTYKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KCk1lc2EgMjYuMi4zIGlzIGEgYnVnIGZpeCByZWxlYXNl
IHdoaWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2UgdGhlIDI2LjIuMgpyZWxlYXNlLgoKTWVzYSAy
Ni4yLjMgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQuNiBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBv
cnRlZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9OKSBvciBnbEdldEludGVnZXJ2KEdMX01BSk9S
X1ZFUlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9NSU5PUl9WRVJTSU9OKSBkZXBlbmRzIG9uIHRo
ZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgpTb21lIGRyaXZlcnMgZG9uJ3Qgc3VwcG9y
dCBhbGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGluIE9wZW5HTCA0LjYuIE9wZW5HTAo0LjYgaXMg
Kipvbmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3RlZCBhdCBjb250ZXh0IGNyZWF0aW9uLgpDb21w
YXRpYmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQgYSBsb3dlciB2ZXJzaW9uIGRlcGVuZGluZyBv
biBlYWNoIGRyaXZlci4KCk1lc2EgMjYuMi4zIGltcGxlbWVudHMgdGhlIE9wZW5DTCAzLjEgQVBJ
LCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIENMX0RFVklDRV9WRVJTSU9OLCBDTF9E
RVZJQ0VfTlVNRVJJQ19WRVJTSU9OIGFuZApDTF9ERVZJQ0VfT1BFTkNMX0NfQUxMX1ZFUlNJT05T
CmNsR2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVy
IGJlaW5nIHVzZWQuCgpNZXNhIDI2LjIuMyBpbXBsZW1lbnRzIHRoZSBWdWxrYW4gMS40IEFQSSwg
YnV0IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBhcGlWZXJzaW9uIHByb3BlcnR5IG9mIHRo
ZSBWa1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBzdHJ1Y3QKZGVwZW5kcyBvbiB0aGUgcGFydGlj
dWxhciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBjaGVja3N1bXMKLS0tLS0tLS0tLS0tLQoKOjoK
CiAgICBTSEEyNTY6IDE2MjgwNThhOGQyYzA2MTU5NzVkZTVhMTVhYjdiYmI5NjM4YzUwMDAwYjVi
ZWQ5NDU2ZmY0MjNlYTAzNGE4MWYKICAgIG1lc2EtMjYuMi4zLnRhci54egogICAgU0hBNTEyOiBl
YzYyMTczNWFlNDY3OTc2MmVhMjdiOTc5YTUzMTRjN2FlY2ZkZDQxNjVhZmVhMTljOGM1NWY5MzNk
NzliNDBmMDFmYQogICAgMDQxYTk1ODc0ZmM0MzQ3ZTczMmFjNTY1Nzg2ZDliNjE2YTlhYTg4NTZh
NDIyMjA0ZDllY2M5YTEyZWM0CiAgICBtZXNhLTI2LjIuMy50YXIueHoKCk5ldyBmZWF0dXJlcwot
LS0tLS0tLS0tLS0KCi0gTm9uZQoKQnVnIGZpeGVzCi0tLS0tLS0tLQoKLSBOVksgbWVtb3J5IGxl
YWsgaW4gQ21kQ29weUJ1ZmZlclRvSW1hZ2UgaW4gMjYuMi4wLCAyNi4yLjEgYW5kIDI2LjIuMi4K
LSBSQURWOiBHUFUgcGFnZSBmYXVsdCAobnVsbCBwb2ludGVyKSB3aXRoIFJUIGVtdWxhdGlvbiBv
biBQb2xhcmlzIChSWCA1ODAKICAyMDQ4U1ApLiBJc3N1ZSBiZXR3ZWVuIDI2LjEuNiBhbmQgMjYu
Mi4xCi0gW0FOVl1bQVJMXVtiaXNlY3RlZF0gVmlzdWFsIGdyYXBoaWNzIGdsaXRjaGVzIGluIENv
dW50ZXItU3RyaWtlIDIgc3RhcnRpbmcgaW4KICBNZXNhIDI2LjIueAotIFtyYWRlb25zaV0gTWlu
ZWNyYWZ0IFZveHkgbW9kOiBEaXN0YW50IHdhdGVyIHJlbmRlcmluZyBpc3N1ZSBvbiBWZWdhIGlH
UFUgYW5kCiAgUkROQTIKLSBcYGhldmNfdmFhcGlgIG9uIEFNRCAocmFkZW9uc2kvZ2Z4MTE1MCkg
c3RhbGxzIHRvIH4xIGZwcyB3aGVuIGlucHV0IGZyYW1lcwogIGNhcnJ5IEEvNTMgKENFQS02MDgv
NzA4KSBjbG9zZWQtY2FwdGlvbiBzaWRlIGRhdGEKLSBhbnY6IFRlc3QgZmFpbHMgaW4gc2ltdWxh
dGlvbiBkdWUgdG8gY29hcnNlIHBpeGVsIHNoYWRpbmcgc3RhdGUKLSBhc2FoaTogMTYtYml0IGJs
ZW5kaW5nIGludG8gUkdCQTMyRiBwcm9kdWNlcyB6ZXJvIGR1ZSB0byAzMi1iaXQgdGlsZWJ1ZmZl
cgogIGxvYWQKLSBhc2FoaTogU29tZSB0ZXh0dXJlcyBkbyBub3QgcmVuZGVyIGNvcnJlY3RseSBp
biBQb3J0YWxzIDIKLSBsaWJ2dWxrYW5faW50ZWwuc28gY3Jhc2ggd2l0aCBYLVBsYW5lIDEyLjQu
MyBvbiBJbnRlbCBBcmMgQjU4MAotIG5pcmNhY2hlIGNhdXNlcyBnbHhnZWFycy9lZ2xnZWFycyB0
byBzZWdmYXVsdCB1bmRlciBaaW5rCi0gdnVsa2FuLHJhZHY6IHdoZW4gdXNpbmcgZGVzY3JpcHRv
ciBoZWFwcywgaW5wdXQgYXR0YWNobWVudHMgaW4gU1BJUi1WIGFyZQogIGluY29ycmVjdGx5IGRl
dGVjdGVkIGFzIHJlYWQgb25seSBpbnN0ZWFkIG9mIHJlYWQgd3JpdGUKCkNoYW5nZXMKLS0tLS0t
LQoKQWx5c3NhIFJvc2VuendlaWcgKDEpOgotIG1lc2Evc3Q6IGZpeCBpbmNvcnJlY3QgVlMgaW5w
dXQgYmFzZXMKQW5kcnplaiBEYXRjenVrICgxKToKLSBhYy9zcXR0LCByYWR2LCByYWRlb25zaTog
Rml4IFNRVFQgYnVmZmVyIHNpemUgYWxpZ25tZW50IGlzc3VlcwpCZW5qYW1pbiBDaGVuZyAoMSk6
Ci0gcmFkZW9uc2k6IHNldCBzdGVuY2lsIGNsZWFyIHRvIDAgd2hlbiBlbmFibGluZyBUQyBjb21w
YXQKQ2FpbyBPbGl2ZWlyYSAoMSk6Ci0gc3BpcnY6IFByZXNlcnZlIGFsbCBmcF9tYXRoX2N0cmwg
Yml0cyBpbiB2dG5faGFuZGxlX2FsdSBkZWZhdWx0IGNhc2UKQ2hyaXN0aWFuIEdtZWluZXIgKDIp
OgoKLSBldG5hdml2OiBEbyBub3QgYWJvcnQgb24gdW5zdXBwb3J0ZWQgc3RlbmNpbC1vbmx5IGJs
aXRzCi0gZXRuYXZpdjogVXNlIFJTIGRlcHRoIGZvcm1hdHMgb25seSBvbiBoYWx0aTUrCgpEYW55
bG8gUGlsaWFpZXYgKDUpOgoKLSB0dTogV2FpdCBmb3IgWEZCIHF1ZXJ5IHdyaXRlcyB0byBsYW5k
IGJlZm9yZSBtYWtpbmcgaXQgYXZhaWxhYmxlCi0gdHU6IFN5bmNocm9uaXppbmcgd2l0aCBDbWRD
b3B5UXVlcnlQb29sUmVzdWx0IHNob3VsZCB3YWl0IGZvciBtZW0gd3JpdGVzCi0gdHU6IFVzZSBw
X2F0b21pY19yZWFkIHRvIHJlYWQgZnJvbSBxdWVyeSdzIHNsb3QtPmF2YWlsYWJsZQotIHR1OiBG
aXggUEFDS0VEICsgYWxpZ25hcyg4KSBhcHBsaWNhdGlvbiB0byB0aGUgc2FtZSBzdHJ1Y3Qgb24g
b2xkZXIgR0NDCi0gdHU6IEhhbmRsZSBsYXp5IG1lbW9yeSBpbiBHZXREZXZpY2VNZW1vcnlPcGFx
dWVDYXB0dXJlQWRkcmVzcwoKRGF2aWQgUm9zY2EgKDIpOgoKLSB2YTogRHJvcCBIRVZDIFNFSSBw
YXJzaW5nCi0gcmFkdi92aWRlbzogRml4IHNldHRpbmcgc2Vzc2lvbiBwYXJhbWV0ZXJzIG92ZXJy
aWRlIGluZm8KCkRtaXRyeSBCYXJ5c2hrb3YgKDgpOgoKLSBpcjM6IGtlZXAgYnl0ZSBTU0JPIG9m
ZnNldHMgYmVmb3JlIGE2eHgKLSBmcmVlZHJlbm8vYTV4eDogb25seSAyRC1ibGl0IGJldHdlZW4g
Y29tcGF0aWJsZSBmb3JtYXRzCi0gZnJlZWRyZW5vL2E1eHg6IHByb2dyYW0gTlVNTk9OUE9TVkFS
IHdpdGggcG9zaXRpb24ncyBWUEMgbG9jYXRpb24KLSBmcmVlZHJlbm8vYTR4eCthNXh4OiBjbGFt
cCB0aGUgdGV4dHVyZSBidWZmZXIgc2l6ZQotIGZyZWVkcmVubzoga2VlcCB0aGUgc2VwYXJhdGUg
c3RlbmNpbCBvdXQgb2YgdGhlIHNoYWRvdyBibGl0Ci0gZnJlZWRyZW5vL2E1eHg6IGJsaXQgdGhl
IHNlcGFyYXRlIHN0ZW5jaWwgcGxhbmUgdG9vCi0gaXIzOiBza2lwIHRoZSBwaGlzIG9mIG5vbi1H
UFIgcmVnaXN0ZXJzIGluIHRoZSBtaW5pbXVtIHByZXNzdXJlIGJvdW5kCi0gZnJlZWRyZW5vL2E1
eHg6IGJvdW5kIGJsaXRzIGJ5IHRoZSBsYXllciBjb3VudCwgbm90IHRoZSBkZXB0aAoKRW1tYSBB
bmhvbHQgKDMpOgoKLSB0dTogRHJvcCBUUkFOU0ZFUl9TUkMvRFNUIGZyb20gYnVmZmVyRmVhdHVy
ZXMuCi0gdHU6IEZpeCB0aGUgc1R5cGUgb2YgdGhlIHJldHVybmVkIFZrRnJhZ21lbnRTaGFkaW5n
UmF0ZUtIUnMuCi0gdHU6IEZpeCBkZXN0cm95IG9yZGVyIG9mIGF1dG90dW5lIHZzIHBlcmZjb3Vu
dGVycyBpbiBmYWlsdXJlIHBhdGguCgpFcmljIEVuZ2VzdHJvbSAoNCk6CgotIGRvY3M6IGFkZCBz
aGEgc3VtIGZvciAyNi4yLjIKLSAucGlja19zdGF0dXMuanNvbjogVXBkYXRlIHRvIDlmNDJlYTEy
MzkwMjVkM2Y5M2Q5YmJmNzQwNTM0MGFkY2VjOTQ0MTkKLSAucGlja19zdGF0dXMuanNvbjogTWFy
ayBmNDU4MjVhMGM3MjRkMDZmMjMxYTEyMTA0ODRmZTlhZjcxYTNmZmFiIGFzCiAgZGVub21pbmF0
ZWQKLSAucGlja19zdGF0dXMuanNvbjogTWFyayA4NTlmY2MzYjc0ZjgzMWJiYjkxNTFmMDZkMDU1
ZGRmZDQ1Y2M2ZTUwIGFzCiAgZGVub21pbmF0ZWQKCkZyYW5rIEJpbm5zICgzKToKCi0gcHZyOiBh
ZGQgbWlzc2luZyBHUFUgYXJjaGl0ZWN0dXJlIHRvIGRldmljZSBpbmZvIGZvciBzb21lIEJWTkNz
Ci0gcHZyOiBmaXh1cCBvcmRlcmluZyBvZiAoaGFzXF8pdXNjX2l0cl9wYXJhbGxlbF9pbnN0YW5j
ZXMgaW4gZGV2IGluZm8KLSB6aW5rOiByZXBsYWNlIGJsZW5kIGFuZCB2ZXJ0ZXggZWxlbWVudHMg
c3RhdGUgaGFzaGVzIHdpdGggSURzCgpHYW5lc2ggQmVsZ3VyIFJhbWFjaGFuZHJhICgxKToKLSBh
bWQ6IGFkZCBnZngxMTcxCkdlb3JnIExlaG1hbm4gKDIpOgoKLSBuaXIvb3B0X3V1YjogZml4IGlt
YXggb3B0aW1pemF0aW9uCi0gYWNvOiBhdm9pZCBtdWJ1ZiBib3VuZHMgY2hlY2tpbmcgZm9yIGds
b2JhbAoKSXbDoW4gQnJpYW5vICgxKToKLSBhbnY6IGZpeCBwdXNoIGNvbnN0YW50IHJhbmdlIGdh
dGhlcmluZyBmb3IgZHluYW1pYyBvZmZzZXRzCkppeXUgWWFuZyAoMSk6Ci0gY2xjOiBmaXggZmQg
bGVhayBpbiBvcGVuX2NsY19kYXRhKCkgb24gbWFwIGZhaWx1cmUKSnVzdG9uIExpICgxKToKLSBh
bnYvYW5kcm9pZDogRG9uJ3QgZGlzYWJsZSBBVVhfQklUIGltcG9ydGluZyBYZTIrIENDUyBtb2Qg
aW1hZ2VzCkthcm1qaXQgTWFoaWwgKDEpOgotIHR1OiBGaXggc3BhcnNlIGJpbmQgY29sdW1uIG1l
cmdpbmcKS2Fyb2wgSGVyYnN0ICgyKToKCi0gbmlyL3NlcmlhbGl6ZTogc2V0IGluZm8uc3BlYyB0
byBOVUxMCi0gcnVzdGljbC9ldmVudDogcHJvcGVybHkgaW1wbGVtZW50IENMCgpbQ2hhbmdlbG9n
IHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDUwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdl
bG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQog
Li4uLWFkZHJsaWItYXZvaWQtYnVpbHRpbl9jcHVfc3VwcG9ydHMtZm9yLWF2eDItZGV0ZWN0aS5w
YXRjaCB8IDIgKy0KIC4uLjAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWlu
dG8tYmluYXJpZXMucGF0Y2ggfCAyICstCiAuLi4vMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0
LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCAgIHwgMiArLQogLi4uc3JjLWludGVsLWNvbXBp
bGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRjaCB8IDIgKy0KIC4uLnNy
Yy11dGlsLXVfbWF0aC5jLWRvLW5vdC11c2UtYXJtLWZwdS1pbnN0cnVjdGlvbnMtaWYucGF0Y2gg
fCAyICstCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNCArKy0tCiA2IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9m
aWxlcy8wMDAxLWFkZHJsaWItYXZvaWQtYnVpbHRpbl9jcHVfc3VwcG9ydHMtZm9yLWF2eDItZGV0
ZWN0aS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtYWRkcmxp
Yi1hdm9pZC1idWlsdGluX2NwdV9zdXBwb3J0cy1mb3ItYXZ4Mi1kZXRlY3RpLnBhdGNoCmluZGV4
IDEyMDAyYTJjMDMuLjJiMzBjMWI1YzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtYWRkcmxpYi1hdm9pZC1idWlsdGluX2NwdV9zdXBwb3J0cy1mb3It
YXZ4Mi1kZXRlY3RpLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVz
LzAwMDEtYWRkcmxpYi1hdm9pZC1idWlsdGluX2NwdV9zdXBwb3J0cy1mb3ItYXZ4Mi1kZXRlY3Rp
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MjI5M2U5MDQ4NGYwN2I1MTg2ZjJmMWZhN2Rl
NjNkYTBmMTIwMTIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMDA0MDk5NTZjZDFh
NThmMWM2NzZkZTljYmZkMmM2ODhjYTNmYzlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS2hlbSBSYWogPGtoZW0ucmFqQG9zcy5xdWFsY29tbS5jb20+CiBEYXRlOiBUaHUsIDEzIEF1
ZyAyMDI2IDAwOjAwOjAwICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFkZHJsaWI6IGF2b2lkIF9f
YnVpbHRpbl9jcHVfc3VwcG9ydHMgZm9yIGF2eDIgZGV0ZWN0aW9uCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUt
YnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvZmlsZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5h
cmllcy5wYXRjaAppbmRleCA3YTAwYWNiZWQzLi5kNTgwMjc3MTI0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUt
YnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8t
YmluYXJpZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZkNTU3MWUyMmZkMThiODU1MTk5
ZjIzNzMxZjAzNTkyNzA2N2EyYTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE2MWRh
YWYzNTRiZDg0ZGZhODQ5ZjhkYTYwMjhkZGM3MWYxYWY3ZGMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29t
bS5jb20+CiBEYXRlOiBXZWQsIDEwIERlYyAyMDI1IDAyOjI3OjE2ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGZyZWVkcmVubzogZG9uJ3QgZW5jb2RlIGJ1aWxkIHBhdGggaW50byBiaW5hcmllcwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1t
aXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNz
LW9uLW1pcHMtY2xhbmcucGF0Y2gKaW5kZXggZGMwOTU3ZDhlMi4uNzdhMGJhM2Q4YiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRl
Y3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1v
bi1taXBzLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMWE4OWEwODYyOWY5ZTU3
NmUxMzZkYzA0NGMwZWQ4YTJiNjdkOTJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBj
M2EzNTlkMzllMzg3ZTc4NTg4M2NiNzQwOTM0YTBkYzRlNjM3NmRiIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwg
MTMgSmFuIDIwMjAgMTU6MjM6NDcgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24gbWlzZGV0
ZWN0cyA2NGJpdCBhdG9taWNzIG9uIG1pcHMvY2xhbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIu
aC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10
eXBlZC1lbi5wYXRjaAppbmRleCAzNjQ1NmNjM2IxLi5iOTIzYzRjMWZiIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1q
YXktamF5X2lyLmgtZG8tbm90LXVzZWQtdHlwZWQtZW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5o
LWRvLW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMGMxYjRl
NTQ4MGJiNDExODMyNmEzMzlhM2E3MDg0ZGYxYTZiMGI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBjY2ZhNWE2NTU1ZjZlYjAzNWFjZTEyY2JhMWNlM2U3ODVhNDc4OTVmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25p
eC5kZT4KIERhdGU6IFN1biwgMTQgSnVuIDIwMjYgMTc6NDI6MTkgKzAyMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfaXIuaDogZG8gbm90IHVzZWQgdHlwZWQg
ZW51bQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1z
cmMtdXRpbC11X21hdGguYy1kby1ub3QtdXNlLWFybS1mcHUtaW5zdHJ1Y3Rpb25zLWlmLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtdXRpbC11X21hdGgu
Yy1kby1ub3QtdXNlLWFybS1mcHUtaW5zdHJ1Y3Rpb25zLWlmLnBhdGNoCmluZGV4IGFhYzQyMDgz
YzQuLjBkMGZkYWNlMmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtc3JjLXV0aWwtdV9tYXRoLmMtZG8tbm90LXVzZS1hcm0tZnB1LWluc3RydWN0aW9u
cy1pZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLXNy
Yy11dGlsLXVfbWF0aC5jLWRvLW5vdC11c2UtYXJtLWZwdS1pbnN0cnVjdGlvbnMtaWYucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDU2ZGJjODM4ZTQyZDkyMDUwNmYwZjExOWE2NWExZmFmMGNm
N2IzY2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg5YzQ2ZGU5MmU5NzQyMDJjMWNh
YmNlMjViYjRkOTQ0MTgzMGI4YjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogV2VkLCAxIEp1bCAyMDI2
IDIyOjQ4OjE1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy91dGlsL3VfbWF0aC5jOiBkbyBu
b3QgdXNlIGFybSBmcHUgaW5zdHJ1Y3Rpb25zIGlmIGZwdSBpcwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9tZXNhLmluYwppbmRleCAxMTU0ZDUxMWQ5Li5iMGFlNTAxNmRlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbWVzYS9tZXNhLmluYwpAQCAtMjIsOCArMjIsOCBAQCBTUkNfVVJJID0gImh0dHBzOi8vYXJj
aGl2ZS5tZXNhM2Qub3JnL21lc2EtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAw
MDEtYWRkcmxpYi1hdm9pZC1idWlsdGluX2NwdV9zdXBwb3J0cy1mb3ItYXZ4Mi1kZXRlY3RpLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTYyODA1OGE4ZDJj
MDYxNTk3NWRlNWExNWFiN2JiYjk2MzhjNTAwMDBiNWJlZDk0NTZmZjQyM2VhMDM0YTgxZiIKLVBW
ID0gIjI2LjIuMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiY2U1ZjdmYmViYjkzNDM3M2I4NmM5
OTlhMDY0ZDUyZmI1MDY1ODc4ZGM1N2YyODdmOTUzNDY2NDhlYzgzMmU5IgorUFYgPSAiMjYuMi40
IgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJtZXNhLSg/UDxwdmVyPlxkKyhcLlxk
KykrKSIKIAotLSAKMi40Ny4xCgo=

--===============0873413403893321578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.2.3.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch" to "https://archive.mesa3d.org/mesa-26.2.4.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 45509376 to 45517568 (+0%)
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.2.3.so", added "/usr/lib/libgallium-26.2.4.so"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 773212000 to 773266440 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.2.3.so", added "/usr/lib/.debug/libgallium-26.2.4.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 201480 to 202252 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 250559352 to 250567753 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.2.3/src/intel/compiler/elk -> /usr/src/debug/mesa/26.2.4/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/genxml -> /usr/src/debug/mesa/26.2.4/src/intel/genxml, directory renamed /usr/src/debug/mesa/26.2.3/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.2.4/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/compiler/gen -> /usr/src/debug/mesa/26.2.4/src/intel/compiler/gen, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/blorp -> /usr/src/debug/mesa/26.2.4/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.2.3/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.2.4/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.2.3/src/amd/compiler -> /usr/src/debug/mesa/26.2.4/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.2.3/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.2.4/src/gallium/dri
 vers/radeonsi, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.2.4/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/compiler/jay -> /usr/src/debug/mesa/26.2.4/src/intel/compiler/jay, directory renamed /usr/src/debug/mesa/26.2.3/src/compiler/glsl -> /usr/src/debug/mesa/26.2.4/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.2.3/src/compiler -> /usr/src/debug/mesa/26.2.4/src/compiler, directory renamed /usr/src/debug/mesa/26.2.3/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.2.4/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/compiler/brw -> /usr/src/debug/mesa/26.2.4/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.2.3/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.2.4/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.2.3/src/amd/vulkan -> /usr/src/debug/mesa/26.2.4/src/amd/vulkan, directory renamed /usr/src/debug
 /mesa/26.2.3/src/amd/common -> /usr/src/debug/mesa/26.2.4/src/amd/common, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/compiler -> /usr/src/debug/mesa/26.2.4/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.2.3/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.2.4/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.2.3/src/loader -> /usr/src/debug/mesa/26.2.4/src/loader, directory renamed /usr/src/debug/mesa/26.2.3/src/compiler/nir -> /usr/src/debug/mesa/26.2.4/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.2.3/src/vulkan/wsi -> /usr/src/debug/mesa/26.2.4/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.2.3/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.2.4/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.2.3/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.2.4/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/ds -> /usr/src/debug/mesa/26.2.4/src/intel/ds,
  directory renamed /usr/src/debug/mesa/26.2.3/src/gallium/auxiliary -> /usr/src/debug/mesa/26.2.4/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/dev -> /usr/src/debug/mesa/26.2.4/src/intel/dev, directory renamed /usr/src/debug/mesa/26.2.3/src/mesa/program -> /usr/src/debug/mesa/26.2.4/src/mesa/program, directory renamed /usr/src/debug/mesa/26.2.3/src/vulkan/util -> /usr/src/debug/mesa/26.2.4/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.2.3/src/compiler/spirv -> /usr/src/debug/mesa/26.2.4/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/vulkan -> /usr/src/debug/mesa/26.2.4/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.2.3/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.2.4/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.2.3/src/nouveau/headers -> /usr/src/debug/mesa/26.2.4/src/nouveau/headers, directory renamed /usr/src/debug/mesa/26.2.3/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/2
 6.2.4/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/perf -> /usr/src/debug/mesa/26.2.4/src/intel/perf, directory renamed /usr/src/debug/mesa/26.2.3/src/virtio/vulkan -> /usr/src/debug/mesa/26.2.4/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/shaders -> /usr/src/debug/mesa/26.2.4/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.2.3/src/util -> /usr/src/debug/mesa/26.2.4/src/util, directory renamed /usr/src/debug/mesa/26.2.3/src/vulkan/runtime -> /usr/src/debug/mesa/26.2.4/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.2.3/src/util/format -> /usr/src/debug/mesa/26.2.4/src/util/format, directory renamed /usr/src/debug/mesa/26.2.3/src/intel/isl -> /usr/src/debug/mesa/26.2.4/src/intel/isl, directory renamed /usr/src/debug/mesa/26.2.3/src/mesa -> /usr/src/debug/mesa/26.2.4/src/mesa
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 84436712 to 84457192 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.2.3" to "26.2.4"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.2.3 [default] to 26.2.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.2.3" to "26.2.4"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.2.3.so moved to /usr/lib/libgallium-26.2.4.so

--===============0873413403893321578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mesa-changelog.txt"

TWVzYSAyNi4yLjMgUmVsZWFzZSBOb3RlcyAvIDIwMjYtMDktMTYKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KCk1lc2EgMjYuMi4zIGlzIGEgYnVnIGZpeCByZWxlYXNlIHdo
aWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2UgdGhlIDI2LjIuMgpyZWxlYXNlLgoKTWVzYSAyNi4y
LjMgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQuNiBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRl
ZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9OKSBvciBnbEdldEludGVnZXJ2KEdMX01BSk9SX1ZF
UlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9NSU5PUl9WRVJTSU9OKSBkZXBlbmRzIG9uIHRoZSBw
YXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgpTb21lIGRyaXZlcnMgZG9uJ3Qgc3VwcG9ydCBh
bGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGluIE9wZW5HTCA0LjYuIE9wZW5HTAo0LjYgaXMgKipv
bmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3RlZCBhdCBjb250ZXh0IGNyZWF0aW9uLgpDb21wYXRp
YmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQgYSBsb3dlciB2ZXJzaW9uIGRlcGVuZGluZyBvbiBl
YWNoIGRyaXZlci4KCk1lc2EgMjYuMi4zIGltcGxlbWVudHMgdGhlIE9wZW5DTCAzLjEgQVBJLCBi
dXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIENMX0RFVklDRV9WRVJTSU9OLCBDTF9ERVZJ
Q0VfTlVNRVJJQ19WRVJTSU9OIGFuZApDTF9ERVZJQ0VfT1BFTkNMX0NfQUxMX1ZFUlNJT05TCmNs
R2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJl
aW5nIHVzZWQuCgpNZXNhIDI2LjIuMyBpbXBsZW1lbnRzIHRoZSBWdWxrYW4gMS40IEFQSSwgYnV0
IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBhcGlWZXJzaW9uIHByb3BlcnR5IG9mIHRoZSBW
a1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBzdHJ1Y3QKZGVwZW5kcyBvbiB0aGUgcGFydGljdWxh
ciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBjaGVja3N1bXMKLS0tLS0tLS0tLS0tLQoKOjoKCiAg
ICBTSEEyNTY6IDE2MjgwNThhOGQyYzA2MTU5NzVkZTVhMTVhYjdiYmI5NjM4YzUwMDAwYjViZWQ5
NDU2ZmY0MjNlYTAzNGE4MWYKICAgIG1lc2EtMjYuMi4zLnRhci54egogICAgU0hBNTEyOiBlYzYy
MTczNWFlNDY3OTc2MmVhMjdiOTc5YTUzMTRjN2FlY2ZkZDQxNjVhZmVhMTljOGM1NWY5MzNkNzli
NDBmMDFmYQogICAgMDQxYTk1ODc0ZmM0MzQ3ZTczMmFjNTY1Nzg2ZDliNjE2YTlhYTg4NTZhNDIy
MjA0ZDllY2M5YTEyZWM0CiAgICBtZXNhLTI2LjIuMy50YXIueHoKCk5ldyBmZWF0dXJlcwotLS0t
LS0tLS0tLS0KCi0gTm9uZQoKQnVnIGZpeGVzCi0tLS0tLS0tLQoKLSBOVksgbWVtb3J5IGxlYWsg
aW4gQ21kQ29weUJ1ZmZlclRvSW1hZ2UgaW4gMjYuMi4wLCAyNi4yLjEgYW5kIDI2LjIuMi4KLSBS
QURWOiBHUFUgcGFnZSBmYXVsdCAobnVsbCBwb2ludGVyKSB3aXRoIFJUIGVtdWxhdGlvbiBvbiBQ
b2xhcmlzIChSWCA1ODAKICAyMDQ4U1ApLiBJc3N1ZSBiZXR3ZWVuIDI2LjEuNiBhbmQgMjYuMi4x
Ci0gW0FOVl1bQVJMXVtiaXNlY3RlZF0gVmlzdWFsIGdyYXBoaWNzIGdsaXRjaGVzIGluIENvdW50
ZXItU3RyaWtlIDIgc3RhcnRpbmcgaW4KICBNZXNhIDI2LjIueAotIFtyYWRlb25zaV0gTWluZWNy
YWZ0IFZveHkgbW9kOiBEaXN0YW50IHdhdGVyIHJlbmRlcmluZyBpc3N1ZSBvbiBWZWdhIGlHUFUg
YW5kCiAgUkROQTIKLSBcYGhldmNfdmFhcGlgIG9uIEFNRCAocmFkZW9uc2kvZ2Z4MTE1MCkgc3Rh
bGxzIHRvIH4xIGZwcyB3aGVuIGlucHV0IGZyYW1lcwogIGNhcnJ5IEEvNTMgKENFQS02MDgvNzA4
KSBjbG9zZWQtY2FwdGlvbiBzaWRlIGRhdGEKLSBhbnY6IFRlc3QgZmFpbHMgaW4gc2ltdWxhdGlv
biBkdWUgdG8gY29hcnNlIHBpeGVsIHNoYWRpbmcgc3RhdGUKLSBhc2FoaTogMTYtYml0IGJsZW5k
aW5nIGludG8gUkdCQTMyRiBwcm9kdWNlcyB6ZXJvIGR1ZSB0byAzMi1iaXQgdGlsZWJ1ZmZlcgog
IGxvYWQKLSBhc2FoaTogU29tZSB0ZXh0dXJlcyBkbyBub3QgcmVuZGVyIGNvcnJlY3RseSBpbiBQ
b3J0YWxzIDIKLSBsaWJ2dWxrYW5faW50ZWwuc28gY3Jhc2ggd2l0aCBYLVBsYW5lIDEyLjQuMyBv
biBJbnRlbCBBcmMgQjU4MAotIG5pcmNhY2hlIGNhdXNlcyBnbHhnZWFycy9lZ2xnZWFycyB0byBz
ZWdmYXVsdCB1bmRlciBaaW5rCi0gdnVsa2FuLHJhZHY6IHdoZW4gdXNpbmcgZGVzY3JpcHRvciBo
ZWFwcywgaW5wdXQgYXR0YWNobWVudHMgaW4gU1BJUi1WIGFyZQogIGluY29ycmVjdGx5IGRldGVj
dGVkIGFzIHJlYWQgb25seSBpbnN0ZWFkIG9mIHJlYWQgd3JpdGUKCkNoYW5nZXMKLS0tLS0tLQoK
QWx5c3NhIFJvc2VuendlaWcgKDEpOgotIG1lc2Evc3Q6IGZpeCBpbmNvcnJlY3QgVlMgaW5wdXQg
YmFzZXMKQW5kcnplaiBEYXRjenVrICgxKToKLSBhYy9zcXR0LCByYWR2LCByYWRlb25zaTogRml4
IFNRVFQgYnVmZmVyIHNpemUgYWxpZ25tZW50IGlzc3VlcwpCZW5qYW1pbiBDaGVuZyAoMSk6Ci0g
cmFkZW9uc2k6IHNldCBzdGVuY2lsIGNsZWFyIHRvIDAgd2hlbiBlbmFibGluZyBUQyBjb21wYXQK
Q2FpbyBPbGl2ZWlyYSAoMSk6Ci0gc3BpcnY6IFByZXNlcnZlIGFsbCBmcF9tYXRoX2N0cmwgYml0
cyBpbiB2dG5faGFuZGxlX2FsdSBkZWZhdWx0IGNhc2UKQ2hyaXN0aWFuIEdtZWluZXIgKDIpOgoK
LSBldG5hdml2OiBEbyBub3QgYWJvcnQgb24gdW5zdXBwb3J0ZWQgc3RlbmNpbC1vbmx5IGJsaXRz
Ci0gZXRuYXZpdjogVXNlIFJTIGRlcHRoIGZvcm1hdHMgb25seSBvbiBoYWx0aTUrCgpEYW55bG8g
UGlsaWFpZXYgKDUpOgoKLSB0dTogV2FpdCBmb3IgWEZCIHF1ZXJ5IHdyaXRlcyB0byBsYW5kIGJl
Zm9yZSBtYWtpbmcgaXQgYXZhaWxhYmxlCi0gdHU6IFN5bmNocm9uaXppbmcgd2l0aCBDbWRDb3B5
UXVlcnlQb29sUmVzdWx0IHNob3VsZCB3YWl0IGZvciBtZW0gd3JpdGVzCi0gdHU6IFVzZSBwX2F0
b21pY19yZWFkIHRvIHJlYWQgZnJvbSBxdWVyeSdzIHNsb3QtPmF2YWlsYWJsZQotIHR1OiBGaXgg
UEFDS0VEICsgYWxpZ25hcyg4KSBhcHBsaWNhdGlvbiB0byB0aGUgc2FtZSBzdHJ1Y3Qgb24gb2xk
ZXIgR0NDCi0gdHU6IEhhbmRsZSBsYXp5IG1lbW9yeSBpbiBHZXREZXZpY2VNZW1vcnlPcGFxdWVD
YXB0dXJlQWRkcmVzcwoKRGF2aWQgUm9zY2EgKDIpOgoKLSB2YTogRHJvcCBIRVZDIFNFSSBwYXJz
aW5nCi0gcmFkdi92aWRlbzogRml4IHNldHRpbmcgc2Vzc2lvbiBwYXJhbWV0ZXJzIG92ZXJyaWRl
IGluZm8KCkRtaXRyeSBCYXJ5c2hrb3YgKDgpOgoKLSBpcjM6IGtlZXAgYnl0ZSBTU0JPIG9mZnNl
dHMgYmVmb3JlIGE2eHgKLSBmcmVlZHJlbm8vYTV4eDogb25seSAyRC1ibGl0IGJldHdlZW4gY29t
cGF0aWJsZSBmb3JtYXRzCi0gZnJlZWRyZW5vL2E1eHg6IHByb2dyYW0gTlVNTk9OUE9TVkFSIHdp
dGggcG9zaXRpb24ncyBWUEMgbG9jYXRpb24KLSBmcmVlZHJlbm8vYTR4eCthNXh4OiBjbGFtcCB0
aGUgdGV4dHVyZSBidWZmZXIgc2l6ZQotIGZyZWVkcmVubzoga2VlcCB0aGUgc2VwYXJhdGUgc3Rl
bmNpbCBvdXQgb2YgdGhlIHNoYWRvdyBibGl0Ci0gZnJlZWRyZW5vL2E1eHg6IGJsaXQgdGhlIHNl
cGFyYXRlIHN0ZW5jaWwgcGxhbmUgdG9vCi0gaXIzOiBza2lwIHRoZSBwaGlzIG9mIG5vbi1HUFIg
cmVnaXN0ZXJzIGluIHRoZSBtaW5pbXVtIHByZXNzdXJlIGJvdW5kCi0gZnJlZWRyZW5vL2E1eHg6
IGJvdW5kIGJsaXRzIGJ5IHRoZSBsYXllciBjb3VudCwgbm90IHRoZSBkZXB0aAoKRW1tYSBBbmhv
bHQgKDMpOgoKLSB0dTogRHJvcCBUUkFOU0ZFUl9TUkMvRFNUIGZyb20gYnVmZmVyRmVhdHVyZXMu
Ci0gdHU6IEZpeCB0aGUgc1R5cGUgb2YgdGhlIHJldHVybmVkIFZrRnJhZ21lbnRTaGFkaW5nUmF0
ZUtIUnMuCi0gdHU6IEZpeCBkZXN0cm95IG9yZGVyIG9mIGF1dG90dW5lIHZzIHBlcmZjb3VudGVy
cyBpbiBmYWlsdXJlIHBhdGguCgpFcmljIEVuZ2VzdHJvbSAoNCk6CgotIGRvY3M6IGFkZCBzaGEg
c3VtIGZvciAyNi4yLjIKLSAucGlja19zdGF0dXMuanNvbjogVXBkYXRlIHRvIDlmNDJlYTEyMzkw
MjVkM2Y5M2Q5YmJmNzQwNTM0MGFkY2VjOTQ0MTkKLSAucGlja19zdGF0dXMuanNvbjogTWFyayBm
NDU4MjVhMGM3MjRkMDZmMjMxYTEyMTA0ODRmZTlhZjcxYTNmZmFiIGFzCiAgZGVub21pbmF0ZWQK
LSAucGlja19zdGF0dXMuanNvbjogTWFyayA4NTlmY2MzYjc0ZjgzMWJiYjkxNTFmMDZkMDU1ZGRm
ZDQ1Y2M2ZTUwIGFzCiAgZGVub21pbmF0ZWQKCkZyYW5rIEJpbm5zICgzKToKCi0gcHZyOiBhZGQg
bWlzc2luZyBHUFUgYXJjaGl0ZWN0dXJlIHRvIGRldmljZSBpbmZvIGZvciBzb21lIEJWTkNzCi0g
cHZyOiBmaXh1cCBvcmRlcmluZyBvZiAoaGFzXF8pdXNjX2l0cl9wYXJhbGxlbF9pbnN0YW5jZXMg
aW4gZGV2IGluZm8KLSB6aW5rOiByZXBsYWNlIGJsZW5kIGFuZCB2ZXJ0ZXggZWxlbWVudHMgc3Rh
dGUgaGFzaGVzIHdpdGggSURzCgpHYW5lc2ggQmVsZ3VyIFJhbWFjaGFuZHJhICgxKToKLSBhbWQ6
IGFkZCBnZngxMTcxCkdlb3JnIExlaG1hbm4gKDIpOgoKLSBuaXIvb3B0X3V1YjogZml4IGltYXgg
b3B0aW1pemF0aW9uCi0gYWNvOiBhdm9pZCBtdWJ1ZiBib3VuZHMgY2hlY2tpbmcgZm9yIGdsb2Jh
bAoKSXbDoW4gQnJpYW5vICgxKToKLSBhbnY6IGZpeCBwdXNoIGNvbnN0YW50IHJhbmdlIGdhdGhl
cmluZyBmb3IgZHluYW1pYyBvZmZzZXRzCkppeXUgWWFuZyAoMSk6Ci0gY2xjOiBmaXggZmQgbGVh
ayBpbiBvcGVuX2NsY19kYXRhKCkgb24gbWFwIGZhaWx1cmUKSnVzdG9uIExpICgxKToKLSBhbnYv
YW5kcm9pZDogRG9uJ3QgZGlzYWJsZSBBVVhfQklUIGltcG9ydGluZyBYZTIrIENDUyBtb2QgaW1h
Z2VzCkthcm1qaXQgTWFoaWwgKDEpOgotIHR1OiBGaXggc3BhcnNlIGJpbmQgY29sdW1uIG1lcmdp
bmcKS2Fyb2wgSGVyYnN0ICgyKToKCi0gbmlyL3NlcmlhbGl6ZTogc2V0IGluZm8uc3BlYyB0byBO
VUxMCi0gcnVzdGljbC9ldmVudDogcHJvcGVybHkgaW1wbGVtZW50IENMX1BST0ZJTElOR19JTkZP
X05PVF9BVkFJTEFCTEUgZXJyb3IKICBjb25kaXRpb24KCktvc3RhZGluIFNoaXNobWFub3YgKDEp
OgotIGFjbzogYWRkIG1pc3NpbmcgPGFsZ29yaXRobT4gaW5jbHVkZQpMZW9uIFBlcmlhbnUgKDEp
OgotIHB2cjogRml4IHByaW1pdGl2ZSByZXN0YXJ0IGZvciBub24taW5kZXhlZCBkcmF3cwpMaW9u
ZWwgTGFuZHdlcmxpbiAoNik6CgotIGFudjogZml4IDY0Yml0IHZhbHVlcyBwcm9tb3RlZCB0byBp
bmxpbmUgcmVnaXN0ZXIKLSBicnc6IHVzZSBzYW1wbGVyIGZyb20gaW5jb21pbmcgaW5zdHJ1Y3Rp
b25zIGZvciBjb21iaW5lcgotIGFudjogZml4dXAgZHluYW1pYyBidWZmZXJzIHdpdGggQU5WX0RF
QlVHPWJpbmRsZXNzCi0gYW52OiBlbWl0IENQQiBzZXR1cCBhdCBkZXZpY2UgaW5pdGlhbGl6YXRp
b24KLSBhbnY6IGZpeCBzeW5jaHJvbml6YXRpb24gb2YgYWNjZWxlcmF0aW9uIHN0cnVjdHVyZSBx
dWVyeSB3cml0ZXMKLSBhbnY6IGFkZCBtaXNzaW5nIGhhbmRsaW5nIGZvciBQSVBFTElORV9TVEFH
RV8yX0NPUFlfSU5ESVJFQ1QKCkxpdml1IFByb2RlYSAoMSk6Ci0gY2xjOiBGaXggc3RhdGljIGxp
bmsgd2l0aCBsbHZtIGFuZCBjbGFuZyAyMwpNYXJlayBPbMWhw6FrICgxKToKLSByYWR2OiBmaXgg
c1JHQiBjb2xvciBjbGVhcnMgdmlhIGNvbXB1dGUKTWFyeSBHdWlsbGVtYXJkICgxKToKLSBhc2Fo
aTogQWRkIHRoZSBzYW1lIHdvcmthcm91bmQgYXMgRmlyZWZveCBmb3IgWmVuIGJyb3dzZXIKTWF0
dCBUdXJuZXIgKDIpOgoKLSBtZXNhL3N0OiB1c2UgY29uY3JldGUgZm9ybWF0cyBmb3IgbG93ZXJl
ZCBZVVYgcGxhbmUgdmlld3MKLSBkcmk6IHVzZSBjb25jcmV0ZSBmb3JtYXRzIGZvciB0aGUgR1I4
OCwgODg4OCBhbmQgc1JHQiBEUk0gZm9ybWF0cwoKTWVsIEhlbm5pbmcgKDIpOgoKLSBudms6IEZp
eCBtZW1vcnkgbGVhayBpbiBjb21wdXRlIHNhdmUvcmVzdG9yZQotIG52azogRml4IGxlYWsgb2Yg
ZGV2LT5oZWFwIGFuZCBkZXYtPnJlcGxheV9oZWFwCgpNaWNoYWVsIENoZW5nICgxKToKLSB1dGls
L2RyaXJjOiBjaGFuZ2UgbWluX3ZhbHVlIHRvIG1heF92YWx1ZSB0eXBvCk1pa2UgQmx1bWVua3Jh
bnR6ICgyKToKCi0gbGx2bXBpcGU6IGZvcmNlIGFsaWdubWVudCBmb3IgV2luZG93cyB0ZXh0dXJl
IGFsbG9jYXRpb25zCi0gbnR2OiBpbXByb3ZlIGRlcmVmIHR5cGUgbWF0Y2hpbmcgd2hlbiBjb252
ZXJ0aW5nIHZyaSBkZXJlZnMKClBhdmVsIE9uZHJhxI1rYSAoMSk6Ci0gcjMwMDogZG9uJ3QgcHJv
cGFnYXRlIG5lZ2F0aW9uIHRocm91Z2ggYWJzb2x1dGUgdmFsdWVzClJoeXMgUGVycnkgKDQpOgoK
LSByYWR2OiBkb24ndCBzZXQgbXVsYWRkX3N1cHBvcnRfcHJlZmVyc19zcGxpdCB3aGVuIGZmbWEg
aXMgdW5zdXBwb3J0ZWQKLSByYWR2OiBpbml0aWFsaXplIHNoYWRlcl9ibGFrZTMgZm9yIHNoYWRl
ciBvYmplY3RzCi0gcmFkdjogaGFzaCBkZXNjcmlwdG9yIHNldCBsYXlvdXRzIGluIHJhZHZfaGFz
aF9ncmFwaGljc19zcGlydl90b19uaXIKLSByYWRlb25zaTogdXNlIGFjX3NoYWRlcl9jb25maWc6
Omxkc19zaXplIGZyb20gQUNPCgpSb2hhbiBHYXJnICgxKToKLSBuaXI6IGRlcml2ZSBjb2xvcl9p
c19kdWFsX3NvdXJjZSBmcm9tIGRlY2xhcmVkIHZhcnMKUnlhbiBNY2tlZXZlciAoMSk6Ci0gcGFu
dmsvdjYtNzogaW5jbHVkZSByZXF1aXJlZCBsYXlvdXRzIGluIGhvc3QgaW1hZ2UgY29weSBsYXlv
dXRzClJ5YW4gWmhhbmcgKDMpOgoKLSB3c2kvd2F5bGFuZDogc2tpcCBmZWVkYmFjayBkaXNwYXRj
aCB3aGVuIG5vdGhpbmcgaXMgb3V0c3RhbmRpbmcKLSBwYW52azogaW5pdGlhbGl6ZSBDUFUgdHJh
Y2luZyBjYXRlZ29yaWVzCi0gcGFudmsvdXRyYWNlOiByZXBsYWNlIGJvZ3VzIGFzc2VydCB3aXRo
IHN0YXRpY19hc3NlcnQgaW4gcGVyZmV0dG8gYmVnaW4gZXZlbnQKICBjYWxsYmFjawoKU2FtdWVs
IFBpdG9pc2V0ICgzKToKCi0gcmFkdjogZml4IEwwX0NBQ0hFX0hJVF9SQVRJTyBwZXJmIGNvdW50
ZXIgb24gR0ZYMTEKLSByYWR2OiByZXR1cm4gVktfRVJST1JfREVWSUNFX0xPU1QgaWYgYW55IHNo
YWRlciBleGVjdXRlZCBPcEFib3J0S0hSCi0gcmFkdjogY29uc2lkZXIgc2hhZGVyIGFib3J0IGZh
dWx0cyB3aXRoIFZLX0tIUl9kZXZpY2VfZmF1bHQKClNpbHZpbyBWaWxlcmlubyAoMik6CgotIGQz
ZDEyOiBGaXggZDNkMTIgdmlkZW8gZW5jb2RlciBiYXRjaCBsZWFrcwotIGQzZDEyOiBGaXggZDNk
MTIgdmlkZW8gZGVjb2RlciBiYXRjaCBsZWFrcwoKVGFrdXJvIEFzaGllICgxKToKLSBwYW5mcm9z
dDogUmVhbGxvY2F0ZSBCTyB3aGVuIGxpbmVhciBsYXlvdXQgZ3Jvd3MKVGFwYW5pIFDDpGxsaSAo
Myk6CgotIGFudjogY2hhbmdlIGJpbmRsZXNzIGRlYnVnIGVudiB2YXJpYWJsZSB0byBiZSBkcmly
YyBvcHRpb24KLSBhbnY6IHRvZ2dsZSBhbnZfYWx3YXlzX2JpbmRsZXNzIGZvciBYUGxhbmUtMTIK
LSBhbnY6IGZpeCBjbWRfYnVmZmVyX3NldF9pbmRpcmVjdF9zdHJpZGUgb24gQVJMCgpWYW5kb21h
cyAoMSk6Ci0gemluazogcHV0IHRoZSBidWZmZXIgdmlldyBjYWNoZSBrZXkgZmlyc3QKVmluc29u
IExlZSAoMik6CgotIGdsc2w6IGluaXRpYWxpemUgcGl4ZWxfbG9jYWxfc3RvcmFnZSBhbmQgeXV2
IGluIGlyX3ZhcmlhYmxlIGNvbnN0cnVjdG9yCi0gZ2xzbDogaW5pdGlhbGl6ZSBpc19nbG9iYWwg
aW4gaXJfdmFyaWFibGVfcmVmY291bnRfZW50cnkgY29uc3RydWN0b3IKClbDrWN0b3IgTWFudWVs
IErDoXF1ZXogTGVhbCAoMSk6Ci0gcmFkdi92aWRlbzogcmVwb3J0IGhhc092ZXJyaWRlcyBvbiBB
VjEgZW5jb2RpbmcKWWl3ZWkgWmhhbmcgKDEpOgotIHBhbnZrOiBwbGFjZSBjb2hlcmVudCBtZW1v
cnkgdHlwZSBiZWZvcmUgY2FjaGVkIHR5cGUKcmFqYXJ5YW4xNDkyMDA3ICgxKToKLSBzcGlydjog
RG9uJ3QgaW1wbGljaXRseSBzZXQgQUNDRVNTX05PTl9XUklURUFCTEUgZm9yIGlucHV0IGF0dGFj
aG1lbnRzCgpNZXNhIDI2LjIuNCBSZWxlYXNlIE5vdGVzIC8gMjAyNi0xMC0wMQo9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKTWVzYSAyNi4yLjQgaXMgYSBidWcgZml4IHJl
bGVhc2Ugd2hpY2ggZml4ZXMgYnVncyBmb3VuZCBzaW5jZSB0aGUgMjYuMi4zCnJlbGVhc2UuCgpN
ZXNhIDI2LjIuNCBpbXBsZW1lbnRzIHRoZSBPcGVuR0wgNC42IEFQSSwgYnV0IHRoZSB2ZXJzaW9u
IHJlcG9ydGVkIGJ5CmdsR2V0U3RyaW5nKEdMX1ZFUlNJT04pIG9yIGdsR2V0SW50ZWdlcnYoR0xf
TUFKT1JfVkVSU0lPTikgLwpnbEdldEludGVnZXJ2KEdMX01JTk9SX1ZFUlNJT04pIGRlcGVuZHMg
b24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJlaW5nIHVzZWQuClNvbWUgZHJpdmVycyBkb24ndCBz
dXBwb3J0IGFsbCB0aGUgZmVhdHVyZXMgcmVxdWlyZWQgaW4gT3BlbkdMIDQuNi4gT3BlbkdMCjQu
NiBpcyAqKm9ubHkqKiBhdmFpbGFibGUgaWYgcmVxdWVzdGVkIGF0IGNvbnRleHQgY3JlYXRpb24u
CkNvbXBhdGliaWxpdHkgY29udGV4dHMgbWF5IHJlcG9ydCBhIGxvd2VyIHZlcnNpb24gZGVwZW5k
aW5nIG9uIGVhY2ggZHJpdmVyLgoKTWVzYSAyNi4yLjQgaW1wbGVtZW50cyB0aGUgT3BlbkNMIDMu
MSBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRlZCBieQp0aGUgQ0xfREVWSUNFX1ZFUlNJT04s
IENMX0RFVklDRV9OVU1FUklDX1ZFUlNJT04gYW5kCkNMX0RFVklDRV9PUEVOQ0xfQ19BTExfVkVS
U0lPTlMKY2xHZXREZXZpY2VJbmZvIHF1ZXJpZXMgZGVwZW5kcyBvbiB0aGUgcGFydGljdWxhciBk
cml2ZXIgYmVpbmcgdXNlZC4KCk1lc2EgMjYuMi40IGltcGxlbWVudHMgdGhlIFZ1bGthbiAxLjQg
QVBJLCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIGFwaVZlcnNpb24gcHJvcGVydHkg
b2YgdGhlIFZrUGh5c2ljYWxEZXZpY2VQcm9wZXJ0aWVzIHN0cnVjdApkZXBlbmRzIG9uIHRoZSBw
YXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgoKU0hBIGNoZWNrc3VtcwotLS0tLS0tLS0tLS0t
Cgo6OgogICAgVEJELgoKTmV3IGZlYXR1cmVzCi0tLS0tLS0tLS0tLQoKLSBOb25lCgpCdWcgZml4
ZXMKLS0tLS0tLS0tCgotICJUWSB0aGUgVGFzbWFuaWFuIFRpZ2VyIDMiIGFsd2F5cyBjcmFzaGVz
IGluIHRoZSBzYW1lIGN1dHNjZW5lIG9uIGFtZCBncHVzCi0gVktfVkFMVkVfdmlkZW9fZW5jb2Rl
X3JnYl9jb252ZXJzaW9uIGFsd2F5cyBvdXRwdXRzIGxpbWl0ZWQgY29sb3IgcmFuZ2UKLSBYLVBs
YW5lIDEyICgyMDE0NzgwKSBGbGlja2VyaW5nIGFydGlmYWN0cyBvbiB0ZXh0dXJlcyB3aXRoIElu
dGVsIEFyYyBCNTgwCi0gW0RHMl0gQU5WOiBFbnNocm91ZGVkICgxMjAzNjIwKSAtIGNoYXJhY3Rl
ciBpbnZpc2libGUsIHRyYW5zcGFyZW50IGJpbGxib2FyZHMKICByZW5kZXJlZCBhcyBvcGFxdWUg
c3BoZXJlcyBvbiBkaXNjcmV0ZSBBcmMgR1BVCi0gW1JBRFZdIEdGWDg6IEJsYWNrIHNjcmVlbiBp
biBVRTUgRFgxMiAoSGFsZiBTd29yZCkgYWZ0ZXIgY29tbWl0IDE1OTkwYzc4YjhlCiAgKCJhbGxv
dyBEQ0MgZm9yIGNvbmN1cnJlbnQgaW1hZ2VzIHdpdGhvdXQgRENDIHN0b3JlcyIpCi0gYW52OiBW
S19FWFRfY2FsaWJyYXRlZF90aW1lc3RhbXBzIHJldHVybnMgYSBHUFUgdGltZXN0YW1wIGFoZWFk
IG9mIENQVSB0aW1lIG9uCiAgQXJjIEIzOTAgKFBhbnRoZXIgTGFrZSksIGNyYXNoaW5nIFVucmVh
bCBFbmdpbmUgNS44Ci0gYXNhaGk6IE1hcmlvIEthcnQgV2lpQ29tcGlsZWQgZ3JhcGhpY2FsIGds
aXRjaGVzCi0gZEVRUC1WSy5pbWFnZS5zd2FwY2hhaW5fbXV0YWJsZS53YXlsYW5kLjJkLnI4Zzhi
OGE4X3NyZ2JfcjhnOGI4YThfdW5vcm1fZHJhd190CiAgZXh0dXJlX2Zvcm1hdF9saXN0IGNyYXNo
Ci0gcmFkZW9uc2kvdmE6IHZhR2V0SW1hZ2UgdG8gSTQyMC9ZVVlWIGZhaWxzIHdpdGggVU5TVVBQ
T1JURURfUlRfRk9STUFUIHNpbmNlCiAgTWVzYSAyNi4yIG9uIEdQVXMgd2l0aCBWUEUgKFJhZGVv
biA4OTBNKQotIHJhZGVvbnNpOiBHUFUgcGFnZSBmYXVsdCAoU1FDKSAvIGNvbnRleHQgbG9zcyB3
aGVuIHVzaW5nIElyaXMgc2hhZGVycGFja3Mgb24KICBSWCA5MDcwIFhUIChnZngxMjAxKQotIHJh
ZHY6IE5VTEwgZGVyZWYgaW4gcmFkdl9nZXRfdmd0X3NoYWRlcl9rZXkgYWZ0ZXIgYmluZGluZyBh
IGNvbXB1dGUgc2hhZGVyCiAgb2JqZWN0Ci0gcmFkdjogUENJZSA0LjAgeDQgZmFpbHMgdGhlICJQ
Q0llIDMuMCB4OCIgYmFuZHdpZHRoIGNoZWNrIGZvciBWUkFNIGNvbW1hbmQKICBidWZmZXJzIGJ5
IDQgTUIvcyAocm91bmRlZCBwZXItbGFuZSBjb25zdGFudHMpOyB1cCB0byAxMyUgZGVjb2RlIGxv
c3MgaW4KICBsbGFtYS5jcHAKLSByYWR2OiBVTlJFQUNIQUJMRSBjbGVhcmluZyBERVBUSHxTVEVO
Q0lMIHdoZW4gdGhlIGR5bmFtaWMgcmVuZGVyIHBhc3MgaGFzIG5vCiAgc3RlbmNpbCBhdHRhY2ht
ZW50Ci0gcmFkdjogVmtEZXNjcmlwdG9yVXBkYXRlVGVtcGxhdGUgdGFrZXMgYSBwb2ludGVyIHRv
IHRoZSBzZXRfbGF5b3V0IG1lbW9yeQoKQ2hhbmdlcwotLS0tLS0tCgpBbGxlbiBCYWxsd2F5ICgx
KToKLSBpbnRlbC9jb21waWxlcjogZml4IGJvdW5kcyBjaGVjayBpbiBXYV8xODAzNTY5MDU1NQpC
ZW5qYW1pbiBDaGVuZyAoMSk6Ci0gYWMvdmlkZW86IEFkanVzdCBIRVZDIG1pbl9xcCBmb3IgVkNO
MS9WQ04yCkJvcmlzIEJyZXppbGxvbiAoMik6CgotIHBhbi9rbW9kOiBNYWtlIHN1cmUgYWxsIGV4
ZWN1dGFibGVzIGxpdmUgaW4gdGhlIHNhbWUgNEcgVkEgcmFuZ2UKLSBwYW52azogRG9uJ3QgZG93
bmNhc3QgQ1MgZnVuYyBhZGRyZXNzIHRvIGEgMzItYml0IFZBCgpDYWlvIE9saXZlaXJhICgxKToK
LSBicnc6IFJlLWxvd2VyIGltbWVkaWF0ZSBvZmZzZXRzIGFmdGVyIG1lc2ggbmlyX29wdF9vZmZz
ZXRzCkNocmlzdGlhbiBHbWVpbmVyICgzKToKCi0gbGF2YXBpcGU6IEd1YXJkIEJEQSBoYW5kbGUg
YXJyYXlzIHdpdGggYmRhX2xvY2sKLSBldG5hdml2OiBDYXB0dXJlIHZhcnlpbmdzIG5vdCByZWFk
IGJ5IHRoZSBmcmFnbWVudCBzaGFkZXIKLSBldG5hdml2OiBLZWVwIHRyYW5zZm9ybSBmZWVkYmFj
ayBhY3RpdmUgYWNyb3NzIGZsdXNoZXMKCkNvb3BlciBNb3JnYW4gKDMpOgoKLSB2dWxrYW4vd3Np
OiBrZWVwIHByZXNlbnQgdGltaW5nIHJlY29yZHMgdGhhdCBkbyBub3QgZml0IHRoZSBvdXRwdXQg
YXJyYXkKLSB2dWxrYW4vd3NpOiBrZWVwIEdPT0dMRSBkaXNwbGF5IHRpbWluZyByZWNvcmRzIHRo
YXQgZG8gbm90IGZpdAotIGFudGktbGFnOiBjb252ZXJ0IEdQVSB0aW1lc3RhbXBzIHRvIG5zIGlu
IGRvdWJsZSBwcmVjaXNpb24KCkRhdmlkIFJvc2NhICg4KToKCi0gdnVsa2FuL3ZpZGVvOiBEb24n
dCB1cGRhdGUgT0JVIHNpemUgd2l0aCBOVUxMIGRhdGFfcHRyCi0gdmwvYml0c3RyZWFtOiBGaXgg
Y29kaW5nIHVlKCkgZm9yIGxhcmdlIG51bWJlcnMKLSB2bC9iaXRzdHJlYW06IERvbid0IHVzZSBp
bnRlcm5hbCBidWZmZXIgZm9yIHNpemUgb25seSB1c2UKLSB2bC9iaXRzdHJlYW06IE1vdmUgb3Zl
cmZsb3cgY2hlY2sgdG8gdmxfYml0c3RyZWFtX3dyaXRlX2J5dGVfc3RhcnRfY29kZQotIHJhZHYv
dmlkZW86IEZpeCBoYW5kbGluZyBzaXplIGxpbWl0IGluIEdldEVuY29kZWRWaWRlb1Nlc3Npb25Q
YXJhbWV0ZXJzCi0gdmE6IERyb3AgZm9ybWF0IHN1cHBvcnQgY2hlY2tzIGluIHZsVmFQb3N0UHJv
YwotIHZhOiBEb24ndCBjaGVjayBmb3JtYXQgc3VwcG9ydCBpbiBFbmRQaWN0dXJlIGZvciBwcm9j
ZXNzaW5nCi0gcmFkdi92aWRlbzogT25seSByZXBvcnQgQlQ3MDkvTGltaXRlZCBzdXBwb3J0IGZv
ciBSR0IgY29udmVyc2lvbiBvbiBWQ041CgpEYXZpZCBTYW5kZXJzICgxKToKLSByYWR2OiByZXNl
dCBjb21wdXRlIHBpcGVsaW5lIGFmdGVyIElFUyBpbiB2a0NtZEV4ZWN1dGVHZW5lcmF0ZWRDb21t
YW5kc0VYVApEbWl0cnkgQmFyeXNoa292ICgzKToKCi0gZnJlZWRyZW5vL2EyeHg6IGRvbid0IHR5
cGUtcHVuIHRoZSBpbW1lZGlhdGUgdmFsdWVzIHRocm91Z2ggYSBjYXN0Ci0gdHU6IHJlc29sdmUg
d2lkZSBmb3JtYXRzIHdpdGggYSBzaGFkZXIgb24gQTcwMgotIGZyZWVkcmVuby9xcmlzYzogZml4
IGhhbmcgb24gYTY1MCAvIGE2NjAgZmlybXdhcmUKCkVyaWMgRW5nZXN0cm9tICgyKToKCi0gZG9j
czogYWRkIHNoYSBzdW0gZm9yIDI2LjIuMwotIC5waWNrX3N0YXR1cy5qc29uOiBVcGRhdGUgdG8g
MzBkYTM5MTg3ZDhkM2NmMDNjNThlY2QyYmViYjQ5N2I4NDUwMWY1MQoKRXJpYyBSLiBTbWl0aCAo
MSk6Ci0gcHZyOiBtb3ZlIGFzc2VydCBmb3IgYnVmZmVyIHVzYWdlCkdlb3JnIExlaG1hbm4gKDQp
OgoKLSBhY28vc2NoZWRfdm9wZDogd29yayBhcm91bmQgR0ZYMTEgVk9QRCBpbnRlcmxvY2sgaGF6
YXJkCi0gYWNvL29wdGltaXplcjogZG8gbm90IHRydW5jYXRlIGNvbnN0YW50cyBiZWZvcmUgcmVz
b2x2aW5nIGV4dHJhY3RzCi0gYWNvL29wY29kZXM6IGFkZCBkZXN0L3NyYyB0eXBlcyBmb3IgVk9Q
RCBvcGNvZGVzCi0gYWNvL2luc2VydF9mcF9tb2RlOiBoYW5kbGUgYm90aCB2b3BkIG9wY29kZXMK
CkdsZW5uIEtlbm5hcmQgKDEpOgotIG52MzA6IEZpeCBmb3IgbG9vcHMgaW4gZnJhZ21lbnQgc2hh
ZGVycyBvbiBudjQwCkhlbGVuIEtvaWtlICgxKToKLSB2dWxrYW4vb3ZlcmxheTogRHJhdyBvbiB0
aGUgcHJlc2VudCBxdWV1ZSB3aGVuIHBvc3NpYmxlCklhbiBSb21hbmljayAoMSk6Ci0gYnJ3OiBP
bmx5IEhBTFQgZm9yIHRlcm1pbmF0ZV9pZiBvZiBub24taGVscGVyIHBpeGVscwpJY2Vub3d5IFpo
ZW5nICgzKToKCi0gZ2FsbGl2bTogZml4IGVuYWJsZW1lbnQgb2YgUklTQy1WIFpicyBleHRlbnNp
b24KLSB2dWxrYW4vd3NpOiBzdXBwb3J0IGFsbG9jYXRpbmcgbW9yZSBtZW1vcnkgZm9yIGJ1ZmZl
cnMKLSBtZXNvbjogbGlzdCBNSVBTKDY0KSBpbiBsbHZtX2hhc19tY2ppdCBsaXN0CgpKb2IgTm9v
cm1hbiAoMik6CgotIGlyMzogaW50ZXJwcmV0IGNvbnN0IFxAbG9hZC9zdG9yZV9nbG9iYWxfb2Zm
c2V0IG9mZnNldCBhcyB1bnNpZ25lZAotIG5pci9sb3dlcl90ZXg6IGNvcHkgdGV4dHVyZS9zYW1w
bGVyX25vbl91bmlmb3JtIGZsYWdzCgpKb3NlIE1hcmlhIENhc2Fub3ZhIENyZXNwbyAoMik6Cgot
IHZjNDogaGVscGVyIHZjNF9nZXRfY2xpcF93aW5kb3coKSBmb3IgdGhlIGNsaXAgd2luZG93IGNv
bXB1dGF0aW9uCi0gdmM0OiBza2lwIGRyYXdzIHdob3NlIGNsaXAgd2luZG93IGlzIGVtcHR5CgpK
eW90aXJhbmphbiBCaHV5YW4gKDEpOgotIHJhZGVvbnNpOiBpbnZhbGlkYXRlIEkkL1NNRU0kL1ZN
RU0kIGF0IElCIHN0YXJ0IG9uIGdmeDEyCkthamFsIEthamFsICgyKToKCi0gZnJlZWRyZW5vL2E2
eHg6IHVwbG9hZCBhIGR1bW15IHNhbXBsZXIgd2hlbiB0ZXh0dXJlcyBidXQgbm8gc2FtcGxlcnMg
Ym91bmQKLSBydXN0aWNsL2tlcm5lbDogZW1pdCBpbWFnZS90ZXh0dXJlIGJhcnJpZXJzIGFmdGVy
IGEga2VybmVsIGxhdW5jaAoKS29uc3RhbnRpbiBTZXVyZXIgKDEpOgotIHJhZHYvcnQ6IFJlc3Rv
cmUgaGl0IGF0dHJpYnMgYWZ0ZXIgcmVqZWN0aW5nIEFBQkJzCkxpb25lbCBMYW5kd2VybGluICg2
KToKCi0gYW52OiByZXNwZWN0IGJpdF9zaXplL251bV9jb21wb25lbnQgZnJvbSB0aGUgSVIgd2l0
aCBhY2NlbGVyYXRpb24gc3RydWN0dXJlcwotIGJsb3JwOiBmaXggc2hhZGVyIGtlcm5lbCBwb2lu
dGVyIHdpdGggbXVsdGkgc2l6ZSBrZXJuZWxzCi0gYW52OiBhZGQgbWlzc2luZyBjb25zdGFudCBj
YWNoZSBpbnZhbGlkYXRpb24gaW4gREdDIHBhdGgKLSBuaXIvbG93ZXJfaW5wdXRfYXR0YWNobWVu
dHM6IGFkZCBzdXBwb3J0IGZvciBoZWFwIHN1YnBhc3MgaW1hZ2UgbG9hZAotIGFudjogZGlzYWJs
ZSBEUk1fWEVfREVWSUNFX1FVRVJZX0VOR0lORV9DWUNMRVMgd2l0aCBVbnJlYWxFbmdpbmUgNS44
Ci0gdnVsa2FuL3dzaTogYWRkIG1pc3NpbmcgdXNhZ2UyIGZsYWdzCgpMb3JlbnpvIFJvc3NpICgy
KToKCi0gcGFuL2JpOiBGaXggc3BpbGwgY29zdCBvdmVyZXN0aW1hdGlvbgotIGtyYWlkL29wdF9j
b3B5X3Byb3A6IEZpeCB6ZXJvLWV4dGVuc2lvbiBvbiA2NC1iaXQgc3dpenpsZXMKCkx1aWdpIFNh
bnRpdmV0dGkgKDIpOgoKLSBwdnI6IHNwZWN1bGF0aXZlIGZpeCBmb3Igb3V0LW9mLWJvdW5kIGFj
Y2VzcyBvZiB3aW5zeXNfaGVhcHMKLSBwdnI6IHNldCB0aGUgVU0gc3RyaWRlIHdoZW4gcXVlcnlp
bmcgaGVhcCBzdGF0aWMgYXJlYXMKCk1hcmVrIE9sxaHDoWsgKDEpOgotIHJhZHY6IGZpeCBjaGVj
a2luZyB3aGV0aGVyIGEgRlMgaXMgcHJlc2VudApNYXR0IFR1cm5lciAoMTEpOgoKLSBkcmk6IGFs
bG9jYXRlIE1TQUEgY29sb3IgYnVmZmVycyBmb3IgZHJpc3cgaW1hZ2UgbG9hZGVyIGJ1ZmZlcnMK
LSBsbHZtcGlwZTogZG9uJ3Qgc2tpcCBkcmF3J3Mgdmlld3BvcnQgY2xpcHBpbmcgd2l0aG91dCB0
aGUgbGluZWFyIHJhc3Rlcml6ZXIKLSBtZXNhOiB1c2UgYSBieXRlLWFycmF5IGZvcm1hdCBmb3Ig
R0xfUkdCQTggdGV4dHVyZSBidWZmZXJzCi0gbWVzYTogc3RvcmUgYm9vbGVhbiBjdXN0b20gZ2xH
ZXQgdmFsdWVzIGluIHZhbHVlX2Jvb2wKLSBtZXNhOiBwYWNrIEdMX01BWF9DT01CSU5FRF9ESU1F
TlNJT05TIHdpdGhvdXQgZGVwZW5kaW5nIG9uIGJ5dGUgb3JkZXIKLSBkcmk6IGRlc2NyaWJlIEdS
MTYxNiBhcyBSMTZHMTZfVU5PUk0KLSB1dGlsOiBmaXggdGhlIFozMl9GTE9BVF9TOFgyNF9VSU5U
IGNsZWFyIHZhbHVlIG9uIGJpZy1lbmRpYW4KLSB1dGlsL2Zvcm1hdDogc3RvcmUgUjExRzExQjEw
X0ZMT0FUIGFuZCBSOUc5QjlFNV9GTE9BVCBpbiBob3N0IGJ5dGUgb3JkZXIKLSB1dGlsL2FzdGM6
IHJlYWQgdGhlIDEyOC1iaXQgYmxvY2sgYXMgbGl0dGxlLWVuZGlhbiB3b3JkcwotIHV0aWwvZm9y
bWF0OiBtYWtlIHRoZSBGWFQxIGNvZGVjIGluZGVwZW5kZW50IG9mIGhvc3QgYnl0ZSBvcmRlcgot
IGdhbGxpdm06IHJlaW50ZXJwcmV0IGltYWdlIHRleGVscyB1c2luZyB0aGUgc2hhZGVyJ3MgZm9y
bWF0IHF1YWxpZmllcgoKTWlrZSBCbHVtZW5rcmFudHogKDkpOgoKLSBsYXZhcGlwZTogaW5kZXBl
bmRlbnRseSBjYWxjdWxhdGUgc3JjL2RzdCBibGl0IGRlcHRoCi0gbGF2YXBpcGU6IGFkZCBtb3Jl
IGxheW91dHMgdG8gbHZwX2hvc3RfY29weV9pbWFnZV9sYXlvdXRzCi0gbGF2YXBpcGU6IGhhbmRs
ZSBwbGFuYXIgdmlld3MgYXMgcmVuZGVyaW5nIGF0dGFjaG1lbnRzCi0gbGx2bXBpcGU6IHVzZSBv
c19mcmVlX2FsaWduZWQgZm9yIG5vbi12bWEgY2FzZQotIGxhdmFwaXBlOiB1cGRhdGUgcmV0dXJu
ZWQgc2l6ZSBpbiBHZXRQaXBlbGluZUNhY2hlRGF0YQotIHppbms6IGRvbid0IGNsYWltIFZSQU0g
b24gY3B1IGltcGxlbWVudGF0aW9ucwotIHppbms6IGNoZWNrIHN3YXBjaGFpbiB0aW1saW5lIHdo
ZW4gcHJ1bmluZwotIHppbms6IHN0b3AgbGVha2luZyBzd2FwY2hhaW5zCi0gemluazogY2xhbXAg
cHJlc2VudCByZWdpb25zIHRvIDB4MCB3aGVuIG91dCBvZiBib3VuZHMKCk1pa2hhaWwgTWxoY25u
ICgyKToKCi0gcGFudmsvY3NmOiBmbHVzaCB0aGUgRkFVIHN0b3JlcyBiZWZvcmUgaW5kaXJlY3Qg
ZHJhd3MgcmVhZCB0aGVtCi0gcGFudmsvY3NmOiBnaXZlIGNvbXB1dGUgam9icyB0aGUgVExTIHNp
emUgb2YgdGhlIHNoYXJlZCBhbGxvY2F0aW9uCgpPbGl2ZXIgQ2xhcmtlICgxKToKLSBhc2FoaS9h
Z3g6IEFkZCBzaGlmdCBtYXNrIGZvciBiaXRmaWVsZF9leHRyYWN0IGFuZCBmdXNlZCBzaGlmdCBv
cHMKUGF0cmljayBHYXNraW4gKDEpOgotIGVnbDogZG9uJ3QgY2xvYmJlciBhbiBpbml0aWFsaXpl
ZCBkaXNwbGF5J3MgZGV2aWNlIGluIGVnbEdldFBsYXRmb3JtRGlzcGxheQpSYW5keSBQYWxhbWFy
ICgxKToKLSBhY28vaW5zZXJ0X2ZwX21vZGU6IGZpeCByb3VuZGluZyBtb2RlIGZvciBmbWFfbWl4
aGlfZjE2ClJoeXMgUGVycnkgKDEpOgotIGFjby9yYTogY2hlY2sgbmV4dCByZWdpc3RlciBhZ2Fp
bnN0IGJvdW5kcyBpbiBzdWJkd29yZCBnZXRfcmVnX3NpbXBsZSBwYXRoClJ5YW4gWmhhbmcgKDIp
OgoKLSBwYW52azogdmFsaWRhdGUgZGVzY3JpcHRvciBjb3VudHMgaW4gc2hhZGVyIGRlc2VyaWFs
aXphdGlvbgotIHBhbnZrL2NzZjogY2hlY2sgbWFsbG9jIHJldHVybiB2YWx1ZXMgaW4gcXVldWUg
c3VibWl0IHN0b3JhZ2UgaW5pdAoKU2FtdWVsIFBpdG9pc2V0ICgxMik6CgotIHJhZHY6IGZpeCBp
bml0aWFsaXppbmcgdGhlIERDQyBwcmVkaWNhdGlvbiB2YWx1ZSB3aGVuIHN0b3JlcyBhcmVuJ3Qg
c3VwcG9ydGVkCi0gcmFkdjogZml4IGluaXRpYWxpemluZyBEQ0Mgd2l0aCBtaXBtYXBzIG9uIEdG
WDgKLSByYWR2OiBkaXNhYmxlIGJpbm5pbmcgY29ycmVjdGx5IG9uIEdGWDktMTEKLSByYWR2OiBm
aXggYSB0eXBvIHdoZW4gY29tcHV0aW5nIHRoZSBiaW5uaW5nIHNpemUgb24gR0ZYMTAtMTEuNwot
IHJhZHY6IGFkZCByYWR2X2Rpc2FibGVfYmlubmluZ19nZngxMSBhbmQgZW5hYmxlIGZvciBTdW5z
ZXQgT3ZlcmRyaXZlCi0gbmlyL2xvd2VyX2Fib3J0OiBmaXggcGF5bG9hZCBhbGlnbm1lbnQgdG8g
OC1ieXRlcwotIHJhZHY6IGRvIG5vdCBhYm9ydCB3aGVuIHRoZSBhcHAgc3BlY2lmaWVzIGFuIGlu
dmFsaWQgbW9kaWZpZXIKLSByYWR2OiBkbyBub3QgYWJvcnQgd2hlbiBhIEdQVSBoYW5nIHJlcG9y
dCBpcyBjcmVhdGVkIHdpdGgKICBkZXZpY2VGYXVsdFZlbmRvckJpbmFyeQotIHJhZHY6IGZpeCBk
ZXB0aC9zdGVuY2lsIGFzcGVjdHMgZm9yIHJlc29sdmVzCi0gcmFkdjogZml4IGltbXV0YWJsZSBz
YW1wbGVycyBsaWZldGltZSB3aXRoIGRlc2NyaXB0b3IgdXBkYXRlIHRlbXBsYXRlcwotIHJhZHY6
IGZpeCBkaXJ0eWluZyBncmFwaGljcyBzaGFkZXJzIHdoZW4gc2hhZGVyIG9iamVjdHMgYXJlIGJv
dW5kCi0gcmFkdjogaWdub3JlIGFzcGVjdHMgdGhhdCBoYXZlIG5vIGVmZmVjdHMgZHVyaW5nIGNs
ZWFycwoKVGFwYW5pIFDDpGxsaSAoMSk6Ci0gYW52OiBhZGQgYWRkaXRpb25hbCBoZXVyaXN0aWMg
dG8gc2ltZDMyIGFzc3VtcHRpb24gcGFzcwpUaW1vdGh5IEFyY2VyaSAoMSk6Ci0gbmlyOiB0ZW1w
b3JhcmlseSBkaXNhYmxlIGZsb2F0aW5nIHBvaW50IGV4Y2VwdGlvbiBmbGFncwpUdXBpbGkgS3Jp
c2huYSBHb3d0aGFtIFJlZGR5ICgxKToKLSBmcmVlZHJlbm8vYTZ4eDogZW5hYmxlIGYxNiBpbmZp
bml0aWVzIGZvciBmcmVlZHJlbm8gZHJpdmVyClZhbGVudGluZSBCdXJsZXkgKDIpOgoKLSBuaXIv
bG93ZXJfc3ViZ3JvdXBzOiBGaXggdm90ZSBsb3dlcmluZyB3aXRoIHZlY3RvciBiYWxsb3RzCi0g
aXIzOiBMb3dlciBxdWFkIHZvdGVzCgpWaW5zb24gTGVlICgxKToKLSBwcHM6IEluaXRpYWxpemUg
Q291bnRlciBtZW1iZXIgdmFyaWFibGUgdW5pdHMKVmluw61jaXVzICgxKToKLSBhYy9ncHVfaW5m
bzogbWFrZSBQQ0llIDQuMCBhbmQgNS4wIGxhbmUgYmFuZHdpZHRoIGV4YWN0IG11bHRpcGxlcyBv
ZiAzLjAKWWl3ZWkgWmhhbmcgKDEpOgotIHBhbi9rbW9kOiBkdW1teSBCTyBpcyBwZXIgVk0gZm9y
IGVtdWxhdGVkIHNwYXJzZQpqb2Uud2FuZyAoMSk6Ci0gcmFkdjogYWxzbyBhcHBseSB0aGUgRGlS
VCA0IEhpWiB3b3JrYXJvdW5kIHByb2ZpbGUgdG8gdGhlIG5hdGl2ZSBwb3J0Cm1hdHRoZXdwZXJp
dXQgKDEpOgotIHZlbnVzOiBob25vciB0aGUgdmlydGlvLWdwdSBibG9iIGFsaWdubWVudAo=

--===============0873413403893321578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mesa-tools-native-changelog.txt"

TWVzYSAyNi4yLjMgUmVsZWFzZSBOb3RlcyAvIDIwMjYtMDktMTYKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KCk1lc2EgMjYuMi4zIGlzIGEgYnVnIGZpeCByZWxlYXNlIHdo
aWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2UgdGhlIDI2LjIuMgpyZWxlYXNlLgoKTWVzYSAyNi4y
LjMgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQuNiBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRl
ZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9OKSBvciBnbEdldEludGVnZXJ2KEdMX01BSk9SX1ZF
UlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9NSU5PUl9WRVJTSU9OKSBkZXBlbmRzIG9uIHRoZSBw
YXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgpTb21lIGRyaXZlcnMgZG9uJ3Qgc3VwcG9ydCBh
bGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGluIE9wZW5HTCA0LjYuIE9wZW5HTAo0LjYgaXMgKipv
bmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3RlZCBhdCBjb250ZXh0IGNyZWF0aW9uLgpDb21wYXRp
YmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQgYSBsb3dlciB2ZXJzaW9uIGRlcGVuZGluZyBvbiBl
YWNoIGRyaXZlci4KCk1lc2EgMjYuMi4zIGltcGxlbWVudHMgdGhlIE9wZW5DTCAzLjEgQVBJLCBi
dXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIENMX0RFVklDRV9WRVJTSU9OLCBDTF9ERVZJ
Q0VfTlVNRVJJQ19WRVJTSU9OIGFuZApDTF9ERVZJQ0VfT1BFTkNMX0NfQUxMX1ZFUlNJT05TCmNs
R2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJl
aW5nIHVzZWQuCgpNZXNhIDI2LjIuMyBpbXBsZW1lbnRzIHRoZSBWdWxrYW4gMS40IEFQSSwgYnV0
IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBhcGlWZXJzaW9uIHByb3BlcnR5IG9mIHRoZSBW
a1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBzdHJ1Y3QKZGVwZW5kcyBvbiB0aGUgcGFydGljdWxh
ciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBjaGVja3N1bXMKLS0tLS0tLS0tLS0tLQoKOjoKCiAg
ICBTSEEyNTY6IDE2MjgwNThhOGQyYzA2MTU5NzVkZTVhMTVhYjdiYmI5NjM4YzUwMDAwYjViZWQ5
NDU2ZmY0MjNlYTAzNGE4MWYKICAgIG1lc2EtMjYuMi4zLnRhci54egogICAgU0hBNTEyOiBlYzYy
MTczNWFlNDY3OTc2MmVhMjdiOTc5YTUzMTRjN2FlY2ZkZDQxNjVhZmVhMTljOGM1NWY5MzNkNzli
NDBmMDFmYQogICAgMDQxYTk1ODc0ZmM0MzQ3ZTczMmFjNTY1Nzg2ZDliNjE2YTlhYTg4NTZhNDIy
MjA0ZDllY2M5YTEyZWM0CiAgICBtZXNhLTI2LjIuMy50YXIueHoKCk5ldyBmZWF0dXJlcwotLS0t
LS0tLS0tLS0KCi0gTm9uZQoKQnVnIGZpeGVzCi0tLS0tLS0tLQoKLSBOVksgbWVtb3J5IGxlYWsg
aW4gQ21kQ29weUJ1ZmZlclRvSW1hZ2UgaW4gMjYuMi4wLCAyNi4yLjEgYW5kIDI2LjIuMi4KLSBS
QURWOiBHUFUgcGFnZSBmYXVsdCAobnVsbCBwb2ludGVyKSB3aXRoIFJUIGVtdWxhdGlvbiBvbiBQ
b2xhcmlzIChSWCA1ODAKICAyMDQ4U1ApLiBJc3N1ZSBiZXR3ZWVuIDI2LjEuNiBhbmQgMjYuMi4x
Ci0gW0FOVl1bQVJMXVtiaXNlY3RlZF0gVmlzdWFsIGdyYXBoaWNzIGdsaXRjaGVzIGluIENvdW50
ZXItU3RyaWtlIDIgc3RhcnRpbmcgaW4KICBNZXNhIDI2LjIueAotIFtyYWRlb25zaV0gTWluZWNy
YWZ0IFZveHkgbW9kOiBEaXN0YW50IHdhdGVyIHJlbmRlcmluZyBpc3N1ZSBvbiBWZWdhIGlHUFUg
YW5kCiAgUkROQTIKLSBcYGhldmNfdmFhcGlgIG9uIEFNRCAocmFkZW9uc2kvZ2Z4MTE1MCkgc3Rh
bGxzIHRvIH4xIGZwcyB3aGVuIGlucHV0IGZyYW1lcwogIGNhcnJ5IEEvNTMgKENFQS02MDgvNzA4
KSBjbG9zZWQtY2FwdGlvbiBzaWRlIGRhdGEKLSBhbnY6IFRlc3QgZmFpbHMgaW4gc2ltdWxhdGlv
biBkdWUgdG8gY29hcnNlIHBpeGVsIHNoYWRpbmcgc3RhdGUKLSBhc2FoaTogMTYtYml0IGJsZW5k
aW5nIGludG8gUkdCQTMyRiBwcm9kdWNlcyB6ZXJvIGR1ZSB0byAzMi1iaXQgdGlsZWJ1ZmZlcgog
IGxvYWQKLSBhc2FoaTogU29tZSB0ZXh0dXJlcyBkbyBub3QgcmVuZGVyIGNvcnJlY3RseSBpbiBQ
b3J0YWxzIDIKLSBsaWJ2dWxrYW5faW50ZWwuc28gY3Jhc2ggd2l0aCBYLVBsYW5lIDEyLjQuMyBv
biBJbnRlbCBBcmMgQjU4MAotIG5pcmNhY2hlIGNhdXNlcyBnbHhnZWFycy9lZ2xnZWFycyB0byBz
ZWdmYXVsdCB1bmRlciBaaW5rCi0gdnVsa2FuLHJhZHY6IHdoZW4gdXNpbmcgZGVzY3JpcHRvciBo
ZWFwcywgaW5wdXQgYXR0YWNobWVudHMgaW4gU1BJUi1WIGFyZQogIGluY29ycmVjdGx5IGRldGVj
dGVkIGFzIHJlYWQgb25seSBpbnN0ZWFkIG9mIHJlYWQgd3JpdGUKCkNoYW5nZXMKLS0tLS0tLQoK
QWx5c3NhIFJvc2VuendlaWcgKDEpOgotIG1lc2Evc3Q6IGZpeCBpbmNvcnJlY3QgVlMgaW5wdXQg
YmFzZXMKQW5kcnplaiBEYXRjenVrICgxKToKLSBhYy9zcXR0LCByYWR2LCByYWRlb25zaTogRml4
IFNRVFQgYnVmZmVyIHNpemUgYWxpZ25tZW50IGlzc3VlcwpCZW5qYW1pbiBDaGVuZyAoMSk6Ci0g
cmFkZW9uc2k6IHNldCBzdGVuY2lsIGNsZWFyIHRvIDAgd2hlbiBlbmFibGluZyBUQyBjb21wYXQK
Q2FpbyBPbGl2ZWlyYSAoMSk6Ci0gc3BpcnY6IFByZXNlcnZlIGFsbCBmcF9tYXRoX2N0cmwgYml0
cyBpbiB2dG5faGFuZGxlX2FsdSBkZWZhdWx0IGNhc2UKQ2hyaXN0aWFuIEdtZWluZXIgKDIpOgoK
LSBldG5hdml2OiBEbyBub3QgYWJvcnQgb24gdW5zdXBwb3J0ZWQgc3RlbmNpbC1vbmx5IGJsaXRz
Ci0gZXRuYXZpdjogVXNlIFJTIGRlcHRoIGZvcm1hdHMgb25seSBvbiBoYWx0aTUrCgpEYW55bG8g
UGlsaWFpZXYgKDUpOgoKLSB0dTogV2FpdCBmb3IgWEZCIHF1ZXJ5IHdyaXRlcyB0byBsYW5kIGJl
Zm9yZSBtYWtpbmcgaXQgYXZhaWxhYmxlCi0gdHU6IFN5bmNocm9uaXppbmcgd2l0aCBDbWRDb3B5
UXVlcnlQb29sUmVzdWx0IHNob3VsZCB3YWl0IGZvciBtZW0gd3JpdGVzCi0gdHU6IFVzZSBwX2F0
b21pY19yZWFkIHRvIHJlYWQgZnJvbSBxdWVyeSdzIHNsb3QtPmF2YWlsYWJsZQotIHR1OiBGaXgg
UEFDS0VEICsgYWxpZ25hcyg4KSBhcHBsaWNhdGlvbiB0byB0aGUgc2FtZSBzdHJ1Y3Qgb24gb2xk
ZXIgR0NDCi0gdHU6IEhhbmRsZSBsYXp5IG1lbW9yeSBpbiBHZXREZXZpY2VNZW1vcnlPcGFxdWVD
YXB0dXJlQWRkcmVzcwoKRGF2aWQgUm9zY2EgKDIpOgoKLSB2YTogRHJvcCBIRVZDIFNFSSBwYXJz
aW5nCi0gcmFkdi92aWRlbzogRml4IHNldHRpbmcgc2Vzc2lvbiBwYXJhbWV0ZXJzIG92ZXJyaWRl
IGluZm8KCkRtaXRyeSBCYXJ5c2hrb3YgKDgpOgoKLSBpcjM6IGtlZXAgYnl0ZSBTU0JPIG9mZnNl
dHMgYmVmb3JlIGE2eHgKLSBmcmVlZHJlbm8vYTV4eDogb25seSAyRC1ibGl0IGJldHdlZW4gY29t
cGF0aWJsZSBmb3JtYXRzCi0gZnJlZWRyZW5vL2E1eHg6IHByb2dyYW0gTlVNTk9OUE9TVkFSIHdp
dGggcG9zaXRpb24ncyBWUEMgbG9jYXRpb24KLSBmcmVlZHJlbm8vYTR4eCthNXh4OiBjbGFtcCB0
aGUgdGV4dHVyZSBidWZmZXIgc2l6ZQotIGZyZWVkcmVubzoga2VlcCB0aGUgc2VwYXJhdGUgc3Rl
bmNpbCBvdXQgb2YgdGhlIHNoYWRvdyBibGl0Ci0gZnJlZWRyZW5vL2E1eHg6IGJsaXQgdGhlIHNl
cGFyYXRlIHN0ZW5jaWwgcGxhbmUgdG9vCi0gaXIzOiBza2lwIHRoZSBwaGlzIG9mIG5vbi1HUFIg
cmVnaXN0ZXJzIGluIHRoZSBtaW5pbXVtIHByZXNzdXJlIGJvdW5kCi0gZnJlZWRyZW5vL2E1eHg6
IGJvdW5kIGJsaXRzIGJ5IHRoZSBsYXllciBjb3VudCwgbm90IHRoZSBkZXB0aAoKRW1tYSBBbmhv
bHQgKDMpOgoKLSB0dTogRHJvcCBUUkFOU0ZFUl9TUkMvRFNUIGZyb20gYnVmZmVyRmVhdHVyZXMu
Ci0gdHU6IEZpeCB0aGUgc1R5cGUgb2YgdGhlIHJldHVybmVkIFZrRnJhZ21lbnRTaGFkaW5nUmF0
ZUtIUnMuCi0gdHU6IEZpeCBkZXN0cm95IG9yZGVyIG9mIGF1dG90dW5lIHZzIHBlcmZjb3VudGVy
cyBpbiBmYWlsdXJlIHBhdGguCgpFcmljIEVuZ2VzdHJvbSAoNCk6CgotIGRvY3M6IGFkZCBzaGEg
c3VtIGZvciAyNi4yLjIKLSAucGlja19zdGF0dXMuanNvbjogVXBkYXRlIHRvIDlmNDJlYTEyMzkw
MjVkM2Y5M2Q5YmJmNzQwNTM0MGFkY2VjOTQ0MTkKLSAucGlja19zdGF0dXMuanNvbjogTWFyayBm
NDU4MjVhMGM3MjRkMDZmMjMxYTEyMTA0ODRmZTlhZjcxYTNmZmFiIGFzCiAgZGVub21pbmF0ZWQK
LSAucGlja19zdGF0dXMuanNvbjogTWFyayA4NTlmY2MzYjc0ZjgzMWJiYjkxNTFmMDZkMDU1ZGRm
ZDQ1Y2M2ZTUwIGFzCiAgZGVub21pbmF0ZWQKCkZyYW5rIEJpbm5zICgzKToKCi0gcHZyOiBhZGQg
bWlzc2luZyBHUFUgYXJjaGl0ZWN0dXJlIHRvIGRldmljZSBpbmZvIGZvciBzb21lIEJWTkNzCi0g
cHZyOiBmaXh1cCBvcmRlcmluZyBvZiAoaGFzXF8pdXNjX2l0cl9wYXJhbGxlbF9pbnN0YW5jZXMg
aW4gZGV2IGluZm8KLSB6aW5rOiByZXBsYWNlIGJsZW5kIGFuZCB2ZXJ0ZXggZWxlbWVudHMgc3Rh
dGUgaGFzaGVzIHdpdGggSURzCgpHYW5lc2ggQmVsZ3VyIFJhbWFjaGFuZHJhICgxKToKLSBhbWQ6
IGFkZCBnZngxMTcxCkdlb3JnIExlaG1hbm4gKDIpOgoKLSBuaXIvb3B0X3V1YjogZml4IGltYXgg
b3B0aW1pemF0aW9uCi0gYWNvOiBhdm9pZCBtdWJ1ZiBib3VuZHMgY2hlY2tpbmcgZm9yIGdsb2Jh
bAoKSXbDoW4gQnJpYW5vICgxKToKLSBhbnY6IGZpeCBwdXNoIGNvbnN0YW50IHJhbmdlIGdhdGhl
cmluZyBmb3IgZHluYW1pYyBvZmZzZXRzCkppeXUgWWFuZyAoMSk6Ci0gY2xjOiBmaXggZmQgbGVh
ayBpbiBvcGVuX2NsY19kYXRhKCkgb24gbWFwIGZhaWx1cmUKSnVzdG9uIExpICgxKToKLSBhbnYv
YW5kcm9pZDogRG9uJ3QgZGlzYWJsZSBBVVhfQklUIGltcG9ydGluZyBYZTIrIENDUyBtb2QgaW1h
Z2VzCkthcm1qaXQgTWFoaWwgKDEpOgotIHR1OiBGaXggc3BhcnNlIGJpbmQgY29sdW1uIG1lcmdp
bmcKS2Fyb2wgSGVyYnN0ICgyKToKCi0gbmlyL3NlcmlhbGl6ZTogc2V0IGluZm8uc3BlYyB0byBO
VUxMCi0gcnVzdGljbC9ldmVudDogcHJvcGVybHkgaW1wbGVtZW50IENMX1BST0ZJTElOR19JTkZP
X05PVF9BVkFJTEFCTEUgZXJyb3IKICBjb25kaXRpb24KCktvc3RhZGluIFNoaXNobWFub3YgKDEp
OgotIGFjbzogYWRkIG1pc3NpbmcgPGFsZ29yaXRobT4gaW5jbHVkZQpMZW9uIFBlcmlhbnUgKDEp
OgotIHB2cjogRml4IHByaW1pdGl2ZSByZXN0YXJ0IGZvciBub24taW5kZXhlZCBkcmF3cwpMaW9u
ZWwgTGFuZHdlcmxpbiAoNik6CgotIGFudjogZml4IDY0Yml0IHZhbHVlcyBwcm9tb3RlZCB0byBp
bmxpbmUgcmVnaXN0ZXIKLSBicnc6IHVzZSBzYW1wbGVyIGZyb20gaW5jb21pbmcgaW5zdHJ1Y3Rp
b25zIGZvciBjb21iaW5lcgotIGFudjogZml4dXAgZHluYW1pYyBidWZmZXJzIHdpdGggQU5WX0RF
QlVHPWJpbmRsZXNzCi0gYW52OiBlbWl0IENQQiBzZXR1cCBhdCBkZXZpY2UgaW5pdGlhbGl6YXRp
b24KLSBhbnY6IGZpeCBzeW5jaHJvbml6YXRpb24gb2YgYWNjZWxlcmF0aW9uIHN0cnVjdHVyZSBx
dWVyeSB3cml0ZXMKLSBhbnY6IGFkZCBtaXNzaW5nIGhhbmRsaW5nIGZvciBQSVBFTElORV9TVEFH
RV8yX0NPUFlfSU5ESVJFQ1QKCkxpdml1IFByb2RlYSAoMSk6Ci0gY2xjOiBGaXggc3RhdGljIGxp
bmsgd2l0aCBsbHZtIGFuZCBjbGFuZyAyMwpNYXJlayBPbMWhw6FrICgxKToKLSByYWR2OiBmaXgg
c1JHQiBjb2xvciBjbGVhcnMgdmlhIGNvbXB1dGUKTWFyeSBHdWlsbGVtYXJkICgxKToKLSBhc2Fo
aTogQWRkIHRoZSBzYW1lIHdvcmthcm91bmQgYXMgRmlyZWZveCBmb3IgWmVuIGJyb3dzZXIKTWF0
dCBUdXJuZXIgKDIpOgoKLSBtZXNhL3N0OiB1c2UgY29uY3JldGUgZm9ybWF0cyBmb3IgbG93ZXJl
ZCBZVVYgcGxhbmUgdmlld3MKLSBkcmk6IHVzZSBjb25jcmV0ZSBmb3JtYXRzIGZvciB0aGUgR1I4
OCwgODg4OCBhbmQgc1JHQiBEUk0gZm9ybWF0cwoKTWVsIEhlbm5pbmcgKDIpOgoKLSBudms6IEZp
eCBtZW1vcnkgbGVhayBpbiBjb21wdXRlIHNhdmUvcmVzdG9yZQotIG52azogRml4IGxlYWsgb2Yg
ZGV2LT5oZWFwIGFuZCBkZXYtPnJlcGxheV9oZWFwCgpNaWNoYWVsIENoZW5nICgxKToKLSB1dGls
L2RyaXJjOiBjaGFuZ2UgbWluX3ZhbHVlIHRvIG1heF92YWx1ZSB0eXBvCk1pa2UgQmx1bWVua3Jh
bnR6ICgyKToKCi0gbGx2bXBpcGU6IGZvcmNlIGFsaWdubWVudCBmb3IgV2luZG93cyB0ZXh0dXJl
IGFsbG9jYXRpb25zCi0gbnR2OiBpbXByb3ZlIGRlcmVmIHR5cGUgbWF0Y2hpbmcgd2hlbiBjb252
ZXJ0aW5nIHZyaSBkZXJlZnMKClBhdmVsIE9uZHJhxI1rYSAoMSk6Ci0gcjMwMDogZG9uJ3QgcHJv
cGFnYXRlIG5lZ2F0aW9uIHRocm91Z2ggYWJzb2x1dGUgdmFsdWVzClJoeXMgUGVycnkgKDQpOgoK
LSByYWR2OiBkb24ndCBzZXQgbXVsYWRkX3N1cHBvcnRfcHJlZmVyc19zcGxpdCB3aGVuIGZmbWEg
aXMgdW5zdXBwb3J0ZWQKLSByYWR2OiBpbml0aWFsaXplIHNoYWRlcl9ibGFrZTMgZm9yIHNoYWRl
ciBvYmplY3RzCi0gcmFkdjogaGFzaCBkZXNjcmlwdG9yIHNldCBsYXlvdXRzIGluIHJhZHZfaGFz
aF9ncmFwaGljc19zcGlydl90b19uaXIKLSByYWRlb25zaTogdXNlIGFjX3NoYWRlcl9jb25maWc6
Omxkc19zaXplIGZyb20gQUNPCgpSb2hhbiBHYXJnICgxKToKLSBuaXI6IGRlcml2ZSBjb2xvcl9p
c19kdWFsX3NvdXJjZSBmcm9tIGRlY2xhcmVkIHZhcnMKUnlhbiBNY2tlZXZlciAoMSk6Ci0gcGFu
dmsvdjYtNzogaW5jbHVkZSByZXF1aXJlZCBsYXlvdXRzIGluIGhvc3QgaW1hZ2UgY29weSBsYXlv
dXRzClJ5YW4gWmhhbmcgKDMpOgoKLSB3c2kvd2F5bGFuZDogc2tpcCBmZWVkYmFjayBkaXNwYXRj
aCB3aGVuIG5vdGhpbmcgaXMgb3V0c3RhbmRpbmcKLSBwYW52azogaW5pdGlhbGl6ZSBDUFUgdHJh
Y2luZyBjYXRlZ29yaWVzCi0gcGFudmsvdXRyYWNlOiByZXBsYWNlIGJvZ3VzIGFzc2VydCB3aXRo
IHN0YXRpY19hc3NlcnQgaW4gcGVyZmV0dG8gYmVnaW4gZXZlbnQKICBjYWxsYmFjawoKU2FtdWVs
IFBpdG9pc2V0ICgzKToKCi0gcmFkdjogZml4IEwwX0NBQ0hFX0hJVF9SQVRJTyBwZXJmIGNvdW50
ZXIgb24gR0ZYMTEKLSByYWR2OiByZXR1cm4gVktfRVJST1JfREVWSUNFX0xPU1QgaWYgYW55IHNo
YWRlciBleGVjdXRlZCBPcEFib3J0S0hSCi0gcmFkdjogY29uc2lkZXIgc2hhZGVyIGFib3J0IGZh
dWx0cyB3aXRoIFZLX0tIUl9kZXZpY2VfZmF1bHQKClNpbHZpbyBWaWxlcmlubyAoMik6CgotIGQz
ZDEyOiBGaXggZDNkMTIgdmlkZW8gZW5jb2RlciBiYXRjaCBsZWFrcwotIGQzZDEyOiBGaXggZDNk
MTIgdmlkZW8gZGVjb2RlciBiYXRjaCBsZWFrcwoKVGFrdXJvIEFzaGllICgxKToKLSBwYW5mcm9z
dDogUmVhbGxvY2F0ZSBCTyB3aGVuIGxpbmVhciBsYXlvdXQgZ3Jvd3MKVGFwYW5pIFDDpGxsaSAo
Myk6CgotIGFudjogY2hhbmdlIGJpbmRsZXNzIGRlYnVnIGVudiB2YXJpYWJsZSB0byBiZSBkcmly
YyBvcHRpb24KLSBhbnY6IHRvZ2dsZSBhbnZfYWx3YXlzX2JpbmRsZXNzIGZvciBYUGxhbmUtMTIK
LSBhbnY6IGZpeCBjbWRfYnVmZmVyX3NldF9pbmRpcmVjdF9zdHJpZGUgb24gQVJMCgpWYW5kb21h
cyAoMSk6Ci0gemluazogcHV0IHRoZSBidWZmZXIgdmlldyBjYWNoZSBrZXkgZmlyc3QKVmluc29u
IExlZSAoMik6CgotIGdsc2w6IGluaXRpYWxpemUgcGl4ZWxfbG9jYWxfc3RvcmFnZSBhbmQgeXV2
IGluIGlyX3ZhcmlhYmxlIGNvbnN0cnVjdG9yCi0gZ2xzbDogaW5pdGlhbGl6ZSBpc19nbG9iYWwg
aW4gaXJfdmFyaWFibGVfcmVmY291bnRfZW50cnkgY29uc3RydWN0b3IKClbDrWN0b3IgTWFudWVs
IErDoXF1ZXogTGVhbCAoMSk6Ci0gcmFkdi92aWRlbzogcmVwb3J0IGhhc092ZXJyaWRlcyBvbiBB
VjEgZW5jb2RpbmcKWWl3ZWkgWmhhbmcgKDEpOgotIHBhbnZrOiBwbGFjZSBjb2hlcmVudCBtZW1v
cnkgdHlwZSBiZWZvcmUgY2FjaGVkIHR5cGUKcmFqYXJ5YW4xNDkyMDA3ICgxKToKLSBzcGlydjog
RG9uJ3QgaW1wbGljaXRseSBzZXQgQUNDRVNTX05PTl9XUklURUFCTEUgZm9yIGlucHV0IGF0dGFj
aG1lbnRzCgpNZXNhIDI2LjIuNCBSZWxlYXNlIE5vdGVzIC8gMjAyNi0xMC0wMQo9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKTWVzYSAyNi4yLjQgaXMgYSBidWcgZml4IHJl
bGVhc2Ugd2hpY2ggZml4ZXMgYnVncyBmb3VuZCBzaW5jZSB0aGUgMjYuMi4zCnJlbGVhc2UuCgpN
ZXNhIDI2LjIuNCBpbXBsZW1lbnRzIHRoZSBPcGVuR0wgNC42IEFQSSwgYnV0IHRoZSB2ZXJzaW9u
IHJlcG9ydGVkIGJ5CmdsR2V0U3RyaW5nKEdMX1ZFUlNJT04pIG9yIGdsR2V0SW50ZWdlcnYoR0xf
TUFKT1JfVkVSU0lPTikgLwpnbEdldEludGVnZXJ2KEdMX01JTk9SX1ZFUlNJT04pIGRlcGVuZHMg
b24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJlaW5nIHVzZWQuClNvbWUgZHJpdmVycyBkb24ndCBz
dXBwb3J0IGFsbCB0aGUgZmVhdHVyZXMgcmVxdWlyZWQgaW4gT3BlbkdMIDQuNi4gT3BlbkdMCjQu
NiBpcyAqKm9ubHkqKiBhdmFpbGFibGUgaWYgcmVxdWVzdGVkIGF0IGNvbnRleHQgY3JlYXRpb24u
CkNvbXBhdGliaWxpdHkgY29udGV4dHMgbWF5IHJlcG9ydCBhIGxvd2VyIHZlcnNpb24gZGVwZW5k
aW5nIG9uIGVhY2ggZHJpdmVyLgoKTWVzYSAyNi4yLjQgaW1wbGVtZW50cyB0aGUgT3BlbkNMIDMu
MSBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRlZCBieQp0aGUgQ0xfREVWSUNFX1ZFUlNJT04s
IENMX0RFVklDRV9OVU1FUklDX1ZFUlNJT04gYW5kCkNMX0RFVklDRV9PUEVOQ0xfQ19BTExfVkVS
U0lPTlMKY2xHZXREZXZpY2VJbmZvIHF1ZXJpZXMgZGVwZW5kcyBvbiB0aGUgcGFydGljdWxhciBk
cml2ZXIgYmVpbmcgdXNlZC4KCk1lc2EgMjYuMi40IGltcGxlbWVudHMgdGhlIFZ1bGthbiAxLjQg
QVBJLCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIGFwaVZlcnNpb24gcHJvcGVydHkg
b2YgdGhlIFZrUGh5c2ljYWxEZXZpY2VQcm9wZXJ0aWVzIHN0cnVjdApkZXBlbmRzIG9uIHRoZSBw
YXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgoKU0hBIGNoZWNrc3VtcwotLS0tLS0tLS0tLS0t
Cgo6OgogICAgVEJELgoKTmV3IGZlYXR1cmVzCi0tLS0tLS0tLS0tLQoKLSBOb25lCgpCdWcgZml4
ZXMKLS0tLS0tLS0tCgotICJUWSB0aGUgVGFzbWFuaWFuIFRpZ2VyIDMiIGFsd2F5cyBjcmFzaGVz
IGluIHRoZSBzYW1lIGN1dHNjZW5lIG9uIGFtZCBncHVzCi0gVktfVkFMVkVfdmlkZW9fZW5jb2Rl
X3JnYl9jb252ZXJzaW9uIGFsd2F5cyBvdXRwdXRzIGxpbWl0ZWQgY29sb3IgcmFuZ2UKLSBYLVBs
YW5lIDEyICgyMDE0NzgwKSBGbGlja2VyaW5nIGFydGlmYWN0cyBvbiB0ZXh0dXJlcyB3aXRoIElu
dGVsIEFyYyBCNTgwCi0gW0RHMl0gQU5WOiBFbnNocm91ZGVkICgxMjAzNjIwKSAtIGNoYXJhY3Rl
ciBpbnZpc2libGUsIHRyYW5zcGFyZW50IGJpbGxib2FyZHMKICByZW5kZXJlZCBhcyBvcGFxdWUg
c3BoZXJlcyBvbiBkaXNjcmV0ZSBBcmMgR1BVCi0gW1JBRFZdIEdGWDg6IEJsYWNrIHNjcmVlbiBp
biBVRTUgRFgxMiAoSGFsZiBTd29yZCkgYWZ0ZXIgY29tbWl0IDE1OTkwYzc4YjhlCiAgKCJhbGxv
dyBEQ0MgZm9yIGNvbmN1cnJlbnQgaW1hZ2VzIHdpdGhvdXQgRENDIHN0b3JlcyIpCi0gYW52OiBW
S19FWFRfY2FsaWJyYXRlZF90aW1lc3RhbXBzIHJldHVybnMgYSBHUFUgdGltZXN0YW1wIGFoZWFk
IG9mIENQVSB0aW1lIG9uCiAgQXJjIEIzOTAgKFBhbnRoZXIgTGFrZSksIGNyYXNoaW5nIFVucmVh
bCBFbmdpbmUgNS44Ci0gYXNhaGk6IE1hcmlvIEthcnQgV2lpQ29tcGlsZWQgZ3JhcGhpY2FsIGds
aXRjaGVzCi0gZEVRUC1WSy5pbWFnZS5zd2FwY2hhaW5fbXV0YWJsZS53YXlsYW5kLjJkLnI4Zzhi
OGE4X3NyZ2JfcjhnOGI4YThfdW5vcm1fZHJhd190CiAgZXh0dXJlX2Zvcm1hdF9saXN0IGNyYXNo
Ci0gcmFkZW9uc2kvdmE6IHZhR2V0SW1hZ2UgdG8gSTQyMC9ZVVlWIGZhaWxzIHdpdGggVU5TVVBQ
T1JURURfUlRfRk9STUFUIHNpbmNlCiAgTWVzYSAyNi4yIG9uIEdQVXMgd2l0aCBWUEUgKFJhZGVv
biA4OTBNKQotIHJhZGVvbnNpOiBHUFUgcGFnZSBmYXVsdCAoU1FDKSAvIGNvbnRleHQgbG9zcyB3
aGVuIHVzaW5nIElyaXMgc2hhZGVycGFja3Mgb24KICBSWCA5MDcwIFhUIChnZngxMjAxKQotIHJh
ZHY6IE5VTEwgZGVyZWYgaW4gcmFkdl9nZXRfdmd0X3NoYWRlcl9rZXkgYWZ0ZXIgYmluZGluZyBh
IGNvbXB1dGUgc2hhZGVyCiAgb2JqZWN0Ci0gcmFkdjogUENJZSA0LjAgeDQgZmFpbHMgdGhlICJQ
Q0llIDMuMCB4OCIgYmFuZHdpZHRoIGNoZWNrIGZvciBWUkFNIGNvbW1hbmQKICBidWZmZXJzIGJ5
IDQgTUIvcyAocm91bmRlZCBwZXItbGFuZSBjb25zdGFudHMpOyB1cCB0byAxMyUgZGVjb2RlIGxv
c3MgaW4KICBsbGFtYS5jcHAKLSByYWR2OiBVTlJFQUNIQUJMRSBjbGVhcmluZyBERVBUSHxTVEVO
Q0lMIHdoZW4gdGhlIGR5bmFtaWMgcmVuZGVyIHBhc3MgaGFzIG5vCiAgc3RlbmNpbCBhdHRhY2ht
ZW50Ci0gcmFkdjogVmtEZXNjcmlwdG9yVXBkYXRlVGVtcGxhdGUgdGFrZXMgYSBwb2ludGVyIHRv
IHRoZSBzZXRfbGF5b3V0IG1lbW9yeQoKQ2hhbmdlcwotLS0tLS0tCgpBbGxlbiBCYWxsd2F5ICgx
KToKLSBpbnRlbC9jb21waWxlcjogZml4IGJvdW5kcyBjaGVjayBpbiBXYV8xODAzNTY5MDU1NQpC
ZW5qYW1pbiBDaGVuZyAoMSk6Ci0gYWMvdmlkZW86IEFkanVzdCBIRVZDIG1pbl9xcCBmb3IgVkNO
MS9WQ04yCkJvcmlzIEJyZXppbGxvbiAoMik6CgotIHBhbi9rbW9kOiBNYWtlIHN1cmUgYWxsIGV4
ZWN1dGFibGVzIGxpdmUgaW4gdGhlIHNhbWUgNEcgVkEgcmFuZ2UKLSBwYW52azogRG9uJ3QgZG93
bmNhc3QgQ1MgZnVuYyBhZGRyZXNzIHRvIGEgMzItYml0IFZBCgpDYWlvIE9saXZlaXJhICgxKToK
LSBicnc6IFJlLWxvd2VyIGltbWVkaWF0ZSBvZmZzZXRzIGFmdGVyIG1lc2ggbmlyX29wdF9vZmZz
ZXRzCkNocmlzdGlhbiBHbWVpbmVyICgzKToKCi0gbGF2YXBpcGU6IEd1YXJkIEJEQSBoYW5kbGUg
YXJyYXlzIHdpdGggYmRhX2xvY2sKLSBldG5hdml2OiBDYXB0dXJlIHZhcnlpbmdzIG5vdCByZWFk
IGJ5IHRoZSBmcmFnbWVudCBzaGFkZXIKLSBldG5hdml2OiBLZWVwIHRyYW5zZm9ybSBmZWVkYmFj
ayBhY3RpdmUgYWNyb3NzIGZsdXNoZXMKCkNvb3BlciBNb3JnYW4gKDMpOgoKLSB2dWxrYW4vd3Np
OiBrZWVwIHByZXNlbnQgdGltaW5nIHJlY29yZHMgdGhhdCBkbyBub3QgZml0IHRoZSBvdXRwdXQg
YXJyYXkKLSB2dWxrYW4vd3NpOiBrZWVwIEdPT0dMRSBkaXNwbGF5IHRpbWluZyByZWNvcmRzIHRo
YXQgZG8gbm90IGZpdAotIGFudGktbGFnOiBjb252ZXJ0IEdQVSB0aW1lc3RhbXBzIHRvIG5zIGlu
IGRvdWJsZSBwcmVjaXNpb24KCkRhdmlkIFJvc2NhICg4KToKCi0gdnVsa2FuL3ZpZGVvOiBEb24n
dCB1cGRhdGUgT0JVIHNpemUgd2l0aCBOVUxMIGRhdGFfcHRyCi0gdmwvYml0c3RyZWFtOiBGaXgg
Y29kaW5nIHVlKCkgZm9yIGxhcmdlIG51bWJlcnMKLSB2bC9iaXRzdHJlYW06IERvbid0IHVzZSBp
bnRlcm5hbCBidWZmZXIgZm9yIHNpemUgb25seSB1c2UKLSB2bC9iaXRzdHJlYW06IE1vdmUgb3Zl
cmZsb3cgY2hlY2sgdG8gdmxfYml0c3RyZWFtX3dyaXRlX2J5dGVfc3RhcnRfY29kZQotIHJhZHYv
dmlkZW86IEZpeCBoYW5kbGluZyBzaXplIGxpbWl0IGluIEdldEVuY29kZWRWaWRlb1Nlc3Npb25Q
YXJhbWV0ZXJzCi0gdmE6IERyb3AgZm9ybWF0IHN1cHBvcnQgY2hlY2tzIGluIHZsVmFQb3N0UHJv
YwotIHZhOiBEb24ndCBjaGVjayBmb3JtYXQgc3VwcG9ydCBpbiBFbmRQaWN0dXJlIGZvciBwcm9j
ZXNzaW5nCi0gcmFkdi92aWRlbzogT25seSByZXBvcnQgQlQ3MDkvTGltaXRlZCBzdXBwb3J0IGZv
ciBSR0IgY29udmVyc2lvbiBvbiBWQ041CgpEYXZpZCBTYW5kZXJzICgxKToKLSByYWR2OiByZXNl
dCBjb21wdXRlIHBpcGVsaW5lIGFmdGVyIElFUyBpbiB2a0NtZEV4ZWN1dGVHZW5lcmF0ZWRDb21t
YW5kc0VYVApEbWl0cnkgQmFyeXNoa292ICgzKToKCi0gZnJlZWRyZW5vL2EyeHg6IGRvbid0IHR5
cGUtcHVuIHRoZSBpbW1lZGlhdGUgdmFsdWVzIHRocm91Z2ggYSBjYXN0Ci0gdHU6IHJlc29sdmUg
d2lkZSBmb3JtYXRzIHdpdGggYSBzaGFkZXIgb24gQTcwMgotIGZyZWVkcmVuby9xcmlzYzogZml4
IGhhbmcgb24gYTY1MCAvIGE2NjAgZmlybXdhcmUKCkVyaWMgRW5nZXN0cm9tICgyKToKCi0gZG9j
czogYWRkIHNoYSBzdW0gZm9yIDI2LjIuMwotIC5waWNrX3N0YXR1cy5qc29uOiBVcGRhdGUgdG8g
MzBkYTM5MTg3ZDhkM2NmMDNjNThlY2QyYmViYjQ5N2I4NDUwMWY1MQoKRXJpYyBSLiBTbWl0aCAo
MSk6Ci0gcHZyOiBtb3ZlIGFzc2VydCBmb3IgYnVmZmVyIHVzYWdlCkdlb3JnIExlaG1hbm4gKDQp
OgoKLSBhY28vc2NoZWRfdm9wZDogd29yayBhcm91bmQgR0ZYMTEgVk9QRCBpbnRlcmxvY2sgaGF6
YXJkCi0gYWNvL29wdGltaXplcjogZG8gbm90IHRydW5jYXRlIGNvbnN0YW50cyBiZWZvcmUgcmVz
b2x2aW5nIGV4dHJhY3RzCi0gYWNvL29wY29kZXM6IGFkZCBkZXN0L3NyYyB0eXBlcyBmb3IgVk9Q
RCBvcGNvZGVzCi0gYWNvL2luc2VydF9mcF9tb2RlOiBoYW5kbGUgYm90aCB2b3BkIG9wY29kZXMK
CkdsZW5uIEtlbm5hcmQgKDEpOgotIG52MzA6IEZpeCBmb3IgbG9vcHMgaW4gZnJhZ21lbnQgc2hh
ZGVycyBvbiBudjQwCkhlbGVuIEtvaWtlICgxKToKLSB2dWxrYW4vb3ZlcmxheTogRHJhdyBvbiB0
aGUgcHJlc2VudCBxdWV1ZSB3aGVuIHBvc3NpYmxlCklhbiBSb21hbmljayAoMSk6Ci0gYnJ3OiBP
bmx5IEhBTFQgZm9yIHRlcm1pbmF0ZV9pZiBvZiBub24taGVscGVyIHBpeGVscwpJY2Vub3d5IFpo
ZW5nICgzKToKCi0gZ2FsbGl2bTogZml4IGVuYWJsZW1lbnQgb2YgUklTQy1WIFpicyBleHRlbnNp
b24KLSB2dWxrYW4vd3NpOiBzdXBwb3J0IGFsbG9jYXRpbmcgbW9yZSBtZW1vcnkgZm9yIGJ1ZmZl
cnMKLSBtZXNvbjogbGlzdCBNSVBTKDY0KSBpbiBsbHZtX2hhc19tY2ppdCBsaXN0CgpKb2IgTm9v
cm1hbiAoMik6CgotIGlyMzogaW50ZXJwcmV0IGNvbnN0IFxAbG9hZC9zdG9yZV9nbG9iYWxfb2Zm
c2V0IG9mZnNldCBhcyB1bnNpZ25lZAotIG5pci9sb3dlcl90ZXg6IGNvcHkgdGV4dHVyZS9zYW1w
bGVyX25vbl91bmlmb3JtIGZsYWdzCgpKb3NlIE1hcmlhIENhc2Fub3ZhIENyZXNwbyAoMik6Cgot
IHZjNDogaGVscGVyIHZjNF9nZXRfY2xpcF93aW5kb3coKSBmb3IgdGhlIGNsaXAgd2luZG93IGNv
bXB1dGF0aW9uCi0gdmM0OiBza2lwIGRyYXdzIHdob3NlIGNsaXAgd2luZG93IGlzIGVtcHR5CgpK
eW90aXJhbmphbiBCaHV5YW4gKDEpOgotIHJhZGVvbnNpOiBpbnZhbGlkYXRlIEkkL1NNRU0kL1ZN
RU0kIGF0IElCIHN0YXJ0IG9uIGdmeDEyCkthamFsIEthamFsICgyKToKCi0gZnJlZWRyZW5vL2E2
eHg6IHVwbG9hZCBhIGR1bW15IHNhbXBsZXIgd2hlbiB0ZXh0dXJlcyBidXQgbm8gc2FtcGxlcnMg
Ym91bmQKLSBydXN0aWNsL2tlcm5lbDogZW1pdCBpbWFnZS90ZXh0dXJlIGJhcnJpZXJzIGFmdGVy
IGEga2VybmVsIGxhdW5jaAoKS29uc3RhbnRpbiBTZXVyZXIgKDEpOgotIHJhZHYvcnQ6IFJlc3Rv
cmUgaGl0IGF0dHJpYnMgYWZ0ZXIgcmVqZWN0aW5nIEFBQkJzCkxpb25lbCBMYW5kd2VybGluICg2
KToKCi0gYW52OiByZXNwZWN0IGJpdF9zaXplL251bV9jb21wb25lbnQgZnJvbSB0aGUgSVIgd2l0
aCBhY2NlbGVyYXRpb24gc3RydWN0dXJlcwotIGJsb3JwOiBmaXggc2hhZGVyIGtlcm5lbCBwb2lu
dGVyIHdpdGggbXVsdGkgc2l6ZSBrZXJuZWxzCi0gYW52OiBhZGQgbWlzc2luZyBjb25zdGFudCBj
YWNoZSBpbnZhbGlkYXRpb24gaW4gREdDIHBhdGgKLSBuaXIvbG93ZXJfaW5wdXRfYXR0YWNobWVu
dHM6IGFkZCBzdXBwb3J0IGZvciBoZWFwIHN1YnBhc3MgaW1hZ2UgbG9hZAotIGFudjogZGlzYWJs
ZSBEUk1fWEVfREVWSUNFX1FVRVJZX0VOR0lORV9DWUNMRVMgd2l0aCBVbnJlYWxFbmdpbmUgNS44
Ci0gdnVsa2FuL3dzaTogYWRkIG1pc3NpbmcgdXNhZ2UyIGZsYWdzCgpMb3JlbnpvIFJvc3NpICgy
KToKCi0gcGFuL2JpOiBGaXggc3BpbGwgY29zdCBvdmVyZXN0aW1hdGlvbgotIGtyYWlkL29wdF9j
b3B5X3Byb3A6IEZpeCB6ZXJvLWV4dGVuc2lvbiBvbiA2NC1iaXQgc3dpenpsZXMKCkx1aWdpIFNh
bnRpdmV0dGkgKDIpOgoKLSBwdnI6IHNwZWN1bGF0aXZlIGZpeCBmb3Igb3V0LW9mLWJvdW5kIGFj
Y2VzcyBvZiB3aW5zeXNfaGVhcHMKLSBwdnI6IHNldCB0aGUgVU0gc3RyaWRlIHdoZW4gcXVlcnlp
bmcgaGVhcCBzdGF0aWMgYXJlYXMKCk1hcmVrIE9sxaHDoWsgKDEpOgotIHJhZHY6IGZpeCBjaGVj
a2luZyB3aGV0aGVyIGEgRlMgaXMgcHJlc2VudApNYXR0IFR1cm5lciAoMTEpOgoKLSBkcmk6IGFs
bG9jYXRlIE1TQUEgY29sb3IgYnVmZmVycyBmb3IgZHJpc3cgaW1hZ2UgbG9hZGVyIGJ1ZmZlcnMK
LSBsbHZtcGlwZTogZG9uJ3Qgc2tpcCBkcmF3J3Mgdmlld3BvcnQgY2xpcHBpbmcgd2l0aG91dCB0
aGUgbGluZWFyIHJhc3Rlcml6ZXIKLSBtZXNhOiB1c2UgYSBieXRlLWFycmF5IGZvcm1hdCBmb3Ig
R0xfUkdCQTggdGV4dHVyZSBidWZmZXJzCi0gbWVzYTogc3RvcmUgYm9vbGVhbiBjdXN0b20gZ2xH
ZXQgdmFsdWVzIGluIHZhbHVlX2Jvb2wKLSBtZXNhOiBwYWNrIEdMX01BWF9DT01CSU5FRF9ESU1F
TlNJT05TIHdpdGhvdXQgZGVwZW5kaW5nIG9uIGJ5dGUgb3JkZXIKLSBkcmk6IGRlc2NyaWJlIEdS
MTYxNiBhcyBSMTZHMTZfVU5PUk0KLSB1dGlsOiBmaXggdGhlIFozMl9GTE9BVF9TOFgyNF9VSU5U
IGNsZWFyIHZhbHVlIG9uIGJpZy1lbmRpYW4KLSB1dGlsL2Zvcm1hdDogc3RvcmUgUjExRzExQjEw
X0ZMT0FUIGFuZCBSOUc5QjlFNV9GTE9BVCBpbiBob3N0IGJ5dGUgb3JkZXIKLSB1dGlsL2FzdGM6
IHJlYWQgdGhlIDEyOC1iaXQgYmxvY2sgYXMgbGl0dGxlLWVuZGlhbiB3b3JkcwotIHV0aWwvZm9y
bWF0OiBtYWtlIHRoZSBGWFQxIGNvZGVjIGluZGVwZW5kZW50IG9mIGhvc3QgYnl0ZSBvcmRlcgot
IGdhbGxpdm06IHJlaW50ZXJwcmV0IGltYWdlIHRleGVscyB1c2luZyB0aGUgc2hhZGVyJ3MgZm9y
bWF0IHF1YWxpZmllcgoKTWlrZSBCbHVtZW5rcmFudHogKDkpOgoKLSBsYXZhcGlwZTogaW5kZXBl
bmRlbnRseSBjYWxjdWxhdGUgc3JjL2RzdCBibGl0IGRlcHRoCi0gbGF2YXBpcGU6IGFkZCBtb3Jl
IGxheW91dHMgdG8gbHZwX2hvc3RfY29weV9pbWFnZV9sYXlvdXRzCi0gbGF2YXBpcGU6IGhhbmRs
ZSBwbGFuYXIgdmlld3MgYXMgcmVuZGVyaW5nIGF0dGFjaG1lbnRzCi0gbGx2bXBpcGU6IHVzZSBv
c19mcmVlX2FsaWduZWQgZm9yIG5vbi12bWEgY2FzZQotIGxhdmFwaXBlOiB1cGRhdGUgcmV0dXJu
ZWQgc2l6ZSBpbiBHZXRQaXBlbGluZUNhY2hlRGF0YQotIHppbms6IGRvbid0IGNsYWltIFZSQU0g
b24gY3B1IGltcGxlbWVudGF0aW9ucwotIHppbms6IGNoZWNrIHN3YXBjaGFpbiB0aW1saW5lIHdo
ZW4gcHJ1bmluZwotIHppbms6IHN0b3AgbGVha2luZyBzd2FwY2hhaW5zCi0gemluazogY2xhbXAg
cHJlc2VudCByZWdpb25zIHRvIDB4MCB3aGVuIG91dCBvZiBib3VuZHMKCk1pa2hhaWwgTWxoY25u
ICgyKToKCi0gcGFudmsvY3NmOiBmbHVzaCB0aGUgRkFVIHN0b3JlcyBiZWZvcmUgaW5kaXJlY3Qg
ZHJhd3MgcmVhZCB0aGVtCi0gcGFudmsvY3NmOiBnaXZlIGNvbXB1dGUgam9icyB0aGUgVExTIHNp
emUgb2YgdGhlIHNoYXJlZCBhbGxvY2F0aW9uCgpPbGl2ZXIgQ2xhcmtlICgxKToKLSBhc2FoaS9h
Z3g6IEFkZCBzaGlmdCBtYXNrIGZvciBiaXRmaWVsZF9leHRyYWN0IGFuZCBmdXNlZCBzaGlmdCBv
cHMKUGF0cmljayBHYXNraW4gKDEpOgotIGVnbDogZG9uJ3QgY2xvYmJlciBhbiBpbml0aWFsaXpl
ZCBkaXNwbGF5J3MgZGV2aWNlIGluIGVnbEdldFBsYXRmb3JtRGlzcGxheQpSYW5keSBQYWxhbWFy
ICgxKToKLSBhY28vaW5zZXJ0X2ZwX21vZGU6IGZpeCByb3VuZGluZyBtb2RlIGZvciBmbWFfbWl4
aGlfZjE2ClJoeXMgUGVycnkgKDEpOgotIGFjby9yYTogY2hlY2sgbmV4dCByZWdpc3RlciBhZ2Fp
bnN0IGJvdW5kcyBpbiBzdWJkd29yZCBnZXRfcmVnX3NpbXBsZSBwYXRoClJ5YW4gWmhhbmcgKDIp
OgoKLSBwYW52azogdmFsaWRhdGUgZGVzY3JpcHRvciBjb3VudHMgaW4gc2hhZGVyIGRlc2VyaWFs
aXphdGlvbgotIHBhbnZrL2NzZjogY2hlY2sgbWFsbG9jIHJldHVybiB2YWx1ZXMgaW4gcXVldWUg
c3VibWl0IHN0b3JhZ2UgaW5pdAoKU2FtdWVsIFBpdG9pc2V0ICgxMik6CgotIHJhZHY6IGZpeCBp
bml0aWFsaXppbmcgdGhlIERDQyBwcmVkaWNhdGlvbiB2YWx1ZSB3aGVuIHN0b3JlcyBhcmVuJ3Qg
c3VwcG9ydGVkCi0gcmFkdjogZml4IGluaXRpYWxpemluZyBEQ0Mgd2l0aCBtaXBtYXBzIG9uIEdG
WDgKLSByYWR2OiBkaXNhYmxlIGJpbm5pbmcgY29ycmVjdGx5IG9uIEdGWDktMTEKLSByYWR2OiBm
aXggYSB0eXBvIHdoZW4gY29tcHV0aW5nIHRoZSBiaW5uaW5nIHNpemUgb24gR0ZYMTAtMTEuNwot
IHJhZHY6IGFkZCByYWR2X2Rpc2FibGVfYmlubmluZ19nZngxMSBhbmQgZW5hYmxlIGZvciBTdW5z
ZXQgT3ZlcmRyaXZlCi0gbmlyL2xvd2VyX2Fib3J0OiBmaXggcGF5bG9hZCBhbGlnbm1lbnQgdG8g
OC1ieXRlcwotIHJhZHY6IGRvIG5vdCBhYm9ydCB3aGVuIHRoZSBhcHAgc3BlY2lmaWVzIGFuIGlu
dmFsaWQgbW9kaWZpZXIKLSByYWR2OiBkbyBub3QgYWJvcnQgd2hlbiBhIEdQVSBoYW5nIHJlcG9y
dCBpcyBjcmVhdGVkIHdpdGgKICBkZXZpY2VGYXVsdFZlbmRvckJpbmFyeQotIHJhZHY6IGZpeCBk
ZXB0aC9zdGVuY2lsIGFzcGVjdHMgZm9yIHJlc29sdmVzCi0gcmFkdjogZml4IGltbXV0YWJsZSBz
YW1wbGVycyBsaWZldGltZSB3aXRoIGRlc2NyaXB0b3IgdXBkYXRlIHRlbXBsYXRlcwotIHJhZHY6
IGZpeCBkaXJ0eWluZyBncmFwaGljcyBzaGFkZXJzIHdoZW4gc2hhZGVyIG9iamVjdHMgYXJlIGJv
dW5kCi0gcmFkdjogaWdub3JlIGFzcGVjdHMgdGhhdCBoYXZlIG5vIGVmZmVjdHMgZHVyaW5nIGNs
ZWFycwoKVGFwYW5pIFDDpGxsaSAoMSk6Ci0gYW52OiBhZGQgYWRkaXRpb25hbCBoZXVyaXN0aWMg
dG8gc2ltZDMyIGFzc3VtcHRpb24gcGFzcwpUaW1vdGh5IEFyY2VyaSAoMSk6Ci0gbmlyOiB0ZW1w
b3JhcmlseSBkaXNhYmxlIGZsb2F0aW5nIHBvaW50IGV4Y2VwdGlvbiBmbGFncwpUdXBpbGkgS3Jp
c2huYSBHb3d0aGFtIFJlZGR5ICgxKToKLSBmcmVlZHJlbm8vYTZ4eDogZW5hYmxlIGYxNiBpbmZp
bml0aWVzIGZvciBmcmVlZHJlbm8gZHJpdmVyClZhbGVudGluZSBCdXJsZXkgKDIpOgoKLSBuaXIv
bG93ZXJfc3ViZ3JvdXBzOiBGaXggdm90ZSBsb3dlcmluZyB3aXRoIHZlY3RvciBiYWxsb3RzCi0g
aXIzOiBMb3dlciBxdWFkIHZvdGVzCgpWaW5zb24gTGVlICgxKToKLSBwcHM6IEluaXRpYWxpemUg
Q291bnRlciBtZW1iZXIgdmFyaWFibGUgdW5pdHMKVmluw61jaXVzICgxKToKLSBhYy9ncHVfaW5m
bzogbWFrZSBQQ0llIDQuMCBhbmQgNS4wIGxhbmUgYmFuZHdpZHRoIGV4YWN0IG11bHRpcGxlcyBv
ZiAzLjAKWWl3ZWkgWmhhbmcgKDEpOgotIHBhbi9rbW9kOiBkdW1teSBCTyBpcyBwZXIgVk0gZm9y
IGVtdWxhdGVkIHNwYXJzZQpqb2Uud2FuZyAoMSk6Ci0gcmFkdjogYWxzbyBhcHBseSB0aGUgRGlS
VCA0IEhpWiB3b3JrYXJvdW5kIHByb2ZpbGUgdG8gdGhlIG5hdGl2ZSBwb3J0Cm1hdHRoZXdwZXJp
dXQgKDEpOgotIHZlbnVzOiBob25vciB0aGUgdmlydGlvLWdwdSBibG9iIGFsaWdubWVudAo=

--===============0873413403893321578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.2.3.so", added "/usr/lib/libgallium-26.2.4.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.2.3.so moved to /usr/lib/libgallium-26.2.4.so

--===============0873413403893321578==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-mesa-tools-native-upgrade-26.2.3-26.2.4.patch"

RnJvbSBlMTVlOTdlNWNhYTVlZDdkNWU3Y2NkMmE3ZWIwMWUwZmVkNTA1Njk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBPY3QgMjAyNiAwNTozMDoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2EsbWVzYS10b29scy1uYXRpdmU6IHVwZ3JhZGUgMjYuMi4zIC0+IDI2LjIuNApNSU1FLVZlcnNp
b246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1U
cmFuc2Zlci1FbmNvZGluZzogOGJpdAoKTWVzYSAyNi4yLjMgUmVsZWFzZSBOb3RlcyAvIDIwMjYt
MDktMTYKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCk1lc2EgMjYuMi4z
IGlzIGEgYnVnIGZpeCByZWxlYXNlIHdoaWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2UgdGhlIDI2
LjIuMgpyZWxlYXNlLgoKTWVzYSAyNi4yLjMgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQuNiBBUEks
IGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRlZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9OKSBvciBn
bEdldEludGVnZXJ2KEdMX01BSk9SX1ZFUlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9NSU5PUl9W
RVJTSU9OKSBkZXBlbmRzIG9uIHRoZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgpTb21l
IGRyaXZlcnMgZG9uJ3Qgc3VwcG9ydCBhbGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGluIE9wZW5H
TCA0LjYuIE9wZW5HTAo0LjYgaXMgKipvbmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3RlZCBhdCBj
b250ZXh0IGNyZWF0aW9uLgpDb21wYXRpYmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQgYSBsb3dl
ciB2ZXJzaW9uIGRlcGVuZGluZyBvbiBlYWNoIGRyaXZlci4KCk1lc2EgMjYuMi4zIGltcGxlbWVu
dHMgdGhlIE9wZW5DTCAzLjEgQVBJLCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIENM
X0RFVklDRV9WRVJTSU9OLCBDTF9ERVZJQ0VfTlVNRVJJQ19WRVJTSU9OIGFuZApDTF9ERVZJQ0Vf
T1BFTkNMX0NfQUxMX1ZFUlNJT05TCmNsR2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVuZHMgb24g
dGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJlaW5nIHVzZWQuCgpNZXNhIDI2LjIuMyBpbXBsZW1lbnRz
IHRoZSBWdWxrYW4gMS40IEFQSSwgYnV0IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBhcGlW
ZXJzaW9uIHByb3BlcnR5IG9mIHRoZSBWa1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBzdHJ1Y3QK
ZGVwZW5kcyBvbiB0aGUgcGFydGljdWxhciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBjaGVja3N1
bXMKLS0tLS0tLS0tLS0tLQoKOjoKCiAgICBTSEEyNTY6IDE2MjgwNThhOGQyYzA2MTU5NzVkZTVh
MTVhYjdiYmI5NjM4YzUwMDAwYjViZWQ5NDU2ZmY0MjNlYTAzNGE4MWYKICAgIG1lc2EtMjYuMi4z
LnRhci54egogICAgU0hBNTEyOiBlYzYyMTczNWFlNDY3OTc2MmVhMjdiOTc5YTUzMTRjN2FlY2Zk
ZDQxNjVhZmVhMTljOGM1NWY5MzNkNzliNDBmMDFmYQogICAgMDQxYTk1ODc0ZmM0MzQ3ZTczMmFj
NTY1Nzg2ZDliNjE2YTlhYTg4NTZhNDIyMjA0ZDllY2M5YTEyZWM0CiAgICBtZXNhLTI2LjIuMy50
YXIueHoKCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KCi0gTm9uZQoKQnVnIGZpeGVzCi0tLS0t
LS0tLQoKLSBOVksgbWVtb3J5IGxlYWsgaW4gQ21kQ29weUJ1ZmZlclRvSW1hZ2UgaW4gMjYuMi4w
LCAyNi4yLjEgYW5kIDI2LjIuMi4KLSBSQURWOiBHUFUgcGFnZSBmYXVsdCAobnVsbCBwb2ludGVy
KSB3aXRoIFJUIGVtdWxhdGlvbiBvbiBQb2xhcmlzIChSWCA1ODAKICAyMDQ4U1ApLiBJc3N1ZSBi
ZXR3ZWVuIDI2LjEuNiBhbmQgMjYuMi4xCi0gW0FOVl1bQVJMXVtiaXNlY3RlZF0gVmlzdWFsIGdy
YXBoaWNzIGdsaXRjaGVzIGluIENvdW50ZXItU3RyaWtlIDIgc3RhcnRpbmcgaW4KICBNZXNhIDI2
LjIueAotIFtyYWRlb25zaV0gTWluZWNyYWZ0IFZveHkgbW9kOiBEaXN0YW50IHdhdGVyIHJlbmRl
cmluZyBpc3N1ZSBvbiBWZWdhIGlHUFUgYW5kCiAgUkROQTIKLSBcYGhldmNfdmFhcGlgIG9uIEFN
RCAocmFkZW9uc2kvZ2Z4MTE1MCkgc3RhbGxzIHRvIH4xIGZwcyB3aGVuIGlucHV0IGZyYW1lcwog
IGNhcnJ5IEEvNTMgKENFQS02MDgvNzA4KSBjbG9zZWQtY2FwdGlvbiBzaWRlIGRhdGEKLSBhbnY6
IFRlc3QgZmFpbHMgaW4gc2ltdWxhdGlvbiBkdWUgdG8gY29hcnNlIHBpeGVsIHNoYWRpbmcgc3Rh
dGUKLSBhc2FoaTogMTYtYml0IGJsZW5kaW5nIGludG8gUkdCQTMyRiBwcm9kdWNlcyB6ZXJvIGR1
ZSB0byAzMi1iaXQgdGlsZWJ1ZmZlcgogIGxvYWQKLSBhc2FoaTogU29tZSB0ZXh0dXJlcyBkbyBu
b3QgcmVuZGVyIGNvcnJlY3RseSBpbiBQb3J0YWxzIDIKLSBsaWJ2dWxrYW5faW50ZWwuc28gY3Jh
c2ggd2l0aCBYLVBsYW5lIDEyLjQuMyBvbiBJbnRlbCBBcmMgQjU4MAotIG5pcmNhY2hlIGNhdXNl
cyBnbHhnZWFycy9lZ2xnZWFycyB0byBzZWdmYXVsdCB1bmRlciBaaW5rCi0gdnVsa2FuLHJhZHY6
IHdoZW4gdXNpbmcgZGVzY3JpcHRvciBoZWFwcywgaW5wdXQgYXR0YWNobWVudHMgaW4gU1BJUi1W
IGFyZQogIGluY29ycmVjdGx5IGRldGVjdGVkIGFzIHJlYWQgb25seSBpbnN0ZWFkIG9mIHJlYWQg
d3JpdGUKCkNoYW5nZXMKLS0tLS0tLQoKQWx5c3NhIFJvc2VuendlaWcgKDEpOgotIG1lc2Evc3Q6
IGZpeCBpbmNvcnJlY3QgVlMgaW5wdXQgYmFzZXMKQW5kcnplaiBEYXRjenVrICgxKToKLSBhYy9z
cXR0LCByYWR2LCByYWRlb25zaTogRml4IFNRVFQgYnVmZmVyIHNpemUgYWxpZ25tZW50IGlzc3Vl
cwpCZW5qYW1pbiBDaGVuZyAoMSk6Ci0gcmFkZW9uc2k6IHNldCBzdGVuY2lsIGNsZWFyIHRvIDAg
d2hlbiBlbmFibGluZyBUQyBjb21wYXQKQ2FpbyBPbGl2ZWlyYSAoMSk6Ci0gc3BpcnY6IFByZXNl
cnZlIGFsbCBmcF9tYXRoX2N0cmwgYml0cyBpbiB2dG5faGFuZGxlX2FsdSBkZWZhdWx0IGNhc2UK
Q2hyaXN0aWFuIEdtZWluZXIgKDIpOgoKLSBldG5hdml2OiBEbyBub3QgYWJvcnQgb24gdW5zdXBw
b3J0ZWQgc3RlbmNpbC1vbmx5IGJsaXRzCi0gZXRuYXZpdjogVXNlIFJTIGRlcHRoIGZvcm1hdHMg
b25seSBvbiBoYWx0aTUrCgpEYW55bG8gUGlsaWFpZXYgKDUpOgoKLSB0dTogV2FpdCBmb3IgWEZC
IHF1ZXJ5IHdyaXRlcyB0byBsYW5kIGJlZm9yZSBtYWtpbmcgaXQgYXZhaWxhYmxlCi0gdHU6IFN5
bmNocm9uaXppbmcgd2l0aCBDbWRDb3B5UXVlcnlQb29sUmVzdWx0IHNob3VsZCB3YWl0IGZvciBt
ZW0gd3JpdGVzCi0gdHU6IFVzZSBwX2F0b21pY19yZWFkIHRvIHJlYWQgZnJvbSBxdWVyeSdzIHNs
b3QtPmF2YWlsYWJsZQotIHR1OiBGaXggUEFDS0VEICsgYWxpZ25hcyg4KSBhcHBsaWNhdGlvbiB0
byB0aGUgc2FtZSBzdHJ1Y3Qgb24gb2xkZXIgR0NDCi0gdHU6IEhhbmRsZSBsYXp5IG1lbW9yeSBp
biBHZXREZXZpY2VNZW1vcnlPcGFxdWVDYXB0dXJlQWRkcmVzcwoKRGF2aWQgUm9zY2EgKDIpOgoK
LSB2YTogRHJvcCBIRVZDIFNFSSBwYXJzaW5nCi0gcmFkdi92aWRlbzogRml4IHNldHRpbmcgc2Vz
c2lvbiBwYXJhbWV0ZXJzIG92ZXJyaWRlIGluZm8KCkRtaXRyeSBCYXJ5c2hrb3YgKDgpOgoKLSBp
cjM6IGtlZXAgYnl0ZSBTU0JPIG9mZnNldHMgYmVmb3JlIGE2eHgKLSBmcmVlZHJlbm8vYTV4eDog
b25seSAyRC1ibGl0IGJldHdlZW4gY29tcGF0aWJsZSBmb3JtYXRzCi0gZnJlZWRyZW5vL2E1eHg6
IHByb2dyYW0gTlVNTk9OUE9TVkFSIHdpdGggcG9zaXRpb24ncyBWUEMgbG9jYXRpb24KLSBmcmVl
ZHJlbm8vYTR4eCthNXh4OiBjbGFtcCB0aGUgdGV4dHVyZSBidWZmZXIgc2l6ZQotIGZyZWVkcmVu
bzoga2VlcCB0aGUgc2VwYXJhdGUgc3RlbmNpbCBvdXQgb2YgdGhlIHNoYWRvdyBibGl0Ci0gZnJl
ZWRyZW5vL2E1eHg6IGJsaXQgdGhlIHNlcGFyYXRlIHN0ZW5jaWwgcGxhbmUgdG9vCi0gaXIzOiBz
a2lwIHRoZSBwaGlzIG9mIG5vbi1HUFIgcmVnaXN0ZXJzIGluIHRoZSBtaW5pbXVtIHByZXNzdXJl
IGJvdW5kCi0gZnJlZWRyZW5vL2E1eHg6IGJvdW5kIGJsaXRzIGJ5IHRoZSBsYXllciBjb3VudCwg
bm90IHRoZSBkZXB0aAoKRW1tYSBBbmhvbHQgKDMpOgoKLSB0dTogRHJvcCBUUkFOU0ZFUl9TUkMv
RFNUIGZyb20gYnVmZmVyRmVhdHVyZXMuCi0gdHU6IEZpeCB0aGUgc1R5cGUgb2YgdGhlIHJldHVy
bmVkIFZrRnJhZ21lbnRTaGFkaW5nUmF0ZUtIUnMuCi0gdHU6IEZpeCBkZXN0cm95IG9yZGVyIG9m
IGF1dG90dW5lIHZzIHBlcmZjb3VudGVycyBpbiBmYWlsdXJlIHBhdGguCgpFcmljIEVuZ2VzdHJv
bSAoNCk6CgotIGRvY3M6IGFkZCBzaGEgc3VtIGZvciAyNi4yLjIKLSAucGlja19zdGF0dXMuanNv
bjogVXBkYXRlIHRvIDlmNDJlYTEyMzkwMjVkM2Y5M2Q5YmJmNzQwNTM0MGFkY2VjOTQ0MTkKLSAu
cGlja19zdGF0dXMuanNvbjogTWFyayBmNDU4MjVhMGM3MjRkMDZmMjMxYTEyMTA0ODRmZTlhZjcx
YTNmZmFiIGFzCiAgZGVub21pbmF0ZWQKLSAucGlja19zdGF0dXMuanNvbjogTWFyayA4NTlmY2Mz
Yjc0ZjgzMWJiYjkxNTFmMDZkMDU1ZGRmZDQ1Y2M2ZTUwIGFzCiAgZGVub21pbmF0ZWQKCkZyYW5r
IEJpbm5zICgzKToKCi0gcHZyOiBhZGQgbWlzc2luZyBHUFUgYXJjaGl0ZWN0dXJlIHRvIGRldmlj
ZSBpbmZvIGZvciBzb21lIEJWTkNzCi0gcHZyOiBmaXh1cCBvcmRlcmluZyBvZiAoaGFzXF8pdXNj
X2l0cl9wYXJhbGxlbF9pbnN0YW5jZXMgaW4gZGV2IGluZm8KLSB6aW5rOiByZXBsYWNlIGJsZW5k
IGFuZCB2ZXJ0ZXggZWxlbWVudHMgc3RhdGUgaGFzaGVzIHdpdGggSURzCgpHYW5lc2ggQmVsZ3Vy
IFJhbWFjaGFuZHJhICgxKToKLSBhbWQ6IGFkZCBnZngxMTcxCkdlb3JnIExlaG1hbm4gKDIpOgoK
LSBuaXIvb3B0X3V1YjogZml4IGltYXggb3B0aW1pemF0aW9uCi0gYWNvOiBhdm9pZCBtdWJ1ZiBi
b3VuZHMgY2hlY2tpbmcgZm9yIGdsb2JhbAoKSXbDoW4gQnJpYW5vICgxKToKLSBhbnY6IGZpeCBw
dXNoIGNvbnN0YW50IHJhbmdlIGdhdGhlcmluZyBmb3IgZHluYW1pYyBvZmZzZXRzCkppeXUgWWFu
ZyAoMSk6Ci0gY2xjOiBmaXggZmQgbGVhayBpbiBvcGVuX2NsY19kYXRhKCkgb24gbWFwIGZhaWx1
cmUKSnVzdG9uIExpICgxKToKLSBhbnYvYW5kcm9pZDogRG9uJ3QgZGlzYWJsZSBBVVhfQklUIGlt
cG9ydGluZyBYZTIrIENDUyBtb2QgaW1hZ2VzCkthcm1qaXQgTWFoaWwgKDEpOgotIHR1OiBGaXgg
c3BhcnNlIGJpbmQgY29sdW1uIG1lcmdpbmcKS2Fyb2wgSGVyYnN0ICgyKToKCi0gbmlyL3Nlcmlh
bGl6ZTogc2V0IGluZm8uc3BlYyB0byBOVUxMCi0gcnVzdGljbC9ldmVudDogcHJvcGVybHkgaW1w
bGVtZW50IENMCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDUwMDAgY2hhcmFj
dGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50IHRv
IHRoZSBBVUggZW1haWxdCi0tLQogLi4uLWFkZHJsaWItYXZvaWQtYnVpbHRpbl9jcHVfc3VwcG9y
dHMtZm9yLWF2eDItZGV0ZWN0aS5wYXRjaCB8IDIgKy0KIC4uLjAwMDEtZnJlZWRyZW5vLWRvbi10
LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2ggfCAyICstCiAuLi4vMDAwMS1t
ZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCAgIHwgMiAr
LQogLi4uc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10eXBlZC1l
bi5wYXRjaCB8IDIgKy0KIC4uLnNyYy11dGlsLXVfbWF0aC5jLWRvLW5vdC11c2UtYXJtLWZwdS1p
bnN0cnVjdGlvbnMtaWYucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9t
ZXNhLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiA2IGZpbGVzIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWFkZHJsaWItYXZvaWQtYnVpbHRpbl9jcHVf
c3VwcG9ydHMtZm9yLWF2eDItZGV0ZWN0aS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL2ZpbGVzLzAwMDEtYWRkcmxpYi1hdm9pZC1idWlsdGluX2NwdV9zdXBwb3J0cy1mb3ItYXZ4
Mi1kZXRlY3RpLnBhdGNoCmluZGV4IDEyMDAyYTJjMDMuLjJiMzBjMWI1YzcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtYWRkcmxpYi1hdm9pZC1idWls
dGluX2NwdV9zdXBwb3J0cy1mb3ItYXZ4Mi1kZXRlY3RpLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtYWRkcmxpYi1hdm9pZC1idWlsdGluX2NwdV9zdXBw
b3J0cy1mb3ItYXZ4Mi1kZXRlY3RpLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MjI5M2U5
MDQ4NGYwN2I1MTg2ZjJmMWZhN2RlNjNkYTBmMTIwMTIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBiMDA0MDk5NTZjZDFhNThmMWM2NzZkZTljYmZkMmM2ODhjYTNmYzlmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGtoZW0ucmFqQG9zcy5xdWFsY29tbS5j
b20+CiBEYXRlOiBUaHUsIDEzIEF1ZyAyMDI2IDAwOjAwOjAwICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGFkZHJsaWI6IGF2b2lkIF9fYnVpbHRpbl9jcHVfc3VwcG9ydHMgZm9yIGF2eDIgZGV0ZWN0
aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZy
ZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2Rl
LWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaAppbmRleCA3YTAwYWNiZWQzLi5kNTgwMjc3
MTI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZy
ZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVu
Y29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGZkNTU3MWUyMmZkMThiODU1MTk5ZjIzNzMxZjAzNTkyNzA2N2EyYTIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGE2MWRhYWYzNTRiZDg0ZGZhODQ5ZjhkYTYwMjhkZGM3MWYxYWY3ZGMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnku
YmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+CiBEYXRlOiBXZWQsIDEwIERlYyAyMDI1IDAyOjI3
OjE2ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGZyZWVkcmVubzogZG9uJ3QgZW5jb2RlIGJ1aWxk
IHBhdGggaW50byBiaW5hcmllcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFu
Zy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlz
ZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKaW5kZXggZGMwOTU3ZDhl
Mi4uNzdhMGJhM2Q4YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmls
ZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2Rl
dGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBjMWE4OWEwODYyOWY5ZTU3NmUxMzZkYzA0NGMwZWQ4YTJiNjdkOTJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBjM2EzNTlkMzllMzg3ZTc4NTg4M2NiNzQwOTM0YTBkYzRlNjM3
NmRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KIERhdGU6IE1vbiwgMTMgSmFuIDIwMjAgMTU6MjM6NDcgLTA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gbWVzb24gbWlzZGV0ZWN0cyA2NGJpdCBhdG9taWNzIG9uIG1pcHMvY2xhbmcKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLWludGVs
LWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1q
YXlfaXIuaC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRjaAppbmRleCAzNjQ1NmNjM2IxLi5iOTIz
YzRjMWZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAx
LXNyYy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgtZG8tbm90LXVzZWQtdHlwZWQtZW4ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtaW50ZWwt
Y29tcGlsZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBmMGMxYjRlNTQ4MGJiNDExODMyNmEzMzlhM2E3MDg0ZGYxYTZiMGI3IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjY2ZhNWE2NTU1ZjZlYjAzNWFjZTEyY2JhMWNl
M2U3ODVhNDc4OTVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFN1biwgMTQgSnVuIDIwMjYgMTc6NDI6
MTkgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfaXIu
aDogZG8gbm90IHVzZWQgdHlwZWQgZW51bQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtdXRpbC11X21hdGguYy1kby1ub3QtdXNlLWFybS1mcHUt
aW5zdHJ1Y3Rpb25zLWlmLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMv
MDAwMS1zcmMtdXRpbC11X21hdGguYy1kby1ub3QtdXNlLWFybS1mcHUtaW5zdHJ1Y3Rpb25zLWlm
LnBhdGNoCmluZGV4IGFhYzQyMDgzYzQuLjBkMGZkYWNlMmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLXV0aWwtdV9tYXRoLmMtZG8tbm90LXVz
ZS1hcm0tZnB1LWluc3RydWN0aW9ucy1pZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbWVzYS9maWxlcy8wMDAxLXNyYy11dGlsLXVfbWF0aC5jLWRvLW5vdC11c2UtYXJtLWZwdS1p
bnN0cnVjdGlvbnMtaWYucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU2ZGJjODM4ZTQyZDky
MDUwNmYwZjExOWE2NWExZmFmMGNmN2IzY2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDg5YzQ2ZGU5MmU5NzQyMDJjMWNhYmNlMjViYjRkOTQ0MTgzMGI4YjYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgog
RGF0ZTogV2VkLCAxIEp1bCAyMDI2IDIyOjQ4OjE1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNy
Yy91dGlsL3VfbWF0aC5jOiBkbyBub3QgdXNlIGFybSBmcHUgaW5zdHJ1Y3Rpb25zIGlmIGZwdSBp
cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYwppbmRleCAxMTU0ZDUxMWQ5Li5iMGFlNTAx
NmRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYworKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYwpAQCAtMjIsOCArMjIsOCBAQCBT
UkNfVVJJID0gImh0dHBzOi8vYXJjaGl2ZS5tZXNhM2Qub3JnL21lc2EtJHtQVn0udGFyLnh6IFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDEtYWRkcmxpYi1hdm9pZC1idWlsdGluX2NwdV9zdXBwb3J0
cy1mb3ItYXZ4Mi1kZXRlY3RpLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMTYyODA1OGE4ZDJjMDYxNTk3NWRlNWExNWFiN2JiYjk2MzhjNTAwMDBiNWJlZDk0
NTZmZjQyM2VhMDM0YTgxZiIKLVBWID0gIjI2LjIuMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJi
Y2U1ZjdmYmViYjkzNDM3M2I4NmM5OTlhMDY0ZDUyZmI1MDY1ODc4ZGM1N2YyODdmOTUzNDY2NDhl
YzgzMmU5IgorUFYgPSAiMjYuMi40IgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJt
ZXNhLSg/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAotLSAKMi40Ny4xCgo=

--===============0873413403893321578==--

