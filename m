Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA4CC43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:31 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39121.1782887651941260013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iH7Xv1rP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i34zTjii;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f1c6295b4-a3c9b019-7154-44ea-9af8-2b02a7750ff5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782887651;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s8xazpcVdLnZLOYTi+31LHnh7ty9lEq9/a7nJi1rPIg=;
	b=iH7Xv1rPEuGYWJE3+Z3efm9U7DMM29sv6ug1nil5ygg06/BNXzSE8A6W54q3xIhF
	80+JVzyhZ0eQ0N1HMOjKKVNbbR0uJ0YjOJz+tLiNU42KGd00pEKL0uznRJ3YqiEWmuw
	VRsVvWRBfBqFeO2yPE5C8aG9xucxqe1dZnvlfIhQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782887651;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s8xazpcVdLnZLOYTi+31LHnh7ty9lEq9/a7nJi1rPIg=;
	b=i34zTjiiDFZJGd1Bmk8TB+3YSe2P2I0DVbKHTN/qOiMM1Nw5gQv6XWJrfxKbl5gQ
	Yf1q6OjokupeuRgS22ajINGRkdaO2Zqc2VHWWwuNPbVo5g9mdVgGZl/0N2PXQQ/S9GS
	csWMlemP+6OgNDK6W7YVQWhaklSyNTxwuciAxURo=
Content-Type: multipart/mixed; boundary="===============2804615951536159503=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.28 SUCCEEDED
Message-ID: <0101019f1c6295b4-a3c9b019-7154-44ea-9af8-2b02a7750ff5-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jul 2026 06:34:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239936

--===============2804615951536159503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.28* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.27-0.3.28.patch
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
From 3232aae8873b927c8a9de8330db2671c5862b9aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jul 2026 06:11:21 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.27 -> 0.3.28

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.27.bb => libxmlb_0.3.28.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.27.bb => libxmlb_0.3.28.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 2dd4a6727b..39e85b319a 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 14e62a2eb40fdd1c78b82b4855541686608c3d45 Mon Sep 17 00:00:00 2001
+From da7a7acacde7771ce4c0fd3ae7e55d0c151ee063 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 043db65..be86a38 100644
+index 795167d..ab2b582 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -3304,7 +3304,7 @@ xb_speed_func(void)
+@@ -3329,7 +3329,7 @@ xb_speed_precompiled_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
index c68f375aa3..0e1c815362 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "2320a66cd267a82bfd41db90e35cd33e1f71bd8b"
+SRCREV = "7a1b31db70bca83345de26219eb7e858cb85d321"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.47.1


--===============2804615951536159503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxmlb: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 2034832 to 2031808 (-0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: FILELIST: added "/usr/include/libxmlb-2/libxmlb/xb-compile-glib-2-62.h"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 357291 to 358319 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGSIZE changed from 305766 to 297574 (-3%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: FILELIST: directory renamed /usr/src/debug/libxmlb/0.3.27/src -> /usr/src/debug/libxmlb/0.3.28/src
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 538134 to 539504 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PV changed from "0.3.27" to "0.3.28"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.27 [default] to 0.3.28 [default]
Changes to packages/x86-64-v3-poky-linux/libxmlb (sysroot):
  /usr/include/libxmlb-2/libxmlb/xb-compile-glib-2-62.h was added

--===============2804615951536159503==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.27-0.3.28.patch"

RnJvbSAzMjMyYWFlODg3M2I5MjdjOGE5ZGU4MzMwZGIyNjcxYzU4NjJiOWFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKdWwgMjAyNiAwNjoxMToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbGI6IHVwZ3JhZGUgMC4zLjI3IC0+IDAuMy4yOAoKLS0tCiAuLi4vbGlieG1sYi8wMDAxLXhi
LXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCB8IDYgKysrLS0tCiAuLi4v
bGlieG1sYi97bGlieG1sYl8wLjMuMjcuYmIgPT4gbGlieG1sYl8wLjMuMjguYmJ9ICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL3tsaWJ4bWxiXzAuMy4yNy5iYiA9PiBs
aWJ4bWxiXzAuMy4yOC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUv
bGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElS
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0
ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAppbmRleCAyZGQ0YTY3MjdiLi4zOWU4
NWIzMTlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAw
MDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElSLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2Rl
LUdfVEVTVF9TUkNESVIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE0ZTYyYTJlYjQwZmRk
MWM3OGI4MmI0ODU1NTQxNjg2NjA4YzNkNDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGRhN2E3YWNhY2RlNzc3MWNlNGMwZmQzYWU3ZTU1ZDBjMTUxZWUwNjMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBT
YXQsIDE2IFNlcCAyMDIzIDE0OjAyOjU3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHhiLXNlbGYt
dGVzdC5jOiBoYXJkY29kZSBHX1RFU1RfU1JDRElSCkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVk
LW9mZi1ieTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3hiLXNl
bGYtdGVzdC5jIGIvc3JjL3hiLXNlbGYtdGVzdC5jCi1pbmRleCAwNDNkYjY1Li5iZTg2YTM4IDEw
MDY0NAoraW5kZXggNzk1MTY3ZC4uYWIyYjU4MiAxMDA2NDQKIC0tLSBhL3NyYy94Yi1zZWxmLXRl
c3QuYwogKysrIGIvc3JjL3hiLXNlbGYtdGVzdC5jCi1AQCAtMzMwNCw3ICszMzA0LDcgQEAgeGJf
c3BlZWRfZnVuYyh2b2lkKQorQEAgLTMzMjksNyArMzMyOSw3IEBAIHhiX3NwZWVkX3ByZWNvbXBp
bGVkX2Z1bmModm9pZCkKICBpbnQKICBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKICB7CmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNy5iYiBi
L21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjI4LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJf
MC4zLjI3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAu
My4yOC5iYgppbmRleCBjNjhmMzc1YWEzLi4wZTFjODE1MzYyIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yOC5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9
ICIgXAogCWZpbGU6Ly8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5w
YXRjaCBcCiAJZmlsZTovL3J1bi1wdGVzdCBcCiAiCi1TUkNSRVYgPSAiMjMyMGE2NmNkMjY3YTgy
YmZkNDFkYjkwZTM1Y2QzM2UxZjcxYmQ4YiIKK1NSQ1JFViA9ICI3YTFiMzFkYjcwYmNhODMzNDVk
ZTI2MjE5ZWI3ZTg1OGNiODVkMzIxIgogCiBERVBFTkRTID0gImdsaWItMi4wIHh6IHpzdGQiCiAK
LS0gCjIuNDcuMQoK

--===============2804615951536159503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: FILELIST: added "/usr/include/libxmlb-2/libxmlb/xb-compile-glib-2-62.h"
Changes to packages/x86-64-v3-poky-linux/libxmlb (sysroot):
  /usr/include/libxmlb-2/libxmlb/xb-compile-glib-2-62.h was added

--===============2804615951536159503==--

