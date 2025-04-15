Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D1FC369D6
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:05 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.20163.1744723971422604722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WiEaqe5a;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rOXWCg45;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019639a73e55-8cda2259-2370-453c-be72-859068fbacd3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723984;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3d1AczNvbAcDXrboKCEYWIVJqVhZJS7hriTLXi025cc=;
	b=WiEaqe5aAQ5WXn6IBp1lOJNWhxsYt6+/fmsZ/2lKs8mVxDkd6hQ9699tDcPJCsRo
	gnNG24H1uGtOOIML7NcZfO+D6AvwEyCiR/+giK6vgOviAHF4M1fR1IkejT+6xYGzCfc
	qhSDVi9+1BkYhHUs1GXVFde3JIDsHz2oFrwk2jpg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723984;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3d1AczNvbAcDXrboKCEYWIVJqVhZJS7hriTLXi025cc=;
	b=rOXWCg45ExZix67954iP1gyAlBpurZY13k43fcxREtyZ4DvbqxRtn0yZ63RP9y+z
	4JCHgYUSJW5/PAHLumJkjT797MEqt2zKTPNKTGSLxd91vE501E2uLs59o3o0dNA2YRO
	+RlvpqbeYeutcVjXrnylUPMJ+9bVWIUtjlx3LpOE=
Content-Type: multipart/mixed; boundary="===============2919375472579206987=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.32 SUCCEEDED
Message-ID: <0101019639a73e55-8cda2259-2370-453c-be72-859068fbacd3-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214904

--===============2919375472579206987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.31-0.7.32.patch
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
From c9b0014fc2174b290ea0748936ba9447829b700d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 08:59:20 +0000
Subject: [PATCH] libsolv: upgrade 0.7.31 -> 0.7.32

