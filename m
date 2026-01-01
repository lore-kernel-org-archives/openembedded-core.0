Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8699FEEB596
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102974.1767267476398781884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ztvx9Uph;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mdM9wzDt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b79599f19-1f057095-09af-4ebd-93da-c81b91abcda0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VmxGnHClP5eBt/32X9qgLAjqIX7jWf5gG8zWMT9e7hg=;
	b=Ztvx9UphSYSLERG1UmtnZUT1dtFcDXLSHRdA3fufOXD7bP7EiHZPzJUwJrboeEIZ
	z0Vf8PA3KZ0CiQeY3VqBccSfT+l1Cp9407tiklJWc6FwFgBO/Kx3+HNTHYa6064dgHC
	LmlE7uTJq3gGV+LfOG/G4IBql7I3u1gnfRF9Umxs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VmxGnHClP5eBt/32X9qgLAjqIX7jWf5gG8zWMT9e7hg=;
	b=mdM9wzDt6gwLo0t+HEKlPjfamgWlVz2L69ct0N3beVnjnkNecHGuSGpqhXz9Xcnh
	4/fYslH/wMMt/p9TsrTm2naoQTWzQcMbHziA6p37YbyTXmaxP9d2qZUF3+7ohoFplso
	ApJIMxdXUT2wiFibUyTm+73IFSepQh6orQYakKFA=
Content-Type: multipart/mixed; boundary="===============7518938564264344443=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 6.0.1 SUCCEEDED
Message-ID: <0101019b79599f19-1f057095-09af-4ebd-93da-c81b91abcda0-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228782

--===============7518938564264344443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *6.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-5.0.0-6.0.1.patch
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
From 730b7b97c98329a669d547a5ca7ae30cd15c1d26 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 08:17:15 +0000
Subject: [PATCH] python3-uritools: upgrade 5.0.0 -> 6.0.1

---
 .../{python3-uritools_5.0.0.bb => python3-uritools_6.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_5.0.0.bb => python3-uritools_6.0.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-uritools_5.0.0.bb b/meta/recipes-devtools/python/python3-uritools_6.0.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-uritools_5.0.0.bb
rename to meta/recipes-devtools/python/python3-uritools_6.0.1.bb
index 35a8f2a0d9..718de87eab 100644
--- a/meta/recipes-devtools/python/python3-uritools_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
 
-SRC_URI[sha256sum] = "68180cad154062bd5b5d9ffcdd464f8de6934414b25462ae807b00b8df9345de"
+SRC_URI[sha256sum] = "2f9e9cb954e7877232b2c863f724a44a06eb98d9c7ebdd69914876e9487b94f8"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============7518938564264344443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-5.0.0.tar.gz;downloadfilename=uritools-5.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.0.1.tar.gz;downloadfilename=uritools-6.0.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-uritools: PKGV changed from 5.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools: PV changed from "5.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 5.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "5.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 5.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "5.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 5.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "5.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 5.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "5.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGV changed from 5.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 46843 to 47222 (+1%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PV changed from "5.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 5.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PV changed from "5.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 5.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "5.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGV changed from 5.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 64794 to 64834 (+0%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PV changed from "5.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info -> /usr/lib/python3.13/site-packages/uritools-6.0.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/uritools-6.0.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info moved to /usr/lib/python3.13/site-packages/uritools-6.0.1.dist-info

--===============7518938564264344443==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-5.0.0-6.0.1.patch"

RnJvbSA3MzBiN2I5N2M5ODMyOWE2NjlkNTQ3YTVjYTdhZTMwY2QxNWMxZDI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwODoxNzoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJpdG9vbHM6IHVwZ3JhZGUgNS4wLjAgLT4gNi4wLjEKCi0tLQogLi4uL3tweXRob24z
LXVyaXRvb2xzXzUuMC4wLmJiID0+IHB5dGhvbjMtdXJpdG9vbHNfNi4wLjEuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cml0b29sc181LjAuMC5iYiA9
PiBweXRob24zLXVyaXRvb2xzXzYuMC4xLmJifSAoNzYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc181LjAuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc182LjAuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDc2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXJpdG9vbHNfNS4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11cml0b29sc182LjAuMS5iYgppbmRleCAzNWE4ZjJhMGQ5Li43MThkZTg3ZWFi
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9v
bHNfNS4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVy
aXRvb2xzXzYuMC4xLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vdGtlbS91cml0b29scy8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWUyMWJiZTUzYjI3MzBiZmUxOTExY2YzODFiODE4MjFlIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjgxODBjYWQxNTQwNjJiZDViNWQ5ZmZjZGQ0NjRmOGRl
NjkzNDQxNGIyNTQ2MmFlODA3YjAwYjhkZjkzNDVkZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIy
ZjllOWNiOTU0ZTc4NzcyMzJiMmM4NjNmNzI0YTQ0YTA2ZWI5OGQ5YzdlYmRkNjk5MTQ4NzZlOTQ4
N2I5NGY4IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVz
dC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============7518938564264344443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info -> /usr/lib/python3.13/site-packages/uritools-6.0.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/uritools-6.0.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info moved to /usr/lib/python3.13/site-packages/uritools-6.0.1.dist-info

--===============7518938564264344443==--

