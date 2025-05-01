Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18F0C54E65
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1813.1746113625333866688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BlQDRuM9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NcpM94d/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101968c7b9e07-73e26182-8ec3-4cfe-b978-488c9f45686b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qaXi8SHq6HC3gktpb1kt0xshdARrJZJsh7ODqV9Id9U=;
	b=BlQDRuM9zSW8ByvVk0apAsmw0a/9HyRLvOrxYMRPSUXzn2G/ZrB5KcGkfCU+oXlm
	0H2MzgKDBBznkBrxLDI1V4l0Di4ok/EzYk64rKEHw/mz9jPaq8S/5ffPW4swpXTHOeJ
	y5nE/XE3j4fnuqtJF3yMpsfSjhzazoKOHPl9aCGM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qaXi8SHq6HC3gktpb1kt0xshdARrJZJsh7ODqV9Id9U=;
	b=NcpM94d/Dz6KBwTZj0jiGhovyNBdkyEJNDslEg3l3/fVTYnGe/yY7hgWAADFsd3X
	kRottnB3wNTZnBPkufaYqaWQ+J2TMUHBQtbZjoAaPa9C50KR/MqPQ1+yAepgXY9nyGk
	tF13nNaJPpm63BS896e4QkIlB5FzIyJcD3/5I/Ps=
Content-Type: multipart/mixed; boundary="===============1295329420551947863=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 1498c397ea35119692b579dd6f523de4651c663f
 SUCCEEDED
Message-ID: <010101968c7b9e07-73e26182-8ec3-4cfe-b978-488c9f45686b-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215869

