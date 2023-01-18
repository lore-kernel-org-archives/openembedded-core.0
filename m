Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED69C38159
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 10:28:03 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.12173.1674037672642865913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 02:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=hmlTR37T;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674037672; x=1705573672;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SGuG6NlVBM5RBN05VuNVCzScSgO6TX3rCVIhfcf549s=;
  b=hmlTR37TbjgSMWxByFU2sc5QmFIx/p0Ftxz/7M227rPCz5hQNLq6pDdZ
   PLnTwKYvgm8jTUO9FJ57hhxhiirU5f3Mpr15ipySSUISZeLjWOzpuk8qD
   3gyw7Sfl+vHM23H78ZEtduVqii5bFaR+FAgquYoEjQFaKZx9G6CIrQdaW
   mpIAK/3PrsAclN096hG4LSJkhgiY4MIB6VwLHhecRv3kAsKMZRSRdPvuk
   oeNWNJf1S6aXA0FGk9GoPv2kCFYGS+IJ2dybJhD+I+48pyxaGksQPQ8mF
   OobW/stUNRKqWUmoeAE7Be6SE5m9SJ3aWJL9fPl775u4s+wwsqjIom0B4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="389452034"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="389452034"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 02:27:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="609598508"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609598508"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 02:27:51 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [langdale][PATCH] libksba: update 1.6.2 -> 1.6.3
Date: Wed, 18 Jan 2023 18:27:44 +0800
Message-Id: <20230118102744.1724083-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 10:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176085

From: Alexander Kanavin <alex.kanavin@gmail.com>

ChangeLog  (libksba-1.6.3)

2022-12-06  Werner Koch  <wk@gnupg.org>

	   Release 1.6.3.
	   + commit bffa9b346071725363a483db547e7dced9721cb5

2022-11-23  Werner Koch  <wk@gnupg.org>

	   Fix an integer overflow in the CRL signature parser.
	   + commit f61a5ea4e0f6a80fd4b28ef0174bee77793cf070
	   * src/crl.c (parse_signature): N+N2 now checked for overflow.

	   * src/ocsp.c (parse_response_extensions): Do not accept too
large
	   values.
	   (parse_single_extensions): Ditto.

2022-11-02  NIIBE Yutaka  <gniibe@fsij.org>

	   build: Update m4/libgcrypt.m4.
	   + commit 4076b60f7cef4fddc3d30f6e6d4078081dbc7167
	   * m4/libgcrypt.m4: Update from libgcrypt master.

2022-11-01  NIIBE Yutaka  <gniibe@fsij.org>

	   build: Prefer gpgrt-config when available.
	   + commit 13307b22882a220d206341e1196e74fd37418c2f
	   * src/ksba.m4: Overriding the decision by
--with-libksba-prefix, use
	   gpgrt-config ksba when gpgrt-config is available.

2022-10-24  NIIBE Yutaka  <gniibe@fsij.org>

	   build: Update gpg-error.m4.
	   + commit c3c1627f34234e3d54fe1f3411ac499dd7e3b3b0
	   * m4/gpg-error.m4: Update from libgpg-error 1.46.

(From OE-Core rev: 83f3f21b1b84ab9e7b461ac966691c80f4ed4e97)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---

add changelog to commit message

 .../libksba/libksba/ksba-add-pkgconfig-support.patch        | 6 +++---
 .../libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index af96bd57cd..bdb80ff34d 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 6081640895b6d566fa21123e2de7d111eeab5c4c Mon Sep 17 00:00:00 2001
+From ca8174aa81d7bf364b33f7254a9e887735c4996d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/ksba.m4 b/src/ksba.m4
-index 6b55bb8..6e7336f 100644
+index 452c245..aa96255 100644
 --- a/src/ksba.m4
 +++ b/src/ksba.m4
 @@ -23,37 +23,6 @@ dnl with a changed API.
@@ -44,7 +44,7 @@ index 6b55bb8..6e7336f 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"$KSBA_CONFIG" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG ksba --exists; then
 -      KSBA_CONFIG="$GPGRT_CONFIG ksba"
 -      AC_MSG_NOTICE([Use gpgrt-config as ksba-config])
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-support/libksba/libksba_1.6.3.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.2.bb
rename to meta/recipes-support/libksba/libksba_1.6.3.bb
index f6ecb9aec4..dc39693be4 100644
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.3.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
+SRC_URI[sha256sum] = "3f72c68db30971ebbf14367527719423f0a4d5f8103fc9f4a1c01a9fa440de5c"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.37.3


