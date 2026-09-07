Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B684AC79FA1
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 05:23:47 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27907.1788758621272344750
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 22:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jQEtAXGz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NQNnPJ3n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a07a5277e4-98dac518-679b-4976-91ab-98999c1ed355-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788758620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E0CvkXUuQQMcidohQhgumabwX80VOgH5kNnX+lMg+Yk=;
	b=jQEtAXGz9bWwl0aBtoAEpZOyU4nTUyeQlntmzMXByYEeY63kwp0gn/hTeHxspNHX
	fqxoy0u3NxCvQOp6fib8qP64zs2hJhzYxMQ/8SoRz8GR+saEE/2ZlhPBbq7BRd1O0fZ
	kB3CC974EWzFAhPCWl40bhyPwZTdO5XTCNUydcdQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788758620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E0CvkXUuQQMcidohQhgumabwX80VOgH5kNnX+lMg+Yk=;
	b=NQNnPJ3ns436sHgezWsrnFlWd8mudJ1UqmbA4a+0UhWditHA9YXPR9B2wKE1t//z
	zE99fZdXBWumhsTe5JzfZHnGUux3l7+UyuJ8mHxhdRc9S1E46rcFBwGrzJGBJpuOG7M
	3ZJmNzN2ccP29rtk8ZYoAgt+zOXskRB1POoBUfjo=
Content-Type: multipart/mixed; boundary="===============1409357017651697192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.5.3 SUCCEEDED
Message-ID: <010101a07a5277e4-98dac518-679b-4976-91ab-98999c1ed355-000000@us-west-2.amazonses.com>
Date: Mon, 7 Sep 2026 05:23:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.07-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 05:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245224

--===============1409357017651697192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.5.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.5.2-2.5.3.patch
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
From 5e8347c5d90f46228671c0e7c8639aa4d3a7e58d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 7 Sep 2026 05:23:36 +0000
Subject: [PATCH] python3-numpy: upgrade 2.5.2 -> 2.5.3

Source: doc/changelog/2.5.3-changelog.rst, doc/source/release/2.5.3-notes.rst

Contributors
============

A total of 9 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

* Charles Harris
* Iason Krommydas
* James Davies +
* Joren Hammudoglu
* Maanas Arora
* Matti Picus
* Nathan Goldbaum
* Shikhar Goel +
* Yeonho Kim +

Pull requests merged
====================

A total of 27 pull requests were merged for this release.

