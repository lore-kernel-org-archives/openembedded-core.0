Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E169DC32717
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:41 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.42246.1717263219566411893
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MV1Ppulu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YDwmAVJ/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018fd4dd3881-67e1ebdc-7e28-4bea-8494-26748bb5a56e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qc0x8Ch9sYAVy/805LnG77FIFt1VTTWUjuhuAx0dJa0=;
	b=MV1PpuluQfgCxJFZGk6Fz0KADNyBCii/EbzV+ILyM7WLHN1hpkTeVi1VuQArMIaB
	UHRNCmNQMm6w6Sz92LloRhbB8Ne4zzgBGPkbwacCbCbKs+afvx+qJYhMrdMsBdpGdcO
	A75cTS2cIpvhJIVB0SFoEd2YfiRi8jFyHSDqA6zI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qc0x8Ch9sYAVy/805LnG77FIFt1VTTWUjuhuAx0dJa0=;
	b=YDwmAVJ/q+Fk82y38NVVkHw+SFNfXd9DnH/zJrbLH4hcxFJJ29vJCAgym5DeoFEO
	OliKGAxJdTr1mBF8tg8WOCol1jEeAwnWR5tBze04eXtYuMCbcpAndTHbpd1KDskDraE
	8XVPFXWzFx7UWfH2A+Qihsi42nbIT86qe2U6rHNo=
Content-Type: multipart/mixed; boundary="===============0990314246777744037=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.13 FAILED
Message-ID: <0101018fd4dd3881-67e1ebdc-7e28-4bea-8494-26748bb5a56e-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200177

--===============0990314246777744037==
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
From 402c75221fe4257ab26d53b110df0c79f2cc71b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 14:29:32 +0000
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
index 120528bf9c..ed2ffb622d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -1,4 +1,4 @@
-From 878f89b6136ff7b870a19e04901cc6f316bbe10a Mon Sep 17 00:00:00 2001
+From 6cab21fdba5cd5c074bf43b0ccb90a9a15f915da Mon Sep 17 00:00:00 2001
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


--===============0990314246777744037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (915 cached, 3 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-bb2c4f1e1f34ab487db7744d0cb3e42f6b80043f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bb2c4f1e1f34ab487db7744d0cb3e42f6b80043f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 107 Local 95 Mirrors 0 Missed 12 Current 214 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 841 of 990 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_recipe_qa)
NOTE: recipe lttng-modules-2.13.13-r0: task do_recipe_qa: Started
NOTE: recipe lttng-modules-2.13.13-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_recipe_qa unihash changed to d20e7346827b422eb66c7509c64b74369f8ba6f89bd059e040b29ed35f0bcc8f
NOTE: Setscene tasks completed
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
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240601142914.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240601142914.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: lttng-modules-2.13.13-r0 do_patch: Applying patch '0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/lttng-modules/2.13.13/lttng-modules-2.13.13'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/lttng-modules/2.13.13/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/lttng-modules/2.13.13/temp/log.do_patch.2473106
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb:do_patch) failed with exit code '1'

--===============0990314246777744037==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-modules-upgrade-2.13.12-2.13.13.patch"

