Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BECCCF963
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.5682.1693650553639672904
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QSj7Ko2o;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PGMt/tgy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a55708cb9-494533fc-f285-428c-9020-44a57bc7191e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vqjMEmNBBVPhTUhZdNCBRIbG6oYYyXqoDqi3EnA871w=;
	b=QSj7Ko2o1Lbswe1SJdLagFalDtKUlep3nmKguyHx6V+F29D6WH5rPVPJcOAYmkju
	tZN9JZKUot5YpSxAFx5pfAVFZTIqV9z5ONVjiO9ya9vgLVGwp1gXVxQ41qhsMcuGJcd
	eFCyVlzSu8YdhwRA9teI96aB2TxrUOY43BFO9rDA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vqjMEmNBBVPhTUhZdNCBRIbG6oYYyXqoDqi3EnA871w=;
	b=PGMt/tgyARl5ZAfpxQCDoB5t0WL2/J8ui9nl1Ci43bZBdxTT2g5lS8odGgAEKC8w
	Vk65UqK6yfhdYNYhT6o6Gl6qRigye+vN/AbVjCDzFydhWS06w/dRlTwvzEOOJa7hvpM
	KaqEXzM7DhUp92pZWPDsH9Q5F3TND/HVQByfcDFU=
Content-Type: multipart/mixed; boundary="===============8902110537421290982=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.05.01 SUCCEEDED
Message-ID: <0101018a55708cb9-494533fc-f285-428c-9020-44a57bc7191e-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187090

--===============8902110537421290982==
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
From 1f4fc9dca8c30e4980939f09ee5baa0d0c0190fc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 20:13:50 +0000
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


--===============8902110537421290982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-pages: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.04.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.05.01.tar.gz"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dev: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-doc: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-locale: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-src: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-src: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages: PV changed from "6.04" to "6.05.01"
packages/core2-32-poky-linux/man-pages/man-pages: PKGV changed from 6.04 [default] to 6.05.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man2/ioctl_pipe.2 /usr/share/man/man5/erofs.5"
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 7479281 to 7494777 (+0%)

--===============8902110537421290982==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-6.04-6.05.01.patch"

