Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48973C4167D
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.13950.1646329344392980145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ziz2xYUc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101017f50e02e46-c3f10911-5347-4165-a8ff-4f701524f1ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nMmphBr9C9zSMwFVRQ8TsaUncocxqQixxWCYMNzxH24=;
	b=ziz2xYUcqeE/OhBzkffOi/Vu3RCvi3WNl8Kez8D4QAf3GD+qLYKqUAQyDw1xBjYH
	BY5P0qtpEn3EdVwlzv37yjwmXGiH7tQOUNkQ6y4KWOlCGI+0kU7kDr3TAu1G8pFJACP
	jW0NmUFl2XFk8ABaKOx2diz/7DJwPdWktBgCkpSs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nMmphBr9C9zSMwFVRQ8TsaUncocxqQixxWCYMNzxH24=;
	b=HMx/Pg+ycC8a4vscB5XJ3Mxn6ML0l7V6KEafEvE1G1FTDjoQV6c+joi9jurqheIz
	RRzJzjnjxUKqr25EOF/cFnBU2dAX3L7i7o/ia1HFPesOu7DEZ1DUCC6QJYE+D6X6bzo
	TlxwrbLgM1RXiriInSQcPnlhlsUHyfDCo2w2KRLE=
Content-Type: multipart/mixed; boundary="===============7711612939230930144=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 5.16.2 SUCCEEDED
Message-ID: 
 <0101017f50e02e46-c3f10911-5347-4165-a8ff-4f701524f1ae-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:23 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162676

--===============7711612939230930144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *5.16.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-5.16-5.16.2.patch
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
--===============7711612939230930144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 5.16 [default] to 5.16.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "5.16" to "5.16.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 16917360 to 16930232 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 5.16 [default] to 5.16.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "5.16" to "5.16.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 202760 to 202894 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 5.16 [default] to 5.16.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "5.16" to "5.16.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 5.16 [default] to 5.16.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "5.16" to "5.16.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 5.16 [default] to 5.16.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "5.16" to "5.16.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3442859 to 3448898 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 5.16 [default] to 5.16.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "5.16" to "5.16.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 5.16 [default] to 5.16.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "5.16" to "5.16.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5992445 to 6000639 (+0%)
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 5.16 [default] to 5.16.2 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "5.16" to "5.16.2"
packages/core2-32-poky-linux/btrfs-tools: SRC_URI changed from "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch file://0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch" to "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info/dependency_links.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info/PKG-INFO was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info/SOURCES.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info/dependency_links.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info/PKG-INFO was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info/SOURCES.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info/top_level.txt was removed

--===============7711612939230930144==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-5.16-5.16.2.patch"

From 3490e733e2c31c2e10eaacbc2b4c97deb5ceebb1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 13:40:03 +0000
Subject: [PATCH] btrfs-tools: upgrade 5.16 -> 5.16.2

---
 ...compat-add-local-definition-for-alig.patch | 46 -------------------
 ...fs-tools_5.16.bb => btrfs-tools_5.16.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.16.bb => btrfs-tools_5.16.2.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
deleted file mode 100644
index b0fe67922d..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58 Mon Sep 17 00:00:00 2001
-From: David Sterba <dsterba@suse.com>
-Date: Thu, 13 Jan 2022 14:47:08 +0100
-Subject: [PATCH] btrfs-progs: kerncompat: add local definition for alignment
- macros
-
-There's still problem left with compilation on musl and kernel < 5.11,
-because __ALIGN_KERNEL is not defined anymore:
-
-../bin/ld: kernel-shared/volumes.o: in function `create_chunk':
-volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'
-
-Due to the entangled includes and unconditional definition of
-__ALIGN_KERNEL, we can't use #ifdef in kerncompat.h to define it
-eventually (as kerncompat.h is the first include). Instead add local
-definitions of the macros and rename them to avoid name clashes.
-
-Pull-request: #433
-
-Upstream-Status: Backport [https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- kerncompat.h | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index 6ca1526e2..f0a6e196e 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -359,7 +359,14 @@ do {					\
- 
- /* Alignment check */
- #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
--#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
-+
-+/*
-+ * Alignment, copied and renamed from /usr/include/linux/const.h to work around
-+ * issues caused by moving the definition in 5.12
-+ */
-+#define __ALIGN_KERNEL__(x, a)		__ALIGN_KERNEL_MASK__(x, (typeof(x))(a) - 1)
-+#define __ALIGN_KERNEL_MASK__(x, mask)	(((x) + (mask)) & ~(mask))
-+#define ALIGN(x, a)		__ALIGN_KERNEL__((x), (a))
- 
- static inline int is_power_of_2(unsigned long n)
- {
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
index e5b2057f26..4ab486c465 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
@@ -17,9 +17,8 @@ DEPENDS = "lzo util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch \
            "
-SRCREV = "8ad326b2f28c044cb6ed9016d7c3285e23b673c8"
+SRCREV = "31458c9c81935abbed010221261897273a98d2c1"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.27.0


--===============7711612939230930144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info/dependency_links.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info/PKG-INFO was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info/SOURCES.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16.2-py3.10.egg-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info/dependency_links.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info/PKG-INFO was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info/SOURCES.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.16-py3.10.egg-info/top_level.txt was removed

--===============7711612939230930144==--

