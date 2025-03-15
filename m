Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011E0C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:30 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.10339.1742048300101882048
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HgYgGH8G;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DhTM2DLY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101959a2b9478-b0c9ee17-3646-4385-9d8e-2d718a15c1e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VmNzfYTSpuGjpm3uqfUiCd+ZxS576ZZ3zlaxEoVxpys=;
	b=HgYgGH8Gm08YYR1QLzCYClkhSFj8S3kKETobx6soDrMZk36eKbACYK6uviIH/J4A
	cJwX/Bms4WM2E1MPcvd64Gb8kpSTA2SxzUIF0hr6dl0WZI900c7K4/hLZjZviETFwq3
	fm0/DFJVIGW7ql9k93xHTt6QqniFDjC6GfC2ApNQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VmNzfYTSpuGjpm3uqfUiCd+ZxS576ZZ3zlaxEoVxpys=;
	b=DhTM2DLY22A0KtR74Me2fcHZdZEZwj1iS3H6sUZYGq5hHwuD+qMlB2oZyL1tAi46
	B6t+n0ZNQvf0qXpx0Bqr9iQjfMp3DPm9QBuc8oZnwlW+oCpVp8RZoDT7g8PQGYKj+wm
	zopaKH/GEEOauL/I/ZNLuProb2vlnHAjzpk2RxRs=
Content-Type: multipart/mixed; boundary="===============7552004583834754089=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 15.0.1 SUCCEEDED
Message-ID: <010101959a2b9478-b0c9ee17-3646-4385-9d8e-2d718a15c1e4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212921

--===============7552004583834754089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *15.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-15.0-15.0.1.patch
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
From ecb7efde084bdaed4997ccaea6a195df1cf75174 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 09:53:59 +0000
Subject: [PATCH] python3-websockets: upgrade 15.0 -> 15.0.1

---
 ...{python3-websockets_15.0.bb => python3-websockets_15.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_15.0.bb => python3-websockets_15.0.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_15.0.bb b/meta/recipes-devtools/python/python3-websockets_15.0.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_15.0.bb
rename to meta/recipes-devtools/python/python3-websockets_15.0.1.bb
index 9a7456dee4..2e1b0f0919 100644
--- a/meta/recipes-devtools/python/python3-websockets_15.0.bb
+++ b/meta/recipes-devtools/python/python3-websockets_15.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "ca36151289a15b39d8d683fd8b7abbe26fc50be311066c5f8dcf3cb8cee107ab"
+SRC_URI[sha256sum] = "82544de02076bafba038ce055ee6412d68da13ab47f0c60cab827346de828dee"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.44.1


--===============7552004583834754089==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-15.0-15.0.1.patch"

RnJvbSBlY2I3ZWZkZTA4NGJkYWVkNDk5N2NjYWVhNmExOTVkZjFjZjc1MTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDk6NTM6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYnNvY2tldHM6IHVwZ3JhZGUgMTUuMCAtPiAxNS4wLjEKCi0tLQogLi4ue3B5dGhv
bjMtd2Vic29ja2V0c18xNS4wLmJiID0+IHB5dGhvbjMtd2Vic29ja2V0c18xNS4wLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJzb2NrZXRzXzE1LjAu
YmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE1LjAuMS5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNS4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTUuMC4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE1LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE1LjAuMS5iYgppbmRleCA5YTc0NTZk
ZWU0Li4yZTFiMGYwOTE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtd2Vic29ja2V0c18xNS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE1LjAuMS5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NTE5MjRhNmFmNDQ5NWI4Y2ZhZWUxYjFk
YTg2OWI2ZjQiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjYTM2MTUxMjg5YTE1YjM5ZDhkNjgzZmQ4YjdhYmJlMjZm
YzUwYmUzMTEwNjZjNWY4ZGNmM2NiOGNlZTEwN2FiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgy
NTQ0ZGUwMjA3NmJhZmJhMDM4Y2UwNTVlZTY0MTJkNjhkYTEzYWI0N2YwYzYwY2FiODI3MzQ2ZGU4
MjhkZWUiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi40NC4x
Cgo=

--===============7552004583834754089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-websockets: PKGV changed from 15.0 [default] to 15.0.1 [default]
packages/core2-64-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-15.0.tar.gz;downloadfilename=websockets-15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-15.0.1.tar.gz;downloadfilename=websockets-15.0.1.tar.gz"
packages/core2-64-poky-linux/python3-websockets: PV changed from "15.0" to "15.0.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PKGSIZE changed from 24096 to 24104 (+0%)
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 15.0 [default] to 15.0.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "15.0" to "15.0.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 15.0 [default] to 15.0.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "15.0" to "15.0.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 15.0 [default] to 15.0.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "15.0" to "15.0.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 15.0 [default] to 15.0.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "15.0" to "15.0.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 15.0 [default] to 15.0.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PV changed from "15.0" to "15.0.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 15.0 [default] to 15.0.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "15.0" to "15.0.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1274161 to 1275451 (+0%)
packages/core2-64-poky-linux/python3-websockets/python3-websockets: FILELIST: removed "/usr/lib/python3.13/site-packages/websockets-15.0.dist-info/WHEEL /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/METADATA /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/LICENSE /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/top_level.txt", added "/usr/lib/python3.13/site-packages/websockets/__pycache__/cli.cpython-313.pyc /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/top_level.txt /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/METADATA /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/LICENSE /usr/lib/python3.13/site-packages/websockets/cli.py /usr/bin/websockets /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/WHEEL"
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGV changed from 15.0 [default] to 15.0.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PV changed from "15.0" to "15.0.1"
Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/websockets/cli.py was added
  /usr/lib/python3.13/site-packages/websockets/__pycache__/cli.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/WHEEL was removed

--===============7552004583834754089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-websockets/python3-websockets: FILELIST: removed "/usr/lib/python3.13/site-packages/websockets-15.0.dist-info/top_level.txt /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/WHEEL /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/LICENSE /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/METADATA", added "/usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/top_level.txt /usr/bin/websockets /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/WHEEL /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/LICENSE /usr/lib/python3.13/site-packages/websockets/cli.py /usr/lib/python3.13/site-packages/websockets/__pycache__/cli.cpython-313.pyc /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/METADATA /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/entry_points.txt"
Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/websockets/cli.py was added
  /usr/lib/python3.13/site-packages/websockets/__pycache__/cli.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.dist-info/WHEEL was removed

--===============7552004583834754089==--

