Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1649C83034
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.27804.1748786147994251828
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ewaC9Xa2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rGO88bvz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101972bc6f034-0a9147fb-466c-4ad0-babb-9c6736a52c99-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3mYsXbh4v4TvEMaVLgvJk06hKIaZCQOXW9xdvxgU7cI=;
	b=ewaC9Xa2YdhLeivFfSXBWlqK5EeQCOqTZ2jrmLG01WzFnQnyB6sjnatcW4LKQioV
	f/+R3575XL/oHJG6S143cHXN8Pi8l6NsfoM2UDbRcRaYaPjb6MwvYfNRp3a/pW1gnzT
	og6p1mBNGglyH5LoIVJC+YzhP0ogCj0+NAJOo+zo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3mYsXbh4v4TvEMaVLgvJk06hKIaZCQOXW9xdvxgU7cI=;
	b=rGO88bvzjOhkvMVzFjQ6B83OBLovitAOdK6VE2bpOlt0BzZSdc8Hutey0j8XEopA
	8K+Xgll2WM1sZjqoQUCM5NS1mUZo6FzMx607kn75kG+VLdxdsYo3URW4AxqVSrw4SOL
	z51x57gv/BfFEMD/eurPaXNiTB4sk1j9aQd9NcI4=
Content-Type: multipart/mixed; boundary="===============1799717647335566640=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 11.2.1 SUCCEEDED
Message-ID: <010101972bc6f034-0a9147fb-466c-4ad0-babb-9c6736a52c99-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217645

--===============1799717647335566640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *11.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-11.2.0-11.2.1.patch
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
From 0c6233f3ade52c7e6f5e607567da816aad35cb20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 11:46:31 +0000
Subject: [PATCH] harfbuzz: upgrade 11.2.0 -> 11.2.1

---
 ...se-Os-to-compile-hb-subset-plan-layout.cc.patch | 14 +++++++-------
 .../{harfbuzz_11.2.0.bb => harfbuzz_11.2.1.bb}     |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.2.0.bb => harfbuzz_11.2.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
index 299843797b..5fde339800 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
@@ -1,4 +1,4 @@
-From 8d876ea19579ee6b687668921c17be423cf7d6c2 Mon Sep 17 00:00:00 2001
+From ada8566d35af9e452eb4c5c76cb935a9452dbb38 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Apr 2025 15:26:09 -0700
 Subject: [PATCH] Use -Os to compile hb-subset-plan-layout.cc
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/src/meson.build b/src/meson.build
-index 3d1c00d..fded728 100644
+index cbe5d9e..d7fc764 100644
 --- a/src/meson.build
 +++ b/src/meson.build
