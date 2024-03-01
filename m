Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACE6C54E60
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.36972.1709330716128757584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ASRjgpTx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l2AkEj57;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dfc0cd29c-1dbd1562-1f73-4ac6-a55f-29c2559cb9af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MA7Im+/jqjw1TPYoGdeACPC65s23W0FGuN4Ik5VyAro=;
	b=ASRjgpTx/gKgTcDzMnUhlQhpwx1Ukj08lsEHaG5cefSOlcl+UJjxvvtpuZwmMhay
	C3UAanA9sMHpgGDI76RpLYfVQ9rRx4iGJpebSuTcVDt1U8kVNnKR7TA+1g+knb3hHqt
	Ce3TTZ3r3AGVEU/VUL3W6oHogL6raxn+4URSGVXU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MA7Im+/jqjw1TPYoGdeACPC65s23W0FGuN4Ik5VyAro=;
	b=l2AkEj57tge+93tzUXdenwu7OMHdgZa2iKjxEBO4AH9H6AXUkCXkSmxfhnn4vkIM
	Gyrfq0vm33eYrGyQb5zZ+uOd0LVIByhwRxZRATSV4lH8/KcqTErbVZu8s8ypbTKuepc
	Fj9TgdH+E32PGuwFLRL7udMxhW1+SSenTzamegSs=
Content-Type: multipart/mixed; boundary="===============5378551064303366215=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext: upgrading to 0.22.5 FAILED
Message-ID: <0101018dfc0cd29c-1dbd1562-1f73-4ac6-a55f-29c2559cb9af-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196469

--===============5378551064303366215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gettext* to *0.22.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gettext-upgrade-0.22.4-0.22.5.patch
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
From 3597abe2af8a9bbad90a832ef102cbcd233e2861 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 10:41:13 +0000
Subject: [PATCH] gettext: upgrade 0.22.4 -> 0.22.5

---
 meta/recipes-core/gettext/gettext-sources.inc     |  2 +-
 ...-init-env.in-do-not-add-C-CXX-parameters.patch |  2 +-
 .../0001-tests-autopoint-3-unset-MAKEFLAGS.patch  |  6 +++---
 meta/recipes-core/gettext/gettext/parallel.patch  |  7 +++----
 .../gettext/gettext/serial-tests-config.patch     |  9 ++++-----
 .../gettext/gettext/use-pkgconfig.patch           | 15 +++++++--------
 .../{gettext_0.22.4.bb => gettext_0.22.5.bb}      |  0
 7 files changed, 19 insertions(+), 22 deletions(-)
 rename meta/recipes-core/gettext/{gettext_0.22.4.bb => gettext_0.22.5.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 8b4e240101..fd05837528 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "c1e0bb2a4427a9024390c662cd532d664c4b36b8ff444ed5e54b115fdb7a1aea"
+SRC_URI[sha256sum] = "ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a94cb6c8fa48996a0"
diff --git a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
index d45b75869a..33d45a038c 100644
--- a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
+++ b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
@@ -1,4 +1,4 @@
-From 9b912a47f790a7b282ec0c2295a188c5d8fb6a7c Mon Sep 17 00:00:00 2001
+From c58c503c532d20883a93ef778327c86dd6de24f6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 6 Mar 2020 21:04:05 +0000
 Subject: [PATCH] init-env.in: do not add C/CXX parameters
diff --git a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
index b0bc6b97a6..94afb255c3 100644
--- a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
+++ b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
@@ -1,4 +1,4 @@
-From 38b256e5aa7dfeb42acffd89565e53a2c0bab3e3 Mon Sep 17 00:00:00 2001
+From 7006142d199af13628edc687847a9a5bac48b45d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Jan 2020 16:44:38 +0100
 Subject: [PATCH] tests/autopoint-3: unset MAKEFLAGS
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gettext-tools/tests/autopoint-3 b/gettext-tools/tests/autopoint-3
-index e13552b..55188df 100755
+index bd3fbf3..380eaac 100755
 --- a/gettext-tools/tests/autopoint-3
 +++ b/gettext-tools/tests/autopoint-3
-@@ -126,6 +126,7 @@ test $? = 0 || { cat autopoint.err; Exit 1; }
+@@ -131,6 +131,7 @@ test $? = 0 || { cat autopoint.err; Exit 1; }
  ${CONFIG_SHELL} ./configure >/dev/null 2>autpoint.err
  test $? = 0 || { cat autopoint.err; Exit 1; }
  
diff --git a/meta/recipes-core/gettext/gettext/parallel.patch b/meta/recipes-core/gettext/gettext/parallel.patch
index d96a376b7d..8ecba46fd0 100644
--- a/meta/recipes-core/gettext/gettext/parallel.patch
+++ b/meta/recipes-core/gettext/gettext/parallel.patch
@@ -1,4 +1,4 @@
-From 4a2a0a93b469093b60ffd0bec55d33d1e03d4713 Mon Sep 17 00:00:00 2001
+From 83333bc873c2655ff1de161f6b7db930f22f1cea Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Thu, 7 Jun 2012 16:37:01 -0700
 Subject: [PATCH] instal libgettextlib.a before removing it
@@ -10,16 +10,15 @@ the operations.
 Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
-
 ---
  gettext-tools/gnulib-lib/Makefile.am | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/gettext-tools/gnulib-lib/Makefile.am b/gettext-tools/gnulib-lib/Makefile.am
-index 2126699..d2dd7e4 100644
+index ab729cd..a0d713e 100644
 --- a/gettext-tools/gnulib-lib/Makefile.am
 +++ b/gettext-tools/gnulib-lib/Makefile.am
-@@ -58,6 +58,10 @@ endif
+@@ -58,6 +58,10 @@ AM_CFLAGS = @WARN_CFLAGS@
  # Rules generated and collected by gnulib-tool.
  include Makefile.gnulib
  
diff --git a/meta/recipes-core/gettext/gettext/serial-tests-config.patch b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
index 93f7c03334..7d39d6086a 100644
--- a/meta/recipes-core/gettext/gettext/serial-tests-config.patch
+++ b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
@@ -1,4 +1,4 @@
-From ed64a5724ef7d6eb4e9a876f817ea266a536e195 Mon Sep 17 00:00:00 2001
+From aa8dfe0aafd0b53a6c5bac61b356ca92e1430a36 Mon Sep 17 00:00:00 2001
 From: "Hongjun.Yang" <hongjun.yang@windriver.com>
 Date: Thu, 28 Jul 2016 12:36:15 +0800
 Subject: [PATCH] fix for ptest
@@ -8,7 +8,6 @@ Add serial-tests support, ptest need it
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  configure.ac                 | 2 +-
  gettext-runtime/configure.ac | 2 +-
@@ -16,7 +15,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 38db6fd..f019ae0 100644
+index f4e54ea..a47ff14 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext],
@@ -29,7 +28,7 @@ index 38db6fd..f019ae0 100644
  dnl Override automake's tar command used for creating distributions.
  am__tar='${AMTAR} chf - --format=ustar --owner=root --group=root "$$tardir"'
 diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure.ac