RnJvbSA0MDJjNzUyMjFmZTQyNTdhYjI2ZDUzYjExMGRmMGM3OWYyY2M3MWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNDoyOTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
dG5nLW1vZHVsZXM6IHVwZ3JhZGUgMi4xMy4xMiAtPiAyLjEzLjEzCgotLS0KIC4uLngtQVNvQy1z
bmRfZG9jX2RhcG0tb24tbGludXgtNi45LXJjMS5wYXRjaCB8ICA5MyAtLS0tLS0tLS0tLS0KIC4u
LmUtbWlzc2luZy1DT05GSUdfVFJBQ0VQT0lOVFMtdG8td2Fybi5wYXRjaCB8ICAxMiArLQogLi4u
cG9uZW50LXRvLXNldF9iaWFzX2xldmVsLWV2ZW50cy1pbi1sLnBhdGNoIHwgMTMyIC0tLS0tLS0t
LS0tLS0tLS0tLQogLi4ubl9taWdyYXRlcGFnZXMtY2hhbmdlZC1pbi1saW51eC02LjktLnBhdGNo
IHwgIDgxIC0tLS0tLS0tLS0tCiAuLi52X2Jhc2VfbG9jay1yZW1vdmVkLWluLWxpbnV4LTYuOS1y
YzEucGF0Y2ggfCAgNTcgLS0tLS0tLS0KIC4uLmVzXzIuMTMuMTIuYmIgPT4gbHR0bmctbW9kdWxl
c18yLjEzLjEzLmJifSB8ICAgOSArLQogNiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDM3NSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2VybmVs
L2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMS1GaXgtQVNvQy1zbmRfZG9jX2RhcG0tb24tbGludXgt
Ni45LXJjMS5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0
bmcvbHR0bmctbW9kdWxlcy8wMDAyLUZpeC1BU29DLWFkZC1jb21wb25lbnQtdG8tc2V0X2JpYXNf
bGV2ZWwtZXZlbnRzLWluLWwucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
a2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMy1GaXgtbW1fY29tcGFjdGlvbl9taWdyYXRl
cGFnZXMtY2hhbmdlZC1pbi1saW51eC02LjktLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0
YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDQtRml4LWRldl9iYXNlX2xv
Y2stcmVtb3ZlZC1pbi1saW51eC02LjktcmMxLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtl
cm5lbC9sdHRuZy97bHR0bmctbW9kdWxlc18yLjEzLjEyLmJiID0+IGx0dG5nLW1vZHVsZXNfMi4x
My4xMy5iYn0gKDc3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0
dG5nLW1vZHVsZXMvMDAwMS1GaXgtQVNvQy1zbmRfZG9jX2RhcG0tb24tbGludXgtNi45LXJjMS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAxLUZpeC1B
U29DLXNuZF9kb2NfZGFwbS1vbi1saW51eC02LjktcmMxLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCA5ZDVmZDBkZTYwLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAxLUZpeC1BU29DLXNuZF9kb2NfZGFwbS1vbi1s
aW51eC02LjktcmMxLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsOTMgKzAsMCBAQAotRnJvbSBm
ZWMwMDdkOTYzMGUwMTAwNjJjZjU2OTlhMDg0NjBmNzFmNDZiNTI3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogS2llbmFuIFN0ZXdhcnQgPGtzdGV3YXJ0QGVmZmljaW9zLmNvbT4KLURh
dGU6IE1vbiwgMjUgTWFyIDIwMjQgMDg6NTQ6NDIgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSCAxLzRd
IEZpeDogQVNvQyBzbmRfZG9jX2RhcG0gb24gbGludXggNi45LXJjMQotCi1TZWUgdXBzdHJlYW0g
Y29tbWl0OgotCi0gICAgY29tbWl0IDdkZjNlYjRjZGI2YmJmYTQ4MmY1MTU0OGI5ZmQ0N2MyNzIz
YzY4YmEKLSAgICBBdXRob3I6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5j
b20+Ci0gICAgRGF0ZTogICBXZWQgTWFyIDYgMTA6MzA6MDEgMjAyNCArMDEwMAotCi0gICAgICAg
IEFTb0M6IHRyYWNlOiBhZGQgZXZlbnQgdG8gc25kX3NvY19kYXBtIHRyYWNlIGV2ZW50cwotCi0g
ICAgICAgIEFkZCB0aGUgZXZlbnQgdmFsdWUgdG8gdGhlIHNuZF9zb2NfZGFwbV9zdGFydCBhbmQg
c25kX3NvY19kYXBtX2RvbmUgdHJhY2UKLSAgICAgICAgZXZlbnRzIHRvIG1ha2UgdGhlbSBtb3Jl
IGluZm9ybWF0aXZlLgotCi0gICAgICAgIFRyYWNlIGJlZm9yZToKLQotICAgICAgICAgICAgICAg
ICAgIGFwbGF5LTIyOSAgIFswMDBdICAgMjUwLjE0MDMwOTogc25kX3NvY19kYXBtX3N0YXJ0OiAg
IGNhcmQ9dnNjbi0yMDQ2Ci0gICAgICAgICAgICAgICAgICAgYXBsYXktMjI5ICAgWzAwMF0gICAy
NTAuMTY3NTMxOiBzbmRfc29jX2RhcG1fZG9uZTogICAgY2FyZD12c2NuLTIwNDYKLSAgICAgICAg
ICAgICAgICAgICBhcGxheS0yMjkgICBbMDAwXSAgIDI1MS4xNjk1ODg6IHNuZF9zb2NfZGFwbV9z
dGFydDogICBjYXJkPXZzY24tMjA0NgotICAgICAgICAgICAgICAgICAgIGFwbGF5LTIyOSAgIFsw
MDBdICAgMjUxLjE5NTI0NTogc25kX3NvY19kYXBtX2RvbmU6ICAgIGNhcmQ9dnNjbi0yMDQ2Ci0K
LSAgICAgICAgVHJhY2UgYWZ0ZXI6Ci0KLSAgICAgICAgICAgICAgICAgICBhcGxheS0yMTQgICBb
MDAwXSAgIDY5My4yOTA2MTI6IHNuZF9zb2NfZGFwbV9zdGFydDogICBjYXJkPXZzY24tMjA0NiBl
dmVudD0xCi0gICAgICAgICAgICAgICAgICAgYXBsYXktMjE0ICAgWzAwMF0gICA2OTMuMzE1NTA4
OiBzbmRfc29jX2RhcG1fZG9uZTogICAgY2FyZD12c2NuLTIwNDYgZXZlbnQ9MQotICAgICAgICAg
ICAgICAgICAgIGFwbGF5LTIxNCAgIFswMDBdICAgNjk0LjUzNzM0OTogc25kX3NvY19kYXBtX3N0
YXJ0OiAgIGNhcmQ9dnNjbi0yMDQ2IGV2ZW50PTIKLSAgICAgICAgICAgICAgICAgICBhcGxheS0y
MTQgICBbMDAwXSAgIDY5NC41NjMyNDE6IHNuZF9zb2NfZGFwbV9kb25lOiAgICBjYXJkPXZzY24t
MjA0NiBldmVudD0yCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgWzg4YzRlMGZlIEZpeDog
QVNvQyBzbmRfZG9jX2RhcG0gb24gbGludXggNi45LXJjMV0KLQotQ2hhbmdlLUlkOiBJZjBkMzM1
NDRiOGRkMWRmYjNkMTJjYTkzOTA4OTIxOTBmYzA0NDRiMAotU2lnbmVkLW9mZi1ieTogS2llbmFu
IFN0ZXdhcnQgPGtzdGV3YXJ0QGVmZmljaW9zLmNvbT4KLVNpZ25lZC1vZmYtYnk6IE1hdGhpZXUg
RGVzbm95ZXJzIDxtYXRoaWV1LmRlc25veWVyc0BlZmZpY2lvcy5jb20+Ci0tLS0KLSBpbmNsdWRl
L2luc3RydW1lbnRhdGlvbi9ldmVudHMvYXNvYy5oIHwgMzMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrCi0gMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBh
L2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50cy9hc29jLmggYi9pbmNsdWRlL2luc3RydW1l
bnRhdGlvbi9ldmVudHMvYXNvYy5oCi1pbmRleCAyMWQxM2EwZi4uNTEyNmQ0YzEgMTAwNjQ0Ci0t
LS0gYS9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMvYXNvYy5oCi0rKysgYi9pbmNsdWRl
L2luc3RydW1lbnRhdGlvbi9ldmVudHMvYXNvYy5oCi1AQCAtNTEsNiArNTEsMzggQEAgTFRUTkdf
VFJBQ0VQT0lOVF9FVkVOVF9JTlNUQU5DRV9NQVAoYXNvY19zbmRfc29jX2NhcmQsIHNuZF9zb2Nf
Ymlhc19sZXZlbF9kb25lLAotIAotICkKLSAKLSsjaWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09E
RSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig2LDksMCkpCi0rTFRUTkdfVFJBQ0VQT0lOVF9FVkVO
VF9DTEFTUyhhc29jX3NuZF9zb2NfZGFwbV9iYXNpYywKLSsKLSsJVFBfUFJPVE8oc3RydWN0IHNu
ZF9zb2NfY2FyZCAqY2FyZCwgaW50IGV2ZW50KSwKLSsKLSsJVFBfQVJHUyhjYXJkLCBldmVudCks
Ci0rCi0rCVRQX0ZJRUxEUygKLSsJCWN0Zl9zdHJpbmcobmFtZSwgY2FyZC0+bmFtZSkKLSsJCWN0
Zl9pbnRlZ2VyKGludCwgZXZlbnQsIGV2ZW50KQotKwkpCi0rKQotK0xUVE5HX1RSQUNFUE9JTlRf
RVZFTlRfSU5TVEFOQ0VfTUFQKGFzb2Nfc25kX3NvY19kYXBtX2Jhc2ljLCBzbmRfc29jX2RhcG1f
c3RhcnQsCi0rCi0rCWFzb2Nfc25kX3NvY19kYXBtX3N0YXJ0LAotKwotKwlUUF9QUk9UTyhzdHJ1
Y3Qgc25kX3NvY19jYXJkICpjYXJkLCBpbnQgZXZlbnQpLAotKwotKwlUUF9BUkdTKGNhcmQsIGV2
ZW50KQotKwotKykKLSsKLStMVFROR19UUkFDRVBPSU5UX0VWRU5UX0lOU1RBTkNFX01BUChhc29j
X3NuZF9zb2NfZGFwbV9iYXNpYywgc25kX3NvY19kYXBtX2RvbmUsCi0rCi0rCWFzb2Nfc25kX3Nv
Y19kYXBtX2RvbmUsCi0rCi0rCVRQX1BST1RPKHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQsIGlu
dCBldmVudCksCi0rCi0rCVRQX0FSR1MoY2FyZCwgZXZlbnQpCi0rCi0rKQotKyNlbHNlCi0gTFRU
TkdfVFJBQ0VQT0lOVF9FVkVOVF9DTEFTUyhhc29jX3NuZF9zb2NfZGFwbV9iYXNpYywKLSAKLSAJ
VFBfUFJPVE8oc3RydWN0IHNuZF9zb2NfY2FyZCAqY2FyZCksCi1AQCAtODEsNiArMTEzLDcgQEAg
TFRUTkdfVFJBQ0VQT0lOVF9FVkVOVF9JTlNUQU5DRV9NQVAoYXNvY19zbmRfc29jX2RhcG1fYmFz
aWMsIHNuZF9zb2NfZGFwbV9kb25lLAotIAlUUF9BUkdTKGNhcmQpCi0gCi0gKQotKyNlbmRpZgot
IAotIExUVE5HX1RSQUNFUE9JTlRfRVZFTlRfQ0xBU1MoYXNvY19zbmRfc29jX2RhcG1fd2lkZ2V0
LAotIAotLS0gCi0yLjM5LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRu
Zy9sdHRuZy1tb2R1bGVzLzAwMDEtc3JjLUtidWlsZC1jaGFuZ2UtbWlzc2luZy1DT05GSUdfVFJB
Q0VQT0lOVFMtdG8td2Fybi5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmct
bW9kdWxlcy8wMDAxLXNyYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRT
LXRvLXdhcm4ucGF0Y2gKaW5kZXggMTIwNTI4YmY5Yy4uZWQyZmZiNjIyZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDEtc3JjLUtidWlsZC1j
aGFuZ2UtbWlzc2luZy1DT05GSUdfVFJBQ0VQT0lOVFMtdG8td2Fybi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMS1zcmMtS2J1aWxkLWNoYW5n
ZS1taXNzaW5nLUNPTkZJR19UUkFDRVBPSU5UUy10by13YXJuLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA4NzhmODliNjEzNmZmN2I4NzBhMTllMDQ5MDFjYzZmMzE2YmJlMTBhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2Y2FiMjFmZGJhNWNkNWMwNzRiZjQzYjBjY2I5MGE5YTE1
ZjkxNWRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJy
dWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTUgTWF5IDIwMjEgMTA6MjY6Mzgg
LTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3JjL0tidWlsZDogY2hhbmdlIG1pc3NpbmcgQ09ORklH
X1RSQUNFUE9JTlRTIHRvIHdhcm5pbmcKQEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPgogIHNyYy9LYnVpbGQg
fCA3ICsrKysrKy0KICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCiAKLUluZGV4OiBsdHRuZy1tb2R1bGVzLTIuMTMuMTAvc3JjL0tidWlsZAotPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQotLS0tIGx0dG5nLW1vZHVsZXMtMi4xMy4xMC5vcmlnL3NyYy9LYnVpbGQKLSsrKyBsdHRuZy1t
b2R1bGVzLTIuMTMuMTAvc3JjL0tidWlsZAorZGlmZiAtLWdpdCBhL3NyYy9LYnVpbGQgYi9zcmMv
S2J1aWxkCitpbmRleCA3MTM3ODc0Li4wNGViNWM5IDEwMDY0NAorLS0tIGEvc3JjL0tidWlsZAor
KysrIGIvc3JjL0tidWlsZAogQEAgLTIsMTAgKzIsMTMgQEAKICAKICBpZmRlZiBDT05GSUdfTE9D
QUxWRVJTSU9OCSMgQ2hlY2sgaWYgZG90LWNvbmZpZyBpcyBpbmNsdWRlZC4KQEAgLTM4LDcgKzM4
LDcgQEAgSW5kZXg6IGx0dG5nLW1vZHVsZXMtMi4xMy4xMC9zcmMvS2J1aWxkCiAgVE9QX0xUVE5H
X01PRFVMRVNfRElSIDo9ICQoc2hlbGwgZGlybmFtZSAkKGxhc3R3b3JkICQoTUFLRUZJTEVfTElT
VCkpKS8uLgogIAogIGx0dG5nX2NoZWNrX2xpbnV4X3ZlcnNpb24gPSAkKHNoZWxsIHB3ZCkvaW5j
bHVkZS9saW51eC92ZXJzaW9uLmgKLUBAIC0xNTAsMyArMTUzLDUgQEAgbHR0bmctc3RhdGVkdW1w
LW9ianMgOj0gbHR0bmctc3RhdGVkdW1wLQorQEAgLTE1MCwzICsxNTMsNSBAQCBsdHRuZy1zdGF0
ZWR1bXAtb2JqcyA6PSBsdHRuZy1zdGF0ZWR1bXAtaW1wbC5vCiAgb2JqLSQoQ09ORklHX0xUVE5H
KSArPSBwcm9iZXMvCiAgb2JqLSQoQ09ORklHX0xUVE5HKSArPSBsaWIvCiAgb2JqLSQoQ09ORklH
X0xUVE5HKSArPSB0ZXN0cy8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcv
bHR0bmctbW9kdWxlcy8wMDAyLUZpeC1BU29DLWFkZC1jb21wb25lbnQtdG8tc2V0X2JpYXNfbGV2
ZWwtZXZlbnRzLWluLWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1v
ZHVsZXMvMDAwMi1GaXgtQVNvQy1hZGQtY29tcG9uZW50LXRvLXNldF9iaWFzX2xldmVsLWV2ZW50
cy1pbi1sLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2ZWExMGZmYzkxLi4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8w
MDAyLUZpeC1BU29DLWFkZC1jb21wb25lbnQtdG8tc2V0X2JpYXNfbGV2ZWwtZXZlbnRzLWluLWwu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwxMzIgKzAsMCBAQAotRnJvbSBkODM3OWVjNjM2NWE5
MjVkYjMzY2FlOTRmYjY3ODNjZGJkYjZhOTIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJv
bTogS2llbmFuIFN0ZXdhcnQgPGtzdGV3YXJ0QGVmZmljaW9zLmNvbT4KLURhdGU6IE1vbiwgMjUg
TWFyIDIwMjQgMDk6NDA6MjkgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSCAyLzRdIEZpeDogQVNvQyBh
ZGQgY29tcG9uZW50IHRvIHNldF9iaWFzX2xldmVsIGV2ZW50cyBpbiBsaW51eAotIDYuOS1yYzEK
LQotU2VlIHVwc3RyZWFtIGNvbW1pdDoKLQotICAgIGNvbW1pdCA2ZWY0NmE2OWVjMzJmZTFjZjU2
ZGU2Nzc0MmZjZDAxYWY0YmY0OGFmCi0gICAgQXV0aG9yOiBMdWNhIENlcmVzb2xpIDxsdWNhLmNl
cmVzb2xpQGJvb3RsaW4uY29tPgotICAgIERhdGU6ICAgV2VkIE1hciA2IDEwOjMwOjAwIDIwMjQg
KzAxMDAKLQotICAgICAgICBBU29DOiB0cmFjZTogYWRkIGNvbXBvbmVudCB0byBzZXRfYmlhc19s
ZXZlbCB0cmFjZSBldmVudHMKLQotICAgICAgICBUaGUgc25kX3NvY19iaWFzX2xldmVsX3N0YXJ0
IGFuZCBzbmRfc29jX2JpYXNfbGV2ZWxfZG9uZSB0cmFjZSBldmVudHMKLSAgICAgICAgY3VycmVu
dGx5IGxvb2sgbGlrZToKLQotICAgICAgICAgICAgICAgICAgIGFwbGF5LTIyOSAgIFswMDBdICAx
MjUwLjE0MDc3ODogc25kX3NvY19iaWFzX2xldmVsX3N0YXJ0OiBjYXJkPXZzY24tMjA0NiB2YWw9
MQotICAgICAgICAgICAgICAgICAgIGFwbGF5LTIyOSAgIFswMDBdICAxMjUwLjE0MDc4NDogc25k
X3NvY19iaWFzX2xldmVsX2RvbmU6IGNhcmQ9dnNjbi0yMDQ2IHZhbD0xCi0gICAgICAgICAgICAg
ICAgICAgYXBsYXktMjI5ICAgWzAwMF0gIDEyNTAuMTQwNzg2OiBzbmRfc29jX2JpYXNfbGV2ZWxf
c3RhcnQ6IGNhcmQ9dnNjbi0yMDQ2IHZhbD0yCi0gICAgICAgICAgICAgICAgICAgYXBsYXktMjI5
ICAgWzAwMF0gIDEyNTAuMTQwNzg4OiBzbmRfc29jX2JpYXNfbGV2ZWxfZG9uZTogY2FyZD12c2Nu
LTIwNDYgdmFsPTIKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6MS0yMSAgICBbMDAwXSAgMTI1MC4x
NDA4NzE6IHNuZF9zb2NfYmlhc19sZXZlbF9zdGFydDogY2FyZD12c2NuLTIwNDYgdmFsPTEKLSAg
ICAgICAgICAgIGt3b3JrZXIvdTg6MC0xMSAgICBbMDAwXSAgMTI1MC4xNDA5NTE6IHNuZF9zb2Nf
Ymlhc19sZXZlbF9zdGFydDogY2FyZD12c2NuLTIwNDYgdmFsPTEKLSAgICAgICAgICAgIGt3b3Jr
ZXIvdTg6MC0xMSAgICBbMDAwXSAgMTI1MC4xNDA5NTY6IHNuZF9zb2NfYmlhc19sZXZlbF9kb25l
OiBjYXJkPXZzY24tMjA0NiB2YWw9MQotICAgICAgICAgICAga3dvcmtlci91ODowLTExICAgIFsw
MDBdICAxMjUwLjE0MDk1OTogc25kX3NvY19iaWFzX2xldmVsX3N0YXJ0OiBjYXJkPXZzY24tMjA0
NiB2YWw9MgotICAgICAgICAgICAga3dvcmtlci91ODowLTExICAgIFswMDBdICAxMjUwLjE0MDk2
MTogc25kX3NvY19iaWFzX2xldmVsX2RvbmU6IGNhcmQ9dnNjbi0yMDQ2IHZhbD0yCi0gICAgICAg
ICAgICBrd29ya2VyL3U4OjEtMjEgICAgWzAwMF0gIDEyNTAuMTY3MjE5OiBzbmRfc29jX2JpYXNf
bGV2ZWxfZG9uZTogY2FyZD12c2NuLTIwNDYgdmFsPTEKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6
MS0yMSAgICBbMDAwXSAgMTI1MC4xNjcyMjI6IHNuZF9zb2NfYmlhc19sZXZlbF9zdGFydDogY2Fy
ZD12c2NuLTIwNDYgdmFsPTIKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6MS0yMSAgICBbMDAwXSAg
MTI1MC4xNjcyMzI6IHNuZF9zb2NfYmlhc19sZXZlbF9kb25lOiBjYXJkPXZzY24tMjA0NiB2YWw9
MgotICAgICAgICAgICAga3dvcmtlci91ODowLTExICAgIFswMDBdICAxMjUwLjE2NzQ0MDogc25k
X3NvY19iaWFzX2xldmVsX3N0YXJ0OiBjYXJkPXZzY24tMjA0NiB2YWw9MwotICAgICAgICAgICAg
a3dvcmtlci91ODowLTExICAgIFswMDBdICAxMjUwLjE2NzQ0NDogc25kX3NvY19iaWFzX2xldmVs
X2RvbmU6IGNhcmQ9dnNjbi0yMDQ2IHZhbD0zCi0gICAgICAgICAgICBrd29ya2VyL3U4OjEtMjEg
ICAgWzAwMF0gIDEyNTAuMTY3NDk3OiBzbmRfc29jX2JpYXNfbGV2ZWxfc3RhcnQ6IGNhcmQ9dnNj
bi0yMDQ2IHZhbD0zCi0gICAgICAgICAgICBrd29ya2VyL3U4OjEtMjEgICAgWzAwMF0gIDEyNTAu
MTY3NTA2OiBzbmRfc29jX2JpYXNfbGV2ZWxfZG9uZTogY2FyZD12c2NuLTIwNDYgdmFsPTMKLQot
ICAgICAgICBUaGVyZSBhcmUgY2xlYXJseSBtdWx0aXBsZSBjYWxscywgb25lIHBlciBjb21wb25l
bnQsIGJ1dCB0aGV5IGNhbm5vdCBiZQotICAgICAgICBkaXNjcmltaW5hdGVkIGZyb20gZWFjaCBv
dGhlci4KLQotICAgICAgICBDaGFuZ2UgdGhlIGZ0cmFjZSBldmVudHMgdG8gYWxzbyBwcmludCB0
aGUgY29tcG9uZW50IG5hbWUsIHRvIG1ha2UgaXQgY2xlYXIKLSAgICAgICAgd2hpY2ggcGFydCBv
ZiB0aGUgY29kZSBpcyBpbnZvbHZlZC4gVGhpcyByZXF1aXJlcyBjaGFuZ2luZyB0aGUgcGFzc2Vk
IHZhbHVlCi0gICAgICAgIGZyb20gYSBzdHJ1Y3Qgc25kX3NvY19jYXJkLCB3aGVyZSB0aGUgREFQ
TSBjb250ZXh0IGlzIG5vdCBrd293biwgdG8gYQotICAgICAgICBzdHJ1Y3Qgc25kX3NvY19kYXBt
X2NvbnRleHQgd2hlcmUgaXQgaXMgb2J2aW91c2x5IGtub3duIGJ1dCB0aGUgYSBjYXJkCi0gICAg
ICAgIHBvaW50ZXIgaXMgYWxzbyBhdmFpbGFibGUuCi0KLSAgICAgICAgV2l0aCB0aGlzIGNoYW5n
ZSwgdGhlIHJlc3VsdGluZyB0cmFjZSBiZWNvbWVzOgotCi0gICAgICAgICAgICAgICAgICAgYXBs
YXktMjQ3ICAgWzAwMF0gIDE0MzYuMzU3MzMyOiBzbmRfc29jX2JpYXNfbGV2ZWxfc3RhcnQ6IGNh
cmQ9dnNjbi0yMDQ2IGNvbXBvbmVudD0obm9uZSkgdmFsPTEKLSAgICAgICAgICAgICAgICAgICBh
cGxheS0yNDcgICBbMDAwXSAgMTQzNi4zNTczMzg6IHNuZF9zb2NfYmlhc19sZXZlbF9kb25lOiBj
YXJkPXZzY24tMjA0NiBjb21wb25lbnQ9KG5vbmUpIHZhbD0xCi0gICAgICAgICAgICAgICAgICAg
YXBsYXktMjQ3ICAgWzAwMF0gIDE0MzYuMzU3MzQwOiBzbmRfc29jX2JpYXNfbGV2ZWxfc3RhcnQ6
IGNhcmQ9dnNjbi0yMDQ2IGNvbXBvbmVudD0obm9uZSkgdmFsPTIKLSAgICAgICAgICAgICAgICAg
ICBhcGxheS0yNDcgICBbMDAwXSAgMTQzNi4zNTczNDM6IHNuZF9zb2NfYmlhc19sZXZlbF9kb25l
OiBjYXJkPXZzY24tMjA0NiBjb21wb25lbnQ9KG5vbmUpIHZhbD0yCi0gICAgICAgICAgICBrd29y
a2VyL3U4OjQtMjE1ICAgWzAwMF0gIDE0MzYuMzU3NDM3OiBzbmRfc29jX2JpYXNfbGV2ZWxfc3Rh
cnQ6IGNhcmQ9dnNjbi0yMDQ2IGNvbXBvbmVudD1mZjU2MDAwMC5jb2RlYyB2YWw9MQotICAgICAg
ICAgICAga3dvcmtlci91ODo1LTIzMSAgIFswMDBdICAxNDM2LjM1NzUxODogc25kX3NvY19iaWFz
X2xldmVsX3N0YXJ0OiBjYXJkPXZzY24tMjA0NiBjb21wb25lbnQ9ZmYzMjAwMDAuaTJzIHZhbD0x
Ci0gICAgICAgICAgICBrd29ya2VyL3U4OjUtMjMxICAgWzAwMF0gIDE0MzYuMzU3NTIzOiBzbmRf
c29jX2JpYXNfbGV2ZWxfZG9uZTogY2FyZD12c2NuLTIwNDYgY29tcG9uZW50PWZmMzIwMDAwLmky
cyB2YWw9MQotICAgICAgICAgICAga3dvcmtlci91ODo1LTIzMSAgIFswMDBdICAxNDM2LjM1NzUy
Njogc25kX3NvY19iaWFzX2xldmVsX3N0YXJ0OiBjYXJkPXZzY24tMjA0NiBjb21wb25lbnQ9ZmYz
MjAwMDAuaTJzIHZhbD0yCi0gICAgICAgICAgICBrd29ya2VyL3U4OjUtMjMxICAgWzAwMF0gIDE0
MzYuMzU3NTI4OiBzbmRfc29jX2JpYXNfbGV2ZWxfZG9uZTogY2FyZD12c2NuLTIwNDYgY29tcG9u
ZW50PWZmMzIwMDAwLmkycyB2YWw9MgotICAgICAgICAgICAga3dvcmtlci91ODo0LTIxNSAgIFsw
MDBdICAxNDM2LjM4MzIxNzogc25kX3NvY19iaWFzX2xldmVsX2RvbmU6IGNhcmQ9dnNjbi0yMDQ2
IGNvbXBvbmVudD1mZjU2MDAwMC5jb2RlYyB2YWw9MQotICAgICAgICAgICAga3dvcmtlci91ODo0
LTIxNSAgIFswMDBdICAxNDM2LjM4MzIyMTogc25kX3NvY19iaWFzX2xldmVsX3N0YXJ0OiBjYXJk
PXZzY24tMjA0NiBjb21wb25lbnQ9ZmY1NjAwMDAuY29kZWMgdmFsPTIKLSAgICAgICAgICAgIGt3
b3JrZXIvdTg6NC0yMTUgICBbMDAwXSAgMTQzNi4zODMyMzE6IHNuZF9zb2NfYmlhc19sZXZlbF9k
b25lOiBjYXJkPXZzY24tMjA0NiBjb21wb25lbnQ9ZmY1NjAwMDAuY29kZWMgdmFsPTIKLSAgICAg
ICAgICAgIGt3b3JrZXIvdTg6NS0yMzEgICBbMDAwXSAgMTQzNi4zODM0Njg6IHNuZF9zb2NfYmlh
c19sZXZlbF9zdGFydDogY2FyZD12c2NuLTIwNDYgY29tcG9uZW50PWZmMzIwMDAwLmkycyB2YWw9
MwotICAgICAgICAgICAga3dvcmtlci91ODo1LTIzMSAgIFswMDBdICAxNDM2LjM4MzQ3Mjogc25k
X3NvY19iaWFzX2xldmVsX2RvbmU6IGNhcmQ9dnNjbi0yMDQ2IGNvbXBvbmVudD1mZjMyMDAwMC5p
MnMgdmFsPTMKLSAgICAgICAgICAgIGt3b3JrZXIvdTg6NC0yMTUgICBbMDAwXSAgMTQzNi4zODM1
MDM6IHNuZF9zb2NfYmlhc19sZXZlbF9zdGFydDogY2FyZD12c2NuLTIwNDYgY29tcG9uZW50PWZm
NTYwMDAwLmNvZGVjIHZhbD0zCi0gICAgICAgICAgICBrd29ya2VyL3U4OjQtMjE1ICAgWzAwMF0g
IDE0MzYuMzgzNTEzOiBzbmRfc29jX2JpYXNfbGV2ZWxfZG9uZTogY2FyZD12c2NuLTIwNDYgY29t
cG9uZW50PWZmNTYwMDAwLmNvZGVjIHZhbD0zCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQg
WzMwMzQzNGFiIEZpeDogQVNvQyBhZGQgY29tcG9uZW50IHRvIHNldF9iaWFzX2xldmVsIGV2ZW50
cyBpbiBsaW51eCA2LjktcmMxXQotCi1DaGFuZ2UtSWQ6IEk5NTlmMTY4MGMwMDJhY2RmMjk4Mjhi
OTY4ZDM5NzUyNDdmNTQzM2Q4Ci1TaWduZWQtb2ZmLWJ5OiBLaWVuYW4gU3Rld2FydCA8a3N0ZXdh
cnRAZWZmaWNpb3MuY29tPgotU2lnbmVkLW9mZi1ieTogTWF0aGlldSBEZXNub3llcnMgPG1hdGhp
ZXUuZGVzbm95ZXJzQGVmZmljaW9zLmNvbT4KLS0tLQotIGluY2x1ZGUvaW5zdHJ1bWVudGF0aW9u
L2V2ZW50cy9hc29jLmggfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysKLSAxIGZpbGUg
Y2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQotCi1JbmRleDogbHR0bmctbW9kdWxlcy0yLjEzLjEy
L2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50cy9hc29jLmgKLT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBs
dHRuZy1tb2R1bGVzLTIuMTMuMTIub3JpZy9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMv
YXNvYy5oCi0rKysgbHR0bmctbW9kdWxlcy0yLjEzLjEyL2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9u
L2V2ZW50cy9hc29jLmgKLUBAIC0xMCw2ICsxMCw3IEBACi0gI2luY2x1ZGUgPGx0dG5nL2tlcm5l
bC12ZXJzaW9uLmg+Ci0gCi0gI2RlZmluZSBEQVBNX0RJUkVDVCAiKGRpcmVjdCkiCi0rI2RlZmlu
ZSBEQVBNX0NPTVBPTkVOVF9OT05FICIobm9uZSkiCi0gCi0gI2lmbmRlZiBfVFJBQ0VfQVNPQ19E
RUYKLSAjZGVmaW5lIF9UUkFDRV9BU09DX0RFRgotQEAgLTExOSw2ICsxMjAsNDAgQEAgTFRUTkdf
VFJBQ0VQT0lOVF9FVkVOVF9JTlNUQU5DRV9NQVAoYXNvYwotICkKLSAjZW5kaWYKLSAKLSsjaWYg
KExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig2LDksMCkp
Ci0rTFRUTkdfVFJBQ0VQT0lOVF9FVkVOVF9DTEFTUyhhc29jX3NuZF9zb2NfZGFwbV9jb250ZXh0
LAotKwotKwlUUF9QUk9UTyhzdHJ1Y3Qgc25kX3NvY19kYXBtX2NvbnRleHQgKmRhcG0sIGludCB2
YWwpLAotKwotKwlUUF9BUkdTKGRhcG0sIHZhbCksCi0rCi0rCVRQX0ZJRUxEUygKLSsJCWN0Zl9z
dHJpbmcobmFtZSwgZGFwbS0+Y2FyZC0+bmFtZSkKLSsJCWN0Zl9zdHJpbmcoY29tcG9uZW50LCBk
YXBtLT5jb21wb25lbnQgPyBkYXBtLT5jb21wb25lbnQtPm5hbWUgOiBEQVBNX0NPTVBPTkVOVF9O
T05FKQotKwkJY3RmX2ludGVnZXIoaW50LCB2YWwsIHZhbCkKLSsJKQotKykKLSsKLStMVFROR19U
UkFDRVBPSU5UX0VWRU5UX0lOU1RBTkNFX01BUChhc29jX3NuZF9zb2NfZGFwbV9jb250ZXh0LCBz
bmRfc29jX2JpYXNfbGV2ZWxfc3RhcnQsCi0rCi0rCWFzb2Nfc25kX3NvY19iaWFzX2xldmVsX3N0
YXJ0LAotKwotKwlUUF9QUk9UTyhzdHJ1Y3Qgc25kX3NvY19kYXBtX2NvbnRleHQgKmRhcG0sIGlu
dCB2YWwpLAotKwotKwlUUF9BUkdTKGRhcG0sIHZhbCkKLSsKLSspCi0rCi0rTFRUTkdfVFJBQ0VQ
T0lOVF9FVkVOVF9JTlNUQU5DRV9NQVAoYXNvY19zbmRfc29jX2RhcG1fY29udGV4dCwgc25kX3Nv
Y19iaWFzX2xldmVsX2RvbmUsCi0rCi0rCWFzb2Nfc25kX3NvY19iaWFzX2xldmVsX2RvbmUsCi0r
Ci0rCVRQX1BST1RPKHN0cnVjdCBzbmRfc29jX2RhcG1fY29udGV4dCAqZGFwbSwgaW50IHZhbCks
Ci0rCi0rCVRQX0FSR1MoZGFwbSwgdmFsKQotKwotKykKLSsjZWxzZQotIExUVE5HX1RSQUNFUE9J
TlRfRVZFTlRfQ0xBU1MoYXNvY19zbmRfc29jX2NhcmQsCi0gCi0gCVRQX1BST1RPKHN0cnVjdCBz
bmRfc29jX2NhcmQgKmNhcmQsIGludCB2YWwpLAotQEAgLTE1MCw2ICsxODUsNyBAQCBMVFROR19U
UkFDRVBPSU5UX0VWRU5UX0lOU1RBTkNFX01BUChhc29jCi0gCVRQX0FSR1MoY2FyZCwgdmFsKQot
IAotICkKLSsjZW5kaWYKLSAKLSAjaWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+PSBMVFRO
R19LRVJORUxfVkVSU0lPTig2LDksMCkpCi0gTFRUTkdfVFJBQ0VQT0lOVF9FVkVOVF9DTEFTUyhh
c29jX3NuZF9zb2NfZGFwbV9iYXNpYywKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
bHR0bmcvbHR0bmctbW9kdWxlcy8wMDAzLUZpeC1tbV9jb21wYWN0aW9uX21pZ3JhdGVwYWdlcy1j
aGFuZ2VkLWluLWxpbnV4LTYuOS0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0
dG5nLW1vZHVsZXMvMDAwMy1GaXgtbW1fY29tcGFjdGlvbl9taWdyYXRlcGFnZXMtY2hhbmdlZC1p
bi1saW51eC02LjktLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2NmM0OGVi
ZThmLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9k
dWxlcy8wMDAzLUZpeC1tbV9jb21wYWN0aW9uX21pZ3JhdGVwYWdlcy1jaGFuZ2VkLWluLWxpbnV4
LTYuOS0ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw4MSArMCwwIEBACi1Gcm9tIGY0YTY0MTVm
OGQ1ZmE0NDc4NjhkMWZkYzcxMTllMGEzMjg5NjYzNzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Ci1Gcm9tOiBLaWVuYW4gU3Rld2FydCA8a3N0ZXdhcnRAZWZmaWNpb3MuY29tPgotRGF0ZTogTW9u
LCAyNSBNYXIgMjAyNCAxMDozMDozMiAtMDQwMAotU3ViamVjdDogW1BBVENIIDMvNF0gRml4OiBt
bV9jb21wYWN0aW9uX21pZ3JhdGVwYWdlcyBjaGFuZ2VkIGluIGxpbnV4IDYuOS1yYzEKLQotU2Vl
IHVwc3RyZWFtIGNvbW1pdDoKLQotICAgIGNvbW1pdCBhYjc1NWJmNDI0OWI5OTJmYzIxNDBkNjE1
YWIwYTY4NmQ1MDc2NWI0Ci0gICAgQXV0aG9yOiBCYW9saW4gV2FuZyA8YmFvbGluLndhbmdAbGlu
dXguYWxpYmFiYS5jb20+Ci0gICAgRGF0ZTogICBUdWUgRmViIDIwIDE0OjE2OjMxIDIwMjQgKzA4
MDAKLQotICAgICAgICBtbTogY29tcGFjdGlvbjogdXBkYXRlIHRoZSBjYy0+bnJfbWlncmF0ZXBh
Z2VzIHdoZW4gYWxsb2NhdGluZyBvciBmcmVlaW5nIHRoZSBmcmVlcGFnZXMKLQotICAgICAgICBD
dXJyZW50bHkgd2Ugd2lsbCB1c2UgJ2NjLT5ucl9mcmVlcGFnZXMgPj0gY2MtPm5yX21pZ3JhdGVw
YWdlcycgY29tcGFyaXNvbgotICAgICAgICB0byBlbnN1cmUgdGhhdCBlbm91Z2ggZnJlZXBhZ2Vz
IGFyZSBpc29sYXRlZCBpbiBpc29sYXRlX2ZyZWVwYWdlcygpLAotICAgICAgICBob3dldmVyIGl0
IGp1c3QgZGVjcmVhc2VzIHRoZSBjYy0+bnJfZnJlZXBhZ2VzIHdpdGhvdXQgdXBkYXRpbmcKLSAg
ICAgICAgY2MtPm5yX21pZ3JhdGVwYWdlcyBpbiBjb21wYWN0aW9uX2FsbG9jKCksIHdoaWNoIHdp
bGwgd2FzdGUgbW9yZSBDUFUKLSAgICAgICAgY3ljbGVzIGFuZCBjYXVzZSB0b28gbWFueSBmcmVl
cGFnZXMgdG8gYmUgaXNvbGF0ZWQuCi0KLSAgICAgICAgU28gd2Ugc2hvdWxkIGFsc28gdXBkYXRl
IHRoZSBjYy0+bnJfbWlncmF0ZXBhZ2VzIHdoZW4gYWxsb2NhdGluZyBvcgotICAgICAgICBmcmVl
aW5nIHRoZSBmcmVlcGFnZXMgdG8gYXZvaWQgaXNvbGF0aW5nIGV4Y2VzcyBmcmVlcGFnZXMuICBB
bmQgSSBjYW4gc2VlCi0gICAgICAgIGZld2VyIGZyZWUgcGFnZXMgYXJlIHNjYW5uZWQgYW5kIGlz
b2xhdGVkIHdoZW4gcnVubmluZyB0aHBjb21wYWN0IG9uIG15Ci0gICAgICAgIEFybTY0IHNlcnZl
cjoKLQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrNi43
ICAgICAgICAgazYuN19wYXRjaGVkCi0gICAgICAgIE9wcyBDb21wYWN0aW9uIHBhZ2VzIGlzb2xh
dGVkICAgICAgMTIwNjkyMDM2LjAwICAgMTE4MTYwNzk3LjAwCi0gICAgICAgIE9wcyBDb21wYWN0
aW9uIG1pZ3JhdGUgc2Nhbm5lZCAgICAgMTMxMjEwMzI5LjAwICAgMTU0MDkzMjY4LjAwCi0gICAg
ICAgIE9wcyBDb21wYWN0aW9uIGZyZWUgc2Nhbm5lZCAgICAgICAxMDkwNTg3OTcxLjAwICAxMDgw
NjMyNTM2LjAwCi0gICAgICAgIE9wcyBDb21wYWN0IHNjYW4gZWZmaWNpZW5jeSAgICAgICAgICAg
ICAgIDEyLjAzICAgICAgICAgIDE0LjI2Ci0KLSAgICAgICAgTW9yZW92ZXIsIEkgZGlkIG5vdCBz
ZWUgYW4gb2J2aW91cyBsYXRlbmN5IGltcHJvdmVtZW50cywgdGhpcyBpcyBsaWtlbHkKLSAgICAg
ICAgYmVjYXVzZSBpc29sYXRpbmcgZnJlZXBhZ2VzIGlzIG5vdCB0aGUgYm90dGxlbmVjayBpbiB0
aGUgdGhwY29tcGFjdCB0ZXN0Ci0gICAgICAgIGNhc2UuCi0KLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgazYuNyAgICAgICAgICAgICAgICAgIGs2LjdfcGF0Y2hlZAotICAg
ICAgICBBbWVhbiAgICAgZmF1bHQtYm90aC0xICAgICAgMTA4OS43NiAoICAgMC4wMCUpICAgICAx
MDgwLjE2ICogICAwLjg4JSoKLSAgICAgICAgQW1lYW4gICAgIGZhdWx0LWJvdGgtMyAgICAgIDE2
MTYuNDggKCAgIDAuMDAlKSAgICAgMTYzNi42NSAqICAtMS4yNSUqCi0gICAgICAgIEFtZWFuICAg
ICBmYXVsdC1ib3RoLTUgICAgICAyMjY2LjY2ICggICAwLjAwJSkgICAgIDIyMTkuMjAgKiAgIDIu
MDklKgotICAgICAgICBBbWVhbiAgICAgZmF1bHQtYm90aC03ICAgICAgMjkwOS44NCAoICAgMC4w
MCUpICAgICAyODAxLjkwICogICAzLjcxJSoKLSAgICAgICAgQW1lYW4gICAgIGZhdWx0LWJvdGgt
MTIgICAgIDQ4NjEuMjYgKCAgIDAuMDAlKSAgICAgNDczMy4yNSAqICAgMi42MyUqCi0gICAgICAg
IEFtZWFuICAgICBmYXVsdC1ib3RoLTE4ICAgICA3MzUxLjExICggICAwLjAwJSkgICAgIDY5NTAu
NTEgKiAgIDUuNDUlKgotICAgICAgICBBbWVhbiAgICAgZmF1bHQtYm90aC0yNCAgICAgOTA1OS4z
MCAoICAgMC4wMCUpICAgICA5MTU5Ljk5ICogIC0xLjExJSoKLSAgICAgICAgQW1lYW4gICAgIGZh
dWx0LWJvdGgtMzAgICAgMTA2ODUuNjggKCAgIDAuMDAlKSAgICAxMTM5OS4wMiAqICAtNi42OCUq
Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgWzE3NWZlNzdjIEZpeDogbW1fY29tcGFjdGlv
bl9taWdyYXRlcGFnZXMgY2hhbmdlZCBpbiBsaW51eCA2LjktcmMxXQotCi1DaGFuZ2UtSWQ6IEkx
MDNhNDNmZDFiNTQ5MzYwYjNmYzk3OGZkNDA5YjdjMTdlZjNlMTkyCi1TaWduZWQtb2ZmLWJ5OiBL
aWVuYW4gU3Rld2FydCA8a3N0ZXdhcnRAZWZmaWNpb3MuY29tPgotU2lnbmVkLW9mZi1ieTogTWF0
aGlldSBEZXNub3llcnMgPG1hdGhpZXUuZGVzbm95ZXJzQGVmZmljaW9zLmNvbT4KLS0tLQotIGlu
Y2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50cy9jb21wYWN0aW9uLmggfCAxNyArKysrKysrKysr
KysrKysrLQotIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Ci0KLUluZGV4OiBsdHRuZy1tb2R1bGVzLTIuMTMuMTIvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24v
ZXZlbnRzL2NvbXBhY3Rpb24uaAotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGx0dG5nLW1vZHVsZXMtMi4xMy4x
Mi5vcmlnL2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50cy9jb21wYWN0aW9uLmgKLSsrKyBs
dHRuZy1tb2R1bGVzLTIuMTMuMTIvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24vZXZlbnRzL2NvbXBh
Y3Rpb24uaAotQEAgLTk3LDcgKzk3LDIyIEBAIExUVE5HX1RSQUNFUE9JTlRfRVZFTlRfSU5TVEFO
Q0VfTUFQKGNvbXAKLSAKLSAjZW5kaWYgLyogI2Vsc2UgI2lmIExUVE5HX0xJTlVYX1ZFUlNJT05f
Q09ERSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig0LDAsMCkgKi8KLSAKLS0jaWYgKExUVE5HX0xJ
TlVYX1ZFUlNJT05fQ09ERSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig1LDE4LDApIHx8IFwKLSsj
aWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig2LDks
MCkpCi0rTFRUTkdfVFJBQ0VQT0lOVF9FVkVOVF9NQVAobW1fY29tcGFjdGlvbl9taWdyYXRlcGFn
ZXMsCi0rCi0rCWNvbXBhY3Rpb25fbWlncmF0ZXBhZ2VzLAotKwotKwlUUF9QUk9UTyh1bnNpZ25l
ZCBpbnQgbnJfbWlncmF0ZXBhZ2VzLAotKwkJdW5zaWduZWQgaW50IG5yX3N1Y2NlZWRlZCksCi0r
Ci0rCVRQX0FSR1MobnJfbWlncmF0ZXBhZ2VzLCBucl9zdWNjZWVkZWQpLAotKwotKwlUUF9GSUVM
RFMoCi0rCQljdGZfaW50ZWdlcih1bnNpZ25lZCBsb25nLCBucl9taWdyYXRlZCwgbnJfc3VjY2Vl
ZGVkKQotKwkJY3RmX2ludGVnZXIodW5zaWduZWQgbG9uZywgbnJfZmFpbGVkLCBucl9taWdyYXRl
cGFnZXMgLSBucl9zdWNjZWVkZWQpCi0rCSkKLSspCi0rI2VsaWYgKExUVE5HX0xJTlVYX1ZFUlNJ
T05fQ09ERSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig1LDE4LDApIHx8IFwKLSAgICAgTFRUTkdf
UkhFTF9LRVJORUxfUkFOR0UoNSwxNCwwLDE2MywwLDAsIDUsMTUsMCwwLDAsMCkpCi0gTFRUTkdf
VFJBQ0VQT0lOVF9FVkVOVF9NQVAobW1fY29tcGFjdGlvbl9taWdyYXRlcGFnZXMsCi0gCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwNC1GaXgt
ZGV2X2Jhc2VfbG9jay1yZW1vdmVkLWluLWxpbnV4LTYuOS1yYzEucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwNC1GaXgtZGV2X2Jhc2VfbG9jay1yZW1v
dmVkLWluLWxpbnV4LTYuOS1yYzEucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDU5ZWY0ZjkzMTMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9s
dHRuZy1tb2R1bGVzLzAwMDQtRml4LWRldl9iYXNlX2xvY2stcmVtb3ZlZC1pbi1saW51eC02Ljkt
cmMxLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTcgKzAsMCBAQAotRnJvbSAyMTdiYzJlNDY4
NTA1MGRkZGNlOWJkZDI1NTdiNjRmNmI4YzE2NjIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogS2llbmFuIFN0ZXdhcnQgPGtzdGV3YXJ0QGVmZmljaW9zLmNvbT4KLURhdGU6IE1vbiwg
MjUgTWFyIDIwMjQgMTA6NTM6NDYgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSCA0LzRdIEZpeDogZGV2
X2Jhc2VfbG9jayByZW1vdmVkIGluIGxpbnV4IDYuOS1yYzEKLQotU2VlIHVwc3RyZWFtIGNvbW1p
dDoKLQotICAgIGNvbW1pdCAxYjNlZjQ2Y2I3ZjI2MThjYzBiNTA3MzkzMjIwYTY5ODEwZjZkYTEy
Ci0gICAgQXV0aG9yOiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+Ci0gICAgRGF0
ZTogICBUdWUgRmViIDEzIDA2OjMyOjQ1IDIwMjQgKzAwMDAKLQotICAgICAgICBuZXQ6IHJlbW92
ZSBkZXZfYmFzZV9sb2NrCi0KLSAgICAgICAgZGV2X2Jhc2VfbG9jayBpcyBub3QgbmVlZGVkIGFu
eW1vcmUsIGFsbCByZW1haW5pbmcgdXNlcnMgYWxzbyBob2xkIFJUTkwuCi0KLVVwc3RyZWFtLVN0
YXR1czogQmFja3BvcnQgWzUyZWIyZWU5IEZpeDogZGV2X2Jhc2VfbG9jayByZW1vdmVkIGluIGxp
bnV4IDYuOS1yYzFdCi0KLUNoYW5nZS1JZDogSTZiMDdlNmVlZDA3ZmQzOTgzMDJjYTE0ZDIzMTYy
ZWQyNGQ3NGRmMTUKLVNpZ25lZC1vZmYtYnk6IEtpZW5hbiBTdGV3YXJ0IDxrc3Rld2FydEBlZmZp
Y2lvcy5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBNYXRoaWV1IERlc25veWVycyA8bWF0aGlldS5kZXNu
b3llcnNAZWZmaWNpb3MuY29tPgotLS0tCi0gc3JjL2x0dG5nLXN0YXRlZHVtcC1pbXBsLmMgfCAx
NSArKysrKysrKysrKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQotCi1J
bmRleDogbHR0bmctbW9kdWxlcy0yLjEzLjEyL3NyYy9sdHRuZy1zdGF0ZWR1bXAtaW1wbC5jCi09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09Ci0tLS0gbHR0bmctbW9kdWxlcy0yLjEzLjEyLm9yaWcvc3JjL2x0dG5nLXN0YXRl
ZHVtcC1pbXBsLmMKLSsrKyBsdHRuZy1tb2R1bGVzLTIuMTMuMTIvc3JjL2x0dG5nLXN0YXRlZHVt
cC1pbXBsLmMKLUBAIC0zOTIsNiArMzkyLDIwIEBAIHZvaWQgbHR0bmdfZW51bWVyYXRlX2Rldmlj
ZShzdHJ1Y3QgbHR0bmcKLSAJfQotIH0KLSAKLSsjaWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09E
RSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig2LDksMCkpCi0rc3RhdGljCi0raW50IGx0dG5nX2Vu
dW1lcmF0ZV9uZXR3b3JrX2lwX2ludGVyZmFjZShzdHJ1Y3QgbHR0bmdfa2VybmVsX3Nlc3Npb24g
KnNlc3Npb24pCi0rewotKwlzdHJ1Y3QgbmV0X2RldmljZSAqZGV2OwotKwotKwlydG5sX2xvY2so
KTsKLSsJZm9yX2VhY2hfbmV0ZGV2KCZpbml0X25ldCwgZGV2KQotKwkJbHR0bmdfZW51bWVyYXRl
X2RldmljZShzZXNzaW9uLCBkZXYpOwotKwlydG5sX3VubG9jaygpOwotKwotKwlyZXR1cm4gMDsK
LSt9Ci0rI2Vsc2UKLSBzdGF0aWMKLSBpbnQgbHR0bmdfZW51bWVyYXRlX25ldHdvcmtfaXBfaW50
ZXJmYWNlKHN0cnVjdCBsdHRuZ19rZXJuZWxfc2Vzc2lvbiAqc2Vzc2lvbikKLSB7Ci1AQCAtNDA0
LDYgKzQxOCw3IEBAIGludCBsdHRuZ19lbnVtZXJhdGVfbmV0d29ya19pcF9pbnRlcmZhY2UKLSAK
LSAJcmV0dXJuIDA7Ci0gfQotKyNlbmRpZiAvKiAoTFRUTkdfTElOVVhfVkVSU0lPTl9DT0RFID49
IExUVE5HX0tFUk5FTF9WRVJTSU9OKDYsOSwwKSkgKi8KLSAjZWxzZSAvKiBDT05GSUdfSU5FVCAq
LwotIHN0YXRpYyBpbmxpbmUKLSBpbnQgbHR0bmdfZW51bWVyYXRlX25ldHdvcmtfaXBfaW50ZXJm
YWNlKHN0cnVjdCBsdHRuZ19rZXJuZWxfc2Vzc2lvbiAqc2Vzc2lvbikKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjEyLmJiIGIvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTMuMTMuYmIKc2ltaWxhcml0eSBp
bmRleCA3NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1
bGVzXzIuMTMuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmct
bW9kdWxlc18yLjEzLjEzLmJiCmluZGV4IDk1ZDVlMmQ2MTUuLjBmMDU2MjJiZDQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjEyLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjEzLmJiCkBA
IC0xMCwxNiArMTAsMTMgQEAgaW5oZXJpdCBtb2R1bGUKIGluY2x1ZGUgbHR0bmctcGxhdGZvcm1z
LmluYwogCiBTUkNfVVJJID0gImh0dHBzOi8vbHR0bmcub3JnL2ZpbGVzLyR7QlBOfS8ke0JQTn0t
JHtQVn0udGFyLmJ6MiBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLUZpeC1BU29DLXNuZF9kb2Nf
ZGFwbS1vbi1saW51eC02LjktcmMxLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItRml4
LUFTb0MtYWRkLWNvbXBvbmVudC10by1zZXRfYmlhc19sZXZlbC1ldmVudHMtaW4tbC5wYXRjaCBc
Ci0gICAgICAgICAgIGZpbGU6Ly8wMDAzLUZpeC1tbV9jb21wYWN0aW9uX21pZ3JhdGVwYWdlcy1j
aGFuZ2VkLWluLWxpbnV4LTYuOS0ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwNC1GaXgt
ZGV2X2Jhc2VfbG9jay1yZW1vdmVkLWluLWxpbnV4LTYuOS1yYzEucGF0Y2ggXAotICAgICAgICAi
CisgICAgICAgICAgIGZpbGU6Ly8wMDAxLXNyYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklH
X1RSQUNFUE9JTlRTLXRvLXdhcm4ucGF0Y2ggXAorICAgICAgICAgICAiCiAKICMgVXNlIDphcHBl
bmQgaGVyZSBzbyB0aGF0IHRoZSBwYXRjaCBpcyBhcHBsaWVkIGFsc28gd2hlbiB1c2luZyBkZXZ1
cHN0cmVhbQogU1JDX1VSSTphcHBlbmQgPSAiIGZpbGU6Ly8wMDAxLXNyYy1LYnVpbGQtY2hhbmdl
LW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdhcm4ucGF0Y2giCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJkODVmY2I2NmM3YmQzMTAwM2FiODczNWU4Yzc3NzAwZTVlNGY0MTdiNGMyMmZl
MWYyMDExMmNmNDM1YWJhZDc5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdkMjZjMDdhNWU4MGI2
NmFhN2JkY2ZkYWFmNDg1N2YwMGZjOWE1Y2RkZTc5MjI2YjI1Mjg2NzY3MDBkNTAyMjgiCiAKIGV4
cG9ydCBJTlNUQUxMX01PRF9ESVI9Imtlcm5lbC9sdHRuZy1tb2R1bGVzIgogCi0tIAoyLjQ0LjAK
Cg==

--===============0990314246777744037==--

