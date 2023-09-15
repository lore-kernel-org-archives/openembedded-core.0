Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A174EEEC01
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.29462.1694804392450267413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CiBYwA3B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oKZq0nzk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a9a36c000-39c4086d-0a88-42f4-9553-395f0e673981-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eE+xkLmqMAzK1WbV0JnP/AUDvhwqt8HaqnahQ4q86ZU=;
	b=CiBYwA3BvBnk0XZXsk6/+WndMojOrSEk4cFbpoK4TZjCtzaxg6L78dKUEpIak4FG
	inRu4BkIxkDs6BIjqGj/Rlcezx8UF704bM2azsd5uKbtgSJB3vMMmi1SjO8I8OCUxgp
	mGinFW8kzEEPOSN6FaAPRGd4uCROkA8URZ/fcfIw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eE+xkLmqMAzK1WbV0JnP/AUDvhwqt8HaqnahQ4q86ZU=;
	b=oKZq0nzkixDVPt00iaM8Kv4PP+OmIjPJaUPbYI/hbDQ2CrHo+0juApSDorIm2GAf
	TKFujqkia+e/Gh9vJsmA+8uBqZl9jmB1fHh5kIZ9ikM7xhgyWAuUrFGEsyyOGqVUT+W
	newbGZvm2cXn9/pI96g0McS9gHYC1v6WXMqHUfnQ=
Content-Type: multipart/mixed; boundary="===============3467028115181190375=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.02.0 SUCCEEDED
Message-ID: <0101018a9a36c000-39c4086d-0a88-42f4-9553-395f0e673981-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187720

--===============3467028115181190375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ghostscript* to *10.02.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-10.01.2-10.02.0.patch
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
From 7266990c04ee497aeb3d686d352a5f3c128449d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 12:49:39 +0000
Subject: [PATCH] ghostscript: upgrade 10.01.2 -> 10.02.0

