Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4F15F7D90E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 23:31:27 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id e24so7635752pfi.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 16:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VmT0Lyzd3XBJCsoAl2LSSxEc1jJcGDI5u5QNYv/Jrlo=;
	b=oNoiCExbQ2p9W59EvHTzfE3WjBe4aUtulyW9RcqRd1RSzc3lusogMiC2A0LcqsutG7
	YTBAWm3JpjsKse58oZzdpHjn1mTZq3UNi4T2ZYnRlTjP1QUPr3TIbUNvouK4+yntvzpE
	RBy47sfSsnKa8bUX+rlLfOumfOqM6hxTdysC7u8A+LtacnzMvnjAEuR73YAQ/eEHOrMp
	znQ3Lv4lWapEJqb6ZP7iqds8t8330o/AYM2/cCQqx8tNh4WjyhyZQJSUPrkKNGgf7tCW
	TD6j8ImWGY8BCVl6Egs439+FdTocwR9OBgy7sMMxv8dDSvwgIgM6khhPDVGqEOCj8POp
	a0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VmT0Lyzd3XBJCsoAl2LSSxEc1jJcGDI5u5QNYv/Jrlo=;
	b=MOfPlSHfSNxcKkvltxV2GtShsgnNA2iVLWIMkucIMA718joM2zBXI2yljLx7h82Evp
	EuTNba5yiAW6bxUw8sh+hgjuJ+veLlRhIWoyWvGs8MaWyQ1iRyh43MGD25N+6bKbC9Tw
	GBhLVtN50MddP+/ODotbaFjD0QU/8RNcrGECVNnSrEhqvEOttAgHfdr/ry0SoZTFDpFK
	wOLpdey1smOcQ1SehLY8oDMKLVANYWhdObZ0hWhwgUxj6MoV+SegyLpJBIJcKyOTQIaq
	PrwRy2ASPJ+e+JiRlGPzNfQuOaZUB1JQzWtoAuikzNz7+SjEjxxnmJ4W5kglBd3vq+86
	PDlg==
X-Gm-Message-State: APjAAAW4PwMSYKrETCUF1p6+ujWj+Gk1ua5cMl1a7qFRg1jkKGqvojTK
	xjJ13NH+rR2Oa8/B3hJkYGcWrW0iiAI=
X-Google-Smtp-Source: APXvYqyXwjZhXDJ1PPUmkilOF0DRTRhQVrQXeJL+IxRh9tMqDbWzUdmgBOdwQqRXoA0VunJqkGLF8Q==
X-Received: by 2002:a63:7141:: with SMTP id b1mr66627604pgn.331.1555284687740; 
	Sun, 14 Apr 2019 16:31:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::6a6c])
	by smtp.gmail.com with ESMTPSA id
	e126sm118953883pfh.35.2019.04.14.16.31.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Apr 2019 16:31:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2019 16:31:17 -0700
Message-Id: <20190414233117.24636-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] musl: Upgrade to master past 1.1.22
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
X-List-Received-Date: Sun, 14 Apr 2019 23:31:27 -0000
Content-Transfer-Encoding: 8bit

Changes are here
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=43e7efb46555f13a556d92944ac05c19b8929b60..65c8be380431eebe4d70d130bd38563f8df9a7d7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 2d8dab90dd..1e324804e1 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,9 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "43e7efb46555f13a556d92944ac05c19b8929b60"
+SRCREV = "65c8be380431eebe4d70d130bd38563f8df9a7d7"
 
-BASEVER = "1.1.21"
+BASEVER = "1.1.22"
 
 PV = "${BASEVER}+git${SRCPV}"
 
-- 
2.21.0


