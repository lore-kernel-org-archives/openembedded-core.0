Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4909C54795
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1781.1746113612966061701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fMozuTWZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IrAPw8YH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101968c7b8e12-dbc3399e-581f-4002-9fe5-200c8ec6c052-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113629;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vmr3XwFU5ZL2DMLI0y9rb5JHDW8qI3MnBHiX+XJPDEM=;
	b=fMozuTWZKMyEof1Ga5hmjqmUtKRqO1SfV4fK1AEXWnSpK2LPBJ+FOE1800tOmYSK
	JXSYEve4RWcxGb6xlNXVZiqvA27/oOhtCyvw8tPCVDemmOg0uL/pLV8QjFvTAaDuy1A
	lpLOzSBg0jgIPO7rXsXAPyFdrWpRqY8sTheXErGI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113629;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vmr3XwFU5ZL2DMLI0y9rb5JHDW8qI3MnBHiX+XJPDEM=;
	b=IrAPw8YH58WU+rEnmm8ez4CFbYGsjohN/+v00EZLrdmoUKXcSqz/rbMoO5IAhyku
	Yx8iwoLhVbfNgvP0WEFQpjjOQ8aLjx5pjmUR3GnM1E+7ZxwWQaXFJhi1oiWZExeZzPf
	9aBhSL+Rbmkq2tX3mth1baozLq4jrzwmhP12DXh4=
Content-Type: multipart/mixed; boundary="===============8854995102618315090=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.32 SUCCEEDED
Message-ID: <010101968c7b8e12-dbc3399e-581f-4002-9fe5-200c8ec6c052-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215852

--===============8854995102618315090==
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
From 174dadc23e5321a34e9ccc5cc106f614ac050c24 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 10:52:21 +0000
Subject: [PATCH] libsolv: upgrade 0.7.31 -> 0.7.32

