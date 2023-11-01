Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E06C25B54
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8639.1698848702607659161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZXdZD+WT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C2EDzUFK;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b45fcc0-0ed6b713-a77f-4372-b98b-4d8830ea9c1f-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848701;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GrFhuyVYDxas2hSyG3CG0+O1jiqdZJsD8MuqRGpwWZU=;
	b=ZXdZD+WTto5F6NJp/7buctS4cwzLrz10/M2lIbAI+9gxQd10agjk5A5wxhxnyqYc
	45ryvni5Uv36QWsEIL8je2wj06mtJL/+fA/utPufxXbhcsOpeVwVhRc8FktN+iFnu91
	Br+1xVAjaqyYmoxUzPivGmP1i2qAEMUDOtcrAJMg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848701;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GrFhuyVYDxas2hSyG3CG0+O1jiqdZJsD8MuqRGpwWZU=;
	b=C2EDzUFKINF2BbSiWaBZap2PuIRp8MhWaWWL6t7BLmcCf/foj4SF+quhgnw5f8De
	MPwq5ih8oxoJtp0UvLHfsNxYk3b+ki29I1c5TKsDCRDMscAcjD0Ym1OR4BtjcsIXyGb
	8fh72wQonsno508Chgi8s55lidm4wZqEQ1tkdstY=
Content-Type: multipart/mixed; boundary="===============2444920979607084341=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] base-passwd: upgrading to 3.6.2 SUCCEEDED
Message-ID: <0101018b8b45fcc0-0ed6b713-a77f-4372-b98b-4d8830ea9c1f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189919

--===============2444920979607084341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *base-passwd* to *3.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-base-passwd-upgrade-3.6.1-3.6.2.patch
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
From 2772d435a2b52d104761e501e9414f09d44646cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 05:46:47 +0000
Subject: [PATCH] base-passwd: upgrade 3.6.1 -> 3.6.2

---
 ...-to-configure-whether-to-use-SELinux.patch | 35 -------------------
 ...e-passwd_3.6.1.bb => base-passwd_3.6.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.1.bb => base-passwd_3.6.2.bb} (96%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
deleted file mode 100644
index 2cc6174e2a..0000000000
--- a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 25e3bf09bbbb04aa930ea0fd9f28809a24fb7194 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Sun, 2 Oct 2022 17:47:29 +0200
-Subject: [PATCH] Make it possible to configure whether to use SELinux or not
-
-Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/396c41bb35e03c5dcc727aa9f74218a45874ac1f]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- configure.ac | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 589df88..e46403b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -13,7 +13,18 @@ AC_SYS_LARGEFILE
- 
- dnl Scan for things we need
- AC_CHECK_FUNCS([putgrent])
--AC_CHECK_LIB([selinux], [is_selinux_enabled])
-+
-+dnl Check for SELinux
-+AC_MSG_CHECKING([whether to enable SELinux support])
-+AC_ARG_ENABLE([selinux],
-+  [AS_HELP_STRING([--disable-selinux], [disable support for SELinux])],
-+  [],
-+  [enable_selinux=yes])
-+AC_MSG_RESULT($enable_selinux)
-+AS_IF([test "x$enable_selinux" != xno],
-+  [AC_CHECK_LIB([selinux], [is_selinux_enabled], [],
-+    [AC_MSG_ERROR(
-+      [SELinux support not available (use --disable-selinux to disable)])])])
- 
- dnl Check for debconf
- AC_MSG_CHECKING([whether to enable debconf support])
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
similarity index 96%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
index 44bcfb0199..bb4b49e6ab 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
@@ -11,12 +11,11 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch \
            file://0004-Add-an-input-group-for-the-dev-input-devices.patch \
            file://0005-Add-kvm-group.patch \
-           file://0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch \
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6c6428f2c92866f79af"
+SRC_URI[sha256sum] = "06dc78352bf38a8df76ff295e15ab5654cdefe41e62368b15bfcbbab8e4ec2a0"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.39.2


