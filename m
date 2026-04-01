Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507461076383
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14738.1775054152306804574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=v69PNQ/7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kykJ4oeA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d4978dede-9c8dd99c-139d-4905-adad-799c1a7be4e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YrjhtctG2PRPIEJ3DbQ4hDvHPzltvM99qGmvCmAPefw=;
	b=v69PNQ/7FR0kiUrgfQs5ePA0+kPTGtuUYtRIRqALeiXT97w62NB3SvU0M8OqxJWC
	jEg9KfStGf4vRVWvjA5aX0AHI5E/ugRfLvYi8qZKD6iI3Qkatb35S/aVOKUwELpSrqQ
	fFQInLHPoNJZyQKT17UOMaJm/2Dtycobbrusrddc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YrjhtctG2PRPIEJ3DbQ4hDvHPzltvM99qGmvCmAPefw=;
	b=kykJ4oeAhGfy45Ua6X1GUOIJNO+bMgpeEeNAL7TnKJK5Gxy4dq8y9bNhQx20PW3p
	B2Qu/V4PekirpNjt47sPYlmm4z6vW6ShV4BWJ6iyXJ2zxhrWTRgwaQQYnwEg88dR4o/
	ufQLfiCPvuxSaKu3Qc1vZpDX1gTtstwsJGJ6ou8g=
Content-Type: multipart/mixed; boundary="===============7898173519692300056=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 4.3.1,4.3.1 SUCCEEDED
Message-ID: <0101019d4978dede-9c8dd99c-139d-4905-adad-799c1a7be4e9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234354

--===============7898173519692300056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *4.3.1,4.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-4.3.0-4.3.1-4.3.0-4.3.1.patch
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
From 899a3676efb6594bfca7cde8b9bfbe66b9ffb4ba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 05:32:25 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 4.3.0 -> 4.3.1,4.3.0 -> 4.3.1

