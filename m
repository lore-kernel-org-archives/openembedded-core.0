Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id D78C371BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:54 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id f201so80670609oib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qne1F/BLceOI24WZEc9aHw1xmkBQd7ljdHbENdRE8Mw=;
	b=G2Qvy1cuumUIZfw+Cm2ea38JfbO61JfYbILqGAtEgCsAAWvoOK1KIo+kE62MFxMMYr
	7fkdLk9WOlz1Zc9Sw4qnMCkUW0ulq6lpmNs80N841p7XrzgRd22aONwyZG7A/uZw2GcQ
	55rlcvJgXGMbY79tQKaL5wFucHVxMyTs2nlE6YFBpxO4qxKv7sxDiXgn+YDOHhhNRVFW
	nFOzvEtiXgFvnjxn8wJjhQaA7AZGxGkmPtwUqnEZlxu/bezqx4O2kD/sj2PIOSFvb9tL
	uBG834cnpDfsEG0e558bGzuzaaXBz3ibaPJIJFoRARFGTdpKU53c1CJGyM3Qjf3mv73C
	05CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qne1F/BLceOI24WZEc9aHw1xmkBQd7ljdHbENdRE8Mw=;
	b=Ki8PqmD0fGYuw1ZD2asDh3p9piL3ve14IJs4IfHfYSO5od+DBq+UVTXoZBubL5vz4U
	wQhwZeynVzdKwTwZJFq7q4Dvtzs0XEJrChzbR19y2Km0zl+Oag75K/7q2zts6NrUDn0T
	m6idfHr3Sly3p5ptqeSSz6yt5/q8iFI/3/lGyYSt+B4Uo05tHit3YKGv9N/Dh4wki7IR
	rhsEZj07vHjbv+1hKHKVsURS2JBFhiGqx3Epp6hZ6V15+cMEWz9esInNBEQUwOxxcrtI
	9vf7hyuZbVmoAM6BGH6sz1i8gJuOZ2IhQyhWgsSSddZpGdGilIdXu+AiaQX48YfHb8gG
	vsag==
X-Gm-Message-State: AIkVDXKnlGe1COIChyRNPXSdH21KBSv7cFmoz7gcCAkSOWtN5x4mPb9OPF2ak23vUwyA1w==
X-Received: by 10.202.226.138 with SMTP id z132mr31960670oig.54.1483645615311; 
	Thu, 05 Jan 2017 11:46:55 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:54 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:28 -0700
Message-Id: <1b843ed76043298479c56f9f98009653fa56c564.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 16/16] webkitgtk: patch & disable JIT for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:55 -0000

From: Christopher Larson <chris_larson@mentor.com>

It might not be speedy, but it does build now.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../webkit/webkitgtk/x32_support.patch             | 22 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.14.2.bb       |  7 +++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/x32_support.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
new file mode 100644
index 0000000..fea4c27
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
@@ -0,0 +1,22 @@
+From: Daniel Schepler <dschepler@gmail.com>
+Subject: Fix FTBFS in x32
+Bug-Debian: https://bugs.debian.org/700795
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Index: webkitgtk/Source/WTF/wtf/Platform.h
+===================================================================
+--- webkitgtk.orig/Source/WTF/wtf/Platform.h
++++ webkitgtk/Source/WTF/wtf/Platform.h
+@@ -182,8 +182,12 @@
+ /* CPU(X86_64) - AMD64 / Intel64 / x86_64 64-bit */
+ #if   defined(__x86_64__) \
+     || defined(_M_X64)
++#ifdef __ILP32__
++#define WTF_CPU_X86_64_32 1
++#else
+ #define WTF_CPU_X86_64 1
+ #endif
++#endif
+ 
+ /* CPU(ARM64) - Apple */
+ #if (defined(__arm64__) && defined(__APPLE__)) || defined(__aarch64__)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
index 46b5468..9720432 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://detect_atomics.patch \
+           file://x32_support.patch \
            "
 
 SRC_URI[md5sum] = "2fe3cadbc546d93ca68a13756c2be015"
@@ -85,6 +86,12 @@ EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 # JIT not supported on MIPS either
 EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
 
+# JIT not supported on X32
+# An attempt was made to upstream JIT support for x32 in
+# https://bugs.webkit.org/show_bug.cgi?id=100450, but this was closed as
+# unresolved due to limited X32 adoption.
+EXTRA_OECMAKE_append_linux-gnux32 = " -DENABLE_JIT=OFF"
+
 SECURITY_CFLAGS_remove_aarch64 = "-fpie"
 SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 
-- 
2.8.0


