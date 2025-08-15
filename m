Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4370BCA0FED
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11332.1755263225403276004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Vnx6kejQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CWhVH9uT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010198add7625b-2e75e1f7-6d97-4e9d-9312-ad1cbadd8164-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263230;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Em6DIxHkVn/dr+HNAGCQ24I+wzY55shWja02l7rJn4Q=;
	b=Vnx6kejQSbwD2uJRx+fHlVU3spW7kzb58EhTItAVgqCteVdWdZVvtCQjkW1XVgMH
	I5tLjxtz9PkEard/Lmox1mAxTkiXCPA/k0Sv9wAiW4sxxr+pl7L1e2B/KvxigieAYnq
	N6Ebl1L1tzGpSvtYaX3ocHei/T/orwpuf5tfPmwk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263230;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Em6DIxHkVn/dr+HNAGCQ24I+wzY55shWja02l7rJn4Q=;
	b=CWhVH9uTgE7AtrroqEerNmxphnuWusxHWwFr6UYj/gLPf8GzH/Q8ElpADHETKXpY
	sIKzOXBHyYJjmdX3yNcz5PHrKUH63BmDnm5Q4edxGG00slcWSh7CbEQ0D09K06+sNvZ
	891fRl+0gfuS5yXI2IpvUIG31esaagi6Tase0QhI=
Content-Type: multipart/mixed; boundary="===============6452324732042640198=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.35 SUCCEEDED
Message-ID: <01010198add7625b-2e75e1f7-6d97-4e9d-9312-ad1cbadd8164-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221925

--===============6452324732042640198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.35* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.34-0.7.35.patch
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
From c495cf879a2cbaa48817cf5c71509afff521ba16 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 10:22:10 +0000
Subject: [PATCH] libsolv: upgrade 0.7.34 -> 0.7.35

