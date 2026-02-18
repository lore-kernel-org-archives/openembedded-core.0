Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB66DE9A054
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1408.1771440093928930767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qOp/Amiz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LhVUx62n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c720ede90-4a44d733-8ffb-40a2-876c-a9f925ab73e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440103;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ibGQFDeFh5zByjAXsuvAcXMqaREpeIgjAMGEny0Anxk=;
	b=qOp/Amiz8x4greGqu2fK2J0kbjGrr2hezeQRvpPHYchC0Me4tXx6HdTY3IjB1ez5
	Qa1ejZ1CGZsHtnWsbcAKsoYpvKEnIYyJ349A90tuaFjfNSzKD8+rugRBIFicOZnaRJW
	Vl0GYFMNjWdhkiwEbuyUp5U8HdPPW2GwtUmuKLE4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440103;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ibGQFDeFh5zByjAXsuvAcXMqaREpeIgjAMGEny0Anxk=;
	b=LhVUx62nzuwaux2B8mM5Y0QgtGarLBDO6liDqcgA0I3KDxV9PQVHXaiC+fMmA3Hl
	XDbJoSq+GcgNK9V52swv9BnP5+l7vlQg3G6nmrBXLoVJvmhRV/8uCR8ZfDmfjS7moxr
	yLfKdMROtNlwqPBZJJFqMIRPaSVGJ8CUTRYLgWLE=
Content-Type: multipart/mixed; boundary="===============5323125440953597649=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.3.1 SUCCEEDED
Message-ID: <0101019c720ede90-4a44d733-8ffb-40a2-876c-a9f925ab73e9-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231359

