Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62239107638D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:19 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14756.1775054162642108036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hmYU96UM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CIks7G7D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d49792c93-66e5e449-f16a-417e-91b0-5b414ebca42e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wzpqzywh4nv29CBw+WiKrYbcQ7H31op99gxuEHsHp+g=;
	b=hmYU96UM0TyR2ovHXaF0Liy4kHKbxh2JXALwsMrDfqs1mrKBeVlwaNitr4CSxFEU
	7xQBuGQdiNS6Q0R61FZ4SWK/NmW4lJSBXRBqYsBt7tGFqdi6YtQs/w1XUTSFt2dmZkK
	nCMmgUeZTAubPw8u7/zfbtmnB8WN5ExbjiWZl020=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wzpqzywh4nv29CBw+WiKrYbcQ7H31op99gxuEHsHp+g=;
	b=CIks7G7DLQI37cYKlzLwQ880z2lrDfsS3XmtviOi4JZoWAK+WWPNOImvDGU5n9ND
	bvOxn7EQNaF0jlFOMvY1GGXzmELR/GVvJJSaGV2k+3GEew6byq35csYGOGai0Oh70He
	8BEO/Wdmb1ktuqijXMGvBGZLwrqX8nToGXpqMPbU=
Content-Type: multipart/mixed; boundary="===============2568209465863180128=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libjpeg-turbo: upgrading to 3.1.90 SUCCEEDED
Message-ID: <0101019d49792c93-66e5e449-f16a-417e-91b0-5b414ebca42e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234412

