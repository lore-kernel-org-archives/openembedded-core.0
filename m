Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622A7D172B4
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29189.1769951567213826413
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mig6DjW1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PBBqokfe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c1955a9d9-4d7f9a9a-1ab5-4fc2-b103-d9f05e850977-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aFOjN6qUqr0NEr7bfExzVEIaohDVenRs1gcf+P7hN+k=;
	b=mig6DjW1AYyJZlhY+uc8x/5jOvr37yecu913J8Zw+rrebqWzJoEZjMEbac7urK8m
	pvHjCTLejn7d7kqQQjEk23f9bl5UVOZvu93w9mZx8Z9TwZgT8ch0Ajv6VhL7Daqdw6L
	qmHPdCn3OoctBSPRfeg9NWCDEaFip9CbutDT3ZOs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aFOjN6qUqr0NEr7bfExzVEIaohDVenRs1gcf+P7hN+k=;
	b=PBBqokfeO7q2crCASCj9oc983fqPLwPXgVzpLSnK+Lnx0/O69sY3xQiYJlRwROfD
	+1/Kfy2O6oLbjv0C/hBtueZzFd8RL03I81jHmW/dvdP6v2mAy7YyMEs1aUNPMJ2TfQT
	qMytwB4ZYOy3JmawUblAQpNTpGPtuxK6gbSVeyxk=
Content-Type: multipart/mixed; boundary="===============8433225420942411248=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.3.0 SUCCEEDED
Message-ID: <0101019c1955a9d9-4d7f9a9a-1ab5-4fc2-b103-d9f05e850977-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230289

