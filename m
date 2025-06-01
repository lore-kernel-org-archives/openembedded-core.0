Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECFDC761AE
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.27765.1748786123501344362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tv2jZLXP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=I1dTUglI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101972bc6c24b-c8dade01-c381-4a01-9640-7194b38d94e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C/NGKePZMLGvLN0IFEwFFmt2hy+PxvRtl5q2Yquy4h8=;
	b=tv2jZLXP46KddLhFkT8Q5BaVC0EZenn6y3WMR97XnT6R7Sd58RFECGE9gP1ts5p2
	+4rcmp8ZGH0dWW/h5K0Up6AMmtYHb7w9hZk3px5GTExCvG/s2fNNLEZOucmbky617FL
	ycoMVc5UOs4MncWMcdAb6NteXOM5sGQZV0WeJYUg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C/NGKePZMLGvLN0IFEwFFmt2hy+PxvRtl5q2Yquy4h8=;
	b=I1dTUglIAFSs88Lpi7RxtPPSiSoP2Ach8FXhb4HTfNQkw71RbIan4PSdQNgQWQIw
	odse2FDZ0uGZBbxpy/f1+aj3iTddxqBHebvYX5j+JjXq4/LDAdj6RyAwVaoPBvVdYl5
	wWyk6rmutWrLqfJXGKgkWGWv0Jr2zkR2bkF9K/2E=
Content-Type: multipart/mixed; boundary="===============4541412470465794518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.24.2 SUCCEEDED
Message-ID: <010101972bc6c24b-c8dade01-c381-4a01-9640-7194b38d94e2-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217605

--===============4541412470465794518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.24.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.24.1-2.24.2.patch
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
From 39307f9cf8b66a2e561e8153f3d20bb53f0157b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:35:31 +0000
Subject: [PATCH] python3-pdm: upgrade 2.24.1 -> 2.24.2

---
 .../python/{python3-pdm_2.24.1.bb => python3-pdm_2.24.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.24.1.bb => python3-pdm_2.24.2.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.24.1.bb b/meta/recipes-devtools/python/python3-pdm_2.24.2.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.24.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.24.2.bb
index 3f251c7f0f..d24e03d650 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.24.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.24.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "fc8adf011caa4ee2b0f25dabf890152aa4153cc21599ea67fe0c14e533dcd6d9"
+SRC_URI[sha256sum] = "ce0d5e9005fe26238b8ba5cf0e37ac00acab2fb90f904bf0219a5e8445849dfb"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============4541412470465794518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pdm: PV changed from "2.24.1" to "2.24.2"
packages/core2-64-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.24.1.tar.gz;downloadfilename=pdm-2.24.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.24.2.tar.gz;downloadfilename=pdm-2.24.2.tar.gz"
packages/core2-64-poky-linux/python3-pdm: PKGV changed from 2.24.1 [default] to 2.24.2 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.24.1" to "2.24.2"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.24.1 [default] to 2.24.2 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.24.1" to "2.24.2"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.24.1 [default] to 2.24.2 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.24.1" to "2.24.2"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.24.1 [default] to 2.24.2 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.24.1" to "2.24.2"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.24.1 [default] to 2.24.2 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.24.1" to "2.24.2"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.24.1 [default] to 2.24.2 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.24.1" to "2.24.2"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.24.1 [default] to 2.24.2 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PV changed from "2.24.1" to "2.24.2"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.24.1 [default] to 2.24.2 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info, directory renamed /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info/licenses, added "/usr/lib/python3.13/site-packages/pdm/models/serializers.py /usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2184505 to 2191276 (+0%)
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info
  /usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/models/serializers.py was added

--===============4541412470465794518==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.24.1-2.24.2.patch"

RnJvbSAzOTMwN2Y5Y2Y4YjY2YTJlNTYxZTgxNTNmM2QyMGJiNTNmMDE1N2IzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOTozNTozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjQuMSAtPiAyLjI0LjIKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yNC4xLmJiID0+IHB5dGhvbjMtcGRtXzIuMjQuMi5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yNC4xLmJiID0+IHB5dGhv
bjMtcGRtXzIuMjQuMi5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjQuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yNC4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjQuMi5i
YgppbmRleCAzZjI1MWM3ZjBmLi5kMjRlMDNkNjUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjQuMi5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmM4YWRmMDExY2FhNGVlMmIwZjI1ZGFiZjg5MDE1MmFh
NDE1M2NjMjE1OTllYTY3ZmUwYzE0ZTUzM2RjZDZkOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJj
ZTBkNWU5MDA1ZmUyNjIzOGI4YmE1Y2YwZTM3YWMwMGFjYWIyZmI5MGY5MDRiZjAyMTlhNWU4NDQ1
ODQ5ZGZiIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0t
IAoyLjQ3LjEKCg==

--===============4541412470465794518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info, directory renamed /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info/licenses, added "/usr/lib/python3.13/site-packages/pdm/models/serializers.py /usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.24.2.dist-info
  /usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/models/serializers.py was added

--===============4541412470465794518==--

