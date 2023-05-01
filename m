Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76274CA9EA2
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.107897.1682976351524754275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LDxSfFtZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9352e19-58a20536-277b-4b49-8d9c-7d707fc7eb69-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R4Iw26kx+9ZAX+Msce3ZT5E1ScvSHeXO2H4NVzYuK68=;
	b=LDxSfFtZE7JpvQlgPCveaQAynw5DdJTW0DA9vob0r4nW2JVfbmG6Se/9G0EbIzJw
	40wisZoGXAQdQP6H0SmAwf2cXHl9zhV5NlAUE45scfl+45SgeBg79ZsRddhj+yAVbKr
	HWsssuQ3ttUhLOXEBoY/24vYBZ7w3QpGtIQCEZpU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R4Iw26kx+9ZAX+Msce3ZT5E1ScvSHeXO2H4NVzYuK68=;
	b=bQ8/fJie19OqUZnyuPqjgiUdhTXxVg/jITnHTViUOeNHa5XNlr3edZTYwKEx7/Zj
	8t+xjL5E4zI4fTYxAG98Kr1ZRgr2BRFIPTh11gwEgPC2OBZ8AOom7XNW6eZKHk5W5oC
	BqPpcfV78Yq+spmwQTMFXItj5iZuBTjfVlz06vbA=
Content-Type: multipart/mixed; boundary="===============3502277856155047942=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 4de9836bc8c36cddead5e9efc6beff0692118b1e
 SUCCEEDED
Message-ID: <01010187d9352e19-58a20536-277b-4b49-8d9c-7d707fc7eb69-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180694

--===============3502277856155047942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *4de9836bc8c36cddead5e9efc6beff0692118b1e* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
--===============3502277856155047942==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBmNWY2OTFjNDM0ZDA5MzAwN2UzODk1ZjMwMGIyYmNiYjc4OWEwYTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMDo0MzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCA4N2I2ZmFjMDI0Li44N2E5N2VmMzAxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbiIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgot
U1JDUkVWID0gIjVhNDkxYzVhZDMzM2VmMzRjMWU3NzEzZjkyMGY1MWNiYjIwNWFmNjAiCitTUkNS
RVYgPSAiNGRlOTgzNmJjOGMzNmNkZGVhZDVlOWVmYzZiZWZmMDY5MjExOGIxZSIKIFBFID0gIjIi
CiBQViA9ICIwLjArZ2l0JHtTUkNQVn0iCiAKLS0gCjIuMzkuMgoK

--===============3502277856155047942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:198d26f84faeeb810979064406bc3296e166e6e6"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 203 Local 196 Mirrors 0 Missed 7 Current 393 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1953 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_fetch: Succeeded
NOTE: Running task 2091 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2092 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_unpack: Succeeded
NOTE: Running task 2093 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_patch: Succeeded
NOTE: Running task 2094 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2095 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2096 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2097 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_configure: Succeeded
NOTE: Running task 2098 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_compile: Succeeded
NOTE: Running task 2099 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_install: Succeeded
NOTE: Running task 2100 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2101 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_package: Succeeded
NOTE: Running task 2102 of 2105 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2102 tasks of which 2089 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+4de9836bc8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+4de9836bc8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+4de9836bc8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+4de9836bc8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+4de9836bc8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+4de9836bc8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+4de9836bc8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+4de9836bc8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/temp/log.do_packagedata.736274
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============3502277856155047942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+4de9836bc8"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+5a491c5ad3 [default] to 0.0+gitAUTOINC+4de9836bc8 [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+4de9836bc8"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14299436 to 15366144 (+7%)
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+4de9836bc8"
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+5a491c5ad3-r0'])", added "puzzles (['= 2:0.0+git0+4de9836bc8-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+4de9836bc8"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+4de9836bc8"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5
 ad3-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitA
 UTOINC+5a491c5ad3-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tents.c /usr/src/debug/puzz
 les/2_0.0+gitAUTOINC+5a491c5ad3-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/cube.c /usr/src/debug/puzzles/2_
 0.0+gitAUTOINC+5a491c5ad3-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/no-icon.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/malloc.
 c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de983
 6bc8-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOI
 NC+4de9836bc8-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUT
 OINC+4de9836bc8-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/matching.c /usr/src/debug/puzzles
 /2_0.0+gitAUTOINC+4de9836bc8-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+4de9836bc8-r0/mines.c"
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+4de9836bc8"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3542339 to 3688595 (+4%)
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+4de9836bc8"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+5a491c5ad3-r0'])", added "puzzles-dev (['= 2:0.0+git0+4de9836bc8-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+4de9836bc8"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7028162 to 7638470 (+9%)

--===============3502277856155047942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+5a491c5ad3-r0'])", added "puzzles (['= 2:0.0+git0+4de9836bc8-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+5a491c5ad3-r0'])", added "puzzles-dev (['= 2:0.0+git0+4de9836bc8-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+4de9836bc8

--===============3502277856155047942==--

