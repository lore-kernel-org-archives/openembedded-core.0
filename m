Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105.1795101876828499187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kSlAX3C9;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so17005405e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101875; x=1795706675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LxEvz6Rgf7K9sNc0CkOuM3/ZDpiMSLHq3SmHYPArxYM=;
        b=kSlAX3C927TLlZI2pFryPaYat3n15wWyMjWe56GJsObho3y8kdat/h1kO2Gr1agkNT
         CIOpJR3xhafX+12AKAYNuSZZNHyzxfdSqM2c2bF0KANGnHZTAyR355mkf+P54xR+Juu7
         +2w+DxfOSbyEwKpYdXQK7N0pR6eJF1Dc4bnDrqDyR/KOwr40qSqAyodFRThNPyE1rA7/
         3D2qtW8R714gMbc+asELJJO8jDxD81sai9jvo7GA7PxaaKNj55r5l9/pGcLm/KLfgRlT
         R97SnoQn6HIm+u08COR9m+o4CL29FaN6/d4NksGblzhc9hctc52fMH8ZOsxMfnA0+EfQ
         rzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101875; x=1795706675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LxEvz6Rgf7K9sNc0CkOuM3/ZDpiMSLHq3SmHYPArxYM=;
        b=YEgSLXhPh6GPmC0DzBTA9ffNb26xS0criYLu8iU6QkZsWqs2+PgB/rkO4mMMquefcf
         gtl7l04gz4lK7BJI5IcbFypRxEnrJnY8Wf2JZjnD9hUb7Ktb5Y0HM3GfmcZsiKRRDLaB
         dyqafUXUXTxe+r1akni7gFVrIt76kO/blXPuoFYS+WENW+Sj8rELaTbwKBX+C52/Bfpt
         twry/OSUnzlbdQ4Ug9ZuUckF5AVtbM+a5Pwu10Dlo4tOnv6SX/d4rqaRHLN+QQdnV8zV
         KMhnza2IT9iHjnWFa6JTVm6FwWWOpPQG42gfkXq+GjPY4a+S7WEmVOLyqd2ZMICpkF5V
         9ssg==
X-Gm-Message-State: APuU4Z8GVLg+U+CGTDNqTQI9NwOTo6GAZcH2s9b2Hm+3C15MKURhLb1f
	Xr48BhjB5ulfsPQPEvI7+CAnippc848FmoaRkTbF12X8fCKKc6yiQANGyD6dPIIsuzBMurTDMS0
	YGe+/cgI=
X-Gm-Gg: AYBFou3Twiha2IF9BZTruj6Zs1FfmHP3WKo+IOmNppyib3/ZwPm1fvxb1+fvzivu73E
	ALJHodCGEhX+Gd8B9osenFjcEZdDfzNo+4ua4gfVhp9+yagKPOmCwZ9/yyecPCZXmwxOyacD37E
	cefwaDgEmeBnaqx+p5BMHhI+bMEumPkngws4hhSnkwx06K9l4qAsnzLf7P7JMwC/Wao/XnHClYZ
	OaRtPTZRzeS1jtfN3WFAMgQt8V9EUyCDCLVOvXyQVxFidMtiraCPOrRLuRFdw8aH6VoKFn6Qskm
	mQwvySHL0orKIG/7PqQa+RFr8mAzySKGEYhotG26JGPnbJSD1zk08t2rMFBuazE4hpGIq0E6kMi
	hRuopxc+rZEv72AnYmnOtO3OEKKIE06hW6kWF9aaivWX52Fm8NnOrEukB2CckLZaqpZgaJdwZHn
	zfEVWsop8s9/wrhFheGS17JgL7hqAatnNTvmNKci+3jxx6yCgcWBumiSirTdTXTe3CPJdxkhUjt
	45jdtlbw+/P1UEcZhQyxtjeYY31eLMZePWSyvcxU7fbTqr7my0ag84m9Ut/80Ur1cAMaqTdGDd1
	OOqVDSIJ87dkCUEi0iiyJjGzQ2ISywcHf/EsmsCa9I+715gQyWQsSZrx0rmpC3oEadr40MHRfT4
	9KFfBPyZY2TCyUgXFvuo9eo7SmObYr89Cj4rEbUo1VDJfA0IyfHLg5Ui6
X-Received: by 2002:a05:600d:a:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb7e4edf38mr99777905e9.12.1795101874944;
        Thu, 19 Nov 2026 07:24:34 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:34 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/19] aspell: upgrade 0.60.8.1 -> 0.60.8.2
Date: Thu, 19 Nov 2026 16:22:45 +0100
Message-ID: <4dec16113d0fdd009bc78d75bcab843454367c40.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250702
Content-Type: text/plain; charset="utf-8"

From: Wang Mingyu <wangmy@fujitsu.com>

0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
removed since it's included in 0.60.8.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1218499d028b5d5ee269cc4919a98fd1a9fa3f3f)
Changelog: https://github.com/GNUAspell/aspell/releases/tag/rel-0.60.8.2
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 ...default-vector_hash-t.hpp-fix-gcc-15.patch | 42 -------------------
 ...{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
 rename meta/recipes-support/aspell/{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} (84%)

diff --git a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch b/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
deleted file mode 100644
index 4045e8e412..0000000000
--- a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d45bf96b0a3556acb2c83069a78eaaac973d31b4 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Sun, 21 Jul 2024 22:01:50 +0100
-Subject: [PATCH] modules/speller/default/vector_hash-t.hpp: fix gcc-15 build
-
-Uncoming `gcc-15` added extra checks for template instantiation that is
-guaranteed to fail in
-  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=313afcfdabeab3e6705ac0bd1273627075be0023
-
-As a result `aspell` build now fails as:
-
-    In file included from modules/speller/default/readonly_ws.cpp:51:
-    modules/speller/default/vector_hash-t.hpp: In member function 'void aspeller::VectorHashTable<Parms>::recalc_size()':
-    modules/speller/default/vector_hash-t.hpp:186:43: error: 'class aspeller::VectorHashTable<Parms>' has no member named 'e'
-      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-          |                                           ^
-    modules/speller/default/vector_hash-t.hpp:186:59: error: 'class aspeller::VectorHashTable<Parms>' has no member named '_size'; did you mean 'size'?
-      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-          |                                                           ^~~~~
-          |                                                           size
-
-It looks like `_size` is `size_` mis-spelling and `e` was not introduced
-here.
-Upstream-Status: Backport [https://github.com/GNUAspell/aspell/commit/ee6cbb12ff36a1e6618d7388a78dd4e0a2b44041]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/speller/default/vector_hash-t.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/speller/default/vector_hash-t.hpp b/modules/speller/default/vector_hash-t.hpp
-index 969a80c..e4420b4 100644
---- a/modules/speller/default/vector_hash-t.hpp
-+++ b/modules/speller/default/vector_hash-t.hpp
-@@ -183,7 +183,7 @@ namespace aspeller {
-   template<class Parms>
-   void VectorHashTable<Parms>::recalc_size() {
-     size_ = 0;
--    for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-+    for (iterator i = begin(), e = end(); i != e; ++i, ++size_);
-   }
- 
- }
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.1.bb b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
similarity index 84%
rename from meta/recipes-support/aspell/aspell_0.60.8.1.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.2.bb
index 43940b1e1b..5b4fab7c35 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
@@ -13,9 +13,8 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
-           file://0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch"
-SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
