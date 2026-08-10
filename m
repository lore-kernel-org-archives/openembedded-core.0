Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CB6C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 05:11:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23239.1786338685526648964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 22:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sMp//0jq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cplPigIj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019fea152e82-2c4365d4-1e2c-4e9d-b7c5-b24e1043358c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786338684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qquPukF0+8ZQns7HoaGI0cJj5Pj4RITiuaqEwDv8+jc=;
	b=sMp//0jqBWKm/jR4xBmA7xIs2/qrgfHc1UGZB+pmH0vSxaifSdewwGNlD0FPuteL
	5Vjr/eh1HDm65dOvPNLPRH33HMTmHmdirRaUqDzpfaaeOGz8kaSlLdj/laGcxedHxSn
	fkA9FzrzJJkCeGq7FyNv6Sd6r1PGZPLwp/X5Ax2o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786338684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qquPukF0+8ZQns7HoaGI0cJj5Pj4RITiuaqEwDv8+jc=;
	b=cplPigIjBCiZnRNFO3XbJfYCQRWRHCJ9o63+zoDAtidXj/dJ13Zk8WYM/FjjNkW5
	tdCvnL9C+ANXQ6D8drJaPfjrZTYpjW4UpnXd/WUti1Li+k883SLBjQsYDkL2JeEIZ7W
	EmDeKUtDfoRczrebVVeZknb6Wjd2kETsmN3PHFeU=
Content-Type: multipart/mixed; boundary="===============3132052254402384374=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.5.2 SUCCEEDED
Message-ID: <0101019fea152e82-2c4365d4-1e2c-4e9d-b7c5-b24e1043358c-000000@us-west-2.amazonses.com>
Date: Mon, 10 Aug 2026 05:11:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.10-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 05:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243109