---
 .../cmake/{cmake-native_4.3.0.bb => cmake-native_4.3.1.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.3.0.bb => cmake_4.3.1.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.3.0.bb => cmake-native_4.3.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.3.0.bb => cmake_4.3.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.3.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 06ded2201b..fee2efc2f3 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "f51b3c729f85d8dde46a92c071d2826ea6afb77d850f46894125de7cc51baa77"
+SRC_URI[sha256sum] = "0798f4be7a1a406a419ac32db90c2956936fecbf50db3057d7af47d69a2d7edb"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.3.0.bb b/meta/recipes-devtools/cmake/cmake_4.3.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.3.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.3.1.bb
-- 
2.47.1


--===============7898173519692300056==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-4.3.0-4.3.1-4.3.0-4.3.1.patch"

RnJvbSA4OTlhMzY3NmVmYjY1OTRiZmNhN2NkZThiOWJmYmU2NmI5ZmZiNGJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwNTozMjoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLW5hdGl2ZSxjbWFrZTogdXBncmFkZSA0LjMuMCAtPiA0LjMuMSw0LjMuMCAtPiA0LjMuMQoK
LS0tCiAuLi4vY21ha2Uve2NtYWtlLW5hdGl2ZV80LjMuMC5iYiA9PiBjbWFrZS1uYXRpdmVfNC4z
LjEuYmJ9ICAgICAgfCAwCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21h
a2Uve2NtYWtlXzQuMy4wLmJiID0+IGNtYWtlXzQuMy4xLmJifSAgfCAwCiAzIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL3tjbWFrZS1uYXRpdmVfNC4zLjAuYmIgPT4gY21ha2UtbmF0aXZlXzQuMy4x
LmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzQu
My4wLmJiID0+IGNtYWtlXzQuMy4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjMu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80
LjMuMS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5kZXggMDZkZWQyMjAx
Yi4uZmVlMmVmYzJmMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCkBAIC0x
OSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRWYXIo
J1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0gImh0dHBzOi8vY21ha2Uub3JnL2Zp
bGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7UFZ9LnRhci5neiBcCiAgICAgICAg
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1MWIzYzcyOWY4NWQ4ZGRlNDZhOTJjMDcx
ZDI4MjZlYTZhZmI3N2Q4NTBmNDY4OTQxMjVkZTdjYzUxYmFhNzciCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMDc5OGY0YmU3YTFhNDA2YTQxOWFjMzJkYjkwYzI5NTY5MzZmZWNiZjUwZGIzMDU3ZDdh
ZjQ3ZDY5YTJkN2VkYiIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiY21ha2UtKD9QPHB2ZXI+
XGQrKFwuXGQrKSspXC50YXIiCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZV80LjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV80
LjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlXzQuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY21ha2UvY21ha2VfNC4zLjEuYmIKLS0gCjIuNDcuMQoK

--===============7898173519692300056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.3.0" to "4.3.1"
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1270847744 to 1270617936 (-0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.3.0" to "4.3.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.3.0" to "4.3.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.3.0" to "4.3.1"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.3.0" to "4.3.1"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10373055 to 10367459 (-0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.3.0" to "4.3.1"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: FILELIST: directory renamed /usr/src/debug/cmake/4.3.0/Source/cmsys -> /usr/src/debug/cmake/4.3.1/Source/cmsys, directory renamed /usr/src/debug/cmake/4.3.0/Utilities/cmelf -> /usr/src/debug/cmake/4.3.1/Utilities/cmelf, directory renamed /usr/src/debug/cmake/4.3.0/Source -> /usr/src/debug/cmake/4.3.1/Source, directory renamed /usr/src/debug/cmake/4.3.0/Source/kwsys -> /usr/src/debug/cmake/4.3.1/Source/kwsys, directory renamed /usr/src/debug/cmake/4.3.0/Source/CPack/IFW -> /usr/src/debug/cmake/4.3.1/Source/CPack/IFW, directory renamed /usr/src/debug/cmake/4.3.0/Source/CPack -> /usr/src/debug/cmake/4.3.1/Source/CPack, directory renamed /usr/src/debug/cmake/4.3.0/Utilities/cmjsoncpp/src/lib_json -> /usr/src/debug/cmake/4.3.1/Utilities/cmjsoncpp/src/lib_json, directory renamed /usr/src/debug/cmake/4.3.0/Utilities/cmlibarchive/libarchive -> /usr/src/debug/cmake/4.3.1/Utilities/cmlibarchive/libarchive, directory renamed /usr/src/debug/cmake/4.
 3.0/Utilities/std/cm -> /usr/src/debug/cmake/4.3.1/Utilities/std/cm, directory renamed /usr/src/debug/cmake/4.3.0/Source/LexerParser -> /usr/src/debug/cmake/4.3.1/Source/LexerParser, directory renamed /usr/src/debug/cmake/4.3.0/Utilities/cmjsoncpp/include/json -> /usr/src/debug/cmake/4.3.1/Utilities/cmjsoncpp/include/json, directory renamed /usr/src/debug/cmake/4.3.0/Utilities/std/cm/bits -> /usr/src/debug/cmake/4.3.1/Utilities/std/cm/bits, directory renamed /usr/src/debug/cmake/4.3.0/Utilities/std/cmext -> /usr/src/debug/cmake/4.3.1/Utilities/std/cmext, directory renamed /usr/src/debug/cmake/4.3.0/Source/CTest -> /usr/src/debug/cmake/4.3.1/Source/CTest, directory renamed /usr/src/debug/cmake/4.3.0/Utilities/cmllpkgc -> /usr/src/debug/cmake/4.3.1/Utilities/cmllpkgc, directory renamed /usr/src/debug/cmake/4.3.0/Utilities/cmlibrhash/librhash -> /usr/src/debug/cmake/4.3.1/Utilities/cmlibrhash/librhash
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.3.0" to "4.3.1"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 49074102 to 49062598 (-0%)
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.3.0" to "4.3.1"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.3.0 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.3/cmake-4.3.0.tar.gz" to "https://cmake.org/files/v4.3/cmake-4.3.1.tar.gz"
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.3.0" to "4.3.1"
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.3.0 [default] to 4.3.1 [default]

--===============7898173519692300056==--

