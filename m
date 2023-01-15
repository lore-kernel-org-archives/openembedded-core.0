Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D04CC77B61
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.145712.1673805743392184105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dRiSUYVV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185b698c2f1-ccf19545-afeb-4ed8-be93-75adcae75308-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k5Y7qM+xnkcpyaVanx9lOADre1mtnysVfCGXLflduSo=;
	b=dRiSUYVViCbQpFxeRyXEK5YE6JsJZfR4wf/3d9BvBjXwhU6wrIbYC4c6fMUzC8z3
	KN2O0UpkrtESD+MzTUhp2RkB4GLatyCESaT7Pp76SlbN1rpfE6xaxdrvdpFk8nmLSjI
	2OolM4+7Rmya73M15gSC/r/h7XwncTTotv53l39Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k5Y7qM+xnkcpyaVanx9lOADre1mtnysVfCGXLflduSo=;
	b=HjwVjhfnJ/OUeqI53yf2f6K9plFgZ2YD3CB0/OrjMo+kWTGI16Sf2WePMwuSDOV9
	BB58NrQKr6d+8fYQCKUqFPuRiUy6kATMvesGR3wr2dyZ3AOaPcsODswSBuhZa5Jul2M
	uoALF/tQQid1XxUkBZXdn2Lt7dtPLEFVnAI6yLns=
Content-Type: multipart/mixed; boundary="===============0434582095346110466=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-alabaster: upgrading to 0.7.13 SUCCEEDED
Message-ID: <01010185b698c2f1-ccf19545-afeb-4ed8-be93-75adcae75308-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175895

--===============0434582095346110466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-alabaster* to *0.7.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-alabaster-upgrade-0.7.12-0.7.13.patch
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
--===============0434582095346110466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-alabaster: PKGV changed from 0.7.12 [default] to 0.7.13 [default]
packages/core2-32-poky-linux/python3-alabaster: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/alabaster/alabaster-0.7.12.tar.gz" to "https://files.pythonhosted.org/packages/source/a/alabaster/alabaster-0.7.13.tar.gz"
packages/core2-32-poky-linux/python3-alabaster: PV changed from "0.7.12" to "0.7.13"
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-dbg: PKGV changed from 0.7.12 [default] to 0.7.13 [default]
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-dbg: PV changed from "0.7.12" to "0.7.13"
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-dev: PKGV changed from 0.7.12 [default] to 0.7.13 [default]
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-dev: PV changed from "0.7.12" to "0.7.13"
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-doc: PKGV changed from 0.7.12 [default] to 0.7.13 [default]
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-doc: PV changed from "0.7.12" to "0.7.13"
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-locale: PKGV changed from 0.7.12 [default] to 0.7.13 [default]
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-locale: PV changed from "0.7.12" to "0.7.13"
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-src: PKGV changed from 0.7.12 [default] to 0.7.13 [default]
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-src: PV changed from "0.7.12" to "0.7.13"
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-staticdev: PKGV changed from 0.7.12 [default] to 0.7.13 [default]
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster-staticdev: PV changed from "0.7.12" to "0.7.13"
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster: PKGV changed from 0.7.12 [default] to 0.7.13 [default]
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster: PKGSIZE changed from 41215 to 42187 (+2%)
packages/core2-32-poky-linux/python3-alabaster/python3-alabaster: PV changed from "0.7.12" to "0.7.13"
Changes to packages/core2-32-poky-linux/python3-alabaster (sysroot):
  /usr/lib/python3.11/site-packages/alabaster-0.7.12.dist-info moved to /usr/lib/python3.11/site-packages/alabaster-0.7.13.dist-info

--===============0434582095346110466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-alabaster (sysroot):
  /usr/lib/python3.11/site-packages/alabaster-0.7.12.dist-info moved to /usr/lib/python3.11/site-packages/alabaster-0.7.13.dist-info

--===============0434582095346110466==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-alabaster-upgrade-0.7.12-0.7.13.patch"

RnJvbSA4M2Y1YzZhNDljN2M4ZmUyZjE2MzJiOTY2OGQyN2U3MGU3MTZmMzA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMDk6NTA6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWFsYWJhc3RlcjogdXBncmFkZSAwLjcuMTIgLT4gMC43LjEzCgotLS0KIC4uLl8wLjcu
MTIuYmIgPT4gcHl0aG9uMy1hbGFiYXN0ZXJfMC43LjEzLmJifSB8IDIzICsrKysrKysrKysrKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYWxhYmFzdGVyXzAu
Ny4xMi5iYiA9PiBweXRob24zLWFsYWJhc3Rlcl8wLjcuMTMuYmJ9ICgyOSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFsYWJhc3Rlcl8wLjcuMTIu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYWxhYmFzdGVyXzAuNy4x
My5iYgpzaW1pbGFyaXR5IGluZGV4IDI5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYWxhYmFzdGVyXzAuNy4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFsYWJhc3Rlcl8wLjcuMTMuYmIKaW5kZXggMzM4
MWNlOTU2OC4uOTQ5ZDUyZDY1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWFsYWJhc3Rlcl8wLjcuMTIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWFsYWJhc3Rlcl8wLjcuMTMuYmIKQEAgLTEsMTAgKzEsMjkgQEAK
KyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBi
eSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRl
IHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBp
bgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4
YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMg
VGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDQg
KzEsNCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDE4IEplZmYgRm9yY2llci4KKyMgK0NvcHlyaWdo
dCAoYykgMjAyMCBKZWZmIEZvcmNpZXIuCisjICAKKyMgIEJhc2VkIG9uIG9yaWdpbmFsIHdvcmsg
Y29weXJpZ2h0IChjKSAyMDExIEtlbm5ldGggUmVpdHogYW5kIGNvcHlyaWdodCAoYykgMjAxMAor
IyAgQXJtaW4gUm9uYWNoZXIuCisjIAorIworCiBERVNDUklQVElPTiA9ICJBbGFiYXN0ZXIgaXMg
YSB2aXN1YWxseSAoYylsZWFuLCByZXNwb25zaXZlLCBjb25maWd1cmFibGUgdGhlbWUgZm9yIHRo
ZSBTcGhpbnggZG9jdW1lbnRhdGlvbiBzeXN0ZW0uIEl0IGlzIFB5dGhvbiAyKzMgY29tcGF0aWJs
ZS4iCiBIT01FUEFHRSA9ICJodHRwczovL2FsYWJhc3Rlci5yZWFkdGhlZG9jcy5pby9lbi9sYXRl
c3QvIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIK
LUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWRhMDUzNjgzZDY2ZDU0Mzgx
M2E3MjdlOGEzMGM5NmNhIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
MjE4NjBmZGI4MDViZjRlMGJmYWY5NGI1NjZiNzQ3ZmEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJhNjYxZDcyZDU4ZTZlYThhNTdmN2E4NmUzN2Q4NjcxNjg2M2VlNWU5Mjc4ODM5ODUyNmQ1OGIy
NmE0ZTRkYzAyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEyN2E0YTA4NGQ1ZTY5MGUxNmUwMWUw
M2FkMmIyZTU1MmM2MWE2NTQ2OTQxOWI5MDcyNDMxOTNkZTFhODRhZTIiCiAKIGluaGVyaXQgc2V0
dXB0b29sczMgcHlwaQogCi0tIAoyLjM3LjMKCg==

--===============0434582095346110466==--

