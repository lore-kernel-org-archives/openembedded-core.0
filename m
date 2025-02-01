Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A565EC02194
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:49 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.42716.1738416048703418296
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=d6NQkl8V;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1GfDWiq0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194c1abc75d-32ed3ef9-6d8c-4148-8e69-9d66afd27715-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416048;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WvjNbIZ5UQVvuUZgvBVB/OcLPh/rbvvC9x6OZkXP9MA=;
	b=d6NQkl8V2AF7MseiZOjaMzakMMkzWfOsD3p1Zk5qds135MHG92S74MDXyaJK/wBa
	6TNxcA0lBxLbxL6qV4Wvt8LtSE4mrBc6BTA8lWMrIDfmTl5LMcVADtoOq67MdA1LF2J
	U35NyBQSzdz2VLWUh9scdAS7NMP9xRYXap2vfzI8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416048;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WvjNbIZ5UQVvuUZgvBVB/OcLPh/rbvvC9x6OZkXP9MA=;
	b=1GfDWiq07F4XXhKjEnYaw5t4UwlUc8qE/Fz1CEfM4a9Sdv2gbY3mru5XUtggt2Jy
	duicem7629HJG36NuPgvoZQIqliUvEKMsEFdRkzLZzJ95KcnsVKEIbLerbDVvz7TsbH
	4yG7eBN/YRjJtDb5KRODxNSCiT+2EsKQCadg1bk0=
Content-Type: multipart/mixed; boundary="===============5058803079819355520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.48.1 SUCCEEDED
Message-ID: <01010194c1abc75d-32ed3ef9-6d8c-4148-8e69-9d66afd27715-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210524

--===============5058803079819355520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.48.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.47.1-2.48.1.patch
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
From fcb92cb6f4c7a36336ce1ea8302c987f24cf11d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 07:16:42 +0000
Subject: [PATCH] git: upgrade 2.47.1 -> 2.48.1

