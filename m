Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0215EC8303A
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.27788.1748786148272851647
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EW1xitNq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mjvV/Cv+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101972bc6f1f6-d702cef4-3378-4a03-a5bc-2c35775d1a6a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o2g/8RK2mdfbOzSM/ePVZ7LpY+eVAl/B7hW3SYisxhM=;
	b=EW1xitNqHtcR2L0Ji4AhMYZ0vd10A4HFjqBlKlyeuYEUnUyhJ5rxH0r2ps9pD7oo
	xEwzU6JiibohB0tyG3zDGgRbIKG1Ay++cBQZeNAk/82uBQjSD6dZIKVXoUtiH9i8Doc
	2WnvUj6AGxModg8kyZ8pLvRVljV3Id5SVKAz974w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o2g/8RK2mdfbOzSM/ePVZ7LpY+eVAl/B7hW3SYisxhM=;
	b=mjvV/Cv+8XSctuiRjSWQMl5HZ7PF8EshMc2SQkQXQRMl0SIxIdk4oA8RY0OubxPc
	94+l7pQEz/Ft4CHjokt4cm30AgVtUPjJ+JCINxSs2mNt5Hme6tvA9sItHBBgsvmhgPr
	xmmW0ZAwadx97fzYUHJ/gqxgBaqnUuRcED8LjqUs=
Content-Type: multipart/mixed; boundary="===============2505186303354550237=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to cabe21dc6a943d652b320deb2ee0e5221b0da37e
 SUCCEEDED
Message-ID: <010101972bc6f1f6-d702cef4-3378-4a03-a5bc-2c35775d1a6a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217646

--===============2505186303354550237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *cabe21dc6a943d652b320deb2ee0e5221b0da37e* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
From f75179bd40088d4c7770c2eb08f60af2ce84afee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 12:11:09 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 4 ++--
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch     | 2 +-
 ...tests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                    | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 6ce2348a71..ba21bab79b 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 9ffd24add3263e24975318e693309881eadd99a2 Mon Sep 17 00:00:00 2001
+From 1eaf3b38d034bb007ad52a537ddcc16b8b1db0cb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 99ae07a4a..d5ee9cc22 100644
+index 147bd8e17..ffc910354 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 9751b20673..ab7384de41 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 0ba2f908f2a2a897e8e06e34f99893d11ee4734c Mon Sep 17 00:00:00 2001
+From 62aa31cb14e47365b39d05a5ac87bb8ed4af30f8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index c6c072c7e0..64c523f1e0 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From d6ed4c477f22309c09accd4fee68486d7714f205 Mon Sep 17 00:00:00 2001
+From c2afa42b456f1e38ced7067c6e692e86395302af Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 6cb561c3f2..921aad5bcd 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From deb0c15890fb9d0f4fc7074dde2a51c89cb5bf6d Mon Sep 17 00:00:00 2001
+From c649415369e64fc6b28f1222e60ceec4618624f7 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 7706d88086..9985b411db 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 66d1d86ff8be33df265d0dda717be385fe8637cd Mon Sep 17 00:00:00 2001
+From 0987a5b068818ac36e800c25dc6dad0dcc618c74 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e30efdf33b..8060d51440 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "05f02cb2ff1787892cba38c3b609f892419bae87"
+SRCREV = "cabe21dc6a943d652b320deb2ee0e5221b0da37e"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============2505186303354550237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/push-pop-color-material /usr/lib/piglit/tests/spec/arb_shading_language_420pack/linker/instance-matching-uniform-blocks-binding-qualifier-mismatch-2.shader_test /usr/lib/piglit/bin/fbo-integer-attachments /usr/lib/piglit/tests/spec/ext_shader_clock/execution/clock2x32.shader_test /usr/lib/piglit/bin/mesa-bug11100-cs /usr/lib/piglit/bin/mesa-bug11100-fs"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2054299752 to 2054364665 (+0%)

