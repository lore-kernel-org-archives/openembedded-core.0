Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F358F43844
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19747.1776261888768925237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Yimzlk4q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zxad87ei;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d917583b3-f3d31a4e-17a6-4a17-843f-bb938677a243-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fhyGc1RnBqmzSEvU72vbxwr5uYf9thYRchEOqs0XGD8=;
	b=Yimzlk4qZDYfs4N1X8kkiy4zYvUyVPgdcIlMo41Mi7pV54JMB0vlPL47MwJSUUZb
	QCyVdr24YkLO7zQlfDMDVJX7jYNEM7BSex7aQ6bBTa6XaEmbbRuAdG1luCJrr+tNrl0
	2B8PBZz5D8G9jOwIuz94/QKjejxxy6dOarnHpxzc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fhyGc1RnBqmzSEvU72vbxwr5uYf9thYRchEOqs0XGD8=;
	b=zxad87ei0BIQrlo4YpqWytHWCgr7ABcXUMDHAjX0dJKZOeSV6HAEoNLd9UZNR9hC
	Aj0KVleU3g/TB9QoZUOqvb/XlavreZjqwkLyM6dOggN0qcZQrjFLc6s11yrrAJ3gihO
	qVIbxMhzqo/oY38Njgf8n8P/VV7DfxQQdcli3Cao=
Content-Type: multipart/mixed; boundary="===============8523201769131257036=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libjpeg-turbo: upgrading to 3.1.90 SUCCEEDED
Message-ID: <0101019d917583b3-f3d31a4e-17a6-4a17-843f-bb938677a243-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235280

