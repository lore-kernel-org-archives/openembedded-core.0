Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14808D5E15A
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17186.1765872138758352233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TM59ZMrN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Dn8G4B0c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262ee76b-e329b629-fc4d-47c9-b26d-d4d71a6f1c66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xa0n7F2SDjHWskR1nYRKhp94Uy0rnu6VLOBqoOwAKDY=;
	b=TM59ZMrNF3os7i7UPstxbv2oD5zUUs9T7UOtMJrYz4sO5y5F5yNBnXiNs6alCChF
	voYkEMzYYFHyQTAToeaF6VsxN7wPZKRJik3lPvq07mlh7HghQ3HTjOl/KDIGKZLlWM4
	t7X+1UEj+OpgF12MWmYzi/jPzJITdcRsdWQU3/S4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xa0n7F2SDjHWskR1nYRKhp94Uy0rnu6VLOBqoOwAKDY=;
	b=Dn8G4B0cCcRvD/qJOVPxCNQIH7/uMCSrHir8Y4KK/jRIg3MsssUgtBImmCrFBfNW
	8jfZ5PEx7cgabG6USSotzC8UcfUMJcM/fzxTpV0l/v90A2Dfb0G7mZs2XBr2X6H2yhU
	6hinyivviQfGnY+6lMZbPgv0yR0F375JB0bxjOu0=
Content-Type: multipart/mixed; boundary="===============7424804020043280907=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wpebackend-fdo: upgrading to 1.16.1 FAILED
Message-ID: <0101019b262ee76b-e329b629-fc4d-47c9-b26d-d4d71a6f1c66-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227903

--===============7424804020043280907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wpebackend-fdo* to *1.16.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-wpebackend-fdo-upgrade-1.16.0-1.16.1.patch
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
From 3b6fb9663a675f9ca0350ef68fa02df2ec6c075d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 06:32:46 +0000
Subject: [PATCH] wpebackend-fdo: upgrade 1.16.0 -> 1.16.1