-index de203e7..138a07f 100644
+index 126d069..aa23232 100644
 --- a/gettext-runtime/configure.ac
 +++ b/gettext-runtime/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
@@ -42,7 +41,7 @@ index de203e7..138a07f 100644
  
  dnl Installation directories.
 diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
-index cf1dd73..b544d6d 100644
+index 3610ee3..6f56a23 100644
 --- a/gettext-tools/configure.ac
 +++ b/gettext-tools/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
index f1fb61de4e..ceb1856118 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 38c361e6860bfaefbefeccae621e698c301879f2 Mon Sep 17 00:00:00 2001
+From 6aa1338b916fe72c200b6f160b934be15b6ff590 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 23 Jan 2018 00:54:13 +0000
 Subject: [PATCH] gettext: beat library detection into shape
@@ -12,12 +12,11 @@ Simply delete all the crazy, and replace with a single call to pkg-config.
 
 Upstream-Status: Inappropriate [upstream still refuse to consider pkg-config]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
- gettext-tools/gnulib-m4/libxml.m4             | 105 +----------------
- libtextstyle/gnulib-local/m4/libglib.m4       | 106 +++---------------
- libtextstyle/gnulib-m4/libglib.m4             | 106 +++---------------
- 3 files changed, 79 insertions(+), 470 deletions(-)
+ gettext-tools/gnulib-m4/libxml.m4       | 105 ++---------------------
+ libtextstyle/gnulib-local/m4/libglib.m4 | 106 +++---------------------
+ libtextstyle/gnulib-m4/libglib.m4       | 106 +++---------------------
+ 3 files changed, 31 insertions(+), 286 deletions(-)
 
 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.m4
 index 0340490..0355388 100644
@@ -143,7 +142,7 @@ index 0340490..0355388 100644
    ])
    AC_SUBST([LIBXML])
 diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnulib-local/m4/libglib.m4
-index 7ee5029..bb1e5e4 100644
+index dbc9eb8..136e512 100644
 --- a/libtextstyle/gnulib-local/m4/libglib.m4
 +++ b/libtextstyle/gnulib-local/m4/libglib.m4
 @@ -6,106 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
@@ -267,7 +266,7 @@ index 7ee5029..bb1e5e4 100644
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
 diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/libglib.m4
-index 7ee5029..bb1e5e4 100644
+index dbc9eb8..136e512 100644
 --- a/libtextstyle/gnulib-m4/libglib.m4
 +++ b/libtextstyle/gnulib-m4/libglib.m4
 @@ -6,106 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
diff --git a/meta/recipes-core/gettext/gettext_0.22.4.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.22.4.bb
rename to meta/recipes-core/gettext/gettext_0.22.5.bb
-- 
2.42.0


--===============5378551064303366215==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gettext-upgrade-0.22.4-0.22.5.patch"

