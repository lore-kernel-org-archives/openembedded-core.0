Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21DAC48BEF
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.88837.1705340028829172787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VysIB4jO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lR6A+WaI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018d0e2fcd2d-60692b71-bbe2-4d2b-9af2-b9790219c18c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8ewZXary1wRZPUUqgXwvN0oiP9kltqJzNhF64VJOrMg=;
	b=VysIB4jOc+OJmJjGMAmsNP2jHvzqv6OJiWfr2NAzVF5TK8BN/oiqLcJXoIvoKUO0
	7ArvflDxDNPMXOlVg1zmzqVcpc17o22XkWN0EMs5ncyo3xIAS3MbqF38rUFrz57M7TK
	jXvpCyd8ocBORmj68auJHrbxxwHY4mdbSqmZuQuE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8ewZXary1wRZPUUqgXwvN0oiP9kltqJzNhF64VJOrMg=;
	b=lR6A+WaIS1lnFc41Ge02/lNdHMnZNzlVbyYaT2cZsoeNyD9oVZPqGwLZzkLMmuRQ
	m9dCxng9DoenzhmzV6+Rqc/3BNOp+26+vE11BY8gFZkxWxRFg0995CIhPSJSJ5pmkDB
	+ZgtH7THDjuY45lCqvz1kW/wUFYVaJ1sS3EZaRt8=
Content-Type: multipart/mixed; boundary="===============6429700557214348462=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cronie: upgrading to 1.7.1 SUCCEEDED
Message-ID: <0101018d0e2fcd2d-60692b71-bbe2-4d2b-9af2-b9790219c18c-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193729

--===============6429700557214348462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cronie* to *1.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cronie-upgrade-1.7.0-1.7.1.patch
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
From 6a909cc2e5bc513b4535b6bedb1da26c211ab715 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 10:06:54 +0000
Subject: [PATCH] cronie: upgrade 1.7.0 -> 1.7.1

---
 .../cronie/cronie/crond_pam_config.patch               | 10 ++++++++++
 .../cronie/{cronie_1.7.0.bb => cronie_1.7.1.bb}        |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.7.0.bb => cronie_1.7.1.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
index c374790d1d..464d1470e3 100644
--- a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
+++ b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
@@ -1,9 +1,19 @@
+From f5b325cba73018e5be984570fd4e680e59e7865d Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Wed, 20 Jul 2011 02:42:28 +0000
+Subject: [PATCH] cronie: enable PAM support for cronie
+
 password-auth is the Fedora's common pam configure file, use oe common pam
 configure files instead.
 
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+---
+ pam/crond | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
 diff --git a/pam/crond b/pam/crond
 index 560529d..95a6457 100644
 --- a/pam/crond
diff --git a/meta/recipes-extended/cronie/cronie_1.7.0.bb b/meta/recipes-extended/cronie/cronie_1.7.1.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.7.0.bb
rename to meta/recipes-extended/cronie/cronie_1.7.1.bb
index 24c419b1c5..854b68163c 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "6827f5a47760cc64afeef0a60d3cb5376f52569109fc9a73957dd5e9fdae7619"
+SRC_URI[sha256sum] = "78033100c24413f0c40f93e6138774d6a4f55bc31050567b90db45a2f9f1b954"
 
 inherit autotools update-rc.d useradd systemd github-releases
 UPSTREAM_CHECK_REGEX = "releases/tag/cronie-(?P<pver>\d+(\.\d+)+)"
-- 
2.42.0


--===============6429700557214348462==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cronie-upgrade-1.7.0-1.7.1.patch"

