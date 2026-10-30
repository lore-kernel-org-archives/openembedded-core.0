Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6185.1793344579905442546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=usAYMvCj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4e28ZWDo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a18baaa590-64f0b130-6ac2-4f3b-98db-39b673dd987a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793344579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xOrY/INMHZ3xjQ3IgghqgwRujdwr11teuSHaJDiST6o=;
	b=usAYMvCj5RYVJ2BURYLcc/ON1G2xwwTF90TqCLYROYLGsQMh3M7RIZDzpZG2tf0+
	v/xohB0xwApWh9tF8zb3vUs+RJ/jeiJHWXWxOG4blDA14iroR7puq6mRF2v5okGGYLo
	Na4zNhr6u6buUKw5cLcSzKLIhnZaMpmnLhpraI1U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793344579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xOrY/INMHZ3xjQ3IgghqgwRujdwr11teuSHaJDiST6o=;
	b=4e28ZWDo7Yw/ej9XlYhIQGxbz37lKXWEhLNwsBWpJ6MbivQ6aTB4NUHiUaIjipog
	pRG/5FlVvhVQyUOvi1lI+O1irYjcFk0j1m+UxrIri8ZI0pmarcP4gY3SBYKGcRH3vhm
	q4K368vAFK5UBKwb8tIY5FXAQDBmn53wde3h0UGk=
Content-Type: multipart/mixed; boundary="===============4829283288453767669=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debugedit: upgrading to 5.4 SUCCEEDED
Message-ID: <010101a18baaa590-64f0b130-6ac2-4f3b-98db-39b673dd987a-000000@us-west-2.amazonses.com>
Date: Fri, 30 Oct 2026 07:16:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.30-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248994

--===============4829283288453767669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debugedit* to *5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debugedit-upgrade-5.3-5.4.patch
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
From b4fd23f71ac879c6c65115e4a201208bf54e8147 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 30 Oct 2026 05:21:56 +0000
Subject: [PATCH] debugedit: upgrade 5.3 -> 5.4

---
 .../debugedit/{debugedit_5.3.bb => debugedit_5.4.bb}          | 2 +-
 ...configure.ac-do-not-check-for-executables-needed-onl.patch | 4 ++--
 .../files/0003-Makefile.am-do-not-update-manual.patch         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/debugedit/{debugedit_5.3.bb => debugedit_5.4.bb} (93%)

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.3.bb b/meta/recipes-devtools/debugedit/debugedit_5.4.bb
similarity index 93%
rename from meta/recipes-devtools/debugedit/debugedit_5.3.bb
rename to meta/recipes-devtools/debugedit/debugedit_5.4.bb
index 6b5f2aa99e..d80462500a 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.3.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
            file://0001-configure.ac-do-not-check-for-executables-needed-onl.patch \
            "
 
-SRC_URI[sha256sum] = "3b8c6396fe235e0270c9b9c0d244cfd0e86c284fc27e820acc58360e7cfa08c2"
+SRC_URI[sha256sum] = "00e1d74d31df9012913975b76ab0d864f0e2569d29e31271317161187803813a"
 
 DEPENDS = "elfutils xxhash"
 DEPENDS:append:libc-musl = " musl-legacy-error"
diff --git a/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-for-executables-needed-onl.patch b/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-for-executables-needed-onl.patch
index a241972efa..ce22819c96 100644
--- a/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-for-executables-needed-onl.patch
+++ b/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-for-executables-needed-onl.patch
@@ -1,4 +1,4 @@
-From bb64eddf41794ca5fd85dc3fecd29246d4d9ad23 Mon Sep 17 00:00:00 2001
+From 8e96d0537ef99fb0fd6e12c647cdc279737ac808 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 17 Jun 2026 18:59:57 +0200
 Subject: [PATCH] configure.ac: do not check for executables needed only in
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 26 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4868844..8d74463 100644
+index f9ca877..0782036 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -51,31 +51,6 @@ AC_CHECK_TOOL([NM], [nm])
diff --git a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
index 50be95696d..607e884957 100644
--- a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
+++ b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
@@ -1,4 +1,4 @@
-From f9e6f9cadedc94323e8878e60aaa684be7c52d97 Mon Sep 17 00:00:00 2001
+From 84cabce9acfecfd5d07aaed3a007abe8782feca6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 23 Mar 2023 13:09:23 +0800
 Subject: [PATCH] Makefile.am: do not update manual
-- 
2.47.1


