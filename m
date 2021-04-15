Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1311.1618510601446710184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9F3DC38C1416
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 5.11 SUCCEEDED
Message-ID: <MADEUP.16761AD13A5C7F75.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150547
Content-Type: multipart/mixed; boundary="===============8041838259384037548=="

--===============8041838259384037548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *5.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-5.10-5.11.patch
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

--===============8041838259384037548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-pages/man-pages-dev: FILELIST: added "/usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man2/close_range.2 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3"
packages/core2-32-poky-linux/man-pages/man-pages-doc: FILELIST: added "/usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man2/close_range.2 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3"
packages/core2-32-poky-linux/man-pages/man-pages-locale: FILELIST: added "/usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man2/close_range.2 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: FILELIST: added "/usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man2/close_range.2 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3"
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man2/close_range.2 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3"

--===============8041838259384037548==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-5.10-5.11.patch"

From c36c7c40520cfc9ae560b670f5fbfdd702f0acee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 09:15:47 +0000
Subject: [PATCH] man-pages: upgrade 5.10 -> 5.11

---
 .../man-pages/{man-pages_5.10.bb => man-pages_5.11.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.10.bb => man-pages_5.11.bb} (91%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.10.bb b/meta/recipes-extended/man-pages/man-pages_5.11.bb
similarity index 91%
rename from meta/recipes-extended/man-pages/man-pages_5.10.bb
rename to meta/recipes-extended/man-pages/man-pages_5.11.bb
index 8874516aa2..3cd0bc5259 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.10.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.11.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=207f70f56526417514ac46b6680e314f"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "f2ce94a7250c49910db91806996699e1deac656097d4d53bdf56bdab4b61f228"
+SRC_URI[sha256sum] = "3759aee7cd4a229173d3cb651fbba438777bee6206da8d75ea04caaa7c8662b0"
 
 inherit manpages
 
-- 
2.27.0


--===============8041838259384037548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-pages: PKGV changed from 5.10 [default] to 5.11 [default]
packages/core2-32-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-5.10.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-5.11.tar.gz"
packages/core2-32-poky-linux/man-pages: PV changed from "5.10" to "5.11"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PKGV changed from 5.10 [default] to 5.11 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dbg: FILELIST: added "/usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man2/close_range.2 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PV changed from "5.10" to "5.11"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PKGV changed from 5.10 [default] to 5.11 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dev: FILELIST: added "/usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man2/close_range.2 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PV changed from "5.10" to "5.11"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PKGV changed from 5.10 [default] to 5.11 [default]
packages/core2-32-poky-linux/man-pages/man-pages-doc: FILELIST: added "/usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man2/close_range.2 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PV changed from "5.10" to "5.11"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PKGV changed from 5.10 [default] to 5.11 [default]
packages/core2-32-poky-linux/man-pages/man-pages-locale: FILELIST: added "/usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man2/close_range.2 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PV changed from "5.10" to "5.11"
packages/core2-32-poky-linux/man-pages/man-pages-src: PKGV changed from 5.10 [default] to 5.11 [default]
packages/core2-32-poky-linux/man-pages/man-pages-src: FILELIST: added "/usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man2/close_range.2 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3"
packages/core2-32-poky-linux/man-pages/man-pages-src: PV changed from "5.10" to "5.11"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 5.10 [default] to 5.11 [default]
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: FILELIST: added "/usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man2/close_range.2 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PV changed from "5.10" to "5.11"
packages/core2-32-poky-linux/man-pages/man-pages: PKGV changed from 5.10 [default] to 5.11 [default]
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man3/SIMPLEQ_REMOVE.3 /usr/share/man/man3/SIMPLEQ_REMOVE_HEAD.3 /usr/share/man/man2/close_range.2 /usr/share/man/man3/SIMPLEQ_HEAD_INITIALIZER.3 /usr/share/man/man3/SIMPLEQ_INSERT_TAIL.3 /usr/share/man/man3/SIMPLEQ_NEXT.3 /usr/share/man/man3/SIMPLEQ_EMPTY.3 /usr/share/man/man3/SIMPLEQ_INSERT_HEAD.3 /usr/share/man/man2/process_madvise.2 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/SIMPLEQ_ENTRY.3 /usr/share/man/man3/mallinfo2.3 /usr/share/man/man3/SIMPLEQ_INIT.3 /usr/share/man/man3/simpleq.3 /usr/share/man/man3/SIMPLEQ_HEAD.3 /usr/share/man/man2/epoll_pwait2.2 /usr/share/man/man3/SIMPLEQ_INSERT_AFTER.3 /usr/share/man/man3/SIMPLEQ_FIRST.3 /usr/share/man/man3/SIMPLEQ_FOREACH.3"
packages/core2-32-poky-linux/man-pages/man-pages: PV changed from "5.10" to "5.11"
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 8199766 to 8255681 (+1%)

--===============8041838259384037548==--