--===============8433225420942411248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpweXRob24zLXBvZXRyeS1jb3JlKiB0byAqMi4zLjAqIGhhcyBTdWNjZWVkZWQuCgpOZXh0
IHN0ZXBzOgogICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXB5dGhvbjMtcG9ldHJ5
LWNvcmUtdXBncmFkZS0yLjIuMS0yLjMuMC5wYXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0
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
ZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJvbSA5YzY0ZTc5ODE1N2MyNzljYTNjODE3NTAy
ZjVhZjQ3ZmIyMDhhMGJiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhl
bHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwODo1Njow
MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjMtcG9ldHJ5LWNvcmU6IHVwZ3JhZGUgMi4y
LjEgLT4gMi4zLjAKCi0tLQogLi4uXzIuMi4xLmJiID0+IHB5dGhvbjMtcG9ldHJ5LWNvcmVfMi4z
LjAuYmJ9IHwgNjkgKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDU5IGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24ve3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4yLjEuYmIgPT4gcHl0aG9uMy1wb2V0cnktY29y
ZV8yLjMuMC5iYn0gKDE3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCAxNyUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1j
b3JlXzIuMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcG9ldHJ5LWNvcmVfMi4zLjAuYmIKaW5kZXggNDVhZjg3NjhlOS4uYmUwZGMxMTVjYSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3Jl
XzIuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0
cnktY29yZV8yLjMuMC5iYgpAQCAtMSwzICsxLDUzIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVT
X0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisj
IFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUg
bmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBu
ZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdl
IHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6
IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0g
c3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvbGFyay9MSUNFTlNFCisjICsrKyBzcmMvcG9ldHJ5L2Nv
cmUvX3ZlbmRvci9sYXJrL0xJQ0VOU0UKKyMgQEAgLTEsMTggKzEsMTggQEAKKyMgLUNvcHlyaWdo
dCDCqSAyMDE3IEVyZXogU2hpbmFuCisjIC0KKyMgLVBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50
ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkgb2YKKyMg
LXRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJT
b2Z0d2FyZSIpLCB0byBkZWFsIGluCisjIC10aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlv
biwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzIHRvCisjIC11c2UsIGNv
cHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9v
ciBzZWxsIGNvcGllcyBvZgorIyAtdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMg
dG8gd2hvbSB0aGUgU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLAorIyAtc3ViamVjdCB0
byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjIC0KKyMgLVRoZSBhYm92ZSBjb3B5cmlnaHQg
bm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFs
bAorIyAtY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMg
LQorIyAtVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkg
T0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgLUlNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJ
TUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTCisjIC1G
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5U
IFNIQUxMIFRIRSBBVVRIT1JTIE9SCisjIC1DT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9S
IEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIKKyMgLUlOIEFO
IEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VU
IE9GIE9SIElOCisjIC1DT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1Ig
T1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorIyArQ29weXJpZ2h0IMKpIDIwMTcgRXJl
eiBTaGluYW4KKyMgKworIyArUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBj
aGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weSBvZgorIyArdGhpcyBzb2Z0d2Fy
ZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRv
IGRlYWwgaW4KKyMgK3RoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcg
d2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMgdG8KKyMgK3VzZSwgY29weSwgbW9kaWZ5LCBt
ZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwgY29waWVz
IG9mCisjICt0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBT
b2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sCisjICtzdWJqZWN0IHRvIHRoZSBmb2xsb3dp
bmcgY29uZGl0aW9uczoKKyMgKworIyArVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRo
aXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4gYWxsCisjICtjb3BpZXMg
b3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyArCisjICtUSEUgU09G
VFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwg
RVhQUkVTUyBPUgorIyArSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUg
V0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksIEZJVE5FU1MKKyMgK0ZPUiBBIFBBUlRJQ1VM
QVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwgVEhFIEFV
VEhPUlMgT1IKKyMgK0NPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBE
QU1BR0VTIE9SIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUgorIyArSU4gQU4gQUNUSU9OIE9GIENP
TlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4KKyMg
K0NPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5H
UyBJTiBUSEUgU09GVFdBUkUuCisjIAorIworCiBTVU1NQVJZID0gIlBvZXRyeSBQRVAgNTE3IEJ1
aWxkIEJhY2tlbmQiCiBERVNDUklQVElPTiA9ICJQb2V0cnkgUEVQIDUxNyBCdWlsZCBCYWNrZW5k
IgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi1wb2V0cnkvcG9ldHJ5LWNv
cmUiCkBAIC01LDE3ICs1NSwxNiBAQCBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS9w
eXRob24tcG9ldHJ5L3BvZXRyeS1jb3JlIgogQ0hBTkdFTE9HID0gImh0dHBzOi8vZ2l0aHViLmNv
bS9weXRob24tcG9ldHJ5L3BvZXRyeS1jb3JlL2Jsb2IvbWFzdGVyL0NIQU5HRUxPRy5tZCIKIAog
TElDRU5TRSA9ICJBcGFjaGUtMi4wICYgQlNELTItQ2xhdXNlICYgQlNELTMtQ2xhdXNlICYgTUlU
IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJcCi0gICAgZmlsZTovL0xJQ0VOU0U7bWQ1PTc4YzM5Y2Zk
MDA5ODYzYWU0NDIzN2E3YWIxZjljZWRjIFwKLSAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192
ZW5kb3IvZmFzdGpzb25zY2hlbWEvTElDRU5TRTttZDU9MTg5NTBlODM2MmI2OWMwYzYxN2I0MmI4
YmQ4ZTc1MzIgXAotICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9sYXJrL0xJQ0VO
U0U7bWQ1PWZjZmJmMWUyZWNjMGYzN2FjYmI1ODcxYWEwMjY3NTAwIFwKLSAgICBmaWxlOi8vc3Jj
L3BvZXRyeS9jb3JlL192ZW5kb3IvcGFja2FnaW5nL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFh
OTBiMjA1YzkxNjc1NzhjZTkxIFwKLSAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3Iv
cGFja2FnaW5nL0xJQ0VOU0UuQVBBQ0hFO21kNT0yZWU0MTExMmE0NGZlNzAxNGRjZTMzZTI2NDY4
YmE5MyBcCi0gICAgZmlsZTovL3NyYy9wb2V0cnkvY29yZS9fdmVuZG9yL3BhY2thZ2luZy9MSUNF
TlNFLkJTRDttZDU9N2JlZjliZjRhOGU0MjYzNjM0ZDA1OTdlN2JhMTAwYjggXAotICAgIGZpbGU6
Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci90b21saS9MSUNFTlNFO21kNT1hYWFhZjA4NzlkMTdk
ZjAxMTBkMWFhOGM4YzlmNDZmNSBcCi0iCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT03OGMzOWNmZDAwOTg2M2FlNDQyMzdhN2FiMWY5Y2VkYyBcCisgICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9mYXN0anNvbnNjaGVtYS9MSUNF
TlNFO21kNT0xODk1MGU4MzYyYjY5YzBjNjE3YjQyYjhiZDhlNzUzMiBcCisgICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9sYXJrL0xJQ0VOU0U7bWQ1PWJh
NWVkZjhkNjBjZjQxNmI1NTg4YjFlNmYxNTJmY2VmIFwKKyAgICAgICAgICAgICAgICAgICAgZmls
ZTovL3NyYy9wb2V0cnkvY29yZS9fdmVuZG9yL3BhY2thZ2luZy9MSUNFTlNFO21kNT1mYWFkYWVk
Y2E5MjUxYTkwYjIwNWM5MTY3NTc4Y2U5MSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9z
cmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9wYWNrYWdpbmcvTElDRU5TRS5BUEFDSEU7bWQ1PTJlZTQx
MTEyYTQ0ZmU3MDE0ZGNlMzNlMjY0NjhiYTkzIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTov
L3NyYy9wb2V0cnkvY29yZS9fdmVuZG9yL3BhY2thZ2luZy9MSUNFTlNFLkJTRDttZDU9N2JlZjli
ZjRhOGU0MjYzNjM0ZDA1OTdlN2JhMTAwYjggXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
c3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvdG9tbGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3ZGYw
MTEwZDFhYThjOGM5ZjQ2ZjUgXAorICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI5N2U1MGQ4NTkzYzg3MjlkM2Y0OTM2NGI0Mjg1ODNlMDQ0MDg3ZWUzZGVmMWUw
MTBjNjQ5NmRiNzZiZDY1YWM1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY2ZGE4ZjAyMWZlMzgw
ZDhjOTcxNjA4NWY0ZGNjNWQyNmE1MTIwYTI0NTJlMDc3MTk2MzMzODkyYWY1ZGUzMDciCiAKIGlu
aGVyaXQgcHl0aG9uX3BvZXRyeV9jb3JlIHB5cGkKIAotLSAKMi40Ny4xCgo=

