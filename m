Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11778.1794893343734846323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 21:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XzbKCV4e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pWcac7eF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1e7fae820-dd2cf0f6-ef1c-475a-9bb0-eea5eae447b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794893342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DDw37OlTfnqEySA1dJXIDLiDA2c+QXDZTP37dJHjQ1Q=;
	b=XzbKCV4eAy7zhJCCTBMDzezQDJu/KsYESDKvh7tdQT0V0r6r4V5ULqQZmxW4V/Dx
	WKE9eXU4WIoe7Q7Gz2U/8rTLleLZ+t2porYDxxzaOd6os/c7Gx1n+37FtuFz2GNZj+2
	XgNy/lTV1PklwkQMWRXoOMfbnlMKMNJZQtDsuDFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794893342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DDw37OlTfnqEySA1dJXIDLiDA2c+QXDZTP37dJHjQ1Q=;
	b=pWcac7eFpd11slNAr0Dhm9MrYCduUIaPM3nfy074f8YWqGHfYnX/GMnxOxn6rfBT
	VbRPRKHZYOX3d6ItlW9NGbIOGEKVf93CjwB1dx+KpXydIpB+l6fJ+O0NvGFy4sOF46x
	lAW+iSXIUMqlpTXWyA24H3yYOT0qU9NaF3bmm2XA=
Content-Type: multipart/mixed; boundary="===============0586505181435621527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Kusuma Dirisala <kusuma.dirisala@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gawk: upgrading to 5.4.2 SUCCEEDED
Message-ID: <010101a1e7fae820-dd2cf0f6-ef1c-475a-9bb0-eea5eae447b3-000000@us-west-2.amazonses.com>
Date: Tue, 17 Nov 2026 05:29:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.17-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 05:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250403

--===============0586505181435621527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gawk* to *5.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gawk-upgrade-5.4.1-5.4.2.patch
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
From b4a881909137b68a41f07b1d2c556889a2b2f88e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 17 Nov 2026 05:26:52 +0000
Subject: [PATCH] gawk: upgrade 5.4.1 -> 5.4.2

Unrelated:

Remove memory status from arrdbg.ok* results. The numbers
will vary.

Clean up running tests from a different build directory.
Unrelated:
Unrelated:
Unrelated:

Refactor use of checkmany.sh in order to be able to add
z/OS tests.

Move the *-mpfr.ok files to be *.ok-mpfr so that checkmany.sh
can be used with them.  Or at least as much as possible.

Simplify handling tests with multiple OK files.
---
 ...-configure.ac-re-enable-disabled-printf-features.patch | 8 ++++----
 .../gawk/{gawk_5.4.1.bb => gawk_5.4.2.bb}                 | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_5.4.1.bb => gawk_5.4.2.bb} (98%)

diff --git a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
index 882edca112..43b9c2bb2c 100644
--- a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
+++ b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
@@ -1,4 +1,4 @@
-From 53808cbdab1d12c99a4fbadf4ea134b98664e8c7 Mon Sep 17 00:00:00 2001
+From abaefa46aa209731a2389f1826ae75aa39b0ac17 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 12:13:58 +0100
 Subject: [PATCH] configure.ac: re-enable disabled printf features
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 471fbc1..d7d173a 100644
+index 77a12b8..6cd5f50 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -402,7 +402,7 @@ int main()
+@@ -397,7 +397,7 @@ int main()
  ])],
  	has_f_format=yes,
  	has_f_format=no,
@@ -24,7 +24,7 @@ index 471fbc1..d7d173a 100644
  )
  if test "$has_f_format" = yes
  then
-@@ -431,7 +431,7 @@ int main()
+@@ -426,7 +426,7 @@ int main()
  ])],
  	has_a_format=yes,
  	has_a_format=no,
diff --git a/meta/recipes-extended/gawk/gawk_5.4.1.bb b/meta/recipes-extended/gawk/gawk_5.4.2.bb
similarity index 98%
rename from meta/recipes-extended/gawk/gawk_5.4.1.bb
rename to meta/recipes-extended/gawk/gawk_5.4.2.bb
index d3bf532528..71ff9ff5bf 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.2.bb
@@ -30,7 +30,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
            "
 
