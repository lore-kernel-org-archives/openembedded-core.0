Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C791C10DCE
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8481.1698848703574249006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CGWX7QhT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P0ZtUDDy;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b46081c-aad0a159-d33f-438c-a252-bbc6a92271dd-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IHAw83vUaSrFYGuBYORIxqlexu4/Fs20lXDbblGwb4c=;
	b=CGWX7QhTHuNsa3qD6Tl7+2LI0ZREjyCHYiaOOyl7GUQS/RsUAr1VPMl62J0kKpy/
	o+wELmIwn19eBoWPkI6iA+MzL8U3C7Pckrmkw76mZclKXDvnGy/0p9OElxAQxLsHGWM
	jGPX4uR4fuS9RG0TrokF2GoUkoVJxMCU48bPpJQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IHAw83vUaSrFYGuBYORIxqlexu4/Fs20lXDbblGwb4c=;
	b=P0ZtUDDyKlfHcP/+zydkCWTjwl0wHwWkeHiLh5CYVH2gnZe6W0tEuW03UzReSa14
	kph5rhwnj/3OX36JpvjBH/f7e43RTmSx9i+QzMUCAR0uDisNa1NWoNwGnWwyXYfgcgI
	jSVDz3ZxtEHEVn3pmJaEnkt2MepmBP6rjNVU7sow=
Content-Type: multipart/mixed; boundary="===============5248834087557729408=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.2.9 SUCCEEDED
Message-ID: <0101018b8b46081c-aad0a159-d33f-438c-a252-bbc6a92271dd-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189977

--===============5248834087557729408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wcwidth* to *0.2.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.2.8-0.2.9.patch
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

-- >8 --
From 14d0e5bcecbc917dfed8699fd05b98532f884286 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:40:53 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.2.8 -> 0.2.9

---
 .../{python3-wcwidth_0.2.8.bb => python3-wcwidth_0.2.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.8.bb => python3-wcwidth_0.2.9.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.9.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.9.bb
index e906a6d73a..983852d07d 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "8705c569999ffbb4f6a87c6d1b80f324bd6db952f5eb0b95bc07517f4c1813d4"
+SRC_URI[sha256sum] = "a675d1a4a2d24ef67096a04b85b02deeecd8e226f57b5e3a72dbb9ed99d27da8"
 
 inherit pypi setuptools3 ptest
 
-- 
2.39.2


--===============5248834087557729408==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.2.8-0.2.9.patch"

RnJvbSAxNGQwZTViY2VjYmM5MTdkZmVkODY5OWZkMDViOTg1MzJmODg0Mjg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOTo0MDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2N3aWR0aDogdXBncmFkZSAwLjIuOCAtPiAwLjIuOQoKLS0tCiAuLi4ve3B5dGhvbjMt
d2N3aWR0aF8wLjIuOC5iYiA9PiBweXRob24zLXdjd2lkdGhfMC4yLjkuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdjd2lkdGhfMC4yLjguYmIgPT4g
cHl0aG9uMy13Y3dpZHRoXzAuMi45LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuMi44LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC4yLjkuYmIKc2ltaWxhcml0eSBpbmRl
eCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdj
d2lkdGhfMC4yLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13Y3dpZHRoXzAuMi45LmJiCmluZGV4IGU5MDZhNmQ3M2EuLjk4Mzg1MmQwN2QgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuMi44
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAu
Mi45LmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vanF1
YXN0L3djd2lkdGgiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PWIxNTk3OWMzOWEyNTQzODkyZmNhOGNkODZiNGI1MmNiIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiODcwNWM1Njk5OTlmZmJiNGY2YTg3YzZkMWI4MGYzMjRiZDZkYjk1MmY1
ZWIwYjk1YmMwNzUxN2Y0YzE4MTNkNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNjc1ZDFhNGEy
ZDI0ZWY2NzA5NmEwNGI4NWIwMmRlZWVjZDhlMjI2ZjU3YjVlM2E3MmRiYjllZDk5ZDI3ZGE4Igog
CiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMgcHRlc3QKIAotLSAKMi4zOS4yCgo=

--===============5248834087557729408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-wcwidth: PKGV changed from 0.2.8 [default] to 0.2.9 [default]
packages/core2-64-poky-linux/python3-wcwidth: PV changed from "0.2.8" to "0.2.9"
packages/core2-64-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.8.tar.gz;downloadfilename=wcwidth-0.2.8.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.9.tar.gz;downloadfilename=wcwidth-0.2.9.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.2.8 [default] to 0.2.9 [default]
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.2.8" to "0.2.9"
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.2.8 [default] to 0.2.9 [default]
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.2.8" to "0.2.9"
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.2.8 [default] to 0.2.9 [default]
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.2.8" to "0.2.9"
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.2.8 [default] to 0.2.9 [default]
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.2.8" to "0.2.9"
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 8585 to 20803 (+142%)
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.2.8 [default] to 0.2.9 [default]
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.2.8" to "0.2.9"
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.2.8 [default] to 0.2.9 [default]
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.2.8" to "0.2.9"
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.2.8 [default] to 0.2.9 [default]
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.2.8" to "0.2.9"
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 534989 to 534148 (-0%)
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.2.8 [default] to 0.2.9 [default]
packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.2.8" to "0.2.9"
Changes to packages/core2-64-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.8.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.9.dist-info

--===============5248834087557729408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 8585 to 20803 (+142%)
Changes to packages/core2-64-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.8.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.9.dist-info

--===============5248834087557729408==--

