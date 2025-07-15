Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7F0C87FC6
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12164.1752594932763452332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3QCVcY3B;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CU7M/O1O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101980ecc6105-faf7f597-7244-4f38-b498-ae87eaf7043d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594932;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dGJHapP5dP80j/vlqClaWQj60+Rr8rDIvkyVMi9dyIk=;
	b=3QCVcY3BdlFJcFvJhCaLiT+yIMFqzhEIOZOMlkUZeplDOCEUumzEYjlUuDlds4a0
	axgpfoXN7bk8qGZX7UE9WzugVdfInpLlXEc2pI/5yeSBHeNLvhup1GVO6T1gUjV48cT
	b7SULebLGfdyxs/aDAjngkRYeZtuf1z4Rz6FM20M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594932;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dGJHapP5dP80j/vlqClaWQj60+Rr8rDIvkyVMi9dyIk=;
	b=CU7M/O1OQRSyFajU7AWQdScaT/4wjNq9ZFDJkwyULTM3ZRdENmSU1xY+jG/CokWO
	EAEUMLED/5M/0idBq05M+pRzO/qSx2JUU9WUn58zWldi7fbVBLuQ4LpQgyBPyrQ0k4o
	Oja3/4uoNpStjEpFfrYu/63D3DMRohwRMALLg0BI=
Content-Type: multipart/mixed; boundary="===============3635212044808100634=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid,util-linux: upgrading to 2.41.1,2.41.1
 SUCCEEDED
Message-ID: <010101980ecc6105-faf7f597-7244-4f38-b498-ae87eaf7043d-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220314

--===============3635212044808100634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux-libuuid,util-linux* to *2.41.1,2.41.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-util-linux-upgrade-2.41-2.41.1-2..patch
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
From 18c4f8bd14647216e8f6f8e92702f4345e87cda7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 06:55:08 +0000
Subject: [PATCH] util-linux-libuuid,util-linux: upgrade 2.41 -> 2.41.1,2.41 ->
 2.41.1

---
 ...-linux-libuuid_2.41.bb => util-linux-libuuid_2.41.1.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                | 2 +-
 ...d-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch | 7 ++-----
 ...ts-ts-kill-decode-avoid-using-shell-built-in-kill.patch | 7 ++-----
 ...kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch | 7 ++-----
 .../util-linux/util-linux/avoid_parallel_tests.patch       | 4 ++--
 .../util-linux/util-linux/configure-sbindir.patch          | 4 ++--
 .../util-linux/display_testname_for_subtest.patch          | 2 +-
 meta/recipes-core/util-linux/util-linux/ptest.patch        | 2 +-
 .../{util-linux_2.41.bb => util-linux_2.41.1.bb}           | 0
 10 files changed, 13 insertions(+), 22 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.bb => util-linux-libuuid_2.41.1.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.41.bb => util-linux_2.41.1.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 111f29cb92..37db2f392a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -22,6 +22,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            "
 
-SRC_URI[sha256sum] = "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6"
+SRC_URI[sha256sum] = "be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
index e3f9112192..e5177696b1 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
@@ -1,4 +1,4 @@
-From b3a1d92a9078fada31b2cf64b802edd616026766 Mon Sep 17 00:00:00 2001
+From d53cc240b412ae655a16965dc57f34ee281b69df Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 26 May 2025 15:24:16 +0800
 Subject: [PATCH] lsfd/mkfds-foreign-sockets: skip when lacking sock_diag
@@ -19,7 +19,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/tests/ts/lsfd/mkfds-foreign-sockets b/tests/ts/lsfd/mkfds-foreign-sockets
-index cd94da799..76138a7a6 100755
+index cd94da7..76138a7 100755
 --- a/tests/ts/lsfd/mkfds-foreign-sockets
 +++ b/tests/ts/lsfd/mkfds-foreign-sockets
 @@ -30,6 +30,8 @@ ts_skip_nonroot
