Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8A8C27C6E
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1272.1715794337763078400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bLsIZE2B;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=iW7FNaDO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f7d4fe50d-083a0ad3-2fc5-435b-a22b-6a8365c6ac8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hvpg0uL+H8/Bzc1UTTfsIOpPw3IXTX/lR9cteLvHtQ8=;
	b=bLsIZE2BGk6phi5XjGMMRVHci7sZPLdO/ltC1ba8OuExF/jcXiUnXT38bX8DExua
	ba5jKUocHaZwq7MGA3ziJPK6LTwHjQeGmUBM4mdrZdIpf4mrlqckKxOrY0IVG+UvQ48
	11piR99sPaIlxv90z+C3a3yfXff7tPTxC4f89c4U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hvpg0uL+H8/Bzc1UTTfsIOpPw3IXTX/lR9cteLvHtQ8=;
	b=iW7FNaDOhumvHD9wPerTBB0HA+tzxrUrh0Cf7C72Q2bseCvux3V7Lxy9DapGPbm6
	cFM5HG+znHVB/2C41W8bKBaYd7z4CZt/xJXyT7xxU3UeLx5G4viiHGY63FGrG1h9uxM
	6ZTgYraHZBnWdcLpUstbJMb0zVCzUWl6bQNteY+M=
Content-Type: multipart/mixed; boundary="===============3347683818024703303=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.13 FAILED
Message-ID: <0101018f7d4fe50d-083a0ad3-2fc5-435b-a22b-6a8365c6ac8f-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199372

--===============3347683818024703303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.13.13* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lttng-modules-upgrade-2.13.12-2.13.13.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f6d7ff2e02bece740c17e115427da4c239b1c4a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 15:14:58 +0000
Subject: [PATCH] lttng-modules: upgrade 2.13.12 -> 2.13.13

---
 ...x-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch |  93 ------------
 ...e-missing-CONFIG_TRACEPOINTS-to-warn.patch |  12 +-
 ...ponent-to-set_bias_level-events-in-l.patch | 132 ------------------
 ...n_migratepages-changed-in-linux-6.9-.patch |  81 -----------
 ...v_base_lock-removed-in-linux-6.9-rc1.patch |  57 --------
 ...es_2.13.12.bb => lttng-modules_2.13.13.bb} |   9 +-
 6 files changed, 9 insertions(+), 375 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.12.bb => lttng-modules_2.13.13.bb} (77%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch
deleted file mode 100644
index 9d5fd0de60..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From fec007d9630e010062cf5699a08460f71f46b527 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 25 Mar 2024 08:54:42 -0400
-Subject: [PATCH 1/4] Fix: ASoC snd_doc_dapm on linux 6.9-rc1
-
-See upstream commit:
-
-    commit 7df3eb4cdb6bbfa482f51548b9fd47c2723c68ba
-    Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
-    Date:   Wed Mar 6 10:30:01 2024 +0100
-
-        ASoC: trace: add event to snd_soc_dapm trace events
-
-        Add the event value to the snd_soc_dapm_start and snd_soc_dapm_done trace
-        events to make them more informative.
-
-        Trace before:
-
-                   aplay-229   [000]   250.140309: snd_soc_dapm_start:   card=vscn-2046
-                   aplay-229   [000]   250.167531: snd_soc_dapm_done:    card=vscn-2046
-                   aplay-229   [000]   251.169588: snd_soc_dapm_start:   card=vscn-2046
-                   aplay-229   [000]   251.195245: snd_soc_dapm_done:    card=vscn-2046
-
-        Trace after:
-
-                   aplay-214   [000]   693.290612: snd_soc_dapm_start:   card=vscn-2046 event=1
-                   aplay-214   [000]   693.315508: snd_soc_dapm_done:    card=vscn-2046 event=1
-                   aplay-214   [000]   694.537349: snd_soc_dapm_start:   card=vscn-2046 event=2
-                   aplay-214   [000]   694.563241: snd_soc_dapm_done:    card=vscn-2046 event=2
-
-Upstream-Status: Backport [88c4e0fe Fix: ASoC snd_doc_dapm on linux 6.9-rc1]
-
-Change-Id: If0d33544b8dd1dfb3d12ca9390892190fc0444b0
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/asoc.h | 33 +++++++++++++++++++++++++++
- 1 file changed, 33 insertions(+)
-
-diff --git a/include/instrumentation/events/asoc.h b/include/instrumentation/events/asoc.h
-index 21d13a0f..5126d4c1 100644
---- a/include/instrumentation/events/asoc.h
-+++ b/include/instrumentation/events/asoc.h
-@@ -51,6 +51,38 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_card, snd_soc_bias_level_done,
- 
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_basic,
-+
-+	TP_PROTO(struct snd_soc_card *card, int event),
-+
-+	TP_ARGS(card, event),
-+
-+	TP_FIELDS(
-+		ctf_string(name, card->name)
-+		ctf_integer(int, event, event)
-+	)
-+)
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_basic, snd_soc_dapm_start,
-+
-+	asoc_snd_soc_dapm_start,
-+
-+	TP_PROTO(struct snd_soc_card *card, int event),
-+
-+	TP_ARGS(card, event)
-+
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_basic, snd_soc_dapm_done,
-+
-+	asoc_snd_soc_dapm_done,
-+
-+	TP_PROTO(struct snd_soc_card *card, int event),
-+
-+	TP_ARGS(card, event)
-+
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_basic,
- 
- 	TP_PROTO(struct snd_soc_card *card),
-@@ -81,6 +113,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_basic, snd_soc_dapm_done,
- 	TP_ARGS(card)
- 
- )
-+#endif
- 
- LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_widget,
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index 120528bf9c..5c86fe4aae 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -1,4 +1,4 @@
-From 878f89b6136ff7b870a19e04901cc6f316bbe10a Mon Sep 17 00:00:00 2001
+From 6618c5537ef5f51f9f321c42797faab3522f30a6 Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Sat, 15 May 2021 10:26:38 -0400
 Subject: [PATCH] src/Kbuild: change missing CONFIG_TRACEPOINTS to warning
@@ -19,10 +19,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  src/Kbuild | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-Index: lttng-modules-2.13.10/src/Kbuild
-===================================================================
---- lttng-modules-2.13.10.orig/src/Kbuild
-+++ lttng-modules-2.13.10/src/Kbuild
+diff --git a/src/Kbuild b/src/Kbuild
+index 7137874..04eb5c9 100644
+--- a/src/Kbuild
++++ b/src/Kbuild
 @@ -2,10 +2,13 @@
  
  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
@@ -38,7 +38,7 @@ Index: lttng-modules-2.13.10/src/Kbuild
  TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))/..
  
  lttng_check_linux_version = $(shell pwd)/include/linux/version.h
