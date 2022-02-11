Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEE4C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 02:17:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.2294.1644545859170589306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 18:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SR9B1157;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644545856; i=@fujitsu.com;
	bh=IVraIppuk2xKZluwGoc+N24PZMBWlFm00UT5L40qNPs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SR9B1157eB7cU8gaKs6c/Gpntj+ApSQ/AliM4K+9xMuQtlFYIfp5HJIwQiMipP2vn
	 7nfB6ck+LRSclIQjgE9QkyTbD4AIcxVdYWiaHzdtIP3YdFjO1y00FuQp5EkmCVh9BC
	 HErG4ajS9GEMLFWHKKox+g8XcjjTZmshU74iP9ewKRXWONq25baQMgmqw2lKIDOb8H
	 ORtSU7Cs3//1yK7UQjWsCSjeEgsPEM499cT1juQtGwXkJd8MGa5LXhs9CfTA171uhg
	 /3+a2qzBXocva+5PCDiceioRhVNIiDOg64IdkXhxxUtOuho4z+18/hnlomOFtGVZ84
	 inwZYHEboxbzQ==
Received: from [100.115.37.16] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id B6/39-14616-047C5026;
 Fri, 11 Feb 2022 02:17:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqOtwnDX
  JYFIjh8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHh7x7mgu8SFduONrA0MK4T7WLk4hASeMwo
  8XHuUVYI5zyTxKKz8xkhnBOMEuv+zQJyODnYBNQkpt+6AVTFwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBMYt/P60wgNouAqsT5w1tYQWxeASeJM/PXs4HYEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrROKspMzyjJTczM0TU
  0MNA1NDTVNTbWNTS31Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzLlGLF
  zTsYJ678qXeIUZKDSUmUt9qZNUmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG/OMaCcYFFqempFW
  mYOMEZg0hIcPEoivHVHgdK8xQWJucWZ6RCpU4yKUuK8e0D6BEASGaV5cG2wuLzEKCslzMvIwM
  AgxFOQWpSbWYIq/4pRnINRSZjXAWQKT2ZeCdz0V0CLmYAWb5vOBLK4JBEhJdXAVO61OXs7Q/e
  WPRYHrx5j8zZjDv2weqH0Np+G3R5v1obOep88WV/+49aHb7NDbq//+fbJyyUWYS5scc5/mg6L
  /HjQaq1pPsd4acgNjUmTj7CvcN7rylJ/4dIRp+e7vr4VqNi7V+7/x5k7Vmsw3v6eOmXSn3ZGH
  0lnhQLzG8bhQiJLBCslLzi3fVRsT/LU2v9shV9GjuZ7twj5GIsCuf2OgmaMl7ds/fDoUcSz39
  +yTVMzrKP2sBw78sNF0s/ht0DJ01MOAvfeWbP5iBxzv+PyzWC6j+c7N7ajy9jmdZQcPasYvzH
  rmHHOX9ZrC29x1BZMcvwWmD9N5qDo+Q12/DNUmUwertT8ZrxqzePfC0utBZRYijMSDbWYi4oT
  ASFhYuBGAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1644545855!56934!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21356 invoked from network); 11 Feb 2022 02:17:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Feb 2022 02:17:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BCE6A1001A3
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 02:17:35 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B0147100198
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 02:17:35 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Fri, 11 Feb 2022 02:17:16 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] ed: upgrade 1.17 -> 1.18
Date: Fri, 11 Feb 2022 10:17:08 +0800
Message-ID: <1644545828-13298-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 02:17:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161632

License-Update:
year updated to 2022.
license changed from GPLv3+ to GPLv2.
(In version 1.5 the maintainer mistakenly changed the copyright holder from
Andrew Moore to the FSF. In versions 1.18 he restored the original COPYING.)

Changelog:
=========
* main_loop.c (get_shell_command): Flush stdout after printing cmd.
* signal.c (sighup_handler): Fix a memory leak just before exiting.
* carg_parser.c (ap_init): Likewise.
* io.c (read_file, write_file): Check ptr returned by strip_escapes.
* main_loop.c (get_shell_command, exec_command): Likewise.
* main_loop.c (get_shell_command): Remove backslash from escaped '%'.
* main_loop.c, regex.c: Implement case-insensitive REs.
* regex.c (compile_regex): Don't overwrite previous regex if error.
* main.c: New option '--strip-trailing-cr'.
* buffer.c (push_undo_atom): Fail if stack grows larger than INT_MAX.
  (too_many_lines): Fail if buffer grows larger than INT_MAX lines.
* global.c (set_active_node): Fail if list grows larger than INT_MAX.
* signal.c (resize_buffer): Fail if a line grows longer than INT_MAX.
* io.c (read_file): Return -2 for fatal errors.
* main_loop.c (main_loop): Set error status if fatal error from main.
* main.c [restricted_]: New message "Directory access restricted".
* ed.texi: New chapter "The 's' Command".
* COPYING: Restored.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.17.bb => ed_1.18.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.17.bb => ed_1.18.bb} (73%)

diff --git a/meta/recipes-extended/ed/ed_1.17.bb b/meta/recipes-extended/ed/ed_1.18.bb
similarity index 73%
rename from meta/recipes-extended/ed/ed_1.17.bb
rename to meta/recipes-extended/ed/ed_1.18.bb
index addf652d52..c1ab1f5ecb 100644
--- a/meta/recipes-extended/ed/ed_1.17.bb
+++ b/meta/recipes-extended/ed/ed_1.18.bb
@@ -2,10 +2,10 @@ SUMMARY = "Line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
 
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
-                    file://ed.h;endline=20;md5=b72aa5eaafef318c6bfc37f858469113 \
-                    file://main.c;endline=17;md5=2c93e24f4db3528a00a24c7df5618e41 \
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+                    file://ed.h;endline=20;md5=6e6a818b0593f937fc63ba08d5e314bf \
+                    file://main.c;endline=17;md5=8419a08bb12936f32384a0d1c0f9e74c \
                     "
 
 SECTION = "base"
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54"
+SRC_URI[sha256sum] = "aca8efad9800c587724a20b97aa8fc47e6b5a47df81606feaba831b074462b4f"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.25.1