--===============1295329420551947863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *1498c397ea35119692b579dd6f523de4651c663f* has Succeeded.

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
From e31a389ee35c2132a7adfc81edc323c5ef4d0a82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 12:49:17 +0000
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
index 6ce2348a71..c6bc29a7dc 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 9ffd24add3263e24975318e693309881eadd99a2 Mon Sep 17 00:00:00 2001
+From 0b1ac1a42c697be5b6730887333f49c078c5dacd Mon Sep 17 00:00:00 2001
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
index 9751b20673..e9db211027 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 0ba2f908f2a2a897e8e06e34f99893d11ee4734c Mon Sep 17 00:00:00 2001
+From 2394f78c745f8ed46b437743e5a600006dabaec0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index c6c072c7e0..403c877cc3 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From d6ed4c477f22309c09accd4fee68486d7714f205 Mon Sep 17 00:00:00 2001
+From ad1c57b4d7f8e5fe4d51cacd0169edeb812776bc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 6cb561c3f2..979f9992be 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From deb0c15890fb9d0f4fc7074dde2a51c89cb5bf6d Mon Sep 17 00:00:00 2001
+From 9b5569fba89d16a3e04cefa6679073765dfc2140 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 7706d88086..ee10c8c0d1 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 66d1d86ff8be33df265d0dda717be385fe8637cd Mon Sep 17 00:00:00 2001
+From c93a0ab0902487ff959d6f130a6d70d2bd12ffb8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e30efdf33b..bb20f08116 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "05f02cb2ff1787892cba38c3b609f892419bae87"
+SRCREV = "1498c397ea35119692b579dd6f523de4651c663f"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============1295329420551947863==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBlMzFhMzg5ZWUzNWMyMTMyYTdhZGZjODFlZGMzMjNjNWVmNGQwYTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMjo0OToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
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
MS4uYzZiYzI5YTdkYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1w
YXRoLWZyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAw
MDEtQ01ha2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWZmZDI0YWRkMzI2M2UyNDk3NTMxOGU2OTMzMDk4
ODFlYWRkOTlhMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGIxYWMxYTQyYzY5N2Jl
NWI2NzMwODg3MzMzZjQ5YzA3OGM1ZGFjZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
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
NTFiMjA2NzMuLmU5ZGIyMTEwMjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
aWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNs
YW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEt
dGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAwYmEyZjkwOGYyYTJhODk3ZThlMDZlMzRmOTk4OTNkMTFlZTQ3MzRjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyMzk0Zjc4Yzc0NWY4ZWQ0NmI0Mzc3NDNlNWE2
MDAwMDZkYWJhZWMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBNYXkgMjAyMyAyMTo1OTo0MyAtMDcwMAog
U3ViamVjdDogW1BBVENIXSB0ZXN0czogRml4IG5hcnJvd2luZyBlcnJvcnMgc2VlbiB3aXRoIGNs
YW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAx
LXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLWNvbmQucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1z
cGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLWNvbmQucGF0Y2gKaW5kZXggYzZj
MDcyYzdlMC4uNDAzYzg3N2NjMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bp
Z2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21w
cmVzc2lvbi1jb25kLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24t
Y29uZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDZlZDRjNDc3ZjIyMzA5YzA5YWNjZDRm
ZWU2ODQ4NmQ3NzE0ZjIwNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWQxYzU3YjRk
N2Y4ZTVmZTRkNTFjYWNkMDE2OWVkZWI4MTI3NzZiYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmks
IDIyIE5vdiAyMDI0IDIyOjUyOjMxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2VnbC9z
cGVjOiBtYWtlIGVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbiBjb25kaXRpb25hbApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2Ut
cHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5D
TFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCmluZGV4IDZjYjU2MWMzZjIuLjk3OWY5OTkyYmUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2Ut
dXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZ
TEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRl
YjBjMTU4OTBmYjlkMGY0ZmM3MDc0ZGRlMmE1MWM4OWNiNWJmNmQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDliNTU2OWZiYTg5ZDE2YTNlMDRjZWZhNjY3OTA3Mzc2NWRmYzIxNDAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2ll
bWVucy5jb20+CiBEYXRlOiBUaHUsIDQgT2N0IDIwMTggMTQ6NDM6MTcgKzAyMDAKIFN1YmplY3Q6
IFtQQVRDSF0gY21ha2U6IHVzZSBwcm9wZXIgV0FZTEFORF9JTkNMVURFX0RJUlMgdmFyaWFibGUK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVz
dHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWds
aXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaAppbmRleCA3NzA2ZDg4
MDg2Li5lZTEwYzhjMGQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1i
dWlsZC1wYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2NmQxZDg2ZmY4YmUzM2RmMjY1ZDBkZGE3MTdi
ZTM4NWZlODYzN2NkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjOTNhMGFiMDkwMjQ4
N2ZmOTU5ZDZmMTMwYTZkNzBkMmJkMTJmZmI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUs
IDEwIE5vdiAyMDIwIDE3OjEzOjUwICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL3V0aWwv
cGlnbGl0LXNoYWRlci5jOiBkbyBub3QgaGFyZGNvZGUgYnVpbGQgcGF0aCBpbnRvCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKaW5kZXggZTMwZWZkZjMzYi4uYmIy
MGYwODExNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRf
Z2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgpA
QCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
bWVzYS9waWdsaXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAgICAgICAgICAiCiBV
UFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLVNSQ1JFViA9ICIwNWYwMmNiMmZmMTc4Nzg5
MmNiYTM4YzNiNjA5Zjg5MjQxOWJhZTg3IgorU1JDUkVWID0gIjE0OThjMzk3ZWEzNTExOTY5MmI1
NzlkZDZmNTIzZGU0NjUxYzY2M2YiCiAjICh3aGVuIFBWIGdvZXMgYWJvdmUgMS4wIHJlbW92ZSB0
aGUgdHJhaWxpbmcgcikKIFBWID0gIjEuMCtnaXRyIgogCi0tIAoyLjQ3LjEKCg==