-@@ -150,3 +153,5 @@ lttng-statedump-objs := lttng-statedump-
+@@ -150,3 +153,5 @@ lttng-statedump-objs := lttng-statedump-impl.o
  obj-$(CONFIG_LTTNG) += probes/
  obj-$(CONFIG_LTTNG) += lib/
  obj-$(CONFIG_LTTNG) += tests/
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch
deleted file mode 100644
index 6ea10ffc91..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From d8379ec6365a925db33cae94fb6783cdbdb6a922 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 25 Mar 2024 09:40:29 -0400
-Subject: [PATCH 2/4] Fix: ASoC add component to set_bias_level events in linux
- 6.9-rc1
-
-See upstream commit:
-
-    commit 6ef46a69ec32fe1cf56de67742fcd01af4bf48af
-    Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
-    Date:   Wed Mar 6 10:30:00 2024 +0100
-
-        ASoC: trace: add component to set_bias_level trace events
-
-        The snd_soc_bias_level_start and snd_soc_bias_level_done trace events
-        currently look like:
-
-                   aplay-229   [000]  1250.140778: snd_soc_bias_level_start: card=vscn-2046 val=1
-                   aplay-229   [000]  1250.140784: snd_soc_bias_level_done: card=vscn-2046 val=1
-                   aplay-229   [000]  1250.140786: snd_soc_bias_level_start: card=vscn-2046 val=2
-                   aplay-229   [000]  1250.140788: snd_soc_bias_level_done: card=vscn-2046 val=2
-            kworker/u8:1-21    [000]  1250.140871: snd_soc_bias_level_start: card=vscn-2046 val=1
-            kworker/u8:0-11    [000]  1250.140951: snd_soc_bias_level_start: card=vscn-2046 val=1
-            kworker/u8:0-11    [000]  1250.140956: snd_soc_bias_level_done: card=vscn-2046 val=1
-            kworker/u8:0-11    [000]  1250.140959: snd_soc_bias_level_start: card=vscn-2046 val=2
-            kworker/u8:0-11    [000]  1250.140961: snd_soc_bias_level_done: card=vscn-2046 val=2
-            kworker/u8:1-21    [000]  1250.167219: snd_soc_bias_level_done: card=vscn-2046 val=1
-            kworker/u8:1-21    [000]  1250.167222: snd_soc_bias_level_start: card=vscn-2046 val=2
-            kworker/u8:1-21    [000]  1250.167232: snd_soc_bias_level_done: card=vscn-2046 val=2
-            kworker/u8:0-11    [000]  1250.167440: snd_soc_bias_level_start: card=vscn-2046 val=3
-            kworker/u8:0-11    [000]  1250.167444: snd_soc_bias_level_done: card=vscn-2046 val=3
-            kworker/u8:1-21    [000]  1250.167497: snd_soc_bias_level_start: card=vscn-2046 val=3
-            kworker/u8:1-21    [000]  1250.167506: snd_soc_bias_level_done: card=vscn-2046 val=3
-
-        There are clearly multiple calls, one per component, but they cannot be
-        discriminated from each other.
-
-        Change the ftrace events to also print the component name, to make it clear
-        which part of the code is involved. This requires changing the passed value
-        from a struct snd_soc_card, where the DAPM context is not kwown, to a
-        struct snd_soc_dapm_context where it is obviously known but the a card
-        pointer is also available.
-
-        With this change, the resulting trace becomes:
-
-                   aplay-247   [000]  1436.357332: snd_soc_bias_level_start: card=vscn-2046 component=(none) val=1
-                   aplay-247   [000]  1436.357338: snd_soc_bias_level_done: card=vscn-2046 component=(none) val=1
-                   aplay-247   [000]  1436.357340: snd_soc_bias_level_start: card=vscn-2046 component=(none) val=2
-                   aplay-247   [000]  1436.357343: snd_soc_bias_level_done: card=vscn-2046 component=(none) val=2
-            kworker/u8:4-215   [000]  1436.357437: snd_soc_bias_level_start: card=vscn-2046 component=ff560000.codec val=1
-            kworker/u8:5-231   [000]  1436.357518: snd_soc_bias_level_start: card=vscn-2046 component=ff320000.i2s val=1
-            kworker/u8:5-231   [000]  1436.357523: snd_soc_bias_level_done: card=vscn-2046 component=ff320000.i2s val=1
-            kworker/u8:5-231   [000]  1436.357526: snd_soc_bias_level_start: card=vscn-2046 component=ff320000.i2s val=2
-            kworker/u8:5-231   [000]  1436.357528: snd_soc_bias_level_done: card=vscn-2046 component=ff320000.i2s val=2
-            kworker/u8:4-215   [000]  1436.383217: snd_soc_bias_level_done: card=vscn-2046 component=ff560000.codec val=1
-            kworker/u8:4-215   [000]  1436.383221: snd_soc_bias_level_start: card=vscn-2046 component=ff560000.codec val=2
-            kworker/u8:4-215   [000]  1436.383231: snd_soc_bias_level_done: card=vscn-2046 component=ff560000.codec val=2
-            kworker/u8:5-231   [000]  1436.383468: snd_soc_bias_level_start: card=vscn-2046 component=ff320000.i2s val=3
-            kworker/u8:5-231   [000]  1436.383472: snd_soc_bias_level_done: card=vscn-2046 component=ff320000.i2s val=3
-            kworker/u8:4-215   [000]  1436.383503: snd_soc_bias_level_start: card=vscn-2046 component=ff560000.codec val=3
-            kworker/u8:4-215   [000]  1436.383513: snd_soc_bias_level_done: card=vscn-2046 component=ff560000.codec val=3
-
-Upstream-Status: Backport [303434ab Fix: ASoC add component to set_bias_level events in linux 6.9-rc1]
-
-Change-Id: I959f1680c002acdf29828b968d3975247f5433d8
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/asoc.h | 36 +++++++++++++++++++++++++++
- 1 file changed, 36 insertions(+)
-
-Index: lttng-modules-2.13.12/include/instrumentation/events/asoc.h
-===================================================================
---- lttng-modules-2.13.12.orig/include/instrumentation/events/asoc.h
-+++ lttng-modules-2.13.12/include/instrumentation/events/asoc.h
-@@ -10,6 +10,7 @@
- #include <lttng/kernel-version.h>
- 
- #define DAPM_DIRECT "(direct)"
-+#define DAPM_COMPONENT_NONE "(none)"
- 
- #ifndef _TRACE_ASOC_DEF
- #define _TRACE_ASOC_DEF
-@@ -119,6 +120,40 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc
- )
- #endif
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_context,
-+
-+	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
-+
-+	TP_ARGS(dapm, val),
-+
-+	TP_FIELDS(
-+		ctf_string(name, dapm->card->name)
-+		ctf_string(component, dapm->component ? dapm->component->name : DAPM_COMPONENT_NONE)
-+		ctf_integer(int, val, val)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_context, snd_soc_bias_level_start,
-+
-+	asoc_snd_soc_bias_level_start,
-+
-+	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
-+
-+	TP_ARGS(dapm, val)
-+
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_context, snd_soc_bias_level_done,
-+
-+	asoc_snd_soc_bias_level_done,
-+
-+	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
-+
-+	TP_ARGS(dapm, val)
-+
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_card,
- 
- 	TP_PROTO(struct snd_soc_card *card, int val),
-@@ -150,6 +185,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc
- 	TP_ARGS(card, val)
- 
- )
-+#endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_basic,
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch
deleted file mode 100644
index 66c48ebe8f..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From f4a6415f8d5fa447868d1fdc7119e0a328966379 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 25 Mar 2024 10:30:32 -0400
-Subject: [PATCH 3/4] Fix: mm_compaction_migratepages changed in linux 6.9-rc1
-
-See upstream commit:
-
-    commit ab755bf4249b992fc2140d615ab0a686d50765b4
-    Author: Baolin Wang <baolin.wang@linux.alibaba.com>
-    Date:   Tue Feb 20 14:16:31 2024 +0800
-
-        mm: compaction: update the cc->nr_migratepages when allocating or freeing the freepages
-
-        Currently we will use 'cc->nr_freepages >= cc->nr_migratepages' comparison
-        to ensure that enough freepages are isolated in isolate_freepages(),
-        however it just decreases the cc->nr_freepages without updating
-        cc->nr_migratepages in compaction_alloc(), which will waste more CPU
-        cycles and cause too many freepages to be isolated.
-
-        So we should also update the cc->nr_migratepages when allocating or
-        freeing the freepages to avoid isolating excess freepages.  And I can see
-        fewer free pages are scanned and isolated when running thpcompact on my
-        Arm64 server:
-
-                                               k6.7         k6.7_patched
-        Ops Compaction pages isolated      120692036.00   118160797.00
-        Ops Compaction migrate scanned     131210329.00   154093268.00
-        Ops Compaction free scanned       1090587971.00  1080632536.00
-        Ops Compact scan efficiency               12.03          14.26
-
-        Moreover, I did not see an obvious latency improvements, this is likely
-        because isolating freepages is not the bottleneck in the thpcompact test
-        case.
-
-                                      k6.7                  k6.7_patched
-        Amean     fault-both-1      1089.76 (   0.00%)     1080.16 *   0.88%*
-        Amean     fault-both-3      1616.48 (   0.00%)     1636.65 *  -1.25%*
-        Amean     fault-both-5      2266.66 (   0.00%)     2219.20 *   2.09%*
-        Amean     fault-both-7      2909.84 (   0.00%)     2801.90 *   3.71%*
-        Amean     fault-both-12     4861.26 (   0.00%)     4733.25 *   2.63%*
-        Amean     fault-both-18     7351.11 (   0.00%)     6950.51 *   5.45%*
-        Amean     fault-both-24     9059.30 (   0.00%)     9159.99 *  -1.11%*
-        Amean     fault-both-30    10685.68 (   0.00%)    11399.02 *  -6.68%*
-
-Upstream-Status: Backport [175fe77c Fix: mm_compaction_migratepages changed in linux 6.9-rc1]
-
-Change-Id: I103a43fd1b549360b3fc978fd409b7c17ef3e192
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/compaction.h | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
-
-Index: lttng-modules-2.13.12/include/instrumentation/events/compaction.h
-===================================================================
---- lttng-modules-2.13.12.orig/include/instrumentation/events/compaction.h
-+++ lttng-modules-2.13.12/include/instrumentation/events/compaction.h
-@@ -97,7 +97,22 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(comp
- 
- #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0) || \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
-+
-+	compaction_migratepages,
-+
-+	TP_PROTO(unsigned int nr_migratepages,
-+		unsigned int nr_succeeded),
-+
-+	TP_ARGS(nr_migratepages, nr_succeeded),
-+
-+	TP_FIELDS(
-+		ctf_integer(unsigned long, nr_migrated, nr_succeeded)
-+		ctf_integer(unsigned long, nr_failed, nr_migratepages - nr_succeeded)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0) || \
-     LTTNG_RHEL_KERNEL_RANGE(5,14,0,163,0,0, 5,15,0,0,0,0))
- LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
- 
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch
deleted file mode 100644
index 59ef4f9313..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 217bc2e4685050dddce9bdd2557b64f6b8c16622 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 25 Mar 2024 10:53:46 -0400
-Subject: [PATCH 4/4] Fix: dev_base_lock removed in linux 6.9-rc1
-
-See upstream commit:
-
-    commit 1b3ef46cb7f2618cc0b507393220a69810f6da12
-    Author: Eric Dumazet <edumazet@google.com>
-    Date:   Tue Feb 13 06:32:45 2024 +0000
-
-        net: remove dev_base_lock
-
-        dev_base_lock is not needed anymore, all remaining users also hold RTNL.
-
-Upstream-Status: Backport [52eb2ee9 Fix: dev_base_lock removed in linux 6.9-rc1]
-
-Change-Id: I6b07e6eed07fd398302ca14d23162ed24d74df15
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- src/lttng-statedump-impl.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-Index: lttng-modules-2.13.12/src/lttng-statedump-impl.c
-===================================================================
---- lttng-modules-2.13.12.orig/src/lttng-statedump-impl.c
-+++ lttng-modules-2.13.12/src/lttng-statedump-impl.c
-@@ -392,6 +392,20 @@ void lttng_enumerate_device(struct lttng
- 	}
- }
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
-+static
-+int lttng_enumerate_network_ip_interface(struct lttng_kernel_session *session)
-+{
-+	struct net_device *dev;
-+
-+	rtnl_lock();
-+	for_each_netdev(&init_net, dev)
-+		lttng_enumerate_device(session, dev);
-+	rtnl_unlock();
-+
-+	return 0;
-+}
-+#else
- static
- int lttng_enumerate_network_ip_interface(struct lttng_kernel_session *session)
- {
-@@ -404,6 +418,7 @@ int lttng_enumerate_network_ip_interface
- 
- 	return 0;
- }
-+#endif /* (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0)) */
- #else /* CONFIG_INET */
- static inline
- int lttng_enumerate_network_ip_interface(struct lttng_kernel_session *session)
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
similarity index 77%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
index 95d5e2d615..0f05622bd4 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
@@ -10,16 +10,13 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch \
-           file://0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch \
-           file://0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch \
-           file://0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch \
-        "
+           file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
+           "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "d85fcb66c7bd31003ab8735e8c77700e5e4f417b4c22fe1f20112cf435abad79"
+SRC_URI[sha256sum] = "7d26c07a5e80b66aa7bdcfdaaf4857f00fc9a5cdde79226b2528676700d50228"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.44.0


