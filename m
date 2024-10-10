Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BF8D0EE19
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:06 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.53369.1728588954782951292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cntFKFTR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sE4PHxrg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277ee4102-3828f117-04f8-40c2-98e8-3d682f588d22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588956;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y8p4+q+TDh8uv3DZXbcYGPfIVjwYKiqpyos696A40sU=;
	b=cntFKFTRTFN0oY4L77yliYvhMJV0verhGaYMZRsLzUG/5WTVUNj8aSGU8x5B0wht
	WE8kPbEp+L8URVh8cZ9tc8yuFMugbD6D+LdpMjWPKTFMdk6/+B+um1MpMAHi2ZHcbgZ
	w7a/pgDRVNk/00PTAz7XD6PbCHwDez2g9VO+xtiU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588956;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y8p4+q+TDh8uv3DZXbcYGPfIVjwYKiqpyos696A40sU=;
	b=sE4PHxrgJw4AIJE72nX1z9CLLdTegw0ZpI0CilJZb3Y81DoU+2GJUqizq6CTtWYt
	KW9dwGCCVMvi0zD2fEqgNuyKlvi3aaHZesiLPIMKQSam1pgsi9CW1nTRb6rxLtC6Lax
	PENTFJOknzquBVKYtpN0/E0qyQIirKMl9QGIxEaw=
Content-Type: multipart/mixed; boundary="===============1877998868977515096=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.47.0 SUCCEEDED
Message-ID: <0101019277ee4102-3828f117-04f8-40c2-98e8-3d682f588d22-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205483

--===============1877998868977515096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.47.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.46.1-2.47.0.patch
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
From 04f3a1c726c7f269f4829dccea5f75fb01102e4e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 01:01:47 +0000
Subject: [PATCH] git: upgrade 2.46.1 -> 2.47.0