--===============2505186303354550237==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBmNzUxNzliZDQwMDg4ZDRjNzc3MGMyZWIwOGY2MGFmMmNlODRhZmVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMjoxMTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogLi4uQ01ha2VMaXN0cy50eHQt
ZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaCB8IDQgKystLQogLi4u
LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoICAg
ICB8IDIgKy0KIC4uLnRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNz
aW9uLWNvbmQucGF0Y2ggfCAyICstCiAuLi4vMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRf
SU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoIHwgMiArLQogLi4udGVzdHMtdXRpbC1waWdsaXQt
c2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCB8IDIgKy0KIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiAgICAgICAgICAgICAgICAgICAgfCAy
ICstCiA2IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtl
TGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRv
LW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2gKaW5kZXggNmNlMjM0OGE3
MS4uYmEyMWJhYjc5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1w
YXRoLWZyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAw
MDEtQ01ha2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWZmZDI0YWRkMzI2M2UyNDk3NTMxOGU2OTMzMDk4
ODFlYWRkOTlhMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWVhZjNiMzhkMDM0YmIw
MDdhZDUyYTUzN2RkY2MxNmI4YjFkYjBjYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDIzIEF1
ZyAyMDI0IDE1OjI5OjQ1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBk
byBub3Qgb2J0YWluIHdheWxhbmQtc2Nhbm5lciBwYXRoIGZyb20KQEAgLTE3LDcgKzE3LDcgQEAg
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1n
aXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA5OWFlMDdhNGEuLmQ1
ZWU5Y2MyMiAxMDA2NDQKK2luZGV4IDE0N2JkOGUxNy4uZmZjOTEwMzU0IDEwMDY0NAogLS0tIGEv
Q01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0CiBAQCAtMjExLDExICsyMTEsNyBA
QCBpZihQSUdMSVRfVVNFX1dBWUxBTkQpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0
aC1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEt
dGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoCmluZGV4IDk3
NTFiMjA2NzMuLmFiNzM4NGRlNDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
aWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNs
YW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEt
dGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAwYmEyZjkwOGYyYTJhODk3ZThlMDZlMzRmOTk4OTNkMTFlZTQ3MzRjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MmFhMzFjYjE0ZTQ3MzY1YjM5ZDA1YTVhYzg3
YmI4ZWQ0YWYzMGY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBNYXkgMjAyMyAyMTo1OTo0MyAtMDcwMAog
U3ViamVjdDogW1BBVENIXSB0ZXN0czogRml4IG5hcnJvd2luZyBlcnJvcnMgc2VlbiB3aXRoIGNs
YW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAx
LXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLWNvbmQucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1z
cGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLWNvbmQucGF0Y2gKaW5kZXggYzZj
MDcyYzdlMC4uNjRjNTIzZjFlMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bp
Z2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21w
cmVzc2lvbi1jb25kLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24t
Y29uZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDZlZDRjNDc3ZjIyMzA5YzA5YWNjZDRm
ZWU2ODQ4NmQ3NzE0ZjIwNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzJhZmE0MmI0
NTZmMWUzOGNlZDcwNjdjNmU2OTJlODYzOTUzMDJhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmks
IDIyIE5vdiAyMDI0IDIyOjUyOjMxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2VnbC9z
cGVjOiBtYWtlIGVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbiBjb25kaXRpb25hbApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2Ut
cHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5D
TFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCmluZGV4IDZjYjU2MWMzZjIuLjkyMWFhZDViY2QgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2Ut
dXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZ
TEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRl
YjBjMTU4OTBmYjlkMGY0ZmM3MDc0ZGRlMmE1MWM4OWNiNWJmNmQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGM2NDk0MTUzNjllNjRmYzZiMjhmMTIyMmU2MGNlZWM0NjE4NjI0ZjcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2ll
bWVucy5jb20+CiBEYXRlOiBUaHUsIDQgT2N0IDIwMTggMTQ6NDM6MTcgKzAyMDAKIFN1YmplY3Q6
IFtQQVRDSF0gY21ha2U6IHVzZSBwcm9wZXIgV0FZTEFORF9JTkNMVURFX0RJUlMgdmFyaWFibGUK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVz
dHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWds
aXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaAppbmRleCA3NzA2ZDg4
MDg2Li45OTg1YjQxMWRiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1i
dWlsZC1wYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2NmQxZDg2ZmY4YmUzM2RmMjY1ZDBkZGE3MTdi
ZTM4NWZlODYzN2NkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwOTg3YTViMDY4ODE4
YWMzNmU4MDBjMjVkYzZkYWQwZGNjNjE4Yzc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUs
IDEwIE5vdiAyMDIwIDE3OjEzOjUwICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL3V0aWwv
cGlnbGl0LXNoYWRlci5jOiBkbyBub3QgaGFyZGNvZGUgYnVpbGQgcGF0aCBpbnRvCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKaW5kZXggZTMwZWZkZjMzYi4uODA2
MGQ1MTQ0MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRf
Z2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgpA
QCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
bWVzYS9waWdsaXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAgICAgICAgICAiCiBV
UFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLVNSQ1JFViA9ICIwNWYwMmNiMmZmMTc4Nzg5
MmNiYTM4YzNiNjA5Zjg5MjQxOWJhZTg3IgorU1JDUkVWID0gImNhYmUyMWRjNmE5NDNkNjUyYjMy
MGRlYjJlZTBlNTIyMWIwZGEzN2UiCiAjICh3aGVuIFBWIGdvZXMgYWJvdmUgMS4wIHJlbW92ZSB0
aGUgdHJhaWxpbmcgcikKIFBWID0gIjEuMCtnaXRyIgogCi0tIAoyLjQ3LjEKCg==

--===============2505186303354550237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/ext_shader_clock/execution/clock2x32.shader_test /usr/lib/piglit/bin/push-pop-color-material /usr/lib/piglit/tests/spec/arb_shading_language_420pack/linker/instance-matching-uniform-blocks-binding-qualifier-mismatch-2.shader_test /usr/lib/piglit/bin/mesa-bug11100-fs /usr/lib/piglit/bin/mesa-bug11100-cs /usr/lib/piglit/bin/fbo-integer-attachments"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+cabe21dc6a

--===============2505186303354550237==--