--===============4829283288453767669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/debugedit/debugedit-dbg: PKGSIZE changed from 396232 to 398928 (+1%)
packages/x86-64-v3-poky-linux/debugedit/debugedit-dbg: PKGV changed from 5.3 [default] to 5.4 [default]
packages/x86-64-v3-poky-linux/debugedit/debugedit-dbg: PV changed from "5.3" to "5.4"
packages/x86-64-v3-poky-linux/debugedit/debugedit-dev: PKGV changed from 5.3 [default] to 5.4 [default]
packages/x86-64-v3-poky-linux/debugedit/debugedit-dev: PV changed from "5.3" to "5.4"
packages/x86-64-v3-poky-linux/debugedit/debugedit-doc: PKGSIZE changed from 7407 to 7415 (+0%)
packages/x86-64-v3-poky-linux/debugedit/debugedit-doc: PKGV changed from 5.3 [default] to 5.4 [default]
packages/x86-64-v3-poky-linux/debugedit/debugedit-doc: PV changed from "5.3" to "5.4"
packages/x86-64-v3-poky-linux/debugedit/debugedit-locale: PKGV changed from 5.3 [default] to 5.4 [default]
packages/x86-64-v3-poky-linux/debugedit/debugedit-locale: PV changed from "5.3" to "5.4"
packages/x86-64-v3-poky-linux/debugedit/debugedit-src: PKGSIZE changed from 173296 to 177809 (+3%)
packages/x86-64-v3-poky-linux/debugedit/debugedit-src: FILELIST: directory renamed /usr/src/debug/debugedit/5.3/tools -> /usr/src/debug/debugedit/5.4/tools
packages/x86-64-v3-poky-linux/debugedit/debugedit-src: PKGV changed from 5.3 [default] to 5.4 [default]
packages/x86-64-v3-poky-linux/debugedit/debugedit-src: PV changed from "5.3" to "5.4"
packages/x86-64-v3-poky-linux/debugedit/debugedit-staticdev: PKGV changed from 5.3 [default] to 5.4 [default]
packages/x86-64-v3-poky-linux/debugedit/debugedit-staticdev: PV changed from "5.3" to "5.4"
packages/x86-64-v3-poky-linux/debugedit/debugedit: PKGSIZE changed from 139500 to 143596 (+3%)
packages/x86-64-v3-poky-linux/debugedit/debugedit: PKGV changed from 5.3 [default] to 5.4 [default]
packages/x86-64-v3-poky-linux/debugedit/debugedit: PV changed from "5.3" to "5.4"
packages/x86-64-v3-poky-linux/debugedit: SRC_URI changed from "https://sourceware.org/ftp/debugedit/5.3/debugedit-5.3.tar.xz file://0003-Makefile.am-do-not-update-manual.patch file://0001-configure.ac-do-not-check-for-executables-needed-onl.patch" to "https://sourceware.org/ftp/debugedit/5.4/debugedit-5.4.tar.xz file://0003-Makefile.am-do-not-update-manual.patch file://0001-configure.ac-do-not-check-for-executables-needed-onl.patch"
packages/x86-64-v3-poky-linux/debugedit: PKGV changed from 5.3 [default] to 5.4 [default]
packages/x86-64-v3-poky-linux/debugedit: PV changed from "5.3" to "5.4"

--===============4829283288453767669==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debugedit-upgrade-5.3-5.4.patch"

