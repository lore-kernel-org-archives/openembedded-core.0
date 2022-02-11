Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED4AC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 01:12:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.1532.1644541932459218561
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 17:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mF5+g7JR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644541930; i=@fujitsu.com;
	bh=IVraIppuk2xKZluwGoc+N24PZMBWlFm00UT5L40qNPs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mF5+g7JRGNK97fvkurZv5ALjEkyPCWQSJu3t+gjGdO2KoLW9kHhKJtt7yPGj4mxIx
	 1Lkr2gtxIH8Zhb+xv4tZ8dvyWqJFZcDc6bOogMKJZjvKxscdIpCS6Z4jApvcP29KJN
	 cufSmZRmBF5KKxo8QPqJHdN4cmYiB/1MAXlJelx/7gihfoChQocgekCQph9I9IPXIf
	 nRIZUAR4XZXs6xobKP3Zroxq1gx160rGg414xzssMPO9COixbsVLRzJdv7HQOBu3Uj
	 OYYRT15ydoynOtyaPWWiYykd7NPgRwvRfKeyzW2webWucLw4zpD+MVUR9++ELTRlgt
	 S95vlk2xONOzw==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 7F/6B-00700-AE7B5026;
 Fri, 11 Feb 2022 01:12:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqPtqO2u
  SwcejTBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aFv3uYC75LVGw72sDSwLhOtIuRi0NI4DGj
  xLRpp9kgnPNMEreermOBcE4wSkxevQPI4eRgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBY4nT346A2SwCqhInrh8Ca+UVcJJomn+RDcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo1VSUWZ6RkluYmaOrqG
  Bga6hoamuia6RsaVeYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgUKYUs7zf
  wdjU91PvEKMkB5OSKG+1M2uSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQleqS1AOcGi1PTUirTMH
  GCEwKQlOHiURHizlgCleYsLEnOLM9MhUqcYFaXEeeO3ASUEQBIZpXlwbbCovMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmDcdZDtPZl4J3PRXQIuZgBZvm84EsrgkESEl1cBkcf7NXN6lERy
  eN/7df3sg05FxcYexxfuOsrRb59cvydBNuqbUsvJLXL7AHvG8s6tlHq/pa8jyfHWQ+cx+4Xym
  Fwvi3BsK3D6Ux968+OmYQ2WZze/JUW800rTETcVeXPey8V/w/06mdLSo/bXl077ss7H9tuuyx
  bbYk07zpgiEeGanP789vejlxc+qfG8vvM3UvHu6LMqF+aDXxU7lIJvD68KTdr2ps2E34NvZrH
  np+8N/VbI2AdLKAr3uS/oUm94d+r1wSejL/s8r+asZjunyWiXzTf6RGut7t+vhUlk2tdOX/rm
  +fWK2775Uyv8Vet8nd76x99vnW3w6RuLUwoxvB6c0pS1m3z9RSOf5yv92SizFGYmGWsxFxYkA
  CVB7u0UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1644541929!52579!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1241 invoked from network); 11 Feb 2022 01:12:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Feb 2022 01:12:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 90DA710018A
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 01:12:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 84B77100186
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 01:12:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Fri, 11 Feb 2022 01:11:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ed: upgrade 1.17 -> 1.18
Date: Fri, 11 Feb 2022 09:11:39 +0800
Message-ID: <1644541899-13114-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 01:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161631

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


