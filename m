Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB50602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 19:31:04 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id x35so10529400ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=apfPy7MMH+NKC321hPXolffLcawoTf0fGzSsK/d5suI=;
	b=saI2TC7Ym0so8NW9mdQ7x8KqtF6nBBX6EZfURtVdEz3x8kSEFGR6YBeY/Elq6oKGo1
	IuJu+u6zPc0kLSwb/Y/AD3HqRbnpKh1i2yJq5/rclQwNB9vGHrp4NS47tiOYXzVRBsAs
	HYEQHZmRXL5Hadjj4IT6CbVwD5RE5rOxqfGOs4+7j34HYMt8GlEw2eGY2H9UvxdpL0ke
	jt6bdPDV+NocuBiwanoK+fyrDpPWeh5hOftRXhcbLGAQ5+9fV/GwsOGm0tRwBTJq8ePy
	buZ9VSlYvhbN1NOqHsCsbg6mtPosOjzuLjSimfOHFfd1Ru8k5BDw1xjLPtAjo7HlWEjd
	ZWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=apfPy7MMH+NKC321hPXolffLcawoTf0fGzSsK/d5suI=;
	b=Lu4QBP6sjMPgFEOoZOwnribjYntrtMkfL/hxD7LHVlqR/Wa8D+LIEMGF8Z9EMDeQ/X
	c360R8z0dwHH2KSHt7UqdeHpahXjRs67YMTWmFIQGH5gr/Q3uyZrCPD3247UUXvS+MYW
	XMoXGadoc4fUsIqGS4nmcBBgy3aTfnHU7UBS9pL8p6/lUaJe3Fkf+lv2h3PjOABd+yMQ
	v4TLo09UHsnU61hogF+Gv65YZnT3w1yzXWR0OXpq4ADrZVi0mTcV/mhGYnmCOUSYoXD5
	gZ4uITbDyXg2mOc+EckUAz1zoOgJk5vnlcCxiXMbrtoI9ZNipKEycRqpNGlcZZ2/NtWt
	8ZMg==
X-Gm-Message-State: AOPr4FXoOJztQ7Yy8z5OlTJq0dKgyNawp3a5BFm8lwgdSTKCcmBm596ufRDA+WCTvLI1Yg==
X-Received: by 10.107.137.166 with SMTP id t38mr19596820ioi.31.1462476665634; 
	Thu, 05 May 2016 12:31:05 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	g186sm4660680iof.27.2016.05.05.12.31.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 May 2016 12:31:04 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2016 12:30:56 -0700
Message-Id: <46bd326e540e30daf021a489c4a1c30568712f39.1462476586.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <e944ff3a1104badb75b034a6ec399805d1796c38.1462476586.git.chris_larson@mentor.com>
References: <e944ff3a1104badb75b034a6ec399805d1796c38.1462476586.git.chris_larson@mentor.com>
In-Reply-To: <cover.1462476586.git.chris_larson@mentor.com>
References: <cover.1462476586.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [master][PATCH 3/3] pong-clock: obey CFLAGS, LDFLAGS
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
X-List-Received-Date: Thu, 05 May 2016 19:31:05 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
index 0e1a792..6c3bcd8 100644
--- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://pong-clock-no-flicker.c;beginline=1;endline=23;md5=dd
 S = "${WORKDIR}"
 
 do_compile () {
-	${CC} -o pong-clock pong-clock-no-flicker.c `pkg-config --cflags --libs x11 xau xdmcp`
+	${CC} ${CFLAGS} ${LDFLAGS} -o pong-clock pong-clock-no-flicker.c `pkg-config --cflags --libs x11 xau xdmcp`
 }
 
 do_install () {
-- 
2.8.0