---
 .../{wpebackend-fdo_1.16.0.bb => wpebackend-fdo_1.16.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.16.0.bb => wpebackend-fdo_1.16.1.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb
index aa6c58d176..79eebf19d1 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "beddf321232d5bd08106c179dbc600f8ce88eb3620b4a59a6329063b78f64635"
+SRC_URI[sha256sum] = "544ae14012f8e7e426b8cb522eb0aaaac831ad7c35601d1cf31d37670e0ebb3b"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.47.1


--===============7424804020043280907==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wpebackend-fdo-upgrade-1.16.0-1.16.1.patch"

RnJvbSAzYjZmYjk2NjNhNjc1ZjljYTAzNTBlZjY4ZmEwMmRmMmVjNmMwNzVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDY6MzI6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
cGViYWNrZW5kLWZkbzogdXBncmFkZSAxLjE2LjAgLT4gMS4xNi4xCgotLS0KIC4uLi97d3BlYmFj
a2VuZC1mZG9fMS4xNi4wLmJiID0+IHdwZWJhY2tlbmQtZmRvXzEuMTYuMS5iYn0gICAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC97d3BlYmFja2VuZC1mZG9fMS4xNi4wLmJiID0+IHdw
ZWJhY2tlbmQtZmRvXzEuMTYuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c2F0by93ZWJraXQvd3BlYmFja2VuZC1mZG9fMS4xNi4wLmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8v
d2Via2l0L3dwZWJhY2tlbmQtZmRvXzEuMTYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd3BlYmFja2VuZC1mZG9fMS4xNi4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd3BlYmFja2VuZC1mZG9fMS4xNi4x
LmJiCmluZGV4IGFhNmM1OGQxNzYuLjc5ZWViZjE5ZDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC93cGViYWNrZW5kLWZkb18xLjE2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LXNhdG8vd2Via2l0L3dwZWJhY2tlbmQtZmRvXzEuMTYuMS5iYgpAQCAtMTMsNyArMTMsNyBAQCBp
bmhlcml0IG1lc29uIGZlYXR1cmVzX2NoZWNrIHBrZ2NvbmZpZwogUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIm9wZW5nbCIKIAogU1JDX1VSSSA9ICJodHRwczovL3dwZXdlYmtpdC5vcmcvcmVs
ZWFzZXMvJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiZWRkZjMy
MTIzMmQ1YmQwODEwNmMxNzlkYmM2MDBmOGNlODhlYjM2MjBiNGE1OWE2MzI5MDYzYjc4ZjY0NjM1
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU0NGFlMTQwMTJmOGU3ZTQyNmI4Y2I1MjJlYjBhYWFh
YzgzMWFkN2MzNTYwMWQxY2YzMWQzNzY3MGUwZWJiM2IiCiAKICMgRXNwZWNpYWxseSBoZWxwcyBj
b21waWxpbmcgd2l0aCBjbGFuZyB3aGljaCBlbmFibGUgdGhpcyBhcyBlcnJvciB3aGVuCiAjIHVz
aW5nIGMrKzExCi0tIAoyLjQ3LjEKCg==

--===============7424804020043280907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.10.1 to libWPEBackend-fdo-1.0.so.1.10.2
  /usr/lib/libWPEBackend-fdo-1.0.so.1.10.1 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.10.2
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.10.1", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.10.2"

--===============7424804020043280907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/wpebackend-fdo: PV changed from "1.16.0" to "1.16.1"
packages/x86-64-v3-poky-linux/wpebackend-fdo: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/x86-64-v3-poky-linux/wpebackend-fdo: SRC_URI changed from "https://wpewebkit.org/releases/wpebackend-fdo-1.16.0.tar.xz" to "https://wpewebkit.org/releases/wpebackend-fdo-1.16.1.tar.xz"
Changes to packages/x86-64-v3-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.10.1 to libWPEBackend-fdo-1.0.so.1.10.2
  /usr/lib/libWPEBackend-fdo-1.0.so.1.10.1 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.10.2
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PV changed from "1.16.0" to "1.16.1"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: FILELIST: removed "/usr/lib/.debug/libWPEBackend-fdo-1.0.so.1.10.1", added "/usr/lib/.debug/libWPEBackend-fdo-1.0.so.1.10.2"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGSIZE changed from 1538280 to 1574944 (+2%)
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PV changed from "1.16.0" to "1.16.1"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PV changed from "1.16.0" to "1.16.1"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PV changed from "1.16.0" to "1.16.1"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PV changed from "1.16.0" to "1.16.1"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-src: FILELIST: directory renamed /usr/src/debug/wpebackend-fdo/1.16.0/src -> /usr/src/debug/wpebackend-fdo/1.16.1/src, directory renamed /usr/src/debug/wpebackend-fdo/1.16.0/src/extensions -> /usr/src/debug/wpebackend-fdo/1.16.1/src/extensions, directory renamed /usr/src/debug/wpebackend-fdo/1.16.0/include/wpe/unstable -> /usr/src/debug/wpebackend-fdo/1.16.1/include/wpe/unstable, directory renamed /usr/src/debug/wpebackend-fdo/1.16.0/include/wpe/extensions -> /usr/src/debug/wpebackend-fdo/1.16.1/include/wpe/extensions, directory renamed /usr/src/debug/wpebackend-fdo/1.16.0/include/wpe -> /usr/src/debug/wpebackend-fdo/1.16.1/include/wpe, removed "/usr/src/debug/wpebackend-fdo/1.16.0/src/linux-dmabuf/linux-dmabuf.h /usr/src/debug/wpebackend-fdo/1.16.0/wpe-audio-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.0/wpe-video-plane-display-dmabuf-protocol.c /usr/src/debug/wpebackend-fdo/1.16.0/src/linux-dmabuf/linux-dmabuf-prot
 ocol.c /usr/src/debug/wpebackend-fdo/1.16.0/src/linux-dmabuf/linux-dmabuf.cpp /usr/src/debug/wpebackend-fdo/1.16.0/wayland-eglstream-controller-protocol.c /usr/src/debug/wpebackend-fdo/1.16.0/wpe-bridge-client-protocol.h /usr/src/debug/wpebackend-fdo/1.16.0/wpe-dmabuf-pool-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.0/wpe-video-plane-display-dmabuf-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.0/wpe-bridge-protocol.c /usr/src/debug/wpebackend-fdo/1.16.0/wpe-video-plane-display-dmabuf-client-protocol.h /usr/src/debug/wpebackend-fdo/1.16.0/wpe-dmabuf-pool-client-protocol.h /usr/src/debug/wpebackend-fdo/1.16.0/src/linux-dmabuf/linux-dmabuf-unstable-v1-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.0/wpe-dmabuf-pool-protocol.c /usr/src/debug/wpebackend-fdo/1.16.0/wayland-eglstream-controller-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.0/wpe-audio-client-protocol.h /usr/src/debug/wpebackend-fdo/1.16.0/wpe-bridge-server-protocol.h /usr/src/debug/wpebackend-f
 do/1.16.0/wpe-audio-protocol.c", added "/usr/src/debug/wpebackend-fdo/1.16.1/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/wpebackend-fdo/1.16.1/src/linux-dmabuf/linux-dmabuf.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-audio-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-video-plane-display-dmabuf-protocol.c /usr/src/debug/wpebackend-fdo/1.16.1/wayland-eglstream-controller-protocol.c /usr/src/debug/wpebackend-fdo/1.16.1/src/linux-dmabuf/linux-dmabuf.cpp /usr/src/debug/wpebackend-fdo/1.16.1/wpe-bridge-client-protocol.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-dmabuf-pool-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-video-plane-display-dmabuf-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-bridge-protocol.c /usr/src/debug/wpebackend-fdo/1.16.1/wpe-video-plane-display-dmabuf-client-protocol.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-dmabuf-pool-client-protocol.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-dmabuf-pool-protocol.c /usr/src/debug/wpeba
 ckend-fdo/1.16.1/wayland-eglstream-controller-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-audio-client-protocol.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-bridge-server-protocol.h /usr/src/debug/wpebackend-fdo/1.16.1/wpe-audio-protocol.c /usr/src/debug/wpebackend-fdo/1.16.1/linux-dmabuf-unstable-v1-server-protocol.h"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGSIZE changed from 340231 to 361826 (+6%)
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PV changed from "1.16.0" to "1.16.1"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo: PV changed from "1.16.0" to "1.16.1"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.10.1", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.10.2"
packages/x86-64-v3-poky-linux/wpebackend-fdo/wpebackend-fdo: PKGSIZE changed from 92655 to 96775 (+4%)

--===============7424804020043280907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-211c4b4c1f820bd54879d87cca6a816b24356de3"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:211c4b4c1f820bd54879d87cca6a816b24356de3"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 439 Local 426 Mirrors 0 Missed 13 Current 313 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 322 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 360 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 374 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 410 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 413 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1154 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_write_config)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 414 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 415 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 417 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_packagedata_setscene)
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1212 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_fetch)
NOTE: Running task 1214 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 451 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Succeeded
NOTE: Running task 1231 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1232 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 482 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 1243 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_patch)
NOTE: Running task 1244 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 496 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 500 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 502 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 509 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.128-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.128-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 523 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 527 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 534 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 545 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 561 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.128-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 564 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 565 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 566 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 567 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 573 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1311 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_generate_toolchain_file)
NOTE: Running setscene task 578 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 587 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 588 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 593 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 606 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 615 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 617 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 628 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 632 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 636 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 637 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 648 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 654 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 657 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 685 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 686 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 691 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 693 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 694 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 695 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 696 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 704 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 706 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 715 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 729 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1998 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2094 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_collect_spdx_deps)
NOTE: recipe libwpe-1.16.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.16.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2099 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_configure)
NOTE: recipe libwpe-1.16.3-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.3-r0: task do_configure: Succeeded
NOTE: Running task 2100 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_compile)
NOTE: recipe libwpe-1.16.3-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.3-r0: task do_compile: Succeeded
NOTE: Running task 2101 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_install)
NOTE: recipe libwpe-1.16.3-r0: task do_install: Started
NOTE: recipe libwpe-1.16.3-r0: task do_install: Succeeded
NOTE: Running task 2102 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_package)
NOTE: Running task 2103 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_populate_sysroot)
NOTE: recipe libwpe-1.16.3-r0: task do_package: Started
NOTE: recipe libwpe-1.16.3-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2104 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2105 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.3-r0: task do_package: Succeeded
NOTE: Running task 2106 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_packagedata)
NOTE: recipe libwpe-1.16.3-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.16.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_packagedata unihash changed to 6bcdf555e85fbee1d2dc9a1b9f1fe9e720bf1c7948dd2695deabaae1863f452f
NOTE: Setscene tasks completed
NOTE: Running task 2107 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.3-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2108 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_collect_spdx_deps)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2109 of 2120 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| [1/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner client-header ../sources/wpebackend-fdo-1.16.1/src/bridge/wpe-bridge.xml wpe-bridge-client-protocol.h
| [2/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner server-header ../sources/wpebackend-fdo-1.16.1/src/bridge/wpe-bridge.xml wpe-bridge-server-protocol.h
| [3/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner private-code ../sources/wpebackend-fdo-1.16.1/src/bridge/wpe-bridge.xml wpe-bridge-protocol.c
| [4/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner client-header ../sources/wpebackend-fdo-1.16.1/src/extensions/wpe-video-plane-display-dmabuf.xml wpe-video-plane-display-dmabuf-client-protocol.h
| [5/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner server-header ../sources/wpebackend-fdo-1.16.1/src/extensions/wpe-video-plane-display-dmabuf.xml wpe-video-plane-display-dmabuf-server-protocol.h
| [6/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner private-code ../sources/wpebackend-fdo-1.16.1/src/extensions/wpe-audio.xml wpe-audio-protocol.c
| [7/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner private-code ../sources/wpebackend-fdo-1.16.1/src/extensions/wpe-video-plane-display-dmabuf.xml wpe-video-plane-display-dmabuf-protocol.c
| [8/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner client-header ../sources/wpebackend-fdo-1.16.1/src/extensions/wpe-audio.xml wpe-audio-client-protocol.h
| [9/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner server-header ../sources/wpebackend-fdo-1.16.1/src/extensions/wpe-audio.xml wpe-audio-server-protocol.h
| [10/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner private-code ../sources/wpebackend-fdo-1.16.1/src/wayland-eglstream/wayland-eglstream-controller.xml wayland-eglstream-controller-protocol.c
| [11/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner server-header ../sources/wpebackend-fdo-1.16.1/src/wayland-eglstream/wayland-eglstream-controller.xml wayland-eglstream-controller-server-protocol.h
| [12/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner client-header ../sources/wpebackend-fdo-1.16.1/src/dmabuf-pool/wpe-dmabuf-pool.xml wpe-dmabuf-pool-client-protocol.h
| [13/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner server-header ../sources/wpebackend-fdo-1.16.1/src/dmabuf-pool/wpe-dmabuf-pool.xml wpe-dmabuf-pool-server-protocol.h
| [14/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner private-code ../sources/wpebackend-fdo-1.16.1/src/dmabuf-pool/wpe-dmabuf-pool.xml wpe-dmabuf-pool-protocol.c
| [15/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner server-header ../sources/wpebackend-fdo-1.16.1/src/linux-dmabuf/linux-dmabuf-unstable-v1.xml linux-dmabuf-unstable-v1-server-protocol.h
| [16/53] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/wayland-scanner private-code ../sources/wpebackend-fdo-1.16.1/src/linux-dmabuf/linux-dmabuf-unstable-v1.xml linux-dmabuf-unstable-v1-protocol.c
| [17/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_exported-buffer-shm.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_exported-buffer-shm.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_exported-buffer-shm.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/exported-buffer-shm.cpp
| [18/53] arm-poky-linux-musleabi-gcc -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=c99 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wayland-eglstream-controller-protocol.c.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wayland-eglstream-controller-protocol.c.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wayland-eglstream-controller-protocol.c.o -c wayland-eglstream-controller-protocol.c
| [19/53] arm-poky-linux-musleabi-gcc -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=c99 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-bridge-protocol.c.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-bridge-protocol.c.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-bridge-protocol.c.o -c wpe-bridge-protocol.c
| [20/53] arm-poky-linux-musleabi-gcc -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=c99 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-audio-protocol.c.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-audio-protocol.c.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-audio-protocol.c.o -c wpe-audio-protocol.c
| [21/53] arm-poky-linux-musleabi-gcc -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=c99 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-video-plane-display-dmabuf-protocol.c.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-video-plane-display-dmabuf-protocol.c.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-video-plane-display-dmabuf-protocol.c.o -c wpe-video-plane-display-dmabuf-protocol.c
| [22/53] arm-poky-linux-musleabi-gcc -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=c99 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-dmabuf-pool-protocol.c.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-dmabuf-pool-protocol.c.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._wpe-dmabuf-pool-protocol.c.o -c wpe-dmabuf-pool-protocol.c
| [23/53] arm-poky-linux-musleabi-gcc -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=c99 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._linux-dmabuf-unstable-v1-protocol.c.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._linux-dmabuf-unstable-v1-protocol.c.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/meson-generated_.._linux-dmabuf-unstable-v1-protocol.c.o -c linux-dmabuf-unstable-v1-protocol.c
| [24/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_fdo.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_fdo.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_fdo.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/fdo.cpp
| [25/53] arm-poky-linux-musleabi-gcc -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=c99 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-m
 ap=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_version.c.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_version.c.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_version.c.o -c ../sources/wpebackend-fdo-1.16.1/src/version.c
| [26/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_dmabuf-pool-entry.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_dmabuf-pool-entry.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_dmabuf-pool-entry.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/dmabuf-pool-entry.cpp
| [27/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_exported-image-egl.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_exported-image-egl.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_exported-image-egl.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/exported-image-egl.cpp
| [28/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-shm.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-shm.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-shm.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/initialize-shm.cpp
| [29/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_renderer-host.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_renderer-host.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_renderer-host.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/renderer-host.cpp
| [30/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-dmabuf.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-dmabuf.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-dmabuf.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/initialize-dmabuf.cpp
| [31/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-eglstream.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-eglstream.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-eglstream.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/initialize-eglstream.cpp
| [32/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-egl.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-egl.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_initialize-egl.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/initialize-egl.cpp
| [33/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_ipc.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_ipc.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_ipc.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/ipc.cpp
| [34/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_egl-client-wayland.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_egl-client-wayland.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_egl-client-wayland.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/egl-client-wayland.cpp
| [35/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-dmabuf-pool-fdo.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-dmabuf-pool-fdo.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-dmabuf-pool-fdo.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/view-backend-dmabuf-pool-fdo.cpp
| [36/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-exportable-fdo-eglstream.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-exportable-fdo-eglstream.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-exportable-fdo-eglstream.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/view-backend-exportable-fdo-eglstream.cpp
| [37/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-exportable-fdo.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-exportable-fdo.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-exportable-fdo.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/view-backend-exportable-fdo.cpp
| [38/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_egl-client-dmabuf-pool.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_egl-client-dmabuf-pool.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_egl-client-dmabuf-pool.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp: In member function 'virtual void WS::EGLClient::TargetDmabufPool::frameWillRender()':
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:189:21: warning: narrowing conversion of 'bufferData.WS::EGLClient::BufferData::strides.std::array<unsigned int, 4>::operator[](0)' from 'std::array<unsigned int, 4>::value_type' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   189 |                     };
|       |                     ^
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:189:21: warning: narrowing conversion of 'bufferData.WS::EGLClient::BufferData::offsets.std::array<unsigned int, 4>::operator[](0)' from 'std::array<unsigned int, 4>::value_type' {aka 'unsigned int'} to 'int' [-Wnarrowing]
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:187:61: warning: narrowing conversion of 'modifier_hi' from 'uint32_t' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   187 |                         EGL_DMA_BUF_PLANE0_MODIFIER_HI_EXT, modifier_hi,
|       |                                                             ^~~~~~~~~~~
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:188:61: warning: narrowing conversion of 'modifier_lo' from 'uint32_t' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   188 |                         EGL_DMA_BUF_PLANE0_MODIFIER_LO_EXT, modifier_lo,
|       |                                                             ^~~~~~~~~~~
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:205:21: warning: narrowing conversion of 'bufferData.WS::EGLClient::BufferData::strides.std::array<unsigned int, 4>::operator[](1)' from 'std::array<unsigned int, 4>::value_type' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   205 |                     };
|       |                     ^
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:205:21: warning: narrowing conversion of 'bufferData.WS::EGLClient::BufferData::offsets.std::array<unsigned int, 4>::operator[](1)' from 'std::array<unsigned int, 4>::value_type' {aka 'unsigned int'} to 'int' [-Wnarrowing]
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:203:61: warning: narrowing conversion of 'modifier_hi' from 'uint32_t' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   203 |                         EGL_DMA_BUF_PLANE1_MODIFIER_HI_EXT, modifier_hi,
|       |                                                             ^~~~~~~~~~~
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:204:61: warning: narrowing conversion of 'modifier_lo' from 'uint32_t' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   204 |                         EGL_DMA_BUF_PLANE1_MODIFIER_LO_EXT, modifier_lo,
|       |                                                             ^~~~~~~~~~~
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:221:21: warning: narrowing conversion of 'bufferData.WS::EGLClient::BufferData::strides.std::array<unsigned int, 4>::operator[](2)' from 'std::array<unsigned int, 4>::value_type' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   221 |                     };
|       |                     ^
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:221:21: warning: narrowing conversion of 'bufferData.WS::EGLClient::BufferData::offsets.std::array<unsigned int, 4>::operator[](2)' from 'std::array<unsigned int, 4>::value_type' {aka 'unsigned int'} to 'int' [-Wnarrowing]
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:219:61: warning: narrowing conversion of 'modifier_hi' from 'uint32_t' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   219 |                         EGL_DMA_BUF_PLANE2_MODIFIER_HI_EXT, modifier_hi,
|       |                                                             ^~~~~~~~~~~
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:220:61: warning: narrowing conversion of 'modifier_lo' from 'uint32_t' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   220 |                         EGL_DMA_BUF_PLANE2_MODIFIER_LO_EXT, modifier_lo,
|       |                                                             ^~~~~~~~~~~
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:237:21: warning: narrowing conversion of 'bufferData.WS::EGLClient::BufferData::strides.std::array<unsigned int, 4>::operator[](3)' from 'std::array<unsigned int, 4>::value_type' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   237 |                     };
|       |                     ^
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:237:21: warning: narrowing conversion of 'bufferData.WS::EGLClient::BufferData::offsets.std::array<unsigned int, 4>::operator[](3)' from 'std::array<unsigned int, 4>::value_type' {aka 'unsigned int'} to 'int' [-Wnarrowing]
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:235:61: warning: narrowing conversion of 'modifier_hi' from 'uint32_t' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   235 |                         EGL_DMA_BUF_PLANE3_MODIFIER_HI_EXT, modifier_hi,
|       |                                                             ^~~~~~~~~~~
| ../sources/wpebackend-fdo-1.16.1/src/egl-client-dmabuf-pool.cpp:236:61: warning: narrowing conversion of 'modifier_lo' from 'uint32_t' {aka 'unsigned int'} to 'int' [-Wnarrowing]
|   236 |                         EGL_DMA_BUF_PLANE3_MODIFIER_LO_EXT, modifier_lo,
|       |                                                             ^~~~~~~~~~~
| At global scope:
| cc1plus: note: unrecognized command-line option '-Wno-c++11-narrowing' may have been intended to silence earlier diagnostics
| [39/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_renderer-backend-egl.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_renderer-backend-egl.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_renderer-backend-egl.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/renderer-backend-egl.cpp
| [40/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-private.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-private.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-private.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/view-backend-private.cpp
| [41/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-shm.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-shm.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-shm.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/ws-shm.cpp
| [42/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-dmabuf-pool.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-dmabuf-pool.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-dmabuf-pool.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/ws-dmabuf-pool.cpp
| [43/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-exportable-fdo-egl.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-exportable-fdo-egl.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_view-backend-exportable-fdo-egl.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/view-backend-exportable-fdo-egl.cpp
| [44/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_audio-receiver.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_audio-receiver.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_audio-receiver.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/extensions/audio-receiver.cpp
| [45/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_audio.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_audio.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_audio.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/extensions/audio.cpp
| [46/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-eglstream.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-eglstream.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-eglstream.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/ws-eglstream.cpp
| [47/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-client.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-client.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-client.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/ws-client.cpp
| [48/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-egl.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-egl.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-egl.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/ws-egl.cpp
| FAILED: [code=1] libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-egl.cpp.o
| arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf
 -neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebackend-fdo/1.
 16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-egl.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-egl.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws-egl.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/ws-egl.cpp
| ../sources/wpebackend-fdo-1.16.1/src/ws-egl.cpp: In destructor 'virtual WS::ImplEGL::~ImplEGL()':
| ../sources/wpebackend-fdo-1.16.1/src/ws-egl.cpp:83:9: error: 'close' was not declared in this scope; did you mean 'clone'?
|    83 |         close(m_dmabuf.formatTable.fd);
|       |         ^~~~~
|       |         clone
| ../sources/wpebackend-fdo-1.16.1/src/ws-egl.cpp: In member function 'void WS::ImplEGL::initFormatTable()':
| ../sources/wpebackend-fdo-1.16.1/src/ws-egl.cpp:397:15: error: 'ftruncate' was not declared in this scope; did you mean 'strncat'?
|   397 |         ret = ftruncate(fd, size);
|       |               ^~~~~~~~~
|       |               strncat
| ../sources/wpebackend-fdo-1.16.1/src/ws-egl.cpp:401:9: error: 'close' was not declared in this scope; did you mean 'clone'?
|   401 |         close(fd);
|       |         ^~~~~
|       |         clone
| ../sources/wpebackend-fdo-1.16.1/src/ws-egl.cpp:407:9: error: 'close' was not declared in this scope; did you mean 'clone'?
|   407 |         close(fd);
|       |         ^~~~~
|       |         clone
| At global scope:
| cc1plus: note: unrecognized command-line option '-Wno-c++11-narrowing' may have been intended to silence earlier diagnostics
| [49/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_ws.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/ws.cpp
| [50/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_video-plane-display-dmabuf-receiver.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_video-plane-display-dmabuf-receiver.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_video-plane-display-dmabuf-receiver.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/extensions/video-plane-display-dmabuf-receiver.cpp
| [51/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_video-plane-display-dmabuf.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_video-plane-display-dmabuf.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_extensions_video-plane-display-dmabuf.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/extensions/video-plane-display-dmabuf.cpp
| [52/53] arm-poky-linux-musleabi-g++ -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot -IlibWPEBackend-fdo-1.0.so.1.10.2.p -I. -I../sources/wpebackend-fdo-1.16.1 -I../sources/wpebackend-fdo-1.16.1/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/corte
 xa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot/usr/include/wpe-1.0 -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -fno-exceptions -fno-rtti -std=c++11 -DWPE_FDO_COMPILATION=1 '-DG_LOG_DOMAIN="WPE-FDO"' -D_LARGEFILE64_SOURCE=1 -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/sources/wpebackend-fdo-1.16.1=/usr/src/debug/wpebackend-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/build=/usr/src/debug/wpebacken
 d-fdo/1.16.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native= -pipe -fvisibility-inlines-hidden -Wno-c++11-narrowing -fPIC -DWPE_ENABLE_XKB=1 -pthread -MD -MQ libWPEBackend-fdo-1.0.so.1.10.2.p/src_linux-dmabuf_linux-dmabuf.cpp.o -MF libWPEBackend-fdo-1.0.so.1.10.2.p/src_linux-dmabuf_linux-dmabuf.cpp.o.d -o libWPEBackend-fdo-1.0.so.1.10.2.p/src_linux-dmabuf_linux-dmabuf.cpp.o -c ../sources/wpebackend-fdo-1.16.1/src/linux-dmabuf/linux-dmabuf.cpp
| ninja: build stopped: subcommand failed.
| INFO: autodetecting backend as ninja
| INFO: calculating backend command to run: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/recipe-sysroot-native/usr/bin/ninja -j 16 -l 75.0 -v
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/temp/run.do_compile.3261099:152 exit 1 from 'meson compile -v -j 16 -l 75'
| WARNING: Backtrace (BB generated script):
| 	#1: meson_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/temp/run.do_compile.3261099, line 152
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/temp/run.do_compile.3261099, line 147
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/temp/run.do_compile.3261099, line 156
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2109 tasks of which 2088 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216063223.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216063223.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/temp/log.do_compile.3261099
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: wpebackend-fdo-1.16.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/temp/run.do_compile.3261099' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/wpebackend-fdo/1.16.1/temp/log.do_compile.3261099
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_compile) failed with exit code '1'

--===============7424804020043280907==--

