Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7AFCD4853
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15715.1777645540185683116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ww40ThK4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iADg+Qwr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019de3ee8519-cf54f30e-48d1-4a84-9c21-f969be4cd14f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qKHe69uktMo20JBMg2gZoAThVgeHxyLK7DE4PutQ+ZY=;
	b=Ww40ThK4p0GHgnpWLWZx8w0rn4xsCqVMaWUOSgjGMPhQAWIxrQeAsD/M9pAN/UNt
	1b8z324kfKwYiAW0JuIkYzSNGYMQHR8tX3WQH5ONSa+LaOPIhicjzLKWhbHmWI3c4Og
	DN2RCWUBoezrwh0lXhRESLYDaczCGGxhQE3aM+2A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qKHe69uktMo20JBMg2gZoAThVgeHxyLK7DE4PutQ+ZY=;
	b=iADg+QwrOZVSq0Op8KYqxY0Ct9MT81TCGjYPo9sX7R1xyaT07/Lvm3/1X+qWDsYs
	A7t0lzoFpfvUw5rKNIBnCOrJh2ZFvxO0wRhaaSAMh9QYO/UC0fJGu/lzGbT3h69hYc1
	sIw8r51Uh12BWm0zCmWMxqfjykWKYbNXFsbvpPeQ=
Content-Type: multipart/mixed; boundary="===============8532075970123652991=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpng: upgrading to 1.6.58 SUCCEEDED
Message-ID: <0101019de3ee8519-cf54f30e-48d1-4a84-9c21-f969be4cd14f-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236284

--===============8532075970123652991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpng* to *1.6.58* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.56-1.6.58.patch
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
From 5333738193a7b6c81ebab11707920fab5d0e5b30 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 12:58:50 +0000
Subject: [PATCH] libpng: upgrade 1.6.56 -> 1.6.58

---
 .../libpng/{libpng_1.6.56.bb => libpng_1.6.58.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.56.bb => libpng_1.6.58.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.56.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.58.bb
index 7ede0a6c8b..7a8a524043 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18"
+SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.47.1


--===============8532075970123652991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/tests/pnggetset /usr/lib/libpng/ptest/src/pnggetset"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.56.0", added "/usr/lib/libpng16.so.16.58.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.56.0 to libpng16.so.16.58.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.56.0 to libpng16.so.16.58.0
  /usr/lib/libpng16.so.16.56.0 moved to /usr/lib/libpng16.so.16.58.0

--===============8532075970123652991==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.56-1.6.58.patch"

RnJvbSA1MzMzNzM4MTkzYTdiNmM4MWViYWIxMTcwNzkyMGZhYjVkMGU1YjMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMjo1ODo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBuZzogdXBncmFkZSAxLjYuNTYgLT4gMS42LjU4CgotLS0KIC4uLi9saWJwbmcve2xpYnBuZ18x
LjYuNTYuYmIgPT4gbGlicG5nXzEuNi41OC5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2xpYnBuZy97bGlicG5nXzEuNi41Ni5iYiA9PiBsaWJwbmdfMS42LjU4
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9s
aWJwbmdfMS42LjU2LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18x
LjYuNTguYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18xLjYuNTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjU4LmJiCmluZGV4IDdlZGUwYTZjOGIuLjdhOGE1
MjQwNDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjU2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42
LjU4LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9
LyR7QlBOfS8ke0JQTn0ke0xJQlZ9LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9y
dW4tcHRlc3QgXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjdkOGJmMTYwMWI3ODA0ZjU4
M2EyNTRhYjM0M2E2NTQ5Y2E2Y2YyN2QyNTVjMzAyYzQ3YWYyZDlkMzZhNmYxOCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIyOGViNDAzZjUxZjBmNzQwNTI0OTEzMmNlY2ZlODJlYTVjMGVmOTdmMWIz
MmM1YTY1ODI4ODE0YWUwZDM0Nzc1IgogCiBNSVJST1JTICs9ICIke1NPVVJDRUZPUkdFX01JUlJP
Un0vcHJvamVjdC8ke0JQTn0vJHtCUE59JHtMSUJWfS8gJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3By
b2plY3QvJHtCUE59LyR7QlBOfSR7TElCVn0vb2xkZXItcmVsZWFzZXMvIgogCi0tIAoyLjQ3LjEK
Cg==

--===============8532075970123652991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpng: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng: PV changed from "1.6.56" to "1.6.58"
packages/x86-64-v3-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.56.tar.xz file://run-ptest" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.58.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 1606008 to 1654208 (+3%)
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.56.0", added "/usr/lib/.debug/libpng16.so.16.58.0 /usr/lib/libpng/ptest/src/.debug/pnggetset"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PV changed from "1.6.56" to "1.6.58"
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PV changed from "1.6.56" to "1.6.58"
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PV changed from "1.6.56" to "1.6.58"
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PV changed from "1.6.56" to "1.6.58"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGSIZE changed from 2516635 to 2547920 (+1%)
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/pnggetset /usr/lib/libpng/ptest/src/tests/pnggetset"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PV changed from "1.6.56" to "1.6.58"
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGSIZE changed from 2145398 to 2171141 (+1%)
packages/x86-64-v3-poky-linux/libpng/libpng-src: FILELIST: directory renamed /usr/src/debug/libpng/1.6.56/contrib/tools -> /usr/src/debug/libpng/1.6.58/contrib/tools, directory renamed /usr/src/debug/libpng/1.6.56 -> /usr/src/debug/libpng/1.6.58, removed "/usr/src/debug/libpng/1.6.56/contrib/libtests/pngunknown.c /usr/src/debug/libpng/1.6.56/contrib/libtests/pngimage.c /usr/src/debug/libpng/1.6.56/contrib/libtests/pngstest.c /usr/src/debug/libpng/1.6.56/contrib/libtests/pngstest-errors.h /usr/src/debug/libpng/1.6.56/contrib/libtests/timepng.c /usr/src/debug/libpng/1.6.56/contrib/libtests/pngvalid.c", added "/usr/src/debug/libpng/1.6.58/contrib/libtests/pnggetset.c /usr/src/debug/libpng/1.6.58/contrib/libtests/pngunknown.c /usr/src/debug/libpng/1.6.58/contrib/libtests/pngstest.c /usr/src/debug/libpng/1.6.58/contrib/libtests/pngimage.c /usr/src/debug/libpng/1.6.58/contrib/libtests/pngstest-errors.h /usr/src/debug/libpng/1.6.58/contrib/libtests/timepng.c /usr/src/debug/libpng/1.6.58/con
 trib/libtests/pngvalid.c"
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-src: PV changed from "1.6.56" to "1.6.58"
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.56" to "1.6.58"
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PV changed from "1.6.56" to "1.6.58"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.56.0", added "/usr/lib/libpng16.so.16.58.0"
packages/x86-64-v3-poky-linux/libpng/libpng: PKGV changed from 1.6.56 [default] to 1.6.58 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: PV changed from "1.6.56" to "1.6.58"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.56.0 to libpng16.so.16.58.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.56.0 to libpng16.so.16.58.0
  /usr/lib/libpng16.so.16.56.0 moved to /usr/lib/libpng16.so.16.58.0

--===============8532075970123652991==--