--===============8523201769131257036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpsaWJqcGVnLXR1cmJvKiB0byAqMy4xLjkwKiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBzdGVw
czoKICAgIC0gYXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1saWJqcGVnLXR1cmJvLXVwZ3Jh
ZGUtMy4xLjMtMy4xLjkwLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFt
IHBhdGNoZXMgYW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAgIC0g
Y29tcGlsZSBhbiBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZvcm0g
c29tZSBiYXNpYyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWduIGl0
IG9mZjogZ2l0IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQgaXQg
dG8gdGhlIGFwcHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91IGJl
bGlldmUgdGhlIHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwKeW91
IGNhbiBmaWxsIFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZp
bGUgc28gdGhhdAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVtcHRl
ZC4KClBsZWFzZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0
aW9uIGFuZCBidWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxlIGEg
YnVnIGF0IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3By
b2R1Y3Q9QXV0b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUg
SGVscGVyCgotLSA+OCAtLQpGcm9tIDI0ZWE4NjA3ZGFmNWI3NzMyYTY1ZjM1ODU1YjY3MzU1MTM2
MDQ4NWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhA
eW9jdG9wcm9qZWN0Lm9yZz4KRGF0ZTogV2VkLCAxNSBBcHIgMjAyNiAxMjowNTo1OCArMDAwMApT
dWJqZWN0OiBbUEFUQ0hdIGxpYmpwZWctdHVyYm86IHVwZ3JhZGUgMy4xLjMgLT4gMy4xLjkwCgot
LS0KIC4uLnR1cmJvXzMuMS4zLmJiID0+IGxpYmpwZWctdHVyYm9fMy4xLjkwLmJifSB8IDE0NiAr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNDQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy97bGlianBlZy10
dXJib18zLjEuMy5iYiA9PiBsaWJqcGVnLXR1cmJvXzMuMS45MC5iYn0gKDMxJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS4zLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuOTAuYmIKc2ltaWxh
cml0eSBpbmRleCAzMSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGli
anBlZy10dXJib18zLjEuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcv
bGlianBlZy10dXJib18zLjEuOTAuYmIKaW5kZXggMjZlODRjYTQyYy4uNDU3N2EwYTRiMCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS45MC5i
YgpAQCAtMSwxNSArMSwxNTcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVl
cyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2lu
ZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0
ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1
bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNl
LVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHll
YXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLm1kCisj
ICsrKyBMSUNFTlNFLm1kCisjIEBAIC04LDE4ICs4LDQ2IEBACisjICAKKyMgICAgVGhpcyBsaWNl
bnNlIGFwcGxpZXMgdG8gdGhlIGxpYmpwZWcgQVBJIGxpYnJhcnkgYW5kIGFzc29jaWF0ZWQgcHJv
Z3JhbXMsCisjICAgIGluY2x1ZGluZyBhbnkgY29kZSBpbmhlcml0ZWQgZnJvbSBsaWJqcGVnIGFu
ZCBhbnkgbW9kaWZpY2F0aW9ucyB0byB0aGF0CisjIC0gIGNvZGUuICBOb3RlIHRoYXQgdGhlIGxp
YmpwZWctdHVyYm8gU0lNRCBzb3VyY2UgY29kZSBiZWFycyB0aGUKKyMgLSAgW3psaWIgTGljZW5z
ZV0oaHR0cHM6Ly9vcGVuc291cmNlLm9yZy9saWNlbnNlcy9abGliKSwgYnV0IGluIHRoZSBjb250
ZXh0IG9mCisjIC0gIHRoZSBvdmVyYWxsIGxpYmpwZWcgQVBJIGxpYnJhcnksIHRoZSB0ZXJtcyBv
ZiB0aGUgemxpYiBMaWNlbnNlIGFyZSBzdWJzdW1lZAorIyAtICBieSB0aGUgdGVybXMgb2YgdGhl
IElKRyBMaWNlbnNlLgorIyArICBjb2RlLgorIyAgCisjICAtIFRoZSBNb2RpZmllZCAoMy1jbGF1
c2UpIEJTRCBMaWNlbnNlLCB3aGljaCBpcyBsaXN0ZWQgYmVsb3cKKyMgIAorIyAtICBUaGlzIGxp
Y2Vuc2UgYXBwbGllcyB0byB0aGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IGFuZCBhc3NvY2lhdGVk
IHByb2dyYW1zLCBhcworIyAtICB3ZWxsIGFzIHRoZSBidWlsZCBzeXN0ZW0uICBOb3RlIHRoYXQg
dGhlIFR1cmJvSlBFRyBBUEkgbGlicmFyeSB3cmFwcyB0aGUKKyMgLSAgbGlianBlZyBBUEkgbGli
cmFyeSwgc28gaW4gdGhlIGNvbnRleHQgb2YgdGhlIG92ZXJhbGwgVHVyYm9KUEVHIEFQSSBsaWJy
YXJ5LAorIyAtICBib3RoIHRoZSB0ZXJtcyBvZiB0aGUgSUpHIExpY2Vuc2UgYW5kIHRoZSB0ZXJt
cyBvZiB0aGUgTW9kaWZpZWQgKDMtY2xhdXNlKQorIyAtICBCU0QgTGljZW5zZSBhcHBseS4KKyMg
KyAgVGhpcyBsaWNlbnNlIGFwcGxpZXMgdG8gdGhlIFR1cmJvSlBFRyBBUEkgbGlicmFyeSBhbmQg
YXNzb2NpYXRlZCBwcm9ncmFtcywKKyMgKyAgW2xpYnNwbmddKGh0dHBzOi8vbGlic3BuZy5vcmcp
ICh3aGljaCBpcyB1c2VkIGJ5IGNqcGVnIGFuZCBkanBlZyksIGFuZCB0aGUKKyMgKyAgYnVpbGQv
dGVzdCBzeXN0ZW0uCisjICsKKyMgKyAgKiBUaGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IHdyYXBz
IHRoZSBsaWJqcGVnIEFQSSBsaWJyYXJ5LCBzbyBpbiB0aGUgY29udGV4dAorIyArICAgIG9mIHRo
ZSBvdmVyYWxsIFR1cmJvSlBFRyBBUEkgbGlicmFyeSwgYm90aCB0aGUgdGVybXMgb2YgdGhlIElK
RyBMaWNlbnNlIGFuZAorIyArICAgIHRoZSB0ZXJtcyBvZiB0aGUgTW9kaWZpZWQgKDMtY2xhdXNl
KSBCU0QgTGljZW5zZSBhcHBseS4KKyMgKyAgKiBjanBlZyBhbmQgZGpwZWcgdXNlIGxpYnNwbmcs
IHNvIGluIHRoZSBjb250ZXh0IG9mIHRob3NlIHByb2dyYW1zLCBib3RoIHRoZQorIyArICAgIHRl
cm1zIG9mIHRoZSBJSkcgTGljZW5zZSBhbmQgdGhlIHRlcm1zIG9mIHRoZSBNb2RpZmllZCAoMy1j
bGF1c2UpIEJTRAorIyArICAgIExpY2Vuc2UgYXBwbHkuCisjICsKKyMgKworIyArQ29tcG9uZW50
IExpY2Vuc2VzCisjICs9PT09PT09PT09PT09PT09PT0KKyMgKworIyArU29tZSBvZiBsaWJqcGVn
LXR1cmJvJ3MgbW9kdWxlcyBhbmQgaW50ZXJuYWwgZGVwZW5kZW5jaWVzIGFyZSBjb3ZlcmVkIGJ5
IGxlc3MKKyMgK3Jlc3RyaWN0aXZlIGxpY2Vuc2VzLCBidXQgaW4gdGhlIGNvbnRleHQgb2YgbGli
anBlZy10dXJibyBhcyBhIHdob2xlLCB0aGUgdGVybXMKKyMgK29mIHRoZSBsZXNzIHJlc3RyaWN0
aXZlIGxpY2Vuc2VzIGFyZSBzdWJzdW1lZCBieSBlaXRoZXIgdGhlIElKRyBMaWNlbnNlIG9yIHRo
ZQorIyArTW9kaWZpZWQgQlNEIExpY2Vuc2UuICAoSW4gb3RoZXIgd29yZHMsIHRoZSB0ZXJtcyBv
ZiB0aGUgbGVzcyByZXN0cmljdGl2ZQorIyArbGljZW5zZXMgYXJlIHNhdGlzZmllZCBpZiB0aGUg
dGVybXMgb2YgdGhlIElKRyBhbmQgTW9kaWZpZWQgQlNEIExpY2Vuc2VzIGFyZQorIyArc2F0aXNm
aWVkLikKKyMgKworIyArLSBUaGUgbGlianBlZy10dXJibyBTSU1EIHNvdXJjZSBjb2RlIGFuZCB6
bGliIGFyZSBjb3ZlcmVkIGJ5IHRoZQorIyArICBbemxpYiBMaWNlbnNlXShodHRwczovL3NwZHgu
b3JnL2xpY2Vuc2VzL1psaWIuaHRtbCksIHdoaWNoIGlzIHN1YnN1bWVkIGJ5IHRoZQorIyArICBJ
SkcgTGljZW5zZSBpbiB0aGUgY29udGV4dCBvZiB0aGUgY2pwZWcgYW5kIGRqcGVnIHByb2dyYW1z
IGFuZCB0aGUgbGlianBlZworIyArICBBUEkgbGlicmFyeS4KKyMgKworIyArLSBTb21lIG9mIHRo
ZSBsaWJzcG5nIHNvdXJjZSBjb2RlIGlzIGNvdmVyZWQgYnkgdGhlCisjICsgIFtQTkcgUmVmZXJl
bmNlIExpYnJhcnkgTGljZW5zZSB2Ml0oaHR0cHM6Ly9zcGR4Lm9yZy9saWNlbnNlcy9saWJwbmct
Mi4wLmh0bWwpLAorIyArICB3aGljaCBpcyBzdWJzdW1lZCBieSB0aGUgSUpHIExpY2Vuc2UgaW4g
dGhlIGNvbnRleHQgb2YgdGhlIGNqcGVnIGFuZCBkanBlZworIyArICBwcm9ncmFtcyBhbmQgdGhl
IFR1cmJvSlBFRyBBUEkgbGlicmFyeS4KKyMgKworIyArLSBNb3N0IG9mIHRoZSBsaWJzcG5nIHNv
dXJjZSBjb2RlIGlzIGNvdmVyZWQgYnkgdGhlCisjICsgIFtTaW1wbGlmaWVkICgyLWNsYXVzZSkg
QlNEIExpY2Vuc2VdKGh0dHBzOi8vc3BkeC5vcmcvbGljZW5zZXMvQlNELTItQ2xhdXNlLmh0bWwp
LAorIyArICB3aGljaCBpcyBzdWJzdW1lZCBieSB0aGUgTW9kaWZpZWQgQlNEIExpY2Vuc2UgaW4g
dGhlIGNvbnRleHQgb2YgdGhlIGNqcGVnIGFuZAorIyArICBkanBlZyBwcm9ncmFtcyBhbmQgdGhl
IFR1cmJvSlBFRyBBUEkgbGlicmFyeS4KKyMgIAorIyAgCisjICBDb21wbHlpbmcgd2l0aCB0aGUg
bGlianBlZy10dXJibyBMaWNlbnNlcworIyBAQCAtMzgsNyArNjYsNiBAQAorIyAgICAgICAgICAq
Kk9yaWdpbioqCisjICAgICAgICAgIC0gQ2xhdXNlIDEgb2YgdGhlIElKRyBMaWNlbnNlCisjICAg
ICAgICAgIC0gQ2xhdXNlIDEgb2YgdGhlIE1vZGlmaWVkIEJTRCBMaWNlbnNlCisjIC0gICAgICAg
IC0gQ2xhdXNlcyAxIGFuZCAzIG9mIHRoZSB6bGliIExpY2Vuc2UKKyMgIAorIyAgICAgIDIuICBZ
b3UgbXVzdCBhZGQgeW91ciBvd24gY29weXJpZ2h0IG5vdGljZSB0byB0aGUgaGVhZGVyIG9mIGVh
Y2ggc291cmNlCisjICAgICAgICAgIGZpbGUgeW91IG1vZGlmaWVkLCBzbyBvdGhlcnMgY2FuIHRl
bGwgdGhhdCB5b3UgbW9kaWZpZWQgdGhhdCBmaWxlLiAgKElmCisjIEBAIC00Nyw3ICs3NCw2IEBA
CisjICAKKyMgICAgICAgICAgKipPcmlnaW4qKgorIyAgICAgICAgICAtIENsYXVzZSAxIG9mIHRo
ZSBJSkcgTGljZW5zZQorIyAtICAgICAgICAtIENsYXVzZSAyIG9mIHRoZSB6bGliIExpY2Vuc2UK
KyMgIAorIyAgICAgIDMuICBZb3UgbXVzdCBpbmNsdWRlIHRoZSBJSkcgUkVBRE1FIGZpbGUsIGFu
ZCB5b3UgbXVzdCBub3QgYWx0ZXIgYW55IG9mIHRoZQorIyAgICAgICAgICBjb3B5cmlnaHQgb3Ig
bGljZW5zZSB0ZXh0IGluIHRoYXQgZmlsZS4KKyMgQEAgLTY3LDkgKzkzLDkgQEAKKyMgICAgICAg
ICAgKipPcmlnaW4qKgorIyAgICAgICAgICAtIENsYXVzZSAyIG9mIHRoZSBJSkcgbGljZW5zZQor
IyAgCisjIC0gICAgMi4gIElmIHlvdXIgYmluYXJ5IGRpc3RyaWJ1dGlvbiBpbmNsdWRlcyBvciB1
c2VzIHRoZSBUdXJib0pQRUcgQVBJLCB0aGVuCisjIC0gICAgICAgIHlvdXIgcHJvZHVjdCBkb2N1
bWVudGF0aW9uIG11c3QgaW5jbHVkZSB0aGUgdGV4dCBvZiB0aGUgTW9kaWZpZWQgQlNECisjIC0g
ICAgICAgIExpY2Vuc2UgKHNlZSBiZWxvdy4pCisjICsgICAgMi4gIElmIHlvdXIgYmluYXJ5IGRp
c3RyaWJ1dGlvbiBpbmNsdWRlcyBvciB1c2VzIHRoZSBUdXJib0pQRUcgQVBJIG9yCisjICsgICAg
ICAgIGFzc29jaWF0ZWQgcHJvZ3JhbXMsIGNqcGVnLCBvciBkanBlZywgdGhlbiB5b3VyIHByb2R1
Y3QgZG9jdW1lbnRhdGlvbgorIyArICAgICAgICBtdXN0IGluY2x1ZGUgdGhlIHRleHQgb2YgdGhl
IE1vZGlmaWVkIEJTRCBMaWNlbnNlIChzZWUgYmVsb3cuKQorIyAgCisjICAgICAgICAgICoqT3Jp
Z2luKioKKyMgICAgICAgICAgLSBDbGF1c2UgMiBvZiB0aGUgTW9kaWZpZWQgQlNEIExpY2Vuc2UK
KyMgQEAgLTgxLDIxICsxMDcsMjAgQEAKKyMgICAgICAtIElKRyBMaWNlbnNlCisjICAgICAgLSBD
bGF1c2UgMyBvZiB0aGUgTW9kaWZpZWQgQlNEIExpY2Vuc2UKKyMgIAorIyAtNC4gIFRoZSBJSkcg
YW5kIFRoZSBsaWJqcGVnLXR1cmJvIFByb2plY3QgZG8gbm90IHdhcnJhbnQgbGlianBlZy10dXJi
byB0byBiZQorIyAtICAgIGZyZWUgb2YgZGVmZWN0cywgbm9yIGRvIHdlIGFjY2VwdCBhbnkgbGlh
YmlsaXR5IGZvciB1bmRlc2lyYWJsZQorIyAtICAgIGNvbnNlcXVlbmNlcyByZXN1bHRpbmcgZnJv
bSB5b3VyIHVzZSBvZiB0aGUgc29mdHdhcmUuCisjICs0LiAgVGhlIGF1dGhvcnMgYW5kIGRpc3Ry
aWJ1dG9ycyBkbyBub3Qgd2FycmFudCBsaWJqcGVnLXR1cmJvIHRvIGJlIGZyZWUgb2YKKyMgKyAg
ICBkZWZlY3RzLCBub3IgZG8gd2UgYWNjZXB0IGFueSBsaWFiaWxpdHkgZm9yIHVuZGVzaXJhYmxl
IGNvbnNlcXVlbmNlcworIyArICAgIHJlc3VsdGluZyBmcm9tIHlvdXIgdXNlIG9mIHRoZSBzb2Z0
d2FyZS4KKyMgIAorIyAgICAgICoqT3JpZ2luKioKKyMgICAgICAtIElKRyBMaWNlbnNlCisjICAg
ICAgLSBNb2RpZmllZCBCU0QgTGljZW5zZQorIyAtICAgIC0gemxpYiBMaWNlbnNlCisjICAKKyMg
IAorIyAgVGhlIE1vZGlmaWVkICgzLWNsYXVzZSkgQlNEIExpY2Vuc2UKKyMgID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09CisjICAKKyMgLUNvcHlyaWdodCAoQykyMDA5LTIwMjUg
RC4gUi4gQ29tbWFuZGVyLiAgQWxsIFJpZ2h0cyBSZXNlcnZlZC48YnI+CisjIC1Db3B5cmlnaHQg
KEMpMjAxNSBWaWt0b3IgU3phdGhtw6FyeS4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjICtDb3B5
cmlnaHQgKEMpIDIwMDktMjAyNiBELiBSLiBDb21tYW5kZXI8YnI+CisjICtDb3B5cmlnaHQgKEMp
IDIwMTgtMjAyMyBSYW5keSA8cmFuZHk0MDhAcHJvdG9ubWFpbC5jb20+CisjICAKKyMgIFJlZGlz
dHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0
aG91dAorIyAgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZv
bGxvd2luZyBjb25kaXRpb25zIGFyZSBtZXQ6CisjIEBAIC0xMjAsMTYgKzE0NSwzIEBACisjICBD
T05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwgT1IgVE9SVCAoSU5DTFVESU5HIE5FR0xJR0VOQ0Ug
T1IgT1RIRVJXSVNFKQorIyAgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBUSEUgVVNFIE9GIFRI
SVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUKKyMgIFBPU1NJQklMSVRZIE9GIFNV
Q0ggREFNQUdFLgorIyAtCisjIC0KKyMgLVdoeSBUd28gTGljZW5zZXM/CisjIC09PT09PT09PT09
PT09PT09PQorIyAtCisjIC1UaGUgemxpYiBMaWNlbnNlIGNvdWxkIGhhdmUgYmVlbiB1c2VkIGlu
c3RlYWQgb2YgdGhlIE1vZGlmaWVkICgzLWNsYXVzZSkgQlNECisjIC1MaWNlbnNlLCBhbmQgc2lu
Y2UgdGhlIElKRyBMaWNlbnNlIGVmZmVjdGl2ZWx5IHN1YnN1bWVzIHRoZSBkaXN0cmlidXRpb24K
KyMgLWNvbmRpdGlvbnMgb2YgdGhlIHpsaWIgTGljZW5zZSwgdGhpcyB3b3VsZCBoYXZlIGVmZmVj
dGl2ZWx5IHBsYWNlZAorIyAtbGlianBlZy10dXJibyBiaW5hcnkgZGlzdHJpYnV0aW9ucyB1bmRl
ciB0aGUgSUpHIExpY2Vuc2UuICBIb3dldmVyLCB0aGUgSUpHCisjIC1MaWNlbnNlIHNwZWNpZmlj
YWxseSByZWZlcnMgdG8gdGhlIEluZGVwZW5kZW50IEpQRUcgR3JvdXAgYW5kIGRvZXMgbm90IGV4
dGVuZAorIyAtYXR0cmlidXRpb24gYW5kIGVuZG9yc2VtZW50IHByb3RlY3Rpb25zIHRvIG90aGVy
IGVudGl0aWVzLiAgVGh1cywgaXQgd2FzCisjIC1kZXNpcmFibGUgdG8gY2hvb3NlIGEgbGljZW5z
ZSB0aGF0IGdyYW50ZWQgdXMgdGhlIHNhbWUgcHJvdGVjdGlvbnMgZm9yIG5ldyBjb2RlCisjIC10
aGF0IHdlcmUgZ3JhbnRlZCB0byB0aGUgSUpHIGZvciBjb2RlIGRlcml2ZWQgZnJvbSB0aGVpciBz
b2Z0d2FyZS4KKyMgCisjCisKIFNVTU1BUlkgPSAiSGFyZHdhcmUgYWNjZWxlcmF0ZWQgSlBFRyBj
b21wcmVzc2lvbi9kZWNvbXByZXNzaW9uIGxpYnJhcnkiCiBERVNDUklQVElPTiA9ICJsaWJqcGVn
LXR1cmJvIGlzIGEgZGVyaXZhdGl2ZSBvZiBsaWJqcGVnIHRoYXQgdXNlcyBTSU1EIGluc3RydWN0
aW9ucyAoTU1YLCBTU0UyLCBORU9OKSB0byBhY2NlbGVyYXRlIGJhc2VsaW5lIEpQRUcgY29tcHJl
c3Npb24gYW5kIGRlY29tcHJlc3Npb24iCiBIT01FUEFHRSA9ICJodHRwOi8vbGlianBlZy10dXJi
by5vcmcvIgogCiBMSUNFTlNFID0gIklKRyAmIEJTRC0zLUNsYXVzZSAmIFpsaWIiCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT01MmZkZGFiYzdlOGU3OTIzMzE1MGVi
ZGE5NWMzZmMxZiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWQy
MWRhZWYzYjRiMzE4Zjc3MDYyMDU1MDU5YzcyOTM0IgogCiBERVBFTkRTOmFwcGVuZDp4ODYtNjQ6
Y2xhc3MtdGFyZ2V0ID0gIiBuYXNtLW5hdGl2ZSIKIERFUEVORFM6YXBwZW5kOng4NjpjbGFzcy10
YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9k
b3dubG9hZC8ke1BWfS8ke0JQfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDc1OTIw
YjgyNjgzNGFjNGRkZjk3NjYxY2M3MzQ5MTA0Nzg1NTg1OWFmZmQ2NzFkNTIwNzljNjg2N2MxYzZj
MCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxZDBlODZlZTQ1YmY0MzVkYzU3Zjg3NDQ3NjNiYTYy
NDEwMjk0YjBmNTMxMmNiODc5NjIyMTRhYzFmN2ZiNzhiIgogCiBQRSA9ICIxIgogCi0tIAoyLjQ3
LjEKCg==

