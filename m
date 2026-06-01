Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E60CD6E64
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1575.1780328140803400324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hlNRHB3k;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HVCu0aJO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d38d69-a5b4cc61-bdcd-4fd5-9433-f3c2a812054f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RGVwPyBSJwJJa9UX6gsjhIJKrGA7WclhaaaCG0w+4kk=;
	b=hlNRHB3koyW151BidjIFYbFcz68Haug11fArefVSIIBWw30mbPFjXOir2/IsqZQd
	pIqtXVW1iPtfa8PFRmqsAfBzn2VV4dFEiPEK3vMxI/oua/csDiFNtqOQUP17ClyhukG
	/7bIdaIn0eJjOZ20DyEMh6oOxSxyO5CTgPjMCOsU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RGVwPyBSJwJJa9UX6gsjhIJKrGA7WclhaaaCG0w+4kk=;
	b=HVCu0aJOiskjvM8nx+o4HXkjUHWS4NSEeqmnKlSKJBW8mh3IeeA8fboED3prTK8t
	xCUiWAsIN43NKUUiKPHWBWFCKOT3HEv7f5znBRo2UefgNzvcGOJo+oBr+Oj8dWC3hnZ
	AFgymR0Z1xmz5Y8OGZ6401z8GbwAbTclu+vUzAHM=
Content-Type: multipart/mixed; boundary="===============8074818053051277409=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.27.0 SUCCEEDED
Message-ID: <0101019e83d38d69-a5b4cc61-bdcd-4fd5-9433-f3c2a812054f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237889

--===============8074818053051277409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.27.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.26.8-2.27.0.patch
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
From d5a30bea4796d8827581097e8c3e776f1e8a756c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:06:32 +0000
Subject: [PATCH] python3-pdm: upgrade 2.26.8 -> 2.27.0

---
 .../python/{python3-pdm_2.26.8.bb => python3-pdm_2.27.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.8.bb => python3-pdm_2.27.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.8.bb b/meta/recipes-devtools/python/python3-pdm_2.27.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.8.bb
rename to meta/recipes-devtools/python/python3-pdm_2.27.0.bb
index 91fcc6a5af..f378e1edda 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.8.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.27.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "f53a20b4b6beaa88da577a7413ebbb51bee534441339b006dba2260edbc81757"
+SRC_URI[sha256sum] = "dbfbc484065d0150fa5b29484ead908354313d8699cf74c099d4531826bd04de"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============8074818053051277409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed

--===============8074818053051277409==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.26.8-2.27.0.patch"

RnJvbSBkNWEzMGJlYTQ3OTZkODgyNzU4MTA5N2U4YzNlNzc2ZjFlOGE3NTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOTowNjozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjYuOCAtPiAyLjI3LjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yNi44LmJiID0+IHB5dGhvbjMtcGRtXzIuMjcuMC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yNi44LmJiID0+IHB5dGhv
bjMtcGRtXzIuMjcuMC5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yNi44LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjcuMC5i
YgppbmRleCA5MWZjYzZhNWFmLi5mMzc4ZTFlZGRhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjcuMC5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjUzYTIwYjRiNmJlYWE4OGRhNTc3YTc0MTNlYmJiNTFi
ZWU1MzQ0NDEzMzliMDA2ZGJhMjI2MGVkYmM4MTc1NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJk
YmZiYzQ4NDA2NWQwMTUwZmE1YjI5NDg0ZWFkOTA4MzU0MzEzZDg2OTljZjc0YzA5OWQ0NTMxODI2
YmQwNGRlIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============8074818053051277409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.8.tar.gz;downloadfilename=pdm-2.26.8.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.27.0.tar.gz;downloadfilename=pdm-2.27.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2500151 to 2516493 (+1%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed

--===============8074818053051277409==--