--===============5323125440953597649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpweXRob24zLXBvZXRyeS1jb3JlKiB0byAqMi4zLjEqIGhhcyBTdWNjZWVkZWQuCgpOZXh0
IHN0ZXBzOgogICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXB5dGhvbjMtcG9ldHJ5
LWNvcmUtdXBncmFkZS0yLjIuMS0yLjMuMS5wYXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0
byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1tYXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAg
LSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBh
bmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQgLXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAg
LSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHks
IGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlz
IHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVfTk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZl
IHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21hdGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBi
ZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhl
ciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBkYXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVh
c2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJf
YnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUyMFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRo
ZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJvbSBlZmY3NmEwMjM5ZmFkOTdhNDAwYWE5NDgy
ZjIyNDBlNjcyZDBjZGRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhl
bHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6Mzc6
MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBweXRob24zLXBvZXRyeS1jb3JlOiB1cGdyYWRlIDIu
Mi4xIC0+IDIuMy4xCgotLS0KIC4uLl8yLjIuMS5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIu
My4xLmJifSB8IDY5ICsrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1OSBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3tweXRob24zLXBvZXRyeS1jb3JlXzIuMi4xLmJiID0+IHB5dGhvbjMtcG9ldHJ5LWNv
cmVfMi4zLjEuYmJ9ICgxNyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTcl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnkt
Y29yZV8yLjIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXBvZXRyeS1jb3JlXzIuMy4xLmJiCmluZGV4IDQ1YWY4NzY4ZTkuLmNkMmU1ZDU0NjEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29y
ZV8yLjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9l
dHJ5LWNvcmVfMi4zLjEuYmIKQEAgLTEsMyArMSw1MyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IHNyYy9wb2V0cnkvY29yZS9fdmVuZG9yL2xhcmsvTElDRU5TRQorIyArKysgc3JjL3BvZXRyeS9j
b3JlL192ZW5kb3IvbGFyay9MSUNFTlNFCisjIEBAIC0xLDE4ICsxLDE4IEBACisjIC1Db3B5cmln
aHQgwqkgMjAxNyBFcmV6IFNoaW5hbgorIyAtCisjIC1QZXJtaXNzaW9uIGlzIGhlcmVieSBncmFu
dGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5IG9mCisj
IC10aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAi
U29mdHdhcmUiKSwgdG8gZGVhbCBpbgorIyAtdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rp
b24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cyB0bworIyAtdXNlLCBj
b3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQv
b3Igc2VsbCBjb3BpZXMgb2YKKyMgLXRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25z
IHRvIHdob20gdGhlIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywKKyMgLXN1YmplY3Qg
dG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyAtCisjIC1UaGUgYWJvdmUgY29weXJpZ2h0
IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBh
bGwKKyMgLWNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisj
IC0KKyMgLVRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZ
IE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisjIC1JTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBM
SU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwgRklUTkVTUworIyAt
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVO
VCBTSEFMTCBUSEUgQVVUSE9SUyBPUgorIyAtQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZP
UiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSCisjIC1JTiBB
TiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sIE9V
VCBPRiBPUiBJTgorIyAtQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9S
IE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyMgK0NvcHlyaWdodCDCqSAyMDE3IEVy
ZXogU2hpbmFuCisjICsKKyMgK1Blcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2Yg
Y2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkgb2YKKyMgK3RoaXMgc29mdHdh
cmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0
byBkZWFsIGluCisjICt0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5n
IHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzIHRvCisjICt1c2UsIGNvcHksIG1vZGlmeSwg
bWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsIGNvcGll
cyBvZgorIyArdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUg
U29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLAorIyArc3ViamVjdCB0byB0aGUgZm9sbG93
aW5nIGNvbmRpdGlvbnM6CisjICsKKyMgK1RoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0
aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbAorIyArY29waWVz
IG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMgKworIyArVEhFIFNP
RlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQs
IEVYUFJFU1MgT1IKKyMgK0lNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhF
IFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTCisjICtGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBB
VVRIT1JTIE9SCisjICtDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwg
REFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIKKyMgK0lOIEFOIEFDVElPTiBPRiBD
T05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOCisj
ICtDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElO
R1MgSU4gVEhFIFNPRlRXQVJFLgorIyAKKyMKKwogU1VNTUFSWSA9ICJQb2V0cnkgUEVQIDUxNyBC
dWlsZCBCYWNrZW5kIgogREVTQ1JJUFRJT04gPSAiUG9ldHJ5IFBFUCA1MTcgQnVpbGQgQmFja2Vu
ZCIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24tcG9ldHJ5L3BvZXRyeS1j
b3JlIgpAQCAtNSwxNyArNTUsMTYgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20v
cHl0aG9uLXBvZXRyeS9wb2V0cnktY29yZSIKIENIQU5HRUxPRyA9ICJodHRwczovL2dpdGh1Yi5j
b20vcHl0aG9uLXBvZXRyeS9wb2V0cnktY29yZS9ibG9iL21hc3Rlci9DSEFOR0VMT0cubWQiCiAK
IExJQ0VOU0UgPSAiQXBhY2hlLTIuMCAmIEJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSAmIE1J
VCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiXAotICAgIGZpbGU6Ly9MSUNFTlNFO21kNT03OGMzOWNm
ZDAwOTg2M2FlNDQyMzdhN2FiMWY5Y2VkYyBcCi0gICAgZmlsZTovL3NyYy9wb2V0cnkvY29yZS9f
dmVuZG9yL2Zhc3Rqc29uc2NoZW1hL0xJQ0VOU0U7bWQ1PTE4OTUwZTgzNjJiNjljMGM2MTdiNDJi
OGJkOGU3NTMyIFwKLSAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvbGFyay9MSUNF
TlNFO21kNT1mY2ZiZjFlMmVjYzBmMzdhY2JiNTg3MWFhMDI2NzUwMCBcCi0gICAgZmlsZTovL3Ny
Yy9wb2V0cnkvY29yZS9fdmVuZG9yL3BhY2thZ2luZy9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUx
YTkwYjIwNWM5MTY3NTc4Y2U5MSBcCi0gICAgZmlsZTovL3NyYy9wb2V0cnkvY29yZS9fdmVuZG9y
L3BhY2thZ2luZy9MSUNFTlNFLkFQQUNIRTttZDU9MmVlNDExMTJhNDRmZTcwMTRkY2UzM2UyNjQ2
OGJhOTMgXAotICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9wYWNrYWdpbmcvTElD
RU5TRS5CU0Q7bWQ1PTdiZWY5YmY0YThlNDI2MzYzNGQwNTk3ZTdiYTEwMGI4IFwKLSAgICBmaWxl
Oi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvdG9tbGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3
ZGYwMTEwZDFhYThjOGM5ZjQ2ZjUgXAotIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9NzhjMzljZmQwMDk4NjNhZTQ0MjM3YTdhYjFmOWNlZGMgXAorICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvZmFzdGpzb25zY2hlbWEvTElD
RU5TRTttZDU9MTg5NTBlODM2MmI2OWMwYzYxN2I0MmI4YmQ4ZTc1MzIgXAorICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvbGFyay9MSUNFTlNFO21kNT1i
YTVlZGY4ZDYwY2Y0MTZiNTU4OGIxZTZmMTUyZmNlZiBcCisgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9wYWNrYWdpbmcvTElDRU5TRTttZDU9ZmFhZGFl
ZGNhOTI1MWE5MGIyMDVjOTE2NzU3OGNlOTEgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
c3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvcGFja2FnaW5nL0xJQ0VOU0UuQVBBQ0hFO21kNT0yZWU0
MTExMmE0NGZlNzAxNGRjZTMzZTI2NDY4YmE5MyBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9wYWNrYWdpbmcvTElDRU5TRS5CU0Q7bWQ1PTdiZWY5
YmY0YThlNDI2MzYzNGQwNTk3ZTdiYTEwMGI4IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTov
L3NyYy9wb2V0cnkvY29yZS9fdmVuZG9yL3RvbWxpL0xJQ0VOU0U7bWQ1PWFhYWFmMDg3OWQxN2Rm
MDExMGQxYWE4YzhjOWY0NmY1IFwKKyAgICAgICAgICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiOTdlNTBkODU5M2M4NzI5ZDNmNDkzNjRiNDI4NTgzZTA0NDA4N2VlM2RlZjFl
MDEwYzY0OTZkYjc2YmQ2NWFjNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NmY3OTFkNWQ3ZDRl
MDQwZjM5ODNkNzY3Nzk0MjVjZjk1MzI2OTBlMjc1NmEyNGZkNWNhMGY4NmFmMTllZjgyIgogCiBp
bmhlcml0IHB5dGhvbl9wb2V0cnlfY29yZSBweXBpCiAKLS0gCjIuNDcuMQoK