@@ -31,6 +31,3 @@ index cd94da799..76138a7a6 100755
  declare -A tcase
  tcase[NAME]="state=connected"
  tcase[SOCK.NETNS]=
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
index dece0e94b7..e72909bca6 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
@@ -1,4 +1,4 @@
-From d2eeccf36542d506b660641a07a44f3976772897 Mon Sep 17 00:00:00 2001
+From f413b692621fad99fbda749918a9f47a486e5a98 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 15 May 2025 16:44:33 +0800
 Subject: [PATCH] tests/ts/kill/decode: avoid using shell built-in kill command
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 03bc25ff6..57149899e 100755
+index 03bc25f..5714989 100755
 --- a/tests/ts/kill/decode
 +++ b/tests/ts/kill/decode
 @@ -18,6 +18,11 @@ TS_DESC="decode functions"
@@ -31,6 +31,3 @@ index 03bc25ff6..57149899e 100755
  ts_skip_qemu_user
  
  ts_check_test_command "$TS_CMD_KILL"
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
index f4e2f9e745..160fb5e3df 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
@@ -1,4 +1,4 @@
-From c5d5e8873029d170fcab38a6fbd5d5a355574b9f Mon Sep 17 00:00:00 2001
+From de654b48cc298a9971a7a501b7633ead7f846758 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jun 2025 16:27:19 +0800
 Subject: [PATCH] ts/kill/decode: use RTMIN from 'kill -L' instead of
@@ -28,7 +28,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 57149899e..524b4e5e2 100755
+index 5714989..524b4e5 100755
 --- a/tests/ts/kill/decode
 +++ b/tests/ts/kill/decode
 @@ -53,14 +53,19 @@ ACK=
@@ -53,6 +53,3 @@ index 57149899e..524b4e5e2 100755
  		else
  		    cat
  		fi
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index fe92afbc53..9afc321e33 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 43030388e831642d36cb7b9d4b63755e9696714a Mon Sep 17 00:00:00 2001
+From 7d75b0596eb7931c17aa96088f2d658aa210aca7 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 43a23a5..4a84531 100644
+index 2c44034..427e1bd 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index ebb32a6845..119a529984 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 378998bf82e3b6ff46569077b29f95e72b734681 Mon Sep 17 00:00:00 2001
+From 14a051596c005f27688ea83b598bd84218f01466 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index a5d9102..43a23a5 100644
+index d1c1840..2c44034 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index fa4ae02bc3..16c1e447b6 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 728c2abd889d225535008c3e7a1eef4b8a0aeea2 Mon Sep 17 00:00:00 2001
+From 18f2459615b3e2d6c7354b738429bf02837b7235 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index ad23001cfa..d6230455e0 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From 18bf6aded9b2a75185ae4b23a41cd2e4322c5e31 Mon Sep 17 00:00:00 2001
+From 29c9da25e497413415880ed4b0b6c10be31169bc Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.bb b/meta/recipes-core/util-linux/util-linux_2.41.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.1.bb
-- 
2.47.1


--===============3635212044808100634==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-util-linux-upgrade-2.41-2.41.1-2..patch"