--===============8523201769131257036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGSIZE changed from 287288 to 561720 (+96%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5707128 to 7269448 (+27%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2123117 to 3410168 (+61%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 874973 to 1026581 (+17%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: FILELIST: removed "/usr/lib/libturbojpeg.so.0.4.0", added "/usr/lib/libturbojpeg.so.0.5.0"
Changes to packages/x86-64-v3-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/libturbojpeg.so.0 changed symlink target from libturbojpeg.so.0.4.0 to libturbojpeg.so.0.5.0
  /usr/lib/libturbojpeg.so.0.4.0 moved to /usr/lib/libturbojpeg.so.0.5.0

--===============8523201769131257036==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-3.1.3-3.1.90.patch"

RnJvbSAyNGVhODYwN2RhZjViNzczMmE2NWYzNTg1NWI2NzM1NTEzNjA0ODViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTI6MDU6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqcGVnLXR1cmJvOiB1cGdyYWRlIDMuMS4zIC0+IDMuMS45MAoKLS0tCiAuLi50dXJib18zLjEu
My5iYiA9PiBsaWJqcGVnLXR1cmJvXzMuMS45MC5iYn0gfCAxNDYgKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgMTQ0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcve2xpYmpwZWctdHVyYm9fMy4xLjMuYmIgPT4g
bGlianBlZy10dXJib18zLjEuOTAuYmJ9ICgzMSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMy5iYiBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjkwLmJiCnNpbWlsYXJpdHkgaW5kZXggMzElCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4x
LjkwLmJiCmluZGV4IDI2ZTg0Y2E0MmMuLjQ1NzdhMGE0YjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjMuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuOTAuYmIKQEAgLTEsMTUgKzEsMTU3
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5tZAorIyArKysgTElDRU5TRS5tZAor
IyBAQCAtOCwxOCArOCw0NiBAQAorIyAgCisjICAgIFRoaXMgbGljZW5zZSBhcHBsaWVzIHRvIHRo
ZSBsaWJqcGVnIEFQSSBsaWJyYXJ5IGFuZCBhc3NvY2lhdGVkIHByb2dyYW1zLAorIyAgICBpbmNs
dWRpbmcgYW55IGNvZGUgaW5oZXJpdGVkIGZyb20gbGlianBlZyBhbmQgYW55IG1vZGlmaWNhdGlv
bnMgdG8gdGhhdAorIyAtICBjb2RlLiAgTm90ZSB0aGF0IHRoZSBsaWJqcGVnLXR1cmJvIFNJTUQg
c291cmNlIGNvZGUgYmVhcnMgdGhlCisjIC0gIFt6bGliIExpY2Vuc2VdKGh0dHBzOi8vb3BlbnNv
dXJjZS5vcmcvbGljZW5zZXMvWmxpYiksIGJ1dCBpbiB0aGUgY29udGV4dCBvZgorIyAtICB0aGUg
b3ZlcmFsbCBsaWJqcGVnIEFQSSBsaWJyYXJ5LCB0aGUgdGVybXMgb2YgdGhlIHpsaWIgTGljZW5z
ZSBhcmUgc3Vic3VtZWQKKyMgLSAgYnkgdGhlIHRlcm1zIG9mIHRoZSBJSkcgTGljZW5zZS4KKyMg
KyAgY29kZS4KKyMgIAorIyAgLSBUaGUgTW9kaWZpZWQgKDMtY2xhdXNlKSBCU0QgTGljZW5zZSwg
d2hpY2ggaXMgbGlzdGVkIGJlbG93CisjICAKKyMgLSAgVGhpcyBsaWNlbnNlIGFwcGxpZXMgdG8g
dGhlIFR1cmJvSlBFRyBBUEkgbGlicmFyeSBhbmQgYXNzb2NpYXRlZCBwcm9ncmFtcywgYXMKKyMg
LSAgd2VsbCBhcyB0aGUgYnVpbGQgc3lzdGVtLiAgTm90ZSB0aGF0IHRoZSBUdXJib0pQRUcgQVBJ
IGxpYnJhcnkgd3JhcHMgdGhlCisjIC0gIGxpYmpwZWcgQVBJIGxpYnJhcnksIHNvIGluIHRoZSBj
b250ZXh0IG9mIHRoZSBvdmVyYWxsIFR1cmJvSlBFRyBBUEkgbGlicmFyeSwKKyMgLSAgYm90aCB0
aGUgdGVybXMgb2YgdGhlIElKRyBMaWNlbnNlIGFuZCB0aGUgdGVybXMgb2YgdGhlIE1vZGlmaWVk
ICgzLWNsYXVzZSkKKyMgLSAgQlNEIExpY2Vuc2UgYXBwbHkuCisjICsgIFRoaXMgbGljZW5zZSBh
cHBsaWVzIHRvIHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgYW5kIGFzc29jaWF0ZWQgcHJvZ3Jh
bXMsCisjICsgIFtsaWJzcG5nXShodHRwczovL2xpYnNwbmcub3JnKSAod2hpY2ggaXMgdXNlZCBi
eSBjanBlZyBhbmQgZGpwZWcpLCBhbmQgdGhlCisjICsgIGJ1aWxkL3Rlc3Qgc3lzdGVtLgorIyAr
CisjICsgICogVGhlIFR1cmJvSlBFRyBBUEkgbGlicmFyeSB3cmFwcyB0aGUgbGlianBlZyBBUEkg
bGlicmFyeSwgc28gaW4gdGhlIGNvbnRleHQKKyMgKyAgICBvZiB0aGUgb3ZlcmFsbCBUdXJib0pQ
RUcgQVBJIGxpYnJhcnksIGJvdGggdGhlIHRlcm1zIG9mIHRoZSBJSkcgTGljZW5zZSBhbmQKKyMg
KyAgICB0aGUgdGVybXMgb2YgdGhlIE1vZGlmaWVkICgzLWNsYXVzZSkgQlNEIExpY2Vuc2UgYXBw
bHkuCisjICsgICogY2pwZWcgYW5kIGRqcGVnIHVzZSBsaWJzcG5nLCBzbyBpbiB0aGUgY29udGV4
dCBvZiB0aG9zZSBwcm9ncmFtcywgYm90aCB0aGUKKyMgKyAgICB0ZXJtcyBvZiB0aGUgSUpHIExp
Y2Vuc2UgYW5kIHRoZSB0ZXJtcyBvZiB0aGUgTW9kaWZpZWQgKDMtY2xhdXNlKSBCU0QKKyMgKyAg
ICBMaWNlbnNlIGFwcGx5LgorIyArCisjICsKKyMgK0NvbXBvbmVudCBMaWNlbnNlcworIyArPT09
PT09PT09PT09PT09PT09CisjICsKKyMgK1NvbWUgb2YgbGlianBlZy10dXJibydzIG1vZHVsZXMg
YW5kIGludGVybmFsIGRlcGVuZGVuY2llcyBhcmUgY292ZXJlZCBieSBsZXNzCisjICtyZXN0cmlj
dGl2ZSBsaWNlbnNlcywgYnV0IGluIHRoZSBjb250ZXh0IG9mIGxpYmpwZWctdHVyYm8gYXMgYSB3
aG9sZSwgdGhlIHRlcm1zCisjICtvZiB0aGUgbGVzcyByZXN0cmljdGl2ZSBsaWNlbnNlcyBhcmUg
c3Vic3VtZWQgYnkgZWl0aGVyIHRoZSBJSkcgTGljZW5zZSBvciB0aGUKKyMgK01vZGlmaWVkIEJT
RCBMaWNlbnNlLiAgKEluIG90aGVyIHdvcmRzLCB0aGUgdGVybXMgb2YgdGhlIGxlc3MgcmVzdHJp
Y3RpdmUKKyMgK2xpY2Vuc2VzIGFyZSBzYXRpc2ZpZWQgaWYgdGhlIHRlcm1zIG9mIHRoZSBJSkcg
YW5kIE1vZGlmaWVkIEJTRCBMaWNlbnNlcyBhcmUKKyMgK3NhdGlzZmllZC4pCisjICsKKyMgKy0g
VGhlIGxpYmpwZWctdHVyYm8gU0lNRCBzb3VyY2UgY29kZSBhbmQgemxpYiBhcmUgY292ZXJlZCBi
eSB0aGUKKyMgKyAgW3psaWIgTGljZW5zZV0oaHR0cHM6Ly9zcGR4Lm9yZy9saWNlbnNlcy9abGli
Lmh0bWwpLCB3aGljaCBpcyBzdWJzdW1lZCBieSB0aGUKKyMgKyAgSUpHIExpY2Vuc2UgaW4gdGhl
IGNvbnRleHQgb2YgdGhlIGNqcGVnIGFuZCBkanBlZyBwcm9ncmFtcyBhbmQgdGhlIGxpYmpwZWcK
KyMgKyAgQVBJIGxpYnJhcnkuCisjICsKKyMgKy0gU29tZSBvZiB0aGUgbGlic3BuZyBzb3VyY2Ug
Y29kZSBpcyBjb3ZlcmVkIGJ5IHRoZQorIyArICBbUE5HIFJlZmVyZW5jZSBMaWJyYXJ5IExpY2Vu
c2UgdjJdKGh0dHBzOi8vc3BkeC5vcmcvbGljZW5zZXMvbGlicG5nLTIuMC5odG1sKSwKKyMgKyAg
d2hpY2ggaXMgc3Vic3VtZWQgYnkgdGhlIElKRyBMaWNlbnNlIGluIHRoZSBjb250ZXh0IG9mIHRo
ZSBjanBlZyBhbmQgZGpwZWcKKyMgKyAgcHJvZ3JhbXMgYW5kIHRoZSBUdXJib0pQRUcgQVBJIGxp
YnJhcnkuCisjICsKKyMgKy0gTW9zdCBvZiB0aGUgbGlic3BuZyBzb3VyY2UgY29kZSBpcyBjb3Zl
cmVkIGJ5IHRoZQorIyArICBbU2ltcGxpZmllZCAoMi1jbGF1c2UpIEJTRCBMaWNlbnNlXShodHRw
czovL3NwZHgub3JnL2xpY2Vuc2VzL0JTRC0yLUNsYXVzZS5odG1sKSwKKyMgKyAgd2hpY2ggaXMg
c3Vic3VtZWQgYnkgdGhlIE1vZGlmaWVkIEJTRCBMaWNlbnNlIGluIHRoZSBjb250ZXh0IG9mIHRo
ZSBjanBlZyBhbmQKKyMgKyAgZGpwZWcgcHJvZ3JhbXMgYW5kIHRoZSBUdXJib0pQRUcgQVBJIGxp
YnJhcnkuCisjICAKKyMgIAorIyAgQ29tcGx5aW5nIHdpdGggdGhlIGxpYmpwZWctdHVyYm8gTGlj
ZW5zZXMKKyMgQEAgLTM4LDcgKzY2LDYgQEAKKyMgICAgICAgICAgKipPcmlnaW4qKgorIyAgICAg
ICAgICAtIENsYXVzZSAxIG9mIHRoZSBJSkcgTGljZW5zZQorIyAgICAgICAgICAtIENsYXVzZSAx
IG9mIHRoZSBNb2RpZmllZCBCU0QgTGljZW5zZQorIyAtICAgICAgICAtIENsYXVzZXMgMSBhbmQg
MyBvZiB0aGUgemxpYiBMaWNlbnNlCisjICAKKyMgICAgICAyLiAgWW91IG11c3QgYWRkIHlvdXIg
b3duIGNvcHlyaWdodCBub3RpY2UgdG8gdGhlIGhlYWRlciBvZiBlYWNoIHNvdXJjZQorIyAgICAg
ICAgICBmaWxlIHlvdSBtb2RpZmllZCwgc28gb3RoZXJzIGNhbiB0ZWxsIHRoYXQgeW91IG1vZGlm
aWVkIHRoYXQgZmlsZS4gIChJZgorIyBAQCAtNDcsNyArNzQsNiBAQAorIyAgCisjICAgICAgICAg
ICoqT3JpZ2luKioKKyMgICAgICAgICAgLSBDbGF1c2UgMSBvZiB0aGUgSUpHIExpY2Vuc2UKKyMg
LSAgICAgICAgLSBDbGF1c2UgMiBvZiB0aGUgemxpYiBMaWNlbnNlCisjICAKKyMgICAgICAzLiAg
WW91IG11c3QgaW5jbHVkZSB0aGUgSUpHIFJFQURNRSBmaWxlLCBhbmQgeW91IG11c3Qgbm90IGFs
dGVyIGFueSBvZiB0aGUKKyMgICAgICAgICAgY29weXJpZ2h0IG9yIGxpY2Vuc2UgdGV4dCBpbiB0
aGF0IGZpbGUuCisjIEBAIC02Nyw5ICs5Myw5IEBACisjICAgICAgICAgICoqT3JpZ2luKioKKyMg
ICAgICAgICAgLSBDbGF1c2UgMiBvZiB0aGUgSUpHIGxpY2Vuc2UKKyMgIAorIyAtICAgIDIuICBJ
ZiB5b3VyIGJpbmFyeSBkaXN0cmlidXRpb24gaW5jbHVkZXMgb3IgdXNlcyB0aGUgVHVyYm9KUEVH
IEFQSSwgdGhlbgorIyAtICAgICAgICB5b3VyIHByb2R1Y3QgZG9jdW1lbnRhdGlvbiBtdXN0IGlu
Y2x1ZGUgdGhlIHRleHQgb2YgdGhlIE1vZGlmaWVkIEJTRAorIyAtICAgICAgICBMaWNlbnNlIChz
ZWUgYmVsb3cuKQorIyArICAgIDIuICBJZiB5b3VyIGJpbmFyeSBkaXN0cmlidXRpb24gaW5jbHVk
ZXMgb3IgdXNlcyB0aGUgVHVyYm9KUEVHIEFQSSBvcgorIyArICAgICAgICBhc3NvY2lhdGVkIHBy
b2dyYW1zLCBjanBlZywgb3IgZGpwZWcsIHRoZW4geW91ciBwcm9kdWN0IGRvY3VtZW50YXRpb24K
KyMgKyAgICAgICAgbXVzdCBpbmNsdWRlIHRoZSB0ZXh0IG9mIHRoZSBNb2RpZmllZCBCU0QgTGlj
ZW5zZSAoc2VlIGJlbG93LikKKyMgIAorIyAgICAgICAgICAqKk9yaWdpbioqCisjICAgICAgICAg
IC0gQ2xhdXNlIDIgb2YgdGhlIE1vZGlmaWVkIEJTRCBMaWNlbnNlCisjIEBAIC04MSwyMSArMTA3
LDIwIEBACisjICAgICAgLSBJSkcgTGljZW5zZQorIyAgICAgIC0gQ2xhdXNlIDMgb2YgdGhlIE1v
ZGlmaWVkIEJTRCBMaWNlbnNlCisjICAKKyMgLTQuICBUaGUgSUpHIGFuZCBUaGUgbGlianBlZy10
dXJibyBQcm9qZWN0IGRvIG5vdCB3YXJyYW50IGxpYmpwZWctdHVyYm8gdG8gYmUKKyMgLSAgICBm
cmVlIG9mIGRlZmVjdHMsIG5vciBkbyB3ZSBhY2NlcHQgYW55IGxpYWJpbGl0eSBmb3IgdW5kZXNp
cmFibGUKKyMgLSAgICBjb25zZXF1ZW5jZXMgcmVzdWx0aW5nIGZyb20geW91ciB1c2Ugb2YgdGhl
IHNvZnR3YXJlLgorIyArNC4gIFRoZSBhdXRob3JzIGFuZCBkaXN0cmlidXRvcnMgZG8gbm90IHdh
cnJhbnQgbGlianBlZy10dXJibyB0byBiZSBmcmVlIG9mCisjICsgICAgZGVmZWN0cywgbm9yIGRv
IHdlIGFjY2VwdCBhbnkgbGlhYmlsaXR5IGZvciB1bmRlc2lyYWJsZSBjb25zZXF1ZW5jZXMKKyMg
KyAgICByZXN1bHRpbmcgZnJvbSB5b3VyIHVzZSBvZiB0aGUgc29mdHdhcmUuCisjICAKKyMgICAg
ICAqKk9yaWdpbioqCisjICAgICAgLSBJSkcgTGljZW5zZQorIyAgICAgIC0gTW9kaWZpZWQgQlNE
IExpY2Vuc2UKKyMgLSAgICAtIHpsaWIgTGljZW5zZQorIyAgCisjICAKKyMgIFRoZSBNb2RpZmll
ZCAoMy1jbGF1c2UpIEJTRCBMaWNlbnNlCisjICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQorIyAgCisjIC1Db3B5cmlnaHQgKEMpMjAwOS0yMDI1IEQuIFIuIENvbW1hbmRlci4g
IEFsbCBSaWdodHMgUmVzZXJ2ZWQuPGJyPgorIyAtQ29weXJpZ2h0IChDKTIwMTUgVmlrdG9yIFN6
YXRobcOhcnkuICBBbGwgUmlnaHRzIFJlc2VydmVkLgorIyArQ29weXJpZ2h0IChDKSAyMDA5LTIw
MjYgRC4gUi4gQ29tbWFuZGVyPGJyPgorIyArQ29weXJpZ2h0IChDKSAyMDE4LTIwMjMgUmFuZHkg
PHJhbmR5NDA4QHByb3Rvbm1haWwuY29tPgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNl
IGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgIG1vZGlmaWNh
dGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9u
cyBhcmUgbWV0OgorIyBAQCAtMTIwLDE2ICsxNDUsMyBAQAorIyAgQ09OVFJBQ1QsIFNUUklDVCBM
SUFCSUxJVFksIE9SIFRPUlQgKElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkKKyMg
IEFSSVNJTkcgSU4gQU5ZIFdBWSBPVVQgT0YgVEhFIFVTRSBPRiBUSElTIFNPRlRXQVJFLCBFVkVO
IElGIEFEVklTRUQgT0YgVEhFCisjICBQT1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRS4KKyMgLQor
IyAtCisjIC1XaHkgVHdvIExpY2Vuc2VzPworIyAtPT09PT09PT09PT09PT09PT0KKyMgLQorIyAt
VGhlIHpsaWIgTGljZW5zZSBjb3VsZCBoYXZlIGJlZW4gdXNlZCBpbnN0ZWFkIG9mIHRoZSBNb2Rp
ZmllZCAoMy1jbGF1c2UpIEJTRAorIyAtTGljZW5zZSwgYW5kIHNpbmNlIHRoZSBJSkcgTGljZW5z
ZSBlZmZlY3RpdmVseSBzdWJzdW1lcyB0aGUgZGlzdHJpYnV0aW9uCisjIC1jb25kaXRpb25zIG9m
IHRoZSB6bGliIExpY2Vuc2UsIHRoaXMgd291bGQgaGF2ZSBlZmZlY3RpdmVseSBwbGFjZWQKKyMg
LWxpYmpwZWctdHVyYm8gYmluYXJ5IGRpc3RyaWJ1dGlvbnMgdW5kZXIgdGhlIElKRyBMaWNlbnNl
LiAgSG93ZXZlciwgdGhlIElKRworIyAtTGljZW5zZSBzcGVjaWZpY2FsbHkgcmVmZXJzIHRvIHRo
ZSBJbmRlcGVuZGVudCBKUEVHIEdyb3VwIGFuZCBkb2VzIG5vdCBleHRlbmQKKyMgLWF0dHJpYnV0
aW9uIGFuZCBlbmRvcnNlbWVudCBwcm90ZWN0aW9ucyB0byBvdGhlciBlbnRpdGllcy4gIFRodXMs
IGl0IHdhcworIyAtZGVzaXJhYmxlIHRvIGNob29zZSBhIGxpY2Vuc2UgdGhhdCBncmFudGVkIHVz
IHRoZSBzYW1lIHByb3RlY3Rpb25zIGZvciBuZXcgY29kZQorIyAtdGhhdCB3ZXJlIGdyYW50ZWQg
dG8gdGhlIElKRyBmb3IgY29kZSBkZXJpdmVkIGZyb20gdGhlaXIgc29mdHdhcmUuCisjIAorIwor
CiBTVU1NQVJZID0gIkhhcmR3YXJlIGFjY2VsZXJhdGVkIEpQRUcgY29tcHJlc3Npb24vZGVjb21w
cmVzc2lvbiBsaWJyYXJ5IgogREVTQ1JJUFRJT04gPSAibGlianBlZy10dXJibyBpcyBhIGRlcml2
YXRpdmUgb2YgbGlianBlZyB0aGF0IHVzZXMgU0lNRCBpbnN0cnVjdGlvbnMgKE1NWCwgU1NFMiwg
TkVPTikgdG8gYWNjZWxlcmF0ZSBiYXNlbGluZSBKUEVHIGNvbXByZXNzaW9uIGFuZCBkZWNvbXBy
ZXNzaW9uIgogSE9NRVBBR0UgPSAiaHR0cDovL2xpYmpwZWctdHVyYm8ub3JnLyIKIAogTElDRU5T
RSA9ICJJSkcgJiBCU0QtMy1DbGF1c2UgJiBabGliIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRS5tZDttZDU9NTJmZGRhYmM3ZThlNzkyMzMxNTBlYmRhOTVjM2ZjMWYiCitMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1kMjFkYWVmM2I0YjMxOGY3NzA2
MjA1NTA1OWM3MjkzNCIKIAogREVQRU5EUzphcHBlbmQ6eDg2LTY0OmNsYXNzLXRhcmdldCA9ICIg
bmFzbS1uYXRpdmUiCiBERVBFTkRTOmFwcGVuZDp4ODY6Y2xhc3MtdGFyZ2V0ID0gIiBuYXNtLW5h
dGl2ZSIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtC
UH0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3NTkyMGI4MjY4MzRhYzRkZGY5NzY2
MWNjNzM0OTEwNDc4NTU4NTlhZmZkNjcxZDUyMDc5YzY4NjdjMWM2YzAiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMWQwZTg2ZWU0NWJmNDM1ZGM1N2Y4NzQ0NzYzYmE2MjQxMDI5NGIwZjUzMTJjYjg3
OTYyMjE0YWMxZjdmYjc4YiIKIAogUEUgPSAiMSIKIAotLSAKMi40Ny4xCgo=

--===============8523201769131257036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGSIZE changed from 287288 to 561720 (+96%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo: SRC_URI changed from "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.3/libjpeg-turbo-3.1.3.tar.gz" to "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.90/libjpeg-turbo-3.1.90.tar.gz"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5707128 to 7269448 (+27%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: FILELIST: removed "/usr/lib/.debug/libturbojpeg.so.0.4.0", added "/usr/lib/.debug/libturbojpeg.so.0.5.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 218034 to 223440 (+2%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGSIZE changed from 436430 to 445974 (+2%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2123117 to 3410168 (+61%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: FILELIST: removed "/usr/src/debug/libjpeg-turbo/3.1.3/src/jpegtran.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdtrans.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcapistd.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcapimin.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcphuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jccoefct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jccolext.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcomapi.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcmainct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcmarker.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcmaster.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcmaster.h /usr/src/debug/libjpeg-turbo/3.1.3/src/cdjpeg.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcolext.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jddiffct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdlossls.c /usr/src/debug/libjpeg-turbo/3.1.3/src/cdjpeg.h /usr/src/debug/libjpeg-
 turbo/3.1.3/src/jdpostct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.3/src/rdgif.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jsimddct.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdhuff.h /usr/src/debug/libjpeg-turbo/3.1.3/src/wrppm.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcicc.c /usr/src/debug/libjpeg-turbo/3.1.3/src/wrgif.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdhuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jmemsys.h /usr/src/debug/libjpeg-turbo/3.1.3/src/wrjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdinput.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jclhuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmaster.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jcarith.c /usr/src/debug/libjpeg-turbo/3.1.3/src/rdtarga.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdct.h /usr/src/debug/libjpeg-turbo/3.1.3/src/r
 dbmp.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jutils.c /usr/src/debug/libjpeg-turbo/3.1.3/src/turbojpeg-mp.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jcparam.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jquant1.c /usr/src/debug/libjpeg-turbo/3.1.3/src/wrtarga.c /usr/src/debug/libjpeg-turbo/3.1.3/simd/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jctrans.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jquant2.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcdctmgr.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jchuff.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jclossls.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcprepct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jerror.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jerror.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jchuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmerge.c /usr/src/debug/libjpeg-turbo/3.1.3/src/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdsample.h /usr/s
 rc/debug/libjpeg-turbo/3.1.3/src/jdmerge.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcoefct.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmainct.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jcinit.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/rdcolmap.c /usr/src/debug/libjpeg-turbo/3.1.3/src/turbojpeg.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmainct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmarker.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdsample.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmaster.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmrg565.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcol565.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdphuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jpegint.h /usr/src/debug/libjpeg-turbo/3.1.3/src/rdppm.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcolor.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jlossls.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jstdhuff.c /usr/src/deb
 ug/libjpeg-turbo/3.1.3/src/cmyk.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jaricom.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcsample.c /usr/src/debug/libjpeg-turbo/3.1.3/src/tjbench.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jinclude.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdarith.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jidctflt.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jidctfst.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jidctint.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jidctred.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jmorecfg.h /usr/src/debug/libjpeg-turbo/3.1.3/src/transupp.h /usr/src/debug/libjpeg-turbo/3.1.3/src/tjutil.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jccolor.c /usr/src/debug/libjpeg-turbo/3.1.3/simd/x86_64/jsimd.c /usr/src/debug/libjpeg-turbo/3.1.3/src/transupp.c /usr/src/debug/libjpeg-turbo/3.1.3/src/wrbmp.c /usr/src/debug/libjpeg-turbo/3.1.3/src/tjutil.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jfdctflt.c /usr/src/debug/libj
 peg-turbo/3.1.3/src/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jfdctint.c /usr/src/debug/libjpeg-turbo/3.1.3/src/rdswitch.c /usr/src/debug/libjpeg-turbo/3.1.3/src/cderror.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdicc.c /usr/src/debug/libjpeg-turbo/3.1.3/src/cjpeg.c /usr/src/debug/libjpeg-turbo/3.1.3/src/djpeg.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jpeg_nbits.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdlhuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jpeglib.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdapimin.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdapistd.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdatadst.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdatasrc.c", added "/usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/trees.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/zutil.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/crc32.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/trees.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/crc32.h /usr/src/debug/libjpeg-turb
 o/3.1.90/src/spng/zlib/zconf.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/zutil.h /usr/src/debug/libjpeg-turbo/3.1.90/src/wrgif.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdpng.c /usr/src/debug/libjpeg-turbo/3.1.90/src/tjbench.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jpeg_nbits.h /usr/src/debug/libjpeg-turbo/3.1.90/src/djpeg.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inffast.h /usr/src/debug/libjpeg-turbo/3.1.90/src/cmyk.h /usr/src/debug/libjpeg-turbo/3.1.90/src/cjpeg.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdppm.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inffast.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcparam.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcphuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jctrans.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jaricom.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcarith.c /usr/src/debug/libjpeg-turbo/3.1.90/src/
 jccolor.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jclhuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcomapi.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jmemsys.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jcmarker.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcmaster.c /usr/src/debug/libjpeg-turbo/3.1.90/src/wrtarga.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdct.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jcicc.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdpostct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdtarga.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jerror.c /usr/src/debug/libjpeg-turbo/3.1.90/src/transupp.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jerror.h /usr/src/debug/libjpeg-turbo/3.1.90/src/rdbmp.c /usr/src/debug/libjpeg-turbo/3.1.90/src/transupp.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmaster.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmrg565.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.1.90/s
 rc/jddiffct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdlossls.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.90/src/wrpng.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdswitch.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcmaster.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jinclude.h /usr/src/debug/libjpeg-turbo/3.1.90/src/wrbmp.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jmorecfg.h /usr/src/debug/libjpeg-turbo/3.1.90/src/rdcolmap.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcdctmgr.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jclossls.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcprepct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcsample.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcapistd.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jccoefct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jccolext.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcapimin.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcmainct.c /usr/src/debug/libjp
 eg-turbo/3.1.90/simd/jsimd.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jstdhuff.c /usr/src/debug/libjpeg-turbo/3.1.90/simd/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jcinit.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdgif.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inftrees.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inftrees.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdicc.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdhuff.c /usr/src/debug/libjpeg-turbo/3.1.90/simd/jsimdint.h /usr/src/debug/libjpeg-turbo/3.1.90/simd/jsimddct.h /usr/src/debug/libjpeg-turbo/3.1.90/src/cderror.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdhuff.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jfdctflt.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jfdctint.c /usr/src/debug/libjpeg-turbo/3.1.90/src/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.1.90/src/turbojpeg.h /usr/src/debug/libjpeg-turbo/3.1.90/src/j
 dmerge.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdarith.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcolor.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdinput.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdlhuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdphuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdtrans.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmerge.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jlossls.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jpegint.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jpeglib.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jidctflt.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jidctfst.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jidctint.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jidctred.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/spng.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inffixed.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/compress.c /usr/src/debug/libjpeg-turbo/3.1.90/src/tjutil.h /usr/src/de
 bug/libjpeg-turbo/3.1.90/src/spng/spng.h /usr/src/debug/libjpeg-turbo/3.1.90/src/tjutil.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jchuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/wrppm.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jchuff.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jquant1.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jquant2.c /usr/src/debug/libjpeg-turbo/3.1.90/src/turbojpeg-mp.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmaster.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdsample.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcoefct.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmainct.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdatadst.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdatasrc.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcol565.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jpegtran.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdapimin.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdapistd.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcol
 ext.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmainct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmarker.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdsample.c /usr/src/debug/libjpeg-turbo/3.1.90/src/wrjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/adler32.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/deflate.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inflate.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/deflate.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jutils.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inflate.h /usr/src/debug/libjpeg-turbo/3.1.90/src/cdjpeg.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/zlib.h /usr/src/debug/libjpeg-turbo/3.1.90/src/cdjpeg.c"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGSIZE changed from 731193 to 718833 (-2%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 874973 to 1026581 (+17%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: FILELIST: removed "/usr/lib/libturbojpeg.so.0.4.0", added "/usr/lib/libturbojpeg.so.0.5.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
Changes to packages/x86-64-v3-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/libturbojpeg.so.0 changed symlink target from libturbojpeg.so.0.4.0 to libturbojpeg.so.0.5.0
  /usr/lib/libturbojpeg.so.0.4.0 moved to /usr/lib/libturbojpeg.so.0.5.0

--===============8523201769131257036==--