* `#32235 <https://github.com/numpy/numpy/pull/32235>`__: MAINT: Prepare 2.5.x for further development
* `#32289 <https://github.com/numpy/numpy/pull/32289>`__: BUG: raise ValueError when reading into record array with references...
* `#32290 <https://github.com/numpy/numpy/pull/32290>`__: BUG: avoid uninitialized memory access / NULL-pointer deref in...
* `#32291 <https://github.com/numpy/numpy/pull/32291>`__: TYP: fix ``np.random.{get,set}_bit_generator`` implicit re-exports...
* `#32292 <https://github.com/numpy/numpy/pull/32292>`__: BUG: don't assume strides are a multiple of itemsize in stringdtype...
* `#32293 <https://github.com/numpy/numpy/pull/32293>`__: CI: fix ccache CC override, add CXX in mac Conda CI (#32285)
* `#32303 <https://github.com/numpy/numpy/pull/32303>`__: BUG: Fix ref leak in _convert_from_type for custom scalar types...
* `#32304 <https://github.com/numpy/numpy/pull/32304>`__: BUG: fix a number of issues around iterators and StringDType...
* `#32326 <https://github.com/numpy/numpy/pull/32326>`__: TST: avoid allocating huge tuple of arrays in concatenate test...
* `#32338 <https://github.com/numpy/numpy/pull/32338>`__: BUG: avoid possible UB in 'safe' multiplication helpers (#32294)
* `#32339 <https://github.com/numpy/numpy/pull/32339>`__: MAINT: use ``PyObject_`` functions instead of raw ``PyArray_ ones`` (#32331)
* `#32378 <https://github.com/numpy/numpy/pull/32378>`__: BUG: validate UTF-8 and harden StringDType bounds handling (#32296)
* `#32380 <https://github.com/numpy/numpy/pull/32380>`__: BUG: fix two error handling mistakes in stringdtype replace loop...
* `#32381 <https://github.com/numpy/numpy/pull/32381>`__: BUG: fix visibility annotations for functions in StringDType...
* `#32384 <https://github.com/numpy/numpy/pull/32384>`__: MAINT: Update ml_dtypes pin to 8/21/2026.
* `#32385 <https://github.com/numpy/numpy/pull/32385>`__: MAINT: Update numpy/_core/src/umath/svml
* `#32410 <https://github.com/numpy/numpy/pull/32410>`__: MAINT: skip failing cython limited API tests on Cython 3.3.0...
* `#32427 <https://github.com/numpy/numpy/pull/32427>`__: BUG: close duplicated file descriptor if fdopen fails (#32386)
* `#32428 <https://github.com/numpy/numpy/pull/32428>`__: MAINT: add missing space in warning and error messages (#32405)
* `#32430 <https://github.com/numpy/numpy/pull/32430>`__: BUG: fix error handling in StringDType to fixed-width bytes case...
* `#32441 <https://github.com/numpy/numpy/pull/32441>`__: MAINT: Only run nightly BLAS test

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../python/{python3-numpy_2.5.2.bb => python3-numpy_2.5.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.2.bb => python3-numpy_2.5.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.2.bb b/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.5.2.bb
rename to meta/recipes-devtools/python/python3-numpy_2.5.3.bb
index 4406204681..c88b0bf1a2 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
@@ -10,7 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "d482d171c406ae88c5b19cad3b6a1c4c5209f886ab74bc44c2c865c23f52d860"
+SRC_URI[sha256sum] = "df2d5874ff183595a4ba404edd04f6bd9b5505c1d7708573f6a6c17489a67563"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============1409357017651697192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.5.2/numpy-2.5.2.tar.gz file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.5.3/numpy-2.5.3.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.5.2" to "2.5.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.5.2" to "2.5.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 101281136 to 101309008 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.5.2" to "2.5.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.5.2" to "2.5.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.5.2" to "2.5.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.5.2" to "2.5.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/fft -> /usr/src/debug/python3-numpy/2.5.3/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.5.3/numpy/l
 inalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/include -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.5.3/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/linalg -> /usr/src/debug/python3-numpy/2.5.3/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/
 _mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/pythoncapi-compat -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/mt19937 -> /usr/src/d
 ebug/python3-numpy/2.5.3/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/simd -> /usr/src/debug/python3-n
 umpy/2.5.3/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.5.3/num
 py/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-num
 py/2.5.2/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/multiarray -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.5.2/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/npysort
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.5.2" to "2.5.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 25739481 to 25750757 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.5.2" to "2.5.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info
 /licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.5
 .3.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/ran
 dom/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/linalg/lapack_lite
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.5.2" to "2.5.3"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 41578761 to 41645185 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info

--===============1409357017651697192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-numpy-changelog.txt"

Changelog for python3-numpy: 2.5.2 -> 2.5.3
Source: doc/changelog/2.5.3-changelog.rst, doc/source/release/2.5.3-notes.rst

Contributors
============

A total of 9 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

* Charles Harris
* Iason Krommydas
* James Davies +
* Joren Hammudoglu
* Maanas Arora
* Matti Picus
* Nathan Goldbaum
* Shikhar Goel +
* Yeonho Kim +

Pull requests merged
====================

A total of 27 pull requests were merged for this release.

* `#32235 <https://github.com/numpy/numpy/pull/32235>`__: MAINT: Prepare 2.5.x for further development
* `#32289 <https://github.com/numpy/numpy/pull/32289>`__: BUG: raise ValueError when reading into record array with references...
* `#32290 <https://github.com/numpy/numpy/pull/32290>`__: BUG: avoid uninitialized memory access / NULL-pointer deref in...
* `#32291 <https://github.com/numpy/numpy/pull/32291>`__: TYP: fix ``np.random.{get,set}_bit_generator`` implicit re-exports...
* `#32292 <https://github.com/numpy/numpy/pull/32292>`__: BUG: don't assume strides are a multiple of itemsize in stringdtype...
* `#32293 <https://github.com/numpy/numpy/pull/32293>`__: CI: fix ccache CC override, add CXX in mac Conda CI (#32285)
* `#32303 <https://github.com/numpy/numpy/pull/32303>`__: BUG: Fix ref leak in _convert_from_type for custom scalar types...
* `#32304 <https://github.com/numpy/numpy/pull/32304>`__: BUG: fix a number of issues around iterators and StringDType...
* `#32326 <https://github.com/numpy/numpy/pull/32326>`__: TST: avoid allocating huge tuple of arrays in concatenate test...
* `#32338 <https://github.com/numpy/numpy/pull/32338>`__: BUG: avoid possible UB in 'safe' multiplication helpers (#32294)
* `#32339 <https://github.com/numpy/numpy/pull/32339>`__: MAINT: use ``PyObject_`` functions instead of raw ``PyArray_ ones`` (#32331)
* `#32378 <https://github.com/numpy/numpy/pull/32378>`__: BUG: validate UTF-8 and harden StringDType bounds handling (#32296)
* `#32380 <https://github.com/numpy/numpy/pull/32380>`__: BUG: fix two error handling mistakes in stringdtype replace loop...
* `#32381 <https://github.com/numpy/numpy/pull/32381>`__: BUG: fix visibility annotations for functions in StringDType...
* `#32384 <https://github.com/numpy/numpy/pull/32384>`__: MAINT: Update ml_dtypes pin to 8/21/2026.
* `#32385 <https://github.com/numpy/numpy/pull/32385>`__: MAINT: Update numpy/_core/src/umath/svml
* `#32410 <https://github.com/numpy/numpy/pull/32410>`__: MAINT: skip failing cython limited API tests on Cython 3.3.0...
* `#32427 <https://github.com/numpy/numpy/pull/32427>`__: BUG: close duplicated file descriptor if fdopen fails (#32386)
* `#32428 <https://github.com/numpy/numpy/pull/32428>`__: MAINT: add missing space in warning and error messages (#32405)
* `#32430 <https://github.com/numpy/numpy/pull/32430>`__: BUG: fix error handling in StringDType to fixed-width bytes case...
* `#32441 <https://github.com/numpy/numpy/pull/32441>`__: MAINT: Only run nightly BLAS tests on main.
* `#32471 <https://github.com/numpy/numpy/pull/32471>`__: BUG: fix memory leak in StringDType creation error path (#32470)
* `#32477 <https://github.com/numpy/numpy/pull/32477>`__: BUG: fix stale fill_value after ufuncs change MaskedArray dtype...
* `#32478 <https://github.com/numpy/numpy/pull/32478>`__: MAINT: exit deadlock tests quickly on slow hardware (#32466)
* `#32481 <https://github.com/numpy/numpy/pull/32481>`__: BUG: Backport StringDType byteorder fixes
* `#32506 <https://github.com/numpy/numpy/pull/32506>`__: DOC: use static scipy doc site for intershpinx (#32503)
* `#32509 <https://github.com/numpy/numpy/pull/32509>`__: BUG: fix crash in ufunc.resolve_dtypes with a Python scalar type...

.. currentmodule:: numpy

=========================
NumPy 2.5.3 Release Notes
=========================

The NumPy 2.5.3 is a patch release that fixes bugs discovered after the 2.5.2
release. Apart from the usual bug and maintenance work, there are a number of
StringDType related fixes for problems discovered during the ongoing string
work in the main branch.

This release supports Python versions 3.12-3.15

Changes
=======

* Casting a fixed-width byte string array (``np.bytes_``) to ``StringDType``
  now raises ``TypeError`` when the bytes are not valid UTF-8. Previously the
  invalid bytes were stored as-is and later caused undefined behavior in
  string operations.

  (`gh-32296 <https://github.com/numpy/numpy/pull/32296>`__)

* ``MaskedArray._fill_value`` would become stale when ufuncs that change dtype
  left the result holding a fill_value typed for the old dtype. The mismatch
  was silent until something later called ``_check_fill_value``, such as
  ``.view()``, and then a ``TypeError`` would be raised.  Now, when the copied
  fill_value is no longer valid for the new dtype, fall back to the
  default fill_value for that dtype instead of propagating the stale value.
  This may raise a ``ComplexWarning`` if the fill_value is complex and the
  new dtype is real.

  (`gh-32423 <https://github.com/numpy/numpy/pull/32423>`__)

Contributors
============

A total of 9 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

* Charles Harris
* Iason Krommydas
* James Davies +
* Joren Hammudoglu
* Maanas Arora
* Matti Picus
* Nathan Goldbaum
* Shikhar Goel +
* Yeonho Kim +

Pull requests merged
====================

A total of 27 pull requests were merged for this release.

* `#32235 <https://github.com/numpy/numpy/pull/32235>`__: MAINT: Prepare 2.5.x for further development
* `#32289 <https://github.com/numpy/numpy/pull/32289>`__: BUG: raise ValueError when reading into record array with references...
* `#32290 <https://github.com/numpy/numpy/pull/32290>`__: BUG: avoid uninitialized memory access / NULL-pointer deref in...
* `#32291 <https://github.com/numpy/numpy/pull/32291>`__: TYP: fix ``np.random.{get,set}_bit_generator`` implicit re-exports...
* `#32292 <https://github.com/numpy/numpy/pull/32292>`__: BUG: don't assume strides are a multiple of itemsize in stringdtype...
* `#32293 <https://github.com/numpy/numpy/pull/32293>`__: CI: fix ccache CC override, add CXX in mac Conda CI (#32285)
* `#32303 <https://github.com/numpy/numpy/pull/32303>`__: BUG: Fix ref leak in _convert_from_type for custom scalar types...
* `#32304 <https://github.com/numpy/numpy/pull/32304>`__: BUG: fix a number of issues around iterators and StringDType...
* `#32326 <https://github.com/numpy/numpy/pull/32326>`__: TST: avoid allocating huge tuple of arrays in concatenate test...
* `#32338 <https://github.com/numpy/numpy/pull/32338>`__: BUG: avoid possible UB in 'safe' multiplication helpers (#32294)
* `#32339 <https://github.com/numpy/numpy/pull/32339>`__: MAINT: use ``PyObject_`` functions instead of raw ``PyArray_ ones`` (#32331)
* `#32378 <https://github.com/numpy/numpy/pull/32378>`__: BUG: validate UTF-8 and harden StringDType bounds handling (#32296)
* `#32380 <https://github.com/numpy/numpy/pull/32380>`__: BUG: fix two error handling mistakes in stringdtype replace loop...
* `#32381 <https://github.com/numpy/numpy/pull/32381>`__: BUG: fix visibility annotations for functions in StringDType...
* `#32384 <https://github.com/numpy/numpy/pull/32384>`__: MAINT: Update ml_dtypes pin to 8/21/2026.
* `#32385 <https://github.com/numpy/numpy/pull/32385>`__: MAINT: Update numpy/_core/src/umath/svml
* `#32410 <https://github.com/numpy/numpy/pull/32410>`__: MAINT: skip failing cython limited API tests on Cython 3.3.0...
* `#32427 <https://github.com/numpy/numpy/pull/32427>`__: BUG: close duplicated file descriptor if fdopen fails (#32386)
* `#32428 <https://github.com/numpy/numpy/pull/32428>`__: MAINT: add missing space in warning and error messages (#32405)
* `#32430 <https://github.com/numpy/numpy/pull/32430>`__: BUG: fix error handling in StringDType to fixed-width bytes case...
* `#32441 <https://github.com/numpy/numpy/pull/32441>`__: MAINT: Only run nightly BLAS tests on main.
* `#32471 <https://github.com/numpy/numpy/pull/32471>`__: BUG: fix memory leak in StringDType creation error path (#32470)
* `#32477 <https://github.com/numpy/numpy/pull/32477>`__: BUG: fix stale fill_value after ufuncs change MaskedArray dtype...
* `#32478 <https://github.com/numpy/numpy/pull/32478>`__: MAINT: exit deadlock tests quickly on slow hardware (#32466)
* `#32481 <https://github.com/numpy/numpy/pull/32481>`__: BUG: Backport StringDType byteorder fixes
* `#32506 <https://github.com/numpy/numpy/pull/32506>`__: DOC: use static scipy doc site for intershpinx (#32503)
* `#32509 <https://github.com/numpy/numpy/pull/32509>`__: BUG: fix crash in ufunc.resolve_dtypes with a Python scalar type...

--===============1409357017651697192==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.5.2-2.5.3.patch"

RnJvbSA1ZTgzNDdjNWQ5MGY0NjIyODY3MWMwZTdjODYzOWFhNGQzYTdlNThkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgNyBTZXAgMjAyNiAwNToyMzozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMi41LjIgLT4gMi41LjMKClNvdXJjZTogZG9jL2NoYW5nZWxv
Zy8yLjUuMy1jaGFuZ2Vsb2cucnN0LCBkb2Mvc291cmNlL3JlbGVhc2UvMi41LjMtbm90ZXMucnN0
CgpDb250cmlidXRvcnMKPT09PT09PT09PT09CgpBIHRvdGFsIG9mIDkgcGVvcGxlIGNvbnRyaWJ1
dGVkIHRvIHRoaXMgcmVsZWFzZS4gIFBlb3BsZSB3aXRoIGEgIisiIGJ5IHRoZWlyCm5hbWVzIGNv
bnRyaWJ1dGVkIGEgcGF0Y2ggZm9yIHRoZSBmaXJzdCB0aW1lLgoKKiBDaGFybGVzIEhhcnJpcwoq
IElhc29uIEtyb21teWRhcwoqIEphbWVzIERhdmllcyArCiogSm9yZW4gSGFtbXVkb2dsdQoqIE1h
YW5hcyBBcm9yYQoqIE1hdHRpIFBpY3VzCiogTmF0aGFuIEdvbGRiYXVtCiogU2hpa2hhciBHb2Vs
ICsKKiBZZW9uaG8gS2ltICsKClB1bGwgcmVxdWVzdHMgbWVyZ2VkCj09PT09PT09PT09PT09PT09
PT09CgpBIHRvdGFsIG9mIDI3IHB1bGwgcmVxdWVzdHMgd2VyZSBtZXJnZWQgZm9yIHRoaXMgcmVs
ZWFzZS4KCiogYCMzMjIzNSA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzIy
MzU+YF9fOiBNQUlOVDogUHJlcGFyZSAyLjUueCBmb3IgZnVydGhlciBkZXZlbG9wbWVudAoqIGAj
MzIyODkgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMjg5PmBfXzogQlVH
OiByYWlzZSBWYWx1ZUVycm9yIHdoZW4gcmVhZGluZyBpbnRvIHJlY29yZCBhcnJheSB3aXRoIHJl
ZmVyZW5jZXMuLi4KKiBgIzMyMjkwIDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVs
bC8zMjI5MD5gX186IEJVRzogYXZvaWQgdW5pbml0aWFsaXplZCBtZW1vcnkgYWNjZXNzIC8gTlVM
TC1wb2ludGVyIGRlcmVmIGluLi4uCiogYCMzMjI5MSA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5
L251bXB5L3B1bGwvMzIyOTE+YF9fOiBUWVA6IGZpeCBgYG5wLnJhbmRvbS57Z2V0LHNldH1fYml0
X2dlbmVyYXRvcmBgIGltcGxpY2l0IHJlLWV4cG9ydHMuLi4KKiBgIzMyMjkyIDxodHRwczovL2dp
dGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjI5Mj5gX186IEJVRzogZG9uJ3QgYXNzdW1lIHN0
cmlkZXMgYXJlIGEgbXVsdGlwbGUgb2YgaXRlbXNpemUgaW4gc3RyaW5nZHR5cGUuLi4KKiBgIzMy
MjkzIDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjI5Mz5gX186IENJOiBm
aXggY2NhY2hlIENDIG92ZXJyaWRlLCBhZGQgQ1hYIGluIG1hYyBDb25kYSBDSSAoIzMyMjg1KQoq
IGAjMzIzMDMgPGh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzMyMzAzPmBfXzog
QlVHOiBGaXggcmVmIGxlYWsgaW4gX2NvbnZlcnRfZnJvbV90eXBlIGZvciBjdXN0b20gc2NhbGFy
IHR5cGVzLi4uCiogYCMzMjMwNCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwv
MzIzMDQ+YF9fOiBCVUc6IGZpeCBhIG51bWJlciBvZiBpc3N1ZXMgYXJvdW5kIGl0ZXJhdG9ycyBh
bmQgU3RyaW5nRFR5cGUuLi4KKiBgIzMyMzI2IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVt
cHkvcHVsbC8zMjMyNj5gX186IFRTVDogYXZvaWQgYWxsb2NhdGluZyBodWdlIHR1cGxlIG9mIGFy
cmF5cyBpbiBjb25jYXRlbmF0ZSB0ZXN0Li4uCiogYCMzMjMzOCA8aHR0cHM6Ly9naXRodWIuY29t
L251bXB5L251bXB5L3B1bGwvMzIzMzg+YF9fOiBCVUc6IGF2b2lkIHBvc3NpYmxlIFVCIGluICdz
YWZlJyBtdWx0aXBsaWNhdGlvbiBoZWxwZXJzICgjMzIyOTQpCiogYCMzMjMzOSA8aHR0cHM6Ly9n
aXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzIzMzk+YF9fOiBNQUlOVDogdXNlIGBgUHlPYmpl
Y3RfYGAgZnVuY3Rpb25zIGluc3RlYWQgb2YgcmF3IGBgUHlBcnJheV8gb25lc2BgICgjMzIzMzEp
CiogYCMzMjM3OCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzIzNzg+YF9f
OiBCVUc6IHZhbGlkYXRlIFVURi04IGFuZCBoYXJkZW4gU3RyaW5nRFR5cGUgYm91bmRzIGhhbmRs
aW5nICgjMzIyOTYpCiogYCMzMjM4MCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1
bGwvMzIzODA+YF9fOiBCVUc6IGZpeCB0d28gZXJyb3IgaGFuZGxpbmcgbWlzdGFrZXMgaW4gc3Ry
aW5nZHR5cGUgcmVwbGFjZSBsb29wLi4uCiogYCMzMjM4MSA8aHR0cHM6Ly9naXRodWIuY29tL251
bXB5L251bXB5L3B1bGwvMzIzODE+YF9fOiBCVUc6IGZpeCB2aXNpYmlsaXR5IGFubm90YXRpb25z
IGZvciBmdW5jdGlvbnMgaW4gU3RyaW5nRFR5cGUuLi4KKiBgIzMyMzg0IDxodHRwczovL2dpdGh1
Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjM4ND5gX186IE1BSU5UOiBVcGRhdGUgbWxfZHR5cGVz
IHBpbiB0byA4LzIxLzIwMjYuCiogYCMzMjM4NSA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251
bXB5L3B1bGwvMzIzODU+YF9fOiBNQUlOVDogVXBkYXRlIG51bXB5L19jb3JlL3NyYy91bWF0aC9z
dm1sCiogYCMzMjQxMCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMzI0MTA+
YF9fOiBNQUlOVDogc2tpcCBmYWlsaW5nIGN5dGhvbiBsaW1pdGVkIEFQSSB0ZXN0cyBvbiBDeXRo
b24gMy4zLjAuLi4KKiBgIzMyNDI3IDxodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVs
bC8zMjQyNz5gX186IEJVRzogY2xvc2UgZHVwbGljYXRlZCBmaWxlIGRlc2NyaXB0b3IgaWYgZmRv
cGVuIGZhaWxzICgjMzIzODYpCiogYCMzMjQyOCA8aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251
bXB5L3B1bGwvMzI0Mjg+YF9fOiBNQUlOVDogYWRkIG1pc3Npbmcgc3BhY2UgaW4gd2FybmluZyBh
bmQgZXJyb3IgbWVzc2FnZXMgKCMzMjQwNSkKKiBgIzMyNDMwIDxodHRwczovL2dpdGh1Yi5jb20v
bnVtcHkvbnVtcHkvcHVsbC8zMjQzMD5gX186IEJVRzogZml4IGVycm9yIGhhbmRsaW5nIGluIFN0
cmluZ0RUeXBlIHRvIGZpeGVkLXdpZHRoIGJ5dGVzIGNhc2UuLi4KKiBgIzMyNDQxIDxodHRwczov
L2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8zMjQ0MT5gX186IE1BSU5UOiBPbmx5IHJ1biBu
aWdodGx5IEJMQVMgdGVzdAoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAw
IGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNo
bWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9weXRob24ve3B5dGhvbjMtbnVtcHlfMi41
LjIuYmIgPT4gcHl0aG9uMy1udW1weV8yLjUuMy5iYn0gICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24ve3B5dGhvbjMtbnVtcHlfMi41LjIuYmIgPT4gcHl0aG9uMy1udW1weV8yLjUu
My5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbnVtcHlfMi41LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbnVtcHlfMi41LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuNS4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi41LjMuYmIKaW5kZXgg
NDQwNjIwNDY4MS4uYzg4YjBiZjFhMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLW51bXB5XzIuNS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1udW1weV8yLjUuMy5iYgpAQCAtMTAsNyArMTAsNyBAQCBTUkNOQU1F
ID0gIm51bXB5IgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9
LyR7U1JDTkFNRX0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBc
CiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNDgyZDE3MWM0MDZhZTg4YzVi
MTljYWQzYjZhMWM0YzUyMDlmODg2YWI3NGJjNDRjMmM4NjVjMjNmNTJkODYwIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImRmMmQ1ODc0ZmYxODM1OTVhNGJhNDA0ZWRkMDRmNmJkOWI1NTA1YzFkNzcw
ODU3M2Y2YTZjMTc0ODlhNjc1NjMiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1
Yi5jb20vbnVtcHkvbnVtcHkvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxl
YXNlcy90YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgotLSAKMi40Ny4xCgo=

--===============1409357017651697192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.5.
 3.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/sr
 c/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/num
 py/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/pcg64
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.5.2.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info

--===============1409357017651697192==--

