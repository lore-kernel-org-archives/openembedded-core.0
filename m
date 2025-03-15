Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0E5C369B0
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.10345.1742048306476069107
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VTUCYwTF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nNf6D8ZG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101959a2ba0da-3b1aa7c3-9150-4bdd-a8c6-c6d2dabc9d7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D6xst2/ZyZkLbLJJsn5FdAGVFTz4faF9zjZlI95fEFk=;
	b=VTUCYwTF84fKjNpDGjNOu7AtcylWPjoXqL+Ic1A9pSeHGGMrTvHiFNkwpZTDV3ba
	7Ju7s0Sfq4eQrD241fQXXYSNG8VDMxEuEnXVn2hCudgymTt8GEwGWzuMlCZwrAyrKqV
	+IsnEv8rx44UILPFbrIKu9fK5NFvVad99ahK1T+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D6xst2/ZyZkLbLJJsn5FdAGVFTz4faF9zjZlI95fEFk=;
	b=nNf6D8ZGjItZX4g8XT7cGa/l60j/v2zqEqXpO99OLSx48/v4A0LJDQyZSA5Q5wI7
	ZKyN1F3z65FlW2+vfY5kVzJbPJ6gf/H6YlcwOWpmUTFVWz8ZB2t1y89N5L3lKEDqGFI
	WCL/Feikxvwc9VQYHs5PGYn2Zwmu/3CjeIX0bC2g=
Content-Type: multipart/mixed; boundary="===============3432451002998524189=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.05.0 SUCCEEDED
Message-ID: <010101959a2ba0da-3b1aa7c3-9150-4bdd-a8c6-c6d2dabc9d7b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212933

--===============3432451002998524189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ghostscript* to *10.05.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-10.04.0-10.05.0.patch
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
From 46e9960c36732d916308de7b1ca279e6ee969309 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 10:20:05 +0000
Subject: [PATCH] ghostscript: upgrade 10.04.0 -> 10.05.0

---
 .../ghostscript/avoid-host-contamination.patch           | 2 +-
 .../ghostscript-9.16-Werror-return-type.patch            | 9 +++------
 .../{ghostscript_10.04.0.bb => ghostscript_10.05.0.bb}   | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.04.0.bb => ghostscript_10.05.0.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index 0546fdf8f0..d191231c7b 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From 095bb1db8b2e68cac40e985f347a7039573e1e80 Mon Sep 17 00:00:00 2001
+From 85905ce3b1bc63f0be9eda9888e40d8e7a803d21 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
 Subject: [PATCH] avoid host contamination
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
index 8c4a5d44e3..0598c3dcd2 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
@@ -1,7 +1,7 @@
-From c481b055cd464734a3c2d80719ead4c1c92a40c9 Mon Sep 17 00:00:00 2001
+From c23b787f9a38be2cdc57133915c402b69acedd1a Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Mon, 4 May 2015 22:31:48 -0700
-Subject: [PATCH 02/10] base/gendev.c: fix for -Werror=return-type
+Subject: [PATCH] base/gendev.c: fix for -Werror=return-type
 
 Fixed:
 base/gendev.c:80:1: error: return type defaults to 'int' [-Werror=return-type]
@@ -14,7 +14,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/base/gendev.c b/base/gendev.c
-index 59d5999..7766b08 100644
+index f36cfe2..031f30b 100644
 --- a/base/gendev.c
 +++ b/base/gendev.c
 @@ -77,6 +77,7 @@ static const char *indent_item = "";
