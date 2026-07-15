Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A058EC4450A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 05:40:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.469.1784093993716785973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 22:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tfveL/jt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rVtsgvMg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f6449e73e-b3f8efc9-7506-4b8b-a1e0-a97543dbbbdd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784093992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PjzYspycWHacXsOMBmeTgWel7Vu1IQb6Qv6sfz4EvG4=;
	b=tfveL/jttTy9jeUl8+aZOX6NoIFjOojgVUgStT3UE0n1UHyfZgWPJOYw3/f+KhtX
	RqzFdXZzxl81svLO6BqcXk3E3646f9GvoOeQPSbmiGo5098sbloyBFsJ+PIIggpnohr
	xJO2GrAcCOPVKhjyhc3KUqcnO0I/O9dlrlmpYKVw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784093992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PjzYspycWHacXsOMBmeTgWel7Vu1IQb6Qv6sfz4EvG4=;
	b=rVtsgvMgsJSyr75QXYQBSKzaHJlEL5bQ2KXkXWYzwzz97k14oW2+DumI2Fl9x3Rp
	sTphYRd2MU0Plx7CtbIRB7YvYqHPEZgbAkLlLLOACRH9IUpU4cZzmoPG7ljnpsDDsVU
	CQl38s2lwSirwnexyDgl7ndLSZFHWONePVCbPeko=
Content-Type: multipart/mixed; boundary="===============8017123840774255265=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 7.1 SUCCEEDED
Message-ID: <0101019f6449e73e-b3f8efc9-7506-4b8b-a1e0-a97543dbbbdd-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jul 2026 05:39:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 05:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240932

--===============8017123840774255265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-7.0-7.1.patch
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
From d59ad0119192dd0b98b4cd157d9cea9bd218bdf1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jul 2026 05:18:39 +0000
Subject: [PATCH] btrfs-tools: upgrade 7.0 -> 7.1

