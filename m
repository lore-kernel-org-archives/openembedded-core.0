Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B0DC4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 05:19:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.941.1784351976103842847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 22:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=C00WsptN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PW4J1oLJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f73aa66c5-779a30e1-d822-4bba-8803-6a2d1784f5d1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784351975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FlC0v543LTghMdruosCIlkzFqgjv4p8e2NGxa8o8R/s=;
	b=C00WsptN5h0YDeTMvGE3MTZlhHR6icWs5U0xjtcg2wltczi9eTsAXPXdjFjPugJ+
	XgjOnTJ7FbOo4HjcOePmGD4Sr9D7AuIDYe7RbOvW9zxhKK+I0cH4C8BIMeL0g2SMy0d
	ANV8FJAHxSNsD7VT3ESRJAQ2NmkCvXMBhT9JhXps=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784351975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FlC0v543LTghMdruosCIlkzFqgjv4p8e2NGxa8o8R/s=;
	b=PW4J1oLJa5kBGCcBx7mz7ppe1i3QzHcCJv9hexttChKjN4N1muhsOK2akAXVnGDk
	2lpTbtE10bbOBl5RR3QJgYkuyu7Qs1mzKoFR8SqaVsQpeNgcG42EU/dTZ6iptW/z/2N
	5Dl6GSD0TIpEaxj8O7sdTKF6nBRtjM9rd2kPfpIA=
Content-Type: multipart/mixed; boundary="===============7649632490793471551=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 16.1.1 SUCCEEDED
Message-ID: <0101019f73aa66c5-779a30e1-d822-4bba-8803-6a2d1784f5d1-000000@us-west-2.amazonses.com>
Date: Sat, 18 Jul 2026 05:19:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 05:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241232

--===============7649632490793471551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *16.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-16.1-16.1.1.patch
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
From 4b60ef1abe6787f7ec1dbb2853772b02a565fe5d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 18 Jul 2026 05:14:28 +0000
Subject: [PATCH] python3-websockets: upgrade 16.1 -> 16.1.1

---
 ...{python3-websockets_16.1.bb => python3-websockets_16.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_16.1.bb => python3-websockets_16.1.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_16.1.bb b/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_16.1.bb
rename to meta/recipes-devtools/python/python3-websockets_16.1.1.bb
index 0f819aecfd..2e2eb0c3ed 100644
--- a/meta/recipes-devtools/python/python3-websockets_16.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "299468cbe42e2b9981134c7c51d99387d8a7bf562b00183b3eec53f882846dad"
+SRC_URI[sha256sum] = "db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============7649632490793471551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-16.1.tar.gz;downloadfilename=websockets-16.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-16.1.1.tar.gz;downloadfilename=websockets-16.1.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-websockets: PKGV changed from 16.1 [default] to 16.1.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets: PV changed from "16.1" to "16.1.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "16.1" to "16.1.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 16.1 [default] to 16.1.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGSIZE changed from 29656 to 29664 (+0%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "16.1" to "16.1.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 16.1 [default] to 16.1.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "16.1" to "16.1.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 16.1 [default] to 16.1.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "16.1" to "16.1.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 16.1 [default] to 16.1.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: FILELIST: directory renamed /usr/src/debug/python3-websockets/16.1/src/websockets -> /usr/src/debug/python3-websockets/16.1.1/src/websockets
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PV changed from "16.1" to "16.1.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 16.1 [default] to 16.1.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "16.1" to "16.1.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 16.1 [default] to 16.1.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PV changed from "16.1" to "16.1.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGV changed from 16.1 [default] to 16.1.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1385918 to 1385445 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/WHEEL was removed

--===============7649632490793471551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/WHEEL was removed

--===============7649632490793471551==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-16.1-16.1.1.patch"

RnJvbSA0YjYwZWYxYWJlNjc4N2Y3ZWMxZGJiMjg1Mzc3MmIwMmE1NjVmZTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTggSnVsIDIwMjYgMDU6MTQ6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYnNvY2tldHM6IHVwZ3JhZGUgMTYuMSAtPiAxNi4xLjEKCi0tLQogLi4ue3B5dGhv
bjMtd2Vic29ja2V0c18xNi4xLmJiID0+IHB5dGhvbjMtd2Vic29ja2V0c18xNi4xLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJzb2NrZXRzXzE2LjEu
YmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE2LjEuMS5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNi4xLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTYuMS4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE2LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE2LjEuMS5iYgppbmRleCAwZjgxOWFl
Y2ZkLi4yZTJlYjBjM2VkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtd2Vic29ja2V0c18xNi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE2LjEuMS5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NTE5MjRhNmFmNDQ5NWI4Y2ZhZWUxYjFk
YTg2OWI2ZjQiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyOTk0NjhjYmU0MmUyYjk5ODExMzRjN2M1MWQ5OTM4N2Q4
YTdiZjU2MmIwMDE4M2IzZWVjNTNmODgyODQ2ZGFkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRi
MjM0ZWRhOTY1ZGNjZTE1ZGY5NmJiOTcwOWY1ODdjZDg3ZDRkNTJhYWYwZTgwZTJmMzRlYzA0Yzc2
NzBjNTciCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi40Ny4x
Cgo=

--===============7649632490793471551==--

