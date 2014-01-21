Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id E70946DC53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 2E82B19DA9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F2p7FAARqOVb
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:42 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 23B641A048
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 0DB71355
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id F3AB9A99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id F284A3E06F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s0LFMbQv015066
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s0LFMbx6015065
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jan 2014 16:22:37 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 16:22:32 +0100
Message-Id: <189342ea94a021cf7fbe9b715387c38738f1aac6.1390317718.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
Subject: [PATCH 2/5] pybootchartgui: Correct the legend
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
X-List-Received-Date: Tue, 21 Jan 2014 15:23:45 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 299cced..4a2ffd7 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -420,7 +420,7 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
 	draw_legend_box (ctx, "Install", \
 			 TASK_COLOR_INSTALL, off_x+240, curr_y + 45, leg_s)
 	draw_legend_box (ctx, "Populate Sysroot", \
-			 TASK_COLOR_SYSROOT, off_x+480, curr_y + 45, leg_s)
+			 TASK_COLOR_SYSROOT, off_x+360, curr_y + 45, leg_s)
 	draw_legend_box (ctx, "Package", \
 			 TASK_COLOR_PACKAGE, off_x+480, curr_y + 45, leg_s)
 	draw_legend_box (ctx, "Package Write",
-- 
1.8.4