RnJvbSA2YTkwOWNjMmU1YmM1MTNiNDUzNWI2YmVkYjFkYTI2YzIxMWFiNzE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTA6MDY6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cm9uaWU6IHVwZ3JhZGUgMS43LjAgLT4gMS43LjEKCi0tLQogLi4uL2Nyb25pZS9jcm9uaWUvY3Jv
bmRfcGFtX2NvbmZpZy5wYXRjaCAgICAgICAgICAgICAgIHwgMTAgKysrKysrKysrKwogLi4uL2Ny
b25pZS97Y3JvbmllXzEuNy4wLmJiID0+IGNyb25pZV8xLjcuMS5iYn0gICAgICAgIHwgIDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jcm9uaWUve2Nyb25pZV8xLjcuMC5iYiA9PiBjcm9uaWVf
MS43LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Nyb25p
ZS9jcm9uaWUvY3JvbmRfcGFtX2NvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9j
cm9uaWUvY3JvbmllL2Nyb25kX3BhbV9jb25maWcucGF0Y2gKaW5kZXggYzM3NDc5MGQxZC4uNDY0
ZDE0NzBlMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Nyb25pZS9jcm9uaWUv
Y3JvbmRfcGFtX2NvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Jvbmll
L2Nyb25pZS9jcm9uZF9wYW1fY29uZmlnLnBhdGNoCkBAIC0xLDkgKzEsMTkgQEAKK0Zyb20gZjVi
MzI1Y2JhNzMwMThlNWJlOTg0NTcwZmQ0ZTY4MGU1OWU3ODY1ZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb206IFdlbnpvbmcgRmFuIDx3ZW56b25nLmZhbkB3aW5kcml2ZXIuY29tPgorRGF0
ZTogV2VkLCAyMCBKdWwgMjAxMSAwMjo0MjoyOCArMDAwMAorU3ViamVjdDogW1BBVENIXSBjcm9u
aWU6IGVuYWJsZSBQQU0gc3VwcG9ydCBmb3IgY3JvbmllCisKIHBhc3N3b3JkLWF1dGggaXMgdGhl
IEZlZG9yYSdzIGNvbW1vbiBwYW0gY29uZmlndXJlIGZpbGUsIHVzZSBvZSBjb21tb24gcGFtCiBj
b25maWd1cmUgZmlsZXMgaW5zdGVhZC4KIAogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAKIFNp
Z25lZC1vZmYtYnk6IFdlbnpvbmcgRmFuIDx3ZW56b25nLmZhbkB3aW5kcml2ZXIuY29tPgorCist
LS0KKyBwYW0vY3JvbmQgfCA2ICsrKy0tLQorIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCisKIGRpZmYgLS1naXQgYS9wYW0vY3JvbmQgYi9wYW0vY3JvbmQK
IGluZGV4IDU2MDUyOWQuLjk1YTY0NTcgMTAwNjQ0CiAtLS0gYS9wYW0vY3JvbmQKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jcm9uaWUvY3JvbmllXzEuNy4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2Nyb25pZS9jcm9uaWVfMS43LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5
NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Nyb25pZS9jcm9uaWVfMS43LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jcm9uaWUvY3JvbmllXzEuNy4xLmJi
CmluZGV4IDI0YzQxOWIxYzUuLjg1NGI2ODE2M2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9jcm9uaWUvY3JvbmllXzEuNy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9jcm9uaWUvY3JvbmllXzEuNy4xLmJiCkBAIC0yNSw3ICsyNSw3IEBAIFNSQ19VUkkgPSAiJHtH
SVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL2Nyb25pZS0ke1BWfS9jcm9uaWUtJHtQVn0udGFyLmd6
IFwKIFBBTV9TUkNfVVJJID0gImZpbGU6Ly9jcm9uZF9wYW1fY29uZmlnLnBhdGNoIgogUEFNX0RF
UFMgPSAibGlicGFtIGxpYnBhbS1ydW50aW1lIHBhbS1wbHVnaW4tYWNjZXNzIHBhbS1wbHVnaW4t
bG9naW51aWQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2ODI3ZjVhNDc3NjBjYzY0YWZlZWYw
YTYwZDNjYjUzNzZmNTI1NjkxMDlmYzlhNzM5NTdkZDVlOWZkYWU3NjE5IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjc4MDMzMTAwYzI0NDEzZjBjNDBmOTNlNjEzODc3NGQ2YTRmNTViYzMxMDUwNTY3
YjkwZGI0NWEyZjlmMWI5NTQiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHVwZGF0ZS1yYy5kIHVzZXJh
ZGQgc3lzdGVtZCBnaXRodWItcmVsZWFzZXMKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVh
c2VzL3RhZy9jcm9uaWUtKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgotLSAKMi40Mi4wCgo=

--===============6429700557214348462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cronie/cronie-dbg: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-64-poky-linux/cronie/cronie-dbg: PV changed from "1.7.0" to "1.7.1"
packages/core2-64-poky-linux/cronie/cronie-dbg: PKGSIZE changed from 430448 to 431056 (+0%)
packages/core2-64-poky-linux/cronie/cronie-dev: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-64-poky-linux/cronie/cronie-dev: PV changed from "1.7.0" to "1.7.1"
packages/core2-64-poky-linux/cronie/cronie-doc: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-64-poky-linux/cronie/cronie-doc: PV changed from "1.7.0" to "1.7.1"
packages/core2-64-poky-linux/cronie/cronie-locale: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-64-poky-linux/cronie/cronie-locale: PV changed from "1.7.0" to "1.7.1"
packages/core2-64-poky-linux/cronie/cronie-src: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-64-poky-linux/cronie/cronie-src: PV changed from "1.7.0" to "1.7.1"
packages/core2-64-poky-linux/cronie/cronie-src: PKGSIZE changed from 188710 to 188935 (+0%)
packages/core2-64-poky-linux/cronie/cronie-staticdev: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-64-poky-linux/cronie/cronie-staticdev: PV changed from "1.7.0" to "1.7.1"
packages/core2-64-poky-linux/cronie/cronie: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-64-poky-linux/cronie/cronie: PV changed from "1.7.0" to "1.7.1"
packages/core2-64-poky-linux/cronie: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-64-poky-linux/cronie: SRC_URI changed from "https://github.com/cronie-crond/cronie/releases//download/cronie-1.7.0/cronie-1.7.0.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch" to "https://github.com/cronie-crond/cronie/releases//download/cronie-1.7.1/cronie-1.7.1.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch"
packages/core2-64-poky-linux/cronie: PV changed from "1.7.0" to "1.7.1"

--===============6429700557214348462==--

