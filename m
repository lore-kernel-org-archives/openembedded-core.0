Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65916C531C8
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1390.1771440099760607578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DUIIfA8w;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RRGJWvkP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720ed1a2-4fde9b9f-9c8d-4c4c-afa1-073bfc465527-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=blFMN8fZz3LsMUG+j1JHMZdKssa0Xw4aX1gDUFArGNM=;
	b=DUIIfA8wbJFKSeZZPKMlql6MdBE5O3qAEY8W9A9j+V1MDSUGYEyQDGuZj0OQCV7n
	LQPQRUrZjG8MgPqpyjh7Fz1p6GQhGXeFyykAf/Lt79w7IeztIP35VS65rByMIkfkd3N
	lAO5vQAMdI6iRsl4muI0XaIEv9yUPLSUDSoVsi6g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=blFMN8fZz3LsMUG+j1JHMZdKssa0Xw4aX1gDUFArGNM=;
	b=RRGJWvkP3JJZr3SOhr9NRaXnWjOWa8ezsbVDAcDm3DqqB0yS+nHPmy1lI2ohvU1+
	kAZriqfXhAL0tG09ydEg1rDkEKXMe1aV9ufOh/SGdw06n5EAdKiWIgr6dTA2C3o0Zcm
	hziVxv7TDtz3uqSt41vsDT5uv5PyhEOPYph5WsPg=
Content-Type: multipart/mixed; boundary="===============4193329558979894602=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.19 SUCCEEDED
Message-ID: <0101019c720ed1a2-4fde9b9f-9c8d-4c4c-afa1-073bfc465527-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231344

--===============4193329558979894602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.17.1-6.19.patch
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
From 7e6db67fd6fcd69ebfaaf04b7d9c35647f4dd433 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 12:45:09 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.17.1 -> 6.19

---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.17.1.bb => btrfs-tools_6.19.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.17.1.bb => btrfs-tools_6.19.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 2cd66d2722..7272c27c6c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
+From 7edcee57078769b7752275e0e5f35aefbfefc9eb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 7e36aa42..edff7d5b 100644
+index 96c11830..3f2585cb 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -996,7 +996,7 @@ endif
+@@ -997,7 +997,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb
index 8a6e4c268f..460f70a35a 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "06981428c08f78f019a2f4956407fd84b495e21e"
+SRCREV = "9ac9a97ee3ebcc71c584a202a31ccd6442c436dc"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============4193329558979894602==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.17.1-6.19.patch"

RnJvbSA3ZTZkYjY3ZmQ2ZmNkNjllYmZhYWYwNGI3ZDljMzU2NDdmNGRkNDMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTI6NDU6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjE3LjEgLT4gNi4xOQoKLS0tCiAuLi5kLWEtcG9zc2liaWxp
dHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCB8IDYgKysrLS0tCiAu
Li4ve2J0cmZzLXRvb2xzXzYuMTcuMS5iYiA9PiBidHJmcy10b29sc182LjE5LmJifSAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNf
Ni4xNy4xLmJiID0+IGJ0cmZzLXRvb2xzXzYuMTkuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9z
c2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3Np
YmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKaW5kZXggMmNk
NjZkMjcyMi4uNzI3MmMyN2M2YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0
cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13
aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5
LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMzBl
YzgxYzBkYWMxZTA2N2ZhZjQ5OTI0ZDU2MzFiYjIyY2NjOTBkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA3ZWRjZWU1NzA3ODc2OWI3NzUyMjc1ZTBlNWYzNWFlZmJmZWZjOWViIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE1heSAyMDE4IDIxOjIwOjM1ICswMzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIEFkZCBhIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9uIG1v
ZHVsZXMgYXJlCkBAIC0xMSwxMCArMTEsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxl
Ci1pbmRleCA3ZTM2YWE0Mi4uZWRmZjdkNWIgMTAwNjQ0CitpbmRleCA5NmMxMTgzMC4uM2YyNTg1
Y2IgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZpbGUKLUBAIC05OTYsNyArOTk2
LDcgQEAgZW5kaWYKK0BAIC05OTcsNyArOTk3LDcgQEAgZW5kaWYKICBpZmVxICgkKFBZVEhPTl9C
SU5ESU5HUyksMSkKICBpbnN0YWxsX3B5dGhvbjogbGliYnRyZnN1dGlsX3B5dGhvbgogIAkkKFEp
Y2QgbGliYnRyZnN1dGlsL3B5dGhvbjsgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTcuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjE5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjE3LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29sc182LjE5LmJiCmluZGV4IDhhNmU0YzI2OGYuLjQ2MGY3MGEzNWEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjE3LjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
MTkuYmIKQEAgLTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNf
VVJJID0gImdpdDovL2dpdGh1Yi5jb20va2RhdmUvYnRyZnMtcHJvZ3MuZ2l0O2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHR0cHM7dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFk
ZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gg
XAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMDY5ODE0MjhjMDhmNzhmMDE5YTJmNDk1NjQwN2Zk
ODRiNDk1ZTIxZSIKK1NSQ1JFViA9ICI5YWM5YTk3ZWUzZWJjYzcxYzU4NGEyMDJhMzFjY2Q2NDQy
YzQzNmRjIgogCiBQQUNLQUdFQ09ORklHID8/PSAiIFwKICAgICBwcm9ncmFtcyBcCi0tIAoyLjQ3
LjEKCg==