---
 .../libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch | 2 +-
 .../libsolv/{libsolv_0.7.31.bb => libsolv_0.7.32.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.31.bb => libsolv_0.7.32.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
index d6e983dec8..93dfff0e85 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
@@ -1,4 +1,4 @@
-From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001
+From 799526db0396896939f6f8a1a85366ac69584fad Mon Sep 17 00:00:00 2001
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


--===============8854995102618315090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsolv: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2847576 to 2859736 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 129868 to 130280 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-src: FILELIST: directory renamed /usr/src/debug/libsolv/0.7.31/tools -> /usr/src/debug/libsolv/0.7.32/tools, directory renamed /usr/src/debug/libsolv/0.7.31/ext -> /usr/src/debug/libsolv/0.7.32/ext, removed "/usr/src/debug/libsolv/0.7.31/src/diskusage.c /usr/src/debug/libsolv/0.7.31/src/solvable.c /usr/src/debug/libsolv/0.7.31/src/solvversion.c /usr/src/debug/libsolv/0.7.31/src/sha2.h /usr/src/debug/libsolv/0.7.31/src/dirpool.h /usr/src/debug/libsolv/0.7.31/src/evr.h /usr/src/debug/libsolv/0.7.31/src/selection.h /usr/src/debug/libsolv/0.7.31/src/sha1.c /usr/src/debug/libsolv/0.7.31/src/solverdebug.h /usr/src/debug/libsolv/0.7.31/src/solvversion.h /usr/src/debug/libsolv/0.7.31/src/solvable.h /usr/src/debug/libsolv/0.7.31/src/sha2.c /usr/src/debug/libsolv/0.7.31/src/strpool.h /usr/src/debug/libsolv/0.7.31/src/solverdebug.c /usr/src/debug/libsolv/0.7.31/src/dirpool.c /usr/src/debug/libsolv/0.7.31/src/evr.c /usr/src/debug/libsolv/0.7.31/src/se
 lection.c /usr/src/debug/libsolv/0.7.31/src/sha1.h /usr/src/debug/libsolv/0.7.31/src/cplxdeps.c /usr/src/debug/libsolv/0.7.31/src/decision.c /usr/src/debug/libsolv/0.7.31/src/strpool.c /usr/src/debug/libsolv/0.7.31/src/cplxdeps.h /usr/src/debug/libsolv/0.7.31/src/queue.h /usr/src/debug/libsolv/0.7.31/src/poolarch.c /usr/src/debug/libsolv/0.7.31/src/pooltypes.h /usr/src/debug/libsolv/0.7.31/src/repo.h /usr/src/debug/libsolv/0.7.31/src/repopage.c /usr/src/debug/libsolv/0.7.31/src/rules.h /usr/src/debug/libsolv/0.7.31/src/repo_solv.h /usr/src/debug/libsolv/0.7.31/src/poolarch.h /usr/src/debug/libsolv/0.7.31/src/order.c /usr/src/debug/libsolv/0.7.31/src/hash.h /usr/src/debug/libsolv/0.7.31/src/queue.c /usr/src/debug/libsolv/0.7.31/src/repo.c /usr/src/debug/libsolv/0.7.31/src/repo_solv.c /usr/src/debug/libsolv/0.7.31/src/repopage.h /usr/src/debug/libsolv/0.7.31/src/rules.c /usr/src/debug/libsolv/0.7.31/src/solver_private.h /usr/src/debug/libsolv/0.7.31/src/solver_util.c /usr/src/debug/li
 bsolv/0.7.31/src/repodata.h /usr/src/debug/libsolv/0.7.31/src/repodata.c /usr/src/debug/libsolv/0.7.31/src/bitmap.c /usr/src/debug/libsolv/0.7.31/src/chksum.c /usr/src/debug/libsolv/0.7.31/src/policy.c /usr/src/debug/libsolv/0.7.31/src/filelistfilter.c /usr/src/debug/libsolv/0.7.31/src/poolid.c /usr/src/debug/libsolv/0.7.31/src/solver.c /usr/src/debug/libsolv/0.7.31/src/fileprovides.c /usr/src/debug/libsolv/0.7.31/src/chksum.h /usr/src/debug/libsolv/0.7.31/src/bitmap.h /usr/src/debug/libsolv/0.7.31/src/policy.h /usr/src/debug/libsolv/0.7.31/src/poolid.h /usr/src/debug/libsolv/0.7.31/src/solver.h /usr/src/debug/libsolv/0.7.31/src/userinstalled.c /usr/src/debug/libsolv/0.7.31/src/util.c /usr/src/debug/libsolv/0.7.31/src/util.h /usr/src/debug/libsolv/0.7.31/src/transaction.c /usr/src/debug/libsolv/0.7.31/src/repo_write.h /usr/src/debug/libsolv/0.7.31/src/repo_write.c /usr/src/debug/libsolv/0.7.31/src/transaction.h /usr/src/debug/libsolv/0.7.31/src/dataiterator.h /usr/src/debug/libsolv/
 0.7.31/src/pool.c /usr/src/debug/libsolv/0.7.31/src/cleandeps.c /usr/src/debug/libsolv/0.7.31/src/knownid.h /usr/src/debug/libsolv/0.7.31/src/pool.h /usr/src/debug/libsolv/0.7.31/src/md5.c /usr/src/debug/libsolv/0.7.31/src/problems.h /usr/src/debug/libsolv/0.7.31/src/poolvendor.h /usr/src/debug/libsolv/0.7.31/src/suse.c /usr/src/debug/libsolv/0.7.31/src/problems.c /usr/src/debug/libsolv/0.7.31/src/md5.h /usr/src/debug/libsolv/0.7.31/src/repopack.h /usr/src/debug/libsolv/0.7.31/src/poolvendor.c", added "/usr/src/debug/libsolv/0.7.32/src/diskusage.c /usr/src/debug/libsolv/0.7.32/src/solvable.c /usr/src/debug/libsolv/0.7.32/src/solvversion.c /usr/src/debug/libsolv/0.7.32/src/sha2.h /usr/src/debug/libsolv/0.7.32/src/dirpool.h /usr/src/debug/libsolv/0.7.32/src/evr.h /usr/src/debug/libsolv/0.7.32/src/selection.h /usr/src/debug/libsolv/0.7.32/src/sha1.c /usr/src/debug/libsolv/0.7.32/src/solverdebug.h /usr/src/debug/libsolv/0.7.32/src/solvversion.h /usr/src/debug/libsolv/0.7.32/src/solvable
 .h /usr/src/debug/libsolv/0.7.32/src/sha2.c /usr/src/debug/libsolv/0.7.32/src/strpool.h /usr/src/debug/libsolv/0.7.32/src/solverdebug.c /usr/src/debug/libsolv/0.7.32/src/dirpool.c /usr/src/debug/libsolv/0.7.32/src/evr.c /usr/src/debug/libsolv/0.7.32/src/selection.c /usr/src/debug/libsolv/0.7.32/src/sha1.h /usr/src/debug/libsolv/0.7.32/src/cplxdeps.c /usr/src/debug/libsolv/0.7.32/src/decision.c /usr/src/debug/libsolv/0.7.32/src/strpool.c /usr/src/debug/libsolv/0.7.32/src/cplxdeps.h /usr/src/debug/libsolv/0.7.32/src/queue.h /usr/src/debug/libsolv/0.7.32/src/poolarch.c /usr/src/debug/libsolv/0.7.32/src/pooltypes.h /usr/src/debug/libsolv/0.7.32/src/repo.h /usr/src/debug/libsolv/0.7.32/src/repopage.c /usr/src/debug/libsolv/0.7.32/src/rules.h /usr/src/debug/libsolv/0.7.32/src/repo_solv.h /usr/src/debug/libsolv/0.7.32/src/poolarch.h /usr/src/debug/libsolv/0.7.32/src/order.c /usr/src/debug/libsolv/0.7.32/src/hash.h /usr/src/debug/libsolv/0.7.32/src/queue.c /usr/src/debug/libsolv/0.7.32/src/
 repo.c /usr/src/debug/libsolv/0.7.32/src/repo_solv.c /usr/src/debug/libsolv/0.7.32/src/repopage.h /usr/src/debug/libsolv/0.7.32/src/rules.c /usr/src/debug/libsolv/0.7.32/src/solver_private.h /usr/src/debug/libsolv/0.7.32/src/solver_util.c /usr/src/debug/libsolv/0.7.32/src/repodata.h /usr/src/debug/libsolv/0.7.32/src/repodata.c /usr/src/debug/libsolv/0.7.32/src/bitmap.c /usr/src/debug/libsolv/0.7.32/src/chksum.c /usr/src/debug/libsolv/0.7.32/src/policy.c /usr/src/debug/libsolv/0.7.32/src/filelistfilter.c /usr/src/debug/libsolv/0.7.32/src/poolid.c /usr/src/debug/libsolv/0.7.32/src/solver.c /usr/src/debug/libsolv/0.7.32/src/fileprovides.c /usr/src/debug/libsolv/0.7.32/src/bitmap.h /usr/src/debug/libsolv/0.7.32/src/chksum.h /usr/src/debug/libsolv/0.7.32/src/policy.h /usr/src/debug/libsolv/0.7.32/src/poolid.h /usr/src/debug/libsolv/0.7.32/src/solver.h /usr/src/debug/libsolv/0.7.32/src/userinstalled.c /usr/src/debug/libsolv/0.7.32/src/util.c /usr/src/debug/libsolv/0.7.32/src/util.h /usr/s
 rc/debug/libsolv/0.7.32/src/transaction.c /usr/src/debug/libsolv/0.7.32/src/repo_write.h /usr/src/debug/libsolv/0.7.32/src/repo_write.c /usr/src/debug/libsolv/0.7.32/src/transaction.h /usr/src/debug/libsolv/0.7.32/src/dataiterator.h /usr/src/debug/libsolv/0.7.32/src/pool.c /usr/src/debug/libsolv/0.7.32/src/apk.h /usr/src/debug/libsolv/0.7.32/src/cleandeps.c /usr/src/debug/libsolv/0.7.32/src/apk.c /usr/src/debug/libsolv/0.7.32/src/knownid.h /usr/src/debug/libsolv/0.7.32/src/pool.h /usr/src/debug/libsolv/0.7.32/src/md5.c /usr/src/debug/libsolv/0.7.32/src/problems.h /usr/src/debug/libsolv/0.7.32/src/poolvendor.h /usr/src/debug/libsolv/0.7.32/src/suse.c /usr/src/debug/libsolv/0.7.32/src/problems.c /usr/src/debug/libsolv/0.7.32/src/md5.h /usr/src/debug/libsolv/0.7.32/src/repopack.h /usr/src/debug/libsolv/0.7.32/src/poolvendor.c"
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1652367 to 1659107 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-src: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv-tools: PKGSIZE changed from 207400 to 203304 (-2%)
packages/core2-64-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolv: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolv: PKGSIZE changed from 647104 to 655296 (+1%)
packages/core2-64-poky-linux/libsolv/libsolv: PV changed from "0.7.31" to "0.7.32"
packages/core2-64-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.31 [default] to 0.7.32 [default]
packages/core2-64-poky-linux/libsolv/libsolvext: PV changed from "0.7.31" to "0.7.32"

--===============8854995102618315090==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.31-0.7.32.patch"

RnJvbSAxNzRkYWRjMjNlNTMyMWEzNGU5Y2NjNWNjMTA2ZjYxNGFjMDUwYzI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMDo1MjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvbHY6IHVwZ3JhZGUgMC43LjMxIC0+IDAuNy4zMgoKLS0tCiAuLi4vbGlic29sdi8wMDAxLXV0
aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2ggfCAyICstCiAuLi4v
bGlic29sdi97bGlic29sdl8wLjcuMzEuYmIgPT4gbGlic29sdl8wLjcuMzIuYmJ9ICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi97bGlic29sdl8wLjcuMzEu
YmIgPT4gbGlic29sdl8wLjcuMzIuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdy
YXBwaW5nLXFzb3J0X3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJz
b2x2LzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBpbmctcXNvcnRfci5wYXRjaApp
bmRleCBkNmU5ODNkZWM4Li45M2RmZmYwZTg1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlic29sdi9saWJzb2x2LzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBp
bmctcXNvcnRfci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJz
b2x2LzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBpbmctcXNvcnRfci5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZGE5OWJmMDllODM0Njk2MTJlMmM4MjE2OTYwMjVhNGU1OTFi
Yjk1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzk5NTI2ZGIwMzk2ODk2OTM5ZjZm
OGExYTg1MzY2YWM2OTU4NGZhZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI4IE9jdCAyMDIxIDIyOjI4OjQ1
IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWxzOiBDb25zaWRlIG11c2wgd2hlbiB3cmFwcGlu
ZyBxc29ydF9yCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJz
b2x2XzAuNy4zMS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43
LjMyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjMxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zMi5iYgppbmRleCBiMzk1ZmY5NzJkLi40MTkwMzY0
NThhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAu
Ny4zMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4z
Mi5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vb3BlblNV
U0UvbGlic29sdi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0
Y2ggXAogIgogCi1TUkNSRVYgPSAiOTVhZWY1Y2M1N2QwZjUxNzgyZTU1YjY5MDNiMzBlYzkzYWZi
ZmExNSIKK1NSQ1JFViA9ICI5NWY2NDk1MmUzMjcwZGViNmJlMzBhZTRiNzg2Y2FlNWMxMTRjODA3
IgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj5cZCsoXC5cZCspKyki
CiAKLS0gCjIuNDcuMQoK

--===============8854995102618315090==--

