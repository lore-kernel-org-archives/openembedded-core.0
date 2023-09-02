Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0111DCCF965
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.5733.1693650553883651650
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G5ptbtcB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZknCVckb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a5570896e-1a52c970-1c78-4263-a988-27600879bf47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uhLib/ZZ7CFJppi+8vjmE53DeEUx+V36kMStZsS+mpI=;
	b=G5ptbtcBWple67auG8mad0aR9t2zQyGEctOJCYKylAEGm+ScSXjAHOMV0McrKu9I
	1ti+3A0rYAe3drxgiAcX8/AnUAl0Misey/xHz4/DcsWDTby9qPI5lZMlFx1DCvh+UjC
	MAEO60F5rYx6frdaHX/ivRJE+7/KLNmuoQxeBeMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uhLib/ZZ7CFJppi+8vjmE53DeEUx+V36kMStZsS+mpI=;
	b=ZknCVckbNbn0b8OZJGkCBhaS3f7Sbf6eWy5G+kjByYPMvKWID8l/6s7gQNLN496G
	CzTyrxKPLDdyiD0UoyFF+7MwliYixOQiuHq2nD0tgD1UgULoDTpLA3pxdhfBhZEYqQD
	EnwUukHIsizAwAJTH9+bq3YGzC5Z1b8rmdT/VIeo=
Content-Type: multipart/mixed; boundary="===============1781388530906069712=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pluggy: upgrading to 1.3.0 SUCCEEDED
Message-ID: <0101018a5570896e-1a52c970-1c78-4263-a988-27600879bf47-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187077

--===============1781388530906069712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pluggy* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pluggy-upgrade-1.2.0-1.3.0.patch
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
From a524dfa6c32f44d16ade2d9f0473a1a311afe06a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 15:27:25 +0000
Subject: [PATCH] python3-pluggy: upgrade 1.2.0 -> 1.3.0

---
 .../python/{python3-pluggy_1.2.0.bb => python3-pluggy_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pluggy_1.2.0.bb => python3-pluggy_1.3.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.2.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.3.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pluggy_1.2.0.bb
rename to meta/recipes-devtools/python/python3-pluggy_1.3.0.bb
index 3322bb523b..c149cbb0e2 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[sha256sum] = "d12f0c4b579b15f5e054301bb226ee85eeeba08ffec228092f8defbaa3a4c4b3"
+SRC_URI[sha256sum] = "cf61ae8f126ac6f7c451172cf30e3e43d3ca77615509771b3a984a0730651e12"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
-- 
2.39.2


--===============1781388530906069712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pluggy: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-pluggy: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pluggy/pluggy-1.2.0.tar.gz;downloadfilename=pluggy-1.2.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/p/pluggy/pluggy-1.3.0.tar.gz;downloadfilename=pluggy-1.3.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pluggy: PV changed from "1.2.0" to "1.3.0"
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-dbg: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-dbg: PV changed from "1.2.0" to "1.3.0"
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-dev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-dev: PV changed from "1.2.0" to "1.3.0"
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-doc: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-doc: PV changed from "1.2.0" to "1.3.0"
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-locale: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-locale: PV changed from "1.2.0" to "1.3.0"
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-ptest: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-ptest: PKGSIZE changed from 56340 to 56217 (-0%)
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-ptest: PV changed from "1.2.0" to "1.3.0"
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-src: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-src: PV changed from "1.2.0" to "1.3.0"
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-staticdev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy-staticdev: PV changed from "1.2.0" to "1.3.0"
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pluggy-1.2.0.dist-info -> /usr/lib/python3.11/site-packages/pluggy-1.3.0.dist-info, added "/usr/lib/python3.11/site-packages/pluggy/py.typed"
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy: PKGSIZE changed from 127818 to 136542 (+7%)
packages/core2-32-poky-linux/python3-pluggy/python3-pluggy: PV changed from "1.2.0" to "1.3.0"
Changes to packages/core2-32-poky-linux/python3-pluggy (sysroot):
  /usr/lib/python3.11/site-packages/pluggy-1.2.0.dist-info moved to /usr/lib/python3.11/site-packages/pluggy-1.3.0.dist-info
  /usr/lib/python3.11/site-packages/pluggy/py.typed was added
Changes to packages/x86_64-linux/python3-pluggy-native (sysroot):
  /usr/lib/python3.11/site-packages/pluggy-1.2.0.dist-info moved to /usr/lib/python3.11/site-packages/pluggy-1.3.0.dist-info
  /usr/lib/python3.11/site-packages/pluggy/py.typed was added

--===============1781388530906069712==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pluggy-upgrade-1.2.0-1.3.0.patch"

RnJvbSBhNTI0ZGZhNmMzMmY0NGQxNmFkZTJkOWYwNDczYTFhMzExYWZlMDZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNToyNzoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGx1Z2d5OiB1cGdyYWRlIDEuMi4wIC0+IDEuMy4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGx1Z2d5XzEuMi4wLmJiID0+IHB5dGhvbjMtcGx1Z2d5XzEuMy4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGx1Z2d5XzEuMi4wLmJiID0+IHB5
dGhvbjMtcGx1Z2d5XzEuMy4wLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wbHVnZ3lfMS4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGx1Z2d5XzEuMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wbHVnZ3lf
MS4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
bHVnZ3lfMS4zLjAuYmIKaW5kZXggMzMyMmJiNTIzYi4uYzE0OWNiYjBlMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBsdWdneV8xLjIuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGx1Z2d5XzEuMy4wLmJiCkBA
IC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHl0ZXN0LWRldi9w
bHVnZ3kiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PTFjODIwNmQxNmZkNWNjMDJmYTliMGJiOTg5NTVlNWMyIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZDEyZjBjNGI1NzliMTVmNWUwNTQzMDFiYjIyNmVlODVlZWViYTA4ZmZlYzIyODA5
MmY4ZGVmYmFhM2E0YzRiMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjZjYxYWU4ZjEyNmFjNmY3
YzQ1MTE3MmNmMzBlM2U0M2QzY2E3NzYxNTUwOTc3MWIzYTk4NGEwNzMwNjUxZTEyIgogCiBERVBF
TkRTICs9ICIke1BZVEhPTl9QTn0tc2V0dXB0b29scy1zY20tbmF0aXZlIgogUkRFUEVORFM6JHtQ
Tn0gKz0gIiR7UFlUSE9OX1BOfS1pbXBvcnRsaWItbWV0YWRhdGEgXAotLSAKMi4zOS4yCgo=

--===============1781388530906069712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pluggy/python3-pluggy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pluggy-1.2.0.dist-info -> /usr/lib/python3.11/site-packages/pluggy-1.3.0.dist-info, added "/usr/lib/python3.11/site-packages/pluggy/py.typed"
Changes to packages/core2-32-poky-linux/python3-pluggy (sysroot):
  /usr/lib/python3.11/site-packages/pluggy-1.2.0.dist-info moved to /usr/lib/python3.11/site-packages/pluggy-1.3.0.dist-info
  /usr/lib/python3.11/site-packages/pluggy/py.typed was added
Changes to packages/x86_64-linux/python3-pluggy-native (sysroot):
  /usr/lib/python3.11/site-packages/pluggy-1.2.0.dist-info moved to /usr/lib/python3.11/site-packages/pluggy-1.3.0.dist-info
  /usr/lib/python3.11/site-packages/pluggy/py.typed was added

--===============1781388530906069712==--

