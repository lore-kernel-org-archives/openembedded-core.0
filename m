Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83396C6FD2C
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.10762.1663251513350381207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TD+Ze4WK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101834183fe07-a663380f-2725-4b83-a6d3-fa8089993b33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eJlb3GkFscWptRwwaBUKhva6NnDa4B4mETTsxOrXNrA=;
	b=TD+Ze4WKc8GoHwojaT7vNiQxiFRqW9CeKRFYMN+1j+q+IPvpwltOPbTG+TtoVH0y
	TCBzRU+QFi3BTvqrNnqRy3hQxDEkaIdY6enopllAO2ozSS/L9VFYGHF1aHyghPzjBna
	9dpoK92b9yMJ4Z9E2zNCJFe8ZBtqnJkakTP600/k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eJlb3GkFscWptRwwaBUKhva6NnDa4B4mETTsxOrXNrA=;
	b=JCqx7o+/dVSn4FTPoiuRyvqdTKavy/NIk9aO85mPKQczsyQx4MEu2VkU1MF4S4sN
	H54kD89KQACOGo5fMupEfX7r/swBV1U/30jKtVnAUAxfY3k/NO1Pg2QoN9qhbfawKSO
	/WKsdFAWTuVlcTZ0x63UBA/BG6uxSF5bap2M26Vo=
Content-Type: multipart/mixed; boundary="===============6175210594254075518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.23.3 SUCCEEDED
Message-ID: 
 <010101834183fe07-a663380f-2725-4b83-a6d3-fa8089993b33-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170726

--===============6175210594254075518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.23.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.23.2-1.23.3.patch
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
--===============6175210594254075518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.10/site-packages/numpy-1.23.2.dist-info moved to /usr/lib/python3.10/site-packages/numpy-1.23.3.dist-info

--===============6175210594254075518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.23.2 [default] to 1.23.3 [default]
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.23.2/numpy-1.23.2.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch" to "https://github.com/numpy/numpy/releases/download/v1.23.3/numpy-1.23.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch"
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.23.2" to "1.23.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.23.2 [default] to 1.23.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 37051652 to 37166628 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.23.2" to "1.23.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.23.2 [default] to 1.23.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.23.2" to "1.23.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.23.2 [default] to 1.23.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.23.2" to "1.23.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.23.2 [default] to 1.23.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.23.2" to "1.23.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.23.2 [default] to 1.23.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.23.2" to "1.23.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.23.2 [default] to 1.23.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 18710220 to 18712977 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/common/simd -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/linalg -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/umath -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/umath, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/random/src/philox -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/random/src/philox, directory renamed /usr/src/debug/pytho
 n3-numpy/1.23.2-r0/numpy/core/src/npymath -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npymath, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/include/numpy -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/include/numpy, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/random -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/random, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/multiarray -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/common -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/com
 mon, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/random/include -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/_simd -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/_simd, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/common/sim
 d/avx2 -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/build/src.linux-x86_64-3.10/numpy/core/include/numpy -> /usr/src/debug/python3-numpy/1.23.3-r0/build/src.linux-x86_64-3.10/numpy/core/include/numpy, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/include/numpy/random -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/common/simd/sse -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/common/dlpack -> /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/1.23.2-r0/numpy/fft -> /usr/
 src/debug/python3-numpy/1.23.3-r0/numpy/fft, removed "/usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/heapsort.cpp /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/binsearch.cpp /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/mergesort.cpp /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/x86-qsort.h /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/x86-qsort.dispatch.cpp /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/radixsort.cpp /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/timsort.cpp /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/quicksort.cpp /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/npysort_common.h /usr/src/debug/python3-numpy/1.23.2-r0/numpy/core/src/npysort/selection.cpp", added "/usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/binsearch.cpp /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/npysort_heapsort.h /usr/src/d
 ebug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/x86-qsort.h /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/heapsort.cpp /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/timsort.cpp /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/mergesort.cpp /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/x86-qsort.dispatch.cpp /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/selection.cpp /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/radixsort.cpp /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/quicksort.cpp /usr/src/debug/python3-numpy/1.23.3-r0/numpy/core/src/npysort/npysort_common.h"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.23.2" to "1.23.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.23.2 [default] to 1.23.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 260622 to 260610 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.23.2" to "1.23.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.23.2 [default] to 1.23.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 34225888 to 34270534 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.23.2" to "1.23.3"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.10/site-packages/numpy-1.23.2.dist-info moved to /usr/lib/python3.10/site-packages/numpy-1.23.3.dist-info

--===============6175210594254075518==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.23.2-1.23.3.patch"