---
 ...pcx-buffer-overrun-fix-from-devices-.patch | 31 -------------------
 ...ript_10.01.2.bb => ghostscript_10.02.0.bb} |  5 ++-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.01.2.bb => ghostscript_10.02.0.bb} (94%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
deleted file mode 100644
index b29212fbc6..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d81b82c70bc1fb9991bb95f1201abb5dea55f57f Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Mon, 17 Jul 2023 14:06:37 +0100
-Subject: [PATCH] Bug 706897: Copy pcx buffer overrun fix from
- devices/gdevpcx.c
-
-Bounds check the buffer, before dereferencing the pointer.
-
-CVE: CVE-2023-38559
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- base/gdevdevn.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/base/gdevdevn.c b/base/gdevdevn.c
-index 7b14d9c71..6351fb77a 100644
---- a/base/gdevdevn.c
-+++ b/base/gdevdevn.c
-@@ -1983,7 +1983,7 @@ devn_pcx_write_rle(const byte * from, const byte * end, int step, gp_file * file
-         byte data = *from;
- 
-         from += step;
--        if (data != *from || from == end) {
-+        if (from >= end || data != *from) {
-             if (data >= 0xc0)
-                 gp_fputc(0xc1, file);
-         } else {
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
similarity index 94%
rename from meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
index 434170e34d..4bad0f86e1 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
@@ -25,11 +25,10 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch \
            file://configure.ac-add-option-to-explicitly-disable-neon.patch \
-"
+           "
 
-SRC_URI[sha256sum] = "a4cd61a07fec161bee35da0211a5e5cde8ff8a0aaf942fc0176715e499d21661"
+SRC_URI[sha256sum] = "e54062f166708d84ca82de9f8304a04344466080f936118b88082bd55ed6dc97"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.39.2


--===============3467028115181190375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ghostscript/ghostscript-dbg: PV changed from "10.01.2" to "10.02.0"
packages/core2-32-poky-linux/ghostscript/ghostscript-dbg: PKGV changed from 10.01.2 [default] to 10.02.0 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-dbg: PKGSIZE changed from 81493924 to 81587532 (+0%)
packages/core2-32-poky-linux/ghostscript/ghostscript-dev: PV changed from "10.01.2" to "10.02.0"
packages/core2-32-poky-linux/ghostscript/ghostscript-dev: PKGV changed from 10.01.2 [default] to 10.02.0 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-doc: PV changed from "10.01.2" to "10.02.0"
packages/core2-32-poky-linux/ghostscript/ghostscript-doc: FILELIST: removed "/usr/share/doc/ghostscript/10.01.2/GS9_Color_Management.pdf /usr/share/doc/ghostscript/10.01.2/COPYING /usr/share/doc/ghostscript/10.01.2/News.htm /usr/share/doc/ghostscript/10.01.2/Ghostscript.pdf", added "/usr/share/doc/ghostscript/10.02.0/GS9_Color_Management.pdf /usr/share/doc/ghostscript/10.02.0/News.html /usr/share/doc/ghostscript/10.02.0/COPYING /usr/share/doc/ghostscript/10.02.0/Ghostscript.pdf"
packages/core2-32-poky-linux/ghostscript/ghostscript-doc: PKGV changed from 10.01.2 [default] to 10.02.0 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed from 11240277 to 11240480 (+0%)
packages/core2-32-poky-linux/ghostscript/ghostscript-locale: PV changed from "10.01.2" to "10.02.0"
packages/core2-32-poky-linux/ghostscript/ghostscript-locale: PKGV changed from 10.01.2 [default] to 10.02.0 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-src: PV changed from "10.01.2" to "10.02.0"
packages/core2-32-poky-linux/ghostscript/ghostscript-src: PKGV changed from 10.01.2 [default] to 10.02.0 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-src: PKGSIZE changed from 69699244 to 69568925 (-0%)
packages/core2-32-poky-linux/ghostscript/ghostscript-staticdev: PV changed from "10.01.2" to "10.02.0"
packages/core2-32-poky-linux/ghostscript/ghostscript-staticdev: PKGV changed from 10.01.2 [default] to 10.02.0 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript: PV changed from "10.01.2" to "10.02.0"
packages/core2-32-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.01.2/lib -> /usr/share/ghostscript/10.02.0/lib, directory renamed /usr/share/ghostscript/10.01.2/Resource/CMap -> /usr/share/ghostscript/10.02.0/Resource/CMap, directory renamed /usr/share/ghostscript/10.01.2/Resource/Font -> /usr/share/ghostscript/10.02.0/Resource/Font, directory renamed /usr/share/ghostscript/10.01.2/Resource/CIDFSubst -> /usr/share/ghostscript/10.02.0/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.01.2/Resource/IdiomSet -> /usr/share/ghostscript/10.02.0/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.01.2/Resource/Encoding -> /usr/share/ghostscript/10.02.0/Resource/Encoding, directory renamed /usr/share/ghostscript/10.01.2/Resource/SubstCID -> /usr/share/ghostscript/10.02.0/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.01.2/Resource/Decoding -> /usr/share/ghostscript/10.02.0/Resource/Decoding, directory rename
 d /usr/share/ghostscript/10.01.2/iccprofiles -> /usr/share/ghostscript/10.02.0/iccprofiles, directory renamed /usr/share/ghostscript/10.01.2/Resource/CIDFont -> /usr/share/ghostscript/10.02.0/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.01.2/Resource/ColorSpace -> /usr/share/ghostscript/10.02.0/Resource/ColorSpace, removed "/usr/share/ghostscript/10.01.2/Resource/Init/gs_pdf_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_resmp.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_main.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_sec.ps /usr/share/ghostscript/10.01.2/Resource/Init/cidfmap /usr/share/ghostscript/10.01.2/Resource/Init/gs_type1.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cspace.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_res.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_base.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_setpd.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cidfm.ps /usr/share/ghostscript/10.01.2/Re
 source/Init/gs_dbt_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/FAPIconfig /usr/share/ghostscript/10.01.2/Resource/Init/pdf_font.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cidtt.ps /usr/share/ghostscript/10.01.2/Resource/Init/FAPIfontmap /usr/share/ghostscript/10.01.2/Resource/Init/gs_statd.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_ll3.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_diskn.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_img.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_mro_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_fapi.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_btokn.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_mgl_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_wan_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_trap.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cidcm.ps /usr/share/ghostscript/10.01.2/Resource/Init/FCOfontmap-PCLPS2 /usr/share/ghostscript/10.01.2/Resource/Init/gs_pdfwr.ps /usr/
 share/ghostscript/10.01.2/Resource/Init/gs_typ42.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_draw.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_epsf.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_il1_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_init.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_typ32.ps /usr/share/ghostscript/10.01.2/Resource/Init/Fontmap /usr/share/ghostscript/10.01.2/Resource/Init/gs_dps1.ps /usr/share/ghostscript/10.01.2/Resource/Init/xlatmap /usr/share/ghostscript/10.01.2/Resource/Init/gs_lev2.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cff.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_std_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_mex_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cmap.ps /usr/share/ghostscript/10.01.2/Resource/Init/Fontmap.GS /usr/share/ghostscript/10.01.2/Resource/Init/gs_dps2.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_ciddc.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_ag
 l.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_sym_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_rbld.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cidfn.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_ttf.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_fonts.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_dscp.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cet.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_fntem.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_frsd.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_icc.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_ops.ps /usr/share/ghostscript/10.01.2/Resource/Init/FAPIcidfmap", added "/usr/share/ghostscript/10.02.0/Resource/Init/gs_pdf_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_resmp.ps /usr/share/ghostscript/10.02.0/Resource/Init/pdf_main.ps /usr/share/ghostscript/10.02.0/Resource/Init/cidfmap /usr/share/ghostscript/10.02.0/Resource/Init/gs_type1.ps /usr/share/ghostscript/10.0
 2.0/Resource/Init/gs_cspace.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_res.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_setpd.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cidfm.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_dbt_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/FAPIconfig /usr/share/ghostscript/10.02.0/Resource/Init/gs_cidtt.ps /usr/share/ghostscript/10.02.0/Resource/Init/FAPIfontmap /usr/share/ghostscript/10.02.0/Resource/Init/gs_statd.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_ll3.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_diskn.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_img.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_mro_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_fapi.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_btokn.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_mgl_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_wan_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_trap.ps /usr/s
 hare/ghostscript/10.02.0/Resource/Init/gs_cidcm.ps /usr/share/ghostscript/10.02.0/Resource/Init/FCOfontmap-PCLPS2 /usr/share/ghostscript/10.02.0/Resource/Init/gs_pdfwr.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_typ42.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_epsf.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_il1_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_init.ps /usr/share/ghostscript/10.02.0/Resource/Init/Fontmap /usr/share/ghostscript/10.02.0/Resource/Init/gs_dps1.ps /usr/share/ghostscript/10.02.0/Resource/Init/xlatmap /usr/share/ghostscript/10.02.0/Resource/Init/gs_lev2.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cff.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_std_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_mex_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cmap.ps /usr/share/ghostscript/10.02.0/Resource/Init/Fontmap.GS /usr/share/ghostscript/10.02.0/Resource/Init/gs_dps2.ps /usr/share/ghostscript/10.02.0/Resource/Init/
 gs_ciddc.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_agl.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_sym_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cidfn.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_ttf.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_fonts.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_dscp.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cet.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_fntem.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_frsd.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_icc.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_typ32.ps /usr/share/ghostscript/10.02.0/Resource/Init/FAPIcidfmap"
packages/core2-32-poky-linux/ghostscript/ghostscript: PKGV changed from 10.01.2 [default] to 10.02.0 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript: PKGSIZE changed from 56375820 to 55735119 (-1%)
packages/core2-32-poky-linux/ghostscript: PV changed from "10.01.2" to "10.02.0"
packages/core2-32-poky-linux/ghostscript: PKGV changed from 10.01.2 [default] to 10.02.0 [default]
packages/core2-32-poky-linux/ghostscript: SRC_URI changed from "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10012/ghostscript-10.01.2.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch file://configure.ac-add-option-to-explicitly-disable-neon.patch" to "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10020/ghostscript-10.02.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://configure.ac-add-option-to-explicitly-disable-neon.patch"
Changes to packages/core2-32-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.01.2 moved to /usr/share/ghostscript/10.02.0
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_base.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_draw.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_font.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_ops.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_rbld.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_sec.ps was removed

--===============3467028115181190375==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.01.2-10.02.0.patch"

RnJvbSA3MjY2OTkwYzA0ZWU0OTdhZWIzZDY4NmQzNTJhNWYzYzEyODQ0OWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTI6NDk6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aG9zdHNjcmlwdDogdXBncmFkZSAxMC4wMS4yIC0+IDEwLjAyLjAKCi0tLQogLi4ucGN4LWJ1ZmZl
ci1vdmVycnVuLWZpeC1mcm9tLWRldmljZXMtLnBhdGNoIHwgMzEgLS0tLS0tLS0tLS0tLS0tLS0t
LQogLi4ucmlwdF8xMC4wMS4yLmJiID0+IGdob3N0c2NyaXB0XzEwLjAyLjAuYmJ9IHwgIDUgKyst
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2Ny
aXB0LzAwMDEtQnVnLTcwNjg5Ny1Db3B5LXBjeC1idWZmZXItb3ZlcnJ1bi1maXgtZnJvbS1kZXZp
Y2VzLS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC97Z2hv
c3RzY3JpcHRfMTAuMDEuMi5iYiA9PiBnaG9zdHNjcmlwdF8xMC4wMi4wLmJifSAoOTQlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC8w
MDAxLUJ1Zy03MDY4OTctQ29weS1wY3gtYnVmZmVyLW92ZXJydW4tZml4LWZyb20tZGV2aWNlcy0u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvMDAw
MS1CdWctNzA2ODk3LUNvcHktcGN4LWJ1ZmZlci1vdmVycnVuLWZpeC1mcm9tLWRldmljZXMtLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBiMjkyMTJmYmM2Li4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC8wMDAx
LUJ1Zy03MDY4OTctQ29weS1wY3gtYnVmZmVyLW92ZXJydW4tZml4LWZyb20tZGV2aWNlcy0ucGF0
Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzMSArMCwwIEBACi1Gcm9tIGQ4MWI4MmM3MGJjMWZiOTk5
MWJiOTVmMTIwMWFiYjVkZWE1NWY1N2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBD
aHJpcyBMaWRkZWxsIDxjaHJpcy5saWRkZWxsQGFydGlmZXguY29tPgotRGF0ZTogTW9uLCAxNyBK
dWwgMjAyMyAxNDowNjozNyArMDEwMAotU3ViamVjdDogW1BBVENIXSBCdWcgNzA2ODk3OiBDb3B5
IHBjeCBidWZmZXIgb3ZlcnJ1biBmaXggZnJvbQotIGRldmljZXMvZ2RldnBjeC5jCi0KLUJvdW5k
cyBjaGVjayB0aGUgYnVmZmVyLCBiZWZvcmUgZGVyZWZlcmVuY2luZyB0aGUgcG9pbnRlci4KLQot
Q1ZFOiBDVkUtMjAyMy0zODU1OQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotU2lnbmVkLW9m
Zi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0tLS0KLSBiYXNlL2dkZXZk
ZXZuLmMgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCi0KLWRpZmYgLS1naXQgYS9iYXNlL2dkZXZkZXZuLmMgYi9iYXNlL2dkZXZkZXZuLmMKLWlu
ZGV4IDdiMTRkOWM3MS4uNjM1MWZiNzdhIDEwMDY0NAotLS0tIGEvYmFzZS9nZGV2ZGV2bi5jCi0r
KysgYi9iYXNlL2dkZXZkZXZuLmMKLUBAIC0xOTgzLDcgKzE5ODMsNyBAQCBkZXZuX3BjeF93cml0
ZV9ybGUoY29uc3QgYnl0ZSAqIGZyb20sIGNvbnN0IGJ5dGUgKiBlbmQsIGludCBzdGVwLCBncF9m
aWxlICogZmlsZQotICAgICAgICAgYnl0ZSBkYXRhID0gKmZyb207Ci0gCi0gICAgICAgICBmcm9t
ICs9IHN0ZXA7Ci0tICAgICAgICBpZiAoZGF0YSAhPSAqZnJvbSB8fCBmcm9tID09IGVuZCkgewot
KyAgICAgICAgaWYgKGZyb20gPj0gZW5kIHx8IGRhdGEgIT0gKmZyb20pIHsKLSAgICAgICAgICAg
ICBpZiAoZGF0YSA+PSAweGMwKQotICAgICAgICAgICAgICAgICBncF9mcHV0YygweGMxLCBmaWxl
KTsKLSAgICAgICAgIH0gZWxzZSB7Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDEuMi5iYiBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdF8xMC4wMi4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNj
cmlwdC9naG9zdHNjcmlwdF8xMC4wMS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDIuMC5iYgppbmRleCA0MzQxNzBlMzRkLi40
YmFkMGY4NmUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQv
Z2hvc3RzY3JpcHRfMTAuMDEuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3Rz
Y3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDIuMC5iYgpAQCAtMjUsMTEgKzI1LDEwIEBAIGRlZiBnc192
ZXJkaXIodik6CiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9BcnRpZmV4U29mdHdhcmUv
Z2hvc3RwZGwtZG93bmxvYWRzL3JlbGVhc2VzL2Rvd25sb2FkL2dzJHtAZ3NfdmVyZGlyKCIke1BW
fSIpfS8ke0JQTn0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2dob3N0c2NyaXB0
LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2F2b2lk
LWhvc3QtY29udGFtaW5hdGlvbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLUJ1Zy03
MDY4OTctQ29weS1wY3gtYnVmZmVyLW92ZXJydW4tZml4LWZyb20tZGV2aWNlcy0ucGF0Y2ggXAog
ICAgICAgICAgICBmaWxlOi8vY29uZmlndXJlLmFjLWFkZC1vcHRpb24tdG8tZXhwbGljaXRseS1k
aXNhYmxlLW5lb24ucGF0Y2ggXAotIgorICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJhNGNkNjFhMDdmZWMxNjFiZWUzNWRhMDIxMWE1ZTVjZGU4ZmY4YTBhYWY5NDJmYzAxNzY3
MTVlNDk5ZDIxNjYxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU1NDA2MmYxNjY3MDhkODRjYTgy
ZGU5ZjgzMDRhMDQzNDQ0NjYwODBmOTM2MTE4Yjg4MDgyYmQ1NWVkNmRjOTciCiAKIFBBQ0tBR0VD
T05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHW2d0a10gPSAiLS1lbmFibGUtZ3RrLC0tZGlzYWJs
ZS1ndGssZ3RrKzMiCi0tIAoyLjM5LjIKCg==

--===============3467028115181190375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ghostscript/ghostscript-doc: FILELIST: removed "/usr/share/doc/ghostscript/10.01.2/GS9_Color_Management.pdf /usr/share/doc/ghostscript/10.01.2/COPYING /usr/share/doc/ghostscript/10.01.2/Ghostscript.pdf /usr/share/doc/ghostscript/10.01.2/News.htm", added "/usr/share/doc/ghostscript/10.02.0/News.html /usr/share/doc/ghostscript/10.02.0/COPYING /usr/share/doc/ghostscript/10.02.0/Ghostscript.pdf /usr/share/doc/ghostscript/10.02.0/GS9_Color_Management.pdf"
packages/core2-32-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.01.2/Resource/Font -> /usr/share/ghostscript/10.02.0/Resource/Font, directory renamed /usr/share/ghostscript/10.01.2/Resource/ColorSpace -> /usr/share/ghostscript/10.02.0/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.01.2/Resource/SubstCID -> /usr/share/ghostscript/10.02.0/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.01.2/Resource/Encoding -> /usr/share/ghostscript/10.02.0/Resource/Encoding, directory renamed /usr/share/ghostscript/10.01.2/Resource/CIDFont -> /usr/share/ghostscript/10.02.0/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.01.2/lib -> /usr/share/ghostscript/10.02.0/lib, directory renamed /usr/share/ghostscript/10.01.2/Resource/CIDFSubst -> /usr/share/ghostscript/10.02.0/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.01.2/Resource/IdiomSet -> /usr/share/ghostscript/10.02.0/Resource/IdiomSet, direct
 ory renamed /usr/share/ghostscript/10.01.2/Resource/CMap -> /usr/share/ghostscript/10.02.0/Resource/CMap, directory renamed /usr/share/ghostscript/10.01.2/Resource/Decoding -> /usr/share/ghostscript/10.02.0/Resource/Decoding, directory renamed /usr/share/ghostscript/10.01.2/iccprofiles -> /usr/share/ghostscript/10.02.0/iccprofiles, removed "/usr/share/ghostscript/10.01.2/Resource/Init/gs_ll3.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_diskn.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_fonts.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_lev2.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_fntem.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_std_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_frsd.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_il1_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/FCOfontmap-PCLPS2 /usr/share/ghostscript/10.01.2/Resource/Init/gs_dscp.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_wan_e.ps /usr/share/ghostscript/10.
 01.2/Resource/Init/gs_dps2.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_rbld.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_icc.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_sec.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_trap.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_pdfwr.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_sym_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_draw.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_img.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_epsf.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_dbt_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_mex_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cspace.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cidfn.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_base.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cidcm.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_mgl_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/cidfmap /usr/sha
 re/ghostscript/10.01.2/Resource/Init/gs_ciddc.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_main.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cidfm.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_statd.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cmap.ps /usr/share/ghostscript/10.01.2/Resource/Init/FAPIcidfmap /usr/share/ghostscript/10.01.2/Resource/Init/gs_btokn.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cet.ps /usr/share/ghostscript/10.01.2/Resource/Init/FAPIfontmap /usr/share/ghostscript/10.01.2/Resource/Init/gs_res.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_agl.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_mro_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_pdf_e.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_typ32.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_typ42.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_type1.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_ops.ps /usr/share/ghostscript/10.01.2/Resource/Init
 /gs_cidtt.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_cff.ps /usr/share/ghostscript/10.01.2/Resource/Init/Fontmap /usr/share/ghostscript/10.01.2/Resource/Init/xlatmap /usr/share/ghostscript/10.01.2/Resource/Init/gs_resmp.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_setpd.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_fapi.ps /usr/share/ghostscript/10.01.2/Resource/Init/FAPIconfig /usr/share/ghostscript/10.01.2/Resource/Init/Fontmap.GS /usr/share/ghostscript/10.01.2/Resource/Init/gs_dps1.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_ttf.ps /usr/share/ghostscript/10.01.2/Resource/Init/gs_init.ps /usr/share/ghostscript/10.01.2/Resource/Init/pdf_font.ps", added "/usr/share/ghostscript/10.02.0/Resource/Init/gs_ll3.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_diskn.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_fonts.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_lev2.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_fntem.ps /usr/share/ghostscript/10.
 02.0/Resource/Init/gs_std_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_frsd.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_il1_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/FCOfontmap-PCLPS2 /usr/share/ghostscript/10.02.0/Resource/Init/gs_dscp.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_wan_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_dps2.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_icc.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_img.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_trap.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_pdfwr.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_sym_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_dbt_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cspace.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_epsf.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_mex_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cidfn.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cidcm.ps
  /usr/share/ghostscript/10.02.0/Resource/Init/gs_mgl_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/cidfmap /usr/share/ghostscript/10.02.0/Resource/Init/gs_ciddc.ps /usr/share/ghostscript/10.02.0/Resource/Init/pdf_main.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cidfm.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_statd.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cmap.ps /usr/share/ghostscript/10.02.0/Resource/Init/FAPIcidfmap /usr/share/ghostscript/10.02.0/Resource/Init/gs_btokn.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cet.ps /usr/share/ghostscript/10.02.0/Resource/Init/FAPIfontmap /usr/share/ghostscript/10.02.0/Resource/Init/gs_res.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_agl.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_mro_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_pdf_e.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_typ32.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_typ42.ps /usr/share/ghostscript/10.02.0/Resourc
 e/Init/gs_type1.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cidtt.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_cff.ps /usr/share/ghostscript/10.02.0/Resource/Init/Fontmap /usr/share/ghostscript/10.02.0/Resource/Init/xlatmap /usr/share/ghostscript/10.02.0/Resource/Init/gs_resmp.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_setpd.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_fapi.ps /usr/share/ghostscript/10.02.0/Resource/Init/FAPIconfig /usr/share/ghostscript/10.02.0/Resource/Init/Fontmap.GS /usr/share/ghostscript/10.02.0/Resource/Init/gs_dps1.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_ttf.ps /usr/share/ghostscript/10.02.0/Resource/Init/gs_init.ps"
Changes to packages/core2-32-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.01.2 moved to /usr/share/ghostscript/10.02.0
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_base.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_draw.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_font.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_ops.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_rbld.ps was removed
  /usr/share/ghostscript/10.01.2/Resource/Init/pdf_sec.ps was removed

--===============3467028115181190375==--