---
 ...mak.uname-do-not-force-RHEL-7-specific-build-.patch |  4 ++--
 meta/recipes-devtools/git/git/fixsort.patch            | 10 +++++-----
 .../git/{git_2.47.1.bb => git_2.48.1.bb}               |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/git/{git_2.47.1.bb => git_2.48.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index e5135928f0..cbe9a32fa1 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 348811a6f818408a31551d0830dcfe31c55d06a8 Mon Sep 17 00:00:00 2001
+From 2a97f61c558a03282c7d81797f1cd8b594f953dc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,7 +17,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index d511216..3144228 100644
+index b12d4e1..b5b8d82 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index d9a3672f1d..e01953e324 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,7 +1,7 @@
-From 83ae059943d3efd824978a759bcfd894ce5085d4 Mon Sep 17 00:00:00 2001
+From 0ada98b8e1de3fe835b439777303dfaf9ac65a08 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
-Subject: [PATCH] [PATCH] generate-configlist.sh: Fix determinism issue
+Subject: [PATCH] generate-configlist.sh: Fix determinism issue
 
 Currently git binaries are not entirely reproducible, at least partly
 due to config-list.h differing in order depending on the system's
@@ -23,12 +23,12 @@ Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd3
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generate-configlist.sh b/generate-configlist.sh
-index 8692fe5..e67ccac 100755
+index 5794226..6b0b939 100755
 --- a/generate-configlist.sh
 +++ b/generate-configlist.sh
-@@ -9,7 +9,7 @@ static const char *config_name_list[] = {
+@@ -15,7 +15,7 @@ static const char *config_name_list[] = {
  EOF
- 	grep -h '^[a-zA-Z].*\..*::$' Documentation/*config.txt Documentation/config/*.txt |
+ 	grep -h '^[a-zA-Z].*\..*::$' "$SOURCE_DIR"/Documentation/*config.txt "$SOURCE_DIR"/Documentation/config/*.txt |
  	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
 -	sort |
 +	LC_ALL=C sort |
diff --git a/meta/recipes-devtools/git/git_2.47.1.bb b/meta/recipes-devtools/git/git_2.48.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.47.1.bb
rename to meta/recipes-devtools/git/git_2.48.1.bb
index 8b5bfecd6a..e0df23eb47 100644
--- a/meta/recipes-devtools/git/git_2.47.1.bb
+++ b/meta/recipes-devtools/git/git_2.48.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f4c4e98667800585d218dfdf415eb72f73baa7abcac4569e2ce497970f8d6665"
+SRC_URI[tarball.sha256sum] = "51b4d03b1e311ba673591210f94f24a4c5781453e1eb188822e3d9cdc04c2212"
-- 
2.44.1


--===============5058803079819355520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/git/git-bash-completion: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-bash-completion: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-bash-completion: PKGSIZE changed from 93627 to 93639 (+0%)
packages/core2-64-poky-linux/git/git-dbg: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-dbg: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-dbg: PKGSIZE changed from 92200088 to 92900664 (+1%)
packages/core2-64-poky-linux/git/git-dev: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-dev: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-doc: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-doc: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-locale: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-locale: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-perltools: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-perltools: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-perltools: PKGSIZE changed from 273650 to 273656 (+0%)
packages/core2-64-poky-linux/git/git-src: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-src: FILELIST: directory renamed /usr/src/debug/git/2.47.1/trace2 -> /usr/src/debug/git/2.48.1/trace2, directory renamed /usr/src/debug/git/2.47.1/sha1dc -> /usr/src/debug/git/2.48.1/sha1dc, directory renamed /usr/src/debug/git/2.47.1/ewah -> /usr/src/debug/git/2.48.1/ewah, directory renamed /usr/src/debug/git/2.47.1/compat/linux -> /usr/src/debug/git/2.48.1/compat/linux, directory renamed /usr/src/debug/git/2.47.1/compat -> /usr/src/debug/git/2.48.1/compat, directory renamed /usr/src/debug/git/2.47.1/negotiator -> /usr/src/debug/git/2.48.1/negotiator, directory renamed /usr/src/debug/git/2.47.1/refs -> /usr/src/debug/git/2.48.1/refs, directory renamed /usr/src/debug/git/2.47.1/builtin -> /usr/src/debug/git/2.48.1/builtin, directory renamed /usr/src/debug/git/2.47.1/xdiff -> /usr/src/debug/git/2.48.1/xdiff, directory renamed /usr/src/debug/git/2.47.1/sha256/block -> /usr/src/debug/git/2.48.1/sha256/block, directory renamed /usr/src/debug/git/2.47.
 1 -> /usr/src/debug/git/2.48.1, removed "/usr/src/debug/git/2.47.1/reftable/merged.c /usr/src/debug/git/2.47.1/reftable/record.c /usr/src/debug/git/2.47.1/reftable/reftable-merged.h /usr/src/debug/git/2.47.1/reftable/reftable-blocksource.h /usr/src/debug/git/2.47.1/reftable/reftable-record.h /usr/src/debug/git/2.47.1/reftable/block.c /usr/src/debug/git/2.47.1/reftable/error.c /usr/src/debug/git/2.47.1/reftable/stack.c /usr/src/debug/git/2.47.1/reftable/merged.h /usr/src/debug/git/2.47.1/reftable/block.h /usr/src/debug/git/2.47.1/reftable/publicbasics.c /usr/src/debug/git/2.47.1/reftable/record.h /usr/src/debug/git/2.47.1/reftable/stack.h /usr/src/debug/git/2.47.1/reftable/pq.h /usr/src/debug/git/2.47.1/reftable/pq.c /usr/src/debug/git/2.47.1/reftable/iter.c /usr/src/debug/git/2.47.1/reftable/tree.c /usr/src/debug/git/2.47.1/reftable/reftable-error.h /usr/src/debug/git/2.47.1/reftable/iter.h /usr/src/debug/git/2.47.1/reftable/tree.h /usr/src/debug/git/2.47.1/reftable/reftable-reader.
 h /usr/src/debug/git/2.47.1/reftable/reftable-writer.h /usr/src/debug/git/2.47.1/reftable/reftable-iterator.h /usr/src/debug/git/2.47.1/reftable/blocksource.c /usr/src/debug/git/2.47.1/reftable/reftable-stack.h /usr/src/debug/git/2.47.1/reftable/reader.c /usr/src/debug/git/2.47.1/reftable/writer.c /usr/src/debug/git/2.47.1/reftable/reader.h /usr/src/debug/git/2.47.1/reftable/writer.h /usr/src/debug/git/2.47.1/reftable/basics.h /usr/src/debug/git/2.47.1/reftable/system.h /usr/src/debug/git/2.47.1/reftable/basics.c", added "/usr/src/debug/git/2.48.1/reftable/merged.c /usr/src/debug/git/2.48.1/reftable/record.c /usr/src/debug/git/2.48.1/reftable/reftable-merged.h /usr/src/debug/git/2.48.1/reftable/reftable-blocksource.h /usr/src/debug/git/2.48.1/reftable/reftable-record.h /usr/src/debug/git/2.48.1/reftable/block.c /usr/src/debug/git/2.48.1/reftable/error.c /usr/src/debug/git/2.48.1/reftable/stack.c /usr/src/debug/git/2.48.1/reftable/merged.h /usr/src/debug/git/2.48.1/reftable/block.h /
 usr/src/debug/git/2.48.1/reftable/record.h /usr/src/debug/git/2.48.1/reftable/stack.h /usr/src/debug/git/2.48.1/reftable/pq.h /usr/src/debug/git/2.48.1/reftable/pq.c /usr/src/debug/git/2.48.1/reftable/iter.c /usr/src/debug/git/2.48.1/reftable/tree.c /usr/src/debug/git/2.48.1/reftable/reftable-error.h /usr/src/debug/git/2.48.1/reftable/iter.h /usr/src/debug/git/2.48.1/reftable/tree.h /usr/src/debug/git/2.48.1/reftable/reftable-reader.h /usr/src/debug/git/2.48.1/reftable/reftable-writer.h /usr/src/debug/git/2.48.1/reftable/reftable-iterator.h /usr/src/debug/git/2.48.1/reftable/blocksource.c /usr/src/debug/git/2.48.1/reftable/reftable-basics.h /usr/src/debug/git/2.48.1/reftable/reftable-stack.h /usr/src/debug/git/2.48.1/reftable/reader.c /usr/src/debug/git/2.48.1/reftable/writer.c /usr/src/debug/git/2.48.1/reftable/reader.h /usr/src/debug/git/2.48.1/reftable/writer.h /usr/src/debug/git/2.48.1/reftable/basics.h /usr/src/debug/git/2.48.1/reftable/system.h /usr/src/debug/git/2.48.1/reftab
 le/basics.c /usr/src/debug/git/2.48.1/reftable/system.c"
packages/core2-64-poky-linux/git/git-src: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-src: PKGSIZE changed from 9841580 to 9931301 (+1%)
packages/core2-64-poky-linux/git/git-staticdev: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-staticdev: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-tk: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-tk: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git: PKGSIZE changed from 24453653 to 24658717 (+1%)
packages/core2-64-poky-linux/git/gitweb: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/gitweb: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/gitweb: PKGSIZE changed from 313838 to 313956 (+0%)
packages/core2-64-poky-linux/git: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.47.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.48.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-64-poky-linux/git: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
Changes to packages/core2-64-poky-linux/git (sysroot):
  /usr/share/git-core/templates/branches was removed

--===============5058803079819355520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/git (sysroot):
  /usr/share/git-core/templates/branches was removed

--===============5058803079819355520==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.47.1-2.48.1.patch"

RnJvbSBmY2I5MmNiNmY0YzdhMzYzMzZjZTFlYTgzMDJjOTg3ZjI0Y2YxMWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNzoxNjo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
dDogdXBncmFkZSAyLjQ3LjEgLT4gMi40OC4xCgotLS0KIC4uLm1hay51bmFtZS1kby1ub3QtZm9y
Y2UtUkhFTC03LXNwZWNpZmljLWJ1aWxkLS5wYXRjaCB8ICA0ICsrLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2ggICAgICAgICAgICB8IDEwICsrKysrLS0tLS0K
IC4uLi9naXQve2dpdF8yLjQ3LjEuYmIgPT4gZ2l0XzIuNDguMS5iYn0gICAgICAgICAgICAgICB8
ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L3tnaXRfMi40Ny4xLmJiID0+IGdpdF8y
LjQ4LjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9n
aXQvMDAwMS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVp
bGQtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvMDAwMS1jb25maWcubWFr
LnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoCmluZGV4IGU1
MTM1OTI4ZjAuLmNiZTlhMzJmYTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
aXQvZ2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmlj
LWJ1aWxkLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC8wMDAxLWNv
bmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDM0ODgxMWE2ZjgxODQwOGEzMTU1MWQwODMwZGNmZTMxYzU1
ZDA2YTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJhOTdmNjFjNTU4YTAzMjgyYzdk
ODE3OTdmMWNkOGI1OTRmOTUzZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogTW9uLCA3IEZlYiAyMDIy
IDEwOjEzOjE1ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZy5tYWsudW5hbWU6IGRvIG5v
dCBmb3JjZSBSSEVMLTcgc3BlY2lmaWMgYnVpbGQgc2V0dGluZ3MKQEAgLTE3LDcgKzE3LDcgQEAg
U2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWcubWFr
LnVuYW1lIGIvY29uZmlnLm1hay51bmFtZQotaW5kZXggZDUxMTIxNi4uMzE0NDIyOCAxMDA2NDQK
K2luZGV4IGIxMmQ0ZTEuLmI1YjhkODIgMTAwNjQ0CiAtLS0gYS9jb25maWcubWFrLnVuYW1lCiAr
KysgYi9jb25maWcubWFrLnVuYW1lCiBAQCAtNjMsMTAgKzYzLDYgQEAgaWZlcSAoJCh1bmFtZV9T
KSxMaW51eCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNv
cnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCmlu
ZGV4IGQ5YTM2NzJmMWQuLmUwMTk1M2UzMjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dp
dC9naXQvZml4c29ydC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gODNhZTA1OTk0M2QzZWZk
ODI0OTc4YTc1OWJjZmQ4OTRjZTUwODVkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MGFkYTk4YjhlMWRlM2ZlODM1YjQzOTc3NzMwM2RmYWY5YWM2NWEwOCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPgogRGF0ZTogV2VkLCAxNyBGZWIgMjAyMSAxNzo1NzoxMyArMDAwMAotU3ViamVj
dDogW1BBVENIXSBbUEFUQ0hdIGdlbmVyYXRlLWNvbmZpZ2xpc3Quc2g6IEZpeCBkZXRlcm1pbmlz
bSBpc3N1ZQorU3ViamVjdDogW1BBVENIXSBnZW5lcmF0ZS1jb25maWdsaXN0LnNoOiBGaXggZGV0
ZXJtaW5pc20gaXNzdWUKIAogQ3VycmVudGx5IGdpdCBiaW5hcmllcyBhcmUgbm90IGVudGlyZWx5
IHJlcHJvZHVjaWJsZSwgYXQgbGVhc3QgcGFydGx5CiBkdWUgdG8gY29uZmlnLWxpc3QuaCBkaWZm
ZXJpbmcgaW4gb3JkZXIgZGVwZW5kaW5nIG9uIHRoZSBzeXN0ZW0ncwpAQCAtMjMsMTIgKzIzLDEy
IEBAIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL3B1YmxpYy1pbmJveC5vcmcv
Z2l0L2YwMjlhOTQyZGQzZDUwZDg1ZTYwYmQzCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9nZW5lcmF0ZS1jb25maWdsaXN0LnNo
IGIvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAotaW5kZXggODY5MmZlNS4uZTY3Y2NhYyAxMDA3NTUK
K2luZGV4IDU3OTQyMjYuLjZiMGI5MzkgMTAwNzU1CiAtLS0gYS9nZW5lcmF0ZS1jb25maWdsaXN0
LnNoCiArKysgYi9nZW5lcmF0ZS1jb25maWdsaXN0LnNoCi1AQCAtOSw3ICs5LDcgQEAgc3RhdGlj
IGNvbnN0IGNoYXIgKmNvbmZpZ19uYW1lX2xpc3RbXSA9IHsKK0BAIC0xNSw3ICsxNSw3IEBAIHN0
YXRpYyBjb25zdCBjaGFyICpjb25maWdfbmFtZV9saXN0W10gPSB7CiAgRU9GCi0gCWdyZXAgLWgg
J15bYS16QS1aXS4qXC4uKjo6JCcgRG9jdW1lbnRhdGlvbi8qY29uZmlnLnR4dCBEb2N1bWVudGF0
aW9uL2NvbmZpZy8qLnR4dCB8CisgCWdyZXAgLWggJ15bYS16QS1aXS4qXC4uKjo6JCcgIiRTT1VS
Q0VfRElSIi9Eb2N1bWVudGF0aW9uLypjb25maWcudHh0ICIkU09VUkNFX0RJUiIvRG9jdW1lbnRh
dGlvbi9jb25maWcvKi50eHQgfAogIAlzZWQgJy9kZXByZWNhdGVkL2Q7IHMvOjokLy87IHMvLCAg
Ki9cbi9nJyB8CiAtCXNvcnQgfAogKwlMQ19BTEw9QyBzb3J0IHwKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDcuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9naXQvZ2l0XzIuNDguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQ3LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9naXQvZ2l0XzIuNDguMS5iYgppbmRleCA4YjViZmVjZDZhLi5lMGRmMjNlYjQ3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQ3LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi40OC4xLmJiCkBAIC0xNjQsNCArMTY0
LDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5zX2JvZ3VzPW5vIFwK
ICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRURVhUPTEiCiAKLVNS
Q19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gImY0YzRlOTg2Njc4MDA1ODVkMjE4ZGZkZjQxNWVi
NzJmNzNiYWE3YWJjYWM0NTY5ZTJjZTQ5Nzk3MGY4ZDY2NjUiCitTUkNfVVJJW3RhcmJhbGwuc2hh
MjU2c3VtXSA9ICI1MWI0ZDAzYjFlMzExYmE2NzM1OTEyMTBmOTRmMjRhNGM1NzgxNDUzZTFlYjE4
ODgyMmUzZDljZGMwNGMyMjEyIgotLSAKMi40NC4xCgo=

--===============5058803079819355520==--

