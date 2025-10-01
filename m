Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838CACCD192
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.17947.1759325538970919619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wdzE8fWp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mtmOFqPQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101999ff9484a-c62f6baf-c736-40c9-bac8-b9b4ae88a9c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WuY6DqemsUpacvSEnyycvKed1q7i1vJHGdA4oVggdzQ=;
	b=wdzE8fWp9fo2yc3jVFJOnRFC62V0ZKY6JoufT+VlJMK60Btj964tLGNfKSLJNcA2
	M1h/9wItJl6IY9Xpfb3w1RhhCt6YzQzsGLnE1BuVpS/tCVLjPUAajQM90+KWkFnBjEP
	DLYHgt+oagelSkzOhr9X7N6h88XoIYaZO8Z7vZYs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WuY6DqemsUpacvSEnyycvKed1q7i1vJHGdA4oVggdzQ=;
	b=mtmOFqPQFXgOV4cC9Z78Ij5GmmhwBYFCmHG4U43dXlHovjfEEf0uhV7WRifEJH2i
	UWwfmSFGqbqus3ieyDSk5b4kGyCBkV2iDAJFbgqllq9Vz25pmxXESrsyhO4zlj9n6KQ
	5zAuSSXP2kdiX6m53OfKbKqpf5Rp9uoBZxjfyhJM=
Content-Type: multipart/mixed; boundary="===============9013078887541214621=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.3.0 SUCCEEDED
Message-ID: <010101999ff9484a-c62f6baf-c736-40c9-bac8-b9b4ae88a9c3-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224233

--===============9013078887541214621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.2.2-8.3.0.patch
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
From bbe1c3eca50c1db152bdf2a80d376056e8890059 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 08:49:51 +0000
Subject: [PATCH] python3-click: upgrade 8.2.2 -> 8.3.0

---
 .../python/{python3-click_8.2.2.bb => python3-click_8.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.2.2.bb => python3-click_8.3.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.2.2.bb b/meta/recipes-devtools/python/python3-click_8.3.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.2.2.bb
rename to meta/recipes-devtools/python/python3-click_8.3.0.bb
index 9710e8a71c..4794c06e7b 100644
--- a/meta/recipes-devtools/python/python3-click_8.2.2.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "068616e6ef9705a07b6db727cb9c248f4eb9dae437a30239f56fa94b18b852ef"
+SRC_URI[sha256sum] = "e7b8232224eba16f4ebe410c25ced9f7875cb5f3263ffc93cc3e8da705e229c4"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============9013078887541214621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-click: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.2.2.tar.gz;downloadfilename=click-8.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.3.0.tar.gz;downloadfilename=click-8.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 411734 to 462323 (+12%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/setuptools.rst /usr/lib/python3-click/ptest/docs/shell-completion.rst /usr/lib/python3-click/ptest/docs/quickstart.rst /usr/lib/python3-click/ptest/docs/prompts.rst", added "/usr/lib/python3-click/ptest/docs/shell-completion.md /usr/lib/python3-click/ptest/docs/setuptools.md /usr/lib/python3-click/ptest/docs/prompts.md /usr/lib/python3-click/ptest/docs/quickstart.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGSIZE changed from 809363 to 825549 (+2%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.13/site-packages/click-8.2.2.dist-info -> /usr/lib/python3.13/site-packages/click-8.3.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/click-8.2.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/click-8.3.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/click/_utils.py /usr/lib/python3.13/site-packages/click/__pycache__/_utils.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click: PV changed from "8.2.2" to "8.3.0"
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.2.2.dist-info moved to /usr/lib/python3.13/site-packages/click-8.3.0.dist-info
  /usr/lib/python3.13/site-packages/click/__pycache__/_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/click/_utils.py was added

--===============9013078887541214621==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.2.2-8.3.0.patch"

RnJvbSBiYmUxYzNlY2E1MGMxZGIxNTJiZGYyYTgwZDM3NjA1NmU4ODkwMDU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwODo0OTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2xpY2s6IHVwZ3JhZGUgOC4yLjIgLT4gOC4zLjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1jbGlja184LjIuMi5iYiA9PiBweXRob24zLWNsaWNrXzguMy4wLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jbGlja184LjIuMi5iYiA9PiBweXRo
b24zLWNsaWNrXzguMy4wLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjIuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jbGlja184LjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4yLjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184
LjMuMC5iYgppbmRleCA5NzEwZThhNzFjLi40Nzk0YzA2ZTdiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4yLjIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMy4wLmJiCkBAIC04LDcgKzgs
NyBAQCBIT01FUEFHRSA9ICJodHRwOi8vY2xpY2sucG9jb28ub3JnLyIKIExJQ0VOU0UgPSAiQlNE
LTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTFm
YTk4MjMyZmQ2NDU2MDg5MzdhMGZkYzgyZTk5OWI4IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MDY4NjE2ZTZlZjk3MDVhMDdiNmRiNzI3Y2I5YzI0OGY0ZWI5ZGFlNDM3YTMwMjM5ZjU2ZmE5NGIx
OGI4NTJlZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlN2I4MjMyMjI0ZWJhMTZmNGViZTQxMGMy
NWNlZDlmNzg3NWNiNWYzMjYzZmZjOTNjYzNlOGRhNzA1ZTIyOWM0IgogCiBpbmhlcml0IHB5cGkg
cHl0aG9uX2ZsaXRfY29yZSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============9013078887541214621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/quickstart.rst /usr/lib/python3-click/ptest/docs/shell-completion.rst /usr/lib/python3-click/ptest/docs/setuptools.rst /usr/lib/python3-click/ptest/docs/prompts.rst", added "/usr/lib/python3-click/ptest/docs/quickstart.md /usr/lib/python3-click/ptest/docs/shell-completion.md /usr/lib/python3-click/ptest/docs/setuptools.md /usr/lib/python3-click/ptest/docs/prompts.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 411734 to 462323 (+12%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.13/site-packages/click-8.2.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/click-8.3.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/click-8.2.2.dist-info -> /usr/lib/python3.13/site-packages/click-8.3.0.dist-info, added "/usr/lib/python3.13/site-packages/click/_utils.py /usr/lib/python3.13/site-packages/click/__pycache__/_utils.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.2.2.dist-info moved to /usr/lib/python3.13/site-packages/click-8.3.0.dist-info
  /usr/lib/python3.13/site-packages/click/__pycache__/_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/click/_utils.py was added

--===============9013078887541214621==--

