Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id E720F7C74F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:58:13 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id j5so11685848pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tAOrnRwsn7bCAGy1VFOQQHGVCzl7jgJPkB7H/8kLMP4=;
	b=oieGoUjGvu4wkdy3uaFvCHqwCq/fe3dSbiaa08IHq14EAiG9N3/L/SX/xxMwLdnvyy
	xLeGCMwY+eduHTFuUTvzGmNot5iyYJ0r1cVY1/z7QgXj9ZY+os8+5NPVdF0B2jbPm5Og
	BxupUCcyf8HUtpEh60uaDlEN5MEvXfBns5InQbCSZ0MKEM/E+qQJxhDX20wpn4VvpMKZ
	NTlPhBVLl2tZ2IHBV1LbyBlKu2q89/B0641XIY9wbX42KnHrPlMy64wQSM8x89+COWXg
	dnTW1f9u7IH+0U283yVn1Ryax7jI0hO+Fn4GSEqYVFxf6jZfUsFu5O5PGVKLr0esLVwc
	htwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tAOrnRwsn7bCAGy1VFOQQHGVCzl7jgJPkB7H/8kLMP4=;
	b=Nea0HLvx2uu38gOjJ6YWX7E3CzS5PYiyaJsItkf24pJw9CEnxqKtrDoCs/CbmrDai5
	og3pqP8crAQuGVGfBi+wKYzwKunzBjGM5Jtf0JGSFodH7Njw+B/pDCOGqJCVVrWFNN5x
	zi5rTJUXVbwAFCNbIKz52/q9kHti467beyf1H/SGc17ldzc4wqt5okaGZrzBV+j4jguF
	7rn8zPbOLiKYLvj+b3iYSv+fpkJ0gDVQnfu5Asu9nB5lEceZfXJLzOQVLweC+BUaqGT8
	ZmgCMw5kZA5s9Lr1iYpI7l7uQBpET6OUjdxCWufdZxR6WfpbzuMfT1B9uXQKEoWZKsM0
	xjlA==
X-Gm-Message-State: APjAAAX4ljhzjW0y1cFD7o52s6H6lUKq0aUlWUUvJgWCzsRMaLbDi3DM
	Xn5IFBLIB1kmPOgpVD6H9XNYJ/G6
X-Google-Smtp-Source: APXvYqxWC01jkVTxm1afp4xwwtz8Mc1u8p1A/DhEdmj/Km/ruRXYozGvDQVnZ2whk0/YULXqOwcCBA==
X-Received: by 2002:a65:510c:: with SMTP id f12mr18950012pgq.40.1552928294759; 
	Mon, 18 Mar 2019 09:58:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	n82sm4595910pfi.63.2019.03.18.09.58.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 09:58:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 09:58:03 -0700
Message-Id: <20190318165803.10375-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190318165803.10375-1-raj.khem@gmail.com>
References: <20190318165803.10375-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gdb: Do not disable lttng-ust on risc-v
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
X-List-Received-Date: Mon, 18 Mar 2019 16:58:14 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 57bc0dc773..a07625bb8d 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -6,7 +6,6 @@ DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
 LTTNGUST = "lttng-ust"
 LTTNGUST_arc = ""
 LTTNGUST_aarch64 = ""
-LTTNGUST_riscv64 = ""
 LTTNGUST_mipsarch = ""
 LTTNGUST_sh4 = ""
 LTTNGUST_libc-musl = ""
-- 
2.21.0