--===============4193329558979894602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info, removed "/usr/lib/libbtrfsutil.so.1.3.2 /usr/lib/libbtrfsutil.so.1.3 /usr/lib/libbtrfs.so.0.1.4", added "/usr/lib/libbtrfsutil.so.1.4.0 /usr/lib/libbtrfsutil.so.1.4 /usr/lib/libbtrfs.so.0.1.5"
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/libbtrfs.so.0.1 changed symlink target from libbtrfs.so.0.1.4 to libbtrfs.so.0.1.5
  /usr/lib/libbtrfs.so.0 changed symlink target from libbtrfs.so.0.1.4 to libbtrfs.so.0.1.5
  /usr/lib/libbtrfs.so changed symlink target from libbtrfs.so.0.1.4 to libbtrfs.so.0.1.5
  /usr/lib/libbtrfsutil.so.1 changed symlink target from libbtrfsutil.so.1.3.2 to libbtrfsutil.so.1.4.0
  /usr/lib/libbtrfsutil.so changed symlink target from libbtrfsutil.so.1.3.2 to libbtrfsutil.so.1.4.0
  /usr/lib/libbtrfs.so.0.1.4 moved to /usr/lib/libbtrfs.so.0.1.5
  /usr/lib/libbtrfsutil.so.1.3.2 moved to /usr/lib/libbtrfsutil.so.1.4.0
  /usr/lib/libbtrfsutil.so.1.3 moved to /usr/lib/libbtrfsutil.so.1.4
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info/dependency_links.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info/PKG-INFO was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info/SOURCES.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info/top_level.txt was removed