--===============5323125440953597649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info

--===============5323125440953597649==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.2.1-2.3.1.patch"

RnJvbSBlZmY3NmEwMjM5ZmFkOTdhNDAwYWE5NDgyZjIyNDBlNjcyZDBjZGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6Mzc6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBvZXRyeS1jb3JlOiB1cGdyYWRlIDIuMi4xIC0+IDIuMy4xCgotLS0KIC4uLl8yLjIu
MS5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIuMy4xLmJifSB8IDY5ICsrKysrKysrKysrKysr
KystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBvZXRyeS1jb3Jl
XzIuMi4xLmJiID0+IHB5dGhvbjMtcG9ldHJ5LWNvcmVfMi4zLjEuYmJ9ICgxNyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIu
Mi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3Jl
XzIuMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjIuMS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMy4xLmJiCmlu
ZGV4IDQ1YWY4NzY4ZTkuLmNkMmU1ZDU0NjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjIuMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4zLjEuYmIKQEAgLTEsMyAr
MSw1MyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1
cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFz
ZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBj
aGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFn
LgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4n
KQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIHNyYy9wb2V0cnkvY29yZS9fdmVuZG9yL2xh
cmsvTElDRU5TRQorIyArKysgc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvbGFyay9MSUNFTlNFCisj
IEBAIC0xLDE4ICsxLDE4IEBACisjIC1Db3B5cmlnaHQgwqkgMjAxNyBFcmV6IFNoaW5hbgorIyAt
CisjIC1QZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55
IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5IG9mCisjIC10aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lh
dGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbgorIyAt
dGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0
YXRpb24gdGhlIHJpZ2h0cyB0bworIyAtdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNo
LCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbCBjb3BpZXMgb2YKKyMgLXRoZSBT
b2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJlIGlzIGZ1
cm5pc2hlZCB0byBkbyBzbywKKyMgLXN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25z
OgorIyAtCisjIC1UaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9u
IG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwKKyMgLWNvcGllcyBvciBzdWJzdGFudGlh
bCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjIC0KKyMgLVRIRSBTT0ZUV0FSRSBJUyBQUk9W
SURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisj
IC1JTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9G
IE1FUkNIQU5UQUJJTElUWSwgRklUTkVTUworIyAtRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFO
RCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQVVUSE9SUyBPUgorIyAt
Q09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RI
RVIgTElBQklMSVRZLCBXSEVUSEVSCisjIC1JTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQg
T1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJTgorIyAtQ09OTkVDVElPTiBX
SVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZU
V0FSRS4KKyMgK0NvcHlyaWdodCDCqSAyMDE3IEVyZXogU2hpbmFuCisjICsKKyMgK1Blcm1pc3Np
b24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFp
bmluZyBhIGNvcHkgb2YKKyMgK3RoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRh
dGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluCisjICt0aGUgU29mdHdhcmUg
d2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmln
aHRzIHRvCisjICt1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUs
IHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsIGNvcGllcyBvZgorIyArdGhlIFNvZnR3YXJlLCBhbmQg
dG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRv
IHNvLAorIyArc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjICsKKyMgK1Ro
ZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxs
IGJlIGluY2x1ZGVkIGluIGFsbAorIyArY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9m
IHRoZSBTb2Z0d2FyZS4KKyMgKworIyArVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIs
IFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgK0lNUExJRUQsIElO
Q0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklM
SVRZLCBGSVRORVNTCisjICtGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdF
TUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBBVVRIT1JTIE9SCisjICtDT1BZUklHSFQgSE9M
REVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFks
IFdIRVRIRVIKKyMgK0lOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0Us
IEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOCisjICtDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRX
QVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorIyAKKyMK
KwogU1VNTUFSWSA9ICJQb2V0cnkgUEVQIDUxNyBCdWlsZCBCYWNrZW5kIgogREVTQ1JJUFRJT04g
PSAiUG9ldHJ5IFBFUCA1MTcgQnVpbGQgQmFja2VuZCIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9weXRob24tcG9ldHJ5L3BvZXRyeS1jb3JlIgpAQCAtNSwxNyArNTUsMTYgQEAgQlVH
VFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uLXBvZXRyeS9wb2V0cnktY29yZSIK
IENIQU5HRUxPRyA9ICJodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uLXBvZXRyeS9wb2V0cnktY29y
ZS9ibG9iL21hc3Rlci9DSEFOR0VMT0cubWQiCiAKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCAmIEJT
RC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSAmIE1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiXAot
ICAgIGZpbGU6Ly9MSUNFTlNFO21kNT03OGMzOWNmZDAwOTg2M2FlNDQyMzdhN2FiMWY5Y2VkYyBc
Ci0gICAgZmlsZTovL3NyYy9wb2V0cnkvY29yZS9fdmVuZG9yL2Zhc3Rqc29uc2NoZW1hL0xJQ0VO
U0U7bWQ1PTE4OTUwZTgzNjJiNjljMGM2MTdiNDJiOGJkOGU3NTMyIFwKLSAgICBmaWxlOi8vc3Jj
L3BvZXRyeS9jb3JlL192ZW5kb3IvbGFyay9MSUNFTlNFO21kNT1mY2ZiZjFlMmVjYzBmMzdhY2Ji
NTg3MWFhMDI2NzUwMCBcCi0gICAgZmlsZTovL3NyYy9wb2V0cnkvY29yZS9fdmVuZG9yL3BhY2th
Z2luZy9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUxYTkwYjIwNWM5MTY3NTc4Y2U5MSBcCi0gICAg
ZmlsZTovL3NyYy9wb2V0cnkvY29yZS9fdmVuZG9yL3BhY2thZ2luZy9MSUNFTlNFLkFQQUNIRTtt
ZDU9MmVlNDExMTJhNDRmZTcwMTRkY2UzM2UyNjQ2OGJhOTMgXAotICAgIGZpbGU6Ly9zcmMvcG9l
dHJ5L2NvcmUvX3ZlbmRvci9wYWNrYWdpbmcvTElDRU5TRS5CU0Q7bWQ1PTdiZWY5YmY0YThlNDI2
MzYzNGQwNTk3ZTdiYTEwMGI4IFwKLSAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3Iv
dG9tbGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3ZGYwMTEwZDFhYThjOGM5ZjQ2ZjUgXAotIgor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NzhjMzljZmQwMDk4NjNhZTQ0
MjM3YTdhYjFmOWNlZGMgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BvZXRyeS9j
b3JlL192ZW5kb3IvZmFzdGpzb25zY2hlbWEvTElDRU5TRTttZDU9MTg5NTBlODM2MmI2OWMwYzYx
N2I0MmI4YmQ4ZTc1MzIgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BvZXRyeS9j
b3JlL192ZW5kb3IvbGFyay9MSUNFTlNFO21kNT1iYTVlZGY4ZDYwY2Y0MTZiNTU4OGIxZTZmMTUy
ZmNlZiBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRv
ci9wYWNrYWdpbmcvTElDRU5TRTttZDU9ZmFhZGFlZGNhOTI1MWE5MGIyMDVjOTE2NzU3OGNlOTEg
XAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvcGFj
a2FnaW5nL0xJQ0VOU0UuQVBBQ0hFO21kNT0yZWU0MTExMmE0NGZlNzAxNGRjZTMzZTI2NDY4YmE5
MyBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9w
YWNrYWdpbmcvTElDRU5TRS5CU0Q7bWQ1PTdiZWY5YmY0YThlNDI2MzYzNGQwNTk3ZTdiYTEwMGI4
IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9wb2V0cnkvY29yZS9fdmVuZG9yL3Rv
bWxpL0xJQ0VOU0U7bWQ1PWFhYWFmMDg3OWQxN2RmMDExMGQxYWE4YzhjOWY0NmY1IFwKKyAgICAg
ICAgICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTdlNTBkODU5M2M4NzI5
ZDNmNDkzNjRiNDI4NTgzZTA0NDA4N2VlM2RlZjFlMDEwYzY0OTZkYjc2YmQ2NWFjNSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI5NmY3OTFkNWQ3ZDRlMDQwZjM5ODNkNzY3Nzk0MjVjZjk1MzI2OTBl
Mjc1NmEyNGZkNWNhMGY4NmFmMTllZjgyIgogCiBpbmhlcml0IHB5dGhvbl9wb2V0cnlfY29yZSBw
eXBpCiAKLS0gCjIuNDcuMQoK

