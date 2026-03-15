Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95DED58B2D
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28800.1773582115411178817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YveGeZ+o;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fOemwxY9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019cf1bb691c-f5154aa7-ead1-4799-8b8c-4941f7049630-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EZasKe6TVp6ARTSH8GluovbZawTVS9/zxfHtUOSW2L0=;
	b=YveGeZ+olfmxhdRMQ0vsxRfynkb3mp5kZdMlaLtX3B63cptlKljhrQoNj9GPUPgT
	tUmpUxL3uU8NNYzG/TomiTNytGP8i+BrHKH1FvUDrlfZb7/fc83YVTsU03umRw4quqf
	B/k6MIzRkOetNU7Ly+sxmpcImCLjZVi+W9wLwBfs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EZasKe6TVp6ARTSH8GluovbZawTVS9/zxfHtUOSW2L0=;
	b=fOemwxY9R0IUJP+oazY9G05QIo8Y/486LGh1ClztMH70QaHSzAFdpYzYIJZ+KEWD
	Vb9DyFi/AktOBKxq2R8/3fkJgGFF2XmkaIcJpGsUkOuKe1304wvpMU+k7+7JW9hcGxJ
	4Fj2RL2EMS2iRtYj2uHdUkYWEHqmQLDr+UkTU+sM=
Content-Type: multipart/mixed; boundary="===============1532830678063690403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.4.3 SUCCEEDED
Message-ID: <0101019cf1bb691c-f5154aa7-ead1-4799-8b8c-4941f7049630-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233142

--===============1532830678063690403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.4.2-2.4.3.patch
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
From 8cb9a52d03470e4e4fdbdeb3ad3fd2249d57a0f6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 08:13:17 +0000
Subject: [PATCH] python3-numpy: upgrade 2.4.2 -> 2.4.3

---
 ...Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/0001-python-sysroot.patch            | 4 ++--
 .../python/python3-numpy/fix_reproducibility.patch            | 2 +-
 .../python/{python3-numpy_2.4.2.bb => python3-numpy_2.4.3.bb} | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.4.2.bb => python3-numpy_2.4.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 3a77ffa4e0..ef09ea77ce 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 5cb7316128845e3da1ce1618a42b2e3222b59ba9 Mon Sep 17 00:00:00 2001
+From bc605e25ea424f15180528227d7c916d00bc65ee Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
index b22c123493..fd222cb094 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
@@ -1,11 +1,11 @@
-From c40218577305f5953ef63d943c26a27c5a931770 Mon Sep 17 00:00:00 2001
+From 1f7ef66337dc29208d3ef0e8120f5820a321c868 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 21 Jan 2026 14:12:36 +0000
 Subject: [PATCH] Add sysroot to pkgconfig libdir
 
 When Meson uses pkg-config to introspect the Python install it resets PKG_CONFIG_PATH
 and PKG_CONFIG_LIBDIR. However, when it writes to PKG_CONFIG_LIBDIR it uses the
-_target_ library directory without prefixing this with the sysroot, which breaks 
+_target_ library directory without prefixing this with the sysroot, which breaks
 the build if _LIBDIR is the primary search path.
 
 This has been fixed in Meson since 1.10.0[1] but numpy has a vendored fork of Meson
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 71b3634b77..e22053ceac 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 6fd79cbe7ae9f0a7a5fc4e5cd6c5c3da9ea09815 Mon Sep 17 00:00:00 2001
+From a3975f3f77be505da28293ae30f87fc1dacb6729 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.2.bb b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.4.2.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.3.bb
index 8a9351e371..7521a93f99 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-python-sysroot.patch \
            "
