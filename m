Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC676DA8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 3FA0F25B00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AyWA9lr7pekh
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:10 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id D717625B0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C0EE3BEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id B20BEBE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id ACD343E06F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id rAFH98ve014836
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id rAFH98nf014835
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 18:09:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 18:08:54 +0100
Message-Id: <86de098387239c3529d652869fa59a1b0cfc83c3.1384535211.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
Subject: [PATCH 05/14] pybootchartgui: Use correct header height
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
X-List-Received-Date: Fri, 15 Nov 2013 17:09:10 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 9cbcbc1..b1ad6e6 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -278,7 +278,7 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
 
 bar_h = 55
 meminfo_bar_h = 2 * bar_h
-header_h = 110 + 2 * (30 + bar_h) + 1 * (30 + meminfo_bar_h)
+header_h = 60
 # offsets
 off_x, off_y = 220, 10
 sec_w_base = 1 # the width of a second
@@ -389,7 +389,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 	return curr_y
 
 def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
-        chart_rect = [off_x, curr_y+60, w, h - 2 * off_y - (curr_y+60) + proc_h]
+        chart_rect = [off_x, curr_y+header_h, w, h - 2 * off_y - (curr_y+header_h) + proc_h]
 
 	draw_legend_box (ctx, "Configure", \
 			 TASK_COLOR_CONFIGURE, off_x  , curr_y + 45, leg_s)
@@ -407,7 +407,7 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
 	draw_box_ticks(ctx, chart_rect, sec_w)
 	draw_sec_labels(ctx, chart_rect, sec_w, 30)
 
-	y = curr_y+60
+	y = curr_y+header_h
 
         offset = min(trace.start.keys())
         for s in sorted(trace.start.keys()):
-- 
1.8.4