--===============5323125440953597649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core: PV changed from "2.2.1" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.2.1.tar.gz;downloadfilename=poetry_core-2.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.3.1.tar.gz;downloadfilename=poetry_core-2.3.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-poetry-core: PKGV changed from 2.2.1 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.2.1" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.2.1 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.2.1" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.2.1 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.2.1" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.2.1 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.2.1" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.2.1 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.2.1" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.2.1 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.2.1" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.2.1 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.2.1" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2762528 to 2788311 (+1%)
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.2.1 [default] to 2.3.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info

--===============5323125440953597649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1953 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-22eaf0fb709f902616c62fe699e1bc7f0e26413a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:22eaf0fb709f902616c62fe699e1bc7f0e26413a"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 413 Local 398 Mirrors 0 Missed 15 Current 252 (96% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 262 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 265 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 269 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 282 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 294 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 302 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 327 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pip-26.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pip-26.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pip-26.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pip-26.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pip-26.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pip-26.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pip-26.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 340 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: Running task 706 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_recipe_qa)
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pip-26.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pip-26.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pip-26.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 341 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pip-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 891 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pip/26.0/temp/log.do_packagedata_setscene.408843
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 371 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_package_setscene)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_fetch: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 939 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_unpack)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 975 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 412 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_patch: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1003 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1009 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1010 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_populate_lic)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1016 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1017 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_populate_lic: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-26.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 455 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1103 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 1125 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 504 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 520 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1141 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-26.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 547 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pip-26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1223 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 600 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 621 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1317 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1714 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1734 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.0.bb:do_packagedata)
NOTE: Running task 1865 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-26.0-r0: task do_packagedata: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pip-26.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1877 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_configure)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_configure: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1878 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_compile)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_compile: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1879 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_install)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_install: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 1880 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_package)
NOTE: Running task 1881 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_populate_sysroot)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package: Succeeded
NOTE: Running task 1882 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_packagedata)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_packagedata: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1883 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_create_spdx)
NOTE: Running task 1884 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_package_write_ipk)
NOTE: Running task 1885 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_package_write_deb)
NOTE: Running task 1886 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_package_write_rpm)
NOTE: Running task 1887 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_package_qa)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_create_spdx: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package_qa: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1888 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_create_package_spdx)
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_create_package_spdx: Started
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-poetry-core-2.3.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1889 of 1889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1889 tasks of which 1858 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:26.0.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-pip-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:26.0.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-pip-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:26.0.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-pip-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:26.0.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-pip-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:26.0.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-pip-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:26.0.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-pip-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:26.0.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-pip-26.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5323125440953597649==--