---
 ...nfig.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 6 +++---
 meta/recipes-devtools/git/git/fixsort.patch                 | 4 ++--
 meta/recipes-devtools/git/{git_2.46.1.bb => git_2.47.0.bb}  | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/git/{git_2.46.1.bb => git_2.47.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 3f0bc4aaa1..5950724c64 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From be83596773e42b88ba1104f044a139f35d90a7f5 Mon Sep 17 00:00:00 2001
+From 223f02a47780f17e0f2d90a19480cc5ec5ab8fd5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,10 +17,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index 85d6382..bdf06ca 100644
+index d511216..3144228 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
-@@ -64,10 +64,6 @@ ifeq ($(uname_S),Linux)
+@@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
  	PROCFS_EXECUTABLE_PATH = /proc/self/exe
  	HAVE_PLATFORM_PROCINFO = YesPlease
  	COMPAT_OBJS += compat/linux/procinfo.o
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index d9a3672f1d..8ce5e75769 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,7 +1,7 @@
-From 83ae059943d3efd824978a759bcfd894ce5085d4 Mon Sep 17 00:00:00 2001
+From 5739830e263558931a58de216a4cdc3414261880 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
-Subject: [PATCH] [PATCH] generate-configlist.sh: Fix determinism issue
+Subject: [PATCH] generate-configlist.sh: Fix determinism issue
 
 Currently git binaries are not entirely reproducible, at least partly
 due to config-list.h differing in order depending on the system's
diff --git a/meta/recipes-devtools/git/git_2.46.1.bb b/meta/recipes-devtools/git/git_2.47.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.46.1.bb
rename to meta/recipes-devtools/git/git_2.47.0.bb
index d301c474f2..67356874b5 100644
--- a/meta/recipes-devtools/git/git_2.46.1.bb
+++ b/meta/recipes-devtools/git/git_2.47.0.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "b0a4d1ad50e820edd84c0d1b609c29349d4ae2681ed458914ea759aafcd4bf21"
+SRC_URI[tarball.sha256sum] = "a84a7917e0ab608312834413f01fc01edc7844f9f9002ba69f3b4f4bcb8d937a"
-- 
2.44.1


--===============1877998868977515096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/git/git: FILELIST: added "/usr/libexec/git-core/mergetools/vscode"

--===============1877998868977515096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/git/git-bash-completion: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git-bash-completion: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/git-dbg: PKGSIZE changed from 90986208 to 92204976 (+1%)
packages/core2-64-poky-linux/git/git-dbg: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git-dbg: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/git-dev: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git-dev: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/git-doc: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git-doc: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/git-locale: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git-locale: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/git-perltools: PKGSIZE changed from 272199 to 273650 (+1%)
packages/core2-64-poky-linux/git/git-perltools: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git-perltools: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/git-src: PKGSIZE changed from 9750878 to 9840724 (+1%)
packages/core2-64-poky-linux/git/git-src: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git-src: FILELIST: directory renamed /usr/src/debug/git/2.46.1/builtin -> /usr/src/debug/git/2.47.0/builtin, directory renamed /usr/src/debug/git/2.46.1/ewah -> /usr/src/debug/git/2.47.0/ewah, directory renamed /usr/src/debug/git/2.46.1/negotiator -> /usr/src/debug/git/2.47.0/negotiator, directory renamed /usr/src/debug/git/2.46.1/trace2 -> /usr/src/debug/git/2.47.0/trace2, directory renamed /usr/src/debug/git/2.46.1/xdiff -> /usr/src/debug/git/2.47.0/xdiff, directory renamed /usr/src/debug/git/2.46.1/sha256/block -> /usr/src/debug/git/2.47.0/sha256/block, directory renamed /usr/src/debug/git/2.46.1/sha1dc -> /usr/src/debug/git/2.47.0/sha1dc, directory renamed /usr/src/debug/git/2.46.1/refs -> /usr/src/debug/git/2.47.0/refs, directory renamed /usr/src/debug/git/2.46.1/compat/linux -> /usr/src/debug/git/2.47.0/compat/linux, directory renamed /usr/src/debug/git/2.46.1/compat -> /usr/src/debug/git/2.47.0/compat, removed "/usr/src/debug/git/2.46.1/parse-o
 ptions.c /usr/src/debug/git/2.46.1/hook-list.h /usr/src/debug/git/2.46.1/parse-options.h /usr/src/debug/git/2.46.1/strbuf.h /usr/src/debug/git/2.46.1/strmap.h /usr/src/debug/git/2.46.1/git-compat-util.h /usr/src/debug/git/2.46.1/strvec.h /usr/src/debug/git/2.46.1/pkt-line.h /usr/src/debug/git/2.46.1/reftable/reftable-generic.h /usr/src/debug/git/2.46.1/pkt-line.c /usr/src/debug/git/2.46.1/ref-filter.h /usr/src/debug/git/2.46.1/combine-diff.c /usr/src/debug/git/2.46.1/ref-filter.c /usr/src/debug/git/2.46.1/pack.h /usr/src/debug/git/2.46.1/range-diff.c /usr/src/debug/git/2.46.1/range-diff.h /usr/src/debug/git/2.46.1/reftable/basics.c /usr/src/debug/git/2.46.1/revision.c /usr/src/debug/git/2.46.1/revision.h /usr/src/debug/git/2.46.1/reftable/basics.h /usr/src/debug/git/2.46.1/mailinfo.h /usr/src/debug/git/2.46.1/statinfo.h /usr/src/debug/git/2.46.1/bulk-checkin.c /usr/src/debug/git/2.46.1/mailinfo.c /usr/src/debug/git/2.46.1/statinfo.c /usr/src/debug/git/2.46.1/bulk-checkin.h /usr/src/
 debug/git/2.46.1/list-objects.h /usr/src/debug/git/2.46.1/pack-objects.h /usr/src/debug/git/2.46.1/list-objects.c /usr/src/debug/git/2.46.1/pack-objects.c /usr/src/debug/git/2.46.1/stable-qsort.c /usr/src/debug/git/2.46.1/archive.h /usr/src/debug/git/2.46.1/oidtree.h /usr/src/debug/git/2.46.1/read-cache-ll.h /usr/src/debug/git/2.46.1/archive.c /usr/src/debug/git/2.46.1/oidtree.c /usr/src/debug/git/2.46.1/packfile.c /usr/src/debug/git/2.46.1/lockfile.c /usr/src/debug/git/2.46.1/tempfile.c /usr/src/debug/git/2.46.1/diff-merges.h /usr/src/debug/git/2.46.1/lockfile.h /usr/src/debug/git/2.46.1/diff-merges.c /usr/src/debug/git/2.46.1/packfile.h /usr/src/debug/git/2.46.1/tempfile.h /usr/src/debug/git/2.46.1/diff.c /usr/src/debug/git/2.46.1/diff.h /usr/src/debug/git/2.46.1/pack-revindex.h /usr/src/debug/git/2.46.1/refspec.c /usr/src/debug/git/2.46.1/refspec.h /usr/src/debug/git/2.46.1/pack-revindex.c /usr/src/debug/git/2.46.1/sequencer.h /usr/src/debug/git/2.46.1/sequencer.c /usr/src/debug/
 git/2.46.1/iterator.h /usr/src/debug/git/2.46.1/date.c /usr/src/debug/git/2.46.1/notes-merge.h /usr/src/debug/git/2.46.1/notes-merge.c /usr/src/debug/git/2.46.1/date.h /usr/src/debug/git/2.46.1/url.h /usr/src/debug/git/2.46.1/url.c /usr/src/debug/git/2.46.1/urlmatch.c /usr/src/debug/git/2.46.1/exec-cmd.c /usr/src/debug/git/2.46.1/urlmatch.h /usr/src/debug/git/2.46.1/exec-cmd.h /usr/src/debug/git/2.46.1/path.c /usr/src/debug/git/2.46.1/object-store.h /usr/src/debug/git/2.46.1/diff-no-index.c /usr/src/debug/git/2.46.1/reftable/publicbasics.c /usr/src/debug/git/2.46.1/versioncmp.h /usr/src/debug/git/2.46.1/path.h /usr/src/debug/git/2.46.1/versioncmp.c /usr/src/debug/git/2.46.1/merge-ort-wrappers.c /usr/src/debug/git/2.46.1/walker.h /usr/src/debug/git/2.46.1/merge-ort-wrappers.h /usr/src/debug/git/2.46.1/bloom.c /usr/src/debug/git/2.46.1/chdir-notify.h /usr/src/debug/git/2.46.1/strbuf.c /usr/src/debug/git/2.46.1/strmap.c /usr/src/debug/git/2.46.1/strvec.c /usr/src/debug/git/2.46.1/chdir
 -notify.c /usr/src/debug/git/2.46.1/command-list.h /usr/src/debug/git/2.46.1/ws.c /usr/src/debug/git/2.46.1/ws.h /usr/src/debug/git/2.46.1/tree-diff.c /usr/src/debug/git/2.46.1/color.c /usr/src/debug/git/2.46.1/archive-zip.c /usr/src/debug/git/2.46.1/fsmonitor-settings.h /usr/src/debug/git/2.46.1/fsmonitor-settings.c /usr/src/debug/git/2.46.1/mem-pool.c /usr/src/debug/git/2.46.1/protocol.c /usr/src/debug/git/2.46.1/gpg-interface.c /usr/src/debug/git/2.46.1/tree.h /usr/src/debug/git/2.46.1/tree.c /usr/src/debug/git/2.46.1/gpg-interface.h /usr/src/debug/git/2.46.1/mem-pool.h /usr/src/debug/git/2.46.1/protocol.h /usr/src/debug/git/2.46.1/write-or-die.c /usr/src/debug/git/2.46.1/write-or-die.h /usr/src/debug/git/2.46.1/editor.c /usr/src/debug/git/2.46.1/usage.c /usr/src/debug/git/2.46.1/shallow.h /usr/src/debug/git/2.46.1/setup.c /usr/src/debug/git/2.46.1/shell.c /usr/src/debug/git/2.46.1/trace.c /usr/src/debug/git/2.46.1/ctype.c /usr/src/debug/git/2.46.1/alias.c /usr/src/debug/git/2.46
 .1/alloc.c /usr/src/debug/git/2.46.1/apply.c /usr/src/debug/git/2.46.1/blame.c /usr/src/debug/git/2.46.1/shallow.c /usr/src/debug/git/2.46.1/match-trees.c /usr/src/debug/git/2.46.1/match-trees.h /usr/src/debug/git/2.46.1/credential.h /usr/src/debug/git/2.46.1/ls-refs.c /usr/src/debug/git/2.46.1/reftable/reftable-iterator.h /usr/src/debug/git/2.46.1/pretty.c /usr/src/debug/git/2.46.1/prompt.c /usr/src/debug/git/2.46.1/ls-refs.h /usr/src/debug/git/2.46.1/credential.c /usr/src/debug/git/2.46.1/setup.h /usr/src/debug/git/2.46.1/khash.h /usr/src/debug/git/2.46.1/kwset.h /usr/src/debug/git/2.46.1/pager.h /usr/src/debug/git/2.46.1/parse.h /usr/src/debug/git/2.46.1/merge.h /usr/src/debug/git/2.46.1/alloc.h /usr/src/debug/git/2.46.1/ident.h /usr/src/debug/git/2.46.1/quote.h /usr/src/debug/git/2.46.1/entry.h /usr/src/debug/git/2.46.1/attr.h /usr/src/debug/git/2.46.1/attr.c /usr/src/debug/git/2.46.1/transport-internal.h /usr/src/debug/git/2.46.1/tmp-objdir.h /usr/src/debug/git/2.46.1/tmp-objdi
 r.c /usr/src/debug/git/2.46.1/walker.c /usr/src/debug/git/2.46.1/list.h /usr/src/debug/git/2.46.1/diff-lib.c /usr/src/debug/git/2.46.1/git-zlib.c /usr/src/debug/git/2.46.1/branch.h /usr/src/debug/git/2.46.1/bundle.h /usr/src/debug/git/2.46.1/git-zlib.h /usr/src/debug/git/2.46.1/hex-ll.h /usr/src/debug/git/2.46.1/pretty.h /usr/src/debug/git/2.46.1/reachable.h /usr/src/debug/git/2.46.1/prompt.h /usr/src/debug/git/2.46.1/object.h /usr/src/debug/git/2.46.1/oidmap.h /usr/src/debug/git/2.46.1/oidset.h /usr/src/debug/git/2.46.1/list-objects-filter-options.h /usr/src/debug/git/2.46.1/reachable.c /usr/src/debug/git/2.46.1/bundle.c /usr/src/debug/git/2.46.1/list-objects-filter-options.c /usr/src/debug/git/2.46.1/run-command.c /usr/src/debug/git/2.46.1/reftable/block.c /usr/src/debug/git/2.46.1/reftable/error.c /usr/src/debug/git/2.46.1/reftable/stack.c /usr/src/debug/git/2.46.1/run-command.h /usr/src/debug/git/2.46.1/reftable/block.h /usr/src/debug/git/2.46.1/reftable/stack.h /usr/src/debug/g
 it/2.46.1/upload-pack.h /usr/src/debug/git/2.46.1/upload-pack.c /usr/src/debug/git/2.46.1/delta-islands.c /usr/src/debug/git/2.46.1/patch-ids.h /usr/src/debug/git/2.46.1/advice.c /usr/src/debug/git/2.46.1/daemon.c /usr/src/debug/git/2.46.1/pack-mtimes.c /usr/src/debug/git/2.46.1/config.c /usr/src/debug/git/2.46.1/patch-ids.c /usr/src/debug/git/2.46.1/varint.c /usr/src/debug/git/2.46.1/delta-islands.h /usr/src/debug/git/2.46.1/parse-options-cb.c /usr/src/debug/git/2.46.1/scalar.c /usr/src/debug/git/2.46.1/pack-mtimes.h /usr/src/debug/git/2.46.1/tree-walk.c /usr/src/debug/git/2.46.1/read-cache.c /usr/src/debug/git/2.46.1/read-cache.h /usr/src/debug/git/2.46.1/tree-walk.h /usr/src/debug/git/2.46.1/reflog-walk.h /usr/src/debug/git/2.46.1/reflog-walk.c /usr/src/debug/git/2.46.1/remote-curl.c /usr/src/debug/git/2.46.1/reftable/pq.c /usr/src/debug/git/2.46.1/reftable/pq.h /usr/src/debug/git/2.46.1/hook.h /usr/src/debug/git/2.46.1/progress.h /usr/src/debug/git/2.46.1/hook.c /usr/src/debug/g
 it/2.46.1/progress.c /usr/src/debug/git/2.46.1/server-info.c /usr/src/debug/git/2.46.1/server-info.h /usr/src/debug/git/2.46.1/notes.h /usr/src/debug/git/2.46.1/reftable/system.h /usr/src/debug/git/2.46.1/dir-iterator.c /usr/src/debug/git/2.46.1/sigchain.c /usr/src/debug/git/2.46.1/fetch-negotiator.c /usr/src/debug/git/2.46.1/utf8.c /usr/src/debug/git/2.46.1/hex.h /usr/src/debug/git/2.46.1/fetch-negotiator.h /usr/src/debug/git/2.46.1/utf8.h /usr/src/debug/git/2.46.1/dir-iterator.h /usr/src/debug/git/2.46.1/hex.c /usr/src/debug/git/2.46.1/sigchain.h /usr/src/debug/git/2.46.1/transport-helper.c /usr/src/debug/git/2.46.1/http-push.c /usr/src/debug/git/2.46.1/diffcore-break.c /usr/src/debug/git/2.46.1/diffcore-delta.c /usr/src/debug/git/2.46.1/diffcore-order.c /usr/src/debug/git/2.46.1/tar.h /usr/src/debug/git/2.46.1/csum-file.c /usr/src/debug/git/2.46.1/archive-tar.c /usr/src/debug/git/2.46.1/csum-file.h /usr/src/debug/git/2.46.1/cbtree.h /usr/src/debug/git/2.46.1/column.h /usr/src/deb
 ug/git/2.46.1/commit.h /usr/src/debug/git/2.46.1/config.h /usr/src/debug/git/2.46.1/editor.h /usr/src/debug/git/2.46.1/fsmonitor-ipc.c /usr/src/debug/git/2.46.1/varint.h /usr/src/debug/git/2.46.1/advice.h /usr/src/debug/git/2.46.1/base85.h /usr/src/debug/git/2.46.1/bisect.h /usr/src/debug/git/2.46.1/fsmonitor-ipc.h /usr/src/debug/git/2.46.1/oidset.c /usr/src/debug/git/2.46.1/object.c /usr/src/debug/git/2.46.1/oidmap.c /usr/src/debug/git/2.46.1/rebase.c /usr/src/debug/git/2.46.1/base85.c /usr/src/debug/git/2.46.1/bisect.c /usr/src/debug/git/2.46.1/branch.c /usr/src/debug/git/2.46.1/cbtree.c /usr/src/debug/git/2.46.1/column.c /usr/src/debug/git/2.46.1/commit.c /usr/src/debug/git/2.46.1/pack-bitmap-write.c /usr/src/debug/git/2.46.1/bundle-uri.h /usr/src/debug/git/2.46.1/help.h /usr/src/debug/git/2.46.1/help.c /usr/src/debug/git/2.46.1/bundle-uri.c /usr/src/debug/git/2.46.1/http-walker.c /usr/src/debug/git/2.46.1/diagnose.h /usr/src/debug/git/2.46.1/reftable/blocksource.c /usr/src/debug
 /git/2.46.1/unicode-width.h /usr/src/debug/git/2.46.1/diagnose.c /usr/src/debug/git/2.46.1/imap-send.c /usr/src/debug/git/2.46.1/chunk-format.c /usr/src/debug/git/2.46.1/chunk-format.h /usr/src/debug/git/2.46.1/pack-check.c /usr/src/debug/git/2.46.1/commit-graph.c /usr/src/debug/git/2.46.1/merge-ort.c /usr/src/debug/git/2.46.1/transport.c /usr/src/debug/git/2.46.1/commit-graph.h /usr/src/debug/git/2.46.1/hex-ll.c /usr/src/debug/git/2.46.1/merge-ort.h /usr/src/debug/git/2.46.1/transport.h /usr/src/debug/git/2.46.1/reftable/reftable-stack.h /usr/src/debug/git/2.46.1/protocol-caps.c /usr/src/debug/git/2.46.1/tag.h /usr/src/debug/git/2.46.1/reftable/reftable-merged.h /usr/src/debug/git/2.46.1/protocol-caps.h /usr/src/debug/git/2.46.1/tag.c /usr/src/debug/git/2.46.1/reftable/merged.h /usr/src/debug/git/2.46.1/reftable/record.h /usr/src/debug/git/2.46.1/reftable/merged.c /usr/src/debug/git/2.46.1/reftable/record.c /usr/src/debug/git/2.46.1/levenshtein.c /usr/src/debug/git/2.46.1/levenshte
 in.h /usr/src/debug/git/2.46.1/hashmap.c /usr/src/debug/git/2.46.1/mailmap.c /usr/src/debug/git/2.46.1/hashmap.h /usr/src/debug/git/2.46.1/mailmap.h /usr/src/debug/git/2.46.1/fetch-pack.c /usr/src/debug/git/2.46.1/json-writer.c /usr/src/debug/git/2.46.1/fetch-pack.h /usr/src/debug/git/2.46.1/json-writer.h /usr/src/debug/git/2.46.1/environment.c /usr/src/debug/git/2.46.1/unpack-trees.h /usr/src/debug/git/2.46.1/environment.h /usr/src/debug/git/2.46.1/unpack-trees.c /usr/src/debug/git/2.46.1/object-file-convert.h /usr/src/debug/git/2.46.1/trailer.c /usr/src/debug/git/2.46.1/wrapper.c /usr/src/debug/git/2.46.1/line-log.h /usr/src/debug/git/2.46.1/shortlog.h /usr/src/debug/git/2.46.1/dir.h /usr/src/debug/git/2.46.1/trailer.h /usr/src/debug/git/2.46.1/object-file-convert.c /usr/src/debug/git/2.46.1/wrapper.h /usr/src/debug/git/2.46.1/dir.c /usr/src/debug/git/2.46.1/line-log.c /usr/src/debug/git/2.46.1/merge-recursive.h /usr/src/debug/git/2.46.1/decorate.h /usr/src/debug/git/2.46.1/connec
 t.c /usr/src/debug/git/2.46.1/http-fetch.c /usr/src/debug/git/2.46.1/convert.c /usr/src/debug/git/2.46.1/gettext.c /usr/src/debug/git/2.46.1/decorate.c /usr/src/debug/git/2.46.1/diffcore-rename.c /usr/src/debug/git/2.46.1/diffcore-rotate.c /usr/src/debug/git/2.46.1/merge-recursive.c /usr/src/debug/git/2.46.1/preload-index.h /usr/src/debug/git/2.46.1/connect.h /usr/src/debug/git/2.46.1/convert.h /usr/src/debug/git/2.46.1/gettext.h /usr/src/debug/git/2.46.1/parallel-checkout.c /usr/src/debug/git/2.46.1/sha1dc_git.c /usr/src/debug/git/2.46.1/parallel-checkout.h /usr/src/debug/git/2.46.1/sha1dc_git.h /usr/src/debug/git/2.46.1/abspath.h /usr/src/debug/git/2.46.1/patch-delta.c /usr/src/debug/git/2.46.1/abspath.c /usr/src/debug/git/2.46.1/midx.c /usr/src/debug/git/2.46.1/sideband.h /usr/src/debug/git/2.46.1/builtin.h /usr/src/debug/git/2.46.1/connected.h /usr/src/debug/git/2.46.1/version.h /usr/src/debug/git/2.46.1/midx.h /usr/src/debug/git/2.46.1/connected.c /usr/src/debug/git/2.46.1/vers
 ion.c /usr/src/debug/git/2.46.1/sideband.c /usr/src/debug/git/2.46.1/xdiff-interface.c /usr/src/debug/git/2.46.1/thread-utils.c /usr/src/debug/git/2.46.1/userdiff.c /usr/src/debug/git/2.46.1/xdiff-interface.h /usr/src/debug/git/2.46.1/thread-utils.h /usr/src/debug/git/2.46.1/userdiff.h /usr/src/debug/git/2.46.1/log-tree.c /usr/src/debug/git/2.46.1/diffcore-pickaxe.c /usr/src/debug/git/2.46.1/worktree.c /usr/src/debug/git/2.46.1/log-tree.h /usr/src/debug/git/2.46.1/worktree.h /usr/src/debug/git/2.46.1/reftable/reader.h /usr/src/debug/git/2.46.1/reftable/writer.h /usr/src/debug/git/2.46.1/hash.h /usr/src/debug/git/2.46.1/reftable/reader.c /usr/src/debug/git/2.46.1/reftable/writer.c /usr/src/debug/git/2.46.1/reftable/reftable-record.h /usr/src/debug/git/2.46.1/checkout.h /usr/src/debug/git/2.46.1/checkout.c /usr/src/debug/git/2.46.1/pathspec.c /usr/src/debug/git/2.46.1/pathspec.h /usr/src/debug/git/2.46.1/reftable/generic.c /usr/src/debug/git/2.46.1/reftable/generic.h /usr/src/debug/gi
 t/2.46.1/reftable/reftable-reader.h /usr/src/debug/git/2.46.1/reftable/reftable-writer.h /usr/src/debug/git/2.46.1/diff-delta.c /usr/src/debug/git/2.46.1/pseudo-merge.h /usr/src/debug/git/2.46.1/streaming.h /usr/src/debug/git/2.46.1/resolve-undo.c /usr/src/debug/git/2.46.1/rebase.h /usr/src/debug/git/2.46.1/reflog.h /usr/src/debug/git/2.46.1/remote.h /usr/src/debug/git/2.46.1/object-store-ll.h /usr/src/debug/git/2.46.1/pseudo-merge.c /usr/src/debug/git/2.46.1/rerere.h /usr/src/debug/git/2.46.1/streaming.c /usr/src/debug/git/2.46.1/resolve-undo.h /usr/src/debug/git/2.46.1/cache-tree.h /usr/src/debug/git/2.46.1/oid-array.c /usr/src/debug/git/2.46.1/send-pack.c /usr/src/debug/git/2.46.1/oid-array.h /usr/src/debug/git/2.46.1/cache-tree.c /usr/src/debug/git/2.46.1/send-pack.h /usr/src/debug/git/2.46.1/add-interactive.c /usr/src/debug/git/2.46.1/add-interactive.h /usr/src/debug/git/2.46.1/name-hash.h /usr/src/debug/git/2.46.1/rebase-interactive.c /usr/src/debug/git/2.46.1/rebase-interacti
 ve.h /usr/src/debug/git/2.46.1/name-hash.c /usr/src/debug/git/2.46.1/http.c /usr/src/debug/git/2.46.1/http-backend.c /usr/src/debug/git/2.46.1/hash-lookup.h /usr/src/debug/git/2.46.1/fsmonitor.h /usr/src/debug/git/2.46.1/fsmonitor.c /usr/src/debug/git/2.46.1/hash-lookup.c /usr/src/debug/git/2.46.1/line-range.h /usr/src/debug/git/2.46.1/http.h /usr/src/debug/git/2.46.1/trace2.h /usr/src/debug/git/2.46.1/line-range.c /usr/src/debug/git/2.46.1/midx-write.c /usr/src/debug/git/2.46.1/pack-write.c /usr/src/debug/git/2.46.1/wt-status.c /usr/src/debug/git/2.46.1/wt-status.h /usr/src/debug/git/2.46.1/merge-blobs.c /usr/src/debug/git/2.46.1/fmt-merge-msg.c /usr/src/debug/git/2.46.1/sparse-index.h /usr/src/debug/git/2.46.1/merge-blobs.h /usr/src/debug/git/2.46.1/sparse-index.c /usr/src/debug/git/2.46.1/fmt-merge-msg.h /usr/src/debug/git/2.46.1/sub-process.h /usr/src/debug/git/2.46.1/sub-process.c /usr/src/debug/git/2.46.1/submodule.h /usr/src/debug/git/2.46.1/submodule-config.h /usr/src/debug/
 git/2.46.1/submodule.c /usr/src/debug/git/2.46.1/submodule-config.c /usr/src/debug/git/2.46.1/notes-cache.h /usr/src/debug/git/2.46.1/notes-cache.c /usr/src/debug/git/2.46.1/reftable/iter.h /usr/src/debug/git/2.46.1/reftable/tree.h /usr/src/debug/git/2.46.1/reftable/iter.c /usr/src/debug/git/2.46.1/reftable/tree.c /usr/src/debug/git/2.46.1/object-name.h /usr/src/debug/git/2.46.1/reflog.c /usr/src/debug/git/2.46.1/object-name.c /usr/src/debug/git/2.46.1/remote.c /usr/src/debug/git/2.46.1/rerere.c /usr/src/debug/git/2.46.1/promisor-remote.c /usr/src/debug/git/2.46.1/promisor-remote.h /usr/src/debug/git/2.46.1/reftable/reftable-blocksource.h /usr/src/debug/git/2.46.1/pack-bitmap.h /usr/src/debug/git/2.46.1/grep.c /usr/src/debug/git/2.46.1/split-index.h /usr/src/debug/git/2.46.1/grep.h /usr/src/debug/git/2.46.1/pack-bitmap.c /usr/src/debug/git/2.46.1/split-index.c /usr/src/debug/git/2.46.1/preload-index.c /usr/src/debug/git/2.46.1/config-list.h /usr/src/debug/git/2.46.1/string-list.h /u
 sr/src/debug/git/2.46.1/string-list.c /usr/src/debug/git/2.46.1/repo-settings.c /usr/src/debug/git/2.46.1/notes-utils.h /usr/src/debug/git/2.46.1/merge-ll.h /usr/src/debug/git/2.46.1/unix-socket.c /usr/src/debug/git/2.46.1/merge-ll.c /usr/src/debug/git/2.46.1/unix-socket.h /usr/src/debug/git/2.46.1/git.c /usr/src/debug/git/2.46.1/notes-utils.c /usr/src/debug/git/2.46.1/object-file.c /usr/src/debug/git/2.46.1/object-file.h /usr/src/debug/git/2.46.1/fsck.c /usr/src/debug/git/2.46.1/trace2.c /usr/src/debug/git/2.46.1/fsck.h /usr/src/debug/git/2.46.1/linear-assignment.c /usr/src/debug/git/2.46.1/repository.h /usr/src/debug/git/2.46.1/add-patch.c /usr/src/debug/git/2.46.1/wildmatch.c /usr/src/debug/git/2.46.1/wildmatch.h /usr/src/debug/git/2.46.1/linear-assignment.h /usr/src/debug/git/2.46.1/repository.c /usr/src/debug/git/2.46.1/list-objects-filter.c /usr/src/debug/git/2.46.1/list-objects-filter.h /usr/src/debug/git/2.46.1/sh-i18n--envsubst.c /usr/src/debug/git/2.46.1/prio-queue.c /usr/
 src/debug/git/2.46.1/prio-queue.h /usr/src/debug/git/2.46.1/commit-reach.h /usr/src/debug/git/2.46.1/copy.c /usr/src/debug/git/2.46.1/copy.h /usr/src/debug/git/2.46.1/commit-reach.c /usr/src/debug/git/2.46.1/common-main.c /usr/src/debug/git/2.46.1/simple-ipc.h /usr/src/debug/git/2.46.1/entry.c /usr/src/debug/git/2.46.1/graph.c /usr/src/debug/git/2.46.1/ident.c /usr/src/debug/git/2.46.1/kwset.c /usr/src/debug/git/2.46.1/loose.c /usr/src/debug/git/2.46.1/merge.c /usr/src/debug/git/2.46.1/notes.c /usr/src/debug/git/2.46.1/quote.c /usr/src/debug/git/2.46.1/reset.c /usr/src/debug/git/2.46.1/serve.c /usr/src/debug/git/2.46.1/diffcore.h /usr/src/debug/git/2.46.1/blame.h /usr/src/debug/git/2.46.1/bloom.h /usr/src/debug/git/2.46.1/reset.h /usr/src/debug/git/2.46.1/serve.h /usr/src/debug/git/2.46.1/apply.h /usr/src/debug/git/2.46.1/graph.h /usr/src/debug/git/2.46.1/color.h /usr/src/debug/git/2.46.1/delta.h /usr/src/debug/git/2.46.1/loose.h /usr/src/debug/git/2.46.1/alias.h /usr/src/debug/git/
 2.46.1/replace-object.c /usr/src/debug/git/2.46.1/replace-object.h /usr/src/debug/git/2.46.1/prune-packed.h /usr/src/debug/git/2.46.1/reftable/reftable-error.h /usr/src/debug/git/2.46.1/prune-packed.c /usr/src/debug/git/2.46.1/pager.c /usr/src/debug/git/2.46.1/parse.c /usr/src/debug/git/2.46.1/sane-ctype.h /usr/src/debug/git/2.46.1/blob.h /usr/src/debug/git/2.46.1/trace.h /usr/src/debug/git/2.46.1/blob.c /usr/src/debug/git/2.46.1/refs.c /usr/src/debug/git/2.46.1/symlinks.c /usr/src/debug/git/2.46.1/symlinks.h /usr/src/debug/git/2.46.1/refs.h /usr/src/debug/git/2.46.1/fsmonitor-ll.h", added "/usr/src/debug/git/2.47.0/base85.h /usr/src/debug/git/2.47.0/color.h /usr/src/debug/git/2.47.0/entry.h /usr/src/debug/git/2.47.0/graph.h /usr/src/debug/git/2.47.0/parse.h /usr/src/debug/git/2.47.0/reflog-walk.h /usr/src/debug/git/2.47.0/quote.h /usr/src/debug/git/2.47.0/notes.h /usr/src/debug/git/2.47.0/reset.h /usr/src/debug/git/2.47.0/ident.h /usr/src/debug/git/2.47.0/alloc.h /usr/src/debug/git
 /2.47.0/reflog-walk.c /usr/src/debug/git/2.47.0/sh-i18n--envsubst.c /usr/src/debug/git/2.47.0/read-cache-ll.h /usr/src/debug/git/2.47.0/sigchain.h /usr/src/debug/git/2.47.0/advice.h /usr/src/debug/git/2.47.0/sigchain.c /usr/src/debug/git/2.47.0/fsmonitor-settings.c /usr/src/debug/git/2.47.0/name-hash.h /usr/src/debug/git/2.47.0/rebase-interactive.c /usr/src/debug/git/2.47.0/name-hash.c /usr/src/debug/git/2.47.0/fsmonitor-settings.h /usr/src/debug/git/2.47.0/rebase-interactive.h /usr/src/debug/git/2.47.0/reftable/blocksource.c /usr/src/debug/git/2.47.0/prio-queue.h /usr/src/debug/git/2.47.0/send-pack.h /usr/src/debug/git/2.47.0/send-pack.c /usr/src/debug/git/2.47.0/prio-queue.c /usr/src/debug/git/2.47.0/hex-ll.h /usr/src/debug/git/2.47.0/object-store-ll.h /usr/src/debug/git/2.47.0/ident.c /usr/src/debug/git/2.47.0/xdiff-interface.c /usr/src/debug/git/2.47.0/xdiff-interface.h /usr/src/debug/git/2.47.0/path.h /usr/src/debug/git/2.47.0/path.c /usr/src/debug/git/2.47.0/strvec.h /usr/src/
 debug/git/2.47.0/bisect.h /usr/src/debug/git/2.47.0/reftable/basics.c /usr/src/debug/git/2.47.0/bulk-checkin.h /usr/src/debug/git/2.47.0/branch.h /usr/src/debug/git/2.47.0/bundle.h /usr/src/debug/git/2.47.0/cbtree.h /usr/src/debug/git/2.47.0/reflog.h /usr/src/debug/git/2.47.0/column.h /usr/src/debug/git/2.47.0/pretty.h /usr/src/debug/git/2.47.0/bulk-checkin.c /usr/src/debug/git/2.47.0/reftable/basics.h /usr/src/debug/git/2.47.0/command-list.h /usr/src/debug/git/2.47.0/resolve-undo.h /usr/src/debug/git/2.47.0/resolve-undo.c /usr/src/debug/git/2.47.0/merge-blobs.c /usr/src/debug/git/2.47.0/notes-cache.c /usr/src/debug/git/2.47.0/merge-blobs.h /usr/src/debug/git/2.47.0/notes-cache.h /usr/src/debug/git/2.47.0/cbtree.c /usr/src/debug/git/2.47.0/column.c /usr/src/debug/git/2.47.0/commit.c /usr/src/debug/git/2.47.0/rebase.c /usr/src/debug/git/2.47.0/pretty.c /usr/src/debug/git/2.47.0/reflog.c /usr/src/debug/git/2.47.0/remote.c /usr/src/debug/git/2.47.0/rerere.c /usr/src/debug/git/2.47.0/ob
 ject.c /usr/src/debug/git/2.47.0/oidmap.c /usr/src/debug/git/2.47.0/commit-reach.c /usr/src/debug/git/2.47.0/http-walker.c /usr/src/debug/git/2.47.0/advice.c /usr/src/debug/git/2.47.0/commit-reach.h /usr/src/debug/git/2.47.0/diff.c /usr/src/debug/git/2.47.0/diff.h /usr/src/debug/git/2.47.0/hook-list.h /usr/src/debug/git/2.47.0/write-or-die.h /usr/src/debug/git/2.47.0/editor.h /usr/src/debug/git/2.47.0/write-or-die.c /usr/src/debug/git/2.47.0/diff-lib.c /usr/src/debug/git/2.47.0/git-zlib.c /usr/src/debug/git/2.47.0/http-push.c /usr/src/debug/git/2.47.0/list-objects-filter-options.c /usr/src/debug/git/2.47.0/list-objects-filter-options.h /usr/src/debug/git/2.47.0/git-zlib.h /usr/src/debug/git/2.47.0/diff-delta.c /usr/src/debug/git/2.47.0/hex-ll.c /usr/src/debug/git/2.47.0/preload-index.h /usr/src/debug/git/2.47.0/trailer.c /usr/src/debug/git/2.47.0/wrapper.c /usr/src/debug/git/2.47.0/preload-index.c /usr/src/debug/git/2.47.0/trailer.h /usr/src/debug/git/2.47.0/wrapper.h /usr/src/debug
 /git/2.47.0/mem-pool.h /usr/src/debug/git/2.47.0/diff-merges.c /usr/src/debug/git/2.47.0/protocol.h /usr/src/debug/git/2.47.0/diff-merges.h /usr/src/debug/git/2.47.0/mem-pool.c /usr/src/debug/git/2.47.0/protocol.c /usr/src/debug/git/2.47.0/progress.c /usr/src/debug/git/2.47.0/parse-options-cb.c /usr/src/debug/git/2.47.0/progress.h /usr/src/debug/git/2.47.0/diff-no-index.c /usr/src/debug/git/2.47.0/fsck.c /usr/src/debug/git/2.47.0/entry.c /usr/src/debug/git/2.47.0/abspath.h /usr/src/debug/git/2.47.0/fsck.h /usr/src/debug/git/2.47.0/abspath.c /usr/src/debug/git/2.47.0/pack-mtimes.c /usr/src/debug/git/2.47.0/reftable/pq.h /usr/src/debug/git/2.47.0/revision.h /usr/src/debug/git/2.47.0/pack-mtimes.h /usr/src/debug/git/2.47.0/reftable/pq.c /usr/src/debug/git/2.47.0/revision.c /usr/src/debug/git/2.47.0/reftable/system.h /usr/src/debug/git/2.47.0/archive-zip.c /usr/src/debug/git/2.47.0/refs.c /usr/src/debug/git/2.47.0/replace-object.h /usr/src/debug/git/2.47.0/refs.h /usr/src/debug/git/2.47
 .0/replace-object.c /usr/src/debug/git/2.47.0/version.c /usr/src/debug/git/2.47.0/builtin.h /usr/src/debug/git/2.47.0/version.h /usr/src/debug/git/2.47.0/unix-socket.h /usr/src/debug/git/2.47.0/diagnose.h /usr/src/debug/git/2.47.0/diagnose.c /usr/src/debug/git/2.47.0/unix-socket.c /usr/src/debug/git/2.47.0/grep.h /usr/src/debug/git/2.47.0/merge-ort-wrappers.h /usr/src/debug/git/2.47.0/notes-utils.h /usr/src/debug/git/2.47.0/object-file.c /usr/src/debug/git/2.47.0/sequencer.h /usr/src/debug/git/2.47.0/notes-utils.c /usr/src/debug/git/2.47.0/merge-ort-wrappers.c /usr/src/debug/git/2.47.0/grep.c /usr/src/debug/git/2.47.0/git.c /usr/src/debug/git/2.47.0/object-file.h /usr/src/debug/git/2.47.0/sequencer.c /usr/src/debug/git/2.47.0/fmt-merge-msg.h /usr/src/debug/git/2.47.0/delta-islands.h /usr/src/debug/git/2.47.0/userdiff.h /usr/src/debug/git/2.47.0/fmt-merge-msg.c /usr/src/debug/git/2.47.0/delta-islands.c /usr/src/debug/git/2.47.0/userdiff.c /usr/src/debug/git/2.47.0/notes-merge.c /usr/
 src/debug/git/2.47.0/editor.c /usr/src/debug/git/2.47.0/notes-merge.h /usr/src/debug/git/2.47.0/merge-ll.c /usr/src/debug/git/2.47.0/merge-ll.h /usr/src/debug/git/2.47.0/fsmonitor-ll.h /usr/src/debug/git/2.47.0/midx-write.c /usr/src/debug/git/2.47.0/pack-write.c /usr/src/debug/git/2.47.0/diffcore-break.c /usr/src/debug/git/2.47.0/diffcore-delta.c /usr/src/debug/git/2.47.0/diffcore-order.c /usr/src/debug/git/2.47.0/object-store.h /usr/src/debug/git/2.47.0/gpg-interface.h /usr/src/debug/git/2.47.0/add-interactive.h /usr/src/debug/git/2.47.0/add-interactive.c /usr/src/debug/git/2.47.0/gpg-interface.c /usr/src/debug/git/2.47.0/protocol-caps.h /usr/src/debug/git/2.47.0/protocol-caps.c /usr/src/debug/git/2.47.0/tag.c /usr/src/debug/git/2.47.0/simple-ipc.h /usr/src/debug/git/2.47.0/tag.h /usr/src/debug/git/2.47.0/sideband.c /usr/src/debug/git/2.47.0/reftable/merged.c /usr/src/debug/git/2.47.0/reftable/record.c /usr/src/debug/git/2.47.0/setup.c /usr/src/debug/git/2.47.0/shell.c /usr/src/deb
 ug/git/2.47.0/serve.c /usr/src/debug/git/2.47.0/pager.h /usr/src/debug/git/2.47.0/trace.h /usr/src/debug/git/2.47.0/merge.h /usr/src/debug/git/2.47.0/blame.h /usr/src/debug/git/2.47.0/bloom.h /usr/src/debug/git/2.47.0/khash.h /usr/src/debug/git/2.47.0/kwset.h /usr/src/debug/git/2.47.0/serve.h /usr/src/debug/git/2.47.0/setup.h /usr/src/debug/git/2.47.0/delta.h /usr/src/debug/git/2.47.0/list.h /usr/src/debug/git/2.47.0/ref-filter.c /usr/src/debug/git/2.47.0/ref-filter.h /usr/src/debug/git/2.47.0/credential.h /usr/src/debug/git/2.47.0/credential.c /usr/src/debug/git/2.47.0/utf8.h /usr/src/debug/git/2.47.0/repository.c /usr/src/debug/git/2.47.0/repository.h /usr/src/debug/git/2.47.0/utf8.c /usr/src/debug/git/2.47.0/reftable/block.h /usr/src/debug/git/2.47.0/reftable/stack.h /usr/src/debug/git/2.47.0/reftable/block.c /usr/src/debug/git/2.47.0/reftable/error.c /usr/src/debug/git/2.47.0/reftable/stack.c /usr/src/debug/git/2.47.0/reftable/reftable-error.h /usr/src/debug/git/2.47.0/parallel-
 checkout.h /usr/src/debug/git/2.47.0/parallel-checkout.c /usr/src/debug/git/2.47.0/sub-process.h /usr/src/debug/git/2.47.0/sub-process.c /usr/src/debug/git/2.47.0/graph.c /usr/src/debug/git/2.47.0/midx.c /usr/src/debug/git/2.47.0/midx.h /usr/src/debug/git/2.47.0/unicode-width.h /usr/src/debug/git/2.47.0/log-tree.c /usr/src/debug/git/2.47.0/reftable/iter.c /usr/src/debug/git/2.47.0/reftable/tree.c /usr/src/debug/git/2.47.0/worktree.c /usr/src/debug/git/2.47.0/reftable/iter.h /usr/src/debug/git/2.47.0/log-tree.h /usr/src/debug/git/2.47.0/reftable/tree.h /usr/src/debug/git/2.47.0/worktree.h /usr/src/debug/git/2.47.0/reftable/reftable-iterator.h /usr/src/debug/git/2.47.0/http-fetch.c /usr/src/debug/git/2.47.0/hash.h /usr/src/debug/git/2.47.0/wt-status.h /usr/src/debug/git/2.47.0/wt-status.c /usr/src/debug/git/2.47.0/add-patch.c /usr/src/debug/git/2.47.0/wildmatch.c /usr/src/debug/git/2.47.0/decorate.c /usr/src/debug/git/2.47.0/upload-pack.h /usr/src/debug/git/2.47.0/wildmatch.h /usr/src
 /debug/git/2.47.0/upload-pack.c /usr/src/debug/git/2.47.0/decorate.h /usr/src/debug/git/2.47.0/fetch-negotiator.h /usr/src/debug/git/2.47.0/hash-lookup.h /usr/src/debug/git/2.47.0/prune-packed.h /usr/src/debug/git/2.47.0/fetch-negotiator.c /usr/src/debug/git/2.47.0/prune-packed.c /usr/src/debug/git/2.47.0/hash-lookup.c /usr/src/debug/git/2.47.0/line-range.h /usr/src/debug/git/2.47.0/merge.c /usr/src/debug/git/2.47.0/split-index.h /usr/src/debug/git/2.47.0/merge-ort.h /usr/src/debug/git/2.47.0/transport.h /usr/src/debug/git/2.47.0/line-range.c /usr/src/debug/git/2.47.0/merge-ort.c /usr/src/debug/git/2.47.0/transport.c /usr/src/debug/git/2.47.0/split-index.c /usr/src/debug/git/2.47.0/commit-graph.h /usr/src/debug/git/2.47.0/fetch-pack.c /usr/src/debug/git/2.47.0/fetch-pack.h /usr/src/debug/git/2.47.0/commit-graph.c /usr/src/debug/git/2.47.0/cache-tree.h /usr/src/debug/git/2.47.0/tree-walk.h /usr/src/debug/git/2.47.0/sideband.h /usr/src/debug/git/2.47.0/object.h /usr/src/debug/git/2.47
 .0/oidmap.h /usr/src/debug/git/2.47.0/cache-tree.c /usr/src/debug/git/2.47.0/oidset.h /usr/src/debug/git/2.47.0/tree-walk.c /usr/src/debug/git/2.47.0/pathspec.h /usr/src/debug/git/2.47.0/pathspec.c /usr/src/debug/git/2.47.0/blame.c /usr/src/debug/git/2.47.0/bloom.c /usr/src/debug/git/2.47.0/sparse-index.c /usr/src/debug/git/2.47.0/sparse-index.h /usr/src/debug/git/2.47.0/patch-ids.c /usr/src/debug/git/2.47.0/patch-ids.h /usr/src/debug/git/2.47.0/dir-iterator.c /usr/src/debug/git/2.47.0/dir-iterator.h /usr/src/debug/git/2.47.0/color.c /usr/src/debug/git/2.47.0/ctype.c /usr/src/debug/git/2.47.0/tree.c /usr/src/debug/git/2.47.0/diffcore.h /usr/src/debug/git/2.47.0/tree.h /usr/src/debug/git/2.47.0/repo-settings.h /usr/src/debug/git/2.47.0/linear-assignment.h /usr/src/debug/git/2.47.0/repo-settings.c /usr/src/debug/git/2.47.0/linear-assignment.c /usr/src/debug/git/2.47.0/refspec.c /usr/src/debug/git/2.47.0/refspec.h /usr/src/debug/git/2.47.0/url.h /usr/src/debug/git/2.47.0/promisor-remot
 e.h /usr/src/debug/git/2.47.0/reftable/reftable-record.h /usr/src/debug/git/2.47.0/url.c /usr/src/debug/git/2.47.0/promisor-remote.c /usr/src/debug/git/2.47.0/list-objects.c /usr/src/debug/git/2.47.0/pack-objects.c /usr/src/debug/git/2.47.0/daemon.c /usr/src/debug/git/2.47.0/list-objects.h /usr/src/debug/git/2.47.0/pack-objects.h /usr/src/debug/git/2.47.0/fsmonitor-ipc.h /usr/src/debug/git/2.47.0/fsmonitor-ipc.c /usr/src/debug/git/2.47.0/oidset.c /usr/src/debug/git/2.47.0/reftable/reftable-blocksource.h /usr/src/debug/git/2.47.0/match-trees.c /usr/src/debug/git/2.47.0/match-trees.h /usr/src/debug/git/2.47.0/reftable/merged.h /usr/src/debug/git/2.47.0/reftable/record.h /usr/src/debug/git/2.47.0/http-backend.c /usr/src/debug/git/2.47.0/archive.c /usr/src/debug/git/2.47.0/oidtree.c /usr/src/debug/git/2.47.0/archive.h /usr/src/debug/git/2.47.0/oidtree.h /usr/src/debug/git/2.47.0/notes.c /usr/src/debug/git/2.47.0/http.h /usr/src/debug/git/2.47.0/reachable.h /usr/src/debug/git/2.47.0/reac
 hable.c /usr/src/debug/git/2.47.0/http.c /usr/src/debug/git/2.47.0/diffcore-pickaxe.c /usr/src/debug/git/2.47.0/date.h /usr/src/debug/git/2.47.0/reftable/reftable-reader.h /usr/src/debug/git/2.47.0/reftable/reftable-writer.h /usr/src/debug/git/2.47.0/date.c /usr/src/debug/git/2.47.0/levenshtein.h /usr/src/debug/git/2.47.0/blob.h /usr/src/debug/git/2.47.0/line-log.c /usr/src/debug/git/2.47.0/range-diff.c /usr/src/debug/git/2.47.0/tmp-objdir.h /usr/src/debug/git/2.47.0/range-diff.h /usr/src/debug/git/2.47.0/line-log.h /usr/src/debug/git/2.47.0/blob.c /usr/src/debug/git/2.47.0/levenshtein.c /usr/src/debug/git/2.47.0/shortlog.h /usr/src/debug/git/2.47.0/tmp-objdir.c /usr/src/debug/git/2.47.0/shallow.c /usr/src/debug/git/2.47.0/hex.c /usr/src/debug/git/2.47.0/transport-internal.h /usr/src/debug/git/2.47.0/hex.h /usr/src/debug/git/2.47.0/shallow.h /usr/src/debug/git/2.47.0/sha1dc_git.c /usr/src/debug/git/2.47.0/sha1dc_git.h /usr/src/debug/git/2.47.0/reftable/reftable-merged.h /usr/src/deb
 ug/git/2.47.0/streaming.h /usr/src/debug/git/2.47.0/streaming.c /usr/src/debug/git/2.47.0/symlinks.h /usr/src/debug/git/2.47.0/symlinks.c /usr/src/debug/git/2.47.0/chunk-format.c /usr/src/debug/git/2.47.0/chunk-format.h /usr/src/debug/git/2.47.0/reftable/reader.h /usr/src/debug/git/2.47.0/reftable/writer.h /usr/src/debug/git/2.47.0/string-list.c /usr/src/debug/git/2.47.0/config-list.h /usr/src/debug/git/2.47.0/reftable/reader.c /usr/src/debug/git/2.47.0/reftable/writer.c /usr/src/debug/git/2.47.0/string-list.h /usr/src/debug/git/2.47.0/read-cache.c /usr/src/debug/git/2.47.0/read-cache.h /usr/src/debug/git/2.47.0/pack-check.c /usr/src/debug/git/2.47.0/imap-send.c /usr/src/debug/git/2.47.0/config.c /usr/src/debug/git/2.47.0/csum-file.c /usr/src/debug/git/2.47.0/csum-file.h /usr/src/debug/git/2.47.0/remote-curl.c /usr/src/debug/git/2.47.0/connected.h /usr/src/debug/git/2.47.0/checkout.c /usr/src/debug/git/2.47.0/connected.c /usr/src/debug/git/2.47.0/checkout.h /usr/src/debug/git/2.47.0
 /ls-refs.c /usr/src/debug/git/2.47.0/server-info.c /usr/src/debug/git/2.47.0/ls-refs.h /usr/src/debug/git/2.47.0/server-info.h /usr/src/debug/git/2.47.0/copy.c /usr/src/debug/git/2.47.0/copy.h /usr/src/debug/git/2.47.0/mailinfo.h /usr/src/debug/git/2.47.0/statinfo.h /usr/src/debug/git/2.47.0/transport-helper.c /usr/src/debug/git/2.47.0/mailinfo.c /usr/src/debug/git/2.47.0/statinfo.c /usr/src/debug/git/2.47.0/ws.h /usr/src/debug/git/2.47.0/hook.h /usr/src/debug/git/2.47.0/pack-revindex.h /usr/src/debug/git/2.47.0/lockfile.h /usr/src/debug/git/2.47.0/packfile.h /usr/src/debug/git/2.47.0/pack-revindex.c /usr/src/debug/git/2.47.0/tempfile.h /usr/src/debug/git/2.47.0/hook.c /usr/src/debug/git/2.47.0/ws.c /usr/src/debug/git/2.47.0/lockfile.c /usr/src/debug/git/2.47.0/packfile.c /usr/src/debug/git/2.47.0/tempfile.c /usr/src/debug/git/2.47.0/tar.h /usr/src/debug/git/2.47.0/json-writer.h /usr/src/debug/git/2.47.0/json-writer.c /usr/src/debug/git/2.47.0/exec-cmd.h /usr/src/debug/git/2.47.0/re
 ftable/reftable-stack.h /usr/src/debug/git/2.47.0/exec-cmd.c /usr/src/debug/git/2.47.0/bundle-uri.c /usr/src/debug/git/2.47.0/bundle-uri.h /usr/src/debug/git/2.47.0/connect.h /usr/src/debug/git/2.47.0/convert.h /usr/src/debug/git/2.47.0/gettext.h /usr/src/debug/git/2.47.0/pkt-line.h /usr/src/debug/git/2.47.0/versioncmp.h /usr/src/debug/git/2.47.0/submodule.c /usr/src/debug/git/2.47.0/versioncmp.c /usr/src/debug/git/2.47.0/prompt.h /usr/src/debug/git/2.47.0/connect.c /usr/src/debug/git/2.47.0/convert.c /usr/src/debug/git/2.47.0/gettext.c /usr/src/debug/git/2.47.0/pkt-line.c /usr/src/debug/git/2.47.0/submodule.h /usr/src/debug/git/2.47.0/parse-options.h /usr/src/debug/git/2.47.0/iterator.h /usr/src/debug/git/2.47.0/sane-ctype.h /usr/src/debug/git/2.47.0/parse-options.c /usr/src/debug/git/2.47.0/alias.c /usr/src/debug/git/2.47.0/pack-bitmap.c /usr/src/debug/git/2.47.0/dir.c /usr/src/debug/git/2.47.0/hashmap.c /usr/src/debug/git/2.47.0/mailmap.c /usr/src/debug/git/2.47.0/dir.h /usr/src/
 debug/git/2.47.0/hashmap.h /usr/src/debug/git/2.47.0/mailmap.h /usr/src/debug/git/2.47.0/pack-bitmap.h /usr/src/debug/git/2.47.0/attr.c /usr/src/debug/git/2.47.0/attr.h /usr/src/debug/git/2.47.0/git-compat-util.h /usr/src/debug/git/2.47.0/submodule-config.c /usr/src/debug/git/2.47.0/unpack-trees.h /usr/src/debug/git/2.47.0/submodule-config.h /usr/src/debug/git/2.47.0/unpack-trees.c /usr/src/debug/git/2.47.0/object-name.h /usr/src/debug/git/2.47.0/object-name.c /usr/src/debug/git/2.47.0/commit.h /usr/src/debug/git/2.47.0/config.h /usr/src/debug/git/2.47.0/rebase.h /usr/src/debug/git/2.47.0/walker.h /usr/src/debug/git/2.47.0/remote.h /usr/src/debug/git/2.47.0/rerere.h /usr/src/debug/git/2.47.0/varint.h /usr/src/debug/git/2.47.0/strbuf.h /usr/src/debug/git/2.47.0/strmap.h /usr/src/debug/git/2.47.0/varint.c /usr/src/debug/git/2.47.0/prompt.c /usr/src/debug/git/2.47.0/scalar.c /usr/src/debug/git/2.47.0/strbuf.c /usr/src/debug/git/2.47.0/strmap.c /usr/src/debug/git/2.47.0/strvec.c /usr/sr
 c/debug/git/2.47.0/walker.c /usr/src/debug/git/2.47.0/trace2.c /usr/src/debug/git/2.47.0/branch.c /usr/src/debug/git/2.47.0/bundle.c /usr/src/debug/git/2.47.0/chdir-notify.c /usr/src/debug/git/2.47.0/combine-diff.c /usr/src/debug/git/2.47.0/chdir-notify.h /usr/src/debug/git/2.47.0/apply.h /usr/src/debug/git/2.47.0/alias.h /usr/src/debug/git/2.47.0/run-command.c /usr/src/debug/git/2.47.0/merge-recursive.h /usr/src/debug/git/2.47.0/diffcore-rename.c /usr/src/debug/git/2.47.0/diffcore-rotate.c /usr/src/debug/git/2.47.0/merge-recursive.c /usr/src/debug/git/2.47.0/run-command.h /usr/src/debug/git/2.47.0/list-objects-filter.h /usr/src/debug/git/2.47.0/fsmonitor.h /usr/src/debug/git/2.47.0/list-objects-filter.c /usr/src/debug/git/2.47.0/fsmonitor.c /usr/src/debug/git/2.47.0/stable-qsort.c /usr/src/debug/git/2.47.0/help.h /usr/src/debug/git/2.47.0/pseudo-merge.h /usr/src/debug/git/2.47.0/tree-diff.c /usr/src/debug/git/2.47.0/help.c /usr/src/debug/git/2.47.0/pseudo-merge.c /usr/src/debug/git
 /2.47.0/archive-tar.c /usr/src/debug/git/2.47.0/loose.c /usr/src/debug/git/2.47.0/trace2.h /usr/src/debug/git/2.47.0/common-main.c /usr/src/debug/git/2.47.0/reftable/publicbasics.c /usr/src/debug/git/2.47.0/object-file-convert.c /usr/src/debug/git/2.47.0/object-file-convert.h /usr/src/debug/git/2.47.0/patch-delta.c /usr/src/debug/git/2.47.0/pack-bitmap-write.c /usr/src/debug/git/2.47.0/loose.h /usr/src/debug/git/2.47.0/reset.c /usr/src/debug/git/2.47.0/thread-utils.c /usr/src/debug/git/2.47.0/oid-array.h /usr/src/debug/git/2.47.0/trace.c /usr/src/debug/git/2.47.0/pager.c /usr/src/debug/git/2.47.0/parse.c /usr/src/debug/git/2.47.0/quote.c /usr/src/debug/git/2.47.0/alloc.c /usr/src/debug/git/2.47.0/apply.c /usr/src/debug/git/2.47.0/usage.c /usr/src/debug/git/2.47.0/kwset.c /usr/src/debug/git/2.47.0/base85.c /usr/src/debug/git/2.47.0/bisect.c /usr/src/debug/git/2.47.0/oid-array.c /usr/src/debug/git/2.47.0/pack.h /usr/src/debug/git/2.47.0/environment.c /usr/src/debug/git/2.47.0/thread-u
 tils.h /usr/src/debug/git/2.47.0/urlmatch.h /usr/src/debug/git/2.47.0/urlmatch.c /usr/src/debug/git/2.47.0/environment.h"
packages/core2-64-poky-linux/git/git-src: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/git-staticdev: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git-staticdev: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/git-tk: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git-tk: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/git: PKGSIZE changed from 24274992 to 24449877 (+1%)
packages/core2-64-poky-linux/git/git: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/git: FILELIST: added "/usr/libexec/git-core/mergetools/vscode"
packages/core2-64-poky-linux/git/git: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git/gitweb: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git/gitweb: PKGV changed from 2.46.1 [default] to 2.47.0 [default]
packages/core2-64-poky-linux/git: PV changed from "2.46.1" to "2.47.0"
packages/core2-64-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.46.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.47.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-64-poky-linux/git: PKGV changed from 2.46.1 [default] to 2.47.0 [default]

--===============1877998868977515096==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.46.1-2.47.0.patch"

RnJvbSAwNGYzYTFjNzI2YzdmMjY5ZjQ4MjlkY2NlYTVmNzVmYjAxMTAyZTRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDE6MDE6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi40Ni4xIC0+IDIuNDcuMAoKLS0tCiAuLi5uZmlnLm1hay51bmFtZS1kby1u
b3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1aWxkLS5wYXRjaCB8IDYgKysrLS0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoICAgICAgICAgICAgICAgICB8IDQg
KystLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC97Z2l0XzIuNDYuMS5iYiA9PiBnaXRfMi40
Ny4wLmJifSAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L3tnaXRfMi40Ni4xLmJi
ID0+IGdpdF8yLjQ3LjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dpdC9naXQvMDAwMS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3Bl
Y2lmaWMtYnVpbGQtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvMDAwMS1j
b25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNo
CmluZGV4IDNmMGJjNGFhYTEuLjU5NTA3MjRjNjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9naXQvZ2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03
LXNwZWNpZmljLWJ1aWxkLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dp
dC8wMDAxLWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWls
ZC0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJlODM1OTY3NzNlNDJiODhiYTExMDRmMDQ0
YTEzOWYzNWQ5MGE3ZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDIyM2YwMmE0Nzc4
MGYxN2UwZjJkOTBhMTk0ODBjYzVlYzVhYjhmZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogTW9uLCA3
IEZlYiAyMDIyIDEwOjEzOjE1ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZy5tYWsudW5h
bWU6IGRvIG5vdCBmb3JjZSBSSEVMLTcgc3BlY2lmaWMgYnVpbGQgc2V0dGluZ3MKQEAgLTE3LDEw
ICsxNywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJp
dmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2NvbmZpZy5tYWsudW5hbWUgYi9jb25maWcubWFrLnVuYW1lCi1pbmRleCA4NWQ2MzgyLi5iZGYw
NmNhIDEwMDY0NAoraW5kZXggZDUxMTIxNi4uMzE0NDIyOCAxMDA2NDQKIC0tLSBhL2NvbmZpZy5t
YWsudW5hbWUKICsrKyBiL2NvbmZpZy5tYWsudW5hbWUKLUBAIC02NCwxMCArNjQsNiBAQCBpZmVx
ICgkKHVuYW1lX1MpLExpbnV4KQorQEAgLTYzLDEwICs2Myw2IEBAIGlmZXEgKCQodW5hbWVfUyks
TGludXgpCiAgCVBST0NGU19FWEVDVVRBQkxFX1BBVEggPSAvcHJvYy9zZWxmL2V4ZQogIAlIQVZF
X1BMQVRGT1JNX1BST0NJTkZPID0gWWVzUGxlYXNlCiAgCUNPTVBBVF9PQkpTICs9IGNvbXBhdC9s
aW51eC9wcm9jaW5mby5vCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dp
dC9maXhzb3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5w
YXRjaAppbmRleCBkOWEzNjcyZjFkLi44Y2U1ZTc1NzY5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDgzYWUwNTk5
NDNkM2VmZDgyNDk3OGE3NTliY2ZkODk0Y2U1MDg1ZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDU3Mzk4MzBlMjYzNTU4OTMxYTU4ZGUyMTZhNGNkYzM0MTQyNjE4ODAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMTcgRmViIDIwMjEgMTc6NTc6MTMgKzAwMDAK
LVN1YmplY3Q6IFtQQVRDSF0gW1BBVENIXSBnZW5lcmF0ZS1jb25maWdsaXN0LnNoOiBGaXggZGV0
ZXJtaW5pc20gaXNzdWUKK1N1YmplY3Q6IFtQQVRDSF0gZ2VuZXJhdGUtY29uZmlnbGlzdC5zaDog
Rml4IGRldGVybWluaXNtIGlzc3VlCiAKIEN1cnJlbnRseSBnaXQgYmluYXJpZXMgYXJlIG5vdCBl
bnRpcmVseSByZXByb2R1Y2libGUsIGF0IGxlYXN0IHBhcnRseQogZHVlIHRvIGNvbmZpZy1saXN0
LmggZGlmZmVyaW5nIGluIG9yZGVyIGRlcGVuZGluZyBvbiB0aGUgc3lzdGVtJ3MKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDYuMS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9naXQvZ2l0XzIuNDcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQ2LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDcuMC5iYgppbmRleCBkMzAxYzQ3NGYyLi42
NzM1Njg3NGI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQ2
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi40Ny4wLmJiCkBAIC0x
NjQsNCArMTY0LDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5zX2Jv
Z3VzPW5vIFwKICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRURVhU
PTEiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gImIwYTRkMWFkNTBlODIwZWRkODRj
MGQxYjYwOWMyOTM0OWQ0YWUyNjgxZWQ0NTg5MTRlYTc1OWFhZmNkNGJmMjEiCitTUkNfVVJJW3Rh
cmJhbGwuc2hhMjU2c3VtXSA9ICJhODRhNzkxN2UwYWI2MDgzMTI4MzQ0MTNmMDFmYzAxZWRjNzg0
NGY5ZjkwMDJiYTY5ZjNiNGY0YmNiOGQ5MzdhIgotLSAKMi40NC4xCgo=

--===============1877998868977515096==--

