Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7691AD0EE27
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.53257.1728588943607063016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UdvbmGHQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KE/6oovy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019277ee3c0c-360df39d-4dc5-49d3-aa45-f8f6d46b338a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MV2/NT8UqORmBEw6KfaBu3gK+EvTEcstcasybhY5Qrw=;
	b=UdvbmGHQBJGUSoE9ozmodzFsz1x+5g8WORRPWkxiFR/TD3nNThPye+j+5Dv75Ic2
	b3Q8uBGGFLU3U3VB4LK6Wbn5470IeurQSj6njg36BZjBms+VhI/Ja8D8wk0pWJEf7Xv
	MsAokxRoDrmKS9iSlip7C3LEKDMF+aoI2aHUX/DY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MV2/NT8UqORmBEw6KfaBu3gK+EvTEcstcasybhY5Qrw=;
	b=KE/6oovytODGy5ahgkuzfyOdSeRN5XuUC/ReiIX5yCdViIzqihdQty+RGN2S6epU
	zCRZGhxy+gOkYoDDNXq9OhD0y/E0E4/SBgIoBS145isdtN4Iqj46XSoFe84Bgm2BXdv
	pnFytFQ3XtEEfzYKyj9x2xtKv38+t+X6fLTgSvjo=
Content-Type: multipart/mixed; boundary="===============7913093100649809165=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gawk: upgrading to 5.3.1 SUCCEEDED
Message-ID: <0101019277ee3c0c-360df39d-4dc5-49d3-aa45-f8f6d46b338a-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205479

--===============7913093100649809165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gawk* to *5.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gawk-upgrade-5.3.0-5.3.1.patch
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
From 8dd637f5150f6f297448b8dd79a2915d4fc244f0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 14:21:15 +0000
Subject: [PATCH] gawk: upgrade 5.3.0 -> 5.3.1

---
 ...001-m4-readline-add-missing-includes.patch | 38 -------------------
 .../gawk/{gawk_5.3.0.bb => gawk_5.3.1.bb}     |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
 rename meta/recipes-extended/gawk/{gawk_5.3.0.bb => gawk_5.3.1.bb} (95%)

diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
deleted file mode 100644
index 6fffd1f373..0000000000
--- a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 21 May 2024 15:10:11 +0000
-Subject: [PATCH] m4/readline: add missing includes
-
-The cross-specific code fragment only includes stdio.h, where the native
-fragment also includes fcntl.h and unistd.h.  This is important because
-GCC 14.1 has made the implicit definitions an error:
-
-conftest.c: In function 'main':
-conftest.c:144:9: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
-conftest.c:146:14: error: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
-
-Add the missing includes so that the check doesn't always fail due to
-these errors.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=c1613c310d71b87f509458e0259ecd10eda2b140]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- m4/readline.m4 | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/m4/readline.m4 b/m4/readline.m4
-index 38f96326..efd52d4e 100644
---- a/m4/readline.m4
-+++ b/m4/readline.m4
-@@ -66,6 +66,8 @@ dnl action if false:
- dnl action if cross compiling:
- 		[AC_LINK_IFELSE(
- 			[AC_LANG_PROGRAM([[#include <stdio.h>
-+#include <fcntl.h>
-+#include <unistd.h>
- #include <readline/readline.h>
- #include <readline/history.h>]],		dnl includes
- 			dnl function body
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.1.bb
similarity index 95%
rename from meta/recipes-extended/gawk/gawk_5.3.0.bb
rename to meta/recipes-extended/gawk/gawk_5.3.1.bb
index ac9d8500d6..50b891ef14 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.1.bb
@@ -16,11 +16,10 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
-           file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
+SRC_URI[sha256sum] = "fa41b3a85413af87fb5e3a7d9c8fa8d4a20728c67651185bb49c38a7f9382b1e"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.44.1


--===============7913093100649809165==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gawk-upgrade-5.3.0-5.3.1.patch"

RnJvbSA4ZGQ2MzdmNTE1MGY2ZjI5NzQ0OGI4ZGQ3OWEyOTE1ZDRmYzI0NGYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTQ6MjE6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
YXdrOiB1cGdyYWRlIDUuMy4wIC0+IDUuMy4xCgotLS0KIC4uLjAwMS1tNC1yZWFkbGluZS1hZGQt
bWlzc2luZy1pbmNsdWRlcy5wYXRjaCB8IDM4IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9nYXdr
L3tnYXdrXzUuMy4wLmJiID0+IGdhd2tfNS4zLjEuYmJ9ICAgICB8ICAzICstCiAyIGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrLzAwMDEtbTQtcmVhZGxpbmUtYWRkLW1p
c3NpbmctaW5jbHVkZXMucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay97
Z2F3a181LjMuMC5iYiA9PiBnYXdrXzUuMy4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2svMDAwMS1tNC1yZWFkbGluZS1hZGQtbWlzc2luZy1p
bmNsdWRlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2svMDAwMS1tNC1y
ZWFkbGluZS1hZGQtbWlzc2luZy1pbmNsdWRlcy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggNmZmZmQxZjM3My4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ2F3ay9nYXdrLzAwMDEtbTQtcmVhZGxpbmUtYWRkLW1pc3NpbmctaW5jbHVkZXMucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSwzOCArMCwwIEBACi1Gcm9tIDRmNGU4NGYxMzllMmE4NjgyZjEz
NzRhNTkyZjI2MzZjNDNhZDg1N2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLURhdGU6IFR1ZSwgMjEgTWF5IDIwMjQgMTU6
MTA6MTEgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gbTQvcmVhZGxpbmU6IGFkZCBtaXNzaW5nIGlu
Y2x1ZGVzCi0KLVRoZSBjcm9zcy1zcGVjaWZpYyBjb2RlIGZyYWdtZW50IG9ubHkgaW5jbHVkZXMg
c3RkaW8uaCwgd2hlcmUgdGhlIG5hdGl2ZQotZnJhZ21lbnQgYWxzbyBpbmNsdWRlcyBmY250bC5o
IGFuZCB1bmlzdGQuaC4gIFRoaXMgaXMgaW1wb3J0YW50IGJlY2F1c2UKLUdDQyAxNC4xIGhhcyBt
YWRlIHRoZSBpbXBsaWNpdCBkZWZpbml0aW9ucyBhbiBlcnJvcjoKLQotY29uZnRlc3QuYzogSW4g
ZnVuY3Rpb24gJ21haW4nOgotY29uZnRlc3QuYzoxNDQ6OTogZXJyb3I6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uICdjbG9zZSc7IGRpZCB5b3UgbWVhbiAncGNsb3NlJz8gWy1XaW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCi1jb25mdGVzdC5jOjE0NjoxNDogZXJyb3I6IGlt
cGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdvcGVuJzsgZGlkIHlvdSBtZWFuICdwb3Bl
bic/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQotCi1BZGQgdGhlIG1pc3Npbmcg
aW5jbHVkZXMgc28gdGhhdCB0aGUgY2hlY2sgZG9lc24ndCBhbHdheXMgZmFpbCBkdWUgdG8KLXRo
ZXNlIGVycm9ycy4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXQuc2F2
YW5uYWguZ251Lm9yZy9jZ2l0L2dhd2suZ2l0L2NvbW1pdC8/aWQ9YzE2MTNjMzEwZDcxYjg3ZjUw
OTQ1OGUwMjU5ZWNkMTBlZGEyYjE0MF0KLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBhcm0uY29tPgotLS0tCi0gbTQvcmVhZGxpbmUubTQgfCAyICsrCi0gMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvbTQvcmVhZGxpbmUubTQgYi9t
NC9yZWFkbGluZS5tNAotaW5kZXggMzhmOTYzMjYuLmVmZDUyZDRlIDEwMDY0NAotLS0tIGEvbTQv
cmVhZGxpbmUubTQKLSsrKyBiL200L3JlYWRsaW5lLm00Ci1AQCAtNjYsNiArNjYsOCBAQCBkbmwg
YWN0aW9uIGlmIGZhbHNlOgotIGRubCBhY3Rpb24gaWYgY3Jvc3MgY29tcGlsaW5nOgotIAkJW0FD
X0xJTktfSUZFTFNFKAotIAkJCVtBQ19MQU5HX1BST0dSQU0oW1sjaW5jbHVkZSA8c3RkaW8uaD4K
LSsjaW5jbHVkZSA8ZmNudGwuaD4KLSsjaW5jbHVkZSA8dW5pc3RkLmg+Ci0gI2luY2x1ZGUgPHJl
YWRsaW5lL3JlYWRsaW5lLmg+Ci0gI2luY2x1ZGUgPHJlYWRsaW5lL2hpc3RvcnkuaD5dXSwJCWRu
bCBpbmNsdWRlcwotIAkJCWRubCBmdW5jdGlvbiBib2R5Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMy4wLmJiIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMy4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMy4xLmJiCmluZGV4IGFjOWQ4NTAw
ZDYuLjUwYjg5MWVmMTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dh
d2tfNS4zLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjMuMS5i
YgpAQCAtMTYsMTEgKzE2LDEwIEBAIFBBQ0tBR0VDT05GSUdbcmVhZGxpbmVdID0gIi0td2l0aC1y
ZWFkbGluZSwtLXdpdGhvdXQtcmVhZGxpbmUscmVhZGxpbmUiCiBQQUNLQUdFQ09ORklHW21wZnJd
ID0gIi0td2l0aC1tcGZyLC0td2l0aG91dC1tcGZyLCBtcGZyIgogCiBTUkNfVVJJID0gIiR7R05V
X01JUlJPUn0vZ2F3ay9nYXdrLSR7UFZ9LnRhci5neiBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAx
LW00LXJlYWRsaW5lLWFkZC1taXNzaW5nLWluY2x1ZGVzLnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3
OGY4ODY0ZWMyMWNmY2VhYTA0OGY3ZTE4NjlhYzliNDU5N2I0NDkwODdjYWYxZWI1NWU0NDBkMzAy
NzMzMzYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmE0MWIzYTg1NDEzYWY4N2ZiNWUzYTdkOWM4
ZmE4ZDRhMjA3MjhjNjc2NTExODViYjQ5YzM4YTdmOTM4MmIxZSIKIAogaW5oZXJpdCBhdXRvdG9v
bHMgZ2V0dGV4dCB0ZXhpbmZvIHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIAotLSAKMi40NC4xCgo=

--===============7913093100649809165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/re_test.ok /usr/lib/gawk/ptest/test/nsprof3.ok /usr/lib/gawk/ptest/test/typeof7.ok /usr/lib/gawk/ptest/test/typeof8.ok /usr/lib/gawk/ptest/test/dbugarray2.in /usr/lib/gawk/ptest/test/dbugarray1.awk /usr/lib/gawk/ptest/test/nsprof3.awk /usr/lib/gawk/ptest/test/re_test.awk /usr/lib/gawk/ptest/test/printf-corners.ok /usr/lib/gawk/ptest/test/typeof7.awk /usr/lib/gawk/ptest/test/typeof8.awk /usr/lib/gawk/ptest/test/matchuninitialized.ok /usr/lib/gawk/ptest/test/dbugarray4.awk /usr/lib/gawk/ptest/test/dbugarray4.ok /usr/lib/gawk/ptest/test/dbugarray1.ok /usr/lib/gawk/ptest/test/strsubscript.ok /usr/lib/gawk/ptest/test/dbugarray2.awk /usr/lib/gawk/ptest/test/asortsymtab-mpfr.ok /usr/lib/gawk/ptest/test/dbugarray4.in /usr/lib/gawk/ptest/test/dbugarray1.in /usr/lib/gawk/ptest/test/match4.ok /usr/lib/gawk/ptest/test/dbugarray3.awk /usr/lib/gawk/ptest/test/printf-corners-mpfr.ok /usr/lib/gawk/ptest/test/dbug
 array2.ok /usr/lib/gawk/ptest/test/printf-corners.awk /usr/lib/gawk/ptest/test/match4.awk /usr/lib/gawk/ptest/test/matchuninitialized.awk /usr/lib/gawk/ptest/test/dbugarray3.in /usr/lib/gawk/ptest/test/dbugarray3.ok /usr/lib/gawk/ptest/test/strsubscript.awk"
packages/core2-64-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.3.0", added "/usr/bin/gawk-5.3.1"
packages/core2-64-poky-linux/gawk: PACKAGES: added "gawk-locale-ka"

--===============7913093100649809165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gawk/gawk-dbg: PKGSIZE changed from 2552136 to 2567144 (+1%)
packages/core2-64-poky-linux/gawk/gawk-dbg: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-dbg: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-dev: PKGSIZE changed from 42138 to 42488 (+1%)
packages/core2-64-poky-linux/gawk/gawk-dev: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-dev: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-doc: PKGSIZE changed from 2352307 to 2363583 (+0%)
packages/core2-64-poky-linux/gawk/gawk-doc: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-doc: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-gawkbug: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-gawkbug: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-bg: PKGSIZE changed from 125283 to 121033 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-bg: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-bg: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ca: PKGSIZE changed from 51046 to 48698 (-5%)
packages/core2-64-poky-linux/gawk/gawk-locale-ca: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-ca: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-da: PKGSIZE changed from 36004 to 33958 (-6%)
packages/core2-64-poky-linux/gawk/gawk-locale-da: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-da: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-de: PKGSIZE changed from 96695 to 93581 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-de: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-de: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-es: PKGSIZE changed from 95192 to 91998 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-es: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-es: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-fi: PKGSIZE changed from 56396 to 54007 (-4%)
packages/core2-64-poky-linux/gawk/gawk-locale-fi: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-fi: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-fr: PKGSIZE changed from 96983 to 93836 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-fr: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-fr: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-id: PKGSIZE changed from 47007 to 45106 (-4%)
packages/core2-64-poky-linux/gawk/gawk-locale-id: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-id: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-it: PKGSIZE changed from 92886 to 89741 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-it: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-it: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ja: PKGSIZE changed from 36469 to 34352 (-6%)
packages/core2-64-poky-linux/gawk/gawk-locale-ja: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-ja: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ko: PKGSIZE changed from 100387 to 97099 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-ko: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-ko: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ms: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-ms: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-nl: PKGSIZE changed from 68681 to 65683 (-4%)
packages/core2-64-poky-linux/gawk/gawk-locale-nl: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-nl: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-pl: PKGSIZE changed from 94551 to 91466 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-pl: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-pl: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-pt-br: PKGSIZE changed from 86494 to 83119 (-4%)
packages/core2-64-poky-linux/gawk/gawk-locale-pt-br: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-pt-br: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-pt: PKGSIZE changed from 85184 to 81859 (-4%)
packages/core2-64-poky-linux/gawk/gawk-locale-pt: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-pt: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ro: PKGSIZE changed from 97548 to 94356 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-ro: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-ro: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-sr: PKGSIZE changed from 116380 to 113185 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-sr: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-sr: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-sv: PKGSIZE changed from 92545 to 89480 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-sv: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-sv: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-uk: PKGSIZE changed from 119483 to 114854 (-4%)
packages/core2-64-poky-linux/gawk/gawk-locale-uk: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-uk: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-vi: PKGSIZE changed from 63942 to 61178 (-4%)
packages/core2-64-poky-linux/gawk/gawk-locale-vi: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-vi: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-zh-cn: PKGSIZE changed from 86715 to 83805 (-3%)
packages/core2-64-poky-linux/gawk/gawk-locale-zh-cn: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-locale-zh-cn: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-ptest: PKGSIZE changed from 1392513 to 1405254 (+1%)
packages/core2-64-poky-linux/gawk/gawk-ptest: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-ptest: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/dbugarray4.awk /usr/lib/gawk/ptest/test/printf-corners.awk /usr/lib/gawk/ptest/test/dbugarray1.in /usr/lib/gawk/ptest/test/strsubscript.ok /usr/lib/gawk/ptest/test/matchuninitialized.ok /usr/lib/gawk/ptest/test/re_test.awk /usr/lib/gawk/ptest/test/nsprof3.awk /usr/lib/gawk/ptest/test/dbugarray2.awk /usr/lib/gawk/ptest/test/typeof7.awk /usr/lib/gawk/ptest/test/dbugarray1.awk /usr/lib/gawk/ptest/test/typeof8.awk /usr/lib/gawk/ptest/test/dbugarray3.ok /usr/lib/gawk/ptest/test/match4.awk /usr/lib/gawk/ptest/test/printf-corners.ok /usr/lib/gawk/ptest/test/asortsymtab-mpfr.ok /usr/lib/gawk/ptest/test/dbugarray3.in /usr/lib/gawk/ptest/test/dbugarray3.awk /usr/lib/gawk/ptest/test/printf-corners-mpfr.ok /usr/lib/gawk/ptest/test/matchuninitialized.awk /usr/lib/gawk/ptest/test/dbugarray4.in /usr/lib/gawk/ptest/test/dbugarray4.ok /usr/lib/gawk/ptest/test/strsubscript.awk /usr/lib/gawk/ptest/test/dbugarray2.ok
  /usr/lib/gawk/ptest/test/dbugarray2.in /usr/lib/gawk/ptest/test/nsprof3.ok /usr/lib/gawk/ptest/test/typeof8.ok /usr/lib/gawk/ptest/test/typeof7.ok /usr/lib/gawk/ptest/test/re_test.ok /usr/lib/gawk/ptest/test/match4.ok /usr/lib/gawk/ptest/test/dbugarray1.ok"
packages/core2-64-poky-linux/gawk/gawk-src: PKGSIZE changed from 2379256 to 2397440 (+1%)
packages/core2-64-poky-linux/gawk/gawk-src: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-src: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk-src: FILELIST: directory renamed /usr/src/debug/gawk/5.3.0/awklib -> /usr/src/debug/gawk/5.3.1/awklib, directory renamed /usr/src/debug/gawk/5.3.0/posix -> /usr/src/debug/gawk/5.3.1/posix, directory renamed /usr/src/debug/gawk/5.3.0/support -> /usr/src/debug/gawk/5.3.1/support, directory renamed /usr/src/debug/gawk/5.3.0/extension -> /usr/src/debug/gawk/5.3.1/extension, directory renamed /usr/src/debug/gawk/5.3.0/support/malloc -> /usr/src/debug/gawk/5.3.1/support/malloc, removed "/usr/src/debug/gawk/5.3.0/command.c /usr/src/debug/gawk/5.3.0/int_array.c /usr/src/debug/gawk/5.3.0/str_array.c /usr/src/debug/gawk/5.3.0/gawkapi.c /usr/src/debug/gawk/5.3.0/command.y /usr/src/debug/gawk/5.3.0/profile.c /usr/src/debug/gawk/5.3.0/interpret.h /usr/src/debug/gawk/5.3.0/awk.h /usr/src/debug/gawk/5.3.0/gawkapi.h /usr/src/debug/gawk/5.3.0/msg.c /usr/src/debug/gawk/5.3.0/symbol.c /usr/src/debug/gawk/5.3.0/builtin.c /usr/src/debug/gawk/5.3.0/re.c /usr/src/debu
 g/gawk/5.3.0/version.c /usr/src/debug/gawk/5.3.0/awkgram.y /usr/src/debug/gawk/5.3.0/mpfr.c /usr/src/debug/gawk/5.3.0/ext.c /usr/src/debug/gawk/5.3.0/awkgram.c /usr/src/debug/gawk/5.3.0/main.c /usr/src/debug/gawk/5.3.0/eval.c /usr/src/debug/gawk/5.3.0/floatcomp.c /usr/src/debug/gawk/5.3.0/debug.c /usr/src/debug/gawk/5.3.0/field.c /usr/src/debug/gawk/5.3.0/cmd.h /usr/src/debug/gawk/5.3.0/array.c /usr/src/debug/gawk/5.3.0/node.c /usr/src/debug/gawk/5.3.0/io.c /usr/src/debug/gawk/5.3.0/cint_array.c", added "/usr/src/debug/gawk/5.3.1/mpfr.c /usr/src/debug/gawk/5.3.1/floatcomp.c /usr/src/debug/gawk/5.3.1/main.c /usr/src/debug/gawk/5.3.1/msg.c /usr/src/debug/gawk/5.3.1/printf.c /usr/src/debug/gawk/5.3.1/symbol.c /usr/src/debug/gawk/5.3.1/debug.c /usr/src/debug/gawk/5.3.1/array.c /usr/src/debug/gawk/5.3.1/field.c /usr/src/debug/gawk/5.3.1/int_array.c /usr/src/debug/gawk/5.3.1/str_array.c /usr/src/debug/gawk/5.3.1/node.c /usr/src/debug/gawk/5.3.1/eval.c /usr/src/debug/gawk/5.3.1/builtin.c /
 usr/src/debug/gawk/5.3.1/version.c /usr/src/debug/gawk/5.3.1/cmd.h /usr/src/debug/gawk/5.3.1/ext.c /usr/src/debug/gawk/5.3.1/interpret.h /usr/src/debug/gawk/5.3.1/command.y /usr/src/debug/gawk/5.3.1/io.c /usr/src/debug/gawk/5.3.1/gawkapi.c /usr/src/debug/gawk/5.3.1/re.c /usr/src/debug/gawk/5.3.1/cint_array.c /usr/src/debug/gawk/5.3.1/awkgram.c /usr/src/debug/gawk/5.3.1/gawkapi.h /usr/src/debug/gawk/5.3.1/awk.h /usr/src/debug/gawk/5.3.1/command.c /usr/src/debug/gawk/5.3.1/awkgram.y /usr/src/debug/gawk/5.3.1/profile.c"
packages/core2-64-poky-linux/gawk/gawk-staticdev: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk-staticdev: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk: PKGSIZE changed from 941392 to 941410 (+0%)
packages/core2-64-poky-linux/gawk/gawk: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk/gawk: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.3.0", added "/usr/bin/gawk-5.3.1"
packages/core2-64-poky-linux/gawk: PACKAGES: added "gawk-locale-ka"
packages/core2-64-poky-linux/gawk: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/gawk: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/gawk: SRC_URI changed from "https://ftp.gnu.org/gnu/gawk/gawk-5.3.0.tar.gz file://0001-m4-readline-add-missing-includes.patch file://run-ptest" to "https://ftp.gnu.org/gnu/gawk/gawk-5.3.1.tar.gz file://run-ptest"

--===============7913093100649809165==--

