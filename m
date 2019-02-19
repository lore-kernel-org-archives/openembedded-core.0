Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id B63397C886
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 00:08:50 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n19so765300wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 16:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fMXSL/TaDF6ebGP2su12vwFpzjJs1GK050is7GR6sDI=;
	b=TVdB7BhX7PONU4VbqfqXDArXBa6CebYWzISMfawlt13H8dgBOOhCo5pEfGypWXpQza
	7O90l5dKTheZObi9Ix2AmSiMp7YgtwDEP0krHW6gpQ6BCN1IykGYOCD8xvfxySJkLSeB
	2SoVQc5DTmqMHNgPMFMg7wNb6AOC53nqIkssU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fMXSL/TaDF6ebGP2su12vwFpzjJs1GK050is7GR6sDI=;
	b=lwXofjRdz41gRoOto5fboiKCqBjepZPGDXs32EBnfMABi1tk2/I9xqAGmExo5HVeiv
	asYf2uBHJ5DyuM3OWB26pfSPEFFi5sIp6m2oq98wtv7NQA437YXgS0u+Ovl6KKSvMEHu
	99AXD3cJ8x1pOXZsHM8RaoF9NOUaJ3BLiAOjOUaXJ03EQ89auZ+aYkp3h2SRE3iayROT
	eJ7HvkgK0OBEpjuc35kNJJkVBL7cWCd8/1g/ebgwLOT+k885JsDYs0jj//z0ItAHNLNx
	+AQ/8uK/OMbFeHet8xbVR/dNwhlFxczjbrJ+/QuXUoDVixkXFFwdiFOV2GPR3CYM6fuE
	j9xA==
X-Gm-Message-State: AHQUAuYByJnRcbVkr+wAljweKvo3hX5p7YbrxnFsOJAhIWXmL3qXWAvc
	jodN2R0XYxuEQdC73tO6m6U0+TmZ/V0=
X-Google-Smtp-Source: AHgI3IaoPb6BB3OpIuTW/osHju4Gt20wX3mPTZOaA83d1dr7+JZxZf6+85Nx2e9J6yk4RQ2kqz6piw==
X-Received: by 2002:a1c:2358:: with SMTP id j85mr721817wmj.130.1550534930836; 
	Mon, 18 Feb 2019 16:08:50 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t18sm1626860wmt.8.2019.02.18.16.08.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 16:08:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 00:08:45 +0000
Message-Id: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] adwaita-icon-theme: upgrade 3.28.0 -> 3.30.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2019 00:08:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch                  | 6 +++---
 ...ta-icon-theme_3.28.0.bb => adwaita-icon-theme_3.30.1.bb} | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.28.0.bb => adwaita-icon-theme_3.30.1.bb} (93%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index b5992eba761..43abdcd85ac 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 9661951838773251d0a914e897e8a0d95ce027f6 Mon Sep 17 00:00:00 2001
+From 499222d95a3d06bc425672d50e8c47868667250b Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index fb787dc..5caef0c 100644
+index 38e64bd..6ed480e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.28.0],
+ AC_INIT([adwaita-icon-theme], [3.30.1],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
similarity index 93%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
index 7102a895955..3e9420ed9a0 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
@@ -15,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "b25b2d82cbebf2cc9cd469457b604f2c"
-SRC_URI[sha256sum] = "7aae8c1dffd6772fd1a21a3d365a0ea28b7c3988bdbbeafbf8742cda68242150"
+SRC_URI[md5sum] = "db3fd812821d72fdd9a3c7d622a95b35"
+SRC_URI[sha256sum] = "6d752a2b1bc668483956d4485c39cad1642d9358e133ff689526e43674a4e1ce"
 
 do_install_append() {
 	# Build uses gtk-encode-symbolic-svg to create png versions:
-- 
2.20.1