-@@ -393,7 +393,6 @@ hb_subset_sources = files(
+@@ -398,7 +398,6 @@ hb_subset_sources = files(
    'hb-subset-instancer-solver.hh',
    'hb-subset-instancer-solver.cc',
    'hb-subset-plan.cc',
@@ -28,7 +28,7 @@ index 3d1c00d..fded728 100644
    'hb-subset-plan-var.cc',
    'hb-subset-plan.hh',
    'hb-subset-plan-member-list.hh',
-@@ -410,6 +409,10 @@ hb_subset_sources = files(
+@@ -415,6 +414,10 @@ hb_subset_sources = files(
    'hb-subset.hh',
  )
  
@@ -39,7 +39,7 @@ index 3d1c00d..fded728 100644
  hb_subset_headers = files(
    'hb-subset.h',
    'hb-subset-serialize.h'
-@@ -618,6 +621,12 @@ endif
+@@ -629,6 +632,12 @@ endif
  
  darwin_versions = [hb_version_int, '@0@.0.0'.format(hb_version_int)]
  
@@ -52,7 +52,7 @@ index 3d1c00d..fded728 100644
  libharfbuzz = library('harfbuzz', hb_sources,
    include_directories: incconfig,
    dependencies: harfbuzz_deps,
-@@ -645,7 +654,7 @@ defs_list += [harfbuzz_subset_def]
+@@ -656,7 +665,7 @@ defs_list += [harfbuzz_subset_def]
  libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
    include_directories: incconfig,
    dependencies: [m_dep],
@@ -61,7 +61,7 @@ index 3d1c00d..fded728 100644
    cpp_args: cpp_args + extra_hb_cpp_args,
    soversion: hb_so_version,
    version: version,
-@@ -657,7 +666,7 @@ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
+@@ -668,7 +677,7 @@ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
  custom_target('harfbuzz-subset.cc',
    build_by_default: true,
    output: 'harfbuzz-subset.cc',
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
index db5a04486c..71eada7f28 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 SRC_URI += "file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch"
-SRC_URI[sha256sum] = "50f7d0a208367e606dbf6eecc5cfbecc01a47be6ee837ae7aff2787e24b09b45"
+SRC_URI[sha256sum] = "093714c8548a285094685f0bdc999e202d666b59eeb3df2ff921ab68b8336a49"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.47.1


--===============1799717647335566640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 84050016 to 84026880 (-0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-gobject.so.0.61120.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61120.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61120.0 /usr/lib/.debug/libharfbuzz.so.0.61120.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61120.0", added "/usr/lib/.debug/libharfbuzz-icu.so.0.61121.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61121.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61121.0 /usr/lib/.debug/libharfbuzz.so.0.61121.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61120.0", added "/usr/lib/libharfbuzz-icu.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61120.0", added "/usr/lib/libharfbuzz-subset.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1761166 to 1765262 (+0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61120.0 /usr/lib/libharfbuzz-gobject.so.0.61120.0 /usr/lib/libharfbuzz.so.0.61120.0", added "/usr/lib/libharfbuzz-gobject.so.0.61121.0 /usr/lib/libharfbuzz-cairo.so.0.61121.0 /usr/lib/libharfbuzz.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/11.2.0/harfbuzz-11.2.0.tar.xz file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch" to "https://github.com/harfbuzz/harfbuzz/releases//download/11.2.1/harfbuzz-11.2.1.tar.xz file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch"
packages/core2-64-poky-linux/harfbuzz: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61120.0 to libharfbuzz-cairo.so.0.61121.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61120.0 to libharfbuzz-gobject.so.0.61121.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61120.0 to libharfbuzz-icu.so.0.61121.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61120.0 to libharfbuzz.so.0.61121.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61120.0 to libharfbuzz-subset.so.0.61121.0
  /usr/lib/libharfbuzz-cairo.so.0.61120.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61121.0
  /usr/lib/libharfbuzz-gobject.so.0.61120.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61121.0
  /usr/lib/libharfbuzz-icu.so.0.61120.0 moved to /usr/lib/libharfbuzz-icu.so.0.61121.0
  /usr/lib/libharfbuzz.so.0.61120.0 moved to /usr/lib/libharfbuzz.so.0.61121.0
  /usr/lib/libharfbuzz-subset.so.0.61120.0 moved to /usr/lib/libharfbuzz-subset.so.0.61121.0

--===============1799717647335566640==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-11.2.0-11.2.1.patch"

RnJvbSAwYzYyMzNmM2FkZTUyYzdlNmY1ZTYwNzU2N2RhODE2YWFkMzVjYjIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMTo0NjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDExLjIuMCAtPiAxMS4yLjEKCi0tLQogLi4uc2UtT3MtdG8tY29tcGls
ZS1oYi1zdWJzZXQtcGxhbi1sYXlvdXQuY2MucGF0Y2ggfCAxNCArKysrKysrLS0tLS0tLQogLi4u
L3toYXJmYnV6el8xMS4yLjAuYmIgPT4gaGFyZmJ1enpfMTEuMi4xLmJifSAgICAgfCAgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L3toYXJmYnV6el8xMS4yLjAuYmIgPT4gaGFy
ZmJ1enpfMTEuMi4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9oYXJmYnV6ei9oYXJmYnV6ei8wMDAxLVVzZS1Pcy10by1jb21waWxlLWhiLXN1YnNldC1wbGFu
LWxheW91dC5jYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6
ei8wMDAxLVVzZS1Pcy10by1jb21waWxlLWhiLXN1YnNldC1wbGFuLWxheW91dC5jYy5wYXRjaApp
bmRleCAyOTk4NDM3OTdiLi41ZmRlMzM5ODAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvaGFyZmJ1enovaGFyZmJ1enovMDAwMS1Vc2UtT3MtdG8tY29tcGlsZS1oYi1zdWJzZXQt
cGxhbi1sYXlvdXQuY2MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6LzAwMDEtVXNlLU9zLXRvLWNvbXBpbGUtaGItc3Vic2V0LXBsYW4tbGF5b3V0LmNj
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4ZDg3NmVhMTk1NzllZTZiNjg3NjY4OTIxYzE3
YmU0MjNjZjdkNmMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhZGE4NTY2ZDM1YWY5
ZTQ1MmViNGM1Yzc2Y2I5MzVhOTQ1MmRiYjM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMjcgQXByIDIwMjUg
MTU6MjY6MDkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gVXNlIC1PcyB0byBjb21waWxlIGhiLXN1
YnNldC1wbGFuLWxheW91dC5jYwpAQCAtMTcsMTAgKzE3LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvbWVzb24uYnVpbGQgYi9z
cmMvbWVzb24uYnVpbGQKLWluZGV4IDNkMWMwMGQuLmZkZWQ3MjggMTAwNjQ0CitpbmRleCBjYmU1
ZDllLi5kN2ZjNzY0IDEwMDY0NAogLS0tIGEvc3JjL21lc29uLmJ1aWxkCiArKysgYi9zcmMvbWVz
b24uYnVpbGQKLUBAIC0zOTMsNyArMzkzLDYgQEAgaGJfc3Vic2V0X3NvdXJjZXMgPSBmaWxlcygK
K0BAIC0zOTgsNyArMzk4LDYgQEAgaGJfc3Vic2V0X3NvdXJjZXMgPSBmaWxlcygKICAgICdoYi1z
dWJzZXQtaW5zdGFuY2VyLXNvbHZlci5oaCcsCiAgICAnaGItc3Vic2V0LWluc3RhbmNlci1zb2x2
ZXIuY2MnLAogICAgJ2hiLXN1YnNldC1wbGFuLmNjJywKQEAgLTI4LDcgKzI4LDcgQEAgaW5kZXgg
M2QxYzAwZC4uZmRlZDcyOCAxMDA2NDQKICAgICdoYi1zdWJzZXQtcGxhbi12YXIuY2MnLAogICAg
J2hiLXN1YnNldC1wbGFuLmhoJywKICAgICdoYi1zdWJzZXQtcGxhbi1tZW1iZXItbGlzdC5oaCcs
Ci1AQCAtNDEwLDYgKzQwOSwxMCBAQCBoYl9zdWJzZXRfc291cmNlcyA9IGZpbGVzKAorQEAgLTQx
NSw2ICs0MTQsMTAgQEAgaGJfc3Vic2V0X3NvdXJjZXMgPSBmaWxlcygKICAgICdoYi1zdWJzZXQu
aGgnLAogICkKICAKQEAgLTM5LDcgKzM5LDcgQEAgaW5kZXggM2QxYzAwZC4uZmRlZDcyOCAxMDA2
NDQKICBoYl9zdWJzZXRfaGVhZGVycyA9IGZpbGVzKAogICAgJ2hiLXN1YnNldC5oJywKICAgICdo
Yi1zdWJzZXQtc2VyaWFsaXplLmgnCi1AQCAtNjE4LDYgKzYyMSwxMiBAQCBlbmRpZgorQEAgLTYy
OSw2ICs2MzIsMTIgQEAgZW5kaWYKICAKICBkYXJ3aW5fdmVyc2lvbnMgPSBbaGJfdmVyc2lvbl9p
bnQsICdAMEAuMC4wJy5mb3JtYXQoaGJfdmVyc2lvbl9pbnQpXQogIApAQCAtNTIsNyArNTIsNyBA
QCBpbmRleCAzZDFjMDBkLi5mZGVkNzI4IDEwMDY0NAogIGxpYmhhcmZidXp6ID0gbGlicmFyeSgn
aGFyZmJ1enonLCBoYl9zb3VyY2VzLAogICAgaW5jbHVkZV9kaXJlY3RvcmllczogaW5jY29uZmln
LAogICAgZGVwZW5kZW5jaWVzOiBoYXJmYnV6el9kZXBzLAotQEAgLTY0NSw3ICs2NTQsNyBAQCBk
ZWZzX2xpc3QgKz0gW2hhcmZidXp6X3N1YnNldF9kZWZdCitAQCAtNjU2LDcgKzY2NSw3IEBAIGRl
ZnNfbGlzdCArPSBbaGFyZmJ1enpfc3Vic2V0X2RlZl0KICBsaWJoYXJmYnV6el9zdWJzZXQgPSBs
aWJyYXJ5KCdoYXJmYnV6ei1zdWJzZXQnLCBoYl9zdWJzZXRfc291cmNlcywKICAgIGluY2x1ZGVf
ZGlyZWN0b3JpZXM6IGluY2NvbmZpZywKICAgIGRlcGVuZGVuY2llczogW21fZGVwXSwKQEAgLTYx
LDcgKzYxLDcgQEAgaW5kZXggM2QxYzAwZC4uZmRlZDcyOCAxMDA2NDQKICAgIGNwcF9hcmdzOiBj
cHBfYXJncyArIGV4dHJhX2hiX2NwcF9hcmdzLAogICAgc292ZXJzaW9uOiBoYl9zb192ZXJzaW9u
LAogICAgdmVyc2lvbjogdmVyc2lvbiwKLUBAIC02NTcsNyArNjY2LDcgQEAgbGliaGFyZmJ1enpf
c3Vic2V0ID0gbGlicmFyeSgnaGFyZmJ1enotc3Vic2V0JywgaGJfc3Vic2V0X3NvdXJjZXMsCitA
QCAtNjY4LDcgKzY3Nyw3IEBAIGxpYmhhcmZidXp6X3N1YnNldCA9IGxpYnJhcnkoJ2hhcmZidXp6
LXN1YnNldCcsIGhiX3N1YnNldF9zb3VyY2VzLAogIGN1c3RvbV90YXJnZXQoJ2hhcmZidXp6LXN1
YnNldC5jYycsCiAgICBidWlsZF9ieV9kZWZhdWx0OiB0cnVlLAogICAgb3V0cHV0OiAnaGFyZmJ1
enotc3Vic2V0LmNjJywKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6
ei9oYXJmYnV6el8xMS4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFy
ZmJ1enpfMTEuMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMS4yLjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMS4yLjEuYmIKaW5kZXggZGI1YTA0
NDg2Yy4uNzFlYWRhN2YyOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZi
dXp6L2hhcmZidXp6XzExLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1
enovaGFyZmJ1enpfMTEuMi4xLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWI5ODQyOWI4ZThlM2MyYTY3Y2ZlZjAxZTk5ZTQ4OTNkIFwK
IAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7
UFZ9LnRhci54eiIKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLVVzZS1Pcy10by1jb21waWxlLWhi
LXN1YnNldC1wbGFuLWxheW91dC5jYy5wYXRjaCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1MGY3
ZDBhMjA4MzY3ZTYwNmRiZjZlZWNjNWNmYmVjYzAxYTQ3YmU2ZWU4MzdhZTdhZmYyNzg3ZTI0YjA5
YjQ1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA5MzcxNGM4NTQ4YTI4NTA5NDY4NWYwYmRjOTk5
ZTIwMmQ2NjZiNTllZWIzZGYyZmY5MjFhYjY4YjgzMzZhNDkiCiAKIERFUEVORFMgKz0gImdsaWIt
Mi4wLW5hdGl2ZSIKIAotLSAKMi40Ny4xCgo=

--===============1799717647335566640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61120.0", added "/usr/lib/libharfbuzz-icu.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61120.0", added "/usr/lib/libharfbuzz-subset.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61120.0 /usr/lib/libharfbuzz-cairo.so.0.61120.0 /usr/lib/libharfbuzz.so.0.61120.0", added "/usr/lib/libharfbuzz-gobject.so.0.61121.0 /usr/lib/libharfbuzz-cairo.so.0.61121.0 /usr/lib/libharfbuzz.so.0.61121.0"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61120.0 to libharfbuzz-cairo.so.0.61121.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61120.0 to libharfbuzz-gobject.so.0.61121.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61120.0 to libharfbuzz-icu.so.0.61121.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61120.0 to libharfbuzz.so.0.61121.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61120.0 to libharfbuzz-subset.so.0.61121.0
  /usr/lib/libharfbuzz-cairo.so.0.61120.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61121.0
  /usr/lib/libharfbuzz-gobject.so.0.61120.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61121.0
  /usr/lib/libharfbuzz-icu.so.0.61120.0 moved to /usr/lib/libharfbuzz-icu.so.0.61121.0
  /usr/lib/libharfbuzz.so.0.61120.0 moved to /usr/lib/libharfbuzz.so.0.61121.0
  /usr/lib/libharfbuzz-subset.so.0.61120.0 moved to /usr/lib/libharfbuzz-subset.so.0.61121.0

--===============1799717647335566640==--

