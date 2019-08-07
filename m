Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id F02417F388
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 14:01:50 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id v18so85532180ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=S24DKEHohe6LUVytEvVdYUTJOiqh958aZFYKACCyzQI=;
	b=M3ZrEO01F6YXxbY66hGwscQjheEUWa7wXWC9ZCgPdiFqfo11f+eRzvZu6q6h4ysXBt
	nuaxR6k0DSBHrnxLdtSuaVF0gM0yEcrJP1nrXIRNdzXEkDmIRuHXdFKH/AG/Ccqg8irH
	j4YEy+w6/nQDNj60Itt6NzlQCVB5QJAalP+HCFxtLyvq6mc1ztqGtCEczR4PDJ9cvvR+
	ptCHfppQLfUreCn9rLHceSZHyd7YF9gWvLIO8UHaV/ZzYN/S+K1+oIK4FIACl+7M+HZr
	hLcbmlHdJgOJk2ceRZ3QTBa7AeEGky9GqIDg1mTvAk2Q91Rd/F0oEwDIwREpAn6Bxds2
	sdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S24DKEHohe6LUVytEvVdYUTJOiqh958aZFYKACCyzQI=;
	b=LkqjTTciaQc4YrbLkdD2M04q3dI4XfiZ8ZMCXbRSlLrIwwQ5rKnNnJxTN4EJozDE2s
	2x8Ho3zeKvItOMAaPnWcXBKZyL4z9N2hfvXFOdItXM1Y3A32GLq6Djz/n2bx8rLebqPZ
	aDJyA0iQsFkwWBWvDVtuOQE1rg//wb1AYOQELMoTqKJA+8ulcwstlGSe4AygFeseneLN
	35h4kU/5s6Fn2hedSrNqrRu0sYS5Cl1vs9ey4E1Mrs4ZZhBLtWAoEO4i/+BBkpRlWMHW
	OGGNq6NCgROdqD1InEgvPcAyr3mmEW+N1wFcRLeJS2ghSKo/EsBpPTXf+Zirf4+10vkP
	SEaw==
X-Gm-Message-State: APjAAAXD8XQw+JI7YMhc2VfzvN8r5rhpMcLBSdIsUI6K7MWJ5tiOxxE9
	XUwbqx0agVQdEcNeF5n+/xnrlWErrQ8=
X-Google-Smtp-Source: APXvYqzYJhsmHIvg9eg7m8LRZvoU0taTeeYRyihRrgfxiEd+jTQLuZR4RRrSd48aC7N/O51+V7Z6dw==
X-Received: by 2002:a2e:9a13:: with SMTP id o19mr5152231lji.102.1565186511000; 
	Wed, 07 Aug 2019 07:01:51 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 25sm2685099lft.71.2019.08.07.07.01.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 07:01:50 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 16:01:47 +0200
Message-Id: <20190807140147.8956-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] aspell: update to 0.60.7
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
X-List-Received-Date: Wed, 07 Aug 2019 14:01:53 -0000

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...60.6.1.bbappend => aspell_0.60.7.bbappend} |  0
 meta/recipes-support/aspell/aspell/gcc7.patch | 40 -------------------
 .../{aspell_0.60.6.1.bb => aspell_0.60.7.bb}  |  8 ++--
 3 files changed, 3 insertions(+), 45 deletions(-)
 rename meta-selftest/recipes-test/aspell/{aspell_0.60.6.1.bbappend => aspell_0.60.7.bbappend} (100%)
 delete mode 100644 meta/recipes-support/aspell/aspell/gcc7.patch
 rename meta/recipes-support/aspell/{aspell_0.60.6.1.bb => aspell_0.60.7.bb} (78%)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.60.6.1.bbappend b/meta-selftest/recipes-test/aspell/aspell_0.60.7.bbappend
similarity index 100%
rename from meta-selftest/recipes-test/aspell/aspell_0.60.6.1.bbappend
rename to meta-selftest/recipes-test/aspell/aspell_0.60.7.bbappend
diff --git a/meta/recipes-support/aspell/aspell/gcc7.patch b/meta/recipes-support/aspell/aspell/gcc7.patch
deleted file mode 100644
index 6ffd0772fa..0000000000
--- a/meta/recipes-support/aspell/aspell/gcc7.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8089fa02122fed0a6394eba14bbedcb1d18e2384 Mon Sep 17 00:00:00 2001
-From: Kevin Atkinson <kevina@gnu.org>
-Date: Thu, 29 Dec 2016 00:50:31 -0500
-Subject: [PATCH] Compile Fixes for GCC 7.
-
-Closes #519.
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- modules/filter/tex.cpp | 2 +-
- prog/check_funs.cpp    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/modules/filter/tex.cpp b/modules/filter/tex.cpp
-index a979539..19ab63c 100644
---- a/modules/filter/tex.cpp
-+++ b/modules/filter/tex.cpp
-@@ -174,7 +174,7 @@ namespace {
- 
-     if (c == '{') {
- 
--      if (top.in_what == Parm || top.in_what == Opt || top.do_check == '\0')
-+      if (top.in_what == Parm || top.in_what == Opt || *top.do_check == '\0')
- 	push_command(Parm);
- 
-       top.in_what = Parm;
-diff --git a/prog/check_funs.cpp b/prog/check_funs.cpp
-index db54f3d..89ee09d 100644
---- a/prog/check_funs.cpp
-+++ b/prog/check_funs.cpp
-@@ -647,7 +647,7 @@ static void print_truncate(FILE * out, const char * word, int width) {
-     }
-   }
-   if (i == width-1) {
--    if (word == '\0')
-+    if (*word == '\0')
-       put(out,' ');
-     else if (word[len] == '\0')
-       put(out, word, len);
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.7.bb
similarity index 78%
rename from meta/recipes-support/aspell/aspell_0.60.6.1.bb
rename to meta/recipes-support/aspell/aspell_0.60.7.bb
index 161bb5ce20..da99d12630 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.7.bb
@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 PR = "r1"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
-           file://gcc7.patch \
-          "
-SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
-SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[md5sum] = "8ef2252609c511cd2bb26f3a3932ef28"
+SRC_URI[sha256sum] = "5ca8fc8cb0370cc6c9eb5b64c6d1bc5d57b3750dbf17887726c3407d833b70e4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
-- 
2.17.1


