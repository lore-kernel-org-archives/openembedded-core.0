Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B392C63715
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.24228.1665871395237199289
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hGhVQvgJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddac35a1-5a64c2b1-9297-4227-bdf9-e812b456c666-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UkgFggtnX2LScf+HxQIV2opcSP7SSF9CGhUKURB+3u4=;
	b=hGhVQvgJd8BhpSYFJ5s4wqNKJmMRcNK9TtXy4gwObQPTpMioN+OyuIOw54vuaofl
	bzltfkouhNqbTQU8Iig0/mJEkhtVmRp3iaBdMwAZmhm7OhIyge9P5Jlp/tIJilmoKql
	nhqtLLPalsWJ05ESAsjbM8PsXlPhDzfxmfB1ufKM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UkgFggtnX2LScf+HxQIV2opcSP7SSF9CGhUKURB+3u4=;
	b=IhhDrvdtU1ITAeW6BfpQfXorIWR9NfmfjmrBkgvXDEyOgaVlY2MExAMWnbenuwx0
	VSnxtAnLzh3MMYuUfF3RO7oVw72ayRRt+ON+5qZ8ZZWV1DqBGJ2Fwj81QHPenNWqmUm
	PN1/NEJNshuRLAdsH5DqLBjNjJVIDYZ7zEbmXvRw=
Content-Type: multipart/mixed; boundary="===============8526614078445470865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.2.6 SUCCEEDED
Message-ID: <01010183ddac35a1-5a64c2b1-9297-4227-bdf9-e812b456c666-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171808

--===============8526614078445470865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rsync* to *3.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.2.5-3.2.6.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8526614078445470865==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.2.5-3.2.6.patch"