--===============4193329558979894602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.17.1 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: FILELIST: removed "/usr/lib/.debug/libbtrfsutil.so.1.3.2 /usr/lib/.debug/libbtrfs.so.0.1.4", added "/usr/lib/.debug/libbtrfsutil.so.1.4.0 /usr/lib/.debug/libbtrfs.so.0.1.5"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27351288 to 27511424 (+1%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.17.1" to "6.19"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.17.1 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 166890 to 166886 (-0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.17.1" to "6.19"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.17.1 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.17.1" to "6.19"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.17.1 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.17.1" to "6.19"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.17.1 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.17.1/include -> /usr/src/debug/btrfs-tools/6.19/include, directory renamed /usr/src/debug/btrfs-tools/6.17.1/libbtrfs -> /usr/src/debug/btrfs-tools/6.19/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.17.1/kernel-shared -> /usr/src/debug/btrfs-tools/6.19/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.17.1/image -> /usr/src/debug/btrfs-tools/6.19/image, directory renamed /usr/src/debug/btrfs-tools/6.17.1/crypto -> /usr/src/debug/btrfs-tools/6.19/crypto, directory renamed /usr/src/debug/btrfs-tools/6.17.1/convert -> /usr/src/debug/btrfs-tools/6.19/convert, directory renamed /usr/src/debug/btrfs-tools/6.17.1/cmds -> /usr/src/debug/btrfs-tools/6.19/cmds, directory renamed /usr/src/debug/btrfs-tools/6.17.1/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.19/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.17.1/check -> /usr/src/debug/btrfs-too
 ls/6.19/check, directory renamed /usr/src/debug/btrfs-tools/6.17.1/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/6.19/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/6.17.1 -> /usr/src/debug/btrfs-tools/6.19, directory renamed /usr/src/debug/btrfs-tools/6.17.1/mkfs -> /usr/src/debug/btrfs-tools/6.19/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.17.1/tune -> /usr/src/debug/btrfs-tools/6.19/tune, directory renamed /usr/src/debug/btrfs-tools/6.17.1/common -> /usr/src/debug/btrfs-tools/6.19/common, directory renamed /usr/src/debug/btrfs-tools/6.17.1/kernel-lib -> /usr/src/debug/btrfs-tools/6.19/kernel-lib
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4289382 to 4316388 (+1%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.17.1" to "6.19"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.17.1 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.17.1" to "6.19"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.17.1 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info, removed "/usr/lib/libbtrfsutil.so.1.3 /usr/lib/libbtrfsutil.so.1.3.2 /usr/lib/libbtrfs.so.0.1.4", added "/usr/lib/libbtrfsutil.so.1.4.0 /usr/lib/libbtrfsutil.so.1.4 /usr/lib/libbtrfs.so.0.1.5"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5938699 to 5976297 (+1%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.17.1" to "6.19"
packages/x86-64-v3-poky-linux/btrfs-tools: PKGV changed from 6.17.1 [default] to 6.19 [default]
packages/x86-64-v3-poky-linux/btrfs-tools: PV changed from "6.17.1" to "6.19"
packages/x86-64-v3-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.17.1 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.19 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/libbtrfs.so.0.1 changed symlink target from libbtrfs.so.0.1.4 to libbtrfs.so.0.1.5
  /usr/lib/libbtrfs.so.0 changed symlink target from libbtrfs.so.0.1.4 to libbtrfs.so.0.1.5
  /usr/lib/libbtrfs.so changed symlink target from libbtrfs.so.0.1.4 to libbtrfs.so.0.1.5
  /usr/lib/libbtrfsutil.so.1 changed symlink target from libbtrfsutil.so.1.3.2 to libbtrfsutil.so.1.4.0
  /usr/lib/libbtrfsutil.so changed symlink target from libbtrfsutil.so.1.3.2 to libbtrfsutil.so.1.4.0
  /usr/lib/libbtrfs.so.0.1.4 moved to /usr/lib/libbtrfs.so.0.1.5
  /usr/lib/libbtrfsutil.so.1.3.2 moved to /usr/lib/libbtrfsutil.so.1.4.0
  /usr/lib/libbtrfsutil.so.1.3 moved to /usr/lib/libbtrfsutil.so.1.4
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info/dependency_links.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info/PKG-INFO was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info/SOURCES.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19-py3.14.egg-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.17.1-py3.14.egg-info/top_level.txt was removed

--===============4193329558979894602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1953 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-7cd1587dfcf56c18ae94c35238422d77a64b62d5"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:7cd1587dfcf56c18ae94c35238422d77a64b62d5"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 442 Local 422 Mirrors 0 Missed 20 Current 238 (95% match, 97% complete)
done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 255 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 262 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 264 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 284 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 285 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 294 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 298 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 318 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 321 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 629 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_fetch)
NOTE: Running task 646 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_recipe_qa)
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 329 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 360 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 368 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 751 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 752 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_fetch)
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 380 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx_setscene)
NOTE: recipe btrfs-tools-6.19-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 404 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-6.19-r0: task do_fetch: Succeeded
NOTE: Running setscene task 417 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running task 801 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 806 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 438 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-6.19-r0: task do_unpack: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 454 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 462 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 468 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 477 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 484 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 492 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 521 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 535 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 972 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_patch)
NOTE: Running task 1030 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1037 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 547 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 550 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 553 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.19-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 560 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 564 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 565 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 588 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 592 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1112 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_patch)
NOTE: Running task 1113 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/zlib/1.3.1/temp/log.do_packagedata_setscene.187773
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 601 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe btrfs-tools-6.19-r0: task do_patch: Succeeded
NOTE: Running setscene task 610 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 618 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1146 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1147 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1149 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1150 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_populate_lic)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_populate_lic: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1161 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_populate_lic: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch unihash changed to e71479c4d0d5ed1a78619c036fac4f2561eb7a021a9dc0d4a60641271163a587
NOTE: recipe btrfs-tools-6.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1265 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1281 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running setscene task 642 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 654 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1326 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 680 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1606 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1629 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe zlib-1.3.1-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1891 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_collect_spdx_deps)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1896 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1898 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Succeeded
NOTE: Running task 1899 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1900 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1902 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package)
NOTE: Running task 1903 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1904 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1905 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_configure)
NOTE: recipe btrfs-tools-6.19-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_configure: Succeeded
NOTE: Running task 1906 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_compile)
NOTE: recipe btrfs-tools-6.19-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Succeeded
NOTE: Running task 1907 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata unihash changed to f19054394d160dfb583f14ac848c404b3ce597e472675bb39b53f5d0a520a1da
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_create_spdx)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1909 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_collect_spdx_deps)
NOTE: recipe btrfs-tools-6.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe btrfs-tools-6.19-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1910 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_install)
NOTE: recipe btrfs-tools-6.19-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_install: Succeeded
NOTE: Running task 1911 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_package)
NOTE: Running task 1912 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.19-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.19-r0: task do_package: Succeeded
NOTE: Running task 1913 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.19-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_packagedata: Succeeded
NOTE: Running task 1914 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_create_spdx)
NOTE: Running task 1915 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_package_write_ipk)
NOTE: Running task 1916 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_package_write_deb)
NOTE: Running task 1917 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_package_write_rpm)
NOTE: Running task 1918 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.19-r0: task do_create_spdx: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_package_write_ipk: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_package_write_deb: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 1919 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_create_package_spdx)
NOTE: recipe btrfs-tools-6.19-r0: task do_create_package_spdx: Started
NOTE: recipe btrfs-tools-6.19-r0: task do_package_write_ipk: Succeeded
NOTE: recipe btrfs-tools-6.19-r0: task do_create_package_spdx: Succeeded
NOTE: recipe btrfs-tools-6.19-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-6.19-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1920 of 1920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb:do_build)
NOTE: Tasks Summary: Attempted 1920 tasks of which 1873 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: zlib-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-src went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: zlib-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dbg went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: zlib-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-ptest went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: zlib-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-staticdev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: zlib-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: zlib-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-doc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: zlib-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-locale went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: zlib-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package zlib went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: zlib-1.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4193329558979894602==--

