Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AC58D60111
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jul 2016 18:16:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i123so14434272pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jul 2016 11:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=pyFpl6dd/k/dA7oWiFpOIv4ev2yDwtZM7cr5YFN+goE=;
	b=Pw8AbMgMBQl2aJZa25UJTSRj4Fb2FXgqQvzMuK6AK6fktP1PRTbXS3CP+Tqt8CXMpq
	p3Fz6F3dM0DcaMl5jGJHG98gG5H6iJN+Wox6Pk0f7w76EFrgOA5AF8e9X7D5TNQnKldH
	KVdlu8YGCSlej5SqJCy4mJ3g6pvvszpKhKHR9KquiZownG2jihCEOQqHaZmb71I4ccZP
	C/JgfvVps5gC5toQypzr1shshAQ8qDr9cBGqRv+wsDZStD0OT2w0Hzqye2yoRw/evs8i
	s18ul3Hd7UQ2gS7Mt528tVhmAtwI6qz0K5BMEWrKC+OfSXSUedjumfMCAMr8IG8wFfYJ
	OEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=pyFpl6dd/k/dA7oWiFpOIv4ev2yDwtZM7cr5YFN+goE=;
	b=EHLpN4RNSz7jXDp/f2Oi3n4qCSQdI4QA8/0Z3+R1/kYZnbH6aDV2bsFVsyRfTNQeFK
	dwE6jvFZQ3hlqOk+T2DHSuTFRNvTuZGYXNVm64jlrKg8mJQSfWnl8TkEe7flqNcsiGz0
	UOWN+j3uHUSZQuMYjbhLyi2ILsIXwTx9TChU1ZJbzDTEd95jRh9zwrF2UHOD7zmdNyNk
	pajh3+UtdoeB1sWT88fJnu2GThisht0ZSfg5iGlc0Vi+Fm50FCF4e7t49+4awRfuZ/9D
	UbktWWW2ZVNCkEQ7DD3Zg8iwsb9A1wNJRkAO3CQeyV2s2lJu7pjh3c9qrLcQLR+/z12g
	cBSg==
X-Gm-Message-State: ALyK8tLP7KKgPYwRlMxWpoIJ5F2XFNB/0FEPf5m1mxubK6QSUHyfFI7rsbo/yHpqODeCSw==
X-Received: by 10.98.26.148 with SMTP id a142mr15925757pfa.46.1467569777172;
	Sun, 03 Jul 2016 11:16:17 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 77sm4822770pfp.66.2016.07.03.11.16.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jul 2016 11:16:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun,  3 Jul 2016 11:15:47 -0700
Message-Id: <bb1a8cdb4a5bdc1ed1746244eb734f5efa8ec9c3.1467569369.git.akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
Subject: [PATCH 4/5] qemu: add ppc64 to QEMU_TARGETS
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
X-List-Received-Date: Sun, 03 Jul 2016 18:16:17 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b865223..93d6317 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -12,7 +12,7 @@ BBCLASSEXTEND = "native nativesdk"
 PR = "r1"
 
 # QEMU_TARGETS is overridable variable
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc ppc64 sh4 x86_64"
 
 SRC_URI = "\
     file://powerpc_rom.bin \
-- 
1.9.1