RnJvbSAxOGM0ZjhiZDE0NjQ3MjE2ZThmNmY4ZTkyNzAyZjQzNDVlODdjZGE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDY6NTU6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LWxpYnV1aWQsdXRpbC1saW51eDogdXBncmFkZSAyLjQxIC0+IDIuNDEuMSwyLjQx
IC0+CiAyLjQxLjEKCi0tLQogLi4uLWxpbnV4LWxpYnV1aWRfMi40MS5iYiA9PiB1dGlsLWxpbnV4
LWxpYnV1aWRfMi40MS4xLmJifSB8IDAKIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC5pbmMgICAgICAgICAgICAgICAgfCAyICstCiAuLi5kLW1rZmRzLWZvcmVpZ24tc29j
a2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2NrX2RpLnBhdGNoIHwgNyArKy0tLS0tCiAuLi50cy10
cy1raWxsLWRlY29kZS1hdm9pZC11c2luZy1zaGVsbC1idWlsdC1pbi1raWxsLnBhdGNoIHwgNyAr
Ky0tLS0tCiAuLi5raWxsLWRlY29kZS11c2UtUlRNSU4tZnJvbS1raWxsLUwtaW5zdGVhZC1vZi1o
YXJkLnBhdGNoIHwgNyArKy0tLS0tCiAuLi4vdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3Bh
cmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgIHwgNCArKy0tCiAuLi4vdXRpbC1saW51eC91dGlsLWxp
bnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoICAgICAgICAgIHwgNCArKy0tCiAuLi4vdXRpbC1s
aW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoICAgICAgICAgIHwgMiArLQog
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoICAgICAg
ICB8IDIgKy0KIC4uLi97dXRpbC1saW51eF8yLjQxLmJiID0+IHV0aWwtbGludXhfMi40MS4xLmJi
fSAgICAgICAgICAgfCAwCiAxMCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyMiBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGlsLWxp
bnV4LWxpYnV1aWRfMi40MS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi40MS4xLmJifSAoMTAw
JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGlsLWxpbnV4XzIuNDEu
YmIgPT4gdXRpbC1saW51eF8yLjQxLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDEuYmIgYi9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjQxLjEuYmIKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC1saWJ1dWlkXzIuNDEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDEuMS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyBiL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKaW5kZXggMTExZjI5Y2I5Mi4uMzdkYjJmMzkyYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYwor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCkBAIC0yMiw2
ICsyMiw2IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy91dGls
LWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwtbGluCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LXRzLWtpbGwtZGVjb2RlLXVzZS1SVE1JTi1mcm9tLWtpbGwtTC1pbnN0ZWFkLW9mLWhhcmQucGF0
Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MWVlOTNiM2NmZGZl
YjdkN2M0MDkwY2VkZWJhMWQ3YmJjZTkxNDFmZDBiNTAxYjY4NmIzZmU0NzVkZGNhNGM2IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImJlOWFkOWEyNzZmNDMwNWFiN2RkMmY1MjI1YzhiZTFmZjU0MzUy
ZjU2NWZmNGRlZGU5NjI4YzFhYWE3ZGVjNTciCiAKIENWRV9QUk9EVUNUID0gInV0aWwtbGludXgi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAw
MS1sc2ZkLW1rZmRzLWZvcmVpZ24tc29ja2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2NrX2RpLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtbHNmZC1t
a2Zkcy1mb3JlaWduLXNvY2tldHMtc2tpcC13aGVuLWxhY2tpbmctc29ja19kaS5wYXRjaAppbmRl
eCBlM2Y5MTEyMTkyLi5lNTE3NzY5NmIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1sc2ZkLW1rZmRzLWZvcmVpZ24tc29ja2V0cy1za2lw
LXdoZW4tbGFja2luZy1zb2NrX2RpLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC8wMDAxLWxzZmQtbWtmZHMtZm9yZWlnbi1zb2NrZXRzLXNraXAtd2hl
bi1sYWNraW5nLXNvY2tfZGkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGIzYTFkOTJhOTA3
OGZhZGEzMWIyY2Y2NGI4MDJlZGQ2MTYwMjY3NjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGQ1M2NjMjQwYjQxMmFlNjU1YTE2OTY1ZGM1N2YzNGVlMjgxYjY5ZGYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBNb24sIDI2IE1heSAyMDI1IDE1OjI0OjE2ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxzZmQv
bWtmZHMtZm9yZWlnbi1zb2NrZXRzOiBza2lwIHdoZW4gbGFja2luZyBzb2NrX2RpYWcKQEAgLTE5
LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3Rlc3Rz
L3RzL2xzZmQvbWtmZHMtZm9yZWlnbi1zb2NrZXRzIGIvdGVzdHMvdHMvbHNmZC9ta2Zkcy1mb3Jl
aWduLXNvY2tldHMKLWluZGV4IGNkOTRkYTc5OS4uNzYxMzhhN2E2IDEwMDc1NQoraW5kZXggY2Q5
NGRhNy4uNzYxMzhhNyAxMDA3NTUKIC0tLSBhL3Rlc3RzL3RzL2xzZmQvbWtmZHMtZm9yZWlnbi1z
b2NrZXRzCiArKysgYi90ZXN0cy90cy9sc2ZkL21rZmRzLWZvcmVpZ24tc29ja2V0cwogQEAgLTMw
LDYgKzMwLDggQEAgdHNfc2tpcF9ub25yb290CkBAIC0zMSw2ICszMSwzIEBAIGluZGV4IGNkOTRk
YTc5OS4uNzYxMzhhN2E2IDEwMDc1NQogIGRlY2xhcmUgLUEgdGNhc2UKICB0Y2FzZVtOQU1FXT0i
c3RhdGU9Y29ubmVjdGVkIgogIHRjYXNlW1NPQ0suTkVUTlNdPQotLS0gCi0yLjM0LjEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdGVz
dHMtdHMta2lsbC1kZWNvZGUtYXZvaWQtdXNpbmctc2hlbGwtYnVpbHQtaW4ta2lsbC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLXRlc3RzLXRzLWtp
bGwtZGVjb2RlLWF2b2lkLXVzaW5nLXNoZWxsLWJ1aWx0LWluLWtpbGwucGF0Y2gKaW5kZXggZGVj
ZTBlOTRiNy4uZTcyOTA5YmNhNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4LzAwMDEtdGVzdHMtdHMta2lsbC1kZWNvZGUtYXZvaWQtdXNpbmctc2hl
bGwtYnVpbHQtaW4ta2lsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4
L3V0aWwtbGludXgvMDAwMS10ZXN0cy10cy1raWxsLWRlY29kZS1hdm9pZC11c2luZy1zaGVsbC1i
dWlsdC1pbi1raWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMmVlY2NmMzY1NDJkNTA2
YjY2MDY0MWEwN2E0NGYzOTc2NzcyODk3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBm
NDEzYjY5MjYyMWZhZDk5ZmJkYTc0OTkxOGE5ZjQ3YTQ4NmU1YTk4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1
LCAxNSBNYXkgMjAyNSAxNjo0NDozMyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy90cy9r
aWxsL2RlY29kZTogYXZvaWQgdXNpbmcgc2hlbGwgYnVpbHQtaW4ga2lsbCBjb21tYW5kCkBAIC0x
Niw3ICsxNiw3IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS90ZXN0
cy90cy9raWxsL2RlY29kZSBiL3Rlc3RzL3RzL2tpbGwvZGVjb2RlCi1pbmRleCAwM2JjMjVmZjYu
LjU3MTQ5ODk5ZSAxMDA3NTUKK2luZGV4IDAzYmMyNWYuLjU3MTQ5ODkgMTAwNzU1CiAtLS0gYS90
ZXN0cy90cy9raWxsL2RlY29kZQogKysrIGIvdGVzdHMvdHMva2lsbC9kZWNvZGUKIEBAIC0xOCw2
ICsxOCwxMSBAQCBUU19ERVNDPSJkZWNvZGUgZnVuY3Rpb25zIgpAQCAtMzEsNiArMzEsMyBAQCBp
bmRleCAwM2JjMjVmZjYuLjU3MTQ5ODk5ZSAxMDA3NTUKICB0c19za2lwX3FlbXVfdXNlcgogIAog
IHRzX2NoZWNrX3Rlc3RfY29tbWFuZCAiJFRTX0NNRF9LSUxMIgotLS0gCi0yLjM0LjEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdHMt
a2lsbC1kZWNvZGUtdXNlLVJUTUlOLWZyb20ta2lsbC1MLWluc3RlYWQtb2YtaGFyZC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLXRzLWtpbGwtZGVj
b2RlLXVzZS1SVE1JTi1mcm9tLWtpbGwtTC1pbnN0ZWFkLW9mLWhhcmQucGF0Y2gKaW5kZXggZjRl
MmY5ZTc0NS4uMTYwZmI1ZTNkZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4LzAwMDEtdHMta2lsbC1kZWNvZGUtdXNlLVJUTUlOLWZyb20ta2lsbC1M
LWluc3RlYWQtb2YtaGFyZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4
L3V0aWwtbGludXgvMDAwMS10cy1raWxsLWRlY29kZS11c2UtUlRNSU4tZnJvbS1raWxsLUwtaW5z
dGVhZC1vZi1oYXJkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNWQ1ZTg4NzMwMjlkMTcw
ZmNhYjM4YTZmYmQ1ZDVhMzU1NTc0YjlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBk
ZTY1NGI0OGNjMjk4YTk5NzFhN2E1MDFiNzYzM2VhZDdmODQ2NzU4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2Vk
LCA0IEp1biAyMDI1IDE2OjI3OjE5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRzL2tpbGwvZGVj
b2RlOiB1c2UgUlRNSU4gZnJvbSAna2lsbCAtTCcgaW5zdGVhZCBvZgpAQCAtMjgsNyArMjgsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L3Rlc3RzL3RzL2tpbGwvZGVjb2RlIGIvdGVzdHMvdHMva2lsbC9kZWNvZGUKLWluZGV4IDU3MTQ5
ODk5ZS4uNTI0YjRlNWUyIDEwMDc1NQoraW5kZXggNTcxNDk4OS4uNTI0YjRlNSAxMDA3NTUKIC0t
LSBhL3Rlc3RzL3RzL2tpbGwvZGVjb2RlCiArKysgYi90ZXN0cy90cy9raWxsL2RlY29kZQogQEAg
LTUzLDE0ICs1MywxOSBAQCBBQ0s9CkBAIC01Myw2ICs1MywzIEBAIGluZGV4IDU3MTQ5ODk5ZS4u
NTI0YjRlNWUyIDEwMDc1NQogIAkJZWxzZQogIAkJICAgIGNhdAogIAkJZmkKLS0tIAotMi4zNC4x
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9h
dm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCBmZTkyYWZiYzUzLi45
YWZjMzIxZTMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA0MzAzMDM4OGU4MzE2NDJkMzZjYjdiOWQ0YjYzNzU1ZTk2OTY3MTRhIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3ZDc1YjA1OTZlYjc5MzFjMTdhYTk2MDg4ZjJk
NjU4YWEyMTBhY2E3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVh
IDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBNb24sIDE0IEp1biAyMDIxIDE0OjAwOjMx
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEFkZCBwdGVzdApAQCAtMTQsNyAr
MTQsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUKICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5h
YyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNDNhMjNhNS4uNGE4NDUzMSAxMDA2NDQKK2luZGV4IDJj
NDQwMzQuLjQyN2UxYmQgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3Vy
ZS5hYwogQEAgLTExLDcgKzExLDcgQEAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1z
YmluZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Nv
bmZpZ3VyZS1zYmluZGlyLnBhdGNoCmluZGV4IGViYjMyYTY4NDUuLjExOWE1Mjk5ODQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUt
c2JpbmRpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM3ODk5OGJm
ODJlM2I2ZmY0NjU2OTA3N2IyOWY5NWU3MmI3MzQ2ODEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDE0YTA1MTU5NmMwMDVmMjc2ODhlYTgzYjU5OGJkODQyMThmMDE0NjYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBQaGlsIEJsdW5kZWxsIDxwYkBwYmNsLm5ldD4KIERhdGU6
IE1vbiwgMjQgU2VwIDIwMTIgMDc6MjQ6NTEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdXRpbC1s
aW51eDogRW5zdXJlIHRoYXQgJHtzYmluZGlyfSBpcyByZXNwZWN0ZWQKQEAgLTE0LDcgKzE0LDcg
QEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQogIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggYTVkOTEwMi4uNDNhMjNhNSAxMDA2
NDQKK2luZGV4IGQxYzE4NDAuLjJjNDQwMzQgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsr
KyBiL2NvbmZpZ3VyZS5hYwogQEAgLTExMCw3ICsxMTAsMTAgQEAgQUNfU1VCU1QoW3J1bnN0YXRl
ZGlyXSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2gK
aW5kZXggZmE0YWUwMmJjMy4uMTZjMWU0NDdiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlf
dGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDcyOGMyYWJk
ODg5ZDIyNTUzNTAwOGMzZTdhMWVlZjRiOGEwYWVlYTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDE4ZjI0NTk2MTViM2UyZDZjNzM1NGI3Mzg0MjliZjAyODM3YjcyMzUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNv
bT4KIERhdGU6IFRodSwgMyBEZWMgMjAxNSAwNDowODowMCArMDEwMAogU3ViamVjdDogW1BBVENI
XSBEaXNwbGF5IHRlc3RuYW1lIGZvciBzdWJ0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKaW5kZXggYWQyMzAwMWNmYS4uZDYy
MzA0NTVlMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4L3B0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC9wdGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMThiZjZhZGVkOWIyYTc1MTg1
YWU0YjIzYTQxY2QyZTQzMjJjNWUzMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjlj
OWRhMjVlNDk3NDEzNDE1ODgwZWQ0YjBiNmMxMGJlMzExNjliYyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTog
VGh1LCAzIERlYyAyMDE1IDA0OjA4OjAwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERlZmluZSBU
RVNUUyB2YXJpYWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4XzIuNDEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXhfMi40MS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi40MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDEuMS5iYgotLSAKMi40Ny4xCgo=