--===============3347683818024703303==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-modules-upgrade-2.13.12-2.13.13.patch"

RnJvbSBmNmQ3ZmYyZTAyYmVjZTc0MGMxN2UxMTU0MjdkYTRjMjM5YjFjNGExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTU6MTQ6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHRuZy1tb2R1bGVzOiB1cGdyYWRlIDIuMTMuMTIgLT4gMi4xMy4xMwoKLS0tCiAuLi54LUFTb0Mt
c25kX2RvY19kYXBtLW9uLWxpbnV4LTYuOS1yYzEucGF0Y2ggfCAgOTMgLS0tLS0tLS0tLS0tCiAu
Li5lLW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdhcm4ucGF0Y2ggfCAgMTIgKy0KIC4u
LnBvbmVudC10by1zZXRfYmlhc19sZXZlbC1ldmVudHMtaW4tbC5wYXRjaCB8IDEzMiAtLS0tLS0t
LS0tLS0tLS0tLS0KIC4uLm5fbWlncmF0ZXBhZ2VzLWNoYW5nZWQtaW4tbGludXgtNi45LS5wYXRj
aCB8ICA4MSAtLS0tLS0tLS0tLQogLi4udl9iYXNlX2xvY2stcmVtb3ZlZC1pbi1saW51eC02Ljkt
cmMxLnBhdGNoIHwgIDU3IC0tLS0tLS0tCiAuLi5lc18yLjEzLjEyLmJiID0+IGx0dG5nLW1vZHVs
ZXNfMi4xMy4xMy5iYn0gfCAgIDkgKy0KIDYgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAzNzUgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWtlcm5l
bC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDEtRml4LUFTb0Mtc25kX2RvY19kYXBtLW9uLWxpbnV4
LTYuOS1yYzEucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2x0dG5nLW1vZHVsZXMvMDAwMi1GaXgtQVNvQy1hZGQtY29tcG9uZW50LXRvLXNldF9iaWFz
X2xldmVsLWV2ZW50cy1pbi1sLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDMtRml4LW1tX2NvbXBhY3Rpb25fbWlncmF0
ZXBhZ2VzLWNoYW5nZWQtaW4tbGludXgtNi45LS5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1l
dGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDA0LUZpeC1kZXZfYmFzZV9s
b2NrLXJlbW92ZWQtaW4tbGludXgtNi45LXJjMS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1r
ZXJuZWwvbHR0bmcve2x0dG5nLW1vZHVsZXNfMi4xMy4xMi5iYiA9PiBsdHRuZy1tb2R1bGVzXzIu
MTMuMTMuYmJ9ICg3NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9s
dHRuZy1tb2R1bGVzLzAwMDEtRml4LUFTb0Mtc25kX2RvY19kYXBtLW9uLWxpbnV4LTYuOS1yYzEu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMS1GaXgt
QVNvQy1zbmRfZG9jX2RhcG0tb24tbGludXgtNi45LXJjMS5wYXRjaApkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggOWQ1ZmQwZGU2MC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
a2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMS1GaXgtQVNvQy1zbmRfZG9jX2RhcG0tb24t
bGludXgtNi45LXJjMS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDkzICswLDAgQEAKLUZyb20g
ZmVjMDA3ZDk2MzBlMDEwMDYyY2Y1Njk5YTA4NDYwZjcxZjQ2YjUyNyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKLUZyb206IEtpZW5hbiBTdGV3YXJ0IDxrc3Rld2FydEBlZmZpY2lvcy5jb20+Ci1E
YXRlOiBNb24sIDI1IE1hciAyMDI0IDA4OjU0OjQyIC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0ggMS80
XSBGaXg6IEFTb0Mgc25kX2RvY19kYXBtIG9uIGxpbnV4IDYuOS1yYzEKLQotU2VlIHVwc3RyZWFt
IGNvbW1pdDoKLQotICAgIGNvbW1pdCA3ZGYzZWI0Y2RiNmJiZmE0ODJmNTE1NDhiOWZkNDdjMjcy
M2M2OGJhCi0gICAgQXV0aG9yOiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4u
Y29tPgotICAgIERhdGU6ICAgV2VkIE1hciA2IDEwOjMwOjAxIDIwMjQgKzAxMDAKLQotICAgICAg
ICBBU29DOiB0cmFjZTogYWRkIGV2ZW50IHRvIHNuZF9zb2NfZGFwbSB0cmFjZSBldmVudHMKLQot
ICAgICAgICBBZGQgdGhlIGV2ZW50IHZhbHVlIHRvIHRoZSBzbmRfc29jX2RhcG1fc3RhcnQgYW5k
IHNuZF9zb2NfZGFwbV9kb25lIHRyYWNlCi0gICAgICAgIGV2ZW50cyB0byBtYWtlIHRoZW0gbW9y
ZSBpbmZvcm1hdGl2ZS4KLQotICAgICAgICBUcmFjZSBiZWZvcmU6Ci0KLSAgICAgICAgICAgICAg
ICAgICBhcGxheS0yMjkgICBbMDAwXSAgIDI1MC4xNDAzMDk6IHNuZF9zb2NfZGFwbV9zdGFydDog
ICBjYXJkPXZzY24tMjA0NgotICAgICAgICAgICAgICAgICAgIGFwbGF5LTIyOSAgIFswMDBdICAg
MjUwLjE2NzUzMTogc25kX3NvY19kYXBtX2RvbmU6ICAgIGNhcmQ9dnNjbi0yMDQ2Ci0gICAgICAg
ICAgICAgICAgICAgYXBsYXktMjI5ICAgWzAwMF0gICAyNTEuMTY5NTg4OiBzbmRfc29jX2RhcG1f
c3RhcnQ6ICAgY2FyZD12c2NuLTIwNDYKLSAgICAgICAgICAgICAgICAgICBhcGxheS0yMjkgICBb
MDAwXSAgIDI1MS4xOTUyNDU6IHNuZF9zb2NfZGFwbV9kb25lOiAgICBjYXJkPXZzY24tMjA0Ngot
Ci0gICAgICAgIFRyYWNlIGFmdGVyOgotCi0gICAgICAgICAgICAgICAgICAgYXBsYXktMjE0ICAg
WzAwMF0gICA2OTMuMjkwNjEyOiBzbmRfc29jX2RhcG1fc3RhcnQ6ICAgY2FyZD12c2NuLTIwNDYg
ZXZlbnQ9MQotICAgICAgICAgICAgICAgICAgIGFwbGF5LTIxNCAgIFswMDBdICAgNjkzLjMxNTUw
ODogc25kX3NvY19kYXBtX2RvbmU6ICAgIGNhcmQ9dnNjbi0yMDQ2IGV2ZW50PTEKLSAgICAgICAg
ICAgICAgICAgICBhcGxheS0yMTQgICBbMDAwXSAgIDY5NC41MzczNDk6IHNuZF9zb2NfZGFwbV9z
dGFydDogICBjYXJkPXZzY24tMjA0NiBldmVudD0yCi0gICAgICAgICAgICAgICAgICAgYXBsYXkt
MjE0ICAgWzAwMF0gICA2OTQuNTYzMjQxOiBzbmRfc29jX2RhcG1fZG9uZTogICAgY2FyZD12c2Nu
LTIwNDYgZXZlbnQ9MgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFs4OGM0ZTBmZSBGaXg6
IEFTb0Mgc25kX2RvY19kYXBtIG9uIGxpbnV4IDYuOS1yYzFdCi0KLUNoYW5nZS1JZDogSWYwZDMz
NTQ0YjhkZDFkZmIzZDEyY2E5MzkwODkyMTkwZmMwNDQ0YjAKLVNpZ25lZC1vZmYtYnk6IEtpZW5h
biBTdGV3YXJ0IDxrc3Rld2FydEBlZmZpY2lvcy5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBNYXRoaWV1
IERlc25veWVycyA8bWF0aGlldS5kZXNub3llcnNAZWZmaWNpb3MuY29tPgotLS0tCi0gaW5jbHVk
ZS9pbnN0cnVtZW50YXRpb24vZXZlbnRzL2Fzb2MuaCB8IDMzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKwotIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQg
YS9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMvYXNvYy5oIGIvaW5jbHVkZS9pbnN0cnVt
ZW50YXRpb24vZXZlbnRzL2Fzb2MuaAotaW5kZXggMjFkMTNhMGYuLjUxMjZkNGMxIDEwMDY0NAot
LS0tIGEvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24vZXZlbnRzL2Fzb2MuaAotKysrIGIvaW5jbHVk
ZS9pbnN0cnVtZW50YXRpb24vZXZlbnRzL2Fzb2MuaAotQEAgLTUxLDYgKzUxLDM4IEBAIExUVE5H
X1RSQUNFUE9JTlRfRVZFTlRfSU5TVEFOQ0VfTUFQKGFzb2Nfc25kX3NvY19jYXJkLCBzbmRfc29j
X2JpYXNfbGV2ZWxfZG9uZSwKLSAKLSApCi0gCi0rI2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NP
REUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNiw5LDApKQotK0xUVE5HX1RSQUNFUE9JTlRfRVZF
TlRfQ0xBU1MoYXNvY19zbmRfc29jX2RhcG1fYmFzaWMsCi0rCi0rCVRQX1BST1RPKHN0cnVjdCBz
bmRfc29jX2NhcmQgKmNhcmQsIGludCBldmVudCksCi0rCi0rCVRQX0FSR1MoY2FyZCwgZXZlbnQp
LAotKwotKwlUUF9GSUVMRFMoCi0rCQljdGZfc3RyaW5nKG5hbWUsIGNhcmQtPm5hbWUpCi0rCQlj
dGZfaW50ZWdlcihpbnQsIGV2ZW50LCBldmVudCkKLSsJKQotKykKLStMVFROR19UUkFDRVBPSU5U
X0VWRU5UX0lOU1RBTkNFX01BUChhc29jX3NuZF9zb2NfZGFwbV9iYXNpYywgc25kX3NvY19kYXBt
X3N0YXJ0LAotKwotKwlhc29jX3NuZF9zb2NfZGFwbV9zdGFydCwKLSsKLSsJVFBfUFJPVE8oc3Ry
dWN0IHNuZF9zb2NfY2FyZCAqY2FyZCwgaW50IGV2ZW50KSwKLSsKLSsJVFBfQVJHUyhjYXJkLCBl
dmVudCkKLSsKLSspCi0rCi0rTFRUTkdfVFJBQ0VQT0lOVF9FVkVOVF9JTlNUQU5DRV9NQVAoYXNv
Y19zbmRfc29jX2RhcG1fYmFzaWMsIHNuZF9zb2NfZGFwbV9kb25lLAotKwotKwlhc29jX3NuZF9z
b2NfZGFwbV9kb25lLAotKwotKwlUUF9QUk9UTyhzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkLCBp
bnQgZXZlbnQpLAotKwotKwlUUF9BUkdTKGNhcmQsIGV2ZW50KQotKwotKykKLSsjZWxzZQotIExU
VE5HX1RSQUNFUE9JTlRfRVZFTlRfQ0xBU1MoYXNvY19zbmRfc29jX2RhcG1fYmFzaWMsCi0gCi0g
CVRQX1BST1RPKHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQpLAotQEAgLTgxLDYgKzExMyw3IEBA
IExUVE5HX1RSQUNFUE9JTlRfRVZFTlRfSU5TVEFOQ0VfTUFQKGFzb2Nfc25kX3NvY19kYXBtX2Jh
c2ljLCBzbmRfc29jX2RhcG1fZG9uZSwKLSAJVFBfQVJHUyhjYXJkKQotIAotICkKLSsjZW5kaWYK
LSAKLSBMVFROR19UUkFDRVBPSU5UX0VWRU5UX0NMQVNTKGFzb2Nfc25kX3NvY19kYXBtX3dpZGdl
dCwKLSAKLS0tIAotMi4zOS4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0
bmcvbHR0bmctbW9kdWxlcy8wMDAxLXNyYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklHX1RS
QUNFUE9JTlRTLXRvLXdhcm4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5n
LW1vZHVsZXMvMDAwMS1zcmMtS2J1aWxkLWNoYW5nZS1taXNzaW5nLUNPTkZJR19UUkFDRVBPSU5U
Uy10by13YXJuLnBhdGNoCmluZGV4IDEyMDUyOGJmOWMuLjVjODZmZTRhYWUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAxLXNyYy1LYnVpbGQt
Y2hhbmdlLW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdhcm4ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDEtc3JjLUtidWlsZC1jaGFu
Z2UtbWlzc2luZy1DT05GSUdfVFJBQ0VQT0lOVFMtdG8td2Fybi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gODc4Zjg5YjYxMzZmZjdiODcwYTE5ZTA0OTAxY2M2ZjMxNmJiZTEwYSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjYxOGM1NTM3ZWY1ZjUxZjlmMzIxYzQyNzk3ZmFhYjM1
MjJmMzBhNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJydWNlIEFzaGZpZWxkIDxi
cnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDE1IE1heSAyMDIxIDEwOjI2OjM4
IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy9LYnVpbGQ6IGNoYW5nZSBtaXNzaW5nIENPTkZJ
R19UUkFDRVBPSU5UUyB0byB3YXJuaW5nCkBAIC0xOSwxMCArMTksMTAgQEAgU2lnbmVkLW9mZi1i
eTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4KICBzcmMvS2J1aWxk
IHwgNyArKysrKystCiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQogCi1JbmRleDogbHR0bmctbW9kdWxlcy0yLjEzLjEwL3NyYy9LYnVpbGQKLT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KLS0tLSBsdHRuZy1tb2R1bGVzLTIuMTMuMTAub3JpZy9zcmMvS2J1aWxkCi0rKysgbHR0bmct
bW9kdWxlcy0yLjEzLjEwL3NyYy9LYnVpbGQKK2RpZmYgLS1naXQgYS9zcmMvS2J1aWxkIGIvc3Jj
L0tidWlsZAoraW5kZXggNzEzNzg3NC4uMDRlYjVjOSAxMDA2NDQKKy0tLSBhL3NyYy9LYnVpbGQK
KysrKyBiL3NyYy9LYnVpbGQKIEBAIC0yLDEwICsyLDEzIEBACiAgCiAgaWZkZWYgQ09ORklHX0xP
Q0FMVkVSU0lPTgkjIENoZWNrIGlmIGRvdC1jb25maWcgaXMgaW5jbHVkZWQuCkBAIC0zOCw3ICsz
OCw3IEBAIEluZGV4OiBsdHRuZy1tb2R1bGVzLTIuMTMuMTAvc3JjL0tidWlsZAogIFRPUF9MVFRO
R19NT0RVTEVTX0RJUiA6PSAkKHNoZWxsIGRpcm5hbWUgJChsYXN0d29yZCAkKE1BS0VGSUxFX0xJ
U1QpKSkvLi4KICAKICBsdHRuZ19jaGVja19saW51eF92ZXJzaW9uID0gJChzaGVsbCBwd2QpL2lu
Y2x1ZGUvbGludXgvdmVyc2lvbi5oCi1AQCAtMTUwLDMgKzE1Myw1IEBAIGx0dG5nLXN0YXRlZHVt
cC1vYmpzIDo9IGx0dG5nLXN0YXRlZHVtcC0KK0BAIC0xNTAsMyArMTUzLDUgQEAgbHR0bmctc3Rh
dGVkdW1wLW9ianMgOj0gbHR0bmctc3RhdGVkdW1wLWltcGwubwogIG9iai0kKENPTkZJR19MVFRO
RykgKz0gcHJvYmVzLwogIG9iai0kKENPTkZJR19MVFRORykgKz0gbGliLwogIG9iai0kKENPTkZJ
R19MVFRORykgKz0gdGVzdHMvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5n
L2x0dG5nLW1vZHVsZXMvMDAwMi1GaXgtQVNvQy1hZGQtY29tcG9uZW50LXRvLXNldF9iaWFzX2xl
dmVsLWV2ZW50cy1pbi1sLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1t
b2R1bGVzLzAwMDItRml4LUFTb0MtYWRkLWNvbXBvbmVudC10by1zZXRfYmlhc19sZXZlbC1ldmVu
dHMtaW4tbC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNmVhMTBmZmM5MS4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMv
MDAwMi1GaXgtQVNvQy1hZGQtY29tcG9uZW50LXRvLXNldF9iaWFzX2xldmVsLWV2ZW50cy1pbi1s
LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTMyICswLDAgQEAKLUZyb20gZDgzNzllYzYzNjVh
OTI1ZGIzM2NhZTk0ZmI2NzgzY2RiZGI2YTkyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZy
b206IEtpZW5hbiBTdGV3YXJ0IDxrc3Rld2FydEBlZmZpY2lvcy5jb20+Ci1EYXRlOiBNb24sIDI1
IE1hciAyMDI0IDA5OjQwOjI5IC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0ggMi80XSBGaXg6IEFTb0Mg
YWRkIGNvbXBvbmVudCB0byBzZXRfYmlhc19sZXZlbCBldmVudHMgaW4gbGludXgKLSA2LjktcmMx
Ci0KLVNlZSB1cHN0cmVhbSBjb21taXQ6Ci0KLSAgICBjb21taXQgNmVmNDZhNjllYzMyZmUxY2Y1
NmRlNjc3NDJmY2QwMWFmNGJmNDhhZgotICAgIEF1dGhvcjogTHVjYSBDZXJlc29saSA8bHVjYS5j
ZXJlc29saUBib290bGluLmNvbT4KLSAgICBEYXRlOiAgIFdlZCBNYXIgNiAxMDozMDowMCAyMDI0
ICswMTAwCi0KLSAgICAgICAgQVNvQzogdHJhY2U6IGFkZCBjb21wb25lbnQgdG8gc2V0X2JpYXNf
bGV2ZWwgdHJhY2UgZXZlbnRzCi0KLSAgICAgICAgVGhlIHNuZF9zb2NfYmlhc19sZXZlbF9zdGFy
dCBhbmQgc25kX3NvY19iaWFzX2xldmVsX2RvbmUgdHJhY2UgZXZlbnRzCi0gICAgICAgIGN1cnJl
bnRseSBsb29rIGxpa2U6Ci0KLSAgICAgICAgICAgICAgICAgICBhcGxheS0yMjkgICBbMDAwXSAg
MTI1MC4xNDA3Nzg6IHNuZF9zb2NfYmlhc19sZXZlbF9zdGFydDogY2FyZD12c2NuLTIwNDYgdmFs
PTEKLSAgICAgICAgICAgICAgICAgICBhcGxheS0yMjkgICBbMDAwXSAgMTI1MC4xNDA3ODQ6IHNu
ZF9zb2NfYmlhc19sZXZlbF9kb25lOiBjYXJkPXZzY24tMjA0NiB2YWw9MQotICAgICAgICAgICAg
ICAgICAgIGFwbGF5LTIyOSAgIFswMDBdICAxMjUwLjE0MDc4Njogc25kX3NvY19iaWFzX2xldmVs
X3N0YXJ0OiBjYXJkPXZzY24tMjA0NiB2YWw9MgotICAgICAgICAgICAgICAgICAgIGFwbGF5LTIy
OSAgIFswMDBdICAxMjUwLjE0MDc4ODogc25kX3NvY19iaWFzX2xldmVsX2RvbmU6IGNhcmQ9dnNj
bi0yMDQ2IHZhbD0yCi0gICAgICAgICAgICBrd29ya2VyL3U4OjEtMjEgICAgWzAwMF0gIDEyNTAu
MTQwODcxOiBzbmRfc29jX2JpYXNfbGV2ZWxfc3RhcnQ6IGNhcmQ9dnNjbi0yMDQ2IHZhbD0xCi0g
ICAgICAgICAgICBrd29ya2VyL3U4OjAtMTEgICAgWzAwMF0gIDEyNTAuMTQwOTUxOiBzbmRfc29j
X2JpYXNfbGV2ZWxfc3RhcnQ6IGNhcmQ9dnNjbi0yMDQ2IHZhbD0xCi0gICAgICAgICAgICBrd29y
a2VyL3U4OjAtMTEgICAgWzAwMF0gIDEyNTAuMTQwOTU2OiBzbmRfc29jX2JpYXNfbGV2ZWxfZG9u
ZTogY2FyZD12c2NuLTIwNDYgdmFsPTEKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6MC0xMSAgICBb
MDAwXSAgMTI1MC4xNDA5NTk6IHNuZF9zb2NfYmlhc19sZXZlbF9zdGFydDogY2FyZD12c2NuLTIw
NDYgdmFsPTIKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6MC0xMSAgICBbMDAwXSAgMTI1MC4xNDA5
NjE6IHNuZF9zb2NfYmlhc19sZXZlbF9kb25lOiBjYXJkPXZzY24tMjA0NiB2YWw9MgotICAgICAg
ICAgICAga3dvcmtlci91ODoxLTIxICAgIFswMDBdICAxMjUwLjE2NzIxOTogc25kX3NvY19iaWFz
X2xldmVsX2RvbmU6IGNhcmQ9dnNjbi0yMDQ2IHZhbD0xCi0gICAgICAgICAgICBrd29ya2VyL3U4
OjEtMjEgICAgWzAwMF0gIDEyNTAuMTY3MjIyOiBzbmRfc29jX2JpYXNfbGV2ZWxfc3RhcnQ6IGNh
cmQ9dnNjbi0yMDQ2IHZhbD0yCi0gICAgICAgICAgICBrd29ya2VyL3U4OjEtMjEgICAgWzAwMF0g
IDEyNTAuMTY3MjMyOiBzbmRfc29jX2JpYXNfbGV2ZWxfZG9uZTogY2FyZD12c2NuLTIwNDYgdmFs
PTIKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6MC0xMSAgICBbMDAwXSAgMTI1MC4xNjc0NDA6IHNu
ZF9zb2NfYmlhc19sZXZlbF9zdGFydDogY2FyZD12c2NuLTIwNDYgdmFsPTMKLSAgICAgICAgICAg
IGt3b3JrZXIvdTg6MC0xMSAgICBbMDAwXSAgMTI1MC4xNjc0NDQ6IHNuZF9zb2NfYmlhc19sZXZl
bF9kb25lOiBjYXJkPXZzY24tMjA0NiB2YWw9MwotICAgICAgICAgICAga3dvcmtlci91ODoxLTIx
ICAgIFswMDBdICAxMjUwLjE2NzQ5Nzogc25kX3NvY19iaWFzX2xldmVsX3N0YXJ0OiBjYXJkPXZz
Y24tMjA0NiB2YWw9MwotICAgICAgICAgICAga3dvcmtlci91ODoxLTIxICAgIFswMDBdICAxMjUw
LjE2NzUwNjogc25kX3NvY19iaWFzX2xldmVsX2RvbmU6IGNhcmQ9dnNjbi0yMDQ2IHZhbD0zCi0K
LSAgICAgICAgVGhlcmUgYXJlIGNsZWFybHkgbXVsdGlwbGUgY2FsbHMsIG9uZSBwZXIgY29tcG9u
ZW50LCBidXQgdGhleSBjYW5ub3QgYmUKLSAgICAgICAgZGlzY3JpbWluYXRlZCBmcm9tIGVhY2gg
b3RoZXIuCi0KLSAgICAgICAgQ2hhbmdlIHRoZSBmdHJhY2UgZXZlbnRzIHRvIGFsc28gcHJpbnQg
dGhlIGNvbXBvbmVudCBuYW1lLCB0byBtYWtlIGl0IGNsZWFyCi0gICAgICAgIHdoaWNoIHBhcnQg
b2YgdGhlIGNvZGUgaXMgaW52b2x2ZWQuIFRoaXMgcmVxdWlyZXMgY2hhbmdpbmcgdGhlIHBhc3Nl
ZCB2YWx1ZQotICAgICAgICBmcm9tIGEgc3RydWN0IHNuZF9zb2NfY2FyZCwgd2hlcmUgdGhlIERB
UE0gY29udGV4dCBpcyBub3Qga3dvd24sIHRvIGEKLSAgICAgICAgc3RydWN0IHNuZF9zb2NfZGFw
bV9jb250ZXh0IHdoZXJlIGl0IGlzIG9idmlvdXNseSBrbm93biBidXQgdGhlIGEgY2FyZAotICAg
ICAgICBwb2ludGVyIGlzIGFsc28gYXZhaWxhYmxlLgotCi0gICAgICAgIFdpdGggdGhpcyBjaGFu
Z2UsIHRoZSByZXN1bHRpbmcgdHJhY2UgYmVjb21lczoKLQotICAgICAgICAgICAgICAgICAgIGFw
bGF5LTI0NyAgIFswMDBdICAxNDM2LjM1NzMzMjogc25kX3NvY19iaWFzX2xldmVsX3N0YXJ0OiBj
YXJkPXZzY24tMjA0NiBjb21wb25lbnQ9KG5vbmUpIHZhbD0xCi0gICAgICAgICAgICAgICAgICAg
YXBsYXktMjQ3ICAgWzAwMF0gIDE0MzYuMzU3MzM4OiBzbmRfc29jX2JpYXNfbGV2ZWxfZG9uZTog
Y2FyZD12c2NuLTIwNDYgY29tcG9uZW50PShub25lKSB2YWw9MQotICAgICAgICAgICAgICAgICAg
IGFwbGF5LTI0NyAgIFswMDBdICAxNDM2LjM1NzM0MDogc25kX3NvY19iaWFzX2xldmVsX3N0YXJ0
OiBjYXJkPXZzY24tMjA0NiBjb21wb25lbnQ9KG5vbmUpIHZhbD0yCi0gICAgICAgICAgICAgICAg
ICAgYXBsYXktMjQ3ICAgWzAwMF0gIDE0MzYuMzU3MzQzOiBzbmRfc29jX2JpYXNfbGV2ZWxfZG9u
ZTogY2FyZD12c2NuLTIwNDYgY29tcG9uZW50PShub25lKSB2YWw9MgotICAgICAgICAgICAga3dv
cmtlci91ODo0LTIxNSAgIFswMDBdICAxNDM2LjM1NzQzNzogc25kX3NvY19iaWFzX2xldmVsX3N0
YXJ0OiBjYXJkPXZzY24tMjA0NiBjb21wb25lbnQ9ZmY1NjAwMDAuY29kZWMgdmFsPTEKLSAgICAg
ICAgICAgIGt3b3JrZXIvdTg6NS0yMzEgICBbMDAwXSAgMTQzNi4zNTc1MTg6IHNuZF9zb2NfYmlh
c19sZXZlbF9zdGFydDogY2FyZD12c2NuLTIwNDYgY29tcG9uZW50PWZmMzIwMDAwLmkycyB2YWw9
MQotICAgICAgICAgICAga3dvcmtlci91ODo1LTIzMSAgIFswMDBdICAxNDM2LjM1NzUyMzogc25k
X3NvY19iaWFzX2xldmVsX2RvbmU6IGNhcmQ9dnNjbi0yMDQ2IGNvbXBvbmVudD1mZjMyMDAwMC5p
MnMgdmFsPTEKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6NS0yMzEgICBbMDAwXSAgMTQzNi4zNTc1
MjY6IHNuZF9zb2NfYmlhc19sZXZlbF9zdGFydDogY2FyZD12c2NuLTIwNDYgY29tcG9uZW50PWZm
MzIwMDAwLmkycyB2YWw9MgotICAgICAgICAgICAga3dvcmtlci91ODo1LTIzMSAgIFswMDBdICAx
NDM2LjM1NzUyODogc25kX3NvY19iaWFzX2xldmVsX2RvbmU6IGNhcmQ9dnNjbi0yMDQ2IGNvbXBv
bmVudD1mZjMyMDAwMC5pMnMgdmFsPTIKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6NC0yMTUgICBb
MDAwXSAgMTQzNi4zODMyMTc6IHNuZF9zb2NfYmlhc19sZXZlbF9kb25lOiBjYXJkPXZzY24tMjA0
NiBjb21wb25lbnQ9ZmY1NjAwMDAuY29kZWMgdmFsPTEKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6
NC0yMTUgICBbMDAwXSAgMTQzNi4zODMyMjE6IHNuZF9zb2NfYmlhc19sZXZlbF9zdGFydDogY2Fy
ZD12c2NuLTIwNDYgY29tcG9uZW50PWZmNTYwMDAwLmNvZGVjIHZhbD0yCi0gICAgICAgICAgICBr
d29ya2VyL3U4OjQtMjE1ICAgWzAwMF0gIDE0MzYuMzgzMjMxOiBzbmRfc29jX2JpYXNfbGV2ZWxf
ZG9uZTogY2FyZD12c2NuLTIwNDYgY29tcG9uZW50PWZmNTYwMDAwLmNvZGVjIHZhbD0yCi0gICAg
ICAgICAgICBrd29ya2VyL3U4OjUtMjMxICAgWzAwMF0gIDE0MzYuMzgzNDY4OiBzbmRfc29jX2Jp
YXNfbGV2ZWxfc3RhcnQ6IGNhcmQ9dnNjbi0yMDQ2IGNvbXBvbmVudD1mZjMyMDAwMC5pMnMgdmFs
PTMKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6NS0yMzEgICBbMDAwXSAgMTQzNi4zODM0NzI6IHNu
ZF9zb2NfYmlhc19sZXZlbF9kb25lOiBjYXJkPXZzY24tMjA0NiBjb21wb25lbnQ9ZmYzMjAwMDAu
aTJzIHZhbD0zCi0gICAgICAgICAgICBrd29ya2VyL3U4OjQtMjE1ICAgWzAwMF0gIDE0MzYuMzgz
NTAzOiBzbmRfc29jX2JpYXNfbGV2ZWxfc3RhcnQ6IGNhcmQ9dnNjbi0yMDQ2IGNvbXBvbmVudD1m
ZjU2MDAwMC5jb2RlYyB2YWw9MwotICAgICAgICAgICAga3dvcmtlci91ODo0LTIxNSAgIFswMDBd
ICAxNDM2LjM4MzUxMzogc25kX3NvY19iaWFzX2xldmVsX2RvbmU6IGNhcmQ9dnNjbi0yMDQ2IGNv
bXBvbmVudD1mZjU2MDAwMC5jb2RlYyB2YWw9MwotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0
IFszMDM0MzRhYiBGaXg6IEFTb0MgYWRkIGNvbXBvbmVudCB0byBzZXRfYmlhc19sZXZlbCBldmVu
dHMgaW4gbGludXggNi45LXJjMV0KLQotQ2hhbmdlLUlkOiBJOTU5ZjE2ODBjMDAyYWNkZjI5ODI4
Yjk2OGQzOTc1MjQ3ZjU0MzNkOAotU2lnbmVkLW9mZi1ieTogS2llbmFuIFN0ZXdhcnQgPGtzdGV3
YXJ0QGVmZmljaW9zLmNvbT4KLVNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRo
aWV1LmRlc25veWVyc0BlZmZpY2lvcy5jb20+Ci0tLS0KLSBpbmNsdWRlL2luc3RydW1lbnRhdGlv
bi9ldmVudHMvYXNvYy5oIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrCi0gMSBmaWxl
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKLQotSW5kZXg6IGx0dG5nLW1vZHVsZXMtMi4xMy4x
Mi9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMvYXNvYy5oCi09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0g
bHR0bmctbW9kdWxlcy0yLjEzLjEyLm9yaWcvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24vZXZlbnRz
L2Fzb2MuaAotKysrIGx0dG5nLW1vZHVsZXMtMi4xMy4xMi9pbmNsdWRlL2luc3RydW1lbnRhdGlv
bi9ldmVudHMvYXNvYy5oCi1AQCAtMTAsNiArMTAsNyBAQAotICNpbmNsdWRlIDxsdHRuZy9rZXJu
ZWwtdmVyc2lvbi5oPgotIAotICNkZWZpbmUgREFQTV9ESVJFQ1QgIihkaXJlY3QpIgotKyNkZWZp
bmUgREFQTV9DT01QT05FTlRfTk9ORSAiKG5vbmUpIgotIAotICNpZm5kZWYgX1RSQUNFX0FTT0Nf
REVGCi0gI2RlZmluZSBfVFJBQ0VfQVNPQ19ERUYKLUBAIC0xMTksNiArMTIwLDQwIEBAIExUVE5H
X1RSQUNFUE9JTlRfRVZFTlRfSU5TVEFOQ0VfTUFQKGFzb2MKLSApCi0gI2VuZGlmCi0gCi0rI2lm
IChMVFROR19MSU5VWF9WRVJTSU9OX0NPREUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNiw5LDAp
KQotK0xUVE5HX1RSQUNFUE9JTlRfRVZFTlRfQ0xBU1MoYXNvY19zbmRfc29jX2RhcG1fY29udGV4
dCwKLSsKLSsJVFBfUFJPVE8oc3RydWN0IHNuZF9zb2NfZGFwbV9jb250ZXh0ICpkYXBtLCBpbnQg
dmFsKSwKLSsKLSsJVFBfQVJHUyhkYXBtLCB2YWwpLAotKwotKwlUUF9GSUVMRFMoCi0rCQljdGZf
c3RyaW5nKG5hbWUsIGRhcG0tPmNhcmQtPm5hbWUpCi0rCQljdGZfc3RyaW5nKGNvbXBvbmVudCwg
ZGFwbS0+Y29tcG9uZW50ID8gZGFwbS0+Y29tcG9uZW50LT5uYW1lIDogREFQTV9DT01QT05FTlRf
Tk9ORSkKLSsJCWN0Zl9pbnRlZ2VyKGludCwgdmFsLCB2YWwpCi0rCSkKLSspCi0rCi0rTFRUTkdf
VFJBQ0VQT0lOVF9FVkVOVF9JTlNUQU5DRV9NQVAoYXNvY19zbmRfc29jX2RhcG1fY29udGV4dCwg
c25kX3NvY19iaWFzX2xldmVsX3N0YXJ0LAotKwotKwlhc29jX3NuZF9zb2NfYmlhc19sZXZlbF9z
dGFydCwKLSsKLSsJVFBfUFJPVE8oc3RydWN0IHNuZF9zb2NfZGFwbV9jb250ZXh0ICpkYXBtLCBp
bnQgdmFsKSwKLSsKLSsJVFBfQVJHUyhkYXBtLCB2YWwpCi0rCi0rKQotKwotK0xUVE5HX1RSQUNF
UE9JTlRfRVZFTlRfSU5TVEFOQ0VfTUFQKGFzb2Nfc25kX3NvY19kYXBtX2NvbnRleHQsIHNuZF9z
b2NfYmlhc19sZXZlbF9kb25lLAotKwotKwlhc29jX3NuZF9zb2NfYmlhc19sZXZlbF9kb25lLAot
KwotKwlUUF9QUk9UTyhzdHJ1Y3Qgc25kX3NvY19kYXBtX2NvbnRleHQgKmRhcG0sIGludCB2YWwp
LAotKwotKwlUUF9BUkdTKGRhcG0sIHZhbCkKLSsKLSspCi0rI2Vsc2UKLSBMVFROR19UUkFDRVBP
SU5UX0VWRU5UX0NMQVNTKGFzb2Nfc25kX3NvY19jYXJkLAotIAotIAlUUF9QUk9UTyhzdHJ1Y3Qg
c25kX3NvY19jYXJkICpjYXJkLCBpbnQgdmFsKSwKLUBAIC0xNTAsNiArMTg1LDcgQEAgTFRUTkdf
VFJBQ0VQT0lOVF9FVkVOVF9JTlNUQU5DRV9NQVAoYXNvYwotIAlUUF9BUkdTKGNhcmQsIHZhbCkK
LSAKLSApCi0rI2VuZGlmCi0gCi0gI2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NPREUgPj0gTFRU
TkdfS0VSTkVMX1ZFUlNJT04oNiw5LDApKQotIExUVE5HX1RSQUNFUE9JTlRfRVZFTlRfQ0xBU1Mo
YXNvY19zbmRfc29jX2RhcG1fYmFzaWMsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVs
L2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMy1GaXgtbW1fY29tcGFjdGlvbl9taWdyYXRlcGFnZXMt
Y2hhbmdlZC1pbi1saW51eC02LjktLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9s
dHRuZy1tb2R1bGVzLzAwMDMtRml4LW1tX2NvbXBhY3Rpb25fbWlncmF0ZXBhZ2VzLWNoYW5nZWQt
aW4tbGludXgtNi45LS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNjZjNDhl
YmU4Zi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1v
ZHVsZXMvMDAwMy1GaXgtbW1fY29tcGFjdGlvbl9taWdyYXRlcGFnZXMtY2hhbmdlZC1pbi1saW51
eC02LjktLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsODEgKzAsMCBAQAotRnJvbSBmNGE2NDE1
ZjhkNWZhNDQ3ODY4ZDFmZGM3MTE5ZTBhMzI4OTY2Mzc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQotRnJvbTogS2llbmFuIFN0ZXdhcnQgPGtzdGV3YXJ0QGVmZmljaW9zLmNvbT4KLURhdGU6IE1v
biwgMjUgTWFyIDIwMjQgMTA6MzA6MzIgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSCAzLzRdIEZpeDog
bW1fY29tcGFjdGlvbl9taWdyYXRlcGFnZXMgY2hhbmdlZCBpbiBsaW51eCA2LjktcmMxCi0KLVNl
ZSB1cHN0cmVhbSBjb21taXQ6Ci0KLSAgICBjb21taXQgYWI3NTViZjQyNDliOTkyZmMyMTQwZDYx
NWFiMGE2ODZkNTA3NjViNAotICAgIEF1dGhvcjogQmFvbGluIFdhbmcgPGJhb2xpbi53YW5nQGxp
bnV4LmFsaWJhYmEuY29tPgotICAgIERhdGU6ICAgVHVlIEZlYiAyMCAxNDoxNjozMSAyMDI0ICsw
ODAwCi0KLSAgICAgICAgbW06IGNvbXBhY3Rpb246IHVwZGF0ZSB0aGUgY2MtPm5yX21pZ3JhdGVw
YWdlcyB3aGVuIGFsbG9jYXRpbmcgb3IgZnJlZWluZyB0aGUgZnJlZXBhZ2VzCi0KLSAgICAgICAg
Q3VycmVudGx5IHdlIHdpbGwgdXNlICdjYy0+bnJfZnJlZXBhZ2VzID49IGNjLT5ucl9taWdyYXRl
cGFnZXMnIGNvbXBhcmlzb24KLSAgICAgICAgdG8gZW5zdXJlIHRoYXQgZW5vdWdoIGZyZWVwYWdl
cyBhcmUgaXNvbGF0ZWQgaW4gaXNvbGF0ZV9mcmVlcGFnZXMoKSwKLSAgICAgICAgaG93ZXZlciBp
dCBqdXN0IGRlY3JlYXNlcyB0aGUgY2MtPm5yX2ZyZWVwYWdlcyB3aXRob3V0IHVwZGF0aW5nCi0g
ICAgICAgIGNjLT5ucl9taWdyYXRlcGFnZXMgaW4gY29tcGFjdGlvbl9hbGxvYygpLCB3aGljaCB3
aWxsIHdhc3RlIG1vcmUgQ1BVCi0gICAgICAgIGN5Y2xlcyBhbmQgY2F1c2UgdG9vIG1hbnkgZnJl
ZXBhZ2VzIHRvIGJlIGlzb2xhdGVkLgotCi0gICAgICAgIFNvIHdlIHNob3VsZCBhbHNvIHVwZGF0
ZSB0aGUgY2MtPm5yX21pZ3JhdGVwYWdlcyB3aGVuIGFsbG9jYXRpbmcgb3IKLSAgICAgICAgZnJl
ZWluZyB0aGUgZnJlZXBhZ2VzIHRvIGF2b2lkIGlzb2xhdGluZyBleGNlc3MgZnJlZXBhZ2VzLiAg
QW5kIEkgY2FuIHNlZQotICAgICAgICBmZXdlciBmcmVlIHBhZ2VzIGFyZSBzY2FubmVkIGFuZCBp
c29sYXRlZCB3aGVuIHJ1bm5pbmcgdGhwY29tcGFjdCBvbiBteQotICAgICAgICBBcm02NCBzZXJ2
ZXI6Ci0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgazYu
NyAgICAgICAgIGs2LjdfcGF0Y2hlZAotICAgICAgICBPcHMgQ29tcGFjdGlvbiBwYWdlcyBpc29s
YXRlZCAgICAgIDEyMDY5MjAzNi4wMCAgIDExODE2MDc5Ny4wMAotICAgICAgICBPcHMgQ29tcGFj
dGlvbiBtaWdyYXRlIHNjYW5uZWQgICAgIDEzMTIxMDMyOS4wMCAgIDE1NDA5MzI2OC4wMAotICAg
ICAgICBPcHMgQ29tcGFjdGlvbiBmcmVlIHNjYW5uZWQgICAgICAgMTA5MDU4Nzk3MS4wMCAgMTA4
MDYzMjUzNi4wMAotICAgICAgICBPcHMgQ29tcGFjdCBzY2FuIGVmZmljaWVuY3kgICAgICAgICAg
ICAgICAxMi4wMyAgICAgICAgICAxNC4yNgotCi0gICAgICAgIE1vcmVvdmVyLCBJIGRpZCBub3Qg
c2VlIGFuIG9idmlvdXMgbGF0ZW5jeSBpbXByb3ZlbWVudHMsIHRoaXMgaXMgbGlrZWx5Ci0gICAg
ICAgIGJlY2F1c2UgaXNvbGF0aW5nIGZyZWVwYWdlcyBpcyBub3QgdGhlIGJvdHRsZW5lY2sgaW4g
dGhlIHRocGNvbXBhY3QgdGVzdAotICAgICAgICBjYXNlLgotCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGs2LjcgICAgICAgICAgICAgICAgICBrNi43X3BhdGNoZWQKLSAg
ICAgICAgQW1lYW4gICAgIGZhdWx0LWJvdGgtMSAgICAgIDEwODkuNzYgKCAgIDAuMDAlKSAgICAg
MTA4MC4xNiAqICAgMC44OCUqCi0gICAgICAgIEFtZWFuICAgICBmYXVsdC1ib3RoLTMgICAgICAx
NjE2LjQ4ICggICAwLjAwJSkgICAgIDE2MzYuNjUgKiAgLTEuMjUlKgotICAgICAgICBBbWVhbiAg
ICAgZmF1bHQtYm90aC01ICAgICAgMjI2Ni42NiAoICAgMC4wMCUpICAgICAyMjE5LjIwICogICAy
LjA5JSoKLSAgICAgICAgQW1lYW4gICAgIGZhdWx0LWJvdGgtNyAgICAgIDI5MDkuODQgKCAgIDAu
MDAlKSAgICAgMjgwMS45MCAqICAgMy43MSUqCi0gICAgICAgIEFtZWFuICAgICBmYXVsdC1ib3Ro
LTEyICAgICA0ODYxLjI2ICggICAwLjAwJSkgICAgIDQ3MzMuMjUgKiAgIDIuNjMlKgotICAgICAg
ICBBbWVhbiAgICAgZmF1bHQtYm90aC0xOCAgICAgNzM1MS4xMSAoICAgMC4wMCUpICAgICA2OTUw
LjUxICogICA1LjQ1JSoKLSAgICAgICAgQW1lYW4gICAgIGZhdWx0LWJvdGgtMjQgICAgIDkwNTku
MzAgKCAgIDAuMDAlKSAgICAgOTE1OS45OSAqICAtMS4xMSUqCi0gICAgICAgIEFtZWFuICAgICBm
YXVsdC1ib3RoLTMwICAgIDEwNjg1LjY4ICggICAwLjAwJSkgICAgMTEzOTkuMDIgKiAgLTYuNjgl
KgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFsxNzVmZTc3YyBGaXg6IG1tX2NvbXBhY3Rp
b25fbWlncmF0ZXBhZ2VzIGNoYW5nZWQgaW4gbGludXggNi45LXJjMV0KLQotQ2hhbmdlLUlkOiBJ
MTAzYTQzZmQxYjU0OTM2MGIzZmM5NzhmZDQwOWI3YzE3ZWYzZTE5MgotU2lnbmVkLW9mZi1ieTog
S2llbmFuIFN0ZXdhcnQgPGtzdGV3YXJ0QGVmZmljaW9zLmNvbT4KLVNpZ25lZC1vZmYtYnk6IE1h
dGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1LmRlc25veWVyc0BlZmZpY2lvcy5jb20+Ci0tLS0KLSBp
bmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMvY29tcGFjdGlvbi5oIHwgMTcgKysrKysrKysr
KysrKysrKy0KLSAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQotCi1JbmRleDogbHR0bmctbW9kdWxlcy0yLjEzLjEyL2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9u
L2V2ZW50cy9jb21wYWN0aW9uLmgKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBsdHRuZy1tb2R1bGVzLTIuMTMu
MTIub3JpZy9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMvY29tcGFjdGlvbi5oCi0rKysg
bHR0bmctbW9kdWxlcy0yLjEzLjEyL2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50cy9jb21w
YWN0aW9uLmgKLUBAIC05Nyw3ICs5NywyMiBAQCBMVFROR19UUkFDRVBPSU5UX0VWRU5UX0lOU1RB
TkNFX01BUChjb21wCi0gCi0gI2VuZGlmIC8qICNlbHNlICNpZiBMVFROR19MSU5VWF9WRVJTSU9O
X0NPREUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNCwwLDApICovCi0gCi0tI2lmIChMVFROR19M
SU5VWF9WRVJTSU9OX0NPREUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNSwxOCwwKSB8fCBcCi0r
I2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NPREUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNiw5
LDApKQotK0xUVE5HX1RSQUNFUE9JTlRfRVZFTlRfTUFQKG1tX2NvbXBhY3Rpb25fbWlncmF0ZXBh
Z2VzLAotKwotKwljb21wYWN0aW9uX21pZ3JhdGVwYWdlcywKLSsKLSsJVFBfUFJPVE8odW5zaWdu
ZWQgaW50IG5yX21pZ3JhdGVwYWdlcywKLSsJCXVuc2lnbmVkIGludCBucl9zdWNjZWVkZWQpLAot
KwotKwlUUF9BUkdTKG5yX21pZ3JhdGVwYWdlcywgbnJfc3VjY2VlZGVkKSwKLSsKLSsJVFBfRklF
TERTKAotKwkJY3RmX2ludGVnZXIodW5zaWduZWQgbG9uZywgbnJfbWlncmF0ZWQsIG5yX3N1Y2Nl
ZWRlZCkKLSsJCWN0Zl9pbnRlZ2VyKHVuc2lnbmVkIGxvbmcsIG5yX2ZhaWxlZCwgbnJfbWlncmF0
ZXBhZ2VzIC0gbnJfc3VjY2VlZGVkKQotKwkpCi0rKQotKyNlbGlmIChMVFROR19MSU5VWF9WRVJT
SU9OX0NPREUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNSwxOCwwKSB8fCBcCi0gICAgIExUVE5H
X1JIRUxfS0VSTkVMX1JBTkdFKDUsMTQsMCwxNjMsMCwwLCA1LDE1LDAsMCwwLDApKQotIExUVE5H
X1RSQUNFUE9JTlRfRVZFTlRfTUFQKG1tX2NvbXBhY3Rpb25fbWlncmF0ZXBhZ2VzLAotIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDQtRml4
LWRldl9iYXNlX2xvY2stcmVtb3ZlZC1pbi1saW51eC02LjktcmMxLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDQtRml4LWRldl9iYXNlX2xvY2stcmVt
b3ZlZC1pbi1saW51eC02LjktcmMxLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCA1OWVmNGY5MzEzLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcv
bHR0bmctbW9kdWxlcy8wMDA0LUZpeC1kZXZfYmFzZV9sb2NrLXJlbW92ZWQtaW4tbGludXgtNi45
LXJjMS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDU3ICswLDAgQEAKLUZyb20gMjE3YmMyZTQ2
ODUwNTBkZGRjZTliZGQyNTU3YjY0ZjZiOGMxNjYyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IEtpZW5hbiBTdGV3YXJ0IDxrc3Rld2FydEBlZmZpY2lvcy5jb20+Ci1EYXRlOiBNb24s
IDI1IE1hciAyMDI0IDEwOjUzOjQ2IC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0ggNC80XSBGaXg6IGRl
dl9iYXNlX2xvY2sgcmVtb3ZlZCBpbiBsaW51eCA2LjktcmMxCi0KLVNlZSB1cHN0cmVhbSBjb21t
aXQ6Ci0KLSAgICBjb21taXQgMWIzZWY0NmNiN2YyNjE4Y2MwYjUwNzM5MzIyMGE2OTgxMGY2ZGEx
MgotICAgIEF1dGhvcjogRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUuY29tPgotICAgIERh
dGU6ICAgVHVlIEZlYiAxMyAwNjozMjo0NSAyMDI0ICswMDAwCi0KLSAgICAgICAgbmV0OiByZW1v
dmUgZGV2X2Jhc2VfbG9jawotCi0gICAgICAgIGRldl9iYXNlX2xvY2sgaXMgbm90IG5lZWRlZCBh
bnltb3JlLCBhbGwgcmVtYWluaW5nIHVzZXJzIGFsc28gaG9sZCBSVE5MLgotCi1VcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0IFs1MmViMmVlOSBGaXg6IGRldl9iYXNlX2xvY2sgcmVtb3ZlZCBpbiBs
aW51eCA2LjktcmMxXQotCi1DaGFuZ2UtSWQ6IEk2YjA3ZTZlZWQwN2ZkMzk4MzAyY2ExNGQyMzE2
MmVkMjRkNzRkZjE1Ci1TaWduZWQtb2ZmLWJ5OiBLaWVuYW4gU3Rld2FydCA8a3N0ZXdhcnRAZWZm
aWNpb3MuY29tPgotU2lnbmVkLW9mZi1ieTogTWF0aGlldSBEZXNub3llcnMgPG1hdGhpZXUuZGVz
bm95ZXJzQGVmZmljaW9zLmNvbT4KLS0tLQotIHNyYy9sdHRuZy1zdGF0ZWR1bXAtaW1wbC5jIHwg
MTUgKysrKysrKysrKysrKysrCi0gMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKLQot
SW5kZXg6IGx0dG5nLW1vZHVsZXMtMi4xMy4xMi9zcmMvbHR0bmctc3RhdGVkdW1wLWltcGwuYwot
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQotLS0tIGx0dG5nLW1vZHVsZXMtMi4xMy4xMi5vcmlnL3NyYy9sdHRuZy1zdGF0
ZWR1bXAtaW1wbC5jCi0rKysgbHR0bmctbW9kdWxlcy0yLjEzLjEyL3NyYy9sdHRuZy1zdGF0ZWR1
bXAtaW1wbC5jCi1AQCAtMzkyLDYgKzM5MiwyMCBAQCB2b2lkIGx0dG5nX2VudW1lcmF0ZV9kZXZp
Y2Uoc3RydWN0IGx0dG5nCi0gCX0KLSB9Ci0gCi0rI2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NP
REUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNiw5LDApKQotK3N0YXRpYwotK2ludCBsdHRuZ19l
bnVtZXJhdGVfbmV0d29ya19pcF9pbnRlcmZhY2Uoc3RydWN0IGx0dG5nX2tlcm5lbF9zZXNzaW9u
ICpzZXNzaW9uKQotK3sKLSsJc3RydWN0IG5ldF9kZXZpY2UgKmRldjsKLSsKLSsJcnRubF9sb2Nr
KCk7Ci0rCWZvcl9lYWNoX25ldGRldigmaW5pdF9uZXQsIGRldikKLSsJCWx0dG5nX2VudW1lcmF0
ZV9kZXZpY2Uoc2Vzc2lvbiwgZGV2KTsKLSsJcnRubF91bmxvY2soKTsKLSsKLSsJcmV0dXJuIDA7
Ci0rfQotKyNlbHNlCi0gc3RhdGljCi0gaW50IGx0dG5nX2VudW1lcmF0ZV9uZXR3b3JrX2lwX2lu
dGVyZmFjZShzdHJ1Y3QgbHR0bmdfa2VybmVsX3Nlc3Npb24gKnNlc3Npb24pCi0gewotQEAgLTQw
NCw2ICs0MTgsNyBAQCBpbnQgbHR0bmdfZW51bWVyYXRlX25ldHdvcmtfaXBfaW50ZXJmYWNlCi0g
Ci0gCXJldHVybiAwOwotIH0KLSsjZW5kaWYgLyogKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+
PSBMVFROR19LRVJORUxfVkVSU0lPTig2LDksMCkpICovCi0gI2Vsc2UgLyogQ09ORklHX0lORVQg
Ki8KLSBzdGF0aWMgaW5saW5lCi0gaW50IGx0dG5nX2VudW1lcmF0ZV9uZXR3b3JrX2lwX2ludGVy
ZmFjZShzdHJ1Y3QgbHR0bmdfa2VybmVsX3Nlc3Npb24gKnNlc3Npb24pCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy4xMi5iYiBiL21ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjEzLmJiCnNpbWlsYXJpdHkg
aW5kZXggNzclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9k
dWxlc18yLjEzLjEyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5n
LW1vZHVsZXNfMi4xMy4xMy5iYgppbmRleCA5NWQ1ZTJkNjE1Li4wZjA1NjIyYmQ0IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy4xMi5iYgor
KysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy4xMy5iYgpA
QCAtMTAsMTYgKzEwLDEzIEBAIGluaGVyaXQgbW9kdWxlCiBpbmNsdWRlIGx0dG5nLXBsYXRmb3Jt
cy5pbmMKIAogU1JDX1VSSSA9ICJodHRwczovL2x0dG5nLm9yZy9maWxlcy8ke0JQTn0vJHtCUE59
LSR7UFZ9LnRhci5iejIgXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtQVNvQy1zbmRfZG9j
X2RhcG0tb24tbGludXgtNi45LXJjMS5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAyLUZp
eC1BU29DLWFkZC1jb21wb25lbnQtdG8tc2V0X2JpYXNfbGV2ZWwtZXZlbnRzLWluLWwucGF0Y2gg
XAotICAgICAgICAgICBmaWxlOi8vMDAwMy1GaXgtbW1fY29tcGFjdGlvbl9taWdyYXRlcGFnZXMt
Y2hhbmdlZC1pbi1saW51eC02LjktLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDQtRml4
LWRldl9iYXNlX2xvY2stcmVtb3ZlZC1pbi1saW51eC02LjktcmMxLnBhdGNoIFwKLSAgICAgICAg
IgorICAgICAgICAgICBmaWxlOi8vMDAwMS1zcmMtS2J1aWxkLWNoYW5nZS1taXNzaW5nLUNPTkZJ
R19UUkFDRVBPSU5UUy10by13YXJuLnBhdGNoIFwKKyAgICAgICAgICAgIgogCiAjIFVzZSA6YXBw
ZW5kIGhlcmUgc28gdGhhdCB0aGUgcGF0Y2ggaXMgYXBwbGllZCBhbHNvIHdoZW4gdXNpbmcgZGV2
dXBzdHJlYW0KIFNSQ19VUkk6YXBwZW5kID0gIiBmaWxlOi8vMDAwMS1zcmMtS2J1aWxkLWNoYW5n
ZS1taXNzaW5nLUNPTkZJR19UUkFDRVBPSU5UUy10by13YXJuLnBhdGNoIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZDg1ZmNiNjZjN2JkMzEwMDNhYjg3MzVlOGM3NzcwMGU1ZTRmNDE3YjRjMjJm
ZTFmMjAxMTJjZjQzNWFiYWQ3OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZDI2YzA3YTVlODBi
NjZhYTdiZGNmZGFhZjQ4NTdmMDBmYzlhNWNkZGU3OTIyNmIyNTI4Njc2NzAwZDUwMjI4IgogCiBl
eHBvcnQgSU5TVEFMTF9NT0RfRElSPSJrZXJuZWwvbHR0bmctbW9kdWxlcyIKIAotLSAKMi40NC4w
Cgo=