RnJvbSAzNTk3YWJlMmFmOGE5YmJhZDkwYTgzMmVmMTAyY2JjZDIzM2UyODYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMDo0MToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdl
dHRleHQ6IHVwZ3JhZGUgMC4yMi40IC0+IDAuMjIuNQoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9n
ZXR0ZXh0L2dldHRleHQtc291cmNlcy5pbmMgICAgIHwgIDIgKy0KIC4uLi1pbml0LWVudi5pbi1k
by1ub3QtYWRkLUMtQ1hYLXBhcmFtZXRlcnMucGF0Y2ggfCAgMiArLQogLi4uLzAwMDEtdGVzdHMt
YXV0b3BvaW50LTMtdW5zZXQtTUFLRUZMQUdTLnBhdGNoICB8ICA2ICsrKy0tLQogbWV0YS9yZWNp
cGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0L3BhcmFsbGVsLnBhdGNoICB8ICA3ICsrKy0tLS0KIC4u
Li9nZXR0ZXh0L2dldHRleHQvc2VyaWFsLXRlc3RzLWNvbmZpZy5wYXRjaCAgICAgfCAgOSArKysr
LS0tLS0KIC4uLi9nZXR0ZXh0L2dldHRleHQvdXNlLXBrZ2NvbmZpZy5wYXRjaCAgICAgICAgICAg
fCAxNSArKysrKysrLS0tLS0tLS0KIC4uLi97Z2V0dGV4dF8wLjIyLjQuYmIgPT4gZ2V0dGV4dF8w
LjIyLjUuYmJ9ICAgICAgfCAgMAogNyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAy
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L3tnZXR0ZXh0
XzAuMjIuNC5iYiA9PiBnZXR0ZXh0XzAuMjIuNS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0LXNvdXJjZXMuaW5jIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZ2V0dGV4dC9nZXR0ZXh0LXNvdXJjZXMuaW5jCmluZGV4IDhiNGUyNDAxMDEuLmZkMDU4
Mzc1MjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4dC1zb3Vy
Y2VzLmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHQtc291cmNlcy5p
bmMKQEAgLTEsNCArMSw0IEBACiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LmdudS5vcmcvc29mdHdh
cmUvZ2V0dGV4dC9nZXR0ZXh0Lmh0bWwiCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZ2V0dGV4
dC9nZXR0ZXh0LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjMWUwYmIyYTQ0MjdhOTAyNDM5MGM2NjJjZDUzMmQ2NjRjNGIzNmI4ZmY0NDRlZDVlNTRi
MTE1ZmRiN2ExYWVhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVjMTcwNWIxZTk2OWI4M2E5ZjA3
MzE0NGVjODA2MTUxZGI4ODEyN2Y1ZTQwZmU1YTk0Y2I2YzhmYTQ4OTk2YTAiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHQvMDAwMS1pbml0LWVudi5pbi1kby1u
b3QtYWRkLUMtQ1hYLXBhcmFtZXRlcnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0
L2dldHRleHQvMDAwMS1pbml0LWVudi5pbi1kby1ub3QtYWRkLUMtQ1hYLXBhcmFtZXRlcnMucGF0
Y2gKaW5kZXggZDQ1Yjc1ODY5YS4uMzNkNDVhMDM4YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2V0dGV4dC9nZXR0ZXh0LzAwMDEtaW5pdC1lbnYuaW4tZG8tbm90LWFkZC1DLUNYWC1w
YXJhbWV0ZXJzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4dC8w
MDAxLWluaXQtZW52LmluLWRvLW5vdC1hZGQtQy1DWFgtcGFyYW1ldGVycy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gOWI5MTJhNDdmNzkwYTdiMjgyZWMwYzIyOTVhMTg4YzVkOGZiNmE3YyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzU4YzUwM2M1MzJkMjA4ODNhOTNlZjc3ODMy
N2M4NmRkNmRlMjRmNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCA2IE1hciAyMDIwIDIx
OjA0OjA1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGluaXQtZW52LmluOiBkbyBub3QgYWRkIEMv
Q1hYIHBhcmFtZXRlcnMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0
dGV4dC8wMDAxLXRlc3RzLWF1dG9wb2ludC0zLXVuc2V0LU1BS0VGTEFHUy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4dC8wMDAxLXRlc3RzLWF1dG9wb2ludC0zLXVuc2V0
LU1BS0VGTEFHUy5wYXRjaAppbmRleCBiMGJjNmI5N2E2Li45NGFmYjI1NWMzIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHQvMDAwMS10ZXN0cy1hdXRvcG9pbnQt
My11bnNldC1NQUtFRkxBR1MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4dC9n
ZXR0ZXh0LzAwMDEtdGVzdHMtYXV0b3BvaW50LTMtdW5zZXQtTUFLRUZMQUdTLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSAzOGIyNTZlNWFhN2RmZWI0MmFjZmZkODk1NjVlNTNhMmMwYmFiM2Uz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3MDA2MTQyZDE5OWFmMTM2MjhlZGM2ODc4
NDdhOWE1YmFjNDhiNDVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDcgSmFuIDIwMjAg
MTY6NDQ6MzggKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvYXV0b3BvaW50LTM6IHVuc2V0
IE1BS0VGTEFHUwpAQCAtMTMsMTAgKzEzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvZ2V0dGV4dC10b29scy90ZXN0cy9hdXRvcG9pbnQtMyBi
L2dldHRleHQtdG9vbHMvdGVzdHMvYXV0b3BvaW50LTMKLWluZGV4IGUxMzU1MmIuLjU1MTg4ZGYg
MTAwNzU1CitpbmRleCBiZDNmYmYzLi4zODBlYWFjIDEwMDc1NQogLS0tIGEvZ2V0dGV4dC10b29s
cy90ZXN0cy9hdXRvcG9pbnQtMwogKysrIGIvZ2V0dGV4dC10b29scy90ZXN0cy9hdXRvcG9pbnQt
MwotQEAgLTEyNiw2ICsxMjYsNyBAQCB0ZXN0ICQ/ID0gMCB8fCB7IGNhdCBhdXRvcG9pbnQuZXJy
OyBFeGl0IDE7IH0KK0BAIC0xMzEsNiArMTMxLDcgQEAgdGVzdCAkPyA9IDAgfHwgeyBjYXQgYXV0
b3BvaW50LmVycjsgRXhpdCAxOyB9CiAgJHtDT05GSUdfU0hFTEx9IC4vY29uZmlndXJlID4vZGV2
L251bGwgMj5hdXRwb2ludC5lcnIKICB0ZXN0ICQ/ID0gMCB8fCB7IGNhdCBhdXRvcG9pbnQuZXJy
OyBFeGl0IDE7IH0KICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0
dGV4dC9wYXJhbGxlbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4dC9w
YXJhbGxlbC5wYXRjaAppbmRleCBkOTZhMzc2YjdkLi44ZWNiYTQ2ZmQwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHQvcGFyYWxsZWwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0L3BhcmFsbGVsLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA0YTJhMGE5M2I0NjkwOTNiNjBmZmQwYmVjNTVkMzNkMWUwM2Q0NzEzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MzMzM2JjODczYzI2NTVmZjFkZTE2MWY2YjdkYjkz
MGYyMmYxY2VhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9lIFNsYXRlciA8anNs
YXRlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCA3IEp1biAyMDEyIDE2OjM3OjAxIC0wNzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGluc3RhbCBsaWJnZXR0ZXh0bGliLmEgYmVmb3JlIHJlbW92aW5n
IGl0CkBAIC0xMCwxNiArMTAsMTUgQEAgdGhlIG9wZXJhdGlvbnMuCiBVcHN0cmVhbS1TdGF0dXM6
IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8anNsYXRlckB3aW5kcml2ZXIu
Y29tPgotCiAtLS0KICBnZXR0ZXh0LXRvb2xzL2dudWxpYi1saWIvTWFrZWZpbGUuYW0gfCA0ICsr
KysKICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9nZXR0
ZXh0LXRvb2xzL2dudWxpYi1saWIvTWFrZWZpbGUuYW0gYi9nZXR0ZXh0LXRvb2xzL2dudWxpYi1s
aWIvTWFrZWZpbGUuYW0KLWluZGV4IDIxMjY2OTkuLmQyZGQ3ZTQgMTAwNjQ0CitpbmRleCBhYjcy
OWNkLi5hMGQ3MTNlIDEwMDY0NAogLS0tIGEvZ2V0dGV4dC10b29scy9nbnVsaWItbGliL01ha2Vm
aWxlLmFtCiArKysgYi9nZXR0ZXh0LXRvb2xzL2dudWxpYi1saWIvTWFrZWZpbGUuYW0KLUBAIC01
OCw2ICs1OCwxMCBAQCBlbmRpZgorQEAgLTU4LDYgKzU4LDEwIEBAIEFNX0NGTEFHUyA9IEBXQVJO
X0NGTEFHU0AKICAjIFJ1bGVzIGdlbmVyYXRlZCBhbmQgY29sbGVjdGVkIGJ5IGdudWxpYi10b29s
LgogIGluY2x1ZGUgTWFrZWZpbGUuZ251bGliCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9nZXR0ZXh0L2dldHRleHQvc2VyaWFsLXRlc3RzLWNvbmZpZy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4dC9zZXJpYWwtdGVzdHMtY29uZmlnLnBhdGNoCmluZGV4
IDkzZjdjMDMzMzQuLjdkMzlkNjA4NmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dl
dHRleHQvZ2V0dGV4dC9zZXJpYWwtdGVzdHMtY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dldHRleHQvZ2V0dGV4dC9zZXJpYWwtdGVzdHMtY29uZmlnLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBlZDY0YTU3MjRlZjdkNmViNGU5YTg3NmY4MTdlYTI2NmE1MzZlMTk1IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhYThkZmUwYWFmZDBiNTNhNmM1YmFjNjFiMzU2
Y2E5MmUxNDMwYTM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogIkhvbmdqdW4uWWFu
ZyIgPGhvbmdqdW4ueWFuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAyOCBKdWwgMjAxNiAx
MjozNjoxNSArMDgwMAogU3ViamVjdDogW1BBVENIXSBmaXggZm9yIHB0ZXN0CkBAIC04LDcgKzgs
NiBAQCBBZGQgc2VyaWFsLXRlc3RzIHN1cHBvcnQsIHB0ZXN0IG5lZWQgaXQKIFVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ugc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IENoYW5n
cWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+Ci0KIC0tLQogIGNvbmZpZ3VyZS5h
YyAgICAgICAgICAgICAgICAgfCAyICstCiAgZ2V0dGV4dC1ydW50aW1lL2NvbmZpZ3VyZS5hYyB8
IDIgKy0KQEAgLTE2LDcgKzE1LDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hhbmdxaW5nIExpIDxjaGFu
Z3FpbmcubGlAd2luZHJpdmVyLmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3Vy
ZS5hYwotaW5kZXggMzhkYjZmZC4uZjAxOWFlMCAxMDA2NDQKK2luZGV4IGY0ZTU0ZWEuLmE0N2Zm
MTQgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTIy
LDcgKzIyLDcgQEAgQUNfSU5JVChbZ2V0dGV4dF0sCkBAIC0yOSw3ICsyOCw3IEBAIGluZGV4IDM4
ZGI2ZmQuLmYwMTlhZTAgMTAwNjQ0CiAgZG5sIE92ZXJyaWRlIGF1dG9tYWtlJ3MgdGFyIGNvbW1h
bmQgdXNlZCBmb3IgY3JlYXRpbmcgZGlzdHJpYnV0aW9ucy4KICBhbV9fdGFyPScke0FNVEFSfSBj
aGYgLSAtLWZvcm1hdD11c3RhciAtLW93bmVyPXJvb3QgLS1ncm91cD1yb290ICIkJHRhcmRpciIn
CiBkaWZmIC0tZ2l0IGEvZ2V0dGV4dC1ydW50aW1lL2NvbmZpZ3VyZS5hYyBiL2dldHRleHQtcnVu
dGltZS9jb25maWd1cmUuYWMKLWluZGV4IGRlMjAzZTcuLjEzOGEwN2YgMTAwNjQ0CitpbmRleCAx
MjZkMDY5Li5hYTIzMjMyIDEwMDY0NAogLS0tIGEvZ2V0dGV4dC1ydW50aW1lL2NvbmZpZ3VyZS5h
YwogKysrIGIvZ2V0dGV4dC1ydW50aW1lL2NvbmZpZ3VyZS5hYwogQEAgLTIyLDcgKzIyLDcgQEAg
QUNfSU5JVChbZ2V0dGV4dC1ydW50aW1lXSwKQEAgLTQyLDcgKzQxLDcgQEAgaW5kZXggZGUyMDNl
Ny4uMTM4YTA3ZiAxMDA2NDQKICAKICBkbmwgSW5zdGFsbGF0aW9uIGRpcmVjdG9yaWVzLgogZGlm
ZiAtLWdpdCBhL2dldHRleHQtdG9vbHMvY29uZmlndXJlLmFjIGIvZ2V0dGV4dC10b29scy9jb25m
aWd1cmUuYWMKLWluZGV4IGNmMWRkNzMuLmI1NDRkNmQgMTAwNjQ0CitpbmRleCAzNjEwZWUzLi42
ZjU2YTIzIDEwMDY0NAogLS0tIGEvZ2V0dGV4dC10b29scy9jb25maWd1cmUuYWMKICsrKyBiL2dl
dHRleHQtdG9vbHMvY29uZmlndXJlLmFjCiBAQCAtMjIsNyArMjIsNyBAQCBBQ19JTklUKFtnZXR0
ZXh0LXRvb2xzXSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4
dC91c2UtcGtnY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0
L3VzZS1wa2djb25maWcucGF0Y2gKaW5kZXggZjFmYjYxZGU0ZS4uY2ViMTg1NjExOCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0L3VzZS1wa2djb25maWcucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0L3VzZS1wa2djb25maWcu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM4YzM2MWU2ODYwYmZhZWZiZWZlY2NhZTYyMWU2
OThjMzAxODc5ZjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZhYTEzMzhiOTE2ZmU3
MmMyMDBiNmYxNjBiOTM0YmUxNWI2ZmY1OTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAyMyBKYW4g
MjAxOCAwMDo1NDoxMyArMDAwMAogU3ViamVjdDogW1BBVENIXSBnZXR0ZXh0OiBiZWF0IGxpYnJh
cnkgZGV0ZWN0aW9uIGludG8gc2hhcGUKQEAgLTEyLDEyICsxMiwxMSBAQCBTaW1wbHkgZGVsZXRl
IGFsbCB0aGUgY3JhenksIGFuZCByZXBsYWNlIHdpdGggYSBzaW5nbGUgY2FsbCB0byBwa2ctY29u
ZmlnLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3Vwc3RyZWFtIHN0aWxsIHJl
ZnVzZSB0byBjb25zaWRlciBwa2ctY29uZmlnXQogU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGludGVsLmNvbT4KLQogLS0tCi0gZ2V0dGV4dC10b29scy9nbnVsaWItbTQv
bGlieG1sLm00ICAgICAgICAgICAgIHwgMTA1ICstLS0tLS0tLS0tLS0tLS0tCi0gbGlidGV4dHN0
eWxlL2dudWxpYi1sb2NhbC9tNC9saWJnbGliLm00ICAgICAgIHwgMTA2ICsrKy0tLS0tLS0tLS0t
LS0tLQotIGxpYnRleHRzdHlsZS9nbnVsaWItbTQvbGliZ2xpYi5tNCAgICAgICAgICAgICB8IDEw
NiArKystLS0tLS0tLS0tLS0tLS0KLSAzIGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyks
IDQ3MCBkZWxldGlvbnMoLSkKKyBnZXR0ZXh0LXRvb2xzL2dudWxpYi1tNC9saWJ4bWwubTQgICAg
ICAgfCAxMDUgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyBsaWJ0ZXh0c3R5bGUvZ251bGliLWxv
Y2FsL200L2xpYmdsaWIubTQgfCAxMDYgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisgbGlidGV4
dHN0eWxlL2dudWxpYi1tNC9saWJnbGliLm00ICAgICAgIHwgMTA2ICsrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIDMgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjg2IGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvZ2V0dGV4dC10b29scy9nbnVsaWItbTQvbGlieG1sLm00IGIv
Z2V0dGV4dC10b29scy9nbnVsaWItbTQvbGlieG1sLm00CiBpbmRleCAwMzQwNDkwLi4wMzU1Mzg4
IDEwMDY0NApAQCAtMTQzLDcgKzE0Miw3IEBAIGluZGV4IDAzNDA0OTAuLjAzNTUzODggMTAwNjQ0
CiAgICBdKQogICAgQUNfU1VCU1QoW0xJQlhNTF0pCiBkaWZmIC0tZ2l0IGEvbGlidGV4dHN0eWxl
L2dudWxpYi1sb2NhbC9tNC9saWJnbGliLm00IGIvbGlidGV4dHN0eWxlL2dudWxpYi1sb2NhbC9t
NC9saWJnbGliLm00Ci1pbmRleCA3ZWU1MDI5Li5iYjFlNWU0IDEwMDY0NAoraW5kZXggZGJjOWVi
OC4uMTM2ZTUxMiAxMDA2NDQKIC0tLSBhL2xpYnRleHRzdHlsZS9nbnVsaWItbG9jYWwvbTQvbGli
Z2xpYi5tNAogKysrIGIvbGlidGV4dHN0eWxlL2dudWxpYi1sb2NhbC9tNC9saWJnbGliLm00CiBA
QCAtNiwxMDYgKzYsMjYgQEAgZG5sIHdpdGggb3Igd2l0aG91dCBtb2RpZmljYXRpb25zLCBhcyBs
b25nIGFzIHRoaXMgbm90aWNlIGlzIHByZXNlcnZlZC4KQEAgLTI2Nyw3ICsyNjYsNyBAQCBpbmRl
eCA3ZWU1MDI5Li5iYjFlNWU0IDEwMDY0NAogICAgQUNfU1VCU1QoW0xUTElCR0xJQl0pCiAgICBB
Q19TVUJTVChbSU5DR0xJQl0pCiBkaWZmIC0tZ2l0IGEvbGlidGV4dHN0eWxlL2dudWxpYi1tNC9s
aWJnbGliLm00IGIvbGlidGV4dHN0eWxlL2dudWxpYi1tNC9saWJnbGliLm00Ci1pbmRleCA3ZWU1
MDI5Li5iYjFlNWU0IDEwMDY0NAoraW5kZXggZGJjOWViOC4uMTM2ZTUxMiAxMDA2NDQKIC0tLSBh
L2xpYnRleHRzdHlsZS9nbnVsaWItbTQvbGliZ2xpYi5tNAogKysrIGIvbGlidGV4dHN0eWxlL2du
dWxpYi1tNC9saWJnbGliLm00CiBAQCAtNiwxMDYgKzYsMjYgQEAgZG5sIHdpdGggb3Igd2l0aG91
dCBtb2RpZmljYXRpb25zLCBhcyBsb25nIGFzIHRoaXMgbm90aWNlIGlzIHByZXNlcnZlZC4KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4dF8wLjIyLjQuYmIgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHRfMC4yMi41LmJiCnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHRfMC4y
Mi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHRfMC4yMi41
LmJiCi0tIAoyLjQyLjAKCg==

