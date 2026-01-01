Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B17EEE26C
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 20:56:57 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6486.1767301005746965650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 12:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KT53QeLG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260101205643931e4c4c3700020705-2d3_tb@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260101205643931e4c4c3700020705
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 21:56:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OtNy8xI++wNmicgC19QXoznAIS2Y1kQ5mypcUBUaO0s=;
 b=KT53QeLGmfiLU3Nw5Uez2GBCpSeBLh98REY/P9seiDojaEvTkP7IKPRjrWhvHbdy++kliq
 +rdYOzPWJ2XfR7WR75+LPt7QzKAeJa9EU3C9JPS/QJ1011WVwetc3nSIZ1o9BzrdJHfl7MQE
 DdemnUUcFFS0wq0w66Yyf4uRJCJEUpFg4PYNVhss18bnIVrUaPUd9TjFLc/IfDITWofhwx0L
 hpQD4Ntla0g83QLRpIlcdHIBGLF/C6jQi6WHW1EVrcYZETgugCxCoUIgPnsrHZYRdpmRz4uW
 xjXOA+XxUatYLIdFjmG4Xi15Ta4xycuc4u320gK5hY/oeHlgojWGuKKQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 1/2] glib-2.0: Upgrade 2.86.0 -> 2.86.1
Date: Thu,  1 Jan 2026 21:56:41 +0100
Message-Id: <20260101205642.98344-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 20:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228833

From: Jörg Sommer <joerg.sommer@navimatix.de>

Overview of changes in GLib 2.86.1, 2025-10-21
==============================================

* Bugs fixed:
  - #3745 GIRepository: union fields offsets for compiled typelibs all have
    offset 0xffff (unknown) (Philip Chimento)
  - #3780 `gio/tests/socket-listener` requires dlsym
  - #3781 GLib.OptionContext's get_help() includes width of invisible options
    (FeRD (Frank Dana))
  - #3783 [CI] Pipeline on 'main' failed for commit c31c4a52 (Tobias Stoeckmann)
  - #3784 Memory leak related to g_get_home_dir (Michael Catanzaro)
  - #3798 Gio.AppInfo.launch_default_for_uri_async crashes with non-existent
    paths (Philip Withnall)
  - #3803 GNetworkMonitor's netlink backend doesn't notify connectivity change
    (Philip Withnall)
  - https://gitlab.gnome.org/Infrastructure/Infrastructure/-/issues/
  - !4755 ghash: Fix entry_is_big for CHERI architecture
  - !4756 ghash: Handle all table sizes in iterator
  - !4760 gbookmarkfile: Escape icon href and mime-type
  - !4773 docs: Add Luca Bacci as a co-maintainer of the Windows code
  - !4775 Update Ukrainian translation
  - !4776 Update Catalan translation
  - !4777 Update Lithuanian translation
  - !4778 tests: Fix clang compilation warnings
  - !4779 gmem: Replace SIZE_OVERFLOWS with g_size_checked_mul
  - !4780 Update Brazilian Portuguese translation
  - !4781 Update eu translation
  - !4782 Update Korean translation
  - !4785 Update Japanese translation
  - !4786 Update Galician translations
  - !4787 Update Hungarian translation
  - !4791 gstrfuncs: Check string length in g_strescape
  - !4800 gutils: Improve load_user_special_dirs' user-dirs.dirs parser
  - !4802 Update Turkish translation
  - !4809 Trivial backport of "gutils: Handle singletons in unlocked functions"
    to glib-2-86 branch
  - !4814 Backport translation updates to glib-2-86
  - !4821 Backport !4820 “gio/tests: Fix a race condition in
    /gdbus/connection/flush” to glib-2-86
  - !4828 Backport !4827 “ghostutils: Treat 0x80 (and above) as non-ASCII” to
    glib-2-86
  - !4834 Backport !4810 and !4819, various fixes to user-dirs.dirs handling in
    gutils
  - !4836 Backport !4835 “Update Portuguese translation” to glib-2-86
  - !4839 Update Romanian translation
  - !4842 Backport "girnode: Fix computation of union member offsets" to
    glib-2-86
  - !4848 Update British English translation (2.86)
  - !4865 Backport !4859 “gopenuriportal: Fix a crash when the file can’t be
    opened” to glib-2-86
  - !4867 Backport !4792 “gtype: Use transfer none for types (un)ref functions”
    to glib-2-86
  - !4872 Fix macOS and msys2 CI builds on glib-2-86 branch
  - !4873 Backport !4871 “gnetworkmonitorbase: Add missing notify::connectivity
    signal” to glib-2-86

* Translation updates:
  - Basque (Asier Saratsua Garmendia)
  - Catalan (Jordi Mas)
  - English (United Kingdom) (Bruce Cowan)
  - Esperanto (Kristjan ESPERANTO)
  - Galician (Fran Dieguez)
  - Hungarian (Balázs Úr)
  - Japanese (Makoto Sakaguchi)
  - Korean (Changwoo Ryu)
  - Lithuanian (Aurimas Černius)
  - Portuguese (Hugo Carvalho)
  - Portuguese (Brazil) (Rafael Fontenelle)
  - Romanian (Antonio Marin)
  - Serbian (Милош Поповић)
  - Turkish (Sabri Ünal)
  - Ukrainian (Yuri Chornoivan)

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

(From OE-Core rev: 9538bb86a050901e0cc0e6b696517f40e7b5f436)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{glib-2.0-initial_2.86.0.bb => glib-2.0-initial_2.86.1.bb}  | 0
 .../glib-2.0/{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.0.bb => glib-2.0-initial_2.86.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2e8dde2820..5909851896 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,7 +236,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "b5739972d737cfb0d6fd1e7f163dfe650e2e03740bb3b8d408e4d1faea580d6d"
+SRC_URI[archive.sha256sum] = "119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

