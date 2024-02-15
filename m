Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9793C54E7B
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:35 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.20171.1708018346150775017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IF/w2f1I;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BE4Qadw8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018dadd3a6a0-4c8da9e6-1212-4151-9eff-76a7d58ddf48-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4NEF6p9vF4lbwGvZ31xlbmF/kBb2wHu6mwgGmqavVKc=;
	b=IF/w2f1I/njN//fT6F2QlsDdUdaGJ5/wDoPjRtQpYObK8FNGLMBPFIWCPzn2qyja
	Jia/hvfkvhxDIb2FFC7qSJfTRYzQ3Y9p3pvAM1bBSQloeUVD8SKWxmCChSG8iUrZKci
	+rwLEvNHzv4L6z8KZFnUdb1y4UbadpH+Gdov6HKY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4NEF6p9vF4lbwGvZ31xlbmF/kBb2wHu6mwgGmqavVKc=;
	b=BE4Qadw8OkbycpxlT2ExzUgVj51oEhOu+V9av2vBbpdYZoDvI058F1085gT5zBre
	PknFQl3VrZuJEUrYtM2te9T1xI1OjFI8eH1Mgzg8Zr6Ma262lasgrm+8vPM1FkHfeeb
	3OWWbmx3EyMAOrgVZjF8l8F/GbgccKjLSRxv43iA=
Content-Type: multipart/mixed; boundary="===============8015664045986620534=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] minicom: upgrading to 2.9 SUCCEEDED
Message-ID: <0101018dadd3a6a0-4c8da9e6-1212-4151-9eff-76a7d58ddf48-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195618

--===============8015664045986620534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *minicom* to *2.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-minicom-upgrade-2.8-2.9.patch
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
From efe093f026a8c40bae31f7b17a318b066881fa93 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 11:45:08 +0000
Subject: [PATCH] minicom: upgrade 2.8 -> 2.9

---
 ...ix-minicom-h-v-return-value-is-not-0.patch | 33 -------------------
 .../minicom/allow.to.disable.lockdev.patch    | 30 -----------------
 .../{minicom_2.8.bb => minicom_2.9.bb}        |  7 ++--
 3 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
 rename meta/recipes-extended/minicom/{minicom_2.8.bb => minicom_2.9.bb} (80%)

diff --git a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
deleted file mode 100644
index 9e67126f3e..0000000000
--- a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Exit normally for help/verison options
-
-If -v or -h is used for the help/version information, it is a normal exit situation,
-not an error condition. Sometimes these are used as a simple operation test of the
-resulting binary so the exit code does matter.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
----
- src/minicom.c |    6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-Index: minicom-2.8/src/minicom.c
-===================================================================
---- minicom-2.8.orig/src/minicom.c
-+++ minicom-2.8/src/minicom.c
-@@ -1257,14 +1257,14 @@ int main(int argc, char **argv)
-                  "modify it under the terms of the GNU General Public License\n"
-                  "as published by the Free Software Foundation; either version\n"
-                  "2 of the License, or (at your option) any later version.\n\n"));
--          exit(1);
-+          exit(0);
-           break;
-         case 's': /* setup mode */
-           dosetup = 1;
-           break;
-         case 'h':
-           helpthem();
--          exit(1);
-+          exit(0);
-           break;
-         case 'p': /* Pseudo terminal to use. */
-           if (strncmp(optarg, "/dev/", 5) == 0)
diff --git a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch b/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
deleted file mode 100644
index 39dc5c0492..0000000000
--- a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-configure: Allow lockdev to be disabled
-
-When the pkgconfig dependencies may be present, it is useful to be
-able to explictly disable the lockdev dependency. This adds such an
-option.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
-
-Index: minicom-2.8/configure.ac
-===================================================================
---- minicom-2.8.orig/configure.ac
-+++ minicom-2.8/configure.ac
-@@ -43,7 +43,13 @@ if test "x$enable_socket" = xyes; then
- fi
- 
- PKG_PROG_PKG_CONFIG
--if test -n "$PKG_CONFIG"; then
-+
-+AC_ARG_ENABLE([lockdev],
-+        AS_HELP_STRING([--enable-lockdev],
-+                       [Enable lockdev support (def: enabled)]),
-+        [], [enable_lockdev="yes"])
-+
-+if test -n "$PKG_CONFIG" && test "x$enable_lockdev" = xyes; then
- 	PKG_CHECK_MODULES([LOCKDEV], [lockdev], AC_DEFINE([HAVE_LOCKDEV],[1],[Define if you have lockdev]),[:])
- fi
- 
diff --git a/meta/recipes-extended/minicom/minicom_2.8.bb b/meta/recipes-extended/minicom/minicom_2.9.bb
similarity index 80%
rename from meta/recipes-extended/minicom/minicom_2.8.bb
rename to meta/recipes-extended/minicom/minicom_2.9.bb
index 2640c6b057..907d5c79c9 100644
--- a/meta/recipes-extended/minicom/minicom_2.8.bb
+++ b/meta/recipes-extended/minicom/minicom_2.9.bb
@@ -7,12 +7,9 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
-           file://allow.to.disable.lockdev.patch \
-           file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
-"
+SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
 
