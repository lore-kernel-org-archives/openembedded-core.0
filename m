Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97F1EEE26C
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.29684.1694804395022356850
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z3QrbU1F;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=N/2d6Ufx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a9a36c0d5-1f4d2821-a41d-4028-9aa3-34c7b8b12026-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O1mvBnULwmnqwPTwcxcpAAlDlJmNF1WQapvVveySVJM=;
	b=Z3QrbU1F/5Rur8ceflbWawLmBESXwJUzt6dU01M3AdntBMMq6v3gww2/iOMW4zk9
	v21/YP1AO2FSH5C+zDJgHSGAfjF/Ya5S+sJQuBTmPtUj/datbvrqbrTkhGEiabsp3h/
	sKRsEm/M9ReyI3JuXYSNX3TsiGg50ESAS+w6BDTU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O1mvBnULwmnqwPTwcxcpAAlDlJmNF1WQapvVveySVJM=;
	b=N/2d6UfxJbrVFWDMV0YRf2zwd7/hwFJDnEPsh0Bt8XA4EuvmuNmKYmGMDAchfFu+
	JXtMa8pPMcZ/4pO2/oA7cAi5TrxBVdHru/FNAV5Pgqnl7SA7efO//BfoV/bA1Nt0bEC
	6ZimMeOm1iOmMzLSU8R3yIKFcSeKv+LBY2nN+530=
Content-Type: multipart/mixed; boundary="===============6169651336002240110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.05.01 SUCCEEDED
Message-ID: <0101018a9a36c0d5-1f4d2821-a41d-4028-9aa3-34c7b8b12026-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187731

--===============6169651336002240110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.05.01* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-6.04-6.05.01.patch
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
From b02b122b7abe3ed134bc4fc0c2caa900c030d1d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 13:16:13 +0000
Subject: [PATCH] man-pages: upgrade 6.04 -> 6.05.01

