Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F23C54ECB
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.36619.1709330715952703473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vk+mCNrh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=F8/hXrkI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dfc0cd7bc-71927178-d2d9-4b5b-8973-2ec7a889689e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZvysMYxjOrBvUv6YS9d7xafs/8u8XqsLwcD6bbi57ZI=;
	b=Vk+mCNrhQ422xn+MITvfNlM4IumFmdTsyts6lBaDlJU1EUdi2UHaBlturj0P8zzs
	ivR6oCe/Vb8UqO3KYmc73kO59yK6JZoI+4DfNPOACq5c6/vlVXzzio3EC6as0XAfAMC
	KZLgSpWiFH2TdOsFtGS/7Xd8Sdi6JW9t8XyRi4Rg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZvysMYxjOrBvUv6YS9d7xafs/8u8XqsLwcD6bbi57ZI=;
	b=F8/hXrkIZbgjIcOvIWcRhNDQ+rVgKcuvgCEOMNn6Ok6p2awT8yxj440C4c44Ek9A
	S95iFFHgpt5dh/IHdrW/iVWFrwgAefKkOn7KCwh+0ADuCCulzKVOJ3+I6muLPx+fHYt
	DeF0y/U53tn9Kx08dyizUvKHdcUAOQyqBIyInPyI=
Content-Type: multipart/mixed; boundary="===============6124694831850534567=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] minicom: upgrading to 2.9 SUCCEEDED
Message-ID: <0101018dfc0cd7bc-71927178-d2d9-4b5b-8973-2ec7a889689e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196518

--===============6124694831850534567==
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
From 78d791cb9b16fd414cdc1ec0f992d9a7328af65e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 15:12:26 +0000
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


--===============6124694831850534567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/minicom: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.8.orig.tar.bz2 file://allow.to.disable.lockdev.patch file://0001-fix-minicom-h-v-return-value-is-not-0.patch" to "http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.9.orig.tar.bz2"
packages/core2-64-poky-linux/minicom: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-dbg: PKGSIZE changed from 578816 to 584688 (+1%)
packages/core2-64-poky-linux/minicom/minicom-dbg: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-dbg: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-dev: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-dev: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-doc: PKGSIZE changed from 45114 to 45118 (+0%)
packages/core2-64-poky-linux/minicom/minicom-doc: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-doc: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-locale: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-locale: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-src: PKGSIZE changed from 432221 to 438718 (+2%)
packages/core2-64-poky-linux/minicom/minicom-src: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-src: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom-staticdev: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom-staticdev: PKGV changed from 2.8 [default] to 2.9 [default]
packages/core2-64-poky-linux/minicom/minicom: PKGSIZE changed from 257842 to 271570 (+5%)
packages/core2-64-poky-linux/minicom/minicom: PV changed from "2.8" to "2.9"
packages/core2-64-poky-linux/minicom/minicom: PKGV changed from 2.8 [default] to 2.9 [default]

--===============6124694831850534567==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-minicom-upgrade-2.8-2.9.patch"