--===============3132052254402384374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpweXRob24zLW51bXB5KiB0byAqMi41LjIqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBz
OgogICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXB5dGhvbjMtbnVtcHktdXBncmFk
ZS0yLjUuMS0yLjUuMi5wYXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBw
YXRjaGVzIGFuZCBzdW1tYXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNv
bXBpbGUgYW4gaW1hZ2UgdGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNv
bWUgYmFzaWMgc2FuaXR5IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBv
ZmY6IGdpdCBjb21taXQgLXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRv
IHRoZSBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxp
ZXZlIHRoZSByZWNpcGUgc2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBj
YW4gZmlsbCBSRUNJUEVfTk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxl
IHNvIHRoYXQKYXV0b21hdGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQu
CgpQbGVhc2UgcmV2aWV3IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlv
biBhbmQgYnVpbGQvdXBkYXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1
ZyBhdCBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9k
dWN0PUF1dG9tYXRlZCUyMFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhl
bHBlcgoKLS0gPjggLS0KRnJvbSBjNjlkZTE1OWY4MjY0NTAzNTk1OTJjZDVhYTIzOTllMjMxNGE1
ODQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlv
Y3RvcHJvamVjdC5vcmc+CkRhdGU6IE1vbiwgMTAgQXVnIDIwMjYgMDU6MTE6MjEgKzAwMDAKU3Vi
amVjdDogW1BBVENIXSBweXRob24zLW51bXB5OiB1cGdyYWRlIDIuNS4xIC0+IDIuNS4yCk1JTUUt
VmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250
ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpTb3VyY2U6IGRvYy9jaGFuZ2Vsb2cvMi41LjIt
Y2hhbmdlbG9nLnJzdCwgZG9jL3NvdXJjZS9yZWxlYXNlLzIuNS4yLW5vdGVzLnJzdAoKQ29udHJp
YnV0b3JzCj09PT09PT09PT09PQoKQSB0b3RhbCBvZiAxNiBwZW9wbGUgY29udHJpYnV0ZWQgdG8g
dGhpcyByZWxlYXNlLiAgUGVvcGxlIHdpdGggYSAiKyIgYnkgdGhlaXIKbmFtZXMgY29udHJpYnV0
ZWQgYSBwYXRjaCBmb3IgdGhlIGZpcnN0IHRpbWUuCgoqIEFiaGlqZWV0c2luZ2ggTWVlbmEgKwoq
IENoYXJhbGFtcG9zIFN0cmF0YWtpcwoqIENoYXJsZXMgSGFycmlzCiogQ2hyaXMgTmluaGFtICsK
KiBEYXZpZCBXb29kcwoqIEdlb25obyArCiogR29wdSBZZXNod2FudGggUmVkZHkgKwoqIElhc29u
IEtyb21teWRhcwoqIElqdGloZWQgS2lsYW5pCiogSmVsbGUgWmlqbHN0cmEgKwoqIEpvcmVuIEhh
bW11ZG9nbHUKKiBLdW1hciBBZGl0eWEKKiBNaWtlIEJveWxlCiogTmF0aGFuIEdvbGRiYXVtCiog
UmFnaHV2ZWVyIERldnVsYXBhbGxpCiogU2ViYXN0aWFuIEJlcmcKClB1bGwgcmVxdWVzdHMgbWVy
Z2VkCj09PT09PT09PT09PT09PT09PT09CgpBIHRvdGFsIG9mIDI4IHB1bGwgcmVxdWVzdHMgd2Vy
ZSBtZXJnZWQgZm9yIHRoaXMgcmVsZWFzZS4KCiogYCMzMTg2NCA8aHR0cHM6Ly9naXRodWIuY29t
L251bXB5L251bXB5L3B1bGwvMzE4NjQ+YF9fOiBNQUlOVDogUHJlcGFyZSAyLjUueCBmb3IgZnVy
dGhlciBkZXZlbG9wbWVudAoqIGAjMzE4ODkgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1w
eS9wdWxsLzMxODg5PmBfXzogVFlQOiBCYWNrcG9ydCBtdWx0aXBsZSBzdGF0aWMgdHlwaW5nIGZp
eGVzIDEuCiogYCMzMTkwMCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5
MDA+YF9fOiBUU1Q6IGFkZCB0ZXN0cyBmb3Igc3RhYmxlIEFCSSBudW1weSBleHRlbnNpb25zICgj
MzE4MjIpCiogYCMzMTkwMSA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5
MDE+YF9fOiBCVUc6IGZpeCBgYFN0cmluZ0RUeXBlYGAgY29lcmNlIGZsYWcgaW4gYmluYXJ5IHVm
dW5jIHByb21vdGlvbi4uLgoqIGAjMzE5MDIgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1w
eS9wdWxsLzMxOTAyPmBfXzogQkxEOiBmaXggbWVzb24gZGVwcmVjYXRpb24gd2FybmluZ3MgKCMz
MTg5MikKKiBgIzMxOTIxIDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMTky
MT5gX186IFRZUDogQmFja3BvcnQgbXVsdGlwbGUgdHlwaW5nIGZpeGVzIDIuCiogYCMzMTk0NyA8
aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5NDc+YF9fOiBNQUlOVDogVXBk
YXRlIHg4Ni1zaW1kLXNvcnQgc3VicHJvamVjdCAoNWFkYjMzNCDihpIgZmE5NDRlZikgKCMzMTkw
OCkKKiBgIzMxOTQ5IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMTk0OT5g
X186IEJVRzogZml4IGNyYXNoIG9uIDMyIGJpdCBzeXN0ZW1zIHVzaW5nIGFiaTN0ICgjMzE3NzEp
CiogYCMzMTk1MCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5NTA+YF9f
OiBNTlQ6IHJlbW92ZSBzb21lIG9ic29sZXRlIHN0cmluZyB0byBib29sIHdvcmthcm91bmRzICgj
MzE4NTkpCiogYCMzMTk1MiA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5
NTI+YF9fOiBCVUc6IGNlbnRyYWxpemVkIGhlbHBlciBmb3Igb3V0cHV0IGNvZXJjZSBhbmQgbmFf
b2JqZWN0IGluIHN0cmluZ2R0eXBlLi4uCiogYCMzMTk1MyA8aHR0cHM6Ly9naXRodWIuY29tL251
bXB5L251bXB5L3B1bGwvMzE5NTM+YF9fOiBCVUc6IGZpeCBDUFUgZmVhdHVyZSBlbnYgZGlhZ25v
c3RpYyBidWZmZXIgb3ZlcnJ1bnMgKCMzMTkwNSkKKiBgIzMxOTU0IDxodHRwczovL2dpdGh1Yi5j
b20vbnVtcHkvbnVtcHkvcHVsbC8zMTk1ND5gX186IEJVRzogcmVzdG9yZSBuZGFycmF5LmNvbmp1
Z2F0ZSgpIGZvciBsZWdhY3kgdXNlci1kZWZpbmVkIGR0eXBlcy4uLgoqIGAjMzE5NTUgPGh0dHBz
Oi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMxOTU1PmBfXzogVFlQOiBBdm9pZCBzaGFk
b3dlZCBkdHlwZSBhbm5vdGF0aW9ucwoqIGAjMzIwNzcgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1w
eS9udW1weS9wdWxsLzMyMDc3PmBfXzogTUFJTlQ6IFVwZGF0ZSB2ZXJkb3JlZC1tZXNvbi9tZXNv
biB0byBtYXRjaCBtYWluLgoqIGAjMzIxMTQgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1w
eS9wdWxsLzMyMTE0PmBfXzogQlVHOiBmaXggcmVmY291bnQgbGVhayBvbiBvdmVybGFwcGluZyBj
b3B5dG8gd2l0aCB3aGVyZT1GYWxzZQoqIGAjMzIxMTUgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1w
eS9udW1weS9wdWxsLzMyMTE1PmBfXzogQlVHOiBmaXggc3dhbGxvd2VkIGNhc3QgZXJyb3IgaW4g
ZmFuY3kgaW5kZXhpbmcgYXNzaWdubWVudCAoIzMxOTc1KQoqIGAjMzIxMTYgPGh0dHBzOi8vZ2l0
aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMTE2PmBfXzogQlVHOiBGaXggYnVmZmVyZWQgaXRl
cmF0b3Igc3RyaWRlIGFmdGVyIHJlbW92aW5nIG11bHRpLWluZGV4CiogYCMzMjExNyA8aHR0cHM6
Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzIxMTc+YF9fOiBCVUc6IGZpeCBgYG5wLmZy
b21pdGVyYGAgY29ycnVwdGlvbiB3aGVuIHJldXNpbmcgYSBgYFN0cmluZ0RUeXBlYGAuLi4KKiBg
IzMyMTE5IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjExOT5gX186IEJV
RzogYWRkIGEgc3BlY2lhbCBjYXNlIGZvciBTdHJpbmdEVHlwZSBpbiBucC5pc2R0eXBlICgjMzIw
MzApCiogYCMzMjEyMSA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzIxMjE+
YF9fOiBCVUc6IHJlZmVyZW5jZSBsZWFrIGluIGBgc2ltZF9zZXF1ZW5jZV9mcm9tX2l0ZXJhYmxl
YGAgKCMzMjAzOCkKKiBgIzMyMTIyIDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVs
bC8zMjEyMj5gXwoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJh
Y3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0
byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9weXRob24ve3B5dGhvbjMtbnVtcHlfMi41LjEuYmIg
PT4gcHl0aG9uMy1udW1weV8yLjUuMi5iYn0gICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24ve3B5dGhvbjMtbnVtcHlfMi41LjEuYmIgPT4gcHl0aG9uMy1udW1weV8yLjUuMi5iYn0g
KDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bnVtcHlfMi41LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVt
cHlfMi41LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuNS4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi41LjIuYmIKaW5kZXggODg3ODZk
YzAxNi4uYjBjMGU4NWM2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW51bXB5XzIuNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1udW1weV8yLjUuMi5iYgpAQCAtMTAsNyArMTAsNyBAQCBTUkNOQU1FID0gIm51
bXB5IgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7U1JD
TkFNRX0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAg
ICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhNDhhMTEzZTZhZmVhOTFmNTYwODc5M2Jh
ZmE3ZWYyYWQ0ODFmZWZiZGE4N2VjNTA2OWY0ODNkZTYxY2I5ZmEzIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImQ0ODJkMTcxYzQwNmFlODhjNWIxOWNhZDNiNmExYzRjNTIwOWY4ODZhYjc0YmM0NGMy
Yzg2NWMyM2Y1MmQ4NjAiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20v
bnVtcHkvbnVtcHkvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90
YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgotLSAKMi40Ny4xCgo=