RnJvbSBjZmMyYWM2NjdiOGNiNGQyM2MyNDc3NTMyMDFkN2Y2MjAxOTU1N2VlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTE6MjY6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
c3luYzogdXBncmFkZSAzLjIuNSAtPiAzLjIuNgoKLS0tCiAuLi4tcHJvdG90eXBlcy10by1mdW5j
dGlvbi1kZWNsYXJhdGlvbnMucGF0Y2ggfCAxNiArKysrLS0tLS0KIC4uLmFudGljLWVycm9ycy1h
dC10aGUtZW5kLW9mLWNvbmZpZ3VyZS5wYXRjaCB8IDM2ICsrKystLS0tLS0tLS0tLS0tLS0KIC4u
Li9yc3luYy97cnN5bmNfMy4yLjUuYmIgPT4gcnN5bmNfMy4yLjYuYmJ9ICB8ICAyICstCiAzIGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy97cnN5bmNfMy4yLjUuYmIgPT4gcnN5bmNfMy4yLjYu
YmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVz
LzAwMDEtQWRkLW1pc3NpbmctcHJvdG90eXBlcy10by1mdW5jdGlvbi1kZWNsYXJhdGlvbnMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1w
cm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRjaAppbmRleCA0NzRkODJkYjIy
Li45MmE3OGEwODFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmls
ZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlz
c2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNzg1YzAwNzJjODBjMmY2ZTA4Mzk0Nzg0NTNjZjY1ZmRlYWMxNWRhMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTg4MDU1NjI4NDNiNzIwZDAxNGI2NTI0MTFiMzFh
NDQwZjExYWY5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI5IEF1ZyAyMDIyIDE5OjUzOjI4IC0wNzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNzaW5nIHByb3RvdHlwZXMgdG8gZnVuY3Rpb24gZGVjbGFy
YXRpb25zCkBAIC0xNSw2ICsxNSw3IEBAIEZpeGVzIGVycm9ycyBsaWtlCiAKIFVwc3RyZWFtLVN0
YXR1czogU3VibWl0dGVkIFtodHRwczovL2xpc3RzLnNhbWJhLm9yZy9hcmNoaXZlL3JzeW5jLzIw
MjItQXVndXN0LzAzMjg1OC5odG1sXQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KKwogLS0tCiAgY2hlY2tzdW0uYyAgICAgICB8IDIgKy0KICBleGNsdWRlLmMg
ICAgICAgIHwgMiArLQpAQCAtMjksMTAgKzMwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMTAgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jaGVja3N1bS5jIGIvY2hlY2tzdW0u
YwotaW5kZXggZmI4YzBhMC4uMTc0YzI4YyAxMDA2NDQKK2luZGV4IDdlYjUwZjEuLmUwZWY1M2Ug
MTAwNjQ0CiAtLS0gYS9jaGVja3N1bS5jCiArKysgYi9jaGVja3N1bS5jCi1AQCAtNjI5LDcgKzYy
OSw3IEBAIGludCBzdW1fZW5kKGNoYXIgKnN1bSkKK0BAIC02MzEsNyArNjMxLDcgQEAgaW50IHN1
bV9lbmQoY2hhciAqc3VtKQogIAlyZXR1cm4gY3N1bV9sZW5fZm9yX3R5cGUoY3Vyc3VtX3R5cGUs
IDApOwogIH0KICAKQEAgLTQyLDcgKzQzLDcgQEAgaW5kZXggZmI4YzBhMC4uMTc0YzI4YyAxMDA2
NDQKICAjaWZkZWYgU1VQUE9SVF9YWEgzCiAgCWNoYXIgYnVmWzMyODE2XTsKIGRpZmYgLS1naXQg
YS9leGNsdWRlLmMgYi9leGNsdWRlLmMKLWluZGV4IGFkYzgyZTIuLjc5ZjVhODIgMTAwNjQ0Citp
bmRleCA1NDU4NDU1Li44N2M4OWZlIDEwMDY0NAogLS0tIGEvZXhjbHVkZS5jCiArKysgYi9leGNs
dWRlLmMKIEBAIC0zNTgsNyArMzU4LDcgQEAgdm9pZCBpbXBsaWVkX2luY2x1ZGVfcGFydGlhbF9z
dHJpbmcoY29uc3QgY2hhciAqc19zdGFydCwgY29uc3QgY2hhciAqc19lbmQpCkBAIC01Myw5ICs1
NCw5IEBAIGluZGV4IGFkYzgyZTIuLjc5ZjVhODIgMTAwNjQ0CiArdm9pZCBmcmVlX2ltcGxpZWRf
aW5jbHVkZV9wYXJ0aWFsX3N0cmluZyh2b2lkKQogIHsKICAJaWYgKHBhcnRpYWxfc3RyaW5nX2J1
ZikgewotIAkJZnJlZShwYXJ0aWFsX3N0cmluZ19idWYpOworIAkJaWYgKHBhcnRpYWxfc3RyaW5n
X2xlbikKIGRpZmYgLS1naXQgYS9obGluay5jIGIvaGxpbmsuYwotaW5kZXggNjY4MTBhMy4uNjUx
MWRmYiAxMDA2NDQKK2luZGV4IDIwMjkxZjIuLjVjMjZhNmIgMTAwNjQ0CiAtLS0gYS9obGluay5j
CiArKysgYi9obGluay5jCiBAQCAtMTE3LDggKzExNyw3IEBAIHN0YXRpYyB2b2lkIG1hdGNoX2du
dW1zKGludDMyICpuZHhfbGlzdCwgaW50IG5keF9jb3VudCkKQEAgLTE2OCw2ICsxNjksMyBAQCBp
bmRleCBiYmJhN2IyLi42MWY4ZGM5IDEwMDY0NAogIHsKICAgICAgdUxvbmcgZmxhZ3M7CiAgCi0t
LSAKLTIuMzcuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmls
ZXMvMDAwMS1UdXJuLW9uLXBlZGFudGljLWVycm9ycy1hdC10aGUtZW5kLW9mLWNvbmZpZ3VyZS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy8wMDAxLVR1cm4tb24tcGVk
YW50aWMtZXJyb3JzLWF0LXRoZS1lbmQtb2YtY29uZmlndXJlLnBhdGNoCmluZGV4IDFkOWM0YmZl
NDguLjExZmY5Mzg0MzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9m
aWxlcy8wMDAxLVR1cm4tb24tcGVkYW50aWMtZXJyb3JzLWF0LXRoZS1lbmQtb2YtY29uZmlndXJl
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy8wMDAxLVR1cm4t
b24tcGVkYW50aWMtZXJyb3JzLWF0LXRoZS1lbmQtb2YtY29uZmlndXJlLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBlNjRhNTgzODdkYjQ2MjM5OTAyYjYxMDg3MWEwZWI4MTYyNmU5OWZmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYmZmMTNkMDVhZWYyY2MwYWJjMGE5OGYxOGY4
OTY3YjYxNDY3YTA0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1bCBFZ2dlcnQg
PGVnZ2VydEBjcy51Y2xhLmVkdT4KIERhdGU6IFRodSwgMTggQXVnIDIwMjIgMDc6NDY6MjggLTA3
MDAKIFN1YmplY3Q6IFtQQVRDSF0gVHVybiBvbiAtcGVkYW50aWMtZXJyb3JzIGF0IHRoZSBlbmQg
b2YgJ2NvbmZpZ3VyZScKQEAgLTYsMzcgKzYsMTYgQEAgU3ViamVjdDogW1BBVENIXSBUdXJuIG9u
IC1wZWRhbnRpYy1lcnJvcnMgYXQgdGhlIGVuZCBvZiAnY29uZmlndXJlJwogUHJvYmxlbSByZXBv
cnRlZCBieSBLaGVtIFJhaiBpbjoKIGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9yL2F1dG9jb25mLXBh
dGNoZXMvMjAyMi0wOC9tc2cwMDAwOS5odG1sCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBb
aHR0cHM6Ly9saXN0cy5zYW1iYS5vcmcvYXJjaGl2ZS9yc3luYy8yMDIyLUF1Z3VzdC8wMzI4NjIu
aHRtbF0KKwogLS0tCi0gY29uZmlndXJlLmFjIHwgMzUgKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pCisgY29uZmlndXJlLmFjIHwgMjAgKysrKysrKysrKysrKysrKysrKysKKyAxIGZpbGUg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIv
Y29uZmlndXJlLmFjCi1pbmRleCBkMTg1YjJkMy4uN2U5NTE0ZjcgMTAwNjQ0CitpbmRleCBiNmRl
NGViLi40ZDkxNzA4IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUu
YWMKLUBAIC0xMDcxLDIxICsxMDcxLDYgQEAgZWxpZiB0ZXN0IHgiJGFjX2N2X2hlYWRlcl9wb3B0
X2giICE9IHgieWVzIjsgdGhlbgotICAgICB3aXRoX2luY2x1ZGVkX3BvcHQ9eWVzCi0gZmkKLSAK
LS1pZiB0ZXN0IHgiJEdDQyIgPSB4InllcyI7IHRoZW4KLS0gICAgaWYgdGVzdCB4IiR3aXRoX2lu
Y2x1ZGVkX3BvcHQiICE9IHgieWVzIjsgdGhlbgotLQkjIFR1cm4gcGVkYW50aWMgd2FybmluZ3Mg
aW50byBlcnJvcnMgdG8gZW5zdXJlIGFuIGFycmF5LWluaXQgb3ZlcmZsb3cgaXMgYW4gZXJyb3Iu
Ci0tCUNGTEFHUz0iJENGTEFHUyAtcGVkYW50aWMtZXJyb3JzIgotLSAgICBlbHNlCi0tCSMgT3Vy
IGludGVybmFsIHBvcHQgY29kZSBjYW5ub3QgYmUgY29tcGlsZWQgd2l0aCBwZWRhbnRpYyB3YXJu
aW5ncyBhcyBlcnJvcnMsIHNvIHRyeSB0bwotLQkjIHR1cm4gb2ZmIHBlZGFudGljIHdhcm5pbmdz
ICh3aGljaCB3aWxsIG5vdCBsb3NlIHRoZSBlcnJvciBmb3IgYXJyYXktaW5pdCBvdmVyZmxvdyku
Ci0tCSMgT2xkZXIgZ2NjIHZlcnNpb25zIGRvbid0IHVuZGVyc3RhbmQgLVduby1wZWRhbnRpYywg
c28gY2hlY2sgaWYgLS1oZWxwPXdhcm5pbmdzIGxpc3RzCi0tCSMgLVdwZWRhbnRpYyBhbmQgdXNl
IHRoYXQgYXMgYSBmbGFnLgotLQljYXNlIGAkQ0MgLS1oZWxwPXdhcm5pbmdzIDI+L2Rldi9udWxs
IHwgZ3JlcCBXcGVkYW50aWNgIGluCi0tCSAgICAqLVdwZWRhbnRpYyopIENGTEFHUz0iJENGTEFH
UyAtcGVkYW50aWMtZXJyb3JzIC1Xbm8tcGVkYW50aWMiIDs7Ci0tCWVzYWMKLS0gICAgZmkKLS1m
aQotLQotIEFDX01TR19DSEVDS0lORyhbd2hldGhlciB0byB1c2UgaW5jbHVkZWQgbGlicG9wdF0p
Ci0gaWYgdGVzdCB4IiR3aXRoX2luY2x1ZGVkX3BvcHQiID0geCJ5ZXMiOyB0aGVuCi0gICAgIEFD
X01TR19SRVNVTFQoJHNyY2Rpci9wb3B0KQotQEAgLTE0NDQsNiArMTQyOSwyNiBAQCBjYXNlICIk
Q0MiIGluCitAQCAtMTQyOSw2ICsxNDI5LDI2IEBAIGNhc2UgIiRDQyIgaW4KICAgICAgOzsKICBl
c2FjCiAgCkBAIC02Myw2ICs0MiwzIEBAIGluZGV4IGQxODViMmQzLi43ZTk1MTRmNyAxMDA2NDQK
ICBBQ19DT05GSUdfRklMRVMoW01ha2VmaWxlIGxpYi9kdW1teSB6bGliL2R1bW15IHBvcHQvZHVt
bXkgc2hjb25maWddKQogIEFDX09VVFBVVAogIAotLS0gCi0yLjM3LjEKLQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuMi41LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuMi42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjIuNS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuMi42LmJiCmluZGV4IDBiYmJh
YzdhY2UuLmI5NGY0ZTNhZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3lu
Yy9yc3luY18zLjIuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNf
My4yLjYuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Rvd25sb2FkLnNh
bWJhLm9yZy9wdWIvJHtCUE59L3NyYy8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVR1cm4tb24tcGVkYW50aWMtZXJyb3JzLWF0LXRo
ZS1lbmQtb2YtY29uZmlndXJlLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjJhYzRkMjE2MzVjZGY3OTE4NjdiYzM3N2MzNWNhNmRkYTdmNTBkOTE5YTU4YmU0NTA1
N2ZkNTE2MDBjNjlhYmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmIzMzY1YmFiMjc4MzdkNDFm
ZWFmNDJlOTY3YzU3YmQzYTQ3YmM4ZjEwNzY1YTM2NzFlZmQ2YTM4MzU0NTRkMyIKIAogIyAtMTY1
NDggcmVxdWlyZWQgZm9yIHYzLjEuM3ByZTEuIEFscmVhZHkgaW4gdjMuMS4zLgogQ1ZFX0NIRUNL
X0lHTk9SRSArPSAiIENWRS0yMDE3LTE2NTQ4ICIKLS0gCjIuMzEuMQoK

--===============8526614078445470865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/rsync: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync: SRC_URI changed from "https://download.samba.org/pub/rsync/src/rsync-3.2.5.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch" to "https://download.samba.org/pub/rsync/src/rsync-3.2.6.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch"
packages/core2-32-poky-linux/rsync: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-dbg: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-dbg: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1140620 to 1143568 (+0%)
packages/core2-32-poky-linux/rsync/rsync-dev: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-dev: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-doc: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-doc: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-doc: PKGSIZE changed from 291486 to 293817 (+1%)
packages/core2-32-poky-linux/rsync/rsync-locale: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-locale: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-src: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-src: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-src: PKGSIZE changed from 1621062 to 1622966 (+0%)
packages/core2-32-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-staticdev: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync: PKGSIZE changed from 622790 to 622726 (-0%)

--===============8526614078445470865==--