--===============8433225420942411248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.3.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.3.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.0.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.0.dist-info

--===============8433225420942411248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1958 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-f235c3092c6bab3eae25a46d7e61b91670f82632"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:f235c3092c6bab3eae25a46d7e61b91670f82632"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 410 Local 386 Mirrors 0 Missed 24 Current 255 (94% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 286 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 303 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 305 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 340 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_recipe_qa_setscene)
NOTE: Running task 860 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pip-25.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pip-25.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Started
NOTE: Running task 980 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_fetch)
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 367 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pip-25.3-r0: task do_fetch: Started
NOTE: recipe python3-pip-25.3-r0: task do_fetch: Succeeded
NOTE: Running task 986 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_unpack)
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pip-25.3-r0: task do_unpack: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 372 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-pip-25.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 987 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 988 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_fetch)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pip-25.3-r0: task do_patch: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_fetch: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1004 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pip-25.3-r0: task do_patch: Succeeded
NOTE: Running task 1005 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_unpack: Started
NOTE: Running setscene task 403 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1017 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_patch)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pip-25.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 422 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1036 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 434 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 449 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-25.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 462 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_deploy_source_date_epoch unihash changed to e24bea443f3dba08ee5f267cc1afde018679888407f3d18cf289ad1f3d71af2c
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 474 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 476 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 482 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 483 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1069 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 509 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 510 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running task 1133 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1136 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1139 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_populate_lic)
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_populate_lic: Started
NOTE: Running setscene task 541 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 550 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 551 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 555 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 560 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1190 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1212 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1233 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1249 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1300 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 655 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 665 of 665 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1710 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1711 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1854 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_collect_spdx_deps)
NOTE: Running task 1855 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-25.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pip-25.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pip-25.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pip-25.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1856 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_configure)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1857 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_configure)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pip-25.3-r0: task do_configure: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_configure: Started
NOTE: recipe python3-pip-25.3-r0: task do_configure: Succeeded
NOTE: Running task 1858 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_compile)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1859 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_compile)
NOTE: recipe python3-pip-25.3-r0: task do_compile: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1860 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-pip-25.3-r0: task do_compile: Succeeded
NOTE: Running task 1867 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_install)
NOTE: recipe python3-pip-25.3-r0: task do_install: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1868 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_install)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_install: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 1869 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_package)
NOTE: Running task 1870 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_package: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pip-25.3-r0: task do_install: Succeeded
NOTE: Running task 1871 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_package)
NOTE: Running task 1872 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_populate_sysroot)
NOTE: recipe python3-pip-25.3-r0: task do_package: Started
NOTE: recipe python3-pip-25.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pip-25.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 1873 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_packagedata)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1874 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb:do_create_spdx)
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-poetry-core-2.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pip-25.3-r0: task do_package: Succeeded
NOTE: Running task 1875 of 1886 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_packagedata)
NOTE: recipe python3-pip-25.3-r0: task do_packagedata: Started
NOTE: recipe python3-pip-25.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1875 tasks of which 1839 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201085528.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201085528.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pip/25.3/temp/log.do_packagedata.2453525
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-25.3-r0 do_packagedata: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:26.0-r0 to 0:25.3-r0) [version-going-backwards]
ERROR: python3-pip-25.3-r0 do_packagedata: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:26.0-r0 to 0:25.3-r0) [version-going-backwards]
ERROR: python3-pip-25.3-r0 do_packagedata: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:26.0-r0 to 0:25.3-r0) [version-going-backwards]
ERROR: python3-pip-25.3-r0 do_packagedata: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:26.0-r0 to 0:25.3-r0) [version-going-backwards]
ERROR: python3-pip-25.3-r0 do_packagedata: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:26.0-r0 to 0:25.3-r0) [version-going-backwards]
ERROR: python3-pip-25.3-r0 do_packagedata: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:26.0-r0 to 0:25.3-r0) [version-going-backwards]
ERROR: python3-pip-25.3-r0 do_packagedata: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:26.0-r0 to 0:25.3-r0) [version-going-backwards]
ERROR: python3-pip-25.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pip/25.3/temp/log.do_packagedata.2453525
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_25.3.bb:do_packagedata) failed with exit code '1'

