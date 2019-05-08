Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 88A777DDB5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:59:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id l2so26621975wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qTvwIws4neQeXH6S+MNGA+D6MR7YqcVBjh7VmqX7PSM=;
	b=IyTMQJBNghnsmwf8oBSL7zQHdgiRgezoqkHeZAQqhqaTnrwqAmpZMFla3gRKprCPSx
	RSOZehJT2/+ec6HJit0uUzsPeWocVK+0xHny7FKXC4zT5yA6n8+z+FDJNJdp785rOLN0
	fBWXdsFHw6pi9rR9kVrGez8k043cv/TrQN9sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qTvwIws4neQeXH6S+MNGA+D6MR7YqcVBjh7VmqX7PSM=;
	b=qpiBLw2+USGqFbJunLbqrCtkRQPwcIk8bRV7zSypTedjQtuklVtWth5pC9eccWK9xc
	MRc6H6cmpg7ql+a7XqxYP3Hf2mB17GArsaIYHP+pgLRZEqicM4R55cttOzyCZrGKhT71
	VOUmYq6ak/n97XkqURG7S/C6xCiebOA25o4AiBfooEayW6nl4QK2ghmqRYWOLmwZA8c9
	Je3k17jqZU9RWoHarr9+j43VdThBDnct15j5jUlZhK6EtML+XzokC9nl2pkIq4eWO5kR
	x1o0oHxpTIa8S6KQukBqE7XMa8uqrG483Tj8lPDZRskw6PrGGRIN1N+sQE+cx3NHMf5A
	Z0mw==
X-Gm-Message-State: APjAAAXje9dbqscXn1yKr9qUXa/n2pXM9ay6SiSakwWJKWm6IUYUAHqw
	5/bRkg43G9/JfxUC3YqHpF+zamWUoC0=
X-Google-Smtp-Source: APXvYqzlsWu6IZMxWd3IqVNeVYuOKcaEK9cffQiYrl96ECvmndAZQfGR9UQ9Lt+H1GRSKqZ4LumnZw==
X-Received: by 2002:adf:8b0b:: with SMTP id n11mr28471885wra.149.1557313197063;
	Wed, 08 May 2019 03:59:57 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p13sm2911053wmb.0.2019.05.08.03.59.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 03:59:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 11:59:48 +0100
Message-Id: <20190508105949.24942-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508105949.24942-1-richard.purdie@linuxfoundation.org>
References: <20190508105949.24942-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/4] scripts/pybootchart/draw: Clarify some variable names
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
X-List-Received-Date: Wed, 08 May 2019 10:59:57 -0000
Content-Transfer-Encoding: 8bit

This tweaks some intermediate variable names to make it clearer what
is being done.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 99b3caacc7f..b3184411cbc 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -513,18 +513,19 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
     y = curr_y+header_h
 
     offset = trace.min or min(trace.start.keys())
-    for s in sorted(trace.start.keys()):
-        for val in sorted(trace.start[s]):
+    for start in sorted(trace.start.keys()):
+        for process in sorted(trace.start[start]):
             if not options.app_options.show_all and \
-                    trace.processes[val][1] - s < options.app_options.mintime:
+                    trace.processes[process][1] - start < options.app_options.mintime:
                 continue
-            task = val.split(":")[1]
-            #print(val)
-            #print(trace.processes[val][1])
+            task = process.split(":")[1]
+
+            #print(process)
+            #print(trace.processes[process][1])
             #print(s)
 
-            x = chart_rect[0] + (s - offset) * sec_w
-            w = ((trace.processes[val][1] - s) * sec_w)
+            x = chart_rect[0] + (start - offset) * sec_w
+            w = ((trace.processes[process][1] - start) * sec_w)
 
             #print("proc at %s %s %s %s" % (x, y, w, proc_h))
             col = None
@@ -549,7 +550,7 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
                 draw_fill_rect(ctx, col, (x, y, w, proc_h))
             draw_rect(ctx, PROC_BORDER_COLOR, (x, y, w, proc_h))
 
-            draw_label_in_box(ctx, PROC_TEXT_COLOR, val, x, y + proc_h - 4, w, proc_h)
+            draw_label_in_box(ctx, PROC_TEXT_COLOR, process, x, y + proc_h - 4, w, proc_h)
             y = y + proc_h
 
     return curr_y
-- 
2.20.1


