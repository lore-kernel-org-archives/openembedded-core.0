Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A629FCD37AA
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:36 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2340.1762384568966752539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0rbThbbx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YS0tySiY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564ea4e9-d48c2465-71b2-4961-9a47-7bc99ff00aa0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384586;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vx69avJNkWtenwWbdo42LyIiHQ6zIKvwfW/3Pz4vg38=;
	b=0rbThbbxcRkJ1CgNntmwZCPgpUavL5AvuexEMEyPt9dgX3qGAsj1i7+dI3YW2y7n
	qiMGRKnwCOgobgQOwe13BaGPiCw2JSEbmgXh+Hnziv83vqyGmOE+45o8WXCS5+j+13/
	6oBOsx3K7uUswzLWEe3Z0fDaLoAiLxboMRZa0p1Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384586;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vx69avJNkWtenwWbdo42LyIiHQ6zIKvwfW/3Pz4vg38=;
	b=YS0tySiYv+4j9SiUTSdn4etpD2yF6XrD2jnW3dUD3a5B8EzcC6ahdaM84tAPoGJD
	qL8wJklad6XMCNDOD2OCojMyJLmSAxOJlavrDGDe0Frh3t6O5lYkdzmLzI188x8Dzsm
	9iqSfBvrAcophGV6AaSbVUb2Pk9tVcu/rUMS87aE=
Content-Type: multipart/mixed; boundary="===============1837246644333645870=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.26.1 SUCCEEDED
Message-ID: <0101019a564ea4e9-d48c2465-71b2-4961-9a47-7bc99ff00aa0-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225835

--===============1837246644333645870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.26.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.25.9-2.26.1.patch
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
From a16b18254b474504c1e8ac2d362256ffb01cafb5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:20:21 +0000
Subject: [PATCH] python3-pdm: upgrade 2.25.9 -> 2.26.1

---
 .../python/{python3-pdm_2.25.9.bb => python3-pdm_2.26.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.9.bb => python3-pdm_2.26.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.9.bb b/meta/recipes-devtools/python/python3-pdm_2.26.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.25.9.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.1.bb
index 6938edb82f..bd25f141f0 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.9.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "fb5fcd561986db1d83255d01e97e2e16f80debf743934d891a62ff2933ccc80c"
+SRC_URI[sha256sum] = "60a568201424a7193b661f6fed6e446e39695b52edc5e0904ba0b07fcaf2e787"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============1837246644333645870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.9.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info

--===============1837246644333645870==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.25.9-2.26.1.patch"

RnJvbSBhMTZiMTgyNTRiNDc0NTA0YzFlOGFjMmQzNjIyNTZmZmIwMWNhZmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzoyMDoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjUuOSAtPiAyLjI2LjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yNS45LmJiID0+IHB5dGhvbjMtcGRtXzIuMjYuMS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yNS45LmJiID0+IHB5dGhv
bjMtcGRtXzIuMjYuMS5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuOS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yNS45LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMS5i
YgppbmRleCA2OTM4ZWRiODJmLi5iZDI1ZjE0MWYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMS5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmI1ZmNkNTYxOTg2ZGIxZDgzMjU1ZDAxZTk3ZTJlMTZm
ODBkZWJmNzQzOTM0ZDg5MWE2MmZmMjkzM2NjYzgwYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2
MGE1NjgyMDE0MjRhNzE5M2I2NjFmNmZlZDZlNDQ2ZTM5Njk1YjUyZWRjNWUwOTA0YmEwYjA3ZmNh
ZjJlNzg3IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============1837246644333645870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.9.tar.gz;downloadfilename=pdm-2.25.9.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.1.tar.gz;downloadfilename=pdm-2.26.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2242786 to 2248256 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.9.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info

--===============1837246644333645870==--