RnJvbSBiNGZkMjNmNzFhYzg3OWM2YzY1MTE1ZTRhMjAxMjA4YmY1NGU4MTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMDU6MjE6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJ1Z2VkaXQ6IHVwZ3JhZGUgNS4zIC0+IDUuNAoKLS0tCiAuLi4vZGVidWdlZGl0L3tkZWJ1Z2Vk
aXRfNS4zLmJiID0+IGRlYnVnZWRpdF81LjQuYmJ9ICAgICAgICAgIHwgMiArLQogLi4uY29uZmln
dXJlLmFjLWRvLW5vdC1jaGVjay1mb3ItZXhlY3V0YWJsZXMtbmVlZGVkLW9ubC5wYXRjaCB8IDQg
KystLQogLi4uL2ZpbGVzLzAwMDMtTWFrZWZpbGUuYW0tZG8tbm90LXVwZGF0ZS1tYW51YWwucGF0
Y2ggICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kZWJ1Z2VkaXQve2RlYnVn
ZWRpdF81LjMuYmIgPT4gZGVidWdlZGl0XzUuNC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2RlYnVnZWRpdF81LjMuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZGVidWdlZGl0L2RlYnVnZWRpdF81LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5
MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9kZWJ1Z2VkaXRf
NS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2RlYnVnZWRp
dF81LjQuYmIKaW5kZXggNmI1ZjJhYTk5ZS4uZDgwNDYyNTAwYSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9kZWJ1Z2VkaXRfNS4zLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kZWJ1Z2VkaXQvZGVidWdlZGl0XzUuNC5iYgpAQCAtMTQsNyArMTQsNyBA
QCBTUkNfVVJJID0gImh0dHBzOi8vc291cmNld2FyZS5vcmcvZnRwL2RlYnVnZWRpdC8ke1BWfS9k
ZWJ1Z2VkaXQtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY29uZmlndXJl
LmFjLWRvLW5vdC1jaGVjay1mb3ItZXhlY3V0YWJsZXMtbmVlZGVkLW9ubC5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNiOGM2Mzk2ZmUyMzVlMDI3MGM5Yjlj
MGQyNDRjZmQwZTg2YzI4NGZjMjdlODIwYWNjNTgzNjBlN2NmYTA4YzIiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMDBlMWQ3NGQzMWRmOTAxMjkxMzk3NWI3NmFiMGQ4NjRmMGUyNTY5ZDI5ZTMxMjcx
MzE3MTYxMTg3ODAzODEzYSIKIAogREVQRU5EUyA9ICJlbGZ1dGlscyB4eGhhc2giCiBERVBFTkRT
OmFwcGVuZDpsaWJjLW11c2wgPSAiIG11c2wtbGVnYWN5LWVycm9yIgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9maWxlcy8wMDAxLWNvbmZpZ3VyZS5hYy1kby1u
b3QtY2hlY2stZm9yLWV4ZWN1dGFibGVzLW5lZWRlZC1vbmwucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVzLzAwMDEtY29uZmlndXJlLmFjLWRvLW5vdC1jaGVjay1m
b3ItZXhlY3V0YWJsZXMtbmVlZGVkLW9ubC5wYXRjaAppbmRleCBhMjQxOTcyZWZhLi5jZTIyODE5
Yzk2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVzLzAw
MDEtY29uZmlndXJlLmFjLWRvLW5vdC1jaGVjay1mb3ItZXhlY3V0YWJsZXMtbmVlZGVkLW9ubC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVzLzAwMDEtY29u
ZmlndXJlLmFjLWRvLW5vdC1jaGVjay1mb3ItZXhlY3V0YWJsZXMtbmVlZGVkLW9ubC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYmI2NGVkZGY0MTc5NGNhNWZkODVkYzNmZWNkMjkyNDZkNGQ5
YWQyMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGU5NmQwNTM3ZWY5OWZiMGZkNmUx
MmM2NDdjZGMyNzk3MzdhYzgwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBXZWQsIDE3IEp1biAyMDI2
IDE4OjU5OjU3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogZG8gbm90IGNo
ZWNrIGZvciBleGVjdXRhYmxlcyBuZWVkZWQgb25seSBpbgpAQCAtMTcsNyArMTcsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQg
YS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDQ4Njg4NDQuLjhkNzQ0NjMgMTAw
NjQ0CitpbmRleCBmOWNhODc3Li4wNzgyMDM2IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiAr
KysgYi9jb25maWd1cmUuYWMKIEBAIC01MSwzMSArNTEsNiBAQCBBQ19DSEVDS19UT09MKFtOTV0s
IFtubV0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVz
LzAwMDMtTWFrZWZpbGUuYW0tZG8tbm90LXVwZGF0ZS1tYW51YWwucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVzLzAwMDMtTWFrZWZpbGUuYW0tZG8tbm90LXVwZGF0
ZS1tYW51YWwucGF0Y2gKaW5kZXggNTBiZTk1Njk2ZC4uNjA3ZTg4NDk1NyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9maWxlcy8wMDAzLU1ha2VmaWxlLmFtLWRv
LW5vdC11cGRhdGUtbWFudWFsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZWJ1
Z2VkaXQvZmlsZXMvMDAwMy1NYWtlZmlsZS5hbS1kby1ub3QtdXBkYXRlLW1hbnVhbC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZjllNmY5Y2FkZWRjOTQzMjNlODg3OGU2MGFhYTY4NGJlN2M1
MmQ5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODRjYWJjZTlhY2ZlY2ZkNWQwN2Fh
ZWQzYTAwN2FiZTg3ODJmZWNhNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4g
UWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMjMgTWFyIDIwMjMgMTM6MDk6
MjMgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZWZpbGUuYW06IGRvIG5vdCB1cGRhdGUgbWFu
dWFsCi0tIAoyLjQ3LjEKCg==

--===============4829283288453767669==--