--===============3132052254402384374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/multiarray, directory ren
 amed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/sfc64, 
 directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/di
 stributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/umath/svml, removed "/usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_opaque.c /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api1.c /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_latest.c /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api2.pyx
 ", added "/usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_cython.pyx /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api.c"
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api.c was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_cython.pyx was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api1.c was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api2.pyx was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_latest.c was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_opaque.c was removed

--===============3132052254402384374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.5.1" to "2.5.2"
packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.5.1 [default] to 2.5.2 [default]
packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.5.1/numpy-2.5.1.tar.gz file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.5.2/numpy-2.5.2.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.5.1" to "2.5.2"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.5.1 [default] to 2.5.2 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 102250312 to 101296976 (-1%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.5.1" to "2.5.2"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.5.1 [default] to 2.5.2 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.5.1" to "2.5.2"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.5.1 [default] to 2.5.2 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.5.1" to "2.5.2"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.5.1 [default] to 2.5.2 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.5.1" to "2.5.2"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.5.1 [default] to 2.5.2 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.5.1" to "2.5.2"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/include/numpy, directory renamed /usr/src/de
 bug/python3-numpy/2.5.1/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.5.2/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2
 .5.1/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/common/pythoncapi-compat -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/common -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2
 .5.2/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/common/simd -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.5.2
 /numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.5.2/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/_common.cpython-314-x86
 _64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/include -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/linalg -> /usr/src/debug/python3-numpy/2.5.2/numpy/linalg, directory renamed /usr/s
 rc/debug/python3-numpy/2.5.1/numpy/fft -> /usr/src/debug/python3-numpy/2.5.2/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/multiarray -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.5.1/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/npysort/x86-simd-sort/src
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.5.1 [default] to 2.5.2 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 25661825 to 25739481 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.5.1" to "2.5.2"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.5.1 [default] to 2.5.2 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 357982 to 357974 (-0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.5.1" to "2.5.2"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/umath/s
 vml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.1
 4/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-inf
 o/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/distributions, removed "/usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api1.c /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_latest.c /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api2.pyx /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_opaque.c
 ", added "/usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_cython.pyx /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api.c"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.5.1 [default] to 2.5.2 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 41559835 to 41591049 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.5.1.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api.c was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_cython.pyx was added
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api1.c was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api2.pyx was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_latest.c was removed
  /usr/lib/python3.14/site-packages/numpy/_core/tests/examples/limited_api/limited_api_opaque.c was removed

--===============3132052254402384374==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.5.1-2.5.2.patch"