-SRC_URI[sha256sum] = "07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37"
+SRC_URI[sha256sum] = "b95e4909533b5f988c6b5e5539b3b3ddf76e7d7df02ca2e5b5b7d6f62db78e6a"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.47.1


--===============0586505181435621527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gawk/gawk-dbg: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-dbg: PKGSIZE changed from 3617072 to 3642536 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-dbg: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-dev: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-dev: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-doc: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-doc: PKGSIZE changed from 2518754 to 2508305 (-0%)
packages/x86-64-v3-poky-linux/gawk/gawk-doc: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-gawkbug: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-gawkbug: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ar: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ar: PKGSIZE changed from 107223 to 106606 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ar: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-bg: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-bg: PKGSIZE changed from 128056 to 127325 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-bg: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-de: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-de: PKGSIZE changed from 98839 to 98261 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-de: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-es: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-es: PKGSIZE changed from 97735 to 97194 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-es: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-fr: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-fr: PKGSIZE changed from 99076 to 98498 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-fr: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-he: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-he: PKGSIZE changed from 86827 to 86330 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-he: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-id: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-id: PKGSIZE changed from 93278 to 92748 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-id: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-it: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-it: PKGSIZE changed from 95333 to 95504 (+0%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-it: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ka: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ka: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ko: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ko: PKGSIZE changed from 102621 to 102009 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ko: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-nl: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-nl: PKGSIZE changed from 77277 to 76807 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-nl: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pl: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pl: PKGSIZE changed from 96733 to 96112 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pl: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt-br: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt-br: PKGSIZE changed from 84649 to 84101 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt-br: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt: PKGSIZE changed from 93683 to 93153 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ro: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ro: PKGSIZE changed from 99851 to 99284 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ro: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sr: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sr: PKGSIZE changed from 119300 to 119604 (+0%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sr: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sv: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sv: PKGSIZE changed from 94647 to 94115 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sv: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-tr: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-tr: PKGSIZE changed from 88725 to 88191 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-tr: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-uk: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-uk: PKGSIZE changed from 122991 to 122264 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-uk: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-zh-cn: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-zh-cn: PKGSIZE changed from 85361 to 84800 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-zh-cn: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-ptest: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-ptest: PKGSIZE changed from 1430259 to 1457185 (+2%)
packages/x86-64-v3-poky-linux/gawk/gawk-ptest: FILELIST: removed "/usr/lib/gawk/ptest/test/asortsymtab-mpfr.ok /usr/lib/gawk/ptest/test/numrange-mpfr.ok /usr/lib/gawk/ptest/test/printf-corners-mpfr.ok /usr/lib/gawk/ptest/test/arraytype-mpfr.ok /usr/lib/gawk/ptest/test/rand-mpfr.ok /usr/lib/gawk/ptest/test/fnarydel-mpfr.ok /usr/lib/gawk/ptest/test/fnparydl-mpfr.ok", added "/usr/lib/gawk/ptest/test/mbprintf5.awk /usr/lib/gawk/ptest/test/gsubtst5.ok-zos /usr/lib/gawk/ptest/test/greek-8bit.ok2 /usr/lib/gawk/ptest/test/subamp.ok-zos /usr/lib/gawk/ptest/test/aasort.ok-zos /usr/lib/gawk/ptest/test/nlstringtest.ok-nogettext /usr/lib/gawk/ptest/test/posix_compare.ok-zos /usr/lib/gawk/ptest/test/symtab13.awk /usr/lib/gawk/ptest/test/indirectbuiltin8.awk /usr/lib/gawk/ptest/test/mbprintf5.ok /usr/lib/gawk/ptest/test/regrange.ok-zos /usr/lib/gawk/ptest/test/numrange.ok-zos /usr/lib/gawk/ptest/test/indirectbuiltin10.awk /usr/lib/gawk/ptest/test/case-check.ok-zos /usr/lib/gawk/ptest/test/printhuge
 .ok-zos /usr/lib/gawk/ptest/test/gsubnulli18n.ok-zos /usr/lib/gawk/ptest/test/elemnew7.ok /usr/lib/gawk/ptest/test/inf-nan-torture.ok-zos /usr/lib/gawk/ptest/test/case-check.awk /usr/lib/gawk/ptest/test/rand.ok-mpfr /usr/lib/gawk/ptest/test/nonfatal2.ok-zos /usr/lib/gawk/ptest/test/fnarydel.ok-mpfr /usr/lib/gawk/ptest/test/fnparydl.ok-mpfr /usr/lib/gawk/ptest/test/aasorti.ok-zos /usr/lib/gawk/ptest/test/greek-equiv.ok-zos /usr/lib/gawk/ptest/test/case-check.ok /usr/lib/gawk/ptest/test/indirectbuiltin8.ok /usr/lib/gawk/ptest/test/negexp2.ok /usr/lib/gawk/ptest/test/indirectbuiltin7.awk /usr/lib/gawk/ptest/test/exit.ok-zos /usr/lib/gawk/ptest/test/greek-8bit.ok /usr/lib/gawk/ptest/test/indirectbuiltin9.ok /usr/lib/gawk/ptest/test/negexp2.awk /usr/lib/gawk/ptest/test/symtab13.ok /usr/lib/gawk/ptest/test/sortfor.ok-zos /usr/lib/gawk/ptest/test/subi18n.ok-zos /usr/lib/gawk/ptest/test/sigpipe1.ok-zos /usr/lib/gawk/ptest/test/symtab11.ok-zos /usr/lib/gawk/ptest/test/symtab1.ok-zos /usr/lib
 /gawk/ptest/test/unicode1.ok-zos /usr/lib/gawk/ptest/test/concat4.ok-zos /usr/lib/gawk/ptest/test/wideidx.ok-zos /usr/lib/gawk/ptest/test/widesub.ok-zos /usr/lib/gawk/ptest/test/numrange.ok-mpfr /usr/lib/gawk/ptest/test/cmdlinefsbacknl2.ok-zos /usr/lib/gawk/ptest/test/posix-inf.ok-zos /usr/lib/gawk/ptest/test/nlstringtest.ok /usr/lib/gawk/ptest/test/arraysort.ok-zos /usr/lib/gawk/ptest/test/dfamb1.ok-zos /usr/lib/gawk/ptest/test/reint2.ok-zos /usr/lib/gawk/ptest/test/getlndir.ok-zos /usr/lib/gawk/ptest/test/elemnew7.awk /usr/lib/gawk/ptest/test/asortsymtab.ok-mpfr /usr/lib/gawk/ptest/test/forcenum.ok-zos /usr/lib/gawk/ptest/test/widesub3.ok-zos /usr/lib/gawk/ptest/test/greek-8bit.awk /usr/lib/gawk/ptest/test/indirectbuiltin9.awk /usr/lib/gawk/ptest/test/indirectbuiltin7.ok /usr/lib/gawk/ptest/test/wideidx2.ok-zos /usr/lib/gawk/ptest/test/widesub2.ok-zos /usr/lib/gawk/ptest/test/greek-utf.ok-zos /usr/lib/gawk/ptest/test/ignrcas2.ok-zos /usr/lib/gawk/ptest/test/printf-corners.ok-mpfr 
 /usr/lib/gawk/ptest/test/nlstringtest.awk /usr/lib/gawk/ptest/test/indirectbuiltin10.ok /usr/lib/gawk/ptest/test/dbugarray4.ok-zos /usr/lib/gawk/ptest/test/sortu.ok-zos /usr/lib/gawk/ptest/test/printf-corners.ok-zos /usr/lib/gawk/ptest/test/hexfloat.ok-zos /usr/lib/gawk/ptest/test/rri1.ok-zos /usr/lib/gawk/ptest/test/nlstringtest.po /usr/lib/gawk/ptest/test/mbprintf5.in /usr/lib/gawk/ptest/test/regexpbad.ok-zos /usr/lib/gawk/ptest/test/arraytype.ok-mpfr /usr/lib/gawk/ptest/test/widesub4.ok-zos /usr/lib/gawk/ptest/test/case-check.ok2 /usr/lib/gawk/ptest/test/case-check.ok3 /usr/lib/gawk/ptest/test/double1.ok-zos /usr/lib/gawk/ptest/test/double2.ok-zos /usr/lib/gawk/ptest/test/elemnew4.ok-zos /usr/lib/gawk/ptest/test/negexp2.ok-zos"
packages/x86-64-v3-poky-linux/gawk/gawk-ptest: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-src: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-src: PKGSIZE changed from 2722308 to 2736300 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-src: FILELIST: directory renamed /usr/src/debug/gawk/5.4.1/support -> /usr/src/debug/gawk/5.4.2/support, directory renamed /usr/src/debug/gawk/5.4.1 -> /usr/src/debug/gawk/5.4.2, directory renamed /usr/src/debug/gawk/5.4.1/support/malloc -> /usr/src/debug/gawk/5.4.2/support/malloc, directory renamed /usr/src/debug/gawk/5.4.1/awklib -> /usr/src/debug/gawk/5.4.2/awklib, directory renamed /usr/src/debug/gawk/5.4.1/posix -> /usr/src/debug/gawk/5.4.2/posix, directory renamed /usr/src/debug/gawk/5.4.1/extension -> /usr/src/debug/gawk/5.4.2/extension
packages/x86-64-v3-poky-linux/gawk/gawk-src: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-staticdev: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk-staticdev: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk/gawk: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk/gawk: PKGSIZE changed from 1532198 to 1549326 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.4.1", added "/usr/bin/gawk-5.4.2 /usr/share/awk/gensub2.awk"
packages/x86-64-v3-poky-linux/gawk/gawk: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk: PACKAGES: added "gawk-locale-lv gawk-locale-zh-tw"
packages/x86-64-v3-poky-linux/gawk: PV changed from "5.4.1" to "5.4.2"
packages/x86-64-v3-poky-linux/gawk: PKGV changed from 5.4.1 [default] to 5.4.2 [default]
packages/x86-64-v3-poky-linux/gawk: SRC_URI changed from "https://ftpmirror.gnu.org//gawk/gawk-5.4.1.tar.xz file://run-ptest file://0001-configure.ac-re-enable-disabled-printf-features.patch" to "https://ftpmirror.gnu.org//gawk/gawk-5.4.2.tar.xz file://run-ptest file://0001-configure.ac-re-enable-disabled-printf-features.patch"
Changes to packages/x86-64-v3-poky-linux/gawk (sysroot):
  /usr/share/awk/gensub2.awk was added
packages/x86-64-v3-poky-linux/glibc/glibc-src: PKGSIZE changed from 20550944 to 20550921 (-0%)

--===============0586505181435621527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gawk-changelog.txt"

Unrelated:

Remove memory status from arrdbg.ok* results. The numbers
will vary.

Clean up running tests from a different build directory.
Unrelated:
Unrelated:
Unrelated:

Refactor use of checkmany.sh in order to be able to add
z/OS tests.

Move the *-mpfr.ok files to be *.ok-mpfr so that checkmany.sh
can be used with them.  Or at least as much as possible.

Simplify handling tests with multiple OK files.

--===============0586505181435621527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gawk/gawk-ptest: FILELIST: removed "/usr/lib/gawk/ptest/test/asortsymtab-mpfr.ok /usr/lib/gawk/ptest/test/fnarydel-mpfr.ok /usr/lib/gawk/ptest/test/fnparydl-mpfr.ok /usr/lib/gawk/ptest/test/numrange-mpfr.ok /usr/lib/gawk/ptest/test/printf-corners-mpfr.ok /usr/lib/gawk/ptest/test/rand-mpfr.ok /usr/lib/gawk/ptest/test/arraytype-mpfr.ok", added "/usr/lib/gawk/ptest/test/sortfor.ok-zos /usr/lib/gawk/ptest/test/regexpbad.ok-zos /usr/lib/gawk/ptest/test/subi18n.ok-zos /usr/lib/gawk/ptest/test/reint2.ok-zos /usr/lib/gawk/ptest/test/symtab1.ok-zos /usr/lib/gawk/ptest/test/aasorti.ok-zos /usr/lib/gawk/ptest/test/wideidx.ok-zos /usr/lib/gawk/ptest/test/widesub.ok-zos /usr/lib/gawk/ptest/test/dfamb1.ok-zos /usr/lib/gawk/ptest/test/concat4.ok-zos /usr/lib/gawk/ptest/test/inf-nan-torture.ok-zos /usr/lib/gawk/ptest/test/asortsymtab.ok-mpfr /usr/lib/gawk/ptest/test/case-check.awk /usr/lib/gawk/ptest/test/arraytype.ok-mpfr /usr/lib/gawk/ptest/test/case-check.ok /usr/lib
 /gawk/ptest/test/mbprintf5.ok /usr/lib/gawk/ptest/test/indirectbuiltin8.awk /usr/lib/gawk/ptest/test/mbprintf5.awk /usr/lib/gawk/ptest/test/cmdlinefsbacknl2.ok-zos /usr/lib/gawk/ptest/test/greek-utf.ok-zos /usr/lib/gawk/ptest/test/dbugarray4.ok-zos /usr/lib/gawk/ptest/test/symtab13.awk /usr/lib/gawk/ptest/test/rri1.ok-zos /usr/lib/gawk/ptest/test/case-check.ok2 /usr/lib/gawk/ptest/test/case-check.ok3 /usr/lib/gawk/ptest/test/gsubtst5.ok-zos /usr/lib/gawk/ptest/test/gsubnulli18n.ok-zos /usr/lib/gawk/ptest/test/getlndir.ok-zos /usr/lib/gawk/ptest/test/printhuge.ok-zos /usr/lib/gawk/ptest/test/elemnew7.ok /usr/lib/gawk/ptest/test/nlstringtest.ok /usr/lib/gawk/ptest/test/widesub3.ok-zos /usr/lib/gawk/ptest/test/indirectbuiltin10.ok /usr/lib/gawk/ptest/test/greek-8bit.ok /usr/lib/gawk/ptest/test/mbprintf5.in /usr/lib/gawk/ptest/test/greek-8bit.ok2 /usr/lib/gawk/ptest/test/sortu.ok-zos /usr/lib/gawk/ptest/test/posix_compare.ok-zos /usr/lib/gawk/ptest/test/double1.ok-zos /usr/lib/gawk/ptes
 t/test/double2.ok-zos /usr/lib/gawk/ptest/test/negexp2.ok-zos /usr/lib/gawk/ptest/test/subamp.ok-zos /usr/lib/gawk/ptest/test/aasort.ok-zos /usr/lib/gawk/ptest/test/symtab13.ok /usr/lib/gawk/ptest/test/elemnew4.ok-zos /usr/lib/gawk/ptest/test/widesub4.ok-zos /usr/lib/gawk/ptest/test/numrange.ok-mpfr /usr/lib/gawk/ptest/test/negexp2.ok /usr/lib/gawk/ptest/test/arraysort.ok-zos /usr/lib/gawk/ptest/test/indirectbuiltin7.ok /usr/lib/gawk/ptest/test/greek-equiv.ok-zos /usr/lib/gawk/ptest/test/indirectbuiltin9.awk /usr/lib/gawk/ptest/test/regrange.ok-zos /usr/lib/gawk/ptest/test/numrange.ok-zos /usr/lib/gawk/ptest/test/case-check.ok-zos /usr/lib/gawk/ptest/test/indirectbuiltin10.awk /usr/lib/gawk/ptest/test/elemnew7.awk /usr/lib/gawk/ptest/test/printf-corners.ok-mpfr /usr/lib/gawk/ptest/test/rand.ok-mpfr /usr/lib/gawk/ptest/test/nlstringtest.ok-nogettext /usr/lib/gawk/ptest/test/printf-corners.ok-zos /usr/lib/gawk/ptest/test/exit.ok-zos /usr/lib/gawk/ptest/test/nonfatal2.ok-zos /usr/lib/g
 awk/ptest/test/fnparydl.ok-mpfr /usr/lib/gawk/ptest/test/fnarydel.ok-mpfr /usr/lib/gawk/ptest/test/nlstringtest.awk /usr/lib/gawk/ptest/test/indirectbuiltin7.awk /usr/lib/gawk/ptest/test/indirectbuiltin9.ok /usr/lib/gawk/ptest/test/unicode1.ok-zos /usr/lib/gawk/ptest/test/sigpipe1.ok-zos /usr/lib/gawk/ptest/test/symtab11.ok-zos /usr/lib/gawk/ptest/test/nlstringtest.po /usr/lib/gawk/ptest/test/posix-inf.ok-zos /usr/lib/gawk/ptest/test/negexp2.awk /usr/lib/gawk/ptest/test/forcenum.ok-zos /usr/lib/gawk/ptest/test/hexfloat.ok-zos /usr/lib/gawk/ptest/test/greek-8bit.awk /usr/lib/gawk/ptest/test/indirectbuiltin8.ok /usr/lib/gawk/ptest/test/widesub2.ok-zos /usr/lib/gawk/ptest/test/wideidx2.ok-zos /usr/lib/gawk/ptest/test/ignrcas2.ok-zos"
packages/x86-64-v3-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.4.1", added "/usr/share/awk/gensub2.awk /usr/bin/gawk-5.4.2"
packages/x86-64-v3-poky-linux/gawk: PACKAGES: added "gawk-locale-zh-tw gawk-locale-lv"
Changes to packages/x86-64-v3-poky-linux/gawk (sysroot):
  /usr/share/awk/gensub2.awk was added

--===============0586505181435621527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gawk-upgrade-5.4.1-5.4.2.patch"

RnJvbSBiNGE4ODE5MDkxMzdiNjhhNDFmMDdiMWQyYzU1Njg4OWEyYjJmODhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTcgTm92IDIwMjYgMDU6MjY6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
YXdrOiB1cGdyYWRlIDUuNC4xIC0+IDUuNC4yCgpVbnJlbGF0ZWQ6CgpSZW1vdmUgbWVtb3J5IHN0
YXR1cyBmcm9tIGFycmRiZy5vayogcmVzdWx0cy4gVGhlIG51bWJlcnMKd2lsbCB2YXJ5LgoKQ2xl
YW4gdXAgcnVubmluZyB0ZXN0cyBmcm9tIGEgZGlmZmVyZW50IGJ1aWxkIGRpcmVjdG9yeS4KVW5y
ZWxhdGVkOgpVbnJlbGF0ZWQ6ClVucmVsYXRlZDoKClJlZmFjdG9yIHVzZSBvZiBjaGVja21hbnku
c2ggaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBhZGQKei9PUyB0ZXN0cy4KCk1vdmUgdGhlICotbXBm
ci5vayBmaWxlcyB0byBiZSAqLm9rLW1wZnIgc28gdGhhdCBjaGVja21hbnkuc2gKY2FuIGJlIHVz
ZWQgd2l0aCB0aGVtLiAgT3IgYXQgbGVhc3QgYXMgbXVjaCBhcyBwb3NzaWJsZS4KClNpbXBsaWZ5
IGhhbmRsaW5nIHRlc3RzIHdpdGggbXVsdGlwbGUgT0sgZmlsZXMuCi0tLQogLi4uLWNvbmZpZ3Vy
ZS5hYy1yZS1lbmFibGUtZGlzYWJsZWQtcHJpbnRmLWZlYXR1cmVzLnBhdGNoIHwgOCArKysrLS0t
LQogLi4uL2dhd2sve2dhd2tfNS40LjEuYmIgPT4gZ2F3a181LjQuMi5iYn0gICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2sve2dhd2tfNS40LjEuYmIgPT4g
Z2F3a181LjQuMi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
Z2F3ay9nYXdrLzAwMDEtY29uZmlndXJlLmFjLXJlLWVuYWJsZS1kaXNhYmxlZC1wcmludGYtZmVh
dHVyZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrLzAwMDEtY29uZmln
dXJlLmFjLXJlLWVuYWJsZS1kaXNhYmxlZC1wcmludGYtZmVhdHVyZXMucGF0Y2gKaW5kZXggODgy
ZWRjYTExMi4uNDNiOWMyYmIyYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dh
d2svZ2F3ay8wMDAxLWNvbmZpZ3VyZS5hYy1yZS1lbmFibGUtZGlzYWJsZWQtcHJpbnRmLWZlYXR1
cmVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2svMDAwMS1jb25m
aWd1cmUuYWMtcmUtZW5hYmxlLWRpc2FibGVkLXByaW50Zi1mZWF0dXJlcy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gNTM4MDhjYmRhYjFkMTJjOTlhNGZiYWRmNGVhMTM0Yjk4NjY0ZThjNyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWJhZWZhNDZhYTIwOTczMWEyMzg5ZjE4MjZh
ZTc1YWEzOWIwYWMxNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDIyIE5vdiAyMDI0IDEyOjEz
OjU4ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogcmUtZW5hYmxlIGRpc2Fi
bGVkIHByaW50ZiBmZWF0dXJlcwpAQCAtMTIsMTAgKzEyLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5h
YyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNDcxZmJjMS4uZDdkMTczYSAxMDA2NDQKK2luZGV4IDc3
YTEyYjguLjZjZDVmNTAgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3Vy
ZS5hYwotQEAgLTQwMiw3ICs0MDIsNyBAQCBpbnQgbWFpbigpCitAQCAtMzk3LDcgKzM5Nyw3IEBA
IGludCBtYWluKCkKICBdKV0sCiAgCWhhc19mX2Zvcm1hdD15ZXMsCiAgCWhhc19mX2Zvcm1hdD1u
bywKQEAgLTI0LDcgKzI0LDcgQEAgaW5kZXggNDcxZmJjMS4uZDdkMTczYSAxMDA2NDQKICApCiAg
aWYgdGVzdCAiJGhhc19mX2Zvcm1hdCIgPSB5ZXMKICB0aGVuCi1AQCAtNDMxLDcgKzQzMSw3IEBA
IGludCBtYWluKCkKK0BAIC00MjYsNyArNDI2LDcgQEAgaW50IG1haW4oKQogIF0pXSwKICAJaGFz
X2FfZm9ybWF0PXllcywKICAJaGFzX2FfZm9ybWF0PW5vLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjQuMS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9n
YXdrL2dhd2tfNS40LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2dhd2svZ2F3a181LjQuMi5iYgppbmRleCBkM2JmNTMyNTI4Li43MWZmOWZmNWJm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuNC4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2tfNS40LjIuYmIKQEAgLTMwLDcgKzMw
LDcgQEAgU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2dhd2svZ2F3ay0ke1BWfS50YXIueHogXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUuYWMtcmUtZW5hYmxlLWRpc2FibGVkLXBy
aW50Zi1mZWF0dXJlcy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjA3ZjZmNzM0MmI3ZmViZTQzMTNmYzJjMjU0MmFkOTNkNjRmZTIwYWQ4NzE3MjAwMTA5ZjEw
NWE4MjZmNWZkMzciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjk1ZTQ5MDk1MzNiNWY5ODhjNmI1
ZTU1MzliM2IzZGRmNzZlN2Q3ZGYwMmNhMmU1YjViN2Q2ZjYyZGI3OGU2YSIKIAogaW5oZXJpdCBh
dXRvdG9vbHMgZ2V0dGV4dCB0ZXhpbmZvIHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIAotLSAKMi40Ny4x
Cgo=

--===============0586505181435621527==--