-SRC_URI[sha256sum] = "38cea30913a20349326ff3f1763ee1512b7b41601c24f065f365e18e9db0beba"
+SRC_URI[sha256sum] = "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.42.0


--===============8015664045986620534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/minicom: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.8.orig.tar.bz2 file://allow.to.disable.lockdev.patch file://0001-fix-minicom-h-v-return-value-is-not-0.patch" to "http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.9.orig.tar.bz2"
packages/core2-64-poky-linux/minicom/minicom-dbg: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-dbg: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-dbg: PKGSIZE changed from 578816 to 584688 (+1%)
packages/core2-64-poky-linux/minicom/minicom-dev: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-dev: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-doc: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-doc: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-doc: PKGSIZE changed from 45114 to 45118 (+0%)
packages/core2-64-poky-linux/minicom/minicom-locale: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-locale: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-src: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-src: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-src: PKGSIZE changed from 432221 to 438718 (+2%)
packages/core2-64-poky-linux/minicom/minicom-staticdev: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-staticdev: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom: PKGSIZE changed from 257842 to 271570 (+5%)

--===============8015664045986620534==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-minicom-upgrade-2.8-2.9.patch"

RnJvbSBlZmUwOTNmMDI2YThjNDBiYWUzMWY3YjE3YTMxOGIwNjY4ODFmYTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTE6NDU6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
aW5pY29tOiB1cGdyYWRlIDIuOCAtPiAyLjkKCi0tLQogLi4uaXgtbWluaWNvbS1oLXYtcmV0dXJu
LXZhbHVlLWlzLW5vdC0wLnBhdGNoIHwgMzMgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL21pbmlj
b20vYWxsb3cudG8uZGlzYWJsZS5sb2NrZGV2LnBhdGNoICAgIHwgMzAgLS0tLS0tLS0tLS0tLS0t
LS0KIC4uLi97bWluaWNvbV8yLjguYmIgPT4gbWluaWNvbV8yLjkuYmJ9ICAgICAgICB8ICA3ICsr
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2OCBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tLzAw
MDEtZml4LW1pbmljb20taC12LXJldHVybi12YWx1ZS1pcy1ub3QtMC5wYXRjaAogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21pbmljb20vYWxsb3cudG8u
ZGlzYWJsZS5sb2NrZGV2LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmlj
b20ve21pbmljb21fMi44LmJiID0+IG1pbmljb21fMi45LmJifSAoODAlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21pbmljb20vMDAwMS1maXgtbWluaWNvbS1o
LXYtcmV0dXJuLXZhbHVlLWlzLW5vdC0wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21p
bmljb20vbWluaWNvbS8wMDAxLWZpeC1taW5pY29tLWgtdi1yZXR1cm4tdmFsdWUtaXMtbm90LTAu
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDllNjcxMjZmM2UuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20vbWluaWNvbS8wMDAxLWZpeC1t
aW5pY29tLWgtdi1yZXR1cm4tdmFsdWUtaXMtbm90LTAucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAt
MSwzMyArMCwwIEBACi1FeGl0IG5vcm1hbGx5IGZvciBoZWxwL3Zlcmlzb24gb3B0aW9ucwotCi1J
ZiAtdiBvciAtaCBpcyB1c2VkIGZvciB0aGUgaGVscC92ZXJzaW9uIGluZm9ybWF0aW9uLCBpdCBp
cyBhIG5vcm1hbCBleGl0IHNpdHVhdGlvbiwKLW5vdCBhbiBlcnJvciBjb25kaXRpb24uIFNvbWV0
aW1lcyB0aGVzZSBhcmUgdXNlZCBhcyBhIHNpbXBsZSBvcGVyYXRpb24gdGVzdCBvZiB0aGUKLXJl
c3VsdGluZyBiaW5hcnkgc28gdGhlIGV4aXQgY29kZSBkb2VzIG1hdHRlci4KLQotU2lnbmVkLW9m
Zi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
Ci1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL21p
bmljb20tdGVhbS9taW5pY29tLy0vbWVyZ2VfcmVxdWVzdHMvMTRdCi0tLS0KLSBzcmMvbWluaWNv
bS5jIHwgICAgNiArKy0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQotCi1JbmRleDogbWluaWNvbS0yLjgvc3JjL21pbmljb20uYwotPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQotLS0tIG1pbmljb20tMi44Lm9yaWcvc3JjL21pbmljb20uYwotKysrIG1pbmljb20tMi44L3Ny
Yy9taW5pY29tLmMKLUBAIC0xMjU3LDE0ICsxMjU3LDE0IEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyICoqYXJndikKLSAgICAgICAgICAgICAgICAgICJtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZVxuIgotICAgICAgICAgICAgICAgICAg
ImFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVy
c2lvblxuIgotICAgICAgICAgICAgICAgICAgIjIgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3Vy
IG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uXG5cbiIpKTsKLS0gICAgICAgICAgZXhpdCgxKTsK
LSsgICAgICAgICAgZXhpdCgwKTsKLSAgICAgICAgICAgYnJlYWs7Ci0gICAgICAgICBjYXNlICdz
JzogLyogc2V0dXAgbW9kZSAqLwotICAgICAgICAgICBkb3NldHVwID0gMTsKLSAgICAgICAgICAg
YnJlYWs7Ci0gICAgICAgICBjYXNlICdoJzoKLSAgICAgICAgICAgaGVscHRoZW0oKTsKLS0gICAg
ICAgICAgZXhpdCgxKTsKLSsgICAgICAgICAgZXhpdCgwKTsKLSAgICAgICAgICAgYnJlYWs7Ci0g
ICAgICAgICBjYXNlICdwJzogLyogUHNldWRvIHRlcm1pbmFsIHRvIHVzZS4gKi8KLSAgICAgICAg
ICAgaWYgKHN0cm5jbXAob3B0YXJnLCAiL2Rldi8iLCA1KSA9PSAwKQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20vbWluaWNvbS9hbGxvdy50by5kaXNhYmxlLmxvY2tk
ZXYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tL2FsbG93LnRv
LmRpc2FibGUubG9ja2Rldi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMzlk
YzVjMDQ5Mi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9t
aW5pY29tL2FsbG93LnRvLmRpc2FibGUubG9ja2Rldi5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDMwICswLDAgQEAKLWNvbmZpZ3VyZTogQWxsb3cgbG9ja2RldiB0byBiZSBkaXNhYmxlZAotCi1X
aGVuIHRoZSBwa2djb25maWcgZGVwZW5kZW5jaWVzIG1heSBiZSBwcmVzZW50LCBpdCBpcyB1c2Vm
dWwgdG8gYmUKLWFibGUgdG8gZXhwbGljdGx5IGRpc2FibGUgdGhlIGxvY2tkZXYgZGVwZW5kZW5j
eS4gVGhpcyBhZGRzIHN1Y2ggYW4KLW9wdGlvbi4KLQotU2lnbmVkLW9mZi1ieTogTWFydGluIEph
bnNhIDxNYXJ0aW4uSmFuc2FAZ21haWwuY29tPgotU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0KLVVwc3RyZWFtLVN0YXR1
czogU3VibWl0dGVkIFtodHRwczovL3NhbHNhLmRlYmlhbi5vcmcvbWluaWNvbS10ZWFtL21pbmlj
b20vLS9tZXJnZV9yZXF1ZXN0cy8xNF0KLQotSW5kZXg6IG1pbmljb20tMi44L2NvbmZpZ3VyZS5h
YwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQotLS0tIG1pbmljb20tMi44Lm9yaWcvY29uZmlndXJlLmFjCi0rKysgbWlu
aWNvbS0yLjgvY29uZmlndXJlLmFjCi1AQCAtNDMsNyArNDMsMTMgQEAgaWYgdGVzdCAieCRlbmFi
bGVfc29ja2V0IiA9IHh5ZXM7IHRoZW4KLSBmaQotIAotIFBLR19QUk9HX1BLR19DT05GSUcKLS1p
ZiB0ZXN0IC1uICIkUEtHX0NPTkZJRyI7IHRoZW4KLSsKLStBQ19BUkdfRU5BQkxFKFtsb2NrZGV2
XSwKLSsgICAgICAgIEFTX0hFTFBfU1RSSU5HKFstLWVuYWJsZS1sb2NrZGV2XSwKLSsgICAgICAg
ICAgICAgICAgICAgICAgIFtFbmFibGUgbG9ja2RldiBzdXBwb3J0IChkZWY6IGVuYWJsZWQpXSks
Ci0rICAgICAgICBbXSwgW2VuYWJsZV9sb2NrZGV2PSJ5ZXMiXSkKLSsKLStpZiB0ZXN0IC1uICIk
UEtHX0NPTkZJRyIgJiYgdGVzdCAieCRlbmFibGVfbG9ja2RldiIgPSB4eWVzOyB0aGVuCi0gCVBL
R19DSEVDS19NT0RVTEVTKFtMT0NLREVWXSwgW2xvY2tkZXZdLCBBQ19ERUZJTkUoW0hBVkVfTE9D
S0RFVl0sWzFdLFtEZWZpbmUgaWYgeW91IGhhdmUgbG9ja2Rldl0pLFs6XSkKLSBmaQotIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20vbWluaWNvbV8yLjguYmIgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tXzIuOS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29t
XzIuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20vbWluaWNvbV8y
LjkuYmIKaW5kZXggMjY0MGM2YjA1Ny4uOTA3ZDVjNzljOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21pbmljb20vbWluaWNvbV8yLjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL21pbmljb20vbWluaWNvbV8yLjkuYmIKQEAgLTcsMTIgKzcsOSBAQCBMSUNFTlNFID0g
IkdQTC0yLjAtb3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT00MjA0NzdhYmM1Njc0MDRkZWJjYTBhMmExY2I2YjY0NSBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9zcmMvbWluaWNvbS5oO2JlZ2lubGluZT0xO2VuZGxpbmU9MTI7bWQ1PWE1ODgzOGNi
NzA5ZjBkYjUxN2Y0ZTQyNzMwYzQ5ZTgxIgogCi1TUkNfVVJJID0gIiR7REVCSUFOX01JUlJPUn0v
bWFpbi9tLyR7QlBOfS8ke0JQTn1fJHtQVn0ub3JpZy50YXIuYnoyIFwKLSAgICAgICAgICAgZmls
ZTovL2FsbG93LnRvLmRpc2FibGUubG9ja2Rldi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8w
MDAxLWZpeC1taW5pY29tLWgtdi1yZXR1cm4tdmFsdWUtaXMtbm90LTAucGF0Y2ggXAotIgorU1JD
X1VSSSA9ICIke0RFQklBTl9NSVJST1J9L21haW4vbS8ke0JQTn0vJHtCUE59XyR7UFZ9Lm9yaWcu
dGFyLmJ6MiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM4Y2VhMzA5MTNhMjAzNDkzMjZmZjNm
MTc2M2VlMTUxMmI3YjQxNjAxYzI0ZjA2NWYzNjVlMThlOWRiMGJlYmEiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOWVmYmI2NDU4MTQwZTVhMGRlNDQ1NjEzZjBlNzZiY2YxMmNiZjdhOTg5MmIyZjUz
ZTA3NWMyZTdiZWFiYTg2YyIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUdb
bG9ja2Rldl0gPSAiLS1lbmFibGUtbG9ja2RldiwtLWRpc2FibGUtbG9ja2Rldixsb2NrZGV2Igot
LSAKMi40Mi4wCgo=

--===============8015664045986620534==--

