Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5590.1794387827681598811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=MeuLu4vJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so31362615e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387826; x=1794992626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dfs4UrmjX6OzGIS2v0Tu/p6JAqFu30iOf/wzHRLOmwc=;
        b=MeuLu4vJCp0aux+y7AEi7w/vdZG5yUifXesRJE/hfBpByWA5dCoMfm7jsCz5/ozQT0
         2J09/ci8zrjBB2idC7Wa0Yec0V9ojcKFRzaQzaQ+ga4CDbturz5VzAtZ+6TM3NeoKUpy
         mcRrGKx/iLl/foZ+jLQNBhszqYVa0hVdgbQchwpeMj2ipxsMySz9p0vyDCUQqV+C2AVM
         UgS+D1QjQ41reYIxHxbgwzphaonoqtlUz3I9xROqqg0Z7K0jTYyOPGUhj7jIqIH9F04a
         K/oZMMkFQWnfNob3Rp3/y2xGQ/2p/wdmeyo6Z4xpuLC1qkS3hPvGYxxRj7UBoIVXSgFO
         s2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387826; x=1794992626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dfs4UrmjX6OzGIS2v0Tu/p6JAqFu30iOf/wzHRLOmwc=;
        b=LAaiIWYQxFxhxZjW2ImVznFAjEtfyyHYzX8zaTpkMqUUcfQ0bA4BiYogBK+vlS+EU0
         qCRYJhQHf6CyYF6KDtakBLdEK/QKhzwzATfomyJjv/+mwpyD65MkflnDAowHei+nNw+h
         K7DULJnu6tlt8TkCdmTYiVFyhYmOVqKmBdGZThMp4RM0QApP4hxhVqoROnO7xwak27Xs
         VHojnw6oFOZWmVJ4E56lZsL869cXcoD9vCv/fODs/EXYEwNA92SXfjscaJZ9Xg89YZbt
         VBfURkBuBuVwrs6GDT6lBCg/JzBM1QWt2X1WQTFWXWNFpZZqUO+fwVaohtPBqC6jfkg/
         6zxQ==
X-Gm-Message-State: APuU4Z/UotqayllonarkahyMaoOqjJeRObZWBO7Ov+Gnvb8ARNMqAbsC
	HqW/m0NPERqqZ5TuctcnTCAweH+UDt0d+iH+AzewKYqBIOFDWpKAhngyxBMhuJyeUjUhhbbYVl3
	9Ctr74RU=
X-Gm-Gg: AYBFou13T98y/AD39B60nfD8SPN0v8S/rbQKwBB3lsbUlWBLBRkNlu+Rizs+eH8f8iO
	WWk/cit9IEJcdZOjibuj294xg4FxYIfa2Y4mzF/doWi0508LcD4IO3M5OKGFIYed75aQFWi5HxI
	5bLMYuno/arN34EgY3a7txpSG6wLUSKEAp3t9SGG53zbYhTWfYpyg5ztGFNUYjL8xbUwPGTsDGx
	yd/CGr5/YN8WLr34Zc4KDgNYfa0f+24pnPWN2cT3qVAk3KXFmel/Q3E6wvqHF25wjnX/llVBZdl
	u2f+RzVNRRayoiwrvTgKwGm/J97FthWM7coakZECw/DAtsTR+ao9Yefujohb1V5tUhptGnBHqtk
	xfyWy+buq5mJb7TjdKhO5WBjR5t/diPAYRrMlKR/82AUCYKZeq3+17HjbxR0cz78ENSGUhFRBLJ
	9vgl1dnlmiaGgeZejaO9GmWHajCy2jDJGdTOfsY5BCfyOBPCmt41u6+zJbmoNOR92K8sBS7iqMW
	iAloc6itRoCWNGcGW1JX9owwIqgSOpqWkP7jcmvoluK3Dv1YTq3IPFm9Fq6cOLi+lB61Lu5vzI4
	uWYEHH30lGYCcTGi2tmgaU0xyAyjLOD72/2IV7XPlL3cuIP5/TsLJpRbu1lgWL8nJiw1NiA+AHl
	b+gdIhinFjpBdKziKKLEM2sdeCFWa
X-Received: by 2002:a05:600c:6214:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4ba0939815cmr27602035e9.34.1794387825741;
        Wed, 11 Nov 2026 01:03:45 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:40 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/35] bind: upgrade 9.20.29 -> 9.20.30
Date: Wed, 11 Nov 2026 10:02:48 +0100
Message-ID: <99227f53c199fe086fa3cae57933d3d90dd92083.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249994
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

ReleaseNotes: https://bind9.readthedocs.io/en/v9.20.30/notes.html#notes-for-bind-9-20-30

CVE fixes: CVE-2026-19630, CVE-2026-96888, CVE-2026-97313, CVE-2026-94300

- Other bug fixes are mentioned in ReleaseNotes.
- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3d52bad81bb24f84af630b9bbd3cadd7048ceec5)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.29.bb => bind_9.20.30.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.29.bb => bind_9.20.30.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 15796a15fba..d302bc14810 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 95141cf9494292fc5645165ef3d5e9e2ed2208c6 Mon Sep 17 00:00:00 2001
+From 1c087c24e8162c7a042cf1f19ad313e0f3a21196 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 99e781799da..eb0adcfabef 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 06e9624eb7e474a08ed7e1a456bfe9759ba211da Mon Sep 17 00:00:00 2001
+From aa978a473328123575af0270dc1dd274050bdfc0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 80a4f2abded..5871fb433cd 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From f28920a59b658fcda24efde1c45322f785a0b0fe Mon Sep 17 00:00:00 2001
+From 525570781b873c3434df49ac753afca7c1bd9613 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0bc3965..e1c2b12 100644
+index 4d02c6e..225f59c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 323985a4025..73300b46e87 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From f003f396067e6cc1e2ec609b296bb642b8ddf47b Mon Sep 17 00:00:00 2001
+From 4388bec9a8ebd7d9dded4b1942a5670cdaec064f Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 26c442a..0bc3965 100644
+index 75088e5..4d02c6e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 28ee4ae74d3..f88f93951f1 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 5fc3dfd3f994b5fd97e97837eee2ad808cd8af93 Mon Sep 17 00:00:00 2001
+From 65c90b60cc9f30c383b8e30b900abd04bc977bd1 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index b373251c47e..388335b2711 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 42c109317070d19fda70635b7043cbc6f9ec36ef Mon Sep 17 00:00:00 2001
+From c58e1309e80449ecc1fa1fa793630b53c08f958e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 74cf947787a..bd6ada88228 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 2e1314f2e71be15704ba18756250185b36a5c0da Mon Sep 17 00:00:00 2001
+From ad9cb821a119f441f6131e01715d5e0eab368fc0 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.29.bb b/meta/recipes-connectivity/bind/bind_9.20.30.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.29.bb
rename to meta/recipes-connectivity/bind/bind_9.20.30.bb
index 5ce94d597b4..bf51c48b601 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.29.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.30.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1"
+SRC_URI[sha256sum] = "9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e101e82e1e3b4fef"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