RnJvbSBjNjlkZTE1OWY4MjY0NTAzNTk1OTJjZDVhYTIzOTllMjMxNGE1ODQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTAgQXVnIDIwMjYgMDU6MTE6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDIuNS4xIC0+IDIuNS4yCk1JTUUtVmVyc2lvbjogMS4wCkNv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVu
Y29kaW5nOiA4Yml0CgpTb3VyY2U6IGRvYy9jaGFuZ2Vsb2cvMi41LjItY2hhbmdlbG9nLnJzdCwg
ZG9jL3NvdXJjZS9yZWxlYXNlLzIuNS4yLW5vdGVzLnJzdAoKQ29udHJpYnV0b3JzCj09PT09PT09
PT09PQoKQSB0b3RhbCBvZiAxNiBwZW9wbGUgY29udHJpYnV0ZWQgdG8gdGhpcyByZWxlYXNlLiAg
UGVvcGxlIHdpdGggYSAiKyIgYnkgdGhlaXIKbmFtZXMgY29udHJpYnV0ZWQgYSBwYXRjaCBmb3Ig
dGhlIGZpcnN0IHRpbWUuCgoqIEFiaGlqZWV0c2luZ2ggTWVlbmEgKwoqIENoYXJhbGFtcG9zIFN0
cmF0YWtpcwoqIENoYXJsZXMgSGFycmlzCiogQ2hyaXMgTmluaGFtICsKKiBEYXZpZCBXb29kcwoq
IEdlb25obyArCiogR29wdSBZZXNod2FudGggUmVkZHkgKwoqIElhc29uIEtyb21teWRhcwoqIElq
dGloZWQgS2lsYW5pCiogSmVsbGUgWmlqbHN0cmEgKwoqIEpvcmVuIEhhbW11ZG9nbHUKKiBLdW1h
ciBBZGl0eWEKKiBNaWtlIEJveWxlCiogTmF0aGFuIEdvbGRiYXVtCiogUmFnaHV2ZWVyIERldnVs
YXBhbGxpCiogU2ViYXN0aWFuIEJlcmcKClB1bGwgcmVxdWVzdHMgbWVyZ2VkCj09PT09PT09PT09
PT09PT09PT09CgpBIHRvdGFsIG9mIDI4IHB1bGwgcmVxdWVzdHMgd2VyZSBtZXJnZWQgZm9yIHRo
aXMgcmVsZWFzZS4KCiogYCMzMTg2NCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1
bGwvMzE4NjQ+YF9fOiBNQUlOVDogUHJlcGFyZSAyLjUueCBmb3IgZnVydGhlciBkZXZlbG9wbWVu
dAoqIGAjMzE4ODkgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMxODg5PmBf
XzogVFlQOiBCYWNrcG9ydCBtdWx0aXBsZSBzdGF0aWMgdHlwaW5nIGZpeGVzIDEuCiogYCMzMTkw
MCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5MDA+YF9fOiBUU1Q6IGFk
ZCB0ZXN0cyBmb3Igc3RhYmxlIEFCSSBudW1weSBleHRlbnNpb25zICgjMzE4MjIpCiogYCMzMTkw
MSA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5MDE+YF9fOiBCVUc6IGZp
eCBgYFN0cmluZ0RUeXBlYGAgY29lcmNlIGZsYWcgaW4gYmluYXJ5IHVmdW5jIHByb21vdGlvbi4u
LgoqIGAjMzE5MDIgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMxOTAyPmBf
XzogQkxEOiBmaXggbWVzb24gZGVwcmVjYXRpb24gd2FybmluZ3MgKCMzMTg5MikKKiBgIzMxOTIx
IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMTkyMT5gX186IFRZUDogQmFj
a3BvcnQgbXVsdGlwbGUgdHlwaW5nIGZpeGVzIDIuCiogYCMzMTk0NyA8aHR0cHM6Ly9naXRodWIu
Y29tL251bXB5L251bXB5L3B1bGwvMzE5NDc+YF9fOiBNQUlOVDogVXBkYXRlIHg4Ni1zaW1kLXNv
cnQgc3VicHJvamVjdCAoNWFkYjMzNCDihpIgZmE5NDRlZikgKCMzMTkwOCkKKiBgIzMxOTQ5IDxo
dHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMTk0OT5gX186IEJVRzogZml4IGNy
YXNoIG9uIDMyIGJpdCBzeXN0ZW1zIHVzaW5nIGFiaTN0ICgjMzE3NzEpCiogYCMzMTk1MCA8aHR0
cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5NTA+YF9fOiBNTlQ6IHJlbW92ZSBz
b21lIG9ic29sZXRlIHN0cmluZyB0byBib29sIHdvcmthcm91bmRzICgjMzE4NTkpCiogYCMzMTk1
MiA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5NTI+YF9fOiBCVUc6IGNl
bnRyYWxpemVkIGhlbHBlciBmb3Igb3V0cHV0IGNvZXJjZSBhbmQgbmFfb2JqZWN0IGluIHN0cmlu
Z2R0eXBlLi4uCiogYCMzMTk1MyA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwv
MzE5NTM+YF9fOiBCVUc6IGZpeCBDUFUgZmVhdHVyZSBlbnYgZGlhZ25vc3RpYyBidWZmZXIgb3Zl
cnJ1bnMgKCMzMTkwNSkKKiBgIzMxOTU0IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkv
cHVsbC8zMTk1ND5gX186IEJVRzogcmVzdG9yZSBuZGFycmF5LmNvbmp1Z2F0ZSgpIGZvciBsZWdh
Y3kgdXNlci1kZWZpbmVkIGR0eXBlcy4uLgoqIGAjMzE5NTUgPGh0dHBzOi8vZ2l0aHViLmNvbS9u
dW1weS9udW1weS9wdWxsLzMxOTU1PmBfXzogVFlQOiBBdm9pZCBzaGFkb3dlZCBkdHlwZSBhbm5v
dGF0aW9ucwoqIGAjMzIwNzcgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMy
MDc3PmBfXzogTUFJTlQ6IFVwZGF0ZSB2ZXJkb3JlZC1tZXNvbi9tZXNvbiB0byBtYXRjaCBtYWlu
LgoqIGAjMzIxMTQgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMTE0PmBf
XzogQlVHOiBmaXggcmVmY291bnQgbGVhayBvbiBvdmVybGFwcGluZyBjb3B5dG8gd2l0aCB3aGVy
ZT1GYWxzZQoqIGAjMzIxMTUgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMy
MTE1PmBfXzogQlVHOiBmaXggc3dhbGxvd2VkIGNhc3QgZXJyb3IgaW4gZmFuY3kgaW5kZXhpbmcg
YXNzaWdubWVudCAoIzMxOTc1KQoqIGAjMzIxMTYgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9u
dW1weS9wdWxsLzMyMTE2PmBfXzogQlVHOiBGaXggYnVmZmVyZWQgaXRlcmF0b3Igc3RyaWRlIGFm
dGVyIHJlbW92aW5nIG11bHRpLWluZGV4CiogYCMzMjExNyA8aHR0cHM6Ly9naXRodWIuY29tL251
bXB5L251bXB5L3B1bGwvMzIxMTc+YF9fOiBCVUc6IGZpeCBgYG5wLmZyb21pdGVyYGAgY29ycnVw
dGlvbiB3aGVuIHJldXNpbmcgYSBgYFN0cmluZ0RUeXBlYGAuLi4KKiBgIzMyMTE5IDxodHRwczov
L2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjExOT5gX186IEJVRzogYWRkIGEgc3BlY2lh
bCBjYXNlIGZvciBTdHJpbmdEVHlwZSBpbiBucC5pc2R0eXBlICgjMzIwMzApCiogYCMzMjEyMSA8
aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzIxMjE+YF9fOiBCVUc6IHJlZmVy
ZW5jZSBsZWFrIGluIGBgc2ltZF9zZXF1ZW5jZV9mcm9tX2l0ZXJhYmxlYGAgKCMzMjAzOCkKKiBg
IzMyMTIyIDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjEyMj5gXwoKW0No
YW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxs
IGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWls
XQotLS0KIC4uLi9weXRob24ve3B5dGhvbjMtbnVtcHlfMi41LjEuYmIgPT4gcHl0aG9uMy1udW1w
eV8yLjUuMi5iYn0gICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMt
bnVtcHlfMi41LjEuYmIgPT4gcHl0aG9uMy1udW1weV8yLjUuMi5iYn0gKDk3JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi41LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi41LjIuYmIKc2lt
aWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW51bXB5XzIuNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHlfMi41LjIuYmIKaW5kZXggODg3ODZkYzAxNi4uYjBjMGU4NWM2
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
XzIuNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1w
eV8yLjUuMi5iYgpAQCAtMTAsNyArMTAsNyBAQCBTUkNOQU1FID0gIm51bXB5IgogU1JDX1VSSSA9
ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFy
Lmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhNDhhMTEzZTZhZmVhOTFmNTYwODc5M2JhZmE3ZWYyYWQ0ODFmZWZi
ZGE4N2VjNTA2OWY0ODNkZTYxY2I5ZmEzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ0ODJkMTcx
YzQwNmFlODhjNWIxOWNhZDNiNmExYzRjNTIwOWY4ODZhYjc0YmM0NGMyYzg2NWMyM2Y1MmQ4NjAi
CiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcmVs
ZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5c
ZCsoXC5cZCspKykkIgotLSAKMi40Ny4xCgo=

