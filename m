Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8022FE51F3
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 09:26:23 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17517.1777022774459733821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 02:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KYW2h7Dp;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: mail2szahir@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f8893bff3so3631202b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777022774; x=1777627574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPJ2Uo25r3WBfgMypQMIDIDn2BDpnaysciv3vxBx+rI=;
        b=KYW2h7Dp03pjPdnXSbAi8EtHlo5Sn81B/jb6KcJrBFDNDXfDUjK1yIalWQPD/s0PQM
         LurPMYr5GajwCk124ib88kljLDjLclsJKQm5SQ8YJr9pw7X7EoxVG9JkFXq40eGvUCD+
         UasMgEOlbGScIly1nsAm9dZ0Hmy6mHKU7OI2zmsthM4TRT2TT5NPFAsZB019OcSmDSfe
         JumEuAkn5RERe17yFrBP0mHkMH9vpbcwL2hRRmcTYEgyhrB0cPLNscC2wC0ocvDcEEF2
         t0HFVb1RcQ/eSRd3vBVSrk07U6ix1rIEmoVHG5b9L++QKB40Kc4DhHjmNMccV8SuqBlo
         ZZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022774; x=1777627574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPJ2Uo25r3WBfgMypQMIDIDn2BDpnaysciv3vxBx+rI=;
        b=KXTBRAkwELHvj5E+7pXFrJToqkISYiF6oPsp4id4LkQU2dpo0SLRr6WGlKKs5XFLQp
         28o8kw+zaabhKPB3OxtoMQiZyHyZJ2FYIobBldJsdzsDDzoAn/jFoNBRKCILT2J3cpT5
         0cjISHffznRDKhkIf89IAtydNwSZjNII/uVV9EuyUTgd7X7XxEuEJkntiSzc0RJnOINo
         ydGkA31NEMN1J0oeRZiLqPfSHChzUnZZ8tZSQe8UsW7YKLsHlERNfnOHvUj2tfOVlm2x
         0g12TNK+0hzZ6oYQlbF4Um+giPU7Rk1y1kflIWNCxobbXBDARRXrzOXowqMoc3pk1kOB
         SxSA==
X-Gm-Message-State: AOJu0YzT0HbpdeEyHRumJ/OWytaVKJBdp0+igMmSorwVdtLheh2cXaZA
	ZJNHxybkHj5fUMYrlh9Pr+g77QYAIB2S2Vo+r9LBgsyyIF8JQEyCCv/uNvsTTQ==
X-Gm-Gg: AeBDiesQPGYVibz+jwdEXhlUgEyrdidCNMDQ6e6iDDsIBbUyrIdIrxSpG88i+hU+nUX
	fRMkcBvAncAbQJaxfCb/jBE6xEBuZkxFlchLw75Hd44CGWad1Qql+nvIxcAPP9PRBMiLtuufuF0
	WJ2NJfYJDSjNfLZhPYuP4rjvuK3nPVpcQ1/Nax1kId++VeyE8n2ycJSCZMoiQjtL9XYyyisI2aC
	k39BcxM47MQuvXbmrQjcVxsETaU+n70hLJEK7vAYo/IuwBT1OtJ48TDXIdMiwDsX49VOV0kKGVI
	HUcM//UoiIj4H2dW1658hcfMvfr8zNNgmVrYz7aQbUCA+s/jOFv+hjg2/SvBrdp/XYvlaf6fGjE
	9bNP9HI7VurIWFOmXmgA/zJNlKugZdXF91ro99qSF5shdyZJ8VqzZdnuAY48KoFsPPnJ1DBZkP1
	BNya4MTt932HTu9O0Cp22FW0wSLentge2YdxyE+cSeRG6BZVl4Leav/LH0
X-Received: by 2002:a05:6a00:9291:b0:82c:dd31:b844 with SMTP id d2e1a72fcca58-82f8c96626fmr32108946b3a.40.1777022773437;
        Fri, 24 Apr 2026 02:26:13 -0700 (PDT)