--===============8433225420942411248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core: PV changed from "2.2.1" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.2.1.tar.gz;downloadfilename=poetry_core-2.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.3.0.tar.gz;downloadfilename=poetry_core-2.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-poetry-core: PKGV changed from 2.2.1 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.2.1" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.2.1 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.2.1" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.2.1 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.2.1" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.2.1 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.2.1" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.2.1 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.2.1" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.2.1 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.2.1" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.2.1 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2762528 to 2787657 (+1%)
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.2.1" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.3.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.3.0.dist-info
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.2.1 [default] to 2.3.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.0.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.0.dist-info

--===============8433225420942411248==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.2.1-2.3.0.patch"

RnJvbSA5YzY0ZTc5ODE1N2MyNzljYTNjODE3NTAyZjVhZjQ3ZmIyMDhhMGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwODo1NjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcG9ldHJ5LWNvcmU6IHVwZ3JhZGUgMi4yLjEgLT4gMi4zLjAKCi0tLQogLi4uXzIuMi4x
LmJiID0+IHB5dGhvbjMtcG9ldHJ5LWNvcmVfMi4zLjAuYmJ9IHwgNjkgKysrKysrKysrKysrKysr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9ldHJ5LWNvcmVf
Mi4yLjEuYmIgPT4gcHl0aG9uMy1wb2V0cnktY29yZV8yLjMuMC5iYn0gKDE3JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4y
LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVf
Mi4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCAxNyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMi4xLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4zLjAuYmIKaW5k
ZXggNDVhZjg3NjhlOS4uYmUwZGMxMTVjYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjMuMC5iYgpAQCAtMSwzICsx
LDUzIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvbGFy
ay9MSUNFTlNFCisjICsrKyBzcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9sYXJrL0xJQ0VOU0UKKyMg
QEAgLTEsMTggKzEsMTggQEAKKyMgLUNvcHlyaWdodCDCqSAyMDE3IEVyZXogU2hpbmFuCisjIC0K
KyMgLVBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkg
cGVyc29uIG9idGFpbmluZyBhIGNvcHkgb2YKKyMgLXRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0
ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluCisjIC10
aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRh
dGlvbiB0aGUgcmlnaHRzIHRvCisjIC11c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gs
IGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsIGNvcGllcyBvZgorIyAtdGhlIFNv
ZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMgZnVy
bmlzaGVkIHRvIGRvIHNvLAorIyAtc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6
CisjIC0KKyMgLVRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24g
bm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbAorIyAtY29waWVzIG9yIHN1YnN0YW50aWFs
IHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMgLQorIyAtVEhFIFNPRlRXQVJFIElTIFBST1ZJ
REVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMg
LUlNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0Yg
TUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTCisjIC1GT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5E
IE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBBVVRIT1JTIE9SCisjIC1D
T1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhF
UiBMSUFCSUxJVFksIFdIRVRIRVIKKyMgLUlOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBP
UiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOCisjIC1DT05ORUNUSU9OIFdJ
VEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRX
QVJFLgorIyArQ29weXJpZ2h0IMKpIDIwMTcgRXJleiBTaGluYW4KKyMgKworIyArUGVybWlzc2lv
biBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWlu
aW5nIGEgY29weSBvZgorIyArdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0
aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4KKyMgK3RoZSBTb2Z0d2FyZSB3
aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdo
dHMgdG8KKyMgK3VzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwg
c3VibGljZW5zZSwgYW5kL29yIHNlbGwgY29waWVzIG9mCisjICt0aGUgU29mdHdhcmUsIGFuZCB0
byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8g
c28sCisjICtzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMgKworIyArVGhl
IGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwg
YmUgaW5jbHVkZWQgaW4gYWxsCisjICtjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2Yg
dGhlIFNvZnR3YXJlLgorIyArCisjICtUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwg
V0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorIyArSU1QTElFRCwgSU5D
TFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJ
VFksIEZJVE5FU1MKKyMgK0ZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VN
RU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwgVEhFIEFVVEhPUlMgT1IKKyMgK0NPUFlSSUdIVCBIT0xE
RVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSIExJQUJJTElUWSwg
V0hFVEhFUgorIyArSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwg
QVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4KKyMgK0NPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdB
UkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCisjIAorIwor
CiBTVU1NQVJZID0gIlBvZXRyeSBQRVAgNTE3IEJ1aWxkIEJhY2tlbmQiCiBERVNDUklQVElPTiA9
ICJQb2V0cnkgUEVQIDUxNyBCdWlsZCBCYWNrZW5kIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL3B5dGhvbi1wb2V0cnkvcG9ldHJ5LWNvcmUiCkBAIC01LDE3ICs1NSwxNiBAQCBCVUdU
UkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24tcG9ldHJ5L3BvZXRyeS1jb3JlIgog
Q0hBTkdFTE9HID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24tcG9ldHJ5L3BvZXRyeS1jb3Jl
L2Jsb2IvbWFzdGVyL0NIQU5HRUxPRy5tZCIKIAogTElDRU5TRSA9ICJBcGFjaGUtMi4wICYgQlNE
LTItQ2xhdXNlICYgQlNELTMtQ2xhdXNlICYgTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJcCi0g
ICAgZmlsZTovL0xJQ0VOU0U7bWQ1PTc4YzM5Y2ZkMDA5ODYzYWU0NDIzN2E3YWIxZjljZWRjIFwK
LSAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvZmFzdGpzb25zY2hlbWEvTElDRU5T
RTttZDU9MTg5NTBlODM2MmI2OWMwYzYxN2I0MmI4YmQ4ZTc1MzIgXAotICAgIGZpbGU6Ly9zcmMv
cG9ldHJ5L2NvcmUvX3ZlbmRvci9sYXJrL0xJQ0VOU0U7bWQ1PWZjZmJmMWUyZWNjMGYzN2FjYmI1
ODcxYWEwMjY3NTAwIFwKLSAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvcGFja2Fn
aW5nL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFhOTBiMjA1YzkxNjc1NzhjZTkxIFwKLSAgICBm
aWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvcGFja2FnaW5nL0xJQ0VOU0UuQVBBQ0hFO21k
NT0yZWU0MTExMmE0NGZlNzAxNGRjZTMzZTI2NDY4YmE5MyBcCi0gICAgZmlsZTovL3NyYy9wb2V0
cnkvY29yZS9fdmVuZG9yL3BhY2thZ2luZy9MSUNFTlNFLkJTRDttZDU9N2JlZjliZjRhOGU0MjYz
NjM0ZDA1OTdlN2JhMTAwYjggXAotICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci90
b21saS9MSUNFTlNFO21kNT1hYWFhZjA4NzlkMTdkZjAxMTBkMWFhOGM4YzlmNDZmNSBcCi0iCitM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03OGMzOWNmZDAwOTg2M2FlNDQy
MzdhN2FiMWY5Y2VkYyBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2Nv
cmUvX3ZlbmRvci9mYXN0anNvbnNjaGVtYS9MSUNFTlNFO21kNT0xODk1MGU4MzYyYjY5YzBjNjE3
YjQyYjhiZDhlNzUzMiBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2Nv
cmUvX3ZlbmRvci9sYXJrL0xJQ0VOU0U7bWQ1PWJhNWVkZjhkNjBjZjQxNmI1NTg4YjFlNmYxNTJm
Y2VmIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9wb2V0cnkvY29yZS9fdmVuZG9y
L3BhY2thZ2luZy9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUxYTkwYjIwNWM5MTY3NTc4Y2U5MSBc
CisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3ZlbmRvci9wYWNr
YWdpbmcvTElDRU5TRS5BUEFDSEU7bWQ1PTJlZTQxMTEyYTQ0ZmU3MDE0ZGNlMzNlMjY0NjhiYTkz
IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9wb2V0cnkvY29yZS9fdmVuZG9yL3Bh
Y2thZ2luZy9MSUNFTlNFLkJTRDttZDU9N2JlZjliZjRhOGU0MjYzNjM0ZDA1OTdlN2JhMTAwYjgg
XAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192ZW5kb3IvdG9t
bGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3ZGYwMTEwZDFhYThjOGM5ZjQ2ZjUgXAorICAgICAg
ICAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5N2U1MGQ4NTkzYzg3Mjlk
M2Y0OTM2NGI0Mjg1ODNlMDQ0MDg3ZWUzZGVmMWUwMTBjNjQ5NmRiNzZiZDY1YWM1IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImY2ZGE4ZjAyMWZlMzgwZDhjOTcxNjA4NWY0ZGNjNWQyNmE1MTIwYTI0
NTJlMDc3MTk2MzMzODkyYWY1ZGUzMDciCiAKIGluaGVyaXQgcHl0aG9uX3BvZXRyeV9jb3JlIHB5
cGkKIAotLSAKMi40Ny4xCgo=

--===============8433225420942411248==--

