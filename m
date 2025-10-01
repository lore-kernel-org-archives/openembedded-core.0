Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB88FCCD199
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.17939.1759325536067828509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y/fYeB/1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Av1zytXa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101999ff93c6e-c59c1e09-e344-42df-9365-105d5c6e4da8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tJDkFdlQ6f5B3mDfx7rUI1jn4j5NVGjU1xZbs10AnsM=;
	b=Y/fYeB/1q00m2b+CCPkGrjotNN+LzpTwpib+mXZgZSiHsadlgeF9uPGl467dsXdA
	V423Z++g2jWlFfYtKpJ/QazYQhnB+arQaMts7p1M4Q3pG/JiWEIvnkxJcJEaYWOcn6d
	qGLVi2SRgaLGNP0el1aPqZlztFzN0MD66E8gLNRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tJDkFdlQ6f5B3mDfx7rUI1jn4j5NVGjU1xZbs10AnsM=;
	b=Av1zytXa42ahVBML+UUc9wgZt7f+7UBujbXNILwq3g8xsc8Aw3kT83lJ1A8lv3tO
	zf67po1xg6IK4LKdcyb0Gwd0SdyoI6D+Ug/abwXrZhJoeqbrH9X7YbFHKNQ6X8DqWkU
	mJuLlLhKLNtvRcQM+bpEUZxMP61ArZgtR1bm8CEs=
Content-Type: multipart/mixed; boundary="===============9174573743344276631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.17 SUCCEEDED
Message-ID: <010101999ff93c6e-c59c1e09-e344-42df-9365-105d5c6e4da8-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224224

--===============9174573743344276631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.16-6.17.patch
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
From 43edf549c6002c934129826fce4fbca8539c3ebc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 08:28:03 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.16 -> 6.17