Received: from L-17367L.kpit.com ([49.47.218.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9f7735sm23268159b3a.21.2026.04.24.02.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:26:13 -0700 (PDT)
From: Zahir Hussain <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@partner.bmwgroup.com>
To: openembedded-core@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: mail2szahir@gmail.com
Subject: [OE-core][scarthgap][PATCH] systemd-analyze: add SVG scaling and detailed timestamps
Date: Fri, 24 Apr 2026 14:54:33 +0530
Message-Id: <20260424092433.3222272-1-zahir.basha@partner.bmwgroup.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 09:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235850

From: Zahir Hussain <zahir.basha@kpit.com>

Enhance the `plot` command with two new options for better visualization:
 `--scale-svg=<FACTOR>`: Scales the x-axis to improve plot readability.
 `--detailed`: Adds activation timestamps to the SVG output.

This is a backport of the following upstream commit:
https://github.com/systemd/systemd/commit/1592d2f900c25251ece2670c71d957806f48216b

This improves the readability of boot analysis plots when dealing
with complex or high-density timing data.

Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 ...temd-analyze-Add-svg-scaling-options.patch | 167 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-systemd-analyze-Add-svg-scaling-options.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-systemd-analyze-Add-svg-scaling-options.patch b/meta/recipes-core/systemd/systemd/0023-systemd-analyze-Add-svg-scaling-options.patch
new file mode 100644
index 0000000000..9bae1654d2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-systemd-analyze-Add-svg-scaling-options.patch
@@ -0,0 +1,167 @@
+From 6f1af79ed9515771113ea5b39ac7b267cac66dc7 Mon Sep 17 00:00:00 2001
+From: rajmohan r <rajmohan.r@kpit.com>
+Date: Thu, 8 Aug 2024 15:09:35 +0530
+Subject: [PATCH] systemd-analyze: Add svg scaling options
+
++ Scale the x-axis of the resulting plot by a factor (default 1.0)
++ Add activation timestamps to each bar
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/1592d2f900c25251ece2670c71d957806f48216b]
+
+comment: refresh the patch according to source code and Changes to 
+test/units/TEST-65-ANALYZE.sh do not take effect because the file
+is not available in the source code.
+
+Signed-off-by: rajmohan r <rajmohan.r@kpit.com>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ man/systemd-analyze.xml               | 18 ++++++++++++++++++
+ shell-completion/bash/systemd-analyze |  2 +-
+ src/analyze/analyze-plot.c            |  7 ++++++-
+ src/analyze/analyze.c                 | 17 +++++++++++++++++
+ src/analyze/analyze.h                 |  2 ++
+ 5 files changed, 42 insertions(+), 2 deletions(-)
+
+diff --git a/man/systemd-analyze.xml b/man/systemd-analyze.xml
+index 35ad8435f4f..9a7998b3f6d 100644
+--- a/man/systemd-analyze.xml
++++ b/man/systemd-analyze.xml
+@@ -1499,6 +1499,24 @@ NR NAME                SHA256
+         <xi:include href="version-info.xml" xpointer="v255"/></listitem>
+       </varlistentry>
+ 
++      <varlistentry>
++        <term><option>--scale-svg=<replaceable>FACTOR</replaceable></option></term>
++
++        <listitem><para>When used with the <command>plot</command> command, the x-axis of the plot
++        can be stretched by FACTOR (default: 1.0).</para>
++
++        <xi:include href="version-info.xml" xpointer="v255"/></listitem>
++      </varlistentry>
++
++      <varlistentry>
++        <term><option>--detailed</option></term>
++
++        <listitem><para>When used with the <command>plot</command> command, activation timestamps
++        details can be seen in SVG plot.</para>
++
++        <xi:include href="version-info.xml" xpointer="v255"/></listitem>
++      </varlistentry>
++
+       <xi:include href="standard-options.xml" xpointer="help" />
+       <xi:include href="standard-options.xml" xpointer="version" />
+       <xi:include href="standard-options.xml" xpointer="no-pager" />
+diff --git a/shell-completion/bash/systemd-analyze b/shell-completion/bash/systemd-analyze
+index 1fde67218b9..781cb1572e2 100644
+--- a/shell-completion/bash/systemd-analyze
++++ b/shell-completion/bash/systemd-analyze
+@@ -196,7 +196,7 @@ _systemd_analyze() {
+ 
+     elif __contains_word "$verb" ${VERBS[PLOT]}; then
+         if [[ $cur = -* ]]; then
+-            comps='--help --version --system --user --global --no-pager --json=off --json=pretty --json=short --table --no-legend'
++            comps='--help --version --system --user --global --no-pager --json=off --json=pretty --json=short --table --no-legend --scale-svg --detailed'
+         fi
+     fi
+ 
+diff --git a/src/analyze/analyze-plot.c b/src/analyze/analyze-plot.c
+index 81fc25b31e0..70a903e0db1 100644
+--- a/src/analyze/analyze-plot.c
++++ b/src/analyze/analyze-plot.c
+@@ -12,7 +12,7 @@
+ #include "unit-def.h"
+ #include "version.h"
+ 
+-#define SCALE_X (0.1 / 1000.0) /* pixels per us */
++#define SCALE_X (0.1 * arg_svg_timescale / 1000.0) /* pixels per us */
+ #define SCALE_Y (20.0)
+ 
+ #define svg(...) printf(__VA_ARGS__)
+@@ -30,6 +30,9 @@
+                 svg("</text>\n");                                       \
+         } while (false)
+ 
++#define svg_timestamp(b, t, y) \
++        svg_text(b, t, y, "%u.%03us", (unsigned)((t) / USEC_PER_SEC), (unsigned)(((t) % USEC_PER_SEC) / USEC_PER_MSEC))
++
+ 
+ typedef struct HostInfo {
+         char *hostname;
+@@ -358,6 +361,8 @@ static int produce_plot_as_svg(
+         svg_bar("generators", boot->generators_start_time, boot->generators_finish_time, y);
+         svg_bar("unitsload", boot->unitsload_start_time, boot->unitsload_finish_time, y);
+         svg_text(true, boot->userspace_time, y, "systemd");
++        if (arg_detailed_svg)
++                svg_timestamp(false, boot->userspace_time, y);
+         y++;
+ 
+         for (; u->has_data; u++)
+diff --git a/src/analyze/analyze.c b/src/analyze/analyze.c
+index 021de65bdbf..457f9e59cc8 100644
+--- a/src/analyze/analyze.c
++++ b/src/analyze/analyze.c
+@@ -99,6 +99,8 @@ RuntimeScope arg_runtime_scope = RUNTIME_SCOPE_SYSTEM;
+ RecursiveErrors arg_recursive_errors = _RECURSIVE_ERRORS_INVALID;
+ bool arg_man = true;
+ bool arg_generators = false;
++double arg_svg_timescale = 1.0;
++bool arg_detailed_svg = false;
+ char *arg_root = NULL;
+ static char *arg_image = NULL;
+ char *arg_security_policy = NULL;
+@@ -271,6 +273,9 @@ static int help(int argc, char *argv[], void *userdata) {
+                "     --profile=name|PATH     Include the specified profile in the\n"
+                "                             security review of the unit(s)\n"
+                "     --table                 Output plot's raw time data as a table\n"
++               "     --scale-svg=FACTOR      Stretch x-axis of plot by FACTOR (default: 1.0)\n"
++               "     --detailed              Add more details to SVG plot,\n"
++               "                             e.g. show activation timestamps\n"
+                "  -h --help                  Show this help\n"
+                "     --version               Show package version\n"
+                "  -q --quiet                 Do not emit hints\n"
+@@ -319,6 +324,8 @@ static int parse_argv(int argc, char *argv[]) {
+                 ARG_TABLE,
+                 ARG_NO_LEGEND,
+                 ARG_TLDR,
++                ARG_SCALE_FACTOR_SVG,
++                ARG_DETAILED_SVG,
+         };
+ 
+         static const struct option options[] = {
+@@ -353,6 +360,8 @@ static int parse_argv(int argc, char *argv[]) {
+                 { "table",            optional_argument, NULL, ARG_TABLE            },
+                 { "no-legend",        optional_argument, NULL, ARG_NO_LEGEND        },
+                 { "tldr",             no_argument,       NULL, ARG_TLDR             },
++                { "scale-svg",        required_argument, NULL, ARG_SCALE_FACTOR_SVG },
++                { "detailed",         no_argument,       NULL, ARG_DETAILED_SVG     },
+                 {}
+         };
+ 
+@@ -546,6 +555,14 @@ static int parse_argv(int argc, char *argv[]) {
+                         arg_cat_flags = CAT_TLDR;
+                         break;
+ 
++                case ARG_SCALE_FACTOR_SVG:
++                        arg_svg_timescale = strtod(optarg, NULL);
++                        break;
++
++                case ARG_DETAILED_SVG:
++                        arg_detailed_svg = true;
++                        break;
++
+                 case '?':
+                         return -EINVAL;
+ 
+diff --git a/src/analyze/analyze.h b/src/analyze/analyze.h
+index 8a9528c0d3b..ddd4ad547c7 100644
+--- a/src/analyze/analyze.h
++++ b/src/analyze/analyze.h
+@@ -28,6 +28,8 @@ extern RuntimeScope arg_runtime_scope;
+ extern RecursiveErrors arg_recursive_errors;
+ extern bool arg_man;
+ extern bool arg_generators;
++extern double arg_svg_timescale;
++extern bool arg_detailed_svg;
+ extern char *arg_root;
+ extern char *arg_security_policy;
+ extern bool arg_offline;
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index 87e186bbfa..2d5badb489 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -29,6 +29,7 @@ SRC_URI += " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
+           file://0023-systemd-analyze-Add-svg-scaling-options.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