-SRC_URI[sha256sum] = "659a6107e31a83c4e33f763942275fd278b21d095094044eb35569e86a21ddae"
+SRC_URI[sha256sum] = "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e32613412dd"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============1532830678063690403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.4.2/numpy-2.4.2.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest file://0001-python-sysroot.patch" to "https://github.com/numpy/numpy/releases/download/v2.4.3/numpy-2.4.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest file://0001-python-sysroot.patch"
packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.4.2" to "2.4.3"
packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.4.2 [default] to 2.4.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.4.2" to "2.4.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.4.2 [default] to 2.4.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 96511272 to 96510704 (-0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.4.2" to "2.4.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.4.2 [default] to 2.4.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.4.2" to "2.4.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.4.2 [default] to 2.4.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.4.2" to "2.4.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.4.2 [default] to 2.4.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.4.2" to "2.4.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.4.2 [default] to 2.4.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.4.2" to "2.4.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.4.2 [default] to 2.4.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 25247000 to 25247654 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/linalg -> /usr/src/debug/python3-numpy/2.4.3/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.4.3/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/
 2.4.2/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/multiarray -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/common -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/include
 /numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/_sf
 c64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/fft -> /usr/src/debug/python3-numpy/2.4.3/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/common/simd -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4
 .2/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/include -> /usr/s
 rc/debug/python3-numpy/2.4.3/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.4.3/numpy/
 _core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.4.3/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.4.3/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.4.2/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/mt19937
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.4.2" to "2.4.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.4.2 [default] to 2.4.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.4.2" to "2.4.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.4.2 [default] to 2.4.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 40279911 to 40281288 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-pack
 ages/numpy-2.4.2.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-package
 s/numpy-2.4.2.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/mt19937, direc
 tory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/pcg64
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info

--===============1532830678063690403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licens
 es/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info
 /licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses
 /numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/splitmix64
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.4.2.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info

--===============1532830678063690403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.4.2-2.4.3.patch"

RnJvbSA4Y2I5YTUyZDAzNDcwZTRlNGZkYmRlYjNhZDNmZDIyNDlkNTdhMGY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDg6MTM6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDIuNC4yIC0+IDIuNC4zCgotLS0KIC4uLkRvbi10LXNlYXJj
aC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2ggfCAyICstCiAu
Li4vcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1weXRob24tc3lzcm9vdC5wYXRjaCAgICAgICAg
ICAgIHwgNCArKy0tCiAuLi4vcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0
eS5wYXRjaCAgICAgICAgICAgIHwgMiArLQogLi4uL3B5dGhvbi97cHl0aG9uMy1udW1weV8yLjQu
Mi5iYiA9PiBweXRob24zLW51bXB5XzIuNC4zLmJifSB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24ve3B5dGhvbjMtbnVtcHlfMi40LjIuYmIgPT4gcHl0aG9uMy1udW1weV8yLjQu
My5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVz
LWJ5LWRlZmF1bHQtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1k
ZWZhdWx0LS5wYXRjaAppbmRleCAzYTc3ZmZhNGUwLi5lZjA5ZWE3N2NlIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFy
Y2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJj
aC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDVjYjczMTYxMjg4NDVlM2RhMWNlMTYxOGE0MmIyZTMyMjJiNTliYTkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJjNjA1ZTI1ZWE0MjRmMTUxODA1MjgyMjdkN2M5
MTZkMDBiYzY1ZWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTAgRGVjIDIwMTUgMTM6
MjA6MzAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3Qgc2VhcmNoIC91c3IgYW5kIHNvIG9u
IGZvciBsaWJyYXJpZXMgYnkgZGVmYXVsdCB0bwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtcHl0aG9uLXN5c3Jvb3QucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1weXRob24tc3lz
cm9vdC5wYXRjaAppbmRleCBiMjJjMTIzNDkzLi5mZDIyMmNiMDk0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1weXRob24tc3lzcm9v
dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkv
MDAwMS1weXRob24tc3lzcm9vdC5wYXRjaApAQCAtMSwxMSArMSwxMSBAQAotRnJvbSBjNDAyMTg1
NzczMDVmNTk1M2VmNjNkOTQzYzI2YTI3YzVhOTMxNzcwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAxZjdlZjY2MzM3ZGMyOTIwOGQzZWYwZTgxMjBmNTgyMGEzMjFjODY4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+
CiBEYXRlOiBXZWQsIDIxIEphbiAyMDI2IDE0OjEyOjM2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IEFkZCBzeXNyb290IHRvIHBrZ2NvbmZpZyBsaWJkaXIKIAogV2hlbiBNZXNvbiB1c2VzIHBrZy1j
b25maWcgdG8gaW50cm9zcGVjdCB0aGUgUHl0aG9uIGluc3RhbGwgaXQgcmVzZXRzIFBLR19DT05G
SUdfUEFUSAogYW5kIFBLR19DT05GSUdfTElCRElSLiBIb3dldmVyLCB3aGVuIGl0IHdyaXRlcyB0
byBQS0dfQ09ORklHX0xJQkRJUiBpdCB1c2VzIHRoZQotX3RhcmdldF8gbGlicmFyeSBkaXJlY3Rv
cnkgd2l0aG91dCBwcmVmaXhpbmcgdGhpcyB3aXRoIHRoZSBzeXNyb290LCB3aGljaCBicmVha3Mg
CitfdGFyZ2V0XyBsaWJyYXJ5IGRpcmVjdG9yeSB3aXRob3V0IHByZWZpeGluZyB0aGlzIHdpdGgg
dGhlIHN5c3Jvb3QsIHdoaWNoIGJyZWFrcwogdGhlIGJ1aWxkIGlmIF9MSUJESVIgaXMgdGhlIHBy
aW1hcnkgc2VhcmNoIHBhdGguCiAKIFRoaXMgaGFzIGJlZW4gZml4ZWQgaW4gTWVzb24gc2luY2Ug
MS4xMC4wWzFdIGJ1dCBudW1weSBoYXMgYSB2ZW5kb3JlZCBmb3JrIG9mIE1lc29uCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJv
ZHVjaWJpbGl0eS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1u
dW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCmluZGV4IDcxYjM2MzRiNzcuLmUyMjA1M2Nl
YWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1w
eS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA2ZmQ3OWNiZTdhZTlmMGE3YTVmYzRlNWNkNmM1YzNkYTllYTA5ODE1IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMzk3NWYzZjc3YmU1MDVkYTI4MjkzYWUzMGY4N2Zj
MWRhY2I2NzI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI5IFNlcCAy
MDIzIDIyOjUzOjI0ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFRoaXMgcmVnZXggZGVjaWRlcyB3
aGV0aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlvbiBvbiBudW1weSBvcgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuNC4yLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuNC4zLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1udW1weV8yLjQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLW51bXB5XzIuNC4zLmJiCmluZGV4IDhhOTM1MWUzNzEuLjc1MjFhOTNmOTkgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjQuMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi40LjMu
YmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxv
YWQvdiR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1
bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXB5dGhvbi1zeXNyb290LnBhdGNoIFwK
ICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY1OWE2MTA3ZTMxYTgzYzRlMzNm
NzYzOTQyMjc1ZmQyNzhiMjFkMDk1MDk0MDQ0ZWIzNTU2OWU4NmEyMWRkYWUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNDgzYTIwMTIwMmI3MzQ5NWYwMGRiYzgzNzk2YzZhZTYzMTM3YTliZGFkZTA3
NGY3NjQ4YjNlMzI2MTM0MTJkZCIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHVi
LmNvbS9udW1weS9udW1weS9yZWxlYXNlcyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVh
c2VzL3RhZy92Pyg/UDxwdmVyPlxkKyhcLlxkKykrKSQiCi0tIAoyLjQ3LjEKCg==

--===============1532830678063690403==--