--===============2444920979607084341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PV changed from "3.6.1" to "3.6.2"
packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PKGV changed from 3.6.1 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PV changed from "3.6.1" to "3.6.2"
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PKGV changed from 3.6.1 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PV changed from "3.6.1" to "3.6.2"
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGV changed from 3.6.1 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGSIZE changed from 19516 to 19779 (+1%)
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PV changed from "3.6.1" to "3.6.2"
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PKGV changed from 3.6.1 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PV changed from "3.6.1" to "3.6.2"
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PKGV changed from 3.6.1 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PV changed from "3.6.1" to "3.6.2"
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PKGV changed from 3.6.1 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PV changed from "3.6.1" to "3.6.2"
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PKGV changed from 3.6.1 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd: PV changed from "3.6.1" to "3.6.2"
packages/core2-64-poky-linux/base-passwd/base-passwd: PKGV changed from 3.6.1 [default] to 3.6.2 [default]
packages/core2-64-poky-linux/base-passwd: SRC_URI changed from "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.1.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patch" to "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.2.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patc
 h"
packages/core2-64-poky-linux/base-passwd: PV changed from "3.6.1" to "3.6.2"
packages/core2-64-poky-linux/base-passwd: PKGV changed from 3.6.1 [default] to 3.6.2 [default]

--===============2444920979607084341==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-base-passwd-upgrade-3.6.1-3.6.2.patch"