---
 .../libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch | 2 +-
 .../libsolv/{libsolv_0.7.34.bb => libsolv_0.7.35.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.34.bb => libsolv_0.7.35.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
index d6e983dec8..9fd3203e8e 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
@@ -1,4 +1,4 @@
-From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001
+From 29df09773dbf07d760a6b8f5bfca6e3bd32c6fa2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Oct 2021 22:28:45 -0700
 Subject: [PATCH] utils: Conside musl when wrapping qsort_r
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.34.bb b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.34.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.35.bb
index 7e2bd686d4..ec74308bb5 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.34.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "262e8efa0239a78770910fde1579158725cc6ffa"
+SRCREV = "fb4b4340d46108cb365113e432642d6024886c7a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============6452324732042640198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsolv: SRC_URI changed from "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.34 file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch" to "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.35 file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch"
packages/core2-64-poky-linux/libsolv: PV changed from "0.7.34" to "0.7.35"
packages/core2-64-poky-linux/libsolv: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.34" to "0.7.35"
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2875000 to 2887856 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.34" to "0.7.35"
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 130401 to 130595 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.34" to "0.7.35"
packages/core2-64-poky-linux/libsolv/libsolv-doc: PKGSIZE changed from 299491 to 300175 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.34" to "0.7.35"
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolv-src: PV changed from "0.7.34" to "0.7.35"
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1661094 to 1665321 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-src: FILELIST: directory renamed /usr/src/debug/libsolv/0.7.34/tools -> /usr/src/debug/libsolv/0.7.35/tools, directory renamed /usr/src/debug/libsolv/0.7.34/ext -> /usr/src/debug/libsolv/0.7.35/ext, removed "/usr/src/debug/libsolv/0.7.34/src/order.c /usr/src/debug/libsolv/0.7.34/src/queue.c /usr/src/debug/libsolv/0.7.34/src/rules.c /usr/src/debug/libsolv/0.7.34/src/queue.h /usr/src/debug/libsolv/0.7.34/src/rules.h /usr/src/debug/libsolv/0.7.34/src/solver_util.c /usr/src/debug/libsolv/0.7.34/src/pooltypes.h /usr/src/debug/libsolv/0.7.34/src/cplxdeps.c /usr/src/debug/libsolv/0.7.34/src/decision.c /usr/src/debug/libsolv/0.7.34/src/repo.c /usr/src/debug/libsolv/0.7.34/src/dirpool.h /usr/src/debug/libsolv/0.7.34/src/strpool.h /usr/src/debug/libsolv/0.7.34/src/util.h /usr/src/debug/libsolv/0.7.34/src/repo.h /usr/src/debug/libsolv/0.7.34/src/cplxdeps.h /usr/src/debug/libsolv/0.7.34/src/diskusage.c /usr/src/debug/libsolv/0.7.34/src/dirpool.c /usr/
 src/debug/libsolv/0.7.34/src/hash.h /usr/src/debug/libsolv/0.7.34/src/filelistfilter.c /usr/src/debug/libsolv/0.7.34/src/strpool.c /usr/src/debug/libsolv/0.7.34/src/sha2.c /usr/src/debug/libsolv/0.7.34/src/util.c /usr/src/debug/libsolv/0.7.34/src/bitmap.h /usr/src/debug/libsolv/0.7.34/src/chksum.h /usr/src/debug/libsolv/0.7.34/src/apk.h /usr/src/debug/libsolv/0.7.34/src/policy.h /usr/src/debug/libsolv/0.7.34/src/poolid.h /usr/src/debug/libsolv/0.7.34/src/bitmap.c /usr/src/debug/libsolv/0.7.34/src/chksum.c /usr/src/debug/libsolv/0.7.34/src/policy.c /usr/src/debug/libsolv/0.7.34/src/poolid.c /usr/src/debug/libsolv/0.7.34/src/sha2.h /usr/src/debug/libsolv/0.7.34/src/solver.c /usr/src/debug/libsolv/0.7.34/src/apk.c /usr/src/debug/libsolv/0.7.34/src/solverdebug.c /usr/src/debug/libsolv/0.7.34/src/solverdebug.h /usr/src/debug/libsolv/0.7.34/src/solvversion.c /usr/src/debug/libsolv/0.7.34/src/problems.c /usr/src/debug/libsolv/0.7.34/src/repo_solv.c /usr/src/debug/libsolv/0.7.34/src/problem
 s.h /usr/src/debug/libsolv/0.7.34/src/suse.c /usr/src/debug/libsolv/0.7.34/src/repo_solv.h /usr/src/debug/libsolv/0.7.34/src/md5.c /usr/src/debug/libsolv/0.7.34/src/fileprovides.c /usr/src/debug/libsolv/0.7.34/src/solvable.c /usr/src/debug/libsolv/0.7.34/src/pool.h /usr/src/debug/libsolv/0.7.34/src/repodata.h /usr/src/debug/libsolv/0.7.34/src/selection.h /usr/src/debug/libsolv/0.7.34/src/solvable.h /usr/src/debug/libsolv/0.7.34/src/solver_private.h /usr/src/debug/libsolv/0.7.34/src/md5.h /usr/src/debug/libsolv/0.7.34/src/selection.c /usr/src/debug/libsolv/0.7.34/src/knownid.h /usr/src/debug/libsolv/0.7.34/src/pool.c /usr/src/debug/libsolv/0.7.34/src/repodata.c /usr/src/debug/libsolv/0.7.34/src/transaction.c /usr/src/debug/libsolv/0.7.34/src/repopage.h /usr/src/debug/libsolv/0.7.34/src/evr.c /usr/src/debug/libsolv/0.7.34/src/solver.h /usr/src/debug/libsolv/0.7.34/src/transaction.h /usr/src/debug/libsolv/0.7.34/src/repopage.c /usr/src/debug/libsolv/0.7.34/src/dataiterator.h /usr/src/d
 ebug/libsolv/0.7.34/src/userinstalled.c /usr/src/debug/libsolv/0.7.34/src/poolarch.c /usr/src/debug/libsolv/0.7.34/src/solvversion.h /usr/src/debug/libsolv/0.7.34/src/poolvendor.h /usr/src/debug/libsolv/0.7.34/src/poolarch.h /usr/src/debug/libsolv/0.7.34/src/cleandeps.c /usr/src/debug/libsolv/0.7.34/src/poolvendor.c /usr/src/debug/libsolv/0.7.34/src/repo_write.h /usr/src/debug/libsolv/0.7.34/src/evr.h /usr/src/debug/libsolv/0.7.34/src/repopack.h /usr/src/debug/libsolv/0.7.34/src/sha1.c /usr/src/debug/libsolv/0.7.34/src/repo_write.c /usr/src/debug/libsolv/0.7.34/src/sha1.h", added "/usr/src/debug/libsolv/0.7.35/src/util.h /usr/src/debug/libsolv/0.7.35/src/util.c /usr/src/debug/libsolv/0.7.35/src/fileprovides.c /usr/src/debug/libsolv/0.7.35/src/knownid.h /usr/src/debug/libsolv/0.7.35/src/cleandeps.c /usr/src/debug/libsolv/0.7.35/src/evr.h /usr/src/debug/libsolv/0.7.35/src/evr.c /usr/src/debug/libsolv/0.7.35/src/repo.c /usr/src/debug/libsolv/0.7.35/src/dirpool.h /usr/src/debug/libsolv/
 0.7.35/src/strpool.h /usr/src/debug/libsolv/0.7.35/src/repo.h /usr/src/debug/libsolv/0.7.35/src/dirpool.c /usr/src/debug/libsolv/0.7.35/src/strpool.c /usr/src/debug/libsolv/0.7.35/src/solvversion.h /usr/src/debug/libsolv/0.7.35/src/solverdebug.h /usr/src/debug/libsolv/0.7.35/src/solvversion.c /usr/src/debug/libsolv/0.7.35/src/solverdebug.c /usr/src/debug/libsolv/0.7.35/src/problems.c /usr/src/debug/libsolv/0.7.35/src/problems.h /usr/src/debug/libsolv/0.7.35/src/md5.c /usr/src/debug/libsolv/0.7.35/src/repodata.h /usr/src/debug/libsolv/0.7.35/src/selection.h /usr/src/debug/libsolv/0.7.35/src/md5.h /usr/src/debug/libsolv/0.7.35/src/selection.c /usr/src/debug/libsolv/0.7.35/src/repodata.c /usr/src/debug/libsolv/0.7.35/src/transaction.c /usr/src/debug/libsolv/0.7.35/src/transaction.h /usr/src/debug/libsolv/0.7.35/src/dataiterator.h /usr/src/debug/libsolv/0.7.35/src/userinstalled.c /usr/src/debug/libsolv/0.7.35/src/poolarch.c /usr/src/debug/libsolv/0.7.35/src/poolarch.h /usr/src/debug/lib
 solv/0.7.35/src/repo_write.h /usr/src/debug/libsolv/0.7.35/src/repo_write.c /usr/src/debug/libsolv/0.7.35/src/solver_util.c /usr/src/debug/libsolv/0.7.35/src/diskusage.c /usr/src/debug/libsolv/0.7.35/src/hash.h /usr/src/debug/libsolv/0.7.35/src/filelistfilter.c /usr/src/debug/libsolv/0.7.35/src/sha2.c /usr/src/debug/libsolv/0.7.35/src/bitmap.h /usr/src/debug/libsolv/0.7.35/src/chksum.h /usr/src/debug/libsolv/0.7.35/src/apk.h /usr/src/debug/libsolv/0.7.35/src/policy.h /usr/src/debug/libsolv/0.7.35/src/poolid.h /usr/src/debug/libsolv/0.7.35/src/bitmap.c /usr/src/debug/libsolv/0.7.35/src/chksum.c /usr/src/debug/libsolv/0.7.35/src/policy.c /usr/src/debug/libsolv/0.7.35/src/poolid.c /usr/src/debug/libsolv/0.7.35/src/sha2.h /usr/src/debug/libsolv/0.7.35/src/solver.c /usr/src/debug/libsolv/0.7.35/src/apk.c /usr/src/debug/libsolv/0.7.35/src/solver.h /usr/src/debug/libsolv/0.7.35/src/repopack.h /usr/src/debug/libsolv/0.7.35/src/order.c /usr/src/debug/libsolv/0.7.35/src/queue.c /usr/src/debug
 /libsolv/0.7.35/src/rules.c /usr/src/debug/libsolv/0.7.35/src/queue.h /usr/src/debug/libsolv/0.7.35/src/rules.h /usr/src/debug/libsolv/0.7.35/src/pooltypes.h /usr/src/debug/libsolv/0.7.35/src/cplxdeps.c /usr/src/debug/libsolv/0.7.35/src/decision.c /usr/src/debug/libsolv/0.7.35/src/cplxdeps.h /usr/src/debug/libsolv/0.7.35/src/repo_solv.c /usr/src/debug/libsolv/0.7.35/src/pooldep.c /usr/src/debug/libsolv/0.7.35/src/suse.c /usr/src/debug/libsolv/0.7.35/src/repo_solv.h /usr/src/debug/libsolv/0.7.35/src/solvable.c /usr/src/debug/libsolv/0.7.35/src/pool.h /usr/src/debug/libsolv/0.7.35/src/solvable.h /usr/src/debug/libsolv/0.7.35/src/solver_private.h /usr/src/debug/libsolv/0.7.35/src/pool.c /usr/src/debug/libsolv/0.7.35/src/repopage.h /usr/src/debug/libsolv/0.7.35/src/poolwhatprovides.c /usr/src/debug/libsolv/0.7.35/src/repopage.c /usr/src/debug/libsolv/0.7.35/src/poolvendor.h /usr/src/debug/libsolv/0.7.35/src/poolvendor.c /usr/src/debug/libsolv/0.7.35/src/sha1.c /usr/src/debug/libsolv/0.7
 .35/src/sha1.h"
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.34" to "0.7.35"
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PKGSIZE changed from 4384502 to 4423354 (+1%)
packages/core2-64-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.34" to "0.7.35"
packages/core2-64-poky-linux/libsolv/libsolv: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolv: PV changed from "0.7.34" to "0.7.35"
packages/core2-64-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/core2-64-poky-linux/libsolv/libsolvext: PV changed from "0.7.34" to "0.7.35"

--===============6452324732042640198==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.34-0.7.35.patch"

RnJvbSBjNDk1Y2Y4NzlhMmNiYWE0ODgxN2NmNWM3MTUwOWFmZmY1MjFiYTE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTA6MjI6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb2x2OiB1cGdyYWRlIDAuNy4zNCAtPiAwLjcuMzUKCi0tLQogLi4uL2xpYnNvbHYvMDAwMS11
dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBhdGNoIHwgMiArLQogLi4u
L2xpYnNvbHYve2xpYnNvbHZfMC43LjM0LmJiID0+IGxpYnNvbHZfMC43LjM1LmJifSAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYve2xpYnNvbHZfMC43LjM0
LmJiID0+IGxpYnNvbHZfMC43LjM1LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHYvMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13
cmFwcGluZy1xc29ydF9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gK
aW5kZXggZDZlOTgzZGVjOC4uOWZkMzIwM2U4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBw
aW5nLXFzb3J0X3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGRhOTliZjA5ZTgzNDY5NjEyZTJjODIxNjk2MDI1YTRlNTkx
YmI5NWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI5ZGYwOTc3M2RiZjA3ZDc2MGE2
YjhmNWJmY2E2ZTNiZDMyYzZmYTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyOCBPY3QgMjAyMSAyMjoyODo0
NSAtMDcwMAogU3ViamVjdDogW1BBVENIXSB1dGlsczogQ29uc2lkZSBtdXNsIHdoZW4gd3JhcHBp
bmcgcXNvcnRfcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdl8wLjcuMzQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAu
Ny4zNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMzUuYmIKaW5kZXggN2UyYmQ2ODZkNC4uZWM3NDMw
OGJiNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8w
LjcuMzQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcu
MzUuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL29wZW5T
VVNFL2xpYnNvbHYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHM7dGEKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBpbmctcXNvcnRfci5w
YXRjaCBcCiAiCiAKLVNSQ1JFViA9ICIyNjJlOGVmYTAyMzlhNzg3NzA5MTBmZGUxNTc5MTU4NzI1
Y2M2ZmZhIgorU1JDUkVWID0gImZiNGI0MzQwZDQ2MTA4Y2IzNjUxMTNlNDMyNjQyZDYwMjQ4ODZj
N2EiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykr
KSIKIAotLSAKMi40Ny4xCgo=

--===============6452324732042640198==--

