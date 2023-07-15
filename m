Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B669C2FC18
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5937.1689456454143902745
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BWByfR+0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73a60f-19e92fa4-7103-47fd-a20d-0528daa7e002-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nwJMpIKwUXgHZ8MTa8aKxJkYJxWMT437kJ2n8+TzMsw=;
	b=BWByfR+0vSombdLZ+DZxn201bokdu2gnHWjMzMR715q9yyHWpnoXAwOKsVFICMYn
	bchbpaUGk5gPsjKYJE3hwtjPaHhq7zmG5g9KwnOGrT3BZVc5iT4hzGO7kq7nU1Xu5gd
	P3MH2cu4wq3t2s7pRMjtk/Rs3R1VRGr5gMvmsZ3g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nwJMpIKwUXgHZ8MTa8aKxJkYJxWMT437kJ2n8+TzMsw=;
	b=KDuXF09UG+9syr6LWQZlkDYMDEdU8vv/ThgTHYnMe4vhFnVcxSiuibM/eu2MWj/y
	2D5lifH5rUkNMmOTwNyBgPkcNw1b0177XAtM+7EwqaFV0tTBRXC4O6ZVARhM5mCea+e
	m+V7fJkSVH5jFF0BanPFacMsWT2ZfQLDpcFj5Wyo=
Content-Type: multipart/mixed; boundary="===============7148999814455406312=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.76.4 SUCCEEDED
Message-ID: <010101895b73a60f-19e92fa4-7103-47fd-a20d-0528daa7e002-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184326

--===============7148999814455406312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.76.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.76.3-2.76.4.patch
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
From ed4b41168fe38570e6e3287bb120f944f55451fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 10:01:00 +0000
Subject: [PATCH] glib-2.0: upgrade 2.76.3 -> 2.76.4

---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch  | 6 ++----
 .../glib-2.0/{glib-2.0_2.76.3.bb => glib-2.0_2.76.4.bb}     | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.76.3.bb => glib-2.0_2.76.4.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 3dba599fc0..9c5f716379 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 38e401969a2ff8269919cbeacec733a67f041735 Mon Sep 17 00:00:00 2001
+From 8f7077e745cf90b59b25f6eed18ae0566b1d7197 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -13,6 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
  gio/giomodule.c | 5 -----
  1 file changed, 5 deletions(-)
@@ -40,6 +41,3 @@ index 11ce7d8..cc27ecd 100644
  #endif
      }
  
--- 
-2.30.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
index 4327a13345..64a3c6d80c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "c0be444e403d7c3184d1f394f89f0b644710b5e9331b54fa4e8b5037813ad32a"
+SRC_URI[sha256sum] = "5a5a191c96836e166a7771f7ea6ca2b0069c603c7da3cba1cd38d1694a395dda"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.39.2


