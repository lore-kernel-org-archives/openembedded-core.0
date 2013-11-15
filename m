Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 916CC6DA6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 48F4E25B0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LgDZDwkJMl2p
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:16 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 3480425B17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 1F683BF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 1D88FBE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 1C7EE34055
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id rAFH99uR014868
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id rAFH99ZY014867
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 18:09:09 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 18:09:02 +0100
Message-Id: <34cab22821bd6dd91f836c83f1502cee480d30ba.1384535211.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
Subject: [PATCH 13/14] pybootchartgui: Add a color for the package_write_* tasks
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
X-List-Received-Date: Fri, 15 Nov 2013 17:09:15 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 718d95e..2a26160 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -130,6 +130,8 @@ TASK_COLOR_INSTALL = (1.0, 0.00, 1.00, 1.0)
 TASK_COLOR_SYSROOT = (0.0, 0.00, 1.00, 1.0)
 # Package task color
 TASK_COLOR_PACKAGE = (0.0, 1.00, 1.00, 1.0)
+# Package Write RPM/DEB/IPK task color
+TASK_COLOR_PACKAGE_WRITE = (0.0, 0.50, 0.50, 1.0)
 
 # Process states
 STATE_UNDEFINED = 0
@@ -418,6 +420,8 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
 			 TASK_COLOR_SYSROOT, off_x+480, curr_y + 45, leg_s)
 	draw_legend_box (ctx, "Package", \
 			 TASK_COLOR_PACKAGE, off_x+480, curr_y + 45, leg_s)
+	draw_legend_box (ctx, "Package Write",
+			 TASK_COLOR_PACKAGE_WRITE, off_x+600, curr_y + 45, leg_s)
 
 	ctx.set_font_size(PROC_TEXT_FONT_SIZE)
 
@@ -451,6 +455,10 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
                     col = TASK_COLOR_SYSROOT
                 elif task == "do_package":
                     col = TASK_COLOR_PACKAGE
+                elif task == "do_package_write_rpm" or \
+                     task == "do_package_write_deb" or \
+                     task == "do_package_write_ipk":
+                    col = TASK_COLOR_PACKAGE_WRITE
                 else:
                     col = WHITE
 
-- 
1.8.4


