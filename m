Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92240D6205C
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4852.1731964656837425216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SPnGxGh7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=i7XL6CCG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019341235aec-3fab8f8c-d0b3-4d6d-824d-626bc9113290-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964656;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nv+wnW7rVcCc9LsXiWmfRY/OcH+hqxZxH1AhwZF6G4s=;
	b=SPnGxGh7RBvXoPrM15wQ38cGSLhG0+JBMiKUZfGDJuIWoBXE/C1cTsaZRxbEgU2y
	q6bpnpT4+l4aqB6MgwI4/bc//KNit5wp9s5FCB7RqM2jqy9gZMOCwor3vzLB0HlkCbk
	Dxp7m/Ehbo2KqmFB1j2HAMTWj6w6QlBc0uylzlJ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964656;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nv+wnW7rVcCc9LsXiWmfRY/OcH+hqxZxH1AhwZF6G4s=;
	b=i7XL6CCGSZwZOmc2K1u4ZKSO28ACRNIITPEc89fLyprd+Vgz3zqChQcgBf4A2HHH
	ZOypGCrfzZRVOQk/7+CV4bSapJJk/e5eyxsmXmUB68aGqT9YYE29FUOARtjBzsBuoPa
	SGN0wfXUP1h6WpE7xvdpmrHbuZMmiO4r4YXzUz/w=
Content-Type: multipart/mixed; boundary="===============4623516845656285146=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.16p1 SUCCEEDED
Message-ID: <0101019341235aec-3fab8f8c-d0b3-4d6d-824d-626bc9113290-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207318

--===============4623516845656285146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sudo* to *1.9.16p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.15p5-1.9.16p1.patch
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
From 264b8e1e4030113a1c1d59b81d5a7bf75d697ef4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 12:58:55 +0000
Subject: [PATCH] sudo: upgrade 1.9.15p5 -> 1.9.16p1

