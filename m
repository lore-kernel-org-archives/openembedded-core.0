Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14021C63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:26:27 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.134830.1673760380037412640
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qoEkm/AM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760378; i=@fujitsu.com;
	bh=Xf9NIkHIcY3iNxrs8E1WuFaIFr40sJpcvYN7RTNmvDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qoEkm/AMgeGA3Ze7vM0oRQkLofAnVIUw+vkypp3OYoTDB8NoNBUXYPsOUY3Ot2jCW
	 FK1vt+AX5+mrc+ndFFw+7hODIxMHGcEArlnOw7+/3s2AN936X+2zE3GlHb/vAPeqpx
	 RdglPxdQbtqWRJr8xRkUfta0UIT9s69AzX9Pgg9mUmrZXtts6dBOuZ2kjzpXzlbb8c
	 0Urarbt5oclnksubm7rGB6ImAcuA9HFcMYWUzb77adWvpIftnZ+3j1DYebI9cQwXhy
	 m80DFU7bOGzke2fsta0gLUQSWsBvEQpD8ejgbhWEXRSXwgRxoICSaGUrS0vqpv937/
	 c5wg7JGQJoc9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWbey73C
  ywa4WPos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePn+gvsBZ9kKrZdm8rYwPhGrIuRi0NI4AGj
  xPJXm1ghnCtMEqsW3WOCcPYySmy+e4yti5GTg01ASuLG/f9ANgeHiICexNV/oiBhZgEViRe/e
  9hBbGEBU4lrb2cwg9gsAqoSM36tA7N5BRwl5l/sB6uREFCQmPLwPVicU8BJ4vD2T6wgthBQza
  yp69gh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhanFpWlFuka6yUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To
  5aWWbGIEhm5KMVv1Dsa3S//oHWKU5GBSEuWN/HYoWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  4bGw8lCgkWp6akVaZk5wDiCSUtw8CiJ8Gp3AKV5iwsSc4sz0yFSpxgVpcR5X/QAJQRAEhmleX
  BtsNi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9ynIFJ7MvBK46a+AFjMBLQ6pPwiyuCQ
  RISXVwHTcjV/M1vdWj76m5Er+V+yK0lqzz9yWjRGfmewtEv1pubd283qD/cYbG6WLFZeFnP25
  +MTNnaa7Re89snnY7XE183fi7fVX0kJK7fS/WgYfKff1vvDfoeSkapmw38WwCP9pMTldNXejz
  R6zFof4rxX+UlBw65vfS7sZ1ncnud9W9z18PMl+pWd1s3FNuPWXokeKIdlTks3fmwdbZjt9Tj
  RxrDWO/3VeZ8/2k1emntRsqJdJ/ZB9VP17R8TCKew+C6TFprO8+cSiwzWdv2zK3bI62zsvr76
  qDP+yeNLPdp7/X9dc+PFI8eCpFuefH4PzI/5sm/uAsdFoz4qEfoOLwW/1uIvu7NdWP/jsmrNz
  tBJLcUaioRZzUXEiAHugxRFYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1673760377!233074!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4834 invoked from network); 15 Jan 2023 05:26:17 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:26:17 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D02EA153
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:16 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C2008152
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:26:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xz: upgrade 5.4.0 -> 5.4.1
Date: Sun, 15 Jan 2023 13:25:41 +0800
Message-ID: <1673760341-2623-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760341-2623-1-git-send-email-wangmy@fujitsu.com>
References: <1673760341-2623-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175880

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* liblzma:
    - Fixed the return value of lzma_microlzma_encoder() if the
      LZMA options lc/lp/pb are invalid. Invalid lc/lp/pb options
      made the function return LZMA_STREAM_END without encoding
      anything instead of returning LZMA_OPTIONS_ERROR.
    - Windows / Visual Studio: Workaround a possible compiler bug
      when targeting 32-bit x86 and compiling the CLMUL version of
      the CRC64 code. The CLMUL code isn't enabled by the Windows
      project files but it is in the CMake-based builds.

* Build systems:
    - Windows-specific CMake changes:
        * Don't try to enable CLMUL CRC64 code if _mm_set_epi64x()
          isn't available. This fixes CMake-based build with Visual
          Studio 2013.
        * Created a workaround for a build failure with windres
          from GNU binutils. It is used only when the C compiler
          is GCC (not Clang). The workaround is incompatible
          with llvm-windres, resulting in "XZx20Utils" instead
          of "XZ Utils" in the resource file, but without the
          workaround llvm-windres works correctly. See the
          comment in CMakeLists.txt for details.
        * Included the resource files in the xz and xzdec build
          rules. Building the command line tools is still
          experimental but possible with MinGW-w64.
    - Visual Studio: Added stream_decoder_mt.c to the project
      files. Now the threaded decompressor lzma_stream_decoder_mt()
      gets built. CMake-based build wasn't affected.
    - Updated windows/INSTALL-MSVC.txt to mention that CMake-based
      build is now the preferred method with Visual Studio. The
      project files will probably be removed after 5.4.x releases.
    - Changes to #defines in config.h:
        * HAVE_DECL_CLOCK_MONOTONIC was replaced by
          HAVE_CLOCK_MONOTONIC. The old macro was always defined
          in configure-generated config.h to either 0 or 1. The
          new macro is defined (to 1) only if the declaration of
          CLOCK_MONOTONIC is available. This matches the way most
          other config.h macros work and makes things simpler with
          other build systems.
        * HAVE_DECL_PROGRAM_INVOCATION_NAME was replaced by
          HAVE_PROGRAM_INVOCATION_NAME for the same reason.
* Tests:
    - Fixed test script compatibility with ancient /bin/sh
      versions. Now the five test_compress_* tests should
      no longer fail on Solaris 10.
    - Added and refactored a few tests.

* Translations:
    - Updated the Catalan and Esperanto translations.
    - Added Korean and Ukrainian man page translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/xz/{xz_5.4.0.bb => xz_5.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.4.0.bb => xz_5.4.1.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.4.0.bb b/meta/recipes-extended/xz/xz_5.4.1.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.4.0.bb
rename to meta/recipes-extended/xz/xz_5.4.1.bb
index 75b763533f..71bf4b540a 100644
--- a/meta/recipes-extended/xz/xz_5.4.0.bb
+++ b/meta/recipes-extended/xz/xz_5.4.1.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "7471ef5991f690268a8f2be019acec2e0564b7b233ca40035f339fe9a07f830b"
+SRC_URI[sha256sum] = "e4b0f81582efa155ccf27bb88275254a429d44968e488fc94b806f2a61cd3e22"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.25.1


