Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09443C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:30:15 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web09.8201.1647945013282682220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sLIRf5X3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945011; i=@fujitsu.com;
	bh=yDXVqkSveyjrHTcHZ0mJFgIFMric0WPEVBUjS3ETJ1c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sLIRf5X3+yxtvj8nHt2VWdws0u3oqJAnBD31jsh/EUkn5X2FqD+T9E+W3UDlA0GzV
	 j3/OO53DVS9iY3jHPwJyXEcUcgYtRArjimAvOgu+watgacSpHjW81TeJf8G20K3xyh
	 heNOPjKRdYZJXoHPH/ogSo9FUZhr6oVOGvSSFkVo5OfyAZjbkO2Oa4zaIDbwtPiowk
	 7iRGQQ9FguHxEmMY08u+x221QQZGwJZDpabciPT4H51R08ZcDz9MPCJffMR5qIn9/o
	 B5HE4yUzMi5pL1EuHEWpRTJCpVQHoDsaBzf2xqXIKdsqRDueP6eIb1BOG8lz/QiQsh
	 Mco6VKQJPlxpQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqGu01DL
  J4PYCa4s7P9+xW9ybv4DNgcnj3MYVjB4dv68zBjBFsWbmJeVXJLBm/N27gangoGXF84V3WRsY
  Fxt3MXJxCAlsYZTYeGY2I4SzgEmi9+p+JghnD6PEzb1vgDKcHGwCahLTb91g7WLk4BAR0JO4+
  k8UJMwsIC+xfNMfNhBbWMBFYv+rXnaQEhYBVYmeq5UgYV4BR4l1jRuYQGwJAQWJKQ/fM0PEBS
  VOznzCAjFGQuLgixfMEDWKErMvN7NA2BUSs2a1QfWqSVw9t4l5AiP/LCTts5C0L2BkWsVolVS
  UmZ5RkpuYmaNraGCga2hoqmuqa2RkrpdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeX
  WrKJERimKcWsj3cwrun7qXeIUZKDSUmU902rZZIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6ji
  4FygkWp6akVaZk5wJiBSUtw8CiJ8GZ0A6V5iwsSc4sz0yFSpxgtOXZuubyXmePqlStA8gaIFG
  LJy89LlRLnfQkyTwCkIaM0D24cLK4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm3QYyhSc
  zrwRu6yugg5iADtJnNQM5qCQRISXVwBQw7WG4xcaY290bJDc53dtbJWp2oTZtxsZJEyqeLbxp
  ZNDxeaOdGX/nBu1iO+b0neYni6fW2ops2xdatO931H4/XbsPSR9+nMh8se1MeLH2rKo3rA/lI
  qPyZpoUK6/Lv6XEkqzv7ftwywa5JzqvbyRMvfAyXuhB8L5rKeKuv9hc2uafMjA77HpunYXFod
  qAt71vJYSEtj58eG/JscKuHIZlhTfsN2yzfRuz/YixAJ/adJ0XkycvPBj903qTgWP63Gy9fEU
  FpntHp3d7RLFnvzw3ncF+q5N/vM/b1OJa3t7Ur3+jdI56/N/3cXrAvIQ9ycclONy3Pn0vmGvE
  mJ9U9Kr76G/HsztD22SnGEXNVVdiKc5INNRiLipOBAB8qukIZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1647945010!28877!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24983 invoked from network); 22 Mar 2022 10:30:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:30:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 460BF100197;
	Tue, 22 Mar 2022 10:30:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2D8C5100185;
	Tue, 22 Mar 2022 10:30:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:29:54 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>
Subject: [OE-core] [PATCH ] adwaita-icon-theme: upgrade 41.0 -> 42.0
Date: Tue, 22 Mar 2022 18:29:41 +0800
Message-ID: <1647944984-5058-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163533

From: Upgrade Helper <uh@not.set>

0001-Don-t-use-AC_CANONICAL_HOST.patch
refreshed for version 42.0