---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../btrfs-tools/{btrfs-tools_7.0.bb => btrfs-tools_7.1.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_7.0.bb => btrfs-tools_7.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 7272c27c6c..91ff8a70f5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 7edcee57078769b7752275e0e5f35aefbfefc9eb Mon Sep 17 00:00:00 2001
+From 7bd2fff36ce967b4aab6b06c409c178ff66aca3d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 96c11830..3f2585cb 100644
+index e1c03f9a..d291cbc1 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -997,7 +997,7 @@ endif
+@@ -993,7 +993,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
index 72b5575703..36934c158c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "9c5987432906daebde23f9703c0f6f90c35fa9da"
+SRCREV = "4ab0e80be9e3bb1db2e6038e6d4316d35fb7ba8b"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============8017123840774255265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27852272 to 27920632 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/7.0/image -> /usr/src/debug/btrfs-tools/7.1/image, directory renamed /usr/src/debug/btrfs-tools/7.0/convert -> /usr/src/debug/btrfs-tools/7.1/convert, directory renamed /usr/src/debug/btrfs-tools/7.0/cmds -> /usr/src/debug/btrfs-tools/7.1/cmds, directory renamed /usr/src/debug/btrfs-tools/7.0/include -> /usr/src/debug/btrfs-tools/7.1/include, directory renamed /usr/src/debug/btrfs-tools/7.0/tune -> /usr/src/debug/btrfs-tools/7.1/tune, directory renamed /usr/src/debug/btrfs-tools/7.0/libbtrfs -> /usr/src/debug/btrfs-tools/7.1/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/7.0 -> /usr/src/debug/btrfs-tools/7.1, directory renamed /usr/src/debug/btrfs-tools/7.0/crypto -> /usr/src/debug/btrfs-tools/7.1/crypto, directory renamed /usr/src/debug/btrfs-tools/7.0/kernel-lib -> /usr/src/debug/btrfs-tools/7.1/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/7.0/mkfs -
 > /usr/src/debug/btrfs-tools/7.1/mkfs, directory renamed /usr/src/debug/btrfs-tools/7.0/common -> /usr/src/debug/btrfs-tools/7.1/common, directory renamed /usr/src/debug/btrfs-tools/7.0/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/7.1/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/7.0/check -> /usr/src/debug/btrfs-tools/7.1/check, directory renamed /usr/src/debug/btrfs-tools/7.0/kernel-shared -> /usr/src/debug/btrfs-tools/7.1/kernel-shared, removed "/usr/src/debug/btrfs-tools/7.0/libbtrfsutil/btrfsutil.h /usr/src/debug/btrfs-tools/7.0/libbtrfsutil/filesystem.c /usr/src/debug/btrfs-tools/7.0/libbtrfsutil/qgroup.c /usr/src/debug/btrfs-tools/7.0/libbtrfsutil/btrfs.h /usr/src/debug/btrfs-tools/7.0/libbtrfsutil/errors.c /usr/src/debug/btrfs-tools/7.0/libbtrfsutil/stubs.c /usr/src/debug/btrfs-tools/7.0/libbtrfsutil/subvolume.c /usr/src/debug/btrfs-tools/7.0/libbtrfsutil/btrfsutil_internal.h /usr/src/debug/btrfs-tools/7.0/libbtrfsutil/btrfs_tree.h", added "/usr/src/de
 bug/btrfs-tools/7.1/libbtrfsutil/btrfsutil.h /usr/src/debug/btrfs-tools/7.1/libbtrfsutil/filesystem.c /usr/src/debug/btrfs-tools/7.1/libbtrfsutil/qgroup.c /usr/src/debug/btrfs-tools/7.1/libbtrfsutil/btrfs.h /usr/src/debug/btrfs-tools/7.1/libbtrfsutil/errors.c /usr/src/debug/btrfs-tools/7.1/libbtrfsutil/subvolume.c /usr/src/debug/btrfs-tools/7.1/libbtrfsutil/btrfsutil_internal.h /usr/src/debug/btrfs-tools/7.1/libbtrfsutil/btrfs_tree.h"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4327127 to 4339284 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-7.1-py3.14.egg-info
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6107368 to 6111464 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PV changed from "7.0" to "7.1"
packages/x86-64-v3-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v7.0 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v7.1 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/x86-64-v3-poky-linux/btrfs-tools: PKGV changed from 7.0 [default] to 7.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools: PV changed from "7.0" to "7.1"
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info moved to /usr/lib/python3.14/site-packages/btrfsutil-7.1-py3.14.egg-info

--===============8017123840774255265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-7.1-py3.14.egg-info
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info moved to /usr/lib/python3.14/site-packages/btrfsutil-7.1-py3.14.egg-info

--===============8017123840774255265==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-7.0-7.1.patch"

RnJvbSBkNTlhZDAxMTkxOTJkZDBiOThiNGNkMTU3ZDljZWE5YmQyMThiZGYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSnVsIDIwMjYgMDU6MTg6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA3LjAgLT4gNy4xCgotLS0KIC4uLmQtYS1wb3NzaWJpbGl0eS10
by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIHwgNiArKystLS0KIC4uLi9i
dHJmcy10b29scy97YnRyZnMtdG9vbHNfNy4wLmJiID0+IGJ0cmZzLXRvb2xzXzcuMS5iYn0gIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc183LjAu
YmIgPT4gYnRyZnMtdG9vbHNfNy4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5
LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10
by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCmluZGV4IDcyNzJjMjdjNmMu
LjkxZmY4YTcwZjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29s
cy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0
aG9uLW1vZHVsZXMtYXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRv
b2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1w
eXRob24tbW9kdWxlcy1hci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2VkY2VlNTcwNzg3
NjliNzc1MjI3NWUwZTVmMzVhZWZiZmVmYzllYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gN2JkMmZmZjM2Y2U5NjdiNGFhYjZiMDZjNDA5YzE3OGZmNjZhY2EzZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogRGF0ZTogV2VkLCAyMyBNYXkgMjAxOCAyMToyMDozNSArMDMwMAogU3ViamVjdDogW1BB
VENIXSBBZGQgYSBwb3NzaWJpbGl0eSB0byBzcGVjaWZ5IHdoZXJlIHB5dGhvbiBtb2R1bGVzIGFy
ZQpAQCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5kZXgg
OTZjMTE4MzAuLjNmMjU4NWNiIDEwMDY0NAoraW5kZXggZTFjMDNmOWEuLmQyOTFjYmMxIDEwMDY0
NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtOTk3LDcgKzk5Nyw3IEBAIGVu
ZGlmCitAQCAtOTkzLDcgKzk5Myw3IEBAIGVuZGlmCiAgaWZlcSAoJChQWVRIT05fQklORElOR1Mp
LDEpCiAgaW5zdGFsbF9weXRob246IGxpYmJ0cmZzdXRpbF9weXRob24KICAJJChRKWNkIGxpYmJ0
cmZzdXRpbC9weXRob247IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJm
cy10b29scy9idHJmcy10b29sc183LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMt
dG9vbHMvYnRyZnMtdG9vbHNfNy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc183LjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc183LjEu
YmIKaW5kZXggNzJiNTU3NTcwMy4uMzY5MzRjMTU4YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzcuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNy4xLmJiCkBAIC0xOCw3ICsxOCw3
IEBAIERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL2tkYXZlL2J0cmZzLXByb2dzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO3Rh
Zz12JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1z
cGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JD
UkVWID0gIjljNTk4NzQzMjkwNmRhZWJkZTIzZjk3MDNjMGY2ZjkwYzM1ZmE5ZGEiCitTUkNSRVYg
PSAiNGFiMGU4MGJlOWUzYmIxZGIyZTYwMzhlNmQ0MzE2ZDM1ZmI3YmE4YiIKIAogUEFDS0FHRUNP
TkZJRyA/Pz0gIiBcCiAgICAgcHJvZ3JhbXMgXAotLSAKMi40Ny4xCgo=

--===============8017123840774255265==--