--===============5378551064303366215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1866 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (914 cached, 2 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-c94348afdd2652f72c3391835104be39f5626e4f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c94348afdd2652f72c3391835104be39f5626e4f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 521 Local 123 Mirrors 0 Missed 398 Current 147 (23% match, 40% complete)
Removing 116 stale sstate objects for arch x86_64...done.
Removing 52 stale sstate objects for arch qemux86_64...done.
Removing 65 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 237 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 257 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 263 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 321 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 324 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 329 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 345 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 348 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 350 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 356 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 358 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-20240101+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-0.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-native-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 363 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-locale-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 364 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 368 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 371 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnu-config-20240101+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 372 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 373 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 374 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 377 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 378 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 379 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 382 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 385 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gettext-0.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 387 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-native-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 390 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe dpkg-native-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 391 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-20240101+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-20240101+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 394 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 401 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 404 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 410 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 411 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 412 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 415 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 423 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 426 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 429 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 430 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 433 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 435 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 439 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 442 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 443 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 444 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 445 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 446 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 447 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 457 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 463 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 466 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 471 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 475 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 483 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 487 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 495 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 501 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 503 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.42.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 515 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 519 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gettext-native-0.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 522 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 523 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 526 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 535 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-69.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gettext-native-0.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 546 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-native-23.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 547 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe readline-native-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lua-native-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe patch-native-2.7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 550 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-69.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 555 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 558 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-native-23.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-native-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-native-4.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 584 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 586 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 587 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rsync-native-3.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-native-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-native-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 592 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 593 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 595 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 598 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe patch-native-2.7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 599 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lua-native-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-native-4.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 602 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 604 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-native-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 606 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-native-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-native-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-native-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 610 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 612 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-native-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-native-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 616 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-native-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 621 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-native-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 624 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 628 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ninja-native-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-native-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 639 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-native-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 642 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 664 of 668 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-native-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 665 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-native-1.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-native-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 666 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-native-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-native-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 667 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 668 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-native-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-native-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-native-2.72e-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 20 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb:do_fetch)
NOTE: recipe libgpg-error-native-1.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-native-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-native-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 37 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_fetch)
NOTE: Running task 40 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 43 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 45 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_fetch)
NOTE: recipe m4-native-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe automake-native-1.16.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 47 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 49 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_fetch)
NOTE: Running task 50 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_fetch)
NOTE: Running task 55 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_fetch)
NOTE: recipe popt-native-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 57 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_fetch)
NOTE: recipe gettext-minimal-native-0.22.4-r0: task do_fetch: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 61 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_fetch)
NOTE: recipe autoconf-native-2.72e-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 62 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_fetch)
WARNING: gettext-minimal-native-0.22.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.4.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.4.tar.gz_bad-checksum_c1e0bb2a4427a9024390c662cd532d664c4b36b8ff444ed5e54b115fdb7a1aea
NOTE: recipe xz-native-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 63 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: recipe libtool-native-2.4.7-r0: task do_fetch: Started
NOTE: recipe m4-native-1.4.19-r0: task do_fetch: Started
NOTE: recipe automake-native-1.16.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 64 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_fetch)
NOTE: recipe m4-native-1.4.19-r0: task do_fetch: Succeeded
NOTE: Running task 65 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_unpack)
NOTE: recipe libtool-native-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 66 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_unpack)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_fetch: Started
NOTE: recipe patch-native-2.7.6-r0: task do_fetch: Started
NOTE: recipe bison-native-3.8.2-r0: task do_fetch: Started
NOTE: recipe attr-native-2.5.1-r0: task do_fetch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_fetch: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_fetch: Started
NOTE: Running task 67 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe autoconf-native-2.72e-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 68 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_fetch)
NOTE: recipe patch-native-2.7.6-r0: task do_fetch: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 69 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_fetch)
NOTE: recipe m4-native-1.4.19-r0: task do_unpack: Started
NOTE: Running task 70 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_unpack)
NOTE: recipe bison-native-3.8.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-native-2.4.7-r0: task do_unpack: Started
NOTE: Running task 72 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_fetch: Succeeded
NOTE: recipe attr-native-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-native-5.4.6-r0: task do_fetch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 74 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 80 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: Running task 82 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe automake-native-1.16.5-r0: task do_fetch: Started
NOTE: recipe autoconf-native-2.72e-r0: task do_fetch: Succeeded
NOTE: recipe xz-native-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 83 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_unpack)
NOTE: Running task 84 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: recipe automake-native-1.16.5-r0: task do_fetch: Succeeded
NOTE: Running task 85 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_unpack)
NOTE: recipe gmp-native-6.3.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_fetch: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 87 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_fetch: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_fetch: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_fetch: Started
NOTE: recipe patch-native-2.7.6-r0: task do_unpack: Started
NOTE: Running task 88 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_unpack)
NOTE: recipe m4-native-1.4.19-r0: task do_unpack: Succeeded
NOTE: recipe attr-native-2.5.1-r0: task do_unpack: Started
NOTE: recipe flex-native-2.6.4-r0: task do_unpack: Started
NOTE: Running task 89 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_patch)
NOTE: recipe acl-native-2.3.1-r0: task do_fetch: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-native-2.72e-r0: task do_unpack: Started
NOTE: Running task 92 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_fetch)
NOTE: recipe automake-native-1.16.5-r0: task do_unpack: Started
NOTE: recipe acl-native-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-native-5.4.6-r0: task do_unpack: Started
NOTE: Running task 93 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_fetch)
NOTE: recipe libtool-native-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 94 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_patch)
NOTE: recipe attr-native-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 95 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe m4-native-1.4.19-r0: task do_patch: Started
NOTE: recipe popt-native-1.19-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_unpack: Started
NOTE: recipe flex-native-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_unpack: Succeeded
NOTE: recipe autoconf-native-2.72e-r0: task do_unpack: Succeeded
NOTE: Running task 96 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: recipe popt-native-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 97 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_patch)
NOTE: Running task 98 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_patch)
NOTE: Running task 100 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe xz-native-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 101 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe libtool-native-2.4.7-r0: task do_patch: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_fetch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_fetch: Succeeded
NOTE: Running task 102 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_unpack)
NOTE: Running task 103 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_unpack)
NOTE: recipe rsync-native-3.2.7-r0: task do_fetch: Started
NOTE: recipe unifdef-native-2.12-r0: task do_fetch: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_fetch: Succeeded
NOTE: recipe attr-native-2.5.1-r0: task do_patch: Started
NOTE: recipe unifdef-native-2.12-r0: task do_fetch: Succeeded
NOTE: Running task 107 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: Running task 110 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe automake-native-1.16.5-r0: task do_unpack: Succeeded
NOTE: Running task 111 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_patch)
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_unpack: Succeeded
NOTE: Running task 112 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_patch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 113 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_unpack: Started
NOTE: recipe autoconf-native-2.72e-r0: task do_patch: Started
NOTE: recipe patch-native-2.7.6-r0: task do_patch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_patch: Started
NOTE: recipe xz-native-5.4.6-r0: task do_patch: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_unpack: Started
NOTE: recipe attr-native-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe m4-native-1.4.19-r0: task do_patch: Succeeded
NOTE: Running task 115 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_unpack)
NOTE: Running task 119 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-native-5.4.6-r0: task do_patch: Succeeded
NOTE: Running noexec task 128 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_fetch)
NOTE: Running task 130 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_fetch)
NOTE: recipe libmpc-native-1.3.1-r0: task do_fetch: Started
NOTE: recipe automake-native-1.16.5-r0: task do_patch: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 131 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_patch: Started
NOTE: recipe acl-native-2.3.1-r0: task do_unpack: Started
NOTE: recipe popt-native-1.19-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_patch: Succeeded
NOTE: Running task 136 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: recipe unifdef-native-2.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_unpack: Started
NOTE: recipe acl-native-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 137 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe popt-native-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 138 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe gperf-native-3.1-r0: task do_fetch: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_unpack: Started
NOTE: recipe unifdef-native-2.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 140 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_fetch)
NOTE: recipe gmp-native-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 150 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe gperf-native-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 151 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 152 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_unpack)
NOTE: recipe rsync-native-3.2.7-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 153 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_patch)
NOTE: Running task 154 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe acl-native-2.3.1-r0: task do_patch: Started
NOTE: Running task 157 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe popt-native-1.19-r0: task do_patch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_fetch: Started
NOTE: recipe gperf-native-3.1-r0: task do_unpack: Started
NOTE: recipe popt-native-1.19-r0: task do_patch: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_patch: Started
NOTE: Running task 161 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe rsync-native-3.2.7-r0: task do_patch: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_patch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 164 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_fetch)
NOTE: recipe autoconf-native-2.72e-r0: task do_patch: Succeeded
NOTE: Running task 166 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe gperf-native-3.1-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_unpack: Succeeded
NOTE: Running task 167 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_patch)
NOTE: Running task 169 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_patch)
NOTE: Running task 171 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe ncurses-native-6.4-r0: task do_fetch: Started
NOTE: recipe automake-native-1.16.5-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 174 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_fetch)
NOTE: recipe make-native-4.4.1-r0: task do_fetch: Started
NOTE: Running task 175 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe acl-native-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running noexec task 178 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running task 180 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: Running task 181 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe perl-native-5.38.2-r0: task do_fetch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_unpack: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_patch: Started
NOTE: recipe gperf-native-3.1-r0: task do_patch: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_patch: Succeeded
NOTE: Running task 187 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_fetch)
NOTE: Running task 189 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch)
NOTE: recipe perl-native-5.38.2-r0: task do_fetch: Succeeded
NOTE: Running task 190 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_unpack)
NOTE: recipe rsync-native-3.2.7-r0: task do_patch: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_fetch: Started
NOTE: Running task 193 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/re2c/re2c_3.1.bb:do_fetch)
NOTE: recipe ncurses-native-6.4-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 194 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 195 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.2.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_fetch: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_patch: Succeeded
NOTE: Running task 198 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_fetch)
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Started
NOTE: recipe make-native-4.4.1-r0: task do_unpack: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe openssl-native-3.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 199 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: Running task 200 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_unpack)
NOTE: recipe gperf-native-3.1-r0: task do_patch: Succeeded
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Succeeded
NOTE: Running task 203 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: Running task 205 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe re2c-native-3.1-r0: task do_fetch: Started
NOTE: recipe perl-native-5.38.2-r0: task do_unpack: Started
NOTE: recipe make-native-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe re2c-native-3.1-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-native-6.4-r0: task do_unpack: Started
NOTE: Running task 207 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe expat-native-2.6.0-r0: task do_fetch: Started
NOTE: Running task 209 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: recipe bzip2-native-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_patch: Started
NOTE: Running task 210 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe expat-native-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe ninja-native-1.11.1-r0: task do_fetch: Started
NOTE: recipe libtool-native-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 211 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 213 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_unpack)
NOTE: recipe libtirpc-native-1.3.4-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.2.1-r0: task do_unpack: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_fetch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_fetch: Started
NOTE: Running task 223 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_unpack)
NOTE: recipe libffi-native-3.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libedit-native-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe make-native-4.4.1-r0: task do_patch: Started
NOTE: Running noexec task 225 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 226 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 228 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe bzip2-native-1.0.8-r0: task do_unpack: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_fetch: Started
NOTE: Running task 229 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe cmake-native-3.28.3-r0: task do_unpack: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 230 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: recipe expat-native-2.6.0-r0: task do_unpack: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_patch: Succeeded
NOTE: Running task 231 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_unpack)
NOTE: Running task 234 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libedit-native-20230828-3.1-r0: task do_unpack: Started
NOTE: Running task 235 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-native-1.3.4-r0: task do_patch: Started
NOTE: Running task 236 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_patch)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe ninja-native-1.11.1-r0: task do_unpack: Started
NOTE: Running task 237 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 238 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_patch)
NOTE: recipe libffi-native-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 239 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 240 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 243 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 247 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_patch: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
WARNING: gettext-minimal-native-0.22.4-r0 do_fetch: Checksum failure encountered with download of https://ftp.gnu.org/gnu/gettext/gettext-0.22.4.tar.gz - will attempt other sources if available
NOTE: recipe expat-native-2.6.0-r0: task do_patch: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_patch: Started
NOTE: recipe expat-native-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 248 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_generate_toolchain_file)
NOTE: recipe ncurses-native-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 249 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_patch: Succeeded
NOTE: Running task 253 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: recipe gettext-native-0.22.5-r0: task do_fetch: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 254 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_fetch: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_patch: Succeeded
NOTE: recipe openssl-native-3.2.1-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_fetch: Succeeded
NOTE: Running task 259 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_fetch)
NOTE: Running task 260 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_patch)
NOTE: Running task 266 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 268 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe gettext-native-0.22.5-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.6.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 269 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_unpack)
NOTE: recipe perl-native-5.38.2-r0: task do_unpack: Succeeded
NOTE: Running task 270 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_patch)
NOTE: recipe ncurses-native-6.4-r0: task do_patch: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Started
NOTE: recipe expat-native-2.6.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 272 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: recipe libunistring-native-1.2-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-native-3.2.1-r0: task do_patch: Started
NOTE: Running task 273 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_unpack)
NOTE: recipe bzip2-native-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libunistring-native-1.2-r0: task do_fetch: Succeeded
NOTE: Running task 277 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: Running task 278 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_fetch)
NOTE: recipe curl-native-8.6.0-r0: task do_fetch: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 279 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_patch)
NOTE: recipe gettext-native-0.22.5-r0: task do_unpack: Started
NOTE: Running task 280 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe perl-native-5.38.2-r0: task do_patch: Started
NOTE: Running task 282 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_fetch)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 283 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-native-2.69-r0: task do_fetch: Started
NOTE: Running task 285 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_fetch)
NOTE: recipe libgpg-error-native-1.48-r0: task do_fetch: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_patch: Started
NOTE: recipe libcap-native-2.69-r0: task do_fetch: Succeeded
NOTE: Running task 286 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe libgpg-error-native-1.48-r0: task do_fetch: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_fetch: Started
NOTE: Running task 287 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_patch)
NOTE: Running task 289 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe openssl-native-3.2.1-r0: task do_patch: Succeeded
NOTE: Running task 291 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: recipe ninja-native-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_patch: Started
NOTE: Running task 300 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 302 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_fetch: Started
NOTE: Running task 305 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: recipe expat-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: Running task 307 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: recipe ncurses-native-6.4-r0: task do_patch: Succeeded
NOTE: Running task 312 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: recipe libunistring-native-1.2-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Succeeded
NOTE: Running task 315 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: recipe libpcre2-native-10.42-r0: task do_fetch: Succeeded
NOTE: Running task 319 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe cracklib-native-2.9.11-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: Running task 320 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 322 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: Running task 324 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_fetch)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 325 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_unpack)
NOTE: recipe libunistring-native-1.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 326 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_unpack)
NOTE: Running task 327 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: Running task 328 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
NOTE: Running task 333 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe cracklib-native-2.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 345 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
WARNING: gettext-minimal-native-0.22.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.4.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.4.tar.gz_bad-checksum_c1e0bb2a4427a9024390c662cd532d664c4b36b8ff444ed5e54b115fdb7a1aea
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_unpack: Succeeded
NOTE: recipe perl-native-5.38.2-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_fetch: Started
NOTE: Running task 346 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_patch)
NOTE: Running task 348 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 350 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_fetch)
NOTE: recipe expat-2.6.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 351 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe libunistring-native-1.2-r0: task do_patch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_unpack: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_patch: Started
NOTE: Running task 352 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe libgpg-error-native-1.48-r0: task do_unpack: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 353 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe nettle-native-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 354 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_unpack)
NOTE: recipe libunistring-native-1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Started
NOTE: Running task 355 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 356 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: recipe libpcre2-native-10.42-r0: task do_unpack: Started
NOTE: recipe expat-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 357 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_unpack)
NOTE: recipe cracklib-native-2.9.11-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_patch: Succeeded
NOTE: Running task 362 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 363 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_patch)
NOTE: recipe openssl-3.2.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-native-1.48-r0: task do_unpack: Succeeded
NOTE: Running task 364 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 381 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe nettle-native-3.9.1-r0: task do_unpack: Started
NOTE: Running task 383 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_patch: Started
NOTE: recipe libgpg-error-native-1.48-r0: task do_patch: Started
NOTE: recipe file-native-5.45-r0: task do_fetch: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 384 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe libpcre2-native-10.42-r0: task do_unpack: Succeeded
NOTE: Running task 385 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: recipe readline-native-8.2-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_patch: Succeeded
NOTE: Running task 387 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: recipe readline-native-8.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: Running task 392 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 394 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 396 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_fetch)
NOTE: recipe gettext-native-0.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 397 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_patch)
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 398 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_patch)
NOTE: recipe nettle-native-3.9.1-r0: task do_patch: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_patch: Started
NOTE: Running task 399 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: recipe libgpg-error-native-1.48-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_patch: Succeeded
NOTE: Running task 402 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_fetch)
NOTE: recipe lua-native-5.4.6-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe file-native-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 407 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: Running task 408 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe python3-build-native-1.0.3-r0: task do_fetch: Started
NOTE: recipe lua-native-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 409 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 410 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_patch)
NOTE: recipe python3-build-native-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 420 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: Running task 422 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: recipe gettext-native-0.22.5-r0: task do_patch: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_patch: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_patch: Succeeded
NOTE: Running task 424 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_unpack)
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_fetch: Started
NOTE: recipe readline-native-8.2-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Started
NOTE: recipe file-native-5.45-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_fetch: Succeeded
NOTE: Running task 426 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.42.0.bb:do_fetch)
NOTE: Running task 427 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe lua-native-5.4.6-r0: task do_unpack: Started
NOTE: Running task 428 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 429 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 441 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_fetch)
NOTE: Running task 443 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe cracklib-native-2.9.11-r0: task do_patch: Succeeded
NOTE: Running task 446 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: recipe lua-native-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 447 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: recipe python3-build-native-1.0.3-r0: task do_unpack: Started
NOTE: recipe readline-native-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 448 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe python3-build-native-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 449 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_patch)
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_fetch: Succeeded
NOTE: Running task 453 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_fetch)
NOTE: recipe bash-completion-2.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 454 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Started
NOTE: Running task 455 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-native-23.2-r0: task do_unpack: Started
NOTE: Running task 457 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 459 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_fetch)
NOTE: recipe lua-native-5.4.6-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_unpack: Succeeded
NOTE: Running task 460 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_patch)
NOTE: recipe readline-native-8.2-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_patch: Started
NOTE: recipe lua-native-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe gettext-native-0.22.5-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_fetch: Started
NOTE: Running task 462 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.42.0.bb:do_unpack)
NOTE: Running task 463 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 466 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_fetch)
NOTE: Running task 467 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_fetch: Succeeded
NOTE: Running task 469 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_unpack)
NOTE: Running task 470 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 471 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Started
NOTE: recipe readline-native-8.2-r0: task do_patch: Succeeded
NOTE: Running task 474 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 476 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_fetch)
NOTE: recipe python3-packaging-native-23.2-r0: task do_patch: Started
NOTE: recipe python3-3.12.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_patch: Succeeded
NOTE: recipe gettext-native-0.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-69.0.3-r0: task do_fetch: Started
NOTE: Running task 481 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_fetch)
NOTE: recipe python3-3.12.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 483 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.42.0.bb:do_patch)
NOTE: Running task 484 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: Running task 486 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 487 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe python3-setuptools-native-69.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 488 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: Running task 491 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: recipe file-native-5.45-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 492 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: Running task 493 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 494 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_unpack: Succeeded
NOTE: recipe meson-native-1.3.1-r0: task do_fetch: Started
NOTE: Running task 497 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_write_config)
NOTE: recipe meson-native-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 498 of 1862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe qemu-native-8.2.1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: Running task 499 of 1862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_patch: Started
NOTE: recipe gettext-native-0.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_deploy_source_date_epoch unihash changed to ab1b3cbec4f5a9853536352434ca3fa429cc297adc01e4c121071fc2d80980b7
NOTE: recipe qemu-native-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.3-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-69.0.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe file-native-5.45-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.3.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.78.3-r0: task do_write_config: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-native-69.0.3-r0: task do_unpack: Succeeded
NOTE: recipe file-native-5.45-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.3-r0: task do_write_config: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe meson-native-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_unpack: Succeeded
NOTE: recipe gettext-minimal-native-0.22.4-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 499 tasks of which 286 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301104037.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301104037.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gettext-minimal-native-0.22.4-r0 do_fetch: Checksum failure fetching https://ftp.gnu.org/gnu/gettext/gettext-0.22.4.tar.gz
ERROR: gettext-minimal-native-0.22.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.4.tar.gz\' has sha256 checksum \'c1e0bb2a4427a9024390c662cd532d664c4b36b8ff444ed5e54b115fdb7a1aea\' when \'ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a94cb6c8fa48996a0\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "c1e0bb2a4427a9024390c662cd532d664c4b36b8ff444ed5e54b115fdb7a1aea"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://ftp.gnu.org/gnu/gettext/gettext-0.22.4.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gettext-minimal-native/0.22.4/temp/log.do_fetch.694843
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb:do_fetch) failed with exit code '1'

--===============5378551064303366215==--

