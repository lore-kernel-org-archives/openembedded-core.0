Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED60C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 11:46:30 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.6514.1645616788613153243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 03:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oT4VEBW5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645616786; i=@fujitsu.com;
	bh=2dcrEAPxkHpFXl7uUXMP2Ra9dl52p1SK5PeF9/GXC/4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oT4VEBW5IoOyzv+x1uUqkw0wxwCeXxssSgg03ub5OSyT8II189pbG/tdCjfuxUWOv
	 2VuWP5agrmKEIRZoaRWwHlCwR9GLOi5V2n5LtJq+B51zrmUT/g2okWxRmrIWcaoIXz
	 46aowpKO9VUy4HUPgHGq/yja0UJNiuoE/tJi++hd5rd9wPIqaWy8rs1ZHop80/LxtX
	 DG1HEga95pLw1xppcbws8823nKJ3UUOsnzvHzAZ7W3EPfs5r64ycyWpi5CrnJ49ta4
	 dlbSQbc6q3mNlNEb1cREHFkAT6tUg1pAt2JSzFNvy09d+AlJWUvGQW875/fg8esaQF
	 PHGe4qN/Zj3Yg==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 BF/69-30582-29E16126; Wed, 23 Feb 2022 11:46:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORqDtJTiz
  JYNlvAYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePKn1aWgl8yFQ+f7WNvYPwi2cXIxSEk8JhR
  YufMc4wQznkmiRWd59i6GDmBnBOMEhNadUBsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdxBYWsJOY+HcNM4jNIqAq8fVJPxtIOa+Ak0TXNEOQsISAgsSUh+/BSngFBCVOznzCAjFGQu
  LgixfMEDWKErMvN7NA2BUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYx2iUVZaZnlOQmZub
  oGhoY6BoamuqaG+oaGhvrJVbpJuqlluomp+aVFCUCpfUSy4v1UouL9Yorc5NzUvTyUks2MQID
  M6XYvXUH4+W+n3qHGCU5mJREea/xiCUJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCVlALKCRalp
  qdWpGXmAKMEJi3BwaMkwqsuC5TmLS5IzC3OTIdInWLU5di55fJeZiGWvPy8VClxXg4hoCIBkK
  KM0jy4EbCIvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcZZBVPZl4J3KZXQEcwAR0xJUs
  I5IiSRISUVAOTZbzZbKvvXenBz/TN1afH3HpzNn2vXYBAw+RFNwKZHfRfiJ75uLjliOdzEw/L
  239OLmu8k3dApHLL0Tqn9Q3rJ9TsDP35foK6UOlfqTNiE7fEqbiXPJoWubj92CJPZf8bZtcva
  ux5vvSsVtLeGd7xR+Q/BvT5ekyYKejMxBtl/sKiPIzdkUsyuH/Ov6BfNU4zmpSd9yTfm5otHH
  Lv7ymVN+5uoufufj+95n9JIBNXZZxVT1PYtckGX/07f8bH9kz7dTVc5I57zMQLLOEtEy6e33I
  94uukpxI8bklPLdeysbVWGzlu5ayQXuufe6g+bI5S0XqjKL0qkWeSH3yuNN3Lvyn5xtJu2s2i
  7bXaC64qsRRnJBpqMRcVJwIAWVmkzFMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-528.messagelabs.com!1645616785!9267!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18267 invoked from network); 23 Feb 2022 11:46:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 11:46:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BD38E10004D
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 11:46:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B12BC100196
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 11:46:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 11:46:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsecret: upgrade 0.20.4 -> 0.20.5
Date: Wed, 23 Feb 2022 19:46:14 +0800
Message-ID: <1645616774-28994-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 11:46:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162254

determinism.patch
removed since it's included in 0.20.5

Changelog:
=========
 * Drop autotools-based build [!44]
 * Use G_GNUC_NULL_TERMINATED where appropriate [!65]
 * collection, methods, prompt: Port to GTask [!66, !93]
 * Detect local storage in snaps in the same way as flatpaks [!67]
 * Add bash-completion for secret-tool [!70, #50, !72]
 * secret-tool: Add locking capabilities to secret tool [#28, !75]
 * secret-file-backend: Avoid closing the same file descriptor twice [!78]
 * Add support for TPM2 based secret storage [!83, !90, !95]
 * Create default collection after DBus.Error.UnknownObject [!94]
 * Port documentation to gi-docgen [!101]
 * GI annotation and documentation fixes [!63, !64, !102, !103, #66]
 * Build fixes [#54, !62, !68, #59, !73, !77, !82, !84, !85, !88]
 * Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsecret/libsecret/determinism.patch     | 37 -------------------
 ...ibsecret_0.20.4.bb => libsecret_0.20.5.bb} |  4 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-gnome/libsecret/libsecret/determinism.patch
 rename meta/recipes-gnome/libsecret/{libsecret_0.20.4.bb => libsecret_0.20.5.bb} (88%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/determinism.patch b/meta/recipes-gnome/libsecret/libsecret/determinism.patch
deleted file mode 100644
index ad96e8f59b..0000000000
--- a/meta/recipes-gnome/libsecret/libsecret/determinism.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-secret-enum-types.c/h.template: Fix reproducibility issue 
-
-When full filenames are used in generated sources it makes the resulting
-debug packages non-reproducible. Best practise is to use basename in
-comments instead.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/68]
-
-Index: libsecret-0.20.4/libsecret/secret-enum-types.c.template
-===================================================================
---- libsecret-0.20.4.orig/libsecret/secret-enum-types.c.template
-+++ libsecret-0.20.4/libsecret/secret-enum-types.c.template
-@@ -23,8 +23,8 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--#include "@filename@"
--/* enumerations from "@filename@" */
-+#include "@basename@"
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
-Index: libsecret-0.20.4/libsecret/secret-enum-types.h.template
-===================================================================
---- libsecret-0.20.4.orig/libsecret/secret-enum-types.h.template
-+++ libsecret-0.20.4/libsecret/secret-enum-types.h.template
-@@ -27,7 +27,7 @@ G_BEGIN_DECLS
- 
- /*** BEGIN file-production ***/
- 
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
similarity index 88%
rename from meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
index 39ecdd770a..edb2b4a882 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
@@ -14,9 +14,7 @@ inherit gnomebase gtk-doc vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI += " file://determinism.patch"
-
-SRC_URI[archive.sha256sum] = "325a4c54db320c406711bf2b55e5cb5b6c29823426aa82596a907595abb39d28"
+SRC_URI[archive.sha256sum] = "3fb3ce340fcd7db54d87c893e69bfc2b1f6e4d4b279065ffe66dac9f0fd12b4d"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.25.1