--===============2568209465863180128==
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
SGVscGVyCgotLSA+OCAtLQpGcm9tIGJhZDhlY2Q5YzdiMzc1OGQxZTFlMmJiNTY5MmEwYzgzZTVk
MDU3MzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhA
eW9jdG9wcm9qZWN0Lm9yZz4KRGF0ZTogV2VkLCAxIEFwciAyMDI2IDEzOjA5OjMzICswMDAwClN1
YmplY3Q6IFtQQVRDSF0gbGlianBlZy10dXJibzogdXBncmFkZSAzLjEuMyAtPiAzLjEuOTAKCi0t
LQogLi4udHVyYm9fMy4xLjMuYmIgPT4gbGlianBlZy10dXJib18zLjEuOTAuYmJ9IHwgMTQ2ICsr
KysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE0NCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL3tsaWJqcGVnLXR1
cmJvXzMuMS4zLmJiID0+IGxpYmpwZWctdHVyYm9fMy4xLjkwLmJifSAoMzElKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjMuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS45MC5iYgpzaW1pbGFy
aXR5IGluZGV4IDMxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJq
cGVnLXR1cmJvXzMuMS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9s
aWJqcGVnLXR1cmJvXzMuMS45MC5iYgppbmRleCAyNmU4NGNhNDJjLi40NTc3YTBhNGIwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS4zLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjkwLmJi
CkBAIC0xLDE1ICsxLDE1NyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UubWQKKyMg
KysrIExJQ0VOU0UubWQKKyMgQEAgLTgsMTggKzgsNDYgQEAKKyMgIAorIyAgICBUaGlzIGxpY2Vu
c2UgYXBwbGllcyB0byB0aGUgbGlianBlZyBBUEkgbGlicmFyeSBhbmQgYXNzb2NpYXRlZCBwcm9n
cmFtcywKKyMgICAgaW5jbHVkaW5nIGFueSBjb2RlIGluaGVyaXRlZCBmcm9tIGxpYmpwZWcgYW5k
IGFueSBtb2RpZmljYXRpb25zIHRvIHRoYXQKKyMgLSAgY29kZS4gIE5vdGUgdGhhdCB0aGUgbGli
anBlZy10dXJibyBTSU1EIHNvdXJjZSBjb2RlIGJlYXJzIHRoZQorIyAtICBbemxpYiBMaWNlbnNl
XShodHRwczovL29wZW5zb3VyY2Uub3JnL2xpY2Vuc2VzL1psaWIpLCBidXQgaW4gdGhlIGNvbnRl
eHQgb2YKKyMgLSAgdGhlIG92ZXJhbGwgbGlianBlZyBBUEkgbGlicmFyeSwgdGhlIHRlcm1zIG9m
IHRoZSB6bGliIExpY2Vuc2UgYXJlIHN1YnN1bWVkCisjIC0gIGJ5IHRoZSB0ZXJtcyBvZiB0aGUg
SUpHIExpY2Vuc2UuCisjICsgIGNvZGUuCisjICAKKyMgIC0gVGhlIE1vZGlmaWVkICgzLWNsYXVz
ZSkgQlNEIExpY2Vuc2UsIHdoaWNoIGlzIGxpc3RlZCBiZWxvdworIyAgCisjIC0gIFRoaXMgbGlj
ZW5zZSBhcHBsaWVzIHRvIHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgYW5kIGFzc29jaWF0ZWQg
cHJvZ3JhbXMsIGFzCisjIC0gIHdlbGwgYXMgdGhlIGJ1aWxkIHN5c3RlbS4gIE5vdGUgdGhhdCB0
aGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IHdyYXBzIHRoZQorIyAtICBsaWJqcGVnIEFQSSBsaWJy
YXJ5LCBzbyBpbiB0aGUgY29udGV4dCBvZiB0aGUgb3ZlcmFsbCBUdXJib0pQRUcgQVBJIGxpYnJh
cnksCisjIC0gIGJvdGggdGhlIHRlcm1zIG9mIHRoZSBJSkcgTGljZW5zZSBhbmQgdGhlIHRlcm1z
IG9mIHRoZSBNb2RpZmllZCAoMy1jbGF1c2UpCisjIC0gIEJTRCBMaWNlbnNlIGFwcGx5LgorIyAr
ICBUaGlzIGxpY2Vuc2UgYXBwbGllcyB0byB0aGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IGFuZCBh
c3NvY2lhdGVkIHByb2dyYW1zLAorIyArICBbbGlic3BuZ10oaHR0cHM6Ly9saWJzcG5nLm9yZykg
KHdoaWNoIGlzIHVzZWQgYnkgY2pwZWcgYW5kIGRqcGVnKSwgYW5kIHRoZQorIyArICBidWlsZC90
ZXN0IHN5c3RlbS4KKyMgKworIyArICAqIFRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgd3JhcHMg
dGhlIGxpYmpwZWcgQVBJIGxpYnJhcnksIHNvIGluIHRoZSBjb250ZXh0CisjICsgICAgb2YgdGhl
IG92ZXJhbGwgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5LCBib3RoIHRoZSB0ZXJtcyBvZiB0aGUgSUpH
IExpY2Vuc2UgYW5kCisjICsgICAgdGhlIHRlcm1zIG9mIHRoZSBNb2RpZmllZCAoMy1jbGF1c2Up
IEJTRCBMaWNlbnNlIGFwcGx5LgorIyArICAqIGNqcGVnIGFuZCBkanBlZyB1c2UgbGlic3BuZywg
c28gaW4gdGhlIGNvbnRleHQgb2YgdGhvc2UgcHJvZ3JhbXMsIGJvdGggdGhlCisjICsgICAgdGVy
bXMgb2YgdGhlIElKRyBMaWNlbnNlIGFuZCB0aGUgdGVybXMgb2YgdGhlIE1vZGlmaWVkICgzLWNs
YXVzZSkgQlNECisjICsgICAgTGljZW5zZSBhcHBseS4KKyMgKworIyArCisjICtDb21wb25lbnQg
TGljZW5zZXMKKyMgKz09PT09PT09PT09PT09PT09PQorIyArCisjICtTb21lIG9mIGxpYmpwZWct
dHVyYm8ncyBtb2R1bGVzIGFuZCBpbnRlcm5hbCBkZXBlbmRlbmNpZXMgYXJlIGNvdmVyZWQgYnkg
bGVzcworIyArcmVzdHJpY3RpdmUgbGljZW5zZXMsIGJ1dCBpbiB0aGUgY29udGV4dCBvZiBsaWJq
cGVnLXR1cmJvIGFzIGEgd2hvbGUsIHRoZSB0ZXJtcworIyArb2YgdGhlIGxlc3MgcmVzdHJpY3Rp
dmUgbGljZW5zZXMgYXJlIHN1YnN1bWVkIGJ5IGVpdGhlciB0aGUgSUpHIExpY2Vuc2Ugb3IgdGhl
CisjICtNb2RpZmllZCBCU0QgTGljZW5zZS4gIChJbiBvdGhlciB3b3JkcywgdGhlIHRlcm1zIG9m
IHRoZSBsZXNzIHJlc3RyaWN0aXZlCisjICtsaWNlbnNlcyBhcmUgc2F0aXNmaWVkIGlmIHRoZSB0
ZXJtcyBvZiB0aGUgSUpHIGFuZCBNb2RpZmllZCBCU0QgTGljZW5zZXMgYXJlCisjICtzYXRpc2Zp
ZWQuKQorIyArCisjICstIFRoZSBsaWJqcGVnLXR1cmJvIFNJTUQgc291cmNlIGNvZGUgYW5kIHps
aWIgYXJlIGNvdmVyZWQgYnkgdGhlCisjICsgIFt6bGliIExpY2Vuc2VdKGh0dHBzOi8vc3BkeC5v
cmcvbGljZW5zZXMvWmxpYi5odG1sKSwgd2hpY2ggaXMgc3Vic3VtZWQgYnkgdGhlCisjICsgIElK
RyBMaWNlbnNlIGluIHRoZSBjb250ZXh0IG9mIHRoZSBjanBlZyBhbmQgZGpwZWcgcHJvZ3JhbXMg
YW5kIHRoZSBsaWJqcGVnCisjICsgIEFQSSBsaWJyYXJ5LgorIyArCisjICstIFNvbWUgb2YgdGhl
IGxpYnNwbmcgc291cmNlIGNvZGUgaXMgY292ZXJlZCBieSB0aGUKKyMgKyAgW1BORyBSZWZlcmVu
Y2UgTGlicmFyeSBMaWNlbnNlIHYyXShodHRwczovL3NwZHgub3JnL2xpY2Vuc2VzL2xpYnBuZy0y
LjAuaHRtbCksCisjICsgIHdoaWNoIGlzIHN1YnN1bWVkIGJ5IHRoZSBJSkcgTGljZW5zZSBpbiB0
aGUgY29udGV4dCBvZiB0aGUgY2pwZWcgYW5kIGRqcGVnCisjICsgIHByb2dyYW1zIGFuZCB0aGUg
VHVyYm9KUEVHIEFQSSBsaWJyYXJ5LgorIyArCisjICstIE1vc3Qgb2YgdGhlIGxpYnNwbmcgc291
cmNlIGNvZGUgaXMgY292ZXJlZCBieSB0aGUKKyMgKyAgW1NpbXBsaWZpZWQgKDItY2xhdXNlKSBC
U0QgTGljZW5zZV0oaHR0cHM6Ly9zcGR4Lm9yZy9saWNlbnNlcy9CU0QtMi1DbGF1c2UuaHRtbCks
CisjICsgIHdoaWNoIGlzIHN1YnN1bWVkIGJ5IHRoZSBNb2RpZmllZCBCU0QgTGljZW5zZSBpbiB0
aGUgY29udGV4dCBvZiB0aGUgY2pwZWcgYW5kCisjICsgIGRqcGVnIHByb2dyYW1zIGFuZCB0aGUg
VHVyYm9KUEVHIEFQSSBsaWJyYXJ5LgorIyAgCisjICAKKyMgIENvbXBseWluZyB3aXRoIHRoZSBs
aWJqcGVnLXR1cmJvIExpY2Vuc2VzCisjIEBAIC0zOCw3ICs2Niw2IEBACisjICAgICAgICAgICoq
T3JpZ2luKioKKyMgICAgICAgICAgLSBDbGF1c2UgMSBvZiB0aGUgSUpHIExpY2Vuc2UKKyMgICAg
ICAgICAgLSBDbGF1c2UgMSBvZiB0aGUgTW9kaWZpZWQgQlNEIExpY2Vuc2UKKyMgLSAgICAgICAg
LSBDbGF1c2VzIDEgYW5kIDMgb2YgdGhlIHpsaWIgTGljZW5zZQorIyAgCisjICAgICAgMi4gIFlv
dSBtdXN0IGFkZCB5b3VyIG93biBjb3B5cmlnaHQgbm90aWNlIHRvIHRoZSBoZWFkZXIgb2YgZWFj
aCBzb3VyY2UKKyMgICAgICAgICAgZmlsZSB5b3UgbW9kaWZpZWQsIHNvIG90aGVycyBjYW4gdGVs
bCB0aGF0IHlvdSBtb2RpZmllZCB0aGF0IGZpbGUuICAoSWYKKyMgQEAgLTQ3LDcgKzc0LDYgQEAK
KyMgIAorIyAgICAgICAgICAqKk9yaWdpbioqCisjICAgICAgICAgIC0gQ2xhdXNlIDEgb2YgdGhl
IElKRyBMaWNlbnNlCisjIC0gICAgICAgIC0gQ2xhdXNlIDIgb2YgdGhlIHpsaWIgTGljZW5zZQor
IyAgCisjICAgICAgMy4gIFlvdSBtdXN0IGluY2x1ZGUgdGhlIElKRyBSRUFETUUgZmlsZSwgYW5k
IHlvdSBtdXN0IG5vdCBhbHRlciBhbnkgb2YgdGhlCisjICAgICAgICAgIGNvcHlyaWdodCBvciBs
aWNlbnNlIHRleHQgaW4gdGhhdCBmaWxlLgorIyBAQCAtNjcsOSArOTMsOSBAQAorIyAgICAgICAg
ICAqKk9yaWdpbioqCisjICAgICAgICAgIC0gQ2xhdXNlIDIgb2YgdGhlIElKRyBsaWNlbnNlCisj
ICAKKyMgLSAgICAyLiAgSWYgeW91ciBiaW5hcnkgZGlzdHJpYnV0aW9uIGluY2x1ZGVzIG9yIHVz
ZXMgdGhlIFR1cmJvSlBFRyBBUEksIHRoZW4KKyMgLSAgICAgICAgeW91ciBwcm9kdWN0IGRvY3Vt
ZW50YXRpb24gbXVzdCBpbmNsdWRlIHRoZSB0ZXh0IG9mIHRoZSBNb2RpZmllZCBCU0QKKyMgLSAg
ICAgICAgTGljZW5zZSAoc2VlIGJlbG93LikKKyMgKyAgICAyLiAgSWYgeW91ciBiaW5hcnkgZGlz
dHJpYnV0aW9uIGluY2x1ZGVzIG9yIHVzZXMgdGhlIFR1cmJvSlBFRyBBUEkgb3IKKyMgKyAgICAg
ICAgYXNzb2NpYXRlZCBwcm9ncmFtcywgY2pwZWcsIG9yIGRqcGVnLCB0aGVuIHlvdXIgcHJvZHVj
dCBkb2N1bWVudGF0aW9uCisjICsgICAgICAgIG11c3QgaW5jbHVkZSB0aGUgdGV4dCBvZiB0aGUg
TW9kaWZpZWQgQlNEIExpY2Vuc2UgKHNlZSBiZWxvdy4pCisjICAKKyMgICAgICAgICAgKipPcmln
aW4qKgorIyAgICAgICAgICAtIENsYXVzZSAyIG9mIHRoZSBNb2RpZmllZCBCU0QgTGljZW5zZQor
IyBAQCAtODEsMjEgKzEwNywyMCBAQAorIyAgICAgIC0gSUpHIExpY2Vuc2UKKyMgICAgICAtIENs
YXVzZSAzIG9mIHRoZSBNb2RpZmllZCBCU0QgTGljZW5zZQorIyAgCisjIC00LiAgVGhlIElKRyBh
bmQgVGhlIGxpYmpwZWctdHVyYm8gUHJvamVjdCBkbyBub3Qgd2FycmFudCBsaWJqcGVnLXR1cmJv
IHRvIGJlCisjIC0gICAgZnJlZSBvZiBkZWZlY3RzLCBub3IgZG8gd2UgYWNjZXB0IGFueSBsaWFi
aWxpdHkgZm9yIHVuZGVzaXJhYmxlCisjIC0gICAgY29uc2VxdWVuY2VzIHJlc3VsdGluZyBmcm9t
IHlvdXIgdXNlIG9mIHRoZSBzb2Z0d2FyZS4KKyMgKzQuICBUaGUgYXV0aG9ycyBhbmQgZGlzdHJp
YnV0b3JzIGRvIG5vdCB3YXJyYW50IGxpYmpwZWctdHVyYm8gdG8gYmUgZnJlZSBvZgorIyArICAg
IGRlZmVjdHMsIG5vciBkbyB3ZSBhY2NlcHQgYW55IGxpYWJpbGl0eSBmb3IgdW5kZXNpcmFibGUg
Y29uc2VxdWVuY2VzCisjICsgICAgcmVzdWx0aW5nIGZyb20geW91ciB1c2Ugb2YgdGhlIHNvZnR3
YXJlLgorIyAgCisjICAgICAgKipPcmlnaW4qKgorIyAgICAgIC0gSUpHIExpY2Vuc2UKKyMgICAg
ICAtIE1vZGlmaWVkIEJTRCBMaWNlbnNlCisjIC0gICAgLSB6bGliIExpY2Vuc2UKKyMgIAorIyAg
CisjICBUaGUgTW9kaWZpZWQgKDMtY2xhdXNlKSBCU0QgTGljZW5zZQorIyAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KKyMgIAorIyAtQ29weXJpZ2h0IChDKTIwMDktMjAyNSBE
LiBSLiBDb21tYW5kZXIuICBBbGwgUmlnaHRzIFJlc2VydmVkLjxicj4KKyMgLUNvcHlyaWdodCAo
QykyMDE1IFZpa3RvciBTemF0aG3DoXJ5LiAgQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyMgK0NvcHly
aWdodCAoQykgMjAwOS0yMDI2IEQuIFIuIENvbW1hbmRlcjxicj4KKyMgK0NvcHlyaWdodCAoQykg
MjAxOC0yMDIzIFJhbmR5IDxyYW5keTQwOEBwcm90b25tYWlsLmNvbT4KKyMgIAorIyAgUmVkaXN0
cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRo
b3V0CisjICBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9s
bG93aW5nIGNvbmRpdGlvbnMgYXJlIG1ldDoKKyMgQEAgLTEyMCwxNiArMTQ1LDMgQEAKKyMgIENP
TlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLCBPUiBUT1JUIChJTkNMVURJTkcgTkVHTElHRU5DRSBP
UiBPVEhFUldJU0UpCisjICBBUklTSU5HIElOIEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UgT0YgVEhJ
UyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRIRQorIyAgUE9TU0lCSUxJVFkgT0YgU1VD
SCBEQU1BR0UuCisjIC0KKyMgLQorIyAtV2h5IFR3byBMaWNlbnNlcz8KKyMgLT09PT09PT09PT09
PT09PT09CisjIC0KKyMgLVRoZSB6bGliIExpY2Vuc2UgY291bGQgaGF2ZSBiZWVuIHVzZWQgaW5z
dGVhZCBvZiB0aGUgTW9kaWZpZWQgKDMtY2xhdXNlKSBCU0QKKyMgLUxpY2Vuc2UsIGFuZCBzaW5j
ZSB0aGUgSUpHIExpY2Vuc2UgZWZmZWN0aXZlbHkgc3Vic3VtZXMgdGhlIGRpc3RyaWJ1dGlvbgor
IyAtY29uZGl0aW9ucyBvZiB0aGUgemxpYiBMaWNlbnNlLCB0aGlzIHdvdWxkIGhhdmUgZWZmZWN0
aXZlbHkgcGxhY2VkCisjIC1saWJqcGVnLXR1cmJvIGJpbmFyeSBkaXN0cmlidXRpb25zIHVuZGVy
IHRoZSBJSkcgTGljZW5zZS4gIEhvd2V2ZXIsIHRoZSBJSkcKKyMgLUxpY2Vuc2Ugc3BlY2lmaWNh
bGx5IHJlZmVycyB0byB0aGUgSW5kZXBlbmRlbnQgSlBFRyBHcm91cCBhbmQgZG9lcyBub3QgZXh0
ZW5kCisjIC1hdHRyaWJ1dGlvbiBhbmQgZW5kb3JzZW1lbnQgcHJvdGVjdGlvbnMgdG8gb3RoZXIg
ZW50aXRpZXMuICBUaHVzLCBpdCB3YXMKKyMgLWRlc2lyYWJsZSB0byBjaG9vc2UgYSBsaWNlbnNl
IHRoYXQgZ3JhbnRlZCB1cyB0aGUgc2FtZSBwcm90ZWN0aW9ucyBmb3IgbmV3IGNvZGUKKyMgLXRo
YXQgd2VyZSBncmFudGVkIHRvIHRoZSBJSkcgZm9yIGNvZGUgZGVyaXZlZCBmcm9tIHRoZWlyIHNv
ZnR3YXJlLgorIyAKKyMKKwogU1VNTUFSWSA9ICJIYXJkd2FyZSBhY2NlbGVyYXRlZCBKUEVHIGNv
bXByZXNzaW9uL2RlY29tcHJlc3Npb24gbGlicmFyeSIKIERFU0NSSVBUSU9OID0gImxpYmpwZWct
dHVyYm8gaXMgYSBkZXJpdmF0aXZlIG9mIGxpYmpwZWcgdGhhdCB1c2VzIFNJTUQgaW5zdHJ1Y3Rp
b25zIChNTVgsIFNTRTIsIE5FT04pIHRvIGFjY2VsZXJhdGUgYmFzZWxpbmUgSlBFRyBjb21wcmVz
c2lvbiBhbmQgZGVjb21wcmVzc2lvbiIKIEhPTUVQQUdFID0gImh0dHA6Ly9saWJqcGVnLXR1cmJv
Lm9yZy8iCiAKIExJQ0VOU0UgPSAiSUpHICYgQlNELTMtQ2xhdXNlICYgWmxpYiIKLUxJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTUyZmRkYWJjN2U4ZTc5MjMzMTUwZWJk
YTk1YzNmYzFmIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9ZDIx
ZGFlZjNiNGIzMThmNzcwNjIwNTUwNTljNzI5MzQiCiAKIERFUEVORFM6YXBwZW5kOng4Ni02NDpj
bGFzcy10YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogREVQRU5EUzphcHBlbmQ6eDg2OmNsYXNzLXRh
cmdldCA9ICIgbmFzbS1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rv
d25sb2FkLyR7UFZ9LyR7QlB9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNzU5MjBi
ODI2ODM0YWM0ZGRmOTc2NjFjYzczNDkxMDQ3ODU1ODU5YWZmZDY3MWQ1MjA3OWM2ODY3YzFjNmMw
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFkMGU4NmVlNDViZjQzNWRjNTdmODc0NDc2M2JhNjI0
MTAyOTRiMGY1MzEyY2I4Nzk2MjIxNGFjMWY3ZmI3OGIiCiAKIFBFID0gIjEiCiAKLS0gCjIuNDcu
MQoK