RnJvbSA4OTAxMTRlNTBlMzRmYTUyNGEyYzNhZTRkNzcwMzNjMzdmMzY0NDNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTA6MjU6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDEuMjMuMiAtPiAxLjIzLjMKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1udW1weV8xLjIzLjIuYmIgPT4gcHl0aG9uMy1udW1weV8xLjIzLjMuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1udW1weV8xLjIzLjIuYmIgPT4g
cHl0aG9uMy1udW1weV8xLjIzLjMuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjMuMi5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjIzLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
XzEuMjMuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzEuMjMuMy5iYgppbmRleCA5NjBkY2Y5NDEwLi4xZTU5MWMyNjBmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yMy4yLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjIzLjMuYmIK
QEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vJHtTUkNOQU1F
fS8ke1NSQ05BTUV9L3JlbGVhc2VzL2Rvd25sb2FkL3Yke1BWfS8ke1MKICAgICAgICAgICAgZmls
ZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWdlbmVyYXRlX3VtYXRoLnB5
LWRvLW5vdC13cml0ZS1mdWxsLXBhdGgtdG8tb3V0cHV0LWYucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjc4ZDAwZTQ4MjYxZmJiZDA0YWEwZDc0MjdjZjc4ZDE4
NDAxZWUwYWJkODljNzU1OWJiZjQyMmU1YjFjN2QwMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1
MWJmNDljMGNkMWQ1MmJlMGEyNDBhYTY2ZjM0NThhZmM0Yjk1ZDg5OTNkMmQwNGYwZDkxZmE2MGMx
MGFmNmNkIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL251bXB5
L251bXB5L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwu
XGQrKSspXC50YXIiCi0tIAoyLjMxLjEKCg==

--===============6175210594254075518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1663 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 4 Mirrors 0 Missed 12 Current 348 (25% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 883 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_fetch)
NOTE: Running task 915 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1345 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1346 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_unpack)
NOTE: Running task 1347 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1348 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 1350 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_patch)
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1352 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Succeeded
NOTE: Running task 1353 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1354 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1355 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic unihash changed to 9ef3006917f6a5a19ddbcc2a012504458b848e2893e4299de67455a0fb3c6d63
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1356 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: Running task 1358 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: Running task 1360 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_compile)
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1365 tasks of which 1342 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.490614
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============6175210594254075518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 5 Mirrors 0 Missed 12 Current 347 (29% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 349 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_setscene)
NOTE: Running task 746 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_fetch)
NOTE: Running task 767 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 975 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: Running task 977 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Succeeded
NOTE: Running task 979 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 980 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic unihash changed to 9ef3006917f6a5a19ddbcc2a012504458b848e2893e4299de67455a0fb3c6d63
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1137 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1164 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1354 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1355 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: Running task 1356 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: Running task 1358 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_compile)
NOTE: Running task 1360 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1365 tasks of which 1342 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.496107
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============6175210594254075518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 5 Mirrors 0 Missed 12 Current 347 (29% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 349 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_setscene)
NOTE: Running task 746 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_fetch)
NOTE: Running task 767 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_unpack)
NOTE: Running task 975 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: Running task 977 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Succeeded
NOTE: Running task 979 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 980 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic unihash changed to 9ef3006917f6a5a19ddbcc2a012504458b848e2893e4299de67455a0fb3c6d63
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1137 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1164 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1353 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1355 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure)
NOTE: Running task 1356 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure_ptest_base)
NOTE: Running task 1358 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_compile)
NOTE: Running task 1360 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1365 tasks of which 1342 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.501137
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============6175210594254075518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 5 Mirrors 0 Missed 12 Current 347 (29% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 349 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_setscene)
NOTE: Running task 746 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_fetch)
NOTE: Running task 767 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_unpack)
NOTE: Running task 975 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: Running task 977 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Succeeded
NOTE: Running task 979 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 980 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic unihash changed to 9ef3006917f6a5a19ddbcc2a012504458b848e2893e4299de67455a0fb3c6d63
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1137 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1164 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1354 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1355 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure)
NOTE: Running task 1356 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure_ptest_base)
NOTE: Running task 1358 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_compile)
NOTE: Running task 1360 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1365 tasks of which 1342 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.506076
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============6175210594254075518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 33 recipes from the core2-32 sysroot...done.
Removing 57 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f852a2bef6c1ad017be95acbbc3c01d164efb1e1"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 200 Local 188 Mirrors 0 Missed 12 Current 160 (94% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 173 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 174 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 175 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 176 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 522 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_fetch)
NOTE: Running task 536 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: Running task 596 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_unpack)
NOTE: Running task 597 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 179 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 598 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 195 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 230 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: Running task 659 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.23.3-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running task 664 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 242 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_patch: Succeeded
NOTE: Running task 685 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 686 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 258 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 261 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_populate_lic: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_populate_lic unihash changed to 9ef3006917f6a5a19ddbcc2a012504458b848e2893e4299de67455a0fb3c6d63
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 293 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 341 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 348 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 357 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1130 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1155 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1338 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1340 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure)
NOTE: Running task 1341 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1342 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_configure_ptest_base)
NOTE: Running task 1343 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1344 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.3.bb:do_compile)
NOTE: Running task 1345 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1346 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1347 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1348 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1349 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1350 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.23.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1350 tasks of which 1327 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.5-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.515712
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============6175210594254075518==--

