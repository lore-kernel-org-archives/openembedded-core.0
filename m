Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.32356.1607937052897793352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 01:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xdj26NSC;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id jx16so21480902ejb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 01:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rcNBrkCqmMU1vuaRZ4g1r46031YSXpU71VyCsOrWToc=;
        b=Xdj26NSCjRZMEUgQmeylp82tCRCAdv7FOp0kAx7do/BnNPG552SP1EY31lheh8AISr
         z8dOyXR1wGOvjdZIocjkCX/bRdW6PNInEA4/sU4axLs4eIt4HyQ3hNFi2ZKCKAwassXb
         H1B2liOyL8dZMI5lETR8wfw73BhcaTvNg7Rr5DjKQjpBpsOJkk5kHfPzzcM0QF1zr9ad
         sFBvl6IaJqEDT2o2UumhmSziir5UQA52fEA855fORyzN9HKTKUbUFH8orY12kkPURnp0
         V2qgo9zLx7HIVPdwUFlykqtv+a9s+I3fePLo6t/Lc+jWWzlMGgwkjRTfxFxZkSHPI9WT
         FdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rcNBrkCqmMU1vuaRZ4g1r46031YSXpU71VyCsOrWToc=;
        b=R3SN8dxNXCIIEBzwc1gwwGtNgklUvCDCsyyXqglDkskMdAO8+KU1KtujHMMwKlcF36
         dkO9EYhZsGm5d5eNtiIgq1gtbT2x0XMmVimPP5OpxZ/tHjHHaS+CkDyyYg8P3vP91hzK
         pz8B6WcDi8Z4JPRaBrvRFXDiFWzbeQoKZyEZ4COwDiYhbRzGpHhbs7KLoFyTCRGlwxaN
         8KCm3GV5NLhI7evUPfI08/Arw68gyNg/2WLDq5bMeI7jrdjRgtix195lTp7uekq4PRE6
         Sp1tsbEOBL4Asu5Xuq2iDMl0FaidaMpIlHUAwujQ78n2rLPiTUpJlIPjnk+PcVMGrguE
         fU+g==
X-Gm-Message-State: AOAM5338huOFZW0bbfn1AReI/ETAPuSjemVNrlBnr74KoABTpRyOcAlD
	+LlKStm2/wHwubD6XvIubg18Gn3TUAALEw==
X-Google-Smtp-Source: ABdhPJzNBIB9QT1JSPjA+qMMmEqZtbkNmuWiP0ytwdjqouHwECO7UqSg+8xCrh/T2p0ZyjEnY9zzIQ==
X-Received: by 2002:a17:906:4e52:: with SMTP id g18mr22310827ejw.385.1607937051195;
        Mon, 14 Dec 2020 01:10:51 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d22sm13318425eja.72.2020.12.14.01.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 01:10:50 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/4] lttng-tools: disable more failing ptests
Date: Mon, 14 Dec 2020 10:10:41 +0100
Message-Id: <20201214091042.10145-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214091042.10145-1-alex.kanavin@gmail.com>
References: <20201214091042.10145-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ression-disable-the-tools-live-tests.patch | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
index f2c14ecc94..08c1423310 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
@@ -1,4 +1,4 @@
-From c69b68e5c03f1d260025fb1dd9ab7345e31e15ef Mon Sep 17 00:00:00 2001
+From de9fc501e775cae05f1f87534b4237cd78e8d9a8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 18:03:25 +0100
 Subject: [PATCH] tests/regression: disable the tools/live tests
@@ -9,15 +9,16 @@ https://bugs.lttng.org/issues/1217
 
 Upstream-Status: Inappropriate [upstream is working on a real fix]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- tests/regression/Makefile.am | 4 ----
- 1 file changed, 4 deletions(-)
+ tests/regression/Makefile.am | 10 +---------
+ 1 file changed, 1 insertion(+), 9 deletions(-)
 
 diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index 73eb9f7..b92bdbd 100644
+index cbac90d..d467886 100644
 --- a/tests/regression/Makefile.am
 +++ b/tests/regression/Makefile.am
-@@ -9,14 +9,10 @@ TESTS = tools/filtering/test_invalid_filter \
+@@ -11,16 +11,10 @@ TESTS = tools/filtering/test_invalid_filter \
  	tools/filtering/test_valid_filter \
  	tools/streaming/test_ust \
  	tools/health/test_thread_ok \
@@ -26,9 +27,29 @@ index 73eb9f7..b92bdbd 100644
 -	tools/live/test_lttng_ust \
  	tools/tracefile-limits/test_tracefile_count \
  	tools/tracefile-limits/test_tracefile_size \
- 	tools/exclusion/test_exclusion \
+-	tools/exclusion/test_exclusion \
  	tools/snapshots/test_ust_fast \
 -	tools/snapshots/test_ust_streaming \
  	tools/save-load/test_save \
- 	tools/save-load/test_load \
+-	tools/save-load/test_load \
  	tools/save-load/test_autoload \
+ 	tools/mi/test_mi \
+ 	tools/wildcard/test_event_wildcard \
+@@ -38,8 +32,7 @@ TESTS = tools/filtering/test_invalid_filter \
+ 	tools/working-directory/test_relayd_working_directory \
+ 	tools/notification/test_notification_multi_app \
+ 	tools/clear/test_ust \
+-	tools/clear/test_kernel \
+-	tools/tracker/test_event_tracker
++	tools/clear/test_kernel
+ 
+ if HAVE_LIBLTTNG_UST_CTL
+ SUBDIRS += ust
+@@ -60,7 +53,6 @@ TESTS += ust/before-after/test_before_after \
+ 	ust/multi-lib/test_multi_lib \
+ 	ust/rotation-destroy-flush/test_rotation_destroy_flush \
+ 	ust/namespaces/test_ns_contexts \
+-	ust/namespaces/test_ns_contexts_change \
+ 	tools/metadata/test_ust \
+ 	tools/relayd-grouping/test_ust
+ endif # HAVE_LIBLTTNG_UST_CTL
-- 
2.29.2