--===============7148999814455406312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 20671700 to 20674132 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.3-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.7600.3 /usr/lib/.debug/libglib-2.0.so.0.7600.3 /usr/lib/.debug/libgobject-2.0.so.0.7600.3 /usr/lib/.debug/libgio-2.0.so.0.7600.3 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.3-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.7600.3", added "/usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.4-gdb.py /usr/lib/.debug/libglib-2.0.so.0.7600.4 /usr/lib/.debug/libgthread-2.0.so.0.7600.4 /usr/lib/.debug/libgio-2.0.so.0.7600.4 /usr/lib/.debug/libgobject-2.0.so.0.7600.4 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.7600.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGSIZE changed from 129418 to 129714 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGSIZE changed from 138070 to 138371 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGSIZE changed from 127520 to 126718 (-1%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 23475609 to 23477381 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libglib-2.0.so.0.7600.3 /usr/lib/libgmodule-2.0.so.0.7600.3 /usr/lib/libgobject-2.0.so.0.7600.3 /usr/lib/libgio-2.0.so.0.7600.3 /usr/lib/libgthread-2.0.so.0.7600.3", added "/usr/lib/libgthread-2.0.so.0.7600.4 /usr/lib/libgmodule-2.0.so.0.7600.4 /usr/lib/libglib-2.0.so.0.7600.4 /usr/lib/libgio-2.0.so.0.7600.4 /usr/lib/libgobject-2.0.so.0.7600.4"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PV changed from "2.76.3" to "2.76.4"
packages/core2-32-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.76/glib-2.76.3.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch file://0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch" to "https://download.gnome.org/sources//glib/2.76/glib-2.76.4.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.pat
 ch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch file://0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch"
packages/core2-32-poky-linux/glib-2.0: PKGV changed from 2.76.3 [default] to 2.76.4 [default]
packages/core2-32-poky-linux/glib-2.0: PV changed from "2.76.3" to "2.76.4"
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7600.3 to libgio-2.0.so.0.7600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7600.3 to libglib-2.0.so.0.7600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7600.3 to libgmodule-2.0.so.0.7600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7600.3 to libgobject-2.0.so.0.7600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7600.3 to libgthread-2.0.so.0.7600.4
  /usr/lib/libgio-2.0.so.0.7600.3 moved to /usr/lib/libgio-2.0.so.0.7600.4
  /usr/lib/libglib-2.0.so.0.7600.3 moved to /usr/lib/libglib-2.0.so.0.7600.4
  /usr/lib/libgmodule-2.0.so.0.7600.3 moved to /usr/lib/libgmodule-2.0.so.0.7600.4
  /usr/lib/libgobject-2.0.so.0.7600.3 moved to /usr/lib/libgobject-2.0.so.0.7600.4
  /usr/lib/libgthread-2.0.so.0.7600.3 moved to /usr/lib/libgthread-2.0.so.0.7600.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7600.3 to libgio-2.0.so.0.7600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7600.3 to libglib-2.0.so.0.7600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7600.3 to libgmodule-2.0.so.0.7600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7600.3 to libgobject-2.0.so.0.7600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7600.3 to libgthread-2.0.so.0.7600.4
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.3-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7600.3-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.4-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7600.4-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.3-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7600.3-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.4-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py
  /usr/lib/libgio-2.0.so.0.7600.3 moved to /usr/lib/libgio-2.0.so.0.7600.4
  /usr/lib/libglib-2.0.so.0.7600.3 moved to /usr/lib/libglib-2.0.so.0.7600.4
  /usr/lib/libgmodule-2.0.so.0.7600.3 moved to /usr/lib/libgmodule-2.0.so.0.7600.4
  /usr/lib/libgobject-2.0.so.0.7600.3 moved to /usr/lib/libgobject-2.0.so.0.7600.4
  /usr/lib/libgthread-2.0.so.0.7600.3 moved to /usr/lib/libgthread-2.0.so.0.7600.4
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.3-r0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.4-r0

--===============7148999814455406312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgobject-2.0.so.0.7600.3 /usr/lib/libgthread-2.0.so.0.7600.3 /usr/lib/libgio-2.0.so.0.7600.3 /usr/lib/libgmodule-2.0.so.0.7600.3 /usr/lib/libglib-2.0.so.0.7600.3", added "/usr/lib/libgthread-2.0.so.0.7600.4 /usr/lib/libgobject-2.0.so.0.7600.4 /usr/lib/libgio-2.0.so.0.7600.4 /usr/lib/libglib-2.0.so.0.7600.4 /usr/lib/libgmodule-2.0.so.0.7600.4"
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7600.3 to libgio-2.0.so.0.7600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7600.3 to libglib-2.0.so.0.7600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7600.3 to libgmodule-2.0.so.0.7600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7600.3 to libgobject-2.0.so.0.7600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7600.3 to libgthread-2.0.so.0.7600.4
  /usr/lib/libgio-2.0.so.0.7600.3 moved to /usr/lib/libgio-2.0.so.0.7600.4
  /usr/lib/libglib-2.0.so.0.7600.3 moved to /usr/lib/libglib-2.0.so.0.7600.4
  /usr/lib/libgmodule-2.0.so.0.7600.3 moved to /usr/lib/libgmodule-2.0.so.0.7600.4
  /usr/lib/libgobject-2.0.so.0.7600.3 moved to /usr/lib/libgobject-2.0.so.0.7600.4
  /usr/lib/libgthread-2.0.so.0.7600.3 moved to /usr/lib/libgthread-2.0.so.0.7600.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7600.3 to libgio-2.0.so.0.7600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7600.3 to libglib-2.0.so.0.7600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7600.3 to libgmodule-2.0.so.0.7600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7600.3 to libgobject-2.0.so.0.7600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7600.3 to libgthread-2.0.so.0.7600.4
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.3-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7600.3-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.4-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7600.4-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.3-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7600.3-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.4-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py
  /usr/lib/libgio-2.0.so.0.7600.3 moved to /usr/lib/libgio-2.0.so.0.7600.4
  /usr/lib/libglib-2.0.so.0.7600.3 moved to /usr/lib/libglib-2.0.so.0.7600.4
  /usr/lib/libgmodule-2.0.so.0.7600.3 moved to /usr/lib/libgmodule-2.0.so.0.7600.4
  /usr/lib/libgobject-2.0.so.0.7600.3 moved to /usr/lib/libgobject-2.0.so.0.7600.4
  /usr/lib/libgthread-2.0.so.0.7600.3 moved to /usr/lib/libgthread-2.0.so.0.7600.4
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.3-r0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.4-r0

--===============7148999814455406312==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.76.3-2.76.4.patch"

RnJvbSBlZDRiNDExNjhmZTM4NTcwZTZlMzI4N2JiMTIwZjk0NGY1NTQ1MWZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTA6MDE6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMDogdXBncmFkZSAyLjc2LjMgLT4gMi43Ni40CgotLS0KIG1ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggIHwgNiArKy0tLS0KIC4u
Li9nbGliLTIuMC97Z2xpYi0yLjBfMi43Ni4zLmJiID0+IGdsaWItMi4wXzIuNzYuNC5iYn0gICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wXzIuNzYuMy5iYiA9
PiBnbGliLTIuMF8yLjc2LjQuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKaW5kZXggM2Ri
YTU5OWZjMC4uOWM1ZjcxNjM3OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAzOGU0MDE5NjlhMmZmODI2OTkxOWNiZWFjZWM3MzNhNjdmMDQxNzM1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4ZjcwNzdlNzQ1Y2Y5MGI1OWIyNWY2ZWVkMThhZTA1NjZi
MWQ3MTk3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3Mu
YnVydG9uQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTEgTWFyIDIwMTYgMTU6MzU6NTUgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gZ2xpYi0yLjA6IHJlbG9jYXRlIHRoZSBHSU8gbW9kdWxlIGRpcmVj
dG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpAQCAtMTMsNiArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogCiBQb3J0IHBhdGNoIHRvIDIuNDgK
IFNpZ25lZC1vZmYtYnk6IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+
CisKIC0tLQogIGdpby9naW9tb2R1bGUuYyB8IDUgLS0tLS0KICAxIGZpbGUgY2hhbmdlZCwgNSBk
ZWxldGlvbnMoLSkKQEAgLTQwLDYgKzQxLDMgQEAgaW5kZXggMTFjZTdkOC4uY2MyN2VjZCAxMDA2
NDQKICAjZW5kaWYKICAgICAgfQogIAotLS0gCi0yLjMwLjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43Ni4zLmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43Ni40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzYuMy5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43Ni40LmJiCmluZGV4
IDQzMjdhMTMzNDUuLjY0YTNjNmQ4MGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWItMi4wXzIuNzYuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9nbGliLTIuMF8yLjc2LjQuYmIKQEAgLTE5LDcgKzE5LDcgQEAgU1JDX1VSSSA9ICIke0dOT01F
X01JUlJPUn0vZ2xpYi8ke1NIUlRfVkVSfS9nbGliLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAg
ICIKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovL3JlbG9jYXRlLW1vZHVs
ZXMucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjMGJlNDQ0ZTQwM2Q3YzMxODRkMWYz
OTRmODlmMGI2NDQ3MTBiNWU5MzMxYjU0ZmE0ZThiNTAzNzgxM2FkMzJhIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjVhNWExOTFjOTY4MzZlMTY2YTc3NzFmN2VhNmNhMmIwMDY5YzYwM2M3ZGEzY2Jh
MWNkMzhkMTY5NGEzOTVkZGEiCiAKICMgRmluZCBhbnkgbWVzb24gY3Jvc3MgZmlsZXMgaW4gRklM
RVNQQVRIIHRoYXQgYXJlIHJlbGV2YW50IGZvciB0aGUgY3VycmVudAogIyBidWlsZCAodXNpbmcg
c2l0ZWluZm8pIGFuZCBhZGQgdGhlbSB0byBFWFRSQV9PRU1FU09OLgotLSAKMi4zOS4yCgo=

--===============7148999814455406312==--