---
 ...o.conf.in-fix-conflict-with-multilib.patch |  3 +-
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../{sudo_1.9.15p5.bb => sudo_1.9.16p1.bb}    | 54 ++++++++++++++++++-
 3 files changed, 55 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p5.bb => sudo_1.9.16p1.bb} (52%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index 041c717e00..ec0384e257 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 6e835350b7413210c410d3578cfab804186b7a4f Mon Sep 17 00:00:00 2001
+From 61ae82a2ba502492b6a78f248258abb71daeb227 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
@@ -15,7 +15,6 @@ Update the comments in sudo.conf.in to avoid the conflict.
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Upstream-Status: Inappropriate [OE configuration specific]
-
 ---
  examples/sudo.conf.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index feb1cf35a7..0afbf669f0 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a6876cbeb2aa51837935ba3fd82ee87 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb b/meta/recipes-extended/sudo/sudo_1.9.16p1.bb
similarity index 52%
rename from meta/recipes-extended/sudo/sudo_1.9.15p5.bb
rename to meta/recipes-extended/sudo/sudo_1.9.16p1.bb
index 2fd2ae6d05..22d05ba9e0 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.16p1.bb
@@ -1,3 +1,55 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.md
+# +++ LICENSE.md
+# @@ -1,6 +1,6 @@
+#  Sudo is distributed under the following license:
+#  
+# -    Copyright (c) 1994-1996, 1998-2023
+# +    Copyright (c) 1994-1996, 1998-2024
+#          Todd C. Miller <Todd.Miller@sudo.ws>
+#  
+#      Permission to use, copy, modify, and distribute this software for any
+# @@ -247,9 +247,9 @@
+#  
+#  The file arc4random.c bears the following license:
+#  
+# -    Copyright (c) 1996, David Mazieres <dm@uun.org>  
+# -    Copyright (c) 2008, Damien Miller <djm@openbsd.org>  
+# -    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>  
+# +    Copyright (c) 1996, David Mazieres <dm@uun.org>
+# +    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
+# +    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
+#      Copyright (c) 2014, Theo de Raadt <deraadt@openbsd.org>
+#  
+#      Permission to use, copy, modify, and distribute this software for any
+# @@ -282,7 +282,7 @@
+#  
+#  The file getentropy.c bears the following license:
+#  
+# -    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>  
+# +    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
+#      Copyright (c) 2014 Bob Beck <beck@obtuse.com>
+#  
+#      Permission to use, copy, modify, and distribute this software for any
+# @@ -299,7 +299,7 @@
+#  
+#  The embedded copy of zlib bears the following license:
+#  
+# -    Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
+# +    Copyright (C) 1995-2024 Jean-loup Gailly and Mark Adler
+#  
+#      This software is provided 'as-is', without any express or implied
+#      warranty.  In no event will the authors be held liable for any damages
+# 
+#
+
 require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
@@ -7,7 +59,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
+SRC_URI[sha256sum] = "404994e23ae8bcf4be59ed6fd3759ad70a8cefa9bcf71640b33f176afec243b0"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.44.1


--===============4623516845656285146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/sudo/sudo-locale-id: PKGSIZE changed from 25107 to 102302 (+307%)
packages/core2-64-poky-linux/sudo/sudo-locale-id: FILELIST: added "/usr/share/locale/id/LC_MESSAGES/sudoers.mo"

--===============4623516845656285146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sudo: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.15p5.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.16p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/core2-64-poky-linux/sudo: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 5976848 to 6061624 (+1%)
packages/core2-64-poky-linux/sudo/sudo-dbg: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-dev: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-doc: PKGSIZE changed from 3242721 to 3304845 (+2%)
packages/core2-64-poky-linux/sudo/sudo-doc: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-lib: PKGSIZE changed from 989984 to 987764 (-0%)
packages/core2-64-poky-linux/sudo/sudo-lib: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PKGSIZE changed from 103529 to 104334 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-de: PKGSIZE changed from 108188 to 109012 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PKGSIZE changed from 99925 to 100702 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PKGSIZE changed from 112573 to 113430 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PKGSIZE changed from 104555 to 105272 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-id: FILELIST: added "/usr/share/locale/id/LC_MESSAGES/sudoers.mo"
packages/core2-64-poky-linux/sudo/sudo-locale-id: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-id: PKGSIZE changed from 25107 to 102302 (+307%)
packages/core2-64-poky-linux/sudo/sudo-locale-id: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PKGSIZE changed from 117674 to 118521 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PKGSIZE changed from 108487 to 109328 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PKGSIZE changed from 104926 to 105772 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PKGSIZE changed from 108464 to 109287 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PKGSIZE changed from 138599 to 139626 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PKGSIZE changed from 100035 to 100578 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PKGSIZE changed from 141957 to 143022 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PKGSIZE changed from 86572 to 88091 (+2%)
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-src: FILELIST: directory renamed /usr/src/debug/sudo/1.9.15p5/include/compat -> /usr/src/debug/sudo/1.9.16p1/include/compat, directory renamed /usr/src/debug/sudo/1.9.15p5/include/protobuf-c -> /usr/src/debug/sudo/1.9.16p1/include/protobuf-c, directory renamed /usr/src/debug/sudo/1.9.15p5/plugins/system_group -> /usr/src/debug/sudo/1.9.16p1/plugins/system_group, directory renamed /usr/src/debug/sudo/1.9.15p5/lib/protobuf-c -> /usr/src/debug/sudo/1.9.16p1/lib/protobuf-c, directory renamed /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/auth -> /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/auth, directory renamed /usr/src/debug/sudo/1.9.15p5/logsrvd -> /usr/src/debug/sudo/1.9.16p1/logsrvd, directory renamed /usr/src/debug/sudo/1.9.15p5/plugins/audit_json -> /usr/src/debug/sudo/1.9.16p1/plugins/audit_json, directory renamed /usr/src/debug/sudo/1.9.15p5/lib/iolog -> /usr/src/debug/sudo/1.9.16p1/lib/iolog, directory renamed /usr/src/debug/sudo/1.9.15p5/l
 ib/eventlog -> /usr/src/debug/sudo/1.9.16p1/lib/eventlog, directory renamed /usr/src/debug/sudo/1.9.15p5/plugins/group_file -> /usr/src/debug/sudo/1.9.16p1/plugins/group_file, directory renamed /usr/src/debug/sudo/1.9.15p5/include -> /usr/src/debug/sudo/1.9.16p1/include, directory renamed /usr/src/debug/sudo/1.9.15p5/lib/logsrv -> /usr/src/debug/sudo/1.9.16p1/lib/logsrv, directory renamed /usr/src/debug/sudo/1.9.15p5/src -> /usr/src/debug/sudo/1.9.16p1/src, removed "/usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudoreplay.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/canon_path.c /usr/src/debug/sudo/1.9.15p5/lib/util/sudo_dso.c /usr/src/debug/sudo/1.9.15p5/lib/util/multiarch.c /usr/src/debug/sudo/1.9.15p5/lib/util/parseln.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/match.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/env_pattern.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/cvtsudoers.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/strlist.h /usr/src/debug/sudo/1.9.15p5/lib/util/
 freezero.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/tsgetusershell.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/fmtsudoers.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/parse_ldif.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/cvtsudoers.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/strlist.c /usr/src/debug/sudo/1.9.15p5/lib/util/ttyname_dev.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/timestr.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/pwutil_impl.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/logging.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudo_nss.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/check_util.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/logging.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudo_nss.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/display.c /usr/src/debug/sudo/1.9.15p5/lib/util/key_val.c /usr/src/debug/sudo/1.9.15p5/lib/util/strtoid.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/cvtsudoers_json.c /usr/src/debug/sudo/1.9.15p5/plugin
 s/sudoers/sudoers.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudoers.c /usr/src/debug/sudo/1.9.15p5/lib/util/closefrom.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/tsgetgrpw.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/cvtsudoers_pwutil.c /usr/src/debug/sudo/1.9.15p5/lib/util/strsplit.c /usr/src/debug/sudo/1.9.15p5/lib/util/strtobool.c /usr/src/debug/sudo/1.9.15p5/lib/util/strtomode.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/tsgetgrpw.h /usr/src/debug/sudo/1.9.15p5/lib/util/chacha_private.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/cvtsudoers_csv.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/cvtsudoers_merge.c /usr/src/debug/sudo/1.9.15p5/lib/util/mkdir_parents.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/defaults.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/set_perms.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/iolog.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/visudo_cb.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/cvtsudoers_ldif.c /usr/src/debug/sudo/1.9
 .15p5/plugins/sudoers/defaults.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudoers_ctx_free.c /usr/src/debug/sudo/1.9.15p5/lib/util/rcstr.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/starttime.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/env.c /usr/src/debug/sudo/1.9.15p5/lib/util/json.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/b64_encode.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/log_client.c /usr/src/debug/sudo/1.9.15p5/lib/util/uuid.c /usr/src/debug/sudo/1.9.15p5/lib/util/event_poll.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/audit.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/log_client.h /usr/src/debug/sudo/1.9.15p5/lib/util/getgrouplist.c /usr/src/debug/sudo/1.9.15p5/lib/util/logfac.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/filedigest.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/interfaces.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/timestamp.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudo_printf.c /usr/src/debug/sudo/1.9.15p5/lib/util/secure_p
 ath.c /usr/src/debug/sudo/1.9.15p5/lib/util/sha2.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/interfaces.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/timestamp.h /usr/src/debug/sudo/1.9.15p5/lib/util/gettime.c /usr/src/debug/sudo/1.9.15p5/lib/util/hexchar.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/policy.c /usr/src/debug/sudo/1.9.15p5/lib/util/roundup.c /usr/src/debug/sudo/1.9.15p5/lib/util/setgroups.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudoers_hooks.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/parser_warnx.c /usr/src/debug/sudo/1.9.15p5/lib/util/str2sig.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/resolve_cmnd.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/strvec_join.c /usr/src/debug/sudo/1.9.15p5/lib/util/term.c /usr/src/debug/sudo/1.9.15p5/lib/util/pw_dup.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/goodpath.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudoers_cb.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/def_data.h /usr/src/debug/sudo/1.9.15p5/lib/
 util/basename.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/def_data.c /usr/src/debug/sudo/1.9.15p5/lib/util/locking.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/editor.c /usr/src/debug/sudo/1.9.15p5/lib/util/fatal.c /usr/src/debug/sudo/1.9.15p5/lib/util/sudo_conf.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudoers_debug.h /usr/src/debug/sudo/1.9.15p5/lib/util/gidlist.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/gentime.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/group_plugin.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/match_addr.c /usr/src/debug/sudo/1.9.15p5/lib/util/logpri.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudoers_debug.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/parse.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/testsudoers_pwutil.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/toke_util.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/file.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/toke.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/locale.c /us
 r/src/debug/sudo/1.9.15p5/lib/util/digest.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/gc.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/pwutil.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/exptilde.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/toke.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/timeout.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sudo_ldap.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/toke.l /usr/src/debug/sudo/1.9.15p5/lib/util/strtonum.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/pwutil.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/lookup.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/getdate.y /usr/src/debug/sudo/1.9.15p5/lib/util/ttysize.c /usr/src/debug/sudo/1.9.15p5/lib/util/getentropy.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/getdate.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/prompt.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/fmtsudoers_cvt.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/match_command.c /usr/src/debug/sudo/1.9.15p5/lib/u
 til/sig2str.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/check_aliases.c /usr/src/debug/sudo/1.9.15p5/lib/util/arc4random.c /usr/src/debug/sudo/1.9.15p5/lib/util/snprintf.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/redblack.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/b64_decode.c /usr/src/debug/sudo/1.9.15p5/lib/util/mktemp.c /usr/src/debug/sudo/1.9.15p5/lib/util/event.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/check.c /usr/src/debug/sudo/1.9.15p5/lib/util/fnmatch.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/redblack.c /usr/src/debug/sudo/1.9.15p5/lib/util/mmap_alloc.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/gram.y /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/digestname.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/stubs.c /usr/src/debug/sudo/1.9.15p5/lib/util/arc4random_uniform.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/gram.h /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/strlcpy_unesc.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/pivot.h /usr/src/debug/sudo
 /1.9.15p5/plugins/sudoers/gram.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/ldap_util.c /usr/src/debug/sudo/1.9.15p5/lib/util/gethostname.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/pivot.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/match_digest.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/alias.c /usr/src/debug/sudo/1.9.15p5/lib/util/regex.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/find_path.c /usr/src/debug/sudo/1.9.15p5/lib/util/progname.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/serialize_list.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/unesc_str.c /usr/src/debug/sudo/1.9.15p5/lib/util/lbuf.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/boottime.c /usr/src/debug/sudo/1.9.15p5/lib/util/sudo_debug.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/sethost.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/visudo.c /usr/src/debug/sudo/1.9.15p5/plugins/sudoers/iolog_path_escapes.c", added "/usr/src/debug/sudo/1.9.16p1/plugins/sudoers/goodpath.c /usr/src/debug/sudo/1.9.16
 p1/plugins/sudoers/sudoers_cb.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/def_data.h /usr/src/debug/sudo/1.9.16p1/lib/util/basename.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/def_data.c /usr/src/debug/sudo/1.9.16p1/lib/util/locking.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/editor.c /usr/src/debug/sudo/1.9.16p1/lib/util/fatal.c /usr/src/debug/sudo/1.9.16p1/lib/util/sudo_conf.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudoers_debug.h /usr/src/debug/sudo/1.9.16p1/lib/util/gidlist.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/gentime.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/group_plugin.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/match_addr.c /usr/src/debug/sudo/1.9.16p1/lib/util/logpri.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudoers_debug.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/parse.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/testsudoers_pwutil.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/toke_util.c /usr/src/debug/sudo/1.9.16p1/plugins/sud
 oers/file.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/toke.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/locale.c /usr/src/debug/sudo/1.9.16p1/lib/util/digest.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/gc.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/pwutil.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/exptilde.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/toke.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/timeout.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudo_ldap.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/toke.l /usr/src/debug/sudo/1.9.16p1/lib/util/strtonum.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/pwutil.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/lookup.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/getdate.y /usr/src/debug/sudo/1.9.16p1/lib/util/ttysize.c /usr/src/debug/sudo/1.9.16p1/lib/util/getentropy.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/getdate.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/prompt.c /usr/src/debug/sudo/1.9.16p1/plugins
 /sudoers/fmtsudoers_cvt.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/match_command.c /usr/src/debug/sudo/1.9.16p1/lib/util/sig2str.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/check_aliases.c /usr/src/debug/sudo/1.9.16p1/lib/util/arc4random.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/redblack.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/b64_decode.c /usr/src/debug/sudo/1.9.16p1/lib/util/mktemp.c /usr/src/debug/sudo/1.9.16p1/lib/util/event.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/check.c /usr/src/debug/sudo/1.9.16p1/lib/util/fnmatch.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/redblack.c /usr/src/debug/sudo/1.9.16p1/lib/util/mmap_alloc.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/gram.y /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/digestname.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/stubs.c /usr/src/debug/sudo/1.9.16p1/lib/util/arc4random_uniform.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/gram.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/strlcpy_unesc.c 
 /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/pivot.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/gram.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/ldap_util.c /usr/src/debug/sudo/1.9.16p1/lib/util/gethostname.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/pivot.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/match_digest.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/alias.c /usr/src/debug/sudo/1.9.16p1/lib/util/regex.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/insults.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/find_path.c /usr/src/debug/sudo/1.9.16p1/lib/util/progname.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/serialize_list.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/unesc_str.c /usr/src/debug/sudo/1.9.16p1/lib/util/lbuf.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/boottime.c /usr/src/debug/sudo/1.9.16p1/lib/util/sudo_debug.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sethost.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/visudo.c /usr/src/debug/sudo/1.9.16p1/p
 lugins/sudoers/iolog_path_escapes.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/canon_path.c /usr/src/debug/sudo/1.9.16p1/lib/util/sudo_dso.c /usr/src/debug/sudo/1.9.16p1/lib/util/multiarch.c /usr/src/debug/sudo/1.9.16p1/lib/util/parseln.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudoreplay.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/match.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/env_pattern.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/cvtsudoers.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/strlist.h /usr/src/debug/sudo/1.9.16p1/lib/util/freezero.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/tsgetusershell.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/cvtsudoers.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/fmtsudoers.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/parse_ldif.c /usr/src/debug/sudo/1.9.16p1/lib/util/ttyname_dev.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/strlist.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/pwutil_impl.c /usr/src/debug/sudo/1.
 9.16p1/plugins/sudoers/timestr.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/logging.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudo_nss.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/check_util.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/logging.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudo_nss.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/display.c /usr/src/debug/sudo/1.9.16p1/lib/util/key_val.c /usr/src/debug/sudo/1.9.16p1/lib/util/strtoid.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/cvtsudoers_json.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudoers.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudoers.c /usr/src/debug/sudo/1.9.16p1/lib/util/closefrom.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/tsgetgrpw.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/cvtsudoers_pwutil.c /usr/src/debug/sudo/1.9.16p1/lib/util/strsplit.c /usr/src/debug/sudo/1.9.16p1/lib/util/strtobool.c /usr/src/debug/sudo/1.9.16p1/lib/util/strtomode.c /usr/src/debug/sudo/1.9.16p1/plugins/su
 doers/tsgetgrpw.h /usr/src/debug/sudo/1.9.16p1/lib/util/chacha_private.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/cvtsudoers_csv.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/cvtsudoers_merge.c /usr/src/debug/sudo/1.9.16p1/lib/util/mkdir_parents.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/defaults.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/set_perms.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/iolog.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/cvtsudoers_ldif.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/defaults.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/visudo_cb.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudoers_ctx_free.c /usr/src/debug/sudo/1.9.16p1/lib/util/rcstr.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/starttime.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/env.c /usr/src/debug/sudo/1.9.16p1/lib/util/json.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/b64_encode.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/log_client.c /usr/src/debug/sudo/1.9
 .16p1/lib/util/uuid.c /usr/src/debug/sudo/1.9.16p1/lib/util/event_poll.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/audit.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/log_client.h /usr/src/debug/sudo/1.9.16p1/lib/util/getgrouplist.c /usr/src/debug/sudo/1.9.16p1/lib/util/logfac.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/filedigest.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/interfaces.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/sudo_printf.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/timestamp.c /usr/src/debug/sudo/1.9.16p1/lib/util/secure_path.c /usr/src/debug/sudo/1.9.16p1/lib/util/sha2.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/interfaces.h /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/timestamp.h /usr/src/debug/sudo/1.9.16p1/lib/util/gettime.c /usr/src/debug/sudo/1.9.16p1/lib/util/hexchar.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/policy.c /usr/src/debug/sudo/1.9.16p1/lib/util/roundup.c /usr/src/debug/sudo/1.9.16p1/lib/util/setgroups.c /usr/src/debug/sudo/1
 .9.16p1/plugins/sudoers/sudoers_hooks.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/parser_warnx.c /usr/src/debug/sudo/1.9.16p1/lib/util/str2sig.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/resolve_cmnd.c /usr/src/debug/sudo/1.9.16p1/plugins/sudoers/strvec_join.c /usr/src/debug/sudo/1.9.16p1/lib/util/term.c /usr/src/debug/sudo/1.9.16p1/lib/util/pw_dup.c"
packages/core2-64-poky-linux/sudo/sudo-src: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-src: PKGSIZE changed from 3605431 to 3586578 (-1%)
packages/core2-64-poky-linux/sudo/sudo-src: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo-sudo: PKGSIZE changed from 294092 to 294060 (-0%)
packages/core2-64-poky-linux/sudo/sudo-sudo: PV changed from "1.9.15p5" to "1.9.16p1"
packages/core2-64-poky-linux/sudo/sudo: PKGV changed from 1.9.15p5 [default] to 1.9.16p1 [default]
packages/core2-64-poky-linux/sudo/sudo: PKGSIZE changed from 1251184 to 1276016 (+2%)
packages/core2-64-poky-linux/sudo/sudo: PV changed from "1.9.15p5" to "1.9.16p1"

--===============4623516845656285146==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.15p5-1.9.16p1.patch"

RnJvbSAyNjRiOGUxZTQwMzAxMTNhMWMxZDU5YjgxZDVhN2JmNzVkNjk3ZWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMTI6NTg6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dWRvOiB1cGdyYWRlIDEuOS4xNXA1IC0+IDEuOS4xNnAxCgotLS0KIC4uLm8uY29uZi5pbi1maXgt
Y29uZmxpY3Qtd2l0aC1tdWx0aWxpYi5wYXRjaCB8ICAzICstCiBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc3Vkby9zdWRvLmluYyAgICAgICAgICAgfCAgMiArLQogLi4uL3tzdWRvXzEuOS4xNXA1LmJi
ID0+IHN1ZG9fMS45LjE2cDEuYmJ9ICAgIHwgNTQgKysrKysrKysrKysrKysrKysrLQogMyBmaWxl
cyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9zdWRvL3tzdWRvXzEuOS4xNXA1LmJiID0+IHN1ZG9fMS45LjE2cDEu
YmJ9ICg1MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8vZmlsZXMv
MDAwMS1zdWRvLmNvbmYuaW4tZml4LWNvbmZsaWN0LXdpdGgtbXVsdGlsaWIucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9maWxlcy8wMDAxLXN1ZG8uY29uZi5pbi1maXgtY29uZmxp
Y3Qtd2l0aC1tdWx0aWxpYi5wYXRjaAppbmRleCAwNDFjNzE3ZTAwLi5lYzAzODRlMjU3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9maWxlcy8wMDAxLXN1ZG8uY29uZi5p
bi1maXgtY29uZmxpY3Qtd2l0aC1tdWx0aWxpYi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc3Vkby9maWxlcy8wMDAxLXN1ZG8uY29uZi5pbi1maXgtY29uZmxpY3Qtd2l0aC1tdWx0
aWxpYi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmU4MzUzNTBiNzQxMzIxMGM0MTBkMzU3
OGNmYWI4MDQxODZiN2E0ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjFhZTgyYTJi
YTUwMjQ5MmI2YTc4ZjI0ODI1OGFiYjcxZGFlYjIyNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBO
b3YgMjAyMCAxMToxMzo0MCArMDgwMAogU3ViamVjdDogW1BBVENIXSBzdWRvLmNvbmYuaW46IGZp
eCBjb25mbGljdCB3aXRoIG11bHRpbGliCkBAIC0xNSw3ICsxNSw2IEBAIFVwZGF0ZSB0aGUgY29t
bWVudHMgaW4gc3Vkby5jb25mLmluIHRvIGF2b2lkIHRoZSBjb25mbGljdC4KIFNpZ25lZC1vZmYt
Ynk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogCiBVcHN0cmVhbS1TdGF0dXM6
IEluYXBwcm9wcmlhdGUgW09FIGNvbmZpZ3VyYXRpb24gc3BlY2lmaWNdCi0KIC0tLQogIGV4YW1w
bGVzL3N1ZG8uY29uZi5pbiB8IDggKysrKy0tLS0KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3N1ZG8vc3Vkby5pbmMgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvLmluYwppbmRl
eCBmZWIxY2YzNWE3Li4wYWZiZjY2OWYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc3Vkby9zdWRvLmluYworKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvLmlu
YwpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5zdWRvLndzIgogQlVHVFJB
Q0tFUiA9ICJodHRwOi8vd3d3LnN1ZG8ud3MvYnVncy8iCiBTRUNUSU9OID0gImFkbWluIgogTElD
RU5TRSA9ICJJU0MgJiBCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2UgJiBabGliIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9NTEwMGUyMGQzNWY5MDE1ZjllZWY2
YmRiMjdiYTE5NGYgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9
MGE2ODc2Y2JlYjJhYTUxODM3OTM1YmEzZmQ4MmVlODcgXAogICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vcGx1Z2lucy9zdWRvZXJzL3JlZGJsYWNrLmM7YmVnaW5saW5lPTE7ZW5kbGluZT00Njtt
ZDU9MDNlMzUzMTc2OTliYTAwYjQ5NjI1MWUwZGZlOWYxMDkgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vbGliL3V0aWwvcmVhbGxvY2FycmF5LmM7YmVnaW5saW5lPTM7ZW5kbGluZT0xNTtt
ZDU9Mzk3ZGQ0NWM3NjgzZTkwYjlmOGJmMjQ2MzhjZjAzYmYgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vbGliL3V0aWwvZm5tYXRjaC5jO2JlZ2lubGluZT0zO2VuZGxpbmU9Mjc7bWQ1PTAw
NGQ3ZDI4NjZiYTFmNWI0MTE3NDkwNjg0OWQyZTBmIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE1cDUuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c3Vkby9zdWRvXzEuOS4xNnAxLmJiCnNpbWlsYXJpdHkgaW5kZXggNTIlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE1cDUuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE2cDEuYmIKaW5kZXggMmZkMmFlNmQwNS4u
MjJkMDViYTllMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8vc3Vkb18x
LjkuMTVwNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xNnAx
LmJiCkBAIC0xLDMgKzEsNTUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVl
cyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2lu
ZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0
ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1
bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNl
LVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHll
YXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLm1kCisj
ICsrKyBMSUNFTlNFLm1kCisjIEBAIC0xLDYgKzEsNiBAQAorIyAgU3VkbyBpcyBkaXN0cmlidXRl
ZCB1bmRlciB0aGUgZm9sbG93aW5nIGxpY2Vuc2U6CisjICAKKyMgLSAgICBDb3B5cmlnaHQgKGMp
IDE5OTQtMTk5NiwgMTk5OC0yMDIzCisjICsgICAgQ29weXJpZ2h0IChjKSAxOTk0LTE5OTYsIDE5
OTgtMjAyNAorIyAgICAgICAgICBUb2RkIEMuIE1pbGxlciA8VG9kZC5NaWxsZXJAc3Vkby53cz4K
KyMgIAorIyAgICAgIFBlcm1pc3Npb24gdG8gdXNlLCBjb3B5LCBtb2RpZnksIGFuZCBkaXN0cmli
dXRlIHRoaXMgc29mdHdhcmUgZm9yIGFueQorIyBAQCAtMjQ3LDkgKzI0Nyw5IEBACisjICAKKyMg
IFRoZSBmaWxlIGFyYzRyYW5kb20uYyBiZWFycyB0aGUgZm9sbG93aW5nIGxpY2Vuc2U6CisjICAK
KyMgLSAgICBDb3B5cmlnaHQgKGMpIDE5OTYsIERhdmlkIE1hemllcmVzIDxkbUB1dW4ub3JnPiAg
CisjIC0gICAgQ29weXJpZ2h0IChjKSAyMDA4LCBEYW1pZW4gTWlsbGVyIDxkam1Ab3BlbmJzZC5v
cmc+ICAKKyMgLSAgICBDb3B5cmlnaHQgKGMpIDIwMTMsIE1hcmt1cyBGcmllZGwgPG1hcmt1c0Bv
cGVuYnNkLm9yZz4gIAorIyArICAgIENvcHlyaWdodCAoYykgMTk5NiwgRGF2aWQgTWF6aWVyZXMg
PGRtQHV1bi5vcmc+CisjICsgICAgQ29weXJpZ2h0IChjKSAyMDA4LCBEYW1pZW4gTWlsbGVyIDxk
am1Ab3BlbmJzZC5vcmc+CisjICsgICAgQ29weXJpZ2h0IChjKSAyMDEzLCBNYXJrdXMgRnJpZWRs
IDxtYXJrdXNAb3BlbmJzZC5vcmc+CisjICAgICAgQ29weXJpZ2h0IChjKSAyMDE0LCBUaGVvIGRl
IFJhYWR0IDxkZXJhYWR0QG9wZW5ic2Qub3JnPgorIyAgCisjICAgICAgUGVybWlzc2lvbiB0byB1
c2UsIGNvcHksIG1vZGlmeSwgYW5kIGRpc3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBmb3IgYW55Cisj
IEBAIC0yODIsNyArMjgyLDcgQEAKKyMgIAorIyAgVGhlIGZpbGUgZ2V0ZW50cm9weS5jIGJlYXJz
IHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgIAorIyAtICAgIENvcHlyaWdodCAoYykgMjAxNCBU
aGVvIGRlIFJhYWR0IDxkZXJhYWR0QG9wZW5ic2Qub3JnPiAgCisjICsgICAgQ29weXJpZ2h0IChj
KSAyMDE0IFRoZW8gZGUgUmFhZHQgPGRlcmFhZHRAb3BlbmJzZC5vcmc+CisjICAgICAgQ29weXJp
Z2h0IChjKSAyMDE0IEJvYiBCZWNrIDxiZWNrQG9idHVzZS5jb20+CisjICAKKyMgICAgICBQZXJt
aXNzaW9uIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBhbmQgZGlzdHJpYnV0ZSB0aGlzIHNvZnR3YXJl
IGZvciBhbnkKKyMgQEAgLTI5OSw3ICsyOTksNyBAQAorIyAgCisjICBUaGUgZW1iZWRkZWQgY29w
eSBvZiB6bGliIGJlYXJzIHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgIAorIyAtICAgIENvcHly
aWdodCAoQykgMTk5NS0yMDIyIEplYW4tbG91cCBHYWlsbHkgYW5kIE1hcmsgQWRsZXIKKyMgKyAg
ICBDb3B5cmlnaHQgKEMpIDE5OTUtMjAyNCBKZWFuLWxvdXAgR2FpbGx5IGFuZCBNYXJrIEFkbGVy
CisjICAKKyMgICAgICBUaGlzIHNvZnR3YXJlIGlzIHByb3ZpZGVkICdhcy1pcycsIHdpdGhvdXQg
YW55IGV4cHJlc3Mgb3IgaW1wbGllZAorIyAgICAgIHdhcnJhbnR5LiAgSW4gbm8gZXZlbnQgd2ls
bCB0aGUgYXV0aG9ycyBiZSBoZWxkIGxpYWJsZSBmb3IgYW55IGRhbWFnZXMKKyMgCisjCisKIHJl
cXVpcmUgc3Vkby5pbmMKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5zdWRvLndzL2Rpc3Qvc3Vk
by0ke1BWfS50YXIuZ3ogXApAQCAtNyw3ICs1OSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cu
c3Vkby53cy9kaXN0L3N1ZG8tJHtQVn0udGFyLmd6IFwKIAogUEFNX1NSQ19VUkkgPSAiZmlsZTov
L3N1ZG8ucGFtIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTU4ZDEwYjlhMTk5MWZiM2I5ZmE3
ZmE3YjA3ZWM0NDA1YjdhZWZiNWIzY2IwYjA4NzFkYmM4MWUzYTg4ZTU1OCIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI0MDQ5OTRlMjNhZThiY2Y0YmU1OWVkNmZkMzc1OWFkNzBhOGNlZmE5YmNmNzE2
NDBiMzNmMTc2YWZlYzI0M2IwIgogCiBERVBFTkRTICs9ICIgdmlydHVhbC9jcnlwdCAke0BiYi51
dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsICdsaWJwYW0nLCAnJywgZCl9
IgogUkRFUEVORFM6JHtQTn0gKz0gIiAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRV
UkVTJywgJ3BhbScsICdwYW0tcGx1Z2luLWxpbWl0cyBwYW0tcGx1Z2luLWtleWluaXQnLCAnJywg
ZCl9IgotLSAKMi40NC4xCgo=

--===============4623516845656285146==--

