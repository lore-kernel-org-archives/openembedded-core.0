Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC507829D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:38:38 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y7so16636397pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TI1+CZaqbUzMv/6CFvy/qhoDOMt711t+iRkphLSb1I4=;
	b=e0jFkpymIa9dW4IhHiYG9QhWyOc1wXy7NFH+pVAebN0CpBu5AL4BnBoNgeQ/EFdwpz
	gPf5hyevpRalPM+Q79szavdP0qUCGxqHtuZwWLxHiT7i4KsNNXje/cjdl3O+p+fEGfRE
	MnOhYwCWVqCjwZLCXputWBDHsNZgYgDfcoMhSk2UOudnxuaZJ9syAPAKJ7X+ktDaThNe
	gamoof6wcpvj8ngEEhTC/7PEGd6Ka+YYgq9mJgj5BAhuipHU9EU1OAXwLb0M6igs4UnN
	Cj56fmSe4SNfOhDytWzZfaiGyVV2fXfZzRW7nyBPziZ3RAu6xsFXQB1uA2CHGKJavBlu
	poIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TI1+CZaqbUzMv/6CFvy/qhoDOMt711t+iRkphLSb1I4=;
	b=NLRf4eZ1vJgpMooBQ7gOHb5dFqah7gU9215zG4A9R09uqXZnvij91c0ZQSVdnYVsa4
	uySZjqFUeSv5+yjSJRI8dDxbZBLSxcDpX5Xu66FhsPTQ7bBYwJUhFZPhCeSU6Rjnfuji
	wLkFz0T2GHQjEawmsqwSQgp7aHQF0LPAFKJZEyfi63/OABRybBvqyqOuG3m81CyR6/iv
	88hM0Lqc2opjcobGUgobNRrwcRGs9SHbLxRZobmBAQ197OSgIPxGDfbk6/eTn5zBz0TO
	SEUExFWpjG6rbYRGY8vLAbruaSvrcYLOItjkTjrg7OftlVp+EnQwhxLfJAhpxBBzSN7L
	XsRA==
X-Gm-Message-State: AODbwcBSmaMJaqaqJaD/HFxAdIC0TFxJJtHZeHnElSEhl3jybaHZyGAT
	k1S4pDGoSuBkCG2t
X-Received: by 10.84.195.129 with SMTP id j1mr17636764pld.191.1497278319749;
	Mon, 12 Jun 2017 07:38:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	q68sm444732pfq.144.2017.06.12.07.38.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:38:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:38:25 -0700
Message-Id: <6d6e057913ae0032784777cf18d69553e4c0079d.1497278129.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497278129.git.raj.khem@gmail.com>
References: <cover.1497278129.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] gcc_7.1.bb: disable thumb on armv5t
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
X-List-Received-Date: Mon, 12 Jun 2017 14:38:39 -0000

It results in same link errors like armv4t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc_7.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc_7.1.bb b/meta/recipes-devtools/gcc/gcc_7.1.bb
index 2c618dfb93..ab208e7026 100644
--- a/meta/recipes-devtools/gcc/gcc_7.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_7.1.bb
@@ -1,9 +1,10 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-target.inc
 
-# Building with thumb enabled on armv4t fails with
+# Building with thumb enabled on armv4t armv5t fails with
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
 ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.13.1