---
 ...man-pages_6.04.bb => man-pages_6.05.01.bb} | 160 +++++++++++++++++-
 1 file changed, 158 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.04.bb => man-pages_6.05.01.bb} (23%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.04.bb b/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
similarity index 23%
rename from meta/recipes-extended/man-pages/man-pages_6.04.bb
rename to meta/recipes-extended/man-pages/man-pages_6.05.01.bb
index fee57e3fbd..88d9d189a1 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.04.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
@@ -1,10 +1,166 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README
+# +++ README
+# @@ -2,17 +2,18 @@
+#         Linux man-pages - manual pages for GNU/Linux
+#  
+#  Synopsis
+# -       This package contains GNU/Linux manual pages for sections 1 through 8.
+# +       This package contains GNU/Linux manual pages for sections 1
+# +       through 8.
+#  
+#  Description
+# -       The manual pages in this project document primarily the Linux kernel
+# -       and the GNU C library, but also consider relevant differences in other
+# -       kernels or C libraries.
+# +       The manual pages in this project document primarily the Linux
+# +       kernel and the GNU C library, but also consider relevant
+# +       differences in other kernels or C libraries.
+#  
+#         These pages are most of the section 2, 3, 4, 5, 7 man pages for
+# -       GNU/Linux.  A few pages are provided in sections 1 and 8 for commands
+# -       that are not documented in other packages, and there are a few pages in
+# -       sections 5 and 8 for the timezone utilities.
+# +       GNU/Linux.  A few pages are provided in sections 1 and 8 for
+# +       commands that are not documented in other packages, and there are
+# +       a few pages in sections 5 and 8 for the timezone utilities.
+#  
+#  Files
+#     CONTRIBUTING
+# @@ -31,11 +32,12 @@
+#         Instructions for releasing and distributing new versions.
+#  
+#     Changes, Changes.old
+# -       Change log.  Includes most relevant changes.  However, it's not as
+# -       complete as the git(1) log.
+# +       Change log.  Includes most relevant changes.  However, it's not
+# +       as complete as the git(1) log.
+#  
+# -   Makefile, lib/*.mk
+# -       Build system.  For help, consult the <INSTALL> file, and run 'make help'.
+# +   Makefile, share/mk/*
+# +       Build system.  For help, consult the <INSTALL> file, and run
+# +       'make help'.
+#  
+#     lsm
+#         Linux software map.  See also <https://lsm.qqx.org/>.
+# @@ -47,7 +49,8 @@
+#         Licenses in use by the project.
+#  
+#     etc/*
+# -       Configuration files for (linter) programs called by the build system.
+# +       Configuration files for (linter) programs called by the build
+# +       system.
+#  
+#     man*/*
+#         Manual pages.
+# @@ -59,38 +62,77 @@
+#         Default directory for files created by the build system.
+#  
+#  Versions
+# -       Tarballs of releases starting from 2.00 are available at
+# -       <https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/>.
+# +   Tarballs
+# +       <https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/>
+#  
+# -       The git(1) repository can be found at:
+# +   Git
+#         <git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git>
+# +       <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/>
+#  
+#         A secondary git(1) repository can be found at:
+#         <git://www.alejandro-colomar.es/src/alx/linux/man-pages/man-pages.git>
+# +       <http://www.alejandro-colomar.es/src/alx/linux/man-pages/man-pages.git/>
+#  
+# -Caveats
+# -       Some projects provide their own manual pages, not related to the Linux
+# -       man-pages project.
+# +   Online man-pages
+# +       PDF
+# +             <https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/book/>
+#  
+# -Bugs
+# -       See the <CONTRIBUTING> file.
+# +History
+# +   Tarballs
+# +       Tarballs of man-pages-1.* releases are available at:
+# +       <https://www.win.tue.nl/~aeb/ftpdocs/linux-local/manpages.archive/>
+#  
+# -Maintainers
+# +   Maintainers
+#         Alejandro Colomar <alx@kernel.org> <http://www.alejandro-colomar.es/>
+#               2020 - present (5.09 - HEAD)
+#         Michael Kerrisk <mtk.manpages@gmail.com> <https://man7.org/>
+# -             2004 - 2021 (2.00 - 5.13)
+# +             2004 - 2021    (2.00 - 5.13)
+#         Andries Brouwer <aeb@cwi.nl> <https://www.win.tue.nl/~aeb>
+#               1995 - 2004    (1.6  - 1.70)
+#         Rik Faith <https://www.cs.unc.edu/~faith/>
+#               1993 - 1995    (1.0  - 1.5)
+#  
+# +Caveats
+# +       Some projects provide their own manual pages, not related to the
+# +       Linux man-pages project.
+# +
+# +Bugs
+# +       See the <CONTRIBUTING> file.
+# +
+#  Copyright
+# -       Several free/open source licenses.  See the <LICENSES/> directory, and
+# -       the comment at the top of each source file.
+# +       Several free/open source licenses.  See the <LICENSES/>
+# +       directory, and the comment at the top of each source file.
+#  
+#  See also
+#         man-pages(7)
+#  
+#     Website
+#         <http://www.kernel.org/doc/man-pages/index.html>.
+# +
+# +   Downstream packages
+# +       Arch man-pages
+# +             <https://archlinux.org/packages/core/any/man-pages/>
+# +       Debian manpages
+# +             <https://tracker.debian.org/pkg/manpages>
+# +       Fedora rpms/man-pages
+# +             <https://src.fedoraproject.org/rpms/man-pages>
+# +       Gentoo sys-apps/man-pages
+# +             <https://packages.gentoo.org/packages/sys-apps/man-pages>
+# +       openSUSE man-pages
+# +             <https://software.opensuse.org/package/man-pages>
+# +
+# +   Related projects
+# +       Debian manpages-l10n
+# +             <https://manpages-l10n-team.pages.debian.net/manpages-l10n/>
+# +       GNU C Library (glibc)
+# +             <https://www.gnu.org/software/libc/>
+# +       GNU Compiler Collection (GCC)
+# +             <https://gcc.gnu.org/>
+# +       GNU roff (groff)
+# +             <https://www.gnu.org/software/groff/>
+# +       Linux kernel
+# +             <https://www.kernel.org/doc/html/latest/
+# +       man-db
+# +             <https://man-db.gitlab.io/man-db/>
+# +       mandoc
+# +             <https://mandoc.bsd.lv/>
+# 
+#
+
 SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=5b7d7488344f5af8841dc13aaec49cdf \
+LIC_FILES_CHKSUM = "file://README;md5=cbd51cd3dd298230df8ddd4637e65c37 \
                     file://LICENSES/BSD-2-Clause.txt;md5=d0f280d1058e77e66264a9b9e10e6c89 \
                     file://LICENSES/BSD-3-Clause.txt;md5=71f739ef75581cae312e8c711bcdab16 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
@@ -16,7 +172,7 @@ LIC_FILES_CHKSUM = "file://README;md5=5b7d7488344f5af8841dc13aaec49cdf \
                     "
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "590623b99bf1f8ee958483c35cc0aaef2363e42998c4d927d1f705890d15d51e"
+SRC_URI[sha256sum] = "b2dd44ca0342b50923291f06bdba38c42438e10c04843ce1f731cf3f50631e0a"
 
 inherit manpages
 
-- 
2.39.2


--===============6169651336002240110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-pages: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.04.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.05.01.tar.gz"
packages/core2-32-poky-linux/man-pages: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dev: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-doc: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-locale: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-src: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-src: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man5/erofs.5 /usr/share/man/man2/ioctl_pipe.2"
packages/core2-32-poky-linux/man-pages/man-pages: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 7479281 to 7494777 (+0%)

--===============6169651336002240110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man5/erofs.5 /usr/share/man/man2/ioctl_pipe.2"

--===============6169651336002240110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-6.04-6.05.01.patch"

RnJvbSBiMDJiMTIyYjdhYmUzZWQxMzRiYzRmYzBjMmNhYTkwMGMwMzBkMWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTM6MTY6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YW4tcGFnZXM6IHVwZ3JhZGUgNi4wNCAtPiA2LjA1LjAxCgotLS0KIC4uLm1hbi1wYWdlc182LjA0
LmJiID0+IG1hbi1wYWdlc182LjA1LjAxLmJifSB8IDE2MCArKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL3ttYW4tcGFnZXNfNi4wNC5iYiA9PiBtYW4t
cGFnZXNfNi4wNS4wMS5iYn0gKDIzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjA0LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21h
bi1wYWdlcy9tYW4tcGFnZXNfNi4wNS4wMS5iYgpzaW1pbGFyaXR5IGluZGV4IDIzJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjA0LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjA1LjAx
LmJiCmluZGV4IGZlZTU3ZTNmYmQuLjg4ZDlkMTg5YTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNi4wNS4wMS5iYgpAQCAtMSwxMCArMSwxNjYg
QEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRl
ZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBk
YXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdl
cyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMg
KGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMK
KyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBSRUFETUUKKyMgKysrIFJFQURNRQorIyBAQCAtMiwx
NyArMiwxOCBAQAorIyAgICAgICAgIExpbnV4IG1hbi1wYWdlcyAtIG1hbnVhbCBwYWdlcyBmb3Ig
R05VL0xpbnV4CisjICAKKyMgIFN5bm9wc2lzCisjIC0gICAgICAgVGhpcyBwYWNrYWdlIGNvbnRh
aW5zIEdOVS9MaW51eCBtYW51YWwgcGFnZXMgZm9yIHNlY3Rpb25zIDEgdGhyb3VnaCA4LgorIyAr
ICAgICAgIFRoaXMgcGFja2FnZSBjb250YWlucyBHTlUvTGludXggbWFudWFsIHBhZ2VzIGZvciBz
ZWN0aW9ucyAxCisjICsgICAgICAgdGhyb3VnaCA4LgorIyAgCisjICBEZXNjcmlwdGlvbgorIyAt
ICAgICAgIFRoZSBtYW51YWwgcGFnZXMgaW4gdGhpcyBwcm9qZWN0IGRvY3VtZW50IHByaW1hcmls
eSB0aGUgTGludXgga2VybmVsCisjIC0gICAgICAgYW5kIHRoZSBHTlUgQyBsaWJyYXJ5LCBidXQg
YWxzbyBjb25zaWRlciByZWxldmFudCBkaWZmZXJlbmNlcyBpbiBvdGhlcgorIyAtICAgICAgIGtl
cm5lbHMgb3IgQyBsaWJyYXJpZXMuCisjICsgICAgICAgVGhlIG1hbnVhbCBwYWdlcyBpbiB0aGlz
IHByb2plY3QgZG9jdW1lbnQgcHJpbWFyaWx5IHRoZSBMaW51eAorIyArICAgICAgIGtlcm5lbCBh
bmQgdGhlIEdOVSBDIGxpYnJhcnksIGJ1dCBhbHNvIGNvbnNpZGVyIHJlbGV2YW50CisjICsgICAg
ICAgZGlmZmVyZW5jZXMgaW4gb3RoZXIga2VybmVscyBvciBDIGxpYnJhcmllcy4KKyMgIAorIyAg
ICAgICAgIFRoZXNlIHBhZ2VzIGFyZSBtb3N0IG9mIHRoZSBzZWN0aW9uIDIsIDMsIDQsIDUsIDcg
bWFuIHBhZ2VzIGZvcgorIyAtICAgICAgIEdOVS9MaW51eC4gIEEgZmV3IHBhZ2VzIGFyZSBwcm92
aWRlZCBpbiBzZWN0aW9ucyAxIGFuZCA4IGZvciBjb21tYW5kcworIyAtICAgICAgIHRoYXQgYXJl
IG5vdCBkb2N1bWVudGVkIGluIG90aGVyIHBhY2thZ2VzLCBhbmQgdGhlcmUgYXJlIGEgZmV3IHBh
Z2VzIGluCisjIC0gICAgICAgc2VjdGlvbnMgNSBhbmQgOCBmb3IgdGhlIHRpbWV6b25lIHV0aWxp
dGllcy4KKyMgKyAgICAgICBHTlUvTGludXguICBBIGZldyBwYWdlcyBhcmUgcHJvdmlkZWQgaW4g
c2VjdGlvbnMgMSBhbmQgOCBmb3IKKyMgKyAgICAgICBjb21tYW5kcyB0aGF0IGFyZSBub3QgZG9j
dW1lbnRlZCBpbiBvdGhlciBwYWNrYWdlcywgYW5kIHRoZXJlIGFyZQorIyArICAgICAgIGEgZmV3
IHBhZ2VzIGluIHNlY3Rpb25zIDUgYW5kIDggZm9yIHRoZSB0aW1lem9uZSB1dGlsaXRpZXMuCisj
ICAKKyMgIEZpbGVzCisjICAgICBDT05UUklCVVRJTkcKKyMgQEAgLTMxLDExICszMiwxMiBAQAor
IyAgICAgICAgIEluc3RydWN0aW9ucyBmb3IgcmVsZWFzaW5nIGFuZCBkaXN0cmlidXRpbmcgbmV3
IHZlcnNpb25zLgorIyAgCisjICAgICBDaGFuZ2VzLCBDaGFuZ2VzLm9sZAorIyAtICAgICAgIENo
YW5nZSBsb2cuICBJbmNsdWRlcyBtb3N0IHJlbGV2YW50IGNoYW5nZXMuICBIb3dldmVyLCBpdCdz
IG5vdCBhcworIyAtICAgICAgIGNvbXBsZXRlIGFzIHRoZSBnaXQoMSkgbG9nLgorIyArICAgICAg
IENoYW5nZSBsb2cuICBJbmNsdWRlcyBtb3N0IHJlbGV2YW50IGNoYW5nZXMuICBIb3dldmVyLCBp
dCdzIG5vdAorIyArICAgICAgIGFzIGNvbXBsZXRlIGFzIHRoZSBnaXQoMSkgbG9nLgorIyAgCisj
IC0gICBNYWtlZmlsZSwgbGliLyoubWsKKyMgLSAgICAgICBCdWlsZCBzeXN0ZW0uICBGb3IgaGVs
cCwgY29uc3VsdCB0aGUgPElOU1RBTEw+IGZpbGUsIGFuZCBydW4gJ21ha2UgaGVscCcuCisjICsg
ICBNYWtlZmlsZSwgc2hhcmUvbWsvKgorIyArICAgICAgIEJ1aWxkIHN5c3RlbS4gIEZvciBoZWxw
LCBjb25zdWx0IHRoZSA8SU5TVEFMTD4gZmlsZSwgYW5kIHJ1bgorIyArICAgICAgICdtYWtlIGhl
bHAnLgorIyAgCisjICAgICBsc20KKyMgICAgICAgICBMaW51eCBzb2Z0d2FyZSBtYXAuICBTZWUg
YWxzbyA8aHR0cHM6Ly9sc20ucXF4Lm9yZy8+LgorIyBAQCAtNDcsNyArNDksOCBAQAorIyAgICAg
ICAgIExpY2Vuc2VzIGluIHVzZSBieSB0aGUgcHJvamVjdC4KKyMgIAorIyAgICAgZXRjLyoKKyMg
LSAgICAgICBDb25maWd1cmF0aW9uIGZpbGVzIGZvciAobGludGVyKSBwcm9ncmFtcyBjYWxsZWQg
YnkgdGhlIGJ1aWxkIHN5c3RlbS4KKyMgKyAgICAgICBDb25maWd1cmF0aW9uIGZpbGVzIGZvciAo
bGludGVyKSBwcm9ncmFtcyBjYWxsZWQgYnkgdGhlIGJ1aWxkCisjICsgICAgICAgc3lzdGVtLgor
IyAgCisjICAgICBtYW4qLyoKKyMgICAgICAgICBNYW51YWwgcGFnZXMuCisjIEBAIC01OSwzOCAr
NjIsNzcgQEAKKyMgICAgICAgICBEZWZhdWx0IGRpcmVjdG9yeSBmb3IgZmlsZXMgY3JlYXRlZCBi
eSB0aGUgYnVpbGQgc3lzdGVtLgorIyAgCisjICBWZXJzaW9ucworIyAtICAgICAgIFRhcmJhbGxz
IG9mIHJlbGVhc2VzIHN0YXJ0aW5nIGZyb20gMi4wMCBhcmUgYXZhaWxhYmxlIGF0CisjIC0gICAg
ICAgPGh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4L2RvY3MvbWFuLXBh
Z2VzLz4uCisjICsgICBUYXJiYWxscworIyArICAgICAgIDxodHRwczovL21pcnJvcnMuZWRnZS5r
ZXJuZWwub3JnL3B1Yi9saW51eC9kb2NzL21hbi1wYWdlcy8+CisjICAKKyMgLSAgICAgICBUaGUg
Z2l0KDEpIHJlcG9zaXRvcnkgY2FuIGJlIGZvdW5kIGF0OgorIyArICAgR2l0CisjICAgICAgICAg
PGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vZG9jcy9tYW4tcGFnZXMvbWFuLXBhZ2VzLmdp
dD4KKyMgKyAgICAgICA8aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2RvY3MvbWFuLXBh
Z2VzL21hbi1wYWdlcy5naXQvPgorIyAgCisjICAgICAgICAgQSBzZWNvbmRhcnkgZ2l0KDEpIHJl
cG9zaXRvcnkgY2FuIGJlIGZvdW5kIGF0OgorIyAgICAgICAgIDxnaXQ6Ly93d3cuYWxlamFuZHJv
LWNvbG9tYXIuZXMvc3JjL2FseC9saW51eC9tYW4tcGFnZXMvbWFuLXBhZ2VzLmdpdD4KKyMgKyAg
ICAgICA8aHR0cDovL3d3dy5hbGVqYW5kcm8tY29sb21hci5lcy9zcmMvYWx4L2xpbnV4L21hbi1w
YWdlcy9tYW4tcGFnZXMuZ2l0Lz4KKyMgIAorIyAtQ2F2ZWF0cworIyAtICAgICAgIFNvbWUgcHJv
amVjdHMgcHJvdmlkZSB0aGVpciBvd24gbWFudWFsIHBhZ2VzLCBub3QgcmVsYXRlZCB0byB0aGUg
TGludXgKKyMgLSAgICAgICBtYW4tcGFnZXMgcHJvamVjdC4KKyMgKyAgIE9ubGluZSBtYW4tcGFn
ZXMKKyMgKyAgICAgICBQREYKKyMgKyAgICAgICAgICAgICA8aHR0cHM6Ly9taXJyb3JzLmVkZ2Uu
a2VybmVsLm9yZy9wdWIvbGludXgvZG9jcy9tYW4tcGFnZXMvYm9vay8+CisjICAKKyMgLUJ1Z3MK
KyMgLSAgICAgICBTZWUgdGhlIDxDT05UUklCVVRJTkc+IGZpbGUuCisjICtIaXN0b3J5CisjICsg
ICBUYXJiYWxscworIyArICAgICAgIFRhcmJhbGxzIG9mIG1hbi1wYWdlcy0xLiogcmVsZWFzZXMg
YXJlIGF2YWlsYWJsZSBhdDoKKyMgKyAgICAgICA8aHR0cHM6Ly93d3cud2luLnR1ZS5ubC9+YWVi
L2Z0cGRvY3MvbGludXgtbG9jYWwvbWFucGFnZXMuYXJjaGl2ZS8+CisjICAKKyMgLU1haW50YWlu
ZXJzCisjICsgICBNYWludGFpbmVycworIyAgICAgICAgIEFsZWphbmRybyBDb2xvbWFyIDxhbHhA
a2VybmVsLm9yZz4gPGh0dHA6Ly93d3cuYWxlamFuZHJvLWNvbG9tYXIuZXMvPgorIyAgICAgICAg
ICAgICAgIDIwMjAgLSBwcmVzZW50ICg1LjA5IC0gSEVBRCkKKyMgICAgICAgICBNaWNoYWVsIEtl
cnJpc2sgPG10ay5tYW5wYWdlc0BnbWFpbC5jb20+IDxodHRwczovL21hbjcub3JnLz4KKyMgLSAg
ICAgICAgICAgICAyMDA0IC0gMjAyMSAoMi4wMCAtIDUuMTMpCisjICsgICAgICAgICAgICAgMjAw
NCAtIDIwMjEgICAgKDIuMDAgLSA1LjEzKQorIyAgICAgICAgIEFuZHJpZXMgQnJvdXdlciA8YWVi
QGN3aS5ubD4gPGh0dHBzOi8vd3d3Lndpbi50dWUubmwvfmFlYj4KKyMgICAgICAgICAgICAgICAx
OTk1IC0gMjAwNCAgICAoMS42ICAtIDEuNzApCisjICAgICAgICAgUmlrIEZhaXRoIDxodHRwczov
L3d3dy5jcy51bmMuZWR1L35mYWl0aC8+CisjICAgICAgICAgICAgICAgMTk5MyAtIDE5OTUgICAg
KDEuMCAgLSAxLjUpCisjICAKKyMgK0NhdmVhdHMKKyMgKyAgICAgICBTb21lIHByb2plY3RzIHBy
b3ZpZGUgdGhlaXIgb3duIG1hbnVhbCBwYWdlcywgbm90IHJlbGF0ZWQgdG8gdGhlCisjICsgICAg
ICAgTGludXggbWFuLXBhZ2VzIHByb2plY3QuCisjICsKKyMgK0J1Z3MKKyMgKyAgICAgICBTZWUg
dGhlIDxDT05UUklCVVRJTkc+IGZpbGUuCisjICsKKyMgIENvcHlyaWdodAorIyAtICAgICAgIFNl
dmVyYWwgZnJlZS9vcGVuIHNvdXJjZSBsaWNlbnNlcy4gIFNlZSB0aGUgPExJQ0VOU0VTLz4gZGly
ZWN0b3J5LCBhbmQKKyMgLSAgICAgICB0aGUgY29tbWVudCBhdCB0aGUgdG9wIG9mIGVhY2ggc291
cmNlIGZpbGUuCisjICsgICAgICAgU2V2ZXJhbCBmcmVlL29wZW4gc291cmNlIGxpY2Vuc2VzLiAg
U2VlIHRoZSA8TElDRU5TRVMvPgorIyArICAgICAgIGRpcmVjdG9yeSwgYW5kIHRoZSBjb21tZW50
IGF0IHRoZSB0b3Agb2YgZWFjaCBzb3VyY2UgZmlsZS4KKyMgIAorIyAgU2VlIGFsc28KKyMgICAg
ICAgICBtYW4tcGFnZXMoNykKKyMgIAorIyAgICAgV2Vic2l0ZQorIyAgICAgICAgIDxodHRwOi8v
d3d3Lmtlcm5lbC5vcmcvZG9jL21hbi1wYWdlcy9pbmRleC5odG1sPi4KKyMgKworIyArICAgRG93
bnN0cmVhbSBwYWNrYWdlcworIyArICAgICAgIEFyY2ggbWFuLXBhZ2VzCisjICsgICAgICAgICAg
ICAgPGh0dHBzOi8vYXJjaGxpbnV4Lm9yZy9wYWNrYWdlcy9jb3JlL2FueS9tYW4tcGFnZXMvPgor
IyArICAgICAgIERlYmlhbiBtYW5wYWdlcworIyArICAgICAgICAgICAgIDxodHRwczovL3RyYWNr
ZXIuZGViaWFuLm9yZy9wa2cvbWFucGFnZXM+CisjICsgICAgICAgRmVkb3JhIHJwbXMvbWFuLXBh
Z2VzCisjICsgICAgICAgICAgICAgPGh0dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL3JwbXMv
bWFuLXBhZ2VzPgorIyArICAgICAgIEdlbnRvbyBzeXMtYXBwcy9tYW4tcGFnZXMKKyMgKyAgICAg
ICAgICAgICA8aHR0cHM6Ly9wYWNrYWdlcy5nZW50b28ub3JnL3BhY2thZ2VzL3N5cy1hcHBzL21h
bi1wYWdlcz4KKyMgKyAgICAgICBvcGVuU1VTRSBtYW4tcGFnZXMKKyMgKyAgICAgICAgICAgICA8
aHR0cHM6Ly9zb2Z0d2FyZS5vcGVuc3VzZS5vcmcvcGFja2FnZS9tYW4tcGFnZXM+CisjICsKKyMg
KyAgIFJlbGF0ZWQgcHJvamVjdHMKKyMgKyAgICAgICBEZWJpYW4gbWFucGFnZXMtbDEwbgorIyAr
ICAgICAgICAgICAgIDxodHRwczovL21hbnBhZ2VzLWwxMG4tdGVhbS5wYWdlcy5kZWJpYW4ubmV0
L21hbnBhZ2VzLWwxMG4vPgorIyArICAgICAgIEdOVSBDIExpYnJhcnkgKGdsaWJjKQorIyArICAg
ICAgICAgICAgIDxodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2xpYmMvPgorIyArICAgICAg
IEdOVSBDb21waWxlciBDb2xsZWN0aW9uIChHQ0MpCisjICsgICAgICAgICAgICAgPGh0dHBzOi8v
Z2NjLmdudS5vcmcvPgorIyArICAgICAgIEdOVSByb2ZmIChncm9mZikKKyMgKyAgICAgICAgICAg
ICA8aHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9ncm9mZi8+CisjICsgICAgICAgTGludXgg
a2VybmVsCisjICsgICAgICAgICAgICAgPGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwv
bGF0ZXN0LworIyArICAgICAgIG1hbi1kYgorIyArICAgICAgICAgICAgIDxodHRwczovL21hbi1k
Yi5naXRsYWIuaW8vbWFuLWRiLz4KKyMgKyAgICAgICBtYW5kb2MKKyMgKyAgICAgICAgICAgICA8
aHR0cHM6Ly9tYW5kb2MuYnNkLmx2Lz4KKyMgCisjCisKIFNVTU1BUlkgPSAiTGludXggbWFuLXBh
Z2VzIgogREVTQ1JJUFRJT04gPSAiVGhlIExpbnV4IG1hbi1wYWdlcyBwcm9qZWN0IGRvY3VtZW50
cyB0aGUgTGludXgga2VybmVsIGFuZCBDIGxpYnJhcnkgaW50ZXJmYWNlcyB0aGF0IGFyZSBlbXBs
b3llZCBieSB1c2VyIHByb2dyYW1zIgogU0VDVElPTiA9ICJjb25zb2xlL3V0aWxzIgogSE9NRVBB
R0UgPSAiaHR0cDovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9kb2NzL21hbi1wYWdlcyIKIExJ
Q0VOU0UgPSAiR1BMLTIuMC1vci1sYXRlciAmIEdQTC0yLjAtb25seSAmIEdQTC0xLjAtb3ItbGF0
ZXIgJiBCU0QtMi1DbGF1c2UgJiBCU0QtMy1DbGF1c2UgJiBCU0QtNC1DbGF1c2UgJiBNSVQiCiAK
LUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JFQURNRTttZDU9NWI3ZDc0ODgzNDRmNWFmODg0
MWRjMTNhYWVjNDljZGYgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FO21kNT1j
YmQ1MWNkM2RkMjk4MjMwZGY4ZGRkNDYzN2U2NWMzNyBcCiAgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9MSUNFTlNFUy9CU0QtMi1DbGF1c2UudHh0O21kNT1kMGYyODBkMTA1OGU3N2U2NjI2NGE5
YjllMTBlNmM4OSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFUy9CU0QtMy1D
bGF1c2UudHh0O21kNT03MWY3MzllZjc1NTgxY2FlMzEyZThjNzExYmNkYWIxNiBcCiAgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFUy9CU0QtNC1DbGF1c2UtVUMudHh0O21kNT0xZGEz
Y2Y4YWQ1MGNkOGQ1ZDFkZTNjZmM1MzE5NmQwMSBcCkBAIC0xNiw3ICsxNzIsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUU7bWQ1PTViN2Q3NDg4MzQ0ZjVhZjg4NDFkYzEzYWFl
YzQ5Y2RmIFwKICAgICAgICAgICAgICAgICAgICAgIgogU1JDX1VSSSA9ICIke0tFUk5FTE9SR19N
SVJST1J9L2xpbnV4L2RvY3MvJHtCUE59LyR7QlB9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjU5MDYyM2I5OWJmMWY4ZWU5NTg0ODNjMzVjYzBhYWVmMjM2M2U0Mjk5OGM0ZDkyN2Qx
ZjcwNTg5MGQxNWQ1MWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjJkZDQ0Y2EwMzQyYjUwOTIz
MjkxZjA2YmRiYTM4YzQyNDM4ZTEwYzA0ODQzY2UxZjczMWNmM2Y1MDYzMWUwYSIKIAogaW5oZXJp
dCBtYW5wYWdlcwogCi0tIAoyLjM5LjIKCg==

--===============6169651336002240110==--

