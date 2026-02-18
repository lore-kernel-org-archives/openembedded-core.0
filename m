Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73711E9A04B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1413.1771440096559575007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NLbL/6kJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KqC1drbR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c720ee886-e523bc47-c9dc-4dc0-9a5a-f2d61344fd24-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pPSs9OORyrcFnxa8vtTiyw7B4aR7+MymJEpCRT2VIu8=;
	b=NLbL/6kJHySeCglE8ZvFMKlowHAFCEl1v1/3hgp1cTIYvPeDe65Z6vTUGRO/EJ1K
	yUWb3ggOyqWZWQ+1VyQqwU7MaWvOAAO+6d2ohpgnR557Z+06uN36l2AHrWCvRij6w7E
	tktx6tlG4sp4lMbXmiZ6z0rs8OBwx15zxJV6Bcr8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pPSs9OORyrcFnxa8vtTiyw7B4aR7+MymJEpCRT2VIu8=;
	b=KqC1drbRHMSPl1d2FuT2zMsseC/smAxq1E50zpSY60UrvkR18G5rotoS7PhChESo
	OYYs4GceEEzwRJnATJ5AXT4tvJArwyHZ3iXR3ic5rJ4GroM2TBTlA4FPMm9jDYkKZV2
	Xvfx5k9NvhCRzhs1nMCCVV1UHLTxhmWXGw/8xQX8=
Content-Type: multipart/mixed; boundary="===============3985059162681541336=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-xmltodict: upgrading to 1.0.3 SUCCEEDED
Message-ID: <0101019c720ee886-e523bc47-c9dc-4dc0-9a5a-f2d61344fd24-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231365

--===============3985059162681541336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-xmltodict* to *1.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-xmltodict-upgrade-1.0.2-1.0.3.patch
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
From 500757889a84ba9b5cefbcb60a4609d3e94d96e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 14:13:01 +0000
Subject: [PATCH] python3-xmltodict: upgrade 1.0.2 -> 1.0.3

---
 .../{python3-xmltodict_1.0.2.bb => python3-xmltodict_1.0.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_1.0.2.bb => python3-xmltodict_1.0.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb b/meta/recipes-devtools/python/python3-xmltodict_1.0.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
rename to meta/recipes-devtools/python/python3-xmltodict_1.0.3.bb
index e58e32e338..693549b9c8 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "54306780b7c2175a3967cad1db92f218207e5bc1aba697d887807c0fb68b7649"
+SRC_URI[sha256sum] = "3bf1f49c7836df34cf6d9cc7e690c4351f7dfff2ab0b8a1988bba4a9b9474909"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.47.1


--===============3985059162681541336==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-xmltodict-upgrade-1.0.2-1.0.3.patch"

RnJvbSA1MDA3NTc4ODlhODRiYTliNWNlZmJjYjYwYTQ2MDlkM2U5NGQ5NmUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTQ6MTM6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXhtbHRvZGljdDogdXBncmFkZSAxLjAuMiAtPiAxLjAuMwoKLS0tCiAuLi4ve3B5dGhv
bjMteG1sdG9kaWN0XzEuMC4yLmJiID0+IHB5dGhvbjMteG1sdG9kaWN0XzEuMC4zLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXhtbHRvZGljdF8xLjAuMi5i
YiA9PiBweXRob24zLXhtbHRvZGljdF8xLjAuMy5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteG1sdG9kaWN0XzEuMC4yLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8xLjAuMy5iYgpzaW1p
bGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMteG1sdG9kaWN0XzEuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMteG1sdG9kaWN0XzEuMC4zLmJiCmluZGV4IGU1OGUzMmUzMzguLjY5
MzU0OWI5YzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My14bWx0b2RpY3RfMS4wLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXhtbHRvZGljdF8xLjAuMy5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9naXRodWIuY29tL21hcnRpbmJsZWNoL3htbHRvZGljdCIKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDE0NDFkNTBkYzc0NDc2ZGI1
OGE0MWFjMTBjYjlmYTIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NDMwNjc4MGI3YzIxNzVh
Mzk2N2NhZDFkYjkyZjIxODIwN2U1YmMxYWJhNjk3ZDg4NzgwN2MwZmI2OGI3NjQ5IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjNiZjFmNDljNzgzNmRmMzRjZjZkOWNjN2U2OTBjNDM1MWY3ZGZmZjJh
YjBiOGExOTg4YmJhNGE5Yjk0NzQ5MDkiCiAKIFBZUElfUEFDS0FHRSA9ICJ4bWx0b2RpY3QiCiAK
LS0gCjIuNDcuMQoK

--===============3985059162681541336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict: FILELIST: directory renamed /usr/lib/python3.14/site-packages/xmltodict-1.0.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/xmltodict-1.0.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/xmltodict-1.0.2.dist-info -> /usr/lib/python3.14/site-packages/xmltodict-1.0.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-xmltodict (sysroot):
  /usr/lib/python3.14/site-packages/xmltodict-1.0.2.dist-info moved to /usr/lib/python3.14/site-packages/xmltodict-1.0.3.dist-info

--===============3985059162681541336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-xmltodict: PV changed from "1.0.2" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-xmltodict: SRC_URI changed from "https://files.pythonhosted.org/packages/source/x/xmltodict/xmltodict-1.0.2.tar.gz;downloadfilename=xmltodict-1.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/x/xmltodict/xmltodict-1.0.3.tar.gz;downloadfilename=xmltodict-1.0.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-xmltodict: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-dbg: PV changed from "1.0.2" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-dbg: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-dev: PV changed from "1.0.2" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-dev: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-doc: PV changed from "1.0.2" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-doc: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-locale: PV changed from "1.0.2" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-locale: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PV changed from "1.0.2" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGSIZE changed from 35543 to 36003 (+1%)
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-src: PV changed from "1.0.2" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-src: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-staticdev: PV changed from "1.0.2" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-staticdev: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict: PV changed from "1.0.2" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict: FILELIST: directory renamed /usr/lib/python3.14/site-packages/xmltodict-1.0.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/xmltodict-1.0.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/xmltodict-1.0.2.dist-info -> /usr/lib/python3.14/site-packages/xmltodict-1.0.3.dist-info
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict: PKGSIZE changed from 65679 to 64735 (-1%)
Changes to packages/x86-64-v3-poky-linux/python3-xmltodict (sysroot):
  /usr/lib/python3.14/site-packages/xmltodict-1.0.2.dist-info moved to /usr/lib/python3.14/site-packages/xmltodict-1.0.3.dist-info

--===============3985059162681541336==--

