Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93A8C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:07:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.3855.1753232819509736784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gK5GxIB6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232819; x=1784768819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6TUEmL8kPQfuDTqVYO8T98eiDGEtIBds63eNhwif0Yk=;
  b=gK5GxIB6lSiGQegQquDXbJXH9tHaioaVvH7DYuA1wGf+YDieF87eS8z4
   9K6tqT2bd+RI/FbUcg4lp85xIYFmKOn/fsf7Hsk88GVWbzYkLXjZh2HrW
   a5iQwfTsLlYukic6i0nzXhqOF3TYv82bAKY36s553OIdfadLLqgEW/Hp1
   Mx8El3JODwvMwy3hDQan3WosIVNPa6pc6thVnn51aKwmPuiuxuXOcgXCo
   BQ71kEzuONVCtwb2La6WRsfTDfaLLiBIbhmhsJG6LYftQ8k1x8KqFmlZc
   6rSvTeI2yGGqeAOZtTEXgep5OAdQf1BjNlTBnUwAc4m5sJ1V3aEa1VSN0
   w==;
X-CSE-ConnectionGUID: CLNApmzhRpiwOEFCJ8OTdA==
X-CSE-MsgGUID: C8lkOwecRleXbHSeBK7SQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="207612208"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="207612208"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:06:44 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5AD63C0009E
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:44 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C8D8BC0083F
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:43 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 04D9A1A006C;
	Wed, 23 Jul 2025 09:06:40 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 05/12] epiphany: upgrade 48.3 -> 48.5
Date: Wed, 23 Jul 2025 09:06:07 +0800
Message-ID: <20250723010614.926-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220766

Changelog:
==========
- appstream: Fix app id
- window: rearrange disconnect_active_embed
- window: disconnect correct callback in unregister embed function
- window: also disconnect sync_tab_bookmarked_status
- Simplify decision to remember passwords
- web-view: don't use saved HTTP auth credentials in private modes
- web-view: relocate authenticate_succeeded_cb
- web-view: fix HTTP auth on authenticationtest.com
- web-extension-manager: fix web process extension init regression
- Show created instead of modified time in webapp overview
- Don't consider og:image for web app icon
- window-commands: unref window in case of error
- Update Chinese (Taiwan) translation
- Update Slovak translation
- Fix logic error breaking the password manager
- Update Japanese translation
- shell: Fix startup crash on Pantheon
- action-bar-end: Fix startup crash on Pantheon
- ephy-password-import: improve robustness
- ci: generate new image for style checker
- Fix PKCS #11 login for invalid cert/priv pairs
- Update Romanian translation
- Attempt to fix release CI

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../epiphany/{epiphany_48.3.bb => epiphany_48.5.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.3.bb => epiphany_48.5.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.3.bb b/meta/recipes-gnome/epiphany/epiphany_48.5.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_48.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_48.5.bb
index 74a17be5a5..8129cd79f8 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_48.5.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "da2953e7e2b73bf7473c0a33979104d79362795295eaa0a2a38ea188537daf13"
+SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 929e33b015..6c00ab9b40 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 165ef2bf636c170d81576f7d3e6348fc3d781821 Mon Sep 17 00:00:00 2001
+From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index dac4855750..54a3305aaf 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From c43bbbb4154bb9686756297a7e2eecaa72bb1e9f Mon Sep 17 00:00:00 2001
+From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 96554b7..f5c9727 100644
+index df0340c..8ec6c79 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 5407d893d6..8ebcdc9991 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 4c5f6b0b44b959f0156cb74f76b2db46a0042c4a Mon Sep 17 00:00:00 2001
+From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.43.0