--===============3132052254402384374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="python3-numpy-changelog.txt"

Q2hhbmdlbG9nIGZvciBweXRob24zLW51bXB5OiAyLjUuMSAtPiAyLjUuMgpTb3VyY2U6IGRvYy9j
aGFuZ2Vsb2cvMi41LjItY2hhbmdlbG9nLnJzdCwgZG9jL3NvdXJjZS9yZWxlYXNlLzIuNS4yLW5v
dGVzLnJzdAoKQ29udHJpYnV0b3JzCj09PT09PT09PT09PQoKQSB0b3RhbCBvZiAxNiBwZW9wbGUg
Y29udHJpYnV0ZWQgdG8gdGhpcyByZWxlYXNlLiAgUGVvcGxlIHdpdGggYSAiKyIgYnkgdGhlaXIK
bmFtZXMgY29udHJpYnV0ZWQgYSBwYXRjaCBmb3IgdGhlIGZpcnN0IHRpbWUuCgoqIEFiaGlqZWV0
c2luZ2ggTWVlbmEgKwoqIENoYXJhbGFtcG9zIFN0cmF0YWtpcwoqIENoYXJsZXMgSGFycmlzCiog
Q2hyaXMgTmluaGFtICsKKiBEYXZpZCBXb29kcwoqIEdlb25obyArCiogR29wdSBZZXNod2FudGgg
UmVkZHkgKwoqIElhc29uIEtyb21teWRhcwoqIElqdGloZWQgS2lsYW5pCiogSmVsbGUgWmlqbHN0
cmEgKwoqIEpvcmVuIEhhbW11ZG9nbHUKKiBLdW1hciBBZGl0eWEKKiBNaWtlIEJveWxlCiogTmF0
aGFuIEdvbGRiYXVtCiogUmFnaHV2ZWVyIERldnVsYXBhbGxpCiogU2ViYXN0aWFuIEJlcmcKClB1
bGwgcmVxdWVzdHMgbWVyZ2VkCj09PT09PT09PT09PT09PT09PT09CgpBIHRvdGFsIG9mIDI4IHB1
bGwgcmVxdWVzdHMgd2VyZSBtZXJnZWQgZm9yIHRoaXMgcmVsZWFzZS4KCiogYCMzMTg2NCA8aHR0
cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE4NjQ+YF9fOiBNQUlOVDogUHJlcGFy
ZSAyLjUueCBmb3IgZnVydGhlciBkZXZlbG9wbWVudAoqIGAjMzE4ODkgPGh0dHBzOi8vZ2l0aHVi
LmNvbS9udW1weS9udW1weS9wdWxsLzMxODg5PmBfXzogVFlQOiBCYWNrcG9ydCBtdWx0aXBsZSBz
dGF0aWMgdHlwaW5nIGZpeGVzIDEuCiogYCMzMTkwMCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5
L251bXB5L3B1bGwvMzE5MDA+YF9fOiBUU1Q6IGFkZCB0ZXN0cyBmb3Igc3RhYmxlIEFCSSBudW1w
eSBleHRlbnNpb25zICgjMzE4MjIpCiogYCMzMTkwMSA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5
L251bXB5L3B1bGwvMzE5MDE+YF9fOiBCVUc6IGZpeCBgYFN0cmluZ0RUeXBlYGAgY29lcmNlIGZs
YWcgaW4gYmluYXJ5IHVmdW5jIHByb21vdGlvbi4uLgoqIGAjMzE5MDIgPGh0dHBzOi8vZ2l0aHVi
LmNvbS9udW1weS9udW1weS9wdWxsLzMxOTAyPmBfXzogQkxEOiBmaXggbWVzb24gZGVwcmVjYXRp
b24gd2FybmluZ3MgKCMzMTg5MikKKiBgIzMxOTIxIDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkv
bnVtcHkvcHVsbC8zMTkyMT5gX186IFRZUDogQmFja3BvcnQgbXVsdGlwbGUgdHlwaW5nIGZpeGVz
IDIuCiogYCMzMTk0NyA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5NDc+
YF9fOiBNQUlOVDogVXBkYXRlIHg4Ni1zaW1kLXNvcnQgc3VicHJvamVjdCAoNWFkYjMzNCDihpIg
ZmE5NDRlZikgKCMzMTkwOCkKKiBgIzMxOTQ5IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVt
cHkvcHVsbC8zMTk0OT5gX186IEJVRzogZml4IGNyYXNoIG9uIDMyIGJpdCBzeXN0ZW1zIHVzaW5n
IGFiaTN0ICgjMzE3NzEpCiogYCMzMTk1MCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5
L3B1bGwvMzE5NTA+YF9fOiBNTlQ6IHJlbW92ZSBzb21lIG9ic29sZXRlIHN0cmluZyB0byBib29s
IHdvcmthcm91bmRzICgjMzE4NTkpCiogYCMzMTk1MiA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5
L251bXB5L3B1bGwvMzE5NTI+YF9fOiBCVUc6IGNlbnRyYWxpemVkIGhlbHBlciBmb3Igb3V0cHV0
IGNvZXJjZSBhbmQgbmFfb2JqZWN0IGluIHN0cmluZ2R0eXBlLi4uCiogYCMzMTk1MyA8aHR0cHM6
Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5NTM+YF9fOiBCVUc6IGZpeCBDUFUgZmVh
dHVyZSBlbnYgZGlhZ25vc3RpYyBidWZmZXIgb3ZlcnJ1bnMgKCMzMTkwNSkKKiBgIzMxOTU0IDxo
dHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMTk1ND5gX186IEJVRzogcmVzdG9y
ZSBuZGFycmF5LmNvbmp1Z2F0ZSgpIGZvciBsZWdhY3kgdXNlci1kZWZpbmVkIGR0eXBlcy4uLgoq
IGAjMzE5NTUgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMxOTU1PmBfXzog
VFlQOiBBdm9pZCBzaGFkb3dlZCBkdHlwZSBhbm5vdGF0aW9ucwoqIGAjMzIwNzcgPGh0dHBzOi8v
Z2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMDc3PmBfXzogTUFJTlQ6IFVwZGF0ZSB2ZXJk
b3JlZC1tZXNvbi9tZXNvbiB0byBtYXRjaCBtYWluLgoqIGAjMzIxMTQgPGh0dHBzOi8vZ2l0aHVi
LmNvbS9udW1weS9udW1weS9wdWxsLzMyMTE0PmBfXzogQlVHOiBmaXggcmVmY291bnQgbGVhayBv
biBvdmVybGFwcGluZyBjb3B5dG8gd2l0aCB3aGVyZT1GYWxzZQoqIGAjMzIxMTUgPGh0dHBzOi8v
Z2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMTE1PmBfXzogQlVHOiBmaXggc3dhbGxvd2Vk
IGNhc3QgZXJyb3IgaW4gZmFuY3kgaW5kZXhpbmcgYXNzaWdubWVudCAoIzMxOTc1KQoqIGAjMzIx
MTYgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMTE2PmBfXzogQlVHOiBG
aXggYnVmZmVyZWQgaXRlcmF0b3Igc3RyaWRlIGFmdGVyIHJlbW92aW5nIG11bHRpLWluZGV4Ciog
YCMzMjExNyA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzIxMTc+YF9fOiBC
VUc6IGZpeCBgYG5wLmZyb21pdGVyYGAgY29ycnVwdGlvbiB3aGVuIHJldXNpbmcgYSBgYFN0cmlu
Z0RUeXBlYGAuLi4KKiBgIzMyMTE5IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVs
bC8zMjExOT5gX186IEJVRzogYWRkIGEgc3BlY2lhbCBjYXNlIGZvciBTdHJpbmdEVHlwZSBpbiBu
cC5pc2R0eXBlICgjMzIwMzApCiogYCMzMjEyMSA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251
bXB5L3B1bGwvMzIxMjE+YF9fOiBCVUc6IHJlZmVyZW5jZSBsZWFrIGluIGBgc2ltZF9zZXF1ZW5j
ZV9mcm9tX2l0ZXJhYmxlYGAgKCMzMjAzOCkKKiBgIzMyMTIyIDxodHRwczovL2dpdGh1Yi5jb20v
bnVtcHkvbnVtcHkvcHVsbC8zMjEyMj5gX186IEJVRzogZW5zdXJlIGxvY2sgaXMgaGVsZCB3aGVu
IGFjY2Vzc2luZyBvciB3cml0aW5nIHRvIFJORyBzdGF0ZS4uLgoqIGAjMzIxMjMgPGh0dHBzOi8v
Z2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMTIzPmBfXzogQlVHOiBmdWxseSByZXNldCBj
YWNoZWQgUk5HIHN0YXRlIGZvciBub24tTVQxOTkzNyBSTkdzICgjMzIwNjIpCiogYCMzMjEzNSA8
aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzIxMzU+YF9fOiBUWVA6IHR5cGUg
Y2FwYWJpbGl0aWVzIG1heCBkaW1lbnNpb25zCiogYCMzMjE1OCA8aHR0cHM6Ly9naXRodWIuY29t
L251bXB5L251bXB5L3B1bGwvMzIxNTg+YF9fOiBCVUc6IGF2b2lkIHBvc3NpYmxlIHN0YWNrIG92
ZXJmbG93IGluIGFycmF5ZGVzY3JfZGVhbGxvYyAoIzMyMTMzKQoqIGAjMzIyMDYgPGh0dHBzOi8v
Z2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMjA2PmBfXzogTUFJTlQ6IFVwZGF0ZSBjaWJ1
aWxkd2hlZWwgdG8gdjQuMi4wCiogYCMzMjIxNCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251
bXB5L3B1bGwvMzIyMTQ+YF9fOiBNQUlOVDogU2tpcCBsaW1pdGVkX2FwaSB0ZXN0cyBvbiBzb21l
IHBsYXRmb3Jtcy4KKiBgIzMyMjIwIDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVs
bC8zMjIyMD5gX186IFRZUDogYGBpc2Nsb3NlYGAgc2hhcGUtdHlwaW5nIGZpeCBmb3IgMmQgYXJy
YXktbGlrZXMgKCMzMjIwNSkKKiBgIzMyMjIxIDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVt
cHkvcHVsbC8zMjIyMT5gX186IEJVRzogYXZvaWQgc2VnZmF1bHRzIHdoZW4gbGVnYWN5IGNvcHlz
d2FwIHNsb3QgaXMgbm90IGRlZmluZWQuLi4KCi4uIGN1cnJlbnRtb2R1bGU6OiBudW1weQoKPT09
PT09PT09PT09PT09PT09PT09PT09PQpOdW1QeSAyLjUuMiBSZWxlYXNlIE5vdGVzCj09PT09PT09
PT09PT09PT09PT09PT09PT0KClRoZSBOdW1QeSAyLjUuMiBpcyBhIHBhdGNoIHJlbGVhc2UgdGhh
dCBmaXhlcyBidWdzIGRpc2NvdmVyZWQgYWZ0ZXIgdGhlIDIuNS4xCnJlbGVhc2UuIFRoZSBiaWcg
bmV3cyBpcyB0aGF0IGl0IGluY2x1ZGVzIHdoZWVscyBmb3IgdGhlIG5ld2x5IHJlbGVhc2VkClB5
dGhvbiAzLjE1LjByYzEuCgpUaGlzIHJlbGVhc2Ugc3VwcG9ydHMgUHl0aG9uIHZlcnNpb25zIDMu
MTItMy4xNQoKQyBBUEkgY2hhbmdlcwo9PT09PT09PT09PT09CgpgYFB5QXJyYXlfU3RyaW5nRFR5
cGVPYmplY3RgYCBpcyBvcGFxdWUgdW5kZXIgdGhlIGFiaTN0IHN0YWJsZSBBQkkKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CgpUaGUgYGBQeUFycmF5X1N0cmluZ0RUeXBlT2JqZWN0YGAgd2FzIGFjY2lkZW50YWxseSBleHBv
c2VkIGluIE51bVB5CjIuNSB3aGVuIHRhcmdldGluZyB0aGUgZnJlZS10aHJlYWRpbmctY29tcGF0
aWJsZSBzdGFibGUgQUJJCihgYFB5X1RBUkdFVF9BQkkzVGBgKS4gYGBQeUFycmF5X1N0cmluZ0RU
eXBlT2JqZWN0YGAgaXMgbm93IGFuIG9wYXF1ZQpzdHJ1Y3Q6IGV4dGVuc2lvbnMgY29tcGlsZWQg
dGhhdCB3YXkgY2Fubm90IGFjY2VzcyBpdHMgZmllbGRzLCBzaW5jZQp0aGUgc3RydWN0IGxheW91
dCBkZXBlbmRzIG9uIHRoZSBzaXplIG9mIHRoZSBvYmplY3QgaGVhZGVyLiBBbnkgY29kZQp0aGF0
IGFjY2Vzc2VkIGBgUHlBcnJheV9TdHJpbmdEVHlwZU9iamVjdGBgIGZpZWxkcyBpbiBhbiBhYmkz
dCBidWlsZAp3b3VsZCBoYXZlIGNyYXNoZWQsIHNvIHdlIGFyZSBtYWtpbmcgdGhpcyBBUEkgY2hh
bmdlIGluIGEgYnVnZml4CnJlbGVhc2UuCgpUaGUgYGBOcHlTdHJpbmdgYCBhbGxvY2F0b3IgQVBJ
IHJlbWFpbnMgdXNhYmxlIGJ5IHBhc3NpbmcgdGhlCmRlc2NyaXB0b3Igb2JqZWN0IHBvaW50ZXIs
IGUuZy4KYGBOcHlTdHJpbmdfYWNxdWlyZV9hbGxvY2F0b3IoKFB5QXJyYXlfU3RyaW5nRFR5cGVP
YmplY3QgKilkZXNjcilgYC4KCihgZ2gtMzE3NzEgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9u
dW1weS9wdWxsLzMxNzcxPmBfXykKCkNvbnRyaWJ1dG9ycwo9PT09PT09PT09PT0KCkEgdG90YWwg
b2YgMTYgcGVvcGxlIGNvbnRyaWJ1dGVkIHRvIHRoaXMgcmVsZWFzZS4gIFBlb3BsZSB3aXRoIGEg
IisiIGJ5IHRoZWlyCm5hbWVzIGNvbnRyaWJ1dGVkIGEgcGF0Y2ggZm9yIHRoZSBmaXJzdCB0aW1l
LgoKKiBBYmhpamVldHNpbmdoIE1lZW5hICsKKiBDaGFyYWxhbXBvcyBTdHJhdGFraXMKKiBDaGFy
bGVzIEhhcnJpcwoqIENocmlzIE5pbmhhbSArCiogRGF2aWQgV29vZHMKKiBHZW9uaG8gKwoqIEdv
cHUgWWVzaHdhbnRoIFJlZGR5ICsKKiBJYXNvbiBLcm9tbXlkYXMKKiBJanRpaGVkIEtpbGFuaQoq
IEplbGxlIFppamxzdHJhICsKKiBKb3JlbiBIYW1tdWRvZ2x1CiogS3VtYXIgQWRpdHlhCiogTWlr
ZSBCb3lsZQoqIE5hdGhhbiBHb2xkYmF1bQoqIFJhZ2h1dmVlciBEZXZ1bGFwYWxsaQoqIFNlYmFz
dGlhbiBCZXJnCgpQdWxsIHJlcXVlc3RzIG1lcmdlZAo9PT09PT09PT09PT09PT09PT09PQoKQSB0
b3RhbCBvZiAyOCBwdWxsIHJlcXVlc3RzIHdlcmUgbWVyZ2VkIGZvciB0aGlzIHJlbGVhc2UuCgoq
IGAjMzE4NjQgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMxODY0PmBfXzog
TUFJTlQ6IFByZXBhcmUgMi41LnggZm9yIGZ1cnRoZXIgZGV2ZWxvcG1lbnQKKiBgIzMxODg5IDxo
dHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMTg4OT5gX186IFRZUDogQmFja3Bv
cnQgbXVsdGlwbGUgc3RhdGljIHR5cGluZyBmaXhlcyAxLgoqIGAjMzE5MDAgPGh0dHBzOi8vZ2l0
aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMxOTAwPmBfXzogVFNUOiBhZGQgdGVzdHMgZm9yIHN0
YWJsZSBBQkkgbnVtcHkgZXh0ZW5zaW9ucyAoIzMxODIyKQoqIGAjMzE5MDEgPGh0dHBzOi8vZ2l0
aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMxOTAxPmBfXzogQlVHOiBmaXggYGBTdHJpbmdEVHlw
ZWBgIGNvZXJjZSBmbGFnIGluIGJpbmFyeSB1ZnVuYyBwcm9tb3Rpb24uLi4KKiBgIzMxOTAyIDxo
dHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMTkwMj5gX186IEJMRDogZml4IG1l
c29uIGRlcHJlY2F0aW9uIHdhcm5pbmdzICgjMzE4OTIpCiogYCMzMTkyMSA8aHR0cHM6Ly9naXRo
dWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5MjE+YF9fOiBUWVA6IEJhY2twb3J0IG11bHRpcGxl
IHR5cGluZyBmaXhlcyAyLgoqIGAjMzE5NDcgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1w
eS9wdWxsLzMxOTQ3PmBfXzogTUFJTlQ6IFVwZGF0ZSB4ODYtc2ltZC1zb3J0IHN1YnByb2plY3Qg
KDVhZGIzMzQg4oaSIGZhOTQ0ZWYpICgjMzE5MDgpCiogYCMzMTk0OSA8aHR0cHM6Ly9naXRodWIu
Y29tL251bXB5L251bXB5L3B1bGwvMzE5NDk+YF9fOiBCVUc6IGZpeCBjcmFzaCBvbiAzMiBiaXQg
c3lzdGVtcyB1c2luZyBhYmkzdCAoIzMxNzcxKQoqIGAjMzE5NTAgPGh0dHBzOi8vZ2l0aHViLmNv
bS9udW1weS9udW1weS9wdWxsLzMxOTUwPmBfXzogTU5UOiByZW1vdmUgc29tZSBvYnNvbGV0ZSBz
dHJpbmcgdG8gYm9vbCB3b3JrYXJvdW5kcyAoIzMxODU5KQoqIGAjMzE5NTIgPGh0dHBzOi8vZ2l0
aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMxOTUyPmBfXzogQlVHOiBjZW50cmFsaXplZCBoZWxw
ZXIgZm9yIG91dHB1dCBjb2VyY2UgYW5kIG5hX29iamVjdCBpbiBzdHJpbmdkdHlwZS4uLgoqIGAj
MzE5NTMgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMxOTUzPmBfXzogQlVH
OiBmaXggQ1BVIGZlYXR1cmUgZW52IGRpYWdub3N0aWMgYnVmZmVyIG92ZXJydW5zICgjMzE5MDUp
CiogYCMzMTk1NCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzE5NTQ+YF9f
OiBCVUc6IHJlc3RvcmUgbmRhcnJheS5jb25qdWdhdGUoKSBmb3IgbGVnYWN5IHVzZXItZGVmaW5l
ZCBkdHlwZXMuLi4KKiBgIzMxOTU1IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVs
bC8zMTk1NT5gX186IFRZUDogQXZvaWQgc2hhZG93ZWQgZHR5cGUgYW5ub3RhdGlvbnMKKiBgIzMy
MDc3IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjA3Nz5gX186IE1BSU5U
OiBVcGRhdGUgdmVyZG9yZWQtbWVzb24vbWVzb24gdG8gbWF0Y2ggbWFpbi4KKiBgIzMyMTE0IDxo
dHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjExND5gX186IEJVRzogZml4IHJl
ZmNvdW50IGxlYWsgb24gb3ZlcmxhcHBpbmcgY29weXRvIHdpdGggd2hlcmU9RmFsc2UKKiBgIzMy
MTE1IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjExNT5gX186IEJVRzog
Zml4IHN3YWxsb3dlZCBjYXN0IGVycm9yIGluIGZhbmN5IGluZGV4aW5nIGFzc2lnbm1lbnQgKCMz
MTk3NSkKKiBgIzMyMTE2IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjEx
Nj5gX186IEJVRzogRml4IGJ1ZmZlcmVkIGl0ZXJhdG9yIHN0cmlkZSBhZnRlciByZW1vdmluZyBt
dWx0aS1pbmRleAoqIGAjMzIxMTcgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxs
LzMyMTE3PmBfXzogQlVHOiBmaXggYGBucC5mcm9taXRlcmBgIGNvcnJ1cHRpb24gd2hlbiByZXVz
aW5nIGEgYGBTdHJpbmdEVHlwZWBgLi4uCiogYCMzMjExOSA8aHR0cHM6Ly9naXRodWIuY29tL251
bXB5L251bXB5L3B1bGwvMzIxMTk+YF9fOiBCVUc6IGFkZCBhIHNwZWNpYWwgY2FzZSBmb3IgU3Ry
aW5nRFR5cGUgaW4gbnAuaXNkdHlwZSAoIzMyMDMwKQoqIGAjMzIxMjEgPGh0dHBzOi8vZ2l0aHVi
LmNvbS9udW1weS9udW1weS9wdWxsLzMyMTIxPmBfXzogQlVHOiByZWZlcmVuY2UgbGVhayBpbiBg
YHNpbWRfc2VxdWVuY2VfZnJvbV9pdGVyYWJsZWBgICgjMzIwMzgpCiogYCMzMjEyMiA8aHR0cHM6
Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzIxMjI+YF9fOiBCVUc6IGVuc3VyZSBsb2Nr
IGlzIGhlbGQgd2hlbiBhY2Nlc3Npbmcgb3Igd3JpdGluZyB0byBSTkcgc3RhdGUuLi4KKiBgIzMy
MTIzIDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjEyMz5gX186IEJVRzog
ZnVsbHkgcmVzZXQgY2FjaGVkIFJORyBzdGF0ZSBmb3Igbm9uLU1UMTk5MzcgUk5HcyAoIzMyMDYy
KQoqIGAjMzIxMzUgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMTM1PmBf
XzogVFlQOiB0eXBlIGNhcGFiaWxpdGllcyBtYXggZGltZW5zaW9ucwoqIGAjMzIxNTggPGh0dHBz
Oi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMTU4PmBfXzogQlVHOiBhdm9pZCBwb3Nz
aWJsZSBzdGFjayBvdmVyZmxvdyBpbiBhcnJheWRlc2NyX2RlYWxsb2MgKCMzMjEzMykKKiBgIzMy
MjA2IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjIwNj5gX186IE1BSU5U
OiBVcGRhdGUgY2lidWlsZHdoZWVsIHRvIHY0LjIuMAoqIGAjMzIyMTQgPGh0dHBzOi8vZ2l0aHVi
LmNvbS9udW1weS9udW1weS9wdWxsLzMyMjE0PmBfXzogTUFJTlQ6IFNraXAgbGltaXRlZF9hcGkg
dGVzdHMgb24gc29tZSBwbGF0Zm9ybXMuCiogYCMzMjIyMCA8aHR0cHM6Ly9naXRodWIuY29tL251
bXB5L251bXB5L3B1bGwvMzIyMjA+YF9fOiBUWVA6IGBgaXNjbG9zZWBgIHNoYXBlLXR5cGluZyBm
aXggZm9yIDJkIGFycmF5LWxpa2VzICgjMzIyMDUpCiogYCMzMjIyMSA8aHR0cHM6Ly9naXRodWIu
Y29tL251bXB5L251bXB5L3B1bGwvMzIyMjE+YF9fOiBCVUc6IGF2b2lkIHNlZ2ZhdWx0cyB3aGVu
IGxlZ2FjeSBjb3B5c3dhcCBzbG90IGlzIG5vdCBkZWZpbmVkLi4uCg==

--===============3132052254402384374==--