RnJvbSAyNzcyZDQzNWEyYjUyZDEwNDc2MWU1MDFlOTQxNGYwOWQ0NDY0NmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNTo0Njo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
c2UtcGFzc3dkOiB1cGdyYWRlIDMuNi4xIC0+IDMuNi4yCgotLS0KIC4uLi10by1jb25maWd1cmUt
d2hldGhlci10by11c2UtU0VMaW51eC5wYXRjaCB8IDM1IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
LmUtcGFzc3dkXzMuNi4xLmJiID0+IGJhc2UtcGFzc3dkXzMuNi4yLmJifSB8ICAzICstCiAyIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzNyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA2LU1h
a2UtaXQtcG9zc2libGUtdG8tY29uZmlndXJlLXdoZXRoZXItdG8tdXNlLVNFTGludXgucGF0Y2gK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC97YmFzZS1wYXNzd2RfMy42LjEu
YmIgPT4gYmFzZS1wYXNzd2RfMy42LjIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwNi1NYWtlLWl0LXBvc3NpYmxlLXRv
LWNvbmZpZ3VyZS13aGV0aGVyLXRvLXVzZS1TRUxpbnV4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNv
cmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwNi1NYWtlLWl0LXBvc3NpYmxlLXRvLWNvbmZp
Z3VyZS13aGV0aGVyLXRvLXVzZS1TRUxpbnV4LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAyY2M2MTc0ZTJhLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Jh
c2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDYtTWFrZS1pdC1wb3NzaWJsZS10by1jb25maWd1cmUt
d2hldGhlci10by11c2UtU0VMaW51eC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM1ICswLDAg
QEAKLUZyb20gMjVlM2JmMDliYmJiMDRhYTkzMGVhMGZkOWYyODgwOWEyNGZiNzE5NCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFBldGVyIEtqZWxsZXJzdGVkdCA8cGtqQGF4aXMuY29t
PgotRGF0ZTogU3VuLCAyIE9jdCAyMDIyIDE3OjQ3OjI5ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hd
IE1ha2UgaXQgcG9zc2libGUgdG8gY29uZmlndXJlIHdoZXRoZXIgdG8gdXNlIFNFTGludXggb3Ig
bm90Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vc2Fsc2EuZGViaWFuLm9y
Zy9kZWJpYW4vYmFzZS1wYXNzd2QvLS9jb21taXQvMzk2YzQxYmIzNWUwM2M1ZGNjNzI3YWE5Zjc0
MjE4YTQ1ODc0YWMxZl0KLVNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIu
a2plbGxlcnN0ZWR0QGF4aXMuY29tPgotLS0tCi0gY29uZmlndXJlLmFjIHwgMTMgKysrKysrKysr
KysrLQotIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0K
LWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDU4OWRmODgu
LmU0NjQwM2IgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2NvbmZpZ3VyZS5hYwot
QEAgLTEzLDcgKzEzLDE4IEBAIEFDX1NZU19MQVJHRUZJTEUKLSAKLSBkbmwgU2NhbiBmb3IgdGhp
bmdzIHdlIG5lZWQKLSBBQ19DSEVDS19GVU5DUyhbcHV0Z3JlbnRdKQotLUFDX0NIRUNLX0xJQihb
c2VsaW51eF0sIFtpc19zZWxpbnV4X2VuYWJsZWRdKQotKwotK2RubCBDaGVjayBmb3IgU0VMaW51
eAotK0FDX01TR19DSEVDS0lORyhbd2hldGhlciB0byBlbmFibGUgU0VMaW51eCBzdXBwb3J0XSkK
LStBQ19BUkdfRU5BQkxFKFtzZWxpbnV4XSwKLSsgIFtBU19IRUxQX1NUUklORyhbLS1kaXNhYmxl
LXNlbGludXhdLCBbZGlzYWJsZSBzdXBwb3J0IGZvciBTRUxpbnV4XSldLAotKyAgW10sCi0rICBb
ZW5hYmxlX3NlbGludXg9eWVzXSkKLStBQ19NU0dfUkVTVUxUKCRlbmFibGVfc2VsaW51eCkKLStB
U19JRihbdGVzdCAieCRlbmFibGVfc2VsaW51eCIgIT0geG5vXSwKLSsgIFtBQ19DSEVDS19MSUIo
W3NlbGludXhdLCBbaXNfc2VsaW51eF9lbmFibGVkXSwgW10sCi0rICAgIFtBQ19NU0dfRVJST1Io
Ci0rICAgICAgW1NFTGludXggc3VwcG9ydCBub3QgYXZhaWxhYmxlICh1c2UgLS1kaXNhYmxlLXNl
bGludXggdG8gZGlzYWJsZSldKV0pXSkKLSAKLSBkbmwgQ2hlY2sgZm9yIGRlYmNvbmYKLSBBQ19N
U0dfQ0hFQ0tJTkcoW3doZXRoZXIgdG8gZW5hYmxlIGRlYmNvbmYgc3VwcG9ydF0pCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuMS5iYiBi
L21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkXzMuNi4yLmJiCnNpbWls
YXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dk
L2Jhc2UtcGFzc3dkXzMuNi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBh
c3N3ZC9iYXNlLXBhc3N3ZF8zLjYuMi5iYgppbmRleCA0NGJjZmIwMTk5Li5iYjRiNDllNmFiIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYu
Mi5iYgpAQCAtMTEsMTIgKzExLDExIEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9sYXVuY2hwYWQubmV0
L2RlYmlhbi8rYXJjaGl2ZS9wcmltYXJ5LytmaWxlcy8ke0JQTn1fJHtQVn0udGFyCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAzLVJlbW92ZS1mb3Itcm9vdC1zaW5jZS13ZS1kby1ub3QtaGF2ZS1hbi1l
dGMtc2hhZG93LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDQtQWRkLWFuLWlucHV0LWdy
b3VwLWZvci10aGUtZGV2LWlucHV0LWRldmljZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
MDAwNS1BZGQta3ZtLWdyb3VwLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDYtTWFrZS1p
dC1wb3NzaWJsZS10by1jb25maWd1cmUtd2hldGhlci10by11c2UtU0VMaW51eC5wYXRjaCBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDA3LUFkZC13aGVlbC1ncm91cC5wYXRjaCBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWJhc2UtcGFzc3dkLUFkZC10aGUtc2d4LWdyb3VwLnBhdGNoIFwKICAgICAg
ICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmZmMzY5YmU1OWQ1ODZiYTYzYzBjNWZj
YjAwZjc1Zjk5NTNmZTQ5ZGI4OGJjNmM2NDI4ZjJjOTI4NjZmNzlhZiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwNmRjNzgzNTJiZjM4YThkZjc2ZmYyOTVlMTVhYjU2NTRjZGVmZTQxZTYyMzY4YjE1
YmZjYmJhYjhlNGVjMmEwIgogCiAjIHRoZSBwYWNrYWdlIGlzIHRha2VuIGZyb20gbGF1bmNocGFk
OyB0aGF0IHNvdXJjZSBpcyBzdGF0aWMgYW5kIGdvZXMgc3RhbGUKICMgc28gd2UgY2hlY2sgdGhl
IGxhdGVzdCB1cHN0cmVhbSBmcm9tIGEgZGlyZWN0b3J5IHRoYXQgZG9lcyBnZXQgdXBkYXRlZAot
LSAKMi4zOS4yCgo=

--===============2444920979607084341==--