--===============1295329420551947863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (0 cached, 928 parsed). 1898 targets, 50 skipped, 0 masked, 0 errors.
Removing 79 recipes from the core2-64 sysroot...done.
Removing 99 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d24b05d5a38ceef712195913289ad43a44441124"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 787 Local 761 Mirrors 0 Missed 26 Current 395 (96% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 402 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 405 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 416 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 456 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 458 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 466 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 467 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 468 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 469 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 478 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 482 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 485 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 486 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa_setscene)
NOTE: Running setscene task 487 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 496 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 500 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-mako-1.3.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-mako-1.3.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-mako-1.3.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-mako-1.3.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 501 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 502 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-mako-1.3.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-mako-1.3.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 504 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-mako-1.3.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-mako-1.3.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 515 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 524 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 529 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 537 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 540 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 555 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 556 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-1.3.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 561 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 567 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-mako-1.3.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 568 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 571 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 577 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 581 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe mesa-demos-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 596 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-mako/1.3.9/temp/log.do_packagedata_setscene.3914605
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 603 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 606 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_package_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 634 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 665 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 674 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 677 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 702 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 707 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 718 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe python3-mako-1.3.9-r0: task do_package_setscene: Started
NOTE: Running setscene task 723 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 724 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 742 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 757 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 775 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.3.9-r0: task do_package_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 783 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 805 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 819 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 823 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 827 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 831 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-mako-1.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 836 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 843 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 849 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 851 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 856 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 870 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 872 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 878 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 880 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 881 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 893 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 896 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 897 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 900 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 901 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 903 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 905 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 912 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 915 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 916 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 922 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 923 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 924 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 929 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 934 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 937 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 941 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 943 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 945 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 946 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 949 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 950 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 952 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 953 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 955 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 956 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 958 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 960 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 961 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 964 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 967 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 973 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 974 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 975 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 976 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 981 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 985 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 988 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 990 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 991 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 993 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 995 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 997 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 998 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1002 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1004 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1007 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1009 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1011 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1017 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1022 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1025 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1026 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1031 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1033 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1034 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1036 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1037 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1043 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1044 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1046 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1050 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1053 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1054 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1057 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1060 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1061 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1066 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1068 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1070 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1072 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1073 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1076 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1077 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1078 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1080 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1082 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1084 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1088 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1090 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1093 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1095 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1097 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1099 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1100 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1101 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1102 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1103 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1104 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1105 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1107 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1108 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1109 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1110 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1114 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1116 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1120 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1121 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1125 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1129 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1130 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1131 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1132 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1136 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1137 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1138 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1139 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1140 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1142 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1144 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1146 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1149 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1154 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1156 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1158 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1782 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1864 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1160 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1162 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 1894 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_fetch)
NOTE: Running task 1897 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_write_config)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1991 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_unpack)
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2002 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_unpack)
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 2032 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_write_config)
NOTE: recipe mesa-demos-9.0.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2076 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Started
NOTE: Running setscene task 1167 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1168 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1169 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-demos-9.0.0-r0: task do_write_config: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_write_config: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1171 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1173 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1174 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2206 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_patch)
NOTE: recipe waffle-1.8.1-r0: task do_patch: Started
NOTE: recipe waffle-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2208 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_patch)
NOTE: recipe mesa-demos-9.0.0-r0: task do_patch: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_patch: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 2210 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1179 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1181 of 1182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 2234 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2235 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2913 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3010 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3096 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.9.bb:do_packagedata)
NOTE: recipe mesa-demos-9.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3180 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-mako-1.3.9-r0: task do_packagedata: Started
NOTE: Running task 3189 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_collect_spdx_deps)
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-mako-1.3.9-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3213 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_configure)
NOTE: recipe mesa-demos-9.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3214 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_configure)
NOTE: recipe waffle-1.8.1-r0: task do_configure: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_configure: Started
NOTE: recipe waffle-1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3215 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_compile)
NOTE: recipe waffle-1.8.1-r0: task do_compile: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_configure: Succeeded
NOTE: Running task 3216 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_compile)
NOTE: recipe mesa-demos-9.0.0-r0: task do_compile: Started
NOTE: recipe waffle-1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3217 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_install)
NOTE: recipe waffle-1.8.1-r0: task do_install: Started
NOTE: recipe waffle-1.8.1-r0: task do_install: Succeeded
NOTE: Running task 3218 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package)
NOTE: Running task 3219 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_package: Started
NOTE: recipe waffle-1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3220 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3221 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_compile: Succeeded
NOTE: Running task 3222 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_install)
NOTE: recipe mesa-demos-9.0.0-r0: task do_install: Started
NOTE: recipe waffle-1.8.1-r0: task do_package: Succeeded
NOTE: Running task 3223 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata)
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_install: Succeeded
NOTE: Running task 3224 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package)
NOTE: Running task 3225 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata unihash changed to 7542f132c95f224071902f30660b01adb9f07726991548dafbe5da61b7a41c95
NOTE: recipe mesa-demos-9.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3226 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_create_spdx)
NOTE: Running task 3227 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk)
NOTE: Running task 3228 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb)
NOTE: Running task 3229 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm)
NOTE: Running task 3230 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa)
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Started
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3231 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe mesa-demos-9.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk unihash changed to c2deb5f0307ca3624886cfe1b76fb23a5e54ea649a7670bf96cce5b3d27be364
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa unihash changed to b4a389aec37f2ad696a7ef14379e458b122319ccb5bc9013158aa615ff421f26
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb unihash changed to 6dd22a677bb8b9cd93448f45497da60fc5fda0509a46414198f7705c23772e16
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm unihash changed to c9f49dd6374cfabb56deec935b436252c323fb25c821dd9687a624d504754877
NOTE: recipe mesa-demos-9.0.0-r0: task do_package: Succeeded
NOTE: Running task 3232 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_packagedata)
NOTE: recipe mesa-demos-9.0.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_packagedata unihash changed to f950d347f0d99e4c10ac256faeaae530b7b6e5811b29b1893d66e2fa0fb173a7
NOTE: Setscene tasks completed
NOTE: Running task 3233 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_create_spdx)
NOTE: Running task 3234 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_ipk)
NOTE: Running task 3235 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_deb)
NOTE: Running task 3236 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-9.0.0-r0: task do_create_spdx: Started
NOTE: Running task 3237 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_qa)
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_deb: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_qa: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_ipk unihash changed to 5e759fdeb0f0fc860961d70513548337fca5ea10a2f5c53523c826e3e08d7daa
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_qa unihash changed to 71fc5e5ff50be032d536cea4487a86a1d513b87da09ca4b5ac5d3aad21e79932
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_rpm unihash changed to 3067220ca7a05d487b0cf6a7298f1fb4aa11f659391fe771b624f53eb9e94021
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_deb unihash changed to 9f422852350ab6faf47f5282c52c93a5dbb9ff6962d4c027e2ce0bfad16e1c01
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3238 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 3239 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 3240 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 3241 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 3242 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Succeeded
NOTE: Running task 3243 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_create_spdx)
NOTE: Running task 3244 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_ipk)
NOTE: Running task 3245 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_deb)
NOTE: Running task 3246 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 3247 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitr-r0: task do_create_spdx: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_ipk: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_deb: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_ipk: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_create_spdx: Succeeded
NOTE: Running task 3248 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_create_package_spdx)
NOTE: recipe piglit-1.0+gitr-r0: task do_create_package_spdx: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_deb: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa unihash changed to 1011d2c67cbc7179a315c2e6f9a4ff9e63766eec29783797d8aff041c48a4a53
NOTE: recipe piglit-1.0+gitr-r0: task do_create_package_spdx: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3249 of 3249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 3249 tasks of which 3194 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-mako-1.3.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.3.10-r0 to 0:1.3.9-r0) [version-going-backwards]
ERROR: python3-mako-1.3.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.3.10-r0 to 0:1.3.9-r0) [version-going-backwards]
ERROR: python3-mako-1.3.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-ptest went backwards which would break package feeds (from 0:1.3.10-r0 to 0:1.3.9-r0) [version-going-backwards]
ERROR: python3-mako-1.3.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.3.10-r0 to 0:1.3.9-r0) [version-going-backwards]
ERROR: python3-mako-1.3.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.3.10-r0 to 0:1.3.9-r0) [version-going-backwards]
ERROR: python3-mako-1.3.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.3.10-r0 to 0:1.3.9-r0) [version-going-backwards]
ERROR: python3-mako-1.3.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.3.10-r0 to 0:1.3.9-r0) [version-going-backwards]
ERROR: python3-mako-1.3.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.3.10-r0 to 0:1.3.9-r0) [version-going-backwards]
ERROR: python3-mako-1.3.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1295329420551947863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2054516936 to 2054548362 (+0%)
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/ext_shader_clock/execution/clock2x32.shader_test /usr/lib/piglit/tests/spec/arb_shading_language_420pack/linker/instance-matching-uniform-blocks-binding-qualifier-mismatch-2.shader_test /usr/lib/piglit/bin/mesa-bug11100-cs /usr/lib/piglit/bin/mesa-bug11100-fs"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea

--===============1295329420551947863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1498c397ea
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/arb_shading_language_420pack/linker/instance-matching-uniform-blocks-binding-qualifier-mismatch-2.shader_test /usr/lib/piglit/tests/spec/ext_shader_clock/execution/clock2x32.shader_test /usr/lib/piglit/bin/mesa-bug11100-fs /usr/lib/piglit/bin/mesa-bug11100-cs"

--===============1295329420551947863==--