RnJvbSA3OGQ3OTFjYjliMTZmZDQxNGNkYzFlYzBmOTkyZDlhNzMyOGFmNjVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNToxMjoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1p
bmljb206IHVwZ3JhZGUgMi44IC0+IDIuOQoKLS0tCiAuLi5peC1taW5pY29tLWgtdi1yZXR1cm4t
dmFsdWUtaXMtbm90LTAucGF0Y2ggfCAzMyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vbWluaWNv
bS9hbGxvdy50by5kaXNhYmxlLmxvY2tkZXYucGF0Y2ggICAgfCAzMCAtLS0tLS0tLS0tLS0tLS0t
LQogLi4uL3ttaW5pY29tXzIuOC5iYiA9PiBtaW5pY29tXzIuOS5iYn0gICAgICAgIHwgIDcgKyst
LQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDY4IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21pbmljb20vMDAw
MS1maXgtbWluaWNvbS1oLXYtcmV0dXJuLXZhbHVlLWlzLW5vdC0wLnBhdGNoCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20vbWluaWNvbS9hbGxvdy50by5k
aXNhYmxlLmxvY2tkZXYucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNv
bS97bWluaWNvbV8yLjguYmIgPT4gbWluaWNvbV8yLjkuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20vbWluaWNvbS8wMDAxLWZpeC1taW5pY29tLWgt
di1yZXR1cm4tdmFsdWUtaXMtbm90LTAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWlu
aWNvbS9taW5pY29tLzAwMDEtZml4LW1pbmljb20taC12LXJldHVybi12YWx1ZS1pcy1ub3QtMC5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggOWU2NzEyNmYzZS4uMDAwMDAwMDAw
MAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tLzAwMDEtZml4LW1p
bmljb20taC12LXJldHVybi12YWx1ZS1pcy1ub3QtMC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDMzICswLDAgQEAKLUV4aXQgbm9ybWFsbHkgZm9yIGhlbHAvdmVyaXNvbiBvcHRpb25zCi0KLUlm
IC12IG9yIC1oIGlzIHVzZWQgZm9yIHRoZSBoZWxwL3ZlcnNpb24gaW5mb3JtYXRpb24sIGl0IGlz
IGEgbm9ybWFsIGV4aXQgc2l0dWF0aW9uLAotbm90IGFuIGVycm9yIGNvbmRpdGlvbi4gU29tZXRp
bWVzIHRoZXNlIGFyZSB1c2VkIGFzIGEgc2ltcGxlIG9wZXJhdGlvbiB0ZXN0IG9mIHRoZQotcmVz
dWx0aW5nIGJpbmFyeSBzbyB0aGUgZXhpdCBjb2RlIGRvZXMgbWF0dGVyLgotCi1TaWduZWQtb2Zm
LWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4K
LVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL3NhbHNhLmRlYmlhbi5vcmcvbWlu
aWNvbS10ZWFtL21pbmljb20vLS9tZXJnZV9yZXF1ZXN0cy8xNF0KLS0tLQotIHNyYy9taW5pY29t
LmMgfCAgICA2ICsrLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCi0KLUluZGV4OiBtaW5pY29tLTIuOC9zcmMvbWluaWNvbS5jCi09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Ci0tLS0gbWluaWNvbS0yLjgub3JpZy9zcmMvbWluaWNvbS5jCi0rKysgbWluaWNvbS0yLjgvc3Jj
L21pbmljb20uYwotQEAgLTEyNTcsMTQgKzEyNTcsMTQgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQotICAgICAgICAgICAgICAgICAgIm1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlXG4iCi0gICAgICAgICAgICAgICAgICAi
YXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJz
aW9uXG4iCi0gICAgICAgICAgICAgICAgICAiMiBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIg
b3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi5cblxuIikpOwotLSAgICAgICAgICBleGl0KDEpOwot
KyAgICAgICAgICBleGl0KDApOwotICAgICAgICAgICBicmVhazsKLSAgICAgICAgIGNhc2UgJ3Mn
OiAvKiBzZXR1cCBtb2RlICovCi0gICAgICAgICAgIGRvc2V0dXAgPSAxOwotICAgICAgICAgICBi
cmVhazsKLSAgICAgICAgIGNhc2UgJ2gnOgotICAgICAgICAgICBoZWxwdGhlbSgpOwotLSAgICAg
ICAgICBleGl0KDEpOwotKyAgICAgICAgICBleGl0KDApOwotICAgICAgICAgICBicmVhazsKLSAg
ICAgICAgIGNhc2UgJ3AnOiAvKiBQc2V1ZG8gdGVybWluYWwgdG8gdXNlLiAqLwotICAgICAgICAg
ICBpZiAoc3RybmNtcChvcHRhcmcsICIvZGV2LyIsIDUpID09IDApCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tL2FsbG93LnRvLmRpc2FibGUubG9ja2Rl
di5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21pbmljb20vYWxsb3cudG8u
ZGlzYWJsZS5sb2NrZGV2LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzOWRj
NWMwNDkyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21p
bmljb20vYWxsb3cudG8uZGlzYWJsZS5sb2NrZGV2LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEs
MzAgKzAsMCBAQAotY29uZmlndXJlOiBBbGxvdyBsb2NrZGV2IHRvIGJlIGRpc2FibGVkCi0KLVdo
ZW4gdGhlIHBrZ2NvbmZpZyBkZXBlbmRlbmNpZXMgbWF5IGJlIHByZXNlbnQsIGl0IGlzIHVzZWZ1
bCB0byBiZQotYWJsZSB0byBleHBsaWN0bHkgZGlzYWJsZSB0aGUgbG9ja2RldiBkZXBlbmRlbmN5
LiBUaGlzIGFkZHMgc3VjaCBhbgotb3B0aW9uLgotCi1TaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSmFu
c2EgPE1hcnRpbi5KYW5zYUBnbWFpbC5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KLQotVXBzdHJlYW0tU3RhdHVz
OiBTdWJtaXR0ZWQgW2h0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9taW5pY29tLXRlYW0vbWluaWNv
bS8tL21lcmdlX3JlcXVlc3RzLzE0XQotCi1JbmRleDogbWluaWNvbS0yLjgvY29uZmlndXJlLmFj
Ci09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Ci0tLS0gbWluaWNvbS0yLjgub3JpZy9jb25maWd1cmUuYWMKLSsrKyBtaW5p
Y29tLTIuOC9jb25maWd1cmUuYWMKLUBAIC00Myw3ICs0MywxMyBAQCBpZiB0ZXN0ICJ4JGVuYWJs
ZV9zb2NrZXQiID0geHllczsgdGhlbgotIGZpCi0gCi0gUEtHX1BST0dfUEtHX0NPTkZJRwotLWlm
IHRlc3QgLW4gIiRQS0dfQ09ORklHIjsgdGhlbgotKwotK0FDX0FSR19FTkFCTEUoW2xvY2tkZXZd
LAotKyAgICAgICAgQVNfSEVMUF9TVFJJTkcoWy0tZW5hYmxlLWxvY2tkZXZdLAotKyAgICAgICAg
ICAgICAgICAgICAgICAgW0VuYWJsZSBsb2NrZGV2IHN1cHBvcnQgKGRlZjogZW5hYmxlZCldKSwK
LSsgICAgICAgIFtdLCBbZW5hYmxlX2xvY2tkZXY9InllcyJdKQotKwotK2lmIHRlc3QgLW4gIiRQ
S0dfQ09ORklHIiAmJiB0ZXN0ICJ4JGVuYWJsZV9sb2NrZGV2IiA9IHh5ZXM7IHRoZW4KLSAJUEtH
X0NIRUNLX01PRFVMRVMoW0xPQ0tERVZdLCBbbG9ja2Rldl0sIEFDX0RFRklORShbSEFWRV9MT0NL
REVWXSxbMV0sW0RlZmluZSBpZiB5b3UgaGF2ZSBsb2NrZGV2XSksWzpdKQotIGZpCi0gCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tXzIuOC5iYiBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21pbmljb21fMi45LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21pbmljb21f
Mi44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tXzIu
OS5iYgppbmRleCAyNjQwYzZiMDU3Li45MDdkNWM3OWM5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tXzIuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbWluaWNvbS9taW5pY29tXzIuOS5iYgpAQCAtNywxMiArNyw5IEBAIExJQ0VOU0UgPSAi
R1BMLTIuMC1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTQyMDQ3N2FiYzU2NzQwNGRlYmNhMGEyYTFjYjZiNjQ1IFwKICAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL3NyYy9taW5pY29tLmg7YmVnaW5saW5lPTE7ZW5kbGluZT0xMjttZDU9YTU4ODM4Y2I3
MDlmMGRiNTE3ZjRlNDI3MzBjNDllODEiCiAKLVNSQ19VUkkgPSAiJHtERUJJQU5fTUlSUk9SfS9t
YWluL20vJHtCUE59LyR7QlBOfV8ke1BWfS5vcmlnLnRhci5iejIgXAotICAgICAgICAgICBmaWxl
Oi8vYWxsb3cudG8uZGlzYWJsZS5sb2NrZGV2LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAw
MDEtZml4LW1pbmljb20taC12LXJldHVybi12YWx1ZS1pcy1ub3QtMC5wYXRjaCBcCi0iCitTUkNf
VVJJID0gIiR7REVCSUFOX01JUlJPUn0vbWFpbi9tLyR7QlBOfS8ke0JQTn1fJHtQVn0ub3JpZy50
YXIuYnoyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzhjZWEzMDkxM2EyMDM0OTMyNmZmM2Yx
NzYzZWUxNTEyYjdiNDE2MDFjMjRmMDY1ZjM2NWUxOGU5ZGIwYmViYSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI5ZWZiYjY0NTgxNDBlNWEwZGU0NDU2MTNmMGU3NmJjZjEyY2JmN2E5ODkyYjJmNTNl
MDc1YzJlN2JlYWJhODZjIgogCiBQQUNLQUdFQ09ORklHID8/PSAiIgogUEFDS0FHRUNPTkZJR1ts
b2NrZGV2XSA9ICItLWVuYWJsZS1sb2NrZGV2LC0tZGlzYWJsZS1sb2NrZGV2LGxvY2tkZXYiCi0t
IAoyLjQyLjAKCg==

--===============6124694831850534567==--