--===============3347683818024703303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-f848949a1993df667366f2ab3832ff2e3204fce1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f848949a1993df667366f2ab3832ff2e3204fce1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 107 Local 95 Mirrors 0 Missed 12 Current 214 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 841 of 990 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_recipe_qa)
NOTE: recipe lttng-modules-2.13.13-r0: task do_recipe_qa: Started
NOTE: recipe lttng-modules-2.13.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 971 of 990 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_fetch)
NOTE: recipe lttng-modules-2.13.13-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.13-r0: task do_fetch: Succeeded
NOTE: Running task 972 of 990 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_unpack)
NOTE: Running task 973 of 990 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.13.13-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.13.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.13.13-r0: task do_unpack: Succeeded
NOTE: Running task 974 of 990 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_patch)
NOTE: Running task 975 of 990 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_collect_spdx_deps)
NOTE: recipe lttng-modules-2.13.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.13-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.13.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe lttng-modules-2.13.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lttng-modules-2.13.13-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 975 tasks of which 969 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515151437.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515151437.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: lttng-modules-2.13.13-r0 do_patch: Applying patch '0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/lttng-modules/2.13.13/lttng-modules-2.13.13'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/lttng-modules/2.13.13/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/lttng-modules/2.13.13/temp/log.do_patch.2849640
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_patch) failed with exit code '1'

--===============3347683818024703303==--