---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.16.bb => btrfs-tools_6.17.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.16.bb => btrfs-tools_6.17.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 2cd66d2722..718735bc38 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
+From 5918ecc003773a9d073a61e4423d1f2d62c3830d Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb
index ef809d384b..bb72cb0c04 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "54694de98fdc4ea5678cdd77b920c044bbf64f26"
+SRCREV = "c03e29f083678f47a7d7d810db4d21d905979b77"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============9174573743344276631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27118336 to 27207080 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4256836 to 4286797 (+1%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5881343 to 5926409 (+1%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/btrfs-tools: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/btrfs-tools: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.16 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.17 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.17-py3.13.egg-info

--===============9174573743344276631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.16-6.17.patch"

RnJvbSA0M2VkZjU0OWM2MDAyYzkzNDEyOTgyNmZjZTRmYmNhODUzOWMzZWJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwODoyODowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMTYgLT4gNi4xNwoKLS0tCiAuLi5kLWEtcG9zc2liaWxpdHkt
dG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCB8IDYgKysrLS0tCiAuLi4v
e2J0cmZzLXRvb2xzXzYuMTYuYmIgPT4gYnRyZnMtdG9vbHNfNi4xNy5iYn0gICAgICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNi4x
Ni5iYiA9PiBidHJmcy10b29sc182LjE3LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmls
aXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0
eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCmluZGV4IDJjZDY2ZDI3
MjIuLjcxODczNWJjMzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10
b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUt
cHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZz
LXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVy
ZS1weXRob24tbW9kdWxlcy1hci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDMwZWM4MWMw
ZGFjMWUwNjdmYWY0OTkyNGQ1NjMxYmIyMmNjYzkwZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNTkxOGVjYzAwMzc3M2E5ZDA3M2E2MWU0NDIzZDFmMmQ2MmMzODMwZCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogV2VkLCAyMyBNYXkgMjAxOCAyMToyMDozNSArMDMwMAogU3ViamVjdDog
W1BBVENIXSBBZGQgYSBwb3NzaWJpbGl0eSB0byBzcGVjaWZ5IHdoZXJlIHB5dGhvbiBtb2R1bGVz
IGFyZQpAQCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5k
ZXggN2UzNmFhNDIuLmVkZmY3ZDViIDEwMDY0NAoraW5kZXggOTZjMTE4MzAuLjNmMjU4NWNiIDEw
MDY0NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtOTk2LDcgKzk5Niw3IEBA
IGVuZGlmCitAQCAtOTk3LDcgKzk5Nyw3IEBAIGVuZGlmCiAgaWZlcSAoJChQWVRIT05fQklORElO
R1MpLDEpCiAgaW5zdGFsbF9weXRob246IGxpYmJ0cmZzdXRpbF9weXRob24KICAJJChRKWNkIGxp
YmJ0cmZzdXRpbC9weXRob247IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
dHJmcy10b29scy9idHJmcy10b29sc182LjE2LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0
cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTcuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTYu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjE3LmJiCmluZGV4IGVmODA5ZDM4NGIuLmJiNzJjYjBjMDQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjE2LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjE3LmJiCkBAIC0x
OCw3ICsxOCw3IEBAIERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL2tkYXZlL2J0cmZzLXByb2dzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29s
PWh0dHBzO3RhZz12JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtYS1wb3NzaWJp
bGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIFwKICAgICAgICAg
ICAgIgotU1JDUkVWID0gIjU0Njk0ZGU5OGZkYzRlYTU2NzhjZGQ3N2I5MjBjMDQ0YmJmNjRmMjYi
CitTUkNSRVYgPSAiYzAzZTI5ZjA4MzY3OGY0N2E3ZDdkODEwZGI0ZDIxZDkwNTk3OWI3NyIKIAog
UEFDS0FHRUNPTkZJRyA/Pz0gIiBcCiAgICAgcHJvZ3JhbXMgXAotLSAKMi40Ny4xCgo=

--===============9174573743344276631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.17-py3.13.egg-info

--===============9174573743344276631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1940 targets, 51 skipped, 0 masked, 0 errors.
Removing 60 recipes from the qemux86_64 sysroot...done.
Removing 52 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-7dfda4fad83aa8859d300f2a782eab55fdad76f3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7dfda4fad83aa8859d300f2a782eab55fdad76f3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 448 Local 430 Mirrors 0 Missed 18 Current 231 (95% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 239 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 253 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 254 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 259 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 289 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 298 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_populate_lic_setscene)
NOTE: Running setscene task 301 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 309 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 311 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 312 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_populate_lic_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 321 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 325 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 344 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 349 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 827 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 895 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_fetch)
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 350 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-6.17-r0: task do_recipe_qa: Started
NOTE: Running setscene task 359 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 361 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_recipe_qa: Succeeded
NOTE: Running task 939 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_fetch: Started
NOTE: Running setscene task 390 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 975 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running setscene task 417 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 436 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 440 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 454 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/expat/2.7.2/temp/log.do_packagedata_setscene.1447374
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_package_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 468 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 488 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 512 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 520 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1040 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_patch)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 544 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Started
NOTE: Running setscene task 552 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 554 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 576 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.2-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 592 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1163 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_unpack)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1186 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1191 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-6.17-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 619 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1229 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 625 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1246 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1258 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 634 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1272 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1278 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_patch: Succeeded
NOTE: Running task 1284 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 646 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-6.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 1286 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 651 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 671 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 679 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1326 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1595 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1698 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_packagedata)
NOTE: Running task 1875 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe expat-2.7.2-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1891 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Succeeded
NOTE: Running task 1892 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1893 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Succeeded
NOTE: Running task 1894 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1895 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Succeeded
NOTE: Running task 1896 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1897 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package)
NOTE: Running task 1898 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1899 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1900 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_configure)
NOTE: recipe btrfs-tools-6.17-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_compile)
NOTE: recipe btrfs-tools-6.17-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Succeeded
NOTE: Running task 1902 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata unihash changed to 41d5456fe0678c753056cf29a45ead099954dde6afe90f9791beb6ac526fa5b2
NOTE: Setscene tasks completed
NOTE: Running task 1903 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_create_spdx)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1904 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_collect_spdx_deps)
NOTE: recipe btrfs-tools-6.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1905 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_install)
NOTE: recipe btrfs-tools-6.17-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_package)
NOTE: Running task 1907 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.17-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.17-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_packagedata: Succeeded
NOTE: Running task 1909 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_create_spdx)
NOTE: Running task 1910 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_package_write_ipk)
NOTE: Running task 1911 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_package_write_deb)
NOTE: Running task 1912 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_package_write_rpm)
NOTE: Running task 1913 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.17-r0: task do_create_spdx: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_package_write_ipk: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_package_write_deb: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 1914 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_create_package_spdx)
NOTE: recipe btrfs-tools-6.17-r0: task do_create_package_spdx: Started
NOTE: recipe btrfs-tools-6.17-r0: task do_package_write_ipk: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_create_package_spdx: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-6.17-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1915 of 1915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb:do_build)
NOTE: Tasks Summary: Attempted 1915 tasks of which 1870 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: expat-2.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.7.3-r0 to 0:2.7.2-r0) [version-going-backwards]
ERROR: expat-2.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.7.3-r0 to 0:2.7.2-r0) [version-going-backwards]
ERROR: expat-2.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.7.3-r0 to 0:2.7.2-r0) [version-going-backwards]
ERROR: expat-2.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.7.3-r0 to 0:2.7.2-r0) [version-going-backwards]
ERROR: expat-2.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.7.3-r0 to 0:2.7.2-r0) [version-going-backwards]
ERROR: expat-2.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.7.3-r0 to 0:2.7.2-r0) [version-going-backwards]
ERROR: expat-2.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.7.3-r0 to 0:2.7.2-r0) [version-going-backwards]
ERROR: expat-2.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.7.3-r0 to 0:2.7.2-r0) [version-going-backwards]
ERROR: expat-2.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.7.3-r0 to 0:2.7.2-r0) [version-going-backwards]
ERROR: expat-2.7.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9174573743344276631==--