--===============2568209465863180128==
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

--===============2568209465863180128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGSIZE changed from 287288 to 561720 (+96%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo: SRC_URI changed from "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.3/libjpeg-turbo-3.1.3.tar.gz" to "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.90/libjpeg-turbo-3.1.90.tar.gz"
packages/x86-64-v3-poky-linux/libjpeg-turbo: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5707128 to 7269448 (+27%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: FILELIST: removed "/usr/lib/.debug/libturbojpeg.so.0.4.0", added "/usr/lib/.debug/libturbojpeg.so.0.5.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 218034 to 223440 (+2%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGSIZE changed from 436430 to 445974 (+2%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2123117 to 3410168 (+61%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: FILELIST: removed "/usr/src/debug/libjpeg-turbo/3.1.3/src/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jclossls.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcprepct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcdctmgr.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmerge.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jquant1.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdicc.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmerge.h /usr/src/debug/libjpeg-turbo/3.1.3/src/rdbmp.c /usr/src/debug/libjpeg-turbo/3.1.3/src/cderror.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jstdhuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jpeglib.h /usr/src/debug/libjpeg-turbo/3.1.3/src/cjpeg.c /usr/src/debug/libjpeg-turbo/3.1.3/src/djpeg.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jmemsys.h /usr/src/debug/libjpeg-turbo/3.1.3/src/wrgif.c /usr/src/debug/libjpeg-turbo/3.1.3/src/cmyk.h /usr/src/debug/libjpeg-turbo/3.1.3/src/wrtarga.c /usr/src/debug/libjpeg-turbo/3.1.3/src/wrj
 pgcom.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jpeg_nbits.h /usr/src/debug/libjpeg-turbo/3.1.3/src/turbojpeg.h /usr/src/debug/libjpeg-turbo/3.1.3/src/rdgif.c /usr/src/debug/libjpeg-turbo/3.1.3/src/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdatadst.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdinput.c /usr/src/debug/libjpeg-turbo/3.1.3/src/cdjpeg.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jpegint.h /usr/src/debug/libjpeg-turbo/3.1.3/simd/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.3/src/cdjpeg.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcphuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/rdcolmap.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdatasrc.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcol565.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcolext.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdsample.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdapimin
 .c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdapistd.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmainct.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmaster.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdsample.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcoefct.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdct.h /usr/src/debug/libjpeg-turbo/3.1.3/src/wrppm.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jclhuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jutils.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jidctflt.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jidctfst.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jidctint.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jidctred.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jmorecfg.h /usr/src/debug/libjpeg-turbo/3.1.3/src/turbojpeg-mp.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jinclude.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmainct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmarker
 .c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmaster.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmrg565.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jccolor.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcapimin.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcapistd.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jccoefct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jccolext.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcsample.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcmaster.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jcmainct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcmarker.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcmaster.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jlossls.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jsimddct.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdtrans.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcarith.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jaricom.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jfdctflt.c 
 /usr/src/debug/libjpeg-turbo/3.1.3/src/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jfdctint.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdhuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcomapi.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdhuff.h /usr/src/debug/libjpeg-turbo/3.1.3/src/rdppm.c /usr/src/debug/libjpeg-turbo/3.1.3/src/transupp.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jdlhuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/transupp.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdarith.c /usr/src/debug/libjpeg-turbo/3.1.3/src/tjbench.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcparam.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jquant2.c /usr/src/debug/libjpeg-turbo/3.1.3/src/tjutil.h /usr/src/debug/libjpeg-turbo/3.1.3/src/rdswitch.c /usr/src/debug/libjpeg-turbo/3.1.3/src/tjutil.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdphuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcicc.c /usr/src/debug/libjpeg-turbo/3.1.3/src/rdtarga.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdcolor.c /usr/src/debug/libjp
 eg-turbo/3.1.3/src/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jerror.h /usr/src/debug/libjpeg-turbo/3.1.3/src/jddiffct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdlossls.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jdpostct.c /usr/src/debug/libjpeg-turbo/3.1.3/src/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jerror.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jcinit.c /usr/src/debug/libjpeg-turbo/3.1.3/simd/x86_64/jsimd.c /usr/src/debug/libjpeg-turbo/3.1.3/src/wrbmp.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jctrans.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jchuff.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jpegtran.c /usr/src/debug/libjpeg-turbo/3.1.3/src/jchuff.h", added "/usr/src/debug/libjpeg-turbo/3.1.90/src/cderror.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmaster.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcoefct.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmainct.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdsample.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdapistd.c /usr/src/deb
 ug/libjpeg-turbo/3.1.90/src/jdatadst.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdatasrc.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdapimin.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmainct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jfdctflt.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jfdctint.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdsample.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdhuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdicc.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdhuff.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jdct.h /usr/src/debug/libjpeg-turbo/3.1.90/src/rdpng.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.1.90/src/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.1.90/simd/jsimddct.h /usr/src/debug/libjpeg-turbo/3.1.90/simd/jsimdint.h /usr/src/debug/libjpeg-turbo/3.1.90/src/turboj
 peg.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jddiffct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdtarga.c /usr/src/debug/libjpeg-turbo/3.1.90/src/cmyk.h /usr/src/debug/libjpeg-turbo/3.1.90/src/cjpeg.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdarith.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcolor.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdinput.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdlhuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/djpeg.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmerge.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdppm.c /usr/src/debug/libjpeg-turbo/3.1.90/src/wrbmp.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdphuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdtrans.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmerge.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jlossls.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jpegint.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jpeglib.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jquant1.c 
 /usr/src/debug/libjpeg-turbo/3.1.90/src/turbojpeg-mp.c /usr/src/debug/libjpeg-turbo/3.1.90/src/wrjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdbmp.c /usr/src/debug/libjpeg-turbo/3.1.90/src/wrpng.c /usr/src/debug/libjpeg-turbo/3.1.90/src/transupp.h /usr/src/debug/libjpeg-turbo/3.1.90/src/transupp.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcmaster.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jinclude.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jmorecfg.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jclossls.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcprepct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcdctmgr.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jstdhuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jidctflt.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jidctfst.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jidctint.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jidctred.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcsample.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcapistd.c /usr/src/debug/libjpeg-turbo/3
 .1.90/src/jutils.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/deflate.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inflate.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inflate.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/deflate.h /usr/src/debug/libjpeg-turbo/3.1.90/src/wrtarga.c /usr/src/debug/libjpeg-turbo/3.1.90/simd/jsimd.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jerror.h /usr/src/debug/libjpeg-turbo/3.1.90/src/rdcolmap.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.90/src/rdswitch.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jerror.c /usr/src/debug/libjpeg-turbo/3.1.90/simd/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/zlib.h /usr/src/debug/libjpeg-turbo/3.1.90/src/wrppm.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/compress.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jchuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jchuff.h /usr/src/debug/libjpeg-t
 urbo/3.1.90/src/spng/zlib/inffixed.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jcphuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jctrans.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/spng.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcicc.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/spng.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jccoefct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcapimin.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jccolext.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcmainct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcmarker.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcmaster.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdlossls.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcol565.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdcolext.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdpostct.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmarker.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jquan
 t2.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmaster.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmrg565.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jaricom.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcarith.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jccolor.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jclhuff.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcomapi.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcparam.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/adler32.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jmemsys.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/crc32.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/trees.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/zutil.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jcinit.c /usr/src/debug/libjpeg-turbo/3.1.90/src/tjutil.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/crc32.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/trees.h /usr/src/debug/libjpeg-turbo/3.1.90/src/s
 png/zlib/zconf.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/zutil.h /usr/src/debug/libjpeg-turbo/3.1.90/src/tjutil.h /usr/src/debug/libjpeg-turbo/3.1.90/src/jpegtran.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inffast.c /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inftrees.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inffast.h /usr/src/debug/libjpeg-turbo/3.1.90/src/spng/zlib/inftrees.c /usr/src/debug/libjpeg-turbo/3.1.90/src/cdjpeg.h /usr/src/debug/libjpeg-turbo/3.1.90/src/wrgif.c /usr/src/debug/libjpeg-turbo/3.1.90/src/cdjpeg.c /usr/src/debug/libjpeg-turbo/3.1.90/src/jpeg_nbits.h /usr/src/debug/libjpeg-turbo/3.1.90/src/rdgif.c /usr/src/debug/libjpeg-turbo/3.1.90/src/tjbench.c"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGSIZE changed from 731193 to 718833 (-2%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "3.1.3" to "3.1.90"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 874973 to 1026581 (+17%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 3.1.3 [default] to 3.1.90 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: FILELIST: removed "/usr/lib/libturbojpeg.so.0.4.0", added "/usr/lib/libturbojpeg.so.0.5.0"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "3.1.3" to "3.1.90"
Changes to packages/x86-64-v3-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/libturbojpeg.so.0 changed symlink target from libturbojpeg.so.0.4.0 to libturbojpeg.so.0.5.0
  /usr/lib/libturbojpeg.so.0.4.0 moved to /usr/lib/libturbojpeg.so.0.5.0

--===============2568209465863180128==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-3.1.3-3.1.90.patch"

RnJvbSBiYWQ4ZWNkOWM3YjM3NThkMWUxZTJiYjU2OTJhMGM4M2U1ZDA1NzM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMzowOTozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmpwZWctdHVyYm86IHVwZ3JhZGUgMy4xLjMgLT4gMy4xLjkwCgotLS0KIC4uLnR1cmJvXzMuMS4z
LmJiID0+IGxpYmpwZWctdHVyYm9fMy4xLjkwLmJifSB8IDE0NiArKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxNDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy97bGlianBlZy10dXJib18zLjEuMy5iYiA9PiBs
aWJqcGVnLXR1cmJvXzMuMS45MC5iYn0gKDMxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuOTAuYmIKc2ltaWxhcml0eSBpbmRleCAzMSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEu
OTAuYmIKaW5kZXggMjZlODRjYTQyYy4uNDU3N2EwYTRiMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMy5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS45MC5iYgpAQCAtMSwxNSArMSwxNTcg
QEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRl
ZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBk
YXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdl
cyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMg
KGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMK
KyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLm1kCisjICsrKyBMSUNFTlNFLm1kCisj
IEBAIC04LDE4ICs4LDQ2IEBACisjICAKKyMgICAgVGhpcyBsaWNlbnNlIGFwcGxpZXMgdG8gdGhl
IGxpYmpwZWcgQVBJIGxpYnJhcnkgYW5kIGFzc29jaWF0ZWQgcHJvZ3JhbXMsCisjICAgIGluY2x1
ZGluZyBhbnkgY29kZSBpbmhlcml0ZWQgZnJvbSBsaWJqcGVnIGFuZCBhbnkgbW9kaWZpY2F0aW9u
cyB0byB0aGF0CisjIC0gIGNvZGUuICBOb3RlIHRoYXQgdGhlIGxpYmpwZWctdHVyYm8gU0lNRCBz
b3VyY2UgY29kZSBiZWFycyB0aGUKKyMgLSAgW3psaWIgTGljZW5zZV0oaHR0cHM6Ly9vcGVuc291
cmNlLm9yZy9saWNlbnNlcy9abGliKSwgYnV0IGluIHRoZSBjb250ZXh0IG9mCisjIC0gIHRoZSBv
dmVyYWxsIGxpYmpwZWcgQVBJIGxpYnJhcnksIHRoZSB0ZXJtcyBvZiB0aGUgemxpYiBMaWNlbnNl
IGFyZSBzdWJzdW1lZAorIyAtICBieSB0aGUgdGVybXMgb2YgdGhlIElKRyBMaWNlbnNlLgorIyAr
ICBjb2RlLgorIyAgCisjICAtIFRoZSBNb2RpZmllZCAoMy1jbGF1c2UpIEJTRCBMaWNlbnNlLCB3
aGljaCBpcyBsaXN0ZWQgYmVsb3cKKyMgIAorIyAtICBUaGlzIGxpY2Vuc2UgYXBwbGllcyB0byB0
aGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IGFuZCBhc3NvY2lhdGVkIHByb2dyYW1zLCBhcworIyAt
ICB3ZWxsIGFzIHRoZSBidWlsZCBzeXN0ZW0uICBOb3RlIHRoYXQgdGhlIFR1cmJvSlBFRyBBUEkg
bGlicmFyeSB3cmFwcyB0aGUKKyMgLSAgbGlianBlZyBBUEkgbGlicmFyeSwgc28gaW4gdGhlIGNv
bnRleHQgb2YgdGhlIG92ZXJhbGwgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5LAorIyAtICBib3RoIHRo
ZSB0ZXJtcyBvZiB0aGUgSUpHIExpY2Vuc2UgYW5kIHRoZSB0ZXJtcyBvZiB0aGUgTW9kaWZpZWQg
KDMtY2xhdXNlKQorIyAtICBCU0QgTGljZW5zZSBhcHBseS4KKyMgKyAgVGhpcyBsaWNlbnNlIGFw
cGxpZXMgdG8gdGhlIFR1cmJvSlBFRyBBUEkgbGlicmFyeSBhbmQgYXNzb2NpYXRlZCBwcm9ncmFt
cywKKyMgKyAgW2xpYnNwbmddKGh0dHBzOi8vbGlic3BuZy5vcmcpICh3aGljaCBpcyB1c2VkIGJ5
IGNqcGVnIGFuZCBkanBlZyksIGFuZCB0aGUKKyMgKyAgYnVpbGQvdGVzdCBzeXN0ZW0uCisjICsK
KyMgKyAgKiBUaGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IHdyYXBzIHRoZSBsaWJqcGVnIEFQSSBs
aWJyYXJ5LCBzbyBpbiB0aGUgY29udGV4dAorIyArICAgIG9mIHRoZSBvdmVyYWxsIFR1cmJvSlBF
RyBBUEkgbGlicmFyeSwgYm90aCB0aGUgdGVybXMgb2YgdGhlIElKRyBMaWNlbnNlIGFuZAorIyAr
ICAgIHRoZSB0ZXJtcyBvZiB0aGUgTW9kaWZpZWQgKDMtY2xhdXNlKSBCU0QgTGljZW5zZSBhcHBs
eS4KKyMgKyAgKiBjanBlZyBhbmQgZGpwZWcgdXNlIGxpYnNwbmcsIHNvIGluIHRoZSBjb250ZXh0
IG9mIHRob3NlIHByb2dyYW1zLCBib3RoIHRoZQorIyArICAgIHRlcm1zIG9mIHRoZSBJSkcgTGlj
ZW5zZSBhbmQgdGhlIHRlcm1zIG9mIHRoZSBNb2RpZmllZCAoMy1jbGF1c2UpIEJTRAorIyArICAg
IExpY2Vuc2UgYXBwbHkuCisjICsKKyMgKworIyArQ29tcG9uZW50IExpY2Vuc2VzCisjICs9PT09
PT09PT09PT09PT09PT0KKyMgKworIyArU29tZSBvZiBsaWJqcGVnLXR1cmJvJ3MgbW9kdWxlcyBh
bmQgaW50ZXJuYWwgZGVwZW5kZW5jaWVzIGFyZSBjb3ZlcmVkIGJ5IGxlc3MKKyMgK3Jlc3RyaWN0
aXZlIGxpY2Vuc2VzLCBidXQgaW4gdGhlIGNvbnRleHQgb2YgbGlianBlZy10dXJibyBhcyBhIHdo
b2xlLCB0aGUgdGVybXMKKyMgK29mIHRoZSBsZXNzIHJlc3RyaWN0aXZlIGxpY2Vuc2VzIGFyZSBz
dWJzdW1lZCBieSBlaXRoZXIgdGhlIElKRyBMaWNlbnNlIG9yIHRoZQorIyArTW9kaWZpZWQgQlNE
IExpY2Vuc2UuICAoSW4gb3RoZXIgd29yZHMsIHRoZSB0ZXJtcyBvZiB0aGUgbGVzcyByZXN0cmlj
dGl2ZQorIyArbGljZW5zZXMgYXJlIHNhdGlzZmllZCBpZiB0aGUgdGVybXMgb2YgdGhlIElKRyBh
bmQgTW9kaWZpZWQgQlNEIExpY2Vuc2VzIGFyZQorIyArc2F0aXNmaWVkLikKKyMgKworIyArLSBU
aGUgbGlianBlZy10dXJibyBTSU1EIHNvdXJjZSBjb2RlIGFuZCB6bGliIGFyZSBjb3ZlcmVkIGJ5
IHRoZQorIyArICBbemxpYiBMaWNlbnNlXShodHRwczovL3NwZHgub3JnL2xpY2Vuc2VzL1psaWIu
aHRtbCksIHdoaWNoIGlzIHN1YnN1bWVkIGJ5IHRoZQorIyArICBJSkcgTGljZW5zZSBpbiB0aGUg
Y29udGV4dCBvZiB0aGUgY2pwZWcgYW5kIGRqcGVnIHByb2dyYW1zIGFuZCB0aGUgbGlianBlZwor
IyArICBBUEkgbGlicmFyeS4KKyMgKworIyArLSBTb21lIG9mIHRoZSBsaWJzcG5nIHNvdXJjZSBj
b2RlIGlzIGNvdmVyZWQgYnkgdGhlCisjICsgIFtQTkcgUmVmZXJlbmNlIExpYnJhcnkgTGljZW5z
ZSB2Ml0oaHR0cHM6Ly9zcGR4Lm9yZy9saWNlbnNlcy9saWJwbmctMi4wLmh0bWwpLAorIyArICB3
aGljaCBpcyBzdWJzdW1lZCBieSB0aGUgSUpHIExpY2Vuc2UgaW4gdGhlIGNvbnRleHQgb2YgdGhl
IGNqcGVnIGFuZCBkanBlZworIyArICBwcm9ncmFtcyBhbmQgdGhlIFR1cmJvSlBFRyBBUEkgbGli
cmFyeS4KKyMgKworIyArLSBNb3N0IG9mIHRoZSBsaWJzcG5nIHNvdXJjZSBjb2RlIGlzIGNvdmVy
ZWQgYnkgdGhlCisjICsgIFtTaW1wbGlmaWVkICgyLWNsYXVzZSkgQlNEIExpY2Vuc2VdKGh0dHBz
Oi8vc3BkeC5vcmcvbGljZW5zZXMvQlNELTItQ2xhdXNlLmh0bWwpLAorIyArICB3aGljaCBpcyBz
dWJzdW1lZCBieSB0aGUgTW9kaWZpZWQgQlNEIExpY2Vuc2UgaW4gdGhlIGNvbnRleHQgb2YgdGhl
IGNqcGVnIGFuZAorIyArICBkanBlZyBwcm9ncmFtcyBhbmQgdGhlIFR1cmJvSlBFRyBBUEkgbGli
cmFyeS4KKyMgIAorIyAgCisjICBDb21wbHlpbmcgd2l0aCB0aGUgbGlianBlZy10dXJibyBMaWNl
bnNlcworIyBAQCAtMzgsNyArNjYsNiBAQAorIyAgICAgICAgICAqKk9yaWdpbioqCisjICAgICAg
ICAgIC0gQ2xhdXNlIDEgb2YgdGhlIElKRyBMaWNlbnNlCisjICAgICAgICAgIC0gQ2xhdXNlIDEg
b2YgdGhlIE1vZGlmaWVkIEJTRCBMaWNlbnNlCisjIC0gICAgICAgIC0gQ2xhdXNlcyAxIGFuZCAz
IG9mIHRoZSB6bGliIExpY2Vuc2UKKyMgIAorIyAgICAgIDIuICBZb3UgbXVzdCBhZGQgeW91ciBv
d24gY29weXJpZ2h0IG5vdGljZSB0byB0aGUgaGVhZGVyIG9mIGVhY2ggc291cmNlCisjICAgICAg
ICAgIGZpbGUgeW91IG1vZGlmaWVkLCBzbyBvdGhlcnMgY2FuIHRlbGwgdGhhdCB5b3UgbW9kaWZp
ZWQgdGhhdCBmaWxlLiAgKElmCisjIEBAIC00Nyw3ICs3NCw2IEBACisjICAKKyMgICAgICAgICAg
KipPcmlnaW4qKgorIyAgICAgICAgICAtIENsYXVzZSAxIG9mIHRoZSBJSkcgTGljZW5zZQorIyAt
ICAgICAgICAtIENsYXVzZSAyIG9mIHRoZSB6bGliIExpY2Vuc2UKKyMgIAorIyAgICAgIDMuICBZ
b3UgbXVzdCBpbmNsdWRlIHRoZSBJSkcgUkVBRE1FIGZpbGUsIGFuZCB5b3UgbXVzdCBub3QgYWx0
ZXIgYW55IG9mIHRoZQorIyAgICAgICAgICBjb3B5cmlnaHQgb3IgbGljZW5zZSB0ZXh0IGluIHRo
YXQgZmlsZS4KKyMgQEAgLTY3LDkgKzkzLDkgQEAKKyMgICAgICAgICAgKipPcmlnaW4qKgorIyAg
ICAgICAgICAtIENsYXVzZSAyIG9mIHRoZSBJSkcgbGljZW5zZQorIyAgCisjIC0gICAgMi4gIElm
IHlvdXIgYmluYXJ5IGRpc3RyaWJ1dGlvbiBpbmNsdWRlcyBvciB1c2VzIHRoZSBUdXJib0pQRUcg
QVBJLCB0aGVuCisjIC0gICAgICAgIHlvdXIgcHJvZHVjdCBkb2N1bWVudGF0aW9uIG11c3QgaW5j
bHVkZSB0aGUgdGV4dCBvZiB0aGUgTW9kaWZpZWQgQlNECisjIC0gICAgICAgIExpY2Vuc2UgKHNl
ZSBiZWxvdy4pCisjICsgICAgMi4gIElmIHlvdXIgYmluYXJ5IGRpc3RyaWJ1dGlvbiBpbmNsdWRl
cyBvciB1c2VzIHRoZSBUdXJib0pQRUcgQVBJIG9yCisjICsgICAgICAgIGFzc29jaWF0ZWQgcHJv
Z3JhbXMsIGNqcGVnLCBvciBkanBlZywgdGhlbiB5b3VyIHByb2R1Y3QgZG9jdW1lbnRhdGlvbgor
IyArICAgICAgICBtdXN0IGluY2x1ZGUgdGhlIHRleHQgb2YgdGhlIE1vZGlmaWVkIEJTRCBMaWNl
bnNlIChzZWUgYmVsb3cuKQorIyAgCisjICAgICAgICAgICoqT3JpZ2luKioKKyMgICAgICAgICAg
LSBDbGF1c2UgMiBvZiB0aGUgTW9kaWZpZWQgQlNEIExpY2Vuc2UKKyMgQEAgLTgxLDIxICsxMDcs
MjAgQEAKKyMgICAgICAtIElKRyBMaWNlbnNlCisjICAgICAgLSBDbGF1c2UgMyBvZiB0aGUgTW9k
aWZpZWQgQlNEIExpY2Vuc2UKKyMgIAorIyAtNC4gIFRoZSBJSkcgYW5kIFRoZSBsaWJqcGVnLXR1
cmJvIFByb2plY3QgZG8gbm90IHdhcnJhbnQgbGlianBlZy10dXJibyB0byBiZQorIyAtICAgIGZy
ZWUgb2YgZGVmZWN0cywgbm9yIGRvIHdlIGFjY2VwdCBhbnkgbGlhYmlsaXR5IGZvciB1bmRlc2ly
YWJsZQorIyAtICAgIGNvbnNlcXVlbmNlcyByZXN1bHRpbmcgZnJvbSB5b3VyIHVzZSBvZiB0aGUg
c29mdHdhcmUuCisjICs0LiAgVGhlIGF1dGhvcnMgYW5kIGRpc3RyaWJ1dG9ycyBkbyBub3Qgd2Fy
cmFudCBsaWJqcGVnLXR1cmJvIHRvIGJlIGZyZWUgb2YKKyMgKyAgICBkZWZlY3RzLCBub3IgZG8g
d2UgYWNjZXB0IGFueSBsaWFiaWxpdHkgZm9yIHVuZGVzaXJhYmxlIGNvbnNlcXVlbmNlcworIyAr
ICAgIHJlc3VsdGluZyBmcm9tIHlvdXIgdXNlIG9mIHRoZSBzb2Z0d2FyZS4KKyMgIAorIyAgICAg
ICoqT3JpZ2luKioKKyMgICAgICAtIElKRyBMaWNlbnNlCisjICAgICAgLSBNb2RpZmllZCBCU0Qg
TGljZW5zZQorIyAtICAgIC0gemxpYiBMaWNlbnNlCisjICAKKyMgIAorIyAgVGhlIE1vZGlmaWVk
ICgzLWNsYXVzZSkgQlNEIExpY2Vuc2UKKyMgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09CisjICAKKyMgLUNvcHlyaWdodCAoQykyMDA5LTIwMjUgRC4gUi4gQ29tbWFuZGVyLiAg
QWxsIFJpZ2h0cyBSZXNlcnZlZC48YnI+CisjIC1Db3B5cmlnaHQgKEMpMjAxNSBWaWt0b3IgU3ph
dGhtw6FyeS4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjICtDb3B5cmlnaHQgKEMpIDIwMDktMjAy
NiBELiBSLiBDb21tYW5kZXI8YnI+CisjICtDb3B5cmlnaHQgKEMpIDIwMTgtMjAyMyBSYW5keSA8
cmFuZHk0MDhAcHJvdG9ubWFpbC5jb20+CisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2Ug
aW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAgbW9kaWZpY2F0
aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25z
IGFyZSBtZXQ6CisjIEBAIC0xMjAsMTYgKzE0NSwzIEBACisjICBDT05UUkFDVCwgU1RSSUNUIExJ
QUJJTElUWSwgT1IgVE9SVCAoSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKQorIyAg
QVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBUSEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4g
SUYgQURWSVNFRCBPRiBUSEUKKyMgIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyAtCisj
IC0KKyMgLVdoeSBUd28gTGljZW5zZXM/CisjIC09PT09PT09PT09PT09PT09PQorIyAtCisjIC1U
aGUgemxpYiBMaWNlbnNlIGNvdWxkIGhhdmUgYmVlbiB1c2VkIGluc3RlYWQgb2YgdGhlIE1vZGlm
aWVkICgzLWNsYXVzZSkgQlNECisjIC1MaWNlbnNlLCBhbmQgc2luY2UgdGhlIElKRyBMaWNlbnNl
IGVmZmVjdGl2ZWx5IHN1YnN1bWVzIHRoZSBkaXN0cmlidXRpb24KKyMgLWNvbmRpdGlvbnMgb2Yg
dGhlIHpsaWIgTGljZW5zZSwgdGhpcyB3b3VsZCBoYXZlIGVmZmVjdGl2ZWx5IHBsYWNlZAorIyAt
bGlianBlZy10dXJibyBiaW5hcnkgZGlzdHJpYnV0aW9ucyB1bmRlciB0aGUgSUpHIExpY2Vuc2Uu
ICBIb3dldmVyLCB0aGUgSUpHCisjIC1MaWNlbnNlIHNwZWNpZmljYWxseSByZWZlcnMgdG8gdGhl
IEluZGVwZW5kZW50IEpQRUcgR3JvdXAgYW5kIGRvZXMgbm90IGV4dGVuZAorIyAtYXR0cmlidXRp
b24gYW5kIGVuZG9yc2VtZW50IHByb3RlY3Rpb25zIHRvIG90aGVyIGVudGl0aWVzLiAgVGh1cywg
aXQgd2FzCisjIC1kZXNpcmFibGUgdG8gY2hvb3NlIGEgbGljZW5zZSB0aGF0IGdyYW50ZWQgdXMg
dGhlIHNhbWUgcHJvdGVjdGlvbnMgZm9yIG5ldyBjb2RlCisjIC10aGF0IHdlcmUgZ3JhbnRlZCB0
byB0aGUgSUpHIGZvciBjb2RlIGRlcml2ZWQgZnJvbSB0aGVpciBzb2Z0d2FyZS4KKyMgCisjCisK
IFNVTU1BUlkgPSAiSGFyZHdhcmUgYWNjZWxlcmF0ZWQgSlBFRyBjb21wcmVzc2lvbi9kZWNvbXBy
ZXNzaW9uIGxpYnJhcnkiCiBERVNDUklQVElPTiA9ICJsaWJqcGVnLXR1cmJvIGlzIGEgZGVyaXZh
dGl2ZSBvZiBsaWJqcGVnIHRoYXQgdXNlcyBTSU1EIGluc3RydWN0aW9ucyAoTU1YLCBTU0UyLCBO
RU9OKSB0byBhY2NlbGVyYXRlIGJhc2VsaW5lIEpQRUcgY29tcHJlc3Npb24gYW5kIGRlY29tcHJl
c3Npb24iCiBIT01FUEFHRSA9ICJodHRwOi8vbGlianBlZy10dXJiby5vcmcvIgogCiBMSUNFTlNF
ID0gIklKRyAmIEJTRC0zLUNsYXVzZSAmIFpsaWIiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLm1kO21kNT01MmZkZGFiYzdlOGU3OTIzMzE1MGViZGE5NWMzZmMxZiIKK0xJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWQyMWRhZWYzYjRiMzE4Zjc3MDYy
MDU1MDU5YzcyOTM0IgogCiBERVBFTkRTOmFwcGVuZDp4ODYtNjQ6Y2xhc3MtdGFyZ2V0ID0gIiBu
YXNtLW5hdGl2ZSIKIERFUEVORFM6YXBwZW5kOng4NjpjbGFzcy10YXJnZXQgPSAiIG5hc20tbmF0
aXZlIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQ
fS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDc1OTIwYjgyNjgzNGFjNGRkZjk3NjYx
Y2M3MzQ5MTA0Nzg1NTg1OWFmZmQ2NzFkNTIwNzljNjg2N2MxYzZjMCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIxZDBlODZlZTQ1YmY0MzVkYzU3Zjg3NDQ3NjNiYTYyNDEwMjk0YjBmNTMxMmNiODc5
NjIyMTRhYzFmN2ZiNzhiIgogCiBQRSA9ICIxIgogCi0tIAoyLjQ3LjEKCg==

--===============2568209465863180128==--