@@ -25,6 +25,3 @@ index 59d5999..7766b08 100644
  main(int argc, char *argv[])
  {
      config conf;
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
index 546d734333..1d05945c30 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "c764dfbb7b13fc71a7a05c634e014f9bb1fb83b899fe39efc0b6c3522a9998b1"
+SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.44.1


--===============3432451002998524189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ghostscript/ghostscript-dbg: FILELIST: removed "/usr/lib/.debug/libgs.so.10.04", added "/usr/lib/.debug/libgs.so.10.05"
packages/core2-64-poky-linux/ghostscript/ghostscript-dbg: PKGSIZE changed from 184817488 to 189473280 (+3%)
packages/core2-64-poky-linux/ghostscript/ghostscript-dbg: PV changed from "10.04.0" to "10.05.0"
packages/core2-64-poky-linux/ghostscript/ghostscript-dbg: PKGV changed from 10.04.0 [default] to 10.05.0 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-dev: PV changed from "10.04.0" to "10.05.0"
packages/core2-64-poky-linux/ghostscript/ghostscript-dev: PKGV changed from 10.04.0 [default] to 10.05.0 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.04.0 -> /usr/share/doc/ghostscript/10.05.0, removed "/usr/share/man/man1/pdf2dsc.1"
packages/core2-64-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed from 11317736 to 11323954 (+0%)
packages/core2-64-poky-linux/ghostscript/ghostscript-doc: PV changed from "10.04.0" to "10.05.0"
packages/core2-64-poky-linux/ghostscript/ghostscript-doc: PKGV changed from 10.04.0 [default] to 10.05.0 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-locale: PV changed from "10.04.0" to "10.05.0"
packages/core2-64-poky-linux/ghostscript/ghostscript-locale: PKGV changed from 10.04.0 [default] to 10.05.0 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-src: FILELIST: directory renamed /usr/src/debug/ghostscript/10.04.0/contrib/pcl3/eprn -> /usr/src/debug/ghostscript/10.05.0/contrib/pcl3/eprn, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/src/viewer -> /usr/src/debug/ghostscript/10.05.0/tesseract/src/viewer, directory renamed /usr/src/debug/ghostscript/10.04.0/ijs -> /usr/src/debug/ghostscript/10.05.0/ijs, directory renamed /usr/src/debug/ghostscript/10.04.0/contrib/opvp -> /usr/src/debug/ghostscript/10.05.0/contrib/opvp, directory renamed /usr/src/debug/ghostscript/10.04.0/contrib/japanese -> /usr/src/debug/ghostscript/10.05.0/contrib/japanese, directory renamed /usr/src/debug/ghostscript/10.04.0/leptonica/src -> /usr/src/debug/ghostscript/10.05.0/leptonica/src, directory renamed /usr/src/debug/ghostscript/10.04.0/lcms2mt/include -> /usr/src/debug/ghostscript/10.05.0/lcms2mt/include, directory renamed /usr/src/debug/ghostscript/10.04.0/devices/vector -> /usr/src/
 debug/ghostscript/10.05.0/devices/vector, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccstruct -> /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccstruct, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/src/textord -> /usr/src/debug/ghostscript/10.05.0/tesseract/src/textord, directory renamed /usr/src/debug/ghostscript/10.04.0/devices/rinkj -> /usr/src/debug/ghostscript/10.05.0/devices/rinkj, directory renamed /usr/src/debug/ghostscript/10.04.0/extract/src -> /usr/src/debug/ghostscript/10.05.0/extract/src, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/src/classify -> /usr/src/debug/ghostscript/10.05.0/tesseract/src/classify, directory renamed /usr/src/debug/ghostscript/10.04.0/lcms2mt/src -> /usr/src/debug/ghostscript/10.05.0/lcms2mt/src, directory renamed /usr/src/debug/ghostscript/10.04.0/pdf -> /usr/src/debug/ghostscript/10.05.0/pdf, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/src/wordrec -> /usr/src/debu
 g/ghostscript/10.05.0/tesseract/src/wordrec, directory renamed /usr/src/debug/ghostscript/10.04.0/contrib/lips4 -> /usr/src/debug/ghostscript/10.05.0/contrib/lips4, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/src/dict -> /usr/src/debug/ghostscript/10.05.0/tesseract/src/dict, directory renamed /usr/src/debug/ghostscript/10.04.0/devices -> /usr/src/debug/ghostscript/10.05.0/devices, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/src/arch -> /usr/src/debug/ghostscript/10.05.0/tesseract/src/arch, directory renamed /usr/src/debug/ghostscript/10.04.0/contrib/pcl3/src -> /usr/src/debug/ghostscript/10.05.0/contrib/pcl3/src, directory renamed /usr/src/debug/ghostscript/10.04.0/base -> /usr/src/debug/ghostscript/10.05.0/base, directory renamed /usr/src/debug/ghostscript/10.04.0/soobj -> /usr/src/debug/ghostscript/10.05.0/soobj, directory renamed /usr/src/debug/ghostscript/10.04.0/psi -> /usr/src/debug/ghostscript/10.05.0/psi, directory renamed /usr/src/debug
 /ghostscript/10.04.0/contrib -> /usr/src/debug/ghostscript/10.05.0/contrib, directory renamed /usr/src/debug/ghostscript/10.04.0/obj -> /usr/src/debug/ghostscript/10.05.0/obj, directory renamed /usr/src/debug/ghostscript/10.04.0/jbig2dec -> /usr/src/debug/ghostscript/10.05.0/jbig2dec, directory renamed /usr/src/debug/ghostscript/10.04.0/contrib/eplaser -> /usr/src/debug/ghostscript/10.05.0/contrib/eplaser, directory renamed /usr/src/debug/ghostscript/10.04.0/cups -> /usr/src/debug/ghostscript/10.05.0/cups, directory renamed /usr/src/debug/ghostscript/10.04.0/openjpeg/src/lib/openjp2 -> /usr/src/debug/ghostscript/10.05.0/openjpeg/src/lib/openjp2, directory renamed /usr/src/debug/ghostscript/10.04.0/zlib -> /usr/src/debug/ghostscript/10.05.0/zlib, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccmain -> /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccmain, directory renamed /usr/src/debug/ghostscript/10.04.0/extract/include/extract -> /usr/src/debug/ghostscript/
 10.05.0/extract/include/extract, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/src/lstm -> /usr/src/debug/ghostscript/10.05.0/tesseract/src/lstm, directory renamed /usr/src/debug/ghostscript/10.04.0/urf -> /usr/src/debug/ghostscript/10.05.0/urf, directory renamed /usr/src/debug/ghostscript/10.04.0/tesseract/include/tesseract -> /usr/src/debug/ghostscript/10.05.0/tesseract/include/tesseract, removed "/usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/tessdatamanager.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/unicharmap.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/scanutils.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/fileerr.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/unicharcompress.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/tesstypes.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/params.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/unicharmap.cpp /usr/src/debug/ghostsc
 ript/10.04.0/tesseract/src/ccutil/tessdatamanager.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/elst.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/tprintf.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/api/capi.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/elst2.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/api/pdf_ttf.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/host.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/elst2.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/genericvector.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/unicharset.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/unicharset.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/ccutil.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/errcode.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/serialis.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/serialis.cpp /usr/src/debug/
 ghostscript/10.04.0/tesseract/src/ccutil/sorthelper.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/tprintf.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/api/lstmboxrenderer.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/params.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/api/pdfrenderer.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/kdpair.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/api/hocrrenderer.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/list.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/scanutils.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/api/altorenderer.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/unichar.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/ccutil.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/unicharcompress.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/api/renderer.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/cc
 util/clst.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/errcode.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/clst.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/api/baseapi.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/elst.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/object_cache.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/api/wordstrboxrenderer.cpp /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/genericheap.h /usr/src/debug/ghostscript/10.04.0/tesseract/src/ccutil/helpers.h", added "/usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/tesserrstream.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/tessdatamanager.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/unicharmap.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/scanutils.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/fileerr.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/unicharcompress.h /usr/src/
 debug/ghostscript/10.05.0/tesseract/src/ccutil/tesstypes.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/params.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/unicharmap.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/tessdatamanager.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/elst.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/tprintf.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/capi.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/elst2.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/pdf_ttf.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/host.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/elst2.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/genericvector.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/unicharset.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/unicharset.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/ccutil.h 
 /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/errcode.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/serialis.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/serialis.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/sorthelper.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/tprintf.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/lstmboxrenderer.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/params.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/pagerenderer.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/pdfrenderer.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/kdpair.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/hocrrenderer.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/list.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/scanutils.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/altorenderer.cpp /usr/src/debug/ghostscript/10.05.0/tesser
 act/src/ccutil/unichar.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/ccutil.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/unicharcompress.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/renderer.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/clst.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/errcode.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/clst.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/baseapi.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/elst.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/object_cache.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/api/wordstrboxrenderer.cpp /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/genericheap.h /usr/src/debug/ghostscript/10.05.0/tesseract/src/ccutil/helpers.h"
packages/core2-64-poky-linux/ghostscript/ghostscript-src: PKGSIZE changed from 93216320 to 93322170 (+0%)
packages/core2-64-poky-linux/ghostscript/ghostscript-src: PV changed from "10.04.0" to "10.05.0"
packages/core2-64-poky-linux/ghostscript/ghostscript-src: PKGV changed from 10.04.0 [default] to 10.05.0 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-staticdev: PV changed from "10.04.0" to "10.05.0"
packages/core2-64-poky-linux/ghostscript/ghostscript-staticdev: PKGV changed from 10.04.0 [default] to 10.05.0 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.04.0/Resource/ColorSpace -> /usr/share/ghostscript/10.05.0/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.04.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.05.0/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.04.0/Resource/CIDFont -> /usr/share/ghostscript/10.05.0/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.04.0/Resource/SubstCID -> /usr/share/ghostscript/10.05.0/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.04.0/Resource/Init -> /usr/share/ghostscript/10.05.0/Resource/Init, directory renamed /usr/share/ghostscript/10.04.0/Resource/CMap -> /usr/share/ghostscript/10.05.0/Resource/CMap, directory renamed /usr/share/ghostscript/10.04.0/Resource/Encoding -> /usr/share/ghostscript/10.05.0/Resource/Encoding, directory renamed /usr/share/ghostscript/10.04.0/Resource/IdiomSet -> /usr/share/ghostscript/10.05.0/Resou
 rce/IdiomSet, directory renamed /usr/share/ghostscript/10.04.0/iccprofiles -> /usr/share/ghostscript/10.05.0/iccprofiles, directory renamed /usr/share/ghostscript/10.04.0/Resource/Font -> /usr/share/ghostscript/10.05.0/Resource/Font, directory renamed /usr/share/ghostscript/10.04.0/Resource/Decoding -> /usr/share/ghostscript/10.05.0/Resource/Decoding, removed "/usr/share/ghostscript/10.04.0/lib/acctest.ps /usr/share/ghostscript/10.04.0/lib/bjc6000a1.upp /usr/share/ghostscript/10.04.0/lib/cbjc600.ppd /usr/share/ghostscript/10.04.0/lib/cbjc800.ppd /usr/share/ghostscript/10.04.0/lib/necp2x.upp /usr/share/ghostscript/10.04.0/lib/gs_lgx_e.ps /usr/share/ghostscript/10.04.0/lib/PDFX_def.ps /usr/share/ghostscript/10.04.0/lib/PDFA_def.ps /usr/share/ghostscript/10.04.0/lib/cdj690.upp /usr/share/ghostscript/10.04.0/lib/stc300.upp /usr/share/ghostscript/10.04.0/lib/cdj550.upp /usr/share/ghostscript/10.04.0/lib/bjc610b1.upp /usr/share/ghostscript/10.04.0/lib/bj8oh06n.upp /usr/share/ghostscript/1
 0.04.0/lib/bj8pa06n.upp /usr/share/ghostscript/10.04.0/lib/bj8ts06n.upp /usr/share/ghostscript/10.04.0/lib/mkcidfm.ps /usr/share/ghostscript/10.04.0/lib/Stc670pl.upp /usr/share/ghostscript/10.04.0/lib/Stc680pl.upp /usr/share/ghostscript/10.04.0/lib/Stc740pl.upp /usr/share/ghostscript/10.04.0/lib/Stc760pl.upp /usr/share/ghostscript/10.04.0/lib/Stp720pl.upp /usr/share/ghostscript/10.04.0/lib/Stp870pl.upp /usr/share/ghostscript/10.04.0/lib/sipixa6.upp /usr/share/ghostscript/10.04.0/lib/stc600pl.upp /usr/share/ghostscript/10.04.0/lib/stc800pl.upp /usr/share/ghostscript/10.04.0/lib/viewmiff.ps /usr/share/ghostscript/10.04.0/lib/viewpcx.ps /usr/share/ghostscript/10.04.0/lib/font2pcl.ps /usr/share/ghostscript/10.04.0/lib/bjc610a4.upp /usr/share/ghostscript/10.04.0/lib/bj8gc12f.upp /usr/share/ghostscript/10.04.0/lib/bj8hg12f.upp /usr/share/ghostscript/10.04.0/lib/bj8pp12f.upp /usr/share/ghostscript/10.04.0/lib/bjc610a1.upp /usr/share/ghostscript/10.04.0/lib/pf2afm.ps /usr/share/ghostscript/
 10.04.0/lib/ras1.upp /usr/share/ghostscript/10.04.0/lib/ras3.upp /usr/share/ghostscript/10.04.0/lib/ras4.upp /usr/share/ghostscript/10.04.0/lib/stc2.upp /usr/share/ghostscript/10.04.0/lib/dnj750c.upp /usr/share/ghostscript/10.04.0/lib/st640ihg.upp /usr/share/ghostscript/10.04.0/lib/prfont.ps /usr/share/ghostscript/10.04.0/lib/stocht.ps /usr/share/ghostscript/10.04.0/lib/bjc610a5.upp /usr/share/ghostscript/10.04.0/lib/st640plg.upp /usr/share/ghostscript/10.04.0/lib/st640ih.upp /usr/share/ghostscript/10.04.0/lib/gs_css_e.ps /usr/share/ghostscript/10.04.0/lib/bjc610b4.upp /usr/share/ghostscript/10.04.0/lib/ras24.upp /usr/share/ghostscript/10.04.0/lib/ras32.upp /usr/share/ghostscript/10.04.0/lib/ras8m.upp /usr/share/ghostscript/10.04.0/lib/sharp.upp /usr/share/ghostscript/10.04.0/lib/stc_h.upp /usr/share/ghostscript/10.04.0/lib/stc_l.upp /usr/share/ghostscript/10.04.0/lib/stc.upp /usr/share/ghostscript/10.04.0/lib/ghostpdf.ppd /usr/share/ghostscript/10.04.0/lib/gs_wl1_e.ps /usr/share/gh
 ostscript/10.04.0/lib/gslp.ps /usr/share/ghostscript/10.04.0/lib/pphs.ps /usr/share/ghostscript/10.04.0/lib/rollconv.ps /usr/lib/libgs.so.10.04 /usr/share/ghostscript/10.04.0/lib/bj8.rpd /usr/share/ghostscript/10.04.0/lib/stc500ph.upp /usr/share/ghostscript/10.04.0/lib/stcany.upp /usr/bin/pdf2dsc /usr/share/ghostscript/10.04.0/lib/gs_l_m.xbm /usr/share/ghostscript/10.04.0/lib/gs_m_m.xbm /usr/share/ghostscript/10.04.0/lib/gs_s_m.xbm /usr/share/ghostscript/10.04.0/lib/gs_t_m.xbm /usr/share/ghostscript/10.04.0/lib/stc300bl.upp /usr/share/ghostscript/10.04.0/lib/Stc670p.upp /usr/share/ghostscript/10.04.0/lib/Stc680p.upp /usr/share/ghostscript/10.04.0/lib/Stc740p.upp /usr/share/ghostscript/10.04.0/lib/Stc760p.upp /usr/share/ghostscript/10.04.0/lib/Stp720p.upp /usr/share/ghostscript/10.04.0/lib/Stp870p.upp /usr/share/ghostscript/10.04.0/lib/stc500p.upp /usr/share/ghostscript/10.04.0/lib/stc600p.upp /usr/share/ghostscript/10.04.0/lib/stc640p.upp /usr/share/ghostscript/10.04.0/lib/stc800p.u
 pp /usr/share/ghostscript/10.04.0/lib/necp2x6.upp /usr/share/ghostscript/10.04.0/lib/gs_wl5_e.ps /usr/share/ghostscript/10.04.0/lib/s400a1.upp /usr/share/ghostscript/10.04.0/lib/s400b1.upp /usr/share/ghostscript/10.04.0/lib/bjc6000b1.upp /usr/share/ghostscript/10.04.0/lib/bjc610b7.upp /usr/share/ghostscript/10.04.0/lib/PM760p.upp /usr/share/ghostscript/10.04.0/lib/PM820p.upp /usr/share/ghostscript/10.04.0/lib/st640p.upp /usr/share/ghostscript/10.04.0/lib/gs_l.xpm /usr/share/ghostscript/10.04.0/lib/gs_m.xpm /usr/share/ghostscript/10.04.0/lib/gs_s.xpm /usr/share/ghostscript/10.04.0/lib/gs_t.xpm /usr/share/ghostscript/10.04.0/lib/stcolor.ps /usr/share/ghostscript/10.04.0/lib/stc600ih.upp /usr/share/ghostscript/10.04.0/lib/stc740ih.upp /usr/share/ghostscript/10.04.0/lib/stc800ih.upp /usr/share/ghostscript/10.04.0/lib/align.ps /usr/share/ghostscript/10.04.0/lib/docie.ps /usr/share/ghostscript/10.04.0/lib/gsnup.ps /usr/share/ghostscript/10.04.0/lib/lines.ps /usr/share/ghostscript/10.04.0/
 lib/pdf2dsc.ps /usr/share/ghostscript/10.04.0/lib/ppath.ps /usr/share/ghostscript/10.04.0/lib/ps2ai.ps /usr/share/ghostscript/10.04.0/lib/bjc610a2.upp /usr/share/ghostscript/10.04.0/lib/cid2code.ps /usr/share/ghostscript/10.04.0/lib/Stc777p.upp /usr/share/ghostscript/10.04.0/lib/gs_il2_e.ps /usr/share/ghostscript/10.04.0/lib/gs_wl2_e.ps /usr/share/ghostscript/10.04.0/lib/gs_ce_e.ps /usr/share/ghostscript/10.04.0/lib/cdj690ec.upp /usr/share/ghostscript/10.04.0/lib/bjc610b8.upp /usr/share/ghostscript/10.04.0/lib/zeroline.ps /usr/share/ghostscript/10.04.0/lib/traceop.ps /usr/share/ghostscript/10.04.0/lib/PM760pl.upp /usr/share/ghostscript/10.04.0/lib/PM820pl.upp /usr/share/ghostscript/10.04.0/lib/st640pl.upp /usr/share/ghostscript/10.04.0/lib/bjc610b6.upp /usr/share/ghostscript/10.04.0/lib/stc200_h.upp /usr/share/ghostscript/10.04.0/lib/bjc610a3.upp /usr/share/ghostscript/10.04.0/lib/gs_ksb_e.ps /usr/share/ghostscript/10.04.0/lib/gs_l.xbm /usr/share/ghostscript/10.04.0/lib/gs_m.xbm /us
 r/share/ghostscript/10.04.0/lib/gs_s.xbm /usr/share/ghostscript/10.04.0/lib/gs_t.xbm /usr/share/ghostscript/10.04.0/lib/stc2s_h.upp /usr/share/ghostscript/10.04.0/lib/caption.ps /usr/share/ghostscript/10.04.0/lib/winmaps.ps /usr/share/ghostscript/10.04.0/lib/stcany_h.upp /usr/share/ghostscript/10.04.0/lib/stc2_h.upp /usr/share/ghostscript/10.04.0/lib/viewcmyk.ps /usr/share/ghostscript/10.04.0/lib/jispaper.ps /usr/share/ghostscript/10.04.0/lib/traceimg.ps /usr/share/ghostscript/10.04.0/lib/st640pg.upp /usr/share/ghostscript/10.04.0/lib/ht_ccsto.ps /usr/share/ghostscript/10.04.0/lib/viewpbm.ps /usr/share/ghostscript/10.04.0/lib/bjc610a7.upp /usr/share/ghostscript/10.04.0/lib/stc1520h.upp /usr/share/ghostscript/10.04.0/lib/stcinfo.ps /usr/share/ghostscript/10.04.0/lib/landscap.ps /usr/share/ghostscript/10.04.0/lib/gs_lgo_e.ps /usr/share/ghostscript/10.04.0/lib/ps2epsi.ps /usr/share/ghostscript/10.04.0/lib/bjc610b2.upp /usr/share/ghostscript/10.04.0/lib/stc300bm.upp /usr/share/ghostscri
 pt/10.04.0/lib/viewgif.ps /usr/share/ghostscript/10.04.0/lib/pdf_info.ps /usr/share/ghostscript/10.04.0/lib/viewps2a.ps /usr/share/ghostscript/10.04.0/lib/dnj750m.upp /usr/share/ghostscript/10.04.0/lib/viewjpeg.ps /usr/share/ghostscript/10.04.0/lib/bjc610b3.upp /usr/share/ghostscript/10.04.0/lib/bjc610a0.upp /usr/share/ghostscript/10.04.0/lib/uninfo.ps /usr/share/ghostscript/10.04.0/lib/bjc610a6.upp /usr/share/ghostscript/10.04.0/lib/printafm.ps /usr/share/ghostscript/10.04.0/lib/image-qa.ps /usr/share/ghostscript/10.04.0/lib/Stc777pl.upp /usr/share/ghostscript/10.04.0/lib/bjc610a8.upp /usr/share/ghostscript/10.04.0/lib/pfbtopfa.ps /usr/share/ghostscript/10.04.0/lib/gs_kanji.ps", added "/usr/share/ghostscript/10.05.0/lib/acctest.ps /usr/share/ghostscript/10.05.0/lib/bjc6000a1.upp /usr/share/ghostscript/10.05.0/lib/cbjc600.ppd /usr/share/ghostscript/10.05.0/lib/cbjc800.ppd /usr/share/ghostscript/10.05.0/lib/necp2x.upp /usr/share/ghostscript/10.05.0/lib/gs_lgx_e.ps /usr/share/ghostscr
 ipt/10.05.0/lib/PDFX_def.ps /usr/share/ghostscript/10.05.0/lib/PDFA_def.ps /usr/share/ghostscript/10.05.0/lib/cdj690.upp /usr/share/ghostscript/10.05.0/lib/stc300.upp /usr/share/ghostscript/10.05.0/lib/cdj550.upp /usr/share/ghostscript/10.05.0/lib/bjc610b1.upp /usr/share/ghostscript/10.05.0/lib/bj8oh06n.upp /usr/share/ghostscript/10.05.0/lib/bj8pa06n.upp /usr/share/ghostscript/10.05.0/lib/bj8ts06n.upp /usr/share/ghostscript/10.05.0/lib/mkcidfm.ps /usr/share/ghostscript/10.05.0/lib/Stc670pl.upp /usr/share/ghostscript/10.05.0/lib/Stc680pl.upp /usr/share/ghostscript/10.05.0/lib/Stc740pl.upp /usr/share/ghostscript/10.05.0/lib/Stc760pl.upp /usr/share/ghostscript/10.05.0/lib/Stp720pl.upp /usr/share/ghostscript/10.05.0/lib/Stp870pl.upp /usr/share/ghostscript/10.05.0/lib/sipixa6.upp /usr/share/ghostscript/10.05.0/lib/stc600pl.upp /usr/share/ghostscript/10.05.0/lib/stc800pl.upp /usr/share/ghostscript/10.05.0/lib/viewmiff.ps /usr/share/ghostscript/10.05.0/lib/viewpcx.ps /usr/share/ghostscript
 /10.05.0/lib/font2pcl.ps /usr/share/ghostscript/10.05.0/lib/bjc610a4.upp /usr/share/ghostscript/10.05.0/lib/bj8gc12f.upp /usr/share/ghostscript/10.05.0/lib/bj8hg12f.upp /usr/share/ghostscript/10.05.0/lib/bj8pp12f.upp /usr/share/ghostscript/10.05.0/lib/bjc610a1.upp /usr/share/ghostscript/10.05.0/lib/pf2afm.ps /usr/share/ghostscript/10.05.0/lib/ras1.upp /usr/share/ghostscript/10.05.0/lib/ras3.upp /usr/share/ghostscript/10.05.0/lib/ras4.upp /usr/share/ghostscript/10.05.0/lib/stc2.upp /usr/share/ghostscript/10.05.0/lib/dnj750c.upp /usr/share/ghostscript/10.05.0/lib/st640ihg.upp /usr/share/ghostscript/10.05.0/lib/prfont.ps /usr/share/ghostscript/10.05.0/lib/stocht.ps /usr/share/ghostscript/10.05.0/lib/bjc610a5.upp /usr/share/ghostscript/10.05.0/lib/st640plg.upp /usr/share/ghostscript/10.05.0/lib/st640ih.upp /usr/share/ghostscript/10.05.0/lib/gs_css_e.ps /usr/share/ghostscript/10.05.0/lib/bjc610b4.upp /usr/share/ghostscript/10.05.0/lib/ras24.upp /usr/share/ghostscript/10.05.0/lib/ras32.up
 p /usr/share/ghostscript/10.05.0/lib/ras8m.upp /usr/share/ghostscript/10.05.0/lib/sharp.upp /usr/share/ghostscript/10.05.0/lib/stc_h.upp /usr/share/ghostscript/10.05.0/lib/stc_l.upp /usr/share/ghostscript/10.05.0/lib/stc.upp /usr/share/ghostscript/10.05.0/lib/ghostpdf.ppd /usr/share/ghostscript/10.05.0/lib/gs_wl1_e.ps /usr/share/ghostscript/10.05.0/lib/gslp.ps /usr/share/ghostscript/10.05.0/lib/pphs.ps /usr/share/ghostscript/10.05.0/lib/rollconv.ps /usr/lib/libgs.so.10.05 /usr/share/ghostscript/10.05.0/lib/bj8.rpd /usr/share/ghostscript/10.05.0/lib/stc500ph.upp /usr/share/ghostscript/10.05.0/lib/stcany.upp /usr/share/ghostscript/10.05.0/lib/gs_l_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_m_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_s_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_t_m.xbm /usr/share/ghostscript/10.05.0/lib/stc300bl.upp /usr/share/ghostscript/10.05.0/lib/Stc670p.upp /usr/share/ghostscript/10.05.0/lib/Stc680p.upp /usr/share/ghostscript/10.05.0/lib/Stc740p.upp /usr/share
 /ghostscript/10.05.0/lib/Stc760p.upp /usr/share/ghostscript/10.05.0/lib/Stp720p.upp /usr/share/ghostscript/10.05.0/lib/Stp870p.upp /usr/share/ghostscript/10.05.0/lib/stc500p.upp /usr/share/ghostscript/10.05.0/lib/stc600p.upp /usr/share/ghostscript/10.05.0/lib/stc640p.upp /usr/share/ghostscript/10.05.0/lib/stc800p.upp /usr/share/ghostscript/10.05.0/lib/necp2x6.upp /usr/share/ghostscript/10.05.0/lib/gs_wl5_e.ps /usr/share/ghostscript/10.05.0/lib/s400a1.upp /usr/share/ghostscript/10.05.0/lib/s400b1.upp /usr/share/ghostscript/10.05.0/lib/bjc6000b1.upp /usr/share/ghostscript/10.05.0/lib/bjc610b7.upp /usr/share/ghostscript/10.05.0/lib/PM760p.upp /usr/share/ghostscript/10.05.0/lib/PM820p.upp /usr/share/ghostscript/10.05.0/lib/st640p.upp /usr/share/ghostscript/10.05.0/lib/gs_l.xpm /usr/share/ghostscript/10.05.0/lib/gs_m.xpm /usr/share/ghostscript/10.05.0/lib/gs_s.xpm /usr/share/ghostscript/10.05.0/lib/gs_t.xpm /usr/share/ghostscript/10.05.0/lib/stcolor.ps /usr/share/ghostscript/10.05.0/lib/
 stc600ih.upp /usr/share/ghostscript/10.05.0/lib/stc740ih.upp /usr/share/ghostscript/10.05.0/lib/stc800ih.upp /usr/share/ghostscript/10.05.0/lib/align.ps /usr/share/ghostscript/10.05.0/lib/docie.ps /usr/share/ghostscript/10.05.0/lib/gsnup.ps /usr/share/ghostscript/10.05.0/lib/lines.ps /usr/share/ghostscript/10.05.0/lib/ppath.ps /usr/share/ghostscript/10.05.0/lib/ps2ai.ps /usr/share/ghostscript/10.05.0/lib/bjc610a2.upp /usr/share/ghostscript/10.05.0/lib/cid2code.ps /usr/share/ghostscript/10.05.0/lib/Stc777p.upp /usr/share/ghostscript/10.05.0/lib/gs_il2_e.ps /usr/share/ghostscript/10.05.0/lib/gs_wl2_e.ps /usr/share/ghostscript/10.05.0/lib/gs_ce_e.ps /usr/share/ghostscript/10.05.0/lib/cdj690ec.upp /usr/share/ghostscript/10.05.0/lib/bjc610b8.upp /usr/share/ghostscript/10.05.0/lib/zeroline.ps /usr/share/ghostscript/10.05.0/lib/traceop.ps /usr/share/ghostscript/10.05.0/lib/PM760pl.upp /usr/share/ghostscript/10.05.0/lib/PM820pl.upp /usr/share/ghostscript/10.05.0/lib/st640pl.upp /usr/share/g
 hostscript/10.05.0/lib/bjc610b6.upp /usr/share/ghostscript/10.05.0/lib/stc200_h.upp /usr/share/ghostscript/10.05.0/lib/bjc610a3.upp /usr/share/ghostscript/10.05.0/lib/gs_ksb_e.ps /usr/share/ghostscript/10.05.0/lib/gs_l.xbm /usr/share/ghostscript/10.05.0/lib/gs_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_s.xbm /usr/share/ghostscript/10.05.0/lib/gs_t.xbm /usr/share/ghostscript/10.05.0/lib/stc2s_h.upp /usr/share/ghostscript/10.05.0/lib/caption.ps /usr/share/ghostscript/10.05.0/lib/winmaps.ps /usr/share/ghostscript/10.05.0/lib/stcany_h.upp /usr/share/ghostscript/10.05.0/lib/stc2_h.upp /usr/share/ghostscript/10.05.0/lib/viewcmyk.ps /usr/share/ghostscript/10.05.0/lib/jispaper.ps /usr/share/ghostscript/10.05.0/lib/traceimg.ps /usr/share/ghostscript/10.05.0/lib/st640pg.upp /usr/share/ghostscript/10.05.0/lib/ht_ccsto.ps /usr/share/ghostscript/10.05.0/lib/viewpbm.ps /usr/share/ghostscript/10.05.0/lib/bjc610a7.upp /usr/share/ghostscript/10.05.0/lib/stc1520h.upp /usr/share/ghostscript/10.05.0/l
 ib/stcinfo.ps /usr/share/ghostscript/10.05.0/lib/landscap.ps /usr/share/ghostscript/10.05.0/lib/gs_lgo_e.ps /usr/share/ghostscript/10.05.0/lib/zugferd.ps /usr/share/ghostscript/10.05.0/lib/ps2epsi.ps /usr/share/ghostscript/10.05.0/lib/bjc610b2.upp /usr/share/ghostscript/10.05.0/lib/stc300bm.upp /usr/share/ghostscript/10.05.0/lib/viewgif.ps /usr/share/ghostscript/10.05.0/lib/pdf_info.ps /usr/share/ghostscript/10.05.0/lib/viewps2a.ps /usr/share/ghostscript/10.05.0/lib/dnj750m.upp /usr/share/ghostscript/10.05.0/lib/viewjpeg.ps /usr/share/ghostscript/10.05.0/lib/bjc610b3.upp /usr/share/ghostscript/10.05.0/lib/bjc610a0.upp /usr/share/ghostscript/10.05.0/lib/uninfo.ps /usr/share/ghostscript/10.05.0/lib/bjc610a6.upp /usr/share/ghostscript/10.05.0/lib/printafm.ps /usr/share/ghostscript/10.05.0/lib/image-qa.ps /usr/share/ghostscript/10.05.0/lib/Stc777pl.upp /usr/share/ghostscript/10.05.0/lib/bjc610a8.upp /usr/share/ghostscript/10.05.0/lib/pfbtopfa.ps /usr/share/ghostscript/10.05.0/lib/gs_kan
 ji.ps"
packages/core2-64-poky-linux/ghostscript/ghostscript: PKGSIZE changed from 92319507 to 92681579 (+0%)
packages/core2-64-poky-linux/ghostscript/ghostscript: PV changed from "10.04.0" to "10.05.0"
packages/core2-64-poky-linux/ghostscript/ghostscript: PKGV changed from 10.04.0 [default] to 10.05.0 [default]
packages/core2-64-poky-linux/ghostscript: SRC_URI changed from "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10040/ghostscript-10.04.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch" to "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10050/ghostscript-10.05.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch"
packages/core2-64-poky-linux/ghostscript: PV changed from "10.04.0" to "10.05.0"
packages/core2-64-poky-linux/ghostscript: PKGV changed from 10.04.0 [default] to 10.05.0 [default]
Changes to packages/core2-64-poky-linux/ghostscript (sysroot):
  /usr/lib/libgs.so.10 changed symlink target from libgs.so.10.04 to libgs.so.10.05
  /usr/lib/libgs.so changed symlink target from libgs.so.10.04 to libgs.so.10.05
  /usr/lib/libgs.so.10.04 moved to /usr/lib/libgs.so.10.05
  /usr/share/ghostscript/10.04.0 moved to /usr/share/ghostscript/10.05.0
  /usr/share/ghostscript/10.05.0/lib/zugferd.ps was added
  /usr/share/ghostscript/10.04.0/lib/pdf2dsc.ps was removed

--===============3432451002998524189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.04.0 -> /usr/share/doc/ghostscript/10.05.0, removed "/usr/share/man/man1/pdf2dsc.1"
packages/core2-64-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.04.0/Resource/CIDFont -> /usr/share/ghostscript/10.05.0/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.04.0/Resource/SubstCID -> /usr/share/ghostscript/10.05.0/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.04.0/Resource/Encoding -> /usr/share/ghostscript/10.05.0/Resource/Encoding, directory renamed /usr/share/ghostscript/10.04.0/Resource/Init -> /usr/share/ghostscript/10.05.0/Resource/Init, directory renamed /usr/share/ghostscript/10.04.0/Resource/Decoding -> /usr/share/ghostscript/10.05.0/Resource/Decoding, directory renamed /usr/share/ghostscript/10.04.0/Resource/ColorSpace -> /usr/share/ghostscript/10.05.0/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.04.0/Resource/Font -> /usr/share/ghostscript/10.05.0/Resource/Font, directory renamed /usr/share/ghostscript/10.04.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.05.0/Resour
 ce/CIDFSubst, directory renamed /usr/share/ghostscript/10.04.0/Resource/CMap -> /usr/share/ghostscript/10.05.0/Resource/CMap, directory renamed /usr/share/ghostscript/10.04.0/Resource/IdiomSet -> /usr/share/ghostscript/10.05.0/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.04.0/iccprofiles -> /usr/share/ghostscript/10.05.0/iccprofiles, removed "/usr/share/ghostscript/10.04.0/lib/ras32.upp /usr/share/ghostscript/10.04.0/lib/sharp.upp /usr/share/ghostscript/10.04.0/lib/ras24.upp /usr/share/ghostscript/10.04.0/lib/ras8m.upp /usr/share/ghostscript/10.04.0/lib/printafm.ps /usr/share/ghostscript/10.04.0/lib/stc500ph.upp /usr/share/ghostscript/10.04.0/lib/stc_h.upp /usr/share/ghostscript/10.04.0/lib/stc_l.upp /usr/share/ghostscript/10.04.0/lib/bjc610a0.upp /usr/share/ghostscript/10.04.0/lib/bjc610b8.upp /usr/share/ghostscript/10.04.0/lib/bjc610b4.upp /usr/share/ghostscript/10.04.0/lib/gs_lgx_e.ps /usr/share/ghostscript/10.04.0/lib/bjc610b2.upp /usr/share/ghostscript/10.04.0
 /lib/PM820p.upp /usr/share/ghostscript/10.04.0/lib/st640p.upp /usr/share/ghostscript/10.04.0/lib/PM760p.upp /usr/share/ghostscript/10.04.0/lib/cdj690ec.upp /usr/share/ghostscript/10.04.0/lib/stc200_h.upp /usr/share/ghostscript/10.04.0/lib/bj8.rpd /usr/share/ghostscript/10.04.0/lib/align.ps /usr/share/ghostscript/10.04.0/lib/docie.ps /usr/share/ghostscript/10.04.0/lib/gsnup.ps /usr/share/ghostscript/10.04.0/lib/lines.ps /usr/share/ghostscript/10.04.0/lib/ppath.ps /usr/share/ghostscript/10.04.0/lib/stc1520h.upp /usr/share/ghostscript/10.04.0/lib/bj8oh06n.upp /usr/share/ghostscript/10.04.0/lib/bj8pa06n.upp /usr/share/ghostscript/10.04.0/lib/bj8ts06n.upp /usr/share/ghostscript/10.04.0/lib/Stc777pl.upp /usr/share/ghostscript/10.04.0/lib/gslp.ps /usr/share/ghostscript/10.04.0/lib/pphs.ps /usr/share/ghostscript/10.04.0/lib/stc.upp /usr/share/ghostscript/10.04.0/lib/stcolor.ps /usr/share/ghostscript/10.04.0/lib/uninfo.ps /usr/share/ghostscript/10.04.0/lib/bjc610a6.upp /usr/share/ghostscript
 /10.04.0/lib/bjc610b6.upp /usr/share/ghostscript/10.04.0/lib/cbjc600.ppd /usr/share/ghostscript/10.04.0/lib/cbjc800.ppd /usr/share/ghostscript/10.04.0/lib/rollconv.ps /usr/share/ghostscript/10.04.0/lib/zeroline.ps /usr/share/ghostscript/10.04.0/lib/bjc6000b1.upp /usr/share/ghostscript/10.04.0/lib/stcany_h.upp /usr/share/ghostscript/10.04.0/lib/viewpcx.ps /usr/share/ghostscript/10.04.0/lib/gs_wl1_e.ps /usr/share/ghostscript/10.04.0/lib/bjc610a5.upp /usr/share/ghostscript/10.04.0/lib/cid2code.ps /usr/share/ghostscript/10.04.0/lib/bjc610a4.upp /usr/share/ghostscript/10.04.0/lib/winmaps.ps /usr/share/ghostscript/10.04.0/lib/ghostpdf.ppd /usr/share/ghostscript/10.04.0/lib/bjc610a3.upp /usr/share/ghostscript/10.04.0/lib/st640plg.upp /usr/share/ghostscript/10.04.0/lib/bjc610b3.upp /usr/share/ghostscript/10.04.0/lib/caption.ps /usr/share/ghostscript/10.04.0/lib/necp2x6.upp /usr/share/ghostscript/10.04.0/lib/ras1.upp /usr/share/ghostscript/10.04.0/lib/ras3.upp /usr/lib/libgs.so.10.04 /usr/sh
 are/ghostscript/10.04.0/lib/font2pcl.ps /usr/share/ghostscript/10.04.0/lib/prfont.ps /usr/share/ghostscript/10.04.0/lib/ras4.upp /usr/share/ghostscript/10.04.0/lib/stc2.upp /usr/share/ghostscript/10.04.0/lib/stocht.ps /usr/share/ghostscript/10.04.0/lib/st640ih.upp /usr/share/ghostscript/10.04.0/lib/pdf_info.ps /usr/share/ghostscript/10.04.0/lib/gs_ksb_e.ps /usr/share/ghostscript/10.04.0/lib/dnj750c.upp /usr/share/ghostscript/10.04.0/lib/viewps2a.ps /usr/share/ghostscript/10.04.0/lib/st640ihg.upp /usr/share/ghostscript/10.04.0/lib/mkcidfm.ps /usr/share/ghostscript/10.04.0/lib/Stp870p.upp /usr/share/ghostscript/10.04.0/lib/necp2x.upp /usr/share/ghostscript/10.04.0/lib/bjc610b1.upp /usr/share/ghostscript/10.04.0/lib/bjc610a2.upp /usr/share/ghostscript/10.04.0/lib/gs_t.xbm /usr/share/ghostscript/10.04.0/lib/dnj750m.upp /usr/share/ghostscript/10.04.0/lib/stcany.upp /usr/share/ghostscript/10.04.0/lib/bjc610a7.upp /usr/share/ghostscript/10.04.0/lib/pfbtopfa.ps /usr/share/ghostscript/10.04.
 0/lib/bjc610a1.upp /usr/share/ghostscript/10.04.0/lib/st640pg.upp /usr/share/ghostscript/10.04.0/lib/viewgif.ps /usr/share/ghostscript/10.04.0/lib/ps2ai.ps /usr/share/ghostscript/10.04.0/lib/gs_css_e.ps /usr/share/ghostscript/10.04.0/lib/stc600p.upp /usr/share/ghostscript/10.04.0/lib/stc640p.upp /usr/share/ghostscript/10.04.0/lib/stc800p.upp /usr/share/ghostscript/10.04.0/lib/stc500p.upp /usr/share/ghostscript/10.04.0/lib/Stc670p.upp /usr/share/ghostscript/10.04.0/lib/Stc680p.upp /usr/share/ghostscript/10.04.0/lib/Stc740p.upp /usr/share/ghostscript/10.04.0/lib/viewcmyk.ps /usr/share/ghostscript/10.04.0/lib/Stc760p.upp /usr/share/ghostscript/10.04.0/lib/Stp720p.upp /usr/share/ghostscript/10.04.0/lib/gs_l.xbm /usr/share/ghostscript/10.04.0/lib/gs_m.xbm /usr/share/ghostscript/10.04.0/lib/gs_s.xbm /usr/share/ghostscript/10.04.0/lib/landscap.ps /usr/share/ghostscript/10.04.0/lib/gs_il2_e.ps /usr/share/ghostscript/10.04.0/lib/cdj550.upp /usr/share/ghostscript/10.04.0/lib/cdj690.upp /usr/s
 hare/ghostscript/10.04.0/lib/gs_ce_e.ps /usr/share/ghostscript/10.04.0/lib/bjc610b7.upp /usr/share/ghostscript/10.04.0/lib/gs_wl2_e.ps /usr/share/ghostscript/10.04.0/lib/stc300.upp /usr/share/ghostscript/10.04.0/lib/stcinfo.ps /usr/share/ghostscript/10.04.0/lib/bjc6000a1.upp /usr/share/ghostscript/10.04.0/lib/s400a1.upp /usr/share/ghostscript/10.04.0/lib/s400b1.upp /usr/share/ghostscript/10.04.0/lib/sipixa6.upp /usr/share/ghostscript/10.04.0/lib/pdf2dsc.ps /usr/share/ghostscript/10.04.0/lib/gs_wl5_e.ps /usr/share/ghostscript/10.04.0/lib/Stc777p.upp /usr/share/ghostscript/10.04.0/lib/gs_kanji.ps /usr/bin/pdf2dsc /usr/share/ghostscript/10.04.0/lib/Stc670pl.upp /usr/share/ghostscript/10.04.0/lib/Stc680pl.upp /usr/share/ghostscript/10.04.0/lib/Stc740pl.upp /usr/share/ghostscript/10.04.0/lib/Stc760pl.upp /usr/share/ghostscript/10.04.0/lib/Stp720pl.upp /usr/share/ghostscript/10.04.0/lib/Stp870pl.upp /usr/share/ghostscript/10.04.0/lib/stc600pl.upp /usr/share/ghostscript/10.04.0/lib/stc800p
 l.upp /usr/share/ghostscript/10.04.0/lib/viewjpeg.ps /usr/share/ghostscript/10.04.0/lib/bjc610a8.upp /usr/share/ghostscript/10.04.0/lib/ht_ccsto.ps /usr/share/ghostscript/10.04.0/lib/traceop.ps /usr/share/ghostscript/10.04.0/lib/image-qa.ps /usr/share/ghostscript/10.04.0/lib/pf2afm.ps /usr/share/ghostscript/10.04.0/lib/viewpbm.ps /usr/share/ghostscript/10.04.0/lib/gs_l.xpm /usr/share/ghostscript/10.04.0/lib/gs_m.xpm /usr/share/ghostscript/10.04.0/lib/gs_s.xpm /usr/share/ghostscript/10.04.0/lib/gs_t.xpm /usr/share/ghostscript/10.04.0/lib/viewmiff.ps /usr/share/ghostscript/10.04.0/lib/bj8gc12f.upp /usr/share/ghostscript/10.04.0/lib/bj8hg12f.upp /usr/share/ghostscript/10.04.0/lib/bj8pp12f.upp /usr/share/ghostscript/10.04.0/lib/stc300bl.upp /usr/share/ghostscript/10.04.0/lib/PDFA_def.ps /usr/share/ghostscript/10.04.0/lib/PDFX_def.ps /usr/share/ghostscript/10.04.0/lib/gs_l_m.xbm /usr/share/ghostscript/10.04.0/lib/gs_m_m.xbm /usr/share/ghostscript/10.04.0/lib/gs_s_m.xbm /usr/share/ghostsc
 ript/10.04.0/lib/gs_t_m.xbm /usr/share/ghostscript/10.04.0/lib/gs_lgo_e.ps /usr/share/ghostscript/10.04.0/lib/acctest.ps /usr/share/ghostscript/10.04.0/lib/stc300bm.upp /usr/share/ghostscript/10.04.0/lib/traceimg.ps /usr/share/ghostscript/10.04.0/lib/stc600ih.upp /usr/share/ghostscript/10.04.0/lib/stc740ih.upp /usr/share/ghostscript/10.04.0/lib/stc800ih.upp /usr/share/ghostscript/10.04.0/lib/stc2s_h.upp /usr/share/ghostscript/10.04.0/lib/jispaper.ps /usr/share/ghostscript/10.04.0/lib/PM760pl.upp /usr/share/ghostscript/10.04.0/lib/PM820pl.upp /usr/share/ghostscript/10.04.0/lib/st640pl.upp /usr/share/ghostscript/10.04.0/lib/ps2epsi.ps /usr/share/ghostscript/10.04.0/lib/stc2_h.upp", added "/usr/share/ghostscript/10.05.0/lib/ras32.upp /usr/share/ghostscript/10.05.0/lib/sharp.upp /usr/share/ghostscript/10.05.0/lib/ras24.upp /usr/share/ghostscript/10.05.0/lib/ras8m.upp /usr/share/ghostscript/10.05.0/lib/printafm.ps /usr/share/ghostscript/10.05.0/lib/stc500ph.upp /usr/share/ghostscript/10.
 05.0/lib/stc_h.upp /usr/share/ghostscript/10.05.0/lib/stc_l.upp /usr/share/ghostscript/10.05.0/lib/bjc610a0.upp /usr/share/ghostscript/10.05.0/lib/bjc610b8.upp /usr/share/ghostscript/10.05.0/lib/bjc610b4.upp /usr/share/ghostscript/10.05.0/lib/gs_lgx_e.ps /usr/share/ghostscript/10.05.0/lib/bjc610b2.upp /usr/share/ghostscript/10.05.0/lib/PM820p.upp /usr/share/ghostscript/10.05.0/lib/st640p.upp /usr/share/ghostscript/10.05.0/lib/PM760p.upp /usr/share/ghostscript/10.05.0/lib/cdj690ec.upp /usr/share/ghostscript/10.05.0/lib/stc200_h.upp /usr/share/ghostscript/10.05.0/lib/bj8.rpd /usr/share/ghostscript/10.05.0/lib/align.ps /usr/share/ghostscript/10.05.0/lib/docie.ps /usr/share/ghostscript/10.05.0/lib/gsnup.ps /usr/share/ghostscript/10.05.0/lib/lines.ps /usr/share/ghostscript/10.05.0/lib/ppath.ps /usr/share/ghostscript/10.05.0/lib/stc1520h.upp /usr/share/ghostscript/10.05.0/lib/bj8oh06n.upp /usr/share/ghostscript/10.05.0/lib/bj8pa06n.upp /usr/share/ghostscript/10.05.0/lib/bj8ts06n.upp /usr/
 share/ghostscript/10.05.0/lib/Stc777pl.upp /usr/share/ghostscript/10.05.0/lib/gslp.ps /usr/share/ghostscript/10.05.0/lib/pphs.ps /usr/share/ghostscript/10.05.0/lib/stc.upp /usr/share/ghostscript/10.05.0/lib/stcolor.ps /usr/share/ghostscript/10.05.0/lib/uninfo.ps /usr/share/ghostscript/10.05.0/lib/bjc610a6.upp /usr/share/ghostscript/10.05.0/lib/bjc610b6.upp /usr/share/ghostscript/10.05.0/lib/cbjc600.ppd /usr/share/ghostscript/10.05.0/lib/cbjc800.ppd /usr/share/ghostscript/10.05.0/lib/rollconv.ps /usr/share/ghostscript/10.05.0/lib/zeroline.ps /usr/share/ghostscript/10.05.0/lib/bjc6000b1.upp /usr/share/ghostscript/10.05.0/lib/stcany_h.upp /usr/share/ghostscript/10.05.0/lib/viewpcx.ps /usr/share/ghostscript/10.05.0/lib/gs_wl1_e.ps /usr/share/ghostscript/10.05.0/lib/bjc610a5.upp /usr/share/ghostscript/10.05.0/lib/cid2code.ps /usr/share/ghostscript/10.05.0/lib/bjc610a4.upp /usr/share/ghostscript/10.05.0/lib/winmaps.ps /usr/share/ghostscript/10.05.0/lib/ghostpdf.ppd /usr/share/ghostscript/
 10.05.0/lib/bjc610a3.upp /usr/share/ghostscript/10.05.0/lib/st640plg.upp /usr/share/ghostscript/10.05.0/lib/bjc610b3.upp /usr/share/ghostscript/10.05.0/lib/caption.ps /usr/share/ghostscript/10.05.0/lib/necp2x6.upp /usr/share/ghostscript/10.05.0/lib/ras1.upp /usr/share/ghostscript/10.05.0/lib/ras3.upp /usr/share/ghostscript/10.05.0/lib/font2pcl.ps /usr/lib/libgs.so.10.05 /usr/share/ghostscript/10.05.0/lib/prfont.ps /usr/share/ghostscript/10.05.0/lib/ras4.upp /usr/share/ghostscript/10.05.0/lib/stc2.upp /usr/share/ghostscript/10.05.0/lib/stocht.ps /usr/share/ghostscript/10.05.0/lib/st640ih.upp /usr/share/ghostscript/10.05.0/lib/pdf_info.ps /usr/share/ghostscript/10.05.0/lib/gs_ksb_e.ps /usr/share/ghostscript/10.05.0/lib/dnj750c.upp /usr/share/ghostscript/10.05.0/lib/viewps2a.ps /usr/share/ghostscript/10.05.0/lib/st640ihg.upp /usr/share/ghostscript/10.05.0/lib/mkcidfm.ps /usr/share/ghostscript/10.05.0/lib/Stp870p.upp /usr/share/ghostscript/10.05.0/lib/necp2x.upp /usr/share/ghostscript/1
 0.05.0/lib/bjc610b1.upp /usr/share/ghostscript/10.05.0/lib/bjc610a2.upp /usr/share/ghostscript/10.05.0/lib/gs_t.xbm /usr/share/ghostscript/10.05.0/lib/dnj750m.upp /usr/share/ghostscript/10.05.0/lib/stcany.upp /usr/share/ghostscript/10.05.0/lib/bjc610a7.upp /usr/share/ghostscript/10.05.0/lib/pfbtopfa.ps /usr/share/ghostscript/10.05.0/lib/bjc610a1.upp /usr/share/ghostscript/10.05.0/lib/st640pg.upp /usr/share/ghostscript/10.05.0/lib/viewgif.ps /usr/share/ghostscript/10.05.0/lib/ps2ai.ps /usr/share/ghostscript/10.05.0/lib/gs_css_e.ps /usr/share/ghostscript/10.05.0/lib/stc600p.upp /usr/share/ghostscript/10.05.0/lib/stc640p.upp /usr/share/ghostscript/10.05.0/lib/stc800p.upp /usr/share/ghostscript/10.05.0/lib/stc500p.upp /usr/share/ghostscript/10.05.0/lib/Stc670p.upp /usr/share/ghostscript/10.05.0/lib/Stc680p.upp /usr/share/ghostscript/10.05.0/lib/Stc740p.upp /usr/share/ghostscript/10.05.0/lib/viewcmyk.ps /usr/share/ghostscript/10.05.0/lib/Stc760p.upp /usr/share/ghostscript/10.05.0/lib/Stp
 720p.upp /usr/share/ghostscript/10.05.0/lib/gs_l.xbm /usr/share/ghostscript/10.05.0/lib/gs_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_s.xbm /usr/share/ghostscript/10.05.0/lib/landscap.ps /usr/share/ghostscript/10.05.0/lib/gs_il2_e.ps /usr/share/ghostscript/10.05.0/lib/cdj550.upp /usr/share/ghostscript/10.05.0/lib/cdj690.upp /usr/share/ghostscript/10.05.0/lib/gs_ce_e.ps /usr/share/ghostscript/10.05.0/lib/bjc610b7.upp /usr/share/ghostscript/10.05.0/lib/gs_wl2_e.ps /usr/share/ghostscript/10.05.0/lib/stc300.upp /usr/share/ghostscript/10.05.0/lib/stcinfo.ps /usr/share/ghostscript/10.05.0/lib/bjc6000a1.upp /usr/share/ghostscript/10.05.0/lib/s400a1.upp /usr/share/ghostscript/10.05.0/lib/s400b1.upp /usr/share/ghostscript/10.05.0/lib/sipixa6.upp /usr/share/ghostscript/10.05.0/lib/gs_wl5_e.ps /usr/share/ghostscript/10.05.0/lib/Stc777p.upp /usr/share/ghostscript/10.05.0/lib/gs_kanji.ps /usr/share/ghostscript/10.05.0/lib/Stc670pl.upp /usr/share/ghostscript/10.05.0/lib/Stc680pl.upp /usr/share/g
 hostscript/10.05.0/lib/Stc740pl.upp /usr/share/ghostscript/10.05.0/lib/Stc760pl.upp /usr/share/ghostscript/10.05.0/lib/Stp720pl.upp /usr/share/ghostscript/10.05.0/lib/Stp870pl.upp /usr/share/ghostscript/10.05.0/lib/stc600pl.upp /usr/share/ghostscript/10.05.0/lib/stc800pl.upp /usr/share/ghostscript/10.05.0/lib/viewjpeg.ps /usr/share/ghostscript/10.05.0/lib/bjc610a8.upp /usr/share/ghostscript/10.05.0/lib/ht_ccsto.ps /usr/share/ghostscript/10.05.0/lib/traceop.ps /usr/share/ghostscript/10.05.0/lib/image-qa.ps /usr/share/ghostscript/10.05.0/lib/pf2afm.ps /usr/share/ghostscript/10.05.0/lib/viewpbm.ps /usr/share/ghostscript/10.05.0/lib/gs_l.xpm /usr/share/ghostscript/10.05.0/lib/gs_m.xpm /usr/share/ghostscript/10.05.0/lib/gs_s.xpm /usr/share/ghostscript/10.05.0/lib/gs_t.xpm /usr/share/ghostscript/10.05.0/lib/viewmiff.ps /usr/share/ghostscript/10.05.0/lib/bj8gc12f.upp /usr/share/ghostscript/10.05.0/lib/bj8hg12f.upp /usr/share/ghostscript/10.05.0/lib/bj8pp12f.upp /usr/share/ghostscript/10.05
 .0/lib/stc300bl.upp /usr/share/ghostscript/10.05.0/lib/PDFA_def.ps /usr/share/ghostscript/10.05.0/lib/PDFX_def.ps /usr/share/ghostscript/10.05.0/lib/gs_l_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_m_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_s_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_t_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_lgo_e.ps /usr/share/ghostscript/10.05.0/lib/acctest.ps /usr/share/ghostscript/10.05.0/lib/stc300bm.upp /usr/share/ghostscript/10.05.0/lib/traceimg.ps /usr/share/ghostscript/10.05.0/lib/stc600ih.upp /usr/share/ghostscript/10.05.0/lib/stc740ih.upp /usr/share/ghostscript/10.05.0/lib/stc800ih.upp /usr/share/ghostscript/10.05.0/lib/stc2s_h.upp /usr/share/ghostscript/10.05.0/lib/zugferd.ps /usr/share/ghostscript/10.05.0/lib/jispaper.ps /usr/share/ghostscript/10.05.0/lib/PM760pl.upp /usr/share/ghostscript/10.05.0/lib/PM820pl.upp /usr/share/ghostscript/10.05.0/lib/st640pl.upp /usr/share/ghostscript/10.05.0/lib/ps2epsi.ps /usr/share/ghostscript/10.05.0/lib/stc2_
 h.upp"
Changes to packages/core2-64-poky-linux/ghostscript (sysroot):
  /usr/lib/libgs.so.10 changed symlink target from libgs.so.10.04 to libgs.so.10.05
  /usr/lib/libgs.so changed symlink target from libgs.so.10.04 to libgs.so.10.05
  /usr/lib/libgs.so.10.04 moved to /usr/lib/libgs.so.10.05
  /usr/share/ghostscript/10.04.0 moved to /usr/share/ghostscript/10.05.0
  /usr/share/ghostscript/10.05.0/lib/zugferd.ps was added
  /usr/share/ghostscript/10.04.0/lib/pdf2dsc.ps was removed

--===============3432451002998524189==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.04.0-10.05.0.patch"

RnJvbSA0NmU5OTYwYzM2NzMyZDkxNjMwOGRlN2IxY2EyNzllNmVlOTY5MzA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTA6MjA6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aG9zdHNjcmlwdDogdXBncmFkZSAxMC4wNC4wIC0+IDEwLjA1LjAKCi0tLQogLi4uL2dob3N0c2Ny
aXB0L2F2b2lkLWhvc3QtY29udGFtaW5hdGlvbi5wYXRjaCAgICAgICAgICAgfCAyICstCiAuLi4v
Z2hvc3RzY3JpcHQtOS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUucGF0Y2ggICAgICAgICAgICB8IDkg
KysrLS0tLS0tCiAuLi4ve2dob3N0c2NyaXB0XzEwLjA0LjAuYmIgPT4gZ2hvc3RzY3JpcHRfMTAu
MDUuMC5iYn0gICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC97Z2hv
c3RzY3JpcHRfMTAuMDQuMC5iYiA9PiBnaG9zdHNjcmlwdF8xMC4wNS4wLmJifSAoOTclKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9h
dm9pZC1ob3N0LWNvbnRhbWluYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hv
c3RzY3JpcHQvZ2hvc3RzY3JpcHQvYXZvaWQtaG9zdC1jb250YW1pbmF0aW9uLnBhdGNoCmluZGV4
IDA1NDZmZGY4ZjAuLmQxOTEyMzFjN2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9hdm9pZC1ob3N0LWNvbnRhbWluYXRpb24ucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L2F2b2lk
LWhvc3QtY29udGFtaW5hdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDk1YmIxZGI4
YjJlNjhjYWM0MGU5ODVmMzQ3YTcwMzk1NzNlMWU4MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gODU5MDVjZTNiMWJjNjNmMGJlOWVkYTk4ODhlNDBkOGU3YTgwM2QyMSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgog
RGF0ZTogVGh1LCAyOSBNYXIgMjAxOCAxNjowMjowNSArMDgwMAogU3ViamVjdDogW1BBVENIXSBh
dm9pZCBob3N0IGNvbnRhbWluYXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC05LjE2LVdlcnJvci1yZXR1cm4t
dHlwZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlw
dC9naG9zdHNjcmlwdC05LjE2LVdlcnJvci1yZXR1cm4tdHlwZS5wYXRjaAppbmRleCA4YzRhNWQ0
NGUzLi4wNTk4YzNkY2QyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3Rz
Y3JpcHQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQtOS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L2do
b3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAot
RnJvbSBjNDgxYjA1NWNkNDY0NzM0YTNjMmQ4MDcxOWVhZDRjMWM5MmE0MGM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBjMjNiNzg3ZjlhMzhiZTJjZGM1NzEzMzkxNWM0MDJiNjlhY2Vk
ZDFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55
YW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDQgTWF5IDIwMTUgMjI6MzE6NDggLTA3MDAK
LVN1YmplY3Q6IFtQQVRDSCAwMi8xMF0gYmFzZS9nZW5kZXYuYzogZml4IGZvciAtV2Vycm9yPXJl
dHVybi10eXBlCitTdWJqZWN0OiBbUEFUQ0hdIGJhc2UvZ2VuZGV2LmM6IGZpeCBmb3IgLVdlcnJv
cj1yZXR1cm4tdHlwZQogCiBGaXhlZDoKIGJhc2UvZ2VuZGV2LmM6ODA6MTogZXJyb3I6IHJldHVy
biB0eXBlIGRlZmF1bHRzIHRvICdpbnQnIFstV2Vycm9yPXJldHVybi10eXBlXQpAQCAtMTQsNyAr
MTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVy
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL2Jh
c2UvZ2VuZGV2LmMgYi9iYXNlL2dlbmRldi5jCi1pbmRleCA1OWQ1OTk5Li43NzY2YjA4IDEwMDY0
NAoraW5kZXggZjM2Y2ZlMi4uMDMxZjMwYiAxMDA2NDQKIC0tLSBhL2Jhc2UvZ2VuZGV2LmMKICsr
KyBiL2Jhc2UvZ2VuZGV2LmMKIEBAIC03Nyw2ICs3Nyw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpp
bmRlbnRfaXRlbSA9ICIiOwpAQCAtMjUsNiArMjUsMyBAQCBpbmRleCA1OWQ1OTk5Li43NzY2YjA4
IDEwMDY0NAogIG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICB7CiAgICAgIGNvbmZpZyBj
b25mOwotLS0gCi0xLjguMy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9n
aG9zdHNjcmlwdC9naG9zdHNjcmlwdF8xMC4wNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjA1LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0
XzEwLjA0LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9n
aG9zdHNjcmlwdF8xMC4wNS4wLmJiCmluZGV4IDU0NmQ3MzQzMzMuLjFkMDU5NDVjMzAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdF8xMC4w
NC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlw
dF8xMC4wNS4wLmJiCkBAIC0yNyw3ICsyNyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRodWIu
Y29tL0FydGlmZXhTb2Z0d2FyZS9naG9zdHBkbC1kb3dubG9hZHMvcmVsZWFzZXMvZG93bmxvCiAg
ICAgICAgICAgIGZpbGU6Ly9hdm9pZC1ob3N0LWNvbnRhbWluYXRpb24ucGF0Y2ggXAogICAgICAg
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNzY0ZGZiYjdiMTNmYzcxYTdhMDVjNjM0
ZTAxNGY5YmIxZmI4M2I4OTlmZTM5ZWZjMGI2YzM1MjJhOTk5OGIxIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjU2ZTc3ODMzZGU2ODM4MjVjNDIwZDBhZjhjYjkwYWE4YmE3ZGE3MWVhNmZiNTYyNDI5
MGNiYzFiNTNmZTc5NDIiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHW2d0
a10gPSAiLS1lbmFibGUtZ3RrLC0tZGlzYWJsZS1ndGssZ3RrKzMiCi0tIAoyLjQ0LjEKCg==

--===============3432451002998524189==--

