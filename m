Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1291.1618510600040293984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id BCEDE38C135F
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.2.1 SUCCEEDED
Message-ID: <MADEUP.16761AD0CA4D3A51.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150497
Content-Type: multipart/mixed; boundary="===============0810004064587821045=="

--===============0810004064587821045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.2-4.2.1.patch
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

--===============0810004064587821045==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.2-4.2.1.patch"

From 15b6bfd2a899fd7305ae0ab0304ec7920c69985b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 03:52:19 +0000
Subject: [PATCH] ccache: upgrade 4.2 -> 4.2.1

---
 .../ccache/{ccache_4.2.bb => ccache_4.2.1.bb} | 96 ++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.2.bb => ccache_4.2.1.bb} (12%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.2.bb b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
similarity index 12%
rename from meta/recipes-devtools/ccache/ccache_4.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.2.1.bb
index 9957bc7e65..d84fcd2b24 100644
--- a/meta/recipes-devtools/ccache/ccache_4.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
@@ -1,3 +1,95 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.adoc
+# +++ LICENSE.adoc
+# @@ -421,12 +421,12 @@
+#  ~~~~~~~~~~~~~~~~~~~~~~~~~
+#  
+#  This is the single header version of https://github.com/onqtam/doctest[doctest]
+# -2.4.4 with the following license:
+# +2.4.6 with the following license:
+#  
+#  -------------------------------------------------------------------------------
+#  The MIT License (MIT)
+#  
+# -Copyright (c) 2016-2020 Viktor Kirilov
+# +Copyright (c) 2016-2021 Viktor Kirilov
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# @@ -662,6 +662,63 @@
+#  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+#  -------------------------------------------------------------------------------
+#  
+# +src/third_party/win32/winerror_to_errno.h
+# +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+# +
+# +The implementation of `winerror_to_errno()` was adapted from
+# +<https://github.com/python/cpython/blob/1a79785e3e8fea80bcf6a800b45a04e06c787480/PC/errmap.h>
+# +and has the folowing license text:
+# +
+# +-------------------------------------------------------------------------------
+# +PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
+# +
+# +1. This LICENSE AGREEMENT is between the Python Software Foundation
+# +("PSF"), and the Individual or Organization ("Licensee") accessing and
+# +otherwise using this software ("Python") in source or binary form and
+# +its associated documentation.
+# +
+# +2. Subject to the terms and conditions of this License Agreement, PSF hereby
+# +grants Licensee a nonexclusive, royalty-free, world-wide license to reproduce,
+# +analyze, test, perform and/or display publicly, prepare derivative works,
+# +distribute, and otherwise use Python alone or in any derivative version,
+# +provided, however, that PSF's License Agreement and PSF's notice of copyright,
+# +i.e., "Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
+# +2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021 Python Software Foundation;
+# +All Rights Reserved" are retained in Python alone or in any derivative version
+# +prepared by Licensee.
+# +
+# +3. In the event Licensee prepares a derivative work that is based on
+# +or incorporates Python or any part thereof, and wants to make
+# +the derivative work available to others as provided herein, then
+# +Licensee hereby agrees to include in any such work a brief summary of
+# +the changes made to Python.
+# +
+# +4. PSF is making Python available to Licensee on an "AS IS"
+# +basis.  PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
+# +IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND
+# +DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
+# +FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT
+# +INFRINGE ANY THIRD PARTY RIGHTS.
+# +
+# +5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
+# +FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
+# +A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,
+# +OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
+# +
+# +6. This License Agreement will automatically terminate upon a material
+# +breach of its terms and conditions.
+# +
+# +7. Nothing in this License Agreement shall be deemed to create any
+# +relationship of agency, partnership, or joint venture between PSF and
+# +Licensee.  This License Agreement does not grant permission to use PSF
+# +trademarks or trade name in a trademark sense to endorse or promote
+# +products or services of Licensee, or any third party.
+# +
+# +8. By copying, installing or otherwise using Python, Licensee
+# +agrees to be bound by the terms and conditions of this License
+# +Agreement.
+# +-------------------------------------------------------------------------------
+# +
+#  src/third_party/xxh*
+#  ~~~~~~~~~~~~~~~~~~~~
+#  
+# 
+#
+
 SUMMARY = "a fast C/C++ compiler cache"
 DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
 by caching the result of previous compilations and detecting when the \
@@ -7,12 +99,12 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=28afb89f649f309e7ac1aab554564637"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=698a26b57e513d678e1e7727bf56395b"
 
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "dbf139ff32031b54cb47f2d7983269f328df14b5a427882f89f7721e5c411b7e"
+SRC_URI[sha256sum] = "320d2b17d2f76393e5d4bb28c8dee5ca783248e9cd23dff0654694d60f8a4b62"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.27.0


--===============0810004064587821045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.2 [default] to 4.2.1 [default]
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 19520016 to 19552736 (+0%)
packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.2" to "4.2.1"
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.2 [default] to 4.2.1 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.2" to "4.2.1"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.2 [default] to 4.2.1 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.2" to "4.2.1"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.2 [default] to 4.2.1 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.2" to "4.2.1"
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.2 [default] to 4.2.1 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1320954 to 1329791 (+1%)
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.2" to "4.2.1"
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.2 [default] to 4.2.1 [default]
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.2" to "4.2.1"
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.2 [default] to 4.2.1 [default]
packages/core2-32-poky-linux/ccache/ccache: PKGSIZE changed from 1082084 to 1086332 (+0%)
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.2" to "4.2.1"
packages/core2-32-poky-linux/ccache: PKGV changed from 4.2 [default] to 4.2.1 [default]
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases/download/v4.2/ccache-4.2.tar.gz" to "https://github.com/ccache/ccache/releases/download/v4.2.1/ccache-4.2.1.tar.gz"
packages/core2-32-poky-linux/ccache: PV changed from "4.2" to "4.2.1"

--===============0810004064587821045==--