RnJvbSAxZjRmYzlkY2E4YzMwZTQ5ODA5MzlmMDllZTViYWEwZDBjMDE5MGZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAyMDoxMzo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1h
bi1wYWdlczogdXBncmFkZSA2LjA0IC0+IDYuMDUuMDEKCi0tLQogLi4ubWFuLXBhZ2VzXzYuMDQu
YmIgPT4gbWFuLXBhZ2VzXzYuMDUuMDEuYmJ9IHwgMTYwICsrKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMve21hbi1wYWdlc182LjA0LmJiID0+IG1hbi1w
YWdlc182LjA1LjAxLmJifSAoMjMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFu
LXBhZ2VzL21hbi1wYWdlc182LjA1LjAxLmJiCnNpbWlsYXJpdHkgaW5kZXggMjMlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDQuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDUuMDEu
YmIKaW5kZXggZmVlNTdlM2ZiZC4uODhkOWQxODlhMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNi4wNC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjA1LjAxLmJiCkBAIC0xLDEwICsxLDE2NiBA
QAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVk
IGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRh
dGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2Vz
IGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAo
ZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIwor
IyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIFJFQURNRQorIyArKysgUkVBRE1FCisjIEBAIC0yLDE3
ICsyLDE4IEBACisjICAgICAgICAgTGludXggbWFuLXBhZ2VzIC0gbWFudWFsIHBhZ2VzIGZvciBH
TlUvTGludXgKKyMgIAorIyAgU3lub3BzaXMKKyMgLSAgICAgICBUaGlzIHBhY2thZ2UgY29udGFp
bnMgR05VL0xpbnV4IG1hbnVhbCBwYWdlcyBmb3Igc2VjdGlvbnMgMSB0aHJvdWdoIDguCisjICsg
ICAgICAgVGhpcyBwYWNrYWdlIGNvbnRhaW5zIEdOVS9MaW51eCBtYW51YWwgcGFnZXMgZm9yIHNl
Y3Rpb25zIDEKKyMgKyAgICAgICB0aHJvdWdoIDguCisjICAKKyMgIERlc2NyaXB0aW9uCisjIC0g
ICAgICAgVGhlIG1hbnVhbCBwYWdlcyBpbiB0aGlzIHByb2plY3QgZG9jdW1lbnQgcHJpbWFyaWx5
IHRoZSBMaW51eCBrZXJuZWwKKyMgLSAgICAgICBhbmQgdGhlIEdOVSBDIGxpYnJhcnksIGJ1dCBh
bHNvIGNvbnNpZGVyIHJlbGV2YW50IGRpZmZlcmVuY2VzIGluIG90aGVyCisjIC0gICAgICAga2Vy
bmVscyBvciBDIGxpYnJhcmllcy4KKyMgKyAgICAgICBUaGUgbWFudWFsIHBhZ2VzIGluIHRoaXMg
cHJvamVjdCBkb2N1bWVudCBwcmltYXJpbHkgdGhlIExpbnV4CisjICsgICAgICAga2VybmVsIGFu
ZCB0aGUgR05VIEMgbGlicmFyeSwgYnV0IGFsc28gY29uc2lkZXIgcmVsZXZhbnQKKyMgKyAgICAg
ICBkaWZmZXJlbmNlcyBpbiBvdGhlciBrZXJuZWxzIG9yIEMgbGlicmFyaWVzLgorIyAgCisjICAg
ICAgICAgVGhlc2UgcGFnZXMgYXJlIG1vc3Qgb2YgdGhlIHNlY3Rpb24gMiwgMywgNCwgNSwgNyBt
YW4gcGFnZXMgZm9yCisjIC0gICAgICAgR05VL0xpbnV4LiAgQSBmZXcgcGFnZXMgYXJlIHByb3Zp
ZGVkIGluIHNlY3Rpb25zIDEgYW5kIDggZm9yIGNvbW1hbmRzCisjIC0gICAgICAgdGhhdCBhcmUg
bm90IGRvY3VtZW50ZWQgaW4gb3RoZXIgcGFja2FnZXMsIGFuZCB0aGVyZSBhcmUgYSBmZXcgcGFn
ZXMgaW4KKyMgLSAgICAgICBzZWN0aW9ucyA1IGFuZCA4IGZvciB0aGUgdGltZXpvbmUgdXRpbGl0
aWVzLgorIyArICAgICAgIEdOVS9MaW51eC4gIEEgZmV3IHBhZ2VzIGFyZSBwcm92aWRlZCBpbiBz
ZWN0aW9ucyAxIGFuZCA4IGZvcgorIyArICAgICAgIGNvbW1hbmRzIHRoYXQgYXJlIG5vdCBkb2N1
bWVudGVkIGluIG90aGVyIHBhY2thZ2VzLCBhbmQgdGhlcmUgYXJlCisjICsgICAgICAgYSBmZXcg
cGFnZXMgaW4gc2VjdGlvbnMgNSBhbmQgOCBmb3IgdGhlIHRpbWV6b25lIHV0aWxpdGllcy4KKyMg
IAorIyAgRmlsZXMKKyMgICAgIENPTlRSSUJVVElORworIyBAQCAtMzEsMTEgKzMyLDEyIEBACisj
ICAgICAgICAgSW5zdHJ1Y3Rpb25zIGZvciByZWxlYXNpbmcgYW5kIGRpc3RyaWJ1dGluZyBuZXcg
dmVyc2lvbnMuCisjICAKKyMgICAgIENoYW5nZXMsIENoYW5nZXMub2xkCisjIC0gICAgICAgQ2hh
bmdlIGxvZy4gIEluY2x1ZGVzIG1vc3QgcmVsZXZhbnQgY2hhbmdlcy4gIEhvd2V2ZXIsIGl0J3Mg
bm90IGFzCisjIC0gICAgICAgY29tcGxldGUgYXMgdGhlIGdpdCgxKSBsb2cuCisjICsgICAgICAg
Q2hhbmdlIGxvZy4gIEluY2x1ZGVzIG1vc3QgcmVsZXZhbnQgY2hhbmdlcy4gIEhvd2V2ZXIsIGl0
J3Mgbm90CisjICsgICAgICAgYXMgY29tcGxldGUgYXMgdGhlIGdpdCgxKSBsb2cuCisjICAKKyMg
LSAgIE1ha2VmaWxlLCBsaWIvKi5taworIyAtICAgICAgIEJ1aWxkIHN5c3RlbS4gIEZvciBoZWxw
LCBjb25zdWx0IHRoZSA8SU5TVEFMTD4gZmlsZSwgYW5kIHJ1biAnbWFrZSBoZWxwJy4KKyMgKyAg
IE1ha2VmaWxlLCBzaGFyZS9tay8qCisjICsgICAgICAgQnVpbGQgc3lzdGVtLiAgRm9yIGhlbHAs
IGNvbnN1bHQgdGhlIDxJTlNUQUxMPiBmaWxlLCBhbmQgcnVuCisjICsgICAgICAgJ21ha2UgaGVs
cCcuCisjICAKKyMgICAgIGxzbQorIyAgICAgICAgIExpbnV4IHNvZnR3YXJlIG1hcC4gIFNlZSBh
bHNvIDxodHRwczovL2xzbS5xcXgub3JnLz4uCisjIEBAIC00Nyw3ICs0OSw4IEBACisjICAgICAg
ICAgTGljZW5zZXMgaW4gdXNlIGJ5IHRoZSBwcm9qZWN0LgorIyAgCisjICAgICBldGMvKgorIyAt
ICAgICAgIENvbmZpZ3VyYXRpb24gZmlsZXMgZm9yIChsaW50ZXIpIHByb2dyYW1zIGNhbGxlZCBi
eSB0aGUgYnVpbGQgc3lzdGVtLgorIyArICAgICAgIENvbmZpZ3VyYXRpb24gZmlsZXMgZm9yIChs
aW50ZXIpIHByb2dyYW1zIGNhbGxlZCBieSB0aGUgYnVpbGQKKyMgKyAgICAgICBzeXN0ZW0uCisj
ICAKKyMgICAgIG1hbiovKgorIyAgICAgICAgIE1hbnVhbCBwYWdlcy4KKyMgQEAgLTU5LDM4ICs2
Miw3NyBAQAorIyAgICAgICAgIERlZmF1bHQgZGlyZWN0b3J5IGZvciBmaWxlcyBjcmVhdGVkIGJ5
IHRoZSBidWlsZCBzeXN0ZW0uCisjICAKKyMgIFZlcnNpb25zCisjIC0gICAgICAgVGFyYmFsbHMg
b2YgcmVsZWFzZXMgc3RhcnRpbmcgZnJvbSAyLjAwIGFyZSBhdmFpbGFibGUgYXQKKyMgLSAgICAg
ICA8aHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIvbGludXgvZG9jcy9tYW4tcGFn
ZXMvPi4KKyMgKyAgIFRhcmJhbGxzCisjICsgICAgICAgPGh0dHBzOi8vbWlycm9ycy5lZGdlLmtl
cm5lbC5vcmcvcHViL2xpbnV4L2RvY3MvbWFuLXBhZ2VzLz4KKyMgIAorIyAtICAgICAgIFRoZSBn
aXQoMSkgcmVwb3NpdG9yeSBjYW4gYmUgZm91bmQgYXQ6CisjICsgICBHaXQKKyMgICAgICAgICA8
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9kb2NzL21hbi1wYWdlcy9tYW4tcGFnZXMuZ2l0
PgorIyArICAgICAgIDxodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vZG9jcy9tYW4tcGFn
ZXMvbWFuLXBhZ2VzLmdpdC8+CisjICAKKyMgICAgICAgICBBIHNlY29uZGFyeSBnaXQoMSkgcmVw
b3NpdG9yeSBjYW4gYmUgZm91bmQgYXQ6CisjICAgICAgICAgPGdpdDovL3d3dy5hbGVqYW5kcm8t
Y29sb21hci5lcy9zcmMvYWx4L2xpbnV4L21hbi1wYWdlcy9tYW4tcGFnZXMuZ2l0PgorIyArICAg
ICAgIDxodHRwOi8vd3d3LmFsZWphbmRyby1jb2xvbWFyLmVzL3NyYy9hbHgvbGludXgvbWFuLXBh
Z2VzL21hbi1wYWdlcy5naXQvPgorIyAgCisjIC1DYXZlYXRzCisjIC0gICAgICAgU29tZSBwcm9q
ZWN0cyBwcm92aWRlIHRoZWlyIG93biBtYW51YWwgcGFnZXMsIG5vdCByZWxhdGVkIHRvIHRoZSBM
aW51eAorIyAtICAgICAgIG1hbi1wYWdlcyBwcm9qZWN0LgorIyArICAgT25saW5lIG1hbi1wYWdl
cworIyArICAgICAgIFBERgorIyArICAgICAgICAgICAgIDxodHRwczovL21pcnJvcnMuZWRnZS5r
ZXJuZWwub3JnL3B1Yi9saW51eC9kb2NzL21hbi1wYWdlcy9ib29rLz4KKyMgIAorIyAtQnVncwor
IyAtICAgICAgIFNlZSB0aGUgPENPTlRSSUJVVElORz4gZmlsZS4KKyMgK0hpc3RvcnkKKyMgKyAg
IFRhcmJhbGxzCisjICsgICAgICAgVGFyYmFsbHMgb2YgbWFuLXBhZ2VzLTEuKiByZWxlYXNlcyBh
cmUgYXZhaWxhYmxlIGF0OgorIyArICAgICAgIDxodHRwczovL3d3dy53aW4udHVlLm5sL35hZWIv
ZnRwZG9jcy9saW51eC1sb2NhbC9tYW5wYWdlcy5hcmNoaXZlLz4KKyMgIAorIyAtTWFpbnRhaW5l
cnMKKyMgKyAgIE1haW50YWluZXJzCisjICAgICAgICAgQWxlamFuZHJvIENvbG9tYXIgPGFseEBr
ZXJuZWwub3JnPiA8aHR0cDovL3d3dy5hbGVqYW5kcm8tY29sb21hci5lcy8+CisjICAgICAgICAg
ICAgICAgMjAyMCAtIHByZXNlbnQgKDUuMDkgLSBIRUFEKQorIyAgICAgICAgIE1pY2hhZWwgS2Vy
cmlzayA8bXRrLm1hbnBhZ2VzQGdtYWlsLmNvbT4gPGh0dHBzOi8vbWFuNy5vcmcvPgorIyAtICAg
ICAgICAgICAgIDIwMDQgLSAyMDIxICgyLjAwIC0gNS4xMykKKyMgKyAgICAgICAgICAgICAyMDA0
IC0gMjAyMSAgICAoMi4wMCAtIDUuMTMpCisjICAgICAgICAgQW5kcmllcyBCcm91d2VyIDxhZWJA
Y3dpLm5sPiA8aHR0cHM6Ly93d3cud2luLnR1ZS5ubC9+YWViPgorIyAgICAgICAgICAgICAgIDE5
OTUgLSAyMDA0ICAgICgxLjYgIC0gMS43MCkKKyMgICAgICAgICBSaWsgRmFpdGggPGh0dHBzOi8v
d3d3LmNzLnVuYy5lZHUvfmZhaXRoLz4KKyMgICAgICAgICAgICAgICAxOTkzIC0gMTk5NSAgICAo
MS4wICAtIDEuNSkKKyMgIAorIyArQ2F2ZWF0cworIyArICAgICAgIFNvbWUgcHJvamVjdHMgcHJv
dmlkZSB0aGVpciBvd24gbWFudWFsIHBhZ2VzLCBub3QgcmVsYXRlZCB0byB0aGUKKyMgKyAgICAg
ICBMaW51eCBtYW4tcGFnZXMgcHJvamVjdC4KKyMgKworIyArQnVncworIyArICAgICAgIFNlZSB0
aGUgPENPTlRSSUJVVElORz4gZmlsZS4KKyMgKworIyAgQ29weXJpZ2h0CisjIC0gICAgICAgU2V2
ZXJhbCBmcmVlL29wZW4gc291cmNlIGxpY2Vuc2VzLiAgU2VlIHRoZSA8TElDRU5TRVMvPiBkaXJl
Y3RvcnksIGFuZAorIyAtICAgICAgIHRoZSBjb21tZW50IGF0IHRoZSB0b3Agb2YgZWFjaCBzb3Vy
Y2UgZmlsZS4KKyMgKyAgICAgICBTZXZlcmFsIGZyZWUvb3BlbiBzb3VyY2UgbGljZW5zZXMuICBT
ZWUgdGhlIDxMSUNFTlNFUy8+CisjICsgICAgICAgZGlyZWN0b3J5LCBhbmQgdGhlIGNvbW1lbnQg
YXQgdGhlIHRvcCBvZiBlYWNoIHNvdXJjZSBmaWxlLgorIyAgCisjICBTZWUgYWxzbworIyAgICAg
ICAgIG1hbi1wYWdlcyg3KQorIyAgCisjICAgICBXZWJzaXRlCisjICAgICAgICAgPGh0dHA6Ly93
d3cua2VybmVsLm9yZy9kb2MvbWFuLXBhZ2VzL2luZGV4Lmh0bWw+LgorIyArCisjICsgICBEb3du
c3RyZWFtIHBhY2thZ2VzCisjICsgICAgICAgQXJjaCBtYW4tcGFnZXMKKyMgKyAgICAgICAgICAg
ICA8aHR0cHM6Ly9hcmNobGludXgub3JnL3BhY2thZ2VzL2NvcmUvYW55L21hbi1wYWdlcy8+Cisj
ICsgICAgICAgRGViaWFuIG1hbnBhZ2VzCisjICsgICAgICAgICAgICAgPGh0dHBzOi8vdHJhY2tl
ci5kZWJpYW4ub3JnL3BrZy9tYW5wYWdlcz4KKyMgKyAgICAgICBGZWRvcmEgcnBtcy9tYW4tcGFn
ZXMKKyMgKyAgICAgICAgICAgICA8aHR0cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5vcmcvcnBtcy9t
YW4tcGFnZXM+CisjICsgICAgICAgR2VudG9vIHN5cy1hcHBzL21hbi1wYWdlcworIyArICAgICAg
ICAgICAgIDxodHRwczovL3BhY2thZ2VzLmdlbnRvby5vcmcvcGFja2FnZXMvc3lzLWFwcHMvbWFu
LXBhZ2VzPgorIyArICAgICAgIG9wZW5TVVNFIG1hbi1wYWdlcworIyArICAgICAgICAgICAgIDxo
dHRwczovL3NvZnR3YXJlLm9wZW5zdXNlLm9yZy9wYWNrYWdlL21hbi1wYWdlcz4KKyMgKworIyAr
ICAgUmVsYXRlZCBwcm9qZWN0cworIyArICAgICAgIERlYmlhbiBtYW5wYWdlcy1sMTBuCisjICsg
ICAgICAgICAgICAgPGh0dHBzOi8vbWFucGFnZXMtbDEwbi10ZWFtLnBhZ2VzLmRlYmlhbi5uZXQv
bWFucGFnZXMtbDEwbi8+CisjICsgICAgICAgR05VIEMgTGlicmFyeSAoZ2xpYmMpCisjICsgICAg
ICAgICAgICAgPGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvbGliYy8+CisjICsgICAgICAg
R05VIENvbXBpbGVyIENvbGxlY3Rpb24gKEdDQykKKyMgKyAgICAgICAgICAgICA8aHR0cHM6Ly9n
Y2MuZ251Lm9yZy8+CisjICsgICAgICAgR05VIHJvZmYgKGdyb2ZmKQorIyArICAgICAgICAgICAg
IDxodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2dyb2ZmLz4KKyMgKyAgICAgICBMaW51eCBr
ZXJuZWwKKyMgKyAgICAgICAgICAgICA8aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9s
YXRlc3QvCisjICsgICAgICAgbWFuLWRiCisjICsgICAgICAgICAgICAgPGh0dHBzOi8vbWFuLWRi
LmdpdGxhYi5pby9tYW4tZGIvPgorIyArICAgICAgIG1hbmRvYworIyArICAgICAgICAgICAgIDxo
dHRwczovL21hbmRvYy5ic2QubHYvPgorIyAKKyMKKwogU1VNTUFSWSA9ICJMaW51eCBtYW4tcGFn
ZXMiCiBERVNDUklQVElPTiA9ICJUaGUgTGludXggbWFuLXBhZ2VzIHByb2plY3QgZG9jdW1lbnRz
IHRoZSBMaW51eCBrZXJuZWwgYW5kIEMgbGlicmFyeSBpbnRlcmZhY2VzIHRoYXQgYXJlIGVtcGxv
eWVkIGJ5IHVzZXIgcHJvZ3JhbXMiCiBTRUNUSU9OID0gImNvbnNvbGUvdXRpbHMiCiBIT01FUEFH
RSA9ICJodHRwOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2RvY3MvbWFuLXBhZ2VzIgogTElD
RU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyICYgR1BMLTIuMC1vbmx5ICYgR1BMLTEuMC1vci1sYXRl
ciAmIEJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSAmIEJTRC00LUNsYXVzZSAmIE1JVCIKIAot
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FO21kNT01YjdkNzQ4ODM0NGY1YWY4ODQx
ZGMxM2FhZWM0OWNkZiBcCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUU7bWQ1PWNi
ZDUxY2QzZGQyOTgyMzBkZjhkZGQ0NjM3ZTY1YzM3IFwKICAgICAgICAgICAgICAgICAgICAgZmls
ZTovL0xJQ0VOU0VTL0JTRC0yLUNsYXVzZS50eHQ7bWQ1PWQwZjI4MGQxMDU4ZTc3ZTY2MjY0YTli
OWUxMGU2Yzg5IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0JTRC0zLUNs
YXVzZS50eHQ7bWQ1PTcxZjczOWVmNzU1ODFjYWUzMTJlOGM3MTFiY2RhYjE2IFwKICAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0JTRC00LUNsYXVzZS1VQy50eHQ7bWQ1PTFkYTNj
ZjhhZDUwY2Q4ZDVkMWRlM2NmYzUzMTk2ZDAxIFwKQEAgLTE2LDcgKzE3Miw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL1JFQURNRTttZDU9NWI3ZDc0ODgzNDRmNWFmODg0MWRjMTNhYWVj
NDljZGYgXAogICAgICAgICAgICAgICAgICAgICAiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01J
UlJPUn0vbGludXgvZG9jcy8ke0JQTn0vJHtCUH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNTkwNjIzYjk5YmYxZjhlZTk1ODQ4M2MzNWNjMGFhZWYyMzYzZTQyOTk4YzRkOTI3ZDFm
NzA1ODkwZDE1ZDUxZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMmRkNDRjYTAzNDJiNTA5MjMy
OTFmMDZiZGJhMzhjNDI0MzhlMTBjMDQ4NDNjZTFmNzMxY2YzZjUwNjMxZTBhIgogCiBpbmhlcml0
IG1hbnBhZ2VzCiAKLS0gCjIuMzkuMgoK

--===============8902110537421290982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man2/ioctl_pipe.2 /usr/share/man/man5/erofs.5"

--===============8902110537421290982==--