0001-Run-installation-commands-as-shell-jobs.patch
removed since it's included in 42.o

---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch    |  6 +-
 ...-installation-commands-as-shell-jobs.patch | 84 -------------------
 ...eme_41.0.bb => adwaita-icon-theme_42.0.bb} |  7 +-
 3 files changed, 5 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_41.0.bb => adwaita-icon-theme_42.0.bb} (87%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 5afba3c644..32f98e049b 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 63d97fefdbc90f5c68f67bdc30844776d9a1b720 Mon Sep 17 00:00:00 2001
+From 15ffd817b3e334dc7c0508761c7ef417d76379c5 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f2659a5..1e8b016 100644
+index 040975e..5f7b53a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [41.0],
+ AC_INIT([adwaita-icon-theme], [42.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
deleted file mode 100644
index a1d39cf558..0000000000
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 79da031e9811f3eef34b14cce419be93fea34319 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 13 Jun 2017 18:10:06 +0300
-Subject: [PATCH] Run installation commands as shell jobs
-
-This greatly speeds up installation time on multi-core systems.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/merge_requests/39]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- src/fullcolor/Makefile.am |  5 +++--
- src/spinner/Makefile.am   |  7 ++++---
- src/symbolic/Makefile.am  | 11 ++++++-----
- 3 files changed, 13 insertions(+), 10 deletions(-)
-
-diff --git a/src/fullcolor/Makefile.am b/src/fullcolor/Makefile.am
-index d73529b..b7d0808 100644
---- a/src/fullcolor/Makefile.am
-+++ b/src/fullcolor/Makefile.am
-@@ -9,9 +9,10 @@ install-data-local:
- 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size && find . -name "*.png"`; do \
- 			context="`dirname $$file`"; \
- 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
-+			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
- 		done; \
--	done;
-+	done; \
-+	wait
- 
- ## FIXME we should add a way to remove links generated by icon mapping
- uninstall-local:
-diff --git a/src/spinner/Makefile.am b/src/spinner/Makefile.am
-index c14caf6..322dc0d 100644
---- a/src/spinner/Makefile.am
-+++ b/src/spinner/Makefile.am
-@@ -24,13 +24,14 @@ install-data-local:
- 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
- 		      context="`dirname $$file`"; \
- 		      $(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
-+		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
- 	      done; \
- 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
- 		context="`dirname $$file`"; \
- 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable-up-to-32/$$context; \
--		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file; \
--	done
-+		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file & \
-+	done; \
-+	wait
- 
- uninstall-local:
- 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
-diff --git a/src/symbolic/Makefile.am b/src/symbolic/Makefile.am
-index 957c0ee..e1f8818 100644
---- a/src/symbolic/Makefile.am
-+++ b/src/symbolic/Makefile.am
-@@ -34,18 +34,19 @@ install-data-local:
- 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
- 			context="`dirname $$file`"; \
- 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
-+			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
- 		done; \
--	done
-+	done; \
- 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
- 		context="`dirname $$file`"; \
- 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable/$$context; \
--		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file; \
-+		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file & \
- 		for size in $(symbolic_encode_sizes); do \
- 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context; \
-+			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context & \
- 		done \
--	done
-+	done; \
-+	wait
- 
- uninstall-local:
- 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
similarity index 87%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
index 46f9f4772c..c4f3b1c999 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
@@ -12,12 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
 
-SRC_URI += " \
-           file://0001-Don-t-use-AC_CANONICAL_HOST.patch \
-           file://0001-Run-installation-commands-as-shell-jobs.patch \
-           "
+SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
 
-SRC_URI[archive.sha256sum] = "ef5339d8c35fcad5d10481b70480803f0fa20b3d3cbc339238fcaceeaee01eba"
+SRC_URI[archive.sha256sum] = "5e85b5adc8dee666900fcaf271ba717f7dcb9d0a03d96dae08f9cbd27e18b1e0"
 
 DEPENDS += "librsvg-native"
 
-- 
2.25.1