--===============3635212044808100634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/util-linux-libuuid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.pat
 ch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGSIZE changed from 68584 to 68616 (+0%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file:
 //0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch"
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-bits: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-bits: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-cal: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-cal: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGSIZE changed from 55424 to 59520 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-choom: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-choom: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-col: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-col: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-column: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-column: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-coresched: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-coresched: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 29890776 to 30101128 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGSIZE changed from 965804 to 966942 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-doc: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-eject: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-eject: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-exch: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-exch: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-flock: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-flock: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PKGSIZE changed from 63712 to 63704 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-kill: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-kill: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-last: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-last: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PKGSIZE changed from 522417 to 526513 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGSIZE changed from 573925 to 616703 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGSIZE changed from 391984 to 391847 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGSIZE changed from 574034 to 579792 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 556097 to 623486 (+12%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGSIZE changed from 629848 to 629300 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGSIZE changed from 603531 to 602707 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGSIZE changed from 637195 to 682238 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGSIZE changed from 618010 to 617385 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 496173 to 567096 (+14%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGSIZE changed from 609556 to 608994 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGSIZE changed from 507272 to 507140 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 466733 to 571166 (+22%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGSIZE changed from 641092 to 640535 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGSIZE changed from 197168 to 196987 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PKGSIZE changed from 80256 to 80068 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGSIZE changed from 699887 to 750653 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGSIZE changed from 435493 to 435349 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGSIZE changed from 342109 to 341974 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGSIZE changed from 784402 to 783693 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGSIZE changed from 310865 to 310716 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGSIZE changed from 385216 to 385085 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-logger: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-logger: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-look: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-look: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PKGSIZE changed from 129312 to 133408 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PKGSIZE changed from 239736 to 243832 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PKGSIZE changed from 125064 to 129160 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-more: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-more: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mount: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mount: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-namei: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-namei: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-partx: PKGSIZE changed from 133240 to 137336 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-partx: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 6509923 to 6568391 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-loongarch-kvm_on_loongson_3c6000 /usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/loongarch-kvm_on_loongson_3c6000.tar.gz"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rename: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-renice: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-renice: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-rev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-script: PKGSIZE changed from 75896 to 79992 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-script: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-script: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PKGSIZE changed from 84403 to 88499 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-src: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-su: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-su: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ul: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ul: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-umount: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-umount: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wall: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-wall: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-write: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-write: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux: PKGV changed from 2.41 [default] to 2.41.1 [default]

--===============3635212044808100634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 556097 to 623486 (+12%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 496173 to 567096 (+14%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 466733 to 571166 (+22%)
packages/core2-64-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/loongarch-kvm_on_loongson_3c6000.tar.gz /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-loongarch-kvm_on_loongson_3c6000"

--===============3635212044808100634==--