---
 .../libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch | 2 +-
 .../libsolv/{libsolv_0.7.31.bb => libsolv_0.7.32.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.31.bb => libsolv_0.7.32.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
index d6e983dec8..2bf2e151b3 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
@@ -1,4 +1,4 @@
-From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001
+From 954124ae14c5e4d678cd3003d6447fe6251846d7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Oct 2021 22:28:45 -0700
 Subject: [PATCH] utils: Conside musl when wrapping qsort_r
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.31.bb b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.31.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.32.bb
index b395ff972d..419036458a 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.31.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "95aef5cc57d0f51782e55b6903b30ec93afbfa15"
+SRCREV = "95f64952e3270deb6be30ae4b786cae5c114c807"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============2919375472579206987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsolv: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2848944 to 2861104 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 129868 to 130280 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1652367 to 1659107 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-src: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-src: FILELIST: directory renamed /usr/src/debug/libsolv/0.7.31/ext -> /usr/src/debug/libsolv/0.7.32/ext, directory renamed /usr/src/debug/libsolv/0.7.31/tools -> /usr/src/debug/libsolv/0.7.32/tools, removed "/usr/src/debug/libsolv/0.7.31/src/evr.c /usr/src/debug/libsolv/0.7.31/src/repo.h /usr/src/debug/libsolv/0.7.31/src/strpool.c /usr/src/debug/libsolv/0.7.31/src/dirpool.c /usr/src/debug/libsolv/0.7.31/src/dirpool.h /usr/src/debug/libsolv/0.7.31/src/repo.c /usr/src/debug/libsolv/0.7.31/src/evr.h /usr/src/debug/libsolv/0.7.31/src/cplxdeps.c /usr/src/debug/libsolv/0.7.31/src/problems.h /usr/src/debug/libsolv/0.7.31/src/poolid.h /usr/src/debug/libsolv/0.7.31/src/solver.h /usr/src/debug/libsolv/0.7.31/src/strpool.h /usr/src/debug/libsolv/0.7.31/src/bitmap.h /usr/src/debug/libsolv/0.7.31/src/chksum.h /usr/src/debug/libsolv/0.7.31/src/problems.c /usr/src/debug/libsolv/0.7.31/src/cplxdeps.h /usr/src/debug/libsolv/0.7.31/src/transaction.h /usr/sr
 c/debug/libsolv/0.7.31/src/sha1.c /usr/src/debug/libsolv/0.7.31/src/solvable.c /usr/src/debug/libsolv/0.7.31/src/dataiterator.h /usr/src/debug/libsolv/0.7.31/src/sha2.h /usr/src/debug/libsolv/0.7.31/src/repo_write.c /usr/src/debug/libsolv/0.7.31/src/solvable.h /usr/src/debug/libsolv/0.7.31/src/sha1.h /usr/src/debug/libsolv/0.7.31/src/transaction.c /usr/src/debug/libsolv/0.7.31/src/repo_write.h /usr/src/debug/libsolv/0.7.31/src/pool.h /usr/src/debug/libsolv/0.7.31/src/sha2.c /usr/src/debug/libsolv/0.7.31/src/repopage.h /usr/src/debug/libsolv/0.7.31/src/solver_private.h /usr/src/debug/libsolv/0.7.31/src/knownid.h /usr/src/debug/libsolv/0.7.31/src/queue.h /usr/src/debug/libsolv/0.7.31/src/rules.h /usr/src/debug/libsolv/0.7.31/src/selection.c /usr/src/debug/libsolv/0.7.31/src/util.h /usr/src/debug/libsolv/0.7.31/src/repopage.c /usr/src/debug/libsolv/0.7.31/src/selection.h /usr/src/debug/libsolv/0.7.31/src/order.c /usr/src/debug/libsolv/0.7.31/src/queue.c /usr/src/debug/libsolv/0.7.31/sr
 c/rules.c /usr/src/debug/libsolv/0.7.31/src/diskusage.c /usr/src/debug/libsolv/0.7.31/src/util.c /usr/src/debug/libsolv/0.7.31/src/md5.c /usr/src/debug/libsolv/0.7.31/src/repodata.c /usr/src/debug/libsolv/0.7.31/src/solver_util.c /usr/src/debug/libsolv/0.7.31/src/filelistfilter.c /usr/src/debug/libsolv/0.7.31/src/repodata.h /usr/src/debug/libsolv/0.7.31/src/md5.h /usr/src/debug/libsolv/0.7.31/src/decision.c /usr/src/debug/libsolv/0.7.31/src/hash.h /usr/src/debug/libsolv/0.7.31/src/repo_solv.h /usr/src/debug/libsolv/0.7.31/src/fileprovides.c /usr/src/debug/libsolv/0.7.31/src/repo_solv.c /usr/src/debug/libsolv/0.7.31/src/poolvendor.h /usr/src/debug/libsolv/0.7.31/src/suse.c /usr/src/debug/libsolv/0.7.31/src/solvversion.c /usr/src/debug/libsolv/0.7.31/src/pooltypes.h /usr/src/debug/libsolv/0.7.31/src/solvversion.h /usr/src/debug/libsolv/0.7.31/src/cleandeps.c /usr/src/debug/libsolv/0.7.31/src/repopack.h /usr/src/debug/libsolv/0.7.31/src/userinstalled.c /usr/src/debug/libsolv/0.7.31/src
 /bitmap.c /usr/src/debug/libsolv/0.7.31/src/chksum.c /usr/src/debug/libsolv/0.7.31/src/policy.c /usr/src/debug/libsolv/0.7.31/src/poolid.c /usr/src/debug/libsolv/0.7.31/src/poolvendor.c /usr/src/debug/libsolv/0.7.31/src/poolarch.c /usr/src/debug/libsolv/0.7.31/src/solver.c /usr/src/debug/libsolv/0.7.31/src/solverdebug.h /usr/src/debug/libsolv/0.7.31/src/policy.h /usr/src/debug/libsolv/0.7.31/src/pool.c /usr/src/debug/libsolv/0.7.31/src/poolarch.h /usr/src/debug/libsolv/0.7.31/src/solverdebug.c", added "/usr/src/debug/libsolv/0.7.32/src/evr.c /usr/src/debug/libsolv/0.7.32/src/repo.h /usr/src/debug/libsolv/0.7.32/src/strpool.c /usr/src/debug/libsolv/0.7.32/src/dirpool.c /usr/src/debug/libsolv/0.7.32/src/dirpool.h /usr/src/debug/libsolv/0.7.32/src/repo.c /usr/src/debug/libsolv/0.7.32/src/evr.h /usr/src/debug/libsolv/0.7.32/src/cplxdeps.c /usr/src/debug/libsolv/0.7.32/src/problems.h /usr/src/debug/libsolv/0.7.32/src/poolid.h /usr/src/debug/libsolv/0.7.32/src/solver.h /usr/src/debug/libs
 olv/0.7.32/src/strpool.h /usr/src/debug/libsolv/0.7.32/src/bitmap.h /usr/src/debug/libsolv/0.7.32/src/chksum.h /usr/src/debug/libsolv/0.7.32/src/problems.c /usr/src/debug/libsolv/0.7.32/src/cplxdeps.h /usr/src/debug/libsolv/0.7.32/src/transaction.h /usr/src/debug/libsolv/0.7.32/src/sha1.c /usr/src/debug/libsolv/0.7.32/src/solvable.c /usr/src/debug/libsolv/0.7.32/src/dataiterator.h /usr/src/debug/libsolv/0.7.32/src/sha2.h /usr/src/debug/libsolv/0.7.32/src/repo_write.c /usr/src/debug/libsolv/0.7.32/src/solvable.h /usr/src/debug/libsolv/0.7.32/src/sha1.h /usr/src/debug/libsolv/0.7.32/src/transaction.c /usr/src/debug/libsolv/0.7.32/src/repo_write.h /usr/src/debug/libsolv/0.7.32/src/pool.h /usr/src/debug/libsolv/0.7.32/src/sha2.c /usr/src/debug/libsolv/0.7.32/src/repopage.h /usr/src/debug/libsolv/0.7.32/src/solver_private.h /usr/src/debug/libsolv/0.7.32/src/knownid.h /usr/src/debug/libsolv/0.7.32/src/queue.h /usr/src/debug/libsolv/0.7.32/src/rules.h /usr/src/debug/libsolv/0.7.32/src/sele
 ction.c /usr/src/debug/libsolv/0.7.32/src/util.h /usr/src/debug/libsolv/0.7.32/src/repopage.c /usr/src/debug/libsolv/0.7.32/src/selection.h /usr/src/debug/libsolv/0.7.32/src/order.c /usr/src/debug/libsolv/0.7.32/src/queue.c /usr/src/debug/libsolv/0.7.32/src/rules.c /usr/src/debug/libsolv/0.7.32/src/diskusage.c /usr/src/debug/libsolv/0.7.32/src/util.c /usr/src/debug/libsolv/0.7.32/src/md5.c /usr/src/debug/libsolv/0.7.32/src/repodata.c /usr/src/debug/libsolv/0.7.32/src/solver_util.c /usr/src/debug/libsolv/0.7.32/src/filelistfilter.c /usr/src/debug/libsolv/0.7.32/src/repodata.h /usr/src/debug/libsolv/0.7.32/src/md5.h /usr/src/debug/libsolv/0.7.32/src/decision.c /usr/src/debug/libsolv/0.7.32/src/hash.h /usr/src/debug/libsolv/0.7.32/src/repo_solv.h /usr/src/debug/libsolv/0.7.32/src/fileprovides.c /usr/src/debug/libsolv/0.7.32/src/repo_solv.c /usr/src/debug/libsolv/0.7.32/src/poolvendor.h /usr/src/debug/libsolv/0.7.32/src/suse.c /usr/src/debug/libsolv/0.7.32/src/apk.c /usr/src/debug/libso
 lv/0.7.32/src/solvversion.c /usr/src/debug/libsolv/0.7.32/src/pooltypes.h /usr/src/debug/libsolv/0.7.32/src/apk.h /usr/src/debug/libsolv/0.7.32/src/solvversion.h /usr/src/debug/libsolv/0.7.32/src/cleandeps.c /usr/src/debug/libsolv/0.7.32/src/repopack.h /usr/src/debug/libsolv/0.7.32/src/userinstalled.c /usr/src/debug/libsolv/0.7.32/src/bitmap.c /usr/src/debug/libsolv/0.7.32/src/chksum.c /usr/src/debug/libsolv/0.7.32/src/policy.c /usr/src/debug/libsolv/0.7.32/src/poolid.c /usr/src/debug/libsolv/0.7.32/src/poolvendor.c /usr/src/debug/libsolv/0.7.32/src/poolarch.c /usr/src/debug/libsolv/0.7.32/src/solver.c /usr/src/debug/libsolv/0.7.32/src/solverdebug.h /usr/src/debug/libsolv/0.7.32/src/policy.h /usr/src/debug/libsolv/0.7.32/src/pool.c /usr/src/debug/libsolv/0.7.32/src/poolarch.h /usr/src/debug/libsolv/0.7.32/src/solverdebug.c"
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-tools: PKGSIZE changed from 207400 to 203304 (-2%)
packages/core2-64-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv: PKGSIZE changed from 647104 to 655296 (+1%)
packages/core2-64-poky-linux/libsolv/libsolv: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolvext: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.31 [default] to 0.7.32 [default]

--===============2919375472579206987==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.31-0.7.32.patch"

RnJvbSBjOWIwMDE0ZmMyMTc0YjI5MGVhMDc0ODkzNmJhOTQ0NzgyOWI3MDBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDg6NTk6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb2x2OiB1cGdyYWRlIDAuNy4zMSAtPiAwLjcuMzIKCi0tLQogLi4uL2xpYnNvbHYvMDAwMS11
dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBhdGNoIHwgMiArLQogLi4u
L2xpYnNvbHYve2xpYnNvbHZfMC43LjMxLmJiID0+IGxpYnNvbHZfMC43LjMyLmJifSAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYve2xpYnNvbHZfMC43LjMx
LmJiID0+IGxpYnNvbHZfMC43LjMyLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHYvMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13
cmFwcGluZy1xc29ydF9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gK
aW5kZXggZDZlOTgzZGVjOC4uMmJmMmUxNTFiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBw
aW5nLXFzb3J0X3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGRhOTliZjA5ZTgzNDY5NjEyZTJjODIxNjk2MDI1YTRlNTkx
YmI5NWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk1NDEyNGFlMTRjNWU0ZDY3OGNk
MzAwM2Q2NDQ3ZmU2MjUxODQ2ZDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyOCBPY3QgMjAyMSAyMjoyODo0
NSAtMDcwMAogU3ViamVjdDogW1BBVENIXSB1dGlsczogQ29uc2lkZSBtdXNsIHdoZW4gd3JhcHBp
bmcgcXNvcnRfcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdl8wLjcuMzEuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAu
Ny4zMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMzIuYmIKaW5kZXggYjM5NWZmOTcyZC4uNDE5MDM2
NDU4YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8w
LjcuMzEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcu
MzIuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL29wZW5T
VVNFL2xpYnNvbHYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBh
dGNoIFwKICIKIAotU1JDUkVWID0gIjk1YWVmNWNjNTdkMGY1MTc4MmU1NWI2OTAzYjMwZWM5M2Fm
YmZhMTUiCitTUkNSRVYgPSAiOTVmNjQ5NTJlMzI3MGRlYjZiZTMwYWU0Yjc4NmNhZTVjMTE0Yzgw
NyIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSsp
IgogCi0tIAoyLjQ3LjEKCg==

--===============2919375472579206987==--

